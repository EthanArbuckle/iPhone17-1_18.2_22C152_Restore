@interface SBIconListModel
+ (BOOL)allowsRotatedLayoutByDefault;
+ (BOOL)isListModelNodeIdentifier:(id)a3;
+ (BOOL)supportsRotatedLayout;
+ (id)iconGridCellInfoForIcons:(id)a3 gridSize:(SBHIconGridSize)a4 gridSizeClassSizes:(id)a5 iconLayoutBehavior:(unint64_t)a6 referenceIconOrder:(id)a7 fixedIconLocations:(id)a8 options:(unint64_t)a9;
+ (id)listModelNodeIdentifierForUniqueIdentifier:(id)a3;
+ (id)movedIconsWithOriginalOrder:(id)a3 newOrder:(id)a4;
+ (int64_t)defaultFixedIconLocationBehavior;
+ (void)applyIconLayoutFromGridCellInfo:(id)a3 inGridRange:(SBHIconGridRange)a4 iconOrder:(id)a5 toGridCellInfo:(id)a6 inGridRange:(SBHIconGridRange)a7 iconOrder:(id)a8;
+ (void)layOutIcons:(id)a3 atIndexes:(id)a4 inGridCellInfo:(id)a5 startingAtGridCellIndex:(unint64_t)a6 gridSize:(SBHIconGridSize)a7 gridSizeClassSizes:(id)a8 iconLayoutBehavior:(unint64_t)a9 referenceIconOrder:(id)a10 fixedIconLocations:(id)a11 options:(unint64_t)a12;
- (BOOL)_canClusterIconsUsingSizeClass:(id)a3;
- (BOOL)_moveContainedIconBySwappingVerticallyWithAdjacentIcons:(id)a3 toGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5 gridCellInfoOptions:(unint64_t)a6 mutationOptions:(unint64_t)a7;
- (BOOL)_moveContainedIconLargerThanQuadsIfNecessary:(id)a3 toGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6;
- (BOOL)_moveContainedIconUsingAutomaticClusteringIfNecessary:(id)a3 toGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5 gridCellInfoOptions:(unint64_t)a6 mutationOptions:(unint64_t)a7;
- (BOOL)_moveContainedIconWithinAffectedQuadsIfNecessary:(id)a3 toGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6;
- (BOOL)_validateIconsInArray:(id)a3 matchArray:(id)a4;
- (BOOL)addIcon:(id)a3;
- (BOOL)addIcon:(id)a3 gridCellInfoOptions:(unint64_t)a4 mutationOptions:(unint64_t)a5;
- (BOOL)addIcon:(id)a3 options:(unint64_t)a4;
- (BOOL)allowsAddingIcon:(id)a3;
- (BOOL)allowsAddingIcon:(id)a3 ignoringPlaceholders:(BOOL)a4;
- (BOOL)allowsAddingIconCount:(unint64_t)a3;
- (BOOL)allowsAddingIcons:(id)a3;
- (BOOL)allowsAddingIcons:(id)a3 ignoringPlaceholders:(BOOL)a4;
- (BOOL)allowsFixedIconLocations;
- (BOOL)allowsIndependentRotatedLayout;
- (BOOL)allowsRotatedLayout;
- (BOOL)areAllIconsFixed;
- (BOOL)areIconsInContiguousRegionOfHeterogeneousFixedness:(id)a3 gridCellInfo:(id)a4;
- (BOOL)canBounceIcon:(id)a3;
- (BOOL)canUseFastGridLayoutValidity;
- (BOOL)containsNodeIdentifier:(id)a3;
- (BOOL)containsWidgetIconWithExtensionBundleIdentifier:(id)a3;
- (BOOL)directlyContainsAnyIconInArray:(id)a3;
- (BOOL)directlyContainsIcon:(id)a3;
- (BOOL)directlyContainsIconOfClass:(Class)a3;
- (BOOL)directlyContainsIconPassingTest:(id)a3;
- (BOOL)directlyContainsIconWithIdentifier:(id)a3;
- (BOOL)directlyContainsIcons:(id)a3;
- (BOOL)directlyContainsLeafIconWithIdentifier:(id)a3;
- (BOOL)directlyContainsNonDefaultSizeClassIcon;
- (BOOL)getIconGridRange:(SBHIconGridRange *)a3 forGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5;
- (BOOL)hasAllFixedIconsInContiguousRegion:(id)a3 gridCellInfo:(id)a4;
- (BOOL)hasContiguousRegionOfFixedIconsAtGridCellIndex:(unint64_t)a3 gridCellInfo:(id)a4;
- (BOOL)hasFixedIconInGridRange:(SBHIconGridRange)a3 gridCellInfo:(id)a4;
- (BOOL)hasFixedIconInGridRange:(SBHIconGridRange)a3 gridCellInfoOptions:(unint64_t)a4;
- (BOOL)hasFixedIconLocations;
- (BOOL)hasFixedIconsInContiguousRegion:(id)a3 gridCellInfo:(id)a4;
- (BOOL)hasFixedIconsInGridRange:(SBHIconGridRange)a3 gridCellInfo:(id)a4;
- (BOOL)hasIconsInGridRange:(SBHIconGridRange)a3 gridCellInfo:(id)a4;
- (BOOL)hasNonDefaultSizeClassIcons;
- (BOOL)isAllowedToContainIcon:(id)a3;
- (BOOL)isAllowedToContainIconGridSizeClass:(id)a3;
- (BOOL)isAllowedToContainIcons:(id)a3;
- (BOOL)isContiguousRegionEligibleForBackfill:(id)a3 gridCellInfo:(id)a4;
- (BOOL)isEmpty;
- (BOOL)isEmptyIgnoringPlaceholders;
- (BOOL)isFull;
- (BOOL)isFullIncludingPlaceholders;
- (BOOL)isGridLayoutValid;
- (BOOL)isGridLayoutValid:(id)a3;
- (BOOL)isGridLayoutValidWithOptions:(unint64_t)a3;
- (BOOL)isGridLayoutValidWithOptions:(unint64_t)a3 outOfBoundsIcons:(id *)a4;
- (BOOL)isHidden;
- (BOOL)isHiddenByUser;
- (BOOL)isIcon:(id)a3 fixedAtGridCellIndex:(unint64_t)a4;
- (BOOL)isIcon:(id)a3 fixedAtGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5;
- (BOOL)isIconFixed:(id)a3;
- (BOOL)isIconFixed:(id)a3 gridCellInfoOptions:(unint64_t)a4;
- (BOOL)isIconStateDirty;
- (BOOL)isInsertionFixedForIcon:(id)a3 atGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5 mutationOptions:(unint64_t)a6;
- (BOOL)isInsertionFixedForIcon:(id)a3 atGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6;
- (BOOL)isInsertionFixedForIcon:(id)a3 ofGridSizeClass:(id)a4 atGridCellIndex:(unint64_t)a5 gridCellInfo:(id)a6 mutationOptions:(unint64_t)a7;
- (BOOL)isInsertionFixedForIcon:(id)a3 ofGridSizeClass:(id)a4 atGridCellIndex:(unint64_t)a5 gridCellInfoOptions:(unint64_t)a6 mutationOptions:(unint64_t)a7;
- (BOOL)isInsertionFixedForIcon:(id)a3 options:(unint64_t)a4;
- (BOOL)isInsertionFixedForIconGridSizeClass:(id)a3 atGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5 mutationOptions:(unint64_t)a6;
- (BOOL)isInsertionFixedForIconGridSizeClass:(id)a3 atGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6;
- (BOOL)isInsertionFixedForIconGridSizeClass:(id)a3 options:(unint64_t)a4;
- (BOOL)isInsertionRequiredToBeFixedForIcon:(id)a3 ofGridSizeClass:(id)a4 atGridCellIndex:(unint64_t)a5 gridCellInfo:(id)a6 mutationOptions:(unint64_t)a7;
- (BOOL)isLayoutReversibleWhenRotated;
- (BOOL)isValidGridCellIndex:(unint64_t)a3 gridCellInfo:(id)a4;
- (BOOL)isValidGridCellIndex:(unint64_t)a3 options:(unint64_t)a4;
- (BOOL)isValidGridRange:(SBHIconGridRange)a3 gridCellInfo:(id)a4;
- (BOOL)isValidGridRange:(SBHIconGridRange)a3 options:(unint64_t)a4;
- (BOOL)needsToReflowIconsForRemovingIcon:(id)a3 inContiguousRegion:(id)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6;
- (BOOL)requiresSomeFixedIconLocations;
- (BOOL)shouldReflowIconsInContiguousRegionsWithOptions:(unint64_t)a3;
- (BOOL)wantsRotatedGridForOptions:(unint64_t)a3;
- (NSArray)children;
- (NSArray)icons;
- (NSArray)layoutExcludedIcons;
- (NSDate)hiddenDate;
- (NSSet)focusModeIdentifiers;
- (NSString)description;
- (NSString)layoutDescription;
- (NSString)nodeIdentifier;
- (NSString)rotatedLayoutClusterGridSizeClass;
- (NSString)uniqueIdentifier;
- (SBFolder)folder;
- (SBHIconBadgeBehaviorProviding)badgeBehaviorProvider;
- (SBHIconGridRange)gridRangeForIcon:(id)a3 gridCellInfo:(id)a4;
- (SBHIconGridRange)gridRangeForIcon:(id)a3 gridCellInfoOptions:(unint64_t)a4;
- (SBHIconGridSize)gridSize;
- (SBHIconGridSize)gridSizeForGridSizeClass:(id)a3;
- (SBHIconGridSize)gridSizeForGridSizeClass:(id)a3 gridCellInfo:(id)a4;
- (SBHIconGridSize)gridSizeForGridSizeClass:(id)a3 gridCellInfoOptions:(unint64_t)a4;
- (SBHIconGridSize)gridSizeForIcon:(id)a3;
- (SBHIconGridSize)gridSizeWhenDirectlyContainingNonDefaultSizedIcons;
- (SBHIconGridSize)gridSizeWithOptions:(unint64_t)a3;
- (SBHIconGridSize)initialGridSize;
- (SBHIconGridSize)rotatedGridSizeWithOptions:(unint64_t)a3;
- (SBHIconGridSizeClassDomain)effectiveGridSizeClassDomain;
- (SBHIconGridSizeClassDomain)gridSizeClassDomain;
- (SBHIconGridSizeClassSet)allowedGridSizeClasses;
- (SBHIconGridSizeClassSizeMap)iconGridSizeClassSizes;
- (SBHIconGridSizeClassSizeMap)rotatedIconGridSizeClassSizes;
- (SBIcon)firstIcon;
- (SBIcon)lastIcon;
- (SBIconCoordinate)coordinateForGridCellIndex:(unint64_t)a3 gridCellInfo:(id)a4;
- (SBIconCoordinate)coordinateForGridCellIndex:(unint64_t)a3 gridCellInfoOptions:(unint64_t)a4;
- (SBIconCoordinate)coordinateForIcon:(id)a3 gridCellInfo:(id)a4;
- (SBIconListModel)init;
- (SBIconListModel)initWithFolder:(id)a3 gridSize:(SBHIconGridSize)a4;
- (SBIconListModel)initWithFolder:(id)a3 gridSize:(SBHIconGridSize)a4 gridSizeClassSizes:(id)a5;
- (SBIconListModel)initWithFolder:(id)a3 maxIconCount:(unint64_t)a4;
- (SBIconListModel)initWithIconListModel:(id)a3 copyLeafIcons:(BOOL)a4;
- (SBIconListModel)initWithUniqueIdentifier:(id)a3 folder:(id)a4 gridSize:(SBHIconGridSize)a5;
- (SBIconListModel)initWithUniqueIdentifier:(id)a3 folder:(id)a4 gridSize:(SBHIconGridSize)a5 gridSizeClassSizes:(id)a6;
- (SBIconListModelDelegate)delegate;
- (SBIconListModelRotationReorderingInfo)_rotationReorderingInfoWithClusterSizeClass:(SEL)a3 gridCellInfoOptions:(id)a4;
- (SBTreeNode)parent;
- (_NSRange)rangeOfDirectlyContainedIconsInRange:(_NSRange)a3 passingTest:(id)a4;
- (_SBIconListModelTransaction)activeTransaction;
- (id)_checkAndRemoveBouncedIconsAfterChangeToIcons:(id)a3 ignoringTrailingIconCheck:(BOOL)a4 options:(unint64_t)a5;
- (id)_clusterIconsForSizeClass:(id)a3 behavior:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5;
- (id)_clusterIconsForSizeClass:(id)a3 behavior:(unint64_t)a4 gridCellInfoProvider:(id)a5;
- (id)_iconAtIndex:(unint64_t)a3;
- (id)_otherListForGridCellInfoOptions:(unint64_t)a3;
- (id)_reorderedIconsWithClusterSizeClass:(id)a3 forRotationWithReorderingInfo:(SBIconListModelRotationReorderingInfo *)a4 gridCellInfoOptions:(unint64_t)a5;
- (id)_rotatedIconListModel;
- (id)_rotatedIconListModelIfAllowed;
- (id)_rotatedIconListModelIfApplicable;
- (id)_rotatedIconOrderIfApplicable;
- (id)_rotatedIcons;
- (id)_rotatedIconsFromList:(id)a3 gridCellInfoOptions:(unint64_t)a4;
- (id)_rotatedIconsIfApplicable;
- (id)_targetListForGridCellInfoOptions:(unint64_t)a3;
- (id)_updateModelByRepairingGapsIfNecessary;
- (id)_updateModelByRepairingGapsIfNecessaryAvoidingIcons:(id)a3 gridCellInfoOptions:(unint64_t)a4;
- (id)_updateModelByRepairingGapsIfNecessaryWithGridCellInfoOptions:(unint64_t)a3 mutationOptions:(unint64_t)a4;
- (id)_updateModelByRepairingGapsIfNecessaryWithOptions:(unint64_t)a3;
- (id)activeTransactionCreatingIfNecessary:(BOOL)a3;
- (id)addIcons:(id)a3;
- (id)addIcons:(id)a3 options:(unint64_t)a4;
- (id)adjustContiguousRegionForBackfill:(id)a3 gridCellInfo:(id)a4;
- (id)allowedGapsLayoutDescription;
- (id)allowedIconsForByReplacingContentsWithIcons:(id)a3;
- (id)allowedIconsForIcons:(id)a3;
- (id)allowedIconsForIcons:(id)a3 ignoringPlaceholders:(BOOL)a4;
- (id)changeGridSize:(SBHIconGridSize)a3 options:(unint64_t)a4;
- (id)changeGridSizeClassOfContainedIcon:(id)a3 toGridSizeClass:(id)a4 gridCellInfoOptions:(unint64_t)a5;
- (id)containedNodeIdentifiers;
- (id)contiguousRegionForGridCellIndex:(unint64_t)a3 gridCellInfo:(id)a4;
- (id)contiguousRegionForGridCellIndex:(unint64_t)a3 gridCellInfoOptions:(unint64_t)a4;
- (id)contiguousRegionsForGridRange:(SBHIconGridRange)a3 gridCellInfo:(id)a4;
- (id)coordinatesOfAllIconsWithOptions:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)directlyContainedIconPassingTest:(id)a3;
- (id)directlyContainedIconWithIdentifier:(id)a3;
- (id)directlyContainedIconsPassingTest:(id)a3;
- (id)filterIconsForLayout:(id)a3;
- (id)filteredIncomingFixedIconLocationsIfNecessary:(id)a3;
- (id)fixedIconLocations;
- (id)fixedIconLocationsWithGridCellInfoOptions:(unint64_t)a3;
- (id)fixedIconsInContiguousRegion:(id)a3 gridCellInfo:(id)a4;
- (id)fixedIconsInGridRange:(SBHIconGridRange)a3 gridCellInfo:(id)a4;
- (id)folderLayerWithListLayout:(id)a3 imageAppearance:(id)a4;
- (id)folderLayerWithListLayout:(id)a3 imageAppearance:(id)a4 cellProvider:(id)a5;
- (id)folderLayerWithListLayout:(id)a3 traitCollection:(id)a4;
- (id)gridCellInfoByReflowingIconsInContiguousRegion:(id)a3 forMovingIcon:(id)a4 toGridCellIndex:(unint64_t)a5 referenceIconOrder:(id)a6 internalCellValidDirections:(unint64_t)a7 gridCellInfo:(id)a8 gridCellInfoOptions:(unint64_t)a9;
- (id)gridCellInfoExcludingIcons:(id)a3 options:(unint64_t)a4;
- (id)gridCellInfoForGridSize:(SBHIconGridSize)a3 options:(unint64_t)a4;
- (id)gridCellInfoForIcons:(id)a3 gridSize:(SBHIconGridSize)a4 options:(unint64_t)a5;
- (id)gridCellInfoForIcons:(id)a3 gridSize:(SBHIconGridSize)a4 referenceIconOrder:(id)a5 fixedIconLocations:(id)a6 options:(unint64_t)a7;
- (id)gridCellInfoForIcons:(id)a3 gridSize:(SBHIconGridSize)a4 referenceIconOrder:(id)a5 options:(unint64_t)a6;
- (id)gridCellInfoForIcons:(id)a3 options:(unint64_t)a4;
- (id)gridCellInfoForIcons:(id)a3 referenceIconOrder:(id)a4 options:(unint64_t)a5;
- (id)gridCellInfoWithOptions:(unint64_t)a3;
- (id)gridSizeClassSizesWithGridCellInfo:(id)a3;
- (id)gridSizeClassSizesWithOptions:(unint64_t)a3;
- (id)iconAtCoordinate:(SBIconCoordinate)a3 gridCellInfo:(id)a4;
- (id)iconAtCoordinate:(SBIconCoordinate)a3 gridCellInfoOptions:(unint64_t)a4;
- (id)iconAtGridCellIndex:(unint64_t)a3 gridCellInfo:(id)a4;
- (id)iconAtGridCellIndex:(unint64_t)a3 gridCellInfoOptions:(unint64_t)a4;
- (id)iconGridCellInfoBySimulatingInsertionOfIcons:(id)a3 ignoringPlaceholders:(BOOL)a4 gridCellInfoOptions:(unint64_t)a5 iconOrder:(id *)a6;
- (id)iconGridCellInfoBySimulatingRemovalOfIcons:(id)a3 ignoringPlaceholders:(BOOL)a4 gridCellInfoOptions:(unint64_t)a5 iconOrder:(id *)a6;
- (id)iconWithIdentifier:(id)a3;
- (id)iconsAtGridCellIndexes:(id)a3 gridCellInfo:(id)a4;
- (id)iconsAtIndexes:(id)a3;
- (id)iconsByReplacingIconsNearNaturalGapWithPlaceholder:(id)a3 referenceIconOrder:(id *)a4 gridCellInfo:(id)a5;
- (id)iconsForGridRange:(SBHIconGridRange)a3 gridCellInfo:(id)a4;
- (id)iconsForGridRange:(SBHIconGridRange)a3 gridCellInfoOptions:(unint64_t)a4;
- (id)iconsForLayoutWithGridCellInfoOptions:(unint64_t)a3;
- (id)iconsInContiguousRegion:(id)a3 gridCellInfo:(id)a4;
- (id)iconsInContiguousRegion:(id)a3 gridCellInfoOptions:(unint64_t)a4;
- (id)iconsInContiguousRegion:(id)a3 startingAtGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5;
- (id)iconsInGridColumn:(unint64_t)a3 gridCellInfo:(id)a4;
- (id)iconsInGridColumnRange:(_NSRange)a3 gridCellInfo:(id)a4;
- (id)iconsInGridRow:(unint64_t)a3 gridCellInfo:(id)a4;
- (id)iconsInRange:(_NSRange)a3;
- (id)iconsOfClass:(Class)a3;
- (id)iconsThatAreAllowedToBeContainedInIcons:(id)a3;
- (id)iconsWithGridCellInfoOptions:(unint64_t)a3;
- (id)indexPathsForContainedNodeIdentifier:(id)a3 prefixPath:(id)a4;
- (id)indexesForIconsPassingTest:(id)a3;
- (id)indexesOfDirectlyContainedIconsPassingTest:(id)a3;
- (id)insertIcon:(id)a3 afterIcon:(id)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6;
- (id)insertIcon:(id)a3 atCoordinate:(SBIconCoordinate)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6;
- (id)insertIcon:(id)a3 atGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6;
- (id)insertIcon:(id)a3 atIndex:(unint64_t)a4;
- (id)insertIcon:(id)a3 atIndex:(unint64_t)a4 options:(unint64_t)a5;
- (id)insertIcon:(id)a3 beforeIcon:(id)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6;
- (id)insertIcon:(id)a3 relativeToIcon:(id)a4 positionDelta:(int64_t)a5 gridCellInfoOptions:(unint64_t)a6 mutationOptions:(unint64_t)a7;
- (id)insertIconWhilePreservingQuads:(id)a3 toGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6;
- (id)insertIcons:(id)a3 atGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6;
- (id)insertIcons:(id)a3 atIndex:(unint64_t)a4 options:(unint64_t)a5;
- (id)largestClusteringSizeClassWithOptions:(unint64_t)a3;
- (id)lastDirectlyContainedLeafIconWithApplicationBundleIdentifier:(id)a3;
- (id)layerWithIconImageInfo:(SBIconImageInfo *)a3 cellSpacing:(CGSize)a4 imageAppearance:(id)a5 cellProvider:(id)a6;
- (id)layoutDescriptionWithOptions:(unint64_t)a3;
- (id)moveContainedIcon:(id)a3 toGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6;
- (id)movedIconsFromGridCellInfo:(id)a3 withIconOrder:(id)a4 toGridCellInfo:(id)a5;
- (id)nodeDescriptionWithPrefix:(id)a3;
- (id)nodesAlongIndexPath:(id)a3 consumedIndexes:(unint64_t)a4;
- (id)prependIcon:(id)a3 options:(unint64_t)a4;
- (id)relocateFixedIconsInGridRange:(SBHIconGridRange)a3 gridCellInfoOptions:(unint64_t)a4;
- (id)repairModelByEliminatingGapsInIcons:(id)a3 avoidingIcons:(id)a4 gridCellInfoOptions:(unint64_t)a5;
- (id)replaceIcon:(id)a3 withIcon:(id)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6;
- (id)replaceIcon:(id)a3 withIcon:(id)a4 options:(unint64_t)a5;
- (id)replaceIcon:(id)a3 withIcons:(id)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6;
- (id)replaceIcon:(id)a3 withIcons:(id)a4 options:(unint64_t)a5;
- (id)replaceIconAtGridCellIndex:(unint64_t)a3 withIcon:(id)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6;
- (id)replaceIconAtIndex:(unint64_t)a3 withIcon:(id)a4 options:(unint64_t)a5;
- (id)reversedOrderLayoutDescription;
- (id)rotatedFixedIconLocations;
- (id)rotatedLayoutDescription;
- (id)setIcons:(id)a3 gridCellInfoOptions:(unint64_t)a4;
- (id)setIcons:(id)a3 gridCellInfoOptions:(unint64_t)a4 mutationOptions:(unint64_t)a5;
- (id)setIconsFromIconListModel:(id)a3;
- (id)startCoalescingContentChangesForReason:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)_moveIcon:(id)a3 byClusteringForSizeClass:(id)a4 toGridCellIndex:(unint64_t)a5 gridCellInfoOptions:(unint64_t)a6;
- (int64_t)fixedIconLocationBehavior;
- (unint64_t)_iconIndexForMovingIcon:(id)a3 toGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5;
- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 aboveIconAtGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5;
- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 aboveIconAtGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5;
- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 afterIconAtGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5;
- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 afterIconAtGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5;
- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 atGridCellIndex:(unint64_t)a4;
- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 atGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5;
- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 atGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5;
- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 belowIconAtGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5;
- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 belowIconAtGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5;
- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 gridCellInfo:(id)a4;
- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 gridCellInfoOptions:(unint64_t)a4;
- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 maintainingPositionAfterIcon:(id)a4 ignoringPlaceholders:(BOOL)a5 gridCellInfoOptions:(unint64_t)a6 mutationOptions:(unint64_t)a7;
- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 maintainingPositionBeforeIcon:(id)a4 ignoringPlaceholders:(BOOL)a5 gridCellInfoOptions:(unint64_t)a6 mutationOptions:(unint64_t)a7;
- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 maintainingPositionRelativeToIcon:(id)a4 before:(BOOL)a5 ignoringPlaceholders:(BOOL)a6 gridCellInfoOptions:(unint64_t)a7 mutationOptions:(unint64_t)a8;
- (unint64_t)bestGridCellIndexForInsertingIconOfGridSizeClass:(id)a3 atGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5;
- (unint64_t)bestGridCellIndexForMovingIcons:(id)a3 toGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6;
- (unint64_t)bestIconIndexForReplacingIcon:(id)a3 withIcon:(id)a4 gridCellInfo:(id)a5;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)countOfDirectlyContainedIconsPassingTest:(id)a3;
- (unint64_t)countOfNonDefaultSizeClassIcons;
- (unint64_t)firstFreeGridCellIndexOfRangeOfSize:(SBHIconGridSize)a3 gridCellInfo:(id)a4;
- (unint64_t)firstFreeGridCellIndexOfRangeOfSize:(SBHIconGridSize)a3 gridCellInfoOptions:(unint64_t)a4;
- (unint64_t)firstFreeGridCellIndexOfRangeOfSizeClass:(id)a3 gridCellInfoOptions:(unint64_t)a4;
- (unint64_t)firstFreeGridCellIndexWithOptions:(unint64_t)a3;
- (unint64_t)firstFreeSlotIndex;
- (unint64_t)firstGridCellIndexOfNaturalGapInRange:(_NSRange)a3 gridCellInfo:(id)a4;
- (unint64_t)firstGridCellIndexOfRangeOfGridSizeClass:(id)a3 withoutFixedIconsNearContiguousRegion:(id)a4 gridCellInfo:(id)a5;
- (unint64_t)firstGridCellIndexOfRangeOfGridSizeClass:(id)a3 withoutFixedIconsNearContiguousRegion:(id)a4 gridCellInfoOptions:(unint64_t)a5;
- (unint64_t)firstGridCellIndexOfRangeOfGridSizeClass:(id)a3 withoutFixedIconsNearGridRange:(SBHIconGridRange)a4 gridCellInfo:(id)a5;
- (unint64_t)firstGridCellIndexOfRangeOfGridSizeClass:(id)a3 withoutFixedIconsNearGridRange:(SBHIconGridRange)a4 gridCellInfoOptions:(unint64_t)a5;
- (unint64_t)firstGridCellIndexOfRangeOfGridSizeClass:(id)a3 withoutIconsNearGridRange:(SBHIconGridRange)a4 gridCellInfo:(id)a5;
- (unint64_t)firstGridCellIndexOfRangeOfGridSizeClass:(id)a3 withoutIconsNearGridRange:(SBHIconGridRange)a4 gridCellInfo:(id)a5 passingTest:(id)a6;
- (unint64_t)fixedLocationForIcon:(id)a3;
- (unint64_t)gridCellIndexAboveIconAtIndex:(unint64_t)a3 gridCellInfo:(id)a4;
- (unint64_t)gridCellIndexAboveIconAtIndex:(unint64_t)a3 options:(unint64_t)a4;
- (unint64_t)gridCellIndexBelowIconAtIndex:(unint64_t)a3 gridCellInfo:(id)a4;
- (unint64_t)gridCellIndexBelowIconAtIndex:(unint64_t)a3 options:(unint64_t)a4;
- (unint64_t)gridCellIndexForCoordinate:(SBIconCoordinate)a3 gridCellInfo:(id)a4;
- (unint64_t)gridCellIndexForCoordinate:(SBIconCoordinate)a3 gridCellInfoOptions:(unint64_t)a4;
- (unint64_t)gridCellIndexForIcon:(id)a3 gridCellInfo:(id)a4;
- (unint64_t)gridCellIndexForIcon:(id)a3 gridCellInfoOptions:(unint64_t)a4;
- (unint64_t)gridCellIndexForIconIndex:(unint64_t)a3 gridCellInfo:(id)a4;
- (unint64_t)gridCellIndexForIconIndex:(unint64_t)a3 gridCellInfoOptions:(unint64_t)a4;
- (unint64_t)gridCellIndexForIconWithIdentifier:(id)a3 gridCellInfo:(id)a4;
- (unint64_t)gridCellIndexForInsertingIcon:(id)a3 relativeToIcon:(id)a4 positionDelta:(int64_t)a5 gridCellInfoOptions:(unint64_t)a6 mutationOptions:(unint64_t)a7;
- (unint64_t)iconLayoutBehavior;
- (unint64_t)indexForIcon:(id)a3;
- (unint64_t)indexForIconWithIdentifier:(id)a3;
- (unint64_t)indexForInsertingIcon:(id)a3 relativeToIcon:(id)a4 positionDelta:(int64_t)a5;
- (unint64_t)indexOfDirectlyContainedIconPassingTest:(id)a3;
- (unint64_t)layoutInvalidations;
- (unint64_t)maxNumberOfIcons;
- (unint64_t)numberOfFreeSlots;
- (unint64_t)numberOfIcons;
- (unint64_t)numberOfNonPlaceholderIcons;
- (unint64_t)numberOfUsedColumns;
- (unint64_t)numberOfUsedGridCells;
- (unint64_t)numberOfUsedRows;
- (unint64_t)numberOfUsedSlots;
- (unint64_t)overflowSlotCount;
- (unint64_t)removeIconFromOtherPositionsInHierarchy:(id)a3 forInsertingAtIndex:(unint64_t)a4 removeIfAlreadyContained:(BOOL)a5 gridCellInfoOptions:(unint64_t)a6 mutationOptions:(unint64_t)a7;
- (unint64_t)rotatedGridCellInfoOptions:(unint64_t)a3;
- (unint64_t)willAddIcon:(id)a3 atIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6;
- (unint64_t)willReplaceIcon:(id)a3 withIcon:(id)a4 atIndex:(unint64_t)a5 gridCellInfoOptions:(unint64_t)a6 mutationOptions:(unint64_t)a7;
- (unsigned)gridSizeAreaForGridSizeClass:(id)a3;
- (unsigned)gridSizeAreaForGridSizeClass:(id)a3 gridCellInfoOptions:(unint64_t)a4;
- (void)_changeFolderDuringCopy:(id)a3;
- (void)_coalesceChangesWithRequestID:(id)a3 changeBlock:(id)a4;
- (void)_configureRotatedIconsListModel:(id)a3;
- (void)_ensureRotatedIcons;
- (void)_invalidateLayoutWithGridCellInfoOptions:(unint64_t)a3 mutationOptions:(unint64_t)a4;
- (void)_makeRotatedIconsListModelWithIcons:(id)a3 options:(unint64_t)a4;
- (void)_moveAllNonDefaultSizedIconsToBeginning;
- (void)_moveContainedIconUsingSimpleMovement:(id)a3 toGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5 gridCellInfoOptions:(unint64_t)a6 mutationOptions:(unint64_t)a7;
- (void)_moveDefaultSizedIconsOfCountIntoContiguousLeadingNonDefaultSizedIcons:(unint64_t)a3;
- (void)_notifyListObserver:(id)a3 didAddIcons:(id)a4 didRemoveIcons:(id)a5 movedIcons:(id)a6 didReplaceIcon:(id)a7 withIcon:(id)a8;
- (void)_notifyListObservers:(id)a3;
- (void)_notifyListObserversDidAddIcon:(id)a3;
- (void)_notifyListObserversDidAddIcons:(id)a3 didRemoveIcons:(id)a4 movedIcons:(id)a5;
- (void)_notifyListObserversDidAddIcons:(id)a3 didRemoveIcons:(id)a4 movedIcons:(id)a5 didReplaceIcon:(id)a6 withIcon:(id)a7 options:(unint64_t)a8;
- (void)_notifyListObserversDidMoveIcon:(id)a3 options:(unint64_t)a4;
- (void)_notifyListObserversDidRemoveIcon:(id)a3;
- (void)_notifyListObserversDidReplaceIcon:(id)a3 withIcon:(id)a4;
- (void)_notifyListObserversDirectlyContainsNonDefaultSizeClassIconDidChange;
- (void)_notifyListObserversWillAddIcon:(id)a3;
- (void)_notifyListObserversWillRemoveIcon:(id)a3;
- (void)_reorderIconsAfterUnclusteringWithClusterSizeClass:(id)a3 forRotationWithReorderingInfo:(SBIconListModelRotationReorderingInfo *)a4 gridCellInfoOptions:(unint64_t)a5;
- (void)_reorderIconsWithClusterSizeClass:(id)a3 forRotationWithReorderingInfo:(SBIconListModelRotationReorderingInfo *)a4 gridCellInfoOptions:(unint64_t)a5;
- (void)_setRotatedIcons:(id)a3;
- (void)_setRotatedIcons:(id)a3 clearRotatedFixedIconLocations:(BOOL)a4;
- (void)_unclusterIcons:(id)a3 ofSizeClass:(id)a4 baseGridCellInfoOptions:(unint64_t)a5 gridCellInfoProvider:(id)a6;
- (void)_unclusterIcons:(id)a3 ofSizeClass:(id)a4 gridCellInfoOptions:(unint64_t)a5;
- (void)_updateRotatedIconsUsingBlock:(id)a3;
- (void)_updateRotatedIconsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)addIconsOfClass:(Class)a3 toSet:(id)a4;
- (void)addIconsPassingTest:(id)a3 toSet:(id)a4;
- (void)addListObserver:(id)a3;
- (void)addNodeObserver:(id)a3;
- (void)ancestryDidChange;
- (void)clearParentNodeForIconIfNecessary:(id)a3;
- (void)didAddIcon:(id)a3 options:(unint64_t)a4;
- (void)didRemoveIcon:(id)a3 options:(unint64_t)a4;
- (void)didReplaceIcon:(id)a3 withIcon:(id)a4 options:(unint64_t)a5;
- (void)enumerateFixedIconsUsingBlock:(id)a3;
- (void)enumerateFolderIconsUsingBlock:(id)a3;
- (void)enumerateIconsUsingBlock:(id)a3;
- (void)enumerateIconsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateNodeObserversUsingBlock:(id)a3;
- (void)finishChangingFromGridSize:(SBHIconGridSize)a3 withOldIconCoordinates:(id)a4 bouncedIcons:(id)a5 options:(unint64_t)a6;
- (void)iconList:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5;
- (void)iconList:(id)a3 willAddIcon:(id)a4;
- (void)iconList:(id)a3 willRemoveIcon:(id)a4;
- (void)layOutIcons:(id)a3 atIndexes:(id)a4 inGridCellInfo:(id)a5 startingAtGridCellIndex:(unint64_t)a6 gridSize:(SBHIconGridSize)a7 fixedIconLocations:(id)a8 options:(unint64_t)a9;
- (void)layOutIcons:(id)a3 inGridCellInfo:(id)a4 startingAtGridCellIndex:(unint64_t)a5 gridSize:(SBHIconGridSize)a6 fixedIconLocations:(id)a7 options:(unint64_t)a8;
- (void)layOutIcons:(id)a3 inGridCellInfo:(id)a4 startingAtGridCellIndex:(unint64_t)a5 gridSize:(SBHIconGridSize)a6 referenceIconOrder:(id)a7 fixedIconLocations:(id)a8 options:(unint64_t)a9;
- (void)layOutIconsPrioritizedByGridArea:(id)a3 inGridCellInfo:(id)a4 gridSize:(SBHIconGridSize)a5 referenceIconOrder:(id)a6 referenceGridCellInfo:(id)a7 fixedIconLocations:(id)a8 options:(unint64_t)a9;
- (void)list:(id)a3 didAddContainedNodeIdentifiers:(id)a4;
- (void)list:(id)a3 didRemoveContainedNodeIdentifiers:(id)a4;
- (void)listDidMoveNodes:(id)a3;
- (void)markIconStateClean;
- (void)markIconStateDirty;
- (void)markIconStateDirtyWithOptions:(unint64_t)a3;
- (void)moveContainedIcon:(id)a3 aboveIcon:(id)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6;
- (void)moveContainedIcon:(id)a3 afterIcon:(id)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6;
- (void)moveContainedIcon:(id)a3 beforeIcon:(id)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6;
- (void)moveContainedIcon:(id)a3 belowIcon:(id)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6;
- (void)moveContainedIcon:(id)a3 toIndex:(unint64_t)a4 options:(unint64_t)a5;
- (void)performByExcludingIconsFromLayout:(id)a3 usingBlock:(id)a4;
- (void)performChangesByClusteringForSizeClass:(id)a3 behavior:(unint64_t)a4 withGridCellInfoOptions:(unint64_t)a5 block:(id)a6;
- (void)performChangesByPreservingOrderOfDefaultSizedIcons:(id)a3;
- (void)performChangesByPreservingPositionsOfIconsLargerThanSizeClass:(id)a3 block:(id)a4;
- (void)reflowIconsForResizingIcon:(id)a3 atGridCellIndex:(unint64_t)a4 toGridSizeClass:(id)a5 gridCellInfoOptions:(unint64_t)a6;
- (void)reflowIconsForwardForInsertingIcon:(id)a3 atGridCellIndex:(unint64_t)a4 replacingIcon:(id)a5 gridCellInfoOptions:(unint64_t)a6;
- (void)relocateAnyAffectedFixedIconsForInsertingIcon:(id)a3 atGridCellIndex:(unint64_t)a4 replacingIcon:(id)a5 gridCellInfoOptions:(unint64_t)a6;
- (void)relocateAnyAffectedFixedIconsForMovingIcon:(id)a3 fromGridCellIndex:(unint64_t)a4 toGridCellIndex:(unint64_t)a5 intoContiguousRegions:(id)a6 gridCellInfoOptions:(unint64_t)a7 mutationOptions:(unint64_t)a8;
- (void)relocateAnyAffectedFixedIconsWithoutContiguousRegionReflowingForMovingIcon:(id)a3 fromGridCellIndex:(unint64_t)a4 toGridCellIndex:(unint64_t)a5 intoContiguousRegions:(id)a6 gridCellInfoOptions:(unint64_t)a7 mutationOptions:(unint64_t)a8;
- (void)removeAllFixedIconLocations;
- (void)removeAllIcons;
- (void)removeAllIconsPassingTest:(id)a3;
- (void)removeAnyIconsWithDisallowedGridSizeClasses;
- (void)removeFixedIconLocationForIcon:(id)a3;
- (void)removeFixedIconLocationsForIcons:(id)a3;
- (void)removeFixedIconLocationsForIconsInGridRange:(SBHIconGridRange)a3 gridCellInfo:(id)a4;
- (void)removeFixedIconLocationsForIconsInGridRange:(SBHIconGridRange)a3 gridCellInfoOptions:(unint64_t)a4;
- (void)removeFixedIconLocationsIfPossibleForIconsInContiguousRegion:(id)a3 gridCellInfo:(id)a4;
- (void)removeFixedIconLocationsIfPossibleForIconsInContiguousRegionForGridCellIndex:(unint64_t)a3 sortByLayoutOrder:(BOOL)a4 gridCellInfo:(id)a5;
- (void)removeFixedIconLocationsIfPossibleForIconsInContiguousRegionForGridCellIndex:(unint64_t)a3 sortByLayoutOrder:(BOOL)a4 gridCellInfoOptions:(unint64_t)a5;
- (void)removeFixedIconLocationsIfPossibleWithGridCellInfo:(id)a3;
- (void)removeFixedIconLocationsIfPossibleWithGridCellInfoOptions:(unint64_t)a3;
- (void)removeIcon:(id)a3;
- (void)removeIcon:(id)a3 gridCellInfoOptions:(unint64_t)a4 mutationOptions:(unint64_t)a5;
- (void)removeIcon:(id)a3 options:(unint64_t)a4;
- (void)removeIconAtIndex:(unint64_t)a3;
- (void)removeIconAtIndex:(unint64_t)a3 options:(unint64_t)a4;
- (void)removeIconFromOtherPositionsInHierarchy:(id)a3;
- (void)removeIcons:(id)a3;
- (void)removeIcons:(id)a3 gridCellInfoOptions:(unint64_t)a4 mutationOptions:(unint64_t)a5;
- (void)removeIcons:(id)a3 options:(unint64_t)a4;
- (void)removeIconsAtIndexes:(id)a3 options:(unint64_t)a4;
- (void)removeLastIcon;
- (void)removeListObserver:(id)a3;
- (void)removeNodeObserver:(id)a3;
- (void)removeTransactionAssertion:(id)a3;
- (void)reorderFixedIconsForMovingIcon:(id)a3 withinContiguousRegion:(id)a4 toGridCellIndex:(unint64_t)a5 gridCellInfoOptions:(unint64_t)a6 mutationOptions:(unint64_t)a7;
- (void)reorderFixedIconsInContiguousRegion:(id)a3 forMovingIcon:(id)a4 fromGridCellIndex:(unint64_t)a5 toGridCellIndex:(unint64_t)a6 gridCellInfoOptions:(unint64_t)a7 mutationOptions:(unint64_t)a8;
- (void)saveCurrentIconLocationsAsFixed;
- (void)saveOnlyRequiredIconLocationsAsFixed;
- (void)saveOnlyRequiredIconLocationsAsFixedIfRequired;
- (void)setActiveTransaction:(id)a3;
- (void)setAllowedGridSizeClasses:(id)a3;
- (void)setAllowsIndependentRotatedLayout:(BOOL)a3;
- (void)setAllowsRotatedLayout:(BOOL)a3;
- (void)setBadgeBehaviorProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFixedIconLocationBehavior:(int64_t)a3;
- (void)setFixedIconLocations:(id)a3;
- (void)setFixedIconLocations:(id)a3 options:(unint64_t)a4;
- (void)setFixedLocation:(unint64_t)a3 forIcon:(id)a4;
- (void)setFixedLocation:(unint64_t)a3 forIcon:(id)a4 options:(unint64_t)a5;
- (void)setFocusModeIdentifiers:(id)a3;
- (void)setGridSize:(SBHIconGridSize)a3;
- (void)setGridSizeClassDomain:(id)a3;
- (void)setGridSizeWhenDirectlyContainingNonDefaultSizedIcons:(SBHIconGridSize)a3;
- (void)setHasNonDefaultSizeClassIcons:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHidden:(BOOL)a3 byUser:(BOOL)a4 hiddenDate:(id)a5;
- (void)setHiddenDate:(id)a3;
- (void)setIconLayoutBehavior:(unint64_t)a3;
- (void)setIconOrderFromGridCellInfo:(id)a3;
- (void)setIconOrderFromGridCellInfo:(id)a3 referenceIconOrder:(id)a4;
- (void)setIcons:(id)a3;
- (void)setLayoutExcludedIcons:(id)a3;
- (void)setOverflowSlotCount:(unint64_t)a3;
- (void)setParent:(id)a3;
- (void)setRotatedFixedIconLocations:(id)a3;
- (void)setRotatedFixedIconLocations:(id)a3 options:(unint64_t)a4;
- (void)setRotatedIconGridSizeClassSizes:(id)a3;
- (void)setRotatedLayoutClusterGridSizeClass:(id)a3;
- (void)setRotatedLayoutIndependent:(BOOL)a3;
- (void)shiftFixedIconsBackwardsInContiguousRegion:(id)a3 toFillHoleLeftByRemovingIcon:(id)a4 fromGridCellIndex:(unint64_t)a5 gridCellInfoOptions:(unint64_t)a6 mutationOptions:(unint64_t)a7;
- (void)shiftFixedIconsInContiguousRegion:(id)a3 forInsertingIcon:(id)a4 orRemovingIcon:(id)a5 orResizingIcon:(id)a6 orMovingIcon:(id)a7 atGridCellIndex:(unint64_t)a8 replacingIcon:(id)a9 resizingToGridSizeClass:(id)a10 gridCellInfoOptions:(unint64_t)a11 mutationOptions:(unint64_t)a12;
- (void)sortByIconGridSizeAreaWithGridCellInfoOptions:(unint64_t)a3;
- (void)sortByLayoutOrderWithGridCellInfo:(id)a3;
- (void)sortByLayoutOrderWithGridCellInfoOptions:(unint64_t)a3;
- (void)sortUsingComparator:(id)a3;
- (void)sortUsingSelector:(SEL)a3;
- (void)swapContainedIcon:(id)a3 withContainedIcon:(id)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6;
- (void)swapFixedIconLocationForReplacedIcon:(id)a3 withReplacementIcon:(id)a4;
- (void)transferPositionsFromGridCellInfo:(id)a3 representingGridRange:(SBHIconGridRange)a4 asFixedLocationsForIcons:(id)a5 gridCellInfoOptions:(unint64_t)a6;
- (void)transferPositionsFromGridCellInfo:(id)a3 representingGridRange:(SBHIconGridRange)a4 asLocationsForIcons:(id)a5 gridCellInfoOptions:(unint64_t)a6 mutationOptions:(unint64_t)a7;
- (void)updateForFocusModeActivated:(BOOL)a3 wantsListVisible:(BOOL)a4;
- (void)updateGridSizeClassDomainForIconIfNecessary:(id)a3;
- (void)updateGridSizeForAddedIcon:(id)a3 removedIcon:(id)a4;
- (void)updateGridSizeForInsertionOfFirstNonDefaultSizedIconIfNecessary;
- (void)updateGridSizeForRemovalOfLastNonDefaultSizedIconIfNecessary;
- (void)updateHasNonDefaultSizeClassIcons;
- (void)updateParentNodeForIconIfNecessary:(id)a3;
- (void)willRemoveIcon:(id)a3 options:(unint64_t)a4;
@end

@implementation SBIconListModel

- (BOOL)isHidden
{
  return self->_hidden;
}

uint64_t __46__SBIconListModel_numberOfNonPlaceholderIcons__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isPlaceholder];
  if (result) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return result;
}

uint64_t __55__SBIconListModel_iconsAtGridCellIndexes_gridCellInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) iconIndexForGridCellIndex:a2];
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = result;
    v5 = *(void **)(a1 + 40);
    return [v5 addIndex:v4];
  }
  return result;
}

- (id)gridSizeClassSizesWithOptions:(unint64_t)a3
{
  if (![(SBIconListModel *)self wantsRotatedGridForOptions:a3]
    || ([(SBIconListModel *)self rotatedIconGridSizeClassSizes],
        (uint64_t v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v4 = [(SBIconListModel *)self iconGridSizeClassSizes];
  }
  return v4;
}

- (BOOL)wantsRotatedGridForOptions:(unint64_t)a3
{
  return (a3 >> 1) & 1;
}

- (SBHIconGridSizeClassSizeMap)iconGridSizeClassSizes
{
  return self->_gridSizeClassSizes;
}

- (unint64_t)indexForIcon:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = self->_icons;
  uint64_t v6 = [(SBIconIndexMutableList *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v8 + v7;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(v4, "isEqual:", *(void *)(*((void *)&v14 + 1) + 8 * v10), (void)v14))
        {
          unint64_t v12 = v8 + v10;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [(SBIconIndexMutableList *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v8 = v11;
      if (v7) {
        continue;
      }
      break;
    }
  }
  unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v12;
}

- (NSArray)icons
{
  return (NSArray *)[(SBIconIndexMutableList *)self->_icons nodes];
}

- (id)_iconAtIndex:(unint64_t)a3
{
  if ([(SBIconIndexMutableList *)self->_icons count] <= a3)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(SBIconIndexMutableList *)self->_icons nodeAtIndex:a3];
  }
  return v5;
}

- (unint64_t)numberOfIcons
{
  return [(SBIconIndexMutableList *)self->_icons count];
}

+ (void)layOutIcons:(id)a3 atIndexes:(id)a4 inGridCellInfo:(id)a5 startingAtGridCellIndex:(unint64_t)a6 gridSize:(SBHIconGridSize)a7 gridSizeClassSizes:(id)a8 iconLayoutBehavior:(unint64_t)a9 referenceIconOrder:(id)a10 fixedIconLocations:(id)a11 options:(unint64_t)a12
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v91 = a8;
  v20 = v17;
  id v21 = a10;
  v22 = v21;
  id v82 = a11;
  uint64_t v92 = [v17 count];
  if (v92)
  {
    char v23 = a12;
    unint64_t rows = a7.rows;
    if ((a12 & 0x10) != 0)
    {
      unint64_t v78 = 0;
      unint64_t v79 = a7.rows - 1;
    }
    else
    {
      unint64_t v79 = a6 / a7.columns;
      unint64_t v78 = a6 % a7.columns;
    }
    unint64_t columns = a7.columns;
    v96 = v19;
    id v80 = v21;
    id v81 = v18;
    SBHIconGridSize v74 = a7;
    if (!v82 || (uint64_t v24 = [v18 firstIndex], v24 == 0x7FFFFFFFFFFFFFFFLL))
    {
      v25 = 0;
LABEL_41:
      v45 = v18;
      uint64_t v46 = [v18 firstIndex];
      unint64_t v47 = rows;
      if (v46 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_42;
      }
      uint64_t v48 = v46;
      v70 = v98;
      uint64_t v71 = v23 & 0xC;
      unint64_t v77 = v79;
      v84 = v20;
      v75 = v25;
LABEL_45:
      if (v23) {
        uint64_t v49 = v92 + ~v48;
      }
      else {
        uint64_t v49 = v48;
      }
      uint64_t v50 = v49;
      v51 = [v20 objectAtIndex:v70];
      v94 = v51;
      if ([v25 containsIndex:v48]) {
        goto LABEL_97;
      }
      uint64_t v86 = [v51 gridSizeClass];
      unsigned int v85 = objc_msgSend(v91, "gridSizeForGridSizeClass:");
      if (v22 == v20)
      {
        unint64_t v53 = columns;
        uint64_t v52 = v50;
      }
      else
      {
        uint64_t v52 = [v22 indexOfObjectIdenticalTo:v51];
        unint64_t v53 = columns;
      }
      if (v52 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v54 = SBLogCommon();
        BOOL v55 = os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG);

        if (v55) {
          NSLog(&cfstr_MissingIconInR.isa);
        }
        goto LABEL_95;
      }
      uint64_t v76 = v52;
      if (v77 >= v47)
      {
LABEL_81:
        char v23 = a12;
        if ((a12 & 8) != 0)
        {
          v20 = v84;
          v22 = v80;
          v45 = v81;
          v66 = v96;
          v25 = v75;
        }
        else
        {
          uint64_t v101 = 0;
          v102 = &v101;
          uint64_t v103 = 0x2020000000;
          uint64_t v104 = 0x7FFFFFFFFFFFFFFFLL;
          v98[0] = __173__SBIconListModel_layOutIcons_atIndexes_inGridCellInfo_startingAtGridCellIndex_gridSize_gridSizeClassSizes_iconLayoutBehavior_referenceIconOrder_fixedIconLocations_options___block_invoke;
          v98[1] = &unk_1E6AB21C0;
          SBHIconGridSize v99 = v74;
          unsigned int v100 = v85;
          v98[2] = &v101;
          v98[3] = a9;
          unint64_t v72 = v72 & 0xFFFFFFFF00000000 | *(unsigned int *)&v74;
          unint64_t v73 = v73 & 0xFFFFFFFF00000000 | v85;
          objc_msgSend(v96, "enumerateEmptyGridCellRangesOfSize:inGridRange:flipped:usingBlock:");
          v20 = v84;
          v45 = v81;
          v25 = v75;
          uint64_t v65 = v102[3];
          if (v65 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v96, "setIconIndex:inGridRange:", v76, v65, v85);
            v22 = v80;
            [v96 setGridCellIndex:v102[3] forIconIndex:v76];
            _Block_object_dispose(&v101, 8);
            goto LABEL_95;
          }
          _Block_object_dispose(&v101, 8);
          v22 = v80;
          v66 = v96;
        }
        [v66 markIconIndexAsOutOfBounds:v76];
        goto LABEL_95;
      }
      int v56 = HIWORD(v85) - 1;
      if ((a12 & 0x10) != 0) {
        uint64_t v57 = v56;
      }
      else {
        uint64_t v57 = 0;
      }
      uint64_t v89 = v57;
      uint64_t v58 = v56 * v74.columns;
      if ((a12 & 0x10) == 0) {
        uint64_t v58 = 0;
      }
      unint64_t v59 = v77;
      uint64_t v60 = v53 * v77 - v58;
      while (1)
      {
        if (v59 - v89 + ((unint64_t)v85 >> 16) <= v47 && a9 & 1 | (v85 < 0x20000) | (((v59 - v89) & 1) == 0))
        {
          unint64_t v61 = v59 == v79 ? v78 : 0;
          if (v61 < v53) {
            break;
          }
        }
LABEL_80:
        ++v59;
        v60 += v53;
        unint64_t v47 = rows;
        if (v59 == rows) {
          goto LABEL_81;
        }
      }
      char v62 = 0;
      while (1)
      {
        unint64_t v63 = (unsigned __int16)v85 + v61;
        if ((v85 & 0xFFFE) != 0 && v63 <= v53)
        {
          if ((a9 & 2) == 0 && v61 && (unsigned __int16)v85 - columns + v61 && v61 % (unsigned __int16)v85) {
            goto LABEL_79;
          }
        }
        else if (v63 > v53)
        {
          goto LABEL_79;
        }
        uint64_t v64 = objc_msgSend(v96, "indexOfFirstUsedGridCellInGridRange:", v60 + v61, v85);
        unint64_t v53 = columns;
        if (v64 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v96, "setIconIndex:inGridRange:");
          [v96 setGridCellIndex:v60 + v61 forIconIndex:v76];
          if ([v51 isPlaceholder]) {
            [v96 setDebuggingIconType:2 forIconIndex:v76];
          }
          v22 = v80;
          v25 = v75;
          if ((unsigned __int16)v85 + v61 - 1 >= columns - 1)
          {
            v20 = v84;
            v45 = v81;
            v68 = (void *)v86;
            if (v71)
            {
              unint64_t v69 = v59 + 1;
              goto LABEL_102;
            }
            if ((v62 & 1) == 0)
            {
              unint64_t v69 = v77;
              if (v59 == v79) {
                unint64_t v69 = v77 + 1;
              }
LABEL_102:
              unint64_t v77 = v69;
            }
            char v23 = a12;
            unint64_t v47 = rows;
            goto LABEL_96;
          }
          unint64_t v67 = v77;
          if (v71) {
            unint64_t v67 = v59;
          }
          unint64_t v77 = v67;
          v20 = v84;
          v45 = v81;
          char v23 = a12;
          unint64_t v47 = rows;
LABEL_95:
          v68 = (void *)v86;
LABEL_96:

LABEL_97:
          uint64_t v48 = [v45 indexGreaterThanIndex:v48];
          if (v48 == 0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_42:

            id v19 = v96;
            id v18 = v45;
            goto LABEL_43;
          }
          goto LABEL_45;
        }
LABEL_79:
        ++v61;
        char v62 = 1;
        if (v61 == columns) {
          goto LABEL_80;
        }
      }
    }
    uint64_t v26 = v24;
    v25 = 0;
    uint64_t v87 = a7;
    v83 = v20;
    while (1)
    {
      id v27 = v18;
      uint64_t v28 = (v23 & 1) != 0 ? v92 + ~v26 : v26;
      v29 = [v20 objectAtIndex:v28];
      v30 = [v29 gridSizeClass];
      unsigned int v31 = [v91 gridSizeForGridSizeClass:v30];
      if (v22 == v20)
      {
        id v32 = v25;
      }
      else
      {
        id v32 = v25;
        uint64_t v28 = [v22 indexOfObjectIdenticalTo:v29];
      }
      v33 = [v29 uniqueIdentifier];
      v34 = [v82 objectForKey:v33];
      v35 = v34;
      if (v34) {
        break;
      }
      id v18 = v27;
LABEL_40:

      uint64_t v26 = [v18 indexGreaterThanIndex:v26];
      char v23 = a12;
      v25 = v32;
      v20 = v83;
      if (v26 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_41;
      }
    }
    v93 = v30;
    unint64_t v36 = [v34 unsignedIntegerValue];
    unint64_t v97 = v97 & 0xFFFFFFFF00000000 | v87;
    unint64_t v37 = SBIconCoordinateMakeWithGridCellIndex(v36, v87);
    uint64_t v88 = v38;
    if (objc_msgSend(v96, "indexOfFirstUsedGridCellInGridRange:", v36, v31) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v22 = v80;
      id v18 = v81;
LABEL_39:
      v30 = v93;
      goto LABEL_40;
    }
    unint64_t v39 = v37 - 1;
    unint64_t v40 = v37 - 1 + (unsigned __int16)v31;
    if ((v31 & 0xFFFE) == 0 || v40 > columns)
    {
      v42 = v81;
      if (v40 <= columns) {
        goto LABEL_30;
      }
    }
    else
    {
      v42 = v81;
      if ((a9 & 2) != 0 || !v39 || columns - (unsigned __int16)v31 == v39 || !(v39 % (unsigned __int16)v31))
      {
LABEL_30:
        if (v88 - 1 + ((unint64_t)v31 >> 16) <= rows && a9 & 1 | (v31 < 0x20000) | (((v88 - 1) & 1) == 0))
        {
          objc_msgSend(v96, "setIconIndex:inGridRange:", v28, v36, v31);
          [v96 setGridCellIndex:v36 forIconIndex:v28];
          if ([v29 isPlaceholder]) {
            uint64_t v43 = 3;
          }
          else {
            uint64_t v43 = 1;
          }
          [v96 setDebuggingIconType:v43 forIconIndex:v28];
          id v44 = v32;
          if (!v32) {
            id v44 = objc_alloc_init(MEMORY[0x1E4F28E60]);
          }
          id v32 = v44;
          [v44 addIndex:v26];
        }
      }
    }
    v22 = v80;
    id v18 = v42;
    goto LABEL_39;
  }
LABEL_43:
}

- (id)iconsAtGridCellIndexes:(id)a3 gridCellInfo:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (objc_class *)MEMORY[0x1E4F28E60];
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  long long v16 = __55__SBIconListModel_iconsAtGridCellIndexes_gridCellInfo___block_invoke;
  id v17 = &unk_1E6AB0BF8;
  id v18 = v6;
  id v19 = v9;
  id v10 = v9;
  id v11 = v6;
  [v8 enumerateIndexesUsingBlock:&v14];

  unint64_t v12 = -[SBIconListModel iconsAtIndexes:](self, "iconsAtIndexes:", v10, v14, v15, v16, v17);

  return v12;
}

- (id)iconsAtIndexes:(id)a3
{
  return [(SBIconIndexMutableList *)self->_icons nodesAtIndexes:a3];
}

- (BOOL)directlyContainsIcon:(id)a3
{
  return [(SBIconIndexMutableList *)self->_icons directlyContainsNode:a3];
}

- (id)indexPathsForContainedNodeIdentifier:(id)a3 prefixPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBIconListModel *)self nodeIdentifier];
  int v9 = [v8 isEqual:v6];

  if (v9) {
    [MEMORY[0x1E4F1CA80] setWithObject:v7];
  }
  else {
  id v10 = [(SBIconIndexMutableList *)self->_icons indexPathsForContainedNodeIdentifier:v6 prefixPath:v7];
  }

  return v10;
}

- (BOOL)containsNodeIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(SBIconListModel *)self nodeIdentifier];
  char v6 = [v5 isEqual:v4];

  BOOL v7 = (v6 & 1) != 0 || [(SBIconIndexMutableList *)self->_icons containsNodeIdentifier:v4];
  return v7;
}

- (NSString)nodeIdentifier
{
  return self->_nodeIdentifier;
}

- (id)gridCellInfoForGridSize:(SBHIconGridSize)a3 options:(unint64_t)a4
{
  BOOL v7 = [(SBIconListModel *)self icons];
  id v8 = [(SBIconListModel *)self iconsForLayoutWithGridCellInfoOptions:a4];
  int v9 = [(SBIconListModel *)self fixedIconLocationsWithGridCellInfoOptions:a4];
  id v10 = [(SBIconListModel *)self gridSizeClassSizesWithOptions:a4];
  id v11 = objc_msgSend((id)objc_opt_class(), "iconGridCellInfoForIcons:gridSize:gridSizeClassSizes:iconLayoutBehavior:referenceIconOrder:fixedIconLocations:options:", v8, *(unsigned int *)&a3, v10, -[SBIconListModel iconLayoutBehavior](self, "iconLayoutBehavior"), v7, v9, a4);

  return v11;
}

- (id)iconsForLayoutWithGridCellInfoOptions:(unint64_t)a3
{
  id v4 = [(SBIconListModel *)self iconsWithGridCellInfoOptions:a3];
  v5 = [(SBIconListModel *)self filterIconsForLayout:v4];

  return v5;
}

- (id)iconsWithGridCellInfoOptions:(unint64_t)a3
{
  v3 = [(SBIconListModel *)self _targetListForGridCellInfoOptions:a3];
  id v4 = [v3 icons];

  return v4;
}

- (unint64_t)iconLayoutBehavior
{
  return self->_iconLayoutBehavior;
}

- (id)fixedIconLocationsWithGridCellInfoOptions:(unint64_t)a3
{
  v3 = [(SBIconListModel *)self _targetListForGridCellInfoOptions:a3];
  id v4 = [v3 fixedIconLocations];

  return v4;
}

- (id)_targetListForGridCellInfoOptions:(unint64_t)a3
{
  if ([(SBIconListModel *)self wantsRotatedGridForOptions:a3])
  {
    id v4 = [(SBIconListModel *)self _rotatedIconListModel];
  }
  else
  {
    id v4 = self;
  }
  return v4;
}

- (id)fixedIconLocations
{
  v2 = (void *)[(NSMutableDictionary *)self->_fixedIconLocations copy];
  return v2;
}

- (id)filterIconsForLayout:(id)a3
{
  id v4 = a3;
  v5 = [(SBIconListModel *)self layoutExcludedIcons];
  if (v5)
  {
    char v6 = (void *)[v4 mutableCopy];
    [v6 removeObjectsInArray:v5];

    id v4 = v6;
  }

  return v4;
}

- (NSArray)layoutExcludedIcons
{
  return self->_layoutExcludedIcons;
}

+ (id)iconGridCellInfoForIcons:(id)a3 gridSize:(SBHIconGridSize)a4 gridSizeClassSizes:(id)a5 iconLayoutBehavior:(unint64_t)a6 referenceIconOrder:(id)a7 fixedIconLocations:(id)a8 options:(unint64_t)a9
{
  id v15 = a8;
  id v16 = a7;
  id v17 = a5;
  id v18 = a3;
  id v19 = [[SBIconListGridCellInfo alloc] initWithGridSize:*(unsigned int *)&a4];
  uint64_t v20 = [v18 count];
  id v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, v20);
  [a1 layOutIcons:v18 atIndexes:v21 inGridCellInfo:v19 startingAtGridCellIndex:0 gridSize:*(unsigned int *)&a4 gridSizeClassSizes:v17 iconLayoutBehavior:a6 referenceIconOrder:v16 fixedIconLocations:v15 options:a9];

  return v19;
}

- (id)folderLayerWithListLayout:(id)a3 imageAppearance:(id)a4 cellProvider:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = SBHIconListLayoutFolderIconGridCellSize(v10);
  double v13 = v12;
  [v10 iconImageInfo];
  double v15 = v14;
  double v16 = SBHIconListLayoutFolderIconGridCellSpacing(v10);
  double v18 = v17;

  id v19 = -[SBIconListModel layerWithIconImageInfo:cellSpacing:imageAppearance:cellProvider:](self, "layerWithIconImageInfo:cellSpacing:imageAppearance:cellProvider:", v9, v8, v11, v13, v15, 0.0, v16, v18);

  return v19;
}

- (BOOL)isEmptyIgnoringPlaceholders
{
  return [(SBIconListModel *)self numberOfNonPlaceholderIcons] == 0;
}

- (unint64_t)numberOfNonPlaceholderIcons
{
  unint64_t v3 = [(SBIconListModel *)self numberOfIcons];
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  icons = self->_icons;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__SBIconListModel_numberOfNonPlaceholderIcons__block_invoke;
  v7[3] = &unk_1E6AB1730;
  v7[4] = &v8;
  [(SBIconIndexMutableList *)icons enumerateNodesUsingBlock:v7];
  unint64_t v5 = v3 - v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)enumerateIconsUsingBlock:(id)a3
{
}

- (unint64_t)overflowSlotCount
{
  return self->_overflowSlotCount;
}

- (void)addIconsOfClass:(Class)a3 toSet:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v7 = self->_icons;
  uint64_t v8 = [(SBIconIndexMutableList *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
        double v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v6, "addObject:", v12, (void)v14);
        }
        if (objc_msgSend(v12, "isFolderIcon", (void)v14))
        {
          double v13 = [v12 folder];
          [v13 addIconsOfClass:a3 toSet:v6];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(SBIconIndexMutableList *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (id)layerWithIconImageInfo:(SBIconImageInfo *)a3 cellSpacing:(CGSize)a4 imageAppearance:(id)a5 cellProvider:(id)a6
{
  double v11 = v9;
  double v12 = v8;
  double v13 = v7;
  double v14 = v6;
  double height = a4.height;
  double width = a4.width;
  double v18 = a3;
  uint64_t v19 = (void (**)(id, void *, void *, uint64_t, double, double, double, double))a5;
  SBHIconGridSize v20 = (SBHIconGridSize)[(SBIconListModel *)self gridSize];
  int v21 = HIWORD(*(unsigned int *)&v20);
  double v37 = v12;
  if (v20.columns) {
    double v22 = v12 * (double)(v20.columns - 1);
  }
  else {
    double v22 = 0.0;
  }
  v41 = self;
  unint64_t v23 = [(SBIconListModel *)self numberOfIcons];
  uint64_t v24 = objc_alloc_init(SBHIconGridLayer);
  v25 = v24;
  double v26 = v11;
  double v27 = v11 * (double)(v21 - 1);
  if (*(unsigned int *)&v20 < 0x10000) {
    double v27 = 0.0;
  }
  -[SBHIconGridLayer setBounds:](v24, "setBounds:", 0.0, 0.0, v22 + (double)v20.columns * width, v27 + (double)v21 * height);
  [(SBHIconGridLayer *)v25 setGridSize:*(unsigned int *)&v20];
  [(SBHIconGridLayer *)v25 setCellCount:v23];
  uint64_t v28 = v18;
  [(SBHIconGridLayer *)v25 setImageAppearance:v18];
  if (*(unsigned int *)&v20 >= 0x10000)
  {
    int v39 = 0;
    unint64_t v40 = 0;
    double v29 = width + v37;
    if (v21 <= 1) {
      int v30 = 1;
    }
    else {
      int v30 = HIWORD(*(unsigned int *)&v20);
    }
    int v38 = v30;
    do
    {
      if (v20.columns)
      {
        unsigned __int16 v31 = 0;
        unint64_t v32 = v40;
        do
        {
          if (v23 <= v32) {
            break;
          }
          v33 = [(SBIconListModel *)v41 iconAtIndex:v32];
          v34 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_traitCollectionWithIconImageAppearance:", v28);
          if (v19) {
            v19[2](v19, v33, v34, 1, width, height, v14, v13);
          }
          else {
          v35 = objc_msgSend(v33, "iconLayerWithInfo:traitCollection:options:", v34, 1, width, height, v14, v13);
          }
          if (v35)
          {
            [v33 applyTreatmentsToLayer:v35];
            objc_msgSend(v35, "setBounds:", 0.0, 0.0, width, height);
            [(SBHIconGridLayer *)v25 addSublayer:v35];
            objc_msgSend(v35, "setPosition:", width * 0.5 + (double)v31 * v29, height * 0.5 + (double)(unsigned __int16)v39 * (height + v26));
            [(SBHIconGridLayer *)v25 setLayer:v35 forIcon:v33];
          }

          ++v31;
          ++v32;
        }
        while (v31 < v20.columns);
      }
      v40 += v20.columns;
      ++v39;
    }
    while (v39 != v38);
  }

  return v25;
}

- (SBHIconGridSize)gridSize
{
  return self->_gridSize;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(SBIconIndexMutableList *)self->_icons countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (BOOL)directlyContainsNonDefaultSizeClassIcon
{
  return [(SBIconListModel *)self countOfNonDefaultSizeClassIcons] != 0;
}

- (unint64_t)countOfNonDefaultSizeClassIcons
{
  uint64_t v5 = 0;
  double v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__SBIconListModel_countOfNonDefaultSizeClassIcons__block_invoke;
  v4[3] = &unk_1E6AB1730;
  v4[4] = &v5;
  [(SBIconListModel *)self enumerateIconsUsingBlock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)addListObserver:(id)a3
{
  id v4 = a3;
  listObservers = self->_listObservers;
  id v8 = v4;
  if (!listObservers)
  {
    double v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v7 = self->_listObservers;
    self->_listObservers = v6;

    id v4 = v8;
    listObservers = self->_listObservers;
  }
  [(NSHashTable *)listObservers addObject:v4];
}

- (SBIconListModel)initWithFolder:(id)a3 maxIconCount:(unint64_t)a4
{
  unsigned __int16 v4 = a4;
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(SBHIconGridSizeClassSizeMap);
  id v8 = [(SBIconListModel *)self initWithUniqueIdentifier:0 folder:v6 gridSize:v4 | 0x10000 gridSizeClassSizes:v7];

  return v8;
}

- (SBIconListModel)initWithFolder:(id)a3 gridSize:(SBHIconGridSize)a4 gridSizeClassSizes:(id)a5
{
  return [(SBIconListModel *)self initWithUniqueIdentifier:0 folder:a3 gridSize:*(unsigned int *)&a4 gridSizeClassSizes:a5];
}

- (SBIconListModel)initWithFolder:(id)a3 gridSize:(SBHIconGridSize)a4
{
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(SBHIconGridSizeClassSizeMap);
  id v8 = [(SBIconListModel *)self initWithUniqueIdentifier:0 folder:v6 gridSize:*(unsigned int *)&a4 gridSizeClassSizes:v7];

  return v8;
}

- (SBIconListModel)initWithUniqueIdentifier:(id)a3 folder:(id)a4 gridSize:(SBHIconGridSize)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = objc_alloc_init(SBHIconGridSizeClassSizeMap);
  double v11 = [(SBIconListModel *)self initWithUniqueIdentifier:v9 folder:v8 gridSize:*(unsigned int *)&a5 gridSizeClassSizes:v10];

  return v11;
}

- (SBIconListModel)initWithUniqueIdentifier:(id)a3 folder:(id)a4 gridSize:(SBHIconGridSize)a5 gridSizeClassSizes:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v28.receiver = self;
  v28.super_class = (Class)SBIconListModel;
  double v13 = [(SBIconListModel *)&v28 init];
  double v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_folder, v11);
    long long v15 = objc_alloc_init(SBIconIndexMutableList);
    icons = v14->_icons;
    v14->_icons = v15;

    v14->_gridSize = a5;
    v14->_initialGridSize = a5;
    uint64_t v17 = [v12 copy];
    gridSizeClassSizes = v14->_gridSizeClassSizes;
    v14->_gridSizeClassSizes = (SBHIconGridSizeClassSizeMap *)v17;

    uint64_t v19 = +[SBHIconGridSizeClassSet gridSizeClassSetForAllGridSizeClasses];
    allowedGridSizeClasses = v14->_allowedGridSizeClasses;
    v14->_allowedGridSizeClasses = (SBHIconGridSizeClassSet *)v19;

    v14->_allowsRotatedLayout = [(id)objc_opt_class() allowsRotatedLayoutByDefault];
    objc_storeStrong((id *)&v14->_rotatedLayoutClusterGridSizeClass, @"SBHIconGridSizeClassDefault");
    v14->_fixedIconLocationBehavior = [(id)objc_opt_class() defaultFixedIconLocationBehavior];
    [(SBIconIndexMutableList *)v14->_icons setObserver:v14];
    if (v10)
    {
      uint64_t v21 = [v10 copy];
      uniqueIdentifier = v14->_uniqueIdentifier;
      v14->_uniqueIdentifier = (NSString *)v21;
    }
    else
    {
      uniqueIdentifier = (NSString *)objc_alloc_init(MEMORY[0x1E4F29128]);
      uint64_t v23 = [(NSString *)uniqueIdentifier UUIDString];
      uint64_t v24 = v14->_uniqueIdentifier;
      v14->_uniqueIdentifier = (NSString *)v23;
    }
    uint64_t v25 = [(id)objc_opt_class() listModelNodeIdentifierForUniqueIdentifier:v14->_uniqueIdentifier];
    nodeIdentifier = v14->_nodeIdentifier;
    v14->_nodeIdentifier = (NSString *)v25;

    v14->_allowsIndependentRotatedLayout = 1;
  }

  return v14;
}

- (SBIconListModel)init
{
  return [(SBIconListModel *)self initWithFolder:0 maxIconCount:0];
}

- (SBIconListModel)initWithIconListModel:(id)a3 copyLeafIcons:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v6 = (id *)a3;
  v87.receiver = self;
  v87.super_class = (Class)SBIconListModel;
  uint64_t v7 = [(SBIconListModel *)&v87 init];
  if (v7)
  {
    id v8 = [v6 folder];
    objc_storeWeak((id *)&v7->_folder, v8);

    v7->_gridSize = (SBHIconGridSize)[v6 gridSize];
    v7->_initialGridSize = (SBHIconGridSize)[v6 initialGridSize];
    v7->_gridSizeWhenDirectlyContainingNonDefaultSizedIcons = (SBHIconGridSize)[v6 gridSizeWhenDirectlyContainingNonDefaultSizedIcons];
    id v9 = [v6 iconGridSizeClassSizes];
    uint64_t v10 = [v9 copy];
    gridSizeClassSizes = v7->_gridSizeClassSizes;
    v7->_gridSizeClassSizes = (SBHIconGridSizeClassSizeMap *)v10;

    id v12 = [v6 rotatedIconGridSizeClassSizes];
    uint64_t v13 = [v12 copy];
    rotatedIconGridSizeClassSizes = v7->_rotatedIconGridSizeClassSizes;
    v7->_rotatedIconGridSizeClassSizes = (SBHIconGridSizeClassSizeMap *)v13;

    long long v15 = [v6 allowedGridSizeClasses];
    uint64_t v16 = [v15 copy];
    allowedGridSizeClasses = v7->_allowedGridSizeClasses;
    v7->_allowedGridSizeClasses = (SBHIconGridSizeClassSet *)v16;

    v7->_allowsRotatedLayout = [v6 allowsRotatedLayout];
    uint64_t v18 = [v6 rotatedLayoutClusterGridSizeClass];
    rotatedLayoutClusterGridSizeClass = v7->_rotatedLayoutClusterGridSizeClass;
    v7->_rotatedLayoutClusterGridSizeClass = (NSString *)v18;

    v7->_iconLayoutBehavior = [v6 iconLayoutBehavior];
    SBHIconGridSize v20 = [v6 uniqueIdentifier];
    uint64_t v21 = [v20 copy];
    uniqueIdentifier = v7->_uniqueIdentifier;
    v7->_uniqueIdentifier = (NSString *)v21;

    uint64_t v23 = [v6 nodeIdentifier];
    nodeIdentifier = v7->_nodeIdentifier;
    v7->_nodeIdentifier = (NSString *)v23;

    v7->_hidden = [v6 isHidden];
    uint64_t v25 = [v6 hiddenDate];
    uint64_t v26 = [v25 copy];
    hiddenDate = v7->_hiddenDate;
    v7->_hiddenDate = (NSDate *)v26;

    v7->_fixedIconLocationBehavior = [v6 fixedIconLocationBehavior];
    uint64_t v28 = [v6[9] mutableCopy];
    fixedIconLocations = v7->_fixedIconLocations;
    v7->_fixedIconLocations = (NSMutableDictionary *)v28;

    v7->_hasNonDefaultSizeClassIcons = *((unsigned char *)v6 + 83);
    int v30 = [v6 badgeBehaviorProvider];
    objc_storeWeak((id *)&v7->_badgeBehaviorProvider, v30);

    uint64_t v31 = [v6 gridSizeClassDomain];
    gridSizeClassDomain = v7->_gridSizeClassDomain;
    v7->_gridSizeClassDomain = (SBHIconGridSizeClassDomain *)v31;

    v7->_allowsIndependentRotatedLayout = [v6 allowsIndependentRotatedLayout];
    v7->_overflowSlotCount = [v6 overflowSlotCount];
    v33 = [(SBIconListModel *)v7 parentNodeForChildren];
    if (v4)
    {
      v34 = [[SBIconIndexMutableList alloc] initWithList:v6[1] copyNodes:1];
      icons = v7->_icons;
      v7->_icons = v34;

      uint64_t v36 = [(SBIconIndexMutableList *)v7->_icons count];
      if (v36)
      {
        uint64_t v37 = v36;
        for (uint64_t i = 0; i != v37; ++i)
        {
          int v39 = [(SBIconIndexMutableList *)v7->_icons nodeAtIndex:i];
          if ([v39 isFolderIcon])
          {
            unint64_t v40 = [v39 folder];
            v41 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFolder:v40 copyLeafIcons:1];
            v42 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFolder:v41];
            [(SBIconIndexMutableList *)v7->_icons replaceNodeAtIndex:i withNode:v42];
            SBTreeNodeSetParent(v41, (uint64_t)v33);
          }
        }
      }
    }
    else
    {
      uint64_t v43 = self;
      int v44 = [v6 directlyContainsIconOfClass:v43];

      if (v44)
      {
        v45 = objc_alloc_init(SBIconIndexMutableList);
        uint64_t v46 = v7->_icons;
        v7->_icons = v45;

        long long v85 = 0u;
        long long v86 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        unint64_t v47 = (SBIconIndexMutableList *)v6[1];
        uint64_t v48 = [(SBIconIndexMutableList *)v47 countByEnumeratingWithState:&v83 objects:v90 count:16];
        if (v48)
        {
          uint64_t v49 = v48;
          uint64_t v50 = *(void *)v84;
          do
          {
            for (uint64_t j = 0; j != v49; ++j)
            {
              if (*(void *)v84 != v50) {
                objc_enumerationMutation(v47);
              }
              uint64_t v52 = *(void **)(*((void *)&v83 + 1) + 8 * j);
              if ([v52 isFolderIcon])
              {
                unint64_t v53 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFolderIcon:v52 copyFolder:1];
                [(SBIconIndexMutableList *)v7->_icons addNode:v53];
                v54 = [v53 folder];
                SBTreeNodeSetParent(v54, (uint64_t)v33);
              }
              else
              {
                [(SBIconIndexMutableList *)v7->_icons addNode:v52];
              }
            }
            uint64_t v49 = [(SBIconIndexMutableList *)v47 countByEnumeratingWithState:&v83 objects:v90 count:16];
          }
          while (v49);
        }
      }
      else
      {
        uint64_t v55 = [v6[1] copy];
        unint64_t v47 = v7->_icons;
        v7->_icons = (SBIconIndexMutableList *)v55;
      }
    }
    [(SBIconIndexMutableList *)v7->_icons setObserver:v7];
    int v56 = [v6 _rotatedIconOrderIfApplicable];
    if (v56)
    {
      uint64_t v57 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v56, "count"));
      unint64_t v58 = [(SBIconIndexMutableList *)v7->_icons count];
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      SBHIconGridSize v74 = v56;
      id v59 = v56;
      uint64_t v60 = [v59 countByEnumeratingWithState:&v79 objects:v89 count:16];
      if (v60)
      {
        uint64_t v61 = v60;
        uint64_t v62 = *(void *)v80;
        do
        {
          for (uint64_t k = 0; k != v61; ++k)
          {
            if (*(void *)v80 != v62) {
              objc_enumerationMutation(v59);
            }
            unint64_t v64 = [*(id *)(*((void *)&v79 + 1) + 8 * k) unsignedIntegerValue];
            if (v64 < v58)
            {
              uint64_t v65 = [(SBIconIndexMutableList *)v7->_icons nodeAtIndex:v64];
              [v57 addObject:v65];
            }
          }
          uint64_t v61 = [v59 countByEnumeratingWithState:&v79 objects:v89 count:16];
        }
        while (v61);
      }

      if ([v57 count] != v58)
      {
        long long v77 = 0u;
        long long v78 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        v66 = v7->_icons;
        uint64_t v67 = [(SBIconIndexMutableList *)v66 countByEnumeratingWithState:&v75 objects:v88 count:16];
        if (v67)
        {
          uint64_t v68 = v67;
          uint64_t v69 = *(void *)v76;
          do
          {
            for (uint64_t m = 0; m != v68; ++m)
            {
              if (*(void *)v76 != v69) {
                objc_enumerationMutation(v66);
              }
              uint64_t v71 = *(void *)(*((void *)&v75 + 1) + 8 * m);
              if (([v57 containsObject:v71] & 1) == 0) {
                [v57 addObject:v71];
              }
            }
            uint64_t v68 = [(SBIconIndexMutableList *)v66 countByEnumeratingWithState:&v75 objects:v88 count:16];
          }
          while (v68);
        }
      }
      [(SBIconListModel *)v7 _makeRotatedIconsListModelWithIcons:v57 options:0x20000000];
      unint64_t v72 = [v6 rotatedFixedIconLocations];
      [(SBIconListModel *)v7 setRotatedFixedIconLocations:v72 options:0x20000000];

      int v56 = v74;
    }
    [(SBIconListModel *)v7 markIconStateClean];
  }
  return v7;
}

- (void)setGridSize:(SBHIconGridSize)a3
{
  if (!SBHIconGridSizeEqualToIconGridSize(*(_DWORD *)&a3, *(_DWORD *)&self->_gridSize))
  {
    self->_gridSize = a3;
    [(SBIconListModel *)self->_rotatedIcons setGridSize:SBHIconGridSizeRotate(*(_DWORD *)&a3)];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __31__SBIconListModel_setGridSize___block_invoke;
    v6[3] = &unk_1E6AB1708;
    v6[4] = self;
    [(SBIconListModel *)self _notifyListObservers:v6];
  }
}

void __31__SBIconListModel_setGridSize___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 iconListGridSizeDidChange:*(void *)(a1 + 32)];
  }
}

- (void)setGridSizeWhenDirectlyContainingNonDefaultSizedIcons:(SBHIconGridSize)a3
{
  uint64_t v5 = a3;
  if (!SBHIconGridSizeEqualToIconGridSize(*(_DWORD *)&a3, *(_DWORD *)&self->_gridSizeWhenDirectlyContainingNonDefaultSizedIcons))
  {
    self->_gridSizeWhenDirectlyContainingNonDefaultSizedIcons = a3;
    if (![(SBIconListModel *)self directlyContainsNonDefaultSizeClassIcon]
      || SBHIconGridSizeIsEmpty(v5))
    {
      uint64_t v5 = [(SBIconListModel *)self initialGridSize];
    }
    [(SBIconListModel *)self setGridSize:v5];
  }
}

- (void)updateGridSizeForAddedIcon:(id)a3 removedIcon:(id)a4
{
  id v6 = a4;
  id v9 = [a3 gridSizeClass];
  uint64_t v7 = [v6 gridSizeClass];

  unint64_t v8 = [(SBIconListModel *)self countOfNonDefaultSizeClassIcons];
  if (v8 == 1 && v7)
  {
    if (([v7 isEqualToString:@"SBHIconGridSizeClassDefault"] & 1) == 0
      && (!v9 || [v9 isEqualToString:@"SBHIconGridSizeClassDefault"]))
    {
      [(SBIconListModel *)self updateGridSizeForRemovalOfLastNonDefaultSizedIconIfNecessary];
    }
  }
  else if (!v8 && v9 && ([v9 isEqualToString:@"SBHIconGridSizeClassDefault"] & 1) == 0)
  {
    [(SBIconListModel *)self updateGridSizeForInsertionOfFirstNonDefaultSizedIconIfNecessary];
  }
}

void __50__SBIconListModel_countOfNonDefaultSizeClassIcons__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 gridSizeClass];
  if (v3)
  {
    BOOL v4 = (void *)v3;
    uint64_t v5 = [v7 gridSizeClass];
    char v6 = [v5 isEqualToString:@"SBHIconGridSizeClassDefault"];

    if ((v6 & 1) == 0) {
      ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    }
  }
}

- (void)updateHasNonDefaultSizeClassIcons
{
  BOOL v3 = [(SBIconListModel *)self directlyContainsIconPassingTest:&__block_literal_global_49];
  [(SBIconListModel *)self setHasNonDefaultSizeClassIcons:v3];
}

uint64_t __52__SBIconListModel_updateHasNonDefaultSizeClassIcons__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 gridSizeClass];
  if (v3)
  {
    BOOL v4 = [v2 gridSizeClass];
    uint64_t v5 = [v4 isEqualToString:@"SBHIconGridSizeClassDefault"] ^ 1;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)setHasNonDefaultSizeClassIcons:(BOOL)a3
{
  if (self->_hasNonDefaultSizeClassIcons != a3)
  {
    self->_hasNonDefaultSizeClassIcons = a3;
    if (a3) {
      [(SBIconListModel *)self updateGridSizeForInsertionOfFirstNonDefaultSizedIconIfNecessary];
    }
    else {
      [(SBIconListModel *)self updateGridSizeForRemovalOfLastNonDefaultSizedIconIfNecessary];
    }
    [(SBIconListModel *)self _notifyListObserversDirectlyContainsNonDefaultSizeClassIconDidChange];
  }
}

- (void)updateGridSizeForInsertionOfFirstNonDefaultSizedIconIfNecessary
{
  SBHIconGridSize v3 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeWhenDirectlyContainingNonDefaultSizedIcons];
  uint64_t v4 = v3;
  if (!SBHIconGridSizeIsEmpty(*(_DWORD *)&v3)) {
    id v5 = [(SBIconListModel *)self changeGridSize:v4 options:0x1000000];
  }
}

- (void)updateGridSizeForRemovalOfLastNonDefaultSizedIconIfNecessary
{
  if (!SBHIconGridSizeIsEmpty([(SBIconListModel *)self gridSizeWhenDirectlyContainingNonDefaultSizedIcons]))id v3 = [(SBIconListModel *)self changeGridSize:[(SBIconListModel *)self initialGridSize] options:0x1000000]; {
}
  }

- (SBHIconGridSize)gridSizeForGridSizeClass:(id)a3
{
  return (SBHIconGridSize)[(SBIconListModel *)self gridSizeForGridSizeClass:a3 gridCellInfoOptions:0];
}

- (unsigned)gridSizeAreaForGridSizeClass:(id)a3
{
  return [(SBIconListModel *)self gridSizeAreaForGridSizeClass:a3 gridCellInfoOptions:0];
}

- (SBHIconGridSize)gridSizeForGridSizeClass:(id)a3 gridCellInfoOptions:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(SBIconListModel *)self gridSizeClassSizesWithOptions:a4];
  LODWORD(self) = [v7 gridSizeForGridSizeClass:v6];

  return (SBHIconGridSize)self;
}

- (unsigned)gridSizeAreaForGridSizeClass:(id)a3 gridCellInfoOptions:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(SBIconListModel *)self gridSizeClassSizesWithOptions:a4];
  LODWORD(self) = [v7 gridSizeAreaForGridSizeClass:v6];

  return self;
}

- (SBHIconGridSize)gridSizeForGridSizeClass:(id)a3 gridCellInfo:(id)a4
{
  id v6 = a3;
  id v7 = [(SBIconListModel *)self gridSizeClassSizesWithGridCellInfo:a4];
  LODWORD(self) = [v7 gridSizeForGridSizeClass:v6];

  return (SBHIconGridSize)self;
}

- (SBHIconGridSize)gridSizeForIcon:(id)a3
{
  uint64_t v4 = [a3 gridSizeClass];
  LODWORD(self) = [(SBIconListModel *)self gridSizeForGridSizeClass:v4];

  return (SBHIconGridSize)self;
}

- (id)gridSizeClassSizesWithGridCellInfo:(id)a3
{
  if (SBHIconGridSizeEqualToIconGridSize([a3 gridSize], -[SBIconListModel gridSizeWithOptions:](self, "gridSizeWithOptions:", 2)))
  {
    uint64_t v4 = 2;
  }
  else
  {
    uint64_t v4 = 0;
  }
  return [(SBIconListModel *)self gridSizeClassSizesWithOptions:v4];
}

- (unint64_t)numberOfUsedSlots
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = self->_icons;
  uint64_t v4 = [(SBIconIndexMutableList *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "gridSizeClass", (void)v11);
        v6 += [(SBIconListModel *)self gridSizeAreaForGridSizeClass:v9];
      }
      uint64_t v5 = [(SBIconIndexMutableList *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)numberOfFreeSlots
{
  unint64_t v3 = [(SBIconListModel *)self maxNumberOfIcons];
  return v3 - [(SBIconListModel *)self numberOfUsedSlots];
}

- (unint64_t)maxNumberOfIcons
{
  return SBHIconGridSizeGetArea(*(_DWORD *)&self->_gridSize);
}

- (void)setIcons:(id)a3
{
  id v3 = [(SBIconListModel *)self setIcons:a3 gridCellInfoOptions:0];
}

- (id)setIcons:(id)a3 gridCellInfoOptions:(unint64_t)a4
{
  return [(SBIconListModel *)self setIcons:a3 gridCellInfoOptions:a4 mutationOptions:0];
}

- (id)setIcons:(id)a3 gridCellInfoOptions:(unint64_t)a4 mutationOptions:(unint64_t)a5
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  unint64_t v75 = a4;
  id v9 = [(SBIconListModel *)self iconsWithGridCellInfoOptions:a4];
  if ([v9 isEqualToArray:v8])
  {
    uint64_t v10 = 0;
  }
  else
  {
    unint64_t v78 = a5;
    uint64_t v71 = v9;
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    id v70 = v8;
    id v13 = v8;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v106 objects:v116 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v107;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v107 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v106 + 1) + 8 * i);
          if (![(SBIconListModel *)self directlyContainsIcon:v18])
          {
            [v11 addObject:v18];
            [(SBIconListModel *)self willAddIcon:v18 atIndex:0 gridCellInfoOptions:v75 mutationOptions:a5 | 0x4000000];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v106 objects:v116 count:16];
      }
      while (v15);
    }

    v101[0] = MEMORY[0x1E4F143A8];
    v101[1] = 3221225472;
    v101[2] = __64__SBIconListModel_setIcons_gridCellInfoOptions_mutationOptions___block_invoke;
    v101[3] = &unk_1E6AAF260;
    id v69 = v13;
    id v102 = v69;
    id v19 = v12;
    id v103 = v19;
    uint64_t v104 = self;
    unint64_t v105 = a5;
    [(SBIconListModel *)self enumerateIconsUsingBlock:v101];
    id v72 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    id v20 = v11;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v97 objects:v115 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v98;
      id v74 = v20;
      do
      {
        uint64_t v24 = 0;
        uint64_t v76 = v22;
        do
        {
          if (*(void *)v98 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void **)(*((void *)&v97 + 1) + 8 * v24);
          if ([v25 isFolderIcon])
          {
            id v26 = v25;
            double v27 = [v26 folder];
            uint64_t v28 = [v27 uniqueIdentifier];
            v95[0] = MEMORY[0x1E4F143A8];
            v95[1] = 3221225472;
            v95[2] = __64__SBIconListModel_setIcons_gridCellInfoOptions_mutationOptions___block_invoke_2;
            v95[3] = &unk_1E6AAF238;
            id v29 = v28;
            id v96 = v29;
            uint64_t v30 = [v19 indexOfObjectPassingTest:v95];
            if (v30 != 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v31 = v30;
              [v19 objectAtIndex:v30];
              v33 = uint64_t v32 = v23;
              v114[0] = v33;
              v114[1] = v26;
              [MEMORY[0x1E4F1C978] arrayWithObjects:v114 count:2];
              v34 = self;
              uint64_t v36 = v35 = v19;
              [v72 addObject:v36];

              id v19 = v35;
              self = v34;
              [v19 removeObjectAtIndex:v31];

              uint64_t v23 = v32;
            }

            id v20 = v74;
            uint64_t v22 = v76;
          }
          ++v24;
        }
        while (v22 != v24);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v97 objects:v115 count:16];
      }
      while (v22);
    }

    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    id v37 = v72;
    uint64_t v38 = [v37 countByEnumeratingWithState:&v91 objects:v113 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v92;
      do
      {
        for (uint64_t j = 0; j != v39; ++j)
        {
          if (*(void *)v92 != v40) {
            objc_enumerationMutation(v37);
          }
          v42 = [*(id *)(*((void *)&v91 + 1) + 8 * j) lastObject];
          [v20 removeObject:v42];
        }
        uint64_t v39 = [v37 countByEnumeratingWithState:&v91 objects:v113 count:16];
      }
      while (v39);
    }

    if ([v20 count])
    {
      long long v77 = 0;
      int v43 = 1;
      unint64_t v44 = v78;
      id v45 = v69;
    }
    else
    {
      unint64_t v44 = v78;
      id v45 = v69;
      if ([v19 count])
      {
        long long v77 = 0;
        int v43 = 1;
      }
      else
      {
        uint64_t v46 = [v71 differenceFromArray:v69 withOptions:2];
        unint64_t v47 = [v46 insertions];
        uint64_t v48 = [v47 firstObject];
        long long v77 = [v48 object];

        int v43 = 0;
      }
    }
    unint64_t v73 = [(SBIconListModel *)self _targetListForGridCellInfoOptions:v75];
    [v73[1] setNodes:v45];
    id v49 = [(SBIconListModel *)self _updateModelByRepairingGapsIfNecessaryWithGridCellInfoOptions:v75 mutationOptions:v44];
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id v50 = v20;
    uint64_t v51 = [v50 countByEnumeratingWithState:&v87 objects:v112 count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)v88;
      do
      {
        for (uint64_t k = 0; k != v52; ++k)
        {
          if (*(void *)v88 != v53) {
            objc_enumerationMutation(v50);
          }
          [(SBIconListModel *)self didAddIcon:*(void *)(*((void *)&v87 + 1) + 8 * k) options:v44];
        }
        uint64_t v52 = [v50 countByEnumeratingWithState:&v87 objects:v112 count:16];
      }
      while (v52);
    }

    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v55 = v19;
    uint64_t v56 = [v55 countByEnumeratingWithState:&v83 objects:v111 count:16];
    if (v56)
    {
      uint64_t v57 = v56;
      uint64_t v58 = *(void *)v84;
      do
      {
        for (uint64_t m = 0; m != v57; ++m)
        {
          if (*(void *)v84 != v58) {
            objc_enumerationMutation(v55);
          }
          [(SBIconListModel *)self didRemoveIcon:*(void *)(*((void *)&v83 + 1) + 8 * m) options:v44];
        }
        uint64_t v57 = [v55 countByEnumeratingWithState:&v83 objects:v111 count:16];
      }
      while (v57);
    }

    uint64_t v10 = [(SBIconListModel *)self _checkAndRemoveBouncedIconsAfterChangeToIcons:0 ignoringTrailingIconCheck:1 options:v44];
    [(SBIconListModel *)self _invalidateLayoutWithGridCellInfoOptions:v75 mutationOptions:v44];
    [(SBIconListModel *)self markIconStateDirtyWithOptions:v44];
    if (v43)
    {
      [(SBIconListModel *)self _notifyListObserversDidAddIcons:v50 didRemoveIcons:v55 movedIcons:0];
    }
    else if (v77)
    {
      [(SBIconListModel *)self _notifyListObserversDidMoveIcon:v77 options:0];
    }
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v60 = v37;
    uint64_t v61 = [v60 countByEnumeratingWithState:&v79 objects:v110 count:16];
    if (v61)
    {
      uint64_t v62 = v61;
      uint64_t v63 = *(void *)v80;
      do
      {
        for (uint64_t n = 0; n != v62; ++n)
        {
          if (*(void *)v80 != v63) {
            objc_enumerationMutation(v60);
          }
          uint64_t v65 = *(void **)(*((void *)&v79 + 1) + 8 * n);
          v66 = [v65 firstObject];
          uint64_t v67 = [v65 lastObject];
          [(SBIconListModel *)self didReplaceIcon:v66 withIcon:v67 options:v78];
        }
        uint64_t v62 = [v60 countByEnumeratingWithState:&v79 objects:v110 count:16];
      }
      while (v62);
    }

    id v8 = v70;
    id v9 = v71;
  }

  return v10;
}

void __64__SBIconListModel_setIcons_gridCellInfoOptions_mutationOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    [*(id *)(a1 + 40) addObject:v3];
    [*(id *)(a1 + 48) willRemoveIcon:v3 options:*(void *)(a1 + 56)];
  }
}

uint64_t __64__SBIconListModel_setIcons_gridCellInfoOptions_mutationOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 folder];
  uint64_t v4 = [v3 uniqueIdentifier];
  uint64_t v5 = [*(id *)(a1 + 32) isEqualToString:v4];

  return v5;
}

- (id)setIconsFromIconListModel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 icons];
  unint64_t v6 = [(SBIconListModel *)self setIcons:v5 gridCellInfoOptions:0 mutationOptions:0x40000000];
  uint64_t v7 = [v4 fixedIconLocations];
  [(SBIconListModel *)self setFixedIconLocations:v7];
  if ([(SBIconListModel *)self allowsRotatedLayout]
    && [v4 allowsRotatedLayout])
  {
    id v8 = [v4 _rotatedIconsIfApplicable];
    if (v8)
    {
      id v9 = [(SBIconListModel *)self setIcons:v8 gridCellInfoOptions:2 mutationOptions:0x40000000];
      uint64_t v10 = [v4 rotatedFixedIconLocations];
      [(SBIconListModel *)self setRotatedFixedIconLocations:v10];
    }
  }

  return v6;
}

- (SBIcon)firstIcon
{
  return (SBIcon *)[(SBIconIndexMutableList *)self->_icons firstNode];
}

- (SBIcon)lastIcon
{
  return (SBIcon *)[(SBIconIndexMutableList *)self->_icons lastNode];
}

- (unint64_t)indexForIconWithIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = self->_icons;
  uint64_t v6 = [(SBIconIndexMutableList *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v8 + v7;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        id v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v10), "uniqueIdentifier", (void)v16);
        char v13 = [v12 isEqual:v4];

        if (v13)
        {
          unint64_t v14 = v8 + v10;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [(SBIconIndexMutableList *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      uint64_t v8 = v11;
      if (v7) {
        continue;
      }
      break;
    }
  }
  unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v14;
}

- (id)indexesForIconsPassingTest:(id)a3
{
  return [(SBIconIndexMutableList *)self->_icons indexesOfNodesPassingTest:a3];
}

- (unint64_t)gridCellIndexForIcon:(id)a3 gridCellInfoOptions:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(SBIconListModel *)self gridCellInfoWithOptions:a4];
  unint64_t v8 = [(SBIconListModel *)self gridCellIndexForIcon:v6 gridCellInfo:v7];

  return v8;
}

- (unint64_t)gridCellIndexForIcon:(id)a3 gridCellInfo:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(SBIconListModel *)self indexForIcon:a3];
  unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v8 = [(SBIconListModel *)self gridCellIndexForIconIndex:v7 gridCellInfo:v6];
  }

  return v8;
}

- (unint64_t)gridCellIndexForIconWithIdentifier:(id)a3 gridCellInfo:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(SBIconListModel *)self indexForIconWithIdentifier:a3];
  unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v8 = [(SBIconListModel *)self gridCellIndexForIconIndex:v7 gridCellInfo:v6];
  }

  return v8;
}

- (unint64_t)gridCellIndexForIconIndex:(unint64_t)a3 gridCellInfoOptions:(unint64_t)a4
{
  id v6 = [(SBIconListModel *)self gridCellInfoWithOptions:a4];
  unint64_t v7 = [(SBIconListModel *)self gridCellIndexForIconIndex:a3 gridCellInfo:v6];

  return v7;
}

- (unint64_t)gridCellIndexForIconIndex:(unint64_t)a3 gridCellInfo:(id)a4
{
  return [a4 gridCellIndexForIconIndex:a3];
}

- (id)iconAtCoordinate:(SBIconCoordinate)a3 gridCellInfoOptions:(unint64_t)a4
{
  int64_t row = a3.row;
  columuint64_t n = a3.column;
  unint64_t v7 = [(SBIconListModel *)self gridCellInfoWithOptions:a4];
  unint64_t v8 = -[SBIconListModel iconAtCoordinate:gridCellInfo:](self, "iconAtCoordinate:gridCellInfo:", column, row, v7);

  return v8;
}

- (id)iconAtCoordinate:(SBIconCoordinate)a3 gridCellInfo:(id)a4
{
  int64_t row = a3.row;
  columuint64_t n = a3.column;
  id v7 = a4;
  unint64_t v8 = -[SBIconListModel iconAtGridCellIndex:gridCellInfo:](self, "iconAtGridCellIndex:gridCellInfo:", -[SBIconListModel gridCellIndexForCoordinate:gridCellInfo:](self, "gridCellIndexForCoordinate:gridCellInfo:", column, row, v7), v7);

  return v8;
}

- (BOOL)directlyContainsIcons:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
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
        if (!-[SBIconListModel directlyContainsIcon:](self, "directlyContainsIcon:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {

          BOOL v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  BOOL v9 = [v4 count] != 0;
LABEL_11:

  return v9;
}

- (BOOL)directlyContainsAnyIconInArray:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
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
        if (-[SBIconListModel directlyContainsIcon:](self, "directlyContainsIcon:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)directlyContainsIconWithIdentifier:(id)a3
{
  return [(SBIconIndexMutableList *)self->_icons directlyContainsNodeIdentifier:a3];
}

- (BOOL)directlyContainsLeafIconWithIdentifier:(id)a3
{
  return [(SBIconIndexMutableList *)self->_icons directlyContainsNodeIdentifier:a3 passingTest:&__block_literal_global_20_0];
}

uint64_t __58__SBIconListModel_directlyContainsLeafIconWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isLeafIcon];
}

- (id)directlyContainedIconWithIdentifier:(id)a3
{
  return [(SBIconIndexMutableList *)self->_icons directlyContainedNodeIdentifier:a3];
}

- (id)iconWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__14;
  uint64_t v15 = __Block_byref_object_dispose__14;
  id v16 = [(SBIconListModel *)self directlyContainedIconWithIdentifier:v4];
  uint64_t v5 = (void *)v12[5];
  if (!v5)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __38__SBIconListModel_iconWithIdentifier___block_invoke;
    v8[3] = &unk_1E6AB1778;
    uint64_t v10 = &v11;
    id v9 = v4;
    [(SBIconListModel *)self enumerateFolderIconsUsingBlock:v8];

    uint64_t v5 = (void *)v12[5];
  }
  id v6 = v5;
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __38__SBIconListModel_iconWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = [a2 folder];
  uint64_t v6 = [v9 iconWithIdentifier:*(void *)(a1 + 32)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a4 = 1;
  }
}

- (id)lastDirectlyContainedLeafIconWithApplicationBundleIdentifier:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__SBIconListModel_lastDirectlyContainedLeafIconWithApplicationBundleIdentifier___block_invoke;
  v9[3] = &unk_1E6AAF238;
  id v10 = v4;
  id v5 = v4;
  uint64_t v6 = [(SBIconListModel *)self directlyContainedIconsPassingTest:v9];
  uint64_t v7 = [v6 lastObject];

  return v7;
}

uint64_t __80__SBIconListModel_lastDirectlyContainedLeafIconWithApplicationBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isLeafIcon])
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v3 applicationBundleID];
    uint64_t v6 = [v4 isEqualToString:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)directlyContainedIconPassingTest:(id)a3
{
  unint64_t v4 = [(SBIconIndexMutableList *)self->_icons indexOfNodePassingTest:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [(SBIconIndexMutableList *)self->_icons nodeAtIndex:v4];
  }
  return v5;
}

- (id)directlyContainedIconsPassingTest:(id)a3
{
  unint64_t v4 = [(SBIconIndexMutableList *)self->_icons indexesOfNodesPassingTest:a3];
  id v5 = [(SBIconListModel *)self iconsAtIndexes:v4];

  return v5;
}

- (id)indexesOfDirectlyContainedIconsPassingTest:(id)a3
{
  return [(SBIconIndexMutableList *)self->_icons indexesOfNodesPassingTest:a3];
}

- (unint64_t)countOfDirectlyContainedIconsPassingTest:(id)a3
{
  id v3 = [(SBIconIndexMutableList *)self->_icons indexesOfNodesPassingTest:a3];
  unint64_t v4 = [v3 count];

  return v4;
}

- (BOOL)directlyContainsIconOfClass:(Class)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__SBIconListModel_directlyContainsIconOfClass___block_invoke;
  v6[3] = &__block_descriptor_40_e23_B32__0__SBIcon_8Q16_B24lu32l8;
  v6[4] = a3;
  id v3 = [(SBIconListModel *)self directlyContainedIconPassingTest:v6];
  BOOL v4 = v3 != 0;

  return v4;
}

uint64_t __47__SBIconListModel_directlyContainsIconOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)directlyContainsIconPassingTest:(id)a3
{
  id v3 = [(SBIconListModel *)self directlyContainedIconPassingTest:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (unint64_t)indexOfDirectlyContainedIconPassingTest:(id)a3
{
  return [(SBIconIndexMutableList *)self->_icons indexOfNodePassingTest:a3];
}

- (_NSRange)rangeOfDirectlyContainedIconsInRange:(_NSRange)a3 passingTest:(id)a4
{
  NSUInteger length = a3.length;
  locatiouint64_t n = a3.location;
  uint64_t v7 = (uint64_t (**)(id, void *, NSUInteger, unsigned char *))a4;
  if (!length)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_17;
  }
  NSUInteger v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    uint64_t v11 = [(SBIconListModel *)self iconAtIndex:location + v8];
    unsigned __int8 v17 = 0;
    int v12 = v7[2](v7, v11, location + v8, &v17);
    BOOL v13 = v10 == 0x7FFFFFFFFFFFFFFFLL;
    if (v12)
    {
      if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v10 = location + v8;
      }
      if (v13) {
        uint64_t v9 = 1;
      }
      else {
        ++v9;
      }
      goto LABEL_12;
    }
    if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_12:
    int v14 = v17;

    if (!v14 && location <= ++v8 + location && v8 < length) {
      continue;
    }
    goto LABEL_17;
  }

LABEL_17:
  NSUInteger v15 = v10;
  NSUInteger v16 = v9;
  result.NSUInteger length = v16;
  result.locatiouint64_t n = v15;
  return result;
}

- (BOOL)containsWidgetIconWithExtensionBundleIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_icons;
  uint64_t v6 = [(SBIconIndexMutableList *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "isWidgetIcon", (void)v13))
        {
          uint64_t v10 = [v9 activeWidget];
          uint64_t v11 = [(id)v10 extensionBundleIdentifier];

          LOBYTE(v10) = [v11 isEqualToString:v4];
          if (v10)
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v6 = [(SBIconIndexMutableList *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v6;
}

- (void)enumerateIconsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  unint64_t v7 = a3 & 2;
  icons = self->_icons;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__SBIconListModel_enumerateIconsWithOptions_usingBlock___block_invoke;
  v10[3] = &unk_1E6AB17E8;
  id v11 = v6;
  unint64_t v12 = a3;
  id v9 = v6;
  [(SBIconIndexMutableList *)icons enumerateNodesWithOptions:v7 usingBlock:v10];
}

void __56__SBIconListModel_enumerateIconsWithOptions_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  NSUInteger v8 = [MEMORY[0x1E4F28D58] indexPathWithIndex:a3];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if ((*(unsigned char *)(a1 + 40) & 1) != 0 && [v7 isFolderIcon])
  {
    id v9 = [v7 folder];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__SBIconListModel_enumerateIconsWithOptions_usingBlock___block_invoke_2;
    v10[3] = &unk_1E6AB17C0;
    id v11 = *(id *)(a1 + 32);
    uint64_t v12 = a4;
    [v9 enumerateAllIconsWithBaseIndexPath:v8 options:1 usingBlock:v10];
  }
}

uint64_t __56__SBIconListModel_enumerateIconsWithOptions_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  char v7 = 0;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v7)
  {
    **(unsigned char **)(a1 + 40) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)enumerateFolderIconsUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__SBIconListModel_enumerateFolderIconsUsingBlock___block_invoke;
  v6[3] = &unk_1E6AB0E40;
  id v7 = v4;
  id v5 = v4;
  [(SBIconListModel *)self enumerateIconsUsingBlock:v6];
}

void __50__SBIconListModel_enumerateFolderIconsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isFolderIcon]) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)iconGridCellInfoBySimulatingInsertionOfIcons:(id)a3 ignoringPlaceholders:(BOOL)a4 gridCellInfoOptions:(unint64_t)a5 iconOrder:(id *)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = objc_alloc_init(SBIconIndexMutableList);
  id v29 = self;
  icons = self->_icons;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __115__SBIconListModel_iconGridCellInfoBySimulatingInsertionOfIcons_ignoringPlaceholders_gridCellInfoOptions_iconOrder___block_invoke;
  v46[3] = &unk_1E6AAF1C8;
  BOOL v48 = a4;
  id v11 = v9;
  unint64_t v47 = v11;
  [(SBIconIndexMutableList *)icons enumerateNodesUsingBlock:v46];
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  int v43 = __Block_byref_object_copy__14;
  unint64_t v44 = __Block_byref_object_dispose__14;
  id v45 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __115__SBIconListModel_iconGridCellInfoBySimulatingInsertionOfIcons_ignoringPlaceholders_gridCellInfoOptions_iconOrder___block_invoke_2;
  aBlock[3] = &unk_1E6AB1810;
  uint64_t v12 = v11;
  uint64_t v36 = v12;
  id v37 = v29;
  uint64_t v38 = &v40;
  unint64_t v39 = a5;
  long long v13 = (void (**)(void))_Block_copy(aBlock);
  v13[2]();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = v8;
  uint64_t v14 = [obj countByEnumeratingWithState:&v31 objects:v49 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v18 = [v17 gridSizeClass];
        if (v18
          && ([v17 gridSizeClass],
              long long v19 = objc_claimAutoreleasedReturnValue(),
              int v20 = [v19 isEqualToString:@"SBHIconGridSizeClassDefault"],
              v19,
              v18,
              !v20))
        {
          if ([(SBIconIndexMutableList *)v12 count]) {
            unint64_t v21 = objc_msgSend((id)v41[5], "gridCellIndexForIconIndex:", -[SBIconIndexMutableList count](v12, "count") - 1);
          }
          else {
            unint64_t v21 = 0;
          }
          if (v21 > [(SBIconListModel *)v29 maxNumberOfIcons]
            || (v22 = -[SBIconListModel bestGridCellIndexForInsertingIcon:atGridCellIndex:](v29, "bestGridCellIndexForInsertingIcon:atGridCellIndex:", v17, v21), uint64_t v23 = [(id)v41[5] iconIndexForGridCellIndex:v22], v23 == 0x7FFFFFFFFFFFFFFFLL))
          {
            uint64_t v23 = [(SBIconIndexMutableList *)v12 count];
          }
          [(SBIconIndexMutableList *)v12 insertNode:v17 atIndex:v23];
        }
        else
        {
          [(SBIconIndexMutableList *)v12 addNode:v17];
        }
        ((void (*)(void (**)(void)))v13[2])(v13);
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v31 objects:v49 count:16];
    }
    while (v14);
  }

  id v24 = [(SBIconListModel *)v29 repairModelByEliminatingGapsInIcons:v12 avoidingIcons:0 gridCellInfoOptions:a5];
  ((void (*)(void (**)(void)))v13[2])(v13);
  if (a6)
  {
    *a6 = [(SBIconIndexMutableList *)v12 nodes];
  }
  id v25 = (id)v41[5];

  _Block_object_dispose(&v40, 8);
  return v25;
}

void __115__SBIconListModel_iconGridCellInfoBySimulatingInsertionOfIcons_ignoringPlaceholders_gridCellInfoOptions_iconOrder___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (!*(unsigned char *)(a1 + 40) || (char v4 = [v3 isPlaceholder], v5 = v6, (v4 & 1) == 0))
  {
    [*(id *)(a1 + 32) addNode:v6];
    id v5 = v6;
  }
}

void __115__SBIconListModel_iconGridCellInfoBySimulatingInsertionOfIcons_ignoringPlaceholders_gridCellInfoOptions_iconOrder___block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) nodes];
  uint64_t v2 = [*(id *)(a1 + 40) gridCellInfoForIcons:v5 referenceIconOrder:v5 options:*(void *)(a1 + 56)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)iconGridCellInfoBySimulatingRemovalOfIcons:(id)a3 ignoringPlaceholders:(BOOL)a4 gridCellInfoOptions:(unint64_t)a5 iconOrder:(id *)a6
{
  id v10 = a3;
  id v11 = objc_alloc_init(SBIconIndexMutableList);
  icons = self->_icons;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __113__SBIconListModel_iconGridCellInfoBySimulatingRemovalOfIcons_ignoringPlaceholders_gridCellInfoOptions_iconOrder___block_invoke;
  v40[3] = &unk_1E6AB1838;
  id v13 = v10;
  id v41 = v13;
  BOOL v43 = a4;
  uint64_t v14 = v11;
  uint64_t v42 = v14;
  [(SBIconIndexMutableList *)icons enumerateNodesUsingBlock:v40];
  uint64_t v15 = [(SBIconIndexMutableList *)self->_icons nodes];
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = __Block_byref_object_copy__14;
  uint64_t v38 = __Block_byref_object_dispose__14;
  id v39 = 0;
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  double v27 = __113__SBIconListModel_iconGridCellInfoBySimulatingRemovalOfIcons_ignoringPlaceholders_gridCellInfoOptions_iconOrder___block_invoke_2;
  uint64_t v28 = &unk_1E6AB1860;
  long long v16 = v14;
  long long v32 = &v34;
  id v29 = v16;
  uint64_t v30 = self;
  id v17 = v15;
  id v31 = v17;
  unint64_t v33 = a5;
  uint64_t v18 = (void (**)(void *, uint64_t, uint64_t, uint64_t))_Block_copy(&v25);
  v18[2](v18, v19, v20, v21);
  id v22 = -[SBIconListModel repairModelByEliminatingGapsInIcons:avoidingIcons:gridCellInfoOptions:](self, "repairModelByEliminatingGapsInIcons:avoidingIcons:gridCellInfoOptions:", v16, 0, a5, v25, v26, v27, v28);
  ((void (*)(void (**)(void *, uint64_t, uint64_t, uint64_t)))v18[2])(v18);
  if (a6)
  {
    *a6 = [(SBIconIndexMutableList *)v16 nodes];
  }
  id v23 = (id)v35[5];

  _Block_object_dispose(&v34, 8);
  return v23;
}

void __113__SBIconListModel_iconGridCellInfoBySimulatingRemovalOfIcons_ignoringPlaceholders_gridCellInfoOptions_iconOrder___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0
    && (!*(unsigned char *)(a1 + 48) || ([v3 isPlaceholder] & 1) == 0))
  {
    [*(id *)(a1 + 40) addNode:v3];
  }
}

void __113__SBIconListModel_iconGridCellInfoBySimulatingRemovalOfIcons_ignoringPlaceholders_gridCellInfoOptions_iconOrder___block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) nodes];
  uint64_t v2 = [*(id *)(a1 + 40) gridCellInfoForIcons:v5 referenceIconOrder:*(void *)(a1 + 48) options:*(void *)(a1 + 64)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)allowsAddingIcon:(id)a3
{
  return [(SBIconListModel *)self allowsAddingIcon:a3 ignoringPlaceholders:1];
}

- (BOOL)allowsAddingIcon:(id)a3 ignoringPlaceholders:(BOOL)a4
{
  BOOL v4 = a4;
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(SBIconListModel *)self isAllowedToContainIcon:v6])
  {
    v11[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    id v8 = [(SBIconListModel *)self iconGridCellInfoBySimulatingInsertionOfIcons:v7 ignoringPlaceholders:v4 gridCellInfoOptions:0 iconOrder:0];

    BOOL v9 = [(SBIconListModel *)self isGridLayoutValid:v8];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)isAllowedToContainIcon:(id)a3
{
  id v4 = a3;
  if (![(SBIconListModel *)self directlyContainsIcon:v4])
  {
    id v6 = [v4 gridSizeClass];
    if (![(SBIconListModel *)self isAllowedToContainIconGridSizeClass:v6])
    {
LABEL_11:
      BOOL v5 = 0;
LABEL_12:

      goto LABEL_13;
    }
    uint64_t v7 = (uint64_t)[(SBIconListModel *)self gridSizeForGridSizeClass:v6];
    SBHIconGridSize v8 = (SBHIconGridSize)[(SBIconListModel *)self gridSize];
    BOOL v5 = 0;
    if ((unsigned __int16)v7 > v8.columns) {
      goto LABEL_12;
    }
    if (WORD1(v7) > HIWORD(*(unsigned int *)&v8)) {
      goto LABEL_12;
    }
    if ([(SBIconListModel *)self allowsRotatedLayout])
    {
      uint64_t v7 = (uint64_t)[(SBIconListModel *)self gridSizeWithOptions:2];
      SBHIconGridSize v9 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeForGridSizeClass:v6 gridCellInfoOptions:2];
      BOOL v5 = 0;
      if (v9.columns > (unsigned __int16)v7 || HIWORD(*(unsigned int *)&v9) > WORD1(v7)) {
        goto LABEL_12;
      }
    }
    id v10 = [(SBIconListModel *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = [v10 iconListModel:self isAllowedToContainIcon:v4];

      if (!v7) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    uint64_t v12 = [v4 gridSizeClass];
    if (!v12
      || ([v4 gridSizeClass],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          ([(id)v7 isEqualToString:@"SBHIconGridSizeClassDefault"] & 1) != 0))
    {
      id v13 = [(SBIconListModel *)self rotatedLayoutClusterGridSizeClass];
      if (v13)
      {
        uint64_t v14 = [(SBIconListModel *)self rotatedLayoutClusterGridSizeClass];
        BOOL v15 = ([v14 isEqualToString:@"SBHIconGridSizeClassDefault"] & 1) == 0
           && [(SBIconListModel *)self isFull];

        if (v12)
        {

          if (v15)
          {
LABEL_25:
            uint64_t v17 = 0;
            uint64_t v18 = &v17;
            uint64_t v19 = 0x2020000000;
            char v20 = 1;
            v16[0] = MEMORY[0x1E4F143A8];
            v16[1] = 3221225472;
            v16[2] = __42__SBIconListModel_isAllowedToContainIcon___block_invoke;
            v16[3] = &unk_1E6AB1730;
            v16[4] = &v17;
            [(SBIconListModel *)self enumerateIconsUsingBlock:v16];
            BOOL v5 = *((unsigned char *)v18 + 24) == 0;
            _Block_object_dispose(&v17, 8);
            goto LABEL_12;
          }
        }
        else if (v15)
        {
          goto LABEL_25;
        }
LABEL_27:
        BOOL v5 = 1;
        goto LABEL_12;
      }

      if (!v12) {
        goto LABEL_27;
      }
    }

    goto LABEL_27;
  }
  BOOL v5 = 1;
LABEL_13:

  return v5;
}

void __42__SBIconListModel_isAllowedToContainIcon___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  uint64_t v6 = [v10 gridSizeClass];
  if (!v6
    || (uint64_t v7 = (void *)v6,
        [v10 gridSizeClass],
        SBHIconGridSize v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 isEqualToString:@"SBHIconGridSizeClassDefault"],
        v8,
        v7,
        v9))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (BOOL)isAllowedToContainIcons:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
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
        if (!-[SBIconListModel isAllowedToContainIcon:](self, "isAllowedToContainIcon:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          BOOL v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (BOOL)allowsAddingIcons:(id)a3
{
  return [(SBIconListModel *)self allowsAddingIcons:a3 ignoringPlaceholders:1];
}

- (BOOL)allowsAddingIcons:(id)a3 ignoringPlaceholders:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(SBIconListModel *)self isAllowedToContainIcons:v6])
  {
    uint64_t v7 = [(SBIconListModel *)self iconGridCellInfoBySimulatingInsertionOfIcons:v6 ignoringPlaceholders:v4 gridCellInfoOptions:0 iconOrder:0];
    BOOL v8 = [(SBIconListModel *)self isGridLayoutValid:v7];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)allowsAddingIconCount:(unint64_t)a3
{
  unint64_t v5 = [(SBIconListModel *)self maxNumberOfIcons];
  return v5 - [(SBIconListModel *)self numberOfNonPlaceholderIcons] >= a3;
}

- (id)iconsThatAreAllowedToBeContainedInIcons:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (![(SBIconListModel *)self isAllowedToContainIcons:v4])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__SBIconListModel_iconsThatAreAllowedToBeContainedInIcons___block_invoke;
    v8[3] = &unk_1E6AAF238;
    void v8[4] = self;
    id v6 = [v4 indexesOfObjectsPassingTest:v8];
    unint64_t v5 = [v4 objectsAtIndexes:v6];
  }
  return v5;
}

uint64_t __59__SBIconListModel_iconsThatAreAllowedToBeContainedInIcons___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isAllowedToContainIcon:a2];
}

- (id)allowedIconsForIcons:(id)a3
{
  return [(SBIconListModel *)self allowedIconsForIcons:a3 ignoringPlaceholders:1];
}

- (id)allowedIconsForIcons:(id)a3 ignoringPlaceholders:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(SBIconListModel *)self directlyContainsIcons:v6])
  {
    id v7 = v6;
  }
  else
  {
    id v8 = [(SBIconListModel *)self iconsThatAreAllowedToBeContainedInIcons:v6];
    id v7 = v8;
    if ([v8 count])
    {
      BOOL v9 = v8;
      while (1)
      {
        id v10 = [(SBIconListModel *)self iconGridCellInfoBySimulatingInsertionOfIcons:v9 ignoringPlaceholders:v4 gridCellInfoOptions:0 iconOrder:0];
        if ([(SBIconListModel *)self isGridLayoutValid:v10]) {
          break;
        }
        objc_msgSend(v9, "subarrayWithRange:", 0, objc_msgSend(v9, "count") - 1);
        id v7 = (id)objc_claimAutoreleasedReturnValue();

        BOOL v9 = v7;
        if (![v7 count]) {
          goto LABEL_9;
        }
      }

      id v7 = v9;
    }
LABEL_9:
  }
  return v7;
}

- (id)allowedIconsForByReplacingContentsWithIcons:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SBIconListModel *)self iconsThatAreAllowedToBeContainedInIcons:v4];
  id v6 = [(SBIconListModel *)self gridCellInfoForIcons:v4 referenceIconOrder:v4 options:0];

  id v7 = v5;
  id v8 = v7;
  if (![(SBIconListModel *)self isGridLayoutValid:v6])
  {
    unint64_t v9 = [(SBIconListModel *)self numberOfIcons];
    uint64_t v10 = [v7 count];
    uint64_t v11 = objc_msgSend(v6, "indexOfOutOfBoundsIconInRange:", v9, v10);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v12 = v10;
    }
    else {
      uint64_t v12 = v11;
    }
    id v8 = objc_msgSend(v7, "subarrayWithRange:", 0, v12);
  }
  return v8;
}

- (BOOL)isAllowedToContainIconGridSizeClass:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SBIconListModel *)self allowedGridSizeClasses];
  id v6 = [(SBIconListModel *)self effectiveGridSizeClassDomain];
  char v7 = [v5 containsGridSizeClass:v4 inDomain:v6];

  return v7;
}

- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 atGridCellIndex:(unint64_t)a4
{
  return [(SBIconListModel *)self bestGridCellIndexForInsertingIcon:a3 atGridCellIndex:a4 gridCellInfoOptions:0];
}

- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 atGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5
{
  id v8 = a3;
  unint64_t v9 = [(SBIconListModel *)self gridCellInfoWithOptions:a5];
  unint64_t v10 = [(SBIconListModel *)self bestGridCellIndexForInsertingIcon:v8 atGridCellIndex:a4 gridCellInfo:v9];

  return v10;
}

- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 atGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5
{
  id v8 = a5;
  unint64_t v9 = [a3 gridSizeClass];
  unint64_t v10 = [(SBIconListModel *)self bestGridCellIndexForInsertingIconOfGridSizeClass:v9 atGridCellIndex:a4 gridCellInfo:v8];

  return v10;
}

- (unint64_t)bestGridCellIndexForInsertingIconOfGridSizeClass:(id)a3 atGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    if (([v8 isEqualToString:@"SBHIconGridSizeClassDefault"] & 1) == 0)
    {
      SBHIconGridSize v10 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeForGridSizeClass:v8 gridCellInfo:v9];
      unsigned __int16 v11 = [v9 gridSize];
      if (*(unsigned int *)&v10 >= 0x10000)
      {
        if (v10.columns)
        {
          uint64_t v12 = v11;
          unint64_t v13 = a4 / v11;
          unint64_t v14 = a4 % v11;
          char v15 = [(SBIconListModel *)self iconLayoutBehavior];
          if ((v15 & 1) == 0)
          {
            LODWORD(v16) = HIWORD(*(unsigned int *)&v10);
            if (HIWORD(*(unsigned int *)&v10) >= 2u) {
              unint64_t v16 = 2;
            }
            else {
              unint64_t v16 = v16;
            }
            unint64_t v13 = v13 / v16 * v16;
          }
          unint64_t v17 = (int)(v12 - v10.columns);
          if ((v15 & 2) == 0)
          {
            if (v10.columns >= 2u) {
              unsigned int columns = 2;
            }
            else {
              unsigned int columns = v10.columns;
            }
            v14 -= (unsigned __int16)v14 % columns;
          }
          if (v14 < v17) {
            unint64_t v17 = v14;
          }
          a4 = v17 + v13 * v12;
        }
      }
    }
  }

  return a4;
}

- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 afterIconAtGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [(SBIconListModel *)self gridCellInfoWithOptions:a5];
  unint64_t v10 = [(SBIconListModel *)self bestGridCellIndexForInsertingIcon:v8 afterIconAtGridCellIndex:a4 gridCellInfo:v9];

  return v10;
}

- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 afterIconAtGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v9 gridRangeForGridCellIndex:a4];
  int v12 = v11;
  int v13 = [v9 gridSize];
  unint64_t v14 = SBHIconGridRangeMaxCellIndex(v10, v12, v13);
  if (v14 == SBHIconGridRangeMaxCellIndex(0, v13, v13))
  {
    unint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    if ((unsigned __int16)v13 != (unsigned __int16)v12) {
      int v16 = 0;
    }
    else {
      int v16 = HIWORD(v12) - 1;
    }
    unint64_t v15 = [(SBIconListModel *)self bestGridCellIndexForInsertingIcon:v8 atGridCellIndex:SBHIconGridRangeMaxCellIndexOnRow(v10, v12, v13, v16) gridCellInfo:v9];
  }

  return v15;
}

- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 belowIconAtGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [(SBIconListModel *)self gridCellInfoWithOptions:a5];
  unint64_t v10 = [(SBIconListModel *)self bestGridCellIndexForInsertingIcon:v8 belowIconAtGridCellIndex:a4 gridCellInfo:v9];

  return v10;
}

- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 belowIconAtGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v9 gridRangeForGridCellIndex:a4];
  uint64_t v12 = SBHIconGridRangeCellIndexBelowColumn(v10, v11, [v9 gridSize], 0);
  unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  if (v12 != 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v13 = [(SBIconListModel *)self bestGridCellIndexForInsertingIcon:v8 atGridCellIndex:v12 gridCellInfo:v9];
  }

  return v13;
}

- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 aboveIconAtGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [(SBIconListModel *)self gridCellInfoWithOptions:a5];
  unint64_t v10 = [(SBIconListModel *)self bestGridCellIndexForInsertingIcon:v8 aboveIconAtGridCellIndex:a4 gridCellInfo:v9];

  return v10;
}

- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 aboveIconAtGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unint64_t v10 = [v9 gridRangeForGridCellIndex:a4];
  uint64_t v12 = SBHIconGridRangeCellIndexAboveColumn(v10, v11, [v9 gridSize], 0);
  unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  if (v12 != 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v13 = [(SBIconListModel *)self bestGridCellIndexForInsertingIcon:v8 atGridCellIndex:v12 gridCellInfo:v9];
  }

  return v13;
}

- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 gridCellInfoOptions:(unint64_t)a4
{
  id v6 = a3;
  char v7 = [(SBIconListModel *)self gridCellInfoWithOptions:a4];
  unint64_t v8 = [(SBIconListModel *)self bestGridCellIndexForInsertingIcon:v6 gridCellInfo:v7];

  return v8;
}

- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 gridCellInfo:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(SBIconListModel *)self rotatedLayoutClusterGridSizeClass];
  id v9 = v8;
  if (v8 && ([v8 isEqualToString:@"SBHIconGridSizeClassDefault"] & 1) == 0)
  {
    uint64_t v21 = [v6 gridSizeClass];
    SBHIconGridSize v11 = (SBHIconGridSize)-[SBIconListModel gridSizeForGridSizeClass:gridCellInfo:](self, "gridSizeForGridSizeClass:gridCellInfo:");
    int v12 = [v7 gridSize];
    SBHIconGridSize v20 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeForGridSizeClass:v9 gridCellInfo:v7];
    unsigned int Area = SBHIconGridSizeGetArea(*(_DWORD *)&v11);
    unint64_t v14 = [(SBIconListModel *)self iconLayoutBehavior];
    if (Area >= 0x40)
    {
      unint64_t v15 = (char *)malloc_type_calloc(Area, 8uLL, 0x100004000313F17uLL);
      uint64_t v19 = v15;
    }
    else
    {
      uint64_t v19 = 0;
      unint64_t v15 = &v42;
    }
    uint64_t v38 = 0;
    id v39 = &v38;
    uint64_t v40 = 0x2020000000;
    uint64_t v41 = 0x7FFFFFFFFFFFFFFFLL;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__SBIconListModel_bestGridCellIndexForInsertingIcon_gridCellInfo___block_invoke;
    aBlock[3] = &unk_1E6AB1888;
    int v36 = v12;
    SBHIconGridSize v37 = v11;
    unint64_t v33 = v14;
    uint64_t v34 = v15;
    unsigned int v35 = Area;
    id v31 = v7;
    long long v32 = self;
    int v16 = _Block_copy(aBlock);
    if (SBHIconGridRangeContainsIconGridRange(0, *(_DWORD *)&v20, 0, *(_DWORD *)&v11, v12))
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __66__SBIconListModel_bestGridCellIndexForInsertingIcon_gridCellInfo___block_invoke_2;
      v25[3] = &unk_1E6AB18B0;
      SBHIconGridSize v28 = v11;
      int v29 = v12;
      id v26 = v16;
      double v27 = &v38;
      SBHIconGridRangeEnumerateSubranges(0, v12, *(_DWORD *)&v20, v12, 0, v25);
    }
    unint64_t v17 = v39;
    if (v39[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __66__SBIconListModel_bestGridCellIndexForInsertingIcon_gridCellInfo___block_invoke_4;
      v22[3] = &unk_1E6AB18D8;
      id v23 = v16;
      id v24 = &v38;
      SBHIconGridRangeEnumerateSubranges(0, v12, *(_DWORD *)&v11, v12, 1, v22);

      unint64_t v17 = v39;
    }
    free(v19);
    unint64_t v10 = v17[3];

    _Block_object_dispose(&v38, 8);
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

uint64_t __66__SBIconListModel_bestGridCellIndexForInsertingIcon_gridCellInfo___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v6 = SBIconCoordinateMakeWithGridCellIndex(a2, *(_DWORD *)(a1 + 68));
  uint64_t result = _SBIconListIsCoordinateValidForGridSize(v6, v7, *(_DWORD *)(a1 + 72), *(_DWORD *)(a1 + 68), *(void *)(a1 + 48));
  if (result)
  {
    objc_msgSend(*(id *)(a1 + 32), "getIconIndexes:inGridRange:", *(void *)(a1 + 56), a2, a3);
    unint64_t v9 = *(unsigned int *)(a1 + 64);
    if (v9)
    {
      for (unint64_t i = 0; i < v9; ++i)
      {
        if (*(void *)(*(void *)(a1 + 56) + 8 * i) != 0x7FFFFFFFFFFFFFFFLL)
        {
          SBHIconGridSize v11 = objc_msgSend(*(id *)(a1 + 40), "iconAtIndex:");
          uint64_t v12 = [v11 gridSizeClass];
          if (v12)
          {
            unint64_t v13 = (void *)v12;
            unint64_t v14 = [v11 gridSizeClass];
            char v15 = [v14 isEqualToString:@"SBHIconGridSizeClassDefault"];

            if ((v15 & 1) == 0)
            {

              return 0;
            }
          }

          unint64_t v9 = *(unsigned int *)(a1 + 64);
        }
      }
    }
    return 1;
  }
  return result;
}

void __66__SBIconListModel_bestGridCellIndexForInsertingIcon_gridCellInfo___block_invoke_2(uint64_t a1, unint64_t a2, int a3, uint64_t a4)
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__SBIconListModel_bestGridCellIndexForInsertingIcon_gridCellInfo___block_invoke_3;
  v10[3] = &unk_1E6AB18B0;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v11 = v8;
  uint64_t v12 = v9;
  uint64_t v13 = a4;
  SBHIconGridRangeEnumerateSubranges(a2, a3, *(_DWORD *)(a1 + 48), *(_DWORD *)(a1 + 52), 0, v10);
}

uint64_t __66__SBIconListModel_bestGridCellIndexForInsertingIcon_gridCellInfo___block_invoke_3(void *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(a1[4] + 16))();
  if (result)
  {
    id v8 = (unsigned char *)a1[6];
    *(void *)(*(void *)(a1[5] + 8) + 24) = a2;
    *a4 = 1;
    *id v8 = 1;
  }
  return result;
}

uint64_t __66__SBIconListModel_bestGridCellIndexForInsertingIcon_gridCellInfo___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    *a4 = 1;
  }
  return result;
}

- (unint64_t)bestIconIndexForReplacingIcon:(id)a3 withIcon:(id)a4 gridCellInfo:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  unint64_t v10 = [(SBIconListModel *)self bestGridCellIndexForInsertingIcon:v9 atGridCellIndex:[(SBIconListModel *)self gridCellIndexForIcon:a3 gridCellInfo:v8] gridCellInfo:v8];

  if (v10) {
    unint64_t v10 = [v8 iconIndexForGridCellIndex:v10];
  }

  return v10;
}

- (BOOL)canBounceIcon:(id)a3
{
  id v4 = a3;
  if ([(SBIconListModel *)self isIconFixed:v4])
  {
    char v5 = 0;
  }
  else
  {
    unint64_t v6 = [(SBIconListModel *)self folder];
    uint64_t v7 = v6;
    if (v6) {
      char v5 = [v6 canBounceIcon:v4];
    }
    else {
      char v5 = 1;
    }
  }
  return v5;
}

- (void)removeIconFromOtherPositionsInHierarchy:(id)a3
{
}

- (unint64_t)removeIconFromOtherPositionsInHierarchy:(id)a3 forInsertingAtIndex:(unint64_t)a4 removeIfAlreadyContained:(BOOL)a5 gridCellInfoOptions:(unint64_t)a6 mutationOptions:(unint64_t)a7
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = [v10 uniqueIdentifier];
  uint64_t v12 = SBTreeNodeGetRootNode(self);
  uint64_t v13 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v15 = v12;
    int v16 = [v15 indexPathForIconWithIdentifier:v11];
    if (v16)
    {
      id v25 = [v15 iconAtIndexPath:v16];
    }
    else
    {
      id v25 = 0;
    }
    uint64_t v18 = [v15 listContainingIndexPath:v16 relativeIndex:0];
    uint64_t v19 = v18;
    if (v18 != self || v25 != v10 || (unint64_t v20 = a4, v7))
    {
      unint64_t v20 = a4;
      if (v18 == self) {
        unint64_t v20 = (__PAIR128__(a4, objc_msgSend(v16, "sb_lastIconIndex")) - a4) >> 64;
      }
      [(SBIconListModel *)v19 removeIcon:v25];
    }
    if ([v10 isFolderIcon])
    {
      uint64_t v21 = objc_alloc_init(SBIcon);
      if (a4 != 0x7FFFFFFFFFFFFFFFLL) {
        [(SBIconIndexMutableList *)self->_icons insertNode:v21 atIndex:a4];
      }
      id v22 = [v10 folder];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __140__SBIconListModel_removeIconFromOtherPositionsInHierarchy_forInsertingAtIndex_removeIfAlreadyContained_gridCellInfoOptions_mutationOptions___block_invoke;
      v26[3] = &unk_1E6AB1900;
      id v27 = v15;
      id v23 = v22;
      id v28 = v23;
      [v23 enumerateAllIconsUsingBlock:v26];
      unint64_t v20 = [(SBIconIndexMutableList *)self->_icons indexOfNode:v21];
      if (v20 != 0x7FFFFFFFFFFFFFFFLL) {
        [(SBIconIndexMutableList *)self->_icons removeNodeAtIndex:v20];
      }
    }
    a4 = v20;
  }
  else if (v7)
  {
    unint64_t v17 = [(SBIconListModel *)self indexForIconWithIdentifier:v11];
    if (v17 != 0x7FFFFFFFFFFFFFFFLL)
    {
      a4 = (__PAIR128__(a4, v17) - a4) >> 64;
      [(SBIconListModel *)self removeIcon:v10];
    }
  }

  return a4;
}

void __140__SBIconListModel_removeIconFromOtherPositionsInHierarchy_forInsertingAtIndex_removeIfAlreadyContained_gridCellInfoOptions_mutationOptions___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "indexPathForIcon:");
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) folderContainingIndexPath:v3 relativeIndexPath:0];
    char v5 = v4;
    if (v4 != *(void **)(a1 + 40)) {
      [v4 removeIcon:v6 options:0];
    }
  }
}

- (unint64_t)willAddIcon:(id)a3 atIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  id v10 = a3;
  [(SBIconListModel *)self updateGridSizeForAddedIcon:v10 removedIcon:0];
  if ((a6 & 0x4000000) == 0) {
    a4 = [(SBIconListModel *)self removeIconFromOtherPositionsInHierarchy:v10 forInsertingAtIndex:a4 removeIfAlreadyContained:1 gridCellInfoOptions:a5 mutationOptions:a6];
  }
  if (a4 != 0x7FFFFFFFFFFFFFFFLL) {
    [(SBIconListModel *)self _notifyListObserversWillAddIcon:v10];
  }

  return a4;
}

- (unint64_t)willReplaceIcon:(id)a3 withIcon:(id)a4 atIndex:(unint64_t)a5 gridCellInfoOptions:(unint64_t)a6 mutationOptions:(unint64_t)a7
{
  id v12 = a4;
  [(SBIconListModel *)self updateGridSizeForAddedIcon:v12 removedIcon:a3];
  if ((a7 & 0x4000000) == 0) {
    a5 = [(SBIconListModel *)self removeIconFromOtherPositionsInHierarchy:v12 forInsertingAtIndex:a5 removeIfAlreadyContained:1 gridCellInfoOptions:a6 mutationOptions:a7];
  }
  if (a5 != 0x7FFFFFFFFFFFFFFFLL) {
    [(SBIconListModel *)self _notifyListObserversWillAddIcon:v12];
  }

  return a5;
}

- (void)updateParentNodeForIconIfNecessary:(id)a3
{
  id v5 = [a3 folder];
  id v4 = [(SBIconListModel *)self parentNodeForChildren];
  SBTreeNodeSetParent(v5, (uint64_t)v4);
}

- (void)clearParentNodeForIconIfNecessary:(id)a3
{
  id v3 = [a3 folder];
  SBTreeNodeSetParent(v3, 0);
}

- (void)updateGridSizeClassDomainForIconIfNecessary:(id)a3
{
  id v6 = a3;
  if ([v6 isFolderIcon])
  {
    id v4 = [v6 folder];
    id v5 = [(SBIconListModel *)self gridSizeClassDomain];
    [v4 setGridSizeClassDomain:v5];
  }
}

- (void)didAddIcon:(id)a3 options:(unint64_t)a4
{
  id v11 = a3;
  [(SBIconListModel *)self updateParentNodeForIconIfNecessary:v11];
  [(SBIconListModel *)self updateGridSizeClassDomainForIconIfNecessary:v11];
  if ([(SBIconListModel *)self isInsertionFixedForIcon:v11 options:0])
  {
    if (![(SBIconListModel *)self isIconFixed:v11])
    {
      unint64_t v6 = [(SBIconListModel *)self gridCellIndexForIcon:v11 gridCellInfoOptions:0];
      if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
        [(SBIconListModel *)self setFixedLocation:v6 forIcon:v11 options:a4 | 0x800000];
      }
    }
  }
  uint64_t v7 = [v11 gridSizeClass];
  if (v7)
  {
    id v8 = (void *)v7;
    id v9 = [v11 gridSizeClass];
    char v10 = [v9 isEqualToString:@"SBHIconGridSizeClassDefault"];

    if ((v10 & 1) == 0) {
      [(SBIconListModel *)self updateHasNonDefaultSizeClassIcons];
    }
  }
}

- (void)willRemoveIcon:(id)a3 options:(unint64_t)a4
{
  id v5 = a3;
  [(SBIconListModel *)self updateGridSizeForAddedIcon:0 removedIcon:v5];
  [(SBIconListModel *)self _notifyListObserversWillRemoveIcon:v5];
}

- (void)didRemoveIcon:(id)a3 options:(unint64_t)a4
{
  id v9 = a3;
  [(SBIconListModel *)self clearParentNodeForIconIfNecessary:v9];
  [(SBIconListModel *)self removeFixedIconLocationForIcon:v9];
  uint64_t v5 = [v9 gridSizeClass];
  if (v5)
  {
    unint64_t v6 = (void *)v5;
    uint64_t v7 = [v9 gridSizeClass];
    char v8 = [v7 isEqualToString:@"SBHIconGridSizeClassDefault"];

    if ((v8 & 1) == 0) {
      [(SBIconListModel *)self updateHasNonDefaultSizeClassIcons];
    }
  }
}

- (void)didReplaceIcon:(id)a3 withIcon:(id)a4 options:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  [(SBIconListModel *)self clearParentNodeForIconIfNecessary:v8];
  [(SBIconListModel *)self updateParentNodeForIconIfNecessary:v7];
  [(SBIconListModel *)self updateGridSizeClassDomainForIconIfNecessary:v7];
  [(SBIconListModel *)self _notifyListObserversDidReplaceIcon:v8 withIcon:v7];
}

- (BOOL)addIcon:(id)a3
{
  return [(SBIconListModel *)self addIcon:a3 options:0];
}

- (BOOL)addIcon:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(SBIconListModel *)self insertIcon:v6 atIndex:[(SBIconListModel *)self numberOfIcons] options:a4];
  LOBYTE(a4) = [(SBIconListModel *)self directlyContainsIcon:v6];

  return a4;
}

- (BOOL)addIcon:(id)a3 gridCellInfoOptions:(unint64_t)a4 mutationOptions:(unint64_t)a5
{
  return [(SBIconListModel *)self addIcon:a3 options:a5];
}

- (id)addIcons:(id)a3
{
  return [(SBIconListModel *)self addIcons:a3 options:0];
}

- (id)addIcons:(id)a3 options:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (![(SBIconListModel *)self addIcon:v12 options:a4])
        {
          if (!v9)
          {
            id v9 = [MEMORY[0x1E4F1CA48] array];
          }
          [v9 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)insertIcon:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  uint64_t v8 = [v6 arrayWithObjects:&v11 count:1];

  id v9 = -[SBIconListModel insertIcons:atIndex:options:](self, "insertIcons:atIndex:options:", v8, a4, 0, v11, v12);

  return v9;
}

- (id)insertIcon:(id)a3 atIndex:(unint64_t)a4 options:(unint64_t)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a3;
  uint64_t v10 = [v8 arrayWithObjects:&v13 count:1];

  id v11 = -[SBIconListModel insertIcons:atIndex:options:](self, "insertIcons:atIndex:options:", v10, a4, a5, v13, v14);

  return v11;
}

- (id)insertIcons:(id)a3 atIndex:(unint64_t)a4 options:(unint64_t)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = SBLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SBIconListModel insertIcons:atIndex:options:](v9);
    }

    id v10 = v8;
  }
  else
  {
    unint64_t v26 = a5;
    unint64_t v11 = [(SBIconListModel *)self numberOfIcons];
    BOOL v24 = v11 <= a4;
    if (v11 <= a4) {
      a4 = [(SBIconListModel *)self numberOfIcons];
    }
    unint64_t v25 = a4;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v27 = v8;
    id v10 = v8;
    uint64_t v12 = [v10 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v45;
      char v14 = 1;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v45 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v16 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          if (![(SBIconListModel *)self isAllowedToContainIcon:v16])
          {
            unint64_t v20 = SBLogCommon();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              -[SBIconListModel insertIcons:atIndex:options:]();
            }

            goto LABEL_24;
          }
          long long v17 = [v16 gridSizeClass];
          if (v17)
          {
            uint64_t v18 = [v16 gridSizeClass];
            char v19 = [v18 isEqualToString:@"SBHIconGridSizeClassDefault"];
          }
          else
          {
            char v19 = 1;
          }

          v14 &= v19;
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v44 objects:v48 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    else
    {
      char v14 = 1;
    }

    uint64_t v21 = [(SBIconListModel *)self folder];
    id v22 = [v21 startCoalescingContentChangesForReason:@"SBInsertIconCoalesceID"];
    uint64_t v38 = 0;
    id v39 = &v38;
    uint64_t v40 = 0x3032000000;
    uint64_t v41 = __Block_byref_object_copy__14;
    char v42 = __Block_byref_object_dispose__14;
    id v43 = 0;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __47__SBIconListModel_insertIcons_atIndex_options___block_invoke;
    v28[3] = &unk_1E6AB19A0;
    unint64_t v32 = v25;
    BOOL v34 = (v26 & 0x10000000) != 0;
    id v29 = v10;
    uint64_t v30 = self;
    char v35 = v14;
    unint64_t v33 = v26;
    id v31 = &v38;
    BOOL v36 = v24;
    BOOL v37 = v26 >> 31 == 0;
    [(SBIconListModel *)self _coalesceChangesWithRequestID:@"SBInsertIconCoalesceID" changeBlock:v28];
    [v22 invalidate];
    [(SBIconListModel *)self markIconStateDirtyWithOptions:v26];
    id v10 = (id)v39[5];

    _Block_object_dispose(&v38, 8);
LABEL_24:
    id v8 = v27;
  }

  return v10;
}

void __47__SBIconListModel_insertIcons_atIndex_options___block_invoke(uint64_t a1)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v60 = 0;
  uint64_t v61 = &v60;
  uint64_t v62 = 0x2020000000;
  char v63 = 0;
  uint64_t v56 = 0;
  uint64_t v57 = &v56;
  uint64_t v58 = 0x2020000000;
  char v59 = 0;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x2020000000;
  v55[3] = *(void *)(a1 + 56);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__SBIconListModel_insertIcons_atIndex_options___block_invoke_2;
  aBlock[3] = &unk_1E6AB1950;
  id v4 = *(id *)(a1 + 32);
  char v54 = *(unsigned char *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 40);
  id v46 = v4;
  uint64_t v47 = v5;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v50 = v55;
  uint64_t v53 = v6;
  id v7 = v3;
  id v48 = v7;
  uint64_t v51 = &v60;
  uint64_t v52 = &v56;
  id v8 = v2;
  id v49 = v8;
  id v9 = (void (**)(void))_Block_copy(aBlock);
  if (*(unsigned char *)(a1 + 73)
    && ([*(id *)(a1 + 40) rotatedLayoutClusterGridSizeClass],
        (id v10 = objc_claimAutoreleasedReturnValue()) != 0)
    && ([*(id *)(a1 + 40) rotatedLayoutClusterGridSizeClass],
        unint64_t v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v11 isEqualToString:@"SBHIconGridSizeClassDefault"],
        v11,
        v10,
        (v12 & 1) == 0))
  {
    [*(id *)(a1 + 40) performChangesByPreservingPositionsOfIconsLargerThanSizeClass:@"SBHIconGridSizeClassDefault" block:v9];
  }
  else
  {
    v9[2](v9);
  }
  uint64_t v13 = [*(id *)(a1 + 40) _updateModelByRepairingGapsIfNecessaryWithGridCellInfoOptions:0 mutationOptions:*(void *)(a1 + 64)];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v14 = v8;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v41 objects:v64 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v42 != v16) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(a1 + 40) didAddIcon:*(void *)(*((void *)&v41 + 1) + 8 * i) options:*(void *)(a1 + 64)];
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v41 objects:v64 count:16];
    }
    while (v15);
  }

  uint64_t v18 = [*(id *)(a1 + 40) _checkAndRemoveBouncedIconsAfterChangeToIcons:v14 ignoringTrailingIconCheck:*(unsigned char *)(a1 + 74) == 0 options:*(void *)(a1 + 64)];
  uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
  unint64_t v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v18;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    objc_msgSend(v14, "removeObjectsInArray:");
  }
  if ([v7 count])
  {
    uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
    id v22 = *(void **)(v21 + 40);
    if (v22)
    {
      id v23 = (void *)[v22 mutableCopy];
      [v23 addObjectsFromArray:v7];
      uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8);
      unint64_t v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v23;
    }
    else
    {
      id v26 = v7;
      unint64_t v25 = *(void **)(v21 + 40);
      *(void *)(v21 + 40) = v26;
    }
  }
  char v27 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "sbh_containsObjectInArray:", *(void *)(a1 + 32));
  if (objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "sbh_containsAllObjectsInArray:", *(void *)(a1 + 32)))
  {
    uint64_t v28 = [*(id *)(a1 + 32) count];
    BOOL v29 = v28 != [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
  }
  else
  {
    BOOL v29 = 1;
  }
  int v30 = [*(id *)(a1 + 40) allowsIndependentRotatedLayout];
  if ((v27 & 1) == 0)
  {
    int v31 = *(unsigned char *)(a1 + 75) ? v30 : 0;
    if (v31 == 1)
    {
      if (*((unsigned char *)v61 + 24))
      {
        unint64_t v32 = *(void **)(a1 + 40);
        unint64_t v33 = v40;
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __47__SBIconListModel_insertIcons_atIndex_options___block_invoke_4;
        v40[3] = &unk_1E6AB1978;
        id v34 = v14;
        uint64_t v35 = *(void *)(a1 + 64);
        void v40[4] = v34;
        v40[5] = v35;
        [v32 _updateRotatedIconsUsingBlock:v40];
LABEL_32:

        goto LABEL_35;
      }
      if (*((unsigned char *)v57 + 24))
      {
        BOOL v36 = *(void **)(a1 + 40);
        unint64_t v33 = v39;
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __47__SBIconListModel_insertIcons_atIndex_options___block_invoke_5;
        v39[3] = &unk_1E6AB1978;
        id v37 = v14;
        uint64_t v38 = *(void *)(a1 + 64);
        v39[4] = v37;
        v39[5] = v38;
        [v36 _updateRotatedIconsUsingBlock:v39];
        goto LABEL_32;
      }
    }
  }
  if ((v29 | v30 ^ 1) == 1) {
    [*(id *)(a1 + 40) _invalidateLayoutWithGridCellInfoOptions:0 mutationOptions:*(void *)(a1 + 64)];
  }
LABEL_35:
  [*(id *)(a1 + 40) _notifyListObserversDidAddIcons:v14 didRemoveIcons:0 movedIcons:v13];

  _Block_object_dispose(v55, 8);
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v60, 8);
}

void __47__SBIconListModel_insertIcons_atIndex_options___block_invoke_2(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__SBIconListModel_insertIcons_atIndex_options___block_invoke_3;
  v5[3] = &unk_1E6AB1928;
  char v11 = *(unsigned char *)(a1 + 96);
  uint64_t v2 = *(void *)(a1 + 64);
  id v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 48);
  v5[4] = *(void *)(a1 + 40);
  uint64_t v8 = v2;
  uint64_t v10 = *(void *)(a1 + 88);
  id v6 = v4;
  long long v9 = *(_OWORD *)(a1 + 72);
  id v7 = *(id *)(a1 + 56);
  [v3 enumerateObjectsUsingBlock:v5];
}

void __47__SBIconListModel_insertIcons_atIndex_options___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v12 = v5;
  if (*(unsigned char *)(a1 + 88))
  {
    id v6 = v5;
    unint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 32) willAddIcon:v5 atIndex:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) gridCellInfoOptions:0 mutationOptions:*(void *)(a1 + 80)];
    id v6 = v12;
    unint64_t v7 = v8;
  }
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [*(id *)(a1 + 40) addObject:v6];
  }
  else
  {
    if (*(unsigned char *)(a1 + 80))
    {
      while (v7 < [*(id *)(a1 + 32) numberOfIcons])
      {
        uint64_t v10 = *(id **)(a1 + 32);
        char v11 = [v10[1] nodeAtIndex:v7];
        LOBYTE(v10) = [v10 canBounceIcon:v11];

        if (v10) {
          break;
        }
        ++v7;
      }
    }
    if (!a3) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v7 == 0;
    }
    unint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 8) count];
    if (v7 >= v9)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
      unint64_t v7 = v9;
    }
    [*(id *)(*(void *)(a1 + 32) + 8) insertNode:v12 atIndex:v7];
    [*(id *)(a1 + 48) addObject:v12];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v7 + 1;
  }
}

id __47__SBIconListModel_insertIcons_atIndex_options___block_invoke_4(uint64_t a1, void *a2)
{
  return (id)[a2 insertIcons:*(void *)(a1 + 32) atIndex:0 options:*(void *)(a1 + 40) | 0x20000000];
}

id __47__SBIconListModel_insertIcons_atIndex_options___block_invoke_5(uint64_t a1, void *a2)
{
  return (id)[a2 addIcons:*(void *)(a1 + 32) options:*(void *)(a1 + 40) | 0x20000000];
}

- (id)insertIconWhilePreservingQuads:(id)a3 toGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  char v11 = [(SBIconListModel *)self _targetListForGridCellInfoOptions:a5];
  id v12 = v11;
  if (v11 == self)
  {
    if ([(SBIconListModel *)self isAllowedToContainIcon:v10])
    {
      id v14 = [v10 gridSizeClass];
      SBHIconGridSize v19 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeForGridSizeClass:v14 gridCellInfoOptions:a5];
      uint64_t v15 = [(SBIconListModel *)self rotatedLayoutClusterGridSizeClass];
      SBHIconGridSize v16 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeForGridSizeClass:v15 gridCellInfoOptions:a5];
      uint64_t v21 = [(SBIconListModel *)self folder];
      unint64_t v20 = [v21 startCoalescingContentChangesForReason:@"SBInsertIconCoalesceID"];
      uint64_t v31 = 0;
      unint64_t v32 = &v31;
      uint64_t v33 = 0x3032000000;
      id v34 = __Block_byref_object_copy__14;
      uint64_t v35 = __Block_byref_object_dispose__14;
      id v36 = 0;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __102__SBIconListModel_insertIconWhilePreservingQuads_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke;
      v22[3] = &unk_1E6AB1A18;
      void v22[4] = self;
      unint64_t v27 = a6;
      unint64_t v28 = a4;
      id v23 = v10;
      uint64_t v24 = v15;
      SBHIconGridSize v29 = v19;
      SBHIconGridSize v30 = v16;
      unint64_t v25 = &v31;
      unint64_t v26 = a5;
      [(SBIconListModel *)self _coalesceChangesWithRequestID:@"SBInsertIconCoalesceID" changeBlock:v22];
      [v20 invalidate];
      [(SBIconListModel *)self _invalidateLayoutWithGridCellInfoOptions:a5 mutationOptions:a6];
      [(SBIconListModel *)self markIconStateDirtyWithOptions:a6];
      id v13 = (id)v32[5];

      _Block_object_dispose(&v31, 8);
    }
    else
    {
      long long v17 = SBLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[SBIconListModel insertIconWhilePreservingQuads:toGridCellIndex:gridCellInfoOptions:mutationOptions:]();
      }

      v37[0] = v10;
      id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
    }
  }
  else
  {
    id v13 = [(SBIconListModel *)v11 insertIconWhilePreservingQuads:v10 toGridCellIndex:a4 gridCellInfoOptions:a5 mutationOptions:a6];
    [(SBIconListModel *)self _invalidateLayoutWithGridCellInfoOptions:a5 mutationOptions:a6];
    [(SBIconListModel *)self markIconStateDirtyWithOptions:a6];
  }

  return v13;
}

void __102__SBIconListModel_insertIconWhilePreservingQuads_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke(uint64_t a1)
{
  v37[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) willAddIcon:*(void *)(a1 + 40) atIndex:0 gridCellInfoOptions:*(void *)(a1 + 64) mutationOptions:*(void *)(a1 + 72)];
  uint64_t v2 = *(void *)(a1 + 80);
  uint64_t v3 = *(unsigned int *)(a1 + 88);
  id v4 = [*(id *)(a1 + 32) gridCellInfoWithOptions:*(void *)(a1 + 64)];
  if ((objc_msgSend(*(id *)(a1 + 32), "isValidGridRange:gridCellInfo:", v2, v3, v4) & 1) == 0)
  {
    uint64_t v5 = [*(id *)(a1 + 32) bestGridCellIndexForInsertingIcon:*(void *)(a1 + 40) gridCellInfo:v4];
    if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v2 = 0;
    }
    else {
      uint64_t v2 = v5;
    }
  }
  id v6 = [*(id *)(a1 + 32) iconAtGridCellIndex:v2 gridCellInfoOptions:*(void *)(a1 + 64)];
  uint64_t v7 = [*(id *)(a1 + 32) coordinateForGridCellIndex:v2 gridCellInfoOptions:*(void *)(a1 + 64)];
  uint64_t v9 = v8;
  id v10 = *(void **)(a1 + 32);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __102__SBIconListModel_insertIconWhilePreservingQuads_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke_2;
  v25[3] = &unk_1E6AB19F0;
  uint64_t v11 = *(void *)(a1 + 64);
  void v25[4] = v10;
  uint64_t v29 = v11;
  uint64_t v30 = v2;
  int v34 = *(_DWORD *)(a1 + 88);
  int8x16_t v24 = *(int8x16_t *)(a1 + 40);
  id v12 = (id)v24.i64[0];
  int8x16_t v26 = vextq_s8(v24, v24, 8uLL);
  id v13 = v6;
  int v35 = *(_DWORD *)(a1 + 92);
  uint64_t v31 = v7;
  uint64_t v32 = v9;
  uint64_t v14 = *(void *)(a1 + 56);
  id v27 = v13;
  uint64_t v28 = v14;
  uint64_t v33 = *(void *)(a1 + 72);
  [v10 performChangesByPreservingOrderOfDefaultSizedIcons:v25];
  if ((*(void *)(a1 + 72) & 1) == 0)
  {
    uint64_t v15 = objc_msgSend(*(id *)(a1 + 32), "_updateModelByRepairingGapsIfNecessaryWithGridCellInfoOptions:mutationOptions:", *(void *)(a1 + 64));
    [*(id *)(a1 + 32) didAddIcon:*(void *)(a1 + 40) options:*(void *)(a1 + 72)];
    SBHIconGridSize v16 = *(void **)(a1 + 32);
    v37[0] = *(void *)(a1 + 40);
    long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
    uint64_t v18 = [v16 _checkAndRemoveBouncedIconsAfterChangeToIcons:v17 ignoringTrailingIconCheck:0 options:*(void *)(a1 + 72)];
    uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
    unint64_t v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    int v21 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) containsObject:*(void *)(a1 + 40)];
    id v22 = *(void **)(a1 + 32);
    if (v21)
    {
      [*(id *)(a1 + 32) _notifyListObserversDidAddIcons:0 didRemoveIcons:0 movedIcons:v15];
    }
    else
    {
      uint64_t v36 = *(void *)(a1 + 40);
      id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
      [v22 _notifyListObserversDidAddIcons:v23 didRemoveIcons:0 movedIcons:v15];
    }
  }
}

void __102__SBIconListModel_insertIconWhilePreservingQuads_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke_2(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __102__SBIconListModel_insertIconWhilePreservingQuads_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke_3;
  v35[3] = &unk_1E6AB19C8;
  v35[4] = v2;
  long long v39 = *(_OWORD *)(a1 + 72);
  int v41 = *(_DWORD *)(a1 + 112);
  id v36 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 56);
  int v42 = *(_DWORD *)(a1 + 116);
  long long v40 = *(_OWORD *)(a1 + 88);
  uint64_t v5 = *(void *)(a1 + 64);
  id v37 = v4;
  uint64_t v38 = v5;
  [v2 performChangesByClusteringForSizeClass:v3 behavior:2 withGridCellInfoOptions:(void)v39 block:v35];
  while ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count])
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    obuint64_t j = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    uint64_t v7 = [obj countByEnumeratingWithState:&v31 objects:v44 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v32;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v32 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v31 + 1) + 8 * v10);
          uint64_t v12 = [v11 gridSizeClass];
          if (!v12
            || (id v13 = (void *)v12,
                [v11 gridSizeClass],
                uint64_t v14 = objc_claimAutoreleasedReturnValue(),
                int v15 = [v14 isEqualToString:@"SBHIconGridSizeClassDefault"],
                v14,
                v13,
                v15)
            || (uint64_t v16 = [*(id *)(a1 + 32) bestGridCellIndexForInsertingIcon:v11 gridCellInfoOptions:*(void *)(a1 + 72)], v16 == 0x7FFFFFFFFFFFFFFFLL)|| v16 == *(void *)(a1 + 80))
          {
            [*(id *)(*(void *)(a1 + 32) + 8) addNode:v11];
          }
          else
          {
            long long v17 = [*(id *)(a1 + 32) insertIconWhilePreservingQuads:v11 toGridCellIndex:v16 gridCellInfoOptions:*(void *)(a1 + 72) mutationOptions:*(void *)(a1 + 104) | 1];
            long long v27 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v43 count:16];
            if (v18)
            {
              uint64_t v19 = v18;
              uint64_t v20 = *(void *)v28;
              do
              {
                for (uint64_t i = 0; i != v19; ++i)
                {
                  if (*(void *)v28 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  uint64_t v22 = *(void *)(*((void *)&v27 + 1) + 8 * i);
                  if (([v6 containsObject:v22] & 1) == 0) {
                    [v6 addObject:v22];
                  }
                }
                uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v43 count:16];
              }
              while (v19);
            }
          }
          ++v10;
        }
        while (v10 != v8);
        uint64_t v23 = [obj countByEnumeratingWithState:&v31 objects:v44 count:16];
        uint64_t v8 = v23;
      }
      while (v23);
    }

    uint64_t v24 = *(void *)(*(void *)(a1 + 64) + 8);
    unint64_t v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v6;
  }
}

void __102__SBIconListModel_insertIconWhilePreservingQuads_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke_3(uint64_t a1)
{
  v51[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) gridCellInfoWithOptions:*(void *)(a1 + 64)];
  uint64_t v3 = [v2 iconIndexForGridCellIndex:*(void *)(a1 + 72)];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) iconAtIndex:v3];
  }
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "iconsForGridRange:gridCellInfo:", *(void *)(a1 + 72), *(unsigned int *)(a1 + 96), v2);
  if ((unint64_t)[v5 count] < 2)
  {
    if ([v4 isPlaceholder]
      && *(void *)(a1 + 48)
      && (objc_msgSend(v4, "referencesIcon:") & 1) == 0)
    {
      NSLog(&cfstr_TheClusterDoes.isa);
    }
    if ([v4 isPlaceholder]
      && (!*(void *)(a1 + 48) || objc_msgSend(v4, "referencesIcon:")))
    {
      id v7 = v4;
      uint64_t v8 = [*(id *)(a1 + 32) gridSizeClassSizesWithOptions:*(void *)(a1 + 64)];
      uint64_t v9 = [[SBIconListModel alloc] initWithUniqueIdentifier:@"InsertWithQuads" folder:0 gridSize:*(unsigned int *)(a1 + 100) gridSizeClassSizes:v8];
      uint64_t v10 = [*(id *)(a1 + 32) gridSizeClassDomain];
      [(SBIconListModel *)v9 setGridSizeClassDomain:v10];

      uint64_t v11 = [v7 referencedIcons];
      id v12 = [(SBIconListModel *)v9 addIcons:v11];

      id v13 = v9;
      uint64_t v14 = [(SBIconListModel *)v9 numberOfIcons];
      if (*(void *)(a1 + 48)) {
        uint64_t v14 = -[SBIconListModel indexForIcon:](v9, "indexForIcon:");
      }
      uint64_t v15 = v14;
      uint64_t v16 = objc_msgSend(v2, "coordinateForGridCellIndex:", objc_msgSend(v2, "gridCellIndexForIconIndex:", v3));
      uint64_t v18 = -[SBIconListModel gridCellIndexForCoordinate:gridCellInfoOptions:](v13, "gridCellIndexForCoordinate:gridCellInfoOptions:", *(void *)(a1 + 80) - v16 + 1, *(void *)(a1 + 88) - v17 + 1, 0);
      uint64_t v19 = [(SBIconListModel *)v13 insertIcon:*(void *)(a1 + 40) atIndex:v15];
      uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
      int v21 = *(void **)(v20 + 40);
      *(void *)(v20 + 40) = v19;

      if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count]
        && objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "bs_containsObjectPassingTest:", &__block_literal_global_40)&& -[SBIconListModel directlyContainsIconPassingTest:](v13, "directlyContainsIconPassingTest:", &__block_literal_global_42_0))
      {
        uint64_t v45 = v18;
        id v46 = v8;
        id v47 = v7;
        uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __102__SBIconListModel_insertIconWhilePreservingQuads_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke_6;
        v49[3] = &unk_1E6AAD1C0;
        id v23 = v22;
        id v50 = v23;
        [(SBIconListModel *)v13 enumerateIconsWithOptions:2 usingBlock:v49];
        id v48 = v13;
        icons = v13->_icons;
        unint64_t v25 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        int8x16_t v26 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", -[SBIconListModel numberOfIcons](v48, "numberOfIcons"), objc_msgSend(v25, "count"));
        [(SBIconIndexMutableList *)icons insertNodes:v25 atIndexes:v26];

        long long v44 = v23;
        long long v27 = [v23 lastObject];
        uint64_t v28 = [(SBIconListModel *)v48 indexForIcon:v27];

        p_isa = (id *)&v48->super.isa;
        if (v28 + 1 >= [(SBIconListModel *)v48 numberOfIcons]) {
          goto LABEL_25;
        }
        while (1)
        {
          uint64_t v30 = v28 + 1;
          long long v31 = [p_isa iconAtIndex:v28 + 1];
          uint64_t v32 = [v31 gridSizeClass];
          if (!v32) {
            break;
          }
          long long v33 = (void *)v32;
          long long v34 = [v31 gridSizeClass];
          char v35 = [v34 isEqualToString:@"SBHIconGridSizeClassDefault"];

          if (v35) {
            break;
          }

          p_isa = (id *)&v48->super.isa;
          unint64_t v36 = [(SBIconListModel *)v48 numberOfIcons];
          unint64_t v37 = v28 + 2;
          ++v28;
          if (v37 >= v36) {
            goto LABEL_25;
          }
        }

        p_isa = (id *)&v48->super.isa;
        if (v28 == 0x7FFFFFFFFFFFFFFELL) {
LABEL_25:
        }
          uint64_t v30 = [p_isa numberOfIcons];
        [p_isa[1] moveNodes:v44 toContiguousIndicesStartingAt:v30];
        v51[0] = *(void *)(a1 + 40);
        uint64_t v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
        uint64_t v39 = [(SBIconListModel *)v48 _checkAndRemoveBouncedIconsAfterChangeToIcons:v38 ignoringTrailingIconCheck:0 options:0];
        uint64_t v40 = *(void *)(*(void *)(a1 + 56) + 8);
        int v41 = *(void **)(v40 + 40);
        *(void *)(v40 + 40) = v39;

        id v13 = v48;
        if (v45 != [(SBIconListModel *)v48 gridCellIndexForIcon:*(void *)(a1 + 40) gridCellInfoOptions:0])id v42 = [(SBIconListModel *)v48 moveContainedIcon:*(void *)(a1 + 40) toGridCellIndex:v45 gridCellInfoOptions:0 mutationOptions:0]; {

        }
        uint64_t v8 = v46;
        id v7 = v47;
      }
      long long v43 = [(SBIconListModel *)v13 icons];
      [v7 updateReferencedIcons:v43];
    }
    else
    {
      [*(id *)(*(void *)(a1 + 32) + 8) addNode:*(void *)(a1 + 40)];
    }
  }
  else
  {
    id v6 = [v5 firstObject];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "replaceNodeAtIndex:withNode:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "indexOfNode:", v6), *(void *)(a1 + 40));
    [*(id *)(*(void *)(a1 + 32) + 8) removeNodesInArray:v5];
  }
}

uint64_t __102__SBIconListModel_insertIconWhilePreservingQuads_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 gridSizeClass];
  if (v3)
  {
    id v4 = [v2 gridSizeClass];
    uint64_t v5 = [v4 isEqualToString:@"SBHIconGridSizeClassDefault"] ^ 1;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __102__SBIconListModel_insertIconWhilePreservingQuads_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 gridSizeClass];
  if (v3)
  {
    id v4 = [v2 gridSizeClass];
    uint64_t v5 = [v4 isEqualToString:@"SBHIconGridSizeClassDefault"];
  }
  else
  {
    uint64_t v5 = 1;
  }

  return v5;
}

void __102__SBIconListModel_insertIconWhilePreservingQuads_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  uint64_t v6 = [v10 gridSizeClass];
  if (v6
    && (id v7 = (void *)v6,
        [v10 gridSizeClass],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 isEqualToString:@"SBHIconGridSizeClassDefault"],
        v8,
        v7,
        !v9))
  {
    if ([*(id *)(a1 + 32) count]) {
      *a4 = 1;
    }
  }
  else
  {
    [*(id *)(a1 + 32) insertObject:v10 atIndex:0];
  }
}

- (id)insertIcon:(id)a3 beforeIcon:(id)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  return [(SBIconListModel *)self insertIcon:a3 relativeToIcon:a4 positionDelta:-1 gridCellInfoOptions:a5 mutationOptions:a6];
}

- (id)insertIcon:(id)a3 afterIcon:(id)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  return [(SBIconListModel *)self insertIcon:a3 relativeToIcon:a4 positionDelta:1 gridCellInfoOptions:a5 mutationOptions:a6];
}

- (id)insertIcon:(id)a3 relativeToIcon:(id)a4 positionDelta:(int64_t)a5 gridCellInfoOptions:(unint64_t)a6 mutationOptions:(unint64_t)a7
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  if ([(SBIconListModel *)self isAllowedToContainIcon:v12])
  {
    id v14 = 0;
    if (v12 != v13 && a5)
    {
      uint64_t v15 = [(SBIconListModel *)self _targetListForGridCellInfoOptions:a6];
      BOOL v16 = [(SBIconListModel *)self directlyContainsIcon:v12];
      uint64_t v17 = [v15 gridCellIndexForInsertingIcon:v12 relativeToIcon:v13 positionDelta:a5 gridCellInfoOptions:a6 mutationOptions:a7];
      if (v17 == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v28 = v12;
        id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
      }
      else
      {
        uint64_t v18 = v17;
        if (v16)
        {
          id v19 = (id)[v15 moveContainedIcon:v12 toGridCellIndex:v17 gridCellInfoOptions:a6 mutationOptions:a7];
          id v14 = 0;
        }
        else
        {
          uint64_t v20 = [(SBIconListModel *)self _otherListForGridCellInfoOptions:a6];
          if (v20 == v15)
          {

            uint64_t v20 = 0;
          }
          int v21 = [v15 insertIcon:v12 atGridCellIndex:v18 gridCellInfoOptions:a6 mutationOptions:a7 | 0xFFFFFFFFC0000000];
          uint64_t v22 = v21;
          if (v21) {
            id v23 = (id)[v21 mutableCopy];
          }
          else {
            id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          uint64_t v24 = v23;
          if (v20)
          {
            [v20 removeIcons:v22 options:a7 | 0xFFFFFFFFC0000000];
            if ([v20 directlyContainsIcon:v13])
            {
              uint64_t v25 = objc_msgSend(v20, "insertIcon:atGridCellIndex:gridCellInfoOptions:mutationOptions:", v12, objc_msgSend(v20, "gridCellIndexForInsertingIcon:relativeToIcon:positionDelta:gridCellInfoOptions:mutationOptions:", v12, v13, a5, 0, a7 | 0xFFFFFFFFC4000000), 0, a7 | 0xFFFFFFFFC4000000);
              if (v25)
              {
                int8x16_t v26 = (void *)v25;
                [v15 removeIcons:v25];
                [v24 addObjectsFromArray:v26];
              }
            }
            else
            {
              [v20 addIcon:v12 options:a7 | 0xFFFFFFFFC0000000];
            }
          }
          if ([v24 count]) {
            id v14 = v24;
          }
          else {
            id v14 = 0;
          }
        }
      }
    }
  }
  else
  {
    v29[0] = v12;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  }

  return v14;
}

- (unint64_t)indexForInsertingIcon:(id)a3 relativeToIcon:(id)a4 positionDelta:(int64_t)a5
{
  unint64_t v7 = [(SBIconListModel *)self indexForIcon:a4];
  if (a5 >= 0) {
    unint64_t v8 = a5;
  }
  else {
    unint64_t v8 = -a5;
  }
  if (a5 < 0)
  {
    BOOL v11 = v7 >= v8;
    unint64_t v12 = v7 - v8;
    if (v11) {
      return v12;
    }
    else {
      return 0;
    }
  }
  else
  {
    unint64_t v9 = v7 + v8;
    unint64_t result = [(SBIconListModel *)self numberOfIcons];
    if (v9 < result) {
      return v9;
    }
  }
  return result;
}

- (unint64_t)gridCellIndexForInsertingIcon:(id)a3 relativeToIcon:(id)a4 positionDelta:(int64_t)a5 gridCellInfoOptions:(unint64_t)a6 mutationOptions:(unint64_t)a7
{
  v63[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v41 = a4;
  unint64_t v47 = a6;
  id v40 = [(SBIconListModel *)self gridCellInfoWithOptions:a6];
  uint64_t v39 = [v11 gridSizeClass];
  uint64_t v38 = [v41 gridSizeClass];
  uint64_t v45 = self;
  unsigned int v44 = [v40 gridSize];
  SBHIconGridSize v12 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeForGridSizeClass:v39 gridCellInfoOptions:a6];
  unint64_t v13 = (unint64_t)[(SBIconListModel *)self gridSizeForGridSizeClass:v38 gridCellInfoOptions:a6];
  unint64_t v46 = [(SBIconListModel *)self maxNumberOfIcons];
  if (a5 >= 0) {
    int64_t v14 = a5;
  }
  else {
    int64_t v14 = -a5;
  }
  unint64_t v50 = v14;
  uint64_t v15 = [(SBIconListModel *)self gridRangeForIcon:v11 gridCellInfo:v40];
  id v16 = v40;
  uint64_t v17 = self;
  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v63[0] = v11;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:1];
    uint64_t v19 = [(SBIconListModel *)self iconGridCellInfoBySimulatingRemovalOfIcons:v18 ignoringPlaceholders:0 gridCellInfoOptions:v47 iconOrder:0];

    id v16 = (id)v19;
  }
  uint64_t v51 = v16;
  uint64_t v37 = -[SBIconListModel gridCellIndexForIcon:gridCellInfo:](v45, "gridCellIndexForIcon:gridCellInfo:", v41);
  uint64_t v35 = v13;
  uint64_t v49 = v12;
  uint64_t v20 = v44;
  unint64_t v21 = v37;
  while (1)
  {
    uint64_t v22 = v20;
    unint64_t v23 = v21;
    if ((a5 & 0x8000000000000000) == 0 || v21 < v50)
    {
      unint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
      if (a5 < 0 || v50 + v21 >= v46) {
        break;
      }
    }
    v21 += a5;
    uint64_t v20 = v22;
    if (v21 == -[SBIconListModel bestGridCellIndexForInsertingIcon:atGridCellIndex:gridCellInfo:](v17, "bestGridCellIndexForInsertingIcon:atGridCellIndex:gridCellInfo:", v11, v23 + a5, v51, v35)&& -[SBIconListModel isValidGridRange:options:](v17, "isValidGridRange:options:", v23 + a5, v49, v47))
    {
      uint64_t v58 = 0;
      char v59 = &v58;
      uint64_t v60 = 0x2020000000;
      char v61 = 1;
      uint64_t v25 = -[SBIconListModel iconsForGridRange:gridCellInfo:](v17, "iconsForGridRange:gridCellInfo:", v23 + a5, v49, v51);
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      obuint64_t j = v25;
      uint64_t v26 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
      if (v26)
      {
        uint64_t v43 = *(void *)v55;
        id v36 = v11;
        while (2)
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v55 != v43) {
              objc_enumerationMutation(obj);
            }
            unint64_t v28 = [(SBIconListModel *)v17 gridRangeForIcon:*(void *)(*((void *)&v54 + 1) + 8 * i) gridCellInfo:v51];
            uint64_t v30 = v29;
            unint64_t v48 = v48 & 0xFFFFFFFF00000000 | v22;
            uint64_t v31 = SBHIconGridRangeIntersection(v28, v29, v23 + a5, v49, v22);
            v52[0] = MEMORY[0x1E4F143A8];
            v52[1] = 3221225472;
            v52[2] = __114__SBIconListModel_gridCellIndexForInsertingIcon_relativeToIcon_positionDelta_gridCellInfoOptions_mutationOptions___block_invoke;
            v52[3] = &unk_1E6AB1A40;
            v52[5] = v28;
            v52[6] = v30;
            unsigned int v53 = v44;
            v52[4] = &v58;
            unint64_t v13 = v13 & 0xFFFFFFFF00000000 | v22;
            SBHIconGridRangeEnumerateCellIndexes(v31, v32, v13, v52);
            if (!*((unsigned char *)v59 + 24))
            {
              id v11 = v36;
              uint64_t v20 = v22;
              uint64_t v17 = v45;
              goto LABEL_23;
            }
            uint64_t v17 = v45;
          }
          uint64_t v20 = v22;
          uint64_t v26 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
          id v11 = v36;
          if (v26) {
            continue;
          }
          break;
        }
      }
LABEL_23:

      BOOL v33 = *((unsigned char *)v59 + 24) == 0;
      unint64_t v21 = a5 + v23;
      _Block_object_dispose(&v58, 8);
      if (!v33)
      {
        unint64_t v24 = a5 + v23;
        break;
      }
    }
  }
  if (v24 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ((a5 & 0x8000000000000000) == 0 || v37) {
      unint64_t v24 = -[SBIconListModel firstGridCellIndexOfRangeOfGridSizeClass:withoutIconsNearGridRange:gridCellInfo:](v17, "firstGridCellIndexOfRangeOfGridSizeClass:withoutIconsNearGridRange:gridCellInfo:", v39, v37, v35, v51, v35);
    }
    else {
      unint64_t v24 = 0;
    }
  }

  return v24;
}

unint64_t __114__SBIconListModel_gridCellIndexForInsertingIcon_relativeToIcon_positionDelta_gridCellInfoOptions_mutationOptions___block_invoke(uint64_t a1, unint64_t a2, unsigned char *a3)
{
  unint64_t result = SBHIconGridRangeRowForCellIndex(*(void *)(a1 + 40), *(void *)(a1 + 48), a2, *(_DWORD *)(a1 + 56));
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 maintainingPositionBeforeIcon:(id)a4 ignoringPlaceholders:(BOOL)a5 gridCellInfoOptions:(unint64_t)a6 mutationOptions:(unint64_t)a7
{
  return [(SBIconListModel *)self bestGridCellIndexForInsertingIcon:a3 maintainingPositionRelativeToIcon:a4 before:1 ignoringPlaceholders:a5 gridCellInfoOptions:a6 mutationOptions:a7];
}

- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 maintainingPositionAfterIcon:(id)a4 ignoringPlaceholders:(BOOL)a5 gridCellInfoOptions:(unint64_t)a6 mutationOptions:(unint64_t)a7
{
  return [(SBIconListModel *)self bestGridCellIndexForInsertingIcon:a3 maintainingPositionRelativeToIcon:a4 before:0 ignoringPlaceholders:a5 gridCellInfoOptions:a6 mutationOptions:a7];
}

- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 maintainingPositionRelativeToIcon:(id)a4 before:(BOOL)a5 ignoringPlaceholders:(BOOL)a6 gridCellInfoOptions:(unint64_t)a7 mutationOptions:(unint64_t)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  id v49 = a3;
  id v13 = a4;
  if (v9)
  {
    int64_t v14 = [(SBIconListModel *)self indexesForIconsPassingTest:&__block_literal_global_46];
    if ([v14 count])
    {
      uint64_t v15 = (void *)[(SBIconListModel *)self copy];
      [v15 removeIconsAtIndexes:v14 options:0];
      unint64_t v16 = [v15 bestGridCellIndexForInsertingIcon:v49 maintainingPositionRelativeToIcon:v13 before:v10 ignoringPlaceholders:0 gridCellInfoOptions:a7 mutationOptions:a8];

      goto LABEL_30;
    }
  }
  unint64_t v17 = [(SBIconListModel *)self indexForIcon:v13];
  int64_t v14 = [(SBIconListModel *)self gridCellInfoWithOptions:a7];
  uint64_t v18 = [v14 gridCellIndexForIconIndex:v17];
  unint64_t v19 = v18;
  if (!v10 || v18)
  {
    unint64_t v46 = a7;
    uint64_t v20 = [v49 uniqueIdentifier];
    unint64_t v21 = [v13 uniqueIdentifier];
    SBHIconGridSize v22 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeForIcon:v49];
    SBHIconGridSize v23 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeForIcon:v13];
    unint64_t v24 = self;
    int v25 = [v14 gridSize];
    unsigned int Area = SBHIconGridSizeGetArea(v25);
    uint64_t v26 = -1;
    if (!v10) {
      uint64_t v26 = 1;
    }
    uint64_t v45 = v26;
    unint64_t v47 = v24;
    if (!v10)
    {
      uint64_t v27 = [(SBIconListModel *)v24 indexForIcon:v49];
      unint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
      if (v27 != 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v28 = objc_msgSend(v14, "gridCellIndexForIconIndex:");
      }
      if (v28 == 0x7FFFFFFFFFFFFFFFLL || v28 > v19) {
        ++v19;
      }
    }
    id v43 = v13;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __151__SBIconListModel_bestGridCellIndexForInsertingIcon_maintainingPositionRelativeToIcon_before_ignoringPlaceholders_gridCellInfoOptions_mutationOptions___block_invoke_2;
    aBlock[3] = &unk_1E6AB1A68;
    id v42 = v20;
    id v51 = v42;
    id v41 = v21;
    id v52 = v41;
    SBHIconGridSize v53 = v22;
    SBHIconGridSize v54 = v23;
    int v55 = v25;
    BOOL v56 = v10;
    uint64_t v30 = (uint64_t (**)(void *, SBIconListModel *, void *, uint64_t))_Block_copy(aBlock);
    unint64_t v16 = v30[2](v30, v24, v14, 1);
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v31 = v24;
      unsigned __int8 v32 = 0;
      do
      {
        unint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
        if (((v19 == 0) & v32) != 0 || v19 >= Area) {
          break;
        }
        uint64_t v33 = -[SBIconListModel bestGridCellIndexForInsertingIcon:atGridCellIndex:gridCellInfo:](v31, "bestGridCellIndexForInsertingIcon:atGridCellIndex:gridCellInfo:", v49, v19, v14, v41, v42);
        long long v34 = (SBIconListModel *)[(SBIconListModel *)v31 copy];
        id v35 = [(SBIconListModel *)v34 insertIcon:v49 atGridCellIndex:v33 gridCellInfoOptions:v46 mutationOptions:a8];
        id v36 = [(SBIconListModel *)v34 gridCellInfoWithOptions:v46];
        uint64_t v37 = v30[2](v30, v34, v36, 0);
        unint64_t v16 = v37;
        unint64_t v38 = v19 + v45;
        if (!v19) {
          unint64_t v38 = 0;
        }
        unint64_t v39 = v37 == 0x7FFFFFFFFFFFFFFFLL ? v38 : v19;

        if (!v19) {
          break;
        }
        v32 |= v19 == 0;
        unint64_t v19 = v39;
        uint64_t v31 = v47;
      }
      while (v16 == 0x7FFFFFFFFFFFFFFFLL);
    }

    id v13 = v43;
  }
  else
  {
    unint64_t v16 = 0;
  }
LABEL_30:

  return v16;
}

uint64_t __151__SBIconListModel_bestGridCellIndexForInsertingIcon_maintainingPositionRelativeToIcon_before_ignoringPlaceholders_gridCellInfoOptions_mutationOptions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPlaceholder];
}

uint64_t __151__SBIconListModel_bestGridCellIndexForInsertingIcon_maintainingPositionRelativeToIcon_before_ignoringPlaceholders_gridCellInfoOptions_mutationOptions___block_invoke_2(uint64_t a1, void *a2, void *a3, int a4)
{
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = a3;
  id v9 = a2;
  unint64_t v10 = [v9 gridCellIndexForIconWithIdentifier:v7 gridCellInfo:v8];
  unint64_t v11 = [v9 gridCellIndexForIconWithIdentifier:*(void *)(a1 + 40) gridCellInfo:v8];

  uint64_t v12 = SBHIconGridDistanceBetweenGridRanges(v10, *(_DWORD *)(a1 + 48), v11, *(_DWORD *)(a1 + 52), *(_DWORD *)(a1 + 56));
  if (*(unsigned char *)(a1 + 60))
  {
    if (a4)
    {
      if (!v13 && (v12 & 0x8000000000000000) == 0 && v12 <= (unint64_t)*(unsigned __int16 *)(a1 + 50)) {
        return v10;
      }
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v13 <= 0 && (v13 || v12 < 0)) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else if (a4)
  {
    if (v13 || v12 > 0 || v12 < -(uint64_t)*(unsigned __int16 *)(a1 + 50)) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else if ((v13 & 0x8000000000000000) == 0 && (v13 || v12 >= 1))
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v10;
}

- (id)prependIcon:(id)a3 options:(unint64_t)a4
{
  return [(SBIconListModel *)self insertIcon:a3 atIndex:0 options:a4];
}

- (id)replaceIcon:(id)a3 withIcon:(id)a4 options:(unint64_t)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a4;
  id v10 = a3;
  unint64_t v11 = [v8 arrayWithObjects:&v14 count:1];

  uint64_t v12 = -[SBIconListModel replaceIcon:withIcons:options:](self, "replaceIcon:withIcons:options:", v10, v11, a5, v14, v15);

  return v12;
}

- (id)replaceIconAtIndex:(unint64_t)a3 withIcon:(id)a4 options:(unint64_t)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = [(SBIconListModel *)self iconAtIndex:a3];
  v13[0] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

  unint64_t v11 = [(SBIconListModel *)self replaceIcon:v9 withIcons:v10 options:a5];

  return v11;
}

- (id)replaceIconAtGridCellIndex:(unint64_t)a3 withIcon:(id)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  id v10 = a4;
  unint64_t v11 = [(SBIconListModel *)self iconAtGridCellIndex:a3 gridCellInfoOptions:a5];
  if (v11) {
    [(SBIconListModel *)self replaceIcon:v11 withIcon:v10 gridCellInfoOptions:a5 mutationOptions:a6];
  }
  else {
  uint64_t v12 = [(SBIconListModel *)self insertIcon:v10 atGridCellIndex:a3 gridCellInfoOptions:a5 mutationOptions:a6];
  }

  return v12;
}

- (id)replaceIcon:(id)a3 withIcons:(id)a4 options:(unint64_t)a5
{
  return [(SBIconListModel *)self replaceIcon:a3 withIcons:a4 gridCellInfoOptions:0 mutationOptions:a5];
}

- (id)replaceIcon:(id)a3 withIcons:(id)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  if (![v12 count])
  {
    [(SBIconListModel *)self removeIcon:v11 options:a6];
    id v37 = 0;
    goto LABEL_58;
  }
  if (![(SBIconListModel *)self isAllowedToContainIcons:v12])
  {
    id v37 = v12;
    goto LABEL_58;
  }
  uint64_t v13 = NSStringFromSelector(a2);
  unsigned int v44 = [(SBIconListModel *)self startCoalescingContentChangesForReason:v13];

  unint64_t v52 = a5 & 0xFFFFFFFFFFFFFFFDLL;
  unint64_t v46 = -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:");
  uint64_t v48 = objc_msgSend(v46, "gridCellIndexForIconIndex:", -[SBIconIndexMutableList indexOfNode:](self->_icons, "indexOfNode:", v11));
  id v45 = v12;
  if ([v12 count] == 1)
  {
    id v14 = [v12 firstObject];
    uint64_t v15 = [v14 gridSizeClass];
    unint64_t v16 = [v11 gridSizeClass];
    SBHIconGridSize v17 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeForGridSizeClass:v15 gridCellInfoOptions:a5];
    SBHIconGridSize v18 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeForGridSizeClass:v16 gridCellInfoOptions:a5];
    unint64_t v19 = [(SBIconListModel *)self bestGridCellIndexForInsertingIcon:v14 atGridCellIndex:v48 gridCellInfo:v46];
    if (!SBHIconGridSizeEqualToIconGridSize(*(_DWORD *)&v18, *(_DWORD *)&v17)
      && [(SBIconListModel *)self fixedIconLocationBehavior] == 4)
    {
      [(SBIconListModel *)self reflowIconsForwardForInsertingIcon:v14 atGridCellIndex:v19 replacingIcon:v11 gridCellInfoOptions:a5];
    }
    if (-[SBIconListModel isInsertionFixedForIcon:atGridCellIndex:gridCellInfo:mutationOptions:](self, "isInsertionFixedForIcon:atGridCellIndex:gridCellInfo:mutationOptions:", v14, v19, v46, a6)|| (v15 == v16 || [v15 isEqualToString:v16])&& -[SBIconListModel isIconFixed:](self, "isIconFixed:", v11))
    {
      [(SBIconListModel *)self swapFixedIconLocationForReplacedIcon:v11 withReplacementIcon:v14];
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __77__SBIconListModel_replaceIcon_withIcons_gridCellInfoOptions_mutationOptions___block_invoke;
      v64[3] = &unk_1E6AB1A90;
      id v65 = v11;
      id v66 = v14;
      [(SBIconListModel *)self _updateRotatedIconsWithOptions:a6 usingBlock:v64];
    }
    id v12 = v45;
  }
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  obuint64_t j = v12;
  uint64_t v20 = [obj countByEnumeratingWithState:&v60 objects:v68 count:16];
  id v47 = v11;
  if (v20)
  {
    uint64_t v21 = v20;
    SBHIconGridSize v53 = 0;
    id v22 = 0;
    uint64_t v50 = *(void *)v61;
    id v51 = 0;
    do
    {
      uint64_t v23 = 0;
      id v24 = v22;
      do
      {
        if (*(void *)v61 != v50) {
          objc_enumerationMutation(obj);
        }
        int v25 = *(void **)(*((void *)&v60 + 1) + 8 * v23);
        if (v24) {
          unint64_t v26 = [(SBIconListModel *)self willAddIcon:*(void *)(*((void *)&v60 + 1) + 8 * v23) atIndex:0 gridCellInfoOptions:a5 mutationOptions:a6];
        }
        else {
          unint64_t v26 = [(SBIconListModel *)self willReplaceIcon:v11 withIcon:v25 atIndex:[(SBIconListModel *)self bestIconIndexForReplacingIcon:v11 withIcon:*(void *)(*((void *)&v60 + 1) + 8 * v23) gridCellInfo:v46] gridCellInfoOptions:a5 mutationOptions:a6];
        }
        unint64_t v27 = v26;
        if ((a6 & 0x100) != 0) {
          [(SBIconListModel *)self relocateAnyAffectedFixedIconsForInsertingIcon:v25 atGridCellIndex:v48 replacingIcon:v11 gridCellInfoOptions:v52];
        }
        if (v24)
        {
          unint64_t v28 = [(SBIconListModel *)self insertIcon:v25 afterIcon:v24 gridCellInfoOptions:v52 mutationOptions:a6];
          id v29 = v28;
          if (v51)
          {
            if (v28)
            {
              uint64_t v30 = [v51 arrayByAddingObjectsFromArray:v28];

              id v22 = v24;
              id v51 = (void *)v30;
              id v11 = v47;
            }
            else
            {
              id v22 = v24;
            }
          }
          else
          {
            id v29 = v28;
            id v22 = v24;
            id v51 = v29;
          }
        }
        else
        {
          unint64_t v31 = [(SBIconIndexMutableList *)self->_icons indexOfNode:v11];
          icons = self->_icons;
          if (v31 == 0x7FFFFFFFFFFFFFFFLL)
          {
            [(SBIconIndexMutableList *)icons insertNode:v25 atIndex:v27];
          }
          else
          {
            [(SBIconIndexMutableList *)icons replaceNodeAtIndex:v31 withNode:v25];
            uint64_t v33 = self->_icons;
            uint64_t v67 = v25;
            long long v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
            [(SBIconIndexMutableList *)v33 moveNodes:v34 toContiguousIndicesStartingAt:v27];

            id v11 = v47;
          }
          id v22 = v25;
          v56[0] = MEMORY[0x1E4F143A8];
          v56[1] = 3221225472;
          v56[2] = __77__SBIconListModel_replaceIcon_withIcons_gridCellInfoOptions_mutationOptions___block_invoke_2;
          v56[3] = &unk_1E6AADC18;
          id v57 = v11;
          id v58 = v22;
          unint64_t v59 = a6;
          [(SBIconListModel *)self _updateRotatedIconsWithOptions:a6 usingBlock:v56];
          id v29 = v57;
        }

        id v35 = [(SBIconListModel *)self _updateModelByRepairingGapsIfNecessaryWithGridCellInfoOptions:a5 mutationOptions:a6];
        if ([v35 count])
        {
          id v36 = v53;
          if (!v53) {
            id v36 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          }
          SBHIconGridSize v53 = v36;
          [v36 addObjectsFromArray:v35];
        }
        [(SBIconListModel *)self sortByLayoutOrderWithGridCellInfoOptions:a5];
        [(SBIconListModel *)self removeFixedIconLocationsIfPossibleWithGridCellInfoOptions:a5];
        if (!v24) {
          [(SBIconListModel *)self didRemoveIcon:v11 options:a6];
        }
        [(SBIconListModel *)self didAddIcon:v25 options:a6];

        ++v23;
        id v24 = v22;
      }
      while (v21 != v23);
      uint64_t v21 = [obj countByEnumeratingWithState:&v60 objects:v68 count:16];
    }
    while (v21);
  }
  else
  {
    SBHIconGridSize v53 = 0;
    id v22 = 0;
    id v51 = 0;
  }

  unint64_t v38 = [(SBIconListModel *)self _checkAndRemoveBouncedIconsAfterChangeToIcons:obj ignoringTrailingIconCheck:1 options:a6];
  if ([v38 count])
  {
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __77__SBIconListModel_replaceIcon_withIcons_gridCellInfoOptions_mutationOptions___block_invoke_3;
    v54[3] = &unk_1E6AADBA0;
    id v55 = v38;
    [(SBIconListModel *)self _updateRotatedIconsWithOptions:a6 usingBlock:v54];
  }
  [(SBIconListModel *)self saveOnlyRequiredIconLocationsAsFixedIfRequired];
  unint64_t v39 = [obj firstObject];
  id v40 = objc_msgSend(obj, "subarrayWithRange:", 1, objc_msgSend(obj, "count") - 1);
  id v41 = [v53 allObjects];
  [(SBIconListModel *)self _notifyListObserversDidAddIcons:v40 didRemoveIcons:0 movedIcons:v41 didReplaceIcon:v47 withIcon:v39 options:a6];

  [v44 invalidate];
  [(SBIconListModel *)self markIconStateDirtyWithOptions:a6];
  id v12 = v45;
  if (v38 || !v51)
  {
    id v11 = v47;
    if (!v38 || v51)
    {
      id v37 = 0;
      if (v38)
      {
        id v42 = v51;
        if (v51)
        {
          id v37 = [v51 arrayByAddingObjectsFromArray:v38];
        }
        goto LABEL_57;
      }
    }
    else
    {
      id v37 = v38;
    }
    id v42 = v51;
  }
  else
  {
    id v42 = v51;
    id v37 = v51;
    id v11 = v47;
  }
LABEL_57:

LABEL_58:
  return v37;
}

uint64_t __77__SBIconListModel_replaceIcon_withIcons_gridCellInfoOptions_mutationOptions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 swapFixedIconLocationForReplacedIcon:*(void *)(a1 + 32) withReplacementIcon:*(void *)(a1 + 40)];
}

void __77__SBIconListModel_replaceIcon_withIcons_gridCellInfoOptions_mutationOptions___block_invoke_2(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  id v4 = [v3 gridCellInfoWithOptions:0];
  uint64_t v5 = [v3 indexForIcon:*(void *)(a1 + 32)];
  uint64_t v6 = [v3 bestIconIndexForReplacingIcon:*(void *)(a1 + 32) withIcon:*(void *)(a1 + 40) gridCellInfo:v4];
  uint64_t v7 = objc_msgSend(v3, "bestGridCellIndexForInsertingIcon:atGridCellIndex:gridCellInfo:", *(void *)(a1 + 40), objc_msgSend(v4, "gridCellIndexForIconIndex:", v5), v4);
  if (*(unsigned char *)(a1 + 49)) {
    [v3 relocateAnyAffectedFixedIconsForInsertingIcon:*(void *)(a1 + 40) atGridCellIndex:v7 replacingIcon:*(void *)(a1 + 32) gridCellInfoOptions:0];
  }
  [v3[1] replaceNodeAtIndex:v5 withNode:*(void *)(a1 + 40)];
  id v8 = v3[1];
  v10[0] = *(void *)(a1 + 40);
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v8 moveNodes:v9 toContiguousIndicesStartingAt:v6];
}

uint64_t __77__SBIconListModel_replaceIcon_withIcons_gridCellInfoOptions_mutationOptions___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 removeIcons:*(void *)(a1 + 32)];
}

- (void)removeIconAtIndex:(unint64_t)a3
{
}

- (void)removeIconAtIndex:(unint64_t)a3 options:(unint64_t)a4
{
  id v6 = [(SBIconIndexMutableList *)self->_icons nodeAtIndex:a3];
  [(SBIconListModel *)self removeIcon:v6 options:a4];
}

- (void)removeLastIcon
{
  id v3 = [(SBIconIndexMutableList *)self->_icons lastNode];
  [(SBIconListModel *)self removeIcon:v3];
}

- (void)removeIcon:(id)a3
{
}

- (void)removeIcon:(id)a3 options:(unint64_t)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ((a4 & 0x200000) != 0)
  {
    [(SBIconListModel *)self removeIcon:v7 gridCellInfoOptions:0 mutationOptions:a4];
  }
  else
  {
    id v8 = NSStringFromSelector(a2);
    id v9 = [(SBIconListModel *)self startCoalescingContentChangesForReason:v8];

    [(SBIconListModel *)self willRemoveIcon:v7 options:a4];
    if ([(SBIconListModel *)self shouldReflowIconsInContiguousRegionsWithOptions:a4])
    {
      id v10 = [(SBIconListModel *)self gridCellInfoWithOptions:0];
      unint64_t v11 = [(SBIconListModel *)self gridCellIndexForIcon:v7 gridCellInfo:v10];
      id v12 = 0;
      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v12 = [(SBIconListModel *)self contiguousRegionForGridCellIndex:v11 gridCellInfo:v10];
        if (v12)
        {
          if (![(SBIconListModel *)self needsToReflowIconsForRemovingIcon:v7 inContiguousRegion:v12 gridCellInfoOptions:0 mutationOptions:a4])
          {

            id v12 = 0;
          }
        }
      }
    }
    else
    {
      id v12 = 0;
      unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    [(SBIconIndexMutableList *)self->_icons removeNodeIdenticalTo:v7];
    if ((a4 & 0x8000) != 0)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __38__SBIconListModel_removeIcon_options___block_invoke;
      v19[3] = &unk_1E6AB0CE0;
      id v20 = v7;
      [(SBIconListModel *)self enumerateFolderIconsUsingBlock:v19];
    }
    uint64_t v13 = [(SBIconListModel *)self _updateModelByRepairingGapsIfNecessaryWithGridCellInfoOptions:0 mutationOptions:a4];
    if (v12) {
      [(SBIconListModel *)self shiftFixedIconsBackwardsInContiguousRegion:v12 toFillHoleLeftByRemovingIcon:v7 fromGridCellIndex:v11 gridCellInfoOptions:0 mutationOptions:a4];
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __38__SBIconListModel_removeIcon_options___block_invoke_2;
    v16[3] = &unk_1E6AB1978;
    id v14 = v7;
    id v17 = v14;
    unint64_t v18 = a4;
    [(SBIconListModel *)self _updateRotatedIconsWithOptions:a4 usingBlock:v16];
    [(SBIconListModel *)self didRemoveIcon:v14 options:a4];
    v21[0] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    [(SBIconListModel *)self _notifyListObserversDidAddIcons:0 didRemoveIcons:v15 movedIcons:v13];

    [v9 invalidate];
    [(SBIconListModel *)self markIconStateDirtyWithOptions:a4];
  }
}

void __38__SBIconListModel_removeIcon_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 folder];
  [v3 removeIcon:*(void *)(a1 + 32) options:0];
}

uint64_t __38__SBIconListModel_removeIcon_options___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 removeIcon:*(void *)(a1 + 32) options:*(void *)(a1 + 40)];
}

- (void)removeIcons:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(SBIconListModel *)self removeIcon:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)removeIcons:(id)a3 options:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(SBIconListModel *)self removeIcon:*(void *)(*((void *)&v11 + 1) + 8 * v10++) options:a4];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)removeIcons:(id)a3 gridCellInfoOptions:(unint64_t)a4 mutationOptions:(unint64_t)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [(SBIconListModel *)self removeIcon:*(void *)(*((void *)&v13 + 1) + 8 * v12++) gridCellInfoOptions:a4 mutationOptions:a5];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)removeAllIcons
{
  unint64_t v3 = [(SBIconListModel *)self numberOfIcons];
  if (v3)
  {
    unint64_t v4 = v3;
    do
    {
      [(SBIconListModel *)self removeIconAtIndex:0];
      --v4;
    }
    while (v4);
  }
}

- (void)removeIconsAtIndexes:(id)a3 options:(unint64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__SBIconListModel_removeIconsAtIndexes_options___block_invoke;
  v4[3] = &unk_1E6AB1AB8;
  v4[4] = self;
  void v4[5] = a4;
  [a3 enumerateIndexesWithOptions:2 usingBlock:v4];
}

uint64_t __48__SBIconListModel_removeIconsAtIndexes_options___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeIconAtIndex:a2 options:*(void *)(a1 + 40)];
}

- (void)removeAllIconsPassingTest:(id)a3
{
  id v8 = (unsigned int (**)(id, void *))a3;
  unint64_t v4 = [(SBIconListModel *)self numberOfIcons];
  if (v4)
  {
    unint64_t v5 = v4;
    for (unint64_t i = 0; i < v5; ++i)
    {
      uint64_t v7 = [(SBIconListModel *)self iconAtIndex:i];
      if (v8[2](v8, v7))
      {
        [(SBIconListModel *)self removeIconAtIndex:i--];
        --v5;
      }
    }
  }
}

- (void)removeIcon:(id)a3 gridCellInfoOptions:(unint64_t)a4 mutationOptions:(unint64_t)a5
{
  v67[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if ((a5 & 0x200000) != 0)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    id v11 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __66__SBIconListModel_removeIcon_gridCellInfoOptions_mutationOptions___block_invoke;
    void v63[3] = &unk_1E6AB1AE0;
    id v12 = v9;
    id v64 = v12;
    id v43 = v10;
    id v65 = v43;
    id v13 = v11;
    id v66 = v13;
    [(SBIconListModel *)self enumerateIconsUsingBlock:v63];
    if ([v13 count])
    {
      long long v14 = [(SBIconListModel *)self gridCellInfoWithOptions:a4];
      int v37 = [v14 gridSize];
      id v41 = [v12 gridSizeClass];
      SBHIconGridSize v15 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeForGridSizeClass:v41 gridCellInfoOptions:a4];
      int Area = SBHIconGridSizeGetArea(*(_DWORD *)&v15);
      unint64_t v16 = [(SBIconListModel *)self indexForIcon:v12];
      uint64_t v39 = [v14 gridCellIndexForIconIndex:v16];
      uint64_t v17 = [v14 gridRangeForGridCellIndex:v39];
      int v33 = v18;
      unint64_t v34 = v17;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __66__SBIconListModel_removeIcon_gridCellInfoOptions_mutationOptions___block_invoke_2;
      aBlock[3] = &unk_1E6AB1B08;
      id v61 = v13;
      id v38 = v14;
      id v62 = v38;
      id v42 = _Block_copy(aBlock);
      unsigned int v44 = (void *)[(SBIconIndexMutableList *)self->_icons copy];
      [v44 removeNode:v12];
      id v19 = [(SBIconListModel *)self repairModelByEliminatingGapsInIcons:v44 avoidingIcons:0 gridCellInfoOptions:a4];
      id v20 = [v44 nodes];
      id v40 = [(SBIconListModel *)self gridCellInfoForIcons:v20 options:a4];

      if (((*((uint64_t (**)(void *, void *))v42 + 2))(v42, v40) & 1) != 0
        && v15.columns != (unsigned __int16)v37)
      {
        uint64_t v21 = (void *)[(SBIconIndexMutableList *)self->_icons copy];
        id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __66__SBIconListModel_removeIcon_gridCellInfoOptions_mutationOptions___block_invoke_4;
        v53[3] = &unk_1E6AB1B30;
        unint64_t v57 = v16;
        v53[4] = self;
        id v31 = v21;
        id v54 = v31;
        unint64_t v58 = a4;
        id v56 = v42;
        id v23 = v22;
        id v55 = v23;
        int v59 = Area;
        [v43 enumerateIndexesUsingBlock:v53];
        id v36 = [(SBIconListModel *)self _targetListForGridCellInfoOptions:a4];
        id v24 = NSStringFromSelector(a2);
        unsigned __int8 v32 = [(SBIconListModel *)self startCoalescingContentChangesForReason:v24];

        [(SBIconListModel *)self willRemoveIcon:v12 options:a5];
        int v25 = ![(SBIconListModel *)self shouldReflowIconsInContiguousRegionsWithOptions:a5];
        if (v39 == 0x7FFFFFFFFFFFFFFFLL) {
          LOBYTE(v25) = 1;
        }
        if (v25)
        {
          unint64_t v26 = 0;
        }
        else
        {
          unint64_t v26 = -[SBIconListModel contiguousRegionForGridCellIndex:gridCellInfo:](self, "contiguousRegionForGridCellIndex:gridCellInfo:");
        }
        [v36[1] removeNode:v12];
        uint64_t v27 = [v23 count];
        if (v27)
        {
          v52[0] = 0;
          v52[1] = v52;
          v52[2] = 0x2020000000;
          v52[3] = 0;
          v45[0] = MEMORY[0x1E4F143A8];
          v45[1] = 3221225472;
          v45[2] = __66__SBIconListModel_removeIcon_gridCellInfoOptions_mutationOptions___block_invoke_5;
          v45[3] = &unk_1E6AB1B80;
          int v51 = v37;
          v45[4] = self;
          uint64_t v48 = v52;
          unint64_t v49 = a4;
          uint64_t v50 = v27;
          id v46 = v23;
          id v47 = v36;
          SBHIconGridRangeEnumerateSubranges(v34, v33, (unsigned __int16)v33 | 0x10000, v37, 0, v45);

          _Block_object_dispose(v52, 8);
        }
        unint64_t v28 = [(SBIconListModel *)self _updateModelByRepairingGapsIfNecessaryWithGridCellInfoOptions:a4 mutationOptions:a5];
        if (v26) {
          [(SBIconListModel *)self shiftFixedIconsBackwardsInContiguousRegion:v26 toFillHoleLeftByRemovingIcon:v12 fromGridCellIndex:0x7FFFFFFFFFFFFFFFLL gridCellInfoOptions:a4 mutationOptions:a5];
        }
        [(SBIconListModel *)self didRemoveIcon:v12 options:a5];
        id v29 = [(SBIconListModel *)self _otherListForGridCellInfoOptions:a4];
        if (v29 != v36) {
          objc_msgSend(v29, "removeIcon:gridCellInfoOptions:mutationOptions:", v12, -[SBIconListModel rotatedGridCellInfoOptions:](self, "rotatedGridCellInfoOptions:", a4), a5);
        }
        v67[0] = v12;
        uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:1];
        [(SBIconListModel *)self _notifyListObserversDidAddIcons:0 didRemoveIcons:v30 movedIcons:v28];

        [v32 invalidate];
        [(SBIconListModel *)self markIconStateDirtyWithOptions:a5];
      }
      else
      {
        [(SBIconListModel *)self removeIcon:v12 options:a5 & 0xFFFFFFFFFFDFFFFFLL];
      }
    }
    else
    {
      [(SBIconListModel *)self removeIcon:v12 options:a5 & 0xFFFFFFFFFFDFFFFFLL];
    }
  }
  else
  {
    [(SBIconListModel *)self removeIcon:v9 options:a5];
  }
}

void __66__SBIconListModel_removeIcon_gridCellInfoOptions_mutationOptions___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a1[4] != v5)
  {
    id v11 = v5;
    uint64_t v6 = [v5 gridSizeClass];
    if (v6
      && (uint64_t v7 = (void *)v6,
          [v11 gridSizeClass],
          id v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 isEqualToString:@"SBHIconGridSizeClassDefault"],
          v8,
          v7,
          !v9))
    {
      id v10 = a1 + 6;
    }
    else
    {
      id v10 = a1 + 5;
    }
    [*v10 addIndex:a3];
    id v5 = v11;
  }
}

uint64_t __66__SBIconListModel_removeIcon_gridCellInfoOptions_mutationOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  unint64_t v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__SBIconListModel_removeIcon_gridCellInfoOptions_mutationOptions___block_invoke_3;
  v8[3] = &unk_1E6AB0D30;
  id v5 = v3;
  id v9 = v5;
  id v10 = *(id *)(a1 + 40);
  id v11 = &v12;
  [v4 enumerateIndexesUsingBlock:v8];
  uint64_t v6 = *((unsigned __int8 *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v6;
}

uint64_t __66__SBIconListModel_removeIcon_gridCellInfoOptions_mutationOptions___block_invoke_3(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v6 = [*(id *)(a1 + 32) gridCellIndexForIconIndex:a2];
  uint64_t result = [*(id *)(a1 + 40) gridCellIndexForIconIndex:a2];
  if (v6 != result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void __66__SBIconListModel_removeIcon_gridCellInfoOptions_mutationOptions___block_invoke_4(uint64_t a1, unint64_t a2, unsigned char *a3)
{
  if (*(void *)(a1 + 64) < a2)
  {
    id v10 = [*(id *)(a1 + 32) iconAtIndex:a2];
    id v5 = (void *)[*(id *)(a1 + 40) copy];
    [v5 removeNodeIdenticalTo:v10];
    id v6 = (id)[*(id *)(a1 + 32) repairModelByEliminatingGapsInIcons:v5 avoidingIcons:0 gridCellInfoOptions:*(void *)(a1 + 72)];
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = [v5 nodes];
    id v9 = [v7 gridCellInfoForIcons:v8 options:*(void *)(a1 + 72)];

    if (((*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))() & 1) == 0)
    {
      [*(id *)(a1 + 40) removeNode:v10];
      [*(id *)(a1 + 48) addObject:v10];
      if ([*(id *)(a1 + 48) count] >= (unint64_t)*(unsigned int *)(a1 + 80)) {
        *a3 = 1;
      }
    }
  }
}

void __66__SBIconListModel_removeIcon_gridCellInfoOptions_mutationOptions___block_invoke_5(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  id v8 = [*(id *)(a1 + 32) gridCellInfoWithOptions:*(void *)(a1 + 64)];
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v18 = [v8 iconIndexForGridCellIndex:a2];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __66__SBIconListModel_removeIcon_gridCellInfoOptions_mutationOptions___block_invoke_6;
  v10[3] = &unk_1E6AB1B58;
  uint64_t v9 = *(void *)(a1 + 72);
  uint64_t v13 = *(void *)(a1 + 56);
  uint64_t v15 = v9;
  uint64_t v16 = a4;
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  uint64_t v14 = v17;
  SBHIconGridRangeEnumerateCellIndexes(a2, a3, *(_DWORD *)(a1 + 80), v10);

  _Block_object_dispose(v17, 8);
}

void __66__SBIconListModel_removeIcon_gridCellInfoOptions_mutationOptions___block_invoke_6(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  unint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v4 >= *(void *)(a1 + 64))
  {
    **(unsigned char **)(a1 + 72) = 1;
    *a3 = 1;
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) objectAtIndex:v4];
    [*(id *)(*(void *)(a1 + 40) + 8) moveNode:v5 toIndex:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  }
}

- (id)insertIcon:(id)a3 atGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = [(SBIconListModel *)self _targetListForGridCellInfoOptions:a5];
  if ([(SBIconListModel *)self directlyContainsIcon:v11])
  {
    a5 = [(SBIconListModel *)self moveContainedIcon:v11 toGridCellIndex:a4 gridCellInfoOptions:a5 mutationOptions:a6];
    goto LABEL_42;
  }
  uint64_t v13 = NSStringFromSelector(a2);
  id v43 = [(SBIconListModel *)self startCoalescingContentChangesForReason:v13];

  if (v12 != self)
  {
    id v14 = [(SBIconListModel *)v12 insertIcon:v11 atGridCellIndex:a4 gridCellInfoOptions:a5 mutationOptions:a6 | 0x60000000];
    if (v14) {
      [(SBIconListModel *)self removeIcons:v14 options:a6 | 0xFFFFFFFFEC000000];
    }
    [(SBIconListModel *)self addIcon:v11 options:a6 | 0xFFFFFFFFEC000000];
    [(SBIconListModel *)self _invalidateLayoutWithGridCellInfoOptions:a5 mutationOptions:a6];
    goto LABEL_40;
  }
  id v40 = [(SBIconListModel *)self folder];
  uint64_t v15 = [v40 startCoalescingContentChangesForReason:@"SBInsertIconCoalesceID"];
  BOOL v16 = [(SBIconListModel *)self isValidGridCellIndex:a4 options:a5];
  [(SBIconListModel *)self willAddIcon:v11 atIndex:0 gridCellInfoOptions:a5 mutationOptions:a6];
  id v41 = (void *)v15;
  if (v16 && ![(SBIconListModel *)self isValidGridCellIndex:a4 options:a5]) {
    a4 = [(SBIconListModel *)self maxNumberOfIcons] - 1;
  }
  unint64_t v17 = [(SBIconListModel *)self bestGridCellIndexForInsertingIcon:v11 atGridCellIndex:a4 gridCellInfoOptions:a5];
  uint64_t v18 = [(SBIconListModel *)self gridCellInfoWithOptions:a5];
  uint64_t v38 = [v18 iconIndexForGridCellIndex:v17];
  uint64_t v19 = [v11 gridSizeClass];
  unint64_t v20 = v17;
  id v42 = v18;
  BOOL v21 = [(SBIconListModel *)self isInsertionFixedForIcon:v11 atGridCellIndex:v17 gridCellInfo:v18 mutationOptions:a6];
  uint64_t v39 = (void *)v19;
  if ([(SBIconListModel *)self hasFixedIconLocations])
  {
    uint64_t v22 = [(SBIconListModel *)self gridSizeForGridSizeClass:v19 gridCellInfoOptions:a5];
    if ((a6 & 0x100) != 0)
    {
      [(SBIconListModel *)self relocateAnyAffectedFixedIconsForInsertingIcon:v11 atGridCellIndex:a4 replacingIcon:0 gridCellInfoOptions:a5];
      uint64_t v25 = [(SBIconListModel *)self gridCellInfoWithOptions:a5];

      id v23 = (void *)v25;
    }
    else
    {
      id v23 = v42;
    }
    unint64_t v24 = v20;
    id v42 = v23;
    if ([(SBIconListModel *)self hasFixedIconInGridRange:v20 gridCellInfo:v22])
    {
      [v43 invalidate];
      unint64_t v26 = v41;
      [v41 invalidate];
      v44[0] = v11;
      a5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
      id v14 = 0;
      char v27 = 0;
      goto LABEL_39;
    }
  }
  else
  {
    unint64_t v24 = v20;
  }
  if (v21) {
    [(SBIconListModel *)self setFixedLocation:v24 forIcon:v11 options:a6 | 0x800000];
  }
  if ((a6 & 0x200000) == 0) {
    goto LABEL_31;
  }
  uint64_t v28 = [v11 gridSizeClass];
  if (!v28) {
    goto LABEL_31;
  }
  id v29 = (void *)v28;
  int v37 = [v11 gridSizeClass];
  if ([v37 isEqualToString:@"SBHIconGridSizeClassDefault"]) {
    goto LABEL_30;
  }
  uint64_t v30 = [(SBIconListModel *)self rotatedLayoutClusterGridSizeClass];
  if (!v30) {
    goto LABEL_30;
  }
  id v36 = (void *)v30;
  id v35 = [(SBIconListModel *)self rotatedLayoutClusterGridSizeClass];
  char v31 = [v35 isEqualToString:@"SBHIconGridSizeClassDefault"];
  if ((a6 & 0x100000) != 0
    || (v31 & 1) != 0
    || [(SBIconListModel *)self directlyContainsIcon:v11]
    || ![(SBIconListModel *)self directlyContainsNonDefaultSizeClassIcon])
  {

LABEL_30:
    goto LABEL_31;
  }
  BOOL v32 = [(SBIconListModel *)self isGridLayoutValidWithOptions:a5 | 0xC];

  if (v32)
  {
    uint64_t v33 = [(SBIconListModel *)self insertIconWhilePreservingQuads:v11 toGridCellIndex:a4 gridCellInfoOptions:a5 mutationOptions:a6 | 0x70000000];
    goto LABEL_34;
  }
LABEL_31:
  if (v38 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(SBIconListModel *)self addIcon:v11 options:a6 | 0x70000000];
    id v14 = 0;
    goto LABEL_35;
  }
  uint64_t v33 = [(SBIconListModel *)self insertIcon:v11 atIndex:v38 options:a6 | 0x70000000];
LABEL_34:
  id v14 = (id)v33;
LABEL_35:
  [(SBIconListModel *)self sortByLayoutOrderWithGridCellInfoOptions:a5];
  unint64_t v26 = v41;
  if ([(SBIconListModel *)self hasFixedIconLocations]
    && [(SBIconListModel *)self shouldReflowIconsInContiguousRegionsWithOptions:a6])
  {
    [(SBIconListModel *)self removeFixedIconLocationsIfPossibleForIconsInContiguousRegionForGridCellIndex:v24 sortByLayoutOrder:1 gridCellInfoOptions:a5];
  }
  [(SBIconListModel *)self _invalidateLayoutWithGridCellInfoOptions:a5 mutationOptions:a6];
  [v41 invalidate];
  char v27 = 1;
LABEL_39:

  if (v27)
  {
LABEL_40:
    [v43 invalidate];
    [(SBIconListModel *)self markIconStateDirtyWithOptions:a6];
    id v14 = v14;
    a5 = (unint64_t)v14;
  }

LABEL_42:
  return (id)a5;
}

- (id)insertIcon:(id)a3 atCoordinate:(SBIconCoordinate)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  int64_t row = a4.row;
  columuint64_t n = a4.column;
  id v11 = a3;
  id v12 = -[SBIconListModel insertIcon:atGridCellIndex:gridCellInfoOptions:mutationOptions:](self, "insertIcon:atGridCellIndex:gridCellInfoOptions:mutationOptions:", v11, -[SBIconListModel gridCellIndexForCoordinate:gridCellInfoOptions:](self, "gridCellIndexForCoordinate:gridCellInfoOptions:", column, row, a5), a5, a6);

  return v12;
}

- (id)insertIcons:(id)a3 atGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  id v10 = a3;
  if ([v10 count])
  {
    BOOL v11 = [(SBIconListModel *)self directlyContainsIcons:v10];
    if ((a6 & 0x400) != 0 && v11) {
      a4 = [(SBIconListModel *)self bestGridCellIndexForMovingIcons:v10 toGridCellIndex:a4 gridCellInfoOptions:a5 mutationOptions:a6];
    }
    id v12 = [v10 firstObject];
    uint64_t v13 = [(SBIconListModel *)self insertIcon:v12 atGridCellIndex:a4 gridCellInfoOptions:a5 mutationOptions:a6];
    id v14 = v13;
    if (v13) {
      id v15 = (id)[v13 mutableCopy];
    }
    else {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    unint64_t v17 = v15;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy__14;
    void v28[4] = __Block_byref_object_dispose__14;
    id v18 = v12;
    id v29 = v18;
    uint64_t v19 = [v10 count];
    unint64_t v20 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 1, v19 - 1);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __83__SBIconListModel_insertIcons_atGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke;
    v23[3] = &unk_1E6AB1BA8;
    v23[4] = self;
    uint64_t v25 = v28;
    unint64_t v26 = a5;
    unint64_t v27 = a6;
    id v21 = v17;
    id v24 = v21;
    [v10 enumerateObjectsAtIndexes:v20 options:0 usingBlock:v23];

    if ([v21 count]) {
      id v16 = v21;
    }
    else {
      id v16 = 0;
    }

    _Block_object_dispose(v28, 8);
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

void __83__SBIconListModel_insertIcons_atGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  unint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "insertIcon:afterIcon:gridCellInfoOptions:mutationOptions:");
  if (v4) {
    [*(id *)(a1 + 40) addObjectsFromArray:v4];
  }
  if ([*(id *)(a1 + 32) directlyContainsIcon:v5]) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
}

- (unint64_t)bestGridCellIndexForMovingIcons:(id)a3 toGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v35 = [(SBIconListModel *)self gridCellInfoWithOptions:a5];
  int v33 = [v35 gridSize];
  uint64_t v9 = -[SBIconListGridCellInfo initWithGridSize:]([SBIconListGridCellInfo alloc], "initWithGridSize:");
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v38;
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      id v15 = v10;
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(v15);
        }
        uint64_t v17 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        unint64_t v18 = [(SBIconListModel *)self indexForIcon:v17];
        uint64_t v19 = [(SBIconListModel *)self gridRangeForIcon:v17 gridCellInfo:v35];
        uint64_t v21 = v19;
        if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v14 = v19;
        }
        -[SBIconListGridCellInfo setIconIndex:inGridRange:](v9, "setIconIndex:inGridRange:", v18, v19, v20);
        [(SBIconListGridCellInfo *)v9 setGridCellIndex:v21 forIconIndex:v18];
      }
      id v10 = v15;
      uint64_t v12 = [v15 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v12);
  }
  else
  {
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  }

  uint64_t v22 = [(SBIconListModel *)self contiguousRegionForGridCellIndex:v14 gridCellInfo:v9];
  if (v22)
  {
    id v23 = [(SBIconListModel *)self iconsInContiguousRegion:v22 gridCellInfo:v35];
    uint64_t v24 = [v23 count];
    unint64_t v25 = a4;
    if (v24 == [v10 count])
    {
      [v22 gridRange];
      unsigned int v27 = v26;
      unint64_t v28 = v26;
      uint64_t v29 = SBHIconGridRangeIntersection(a4, v26, 0, v33, v33);
      unsigned int v31 = v30;
      if (!SBHIconGridRangeEqualToIconGridRange(a4, v28, v29, v30))
      {
        v36[0] = a4;
        v36[1] = v28;
        SBHIconGridRangeOffset(v36, 2, (unsigned __int16)v27 - (unint64_t)(unsigned __int16)v31, v33);
        SBHIconGridRangeOffset(v36, 1, (int)(HIWORD(v27) - HIWORD(v31)), v33);
        if ([v35 iconIndexForGridCellIndex:v36[0]] == 0x7FFFFFFFFFFFFFFFLL) {
          unint64_t v25 = v36[0];
        }
      }
    }
  }
  else
  {
    unint64_t v25 = a4;
  }

  return v25;
}

- (id)replaceIcon:(id)a3 withIcon:(id)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v16 = a4;
  id v10 = (void *)MEMORY[0x1E4F1C978];
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [v10 arrayWithObjects:&v16 count:1];

  uint64_t v14 = -[SBIconListModel replaceIcon:withIcons:gridCellInfoOptions:mutationOptions:](self, "replaceIcon:withIcons:gridCellInfoOptions:mutationOptions:", v12, v13, a5, a6, v16, v17);

  return v14;
}

- (id)moveContainedIcon:(id)a3 toGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = [(SBIconListModel *)self _targetListForGridCellInfoOptions:a5];
  uint64_t v13 = [(SBIconListModel *)self gridCellInfoWithOptions:a5];
  unint64_t v14 = [(SBIconListModel *)self bestGridCellIndexForInsertingIcon:v11 atGridCellIndex:a4 gridCellInfo:v13];
  uint64_t v15 = objc_msgSend(v13, "gridCellIndexForIconIndex:", -[SBIconListModel indexForIcon:](self, "indexForIcon:", v11));
  if (v15 == v14)
  {
    if ((a6 & 0x80) != 0) {
      [(SBIconListModel *)v12 setFixedLocation:v14 forIcon:v11];
    }
    id v16 = 0;
  }
  else
  {
    uint64_t v17 = v15;
    unint64_t v18 = NSStringFromSelector(a2);
    unsigned int v44 = [(SBIconListModel *)self startCoalescingContentChangesForReason:v18];

    uint64_t v19 = [(SBIconListModel *)self icons];
    if (v12 == self)
    {
      long long v40 = [v11 gridSizeClass];
      SBHIconGridSize v20 = (SBHIconGridSize)-[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](self, "gridSizeForGridSizeClass:gridCellInfoOptions:");
      BOOL v42 = [(SBIconListModel *)self isInsertionFixedForIcon:v11 atGridCellIndex:v14 gridCellInfoOptions:a5 mutationOptions:a6];
      long long v38 = v19;
      if ([(SBIconListModel *)self shouldReflowIconsInContiguousRegionsWithOptions:a6])
      {
        if (v17 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v21 = 0;
        }
        else
        {
          uint64_t v21 = [(SBIconListModel *)self contiguousRegionForGridCellIndex:v17 gridCellInfo:v13];
        }
        int v23 = objc_msgSend(v13, "gridSize", v38);
        uint64_t v24 = SBHIconGridRangeIntersection(v14, *(_DWORD *)&v20, 0, v23, v23);
        uint64_t v22 = -[SBIconListModel contiguousRegionsForGridRange:gridCellInfo:](self, "contiguousRegionsForGridRange:gridCellInfo:", v24, v25, v13);
      }
      else
      {
        uint64_t v21 = 0;
        uint64_t v22 = 0;
      }
      id v43 = (void *)v21;
      id v41 = (void *)v22;
      if ((a6 & 0x100) != 0)
      {
        [(SBIconListModel *)self relocateAnyAffectedFixedIconsForMovingIcon:v11 fromGridCellIndex:v17 toGridCellIndex:v14 intoContiguousRegions:v22 gridCellInfoOptions:a5 mutationOptions:a6];
        uint64_t v26 = [(SBIconListModel *)self gridCellInfoWithOptions:a5];

        uint64_t v13 = (void *)v26;
      }
      BOOL v27 = -[SBIconListModel isIconFixed:](self, "isIconFixed:", v11, v38);
      BOOL v28 = v27;
      if (v42)
      {
        [(SBIconListModel *)self setFixedLocation:v14 forIcon:v11 options:a6 | 0x800000];
        if (v21) {
          BOOL v29 = v28;
        }
        else {
          BOOL v29 = 0;
        }
        if (v29 && ([v41 containsObject:v21] & 1) == 0) {
          [(SBIconListModel *)self shiftFixedIconsBackwardsInContiguousRegion:v21 toFillHoleLeftByRemovingIcon:v11 fromGridCellIndex:v17 gridCellInfoOptions:a5 mutationOptions:a6];
        }
        [(SBIconListModel *)self saveOnlyRequiredIconLocationsAsFixedIfRequired];
        uint64_t v19 = v39;
      }
      else
      {
        uint64_t v19 = v39;
        if (v27)
        {
          [(SBIconListModel *)self removeFixedIconLocationForIcon:v11];
          [(SBIconListModel *)self sortByLayoutOrderWithGridCellInfoOptions:a5];
          uint64_t v30 = [(SBIconListModel *)self gridCellInfoWithOptions:a5];

          uint64_t v13 = (void *)v30;
        }
      }
      if ([v13 iconIndexForGridCellIndex:v14] == 0x7FFFFFFFFFFFFFFFLL) {
        [(SBIconIndexMutableList *)self->_icons count];
      }
      if (v42
        || -[SBIconListModel _moveContainedIconWithinAffectedQuadsIfNecessary:toGridCellIndex:gridCellInfoOptions:mutationOptions:](self, "_moveContainedIconWithinAffectedQuadsIfNecessary:toGridCellIndex:gridCellInfoOptions:mutationOptions:", v11, v14, a5, a6)|| -[SBIconListModel _moveContainedIconLargerThanQuadsIfNecessary:toGridCellIndex:gridCellInfoOptions:mutationOptions:](self, "_moveContainedIconLargerThanQuadsIfNecessary:toGridCellIndex:gridCellInfoOptions:mutationOptions:", v11, v14, a5, a6)|| -[SBIconListModel _moveContainedIconBySwappingVerticallyWithAdjacentIcons:toGridCellIndex:gridCellInfo:gridCellInfoOptions:mutationOptions:](self, "_moveContainedIconBySwappingVerticallyWithAdjacentIcons:toGridCellIndex:gridCellInfo:gridCellInfoOptions:mutationOptions:", v11, v14, v13,
             a5,
             a6)
        || [(SBIconListModel *)self _moveContainedIconUsingAutomaticClusteringIfNecessary:v11 toGridCellIndex:v14 gridCellInfo:v13 gridCellInfoOptions:a5 mutationOptions:a6])
      {
        int v31 = 1;
      }
      else
      {
        [(SBIconListModel *)self _moveContainedIconUsingSimpleMovement:v11 toGridCellIndex:v14 gridCellInfo:v13 gridCellInfoOptions:a5 mutationOptions:a6];
        int v31 = 0;
      }
      id v32 = [(SBIconListModel *)self _updateModelByRepairingGapsIfNecessaryWithGridCellInfoOptions:a5 mutationOptions:a6];
      if (v43 && (([v43 isEmpty] | v42) & 1) == 0) {
        [(SBIconListModel *)self shiftFixedIconsBackwardsInContiguousRegion:v43 toFillHoleLeftByRemovingIcon:v11 fromGridCellIndex:v17 gridCellInfoOptions:a5 mutationOptions:a6];
      }
      if (v31)
      {
        v45[0] = v11;
        int v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
        id v16 = [(SBIconListModel *)self _checkAndRemoveBouncedIconsAfterChangeToIcons:v33 ignoringTrailingIconCheck:0 options:a6];

        [(SBIconListModel *)self sortByLayoutOrderWithGridCellInfoOptions:a5];
      }
      else
      {
        id v16 = 0;
      }
      if ([(SBIconListModel *)self hasFixedIconLocations])
      {
        BOOL v34 = [(SBIconListModel *)self shouldReflowIconsInContiguousRegionsWithOptions:a6];
        if ((a6 & 0x80) == 0 && v34) {
          [(SBIconListModel *)self removeFixedIconLocationsIfPossibleForIconsInContiguousRegionForGridCellIndex:v14 sortByLayoutOrder:1 gridCellInfoOptions:a5];
        }
      }
    }
    else
    {
      id v16 = [(SBIconListModel *)v12 moveContainedIcon:v11 toGridCellIndex:v14 gridCellInfoOptions:a5 mutationOptions:a6];
      [(SBIconListModel *)self removeIcons:v16 options:a5 | 0xFFFFFFFF80000000];
    }
    if (![(SBIconListModel *)self allowsIndependentRotatedLayout]) {
      [(SBIconListModel *)self _invalidateLayoutWithGridCellInfoOptions:a5 mutationOptions:a6];
    }
    id v35 = [(SBIconListModel *)self gridCellInfoWithOptions:a5];
    id v36 = [(SBIconListModel *)self movedIconsFromGridCellInfo:v13 withIconOrder:v19 toGridCellInfo:v35];
    if ([v36 count])
    {
      [(SBIconListModel *)self markIconStateDirtyWithOptions:a6];
      [(SBIconListModel *)self _notifyListObserversDidAddIcons:0 didRemoveIcons:0 movedIcons:v36];
    }
    [v44 invalidate];
  }
  return v16;
}

- (BOOL)_moveContainedIconWithinAffectedQuadsIfNecessary:(id)a3 toGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if ((a6 & 0x300000000) == 0)
  {
    id v12 = [(SBIconListModel *)self rotatedLayoutClusterGridSizeClass];
    SBHIconGridSize v13 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeForGridSizeClass:v12 gridCellInfoOptions:a5];
    uint64_t v14 = v13;
    unsigned int Area = SBHIconGridSizeGetArea(*(_DWORD *)&v13);
    if (!v12 || (unsigned int v16 = Area, ([v12 isEqualToString:@"SBHIconGridSizeClassDefault"] & 1) != 0))
    {
      LOBYTE(v11) = 0;
LABEL_10:

      goto LABEL_11;
    }
    unsigned int count = v16;
    id v11 = [v10 gridSizeClass];
    SBHIconGridSize v70 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeForGridSizeClass:v11 gridCellInfoOptions:a5];
    SBHIconGridSize v17 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeWithOptions:a5];
    id v72 = v11;
    if (v11)
    {
      SBHIconGridSize v67 = v17;
      if (([v11 isEqualToString:@"SBHIconGridSizeClassDefault"] & 1) == 0)
      {
        LOBYTE(v11) = 0;
        if (*(unsigned int *)&v13 < 0x10000) {
          goto LABEL_9;
        }
        unint64_t columns = v13.columns;
        if (!v13.columns) {
          goto LABEL_9;
        }
        LOBYTE(v11) = 0;
        if (v13.columns >= v67.columns) {
          goto LABEL_9;
        }
        unint64_t v20 = HIWORD(*(unsigned int *)&v13);
        if (HIWORD(*(unsigned int *)&v67) <= v20) {
          goto LABEL_9;
        }
        if (!(v67.columns % (unsigned __int16)v14) && !(HIWORD(*(unsigned int *)&v67) % WORD1(v14)))
        {
          LOBYTE(v11) = 0;
          if (columns < v70.columns || HIWORD(*(unsigned int *)&v70) > v20) {
            goto LABEL_9;
          }
          unint64_t v65 = columns;
          uint64_t v21 = [(SBIconListModel *)self gridCellInfoWithOptions:a5];
          unint64_t v60 = objc_msgSend(v21, "gridCellIndexForIconIndex:", -[SBIconListModel indexForIcon:](self, "indexForIcon:", v10));
          id v64 = (void *)[(SBIconIndexMutableList *)self->_icons copy];
          uint64_t v71 = v21;
          uint64_t v22 = [(SBIconListModel *)self iconAtGridCellIndex:a4 gridCellInfo:v21];
          long long v63 = v22;
          if (v22)
          {
            int v23 = [v22 gridSizeClass];
          }
          else
          {
            int v23 = @"SBHIconGridSizeClassDefault";
          }
          id v62 = v23;
          SBHIconGridSize v24 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeForGridSizeClass:v23 gridCellInfoOptions:a5];
          LOBYTE(v11) = 0;
          if (v65 < v24.columns || HIWORD(*(unsigned int *)&v24) > v20) {
            goto LABEL_52;
          }
          unsigned __int16 v25 = v67.columns;
          unint64_t v68 = SBHIconGridRangeSubrangeIncludingCellIndex(0, v67.columns, v60, v14, v67.columns);
          uint64_t v59 = v26;
          unint64_t v27 = SBHIconGridRangeSubrangeIncludingCellIndex(0, v25, a4, v14, v25);
          uint64_t v58 = v28;
          SBIconCoordinateMakeWithGridCellIndex(v68, v25);
          uint64_t v55 = v29;
          unsigned __int16 v57 = v25;
          SBIconCoordinateMakeWithGridCellIndex(v27, v25);
          unint64_t v61 = v27;
          if (v68 != v27)
          {
            if (v55 == v30)
            {
              unint64_t v31 = 2 * v65;
LABEL_30:
              LOBYTE(v11) = 0;
              if (!(v31 >> 16) && !(v20 >> 16))
              {
                unint64_t v52 = [(SBIconListModel *)self gridSizeClassSizesWithOptions:a5];
                unint64_t v53 = v31;
                unsigned __int16 v50 = v31;
                id v32 = -[SBIconListModel initWithUniqueIdentifier:folder:gridSize:gridSizeClassSizes:]([SBRotatedIconListModel alloc], "initWithUniqueIdentifier:folder:gridSize:gridSizeClassSizes:", @"QuadMovement", 0);
                int v33 = [(SBIconListModel *)self rotatedLayoutClusterGridSizeClass];
                [(SBIconListModel *)v32 setRotatedLayoutClusterGridSizeClass:v33];

                [(SBIconListModel *)v32 setFixedIconLocationBehavior:0];
                BOOL v34 = [(SBIconListModel *)self gridSizeClassDomain];
                [(SBIconListModel *)v32 setGridSizeClassDomain:v34];

                unint64_t v35 = v68;
                int v51 = -[SBIconListModel iconsForGridRange:gridCellInfo:](self, "iconsForGridRange:gridCellInfo:", v68, v59, v71);
                id v36 = -[SBIconListModel addIcons:](v32, "addIcons:");
                if (v68 != v61)
                {
                  long long v37 = -[SBIconListModel iconsForGridRange:gridCellInfo:](self, "iconsForGridRange:gridCellInfo:", v61, v58, v71);
                  id v38 = [(SBIconListModel *)v32 addIcons:v37];

                  unint64_t v35 = v68;
                }
                p_isa = (id *)&v32->super.super.isa;
                long long v39 = [(SBIconListModel *)v32 gridCellInfoWithOptions:0];
                if (v53 <= v20) {
                  unint64_t v40 = count;
                }
                else {
                  unint64_t v40 = v65;
                }
                if (v35 == v61) {
                  unint64_t v40 = 0;
                }
                if (v35 <= v61) {
                  unint64_t v41 = 0;
                }
                else {
                  unint64_t v41 = v40;
                }
                unint64_t v66 = v41;
                if (v35 > v61) {
                  unint64_t v40 = 0;
                }
                unint64_t v54 = v40;
                unint64_t v42 = v35;
                if (count >= 0x40)
                {
                  id v43 = (char *)malloc_type_calloc(count, 8uLL, 0x100004000313F17uLL);
                  unint64_t v49 = v43;
                }
                else
                {
                  unint64_t v49 = 0;
                  id v43 = &v75;
                }
                objc_msgSend(v71, "getIconIndexes:inGridRange:", v43, v42, v59);
                objc_msgSend(v39, "setIconIndexes:inGridRange:", v43, v66, v14);
                if (v42 != v61)
                {
                  objc_msgSend(v71, "getIconIndexes:inGridRange:", v43);
                  objc_msgSend(v39, "setIconIndexes:inGridRange:", v43, v54, v14);
                }
                [p_isa setIconOrderFromGridCellInfo:v39 referenceIconOrder:v64];
                unint64_t v44 = SBHIconGridRangeRelativeCellIndexForCellIndex(v61, v58, a4, v57);
                id v45 = (id)objc_msgSend(p_isa, "moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:", v10, SBHIconGridRangeCellIndexForRelativeCellIndex(v54, v14, v44, v50), a5, a6 | 0x100000000);
                id v46 = [p_isa gridCellInfoWithOptions:0];
                id v11 = p_isa[1];
                id v47 = (void *)[v71 copy];
                objc_msgSend((id)objc_opt_class(), "applyIconLayoutFromGridCellInfo:inGridRange:iconOrder:toGridCellInfo:inGridRange:iconOrder:", v46, v66, v14, v11, v47, v68, v59, v64);
                if (v68 != v61) {
                  objc_msgSend((id)objc_opt_class(), "applyIconLayoutFromGridCellInfo:inGridRange:iconOrder:toGridCellInfo:inGridRange:iconOrder:", v46, v54, v14, v11, v47, v61, v58, v64);
                }
                v73[0] = MEMORY[0x1E4F143A8];
                v73[1] = 3221225472;
                v73[2] = __120__SBIconListModel__moveContainedIconWithinAffectedQuadsIfNecessary_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke;
                v73[3] = &unk_1E6AACA90;
                v73[4] = self;
                id v74 = v47;
                id v48 = v47;
                [(SBIconListModel *)self performChangesByPreservingOrderOfDefaultSizedIcons:v73];
                free(v49);

                LOBYTE(v11) = 1;
              }
LABEL_52:

              goto LABEL_9;
            }
            v20 *= 2;
          }
          unint64_t v31 = v65;
          goto LABEL_30;
        }
      }
      LOBYTE(v11) = 0;
    }
LABEL_9:

    goto LABEL_10;
  }
  LOBYTE(v11) = 0;
LABEL_11:

  return (char)v11;
}

uint64_t __120__SBIconListModel__moveContainedIconWithinAffectedQuadsIfNecessary_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIconOrderFromGridCellInfo:*(void *)(a1 + 40)];
}

- (BOOL)_moveContainedIconLargerThanQuadsIfNecessary:(id)a3 toGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if ((a6 & 0x300000000) == 0)
  {
    id v12 = [(SBIconListModel *)self rotatedLayoutClusterGridSizeClass];
    SBHIconGridSize v13 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeForGridSizeClass:v12 gridCellInfoOptions:a5];
    unsigned int Area = SBHIconGridSizeGetArea(*(_DWORD *)&v13);
    uint64_t v15 = [v10 gridSizeClass];
    SBHIconGridSize v16 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeForGridSizeClass:v15 gridCellInfoOptions:a5];
    uint64_t v17 = v16;
    unsigned int v18 = SBHIconGridSizeGetArea(*(_DWORD *)&v16);
    SBHIconGridSize v19 = (SBHIconGridSize)[(SBIconListModel *)self gridSize];
    if (v18 > Area && !(v18 % Area))
    {
      BOOL v11 = 0;
      if (*(unsigned int *)&v13 < 0x20000) {
        goto LABEL_6;
      }
      if (v13.columns < 2u) {
        goto LABEL_6;
      }
      BOOL v11 = 0;
      if (v13.columns >= v19.columns || HIWORD(*(unsigned int *)&v19) <= HIWORD(*(unsigned int *)&v13)) {
        goto LABEL_6;
      }
      if (!(v19.columns % v13.columns)
        && !(HIWORD(*(unsigned int *)&v19) % HIWORD(*(unsigned int *)&v13))
        && SBHIconGridRangeContainsIconGridRange(0, *(_DWORD *)&v19, a4, v17, v19.columns))
      {
        uint64_t v21 = [(SBIconListModel *)self gridCellInfoWithOptions:a5];
        uint64_t v22 = objc_msgSend(v21, "gridCellIndexForIconIndex:", -[SBIconListModel indexForIcon:](self, "indexForIcon:", v10));
        if (v18 >= 0x40)
        {
          int v23 = (char *)malloc_type_calloc(v18, 8uLL, 0x100004000313F17uLL);
          unsigned __int16 v25 = v23;
        }
        else
        {
          unsigned __int16 v25 = 0;
          int v23 = &v26;
        }
        SBHIconGridSize v24 = (void *)[v21 copy];
        objc_msgSend(v21, "getIconIndexes:inGridRange:", v23, v22, v17);
        objc_msgSend(v24, "setIconIndexes:inGridRange:", v23, a4, v17);
        objc_msgSend(v21, "getIconIndexes:inGridRange:", v23, a4, v17);
        objc_msgSend(v24, "setIconIndexes:inGridRange:", v23, v22, v17);
        free(v25);
        [(SBIconListModel *)self setIconOrderFromGridCellInfo:v24];

        BOOL v11 = 1;
        goto LABEL_6;
      }
    }
    BOOL v11 = 0;
LABEL_6:

    goto LABEL_7;
  }
  BOOL v11 = 0;
LABEL_7:

  return v11;
}

- (BOOL)_moveContainedIconBySwappingVerticallyWithAdjacentIcons:(id)a3 toGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5 gridCellInfoOptions:(unint64_t)a6 mutationOptions:(unint64_t)a7
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  if ((a7 & 0x200000000) != 0 || [(SBIconListModel *)self fixedIconLocationBehavior] != 4)
  {
    LOBYTE(v22) = 0;
  }
  else
  {
    uint64_t v14 = [v12 gridSizeClass];
    SBHIconGridSize v15 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeForGridSizeClass:v14 gridCellInfoOptions:a6];
    unsigned int v16 = [v13 gridSize];
    unint64_t v17 = [(SBIconListModel *)self gridRangeForIcon:v12 gridCellInfo:v13];
    unsigned int v47 = v16;
    int v48 = v18;
    unint64_t v49 = v17;
    unint64_t v19 = SBHIconGridRangeUnion(a4, *(unsigned int *)&v15, v17, v18, v16);
    uint64_t v52 = v20;
    if (-[SBIconListModel isValidGridRange:gridCellInfo:](self, "isValidGridRange:gridCellInfo:", a4, *(unsigned int *)&v15, v13))
    {
      unint64_t v51 = v19;
      unint64_t v45 = a4;
      -[SBIconListModel iconsForGridRange:gridCellInfo:](self, "iconsForGridRange:gridCellInfo:", a4, *(unsigned int *)&v15, v13);
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v22 = [v21 countByEnumeratingWithState:&v59 objects:v65 count:16];
      if (v22)
      {
        unint64_t v41 = a7;
        unint64_t v42 = a6;
        id v43 = v14;
        unint64_t v44 = v12;
        uint64_t v23 = *(void *)v60;
        obuint64_t j = v21;
LABEL_6:
        uint64_t v24 = 0;
        while (1)
        {
          if (*(void *)v60 != v23) {
            objc_enumerationMutation(obj);
          }
          unsigned __int16 v25 = v13;
          unint64_t v26 = [(SBIconListModel *)self gridRangeForIcon:*(void *)(*((void *)&v59 + 1) + 8 * v24) gridCellInfo:v13];
          int v28 = v27;
          a6 = a6 & 0xFFFFFFFF00000000 | v16;
          if (SBHIconGridRangeContainsIconGridRange(v51, v52, v26, v27, a6))
          {
            a7 = a7 & 0xFFFFFFFF00000000 | v16;
            if ((SBHIconGridRangeTouchedEdges(v49, v48, v26, v28, a7) & 5) != 0) {
              break;
            }
          }
          ++v24;
          id v13 = v25;
          if (v22 == v24)
          {
            id v21 = obj;
            uint64_t v22 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
            if (v22) {
              goto LABEL_6;
            }
            uint64_t v29 = obj;
            goto LABEL_18;
          }
        }
        id v21 = obj;

        id v13 = v25;
        uint64_t v29 = -[SBIconListModel iconsForGridRange:gridCellInfo:](self, "iconsForGridRange:gridCellInfo:", v51, v52, v25);
        if ([v29 indexOfObjectPassingTest:&__block_literal_global_57_1] == 0x7FFFFFFFFFFFFFFFLL)
        {
          LOBYTE(v22) = 0;
LABEL_18:
          uint64_t v14 = v43;
          id v12 = v44;
          goto LABEL_23;
        }
        uint64_t v30 = [[SBIconListGridCellInfo alloc] initWithGridSize:v52];
        unint64_t v31 = SBHIconGridRangeRelativeCellIndexForCellIndex(v51, v52, v45, v16);
        id v12 = v44;
        id v32 = [v44 uniqueIdentifier];
        long long v63 = v32;
        int v33 = [NSNumber numberWithUnsignedInteger:v31];
        id v64 = v33;
        uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];

        id v46 = (void *)v34;
        [(SBIconListModel *)self layOutIcons:v29 inGridCellInfo:v30 startingAtGridCellIndex:0 gridSize:v52 fixedIconLocations:v34 options:v42];
        BOOL v35 = [(SBIconListGridCellInfo *)v30 isLayoutOutOfBounds];
        if (!v35)
        {
          id v36 = (void *)[v25 copy];
          objc_msgSend(v36, "setLayoutFromGridCellInfo:fromGridRange:toGridRange:", v30, 0, v52, v51, v52);
          long long v37 = [(SBIconListModel *)self icons];
          v53[0] = MEMORY[0x1E4F143A8];
          v53[1] = 3221225472;
          v53[2] = __140__SBIconListModel__moveContainedIconBySwappingVerticallyWithAdjacentIcons_toGridCellIndex_gridCellInfo_gridCellInfoOptions_mutationOptions___block_invoke_2;
          v53[3] = &unk_1E6AB1BD0;
          v53[4] = self;
          id v54 = v36;
          unsigned int v58 = v47;
          id v55 = v37;
          unint64_t v56 = v42;
          unint64_t v57 = v41;
          id v38 = v37;
          id v39 = v36;
          [(SBIconListModel *)self performChangesByPreservingOrderOfDefaultSizedIcons:v53];
        }
        LOBYTE(v22) = !v35;

        id v13 = v25;
        uint64_t v14 = v43;
      }
      else
      {
        uint64_t v29 = v21;
      }
LABEL_23:
    }
    else
    {
      LOBYTE(v22) = 0;
    }
  }
  return v22;
}

uint64_t __140__SBIconListModel__moveContainedIconBySwappingVerticallyWithAdjacentIcons_toGridCellIndex_gridCellInfo_gridCellInfoOptions_mutationOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 gridSizeClass];
  if (v3)
  {
    unint64_t v4 = [v2 gridSizeClass];
    uint64_t v5 = [v4 isEqualToString:@"SBHIconGridSizeClassDefault"] ^ 1;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __140__SBIconListModel__moveContainedIconBySwappingVerticallyWithAdjacentIcons_toGridCellIndex_gridCellInfo_gridCellInfoOptions_mutationOptions___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "transferPositionsFromGridCellInfo:representingGridRange:asLocationsForIcons:gridCellInfoOptions:mutationOptions:", *(void *)(a1 + 40), 0, *(unsigned int *)(a1 + 72), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64));
}

- (BOOL)_moveContainedIconUsingAutomaticClusteringIfNecessary:(id)a3 toGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5 gridCellInfoOptions:(unint64_t)a6 mutationOptions:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a5;
  if ((a7 & 0x200000000) != 0) {
    goto LABEL_38;
  }
  unint64_t v51 = [v12 gridSizeClass];
  SBHIconGridSize v48 = (SBHIconGridSize)-[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](self, "gridSizeForGridSizeClass:gridCellInfoOptions:");
  unsigned __int16 v50 = v12;
  unint64_t v14 = [(SBIconListModel *)self indexForIcon:v12];
  uint64_t v66 = 0;
  SBHIconGridSize v67 = &v66;
  uint64_t v68 = 0x2020000000;
  uint64_t v69 = 0;
  if (!v13)
  {
    id v13 = [(SBIconListModel *)self gridCellInfoWithOptions:a6];
  }
  unint64_t v49 = a7;
  unint64_t v15 = [v13 iconIndexForGridCellIndex:a4];
  if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v15 = [(SBIconIndexMutableList *)self->_icons count] - 1;
  }
  if (v51 && ([v51 isEqualToString:@"SBHIconGridSizeClassDefault"] & 1) == 0)
  {
    id v46 = v13;
    unint64_t v47 = a4;
    unsigned int v16 = @"SBHIconGridSizeClassDefault";
    unsigned int v17 = [(SBIconListModel *)self gridSizeAreaForGridSizeClass:v16 gridCellInfoOptions:a6];
    if (v15 <= v14) {
      unint64_t v18 = v14;
    }
    else {
      unint64_t v18 = v15;
    }
    if (v15 < v14) {
      unint64_t v14 = v15;
    }
    do
    {
      unint64_t v19 = [(SBIconListModel *)self iconAtIndex:v14];
      uint64_t v20 = [v19 gridSizeClass];
      unsigned int v21 = [(SBIconListModel *)self gridSizeAreaForGridSizeClass:v20 gridCellInfoOptions:a6];
      if (v21 > v17)
      {
        uint64_t v22 = v20;

        unsigned int v17 = v21;
        unsigned int v16 = v22;
      }

      ++v14;
    }
    while (v14 <= v18);
    SBHIconGridSize v23 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeForGridSizeClass:v16 gridCellInfoOptions:a6];
    uint64_t v24 = [(SBIconListModel *)self largestClusteringSizeClassWithOptions:a6];
    SBHIconGridSize v25 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeForGridSizeClass:v24 gridCellInfoOptions:a6];
    unsigned int v26 = HIWORD(*(unsigned int *)&v23);
    unsigned int columns = v23.columns;
    if (v23.columns > v25.columns || v26 > HIWORD(*(unsigned int *)&v25))
    {
      int v28 = v24;

      unsigned int v16 = v28;
    }
    BOOL v29 = columns > v48.columns;
    a4 = v47;
    if (v29 || v26 > HIWORD(*(unsigned int *)&v48))
    {
      id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v31 = [(SBIconListModel *)self allowedGridSizeClasses];
      id v32 = [(SBIconListModel *)self effectiveGridSizeClassDomain];
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __138__SBIconListModel__moveContainedIconUsingAutomaticClusteringIfNecessary_toGridCellIndex_gridCellInfo_gridCellInfoOptions_mutationOptions___block_invoke;
      v62[3] = &unk_1E6AB1C20;
      id v33 = v30;
      id v63 = v33;
      id v64 = self;
      unint64_t v65 = a6;
      [v31 enumerateGridSizeClassesInDomain:v32 usingBlock:v62];
      unint64_t v34 = [v33 indexOfObject:v16];
      unint64_t v35 = [v33 indexOfObject:v51];
      if (v34 != 0x7FFFFFFFFFFFFFFFLL && v35 != 0x7FFFFFFFFFFFFFFFLL && v34 > v35)
      {
        id v36 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v35 + 1, v34 - v35);
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __138__SBIconListModel__moveContainedIconUsingAutomaticClusteringIfNecessary_toGridCellIndex_gridCellInfo_gridCellInfoOptions_mutationOptions___block_invoke_3;
        v57[3] = &unk_1E6AB1C48;
        long long v59 = &v66;
        v57[4] = self;
        id v58 = v50;
        unint64_t v60 = v47;
        unint64_t v61 = a6;
        [v33 enumerateObjectsAtIndexes:v36 options:2 usingBlock:v57];
      }
    }

    id v13 = v46;
  }
  unsigned int Area = SBHIconGridSizeGetArea([v13 gridSize]);
  int64_t v38 = v67[3];
  id v12 = v50;
  if (v38 < 0 && -v38 > a4)
  {
    int64_t v38 = -(uint64_t)a4;
LABEL_33:
    void v67[3] = v38;
    goto LABEL_34;
  }
  if (v38 >= 1 && v38 + a4 >= Area)
  {
    int64_t v38 = Area + ~a4;
    goto LABEL_33;
  }
LABEL_34:
  id v39 = v51;
  if ([(SBIconListModel *)self _canClusterIconsUsingSizeClass:v39])
  {
    id v40 = v13;
    uint64_t v41 = 0;
    unint64_t v42 = v39;
  }
  else
  {
    unint64_t v42 = [(SBIconListModel *)self rotatedLayoutClusterGridSizeClass];
    id v40 = v13;

    uint64_t v41 = 2;
  }
  unint64_t v43 = v38 + a4;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __138__SBIconListModel__moveContainedIconUsingAutomaticClusteringIfNecessary_toGridCellIndex_gridCellInfo_gridCellInfoOptions_mutationOptions___block_invoke_4;
  v52[3] = &unk_1E6AB1C70;
  void v52[4] = self;
  id v44 = v39;
  id v53 = v44;
  unint64_t v55 = a6 & 0xFFFFFFFFFFFFFFFDLL;
  id v54 = v50;
  unint64_t v56 = v43;
  [(SBIconListModel *)self performChangesByClusteringForSizeClass:v42 behavior:v41 withGridCellInfoOptions:a6 block:v52];
  id v13 = v40;

  _Block_object_dispose(&v66, 8);
  a7 = v49;
LABEL_38:

  return (a7 & 0x200000000) == 0;
}

void __138__SBIconListModel__moveContainedIconUsingAutomaticClusteringIfNecessary_toGridCellIndex_gridCellInfo_gridCellInfoOptions_mutationOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 count];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __138__SBIconListModel__moveContainedIconUsingAutomaticClusteringIfNecessary_toGridCellIndex_gridCellInfo_gridCellInfoOptions_mutationOptions___block_invoke_2;
  v7[3] = &unk_1E6AB1BF8;
  uint64_t v6 = *(void *)(a1 + 48);
  v7[4] = *(void *)(a1 + 40);
  void v7[5] = v6;
  objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v4, objc_msgSend(v3, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, v5, 1024, v7));
}

uint64_t __138__SBIconListModel__moveContainedIconUsingAutomaticClusteringIfNecessary_toGridCellIndex_gridCellInfo_gridCellInfoOptions_mutationOptions___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a3;
  unsigned int Area = SBHIconGridSizeGetArea([v5 gridSizeForGridSizeClass:a2 gridCellInfoOptions:v6]);
  LODWORD(v4) = [*(id *)(v4 + 32) gridSizeForGridSizeClass:v7 gridCellInfoOptions:*(void *)(v4 + 40)];

  unsigned int v9 = SBHIconGridSizeGetArea(v4);
  if (Area < v9) {
    return -1;
  }
  else {
    return Area > v9;
  }
}

uint64_t __138__SBIconListModel__moveContainedIconUsingAutomaticClusteringIfNecessary_toGridCellIndex_gridCellInfo_gridCellInfoOptions_mutationOptions___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) _moveIcon:*(void *)(a1 + 40) byClusteringForSizeClass:a2 toGridCellIndex:*(void *)(a1 + 56) gridCellInfoOptions:*(void *)(a1 + 64)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += result;
  return result;
}

void __138__SBIconListModel__moveContainedIconUsingAutomaticClusteringIfNecessary_toGridCellIndex_gridCellInfo_gridCellInfoOptions_mutationOptions___block_invoke_4(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __138__SBIconListModel__moveContainedIconUsingAutomaticClusteringIfNecessary_toGridCellIndex_gridCellInfo_gridCellInfoOptions_mutationOptions___block_invoke_5;
  v8[3] = &unk_1E6AAE228;
  uint64_t v5 = (void *)a1[6];
  uint64_t v4 = a1[7];
  void v8[4] = v2;
  uint64_t v10 = v4;
  id v6 = v5;
  uint64_t v7 = a1[8];
  id v9 = v6;
  uint64_t v11 = v7;
  [v2 performChangesByPreservingPositionsOfIconsLargerThanSizeClass:v3 block:v8];
}

void __138__SBIconListModel__moveContainedIconUsingAutomaticClusteringIfNecessary_toGridCellIndex_gridCellInfo_gridCellInfoOptions_mutationOptions___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) gridCellInfoWithOptions:*(void *)(a1 + 48)];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "moveNode:toIndex:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "_iconIndexForMovingIcon:toGridCellIndex:gridCellInfo:", *(void *)(a1 + 40), *(void *)(a1 + 56), v2));
}

- (void)_moveContainedIconUsingSimpleMovement:(id)a3 toGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5 gridCellInfoOptions:(unint64_t)a6 mutationOptions:(unint64_t)a7
{
  id v12 = a3;
  id v11 = a5;
  if (!v11)
  {
    id v11 = [(SBIconListModel *)self gridCellInfoWithOptions:a6];
  }
  [(SBIconIndexMutableList *)self->_icons moveNode:v12 toIndex:[(SBIconListModel *)self _iconIndexForMovingIcon:v12 toGridCellIndex:a4 gridCellInfo:v11]];
}

- (void)setIconOrderFromGridCellInfo:(id)a3
{
}

- (void)setIconOrderFromGridCellInfo:(id)a3 referenceIconOrder:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBIconListModel *)self icons];
  size_t v9 = [v7 count];
  unsigned int v10 = [v6 gridSize];
  if (v9 >= 0x40)
  {
    id v11 = (uint64_t *)malloc_type_calloc(v9, 8uLL, 0x100004000313F17uLL);
    unsigned int v17 = v11;
  }
  else
  {
    unsigned int v17 = 0;
    id v11 = (uint64_t *)&v18;
  }
  uint64_t v12 = objc_msgSend(v6, "getUniqueIconIndexes:inGridRange:", v11, 0, v10);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  for (uint64_t i = (void *)[v8 mutableCopy]; v12; --v12)
  {
    uint64_t v15 = *v11++;
    if (v15 != 65534)
    {
      unsigned int v16 = objc_msgSend(v7, "nodeAtIndex:");
      [v13 addObject:v16];
      [i removeObject:v16];
    }
  }
  if ([i count]) {
    [v13 addObjectsFromArray:i];
  }
  [(SBIconIndexMutableList *)self->_icons setNodes:v13];
  free(v17);
}

+ (void)applyIconLayoutFromGridCellInfo:(id)a3 inGridRange:(SBHIconGridRange)a4 iconOrder:(id)a5 toGridCellInfo:(id)a6 inGridRange:(SBHIconGridRange)a7 iconOrder:(id)a8
{
  uint64_t v10 = *(void *)&a4.size.columns;
  unint64_t cellIndex = a4.cellIndex;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a8;
  unsigned int Area = SBHIconGridSizeGetArea(v10);
  uint64_t v17 = Area;
  if (Area >= 0x40)
  {
    char v18 = malloc_type_calloc(Area, 8uLL, 0x100004000313F17uLL);
    objc_msgSend(v12, "getIconIndexes:inGridRange:", v18, cellIndex, v10);
  }
  else
  {
    char v18 = v21;
    objc_msgSend(v12, "getIconIndexes:inGridRange:", v21, cellIndex, v10);
    if (!v17) {
      goto LABEL_9;
    }
  }
  uint64_t v19 = 0;
  do
  {
    if (*(void *)&v18[8 * v19] != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v20 = objc_msgSend(v13, "nodeAtIndex:");
      *(void *)&v18[8 * v19] = [v15 indexOfNode:v20];
    }
    ++v19;
  }
  while (v17 != v19);
LABEL_9:
  objc_msgSend(v14, "setIconIndexes:inGridRange:", v18, a7.cellIndex, *(void *)&a7.size.columns);
}

- (void)moveContainedIcon:(id)a3 beforeIcon:(id)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = [(SBIconListModel *)self _targetListForGridCellInfoOptions:a5];
  uint64_t v12 = [v11 indexForIcon:v14];
  if (v12 != [v11 indexForIcon:v10] - 1) {
    id v13 = -[SBIconListModel moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:](self, "moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:", v14, objc_msgSend(v11, "bestGridCellIndexForInsertingIcon:atGridCellIndex:", v14, objc_msgSend(v11, "gridCellIndexForIcon:gridCellInfoOptions:", v10, a5)), a5, a6);
  }
}

- (void)moveContainedIcon:(id)a3 afterIcon:(id)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  id v18 = a3;
  id v10 = a4;
  id v11 = [(SBIconListModel *)self _targetListForGridCellInfoOptions:a5];
  uint64_t v12 = [v11 indexForIcon:v18];
  if (v12 != [v11 indexForIcon:v10] + 1)
  {
    id v13 = [v11 gridCellInfoWithOptions:a5];
    uint64_t v14 = [v11 gridCellIndexForIcon:v10 gridCellInfo:v13];
    uint64_t v15 = [v11 gridCellIndexForIcon:v18 gridCellInfo:v13];
    unint64_t v16 = [(SBIconListModel *)self bestGridCellIndexForInsertingIcon:v18 afterIconAtGridCellIndex:v14 gridCellInfo:v13];
    if (v16 != 0x7FFFFFFFFFFFFFFFLL) {
      id v17 = [(SBIconListModel *)self moveContainedIcon:v18 toGridCellIndex:(void)((__PAIR128__(v16, v15) - v16) >> 64) gridCellInfoOptions:a5 mutationOptions:a6];
    }
  }
}

- (void)moveContainedIcon:(id)a3 belowIcon:(id)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = [(SBIconListModel *)self _targetListForGridCellInfoOptions:a5];
  [v11 indexForIcon:v14];
  uint64_t v12 = objc_msgSend(v11, "gridCellIndexBelowIconAtIndex:options:", objc_msgSend(v11, "indexForIcon:", v10), a5);
  if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
    [(SBIconListModel *)self moveContainedIcon:v14 afterIcon:v10 gridCellInfoOptions:a5 mutationOptions:a6];
  }
  else {
    id v13 = -[SBIconListModel moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:](self, "moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:", v14, [v11 bestGridCellIndexForInsertingIcon:v14 atGridCellIndex:v12], a5, a6);
  }
}

- (void)moveContainedIcon:(id)a3 aboveIcon:(id)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = [(SBIconListModel *)self _targetListForGridCellInfoOptions:a5];
  [v11 indexForIcon:v14];
  uint64_t v12 = objc_msgSend(v11, "gridCellIndexAboveIconAtIndex:options:", objc_msgSend(v11, "indexForIcon:", v10), a5);
  if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
    [(SBIconListModel *)self moveContainedIcon:v14 beforeIcon:v10 gridCellInfoOptions:a5 mutationOptions:a6];
  }
  else {
    id v13 = -[SBIconListModel moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:](self, "moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:", v14, [v11 bestGridCellIndexForInsertingIcon:v14 atGridCellIndex:v12], a5, a6);
  }
}

- (void)moveContainedIcon:(id)a3 toIndex:(unint64_t)a4 options:(unint64_t)a5
{
  id v11 = a3;
  unint64_t v8 = -[SBIconListModel indexForIcon:](self, "indexForIcon:");
  if (v8 != a4)
  {
    [(SBIconIndexMutableList *)self->_icons removeNodeAtIndex:v8];
    unint64_t v9 = [(SBIconIndexMutableList *)self->_icons count];
    icons = self->_icons;
    if (v9 <= a4) {
      [(SBIconIndexMutableList *)icons addNode:v11];
    }
    else {
      [(SBIconIndexMutableList *)icons insertNode:v11 atIndex:a4];
    }
    [(SBIconListModel *)self markIconStateDirtyWithOptions:a5];
    [(SBIconListModel *)self _notifyListObserversDidMoveIcon:v11 options:a5];
  }
}

- (void)swapContainedIcon:(id)a3 withContainedIcon:(id)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  id v38 = a3;
  id v10 = a4;
  id v11 = [(SBIconListModel *)self _targetListForGridCellInfoOptions:a5];
  uint64_t v12 = v11;
  if (v11 != self)
  {
    [(SBIconListModel *)v11 swapContainedIcon:v38 withContainedIcon:v10 gridCellInfoOptions:a5 mutationOptions:a6];
    goto LABEL_25;
  }
  unint64_t v34 = a6;
  id v13 = [(SBIconListModel *)self gridCellInfoWithOptions:a5];
  unint64_t v14 = [(SBIconListModel *)self gridCellIndexForIcon:v38 gridCellInfo:v13];
  unint64_t v15 = [(SBIconListModel *)self gridCellIndexForIcon:v10 gridCellInfo:v13];
  [(SBIconListModel *)self coordinateForGridCellIndex:v14 gridCellInfo:v13];
  uint64_t v35 = v16;
  [(SBIconListModel *)self coordinateForGridCellIndex:v15 gridCellInfo:v13];
  uint64_t v36 = v17;
  uint64_t v18 = [v38 gridSizeClass];
  uint64_t v19 = [v10 gridSizeClass];
  long long v37 = (void *)v18;
  unsigned __int16 v20 = (unsigned __int16)[(SBIconListModel *)self gridSizeForGridSizeClass:v18 gridCellInfoOptions:a5];
  unsigned __int16 v21 = (unsigned __int16)[(SBIconListModel *)self gridSizeForGridSizeClass:v19 gridCellInfoOptions:a5];
  if (v14 < v15)
  {
    id v22 = [(SBIconListModel *)self moveContainedIcon:v10 toGridCellIndex:v14 gridCellInfoOptions:a5 mutationOptions:v34];
    unint64_t v23 = v15 + v21 - v20;
    if (v20 >= v21) {
      unint64_t v23 = v15;
    }
    if (v20 > v21) {
      unint64_t v24 = v15 - (v20 - v21);
    }
    else {
      unint64_t v24 = v23;
    }
    if (v35 == v36) {
      unint64_t v25 = v24;
    }
    else {
      unint64_t v25 = v15;
    }
    unsigned int v26 = self;
    id v27 = v38;
    unint64_t v28 = a5;
    unint64_t v29 = v34;
LABEL_23:
    id v33 = [(SBIconListModel *)v26 moveContainedIcon:v27 toGridCellIndex:v25 gridCellInfoOptions:v28 mutationOptions:v29];
    goto LABEL_24;
  }
  if (v14 > v15)
  {
    id v30 = [(SBIconListModel *)self moveContainedIcon:v38 toGridCellIndex:v15 gridCellInfoOptions:a5 mutationOptions:v34];
    unint64_t v31 = v14 - (v21 - v20);
    if (v20 >= v21) {
      unint64_t v31 = v14;
    }
    if (v20 > v21) {
      unint64_t v32 = v14 + v20 - v21;
    }
    else {
      unint64_t v32 = v31;
    }
    if (v35 == v36) {
      unint64_t v25 = v32;
    }
    else {
      unint64_t v25 = v14;
    }
    unsigned int v26 = self;
    id v27 = v10;
    unint64_t v28 = a5;
    unint64_t v29 = v34;
    goto LABEL_23;
  }
LABEL_24:

LABEL_25:
}

- (void)performChangesByPreservingOrderOfDefaultSizedIcons:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  uint64_t v5 = [(SBIconListModel *)self icons];
  v4[2](v4);
  id v6 = [(SBIconListModel *)self icons];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __70__SBIconListModel_performChangesByPreservingOrderOfDefaultSizedIcons___block_invoke;
  v32[3] = &unk_1E6AADB28;
  v32[4] = self;
  unint64_t v29 = v5;
  id v7 = objc_msgSend(v5, "bs_filter:", v32);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __70__SBIconListModel_performChangesByPreservingOrderOfDefaultSizedIcons___block_invoke_2;
  v31[3] = &unk_1E6AADB28;
  v31[4] = self;
  unint64_t v28 = v6;
  unint64_t v8 = objc_msgSend(v6, "bs_filter:", v31);
  id v30 = v7;
  if (([v7 isEqualToArray:v8] & 1) == 0)
  {
    unint64_t v9 = [(SBIconListModel *)self numberOfIcons];
    if (v9)
    {
      unint64_t v10 = v9;
      id v27 = v4;
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      while (1)
      {
        id v13 = -[SBIconListModel iconAtIndex:](self, "iconAtIndex:", v12, v27);
        uint64_t v14 = [v13 gridSizeClass];
        if (v14) {
          break;
        }
        if (![(SBIconListModel *)self isIconFixed:v13]) {
          goto LABEL_9;
        }
LABEL_15:

        if (v10 == ++v12)
        {
          uint64_t v20 = 0;
          uint64_t v4 = v27;
          while (1)
          {
            unsigned __int16 v21 = [(SBIconListModel *)self iconAtIndex:v20];
            uint64_t v22 = [v21 gridSizeClass];
            if (v22) {
              break;
            }
            if ([v21 isPlaceholder]) {
              goto LABEL_22;
            }
LABEL_27:

            if (++v20 >= v10) {
              goto LABEL_28;
            }
          }
          unint64_t v23 = (void *)v22;
          unint64_t v24 = [v21 gridSizeClass];
          if ([v24 isEqualToString:@"SBHIconGridSizeClassDefault"])
          {
            char v25 = [v21 isPlaceholder];

            if ((v25 & 1) == 0) {
              goto LABEL_27;
            }
LABEL_22:
            unint64_t v23 = [v21 referencedIcon];
            icons = self->_icons;
            if (v23)
            {
              [(SBIconIndexMutableList *)icons replaceNodeAtIndex:v20 withNode:v23];
            }
            else
            {
              [(SBIconIndexMutableList *)icons removeNodeAtIndex:v20--];
              --v10;
            }
          }
          else
          {
          }
          goto LABEL_27;
        }
      }
      unint64_t v15 = (void *)v14;
      uint64_t v16 = [v13 gridSizeClass];
      if ([v16 isEqualToString:@"SBHIconGridSizeClassDefault"])
      {
        BOOL v17 = [(SBIconListModel *)self isIconFixed:v13];

        if (v17) {
          goto LABEL_15;
        }
LABEL_9:
        unint64_t v15 = [v30 objectAtIndex:v11];
        char v18 = [v8 containsObject:v15];
        if (v15 && (v18 & 1) != 0)
        {
          uint64_t v19 = +[SBPlaceholderIcon placeholderForIcon:v15];
        }
        else
        {
          uint64_t v19 = +[SBPlaceholderIcon placeholderForReason:@"preserveDefaultSizedIconOrder"];
        }
        uint64_t v16 = (void *)v19;
        [(SBIconIndexMutableList *)self->_icons replaceNodeAtIndex:v12 withNode:v19];
        ++v11;
      }

      goto LABEL_15;
    }
  }
LABEL_28:
}

uint64_t __70__SBIconListModel_performChangesByPreservingOrderOfDefaultSizedIcons___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 gridSizeClass];
  if (v4)
  {
    uint64_t v5 = [v3 gridSizeClass];
    if ([v5 isEqualToString:@"SBHIconGridSizeClassDefault"]) {
      uint64_t v6 = [*(id *)(a1 + 32) isIconFixed:v3] ^ 1;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) isIconFixed:v3] ^ 1;
  }

  return v6;
}

uint64_t __70__SBIconListModel_performChangesByPreservingOrderOfDefaultSizedIcons___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 gridSizeClass];
  if (v4)
  {
    uint64_t v5 = [v3 gridSizeClass];
    if ([v5 isEqualToString:@"SBHIconGridSizeClassDefault"]) {
      uint64_t v6 = [*(id *)(a1 + 32) isIconFixed:v3] ^ 1;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) isIconFixed:v3] ^ 1;
  }

  return v6;
}

- (void)performChangesByPreservingPositionsOfIconsLargerThanSizeClass:(id)a3 block:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  unint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  if (!v6 || [v6 isEqualToString:@"SBHIconGridSizeClassDefault"])
  {
    unint64_t v9 = [(SBIconListModel *)self iconGridSizeClassSizes];
    int v10 = [v9 gridSizeAreaForGridSizeClass:@"SBHIconGridSizeClassDefault"];
    icons = self->_icons;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    void v29[2] = __87__SBIconListModel_performChangesByPreservingPositionsOfIconsLargerThanSizeClass_block___block_invoke;
    v29[3] = &unk_1E6AB1C98;
    id v30 = v9;
    int v32 = v10;
    id v31 = v8;
    id v12 = v9;
    [(SBIconIndexMutableList *)icons enumerateNodesUsingBlock:v29];
  }
  unint64_t v24 = v6;
  v7[2](v7);
  id v13 = self->_icons;
  uint64_t v14 = [v8 allValues];
  [(SBIconIndexMutableList *)v13 removeNodesInArray:v14];

  unint64_t v15 = [v8 allKeys];
  uint64_t v16 = [v15 sortedArrayUsingSelector:sel_compare_];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v17 = v16;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        unint64_t v23 = [v8 objectForKey:v22];
        -[SBIconIndexMutableList insertNode:atIndex:](self->_icons, "insertNode:atIndex:", v23, [v22 unsignedIntegerValue]);
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v19);
  }
}

void __87__SBIconListModel_performChangesByPreservingPositionsOfIconsLargerThanSizeClass_block___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  uint64_t v5 = [v8 gridSizeClass];
  if ([*(id *)(a1 + 32) gridSizeAreaForGridSizeClass:v5] > *(_DWORD *)(a1 + 48))
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = [NSNumber numberWithUnsignedInteger:a3];
    [v6 setObject:v8 forKey:v7];
  }
}

- (id)largestClusteringSizeClassWithOptions:(unint64_t)a3
{
  uint64_t v5 = -[SBIconListModel gridSizeClassSizesWithOptions:](self, "gridSizeClassSizesWithOptions:");
  SBHIconGridSize v6 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeWithOptions:a3];
  id v7 = [(SBIconListModel *)self allowedGridSizeClasses];
  if (*(unsigned int *)&v6 < 0xFFFF0000) {
    [v5 largestGridSizeClassWhichTilesInGridSize:*(unsigned int *)&v6 allowedGridSizeClasses:v7];
  }
  else {
  id v8 = [v5 shortestGridSizeClassWithWidth:v6.columns allowedGridSizeClasses:v7];
  }

  return v8;
}

- (void)performChangesByClusteringForSizeClass:(id)a3 behavior:(unint64_t)a4 withGridCellInfoOptions:(unint64_t)a5 block:(id)a6
{
  id v17 = a3;
  int v10 = (void (**)(void))a6;
  SBHIconGridSize v11 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeForGridSizeClass:v17 gridCellInfoOptions:a5];
  id v12 = [(SBIconListModel *)self largestClusteringSizeClassWithOptions:a5];
  SBHIconGridSize v13 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeForGridSizeClass:v12 gridCellInfoOptions:a5];
  if (v11.columns <= v13.columns && HIWORD(*(unsigned int *)&v11) <= HIWORD(*(unsigned int *)&v13))
  {
    id v15 = v17;
  }
  else
  {
    id v14 = v12;

    id v15 = v14;
  }
  id v18 = v15;
  uint64_t v16 = [(SBIconListModel *)self _clusterIconsForSizeClass:v15 behavior:a4 gridCellInfoOptions:a5];
  v10[2](v10);

  [(SBIconListModel *)self _unclusterIcons:v16 ofSizeClass:v18 gridCellInfoOptions:a5];
}

- (id)_clusterIconsForSizeClass:(id)a3 behavior:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__SBIconListModel__clusterIconsForSizeClass_behavior_gridCellInfoOptions___block_invoke;
  v7[3] = &unk_1E6AB1CC0;
  v7[4] = self;
  void v7[5] = a5;
  uint64_t v5 = [(SBIconListModel *)self _clusterIconsForSizeClass:a3 behavior:a4 gridCellInfoProvider:v7];
  return v5;
}

uint64_t __74__SBIconListModel__clusterIconsForSizeClass_behavior_gridCellInfoOptions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) gridCellInfoWithOptions:*(void *)(a1 + 40) | 0xCLL];
}

- (id)_clusterIconsForSizeClass:(id)a3 behavior:(unint64_t)a4 gridCellInfoProvider:(id)a5
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  int v10 = (void (**)(void))a5;
  if (!v9 || ([v9 isEqualToString:@"SBHIconGridSizeClassDefault"] & 1) != 0)
  {
    id v11 = 0;
    goto LABEL_13;
  }
  id v12 = [MEMORY[0x1E4F1CA48] array];
  SBHIconGridSize v13 = v10[2](v10);
  if ([v13 isLayoutOutOfBounds])
  {
    id v14 = SBLogIcon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SBIconListModel _clusterIconsForSizeClass:behavior:gridCellInfoProvider:](v14);
    }
  }
  SBHIconGridSize v15 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeForGridSizeClass:v9 gridCellInfo:v13];
  uint64_t v68 = v15;
  unsigned int Area = SBHIconGridSizeGetArea(*(_DWORD *)&v15);
  if (Area != 1)
  {
    unsigned int v17 = Area;
    unint64_t v61 = v12;
    long long v62 = v10;
    id v63 = v9;
    unsigned int v18 = HIWORD(*(unsigned int *)&v15);
    unsigned int v19 = [v13 gridSize];
    if (HIWORD(*(unsigned int *)&v15) > HIWORD(v19))
    {
LABEL_11:
      id v12 = v61;
      id v11 = v61;
      int v10 = v62;
      id v9 = v63;
      goto LABEL_12;
    }
    uint64_t v21 = 0;
    unint64_t v71 = v17;
    LODWORD(v22) = HIWORD(v19) / v15.rows;
    unsigned int v23 = (unsigned __int16)v19;
    unint64_t v24 = v18 * (unint64_t)(unsigned __int16)v19;
    uint64_t v56 = HIWORD(*(unsigned int *)&v15);
    unsigned int v25 = v18 - 1;
    uint64_t columns = v15.columns;
    unsigned int v59 = v25;
    if (v25 <= 1) {
      unsigned int v25 = 1;
    }
    uint64_t v58 = (int)v25;
    if (v22 <= 1) {
      uint64_t v22 = 1;
    }
    else {
      uint64_t v22 = v22;
    }
    uint64_t v27 = -1;
    unint64_t v64 = (unsigned __int16)v19 / v15.columns;
    unint64_t v65 = a4;
    uint64_t v67 = v15.columns;
    unint64_t v69 = (unsigned __int16)v19;
    uint64_t v53 = v22;
    unint64_t v54 = v24;
    uint64_t v52 = -1;
    while (columns > v23)
    {
      ++v21;
LABEL_78:
      if (v21 == v22) {
        goto LABEL_11;
      }
    }
    uint64_t v28 = 0;
    unint64_t v66 = v24 * v21;
    uint64_t v60 = v21 * v56;
    uint64_t v55 = v21 + 1;
    uint64_t v57 = v27 + (v21 + 1) * v56;
    while (1)
    {
      uint64_t v74 = v28 * columns;
      if (objc_msgSend(v13, "iconIndexForGridCellIndex:", v28 * columns + v66, v52, v53, v54) == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_11;
      }
      uint64_t v73 = v28;
      unint64_t v70 = v28 * columns + v66;
      unint64_t v29 = -[SBIconListModel iconsForGridRange:gridCellInfo:](self, "iconsForGridRange:gridCellInfo:", v70, v68, v13);
      unint64_t v72 = [v29 count];
      long long v75 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      id v30 = v29;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v75 objects:v79 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        unint64_t v33 = 0;
        uint64_t v34 = *(void *)v76;
        do
        {
          for (uint64_t i = 0; i != v32; ++i)
          {
            if (*(void *)v76 != v34) {
              objc_enumerationMutation(v30);
            }
            uint64_t v36 = [*(id *)(*((void *)&v75 + 1) + 8 * i) gridSizeClass];
            SBHIconGridSize v37 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeForGridSizeClass:v36 gridCellInfo:v13];

            unint64_t v5 = v5 & 0xFFFFFFFF00000000 | *(unsigned int *)&v37;
            v33 += SBHIconGridSizeGetArea(v5);
          }
          uint64_t v32 = [v30 countByEnumeratingWithState:&v75 objects:v79 count:16];
        }
        while (v32);
      }
      else
      {
        unint64_t v33 = 0;
      }

      BOOL v39 = v65 == 1 || v72 > 1;
      if (v33 != v71) {
        BOOL v39 = 0;
      }
      if (v65 == 2 && !v39) {
        BOOL v39 = v33 <= v71;
      }
      if (v72 < 2) {
        break;
      }
      uint64_t columns = v67;
      if (v39) {
        goto LABEL_61;
      }
      BOOL v44 = v33 >= v71;
      unsigned int v23 = v69;
      if (!v44)
      {
        uint64_t v41 = v60;
        uint64_t v42 = v58;
        if (v59)
        {
          while (objc_msgSend(v13, "numberOfUsedGridCellsInRow:columnRange:", v41, v74, v67) == v69)
          {
            ++v41;
            if (!--v42) {
              goto LABEL_54;
            }
          }
          goto LABEL_75;
        }
LABEL_54:
        unint64_t v43 = objc_msgSend(v13, "numberOfUsedGridCellsInRow:columnRange:", v57, v74, v67);
        if (v43) {
          BOOL v44 = v43 >= v69;
        }
        else {
          BOOL v44 = 1;
        }
        BOOL v39 = !v44;
      }
LABEL_62:
      if (v65 == 1 && v39 && v72 == 1)
      {
        unint64_t v45 = [v30 firstObject];
        if ([v45 isClusteredIconPlaceholder])
        {
          uint64_t v46 = [v45 gridSizeClass];
          if ((id)v46 != v63)
          {
            unint64_t v47 = (void *)v46;
            SBHIconGridSize v48 = [v45 gridSizeClass];
            char v49 = [v48 isEqualToString:v63];

            uint64_t columns = v67;
            unsigned int v23 = v69;
            if ((v49 & 1) == 0) {
              goto LABEL_68;
            }
LABEL_74:

            goto LABEL_75;
          }
          unint64_t v51 = v63;
          unsigned int v23 = v69;
        }
        else
        {
LABEL_68:

LABEL_70:
          unint64_t v45 = +[SBPlaceholderIcon clusteredIconPlaceholderForIcons:v30];
          [v45 setGridSizeClass:v63];
          [v61 addObject:v45];
          -[SBIconIndexMutableList insertNode:atIndex:](self->_icons, "insertNode:atIndex:", v45, [v13 iconIndexForGridCellIndex:v70]);
          [(SBIconIndexMutableList *)self->_icons removeNodesInArray:v30];
          if ([(SBIconListModel *)self isInsertionFixedForIconGridSizeClass:v63 options:0])
          {
            [(SBIconListModel *)self setFixedLocation:v70 forIcon:v45 options:0x800000];
          }
          uint64_t v50 = ((void (*)(void))v62[2])();
          unint64_t v51 = v13;
          SBHIconGridSize v13 = (void *)v50;
        }

        goto LABEL_74;
      }
      if (v39) {
        goto LABEL_70;
      }
LABEL_75:

      uint64_t v28 = v73 + 1;
      if (v73 + 1 >= v64)
      {
        unint64_t v24 = v54;
        uint64_t v21 = v55;
        uint64_t v27 = v52;
        uint64_t v22 = v53;
        goto LABEL_78;
      }
    }
    uint64_t columns = v67;
LABEL_61:
    unsigned int v23 = v69;
    goto LABEL_62;
  }
  id v11 = 0;
LABEL_12:

LABEL_13:
  return v11;
}

- (BOOL)_canClusterIconsUsingSizeClass:(id)a3
{
  SBHIconGridSize v4 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeForGridSizeClass:a3];
  SBHIconGridSize v5 = (SBHIconGridSize)[(SBIconListModel *)self gridSize];
  return (HIWORD(*(unsigned int *)&v5) == 0xFFFF || !(HIWORD(*(unsigned int *)&v5) % HIWORD(*(unsigned int *)&v4)))
      && (v5.columns == 0xFFFF || !(v5.columns % v4.columns));
}

- (void)_unclusterIcons:(id)a3 ofSizeClass:(id)a4 gridCellInfoOptions:(unint64_t)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__SBIconListModel__unclusterIcons_ofSizeClass_gridCellInfoOptions___block_invoke;
  v5[3] = &unk_1E6AB1CE8;
  v5[4] = self;
  [(SBIconListModel *)self _unclusterIcons:a3 ofSizeClass:a4 baseGridCellInfoOptions:a5 gridCellInfoProvider:v5];
}

uint64_t __67__SBIconListModel__unclusterIcons_ofSizeClass_gridCellInfoOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) gridCellInfoWithOptions:a2];
}

- (void)_unclusterIcons:(id)a3 ofSizeClass:(id)a4 baseGridCellInfoOptions:(unint64_t)a5 gridCellInfoProvider:(id)a6
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v46 = (void (**)(id, unint64_t))a6;
  [(SBIconListModel *)self iconLayoutBehavior];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  obuint64_t j = v9;
  uint64_t v40 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v40)
  {
    uint64_t v38 = *(void *)v50;
    unint64_t v45 = a5 | 0xC;
    unint64_t v39 = a5;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v50 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v43 = v10;
        id v11 = *(void **)(*((void *)&v49 + 1) + 8 * v10);
        unint64_t v12 = [(SBIconListModel *)self indexForIcon:v11];
        SBHIconGridSize v13 = v46[2](v46, a5);
        id v14 = [v11 gridSizeClass];
        SBHIconGridSize v15 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeForGridSizeClass:v14 gridCellInfoOptions:a5];

        uint64_t v47 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v48 = 0x7FFFFFFFFFFFFFFFLL;
        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v16 = [v13 gridCellIndexForIconIndex:v12];
          uint64_t v47 = 0x7FFFFFFFFFFFFFFFLL;
          uint64_t v48 = 0x7FFFFFFFFFFFFFFFLL;
          if (v16 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v47 = [v13 coordinateForGridCellIndex:v16];
            uint64_t v48 = v17;
          }
        }
        uint64_t v42 = v13;
        [(SBIconIndexMutableList *)self->_icons removeNode:v11];
        [(SBIconListModel *)self removeFixedIconLocationForIcon:v11];
        uint64_t v18 = [(SBIconListModel *)self gridSizeClassSizesWithOptions:a5];
        unsigned int v19 = [v11 referencedIcons];
        unint64_t v44 = v44 & 0xFFFFFFFF00000000 | *(unsigned int *)&v15;
        uint64_t v41 = (void *)v18;
        uint64_t v20 = objc_msgSend((id)objc_opt_class(), "iconGridCellInfoForIcons:gridSize:gridSizeClassSizes:iconLayoutBehavior:referenceIconOrder:fixedIconLocations:options:", v19, a5);
        if ([v19 count])
        {
          unint64_t v21 = 0;
          do
          {
            uint64_t v22 = v46[2](v46, v45);
            unsigned int v23 = [v19 objectAtIndex:v21];
            uint64_t v24 = objc_msgSend(v20, "coordinateForGridCellIndex:", objc_msgSend(v20, "gridCellIndexForIconIndex:", v21));
            uint64_t v26 = v25;
            BOOL IsNotFound = SBIconCoordinateIsNotFound(v47, v48);
            if (IsNotFound) {
              uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
            }
            else {
              uint64_t v28 = v47 - 1 + v24;
            }
            if (IsNotFound) {
              uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
            }
            else {
              uint64_t v29 = v48 - 1 + v26;
            }
            unint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
            if (SBIconCoordinateIsNotFound(v28, v29)
              || (uint64_t v31 = objc_msgSend(v22, "gridCellIndexForCoordinate:", v28, v29), v31 == 0x7FFFFFFFFFFFFFFFLL)
              || (unint64_t v32 = v31,
                  uint64_t v33 = [v22 iconIndexForGridCellIndex:v31],
                  unint64_t v30 = v32,
                  v33 == 0x7FFFFFFFFFFFFFFFLL))
            {
              unint64_t v34 = [(SBIconIndexMutableList *)self->_icons count];
              unint64_t v35 = v30;
              if (v34) {
                unint64_t v35 = [v22 gridCellIndexForIconIndex:v34 - 1];
              }
              if (v35 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v36 = v30 + 1, v30 + 1 > v35))
              {
LABEL_28:
                uint64_t v33 = [(SBIconIndexMutableList *)self->_icons count];
              }
              else
              {
                while (1)
                {
                  uint64_t v33 = [v22 iconIndexForGridCellIndex:v36];
                  if (v33 != 0x7FFFFFFFFFFFFFFFLL && [v22 gridCellIndexForIconIndex:v33] > v30) {
                    break;
                  }
                  if (++v36 > v35)
                  {
                    if (v33 != 0x7FFFFFFFFFFFFFFFLL) {
                      break;
                    }
                    goto LABEL_28;
                  }
                }
              }
            }
            [(SBIconIndexMutableList *)self->_icons insertNode:v23 atIndex:v33];

            ++v21;
          }
          while (v21 < [v19 count]);
        }

        uint64_t v10 = v43 + 1;
        a5 = v39;
      }
      while (v43 + 1 != v40);
      uint64_t v40 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
    }
    while (v40);
  }
}

- (int64_t)_moveIcon:(id)a3 byClusteringForSizeClass:(id)a4 toGridCellIndex:(unint64_t)a5 gridCellInfoOptions:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v20 = 0;
  unint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__SBIconListModel__moveIcon_byClusteringForSizeClass_toGridCellIndex_gridCellInfoOptions___block_invoke;
  v15[3] = &unk_1E6AB1D38;
  unint64_t v18 = a5;
  v15[4] = self;
  id v12 = v10;
  unint64_t v19 = a6;
  id v16 = v12;
  uint64_t v17 = &v20;
  [(SBIconListModel *)self performChangesByClusteringForSizeClass:v11 behavior:0 withGridCellInfoOptions:a6 block:v15];
  int64_t v13 = v21[3];

  _Block_object_dispose(&v20, 8);
  return v13;
}

void __90__SBIconListModel__moveIcon_byClusteringForSizeClass_toGridCellIndex_gridCellInfoOptions___block_invoke(uint64_t a1)
{
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__14;
  uint64_t v26 = __Block_byref_object_dispose__14;
  id v27 = 0;
  uint64_t v18 = 0;
  unint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = *(void *)(a1 + 56);
  if ([*(id *)(a1 + 32) directlyContainsIcon:*(void *)(a1 + 40)])
  {
    id v2 = v23;
    id v3 = *(id *)(a1 + 40);
    SBHIconGridSize v4 = (void *)v2[5];
    v2[5] = (uint64_t)v3;
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __90__SBIconListModel__moveIcon_byClusteringForSizeClass_toGridCellIndex_gridCellInfoOptions___block_invoke_2;
    v12[3] = &unk_1E6AB1D10;
    SBHIconGridSize v5 = *(void **)(a1 + 32);
    id v6 = *(id *)(a1 + 40);
    SBHIconGridSize v15 = &v22;
    id v16 = &v18;
    uint64_t v7 = *(void *)(a1 + 32);
    id v13 = v6;
    uint64_t v14 = v7;
    uint64_t v17 = *(void *)(a1 + 56);
    [v5 enumerateIconsUsingBlock:v12];
    SBHIconGridSize v4 = v13;
  }

  if (v23[5])
  {
    id v8 = [*(id *)(a1 + 32) gridCellInfoWithOptions:*(void *)(a1 + 64)];
    uint64_t v9 = [*(id *)(a1 + 32) _iconIndexForMovingIcon:v23[5] toGridCellIndex:v19[3] gridCellInfo:v8];
    [*(id *)(*(void *)(a1 + 32) + 8) moveNode:v23[5] toIndex:v9];
    id v10 = [*(id *)(a1 + 32) gridCellInfoWithOptions:*(void *)(a1 + 64)];

    uint64_t v11 = [v10 gridCellIndexForIconIndex:v9];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v11 - v19[3];
  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
}

void __90__SBIconListModel__moveIcon_byClusteringForSizeClass_toGridCellIndex_gridCellInfoOptions___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 referencesIcon:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 40) bestGridCellIndexForInsertingIcon:*(void *)(*(void *)(*(void *)(a1 + 48) + 8)+ 40) atGridCellIndex:*(void *)(a1 + 64)];
    *a4 = 1;
  }
}

- (unint64_t)_iconIndexForMovingIcon:(id)a3 toGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v9 iconIndexForGridCellIndex:a4];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v11 = [(SBIconIndexMutableList *)self->_icons count] - 1;
  }
  else if (a4)
  {
    unint64_t v11 = v10;
    id v36 = [(SBIconIndexMutableList *)self->_icons nodeAtIndex:v10];
    id v12 = [v36 gridSizeClass];
    SBHIconGridSize v13 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeForGridSizeClass:v12 gridCellInfo:v9];

    uint64_t v14 = [v8 gridSizeClass];
    SBHIconGridSize v15 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeForGridSizeClass:v14 gridCellInfo:v9];

    unsigned int v16 = [v9 gridSize];
    unsigned __int16 v17 = v16;
    uint64_t v18 = HIWORD(v16);
    long long v37 = 0u;
    long long v38 = 0u;
    SBHIconGridRangeGetBounds(a4, *(_DWORD *)&v15, v16, (unint64_t *)&v37);
    if (*((void *)&v38 + 1) == v18 && *((void *)&v37 + 1) == v17)
    {
      unint64_t v11 = [(SBIconIndexMutableList *)self->_icons count] - 1;
    }
    else
    {
      uint64_t v19 = HIWORD(*(unsigned int *)&v13);
      if (v19 > HIWORD(*(unsigned int *)&v15))
      {
        objc_msgSend(v9, "coordinateForGridCellIndex:", objc_msgSend(v9, "gridCellIndexForIconIndex:", v11));
        uint64_t v21 = v20;
        objc_msgSend(v9, "coordinateForGridCellIndex:", objc_msgSend(v9, "gridCellIndexForIconIndex:", -[SBIconListModel indexForIcon:](self, "indexForIcon:", v8)));
        uint64_t v23 = v22;
        [v9 coordinateForGridCellIndex:a4];
        if (v23 <= v21)
        {
          uint64_t v27 = v21 + v19 - v24;
          if (v27 < 0) {
            uint64_t v27 = v24 - (v21 + v19);
          }
          unint64_t v28 = v23 - v24;
          if (v23 - v24 < 0) {
            unint64_t v28 = v24 - v23;
          }
          if (v11) {
            BOOL v29 = v27 > v28;
          }
          else {
            BOOL v29 = 0;
          }
          uint64_t v30 = v29;
          v11 -= v30;
        }
        else
        {
          unint64_t v25 = v21 - v24;
          if (v21 - v24 < 0) {
            unint64_t v25 = v24 - v21;
          }
          unint64_t v26 = v23 - v24;
          if (v23 - v24 < 0) {
            unint64_t v26 = v24 - v23;
          }
          if (v25 >= v26) {
            ++v11;
          }
        }
      }
    }
    if (v36 == v8 && v11 + 1 < [(SBIconIndexMutableList *)self->_icons count])
    {
      unint64_t v31 = [v9 gridCellIndexForIconIndex:v11];
      unint64_t v32 = a4 - v31;
      if (a4 > v31)
      {
        uint64_t v33 = [(SBIconIndexMutableList *)self->_icons nodeAtIndex:v11 + 1];
        unint64_t v34 = [v33 gridSizeClass];
        if (v32 >= SBHIconGridSizeGetArea([(SBIconListModel *)self gridSizeForGridSizeClass:v34 gridCellInfo:v9]))++v11; {
      }
        }
    }
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

+ (id)movedIconsWithOriginalOrder:(id)a3 newOrder:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  if ([v6 count])
  {
    unint64_t v8 = 0;
    do
    {
      id v9 = [v5 objectAtIndex:v8];
      uint64_t v10 = [v6 objectAtIndex:v8];
      if (v9 != v10) {
        [v7 addObject:v10];
      }

      ++v8;
    }
    while (v8 < [v6 count]);
  }

  return v7;
}

- (id)movedIconsFromGridCellInfo:(id)a3 withIconOrder:(id)a4 toGridCellInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v12 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  uint64_t v13 = [v10 usedGridRange];
  int v15 = v14;
  unsigned __int16 v16 = [v8 gridSize];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __75__SBIconListModel_movedIconsFromGridCellInfo_withIconOrder_toGridCellInfo___block_invoke;
  v25[3] = &unk_1E6AB1D60;
  id v26 = v10;
  id v27 = v12;
  unint64_t v28 = self;
  id v29 = v9;
  id v30 = v8;
  id v17 = v11;
  id v31 = v17;
  id v18 = v8;
  id v19 = v9;
  id v20 = v12;
  id v21 = v10;
  SBHIconGridRangeEnumerateCellIndexes(v13, v15, v16, v25);
  uint64_t v22 = v31;
  id v23 = v17;

  return v23;
}

void __75__SBIconListModel_movedIconsFromGridCellInfo_withIconOrder_toGridCellInfo___block_invoke(id *a1, uint64_t a2)
{
  uint64_t v4 = [a1[4] iconIndexForGridCellIndex:a2];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = v4;
    if (([a1[5] containsIndex:v4] & 1) == 0)
    {
      [a1[5] addIndex:v5];
      id v8 = [a1[6] iconAtIndex:v5];
      uint64_t v6 = objc_msgSend(a1[7], "indexOfObjectIdenticalTo:");
      uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
      if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v7 = objc_msgSend(a1[8], "gridCellIndexForIconIndex:");
      }
      if (v7 != a2) {
        [a1[9] addObject:v8];
      }
    }
  }
}

- (SBIconListModelRotationReorderingInfo)_rotationReorderingInfoWithClusterSizeClass:(SEL)a3 gridCellInfoOptions:(id)a4
{
  unint64_t v45 = retstr;
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v47 = a4;
  long long v62 = self;
  uint64_t v46 = [(SBIconListModel *)self icons];
  if (v47)
  {
    if (!objc_msgSend(v47, "isEqualToString:"))
    {
      SBHIconGridSize v6 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeWithOptions:a5];
      unsigned __int16 columns = v6.columns;
      unint64_t v8 = v6;
      BOOL IsLandscape = SBHIconGridSizeIsLandscape(*(_DWORD *)&v6);
      SmallestDimensiouint64_t n = SBHIconGridSizeGetSmallestDimension(v8);
      unsigned int Area = SBHIconGridSizeGetArea([(SBIconListModel *)v62 gridSizeForGridSizeClass:v47 gridCellInfoOptions:a5]);
      unsigned int v12 = SBHIconGridSizeGetArea(v8);
      if ((double)SBHIconGridSizeGetArea(SmallestDimension | (SmallestDimension << 16)) * 1.5 == (double)v12)
      {
        unsigned int v54 = Area;
        unint64_t v58 = v8;
        int v14 = [(SBIconListModel *)v62 gridCellInfoWithOptions:a5];
        int v15 = columns;
        if (columns >= 0x40u)
        {
          unsigned __int16 v16 = (char *)malloc_type_calloc(columns, 8uLL, 0x100004000313F17uLL);
          id v17 = v16;
        }
        else
        {
          unsigned __int16 v16 = 0;
          id v17 = &v96;
        }
        uint64_t v91 = 0;
        long long v92 = &v91;
        uint64_t v93 = 0x2020000000;
        uint64_t v94 = 0;
        v90[0] = 0;
        v90[1] = v90;
        v90[2] = 0x2020000000;
        v90[3] = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v86 = 0;
        long long v87 = &v86;
        uint64_t v88 = 0x2020000000;
        char v89 = 0;
        v78[0] = MEMORY[0x1E4F143A8];
        v78[1] = 3221225472;
        v78[2] = __83__SBIconListModel__rotationReorderingInfoWithClusterSizeClass_gridCellInfoOptions___block_invoke;
        v78[3] = &unk_1E6AB1D88;
        id v57 = v14;
        id v79 = v57;
        long long v84 = v17;
        int v85 = v8;
        id v18 = v46;
        id v80 = v18;
        long long v81 = v90;
        long long v82 = &v86;
        long long v83 = &v91;
        SBHIconGridRangeEnumerateSubranges(0, v8, v15 | 0x10000, v8, 0, v78);
        free(v16);
        unint64_t v19 = [v18 indexOfObjectPassingTest:&__block_literal_global_73];
        unint64_t v20 = [v18 indexOfObjectWithOptions:2 passingTest:&__block_literal_global_75_0];
        BOOL v22 = v19 != 0x7FFFFFFFFFFFFFFFLL && v20 != 0x7FFFFFFFFFFFFFFFLL && v19 > v20;
        char v23 = v22;
        *(_OWORD *)&v45->var0 = 0u;
        *(_OWORD *)&v45->var2 = 0u;
        v45->var0 = v23 ^ 1;
        v45->var2 = v92[3];
        v45->var3 = *((unsigned char *)v87 + 24);
        if (v22) {
          goto LABEL_56;
        }
        unint64_t v76 = 0;
        uint64_t v77 = 0;
        unint64_t v74 = 0;
        uint64_t v75 = 0;
        uint64_t v72 = 0;
        int v73 = 0;
        SBHIconGridRangeDivide(0, v8, (uint64_t)&v76, (uint64_t)&v72, SmallestDimension, !IsLandscape, v8);
        uint64_t v70 = 0;
        int v71 = 0;
        if (IsLandscape) {
          int v24 = 2;
        }
        else {
          int v24 = 3;
        }
        SBHIconGridRangeDivide(0, v8, (uint64_t)&v74, (uint64_t)&v70, SmallestDimension, v24, v8);
        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        obuint64_t j = v18;
        uint64_t v25 = [obj countByEnumeratingWithState:&v66 objects:v95 count:16];
        if (v25)
        {
          unint64_t v55 = 0;
          unint64_t v56 = 0;
          unint64_t v51 = 0;
          unint64_t v52 = 0;
          unint64_t v26 = 0;
          char v53 = 0;
          char v50 = 0;
          uint64_t v64 = *(void *)v67;
          do
          {
            uint64_t v65 = v25;
            for (uint64_t i = 0; i != v65; ++i)
            {
              if (*(void *)v67 != v64) {
                objc_enumerationMutation(obj);
              }
              unint64_t v28 = *(void **)(*((void *)&v66 + 1) + 8 * i);
              id v29 = objc_msgSend(v28, "gridSizeClass", v45);
              id v30 = v29;
              if (v29 && ([v29 isEqualToString:@"SBHIconGridSizeClassDefault"] & 1) == 0)
              {
                unsigned int v31 = SBHIconGridSizeGetArea([(SBIconListModel *)v62 gridSizeForGridSizeClass:v30 gridCellInfoOptions:a5]);
                uint64_t v32 = v31 > v54;
                if (v31 > v54) {
                  ++v26;
                }
                uint64_t v33 = objc_msgSend(v57, "gridCellIndexForIconIndex:", -[SBIconListModel indexForIcon:](v62, "indexForIcon:", v28));
                int v34 = [(SBIconListModel *)v62 gridSizeForGridSizeClass:v30 gridCellInfoOptions:a5];
                unint64_t v61 = v61 & 0xFFFFFFFF00000000 | v58;
                uint64_t v35 = SBHIconGridRangeIntersection(v33, v34, v76, v77, v58);
                unsigned int v37 = v36;
                unint64_t v60 = v60 & 0xFFFFFFFF00000000 | v58;
                uint64_t v38 = SBHIconGridRangeIntersection(v33, v34, v74, v75, v58);
                unsigned int v40 = v39;
                if (v35 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  BOOL v41 = SBHIconGridRangeEqualToIconGridRange(v35, v37, v33, v34);
                  v52 += v32;
                  unint64_t v49 = v49 & 0xFFFFFFFF00000000 | v37;
                  v56 += SBHIconGridSizeGetArea(v37);
                  v53 |= !v41;
                }
                if (v38 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  BOOL v42 = SBHIconGridRangeEqualToIconGridRange(v38, v40, v33, v34);
                  v51 += v32;
                  unint64_t v48 = v48 & 0xFFFFFFFF00000000 | v40;
                  v55 += SBHIconGridSizeGetArea(v40);
                  v50 |= !v42;
                }
              }
            }
            uint64_t v25 = [obj countByEnumeratingWithState:&v66 objects:v95 count:16];
          }
          while (v25);
        }
        else
        {
          unint64_t v55 = 0;
          unint64_t v56 = 0;
          unint64_t v51 = 0;
          unint64_t v52 = 0;
          unint64_t v26 = 0;
          char v53 = 0;
          char v50 = 0;
        }

        if (v56) {
          BOOL v43 = v56 == v55;
        }
        else {
          BOOL v43 = 0;
        }
        int v44 = v43;
        if (v26 < 2)
        {
          if ((v52 <= v51) | v53 & 1)
          {
            if (!((v52 >= v51) | v50 & 1)) {
              goto LABEL_55;
            }
            if ((v56 <= v55) & ~v44 | v53 & 1)
            {
              if (!((v56 >= v55) | v50 & 1)) {
                goto LABEL_55;
              }
              if (v53) {
                goto LABEL_48;
              }
            }
          }
        }
        else if ((v52 != v26) | v53 & 1)
        {
          if ((v51 != v26) | v50 & 1)
          {
LABEL_48:
            v45->var0 = 0;
LABEL_56:

            _Block_object_dispose(&v86, 8);
            _Block_object_dispose(v90, 8);
            _Block_object_dispose(&v91, 8);

            goto LABEL_5;
          }
LABEL_55:
          v45->var1 = 1;
          goto LABEL_56;
        }
        v45->var1 = 0;
        goto LABEL_56;
      }
    }
  }
  *(_OWORD *)&v45->var0 = 0u;
  *(_OWORD *)&v45->var2 = 0u;
LABEL_5:

  return result;
}

void __83__SBIconListModel__rotationReorderingInfoWithClusterSizeClass_gridCellInfoOptions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "getIconIndexes:inGridRange:", *(void *)(a1 + 72), a2, a3);
  unsigned int v7 = *(unsigned __int16 *)(a1 + 80);
  if (!*(_WORD *)(a1 + 80)) {
    goto LABEL_20;
  }
  uint64_t v8 = v6;
  unint64_t v9 = 0;
  uint64_t v10 = 0;
  while (1)
  {
    unint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8 * v10);
    if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
LABEL_13:
    if (++v10 >= (unint64_t)v7) {
      goto LABEL_18;
    }
  }
  unsigned int v12 = [*(id *)(a1 + 40) objectAtIndex:*(void *)(*(void *)(a1 + 72) + 8 * v10)];
  uint64_t v13 = [v12 gridSizeClass];
  int v14 = v13;
  if (v13 && ([v13 isEqualToString:@"SBHIconGridSizeClassDefault"] & 1) == 0)
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
    unint64_t v16 = *(void *)(v15 + 24);
    if (v16 == 0x7FFFFFFFFFFFFFFFLL || v11 > v16) {
      *(void *)(v15 + 24) = v11;
    }
    ++v9;

    unsigned int v7 = *(unsigned __int16 *)(a1 + 80);
    goto LABEL_13;
  }
  if (v10) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }

LABEL_18:
  if (v8 - 1 < v9)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    return;
  }
LABEL_20:
  *a4 = 1;
}

uint64_t __83__SBIconListModel__rotationReorderingInfoWithClusterSizeClass_gridCellInfoOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 gridSizeClass];
  if (v3)
  {
    uint64_t v4 = [v2 gridSizeClass];
    uint64_t v5 = [v4 isEqualToString:@"SBHIconGridSizeClassDefault"];
  }
  else
  {
    uint64_t v5 = 1;
  }

  return v5;
}

uint64_t __83__SBIconListModel__rotationReorderingInfoWithClusterSizeClass_gridCellInfoOptions___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 gridSizeClass];
  if (v3)
  {
    uint64_t v4 = [v2 gridSizeClass];
    uint64_t v5 = [v4 isEqualToString:@"SBHIconGridSizeClassDefault"] ^ 1;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_reorderedIconsWithClusterSizeClass:(id)a3 forRotationWithReorderingInfo:(SBIconListModelRotationReorderingInfo *)a4 gridCellInfoOptions:(unint64_t)a5
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  unint64_t v9 = [(SBIconListModel *)self icons];
  if (v8
    && ![v8 isEqualToString:@"SBHIconGridSizeClassDefault"]
    && (SBHIconGridSize v10 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeWithOptions:a5],
        unint64_t v11 = v10,
        BOOL IsLandscape = SBHIconGridSizeIsLandscape(*(_DWORD *)&v10),
        unint64_t v13 = [(SBIconListModel *)self iconLayoutBehavior],
        a4->var0))
  {
    unint64_t v50 = v13;
    unsigned int v14 = SBHIconGridSizeRotate(v11);
    SmallestDimensiouint64_t n = SBHIconGridSizeGetSmallestDimension(v11);
    unsigned int Area = SBHIconGridSizeGetArea(SmallestDimension | (SmallestDimension << 16));
    uint64_t v69 = 0;
    uint64_t v70 = 0;
    uint64_t v67 = 0;
    uint64_t v68 = 0;
    uint64_t v65 = 0;
    int v66 = 0;
    SBHIconGridRangeDivide(0, v11, (uint64_t)&v69, (uint64_t)&v65, SmallestDimension, !IsLandscape, v11);
    uint64_t v63 = 0;
    int v64 = 0;
    if (IsLandscape) {
      int v17 = 2;
    }
    else {
      int v17 = 3;
    }
    SBHIconGridRangeDivide(0, v11, (uint64_t)&v67, (uint64_t)&v63, SmallestDimension, v17, v11);
    unint64_t v52 = [(SBIconListModel *)self gridCellInfoWithOptions:a5];
    unsigned int v18 = v14;
    uint64_t v47 = v14;
    unint64_t v19 = -[SBIconListGridCellInfo initWithGridSize:]([SBIconListGridCellInfo alloc], "initWithGridSize:");
    unint64_t v51 = [(SBIconListModel *)self gridSizeClassSizesWithOptions:a5];
    unint64_t v48 = [(SBIconListModel *)self rotatedGridCellInfoOptions:a5];
    if (Area >= 0x40)
    {
      unint64_t v20 = (char *)malloc_type_calloc(Area, 8uLL, 0x100004000313F17uLL);
      id v21 = v20;
    }
    else
    {
      unint64_t v20 = 0;
      id v21 = &v71;
    }
    unint64_t var1 = a4->var1;
    unint64_t v49 = v20;
    if (var1 == 1)
    {
      objc_msgSend(v52, "getIconIndexes:inGridRange:", v21, v67, v68);
      if (IsLandscape) {
        int v27 = (HIWORD(v18) - WORD1(v68)) * (unsigned __int16)v18;
      }
      else {
        int v27 = (unsigned __int16)v18 - (unsigned __int16)v68;
      }
      -[SBIconListGridCellInfo setIconIndexes:inGridRange:](v19, "setIconIndexes:inGridRange:", v21, v27, v68);
      id v29 = SBHIconGridRangeCellIndexesNotInIconGridRange(v69, v70, v67, v68, v11);
      id v38 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __105__SBIconListModel__reorderedIconsWithClusterSizeClass_forRotationWithReorderingInfo_gridCellInfoOptions___block_invoke_2;
      v57[3] = &unk_1E6AB0BF8;
      uint64_t v46 = &v58;
      unsigned int v31 = &v59;
      id v58 = v52;
      id v59 = v38;
      id v32 = v38;
      [v29 enumerateIndexesUsingBlock:v57];
      uint64_t v33 = objc_opt_class();
      uint64_t v25 = v47;
      unint64_t v45 = v48;
      unint64_t v43 = v50;
      int v44 = v9;
      int v34 = v9;
      id v35 = v32;
      unsigned int v36 = v19;
      unint64_t v37 = 0;
    }
    else
    {
      if (var1)
      {
        id v42 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Unknown clustering zone" userInfo:0];
        objc_exception_throw(v42);
      }
      objc_msgSend(v52, "getIconIndexes:inGridRange:", v21, v69, v70);
      -[SBIconListGridCellInfo setIconIndexes:inGridRange:](v19, "setIconIndexes:inGridRange:", v21, v69, v70);
      uint64_t v25 = v47;
      if (IsLandscape) {
        unint64_t v26 = SBHIconGridRangeMaxCellIndex(v69, v70, v47);
      }
      else {
        unint64_t v26 = SBHIconGridRangeMaxCellIndexOnRow(v69, v70, v47, 0);
      }
      unint64_t v28 = v26;
      id v29 = SBHIconGridRangeCellIndexesNotInIconGridRange(v67, v68, v69, v70, v11);
      id v30 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __105__SBIconListModel__reorderedIconsWithClusterSizeClass_forRotationWithReorderingInfo_gridCellInfoOptions___block_invoke;
      v60[3] = &unk_1E6AB0BF8;
      uint64_t v46 = &v61;
      unsigned int v31 = &v62;
      id v61 = v52;
      id v62 = v30;
      id v32 = v30;
      [v29 enumerateIndexesUsingBlock:v60];
      uint64_t v33 = objc_opt_class();
      unint64_t v45 = v48;
      unint64_t v43 = v50;
      int v44 = v9;
      int v34 = v9;
      id v35 = v32;
      unsigned int v36 = v19;
      unint64_t v37 = v28;
    }
    [v33 layOutIcons:v34 atIndexes:v35 inGridCellInfo:v36 startingAtGridCellIndex:v37 gridSize:v25 gridSizeClassSizes:v51 iconLayoutBehavior:v43 referenceIconOrder:v44 fixedIconLocations:0 options:v45];

    id v39 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __105__SBIconListModel__reorderedIconsWithClusterSizeClass_forRotationWithReorderingInfo_gridCellInfoOptions___block_invoke_3;
    v53[3] = &unk_1E6AB1DB0;
    unsigned int v54 = v19;
    unint64_t v55 = self;
    id v56 = v39;
    id v40 = v39;
    BOOL v41 = v19;
    SBHIconGridRangeEnumerateCellIndexes(0, v25, v25, v53);
    free(v49);
    id v22 = [v40 array];
  }
  else
  {
    id v22 = v9;
  }

  return v22;
}

uint64_t __105__SBIconListModel__reorderedIconsWithClusterSizeClass_forRotationWithReorderingInfo_gridCellInfoOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) iconIndexForGridCellIndex:a2];
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void **)(a1 + 40);
    return [v5 addIndex:v4];
  }
  return result;
}

uint64_t __105__SBIconListModel__reorderedIconsWithClusterSizeClass_forRotationWithReorderingInfo_gridCellInfoOptions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) iconIndexForGridCellIndex:a2];
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void **)(a1 + 40);
    return [v5 addIndex:v4];
  }
  return result;
}

void __105__SBIconListModel__reorderedIconsWithClusterSizeClass_forRotationWithReorderingInfo_gridCellInfoOptions___block_invoke_3(id *a1, uint64_t a2)
{
  uint64_t v3 = [a1[4] iconIndexForGridCellIndex:a2];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = [a1[5] iconAtIndex:v3];
    [a1[6] addObject:v4];
  }
}

- (void)_reorderIconsWithClusterSizeClass:(id)a3 forRotationWithReorderingInfo:(SBIconListModelRotationReorderingInfo *)a4 gridCellInfoOptions:(unint64_t)a5
{
  long long v6 = *(_OWORD *)&a4->var2;
  v10[0] = *(_OWORD *)&a4->var0;
  v10[1] = v6;
  unsigned int v7 = [(SBIconListModel *)self _reorderedIconsWithClusterSizeClass:a3 forRotationWithReorderingInfo:v10 gridCellInfoOptions:a5];
  id v8 = [(SBIconListModel *)self icons];
  if (([v7 isEqualToArray:v8] & 1) == 0) {
    id v9 = [(SBIconListModel *)self setIcons:v7 gridCellInfoOptions:0 mutationOptions:0x100000];
  }
}

- (void)_reorderIconsAfterUnclusteringWithClusterSizeClass:(id)a3 forRotationWithReorderingInfo:(SBIconListModelRotationReorderingInfo *)a4 gridCellInfoOptions:(unint64_t)a5
{
  id v8 = a3;
  if (!a4->var0 && a4->var2 == 1)
  {
    id v9 = v8;
    [(SBIconListModel *)self _moveAllNonDefaultSizedIconsToBeginning];
    id v8 = v9;
    if (!a4->var3)
    {
      [(SBIconListModel *)self _moveDefaultSizedIconsOfCountIntoContiguousLeadingNonDefaultSizedIcons:(unsigned __int16)[(SBIconListModel *)self gridSizeForGridSizeClass:v9 gridCellInfoOptions:a5]];
      id v8 = v9;
    }
  }
}

- (void)_moveAllNonDefaultSizedIconsToBeginning
{
  uint64_t v3 = [(SBIconListModel *)self icons];
  uint64_t v4 = [v3 count];
  uint64_t v5 = [v3 indexOfObjectPassingTest:&__block_literal_global_82];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = v5;
    while (1)
    {
      uint64_t v8 = -[SBIconListModel rangeOfDirectlyContainedIconsInRange:passingTest:](self, "rangeOfDirectlyContainedIconsInRange:passingTest:", v7, v4 - v7, &__block_literal_global_84);
      if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      SBHIconGridSize v10 = -[SBIconListModel iconsInRange:](self, "iconsInRange:", v8, v9);
      [(SBIconIndexMutableList *)self->_icons moveNodes:v10 toContiguousIndicesStartingAt:v7];
      id v11 = [(SBIconListModel *)self icons];

      uint64_t v7 = [v11 indexOfObjectPassingTest:&__block_literal_global_82];
      long long v6 = v11;
      uint64_t v3 = v11;
      if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_6;
      }
    }
  }
  long long v6 = v3;
LABEL_6:
}

uint64_t __58__SBIconListModel__moveAllNonDefaultSizedIconsToBeginning__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 gridSizeClass];
  if (v3)
  {
    uint64_t v4 = [v2 gridSizeClass];
    uint64_t v5 = [v4 isEqualToString:@"SBHIconGridSizeClassDefault"];
  }
  else
  {
    uint64_t v5 = 1;
  }

  return v5;
}

uint64_t __58__SBIconListModel__moveAllNonDefaultSizedIconsToBeginning__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 gridSizeClass];
  if (v3)
  {
    uint64_t v4 = [v2 gridSizeClass];
    uint64_t v5 = [v4 isEqualToString:@"SBHIconGridSizeClassDefault"] ^ 1;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)_moveDefaultSizedIconsOfCountIntoContiguousLeadingNonDefaultSizedIcons:(unint64_t)a3
{
  id v16 = [(SBIconListModel *)self icons];
  uint64_t v5 = [v16 indexOfObjectPassingTest:&__block_literal_global_86];
  if (v5) {
    BOOL v6 = v5 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    uint64_t v7 = v5;
    LODWORD(v8) = 0;
    uint64_t v9 = v5;
    while (v9)
    {
      SBHIconGridSize v10 = [v16 objectAtIndex:--v9];
      id v11 = [v10 gridSizeClass];
      unint64_t v8 = SBHIconGridSizeGetArea([(SBIconListModel *)self gridSizeForGridSizeClass:v11])
         + v8;

      if (v8 >= a3)
      {
        if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v12 = [v16 count];
          if (v12 - v7 >= a3) {
            unint64_t v13 = a3;
          }
          else {
            unint64_t v13 = v12 - v7;
          }
          unsigned int v14 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v7, v13);
          uint64_t v15 = [v16 objectsAtIndexes:v14];

          [(SBIconIndexMutableList *)self->_icons moveNodes:v15 toContiguousIndicesStartingAt:v9];
        }
        break;
      }
    }
  }
}

uint64_t __90__SBIconListModel__moveDefaultSizedIconsOfCountIntoContiguousLeadingNonDefaultSizedIcons___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 gridSizeClass];
  if (v3)
  {
    uint64_t v4 = [v2 gridSizeClass];
    uint64_t v5 = [v4 isEqualToString:@"SBHIconGridSizeClassDefault"];
  }
  else
  {
    uint64_t v5 = 1;
  }

  return v5;
}

- (id)repairModelByEliminatingGapsInIcons:(id)a3 avoidingIcons:(id)a4 gridCellInfoOptions:(unint64_t)a5
{
  id v7 = a3;
  if ([(SBIconListModel *)self hasFixedIconLocations])
  {
    unint64_t v8 = 0;
  }
  else
  {
    uint64_t v9 = [(SBIconListModel *)self gridSizeClassSizesWithOptions:a5];
    unint64_t v8 = +[SBIconListModelRepairUtilities repairModelByEliminatingGapsInIcons:v7 avoidingIcons:0 gridSize:*(_DWORD *)&self->_gridSize gridSizeClassSizes:v9 iconLayoutBehavior:self->_iconLayoutBehavior fixedIconLocations:self->_fixedIconLocations];
  }
  return v8;
}

- (id)_updateModelByRepairingGapsIfNecessaryWithGridCellInfoOptions:(unint64_t)a3 mutationOptions:(unint64_t)a4
{
  if ((a4 & 0x100000) != 0)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [(SBIconListModel *)self repairModelByEliminatingGapsInIcons:self->_icons avoidingIcons:0 gridCellInfoOptions:a3];
  }
  return v5;
}

- (id)_updateModelByRepairingGapsIfNecessaryWithOptions:(unint64_t)a3
{
  return [(SBIconListModel *)self repairModelByEliminatingGapsInIcons:self->_icons avoidingIcons:0 gridCellInfoOptions:a3];
}

- (id)_updateModelByRepairingGapsIfNecessary
{
  return [(SBIconListModel *)self _updateModelByRepairingGapsIfNecessaryWithOptions:0];
}

- (id)_updateModelByRepairingGapsIfNecessaryAvoidingIcons:(id)a3 gridCellInfoOptions:(unint64_t)a4
{
  return [(SBIconListModel *)self repairModelByEliminatingGapsInIcons:self->_icons avoidingIcons:a3 gridCellInfoOptions:a4];
}

- (id)_checkAndRemoveBouncedIconsAfterChangeToIcons:(id)a3 ignoringTrailingIconCheck:(BOOL)a4 options:(unint64_t)a5
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ((a5 & 0x1000000) != 0)
  {
    id v17 = 0;
    goto LABEL_78;
  }
  uint64_t v98 = 0;
  long long v99 = &v98;
  uint64_t v100 = 0x2020000000;
  char v101 = 1;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v57 = v7;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v94 objects:v104 count:16];
  BOOL v64 = a4;
  if (v9)
  {
    uint64_t v10 = *(void *)v95;
    int v11 = 1;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v95 != v10) {
          objc_enumerationMutation(v8);
        }
        unint64_t v13 = *(void **)(*((void *)&v94 + 1) + 8 * i);
        unsigned int v14 = [v13 gridSizeClass];
        if (v14)
        {
          uint64_t v15 = [v13 gridSizeClass];
          int v16 = [v15 isEqualToString:@"SBHIconGridSizeClassDefault"];
        }
        else
        {
          int v16 = 1;
        }

        v11 &= v16;
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v94 objects:v104 count:16];
    }
    while (v9);
  }
  else
  {
    int v11 = 1;
  }

  if (((a5 >> 3) & 1) == 0)
  {
    id v61 = 0;
    if ((a5 & 0x40) != 0) {
      goto LABEL_17;
    }
LABEL_19:
    uint64_t v63 = 0;
    goto LABEL_20;
  }
  id v61 = [v8 reverseObjectEnumerator];
  if ((a5 & 0x40) == 0) {
    goto LABEL_19;
  }
LABEL_17:
  unsigned int v18 = [(SBIconListModel *)self directlyContainedIconsPassingTest:&__block_literal_global_89];
  uint64_t v63 = [v18 reverseObjectEnumerator];

LABEL_20:
  id v58 = [(SBIconListModel *)self delegate];
  if ((a5 & 0xC) != 0) {
    char v60 = 0;
  }
  else {
    char v60 = objc_opt_respondsToSelector();
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __99__SBIconListModel__checkAndRemoveBouncedIconsAfterChangeToIcons_ignoringTrailingIconCheck_options___block_invoke_2;
  aBlock[3] = &unk_1E6AB1DD8;
  id v19 = v8;
  char v92 = (a5 & 4) >> 2;
  id v90 = 0;
  uint64_t v91 = &v98;
  id v89 = v19;
  BOOL v93 = v64;
  id v59 = _Block_copy(aBlock);
  char v65 = 0;
  unint64_t v20 = 0;
  id v21 = 0;
  if (v61) {
    int v22 = (a5 >> 3) & 1;
  }
  else {
    int v22 = 0;
  }
  int v62 = v22;
  do
  {
    id v87 = v20;
    BOOL v23 = [(SBIconListModel *)self isGridLayoutValidWithOptions:0 outOfBoundsIcons:&v87];
    id v24 = v87;

    if (v23) {
      break;
    }
    id v25 = v21;
    uint64_t v81 = 0;
    long long v82 = &v81;
    uint64_t v83 = 0x3032000000;
    long long v84 = __Block_byref_object_copy__14;
    int v85 = __Block_byref_object_dispose__14;
    id v86 = 0;
    if (!(((a5 & 0x8000000) == 0) | v65 & 1))
    {
      [(SBIconListModel *)self removeAllFixedIconLocations];
      [(SBIconListModel *)self saveOnlyRequiredIconLocationsAsFixedIfRequired];
      int v29 = 0;
      char v65 = 1;
      goto LABEL_58;
    }
    if (v62)
    {
      uint64_t v26 = [v61 nextObject];
      int v27 = (void *)v82[5];
      v82[5] = v26;

      uint64_t v28 = v82[5];
      if ((a5 & 0x40) == 0) {
        goto LABEL_37;
      }
    }
    else
    {
      uint64_t v28 = 0;
      if ((a5 & 0x40) == 0) {
        goto LABEL_37;
      }
    }
    if (!v28 && v63)
    {
      uint64_t v30 = [v63 nextObject];
      unsigned int v31 = (void *)v82[5];
      v82[5] = v30;

      uint64_t v28 = v82[5];
    }
LABEL_37:
    if (!v28)
    {
      v78[0] = MEMORY[0x1E4F143A8];
      v78[1] = 3221225472;
      v78[2] = __99__SBIconListModel__checkAndRemoveBouncedIconsAfterChangeToIcons_ignoringTrailingIconCheck_options___block_invoke_3;
      v78[3] = &unk_1E6AB1E00;
      id v32 = v59;
      id v79 = v32;
      id v80 = &v81;
      [v24 enumerateObjectsWithOptions:2 usingBlock:v78];

      if (!v82[5])
      {
        icons = self->_icons;
        v75[0] = MEMORY[0x1E4F143A8];
        v75[1] = 3221225472;
        v75[2] = __99__SBIconListModel__checkAndRemoveBouncedIconsAfterChangeToIcons_ignoringTrailingIconCheck_options___block_invoke_4;
        v75[3] = &unk_1E6AB1E00;
        id v76 = v32;
        uint64_t v77 = &v81;
        [(SBIconIndexMutableList *)icons enumerateNodesWithOptions:2 usingBlock:v75];
      }
    }
    if (v11)
    {
      int v34 = [(SBIconListModel *)self rotatedLayoutClusterGridSizeClass];
      if (v34)
      {
        id v35 = [(SBIconListModel *)self rotatedLayoutClusterGridSizeClass];
        if ([v35 isEqualToString:@"SBHIconGridSizeClassDefault"]
          || ([(id)v82[5] gridSizeClass], (unsigned int v36 = objc_claimAutoreleasedReturnValue()) == 0))
        {
        }
        else
        {
          unint64_t v37 = [(id)v82[5] gridSizeClass];
          char v38 = [v37 isEqualToString:@"SBHIconGridSizeClassDefault"];

          if (v38) {
            goto LABEL_48;
          }
          int v34 = (void *)v82[5];
          v82[5] = 0;
        }
      }
    }
LABEL_48:
    if (v82[5])
    {
      if (v60)
      {
        uint64_t v39 = objc_msgSend(v58, "iconListModel:shouldBounceIcon:afterInsertingIcons:", self);
        id v40 = (void *)v82[5];
        v82[5] = v39;

        if (!v82[5])
        {
          uint64_t v53 = 0;
LABEL_83:
          unsigned int v54 = (void *)MEMORY[0x1E4F1CA00];
          unint64_t v55 = [NSString stringWithFormat:@"Delegate returned an invalid icon to bounce: %@", v53];
          id v56 = [v54 exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v55 userInfo:0];

          objc_exception_throw(v56);
        }
        if (!-[SBIconListModel directlyContainsIcon:](self, "directlyContainsIcon:"))
        {
          uint64_t v53 = v82[5];
          goto LABEL_83;
        }
      }
      if (!v25) {
        id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      }
      [(SBIconListModel *)self willRemoveIcon:v82[5] options:a5];
      [v25 insertObject:v82[5] atIndex:0];
      [(SBIconIndexMutableList *)self->_icons removeNodeIdenticalTo:v82[5]];
      int v29 = 0;
    }
    else
    {
      int v29 = 1;
      if ((a5 & 4) == 0 && *((unsigned char *)v99 + 24))
      {
        int v29 = 0;
        *((unsigned char *)v99 + 24) = 0;
      }
    }
LABEL_58:
    _Block_object_dispose(&v81, 8);

    id v21 = v25;
    unint64_t v20 = v24;
  }
  while (!v29);
  BOOL v41 = v21;
  if (v21)
  {
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v42 = v21;
    uint64_t v43 = [v42 countByEnumeratingWithState:&v71 objects:v103 count:16];
    if (v43)
    {
      uint64_t v44 = *(void *)v72;
      do
      {
        for (uint64_t j = 0; j != v43; ++j)
        {
          if (*(void *)v72 != v44) {
            objc_enumerationMutation(v42);
          }
          [(SBIconListModel *)self didRemoveIcon:*(void *)(*((void *)&v71 + 1) + 8 * j) options:a5];
        }
        uint64_t v43 = [v42 countByEnumeratingWithState:&v71 objects:v103 count:16];
      }
      while (v43);
    }

    id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v47 = v42;
    uint64_t v48 = [v47 countByEnumeratingWithState:&v67 objects:v102 count:16];
    if (v48)
    {
      uint64_t v49 = *(void *)v68;
      do
      {
        for (uint64_t k = 0; k != v48; ++k)
        {
          if (*(void *)v68 != v49) {
            objc_enumerationMutation(v47);
          }
          uint64_t v51 = *(void *)(*((void *)&v67 + 1) + 8 * k);
          if (([v19 containsObject:v51] & 1) == 0) {
            [v46 addObject:v51];
          }
        }
        uint64_t v48 = [v47 countByEnumeratingWithState:&v67 objects:v102 count:16];
      }
      while (v48);
    }

    BOOL v41 = v21;
    [(SBIconListModel *)self _notifyListObserversDidAddIcons:0 didRemoveIcons:v46 movedIcons:0];
  }
  id v17 = v41;

  _Block_object_dispose(&v98, 8);
  id v7 = v57;
LABEL_78:

  return v17;
}

uint64_t __99__SBIconListModel__checkAndRemoveBouncedIconsAfterChangeToIcons_ignoringTrailingIconCheck_options___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 gridSizeClass];
  if (v3)
  {
    uint64_t v4 = [v2 gridSizeClass];
    uint64_t v5 = [v4 isEqualToString:@"SBHIconGridSizeClassDefault"];
  }
  else
  {
    uint64_t v5 = 1;
  }

  return v5;
}

BOOL __99__SBIconListModel__checkAndRemoveBouncedIconsAfterChangeToIcons_ignoringTrailingIconCheck_options___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return ![*(id *)(a1 + 32) containsObject:a2]
      || !*(unsigned char *)(a1 + 56)
      && (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
       || ![*(id *)(a1 + 40) count] && !*(unsigned char *)(a1 + 57));
}

void __99__SBIconListModel__checkAndRemoveBouncedIconsAfterChangeToIcons_ignoringTrailingIconCheck_options___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __99__SBIconListModel__checkAndRemoveBouncedIconsAfterChangeToIcons_ignoringTrailingIconCheck_options___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)changeGridSize:(SBHIconGridSize)a3 options:(unint64_t)a4
{
  SBHIconGridSize v7 = (SBHIconGridSize)[(SBIconListModel *)self gridSize];
  uint64_t v8 = v7;
  uint64_t v9 = a3;
  if (SBHIconGridSizeEqualToIconGridSize(*(_DWORD *)&v7, *(_DWORD *)&a3))
  {
    uint64_t v10 = 0;
  }
  else
  {
    int v11 = [(SBIconListModel *)self _rotatedIconListModelIfApplicable];
    uint64_t v12 = [(SBIconListModel *)self coordinatesOfAllIconsWithOptions:0];
    unint64_t v13 = [v11 coordinatesOfAllIconsWithOptions:0];
    [(SBIconListModel *)self setGridSize:v9];
    uint64_t v10 = [(SBIconListModel *)self _checkAndRemoveBouncedIconsAfterChangeToIcons:0 ignoringTrailingIconCheck:0 options:a4];
    [(SBIconListModel *)self finishChangingFromGridSize:v8 withOldIconCoordinates:v12 bouncedIcons:v10 options:a4];
    [v11 finishChangingFromGridSize:v8 withOldIconCoordinates:v13 bouncedIcons:v10 options:a4];
  }
  return v10;
}

- (id)coordinatesOfAllIconsWithOptions:(unint64_t)a3
{
  uint64_t v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  BOOL v6 = [(SBIconListModel *)self gridCellInfoWithOptions:a3];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__SBIconListModel_coordinatesOfAllIconsWithOptions___block_invoke;
  v12[3] = &unk_1E6AB1AE0;
  void v12[4] = self;
  id v13 = v6;
  id v7 = v5;
  id v14 = v7;
  id v8 = v6;
  [(SBIconListModel *)self enumerateIconsUsingBlock:v12];
  uint64_t v9 = v14;
  id v10 = v7;

  return v10;
}

void __52__SBIconListModel_coordinatesOfAllIconsWithOptions___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v5 = a2;
  uint64_t v6 = [v3 coordinateForIcon:v5 gridCellInfo:v4];
  id v7 = (void *)a1[6];
  objc_msgSend(MEMORY[0x1E4F29238], "sbh_valueWithSBIconCoordinate:", v6, v8);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v9 forKey:v5];
}

- (void)finishChangingFromGridSize:(SBHIconGridSize)a3 withOldIconCoordinates:(id)a4 bouncedIcons:(id)a5 options:(unint64_t)a6
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  unsigned int v31 = v10;
  if (v10)
  {
    id v29 = v11;
    SBHIconGridSize v12 = (SBHIconGridSize)[(SBIconListModel *)self gridSize];
    BOOL v13 = [(SBIconListModel *)self hasFixedIconLocations];
    unint64_t v14 = a6 | 0x200;
    if (!v13) {
      unint64_t v14 = a6;
    }
    unint64_t v32 = v14;
    [(SBIconListModel *)self removeAllFixedIconLocations];
    uint64_t v30 = [(SBIconListModel *)self icons];
    uint64_t v15 = HIWORD(*(unsigned int *)&v12);
    [(SBIconIndexMutableList *)self->_icons removeAllNodes];
    uint64_t v50 = 0;
    uint64_t v51 = &v50;
    uint64_t v52 = 0x3032000000;
    uint64_t v53 = __Block_byref_object_copy__14;
    unsigned int v54 = __Block_byref_object_dispose__14;
    id v55 = 0;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __90__SBIconListModel_finishChangingFromGridSize_withOldIconCoordinates_bouncedIcons_options___block_invoke;
    v42[3] = &unk_1E6AB1E28;
    id v43 = v29;
    SBHIconGridSize v49 = v12;
    id v36 = v10;
    id v44 = v36;
    unint64_t v45 = self;
    id v46 = &v50;
    unint64_t v47 = a6;
    unint64_t v48 = v32;
    [v30 enumerateObjectsUsingBlock:v42];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    obuint64_t j = (id)v51[5];
    uint64_t v16 = [obj countByEnumeratingWithState:&v38 objects:v56 count:16];
    if (v16)
    {
      uint64_t columns = v12.columns;
      uint64_t v34 = v12;
      uint64_t v35 = *(void *)v39;
      do
      {
        uint64_t v37 = v16;
        for (uint64_t i = 0; i != v37; ++i)
        {
          if (*(void *)v39 != v35) {
            objc_enumerationMutation(obj);
          }
          id v19 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          unint64_t v20 = [v19 gridSizeClass];
          id v21 = [v36 objectForKey:v19];
          uint64_t v22 = objc_msgSend(v21, "sbh_SBIconCoordinateValue");
          uint64_t v24 = v23;

          if (v22 >= columns) {
            uint64_t v25 = columns;
          }
          else {
            uint64_t v25 = v22;
          }
          if (v24 >= v15) {
            uint64_t v26 = v15;
          }
          else {
            uint64_t v26 = v24;
          }
          unint64_t v6 = v6 & 0xFFFFFFFF00000000 | v34;
          unint64_t v27 = -[SBIconListModel firstGridCellIndexOfRangeOfGridSizeClass:withoutFixedIconsNearGridRange:gridCellInfoOptions:](self, "firstGridCellIndexOfRangeOfGridSizeClass:withoutFixedIconsNearGridRange:gridCellInfoOptions:", v20, SBIconCoordinateGetGridCellIndex(v25, v26, v6), 65537, 0);
          [(SBIconIndexMutableList *)self->_icons addNode:v19];
          if (v27 != 0x7FFFFFFFFFFFFFFFLL) {
            id v28 = [(SBIconListModel *)self moveContainedIcon:v19 toGridCellIndex:v27 gridCellInfoOptions:0 mutationOptions:v32];
          }
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v38 objects:v56 count:16];
      }
      while (v16);
    }

    _Block_object_dispose(&v50, 8);
    id v11 = v29;
  }
}

void __90__SBIconListModel_finishChangingFromGridSize_withOldIconCoordinates_bouncedIcons_options___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    uint64_t v3 = [*(id *)(a1 + 40) objectForKey:v13];
    uint64_t v4 = objc_msgSend(v3, "sbh_SBIconCoordinateValue");
    uint64_t v6 = v5;

    if (v4 <= *(unsigned __int16 *)(a1 + 80) && v6 <= *(unsigned __int16 *)(a1 + 82))
    {
      uint64_t GridCellIndex = SBIconCoordinateGetGridCellIndex(v4, v6, *(_DWORD *)(a1 + 80));
      [*(id *)(*(void *)(a1 + 48) + 8) addNode:v13];
      id v12 = (id)[*(id *)(a1 + 48) moveContainedIcon:v13 toGridCellIndex:GridCellIndex gridCellInfoOptions:0 mutationOptions:*(void *)(a1 + 72) | *(void *)(a1 + 64)];
    }
    else
    {
      id v7 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if (!v7)
      {
        id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
        id v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = v8;

        id v7 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      }
      [v7 addObject:v13];
    }
  }
}

- (unint64_t)firstFreeSlotIndex
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = self->_icons;
  uint64_t v4 = [(SBIconIndexMutableList *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      uint64_t v9 = 0;
      unint64_t v10 = v7 + v5;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v3);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        if (objc_msgSend(v11, "isPlaceholder", (void)v14))
        {
          unint64_t v10 = v7 + v9;
          goto LABEL_12;
        }
        id v12 = [v11 gridSizeClass];
        v6 += [(SBIconListModel *)self gridSizeAreaForGridSizeClass:v12];

        ++v9;
      }
      while (v5 != v9);
      uint64_t v5 = [(SBIconIndexMutableList *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      unint64_t v7 = v10;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v6 = 0;
    unint64_t v10 = 0;
  }
LABEL_12:

  if (v6 >= [(SBIconListModel *)self maxNumberOfIcons]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return v10;
  }
}

- (unint64_t)firstFreeGridCellIndexWithOptions:(unint64_t)a3
{
  uint64_t v3 = [(SBIconListModel *)self gridCellInfoWithOptions:a3];
  unint64_t v4 = [v3 firstEmptyGridCellIndex];

  return v4;
}

- (unint64_t)firstFreeGridCellIndexOfRangeOfSizeClass:(id)a3 gridCellInfoOptions:(unint64_t)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [(SBIconListModel *)self firstFreeGridCellIndexOfRangeOfSize:[(SBIconListModel *)self gridSizeForGridSizeClass:v6 gridCellInfoOptions:a4] gridCellInfoOptions:a4];
  unint64_t v8 = v7;
  if (v6
    && v7 != 0x7FFFFFFFFFFFFFFFLL
    && ([v6 isEqualToString:@"SBHIconGridSizeClassDefault"] & 1) == 0)
  {
    uint64_t v9 = objc_alloc_init(SBIcon);
    [(SBIcon *)v9 setGridSizeClass:v6];
    v13[0] = v9;
    unint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    id v11 = [(SBIconListModel *)self iconGridCellInfoBySimulatingInsertionOfIcons:v10 ignoringPlaceholders:0 gridCellInfoOptions:a4 iconOrder:0];

    if (![(SBIconListModel *)self isGridLayoutValid:v11]) {
      unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v8;
}

- (unint64_t)firstFreeGridCellIndexOfRangeOfSize:(SBHIconGridSize)a3 gridCellInfoOptions:(unint64_t)a4
{
  id v6 = [(SBIconListModel *)self gridCellInfoWithOptions:a4];
  unint64_t v7 = [(SBIconListModel *)self firstFreeGridCellIndexOfRangeOfSize:*(unsigned int *)&a3 gridCellInfo:v6];

  return v7;
}

- (unint64_t)firstFreeGridCellIndexOfRangeOfSize:(SBHIconGridSize)a3 gridCellInfo:(id)a4
{
  return [a4 indexOfFirstEmptyGridCellRangeOfSize:*(unsigned int *)&a3];
}

- (BOOL)isEmpty
{
  return [(SBIconIndexMutableList *)self->_icons count] == 0;
}

- (BOOL)isFull
{
  return [(SBIconListModel *)self firstFreeSlotIndex] == 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isFullIncludingPlaceholders
{
  unint64_t v3 = [(SBIconIndexMutableList *)self->_icons count];
  return v3 >= [(SBIconListModel *)self maxNumberOfIcons];
}

+ (BOOL)supportsRotatedLayout
{
  return 1;
}

+ (BOOL)allowsRotatedLayoutByDefault
{
  return 0;
}

- (void)setAllowsRotatedLayout:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(id)objc_opt_class() supportsRotatedLayout] && self->_allowsRotatedLayout != v3)
  {
    if (!v3) {
      [(SBIconListModel *)self _invalidateLayoutWithGridCellInfoOptions:0 mutationOptions:0];
    }
    self->_allowsRotatedLayout = v3;
  }
}

- (void)setRotatedLayoutIndependent:(BOOL)a3
{
  if (self->_allowsIndependentRotatedLayout != a3)
  {
    self->_allowsIndependentRotatedLayout = a3;
    if (!a3) {
      [(SBIconListModel *)self _invalidateLayoutWithGridCellInfoOptions:0 mutationOptions:0];
    }
  }
}

- (void)_invalidateLayoutWithGridCellInfoOptions:(unint64_t)a3 mutationOptions:(unint64_t)a4
{
  int v4 = a4;
  BOOL v7 = [(SBIconListModel *)self allowsRotatedLayout];
  if ((v4 & 0x40000000) == 0 && v7)
  {
    rotatedIcons = self->_rotatedIcons;
    BOOL v9 = [(SBIconListModel *)self wantsRotatedGridForOptions:a3];
    unint64_t v10 = self->_rotatedIcons;
    if (v9)
    {
      if (!v10) {
        goto LABEL_8;
      }
      unint64_t v10 = [(SBIconListModel *)self _rotatedIconsFromList:self->_rotatedIcons gridCellInfoOptions:2];
      [(SBIconIndexMutableList *)self->_icons setNodes:v10];
      [(SBIconListModel *)self updateHasNonDefaultSizeClassIcons];
    }
    else
    {
      self->_rotatedIcons = 0;
    }

LABEL_8:
    if (rotatedIcons)
    {
      ++self->_layoutInvalidations;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      void v11[2] = __76__SBIconListModel__invalidateLayoutWithGridCellInfoOptions_mutationOptions___block_invoke;
      v11[3] = &unk_1E6AB1E50;
      v11[4] = self;
      v11[5] = a3;
      [(SBIconListModel *)self _notifyListObservers:v11];
    }
  }
}

void __76__SBIconListModel__invalidateLayoutWithGridCellInfoOptions_mutationOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 iconList:*(void *)(a1 + 32) didInvalidateLayoutWithGridCellInfoOptions:*(void *)(a1 + 40)];
  }
}

- (unint64_t)layoutInvalidations
{
  return self->_layoutInvalidations;
}

- (void)_ensureRotatedIcons
{
  if ([(SBIconListModel *)self allowsRotatedLayout] && !self->_rotatedIcons)
  {
    id v3 = [(SBIconListModel *)self _rotatedIconsFromList:self gridCellInfoOptions:0];
    [(SBIconListModel *)self _makeRotatedIconsListModelWithIcons:v3 options:0];
  }
}

- (id)_rotatedIconsFromList:(id)a3 gridCellInfoOptions:(unint64_t)a4
{
  id v6 = a3;
  BOOL v7 = [(SBIconListModel *)self rotatedLayoutClusterGridSizeClass];
  unint64_t v8 = v7;
  if (v7 && ![v7 isEqualToString:@"SBHIconGridSizeClassDefault"])
  {
    unint64_t v10 = [(SBIconListModel *)self gridSizeClassSizesWithOptions:a4];
    SBHIconGridSize v11 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeWithOptions:a4];
    int v24 = SBHIconGridSizeRotate(*(_DWORD *)&v11);
    unint64_t v12 = [(SBIconListModel *)self rotatedGridCellInfoOptions:a4];
    id v13 = [SBRotatedIconListModel alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_folder);
    long long v15 = [(SBIconListModel *)v13 initWithFolder:WeakRetained gridSize:*(unsigned int *)&v11 gridSizeClassSizes:v10];

    [(SBIconListModel *)self _configureRotatedIconsListModel:v15];
    id v16 = [(SBIconListModel *)v15 setIconsFromIconListModel:v6];
    long long v35 = 0u;
    long long v36 = 0u;
    if (v15) {
      [(SBIconListModel *)v15 _rotationReorderingInfoWithClusterSizeClass:v8 gridCellInfoOptions:v12];
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __61__SBIconListModel__rotatedIconsFromList_gridCellInfoOptions___block_invoke;
    v25[3] = &unk_1E6AB1EC8;
    long long v17 = v15;
    uint64_t v26 = v17;
    unint64_t v27 = v8;
    id v28 = self;
    unint64_t v29 = a4;
    long long v30 = v35;
    long long v31 = v36;
    unint64_t v32 = v12;
    SBHIconGridSize v33 = v11;
    int v34 = v24;
    [(SBIconListModel *)v17 performChangesByPreservingOrderOfDefaultSizedIcons:v25];
    unsigned int v18 = [v6 icons];
    BOOL v9 = [(SBIconListModel *)v17 icons];
    if (![(SBIconListModel *)self _validateIconsInArray:v18 matchArray:v9])
    {
      uint64_t v19 = SBLogCommon();
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);

      if (v20) {
        NSLog(&cfstr_RotatedIconsDo.isa);
      }
      id v21 = SBLogIcon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[SBIconListModel _rotatedIconsFromList:gridCellInfoOptions:]((uint64_t)v18, (uint64_t)v9, v21);
      }

      id v22 = v18;
      BOOL v9 = v22;
    }
  }
  else
  {
    BOOL v9 = [v6 icons];
  }

  return v9;
}

void __61__SBIconListModel__rotatedIconsFromList_gridCellInfoOptions___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __61__SBIconListModel__rotatedIconsFromList_gridCellInfoOptions___block_invoke_2;
  v27[3] = &unk_1E6AB1E78;
  id v4 = v2;
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v28 = v4;
  uint64_t v29 = v5;
  int v31 = *(_DWORD *)(a1 + 104);
  uint64_t v30 = v6;
  BOOL v7 = [v4 _clusterIconsForSizeClass:v3 behavior:2 gridCellInfoProvider:v27];
  unint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 96);
  long long v11 = *(_OWORD *)(a1 + 80);
  long long v25 = *(_OWORD *)(a1 + 64);
  long long v26 = v11;
  [v8 _reorderIconsWithClusterSizeClass:v9 forRotationWithReorderingInfo:&v25 gridCellInfoOptions:v10];
  unint64_t v12 = *(void **)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 56);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __61__SBIconListModel__rotatedIconsFromList_gridCellInfoOptions___block_invoke_3;
  v21[3] = &unk_1E6AB1EA0;
  id v15 = v12;
  uint64_t v16 = *(void *)(a1 + 48);
  id v22 = v15;
  uint64_t v23 = v16;
  int v24 = *(_DWORD *)(a1 + 108);
  [v15 _unclusterIcons:v7 ofSizeClass:v13 baseGridCellInfoOptions:v14 gridCellInfoProvider:v21];
  long long v17 = *(void **)(a1 + 32);
  uint64_t v18 = *(void *)(a1 + 40);
  uint64_t v19 = *(void *)(a1 + 96);
  long long v20 = *(_OWORD *)(a1 + 80);
  long long v25 = *(_OWORD *)(a1 + 64);
  long long v26 = v20;
  [v17 _reorderIconsAfterUnclusteringWithClusterSizeClass:v18 forRotationWithReorderingInfo:&v25 gridCellInfoOptions:v19];
}

id __61__SBIconListModel__rotatedIconsFromList_gridCellInfoOptions___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) icons];
  uint64_t v3 = [*(id *)(a1 + 40) gridCellInfoForIcons:v2 gridSize:*(unsigned int *)(a1 + 56) referenceIconOrder:v2 fixedIconLocations:0 options:*(void *)(a1 + 48)];

  return v3;
}

id __61__SBIconListModel__rotatedIconsFromList_gridCellInfoOptions___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) icons];
  uint64_t v5 = [*(id *)(a1 + 40) gridCellInfoForIcons:v4 gridSize:*(unsigned int *)(a1 + 48) referenceIconOrder:v4 fixedIconLocations:0 options:a2];

  return v5;
}

- (void)_makeRotatedIconsListModelWithIcons:(id)a3 options:(unint64_t)a4
{
  id v13 = a3;
  if ([(SBIconListModel *)self allowsRotatedLayout])
  {
    uint64_t v6 = [(SBIconListModel *)self gridSizeClassSizesWithOptions:2];
    unsigned int v7 = SBHIconGridSizeRotate(*(_DWORD *)&self->_gridSize);
    unint64_t v8 = [SBRotatedIconListModel alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_folder);
    uint64_t v10 = [(SBIconListModel *)v8 initWithFolder:WeakRetained gridSize:v7 gridSizeClassSizes:v6];
    rotatedIcons = self->_rotatedIcons;
    self->_rotatedIcons = v10;

    [(SBIconListModel *)self _configureRotatedIconsListModel:self->_rotatedIcons];
    [(SBRotatedIconListModel *)self->_rotatedIcons setUnrotatedIconListModel:self];
    if ([v13 count]) {
      id v12 = [(SBIconListModel *)self->_rotatedIcons setIcons:v13 gridCellInfoOptions:0 mutationOptions:a4];
    }
    [(SBIconListModel *)self->_rotatedIcons addListObserver:self];
  }
}

- (void)_configureRotatedIconsListModel:(id)a3
{
  id v4 = a3;
  id v9 = [(SBIconListModel *)self allowedGridSizeClasses];
  [v4 setAllowedGridSizeClasses:v9];
  uint64_t v5 = [(SBIconListModel *)self gridSizeClassDomain];
  [v4 setGridSizeClassDomain:v5];
  uint64_t v6 = [(SBIconListModel *)self rotatedLayoutClusterGridSizeClass];
  [v4 setRotatedLayoutClusterGridSizeClass:v6];
  objc_msgSend(v4, "setFixedIconLocationBehavior:", -[SBIconListModel fixedIconLocationBehavior](self, "fixedIconLocationBehavior"));
  objc_msgSend(v4, "setIconLayoutBehavior:", -[SBIconListModel iconLayoutBehavior](self, "iconLayoutBehavior"));
  unsigned int v7 = [(SBIconListModel *)self layoutExcludedIcons];
  [v4 setLayoutExcludedIcons:v7];
  unint64_t v8 = [(SBIconListModel *)self rotatedIconGridSizeClassSizes];
  [v4 setRotatedIconGridSizeClassSizes:v8];
  SBTreeNodeSetParent(v4, (uint64_t)self);
}

- (id)_rotatedIconListModel
{
  p_super = self;
  if ([(SBIconListModel *)self allowsRotatedLayout])
  {
    [(SBIconListModel *)p_super _ensureRotatedIcons];
    p_super = &p_super->_rotatedIcons->super;
  }
  return p_super;
}

- (id)_rotatedIconListModelIfAllowed
{
  if ([(SBIconListModel *)self allowsRotatedLayout])
  {
    [(SBIconListModel *)self _ensureRotatedIcons];
    uint64_t v3 = self->_rotatedIcons;
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (id)_rotatedIconListModelIfApplicable
{
  if ([(SBIconListModel *)self allowsRotatedLayout]) {
    uint64_t v3 = self->_rotatedIcons;
  }
  else {
    uint64_t v3 = 0;
  }
  return v3;
}

- (id)_rotatedIcons
{
  id v2 = [(SBIconListModel *)self _rotatedIconListModel];
  uint64_t v3 = [v2 icons];

  return v3;
}

- (id)_rotatedIconsIfApplicable
{
  if ([(SBIconListModel *)self allowsRotatedLayout])
  {
    uint64_t v3 = [(SBIconListModel *)self->_rotatedIcons icons];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (id)_rotatedIconOrderIfApplicable
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(SBIconListModel *)self allowsRotatedLayout]
    && (rotatedIcons = self->_rotatedIcons) != 0)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[SBIconListModel numberOfIcons](rotatedIcons, "numberOfIcons"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v5 = self->_rotatedIcons;
    uint64_t v6 = [(SBIconListModel *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          unint64_t v10 = -[SBIconListModel indexForIcon:](self, "indexForIcon:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
          long long v11 = [NSNumber numberWithUnsignedInteger:v10];
          [v4 addObject:v11];
        }
        uint64_t v7 = [(SBIconListModel *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)_setRotatedIcons:(id)a3
{
}

- (void)_setRotatedIcons:(id)a3 clearRotatedFixedIconLocations:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if ([(SBIconListModel *)self allowsRotatedLayout])
  {
    rotatedIcons = self->_rotatedIcons;
    if (rotatedIcons)
    {
      id v7 = [(SBIconListModel *)rotatedIcons setIcons:v8 gridCellInfoOptions:0 mutationOptions:0x100000];
      if (!v4) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
    [(SBIconListModel *)self _makeRotatedIconsListModelWithIcons:v8 options:0];
    if (v4)
    {
LABEL_4:
      [(SBIconListModel *)self->_rotatedIcons removeAllFixedIconLocations];
      [(SBIconListModel *)self->_rotatedIcons saveOnlyRequiredIconLocationsAsFixedIfRequired];
    }
  }
LABEL_5:
}

- (void)_updateRotatedIconsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  if (!(a3 >> 31)) {
    [(SBIconListModel *)self _updateRotatedIconsUsingBlock:a4];
  }
}

- (void)_updateRotatedIconsUsingBlock:(id)a3
{
  uint64_t v6 = (void (**)(void))a3;
  if ([(SBIconListModel *)self allowsRotatedLayout] && self->_rotatedIcons)
  {
    v6[2]();
    BOOL v4 = [(SBIconListModel *)self icons];
    uint64_t v5 = [(SBIconListModel *)self->_rotatedIcons icons];
    if (![(SBIconListModel *)self _validateIconsInArray:v4 matchArray:v5]) {
      [(SBIconListModel *)self _invalidateLayoutWithGridCellInfoOptions:0 mutationOptions:0];
    }
  }
}

- (BOOL)_validateIconsInArray:(id)a3 matchArray:(id)a4
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[[v5 alloc] initWithArray:v7];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v6];
  LOBYTE(v6) = [v8 isEqualToSet:v9];

  return (char)v6;
}

- (id)_otherListForGridCellInfoOptions:(unint64_t)a3
{
  if ([(SBIconListModel *)self wantsRotatedGridForOptions:a3])
  {
    BOOL v4 = self;
  }
  else
  {
    BOOL v4 = [(SBIconListModel *)self _rotatedIconListModel];
  }
  return v4;
}

- (BOOL)canUseFastGridLayoutValidity
{
  if ([(SBIconListModel *)self hasFixedIconLocations]) {
    return 0;
  }
  if (![(SBIconListModel *)self directlyContainsNonDefaultSizeClassIcon]) {
    return 1;
  }
  BOOL v4 = [(SBIconListModel *)self iconGridSizeClassSizes];
  char v5 = [v4 gridSizesMatchDefault];

  return v5;
}

- (BOOL)isGridLayoutValid
{
  return [(SBIconListModel *)self isGridLayoutValidWithOptions:0];
}

- (BOOL)isGridLayoutValidWithOptions:(unint64_t)a3
{
  if ([(SBIconListModel *)self canUseFastGridLayoutValidity])
  {
    unint64_t v5 = [(SBIconListModel *)self numberOfIcons];
    return v5 <= [(SBIconListModel *)self maxNumberOfIcons];
  }
  else
  {
    id v7 = [(SBIconListModel *)self gridCellInfoWithOptions:a3];
    BOOL v8 = [(SBIconListModel *)self isGridLayoutValid:v7];

    return v8;
  }
}

- (BOOL)isGridLayoutValid:(id)a3
{
  id v4 = a3;
  if ([v4 isLayoutOutOfBounds])
  {
    char v5 = 0;
  }
  else
  {
    id v6 = [(SBIconListModel *)self delegate];
    if (objc_opt_respondsToSelector()) {
      char v5 = [v6 iconListModel:self isGridLayoutValid:v4];
    }
    else {
      char v5 = 1;
    }
  }
  return v5;
}

- (BOOL)isGridLayoutValidWithOptions:(unint64_t)a3 outOfBoundsIcons:(id *)a4
{
  unint64_t v6 = [(SBIconListModel *)self numberOfIcons];
  if ([(SBIconListModel *)self canUseFastGridLayoutValidity])
  {
    unint64_t v7 = [(SBIconListModel *)self maxNumberOfIcons];
    if (v6 <= v7)
    {
      id v8 = 0;
      BOOL v9 = 1;
      if (!a4) {
        goto LABEL_9;
      }
    }
    else
    {
      -[SBIconListModel iconsInRange:](self, "iconsInRange:", v7, v6 - v7);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v9 = 0;
      if (!a4) {
        goto LABEL_9;
      }
    }
    goto LABEL_8;
  }
  unint64_t v10 = [(SBIconListModel *)self gridCellInfoWithOptions:0];
  BOOL v9 = [(SBIconListModel *)self isGridLayoutValid:v10];
  id v8 = 0;
  if (!v9)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __65__SBIconListModel_isGridLayoutValidWithOptions_outOfBoundsIcons___block_invoke;
    v15[3] = &unk_1E6AB0BF8;
    v15[4] = self;
    id v12 = v11;
    id v16 = v12;
    objc_msgSend(v10, "enumerateOutOfBoundsIconIndexesInRange:options:usingBlock:", 0, v6, 0, v15);
    long long v13 = v16;
    id v8 = v12;
  }
  if (a4) {
LABEL_8:
  }
    *a4 = v8;
LABEL_9:

  return v9;
}

void __65__SBIconListModel_isGridLayoutValidWithOptions_outOfBoundsIcons___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) iconAtIndex:a2];
  [*(id *)(a1 + 40) addObject:v3];
}

+ (int64_t)defaultFixedIconLocationBehavior
{
  return 1;
}

- (void)setFixedIconLocationBehavior:(int64_t)a3
{
  if (self->_fixedIconLocationBehavior != a3)
  {
    self->_fixedIconLocationBehavior = a3;
    [(SBIconListModel *)self _invalidateLayoutWithGridCellInfoOptions:0 mutationOptions:0];
    if ((unint64_t)(a3 - 2) >= 2)
    {
      if (!a3 && [(SBIconListModel *)self hasFixedIconLocations])
      {
        [(SBIconListModel *)self sortByLayoutOrderWithGridCellInfoOptions:0];
        fixedIconLocations = self->_fixedIconLocations;
        self->_fixedIconLocations = 0;
        unint64_t v6 = fixedIconLocations;

        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __48__SBIconListModel_setFixedIconLocationBehavior___block_invoke;
        v7[3] = &unk_1E6AAE4B8;
        v7[4] = self;
        [(NSMutableDictionary *)v6 enumerateKeysAndObjectsUsingBlock:v7];
        [(SBIconListModel *)self markIconStateDirty];
      }
    }
    else
    {
      [(SBIconListModel *)self saveOnlyRequiredIconLocationsAsFixed];
    }
  }
}

void __48__SBIconListModel_setFixedIconLocationBehavior___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) directlyContainedIconWithIdentifier:a2];
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 32) _notifyListObserversDidMoveIcon:v3 options:0];
    id v3 = v4;
  }
}

- (BOOL)allowsFixedIconLocations
{
  return [(SBIconListModel *)self fixedIconLocationBehavior] != 0;
}

- (BOOL)requiresSomeFixedIconLocations
{
  return ([(SBIconListModel *)self fixedIconLocationBehavior] & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)shouldReflowIconsInContiguousRegionsWithOptions:(unint64_t)a3
{
  return (a3 & 0x2000000) == 0 && [(SBIconListModel *)self fixedIconLocationBehavior] == 4;
}

- (void)setFixedIconLocations:(id)a3
{
}

- (void)setFixedIconLocations:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [(SBIconListModel *)self filteredIncomingFixedIconLocationsIfNecessary:v6];
  if ((BSEqualDictionaries() & 1) == 0)
  {
    id v8 = self->_fixedIconLocations;
    BOOL v9 = (NSMutableDictionary *)[v7 mutableCopy];
    fixedIconLocations = self->_fixedIconLocations;
    self->_fixedIconLocations = v9;

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __49__SBIconListModel_setFixedIconLocations_options___block_invoke;
    v12[3] = &unk_1E6AB1EF0;
    long long v13 = v8;
    long long v14 = self;
    unint64_t v15 = a4;
    id v11 = v8;
    [v6 enumerateKeysAndObjectsUsingBlock:v12];
    [(SBIconListModel *)self sortByLayoutOrderWithGridCellInfoOptions:0];
    [(SBIconListModel *)self markIconStateDirtyWithOptions:a4];
  }
}

void __49__SBIconListModel_setFixedIconLocations_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  char v5 = *(void **)(a1 + 32);
  id v6 = a3;
  unint64_t v7 = [v5 objectForKey:v9];
  LOBYTE(v5) = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    id v8 = [*(id *)(a1 + 40) directlyContainedIconWithIdentifier:v9];
    if (v8) {
      [*(id *)(a1 + 40) _notifyListObserversDidMoveIcon:v8 options:*(void *)(a1 + 48)];
    }
  }
}

- (id)filteredIncomingFixedIconLocationsIfNecessary:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SBIconListModel *)self fixedIconLocationBehavior];
  if ((unint64_t)(v5 - 1) < 2) {
    goto LABEL_4;
  }
  if (v5 == 3)
  {
    uint64_t v13 = 0;
    long long v14 = &v13;
    uint64_t v15 = 0x3032000000;
    id v16 = __Block_byref_object_copy__14;
    long long v17 = __Block_byref_object_dispose__14;
    id v18 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    _OWORD v10[2] = __65__SBIconListModel_filteredIncomingFixedIconLocationsIfNecessary___block_invoke;
    v10[3] = &unk_1E6AB1F18;
    void v10[4] = self;
    id v12 = &v13;
    id v7 = v4;
    id v11 = v7;
    [v7 enumerateKeysAndObjectsUsingBlock:v10];
    id v8 = (void *)v14[5];
    if (!v8) {
      id v8 = v7;
    }
    id v6 = v8;

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    if (v5 == 4)
    {
LABEL_4:
      id v6 = v4;
      goto LABEL_9;
    }
    id v6 = 0;
  }
LABEL_9:

  return v6;
}

void __65__SBIconListModel_filteredIncomingFixedIconLocationsIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "directlyContainedIconWithIdentifier:");
  id v4 = [v3 gridSizeClass];
  int64_t v5 = v4;
  if (!v4 || [v4 isEqualToString:@"SBHIconGridSizeClassDefault"])
  {
    id v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (!v6)
    {
      uint64_t v7 = [*(id *)(a1 + 40) mutableCopy];
      uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      id v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    }
    [v6 removeObjectForKey:v10];
  }
}

- (void)enumerateFixedIconsUsingBlock:(id)a3
{
  id v4 = a3;
  fixedIconLocations = self->_fixedIconLocations;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__SBIconListModel_enumerateFixedIconsUsingBlock___block_invoke;
  v7[3] = &unk_1E6AB1F40;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)fixedIconLocations enumerateKeysAndObjectsUsingBlock:v7];
}

void __49__SBIconListModel_enumerateFixedIconsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  int64_t v5 = [*(id *)(a1 + 32) iconWithIdentifier:a2];
  if (v5)
  {
    [v6 unsignedIntegerValue];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)rotatedFixedIconLocations
{
  id v2 = [(SBIconListModel *)self _rotatedIconListModelIfAllowed];
  id v3 = [v2 fixedIconLocations];

  return v3;
}

- (void)setRotatedFixedIconLocations:(id)a3
{
}

- (void)setRotatedFixedIconLocations:(id)a3 options:(unint64_t)a4
{
  id v7 = a3;
  if ([(SBIconListModel *)self allowsFixedIconLocations])
  {
    id v6 = [(SBIconListModel *)self _rotatedIconListModelIfAllowed];
    [v6 setFixedIconLocations:v7 options:a4];
  }
}

- (void)removeFixedIconLocationForIcon:(id)a3
{
  id v6 = a3;
  id v4 = [v6 uniqueIdentifier];
  int64_t v5 = [(NSMutableDictionary *)self->_fixedIconLocations objectForKey:v4];

  if (v5)
  {
    [(NSMutableDictionary *)self->_fixedIconLocations removeObjectForKey:v4];
    if ([(SBIconListModel *)self directlyContainsIcon:v6])
    {
      [(SBIconListModel *)self markIconStateDirty];
      [(SBIconListModel *)self _notifyListObserversDidMoveIcon:v6 options:0];
    }
  }
}

- (void)removeFixedIconLocationsForIcons:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(SBIconListModel *)self removeFixedIconLocationForIcon:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)removeFixedIconLocationsForIconsInGridRange:(SBHIconGridRange)a3 gridCellInfo:(id)a4
{
  -[SBIconListModel iconsForGridRange:gridCellInfo:](self, "iconsForGridRange:gridCellInfo:", a3.cellIndex, *(void *)&a3.size.columns, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(SBIconListModel *)self removeFixedIconLocationsForIcons:v5];
}

- (void)removeFixedIconLocationsForIconsInGridRange:(SBHIconGridRange)a3 gridCellInfoOptions:(unint64_t)a4
{
  uint64_t v4 = *(void *)&a3.size.columns;
  unint64_t cellIndex = a3.cellIndex;
  id v7 = [(SBIconListModel *)self gridCellInfoWithOptions:a4];
  -[SBIconListModel removeFixedIconLocationsForIconsInGridRange:gridCellInfo:](self, "removeFixedIconLocationsForIconsInGridRange:gridCellInfo:", cellIndex, v4, v7);
}

- (void)removeFixedIconLocationsIfPossibleForIconsInContiguousRegion:(id)a3 gridCellInfo:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __93__SBIconListModel_removeFixedIconLocationsIfPossibleForIconsInContiguousRegion_gridCellInfo___block_invoke;
  v8[3] = &unk_1E6AB0BF8;
  id v9 = v6;
  long long v10 = self;
  id v7 = v6;
  [a3 enumerateGridCellIndexesUsingBlock:v8];
}

void __93__SBIconListModel_removeFixedIconLocationsIfPossibleForIconsInContiguousRegion_gridCellInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) iconIndexForGridCellIndex:a2];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = [*(id *)(a1 + 40) iconAtIndex:v3];
    if ((objc_msgSend(*(id *)(a1 + 40), "isInsertionFixedForIcon:atGridCellIndex:gridCellInfo:mutationOptions:") & 1) == 0) {
      [*(id *)(a1 + 40) removeFixedIconLocationForIcon:v4];
    }
  }
}

- (void)removeFixedIconLocationsIfPossibleForIconsInContiguousRegionForGridCellIndex:(unint64_t)a3 sortByLayoutOrder:(BOOL)a4 gridCellInfoOptions:(unint64_t)a5
{
  BOOL v5 = a4;
  id v8 = [(SBIconListModel *)self gridCellInfoWithOptions:a5];
  [(SBIconListModel *)self removeFixedIconLocationsIfPossibleForIconsInContiguousRegionForGridCellIndex:a3 sortByLayoutOrder:v5 gridCellInfo:v8];
}

- (void)removeFixedIconLocationsIfPossibleForIconsInContiguousRegionForGridCellIndex:(unint64_t)a3 sortByLayoutOrder:(BOOL)a4 gridCellInfo:(id)a5
{
  BOOL v5 = a4;
  id v9 = a5;
  id v8 = [(SBIconListModel *)self contiguousRegionForGridCellIndex:a3 gridCellInfo:v9];
  [(SBIconListModel *)self removeFixedIconLocationsIfPossibleForIconsInContiguousRegion:v8 gridCellInfo:v9];
  if (v5) {
    [(SBIconListModel *)self sortByLayoutOrderWithGridCellInfo:v9];
  }
}

- (void)removeFixedIconLocationsIfPossibleWithGridCellInfoOptions:(unint64_t)a3
{
  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v5 = [(SBIconListModel *)self _targetListForGridCellInfoOptions:a3];
  [v5 removeFixedIconLocationsIfPossibleWithGridCellInfo:v6];
}

- (void)removeFixedIconLocationsIfPossibleWithGridCellInfo:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__SBIconListModel_removeFixedIconLocationsIfPossibleWithGridCellInfo___block_invoke;
  v6[3] = &unk_1E6AB0B58;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SBIconListModel *)self enumerateIconsUsingBlock:v6];
}

void __70__SBIconListModel_removeFixedIconLocationsIfPossibleWithGridCellInfo___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isIconFixed:")
    && (objc_msgSend(*(id *)(a1 + 32), "isInsertionFixedForIcon:atGridCellIndex:gridCellInfo:mutationOptions:", v5, objc_msgSend(*(id *)(a1 + 40), "gridCellIndexForIconIndex:", a3), *(void *)(a1 + 40), 512) & 1) == 0)
  {
    [*(id *)(a1 + 32) removeFixedIconLocationForIcon:v5];
  }
}

- (void)removeAllFixedIconLocations
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSMutableDictionary *)self->_fixedIconLocations allKeys];
  fixedIconLocations = self->_fixedIconLocations;
  self->_fixedIconLocations = 0;

  if (v3)
  {
    [(SBIconListModel *)self markIconStateDirty];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = v3;
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
          long long v10 = -[SBIconListModel directlyContainedIconWithIdentifier:](self, "directlyContainedIconWithIdentifier:", *(void *)(*((void *)&v11 + 1) + 8 * v9), (void)v11);
          if (v10) {
            [(SBIconListModel *)self _notifyListObserversDidMoveIcon:v10 options:0];
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

- (void)swapFixedIconLocationForReplacedIcon:(id)a3 withReplacementIcon:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if ([(SBIconListModel *)self isIconFixed:v14])
  {
    uint64_t v7 = [(SBIconListModel *)self gridCellInfoWithOptions:0];
    unint64_t v8 = [(SBIconListModel *)self gridCellIndexForIcon:v14 gridCellInfo:v7];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v9 = v8;
      [(SBIconListModel *)self removeFixedIconLocationForIcon:v14];
      long long v10 = [(SBIconListModel *)self gridCellInfoWithOptions:0];
      long long v11 = [v6 gridSizeClass];
      unint64_t v12 = [(SBIconListModel *)self bestGridCellIndexForInsertingIcon:v6 atGridCellIndex:v9 gridCellInfo:v10];
      uint64_t v13 = [(SBIconListModel *)self gridSizeForGridSizeClass:v11];
      if (-[SBIconListModel isValidGridRange:gridCellInfo:](self, "isValidGridRange:gridCellInfo:", v12, v13, v10))
      {
        -[SBIconListModel removeFixedIconLocationsForIconsInGridRange:gridCellInfo:](self, "removeFixedIconLocationsForIconsInGridRange:gridCellInfo:", v12, v13, v10);
        [(SBIconListModel *)self setFixedLocation:v12 forIcon:v6];
      }
    }
  }
}

- (void)setFixedLocation:(unint64_t)a3 forIcon:(id)a4
{
}

- (void)setFixedLocation:(unint64_t)a3 forIcon:(id)a4 options:(unint64_t)a5
{
  id v17 = a4;
  int64_t v8 = [(SBIconListModel *)self fixedIconLocationBehavior];
  if (v8)
  {
    if (v8 == 3)
    {
      unint64_t v9 = [v17 gridSizeClass];
      long long v10 = v9;
      if (!v9 || ([v9 isEqualToString:@"SBHIconGridSizeClassDefault"] & 1) != 0)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    if (!self->_fixedIconLocations)
    {
      long long v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      fixedIconLocations = self->_fixedIconLocations;
      self->_fixedIconLocations = v11;
    }
    long long v10 = [v17 uniqueIdentifier];
    uint64_t v13 = [(NSMutableDictionary *)self->_fixedIconLocations objectForKey:v10];
    id v14 = [NSNumber numberWithUnsignedInteger:a3];
    if ((BSEqualObjects() & 1) == 0)
    {
      uint64_t v15 = self->_fixedIconLocations;
      uint64_t v16 = [NSNumber numberWithUnsignedInteger:a3];
      [(NSMutableDictionary *)v15 setObject:v16 forKey:v10];

      [(SBIconListModel *)self markIconStateDirtyWithOptions:a5];
      [(SBIconListModel *)self _notifyListObserversDidMoveIcon:v17 options:a5];
    }

    goto LABEL_11;
  }
LABEL_12:
}

- (unint64_t)fixedLocationForIcon:(id)a3
{
  id v4 = [a3 uniqueIdentifier];
  id v5 = [(NSMutableDictionary *)self->_fixedIconLocations objectForKey:v4];
  id v6 = v5;
  if (v5) {
    unint64_t v7 = [v5 unsignedIntegerValue];
  }
  else {
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (BOOL)hasFixedIconLocations
{
  return [(NSMutableDictionary *)self->_fixedIconLocations count] != 0;
}

- (BOOL)areAllIconsFixed
{
  unint64_t v3 = [(SBIconListModel *)self numberOfIcons];
  if ([(NSMutableDictionary *)self->_fixedIconLocations count] < v3) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __35__SBIconListModel_areAllIconsFixed__block_invoke;
  v15[3] = &unk_1E6AB1F68;
  id v6 = v5;
  id v16 = v6;
  [(SBIconListModel *)self enumerateIconsUsingBlock:v15];
  fixedIconLocations = self->_fixedIconLocations;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  unint64_t v12 = __35__SBIconListModel_areAllIconsFixed__block_invoke_2;
  uint64_t v13 = &unk_1E6AAE4B8;
  id v14 = v6;
  id v8 = v6;
  [(NSMutableDictionary *)fixedIconLocations enumerateKeysAndObjectsUsingBlock:&v10];
  BOOL v4 = objc_msgSend(v8, "count", v10, v11, v12, v13) == 0;

  return v4;
}

void __35__SBIconListModel_areAllIconsFixed__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 uniqueIdentifier];
  if (v3)
  {
    BOOL v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    unint64_t v3 = v4;
  }
}

uint64_t __35__SBIconListModel_areAllIconsFixed__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeObject:a2];
}

- (BOOL)isIconFixed:(id)a3
{
  return [(SBIconListModel *)self fixedLocationForIcon:a3] != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isIconFixed:(id)a3 gridCellInfoOptions:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [(SBIconListModel *)self _targetListForGridCellInfoOptions:a4];
  LOBYTE(self) = [v7 isIconFixed:v6];

  return (char)self;
}

- (BOOL)isIcon:(id)a3 fixedAtGridCellIndex:(unint64_t)a4
{
  return [(SBIconListModel *)self fixedLocationForIcon:a3] == a4;
}

- (BOOL)isIcon:(id)a3 fixedAtGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5
{
  id v8 = a3;
  unint64_t v9 = [(SBIconListModel *)self _targetListForGridCellInfoOptions:a5];
  LOBYTE(a4) = [v9 isIcon:v8 fixedAtGridCellIndex:a4];

  return a4;
}

- (BOOL)hasFixedIconInGridRange:(SBHIconGridRange)a3 gridCellInfo:(id)a4
{
  uint64_t v4 = *(void *)&a3.size.columns;
  unint64_t cellIndex = a3.cellIndex;
  v17[64] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  unsigned int Area = SBHIconGridSizeGetArea(v4);
  unint64_t v9 = Area;
  if (Area >= 0x40)
  {
    uint64_t v10 = malloc_type_calloc(Area, 8uLL, 0x100004000313F17uLL);
    objc_msgSend(v7, "getIconIndexes:inGridRange:", v10, cellIndex, v4);
    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v10 = v17;
    objc_msgSend(v7, "getIconIndexes:inGridRange:", v17, cellIndex, v4);
    uint64_t v11 = 0;
    if (!v9)
    {
      BOOL v12 = 0;
      goto LABEL_9;
    }
  }
  uint64_t v13 = 0;
  BOOL v12 = 1;
  do
  {
    if (v10[v13] != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v14 = -[SBIconListModel iconAtIndex:](self, "iconAtIndex:");
      BOOL v15 = [(SBIconListModel *)self isIconFixed:v14];

      if (v15) {
        break;
      }
    }
    BOOL v12 = ++v13 < v9;
  }
  while (v9 != v13);
LABEL_9:
  free(v11);

  return v12;
}

- (BOOL)hasFixedIconInGridRange:(SBHIconGridRange)a3 gridCellInfoOptions:(unint64_t)a4
{
  uint64_t v4 = *(void *)&a3.size.columns;
  unint64_t cellIndex = a3.cellIndex;
  id v7 = [(SBIconListModel *)self gridCellInfoWithOptions:a4];
  LOBYTE(v4) = -[SBIconListModel hasFixedIconInGridRange:gridCellInfo:](self, "hasFixedIconInGridRange:gridCellInfo:", cellIndex, v4, v7);

  return v4;
}

- (id)fixedIconsInGridRange:(SBHIconGridRange)a3 gridCellInfo:(id)a4
{
  id v5 = -[SBIconListModel iconsForGridRange:gridCellInfo:](self, "iconsForGridRange:gridCellInfo:", a3.cellIndex, *(void *)&a3.size.columns, a4);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__SBIconListModel_fixedIconsInGridRange_gridCellInfo___block_invoke;
  v8[3] = &unk_1E6AADB28;
  void v8[4] = self;
  id v6 = objc_msgSend(v5, "bs_filter:", v8);

  return v6;
}

uint64_t __54__SBIconListModel_fixedIconsInGridRange_gridCellInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isIconFixed:a2];
}

- (BOOL)hasFixedIconsInGridRange:(SBHIconGridRange)a3 gridCellInfo:(id)a4
{
  SBHIconGridSize size = a3.size;
  unint64_t cellIndex = a3.cellIndex;
  id v7 = a4;
  unsigned __int16 v8 = (unsigned __int16)[(SBIconListModel *)self gridSize];
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __57__SBIconListModel_hasFixedIconsInGridRange_gridCellInfo___block_invoke;
  v11[3] = &unk_1E6AB0D30;
  id v9 = v7;
  id v12 = v9;
  uint64_t v13 = self;
  id v14 = &v15;
  SBHIconGridRangeEnumerateCellIndexes(cellIndex, *(_DWORD *)&size, v8, v11);
  LOBYTE(size.columns) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return size.columns;
}

void __57__SBIconListModel_hasFixedIconsInGridRange_gridCellInfo___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) iconIndexForGridCellIndex:a2];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [*(id *)(a1 + 40) iconAtIndex:v5];
    if (objc_msgSend(*(id *)(a1 + 40), "isIconFixed:"))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      *a3 = 1;
    }
  }
}

- (BOOL)hasFixedIconsInContiguousRegion:(id)a3 gridCellInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  _OWORD v10[2] = __64__SBIconListModel_hasFixedIconsInContiguousRegion_gridCellInfo___block_invoke;
  v10[3] = &unk_1E6AB0D30;
  id v8 = v7;
  id v11 = v8;
  id v12 = self;
  uint64_t v13 = &v14;
  [v6 enumerateGridCellIndexesUsingBlock:v10];
  LOBYTE(self) = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

void __64__SBIconListModel_hasFixedIconsInContiguousRegion_gridCellInfo___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) iconIndexForGridCellIndex:a2];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [*(id *)(a1 + 40) iconAtIndex:v5];
    if (objc_msgSend(*(id *)(a1 + 40), "isIconFixed:"))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      *a3 = 1;
    }
  }
}

- (id)fixedIconsInContiguousRegion:(id)a3 gridCellInfo:(id)a4
{
  uint64_t v5 = [(SBIconListModel *)self iconsInContiguousRegion:a3 gridCellInfo:a4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__SBIconListModel_fixedIconsInContiguousRegion_gridCellInfo___block_invoke;
  v8[3] = &unk_1E6AADB28;
  void v8[4] = self;
  id v6 = objc_msgSend(v5, "bs_filter:", v8);

  return v6;
}

uint64_t __61__SBIconListModel_fixedIconsInContiguousRegion_gridCellInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isIconFixed:a2];
}

- (BOOL)hasAllFixedIconsInContiguousRegion:(id)a3 gridCellInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEmpty])
  {
    BOOL v8 = 0;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 1;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    _OWORD v10[2] = __67__SBIconListModel_hasAllFixedIconsInContiguousRegion_gridCellInfo___block_invoke;
    v10[3] = &unk_1E6AB0D30;
    id v11 = v7;
    id v12 = self;
    uint64_t v13 = &v14;
    [v6 enumerateGridCellIndexesUsingBlock:v10];
    BOOL v8 = *((unsigned char *)v15 + 24) != 0;

    _Block_object_dispose(&v14, 8);
  }

  return v8;
}

void __67__SBIconListModel_hasAllFixedIconsInContiguousRegion_gridCellInfo___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) iconIndexForGridCellIndex:a2];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [*(id *)(a1 + 40) iconAtIndex:v5];
    if ((objc_msgSend(*(id *)(a1 + 40), "isIconFixed:") & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      *a3 = 1;
    }
  }
}

- (BOOL)hasContiguousRegionOfFixedIconsAtGridCellIndex:(unint64_t)a3 gridCellInfo:(id)a4
{
  id v6 = a4;
  id v7 = [v6 contiguousRegionForGridCellIndex:a3];
  BOOL v8 = v7;
  BOOL v9 = v7
    && ([v7 isEmpty] & 1) == 0
    && [(SBIconListModel *)self hasAllFixedIconsInContiguousRegion:v8 gridCellInfo:v6];

  return v9;
}

- (BOOL)areIconsInContiguousRegionOfHeterogeneousFixedness:(id)a3 gridCellInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  char v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  uint64_t v16 = 0;
  char v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  _OWORD v10[2] = __83__SBIconListModel_areIconsInContiguousRegionOfHeterogeneousFixedness_gridCellInfo___block_invoke;
  v10[3] = &unk_1E6AB1F90;
  id v8 = v7;
  id v11 = v8;
  id v12 = self;
  uint64_t v13 = v20;
  uint64_t v14 = v22;
  uint64_t v15 = &v16;
  [v6 enumerateGridCellIndexesUsingBlock:v10];
  LOBYTE(self) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);

  return (char)self;
}

void __83__SBIconListModel_areIconsInContiguousRegionOfHeterogeneousFixedness_gridCellInfo___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) iconIndexForGridCellIndex:a2];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    return;
  }
  id v9 = [*(id *)(a1 + 40) iconAtIndex:v5];
  if (objc_msgSend(*(id *)(a1 + 40), "isIconFixed:"))
  {
    id v6 = v9;
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      uint64_t v7 = *(void *)(a1 + 56);
      goto LABEL_8;
    }
  }
  else
  {
    id v6 = v9;
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      uint64_t v7 = *(void *)(a1 + 48);
LABEL_8:
      uint64_t v8 = *(void *)(v7 + 8);
      if (!*(unsigned char *)(v8 + 24)) {
        *(unsigned char *)(v8 + 24) = 1;
      }
      goto LABEL_10;
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  *a3 = 1;
LABEL_10:
}

- (BOOL)isContiguousRegionEligibleForBackfill:(id)a3 gridCellInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v6 count];
  if (v8)
  {
    if ([(SBIconListModel *)self hasFixedIconsInContiguousRegion:v6 gridCellInfo:v7])
    {
      unsigned int v9 = [v7 gridSize];
      uint64_t v10 = [[SBIconListGridCellInfo alloc] initWithGridSize:v9];
      [(SBIconListGridCellInfo *)v10 setIconIndex:0 inContiguousRegion:v6];
      if (objc_msgSend(v7, "coordinateForGridCellIndex:", objc_msgSend(v6, "startGridCellIndex")) == 1
        && (uint64_t v12 = v11, [(SBIconListGridCellInfo *)v10 numberOfUsedGridCellsInRow:v11 - 1])&& (v13 = v8 > (unsigned __int16)v9, v8 -= (unsigned __int16)v9, v13))
      {
        while (v8)
        {
          unint64_t v14 = [(SBIconListGridCellInfo *)v10 numberOfUsedGridCellsInRow:v12];
          v8 -= v14;
          ++v12;
          if (v14 < (unsigned __int16)v9)
          {
            LOBYTE(v8) = v8 == 0;
            goto LABEL_12;
          }
        }
        LOBYTE(v8) = 1;
      }
      else
      {
        LOBYTE(v8) = 0;
      }
LABEL_12:
    }
    else
    {
      LOBYTE(v8) = 1;
    }
  }

  return v8;
}

- (id)adjustContiguousRegionForBackfill:(id)a3 gridCellInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = [v6 gridSize];
  uint64_t v8 = [v5 gridRange];
  if ((v9 & 0xFFFE0000) != 0)
  {
    unint64_t v10 = v8;
    uint64_t v11 = v9;
    uint64_t v12 = [[SBIconListGridCellInfo alloc] initWithGridSize:v7];
    [(SBIconListGridCellInfo *)v12 setIconIndex:0 inContiguousRegion:v5];
    uint64_t v39 = 0;
    long long v40 = &v39;
    uint64_t v41 = 0x3010000000;
    id v42 = &unk_1D821E08B;
    long long v43 = xmmword_1D81E5560;
    uint64_t v35 = 0;
    long long v36 = &v35;
    uint64_t v37 = 0x2020000000;
    char v38 = 0;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __66__SBIconListModel_adjustContiguousRegionForBackfill_gridCellInfo___block_invoke;
    v27[3] = &unk_1E6AB1FB8;
    id v28 = v6;
    BOOL v13 = v12;
    unsigned int v34 = v7;
    unint64_t v32 = v10;
    uint64_t v33 = v11;
    uint64_t v29 = v13;
    uint64_t v30 = &v39;
    int v31 = &v35;
    SBHIconGridRangeEnumerateRows(v10, v11, v7, 0, v27);
    if (*((unsigned char *)v36 + 24))
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      v25[0] = 0;
      v25[1] = v25;
      v25[2] = 0x2020000000;
      char v26 = 0;
      uint64_t v15 = v40;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __66__SBIconListModel_adjustContiguousRegionForBackfill_gridCellInfo___block_invoke_2;
      void v20[3] = &unk_1E6AB1FE0;
      id v16 = v5;
      id v21 = v16;
      char v23 = &v39;
      int v24 = v25;
      id v17 = v14;
      id v22 = v17;
      SBHIconGridRangeEnumerateCellIndexes(v15[4], v15[5], v7, v20);
      id v18 = [v16 contiguousRegionByRemovingGridCellIndexes:v17];

      _Block_object_dispose(v25, 8);
    }
    else
    {
      id v18 = v5;
    }

    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&v39, 8);
  }
  else
  {
    id v18 = v5;
  }

  return v18;
}

uint64_t __66__SBIconListModel_adjustContiguousRegionForBackfill_gridCellInfo___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  [*(id *)(a1 + 32) coordinateForGridCellIndex:a2];
  uint64_t result = [*(id *)(a1 + 40) numberOfUsedGridCellsInRow:v10 - 1];
  if (result != *(unsigned __int16 *)(a1 + 80))
  {
    if (*(unsigned __int16 *)(a1 + 74) - 1 == a4)
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
      *(void *)(v12 + 32) = a2;
      *(void *)(v12 + 40) = a3;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
    *a5 = 1;
  }
  return result;
}

uint64_t __66__SBIconListModel_adjustContiguousRegionForBackfill_gridCellInfo___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) containsGridCellIndex:a2];
  if (result)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      unsigned int v7 = *(void **)(a1 + 40);
      return [v7 addIndex:a2];
    }
  }
  else if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) == a2)
  {
    *a3 = 1;
  }
  else
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    if (!*(unsigned char *)(v8 + 24)) {
      *(unsigned char *)(v8 + 24) = 1;
    }
  }
  return result;
}

- (void)saveCurrentIconLocationsAsFixed
{
  if ([(SBIconListModel *)self allowsFixedIconLocations])
  {
    unint64_t v3 = [(SBIconListModel *)self gridCellInfoWithOptions:0];
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    uint64_t v8 = __50__SBIconListModel_saveCurrentIconLocationsAsFixed__block_invoke;
    uint64_t v9 = &unk_1E6AB0B58;
    uint64_t v10 = self;
    id v11 = v3;
    id v4 = v3;
    [(SBIconListModel *)self enumerateIconsUsingBlock:&v6];
    id v5 = [(SBIconListModel *)self _rotatedIconListModelIfAllowed];
    [v5 saveCurrentIconLocationsAsFixed];
  }
}

void __50__SBIconListModel_saveCurrentIconLocationsAsFixed__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isIconFixed:") & 1) == 0) {
    objc_msgSend(*(id *)(a1 + 32), "setFixedLocation:forIcon:", objc_msgSend(*(id *)(a1 + 40), "gridCellIndexForIconIndex:", a3), v5);
  }
}

- (void)saveOnlyRequiredIconLocationsAsFixed
{
  unint64_t v3 = [(SBIconListModel *)self gridCellInfoWithOptions:0];
  fixedIconLocations = self->_fixedIconLocations;
  if (fixedIconLocations) {
    id v5 = (id)[(NSMutableDictionary *)fixedIconLocations mutableCopy];
  }
  else {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  _OWORD v10[2] = __55__SBIconListModel_saveOnlyRequiredIconLocationsAsFixed__block_invoke;
  v10[3] = &unk_1E6AB1AE0;
  void v10[4] = self;
  id v11 = v3;
  id v12 = v5;
  id v6 = v5;
  id v7 = v3;
  [(SBIconListModel *)self enumerateIconsUsingBlock:v10];
  if ([v6 count]) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }
  [(SBIconListModel *)self setFixedIconLocations:v8];
  uint64_t v9 = [(SBIconListModel *)self _rotatedIconListModelIfAllowed];
  [v9 saveOnlyRequiredIconLocationsAsFixed];
}

void __55__SBIconListModel_saveOnlyRequiredIconLocationsAsFixed__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isInsertionFixedForIcon:options:")
    && ([*(id *)(a1 + 32) isIconFixed:v9] & 1) == 0)
  {
    id v5 = [v9 uniqueIdentifier];
    uint64_t v6 = [*(id *)(a1 + 40) gridCellIndexForIconIndex:a3];
    id v7 = *(void **)(a1 + 48);
    id v8 = [NSNumber numberWithUnsignedInteger:v6];
    [v7 setObject:v8 forKey:v5];
  }
}

- (void)saveOnlyRequiredIconLocationsAsFixedIfRequired
{
  if ([(SBIconListModel *)self requiresSomeFixedIconLocations])
  {
    [(SBIconListModel *)self saveOnlyRequiredIconLocationsAsFixed];
  }
}

- (BOOL)isInsertionFixedForIcon:(id)a3 options:(unint64_t)a4
{
  uint64_t v6 = [a3 gridSizeClass];
  LOBYTE(a4) = [(SBIconListModel *)self isInsertionFixedForIconGridSizeClass:v6 options:a4];

  return a4;
}

- (BOOL)isInsertionFixedForIcon:(id)a3 atGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  id v9 = a3;
  uint64_t v10 = [v9 gridSizeClass];
  LOBYTE(a6) = [(SBIconListModel *)self isInsertionFixedForIcon:v9 ofGridSizeClass:v10 atGridCellIndex:a4 gridCellInfoOptions:0 mutationOptions:a6];

  return a6;
}

- (BOOL)isInsertionFixedForIcon:(id)a3 atGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5 mutationOptions:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a3;
  id v12 = [v11 gridSizeClass];
  LOBYTE(a6) = [(SBIconListModel *)self isInsertionFixedForIcon:v11 ofGridSizeClass:v12 atGridCellIndex:a4 gridCellInfo:v10 mutationOptions:a6];

  return a6;
}

- (BOOL)isInsertionFixedForIconGridSizeClass:(id)a3 options:(unint64_t)a4
{
  return [(SBIconListModel *)self isInsertionFixedForIconGridSizeClass:a3 atGridCellIndex:0x7FFFFFFFFFFFFFFFLL gridCellInfoOptions:0 mutationOptions:a4];
}

- (BOOL)isInsertionFixedForIconGridSizeClass:(id)a3 atGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  id v10 = a3;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v11 = 0;
  }
  else
  {
    id v11 = [(SBIconListModel *)self gridCellInfoWithOptions:a5];
  }
  BOOL v12 = [(SBIconListModel *)self isInsertionFixedForIconGridSizeClass:v10 atGridCellIndex:a4 gridCellInfo:v11 mutationOptions:a6];

  return v12;
}

- (BOOL)isInsertionFixedForIconGridSizeClass:(id)a3 atGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5 mutationOptions:(unint64_t)a6
{
  return [(SBIconListModel *)self isInsertionFixedForIcon:0 ofGridSizeClass:a3 atGridCellIndex:a4 gridCellInfo:a5 mutationOptions:a6];
}

- (BOOL)isInsertionFixedForIcon:(id)a3 ofGridSizeClass:(id)a4 atGridCellIndex:(unint64_t)a5 gridCellInfoOptions:(unint64_t)a6 mutationOptions:(unint64_t)a7
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  if (a5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v14 = 0;
  }
  else if (v12)
  {
    v18[0] = v12;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    id v14 = [(SBIconListModel *)self gridCellInfoExcludingIcons:v15 options:a6];
  }
  else
  {
    id v14 = [(SBIconListModel *)self gridCellInfoWithOptions:a6];
  }
  BOOL v16 = [(SBIconListModel *)self isInsertionFixedForIcon:v12 ofGridSizeClass:v13 atGridCellIndex:a5 gridCellInfo:v14 mutationOptions:a7];

  return v16;
}

- (BOOL)isInsertionFixedForIcon:(id)a3 ofGridSizeClass:(id)a4 atGridCellIndex:(unint64_t)a5 gridCellInfo:(id)a6 mutationOptions:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  switch([(SBIconListModel *)self fixedIconLocationBehavior])
  {
    case 1:
    case 4:
      if ((a7 & 0x80) != 0) {
        goto LABEL_5;
      }
      if ((a7 & 0x200) == 0) {
        goto LABEL_8;
      }
      LOBYTE(a7) = [(SBIconListModel *)self isInsertionRequiredToBeFixedForIcon:v12 ofGridSizeClass:v13 atGridCellIndex:a5 gridCellInfo:v14 mutationOptions:a7];
      break;
    case 2:
LABEL_5:
      LOBYTE(a7) = 1;
      break;
    case 3:
      if (!v13) {
        goto LABEL_8;
      }
      LODWORD(a7) = [v13 isEqualToString:@"SBHIconGridSizeClassDefault"] ^ 1;
      break;
    default:
LABEL_8:
      LOBYTE(a7) = 0;
      break;
  }

  return a7;
}

- (BOOL)isInsertionRequiredToBeFixedForIcon:(id)a3 ofGridSizeClass:(id)a4 atGridCellIndex:(unint64_t)a5 gridCellInfo:(id)a6 mutationOptions:(unint64_t)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = v13;
  BOOL v15 = 1;
  if (a5 != 0x7FFFFFFFFFFFFFFFLL && v13)
  {
    if (!a5) {
      goto LABEL_7;
    }
    uint64_t v16 = objc_msgSend(v13, "gridCellIndexForIconIndex:", -[SBIconListModel indexForIcon:](self, "indexForIcon:", v11));
    unsigned int v17 = [(SBIconListModel *)self gridSizeAreaForGridSizeClass:v12];
    uint64_t v18 = [v14 numberOfEmptyGridCells];
    uint64_t v19 = v17;
    if (v16 != 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v19 = 0;
    }
    if (v18 != v19) {
      BOOL v15 = objc_msgSend(v14, "indexOfFirstEmptyGridCellRangeOfSize:inGridCellIndexRange:", 65537, 0, a5) != 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
LABEL_7:
    }
      BOOL v15 = 0;
  }

  return v15;
}

- (void)relocateAnyAffectedFixedIconsForInsertingIcon:(id)a3 atGridCellIndex:(unint64_t)a4 replacingIcon:(id)a5 gridCellInfoOptions:(unint64_t)a6
{
  id v18 = a3;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    id v12 = [v10 gridSizeClass];
    id v13 = [v18 gridSizeClass];
    id v14 = v13;
    if (v13 == v12 || ([v13 isEqualToString:v12] & 1) != 0)
    {

      goto LABEL_10;
    }
  }
  if ([(SBIconListModel *)self fixedIconLocationBehavior] == 4) {
    [(SBIconListModel *)self reflowIconsForwardForInsertingIcon:v18 atGridCellIndex:a4 replacingIcon:v11 gridCellInfoOptions:a6];
  }
  id v12 = [v18 gridSizeClass];
  unint64_t v15 = [(SBIconListModel *)self bestGridCellIndexForInsertingIcon:v18 atGridCellIndex:a4 gridCellInfoOptions:a6];
  uint64_t v16 = [(SBIconListModel *)self gridSizeForGridSizeClass:v12 gridCellInfoOptions:a6];
  if (-[SBIconListModel isValidGridRange:options:](self, "isValidGridRange:options:", v15, v16, a6)) {
    id v17 = -[SBIconListModel relocateFixedIconsInGridRange:gridCellInfoOptions:](self, "relocateFixedIconsInGridRange:gridCellInfoOptions:", v15, v16, a6);
  }
LABEL_10:
}

- (id)relocateFixedIconsInGridRange:(SBHIconGridRange)a3 gridCellInfoOptions:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3.size.columns;
  unint64_t cellIndex = a3.cellIndex;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = [(SBIconListModel *)self gridCellInfoWithOptions:a4];
  unint64_t v9 = -[SBIconListModel fixedIconsInGridRange:gridCellInfo:](self, "fixedIconsInGridRange:gridCellInfo:", cellIndex, v5, v8);
  if ([(id)v9 count])
  {
    -[SBIconListModel removeFixedIconLocationsForIconsInGridRange:gridCellInfo:](self, "removeFixedIconLocationsForIconsInGridRange:gridCellInfo:", cellIndex, v5, v8);
    uint64_t v10 = [(SBIconListModel *)self rotatedLayoutClusterGridSizeClass];
    id v28 = (void *)v10;
    unint64_t v29 = v9;
    if (SBHIconGridSizeEqualToIconGridSize(-[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](self, "gridSizeForGridSizeClass:gridCellInfoOptions:", v10, a4), v5)&& (obuint64_t j = -[SBIconListModel firstGridCellIndexOfRangeOfGridSizeClass:withoutFixedIconsNearGridRange:gridCellInfo:](self, "firstGridCellIndexOfRangeOfGridSizeClass:withoutFixedIconsNearGridRange:gridCellInfo:", v10, cellIndex, v5, v8, v10), obj != (id)0x7FFFFFFFFFFFFFFFLL))
    {
      unint64_t v20 = [v8 gridSize];
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v30 = (id)v9;
      uint64_t v21 = [v30 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        id v32 = *(id *)v41;
        uint64_t v23 = v20;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(id *)v41 != v32) {
              objc_enumerationMutation(v30);
            }
            uint64_t v25 = *(void *)(*((void *)&v40 + 1) + 8 * i);
            unint64_t v9 = v9 & 0xFFFFFFFF00000000 | v23;
            unint64_t v26 = SBHIconGridRangeRelativeCellIndexForCellIndex(cellIndex, v5, objc_msgSend(v8, "gridCellIndexForIconIndex:", -[SBIconListModel indexForIcon:](self, "indexForIcon:", v25)), v9);
            unint64_t v20 = v20 & 0xFFFFFFFF00000000 | v23;
            [(SBIconListModel *)self setFixedLocation:SBHIconGridRangeCellIndexForRelativeCellIndex((unint64_t)obj, v5, v26, v20) forIcon:v25];
          }
          uint64_t v22 = [v30 countByEnumeratingWithState:&v40 objects:v45 count:16];
        }
        while (v22);
      }

      id v31 = 0;
    }
    else
    {
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __69__SBIconListModel_relocateFixedIconsInGridRange_gridCellInfoOptions___block_invoke;
      v39[3] = &unk_1E6AB2008;
      v39[4] = self;
      v39[5] = a4;
      objc_msgSend((id)v9, "sortedArrayUsingComparator:", v39, v28);
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id obja = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = [obja countByEnumeratingWithState:&v35 objects:v44 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        id v31 = 0;
        uint64_t v13 = *(void *)v36;
        do
        {
          for (uint64_t j = 0; j != v12; ++j)
          {
            if (*(void *)v36 != v13) {
              objc_enumerationMutation(obja);
            }
            unint64_t v15 = *(void **)(*((void *)&v35 + 1) + 8 * j);
            uint64_t v16 = [v15 gridSizeClass];
            unint64_t v17 = -[SBIconListModel firstGridCellIndexOfRangeOfGridSizeClass:withoutIconsNearGridRange:gridCellInfo:](self, "firstGridCellIndexOfRangeOfGridSizeClass:withoutIconsNearGridRange:gridCellInfo:", v16, cellIndex, v5, v8);
            if (v17 == 0x7FFFFFFFFFFFFFFFLL
              && (unint64_t v17 = -[SBIconListModel firstGridCellIndexOfRangeOfGridSizeClass:withoutFixedIconsNearGridRange:gridCellInfo:](self, "firstGridCellIndexOfRangeOfGridSizeClass:withoutFixedIconsNearGridRange:gridCellInfo:", v16, cellIndex, v5, v8), v17 == 0x7FFFFFFFFFFFFFFFLL))
            {
              id v18 = v31;
              if (!v31) {
                id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              }
              id v31 = v18;
              [v18 addObject:v15];
            }
            else
            {
              [(SBIconListModel *)self setFixedLocation:v17 forIcon:v15];
              uint64_t v19 = [(SBIconListModel *)self gridCellInfoWithOptions:a4];

              id v8 = (void *)v19;
            }
          }
          uint64_t v12 = [obja countByEnumeratingWithState:&v35 objects:v44 count:16];
        }
        while (v12);
      }
      else
      {
        id v31 = 0;
      }
    }
    unint64_t v9 = v29;
  }
  else
  {
    id v31 = 0;
  }

  return v31;
}

uint64_t __69__SBIconListModel_relocateFixedIconsInGridRange_gridCellInfoOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 gridSizeClass];
  id v7 = [v5 gridSizeClass];

  LODWORD(v5) = [*(id *)(a1 + 32) gridSizeForGridSizeClass:v6 gridCellInfoOptions:*(void *)(a1 + 40)];
  LODWORD(a1) = [*(id *)(a1 + 32) gridSizeForGridSizeClass:v7 gridCellInfoOptions:*(void *)(a1 + 40)];
  unsigned int Area = SBHIconGridSizeGetArea((int)v5);
  unsigned int v9 = SBHIconGridSizeGetArea(a1);
  uint64_t v10 = -1;
  if (Area <= v9) {
    uint64_t v10 = 1;
  }
  if (Area == v9) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = v10;
  }

  return v11;
}

- (void)reflowIconsForwardForInsertingIcon:(id)a3 atGridCellIndex:(unint64_t)a4 replacingIcon:(id)a5 gridCellInfoOptions:(unint64_t)a6
{
  id v14 = a3;
  id v10 = a5;
  if ([(SBIconListModel *)self maxNumberOfIcons] > a4)
  {
    uint64_t v11 = [(SBIconListModel *)self gridCellInfoWithOptions:a6];
    uint64_t v12 = [v11 contiguousRegionForGridCellIndex:a4];
    if (([v12 isEmpty] & 1) == 0)
    {
      uint64_t v13 = [v11 iconIndexesForContiguousRegion:v12];
      if ((unint64_t)[v13 count] >= 2) {
        [(SBIconListModel *)self shiftFixedIconsInContiguousRegion:v12 forInsertingIcon:v14 orRemovingIcon:0 orResizingIcon:0 orMovingIcon:0 atGridCellIndex:a4 replacingIcon:v10 resizingToGridSizeClass:0 gridCellInfoOptions:a6 mutationOptions:0];
      }
    }
  }
}

- (void)reflowIconsForResizingIcon:(id)a3 atGridCellIndex:(unint64_t)a4 toGridSizeClass:(id)a5 gridCellInfoOptions:(unint64_t)a6
{
  id v14 = a3;
  id v10 = a5;
  if ([(SBIconListModel *)self maxNumberOfIcons] > a4)
  {
    uint64_t v11 = [(SBIconListModel *)self gridCellInfoWithOptions:a6];
    uint64_t v12 = [v11 contiguousRegionForGridCellIndex:a4];
    if (([v12 isEmpty] & 1) == 0)
    {
      uint64_t v13 = [v11 iconIndexesForContiguousRegion:v12];
      if ((unint64_t)[v13 count] >= 2) {
        [(SBIconListModel *)self shiftFixedIconsInContiguousRegion:v12 forInsertingIcon:0 orRemovingIcon:0 orResizingIcon:v14 orMovingIcon:0 atGridCellIndex:a4 replacingIcon:0 resizingToGridSizeClass:v10 gridCellInfoOptions:a6 mutationOptions:0];
      }
    }
  }
}

- (void)shiftFixedIconsBackwardsInContiguousRegion:(id)a3 toFillHoleLeftByRemovingIcon:(id)a4 fromGridCellIndex:(unint64_t)a5 gridCellInfoOptions:(unint64_t)a6 mutationOptions:(unint64_t)a7
{
}

- (void)shiftFixedIconsInContiguousRegion:(id)a3 forInsertingIcon:(id)a4 orRemovingIcon:(id)a5 orResizingIcon:(id)a6 orMovingIcon:(id)a7 atGridCellIndex:(unint64_t)a8 replacingIcon:(id)a9 resizingToGridSizeClass:(id)a10 gridCellInfoOptions:(unint64_t)a11 mutationOptions:(unint64_t)a12
{
  uint64_t v171 = *MEMORY[0x1E4F143B8];
  unint64_t v18 = (unint64_t)a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  uint64_t v22 = self;
  id v23 = v21;
  id v24 = a7;
  id v25 = a9;
  unint64_t v26 = a8;
  id v27 = a10;
  if ([(SBIconListModel *)v22 maxNumberOfIcons] > a8)
  {
    v116 = v27;
    uint64_t v117 = v23;
    id v28 = -[SBIconListModel gridCellInfoWithOptions:](v22, "gridCellInfoWithOptions:");
    unint64_t v29 = [v28 gridSize];
    uint64_t v30 = [(id)v18 gridRange];
    id v31 = v22;
    uint64_t v33 = v32;
    v129 = v31;
    v118 = v28;
    if (!-[SBIconListModel hasFixedIconsInGridRange:gridCellInfo:](v31, "hasFixedIconsInGridRange:gridCellInfo:", v30, v32, v28))
    {
LABEL_69:
      id v28 = v118;
      goto LABEL_70;
    }
    unint64_t v115 = v26;
    if (v20)
    {
      if (![(SBIconListModel *)v129 isContiguousRegionEligibleForBackfill:v18 gridCellInfo:v28])
      {
LABEL_70:

        id v27 = v116;
        id v23 = v117;
        goto LABEL_71;
      }
      id v106 = v24;
      uint64_t v34 = [(SBIconListModel *)v129 adjustContiguousRegionForBackfill:v18 gridCellInfo:v28];

      unint64_t v18 = v34;
    }
    else
    {
      id v106 = v24;
    }
    unint64_t v35 = v33 & 0xFFFFFFFF0000FFFFLL | v29 & 0xFFFF0000;
    id v36 = v19;
    uint64_t v37 = [v36 gridSizeClass];
    unint64_t v104 = (unint64_t)v36;
    if (v36)
    {
      id v111 = v36;
    }
    else
    {
      uint64_t v39 = (void *)v37;
      id v111 = v20;
      long long v38 = v118;
      if (v20)
      {
        uint64_t v37 = (uint64_t)v39;
        goto LABEL_12;
      }
      id v111 = v117;
      id v101 = v116;

      uint64_t v37 = (uint64_t)v101;
    }
    long long v38 = v118;
LABEL_12:
    v112 = v25;
    if (!v37)
    {
      uint64_t v37 = [v111 gridSizeClass];
    }
    v114 = (void *)v37;
    long long v107 = v20;
    id v108 = v19;
    int v105 = v29;
    unint64_t v40 = SBHIconGridRangeRowForCellIndex(v30, v35, v26, v29);
    unint64_t v41 = SBHIconGridRangeMinCellIndexOnRow(v30, v35, v29, v40);
    unint64_t v127 = SBHIconGridRangeIntersection(v41, v35, 0, v29, v29);
    unint64_t v43 = v42;
    id v44 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    v161[0] = MEMORY[0x1E4F143A8];
    v161[1] = 3221225472;
    v161[2] = __203__SBIconListModel_shiftFixedIconsInContiguousRegion_forInsertingIcon_orRemovingIcon_orResizingIcon_orMovingIcon_atGridCellIndex_replacingIcon_resizingToGridSizeClass_gridCellInfoOptions_mutationOptions___block_invoke;
    v161[3] = &unk_1E6AB2030;
    unint64_t v167 = v26;
    id v128 = v38;
    id v162 = v128;
    v163 = v129;
    id v103 = v112;
    id v164 = v103;
    unint64_t v102 = v117;
    id v165 = (id)v102;
    id v119 = v44;
    id v166 = v119;
    long long v109 = (void *)v18;
    [(id)v18 enumerateGridCellIndexesUsingBlock:v161];
    uint64_t v113 = v43;
    unint64_t v45 = -[SBIconListGridCellInfo initWithGridSize:]([SBIconListGridCellInfo alloc], "initWithGridSize:");
    if (v26 > v41) {
      -[SBIconListGridCellInfo setIconIndex:inGridRange:](v45, "setIconIndex:inGridRange:", 65534, SBHIconGridRangeRelativeCellIndexForCellIndex(v127, v43, v41, v29), (unsigned __int16)(v26 - v41) | 0x10000);
    }
    v120 = v45;
    uint64_t v125 = v29;
    unint64_t v126 = v43;
    long long v159 = 0u;
    long long v160 = 0u;
    long long v157 = 0u;
    long long v158 = 0u;
    uint64_t v46 = [v119 array];
    unint64_t v47 = (void *)[v46 copy];

    uint64_t v48 = [v47 countByEnumeratingWithState:&v157 objects:v170 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      unint64_t v122 = *(void *)v158;
      do
      {
        for (uint64_t i = 0; i != v49; ++i)
        {
          if (*(void *)v158 != v122) {
            objc_enumerationMutation(v47);
          }
          uint64_t v51 = *(void *)(*((void *)&v157 + 1) + 8 * i);
          unint64_t v52 = [(SBIconListModel *)v129 gridRangeForIcon:v51 gridCellInfo:v128];
          unsigned int v54 = v53;
          unint64_t v18 = v18 & 0xFFFFFFFF00000000 | v125;
          uint64_t v55 = SBHIconGridRangeIntersection(v52, v53, v127, v43, v18);
          if (!SBHIconGridRangeIsEmpty(v55, v56))
          {
            unint64_t v29 = v29 & 0xFFFFFFFF00000000 | v125;
            unint64_t v57 = SBHIconGridRangeRelativeCellIndexForCellIndex(v127, v43, v55, v29);
            if (-[SBIconListGridCellInfo indexOfFirstUsedGridCellInGridRange:](v120, "indexOfFirstUsedGridCellInGridRange:", v57, v54) != 0x7FFFFFFFFFFFFFFFLL)
            {
              -[SBIconListGridCellInfo setIconIndex:inGridRange:](v120, "setIconIndex:inGridRange:", 65534, v57, v54);
              [v119 removeObject:v51];
            }
          }
        }
        uint64_t v49 = [v47 countByEnumeratingWithState:&v157 objects:v170 count:16];
      }
      while (v49);
    }

    if (v114 && ![v114 isEqualToString:@"SBHIconGridSizeClassDefault"])
    {
      id v123 = 0;
      uint64_t v63 = v129;
    }
    else
    {
      long long v155 = 0u;
      long long v156 = 0u;
      long long v153 = 0u;
      long long v154 = 0u;
      id v58 = v119;
      uint64_t v59 = [v58 countByEnumeratingWithState:&v153 objects:v169 count:16];
      if (v59)
      {
        uint64_t v60 = v59;
        id v61 = 0;
        uint64_t v62 = *(void *)v154;
        uint64_t v63 = v129;
        do
        {
          for (uint64_t j = 0; j != v60; ++j)
          {
            if (*(void *)v154 != v62) {
              objc_enumerationMutation(v58);
            }
            char v65 = *(void **)(*((void *)&v153 + 1) + 8 * j);
            int v66 = [v65 gridSizeClass];
            long long v67 = v66;
            if (v66)
            {
              if (([v66 isEqualToString:@"SBHIconGridSizeClassDefault"] & 1) == 0)
              {
                uint64_t v68 = [(SBIconListModel *)v63 indexForIcon:v65];
                if (v68 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  id v69 = v58;
                  uint64_t v70 = [v128 gridCellIndexForIconIndex:v68];
                  if (v70 != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    unint64_t v71 = v70;
                    long long v72 = [v65 uniqueIdentifier];
                    unint64_t v122 = v122 & 0xFFFFFFFF00000000 | v125;
                    unint64_t v73 = SBHIconGridRangeRelativeCellIndexForCellIndex(v127, v126, v71, v125);
                    if (!v61) {
                      id v61 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                    }
                    long long v74 = [NSNumber numberWithUnsignedInteger:v73];
                    [v61 setObject:v74 forKey:v72];
                  }
                  id v58 = v69;
                  uint64_t v63 = v129;
                }
              }
            }
          }
          uint64_t v60 = [v58 countByEnumeratingWithState:&v153 objects:v169 count:16];
        }
        while (v60);
      }
      else
      {
        id v61 = 0;
        uint64_t v63 = v129;
      }
      id v123 = v61;
    }
    id v20 = v107;
    unint64_t v75 = v126;
    if (v104 | v102)
    {
      int v76 = [(SBIconListModel *)v63 gridSizeForGridSizeClass:v114 gridCellInfoOptions:a11];
      unint64_t v77 = SBHIconGridRangeRelativeCellIndexForCellIndex(v127, v126, v115, v125);
      uint64_t v78 = SBHIconGridRangeIntersection(v77, v76, 0, v113, v125);
      -[SBIconListGridCellInfo setIconIndex:inGridRange:](v120, "setIconIndex:inGridRange:", 65534, v78, v79);
    }
    v145[0] = MEMORY[0x1E4F143A8];
    v145[1] = 3221225472;
    v145[2] = __203__SBIconListModel_shiftFixedIconsInContiguousRegion_forInsertingIcon_orRemovingIcon_orResizingIcon_orMovingIcon_atGridCellIndex_replacingIcon_resizingToGridSizeClass_gridCellInfoOptions_mutationOptions___block_invoke_2;
    v145[3] = &unk_1E6AB2058;
    unint64_t v147 = v115;
    unint64_t v148 = v127;
    int v152 = v105;
    unint64_t v149 = v126;
    uint64_t v150 = 0;
    uint64_t v151 = v113;
    id v80 = v120;
    v146 = v80;
    [v109 enumerateEmptyGridCellIndexesUsingBlock:v145];
    v134[0] = MEMORY[0x1E4F143A8];
    v134[1] = 3221225472;
    v134[2] = __203__SBIconListModel_shiftFixedIconsInContiguousRegion_forInsertingIcon_orRemovingIcon_orResizingIcon_orMovingIcon_atGridCellIndex_replacingIcon_resizingToGridSizeClass_gridCellInfoOptions_mutationOptions___block_invoke_3;
    v134[3] = &unk_1E6AB2080;
    id v135 = v103;
    id v81 = v107;
    id v136 = v81;
    v137 = v129;
    unint64_t v18 = v109;
    id v138 = (id)v18;
    unint64_t v140 = v127;
    unint64_t v141 = v126;
    int v144 = v105;
    long long v82 = v129;
    uint64_t v142 = 0;
    uint64_t v143 = v113;
    obuint64_t j = v80;
    v139 = obj;
    [(SBIconListModel *)v129 enumerateIconsUsingBlock:v134];
    if ((a12 & 0x200000) != 0)
    {
      id v19 = v108;
      id v83 = v123;
      if (!v123) {
        id v83 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      unint64_t v84 = v115;
      if (v107)
      {
        int v85 = [v81 gridSizeClass];
        unsigned int v86 = [(SBIconListModel *)v129 gridSizeAreaForGridSizeClass:v85 gridCellInfoOptions:a11];
        if (v86 >= 2)
        {
          unsigned int v87 = v86;
          v124 = v85;
          unint64_t v110 = v18;
          long long v132 = 0u;
          long long v133 = 0u;
          long long v130 = 0u;
          long long v131 = 0u;
          id v88 = v119;
          uint64_t v89 = [v88 countByEnumeratingWithState:&v130 objects:v168 count:16];
          if (v89)
          {
            uint64_t v90 = v89;
            uint64_t v91 = *(void *)v131;
            do
            {
              for (uint64_t k = 0; k != v90; ++k)
              {
                if (*(void *)v131 != v91) {
                  objc_enumerationMutation(v88);
                }
                BOOL v93 = *(void **)(*((void *)&v130 + 1) + 8 * k);
                long long v94 = [v93 gridSizeClass];
                if ([(SBIconListModel *)v129 gridSizeAreaForGridSizeClass:v94 gridCellInfoOptions:a11] >= v87)
                {
                  unint64_t v95 = [(SBIconListModel *)v129 gridCellIndexForIcon:v93 gridCellInfo:v128];
                  long long v96 = [v93 uniqueIdentifier];
                  unint64_t v75 = v75 & 0xFFFFFFFF00000000 | v125;
                  long long v97 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", SBHIconGridRangeRelativeCellIndexForCellIndex(v127, v126, v95, v75));
                  [v83 setObject:v97 forKey:v96];
                }
              }
              uint64_t v90 = [v88 countByEnumeratingWithState:&v130 objects:v168 count:16];
            }
            while (v90);
          }

          id v19 = v108;
          unint64_t v18 = v110;
          id v20 = v107;
          long long v82 = v129;
          unint64_t v84 = v115;
          int v85 = v124;
        }
      }
    }
    else
    {
      id v19 = v108;
      id v83 = v123;
      unint64_t v84 = v115;
    }
    uint64_t v98 = (void *)MEMORY[0x1E4F1CC08];
    if (v83) {
      uint64_t v98 = v83;
    }
    id v99 = v98;
    uint64_t v100 = [v119 array];
    [(SBIconListModel *)v82 layOutIcons:v100 inGridCellInfo:obj startingAtGridCellIndex:SBHIconGridRangeRelativeCellIndexForCellIndex(v127, v126, v84, v125) gridSize:v113 fixedIconLocations:v99 options:a11];
    -[SBIconListModel transferPositionsFromGridCellInfo:representingGridRange:asFixedLocationsForIcons:gridCellInfoOptions:](v82, "transferPositionsFromGridCellInfo:representingGridRange:asFixedLocationsForIcons:gridCellInfoOptions:", obj, v127, v126, v100, a11);

    id v24 = v106;
    id v25 = v112;
    goto LABEL_69;
  }
LABEL_71:
}

void __203__SBIconListModel_shiftFixedIconsInContiguousRegion_forInsertingIcon_orRemovingIcon_orResizingIcon_orMovingIcon_atGridCellIndex_replacingIcon_resizingToGridSizeClass_gridCellInfoOptions_mutationOptions___block_invoke(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 72) <= a2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) iconIndexForGridCellIndex:a2];
    if (v3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v4 = [*(id *)(a1 + 40) iconAtIndex:v3];
      id v5 = (void *)v4;
      if (v4 != *(void *)(a1 + 48) && v4 != *(void *)(a1 + 56))
      {
        uint64_t v6 = (void *)v4;
        [*(id *)(a1 + 64) addObject:v4];
        id v5 = v6;
      }
    }
  }
}

uint64_t __203__SBIconListModel_shiftFixedIconsInContiguousRegion_forInsertingIcon_orRemovingIcon_orResizingIcon_orMovingIcon_atGridCellIndex_replacingIcon_resizingToGridSizeClass_gridCellInfoOptions_mutationOptions___block_invoke_2(uint64_t result, unint64_t a2)
{
  if (*(void *)(result + 40) <= a2)
  {
    uint64_t v2 = result;
    unint64_t v3 = SBHIconGridRangeRelativeCellIndexForCellIndex(*(void *)(result + 48), *(void *)(v2 + 56), a2, *(_DWORD *)(v2 + 80));
    uint64_t result = SBHIconGridRangeContainsCellIndex(*(void *)(v2 + 64), *(void *)(v2 + 72), v3, *(void *)(v2 + 72));
    if (result)
    {
      uint64_t v4 = *(void **)(v2 + 32);
      return [v4 setIconIndex:65534 forGridCellIndex:v3];
    }
  }
  return result;
}

void __203__SBIconListModel_shiftFixedIconsInContiguousRegion_forInsertingIcon_orRemovingIcon_orResizingIcon_orMovingIcon_atGridCellIndex_replacingIcon_resizingToGridSizeClass_gridCellInfoOptions_mutationOptions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(id *)(a1 + 32) != v3 && *(id *)(a1 + 40) != v3)
  {
    id v12 = v3;
    uint64_t v5 = [*(id *)(a1 + 48) fixedLocationForIcon:v3];
    uint64_t v4 = v12;
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v6 = v5;
      char v7 = [*(id *)(a1 + 56) containsGridCellIndex:v5];
      uint64_t v4 = v12;
      if ((v7 & 1) == 0)
      {
        int v8 = SBHIconGridRangeContainsCellIndex(*(void *)(a1 + 72), *(void *)(a1 + 80), v6, *(_DWORD *)(a1 + 104));
        uint64_t v4 = v12;
        if (v8)
        {
          unint64_t v9 = SBHIconGridRangeRelativeCellIndexForCellIndex(*(void *)(a1 + 72), *(void *)(a1 + 80), v6, *(_DWORD *)(a1 + 104));
          uint64_t v10 = SBHIconGridRangeIntersection(v9, [*(id *)(a1 + 48) gridSizeForIcon:v12], *(void *)(a1 + 88), *(void *)(a1 + 96), *(_DWORD *)(a1 + 104));
          objc_msgSend(*(id *)(a1 + 64), "setIconIndex:inGridRange:", 65534, v10, v11);
          uint64_t v4 = v12;
        }
      }
    }
  }
}

- (BOOL)needsToReflowIconsForRemovingIcon:(id)a3 inContiguousRegion:(id)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = [(SBIconListModel *)self gridCellInfoWithOptions:a5];
  if ([(SBIconListModel *)self isContiguousRegionEligibleForBackfill:v11 gridCellInfo:v12])
  {
    if (-[SBIconListModel hasAllFixedIconsInContiguousRegion:gridCellInfo:](self, "hasAllFixedIconsInContiguousRegion:gridCellInfo:", v11, v12)|| (v13 = -[SBIconListModel indexForIcon:](self, "indexForIcon:", v10), uint64_t v14 = [v12 gridCellIndexForIconIndex:v13], v14 == 0x7FFFFFFFFFFFFFFFLL))
    {
      BOOL v15 = 1;
    }
    else
    {
      objc_msgSend(v12, "setIconIndex:inGridRange:", 0x7FFFFFFFFFFFFFFFLL, v14, -[SBIconListModel gridSizeForIcon:](self, "gridSizeForIcon:", v10));
      [v12 setGridCellIndex:0x7FFFFFFFFFFFFFFFLL forIconIndex:v13];
      uint64_t v23 = 0;
      id v24 = &v23;
      uint64_t v25 = 0x2020000000;
      char v26 = 0;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __108__SBIconListModel_needsToReflowIconsForRemovingIcon_inContiguousRegion_gridCellInfoOptions_mutationOptions___block_invoke;
      void v17[3] = &unk_1E6AB20A8;
      id v18 = v10;
      id v19 = v12;
      id v20 = self;
      id v21 = &v23;
      unint64_t v22 = a6;
      [(SBIconListModel *)self enumerateIconsUsingBlock:v17];
      BOOL v15 = *((unsigned char *)v24 + 24) != 0;

      _Block_object_dispose(&v23, 8);
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

void __108__SBIconListModel_needsToReflowIconsForRemovingIcon_inContiguousRegion_gridCellInfoOptions_mutationOptions___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (*(id *)(a1 + 32) != v7)
  {
    id v12 = v7;
    uint64_t v8 = [*(id *)(a1 + 40) gridCellIndexForIconIndex:a3];
    unint64_t v9 = *(void **)(a1 + 48);
    id v10 = [v12 gridSizeClass];
    LODWORD(v8) = [v9 isInsertionRequiredToBeFixedForIcon:v12 ofGridSizeClass:v10 atGridCellIndex:v8 gridCellInfo:*(void *)(a1 + 40) mutationOptions:*(void *)(a1 + 64)];

    BOOL v11 = v8 == [*(id *)(a1 + 48) isIconFixed:v12];
    id v7 = v12;
    if (!v11)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

- (void)relocateAnyAffectedFixedIconsForMovingIcon:(id)a3 fromGridCellIndex:(unint64_t)a4 toGridCellIndex:(unint64_t)a5 intoContiguousRegions:(id)a6 gridCellInfoOptions:(unint64_t)a7 mutationOptions:(unint64_t)a8
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a6;
  if ([(SBIconListModel *)self fixedIconLocationBehavior] == 4)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v21 = v15;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v23;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v16);
          }
          [(SBIconListModel *)self reorderFixedIconsInContiguousRegion:*(void *)(*((void *)&v22 + 1) + 8 * v20++) forMovingIcon:v14 fromGridCellIndex:a4 toGridCellIndex:a5 gridCellInfoOptions:a7 mutationOptions:a8];
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v18);
    }

    id v15 = v21;
  }
  else
  {
    [(SBIconListModel *)self relocateAnyAffectedFixedIconsWithoutContiguousRegionReflowingForMovingIcon:v14 fromGridCellIndex:a4 toGridCellIndex:a5 intoContiguousRegions:v15 gridCellInfoOptions:a7 mutationOptions:a8];
  }
}

- (void)relocateAnyAffectedFixedIconsWithoutContiguousRegionReflowingForMovingIcon:(id)a3 fromGridCellIndex:(unint64_t)a4 toGridCellIndex:(unint64_t)a5 intoContiguousRegions:(id)a6 gridCellInfoOptions:(unint64_t)a7 mutationOptions:(unint64_t)a8
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = [v11 gridSizeClass];
  uint64_t v13 = [(SBIconListModel *)self gridSizeForGridSizeClass:v12 gridCellInfoOptions:a7];
  if (-[SBIconListModel isValidGridRange:options:](self, "isValidGridRange:options:", a5, v13, a7))
  {
    [(SBIconListModel *)self removeFixedIconLocationForIcon:v11];
    v16[0] = v11;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __186__SBIconListModel_relocateAnyAffectedFixedIconsWithoutContiguousRegionReflowingForMovingIcon_fromGridCellIndex_toGridCellIndex_intoContiguousRegions_gridCellInfoOptions_mutationOptions___block_invoke;
    v15[3] = &unk_1E6AB20D0;
    void v15[4] = self;
    void v15[5] = a5;
    v15[6] = v13;
    v15[7] = a7;
    [(SBIconListModel *)self performByExcludingIconsFromLayout:v14 usingBlock:v15];
  }
}

id __186__SBIconListModel_relocateAnyAffectedFixedIconsWithoutContiguousRegionReflowingForMovingIcon_fromGridCellIndex_toGridCellIndex_intoContiguousRegions_gridCellInfoOptions_mutationOptions___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "relocateFixedIconsInGridRange:gridCellInfoOptions:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (void)reorderFixedIconsInContiguousRegion:(id)a3 forMovingIcon:(id)a4 fromGridCellIndex:(unint64_t)a5 toGridCellIndex:(unint64_t)a6 gridCellInfoOptions:(unint64_t)a7 mutationOptions:(unint64_t)a8
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = [(SBIconListModel *)self gridCellInfoWithOptions:a7];
  int v38 = [v15 gridSize];
  id v16 = [v14 gridSizeClass];
  uint64_t v17 = [(SBIconListModel *)self gridSizeForGridSizeClass:v16 gridCellInfoOptions:a7];
  if (-[SBIconListModel isValidGridRange:gridCellInfo:](self, "isValidGridRange:gridCellInfo:", a6, v17, v15))
  {
    uint64_t v18 = -[SBIconListModel iconsForGridRange:gridCellInfo:](self, "iconsForGridRange:gridCellInfo:", a6, v17, v15);
    uint64_t v19 = [v18 count];
    if (!v19 || v19 == 1 && ([v18 containsObject:v14] & 1) != 0) {
      goto LABEL_16;
    }
    if ([v13 containsGridCellIndex:a5]
      && [(SBIconListModel *)self hasFixedIconsInContiguousRegion:v13 gridCellInfo:v15])
    {
      [(SBIconListModel *)self reorderFixedIconsForMovingIcon:v14 withinContiguousRegion:v13 toGridCellIndex:a6 gridCellInfoOptions:a7 mutationOptions:a8];
      goto LABEL_16;
    }
  }
  uint64_t v20 = [v13 gridRange];
  uint64_t v36 = v21;
  unint64_t v37 = v20;
  uint64_t v22 = [v13 startGridCellIndex];
  uint64_t v18 = [(SBIconListModel *)self fixedIconsInContiguousRegion:v13 gridCellInfo:v15];
  if ([v18 count])
  {
    uint64_t v34 = v13;
    long long v23 = [(SBIconListModel *)self iconsInContiguousRegion:v13 gridCellInfo:v15];
    uint64_t v33 = v16;
    uint64_t v32 = v18;
    if (([v23 containsObject:v14] & 1) == 0)
    {
      uint64_t v24 = [v23 arrayByAddingObject:v14];

      long long v23 = (void *)v24;
    }
    long long v25 = -[SBIconListGridCellInfo initWithGridSize:]([SBIconListGridCellInfo alloc], "initWithGridSize:");
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __139__SBIconListModel_reorderFixedIconsInContiguousRegion_forMovingIcon_fromGridCellIndex_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke;
    v39[3] = &unk_1E6AB20F8;
    unint64_t v42 = a6;
    uint64_t v43 = v17;
    int v46 = v38;
    unint64_t v44 = v37;
    uint64_t v45 = v36;
    id v40 = v34;
    char v26 = v25;
    unint64_t v41 = v26;
    [v40 enumerateEmptyGridCellIndexesUsingBlock:v39];
    if (v22 != v37)
    {
      uint64_t v27 = 0;
      do
        [(SBIconListGridCellInfo *)v26 setIconIndex:65534 forGridCellIndex:v27++];
      while (v22 - v37 != v27);
    }
    id v28 = [v14 uniqueIdentifier];
    unint64_t v29 = SBHIconGridRangeRelativeCellIndexForCellIndex(v37, v36, a6, v38);
    unint64_t v47 = v28;
    uint64_t v30 = [NSNumber numberWithUnsignedInteger:v29];
    v48[0] = v30;
    id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];

    [(SBIconListModel *)self layOutIcons:v23 inGridCellInfo:v26 startingAtGridCellIndex:0 gridSize:v36 fixedIconLocations:v31 options:a7];
    -[SBIconListModel transferPositionsFromGridCellInfo:representingGridRange:asLocationsForIcons:gridCellInfoOptions:mutationOptions:](self, "transferPositionsFromGridCellInfo:representingGridRange:asLocationsForIcons:gridCellInfoOptions:mutationOptions:", v26, v37, v36, v23, a7, a8);

    uint64_t v18 = v32;
    id v16 = v33;
    id v13 = v34;
  }
LABEL_16:
}

uint64_t __139__SBIconListModel_reorderFixedIconsInContiguousRegion_forMovingIcon_fromGridCellIndex_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t result = SBHIconGridRangeContainsCellIndex(*(void *)(a1 + 48), *(void *)(a1 + 56), a2, *(_DWORD *)(a1 + 80));
  if ((result & 1) == 0)
  {
    uint64_t result = SBHIconGridRangeRowForCellIndex(*(void *)(a1 + 64), *(void *)(a1 + 72), a2, *(_DWORD *)(a1 + 80));
    if (result != *(unsigned __int16 *)(a1 + 74) - 1)
    {
      uint64_t result = [*(id *)(a1 + 32) isGridCellIndexInternal:a2];
      if ((result & 1) == 0)
      {
        unint64_t v5 = SBHIconGridRangeRelativeCellIndexForCellIndex(*(void *)(a1 + 64), *(void *)(a1 + 72), a2, *(_DWORD *)(a1 + 80));
        unint64_t v6 = *(void **)(a1 + 40);
        return [v6 setIconIndex:65534 forGridCellIndex:v5];
      }
    }
  }
  return result;
}

- (void)reorderFixedIconsForMovingIcon:(id)a3 withinContiguousRegion:(id)a4 toGridCellIndex:(unint64_t)a5 gridCellInfoOptions:(unint64_t)a6 mutationOptions:(unint64_t)a7
{
  id v43 = a3;
  id v12 = a4;
  id v13 = [(SBIconListModel *)self gridCellInfoWithOptions:a6];
  unsigned __int16 v14 = [v13 gridSize];
  uint64_t v15 = [v12 gridRange];
  uint64_t v17 = v16;
  uint64_t v18 = [(SBIconListModel *)self fixedIconsInContiguousRegion:v12 gridCellInfo:v13];
  if ([v18 count])
  {
    unint64_t v41 = v18;
    uint64_t v19 = [(SBIconListModel *)self iconsInContiguousRegion:v12 gridCellInfo:v13];
    unint64_t v42 = a7;
    uint64_t v38 = v17;
    if (([v19 containsObject:v43] & 1) == 0)
    {
      uint64_t v20 = [v19 arrayByAddingObject:v43];

      uint64_t v19 = (void *)v20;
    }
    id v40 = [(SBIconListModel *)self icons];
    unint64_t v21 = [(SBIconListModel *)self indexForIcon:v43];
    uint64_t v39 = [v43 gridSizeClass];
    uint64_t v22 = -[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](self, "gridSizeForGridSizeClass:gridCellInfoOptions:");
    unint64_t v23 = SBHIconGridRangeUnion([v13 gridCellIndexForIconIndex:v21], v22, a5, v22, v14);
    unint64_t v25 = SBHIconGridRangeExtendToGridEdges(v23, v24, 10, v14);
    unint64_t v27 = v26;
    if (([(SBIconListModel *)self iconLayoutBehavior] & 1) == 0)
    {
      SBIconCoordinateMakeWithGridCellIndex(v25, v14);
      if ((v28 & 1) == 0)
      {
        v25 -= v14;
        unint64_t v27 = v27 & 0xFFFFFFFF0000FFFFLL | ((unint64_t)((v27 + 0x10000) >> 16) << 16);
      }
    }
    unint64_t v29 = objc_msgSend(v12, "subcontiguousRegionWithGridRange:", v25, v27);
    uint64_t v30 = [(SBIconListModel *)self gridCellInfoByReflowingIconsInContiguousRegion:v29 forMovingIcon:v43 toGridCellIndex:a5 referenceIconOrder:v40 internalCellValidDirections:12 gridCellInfo:v13 gridCellInfoOptions:a6];
    if ([v30 isLayoutOutOfBounds])
    {
      id v31 = [(SBIconListModel *)self gridCellInfoByReflowingIconsInContiguousRegion:v12 forMovingIcon:v43 toGridCellIndex:a5 referenceIconOrder:v40 internalCellValidDirections:15 gridCellInfo:v13 gridCellInfoOptions:a6];
      uint64_t v32 = self;
      uint64_t v33 = v31;
      uint64_t v35 = v38;
      uint64_t v34 = v15;
      uint64_t v36 = v19;
    }
    else
    {
      id v31 = [(SBIconListModel *)self iconsInContiguousRegion:v29 gridCellInfo:v13];
      uint64_t v34 = [v29 gridRange];
      uint64_t v32 = self;
      uint64_t v33 = v30;
      uint64_t v35 = v37;
      uint64_t v36 = v31;
    }
    -[SBIconListModel transferPositionsFromGridCellInfo:representingGridRange:asLocationsForIcons:gridCellInfoOptions:mutationOptions:](v32, "transferPositionsFromGridCellInfo:representingGridRange:asLocationsForIcons:gridCellInfoOptions:mutationOptions:", v33, v34, v35, v36, a6, v42);

    uint64_t v18 = v41;
  }
}

- (id)gridCellInfoByReflowingIconsInContiguousRegion:(id)a3 forMovingIcon:(id)a4 toGridCellIndex:(unint64_t)a5 referenceIconOrder:(id)a6 internalCellValidDirections:(unint64_t)a7 gridCellInfo:(id)a8 gridCellInfoOptions:(unint64_t)a9
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a8;
  id v15 = a4;
  int v16 = [v14 gridSize];
  uint64_t v17 = [v13 gridRange];
  uint64_t v19 = v18;
  uint64_t v31 = [v13 startGridCellIndex];
  LODWORD(a8) = [(SBIconListModel *)self gridSizeForIcon:v15];
  uint64_t v20 = -[SBIconListGridCellInfo initWithGridSize:]([SBIconListGridCellInfo alloc], "initWithGridSize:");
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __176__SBIconListModel_gridCellInfoByReflowingIconsInContiguousRegion_forMovingIcon_toGridCellIndex_referenceIconOrder_internalCellValidDirections_gridCellInfo_gridCellInfoOptions___block_invoke;
  v43[3] = &unk_1E6AB2120;
  int v47 = (int)a8;
  int v48 = 0;
  int v52 = v16;
  uint64_t v49 = v17;
  uint64_t v50 = v19;
  unint64_t v46 = a5;
  id v44 = v13;
  unint64_t v51 = a7;
  unint64_t v21 = v20;
  uint64_t v45 = v21;
  id v22 = v13;
  [v22 enumerateEmptyGridCellIndexesUsingBlock:v43];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __176__SBIconListModel_gridCellInfoByReflowingIconsInContiguousRegion_forMovingIcon_toGridCellIndex_referenceIconOrder_internalCellValidDirections_gridCellInfo_gridCellInfoOptions___block_invoke_2;
  v34[3] = &unk_1E6AB2058;
  unint64_t v36 = a5;
  int v37 = (int)a8;
  int v38 = 0;
  int v42 = v16;
  uint64_t v39 = v31;
  uint64_t v40 = v17;
  uint64_t v41 = v19;
  unint64_t v23 = v21;
  uint64_t v35 = v23;
  LOWORD(a8) = v16;
  SBHIconGridRangeEnumerateCellIndexes(v17, v19, v16, v34);
  uint64_t v24 = [v15 uniqueIdentifier];

  unint64_t v25 = SBHIconGridRangeRelativeCellIndexForCellIndex(v17, v19, a5, (unsigned __int16)a8);
  int v53 = v24;
  unint64_t v26 = [NSNumber numberWithUnsignedInteger:v25];
  v54[0] = v26;
  unint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:&v53 count:1];

  char v28 = [(SBIconListModel *)self iconsInContiguousRegion:v22 gridCellInfo:v14];

  [(SBIconListModel *)self layOutIcons:v28 inGridCellInfo:v23 startingAtGridCellIndex:0 gridSize:v19 fixedIconLocations:v27 options:a9];
  unint64_t v29 = v23;

  return v29;
}

uint64_t __176__SBIconListModel_gridCellInfoByReflowingIconsInContiguousRegion_forMovingIcon_toGridCellIndex_referenceIconOrder_internalCellValidDirections_gridCellInfo_gridCellInfoOptions___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t result = SBHIconGridRangeContainsCellIndex(*(void *)(a1 + 48), *(void *)(a1 + 56), a2, *(_DWORD *)(a1 + 88));
  if ((result & 1) == 0)
  {
    uint64_t result = SBHIconGridRangeRowForCellIndex(*(void *)(a1 + 64), *(void *)(a1 + 72), a2, *(_DWORD *)(a1 + 88));
    if (result != *(unsigned __int16 *)(a1 + 74) - 1)
    {
      uint64_t result = [*(id *)(a1 + 32) isGridCellIndexInternal:a2 directions:*(void *)(a1 + 80)];
      if ((result & 1) == 0)
      {
        unint64_t v5 = SBHIconGridRangeRelativeCellIndexForCellIndex(*(void *)(a1 + 64), *(void *)(a1 + 72), a2, *(_DWORD *)(a1 + 88));
        unint64_t v6 = *(void **)(a1 + 40);
        return [v6 setIconIndex:65534 forGridCellIndex:v5];
      }
    }
  }
  return result;
}

uint64_t __176__SBIconListModel_gridCellInfoByReflowingIconsInContiguousRegion_forMovingIcon_toGridCellIndex_referenceIconOrder_internalCellValidDirections_gridCellInfo_gridCellInfoOptions___block_invoke_2(uint64_t a1, unint64_t a2, unsigned char *a3)
{
  uint64_t result = SBHIconGridRangeContainsCellIndex(*(void *)(a1 + 40), *(void *)(a1 + 48), a2, *(_DWORD *)(a1 + 80));
  if ((result & 1) == 0)
  {
    if (*(void *)(a1 + 56) <= a2)
    {
      *a3 = 1;
    }
    else
    {
      unint64_t v7 = SBHIconGridRangeRelativeCellIndexForCellIndex(*(void *)(a1 + 64), *(void *)(a1 + 72), a2, *(_DWORD *)(a1 + 80));
      uint64_t v8 = *(void **)(a1 + 32);
      return [v8 setIconIndex:65534 forGridCellIndex:v7];
    }
  }
  return result;
}

- (void)transferPositionsFromGridCellInfo:(id)a3 representingGridRange:(SBHIconGridRange)a4 asFixedLocationsForIcons:(id)a5 gridCellInfoOptions:(unint64_t)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  unint64_t v29 = a6;
  unint64_t v11 = (unint64_t)[(SBIconListModel *)self gridSizeWithOptions:a6];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v36;
    uint64_t v16 = v11;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        unint64_t v19 = objc_msgSend(v9, "gridCellIndexForIconIndex:", -[SBIconListModel indexForIcon:](self, "indexForIcon:", v18));
        if (v19 == 0x7FFFFFFFFFFFFFFFLL
          || (unint64_t v11 = v11 & 0xFFFFFFFF00000000 | v16,
              unint64_t v20 = SBHIconGridRangeCellIndexForRelativeCellIndex(a4.cellIndex, a4.size.columns, v19, v11),
              v20 == 0x7FFFFFFFFFFFFFFFLL))
        {
          [(SBIconListModel *)self removeFixedIconLocationForIcon:v18];
        }
        else
        {
          [(SBIconListModel *)self setFixedLocation:v20 forIcon:v18];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v14);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v21 = v12;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(v21);
        }
        unint64_t v26 = *(void **)(*((void *)&v31 + 1) + 8 * j);
        if (objc_msgSend(v9, "gridCellIndexForIconIndex:", -[SBIconListModel indexForIcon:](self, "indexForIcon:", v26)) == 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v27 = [v26 gridSizeClass];
          unint64_t v28 = -[SBIconListModel firstGridCellIndexOfRangeOfGridSizeClass:withoutFixedIconsNearGridRange:gridCellInfoOptions:](self, "firstGridCellIndexOfRangeOfGridSizeClass:withoutFixedIconsNearGridRange:gridCellInfoOptions:", v27, a4.cellIndex, *(void *)&a4.size.columns, v29);
          if (v28 == 0x7FFFFFFFFFFFFFFFLL) {
            [(SBIconListModel *)self removeFixedIconLocationForIcon:v26];
          }
          else {
            [(SBIconListModel *)self setFixedLocation:v28 forIcon:v26];
          }
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v23);
  }
}

- (void)transferPositionsFromGridCellInfo:(id)a3 representingGridRange:(SBHIconGridRange)a4 asLocationsForIcons:(id)a5 gridCellInfoOptions:(unint64_t)a6 mutationOptions:(unint64_t)a7
{
  uint64_t v10 = *(void *)&a4.size.columns;
  unint64_t cellIndex = a4.cellIndex;
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  obuint64_t j = a5;
  uint64_t v14 = [(SBIconListModel *)self icons];
  uint64_t v15 = (void *)[v14 copy];

  uint64_t v16 = [(SBIconListModel *)self gridCellInfoWithOptions:a6];
  SBHIconGridSize v17 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeWithOptions:a6];
  unint64_t v47 = a7 & 0xFFFFFFFCFCFFFEFFLL | 0x303000000;
  uint64_t v18 = [(SBIconListModel *)self layoutExcludedIcons];
  uint64_t v45 = (void *)[v18 copy];

  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __131__SBIconListModel_transferPositionsFromGridCellInfo_representingGridRange_asLocationsForIcons_gridCellInfoOptions_mutationOptions___block_invoke;
  v70[3] = &unk_1E6AB2148;
  v70[4] = self;
  id v51 = v16;
  id v71 = v51;
  unint64_t v72 = cellIndex;
  uint64_t v73 = v10;
  unint64_t v19 = objc_msgSend(v15, "bs_filter:", v70);
  unint64_t v20 = (void *)[v19 mutableCopy];

  [(SBIconListModel *)self setLayoutExcludedIcons:v20];
  if (SBHIconGridSizeEqualToIconGridSize(v10, *(_DWORD *)&v17)) {
    [(SBIconListModel *)self setIconOrderFromGridCellInfo:v13];
  }
  uint64_t v21 = SBHIconGridRangeIntersection(cellIndex, v10, 0, *(_DWORD *)&v17, v17.columns);
  uint64_t v23 = v22;
  id v24 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  unint64_t v25 = v13;
  id v26 = v24;
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __131__SBIconListModel_transferPositionsFromGridCellInfo_representingGridRange_asLocationsForIcons_gridCellInfoOptions_mutationOptions___block_invoke_2;
  v59[3] = &unk_1E6AB2170;
  uint64_t v65 = v21;
  uint64_t v66 = v23;
  SBHIconGridSize v69 = v17;
  id v60 = v25;
  id v44 = v26;
  id v61 = v44;
  id v27 = v15;
  id v62 = v27;
  id v43 = v20;
  id v63 = v43;
  BOOL v64 = self;
  unint64_t v54 = a6;
  unint64_t v67 = a6;
  unint64_t v68 = v47;
  int v28 = v23;
  id v29 = v60;
  SBHIconGridRangeEnumerateCellIndexes(v21, v28, v17.columns, v59);
  [(SBIconListModel *)self setLayoutExcludedIcons:v45];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obja = obj;
  uint64_t v30 = [obja countByEnumeratingWithState:&v55 objects:v74 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v56;
    unint64_t v46 = self;
    id v49 = v27;
    uint64_t v50 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v56 != v32) {
          objc_enumerationMutation(obja);
        }
        long long v34 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        uint64_t v35 = [v27 indexOfObject:v34];
        if ([v29 gridCellIndexForIconIndex:v35] == 0x7FFFFFFFFFFFFFFFLL)
        {
          long long v36 = [v34 gridSizeClass];
          SBHIconGridSize v37 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeForIcon:v34];
          uint64_t v38 = [v51 gridCellIndexForIconIndex:v35];
          uint64_t v39 = v37;
          unint64_t v40 = -[SBIconListModel firstGridCellIndexOfRangeOfGridSizeClass:withoutFixedIconsNearGridRange:gridCellInfoOptions:](self, "firstGridCellIndexOfRangeOfGridSizeClass:withoutFixedIconsNearGridRange:gridCellInfoOptions:", v36, v38, *(unsigned int *)&v37, v54);
          if (v40 == 0x7FFFFFFFFFFFFFFFLL
            && (unint64_t v48 = v48 & 0xFFFFFFFF00000000 | *(unsigned int *)&v37,
                unint64_t v40 = -[SBIconListModel firstFreeGridCellIndexOfRangeOfSize:gridCellInfoOptions:](self, "firstFreeGridCellIndexOfRangeOfSize:gridCellInfoOptions:"), v40 == 0x7FFFFFFFFFFFFFFFLL))
          {
            [(SBIconIndexMutableList *)self->_icons moveNode:v34 toIndex:[(SBIconIndexMutableList *)self->_icons count]];
          }
          else
          {
            unint64_t v41 = v40;
            self = v46;
            -[SBIconListModel removeFixedIconLocationsForIconsInGridRange:gridCellInfoOptions:](v46, "removeFixedIconLocationsForIconsInGridRange:gridCellInfoOptions:", v40, v39, v54);
            [(SBIconListModel *)v46 removeFixedIconLocationForIcon:v34];
            id v42 = [(SBIconListModel *)v46 moveContainedIcon:v34 toGridCellIndex:v41 gridCellInfoOptions:v54 mutationOptions:v47];
          }
          id v27 = v49;

          uint64_t v32 = v50;
        }
      }
      uint64_t v31 = [obja countByEnumeratingWithState:&v55 objects:v74 count:16];
    }
    while (v31);
  }

  [(SBIconListModel *)self sortByLayoutOrderWithGridCellInfoOptions:v54];
  [(SBIconListModel *)self removeFixedIconLocationsIfPossibleWithGridCellInfoOptions:v54];
}

BOOL __131__SBIconListModel_transferPositionsFromGridCellInfo_representingGridRange_asLocationsForIcons_gridCellInfoOptions_mutationOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  return (unint64_t)objc_msgSend(*(id *)(a1 + 40), "gridCellIndexForIconIndex:", objc_msgSend(*(id *)(a1 + 32), "indexForIcon:", a2)) >= *(void *)(a1 + 48);
}

void __131__SBIconListModel_transferPositionsFromGridCellInfo_representingGridRange_asLocationsForIcons_gridCellInfoOptions_mutationOptions___block_invoke_2(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "iconIndexForGridCellIndex:", SBHIconGridRangeRelativeCellIndexForCellIndex(*(void *)(a1 + 72), *(void *)(a1 + 80), a2, *(_DWORD *)(a1 + 104)));
  if (v4 != 0x7FFFFFFFFFFFFFFFLL && v4 != 65534)
  {
    uint64_t v6 = v4;
    if (([*(id *)(a1 + 40) containsIndex:v4] & 1) == 0)
    {
      [*(id *)(a1 + 40) addIndex:v6];
      id v8 = [*(id *)(a1 + 48) objectAtIndex:v6];
      [*(id *)(a1 + 56) removeObject:v8];
      [*(id *)(a1 + 64) setLayoutExcludedIcons:*(void *)(a1 + 56)];
      objc_msgSend(*(id *)(a1 + 64), "removeFixedIconLocationsForIconsInGridRange:gridCellInfoOptions:", a2, objc_msgSend(*(id *)(a1 + 64), "gridSizeForIcon:", v8), *(void *)(a1 + 88));
      [*(id *)(a1 + 64) removeFixedIconLocationForIcon:v8];
      id v7 = (id)[*(id *)(a1 + 64) moveContainedIcon:v8 toGridCellIndex:a2 gridCellInfoOptions:*(void *)(a1 + 88) mutationOptions:*(void *)(a1 + 96)];
      [*(id *)(a1 + 64) sortByLayoutOrderWithGridCellInfoOptions:*(void *)(a1 + 88)];
    }
  }
}

- (unint64_t)firstGridCellIndexOfRangeOfGridSizeClass:(id)a3 withoutIconsNearGridRange:(SBHIconGridRange)a4 gridCellInfo:(id)a5 passingTest:(id)a6
{
  SBHIconGridSize size = a4.size;
  unint64_t cellIndex = a4.cellIndex;
  id v12 = a3;
  id v13 = a5;
  id v28 = a6;
  unint64_t v25 = v12;
  unint64_t v14 = (unint64_t)[(SBIconListModel *)self gridSizeForGridSizeClass:v12 gridCellInfo:v13];
  unint64_t v15 = WORD1(v14);
  id v24 = v13;
  unsigned int v16 = [v13 gridSize];
  uint64_t v32 = 0;
  long long v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v26 = v14;
  uint64_t v17 = v16;
  uint64_t v18 = -(uint64_t)(unsigned __int16)v14;
  uint64_t v19 = -(uint64_t)v15;
  while (1)
  {
    v29[0] = v27;
    v29[1] = 3221225472;
    void v29[2] = __111__SBIconListModel_firstGridCellIndexOfRangeOfGridSizeClass_withoutIconsNearGridRange_gridCellInfo_passingTest___block_invoke;
    v29[3] = &unk_1E6AB18D8;
    id v20 = v28;
    id v30 = v20;
    uint64_t v31 = &v32;
    unint64_t v6 = v6 & 0xFFFFFFFF00000000 | v26;
    unint64_t v14 = v14 & 0xFFFFFFFF00000000 | v17;
    SBHIconGridRangeEnumerateTouchingRanges(cellIndex, *(_DWORD *)&size, v6, v14, 1, v29);
    if (v33[3] != 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    unint64_t v15 = v15 & 0xFFFFFFFF00000000 | v17;
    unint64_t cellIndex = SBHIconGridRangeInset(cellIndex, *(_DWORD *)&size, v18, v19, v15);
    SBHIconGridSize size = (SBHIconGridSize)v21;
    self = (SBIconListModel *)((unint64_t)self & 0xFFFFFFFF00000000 | v17);
    if (SBHIconGridSizeEqualToIconGridSize(v21, (int)self)) {
      break;
    }
  }
  unint64_t v22 = v33[3];
  _Block_object_dispose(&v32, 8);

  return v22;
}

uint64_t __111__SBIconListModel_firstGridCellIndexOfRangeOfGridSizeClass_withoutIconsNearGridRange_gridCellInfo_passingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    *a4 = 1;
  }
  return result;
}

- (unint64_t)firstGridCellIndexOfRangeOfGridSizeClass:(id)a3 withoutFixedIconsNearGridRange:(SBHIconGridRange)a4 gridCellInfo:(id)a5
{
  uint64_t v5 = *(void *)&a4.size.columns;
  unint64_t cellIndex = a4.cellIndex;
  id v9 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __104__SBIconListModel_firstGridCellIndexOfRangeOfGridSizeClass_withoutFixedIconsNearGridRange_gridCellInfo___block_invoke;
  v13[3] = &unk_1E6AB2198;
  v13[4] = self;
  id v14 = v9;
  id v10 = v9;
  unint64_t v11 = -[SBIconListModel firstGridCellIndexOfRangeOfGridSizeClass:withoutIconsNearGridRange:gridCellInfo:passingTest:](self, "firstGridCellIndexOfRangeOfGridSizeClass:withoutIconsNearGridRange:gridCellInfo:passingTest:", a3, cellIndex, v5, v10, v13);

  return v11;
}

uint64_t __104__SBIconListModel_firstGridCellIndexOfRangeOfGridSizeClass_withoutFixedIconsNearGridRange_gridCellInfo___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "hasFixedIconInGridRange:gridCellInfo:", a2, a3, *(void *)(a1 + 40)) ^ 1;
}

- (unint64_t)firstGridCellIndexOfRangeOfGridSizeClass:(id)a3 withoutIconsNearGridRange:(SBHIconGridRange)a4 gridCellInfo:(id)a5
{
  uint64_t v5 = *(void *)&a4.size.columns;
  unint64_t cellIndex = a4.cellIndex;
  id v9 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __99__SBIconListModel_firstGridCellIndexOfRangeOfGridSizeClass_withoutIconsNearGridRange_gridCellInfo___block_invoke;
  v13[3] = &unk_1E6AB2198;
  v13[4] = self;
  id v14 = v9;
  id v10 = v9;
  unint64_t v11 = -[SBIconListModel firstGridCellIndexOfRangeOfGridSizeClass:withoutIconsNearGridRange:gridCellInfo:passingTest:](self, "firstGridCellIndexOfRangeOfGridSizeClass:withoutIconsNearGridRange:gridCellInfo:passingTest:", a3, cellIndex, v5, v10, v13);

  return v11;
}

uint64_t __99__SBIconListModel_firstGridCellIndexOfRangeOfGridSizeClass_withoutIconsNearGridRange_gridCellInfo___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "hasIconsInGridRange:gridCellInfo:", a2, a3, *(void *)(a1 + 40)) ^ 1;
}

- (unint64_t)firstGridCellIndexOfRangeOfGridSizeClass:(id)a3 withoutFixedIconsNearGridRange:(SBHIconGridRange)a4 gridCellInfoOptions:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a4.size.columns;
  unint64_t cellIndex = a4.cellIndex;
  id v9 = a3;
  id v10 = [(SBIconListModel *)self gridCellInfoWithOptions:a5];
  unint64_t v11 = -[SBIconListModel firstGridCellIndexOfRangeOfGridSizeClass:withoutFixedIconsNearGridRange:gridCellInfo:](self, "firstGridCellIndexOfRangeOfGridSizeClass:withoutFixedIconsNearGridRange:gridCellInfo:", v9, cellIndex, v6, v10);

  return v11;
}

- (unint64_t)firstGridCellIndexOfRangeOfGridSizeClass:(id)a3 withoutFixedIconsNearContiguousRegion:(id)a4 gridCellInfo:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  unint64_t v10 = -[SBIconListModel firstGridCellIndexOfRangeOfGridSizeClass:withoutFixedIconsNearGridRange:gridCellInfo:](self, "firstGridCellIndexOfRangeOfGridSizeClass:withoutFixedIconsNearGridRange:gridCellInfo:", v9, [a4 endGridCellIndex], 65537, v8);

  return v10;
}

- (unint64_t)firstGridCellIndexOfRangeOfGridSizeClass:(id)a3 withoutFixedIconsNearContiguousRegion:(id)a4 gridCellInfoOptions:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  unint64_t v10 = [(SBIconListModel *)self gridCellInfoWithOptions:a5];
  unint64_t v11 = [(SBIconListModel *)self firstGridCellIndexOfRangeOfGridSizeClass:v9 withoutFixedIconsNearContiguousRegion:v8 gridCellInfo:v10];

  return v11;
}

- (id)contiguousRegionForGridCellIndex:(unint64_t)a3 gridCellInfoOptions:(unint64_t)a4
{
  uint64_t v5 = [(SBIconListModel *)self gridCellInfoWithOptions:a4];
  uint64_t v6 = [v5 contiguousRegionForGridCellIndex:a3];

  return v6;
}

- (id)contiguousRegionForGridCellIndex:(unint64_t)a3 gridCellInfo:(id)a4
{
  return (id)[a4 contiguousRegionForGridCellIndex:a3];
}

- (id)contiguousRegionsForGridRange:(SBHIconGridRange)a3 gridCellInfo:(id)a4
{
  return (id)objc_msgSend(a4, "contiguousRegionsForGridRange:", a3.cellIndex, *(void *)&a3.size.columns);
}

- (unint64_t)firstGridCellIndexOfNaturalGapInRange:(_NSRange)a3 gridCellInfo:(id)a4
{
  NSUInteger length = a3.length;
  locatiouint64_t n = a3.location;
  id v9 = a4;
  unint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
  if (([(SBIconListModel *)self iconLayoutBehavior] & 1) == 0)
  {
    unsigned int v10 = [v9 gridSize];
    id v28 = self;
    unsigned __int16 v11 = v10;
    uint64_t v12 = v10;
    uint64_t Area = SBHIconGridSizeGetArea(v10);
    uint64_t v30 = v11;
    unint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      unint64_t v4 = v4 & 0xFFFFFFFF00000000 | 0x10001;
      unint64_t v14 = objc_msgSend(v9, "indexOfFirstEmptyGridCellRangeOfSize:inGridCellIndexRange:", v4, location, length);
      if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      unint64_t v15 = v14;
      NSUInteger v16 = v14 + 1;
      if (v14)
      {
        unint64_t v5 = v5 & 0xFFFFFFFF00000000 | v12;
        unint64_t v17 = SBIconCoordinateMakeWithGridCellIndex(v14, v5);
        int v18 = 3;
        if (v17 != 1 && v17 != v30)
        {
          uint64_t v19 = [v9 iconIndexForGridCellIndex:v15 - 1];
          if (v19 != 0x7FFFFFFFFFFFFFFFLL)
          {
            id v20 = [(SBIconListModel *)v28 iconAtIndex:v19];
            if ([(SBIconListModel *)v28 isIconFixed:v20])
            {
              int v18 = 3;
            }
            else
            {
              uint64_t v26 = [v20 gridSizeClass];
              unint64_t v27 = v27 & 0xFFFFFFFF00000000 | 0x10001;
              if (SBHIconGridSizeEqualToIconGridSize(-[SBIconListModel gridSizeForGridSizeClass:](v28, "gridSizeForGridSizeClass:"), 65537)&& (uint64_t v21 = [v9 iconIndexForGridCellIndex:v16], v21 != 0x7FFFFFFFFFFFFFFFLL))
              {
                unint64_t v25 = [(SBIconListModel *)v28 iconAtIndex:v21];
                BOOL v22 = [(SBIconListModel *)v28 isIconFixed:v25];
                unint64_t v23 = v29;
                if (!v22) {
                  unint64_t v23 = v15;
                }
                unint64_t v29 = v23;
                if (v22) {
                  int v18 = 3;
                }
                else {
                  int v18 = 2;
                }
              }
              else
              {
                int v18 = 3;
              }
            }
          }
        }
        locatiouint64_t n = v16;
      }
      else
      {
        int v18 = 3;
        locatiouint64_t n = 1;
      }
      NSUInteger length = Area - v16;
    }
    while (v18 != 2);
  }

  return v29;
}

- (id)iconsByReplacingIconsNearNaturalGapWithPlaceholder:(id)a3 referenceIconOrder:(id *)a4 gridCellInfo:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  unint64_t v9 = [(SBIconListModel *)self allowedGridSizeClasses];
  unsigned int v10 = [(SBIconListModel *)self iconGridSizeClassSizes];
  unint64_t v27 = [v10 bestGridSizeClassForGridSize:65538 allowedGridSizeClasses:v9];
  if (v27)
  {
    unint64_t v23 = v10;
    unint64_t v24 = v9;
    SBHIconGridSize v11 = (SBHIconGridSize)[(SBIconListModel *)self gridSize];
    uint64_t v12 = v11;
    unint64_t v13 = -[SBIconListModel firstGridCellIndexOfNaturalGapInRange:gridCellInfo:](self, "firstGridCellIndexOfNaturalGapInRange:gridCellInfo:", 0, SBHIconGridSizeGetArea(*(_DWORD *)&v11), v8);
    unint64_t v14 = 0;
    unint64_t v15 = 0;
    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v16 = v13;
      unint64_t v15 = 0;
      unint64_t v14 = 0;
      id v25 = v7;
      do
      {
        unint64_t v17 = -[SBIconListModel iconAtIndex:](self, "iconAtIndex:", [v8 iconIndexForGridCellIndex:v16 - 1]);
        int v18 = +[SBPlaceholderIcon placeholderForIcon:v17];
        [v18 setGridSizeClass:v27];
        if (!v15)
        {
          unint64_t v15 = (void *)[v7 mutableCopy];
          if (a4) {
            uint64_t v19 = [*a4 mutableCopy];
          }
          else {
            uint64_t v19 = 0;
          }

          unint64_t v14 = (void *)v19;
          id v7 = v25;
        }
        objc_msgSend(v15, "replaceObjectAtIndex:withObject:", objc_msgSend(v15, "indexOfObjectIdenticalTo:", v17), v18);
        objc_msgSend(v14, "replaceObjectAtIndex:withObject:", objc_msgSend(v14, "indexOfObjectIdenticalTo:", v17), v18);
        unint64_t v9 = v9 & 0xFFFFFFFF00000000 | v12;
        unint64_t v16 = -[SBIconListModel firstGridCellIndexOfNaturalGapInRange:gridCellInfo:](self, "firstGridCellIndexOfNaturalGapInRange:gridCellInfo:", v16 + 1, SBHIconGridSizeGetArea(v9) - (v16 + 1), v8);
      }
      while (v16 != 0x7FFFFFFFFFFFFFFFLL);
    }
    if (v15) {
      id v20 = v15;
    }
    else {
      id v20 = v7;
    }
    id v21 = v20;
    if (a4) {
      *a4 = v14;
    }

    unsigned int v10 = v23;
    unint64_t v9 = v24;
  }
  else
  {
    id v21 = v7;
  }

  return v21;
}

- (SBHIconGridSize)gridSizeWithOptions:(unint64_t)a3
{
  SBHIconGridSize v5 = (SBHIconGridSize)[(SBIconListModel *)self gridSize];
  if ([(SBIconListModel *)self wantsRotatedGridForOptions:a3]
    && [(SBIconListModel *)self allowsRotatedLayout])
  {
    return (SBHIconGridSize)SBHIconGridSizeRotate(*(_DWORD *)&v5);
  }
  else
  {
    return v5;
  }
}

- (SBHIconGridSize)rotatedGridSizeWithOptions:(unint64_t)a3
{
  SBHIconGridSize v5 = (SBHIconGridSize)[(SBIconListModel *)self gridSize];
  if ([(SBIconListModel *)self wantsRotatedGridForOptions:a3]
    || ![(SBIconListModel *)self allowsRotatedLayout])
  {
    return v5;
  }
  else
  {
    return (SBHIconGridSize)SBHIconGridSizeRotate(*(_DWORD *)&v5);
  }
}

- (unint64_t)rotatedGridCellInfoOptions:(unint64_t)a3
{
  if (-[SBIconListModel wantsRotatedGridForOptions:](self, "wantsRotatedGridForOptions:")
    || ![(SBIconListModel *)self allowsRotatedLayout])
  {
    return a3 & 0xFFFFFFFFFFFFFFFDLL;
  }
  else
  {
    return a3 | 2;
  }
}

- (id)gridCellInfoWithOptions:(unint64_t)a3
{
  uint64_t v5 = -[SBIconListModel gridSizeWithOptions:](self, "gridSizeWithOptions:");
  return [(SBIconListModel *)self gridCellInfoForGridSize:v5 options:a3];
}

- (id)gridCellInfoExcludingIcons:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(SBIconListModel *)self icons];
  id v8 = [(SBIconListModel *)self fixedIconLocationsWithGridCellInfoOptions:a4];
  unint64_t v9 = [(SBIconListModel *)self gridSizeClassSizesWithOptions:a4];
  SBHIconGridSize v10 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeWithOptions:a4];
  unint64_t v11 = [(SBIconListModel *)self iconLayoutBehavior];
  uint64_t v12 = [(SBIconListModel *)self iconsForLayoutWithGridCellInfoOptions:a4];
  unint64_t v13 = (void *)[v12 mutableCopy];

  [v13 removeObjectsInArray:v6];
  unint64_t v14 = [(id)objc_opt_class() iconGridCellInfoForIcons:v13 gridSize:*(unsigned int *)&v10 gridSizeClassSizes:v9 iconLayoutBehavior:v11 referenceIconOrder:v7 fixedIconLocations:v8 options:a4];

  return v14;
}

- (id)gridCellInfoForIcons:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(SBIconListModel *)self icons];
  id v8 = [(SBIconListModel *)self fixedIconLocationsWithGridCellInfoOptions:a4];
  unint64_t v9 = [(SBIconListModel *)self gridSizeClassSizesWithOptions:a4];
  SBHIconGridSize v10 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeWithOptions:a4];
  unint64_t v11 = [(SBIconListModel *)self iconLayoutBehavior];
  uint64_t v12 = [(SBIconListModel *)self filterIconsForLayout:v6];

  unint64_t v13 = [(id)objc_opt_class() iconGridCellInfoForIcons:v12 gridSize:*(unsigned int *)&v10 gridSizeClassSizes:v9 iconLayoutBehavior:v11 referenceIconOrder:v7 fixedIconLocations:v8 options:a4];

  return v13;
}

- (id)gridCellInfoForIcons:(id)a3 gridSize:(SBHIconGridSize)a4 options:(unint64_t)a5
{
  id v8 = a3;
  unint64_t v9 = [(SBIconListModel *)self icons];
  SBHIconGridSize v10 = [(SBIconListModel *)self fixedIconLocationsWithGridCellInfoOptions:a5];
  unint64_t v11 = [(SBIconListModel *)self gridSizeClassSizesWithOptions:a5];
  unint64_t v12 = [(SBIconListModel *)self iconLayoutBehavior];
  unint64_t v13 = [(SBIconListModel *)self filterIconsForLayout:v8];

  unint64_t v14 = [(id)objc_opt_class() iconGridCellInfoForIcons:v13 gridSize:*(unsigned int *)&a4 gridSizeClassSizes:v11 iconLayoutBehavior:v12 referenceIconOrder:v9 fixedIconLocations:v10 options:a5];

  return v14;
}

- (id)gridCellInfoForIcons:(id)a3 referenceIconOrder:(id)a4 options:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  SBHIconGridSize v10 = [(SBIconListModel *)self fixedIconLocationsWithGridCellInfoOptions:a5];
  unint64_t v11 = [(SBIconListModel *)self gridSizeClassSizesWithOptions:a5];
  SBHIconGridSize v12 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeWithOptions:a5];
  unint64_t v13 = [(SBIconListModel *)self iconLayoutBehavior];
  unint64_t v14 = [(SBIconListModel *)self filterIconsForLayout:v9];

  unint64_t v15 = [(id)objc_opt_class() iconGridCellInfoForIcons:v14 gridSize:*(unsigned int *)&v12 gridSizeClassSizes:v11 iconLayoutBehavior:v13 referenceIconOrder:v8 fixedIconLocations:v10 options:a5];

  return v15;
}

- (id)gridCellInfoForIcons:(id)a3 gridSize:(SBHIconGridSize)a4 referenceIconOrder:(id)a5 options:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a3;
  SBHIconGridSize v12 = [(SBIconListModel *)self fixedIconLocationsWithGridCellInfoOptions:a6];
  unint64_t v13 = [(SBIconListModel *)self gridSizeClassSizesWithOptions:a6];
  unint64_t v14 = [(SBIconListModel *)self iconLayoutBehavior];
  unint64_t v15 = [(SBIconListModel *)self filterIconsForLayout:v11];

  unint64_t v16 = [(id)objc_opt_class() iconGridCellInfoForIcons:v15 gridSize:*(unsigned int *)&a4 gridSizeClassSizes:v13 iconLayoutBehavior:v14 referenceIconOrder:v10 fixedIconLocations:v12 options:a6];

  return v16;
}

- (id)gridCellInfoForIcons:(id)a3 gridSize:(SBHIconGridSize)a4 referenceIconOrder:(id)a5 fixedIconLocations:(id)a6 options:(unint64_t)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  unint64_t v15 = [(SBIconListModel *)self gridSizeClassSizesWithOptions:a7];
  unint64_t v16 = [(SBIconListModel *)self iconLayoutBehavior];
  unint64_t v17 = [(SBIconListModel *)self filterIconsForLayout:v14];

  int v18 = [(id)objc_opt_class() iconGridCellInfoForIcons:v17 gridSize:*(unsigned int *)&a4 gridSizeClassSizes:v15 iconLayoutBehavior:v16 referenceIconOrder:v13 fixedIconLocations:v12 options:a7];

  return v18;
}

- (void)layOutIcons:(id)a3 atIndexes:(id)a4 inGridCellInfo:(id)a5 startingAtGridCellIndex:(unint64_t)a6 gridSize:(SBHIconGridSize)a7 fixedIconLocations:(id)a8 options:(unint64_t)a9
{
  id v14 = a8;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  int v18 = [(SBIconListModel *)self icons];
  uint64_t v19 = [(SBIconListModel *)self gridSizeClassSizesWithOptions:a9];
  unint64_t v20 = [(SBIconListModel *)self iconLayoutBehavior];
  id v22 = [(SBIconListModel *)self filterIconsForLayout:v17];

  [(id)objc_opt_class() layOutIcons:v22 atIndexes:v16 inGridCellInfo:v15 startingAtGridCellIndex:a6 gridSize:*(unsigned int *)&a7 gridSizeClassSizes:v19 iconLayoutBehavior:v20 referenceIconOrder:v18 fixedIconLocations:v14 options:a9];
}

- (void)layOutIcons:(id)a3 inGridCellInfo:(id)a4 startingAtGridCellIndex:(unint64_t)a5 gridSize:(SBHIconGridSize)a6 fixedIconLocations:(id)a7 options:(unint64_t)a8
{
  id v14 = a7;
  id v15 = a4;
  id v16 = a3;
  id v17 = [(SBIconListModel *)self icons];
  int v18 = [(SBIconListModel *)self iconGridSizeClassSizes];
  unint64_t v19 = [(SBIconListModel *)self iconLayoutBehavior];
  id v22 = [(SBIconListModel *)self filterIconsForLayout:v16];

  uint64_t v20 = [v22 count];
  id v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, v20);
  [(id)objc_opt_class() layOutIcons:v22 atIndexes:v21 inGridCellInfo:v15 startingAtGridCellIndex:a5 gridSize:*(unsigned int *)&a6 gridSizeClassSizes:v18 iconLayoutBehavior:v19 referenceIconOrder:v17 fixedIconLocations:v14 options:a8];
}

- (void)layOutIcons:(id)a3 inGridCellInfo:(id)a4 startingAtGridCellIndex:(unint64_t)a5 gridSize:(SBHIconGridSize)a6 referenceIconOrder:(id)a7 fixedIconLocations:(id)a8 options:(unint64_t)a9
{
  id v15 = a8;
  id v16 = a7;
  id v17 = a4;
  id v18 = a3;
  id v22 = [(SBIconListModel *)self iconGridSizeClassSizes];
  unint64_t v19 = [(SBIconListModel *)self iconLayoutBehavior];
  uint64_t v20 = [v18 count];
  id v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, v20);
  [(id)objc_opt_class() layOutIcons:v18 atIndexes:v21 inGridCellInfo:v17 startingAtGridCellIndex:a5 gridSize:*(unsigned int *)&a6 gridSizeClassSizes:v22 iconLayoutBehavior:v19 referenceIconOrder:v16 fixedIconLocations:v15 options:a9];
}

uint64_t __173__SBIconListModel_layOutIcons_atIndexes_inGridCellInfo_startingAtGridCellIndex_gridSize_gridSizeClassSizes_iconLayoutBehavior_referenceIconOrder_fixedIconLocations_options___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3, unsigned char *a4)
{
  unint64_t v7 = SBIconCoordinateMakeWithGridCellIndex(a2, *(_DWORD *)(a1 + 48));
  uint64_t result = _SBIconListIsCoordinateValidForGridSize(v7, v8, *(_DWORD *)(a1 + 52), *(_DWORD *)(a1 + 48), *(void *)(a1 + 40));
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
    *a4 = 1;
  }
  return result;
}

- (void)layOutIconsPrioritizedByGridArea:(id)a3 inGridCellInfo:(id)a4 gridSize:(SBHIconGridSize)a5 referenceIconOrder:(id)a6 referenceGridCellInfo:(id)a7 fixedIconLocations:(id)a8 options:(unint64_t)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v38 = a7;
  id v17 = a8;
  id v18 = [(SBIconListModel *)self iconGridSizeClassSizes];
  unint64_t v19 = [(SBIconListModel *)self iconLayoutBehavior];
  id v43 = objc_msgSend(v14, "bs_map:", &__block_literal_global_115);
  id v42 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v43];
  uint64_t v20 = [v42 allObjects];
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __144__SBIconListModel_layOutIconsPrioritizedByGridArea_inGridCellInfo_gridSize_referenceIconOrder_referenceGridCellInfo_fixedIconLocations_options___block_invoke_2;
  v61[3] = &unk_1E6AAFC20;
  id v21 = v18;
  id v62 = v21;
  unint64_t v41 = [v20 sortedArrayUsingComparator:v61];

  id v22 = [v17 allKeys];
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __144__SBIconListModel_layOutIconsPrioritizedByGridArea_inGridCellInfo_gridSize_referenceIconOrder_referenceGridCellInfo_fixedIconLocations_options___block_invoke_3;
  v59[3] = &unk_1E6AB0858;
  id v23 = v14;
  id v60 = v23;
  unint64_t v40 = v22;
  unint64_t v24 = objc_msgSend(v22, "bs_compactMap:", v59);
  uint64_t v25 = [v24 count];
  unint64_t v26 = 0x1E4F28000uLL;
  if (v25)
  {
    unint64_t v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, v25);
    uint64_t v37 = a5;
    objc_msgSend((id)objc_opt_class(), "layOutIcons:atIndexes:inGridCellInfo:startingAtGridCellIndex:gridSize:gridSizeClassSizes:iconLayoutBehavior:referenceIconOrder:fixedIconLocations:options:", v24, v27, v15, 0, v19, v16, v17, a9);

    unint64_t v26 = 0x1E4F28000;
  }
  else
  {
    uint64_t v37 = a5;
  }
  id v28 = (void *)[objc_alloc(*(Class *)(v26 + 3424)) initWithIndex:0];
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __144__SBIconListModel_layOutIconsPrioritizedByGridArea_inGridCellInfo_gridSize_referenceIconOrder_referenceGridCellInfo_fixedIconLocations_options___block_invoke_5;
  v46[3] = &unk_1E6AB21E8;
  id v47 = v29;
  unint64_t v48 = self;
  SBHIconGridSize v58 = a5;
  id v49 = v15;
  id v50 = v21;
  id v51 = v16;
  id v52 = v17;
  unint64_t v56 = v19;
  unint64_t v57 = a9;
  id v53 = v23;
  id v54 = v38;
  id v55 = v28;
  id v36 = v28;
  id v45 = v38;
  id v39 = v23;
  id v30 = v17;
  id v31 = v16;
  id v32 = v21;
  id v33 = v15;
  id v34 = v29;
  [v41 enumerateObjectsWithOptions:2 usingBlock:v46];
  uint64_t v35 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, objc_msgSend(v34, "count"));
  [(id)objc_opt_class() layOutIcons:v34 atIndexes:v35 inGridCellInfo:v33 startingAtGridCellIndex:0 gridSize:v37 gridSizeClassSizes:v32 iconLayoutBehavior:v19 referenceIconOrder:v31 fixedIconLocations:v30 options:a9];
}

uint64_t __144__SBIconListModel_layOutIconsPrioritizedByGridArea_inGridCellInfo_gridSize_referenceIconOrder_referenceGridCellInfo_fixedIconLocations_options___block_invoke(uint64_t a1, void *a2)
{
  return [a2 gridSizeClass];
}

uint64_t __144__SBIconListModel_layOutIconsPrioritizedByGridArea_inGridCellInfo_gridSize_referenceIconOrder_referenceGridCellInfo_fixedIconLocations_options___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  unsigned int v7 = [v5 gridSizeAreaForGridSizeClass:a2];
  unsigned int v8 = [*(id *)(a1 + 32) gridSizeAreaForGridSizeClass:v6];

  return MEMORY[0x1F410C1A8](v7, v8);
}

id __144__SBIconListModel_layOutIconsPrioritizedByGridArea_inGridCellInfo_gridSize_referenceIconOrder_referenceGridCellInfo_fixedIconLocations_options___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __144__SBIconListModel_layOutIconsPrioritizedByGridArea_inGridCellInfo_gridSize_referenceIconOrder_referenceGridCellInfo_fixedIconLocations_options___block_invoke_4;
  v9[3] = &unk_1E6AAF238;
  id v5 = v3;
  id v10 = v5;
  uint64_t v6 = [v4 indexOfObjectPassingTest:v9];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned int v7 = 0;
  }
  else
  {
    unsigned int v7 = [*(id *)(a1 + 32) objectAtIndex:v6];
  }

  return v7;
}

uint64_t __144__SBIconListModel_layOutIconsPrioritizedByGridArea_inGridCellInfo_gridSize_referenceIconOrder_referenceGridCellInfo_fixedIconLocations_options___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __144__SBIconListModel_layOutIconsPrioritizedByGridArea_inGridCellInfo_gridSize_referenceIconOrder_referenceGridCellInfo_fixedIconLocations_options___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  uint64_t v23 = a3;
  if (!a3)
  {
    unsigned int v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, objc_msgSend(*(id *)(a1 + 32), "count"));
    [(id)objc_opt_class() layOutIcons:*(void *)(a1 + 32) atIndexes:v7 inGridCellInfo:*(void *)(a1 + 48) startingAtGridCellIndex:0 gridSize:*(unsigned int *)(a1 + 120) gridSizeClassSizes:*(void *)(a1 + 56) iconLayoutBehavior:*(void *)(a1 + 104) referenceIconOrder:*(void *)(a1 + 64) fixedIconLocations:*(void *)(a1 + 72) options:*(void *)(a1 + 112)];
    [*(id *)(a1 + 32) removeAllObjects];
  }
  unsigned int v8 = [*(id *)(a1 + 56) gridSizeForGridSizeClass:v6];
  id v9 = *(void **)(a1 + 80);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __144__SBIconListModel_layOutIconsPrioritizedByGridArea_inGridCellInfo_gridSize_referenceIconOrder_referenceGridCellInfo_fixedIconLocations_options___block_invoke_6;
  v28[3] = &unk_1E6AADB28;
  id v22 = v6;
  id v29 = v22;
  id v10 = objc_msgSend(v9, "bs_filter:", v28);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v31 count:16];
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
        id v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v16 = *(void **)(a1 + 72);
        id v17 = [v15 uniqueIdentifier];
        id v18 = [v16 objectForKey:v17];

        if (!v18)
        {
          if (v23)
          {
            uint64_t v19 = objc_msgSend(*(id *)(a1 + 88), "gridCellIndexForIconIndex:", objc_msgSend(*(id *)(a1 + 64), "indexOfObjectIdenticalTo:", v15));
            if (objc_msgSend(*(id *)(a1 + 48), "numberOfUsedGridCellsInGridRange:", v19, v8))
            {
              [*(id *)(a1 + 32) addObject:v15];
              continue;
            }
          }
          else
          {
            uint64_t v19 = 0;
          }
          uint64_t v20 = objc_opt_class();
          id v30 = v15;
          id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
          unint64_t v3 = v3 & 0xFFFFFFFF00000000 | *(unsigned int *)(a1 + 120);
          [v20 layOutIcons:v21 atIndexes:*(void *)(a1 + 96) inGridCellInfo:*(void *)(a1 + 48) startingAtGridCellIndex:v19 gridSize:v3 gridSizeClassSizes:*(void *)(a1 + 56) iconLayoutBehavior:*(void *)(a1 + 104) referenceIconOrder:*(void *)(a1 + 64) fixedIconLocations:*(void *)(a1 + 72) options:*(void *)(a1 + 112)];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v31 count:16];
    }
    while (v12);
  }
}

uint64_t __144__SBIconListModel_layOutIconsPrioritizedByGridArea_inGridCellInfo_gridSize_referenceIconOrder_referenceGridCellInfo_fixedIconLocations_options___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 gridSizeClass];
  if (v4 == *(void **)(a1 + 32))
  {
    uint64_t v6 = 1;
  }
  else
  {
    id v5 = [v3 gridSizeClass];
    uint64_t v6 = [v5 isEqualToString:*(void *)(a1 + 32)];
  }
  return v6;
}

- (void)setLayoutExcludedIcons:(id)a3
{
  id v7 = a3;
  if ((BSEqualArrays() & 1) == 0)
  {
    uint64_t v4 = (NSArray *)[v7 copy];
    layoutExcludedIcons = self->_layoutExcludedIcons;
    self->_layoutExcludedIcons = v4;

    uint64_t v6 = [(SBIconListModel *)self _rotatedIconListModelIfApplicable];
    [v6 setLayoutExcludedIcons:v7];
  }
}

- (void)performByExcludingIconsFromLayout:(id)a3 usingBlock:(id)a4
{
  id v11 = a3;
  uint64_t v6 = (void (**)(void))a4;
  id v7 = [(SBIconListModel *)self layoutExcludedIcons];
  unsigned int v8 = v7;
  if (v7)
  {
    id v9 = [v7 arrayByAddingObjectsFromArray:v11];
  }
  else
  {
    id v9 = v11;
  }
  id v10 = v9;
  [(SBIconListModel *)self setLayoutExcludedIcons:v9];
  v6[2](v6);

  [(SBIconListModel *)self setLayoutExcludedIcons:v8];
}

- (BOOL)getIconGridRange:(SBHIconGridRange *)a3 forGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5
{
  unint64_t v6 = [a5 gridRangeForGridCellIndex:a4];
  if (a3 && v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    a3->unint64_t cellIndex = v6;
    *(void *)&a3->size.uint64_t columns = v7;
  }
  return v6 != 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)gridCellIndexBelowIconAtIndex:(unint64_t)a3 gridCellInfo:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 gridCellIndexForIconIndex:a3];
  unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = v6;
    int v9 = [v5 gridSize];
    uint64_t v10 = [v5 gridRangeForGridCellIndex:v8];
    unint64_t v7 = SBHIconGridRangeCellIndexBelowColumn(v10, v11, v9, 0);
  }

  return v7;
}

- (unint64_t)gridCellIndexBelowIconAtIndex:(unint64_t)a3 options:(unint64_t)a4
{
  uint64_t v6 = [(SBIconListModel *)self gridCellInfoWithOptions:a4];
  unint64_t v7 = [(SBIconListModel *)self gridCellIndexBelowIconAtIndex:a3 gridCellInfo:v6];

  return v7;
}

- (unint64_t)gridCellIndexAboveIconAtIndex:(unint64_t)a3 gridCellInfo:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 gridCellIndexForIconIndex:a3];
  unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = v6;
    unsigned __int16 v9 = [v5 gridSize];
    unint64_t v10 = [v5 gridRangeForGridCellIndex:v8];
    unint64_t v7 = SBHIconGridRangeCellIndexAboveColumn(v10, v11, v9, 0);
  }

  return v7;
}

- (unint64_t)gridCellIndexAboveIconAtIndex:(unint64_t)a3 options:(unint64_t)a4
{
  uint64_t v6 = [(SBIconListModel *)self gridCellInfoWithOptions:a4];
  unint64_t v7 = [(SBIconListModel *)self gridCellIndexAboveIconAtIndex:a3 gridCellInfo:v6];

  return v7;
}

- (SBIconCoordinate)coordinateForGridCellIndex:(unint64_t)a3 gridCellInfoOptions:(unint64_t)a4
{
  unsigned __int16 v5 = (unsigned __int16)[(SBIconListModel *)self gridSizeWithOptions:a4];
  unint64_t v6 = SBIconCoordinateMakeWithGridCellIndex(a3, v5);
  result.int64_t row = v7;
  result.columuint64_t n = v6;
  return result;
}

- (SBIconCoordinate)coordinateForGridCellIndex:(unint64_t)a3 gridCellInfo:(id)a4
{
  int64_t v4 = [a4 coordinateForGridCellIndex:a3];
  result.int64_t row = v5;
  result.columuint64_t n = v4;
  return result;
}

- (SBIconCoordinate)coordinateForIcon:(id)a3 gridCellInfo:(id)a4
{
  id v6 = a4;
  uint64_t v7 = objc_msgSend(v6, "coordinateForGridCellIndex:", -[SBIconListModel gridCellIndexForIcon:gridCellInfo:](self, "gridCellIndexForIcon:gridCellInfo:", a3, v6));
  int64_t v9 = v8;

  int64_t v10 = v7;
  int64_t v11 = v9;
  result.int64_t row = v11;
  result.columuint64_t n = v10;
  return result;
}

- (unint64_t)gridCellIndexForCoordinate:(SBIconCoordinate)a3 gridCellInfoOptions:(unint64_t)a4
{
  int64_t row = a3.row;
  columuint64_t n = a3.column;
  unsigned __int16 v6 = (unsigned __int16)[(SBIconListModel *)self gridSizeWithOptions:a4];
  return SBIconCoordinateGetGridCellIndex(column, row, v6);
}

- (unint64_t)gridCellIndexForCoordinate:(SBIconCoordinate)a3 gridCellInfo:(id)a4
{
  return objc_msgSend(a4, "gridCellIndexForCoordinate:", a3.column, a3.row);
}

- (id)iconAtGridCellIndex:(unint64_t)a3 gridCellInfoOptions:(unint64_t)a4
{
  unsigned __int16 v6 = [(SBIconListModel *)self gridCellInfoWithOptions:a4];
  uint64_t v7 = [(SBIconListModel *)self iconAtGridCellIndex:a3 gridCellInfo:v6];

  return v7;
}

- (id)iconAtGridCellIndex:(unint64_t)a3 gridCellInfo:(id)a4
{
  uint64_t v5 = [a4 iconIndexForGridCellIndex:a3];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int16 v6 = 0;
  }
  else
  {
    unsigned __int16 v6 = [(SBIconListModel *)self iconAtIndex:v5];
  }
  return v6;
}

- (SBHIconGridRange)gridRangeForIcon:(id)a3 gridCellInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int64_t v8 = [v7 gridSizeClass];
  SBHIconGridSize v9 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeForGridSizeClass:v8 gridCellInfo:v6];
  unint64_t v10 = [(SBIconListModel *)self gridCellIndexForIcon:v7 gridCellInfo:v6];

  unint64_t v11 = v10;
  uint64_t v12 = v9;
  result.SBHIconGridSize size = (SBHIconGridSize)v12;
  result.unint64_t cellIndex = v11;
  return result;
}

- (SBHIconGridRange)gridRangeForIcon:(id)a3 gridCellInfoOptions:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(SBIconListModel *)self gridCellInfoWithOptions:a4];
  uint64_t v8 = [(SBIconListModel *)self gridRangeForIcon:v6 gridCellInfo:v7];
  uint64_t v10 = v9;

  unint64_t v11 = v8;
  uint64_t v12 = v10;
  result.SBHIconGridSize size = (SBHIconGridSize)v12;
  result.unint64_t cellIndex = v11;
  return result;
}

- (id)iconsForGridRange:(SBHIconGridRange)a3 gridCellInfo:(id)a4
{
  int size = (int)a3.size;
  unint64_t cellIndex = a3.cellIndex;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA70] orderedSetWithCapacity:SBHIconGridSizeGetArea(size)];
  __int16 v9 = [v7 gridSize];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__SBIconListModel_iconsForGridRange_gridCellInfo___block_invoke;
  v14[3] = &unk_1E6AB1DB0;
  id v15 = v7;
  id v16 = self;
  id v17 = v8;
  LOWORD(self) = v9;
  id v10 = v8;
  id v11 = v7;
  SBHIconGridRangeEnumerateCellIndexes(cellIndex, size, (unsigned __int16)self, v14);
  uint64_t v12 = [v10 array];

  return v12;
}

void __50__SBIconListModel_iconsForGridRange_gridCellInfo___block_invoke(id *a1, uint64_t a2)
{
  uint64_t v3 = [a1[4] iconIndexForGridCellIndex:a2];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = [a1[5] iconAtIndex:v3];
    [a1[6] addObject:v4];
  }
}

- (id)iconsForGridRange:(SBHIconGridRange)a3 gridCellInfoOptions:(unint64_t)a4
{
  uint64_t v4 = *(void *)&a3.size.columns;
  unint64_t cellIndex = a3.cellIndex;
  id v7 = [(SBIconListModel *)self gridCellInfoWithOptions:a4];
  uint64_t v8 = -[SBIconListModel iconsForGridRange:gridCellInfo:](self, "iconsForGridRange:gridCellInfo:", cellIndex, v4, v7);

  return v8;
}

- (BOOL)hasIconsInGridRange:(SBHIconGridRange)a3 gridCellInfo:(id)a4
{
  SBHIconGridSize size = a3.size;
  unint64_t cellIndex = a3.cellIndex;
  id v6 = a4;
  unsigned __int16 v7 = [v6 gridSize];
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  _OWORD v10[2] = __52__SBIconListModel_hasIconsInGridRange_gridCellInfo___block_invoke;
  v10[3] = &unk_1E6AB2210;
  id v8 = v6;
  id v11 = v8;
  uint64_t v12 = &v13;
  SBHIconGridRangeEnumerateCellIndexes(cellIndex, *(_DWORD *)&size, v7, v10);
  LOBYTE(size.columns) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return size.columns;
}

uint64_t __52__SBIconListModel_hasIconsInGridRange_gridCellInfo___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) iconIndexForGridCellIndex:a2];
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (id)iconsInGridRow:(unint64_t)a3 gridCellInfo:(id)a4
{
  unint64_t v6 = a3 + 1;
  id v7 = a4;
  id v8 = -[SBIconListModel iconsForGridRange:gridCellInfo:](self, "iconsForGridRange:gridCellInfo:", objc_msgSend(v7, "gridCellIndexForCoordinate:", 1, v6), (unsigned __int16)objc_msgSend(v7, "numberOfUsedGridCellsInRow:", a3) | 0x10000, v7);

  return v8;
}

- (id)iconsInGridColumn:(unint64_t)a3 gridCellInfo:(id)a4
{
  unint64_t v6 = a3 + 1;
  id v7 = a4;
  id v8 = -[SBIconListModel iconsForGridRange:gridCellInfo:](self, "iconsForGridRange:gridCellInfo:", objc_msgSend(v7, "gridCellIndexForCoordinate:", v6, 1), (objc_msgSend(v7, "numberOfUsedGridCellsInColumn:", a3) << 16) | 1, v7);

  return v8;
}

- (id)iconsInGridColumnRange:(_NSRange)a3 gridCellInfo:(id)a4
{
  unsigned __int16 length = a3.length;
  locatiouint64_t n = a3.location;
  NSUInteger v7 = a3.location + 1;
  id v8 = a4;
  __int16 v9 = -[SBIconListModel iconsForGridRange:gridCellInfo:](self, "iconsForGridRange:gridCellInfo:", objc_msgSend(v8, "gridCellIndexForCoordinate:", v7, 1), (objc_msgSend(v8, "numberOfUsedGridCellsInColumn:", location) << 16) | (unint64_t)length, v8);

  return v9;
}

- (id)iconsInContiguousRegion:(id)a3 gridCellInfo:(id)a4
{
  return [(SBIconListModel *)self iconsInContiguousRegion:a3 startingAtGridCellIndex:0 gridCellInfo:a4];
}

- (id)iconsInContiguousRegion:(id)a3 gridCellInfoOptions:(unint64_t)a4
{
  id v6 = a3;
  NSUInteger v7 = [(SBIconListModel *)self gridCellInfoWithOptions:a4];
  id v8 = [(SBIconListModel *)self iconsInContiguousRegion:v6 gridCellInfo:v7];

  return v8;
}

- (id)iconsInContiguousRegion:(id)a3 startingAtGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5
{
  id v8 = a5;
  __int16 v9 = (objc_class *)MEMORY[0x1E4F1CA70];
  id v10 = a3;
  id v11 = objc_alloc_init(v9);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __80__SBIconListModel_iconsInContiguousRegion_startingAtGridCellIndex_gridCellInfo___block_invoke;
  uint64_t v19 = &unk_1E6AB2238;
  id v20 = v8;
  id v21 = self;
  id v22 = v11;
  unint64_t v23 = a4;
  id v12 = v11;
  id v13 = v8;
  [v10 enumerateGridCellIndexesUsingBlock:&v16];

  id v14 = objc_msgSend(v12, "array", v16, v17, v18, v19);

  return v14;
}

void __80__SBIconListModel_iconsInContiguousRegion_startingAtGridCellIndex_gridCellInfo___block_invoke(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 56) <= a2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) iconIndexForGridCellIndex:a2];
    if (v3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v4 = [*(id *)(a1 + 40) iconAtIndex:v3];
      [*(id *)(a1 + 48) addObject:v4];
    }
  }
}

- (id)iconsInRange:(_NSRange)a3
{
  return -[SBIconIndexMutableList nodesInRange:](self->_icons, "nodesInRange:", a3.location, a3.length);
}

- (unint64_t)numberOfUsedRows
{
  uint64_t v2 = [(SBIconListModel *)self gridCellInfoWithOptions:0];
  unint64_t v3 = [v2 numberOfUsedRows];

  return v3;
}

- (unint64_t)numberOfUsedColumns
{
  uint64_t v2 = [(SBIconListModel *)self gridCellInfoWithOptions:0];
  unint64_t v3 = [v2 numberOfUsedColumns];

  return v3;
}

- (unint64_t)numberOfUsedGridCells
{
  unint64_t v3 = [(SBIconListModel *)self layoutExcludedIcons];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__SBIconListModel_numberOfUsedGridCells__block_invoke;
  v7[3] = &unk_1E6AB2260;
  id v4 = v3;
  id v8 = v4;
  __int16 v9 = self;
  id v10 = &v11;
  [(SBIconListModel *)self enumerateIconsUsingBlock:v7];
  unint64_t v5 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v5;
}

void __40__SBIconListModel_numberOfUsedGridCells__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    unint64_t v3 = [v4 gridSizeClass];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [*(id *)(a1 + 40) gridSizeAreaForGridSizeClass:v3];
  }
}

- (BOOL)isLayoutReversibleWhenRotated
{
  unint64_t v3 = [(SBIconListModel *)self _rotatedIconListModel];
  id v4 = [(SBIconListModel *)self icons];
  unint64_t v5 = [v3 icons];
  char v6 = [v4 isEqualToArray:v5];

  return v6;
}

- (BOOL)isValidGridCellIndex:(unint64_t)a3 gridCellInfo:(id)a4
{
  return SBHIconGridSizeGetArea([a4 gridSize]) > a3;
}

- (BOOL)isValidGridCellIndex:(unint64_t)a3 options:(unint64_t)a4
{
  return SBHIconGridSizeGetArea([(SBIconListModel *)self gridSizeWithOptions:a4]) > a3;
}

- (BOOL)isValidGridRange:(SBHIconGridRange)a3 gridCellInfo:(id)a4
{
  int size = (int)a3.size;
  unint64_t cellIndex = a3.cellIndex;
  int v6 = [a4 gridSize];
  return SBHIconGridRangeContainsIconGridRange(0, v6, cellIndex, size, v6);
}

- (BOOL)isValidGridRange:(SBHIconGridRange)a3 options:(unint64_t)a4
{
  int size = (int)a3.size;
  unint64_t cellIndex = a3.cellIndex;
  SBHIconGridSize v6 = (SBHIconGridSize)[(SBIconListModel *)self gridSizeWithOptions:a4];
  return SBHIconGridRangeContainsIconGridRange(0, *(_DWORD *)&v6, cellIndex, size, v6.columns);
}

- (NSString)layoutDescription
{
  return (NSString *)[(SBIconListModel *)self layoutDescriptionWithOptions:0];
}

- (id)reversedOrderLayoutDescription
{
  return [(SBIconListModel *)self layoutDescriptionWithOptions:1];
}

- (id)rotatedLayoutDescription
{
  return [(SBIconListModel *)self layoutDescriptionWithOptions:2];
}

- (id)allowedGapsLayoutDescription
{
  return [(SBIconListModel *)self layoutDescriptionWithOptions:4];
}

- (id)layoutDescriptionWithOptions:(unint64_t)a3
{
  unint64_t v3 = [(SBIconListModel *)self gridCellInfoWithOptions:a3];
  id v4 = [v3 layoutDescription];

  return v4;
}

- (id)changeGridSizeClassOfContainedIcon:(id)a3 toGridSizeClass:(id)a4 gridCellInfoOptions:(unint64_t)a5
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  unint64_t v11 = [(SBIconListModel *)self indexForIcon:v9];
  id v12 = [v9 gridSizeClass];
  if (v12 == v10 || ([v10 isEqualToString:v12] & 1) != 0)
  {
    id v13 = 0;
    goto LABEL_19;
  }
  uint64_t v14 = NSStringFromSelector(a2);
  uint64_t v15 = [(SBIconListModel *)self startCoalescingContentChangesForReason:v14];

  uint64_t v16 = [(SBIconListModel *)self gridCellInfoWithOptions:a5];
  uint64_t v17 = [v16 gridCellIndexForIconIndex:v11];
  unint64_t v18 = [(SBIconListModel *)self bestGridCellIndexForInsertingIconOfGridSizeClass:v10 atGridCellIndex:v17 gridCellInfo:v16];
  if (v18 != v17) {
    id v19 = [(SBIconListModel *)self moveContainedIcon:v9 toGridCellIndex:v18 gridCellInfoOptions:a5 mutationOptions:0x1000000];
  }
  if (!SBHIconGridSizeEqualToIconGridSize([(SBIconListModel *)self gridSizeForGridSizeClass:v12 gridCellInfoOptions:a5], [(SBIconListModel *)self gridSizeForGridSizeClass:v10 gridCellInfoOptions:a5])&& [(SBIconListModel *)self fixedIconLocationBehavior] == 4)
  {
    [(SBIconListModel *)self reflowIconsForResizingIcon:v9 atGridCellIndex:v18 toGridSizeClass:v10 gridCellInfoOptions:a5];
  }
  [v9 setGridSizeClass:v10];
  if (!v12)
  {
    int v20 = 1;
    if (v10) {
      goto LABEL_11;
    }
LABEL_13:
    int v21 = 1;
    goto LABEL_14;
  }
  int v20 = [v12 isEqualToString:@"SBHIconGridSizeClassDefault"];
  if (!v10) {
    goto LABEL_13;
  }
LABEL_11:
  int v21 = [v10 isEqualToString:@"SBHIconGridSizeClassDefault"];
LABEL_14:
  if (v20 != v21) {
    [(SBIconListModel *)self updateHasNonDefaultSizeClassIcons];
  }
  v30[0] = v9;
  id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  unint64_t v23 = [(SBIconListModel *)self _checkAndRemoveBouncedIconsAfterChangeToIcons:v22 ignoringTrailingIconCheck:0 options:0];

  if ([v23 count])
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __90__SBIconListModel_changeGridSizeClassOfContainedIcon_toGridSizeClass_gridCellInfoOptions___block_invoke;
    v28[3] = &unk_1E6AADBA0;
    id v29 = v23;
    [(SBIconListModel *)self _updateRotatedIconsUsingBlock:v28];
  }
  [(SBIconListModel *)self removeFixedIconLocationsIfPossibleWithGridCellInfoOptions:a5];
  [(SBIconListModel *)self markIconStateDirty];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __90__SBIconListModel_changeGridSizeClassOfContainedIcon_toGridSizeClass_gridCellInfoOptions___block_invoke_2;
  v26[3] = &unk_1E6AB2288;
  void v26[4] = self;
  id v27 = v9;
  [(SBIconListModel *)self _notifyListObservers:v26];
  [v15 invalidate];
  long long v24 = v27;
  id v13 = v23;

LABEL_19:
  return v13;
}

uint64_t __90__SBIconListModel_changeGridSizeClassOfContainedIcon_toGridSizeClass_gridCellInfoOptions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeIcons:*(void *)(a1 + 32)];
}

void __90__SBIconListModel_changeGridSizeClassOfContainedIcon_toGridSizeClass_gridCellInfoOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 iconList:*(void *)(a1 + 32) didChangeGridSizeClassOfIcon:*(void *)(a1 + 40)];
  }
}

- (void)addIconsPassingTest:(id)a3 toSet:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  SBHIconGridSize v6 = (unsigned int (**)(id, void *))a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = self->_icons;
  uint64_t v9 = [(SBIconIndexMutableList *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (v6[2](v6, v13)) {
          objc_msgSend(v7, "addObject:", v13, (void)v15);
        }
        if (objc_msgSend(v13, "isFolderIcon", (void)v15))
        {
          uint64_t v14 = [v13 folder];
          [v14 addIconsPassingTest:v6 toSet:v7];
        }
      }
      uint64_t v10 = [(SBIconIndexMutableList *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (id)iconsOfClass:(Class)a3
{
  unint64_t v5 = objc_opt_new();
  [(SBIconListModel *)self addIconsOfClass:a3 toSet:v5];
  return v5;
}

- (BOOL)isIconStateDirty
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_iconStateIsDirty)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v3 = self->_icons;
    uint64_t v2 = [(SBIconIndexMutableList *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v2)
    {
      uint64_t v4 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v2; ++i)
        {
          if (*(void *)v11 != v4) {
            objc_enumerationMutation(v3);
          }
          SBHIconGridSize v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          if (objc_msgSend(v6, "isFolderIcon", (void)v10))
          {
            id v7 = [v6 folder];
            char v8 = [v7 isIconStateDirty];

            if (v8)
            {
              LOBYTE(v2) = 1;
              goto LABEL_14;
            }
          }
        }
        uint64_t v2 = [(SBIconIndexMutableList *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v2) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  return v2;
}

- (void)markIconStateDirty
{
  if (!self->_iconStateIsDirty)
  {
    self->_iconStateIsDirty = 1;
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __37__SBIconListModel_markIconStateDirty__block_invoke;
    v2[3] = &unk_1E6AB1708;
    v2[4] = self;
    [(SBIconListModel *)self _notifyListObservers:v2];
  }
}

void __37__SBIconListModel_markIconStateDirty__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 iconListIconStateDidDirty:*(void *)(a1 + 32)];
  }
}

- (void)markIconStateDirtyWithOptions:(unint64_t)a3
{
  if ((a3 & 0x20000000) == 0) {
    [(SBIconListModel *)self markIconStateDirty];
  }
}

- (void)markIconStateClean
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  self->_iconStateIsDirty = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = self->_icons;
  uint64_t v4 = [(SBIconIndexMutableList *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        char v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "isFolderIcon", (void)v11))
        {
          uint64_t v9 = [v8 folder];
          [v9 markIconStateClean];
        }
      }
      uint64_t v5 = [(SBIconIndexMutableList *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  long long v10 = [(SBIconListModel *)self _rotatedIconListModelIfApplicable];
  [v10 markIconStateClean];
}

- (NSString)description
{
  return (NSString *)[(SBIconListModel *)self descriptionWithMultilinePrefix:0];
}

- (void)sortUsingSelector:(SEL)a3
{
}

- (void)sortUsingComparator:(id)a3
{
}

- (void)sortByLayoutOrderWithGridCellInfoOptions:(unint64_t)a3
{
  if ([(SBIconListModel *)self hasFixedIconLocations])
  {
    uint64_t v5 = [(SBIconListModel *)self _targetListForGridCellInfoOptions:a3];
    id v7 = v5;
    if (v5 == self)
    {
      uint64_t v6 = [(SBIconListModel *)self gridCellInfoWithOptions:a3];
      [(SBIconListModel *)self sortByLayoutOrderWithGridCellInfo:v6];
    }
    else
    {
      [(SBIconListModel *)v5 sortByLayoutOrderWithGridCellInfoOptions:a3];
    }
  }
}

- (void)sortByLayoutOrderWithGridCellInfo:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  unint64_t v6 = [(SBIconListModel *)self numberOfUsedRows];
  unint64_t v7 = v6 * (unsigned __int16)[v4 gridSize];
  if (v7)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      uint64_t v9 = [v4 iconIndexForGridCellIndex:i];
      if (v9 != 0x7FFFFFFFFFFFFFFFLL)
      {
        long long v10 = [(SBIconListModel *)self iconAtIndex:v9];
        if (([v5 containsObject:v10] & 1) == 0) {
          [v5 addObject:v10];
        }
      }
    }
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v11 = self->_icons;
  uint64_t v12 = [(SBIconIndexMutableList *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * j);
        if ((objc_msgSend(v5, "containsObject:", v16, (void)v19) & 1) == 0) {
          [v5 addObject:v16];
        }
      }
      uint64_t v13 = [(SBIconIndexMutableList *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  icons = self->_icons;
  long long v18 = [v5 array];
  [(SBIconIndexMutableList *)icons setNodes:v18];
}

- (void)sortByIconGridSizeAreaWithGridCellInfoOptions:(unint64_t)a3
{
  -[SBIconListModel _targetListForGridCellInfoOptions:](self, "_targetListForGridCellInfoOptions:");
  id v5 = (SBIconListModel *)objc_claimAutoreleasedReturnValue();
  unint64_t v6 = v5;
  if (v5 == self)
  {
    unint64_t v7 = [(SBIconListModel *)self icons];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__SBIconListModel_sortByIconGridSizeAreaWithGridCellInfoOptions___block_invoke;
    v9[3] = &unk_1E6AB2008;
    void v9[4] = self;
    v9[5] = a3;
    char v8 = [v7 sortedArrayUsingComparator:v9];
    [(SBIconIndexMutableList *)self->_icons setNodes:v8];
  }
  else
  {
    [(SBIconListModel *)v5 sortByLayoutOrderWithGridCellInfoOptions:a3];
  }
}

uint64_t __65__SBIconListModel_sortByIconGridSizeAreaWithGridCellInfoOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  unint64_t v6 = [a2 gridSizeClass];
  unint64_t v7 = [v5 gridSizeClass];

  LODWORD(v5) = [*(id *)(a1 + 32) gridSizeForGridSizeClass:v6 gridCellInfoOptions:*(void *)(a1 + 40)];
  LODWORD(a1) = [*(id *)(a1 + 32) gridSizeForGridSizeClass:v7 gridCellInfoOptions:*(void *)(a1 + 40)];
  unsigned int Area = SBHIconGridSizeGetArea((int)v5);
  unsigned int v9 = SBHIconGridSizeGetArea(a1);
  if (Area <= v9) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = -1;
  }
  if (Area < v9) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = v10;
  }

  return v11;
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  [(SBIconListModel *)self setHidden:v3 byUser:1 hiddenDate:v5];
}

- (void)setHidden:(BOOL)a3 byUser:(BOOL)a4 hiddenDate:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  unsigned int v9 = v8;
  if (v6 && v5)
  {
    if (v8)
    {
      uint64_t v10 = self;
      uint64_t v11 = v9;
LABEL_8:
      [(SBIconListModel *)v10 setHiddenDate:v11];
      goto LABEL_10;
    }
    uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
    [(SBIconListModel *)self setHiddenDate:v12];
  }
  else if (v5 && !v6)
  {
    uint64_t v10 = self;
    uint64_t v11 = 0;
    goto LABEL_8;
  }
LABEL_10:
  if (self->_hidden != v6)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __47__SBIconListModel_setHidden_byUser_hiddenDate___block_invoke;
    v14[3] = &unk_1E6AB1708;
    void v14[4] = self;
    [(SBIconListModel *)self _notifyListObservers:v14];
    self->_hiddeuint64_t n = v6;
    if (v6) {
      [(SBIconListModel *)self setOverflowSlotCount:0];
    }
    [(SBIconListModel *)self markIconStateDirty];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __47__SBIconListModel_setHidden_byUser_hiddenDate___block_invoke_2;
    v13[3] = &unk_1E6AB1708;
    v13[4] = self;
    [(SBIconListModel *)self _notifyListObservers:v13];
  }
}

void __47__SBIconListModel_setHidden_byUser_hiddenDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 iconListHiddenWillChange:*(void *)(a1 + 32)];
  }
}

void __47__SBIconListModel_setHidden_byUser_hiddenDate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 iconListHiddenDidChange:*(void *)(a1 + 32)];
  }
}

- (BOOL)isHiddenByUser
{
  uint64_t v2 = [(SBIconListModel *)self hiddenDate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setFocusModeIdentifiers:(id)a3
{
  BOOL v5 = (NSSet *)a3;
  if ([(NSSet *)v5 count])
  {
    id v4 = v5;
  }
  else
  {

    id v4 = 0;
  }
  if (v4 != self->_focusModeIdentifiers)
  {
    BOOL v6 = v4;
    objc_storeStrong((id *)&self->_focusModeIdentifiers, v4);
    [(SBIconListModel *)self markIconStateDirty];
    id v4 = v6;
  }
}

- (void)updateForFocusModeActivated:(BOOL)a3 wantsListVisible:(BOOL)a4
{
  if (a3) {
    BOOL v5 = !a4;
  }
  else {
    BOOL v5 = [(SBIconListModel *)self isHiddenByUser];
  }
  [(SBIconListModel *)self setHidden:v5 byUser:0 hiddenDate:0];
}

- (void)setAllowedGridSizeClasses:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    id v4 = (SBHIconGridSizeClassSet *)[v6 copy];
    allowedGridSizeClasses = self->_allowedGridSizeClasses;
    self->_allowedGridSizeClasses = v4;

    [(SBIconListModel *)self removeAnyIconsWithDisallowedGridSizeClasses];
    [(SBIconListModel *)self->_rotatedIcons setAllowedGridSizeClasses:v6];
  }
}

- (void)removeAnyIconsWithDisallowedGridSizeClasses
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v3 = self->_icons;
  uint64_t v4 = [(SBIconIndexMutableList *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v4)
  {
    id v6 = v3;
    goto LABEL_15;
  }
  uint64_t v5 = v4;
  id v6 = 0;
  uint64_t v7 = *(void *)v12;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v3);
      }
      unsigned int v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
      uint64_t v10 = objc_msgSend(v9, "gridSizeClass", (void)v11);
      if (![(SBIconListModel *)self isAllowedToContainIconGridSizeClass:v10])
      {
        if (!v6) {
          id v6 = (SBIconIndexMutableList *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        [(SBIconIndexMutableList *)v6 addObject:v9];
      }
    }
    uint64_t v5 = [(SBIconIndexMutableList *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  }
  while (v5);

  if (v6)
  {
    [(SBIconListModel *)self removeIcons:v6];
LABEL_15:
  }
}

- (void)setGridSizeClassDomain:(id)a3
{
  uint64_t v5 = (SBHIconGridSizeClassDomain *)a3;
  if (self->_gridSizeClassDomain != v5)
  {
    objc_storeStrong((id *)&self->_gridSizeClassDomain, a3);
    [(SBIconListModel *)self removeAnyIconsWithDisallowedGridSizeClasses];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__SBIconListModel_setGridSizeClassDomain___block_invoke;
    v7[3] = &unk_1E6AB0CE0;
    id v6 = v5;
    id v8 = v6;
    [(SBIconListModel *)self enumerateFolderIconsUsingBlock:v7];
    [(SBIconListModel *)self->_rotatedIcons setGridSizeClassDomain:v6];
  }
}

void __42__SBIconListModel_setGridSizeClassDomain___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 folder];
  [v3 setGridSizeClassDomain:*(void *)(a1 + 32)];
}

- (SBHIconGridSizeClassDomain)effectiveGridSizeClassDomain
{
  uint64_t v2 = self->_gridSizeClassDomain;
  if (!v2)
  {
    uint64_t v2 = +[SBHIconGridSizeClassDomain globalDomain];
  }
  return v2;
}

- (void)setRotatedLayoutClusterGridSizeClass:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  uint64_t v5 = v4;
  if (self->_rotatedLayoutClusterGridSizeClass != v4)
  {
    unsigned int v9 = v4;
    BOOL v6 = -[NSString isEqualToString:](v4, "isEqualToString:");
    uint64_t v5 = v9;
    if (!v6)
    {
      uint64_t v7 = (NSString *)[(NSString *)v9 copy];
      rotatedLayoutClusterGridSizeClass = self->_rotatedLayoutClusterGridSizeClass;
      self->_rotatedLayoutClusterGridSizeClass = v7;

      [(SBIconListModel *)self _invalidateLayoutWithGridCellInfoOptions:0 mutationOptions:0];
      uint64_t v5 = v9;
    }
  }
}

- (void)setIconLayoutBehavior:(unint64_t)a3
{
  if (self->_iconLayoutBehavior != a3)
  {
    self->_iconLayoutBehavior = a3;
    [(SBIconListModel *)self _invalidateLayoutWithGridCellInfoOptions:0 mutationOptions:0];
  }
}

- (void)setOverflowSlotCount:(unint64_t)a3
{
  if (self->_overflowSlotCount != a3)
  {
    self->_overflowSlotCount = a3;
    [(SBIconListModel *)self markIconStateDirty];
  }
}

- (void)removeListObserver:(id)a3
{
}

- (void)_notifyListObservers:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = (void *)[(NSHashTable *)self->_listObservers copy];
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

- (void)_notifyListObserversWillAddIcon:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__SBIconListModel__notifyListObserversWillAddIcon___block_invoke;
  v6[3] = &unk_1E6AB2288;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SBIconListModel *)self _notifyListObservers:v6];
}

void __51__SBIconListModel__notifyListObserversWillAddIcon___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 iconList:*(void *)(a1 + 32) willAddIcon:*(void *)(a1 + 40)];
  }
}

- (void)_notifyListObserversDidAddIcon:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithObjects:&v7 count:1];

  -[SBIconListModel _notifyListObserversDidAddIcons:didRemoveIcons:movedIcons:didReplaceIcon:withIcon:options:](self, "_notifyListObserversDidAddIcons:didRemoveIcons:movedIcons:didReplaceIcon:withIcon:options:", v6, 0, 0, 0, 0, 0, v7, v8);
}

- (void)_notifyListObserversWillRemoveIcon:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__SBIconListModel__notifyListObserversWillRemoveIcon___block_invoke;
  v6[3] = &unk_1E6AB2288;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SBIconListModel *)self _notifyListObservers:v6];
}

void __54__SBIconListModel__notifyListObserversWillRemoveIcon___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 iconList:*(void *)(a1 + 32) willRemoveIcon:*(void *)(a1 + 40)];
  }
}

- (void)_notifyListObserversDidRemoveIcon:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithObjects:&v7 count:1];

  -[SBIconListModel _notifyListObserversDidAddIcons:didRemoveIcons:movedIcons:didReplaceIcon:withIcon:options:](self, "_notifyListObserversDidAddIcons:didRemoveIcons:movedIcons:didReplaceIcon:withIcon:options:", 0, v6, 0, 0, 0, 0, v7, v8);
}

- (void)_notifyListObserversDidMoveIcon:(id)a3 options:(unint64_t)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  uint64_t v8 = [v6 arrayWithObjects:&v9 count:1];

  -[SBIconListModel _notifyListObserversDidAddIcons:didRemoveIcons:movedIcons:didReplaceIcon:withIcon:options:](self, "_notifyListObserversDidAddIcons:didRemoveIcons:movedIcons:didReplaceIcon:withIcon:options:", 0, 0, v8, 0, 0, a4, v9, v10);
}

- (void)_notifyListObserversDidReplaceIcon:(id)a3 withIcon:(id)a4
{
}

- (void)_notifyListObserversDidAddIcons:(id)a3 didRemoveIcons:(id)a4 movedIcons:(id)a5
{
}

- (void)_notifyListObserversDidAddIcons:(id)a3 didRemoveIcons:(id)a4 movedIcons:(id)a5 didReplaceIcon:(id)a6 withIcon:(id)a7 options:(unint64_t)a8
{
  int v8 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if ((v8 & 0x800000) == 0)
  {
    long long v19 = [(SBIconListModel *)self activeTransactionCreatingIfNecessary:0];
    long long v20 = v19;
    if (v19)
    {
      [v19 queueNotifyingListObserversDidAddIcons:v14 didRemoveIcons:v15 movedIcons:v16 didReplaceIcon:v17 withIcon:v18];
    }
    else
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      void v21[2] = __109__SBIconListModel__notifyListObserversDidAddIcons_didRemoveIcons_movedIcons_didReplaceIcon_withIcon_options___block_invoke;
      v21[3] = &unk_1E6AB22B0;
      void v21[4] = self;
      id v22 = v14;
      id v23 = v15;
      id v24 = v16;
      id v25 = v17;
      id v26 = v18;
      [(SBIconListModel *)self _notifyListObservers:v21];
    }
  }
}

uint64_t __109__SBIconListModel__notifyListObserversDidAddIcons_didRemoveIcons_movedIcons_didReplaceIcon_withIcon_options___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyListObserver:a2 didAddIcons:*(void *)(a1 + 40) didRemoveIcons:*(void *)(a1 + 48) movedIcons:*(void *)(a1 + 56) didReplaceIcon:*(void *)(a1 + 64) withIcon:*(void *)(a1 + 72)];
}

- (void)_notifyListObserver:(id)a3 didAddIcons:(id)a4 didRemoveIcons:(id)a5 movedIcons:(id)a6 didReplaceIcon:(id)a7 withIcon:(id)a8
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  long long v20 = v19;
  if (v18 && v19 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v14 iconList:self didReplaceIcon:v18 withIcon:v20];
  }
  id v36 = v15;
  if (v15 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v21 = v15;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v45 objects:v51 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v46;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v46 != v24) {
            objc_enumerationMutation(v21);
          }
          [v14 iconList:self didAddIcon:*(void *)(*((void *)&v45 + 1) + 8 * v25++)];
        }
        while (v23 != v25);
        uint64_t v23 = [v21 countByEnumeratingWithState:&v45 objects:v51 count:16];
      }
      while (v23);
    }

    id v15 = v36;
  }
  if (v16 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v26 = v16;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v41 objects:v50 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v42;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v42 != v29) {
            objc_enumerationMutation(v26);
          }
          [v14 iconList:self didRemoveIcon:*(void *)(*((void *)&v41 + 1) + 8 * v30++)];
        }
        while (v28 != v30);
        uint64_t v28 = [v26 countByEnumeratingWithState:&v41 objects:v50 count:16];
      }
      while (v28);
    }

    id v15 = v36;
  }
  if (v17 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v31 = v17;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v37 objects:v49 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v38;
      do
      {
        uint64_t v35 = 0;
        do
        {
          if (*(void *)v38 != v34) {
            objc_enumerationMutation(v31);
          }
          [v14 iconList:self didMoveIcon:*(void *)(*((void *)&v37 + 1) + 8 * v35++)];
        }
        while (v33 != v35);
        uint64_t v33 = [v31 countByEnumeratingWithState:&v37 objects:v49 count:16];
      }
      while (v33);
    }

    id v15 = v36;
  }
}

- (void)_notifyListObserversDirectlyContainsNonDefaultSizeClassIconDidChange
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __87__SBIconListModel__notifyListObserversDirectlyContainsNonDefaultSizeClassIconDidChange__block_invoke;
  v2[3] = &unk_1E6AB1708;
  v2[4] = self;
  [(SBIconListModel *)self _notifyListObservers:v2];
}

void __87__SBIconListModel__notifyListObserversDirectlyContainsNonDefaultSizeClassIconDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 iconListDirectlyContainsNonDefaultSizeClassIconDidChange:*(void *)(a1 + 32)];
  }
}

- (NSArray)children
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v2 = self->_icons;
  uint64_t v3 = [(SBIconIndexMutableList *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        int v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "isFolderIcon", (void)v11))
        {
          id v9 = [v8 folder];
          if (v9)
          {
            if (!v5)
            {
              id v5 = [MEMORY[0x1E4F1CA48] array];
            }
            [v5 addObject:v9];
          }
        }
      }
      uint64_t v4 = [(SBIconIndexMutableList *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  return (NSArray *)v5;
}

- (void)ancestryDidChange
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [(SBIconIndexMutableList *)self->_icons nodes];
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
        [(SBIconListModel *)self removeIconFromOtherPositionsInHierarchy:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

+ (BOOL)isListModelNodeIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = self;
  if (objc_opt_isKindOfClass()) {
    char v5 = [v3 hasPrefix:@"list:"];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (id)listModelNodeIdentifierForUniqueIdentifier:(id)a3
{
  id v3 = (objc_class *)NSString;
  id v4 = a3;
  char v5 = (void *)[[v3 alloc] initWithFormat:@"list:%@", v4];

  return v5;
}

- (id)containedNodeIdentifiers
{
  id v3 = [(SBIconIndexMutableList *)self->_icons containedNodeIdentifiers];
  id v4 = [(SBIconListModel *)self nodeIdentifier];
  [v3 addObject:v4];

  return v3;
}

- (id)nodesAlongIndexPath:(id)a3 consumedIndexes:(unint64_t)a4
{
  char v5 = [(SBIconIndexMutableList *)self->_icons nodesAlongIndexPath:a3 consumedIndexes:a4];
  [v5 insertObject:self atIndex:0];
  return v5;
}

- (void)addNodeObserver:(id)a3
{
  id v7 = a3;
  if (!-[NSHashTable containsObject:](self->_nodeObservers, "containsObject:"))
  {
    nodeObservers = self->_nodeObservers;
    if (!nodeObservers)
    {
      char v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      uint64_t v6 = self->_nodeObservers;
      self->_nodeObservers = v5;

      nodeObservers = self->_nodeObservers;
    }
    [(NSHashTable *)nodeObservers addObject:v7];
  }
}

- (void)removeNodeObserver:(id)a3
{
}

- (void)enumerateNodeObserversUsingBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  char v5 = (void *)[(NSHashTable *)self->_nodeObservers copy];
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

- (id)nodeDescriptionWithPrefix:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F28E78];
  char v5 = (__CFString *)a3;
  uint64_t v6 = [v4 stringWithString:v5];
  uint64_t v7 = (void *)MEMORY[0x1D9484600]();
  uint64_t v8 = &stru_1F2FA0300;
  if (v5) {
    uint64_t v8 = v5;
  }
  uint64_t v9 = v8;

  long long v10 = [(SBIconListModel *)self nodeIdentifier];
  long long v11 = SBIconIndexDebugStringForNodeIdentifier(v10);
  [v6 appendString:v11];

  [v6 appendString:@"\n"];
  icons = self->_icons;
  long long v13 = [(__CFString *)v9 stringByAppendingString:@" "];
  long long v14 = [(SBIconIndexMutableList *)icons indexDescriptionWithPrefix:v13];
  [v6 appendString:v14];

  uint64_t v15 = [(__CFString *)v9 stringByAppendingString:@"   L "];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v16 = self->_icons;
  uint64_t v17 = [(SBIconIndexMutableList *)v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        objc_msgSend(v6, "appendString:", @"\n", (void)v24);
        uint64_t v22 = [v21 nodeDescriptionWithPrefix:v15];
        [v6 appendString:v22];
      }
      uint64_t v18 = [(SBIconIndexMutableList *)v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v18);
  }

  return v6;
}

- (void)list:(id)a3 didAddContainedNodeIdentifiers:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = v6;
  if (self->_icons == a3 && [v6 count])
  {
    uint64_t v8 = [(SBIconListModel *)self activeTransaction];
    uint64_t v9 = v8;
    if (v8)
    {
      [v8 addNodeIdentifiers:v7];
    }
    else
    {
      long long v10 = (void *)[(NSHashTable *)self->_nodeObservers copy];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v17 != v14) {
              objc_enumerationMutation(v11);
            }
            objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "node:didAddContainedNodeIdentifiers:", self, v7, (void)v16);
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v13);
      }
    }
  }
}

- (void)list:(id)a3 didRemoveContainedNodeIdentifiers:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = v6;
  if (self->_icons == a3 && [v6 count])
  {
    uint64_t v8 = [(SBIconListModel *)self activeTransaction];
    uint64_t v9 = v8;
    if (v8)
    {
      [v8 removeNodeIdentifiers:v7];
    }
    else
    {
      long long v10 = (void *)[(NSHashTable *)self->_nodeObservers copy];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v17 != v14) {
              objc_enumerationMutation(v11);
            }
            objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "node:didRemoveContainedNodeIdentifiers:", self, v7, (void)v16);
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v13);
      }
    }
  }
}

- (void)listDidMoveNodes:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_icons == a3)
  {
    id v4 = (void *)[(NSHashTable *)self->_nodeObservers copy];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v4;
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
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "nodeDidMoveContainedNodes:", self, (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)iconList:(id)a3 willAddIcon:(id)a4
{
  if (self->_rotatedIcons == a3)
  {
    id v5 = a4;
    [(SBIconListModel *)self updateGridSizeForAddedIcon:v5 removedIcon:0];
    [(SBIconListModel *)self _notifyListObserversWillAddIcon:v5];
  }
}

- (void)iconList:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5
{
  if (self->_rotatedIcons == a3) {
    [(SBIconListModel *)self updateGridSizeForAddedIcon:a5 removedIcon:a4];
  }
}

- (void)iconList:(id)a3 willRemoveIcon:(id)a4
{
  if (self->_rotatedIcons == a3) {
    [(SBIconListModel *)self updateGridSizeForAddedIcon:0 removedIcon:a4];
  }
}

- (void)setBadgeBehaviorProvider:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_badgeBehaviorProvider);

  if (WeakRetained != v4)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_badgeBehaviorProvider);
    objc_storeWeak((id *)&self->_badgeBehaviorProvider, v4);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __44__SBIconListModel_setBadgeBehaviorProvider___block_invoke;
    v8[3] = &unk_1E6AB0CE0;
    id v9 = v6;
    id v7 = v6;
    [(SBIconListModel *)self enumerateFolderIconsUsingBlock:v8];
  }
}

uint64_t __44__SBIconListModel_setBadgeBehaviorProvider___block_invoke(uint64_t a1, void *a2)
{
  return [a2 badgeBehaviorProviderDidChange:*(void *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithIconListModel:self copyLeafIcons:0];
}

- (void)_changeFolderDuringCopy:(id)a3
{
}

- (void)_coalesceChangesWithRequestID:(id)a3 changeBlock:(id)a4
{
  id v6 = (void (**)(void))a4;
  id v7 = [(SBIconListModel *)self startCoalescingContentChangesForReason:a3];
  v6[2](v6);

  [v7 invalidate];
}

- (id)activeTransactionCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SBIconListModel *)self activeTransaction];
  if (!v5 && v3)
  {
    id v5 = [[_SBIconListModelTransaction alloc] initWithListModel:self];
    [(SBIconListModel *)self setActiveTransaction:v5];
  }
  return v5;
}

- (id)startCoalescingContentChangesForReason:(id)a3
{
  id v4 = a3;
  id v5 = [(SBIconListModel *)self activeTransactionCreatingIfNecessary:1];
  id v6 = [[SBIconListModelTransactionAssertion alloc] initWithListModel:self reason:v4];

  [v5 addAssertion:v6];
  return v6;
}

- (void)removeTransactionAssertion:(id)a3
{
  id v4 = a3;
  id v5 = [(SBIconListModel *)self activeTransactionCreatingIfNecessary:0];
  [v5 removeAssertion:v4];

  if (v5 && ![v5 assertionCount])
  {
    [(SBIconListModel *)self setActiveTransaction:0];
    [v5 commitChanges];
  }
}

- (id)succinctDescription
{
  uint64_t v2 = [(SBIconListModel *)self succinctDescriptionBuilder];
  BOOL v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(SBIconListModel *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBIconListModel *)self effectiveGridSizeClassDomain];
  id v5 = [(SBIconListModel *)self succinctDescriptionBuilder];
  id v6 = [(SBIconListModel *)self uniqueIdentifier];
  [v5 appendString:v6 withName:@"uniqueIdentifier"];

  id v7 = (id)objc_msgSend(v5, "appendInteger:withName:", -[SBIconIndexMutableList count](self->_icons, "count"), @"count");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_folder);
  id v9 = (id)[v5 appendPointer:WeakRetained withName:@"folder"];

  id v10 = (id)objc_msgSend(v5, "appendBool:withName:ifEqualTo:", -[SBIconListModel isHidden](self, "isHidden"), @"hidden", 1);
  id v11 = (id)objc_msgSend(v5, "appendBool:withName:ifEqualTo:", -[SBIconListModel isHiddenByUser](self, "isHiddenByUser"), @"hiddenByUser", 1);
  unint64_t v12 = [(SBIconListModel *)self overflowSlotCount];
  if (v12) {
    id v13 = (id)[v5 appendInteger:v12 withName:@"overflowSlotCount"];
  }
  uint64_t v14 = SBHStringForIconGridSize(*(_DWORD *)&self->_gridSize);
  id v15 = (id)[v5 appendObject:v14 withName:@"gridSize"];

  long long v16 = [(SBIconListModel *)self iconGridSizeClassSizes];
  long long v17 = [v16 descriptionWithGridSizeClassDomain:v4];
  id v18 = (id)[v5 appendObject:v17 withName:@"gridSizeClassSizes"];

  long long v19 = [(SBHIconGridSizeClassSet *)self->_allowedGridSizeClasses descriptionWithGridSizeClassDomain:v4];
  id v20 = (id)[v5 appendObject:v19 withName:@"allowedGridSizeClasses"];

  uint64_t v21 = [(SBIconListModel *)self rotatedLayoutClusterGridSizeClass];
  uint64_t v22 = v21;
  if (v21 && ([v21 isEqualToString:@"SBHIconGridSizeClassDefault"] & 1) == 0)
  {
    uint64_t v23 = [v4 descriptionForGridSizeClass:v22];
    [v5 appendString:v23 withName:@"rotatedLayoutClusterGridSizeClass"];
  }
  id v24 = (id)objc_msgSend(v5, "appendBool:withName:ifEqualTo:", -[SBIconListModel allowsRotatedLayout](self, "allowsRotatedLayout"), @"allowsRotatedLayout", 1);
  id v25 = (id)objc_msgSend(v5, "appendBool:withName:ifEqualTo:", -[SBIconListModel allowsIndependentRotatedLayout](self, "allowsIndependentRotatedLayout"), @"allowsIndependentRotatedLayout", 0);
  long long v26 = [(SBIconListModel *)self focusModeIdentifiers];
  if ([v26 count])
  {
    long long v27 = NSString;
    uint64_t v28 = [v26 allObjects];
    uint64_t v29 = [v28 componentsJoinedByString:@", "];
    uint64_t v30 = [v27 stringWithFormat:@"{%@}", v29];
    [v5 appendString:v30 withName:@"focusModeIdentifiers"];
  }
  unint64_t v31 = [(SBIconListModel *)self iconLayoutBehavior];
  if (v31)
  {
    uint64_t v32 = SBHStringForIconLayoutBehavior(v31);
    [v5 appendString:v32 withName:@"iconLayoutBehavior"];
  }
  uint64_t v33 = SBHStringForFixedIconLocationBehavior([(SBIconListModel *)self fixedIconLocationBehavior]);
  [v5 appendString:v33 withName:@"fixedIconLocationBehavior"];

  id v34 = (id)objc_msgSend(v5, "appendBool:withName:ifEqualTo:", -[SBIconListModel isIconStateDirty](self, "isIconStateDirty"), @"isIconStateDirty", 1);
  return v5;
}

- (SBTreeNode)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (SBTreeNode *)WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (SBHIconGridSizeClassDomain)gridSizeClassDomain
{
  return self->_gridSizeClassDomain;
}

- (SBFolder)folder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_folder);
  return (SBFolder *)WeakRetained;
}

- (SBHIconGridSize)gridSizeWhenDirectlyContainingNonDefaultSizedIcons
{
  return self->_gridSizeWhenDirectlyContainingNonDefaultSizedIcons;
}

- (SBHIconGridSizeClassSet)allowedGridSizeClasses
{
  return self->_allowedGridSizeClasses;
}

- (NSString)rotatedLayoutClusterGridSizeClass
{
  return self->_rotatedLayoutClusterGridSizeClass;
}

- (BOOL)allowsRotatedLayout
{
  return self->_allowsRotatedLayout;
}

- (BOOL)allowsIndependentRotatedLayout
{
  return self->_allowsIndependentRotatedLayout;
}

- (void)setAllowsIndependentRotatedLayout:(BOOL)a3
{
  self->_allowsIndependentRotatedLayout = a3;
}

- (SBIconListModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBIconListModelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDate)hiddenDate
{
  return self->_hiddenDate;
}

- (void)setHiddenDate:(id)a3
{
}

- (NSSet)focusModeIdentifiers
{
  return self->_focusModeIdentifiers;
}

- (int64_t)fixedIconLocationBehavior
{
  return self->_fixedIconLocationBehavior;
}

- (SBHIconBadgeBehaviorProviding)badgeBehaviorProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_badgeBehaviorProvider);
  return (SBHIconBadgeBehaviorProviding *)WeakRetained;
}

- (SBHIconGridSize)initialGridSize
{
  return self->_initialGridSize;
}

- (_SBIconListModelTransaction)activeTransaction
{
  return self->_activeTransaction;
}

- (void)setActiveTransaction:(id)a3
{
}

- (BOOL)hasNonDefaultSizeClassIcons
{
  return self->_hasNonDefaultSizeClassIcons;
}

- (SBHIconGridSizeClassSizeMap)rotatedIconGridSizeClassSizes
{
  return self->_rotatedIconGridSizeClassSizes;
}

- (void)setRotatedIconGridSizeClassSizes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotatedIconGridSizeClassSizes, 0);
  objc_storeStrong((id *)&self->_layoutExcludedIcons, 0);
  objc_storeStrong((id *)&self->_activeTransaction, 0);
  objc_destroyWeak((id *)&self->_badgeBehaviorProvider);
  objc_storeStrong((id *)&self->_focusModeIdentifiers, 0);
  objc_storeStrong((id *)&self->_hiddenDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rotatedLayoutClusterGridSizeClass, 0);
  objc_storeStrong((id *)&self->_allowedGridSizeClasses, 0);
  objc_destroyWeak((id *)&self->_folder);
  objc_storeStrong((id *)&self->_gridSizeClassDomain, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_fixedIconLocations, 0);
  objc_storeStrong((id *)&self->_nodeIdentifier, 0);
  objc_storeStrong((id *)&self->_gridSizeClassSizes, 0);
  objc_storeStrong((id *)&self->_listObservers, 0);
  objc_storeStrong((id *)&self->_nodeObservers, 0);
  objc_storeStrong((id *)&self->_rotatedIcons, 0);
  objc_storeStrong((id *)&self->_icons, 0);
}

- (id)folderLayerWithListLayout:(id)a3 traitCollection:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4FB1E20];
  id v7 = a3;
  uint64_t v8 = objc_msgSend(v6, "sbh_iconImageAppearanceFromTraitCollection:", a4);
  id v9 = [(SBIconListModel *)self folderLayerWithListLayout:v7 imageAppearance:v8];

  return v9;
}

- (id)folderLayerWithListLayout:(id)a3 imageAppearance:(id)a4
{
  return [(SBIconListModel *)self folderLayerWithListLayout:a3 imageAppearance:a4 cellProvider:0];
}

- (void)insertIcons:(os_log_t)log atIndex:options:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "-[SBIconListModel insertIcons:atIndex:options:]";
  _os_log_error_impl(&dword_1D7F0A000, log, OS_LOG_TYPE_ERROR, "%s ERROR: invalid index for insertion", (uint8_t *)&v1, 0xCu);
}

- (void)insertIcons:atIndex:options:.cold.2()
{
  v0 = (objc_class *)objc_opt_class();
  int v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_3(&dword_1D7F0A000, v2, v3, "%s ERROR: icon of class %{public}@ cannot be added to this model: %@", v4, v5, v6, v7, 2u);
}

- (void)insertIconWhilePreservingQuads:toGridCellIndex:gridCellInfoOptions:mutationOptions:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  int v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_3(&dword_1D7F0A000, v2, v3, "%s ERROR: icon of class %{public}@ cannot be added to this model: %@", v4, v5, v6, v7, 2u);
}

- (void)_clusterIconsForSizeClass:(os_log_t)log behavior:gridCellInfoProvider:.cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1D7F0A000, log, OS_LOG_TYPE_ERROR, "Invalid layout when trying to cluster icons", v1, 2u);
}

- (void)_rotatedIconsFromList:(os_log_t)log gridCellInfoOptions:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D7F0A000, log, OS_LOG_TYPE_ERROR, "Missing icons after rotating! %@ vs %@", (uint8_t *)&v3, 0x16u);
}

@end