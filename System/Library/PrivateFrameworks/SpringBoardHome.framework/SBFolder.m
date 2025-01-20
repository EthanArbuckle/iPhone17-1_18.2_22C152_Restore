@interface SBFolder
+ (BOOL)isFolderNodeIdentifier:(id)a3;
+ (BOOL)isRootFolderClass;
+ (id)folderNodeIdentifierForUniqueIdentifier:(id)a3;
+ (unint64_t)listModelMutationOptionsForFolderMutationOptions:(unint64_t)a3;
- (BOOL)_compactListsAndFirst:(BOOL)a3;
- (BOOL)_compactsFirstList;
- (BOOL)_isCoalescingContentChanges;
- (BOOL)canAddIcon;
- (BOOL)canAddIcon:(id)a3;
- (BOOL)canAddIconCount:(unint64_t)a3;
- (BOOL)canAddIcons:(id)a3;
- (BOOL)canAddIcons:(id)a3 startingAtList:(id)a4;
- (BOOL)canBounceIcon:(id)a3;
- (BOOL)canEditDisplayName;
- (BOOL)canRemoveIcons;
- (BOOL)compactAllLists;
- (BOOL)compactLists;
- (BOOL)containsIcon:(id)a3;
- (BOOL)containsNodeIdentifier:(id)a3;
- (BOOL)containsNonDefaultSizedIcon;
- (BOOL)containsOneIcon;
- (BOOL)containsVisibleNonDefaultSizedIcon;
- (BOOL)containsVisibleWidgetIcon;
- (BOOL)containsWidgetIcon;
- (BOOL)containsWidgetWithExtensionBundleIdentifier:(id)a3;
- (BOOL)extraListContainsNodeIdentifier:(id)a3;
- (BOOL)hasHiddenLists;
- (BOOL)hasMultipleVisibleLists;
- (BOOL)hasMultipleVisibleNonTrailingEmptyLists;
- (BOOL)hasVisibleLists;
- (BOOL)iconListModel:(id)a3 isAllowedToContainIcon:(id)a4;
- (BOOL)iconListModel:(id)a3 isGridLayoutValid:(id)a4;
- (BOOL)isAllowedToContainIcon:(id)a3;
- (BOOL)isAllowedToContainIcons:(id)a3;
- (BOOL)isCancelable;
- (BOOL)isEmpty;
- (BOOL)isExtraList:(id)a3;
- (BOOL)isExtraListIndex:(unint64_t)a3;
- (BOOL)isFull;
- (BOOL)isIconStateDirty;
- (BOOL)isLibraryCategoryFolder;
- (BOOL)isRootFolder;
- (BOOL)isTrailingEmptyList:(id)a3;
- (BOOL)isTrailingEmptyListIndex:(unint64_t)a3;
- (BOOL)isValidIndexPath:(id)a3;
- (BOOL)isValidIndexPath:(id)a3 forInsertion:(BOOL)a4;
- (BOOL)isValidListIndex:(unint64_t)a3;
- (BOOL)isVisibleListIndex:(unint64_t)a3;
- (BOOL)listsAllowIndependentRotatedLayout;
- (BOOL)listsAllowRotatedLayout;
- (BOOL)replaceIcon:(id)a3 withIcon:(id)a4;
- (BOOL)replaceIcon:(id)a3 withIcon:(id)a4 options:(unint64_t)a5;
- (BOOL)replaceIconAtIndexPath:(id)a3 withIcon:(id)a4 options:(unint64_t)a5;
- (BOOL)shouldRemoveWhenEmpty;
- (Class)listModelClass;
- (NSArray)icons;
- (NSArray)iconsInLists;
- (NSArray)lists;
- (NSArray)trailingEmptyLists;
- (NSArray)visibleLists;
- (NSString)badge;
- (NSString)defaultDisplayName;
- (NSString)description;
- (NSString)displayName;
- (NSString)listRotatedLayoutClusterGridSizeClass;
- (NSString)nodeIdentifier;
- (NSString)recursiveDescription;
- (NSString)uniqueIdentifier;
- (SBFolder)folderWithIdentifier:(id)a3;
- (SBFolder)folderWithUniqueIdentifier:(id)a3;
- (SBFolder)init;
- (SBFolder)initWithDisplayName:(id)a3 maxListCount:(unint64_t)a4 listGridSize:(SBHIconGridSize)a5;
- (SBFolder)initWithDisplayName:(id)a3 maxListCount:(unint64_t)a4 listGridSize:(SBHIconGridSize)a5 iconGridSizeClassSizes:(id)a6;
- (SBFolder)initWithDisplayName:(id)a3 maxListCount:(unint64_t)a4 maxIconCountInLists:(unint64_t)a5;
- (SBFolder)initWithFolder:(id)a3 copyLeafIcons:(BOOL)a4;
- (SBFolder)initWithFolder:(id)a3 options:(unint64_t)a4;
- (SBFolder)initWithUniqueIdentifier:(id)a3 displayName:(id)a4 maxListCount:(unint64_t)a5 listGridSize:(SBHIconGridSize)a6;
- (SBFolder)initWithUniqueIdentifier:(id)a3 displayName:(id)a4 maxListCount:(unint64_t)a5 listGridSize:(SBHIconGridSize)a6 iconGridSizeClassSizes:(id)a7;
- (SBFolder)parentFolder;
- (SBFolder)rootFolder;
- (SBFolderIcon)icon;
- (SBHIconBadgeBehaviorProviding)badgeBehaviorProvider;
- (SBHIconBadgeBehaviorProviding)effectiveBadgeBehaviorProvider;
- (SBHIconGridSize)listGridSize;
- (SBHIconGridSize)listWithNonDefaultSizedIconsGridSize;
- (SBHIconGridSizeClassDomain)effectiveGridSizeClassDomain;
- (SBHIconGridSizeClassDomain)gridSizeClassDomain;
- (SBHIconGridSizeClassSet)listAllowedGridSizeClasses;
- (SBHIconGridSizeClassSizeMap)iconGridSizeClassSizes;
- (SBHIconGridSizeClassSizeMap)rotatedIconGridSizeClassSizes;
- (SBIcon)firstIcon;
- (SBIconListModel)firstList;
- (SBIconListModel)firstVisibleList;
- (SBIconListModel)lastList;
- (SBIconListModel)lastVisibleList;
- (SBIconListModel)leastRecentlyHiddenList;
- (SBIconListModel)mostRecentlyHiddenList;
- (SBTreeNode)parent;
- (id)_createNewList;
- (id)_createNewListWithIcon:(id)a3;
- (id)_createNewListWithIcons:(id)a3;
- (id)_createNewListWithIdentifier:(id)a3;
- (id)_handleBumpedIcons:(id)a3 afterInsertingIconIntoListAtIndex:(unint64_t)a4 listGridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6 didBump:(BOOL *)a7;
- (id)_indexPathToRevealForJiggleMode;
- (id)addEmptyList;
- (id)addEmptyListRemovingLeastRecentlyHiddenListIfNecessary;
- (id)addEmptyListWithIdentifier:(id)a3;
- (id)addIcon:(id)a3;
- (id)addIcon:(id)a3 options:(unint64_t)a4;
- (id)addIcon:(id)a3 options:(unint64_t)a4 listGridCellInfoOptions:(unint64_t)a5;
- (id)addIcon:(id)a3 toListAtIndex:(unint64_t)a4 options:(unint64_t)a5;
- (id)addIcon:(id)a3 toListAtIndex:(unint64_t)a4 options:(unint64_t)a5 didBump:(BOOL *)a6;
- (id)addIcons:(id)a3;
- (id)addIcons:(id)a3 options:(unint64_t)a4;
- (id)addListWithIcon:(id)a3;
- (id)addListWithIcons:(id)a3;
- (id)addListWithIcons:(id)a3 removingHiddenListsIfNecessary:(BOOL)a4;
- (id)allIcons;
- (id)changeGridSizeClassOfIconAtGridPath:(id)a3 toGridSizeClass:(id)a4 options:(unint64_t)a5 listGridCellInfoOptions:(unint64_t)a6;
- (id)changeGridSizeClassOfIconAtIndexPath:(id)a3 toGridSizeClass:(id)a4 options:(unint64_t)a5 listGridCellInfoOptions:(unint64_t)a6;
- (id)changeGridSizeOfList:(id)a3 toGridSize:(SBHIconGridSize)a4 options:(unint64_t)a5;
- (id)changeGridSizeOfListAtIndex:(unint64_t)a3 toGridSize:(SBHIconGridSize)a4 options:(unint64_t)a5;
- (id)containedNodeIdentifiers;
- (id)copyWithOptions:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)directlyContainedFolderContainingList:(id)a3;
- (id)firstFolderWithDefaultDisplayName:(id)a3;
- (id)firstFolderWithDisplayName:(id)a3;
- (id)firstFolderWithUniqueIdentifier:(id)a3;
- (id)firstFolderWithUniqueIdentifier:(id)a3 displayName:(id)a4 defaultDisplayName:(id)a5;
- (id)folderContainingGridPath:(id)a3;
- (id)folderContainingIndexPath:(id)a3 relativeIndexPath:(id *)a4;
- (id)folderIcons;
- (id)gridPathForFirstFreeSlotAvoidingFirstList:(BOOL)a3 listGridCellInfoOptions:(unint64_t)a4;
- (id)gridPathForFirstFreeSlotOfRangeOfSizeClass:(id)a3 avoidingFirstList:(BOOL)a4 listGridCellInfoOptions:(unint64_t)a5;
- (id)gridPathForFirstFreeSlotOfRangeOfSizeClass:(id)a3 startingAtList:(id)a4 avoidingFirstList:(BOOL)a5 searchForwards:(BOOL)a6 listGridCellInfoOptions:(unint64_t)a7;
- (id)gridPathForFirstFreeSlotOfRangeOfSizeClass:(id)a3 startingAtList:(id)a4 listGridCellInfoOptions:(unint64_t)a5;
- (id)gridPathForFirstFreeSlotStartingAtList:(id)a3 avoidingFirstList:(BOOL)a4 listGridCellInfoOptions:(unint64_t)a5;
- (id)gridPathForIcon:(id)a3 listGridCellInfoOptions:(unint64_t)a4;
- (id)gridPathForIndexPath:(id)a3 listGridCellInfoOptions:(unint64_t)a4;
- (id)gridPathForLastFreeSlotAvoidingFirstList:(BOOL)a3 listGridCellInfoOptions:(unint64_t)a4;
- (id)gridPathForLastFreeSlotStartingAtList:(id)a3 avoidingFirstList:(BOOL)a4 listGridCellInfoOptions:(unint64_t)a5;
- (id)gridPathForRelativePath:(id)a3;
- (id)gridPathWithList:(id)a3 gridCellIndex:(unint64_t)a4 listGridCellInfoOptions:(unint64_t)a5;
- (id)gridPathWithListAtIndex:(unint64_t)a3 gridCellIndex:(unint64_t)a4 listGridCellInfoOptions:(unint64_t)a5;
- (id)gridPathWithListAtIndexPath:(id)a3 gridCellIndex:(unint64_t)a4 listGridCellInfoOptions:(unint64_t)a5;
- (id)gridPathsForIndexPaths:(id)a3 listGridCellInfoOptions:(unint64_t)a4;
- (id)iconAtGridPath:(id)a3;
- (id)iconAtIndexPath:(id)a3;
- (id)iconListModel:(id)a3 shouldBounceIcon:(id)a4 afterInsertingIcons:(id)a5;
- (id)iconWithIdentifier:(id)a3;
- (id)iconsOfClass:(Class)a3;
- (id)iconsPassingTest:(id)a3;
- (id)indexPathForApplicationIconWithBundleIdentifier:(id)a3;
- (id)indexPathForFirstFreeSlotAvoidingFirstList:(BOOL)a3;
- (id)indexPathForFirstFreeSlotStartingAtList:(id)a3 avoidingFirstList:(BOOL)a4;
- (id)indexPathForFirstFreeSlotStartingAtList:(id)a3 avoidingFirstList:(BOOL)a4 searchForwards:(BOOL)a5;
- (id)indexPathForFolder:(id)a3;
- (id)indexPathForGridPath:(id)a3;
- (id)indexPathForIcon:(id)a3;
- (id)indexPathForIcon:(id)a3 includingPlaceholders:(BOOL)a4;
- (id)indexPathForIconPassingTest:(id)a3;
- (id)indexPathForIconWithIdentifier:(id)a3 includingPlaceholders:(BOOL)a4;
- (id)indexPathForIconWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)indexPathForLastFreeSlotAvoidingFirstList:(BOOL)a3;
- (id)indexPathForLastFreeSlotStartingAtList:(id)a3 avoidingFirstList:(BOOL)a4;
- (id)indexPathForList:(id)a3;
- (id)indexPathForNodeIdentifier:(id)a3;
- (id)indexPathForRelativePath:(id)a3;
- (id)indexPathsForApplicationIconsWithBundleIdentifier:(id)a3;
- (id)indexPathsForContainedNodeIdentifier:(id)a3 prefixPath:(id)a4;
- (id)indexPathsForIcon:(id)a3;
- (id)indexPathsForIconWithIdentifier:(id)a3;
- (id)indexPathsForIconsPassingTest:(id)a3;
- (id)indexPathsForIconsWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)indexesOfListsPassingTest:(id)a3;
- (id)insertEmptyListAtIndex:(unint64_t)a3;
- (id)insertEmptyListRemovingLeastRecentlyHiddenListIfNecessaryAtIndex:(unint64_t)a3;
- (id)insertIcon:(id)a3 afterIcon:(id)a4 options:(unint64_t)a5 listGridCellInfoOptions:(unint64_t)a6;
- (id)insertIcon:(id)a3 atGridPath:(id)a4 options:(unint64_t)a5;
- (id)insertIcon:(id)a3 atIndexPath:(id *)a4 options:(unint64_t)a5;
- (id)insertIcon:(id)a3 beforeIcon:(id)a4 options:(unint64_t)a5 listGridCellInfoOptions:(unint64_t)a6;
- (id)insertIcons:(id)a3 atGridPath:(id)a4 options:(unint64_t)a5;
- (id)insertIcons:(id)a3 atIndexPath:(id)a4 options:(unint64_t)a5;
- (id)layerForListIndex:(unint64_t)a3 gridSize:(SBHIconGridSize)a4 iconImageInfo:(SBIconImageInfo *)a5 cellSpacing:(CGSize)a6 imageAppearance:(id)a7 cellProvider:(id)a8;
- (id)layerForListIndex:(unint64_t)a3 listLayout:(id)a4 imageAppearance:(id)a5;
- (id)layerForListIndex:(unint64_t)a3 listLayout:(id)a4 imageAppearance:(id)a5 cellProvider:(id)a6;
- (id)layerForListIndex:(unint64_t)a3 listLayout:(id)a4 traitCollection:(id)a5;
- (id)layoutDescription;
- (id)layoutDescriptionWithOptions:(unint64_t)a3;
- (id)leafIcons;
- (id)listAtGridPath:(id)a3;
- (id)listAtIndex:(unint64_t)a3;
- (id)listAtIndexPath:(id)a3;
- (id)listAtRelativePath:(id)a3;
- (id)listAtVisibleIndex:(unint64_t)a3;
- (id)listContainingIndexPath:(id)a3 relativeIndex:(unint64_t *)a4;
- (id)listWithGreatestHiddenDateMatchingOrdering:(int64_t)a3;
- (id)listWithIdentifier:(id)a3;
- (id)listWithIdentifier:(id)a3 inFolderWithIdentifier:(id)a4;
- (id)listsContainingIcon:(id)a3;
- (id)listsContainingLeafIconWithIdentifier:(id)a3;
- (id)nextListAfterIndex:(unint64_t)a3;
- (id)nextVisibleListAfterIndex:(unint64_t)a3;
- (id)nodeDescriptionWithPrefix:(id)a3;
- (id)nodesAlongIndexPath:(id)a3 consumedIndexes:(unint64_t)a4;
- (id)precedingListBeforeIndex:(unint64_t)a3;
- (id)relativePathForIcon:(id)a3 listGridCellInfoOptions:(unint64_t)a4;
- (id)replaceIcon:(id)a3 withIcons:(id)a4 options:(unint64_t)a5;
- (id)replaceIcon:(id)a3 withIcons:(id)a4 options:(unint64_t)a5 listGridCellInfoOptions:(unint64_t)a6;
- (id)resolvedComponentsForIndexPath:(id)a3;
- (id)resolvedComponentsForUniqueIdentifierPath:(id)a3;
- (id)rotatedLayoutDescription;
- (id)setListsFromFolder:(id)a3;
- (id)sortedAndBucketedGridPaths:(id)a3;
- (id)sortedGridPaths:(id)a3;
- (id)startCoalescingContentChangesForReason:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)uniqueIdentifiersForIndexPath:(id)a3;
- (id)validatedGridPathForInsertionGridPath:(id)a3 avoidingFirstList:(BOOL)a4;
- (id)validatedIndexPathForInsertionIndexPath:(id)a3 avoidingFirstList:(BOOL)a4;
- (id)visibleListIndexes;
- (int64_t)listsFixedIconLocationBehavior;
- (unint64_t)firstIndexOfListPassingTest:(id)a3;
- (unint64_t)firstVisibleListIndex;
- (unint64_t)hiddenIndexOfList:(id)a3;
- (unint64_t)hiddenListCount;
- (unint64_t)iconCount;
- (unint64_t)iconCountWithOptions:(unint64_t)a3;
- (unint64_t)indexForVisibleIndex:(unint64_t)a3;
- (unint64_t)indexOfList:(id)a3;
- (unint64_t)indexOfListContainingIcon:(id)a3;
- (unint64_t)indexOfListWithIdentifier:(id)a3;
- (unint64_t)lastVisibleListIndex;
- (unint64_t)lastVisibleNonEmptyListIndex;
- (unint64_t)listCount;
- (unint64_t)listsIconLayoutBehavior;
- (unint64_t)maxListCount;
- (unint64_t)nextListIndexAfterIndex:(unint64_t)a3;
- (unint64_t)nextVisibleListIndexAfterIndex:(unint64_t)a3;
- (unint64_t)precedingListIndexBeforeIndex:(unint64_t)a3;
- (unint64_t)precedingVisibleListIndexBeforeIndex:(unint64_t)a3;
- (unint64_t)requiredTrailingEmptyListCount;
- (unint64_t)trailingEmptyListCount;
- (unint64_t)trailingVisibleEmptyListCount;
- (unint64_t)visibleIconCount;
- (unint64_t)visibleIndexForIndex:(unint64_t)a3;
- (unint64_t)visibleIndexOfList:(id)a3;
- (unint64_t)visibleListCount;
- (unint64_t)visibleWidgetIconCount;
- (void)_addList:(id)a3;
- (void)_compactContiguousOverflowListsStartingAtListIndex:(unint64_t)a3 withoutMovingIconsPassingTest:(id)a4 removeEmptyLists:(BOOL)a5;
- (void)_didAddList:(id)a3 informObservers:(BOOL)a4;
- (void)_didRemoveList:(id)a3 atIndex:(unint64_t)a4 informObservers:(BOOL)a5;
- (void)_informObserversOfAddedIcons:(id)a3 removedIcons:(id)a4;
- (void)_informObserversOfMovedIcon:(id)a3;
- (void)_informObserversOfToBeAddedIcon:(id)a3;
- (void)_insertList:(id)a3 atIndex:(unint64_t)a4;
- (void)_removeLists:(id)a3;
- (void)_setLists:(id)a3;
- (void)_swapInsertIcons:(id)a3 atIndexPaths:(id)a4;
- (void)_swapRestoreIconCount:(unint64_t)a3 toLocation:(id)a4;
- (void)_updateOverflowCountInList:(id)a3 forInsertingIcon:(id)a4 removingIcon:(id)a5 options:(unint64_t)a6;
- (void)_updateOverflowCountInList:(id)a3 forResizingIcon:(id)a4 fromGridSizeClass:(id)a5 options:(unint64_t)a6;
- (void)_willAddList:(id)a3;
- (void)_willRemoveList:(id)a3 atIndex:(unint64_t)a4 informObservers:(BOOL)a5;
- (void)addFolderObserver:(id)a3;
- (void)addIconsOfClass:(Class)a3 toSet:(id)a4;
- (void)addIconsPassingTest:(id)a3 toSet:(id)a4;
- (void)addNodeObserver:(id)a3;
- (void)appendRecursiveDescriptionToString:(id)a3 prefixPath:(id)a4;
- (void)compactListsInDescendents;
- (void)compactOverflowLists;
- (void)compactOverflowListsAndRemoveEmptyLists:(BOOL)a3;
- (void)compactOverflowListsWithoutMovingIconsPassingTest:(id)a3;
- (void)compactOverflowListsWithoutMovingIconsPassingTest:(id)a3 removeEmptyLists:(BOOL)a4;
- (void)didAddFolder:(id)a3;
- (void)didExplicitlyRemoveIcon:(id)a3 fromList:(id)a4 inFolder:(id)a5 options:(unint64_t)a6;
- (void)didRemoveFolder:(id)a3;
- (void)ensureTrailingEmptyLists;
- (void)enumerateAllIconsUsingBlock:(id)a3;
- (void)enumerateAllIconsWithBaseIndexPath:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumerateAllIconsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateListsForSearchingForFirstFreeSlotStartingAtList:(id)a3 avoidingFirstList:(BOOL)a4 searchForwards:(BOOL)a5 block:(id)a6;
- (void)enumerateListsNearestToList:(id)a3 usingBlock:(id)a4;
- (void)enumerateListsUsingBlock:(id)a3;
- (void)enumerateListsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateVisibleListsUsingBlock:(id)a3;
- (void)folder:(id)a3 didAddIcons:(id)a4 removedIcons:(id)a5;
- (void)folder:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5;
- (void)folder:(id)a3 willAddIcon:(id)a4;
- (void)iconList:(id)a3 didAddIcon:(id)a4;
- (void)iconList:(id)a3 didInvalidateLayoutWithGridCellInfoOptions:(unint64_t)a4;
- (void)iconList:(id)a3 didMoveIcon:(id)a4;
- (void)iconList:(id)a3 didRemoveIcon:(id)a4;
- (void)iconList:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5;
- (void)iconList:(id)a3 willAddIcon:(id)a4;
- (void)iconListHiddenDidChange:(id)a3;
- (void)iconListHiddenWillChange:(id)a3;
- (void)list:(id)a3 didAddContainedNodeIdentifiers:(id)a4;
- (void)list:(id)a3 didRemoveContainedNodeIdentifiers:(id)a4;
- (void)listDidMoveNodes:(id)a3;
- (void)markIconStateClean;
- (void)markIconStateDirty;
- (void)moveListAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4;
- (void)pruneEmptyFolders;
- (void)removeAllLists;
- (void)removeFolderObserver:(id)a3;
- (void)removeHiddenLists;
- (void)removeIcon:(id)a3 options:(unint64_t)a4;
- (void)removeIcon:(id)a3 options:(unint64_t)a4 listGridCellInfoOptions:(unint64_t)a5;
- (void)removeIconAtIndexPath:(id)a3 options:(unint64_t)a4;
- (void)removeIcons:(id)a3 options:(unint64_t)a4;
- (void)removeIcons:(id)a3 options:(unint64_t)a4 listGridCellInfoOptions:(unint64_t)a5;
- (void)removeLastList;
- (void)removeLeastRecentlyHiddenList;
- (void)removeList:(id)a3;
- (void)removeListAtIndex:(unint64_t)a3;
- (void)removeListsAtIndexes:(id)a3;
- (void)removeNodeObserver:(id)a3;
- (void)removeTransactionAssertion:(id)a3;
- (void)replaceIconAtGridPath:(id)a3 withIcon:(id)a4 options:(unint64_t)a5;
- (void)setBadge:(id)a3;
- (void)setBadgeBehaviorProvider:(id)a3;
- (void)setCancelable:(BOOL)a3;
- (void)setDefaultDisplayName:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setGridSizeClassDomain:(id)a3;
- (void)setIcon:(id)a3;
- (void)setListAllowedGridSizeClasses:(id)a3;
- (void)setListRotatedLayoutClusterGridSizeClass:(id)a3;
- (void)setListWithNonDefaultSizedIconsGridSize:(SBHIconGridSize)a3;
- (void)setListsAllowIndependentRotatedLayout:(BOOL)a3;
- (void)setListsAllowRotatedLayout:(BOOL)a3;
- (void)setListsFixedIconLocationBehavior:(int64_t)a3;
- (void)setListsIconLayoutBehavior:(unint64_t)a3;
- (void)setParent:(id)a3;
- (void)setRequiredTrailingEmptyListCount:(unint64_t)a3;
- (void)setRotatedIconGridSizeClassSizes:(id)a3;
- (void)sort;
- (void)swapIcon:(id)a3 withIcon:(id)a4 options:(unint64_t)a5;
- (void)swapIconAtIndexPath:(id)a3 withIconAtIndexPath:(id)a4 options:(unint64_t)a5;
@end

@implementation SBFolder

- (unint64_t)visibleListCount
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t result = self->_visibleListCount;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_visibleListCount = 0;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v4 = self->_lists;
    uint64_t v5 = [(SBIconIndexMutableList *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
          if ((objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8), "isHidden", (void)v9) & 1) == 0) {
            ++self->_visibleListCount;
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [(SBIconIndexMutableList *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }

    return self->_visibleListCount;
  }
  return result;
}

uint64_t __43__SBFolder_nextVisibleListIndexAfterIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isHidden];
  if ((result & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (id)listAtVisibleIndex:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v4 = self->_lists;
  uint64_t v5 = [(SBIconIndexMutableList *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v5)
  {
LABEL_11:

    long long v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    v13 = objc_msgSend(NSString, "stringWithFormat:", @"Bad visible index %lu", a3);
    id v14 = [v11 exceptionWithName:v12 reason:v13 userInfo:0];

    objc_exception_throw(v14);
  }
  uint64_t v6 = v5;
  uint64_t v7 = 0;
  uint64_t v8 = *(void *)v18;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v18 != v8) {
      objc_enumerationMutation(v4);
    }
    long long v10 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
    if ([v10 isHidden]) {
      goto LABEL_9;
    }
    if (v7 == a3) {
      break;
    }
    ++v7;
LABEL_9:
    if (v6 == ++v9)
    {
      uint64_t v6 = [(SBIconIndexMutableList *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (!v6) {
        goto LABEL_11;
      }
      goto LABEL_3;
    }
  }
  id v15 = v10;

  return v15;
}

- (unint64_t)visibleIndexOfList:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isHidden])
  {
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = self->_lists;
    uint64_t v7 = [(SBIconIndexMutableList *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      unint64_t v5 = 0;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(id *)(*((void *)&v13 + 1) + 8 * i);
          if ((objc_msgSend(v11, "isHidden", (void)v13) & 1) == 0)
          {
            if (v11 == v4) {
              goto LABEL_14;
            }
            ++v5;
          }
        }
        uint64_t v8 = [(SBIconIndexMutableList *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:
  }
  return v5;
}

- (SBHIconGridSizeClassDomain)effectiveGridSizeClassDomain
{
  v2 = self->_gridSizeClassDomain;
  if (!v2)
  {
    v2 = +[SBHIconGridSizeClassDomain globalDomain];
  }
  return v2;
}

- (BOOL)compactLists
{
  v2 = self;
  v3 = [(SBFolder *)self startCoalescingContentChangesForReason:@"SBCompactListsCoalesceID"];
  [(SBFolder *)v2 compactOverflowLists];
  LOBYTE(v2) = [(SBFolder *)v2 _compactListsAndFirst:[(SBFolder *)v2 _compactsFirstList]];
  [v3 invalidate];

  return (char)v2;
}

- (void)compactOverflowLists
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __32__SBFolder_compactOverflowLists__block_invoke;
  v2[3] = &unk_1E6AAF030;
  v2[4] = self;
  [(SBFolder *)self enumerateVisibleListsUsingBlock:v2];
}

- (BOOL)_compactListsAndFirst:(BOOL)a3
{
  unint64_t v5 = [(SBIconIndexMutableList *)self->_lists count];
  unint64_t v6 = [(SBFolder *)self requiredTrailingEmptyListCount];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  char v25 = 0;
  lists = self->_lists;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __34__SBFolder__compactListsAndFirst___block_invoke;
  long long v19 = &unk_1E6AAF098;
  v21 = v24;
  uint64_t v22 = &v26;
  BOOL v23 = a3;
  id v9 = v7;
  id v20 = v9;
  [(SBIconIndexMutableList *)lists enumerateNodesWithOptions:2 usingBlock:&v16];
  unint64_t v10 = objc_msgSend(v9, "count", v16, v17, v18, v19);
  if (v10 && v10 == [(SBFolder *)self visibleListCount])
  {
    [v9 removeObjectAtIndex:0];
  }
  else if (v6)
  {
    unint64_t v11 = v27[3];
    if (v11 - 1 < v10)
    {
      if (v11 >= v6) {
        unint64_t v12 = v6;
      }
      else {
        unint64_t v12 = v27[3];
      }
      objc_msgSend(v9, "removeObjectsInRange:", v10 - v11, v12);
    }
  }
  [(SBFolder *)self _removeLists:v9];
  if (![(SBFolder *)self visibleListCount]) {
    id v13 = [(SBFolder *)self addEmptyList];
  }
  [(SBFolder *)self ensureTrailingEmptyLists];
  BOOL v14 = v5 != [(SBIconIndexMutableList *)self->_lists count];

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);
  return v14;
}

- (void)ensureTrailingEmptyLists
{
  unint64_t v3 = [(SBFolder *)self trailingEmptyListCount];
  unint64_t v4 = [(SBFolder *)self requiredTrailingEmptyListCount];
  BOOL v5 = v4 >= v3;
  unint64_t v6 = v4 - v3;
  if (v6 != 0 && v5)
  {
    do
    {
      id v7 = [(SBFolder *)self addEmptyList];
      --v6;
    }
    while (v6);
  }
}

- (unint64_t)trailingEmptyListCount
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lists = self->_lists;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__SBFolder_trailingEmptyListCount__block_invoke;
  v5[3] = &unk_1E6AAD3D8;
  v5[4] = &v6;
  [(SBIconIndexMutableList *)lists enumerateNodesWithOptions:2 usingBlock:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_removeLists:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [MEMORY[0x1E4F28E60] indexSet];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v45 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        unint64_t v13 = [(SBIconIndexMutableList *)self->_lists indexOfNode:v12];
        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v14 = v13;
          [v6 addIndex:v13];
          [v5 addObject:v12];
          [(SBFolder *)self _willRemoveList:v12 atIndex:v14 informObservers:0];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v44 objects:v51 count:16];
    }
    while (v9);
  }

  if ([v5 count])
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v15 = [(NSHashTable *)self->_folderObservers allObjects];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v50 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v41 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = *(void **)(*((void *)&v40 + 1) + 8 * j);
          if (objc_opt_respondsToSelector()) {
            [v20 folder:self willRemoveLists:v5 atIndexes:v6];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v40 objects:v50 count:16];
      }
      while (v17);
    }
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v21 = v5;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v49 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v37;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v37 != v24) {
          objc_enumerationMutation(v21);
        }
        [(SBFolder *)self _didRemoveList:*(void *)(*((void *)&v36 + 1) + 8 * k) atIndex:[(SBIconIndexMutableList *)self->_lists indexOfNode:*(void *)(*((void *)&v36 + 1) + 8 * k)] informObservers:0];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v36 objects:v49 count:16];
    }
    while (v23);
  }

  [(SBIconIndexMutableList *)self->_lists removeNodesAtIndexes:v6];
  self->_visibleListCount = 0x7FFFFFFFFFFFFFFFLL;
  if ([v21 count])
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v26 = [(NSHashTable *)self->_folderObservers allObjects];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v32 objects:v48 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v33;
      do
      {
        for (uint64_t m = 0; m != v28; ++m)
        {
          if (*(void *)v33 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = *(void **)(*((void *)&v32 + 1) + 8 * m);
          if (objc_opt_respondsToSelector()) {
            [v31 folder:self didRemoveLists:v21 atIndexes:v6];
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v32 objects:v48 count:16];
      }
      while (v28);
    }

    [(SBFolder *)self markIconStateDirty];
  }
}

- (BOOL)containsIcon:(id)a3
{
  id v4 = [a3 nodeIdentifier];
  LOBYTE(self) = [(SBFolder *)self containsNodeIdentifier:v4];

  return (char)self;
}

- (unint64_t)indexForVisibleIndex:(unint64_t)a3
{
  id v4 = [(SBFolder *)self listAtVisibleIndex:a3];
  unint64_t v5 = [(SBFolder *)self indexOfList:v4];

  return v5;
}

- (BOOL)hasVisibleLists
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_lists;
  uint64_t v3 = [(SBIconIndexMutableList *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
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
        if (!objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "isHidden", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(SBIconIndexMutableList *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (unint64_t)indexOfList:(id)a3
{
  if (a3) {
    return -[SBIconIndexMutableList indexOfNode:](self->_lists, "indexOfNode:");
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (id)indexPathForIcon:(id)a3
{
  uint64_t v4 = [a3 nodeIdentifier];
  unint64_t v5 = [(SBFolder *)self indexPathForNodeIdentifier:v4];

  return v5;
}

- (id)indexPathForNodeIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = objc_msgSend(MEMORY[0x1E4F28D58], "bs_emptyPath");
  uint64_t v6 = [(SBFolder *)self indexPathsForContainedNodeIdentifier:v4 prefixPath:v5];

  long long v7 = [v6 anyObject];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
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
        unint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v7, "compare:", v13, (void)v16) == 1)
        {
          id v14 = v13;

          long long v7 = v14;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)indexPathsForContainedNodeIdentifier:(id)a3 prefixPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBFolder *)self nodeIdentifier];
  int v9 = [v8 isEqual:v6];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F1CA80] setWithObject:v7];
  }
  else
  {
    uint64_t v11 = [(SBIconIndexMutableList *)self->_lists indexPathsForContainedNodeIdentifier:v6 prefixPath:v7];
    if (!v11)
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA80] set];
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __60__SBFolder_indexPathsForContainedNodeIdentifier_prefixPath___block_invoke;
    v15[3] = &unk_1E6AAF640;
    id v16 = v6;
    id v17 = v7;
    id v12 = v11;
    id v18 = v12;
    [(SBFolder *)self enumerateExtraListsUsingBlock:v15];
    unint64_t v13 = v18;
    id v10 = v12;
  }
  return v10;
}

void __60__SBFolder_indexPathsForContainedNodeIdentifier_prefixPath___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if ([v8 containsNodeIdentifier:*(void *)(a1 + 32)])
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [*(id *)(a1 + 40) indexPathByAddingIndex:a3];
    id v7 = [v8 indexPathsForContainedNodeIdentifier:v5 prefixPath:v6];
  }
  else
  {
    id v7 = 0;
  }
  [*(id *)(a1 + 48) unionSet:v7];
}

- (NSString)nodeIdentifier
{
  return self->_nodeIdentifier;
}

- (BOOL)containsNodeIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBFolder *)self nodeIdentifier];
  char v6 = [v5 isEqual:v4];

  BOOL v7 = (v6 & 1) != 0
    || [(SBIconIndexMutableList *)self->_lists containsNodeIdentifier:v4]
    || [(SBFolder *)self extraListContainsNodeIdentifier:v4];

  return v7;
}

- (NSArray)lists
{
  return (NSArray *)[(SBIconIndexMutableList *)self->_lists nodes];
}

- (void)addFolderObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    BOOL v5 = [(NSHashTable *)self->_folderObservers containsObject:v4];
    id v4 = v6;
    if (!v5)
    {
      [(NSHashTable *)self->_folderObservers addObject:v6];
      id v4 = v6;
    }
  }
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(SBFolder *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBFolder *)self succinctDescriptionBuilder];
  BOOL v5 = [(SBFolder *)self displayName];
  id v6 = (id)[v4 appendObject:v5 withName:@"displayName"];

  id v7 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[SBFolder listCount](self, "listCount"), @"listCount");
  unint64_t v8 = [(SBFolder *)self requiredTrailingEmptyListCount];
  if (v8) {
    id v9 = (id)[v4 appendUnsignedInteger:v8 withName:@"requiredTrailingEmptyListCount"];
  }
  id v10 = SBHStringForIconGridSize(*(_DWORD *)&self->_listGridSize);
  id v11 = (id)[v4 appendObject:v10 withName:@"listGridSize"];

  id v12 = (id)[v4 appendObject:self->_iconGridSizeClassSizes withName:@"iconGridSizeClassSizes"];
  return v4;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (unint64_t)requiredTrailingEmptyListCount
{
  return self->_requiredTrailingEmptyListCount;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

uint64_t __34__SBFolder_trailingEmptyListCount__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isEmptyIgnoringPlaceholders];
  if (result) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else {
    *a4 = 1;
  }
  return result;
}

- (id)layerForListIndex:(unint64_t)a3 listLayout:(id)a4 imageAppearance:(id)a5 cellProvider:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  unint64_t v13 = [(SBFolder *)self listAtIndex:a3];
  id v14 = [v13 folderLayerWithListLayout:v12 imageAppearance:v11 cellProvider:v10];

  return v14;
}

void __34__SBFolder__compactListsAndFirst___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  int v5 = [v7 isEmptyIgnoringPlaceholders];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  if (!v5)
  {
    *(unsigned char *)(v6 + 24) = 1;
    goto LABEL_9;
  }
  if (*(unsigned char *)(v6 + 24))
  {
    if (a3) {
      goto LABEL_8;
    }
LABEL_7:
    if (!*(unsigned char *)(a1 + 56)) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (!a3) {
    goto LABEL_7;
  }
LABEL_8:
  [*(id *)(a1 + 32) insertObject:v7 atIndex:0];
LABEL_9:
}

- (void)enumerateVisibleListsUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void *, unint64_t, unsigned char *))a3;
  unint64_t v5 = [(SBFolder *)self firstVisibleListIndex];
  if ([(SBFolder *)self isValidListIndex:v5])
  {
    do
    {
      uint64_t v6 = [(SBFolder *)self listAtIndex:v5];
      unsigned __int8 v8 = 0;
      v4[2](v4, v6, v5, &v8);
      int v7 = v8;

      if (v7) {
        break;
      }
      unint64_t v5 = [(SBFolder *)self nextVisibleListIndexAfterIndex:v5];
    }
    while ([(SBFolder *)self isValidListIndex:v5]);
  }
}

- (unint64_t)nextVisibleListIndexAfterIndex:(unint64_t)a3
{
  unint64_t v5 = [(SBFolder *)self listCount];
  unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 > a3)
  {
    int v7 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", a3 + 1, v5 - (a3 + 1));
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x2020000000;
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    lists = self->_lists;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __43__SBFolder_nextVisibleListIndexAfterIndex___block_invoke;
    v10[3] = &unk_1E6AAD3D8;
    v10[4] = &v11;
    [(SBIconIndexMutableList *)lists enumerateNodesAtIndexes:v7 options:0 usingBlock:v10];
    unint64_t v6 = v12[3];
    _Block_object_dispose(&v11, 8);
  }
  return v6;
}

- (BOOL)isValidListIndex:(unint64_t)a3
{
  if ([(SBFolder *)self listCount] > a3) {
    return 1;
  }
  return [(SBFolder *)self isExtraListIndex:a3];
}

- (unint64_t)listCount
{
  return [(SBIconIndexMutableList *)self->_lists count];
}

uint64_t __32__SBFolder_compactOverflowLists__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _compactContiguousOverflowListsStartingAtListIndex:a3 withoutMovingIconsPassingTest:0 removeEmptyLists:0];
}

- (id)folderContainingIndexPath:(id)a3 relativeIndexPath:(id *)a4
{
  id v6 = a3;
  if ([v6 length])
  {
    int v7 = objc_msgSend(v6, "bs_subpathFromPosition:", 2);
    if ([v7 length])
    {
      if (v6)
      {
        unsigned __int8 v8 = -[SBFolder listAtIndex:](self, "listAtIndex:", [v6 sbListIndex]);
        uint64_t v9 = [v6 sbIconIndex];
      }
      else
      {
        uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
        unsigned __int8 v8 = [(SBFolder *)self listAtIndex:0x7FFFFFFFFFFFFFFFLL];
      }
      uint64_t v11 = [v8 iconAtIndex:v9];
      if ([v11 isFolderIcon])
      {
        id v12 = [v11 folder];
        id v10 = [v12 folderContainingIndexPath:v7 relativeIndexPath:a4];
      }
      else
      {
        id v10 = 0;
      }
    }
    else
    {
      id v10 = self;
      if (a4) {
        *a4 = v6;
      }
    }
  }
  else
  {
    id v10 = 0;
    if (a4) {
      *a4 = v6;
    }
  }

  return v10;
}

- (void)_compactContiguousOverflowListsStartingAtListIndex:(unint64_t)a3 withoutMovingIconsPassingTest:(id)a4 removeEmptyLists:(BOOL)a5
{
  BOOL v30 = a5;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v31 = [(SBFolder *)self startCoalescingContentChangesForReason:@"SBRestoreOverflowIconsCoalesceID"];
  unsigned __int8 v8 = [(SBFolder *)self listAtIndex:a3];
  long long v32 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v9 = [(SBFolder *)self nextVisibleListIndexAfterIndex:a3];
  if ([(SBFolder *)self isValidListIndex:v9])
  {
    id v10 = [(SBFolder *)self listAtIndex:v9];
  }
  else
  {
    id v10 = 0;
  }
  if ([v10 overflowSlotCount])
  {
    uint64_t v11 = &v44;
    id v34 = v7;
    do
    {
      unint64_t v33 = v9;
      unint64_t v38 = [v10 overflowSlotCount];
      long long v35 = v10;
      do
      {
        if (v7)
        {
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = __110__SBFolder__compactContiguousOverflowListsStartingAtListIndex_withoutMovingIconsPassingTest_removeEmptyLists___block_invoke;
          v43[3] = &unk_1E6AAF178;
          id v44 = v7;
          [v10 directlyContainedIconPassingTest:v43];
        }
        else
        {
          [v10 firstIcon];
        id v12 = };
        if (v12 && [v8 allowsAddingIcon:v12 ignoringPlaceholders:0])
        {
          long long v37 = v11;
          uint64_t v13 = [v10 iconGridSizeClassSizes];
          uint64_t v14 = [v12 gridSizeClass];
          unsigned int v15 = [v13 gridSizeForGridSizeClass:v14];

          unint64_t v36 = v36 & 0xFFFFFFFF00000000 | v15;
          unsigned int Area = SBHIconGridSizeGetArea(v15);
          if (v38 >= Area)
          {
            unsigned int v18 = Area;
            long long v41 = 0u;
            long long v42 = 0u;
            long long v39 = 0u;
            long long v40 = 0u;
            long long v19 = [(NSHashTable *)self->_folderObservers allObjects];
            uint64_t v20 = [v19 countByEnumeratingWithState:&v39 objects:v45 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = *(void *)v40;
              do
              {
                for (uint64_t i = 0; i != v21; ++i)
                {
                  if (*(void *)v40 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  uint64_t v24 = *(void **)(*((void *)&v39 + 1) + 8 * i);
                  if (objc_opt_respondsToSelector()) {
                    [v24 folder:self willRestoreOverflowIcon:v12 toList:v8];
                  }
                }
                uint64_t v21 = [v19 countByEnumeratingWithState:&v39 objects:v45 count:16];
              }
              while (v21);
            }

            id v10 = v35;
            objc_msgSend(v35, "removeIconAtIndex:options:", objc_msgSend(v35, "indexForIcon:", v12), 0x100000);
            [v8 addIcon:v12];
            v38 -= v18;
            char v17 = 1;
            id v7 = v34;
          }
          else
          {
            char v17 = 0;
          }
          uint64_t v11 = v37;
        }
        else
        {
          char v17 = 0;
        }

        if (v7) {
      }
        }
      while ((v17 & 1) != 0);
      id v25 = (id)[v10 _updateModelByRepairingGapsIfNecessary];
      [v10 setOverflowSlotCount:v38];
      if (![v10 numberOfIcons]) {
        [v32 addObject:v10];
      }
      id v26 = v10;

      unint64_t v9 = [(SBFolder *)self nextVisibleListIndexAfterIndex:v33];
      if ([(SBFolder *)self isValidListIndex:v9])
      {
        id v10 = [(SBFolder *)self listAtIndex:v9];
      }
      else
      {
        id v10 = 0;
      }

      unsigned __int8 v8 = v26;
    }
    while ([v10 overflowSlotCount]);
  }
  else
  {
    id v26 = v8;
  }
  if (v30)
  {
    uint64_t v27 = [v32 count];
    if (v27)
    {
      uint64_t v28 = v27 - 1;
      do
      {
        uint64_t v29 = [v32 objectAtIndex:v28];
        if ([v29 numberOfIcons]) {
          [v32 removeObjectAtIndex:v28];
        }

        --v28;
      }
      while (v28 != -1);
    }
    [(SBFolder *)self _removeLists:v32];
  }
  [v31 invalidate];
}

- (unint64_t)visibleIndexForIndex:(unint64_t)a3
{
  id v4 = [(SBFolder *)self listAtIndex:a3];
  unint64_t v5 = [(SBFolder *)self visibleIndexOfList:v4];

  return v5;
}

- (id)listAtIndex:(unint64_t)a3
{
  return [(SBIconIndexMutableList *)self->_lists nodeAtIndex:a3];
}

- (void)removeTransactionAssertion:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(SBFolderTransaction *)self->_coalesceChangesTransaction removeAssertion:a3];
  coalesceChangesTransaction = self->_coalesceChangesTransaction;
  if (coalesceChangesTransaction
    && ![(SBFolderTransaction *)coalesceChangesTransaction assertionCount])
  {
    unint64_t v5 = [(SBFolderTransaction *)self->_coalesceChangesTransaction addedIcons];
    id v6 = [(SBFolderTransaction *)self->_coalesceChangesTransaction removedIcons];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_icon);
    [WeakRetained noteContainedIconsAdded:v5 removed:v6];

    [(SBFolder *)self _informObserversOfAddedIcons:v5 removedIcons:v6];
    unsigned __int8 v8 = [(SBFolderTransaction *)self->_coalesceChangesTransaction movedIcons];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
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
          [(SBFolder *)self _informObserversOfMovedIcon:*(void *)(*((void *)&v14 + 1) + 8 * v12++)];
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
    uint64_t v13 = self->_coalesceChangesTransaction;
    self->_coalesceChangesTransaction = 0;
  }
}

- (id)startCoalescingContentChangesForReason:(id)a3
{
  id v4 = a3;
  if (!self->_coalesceChangesTransaction)
  {
    unint64_t v5 = objc_alloc_init(SBFolderTransaction);
    coalesceChangesTransaction = self->_coalesceChangesTransaction;
    self->_coalesceChangesTransaction = v5;
  }
  id v7 = [[SBFolderTransactionAssertion alloc] initWithFolder:self reason:v4];
  [(SBFolderTransaction *)self->_coalesceChangesTransaction addAssertion:v7];

  return v7;
}

- (BOOL)isExtraListIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)firstVisibleListIndex
{
  return [(SBIconIndexMutableList *)self->_lists indexOfNodeWithOptions:0 passingTest:&__block_literal_global_70];
}

- (void)_informObserversOfAddedIcons:(id)a3 removedIcons:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count] || objc_msgSend(v7, "count"))
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    unsigned __int8 v8 = [(NSHashTable *)self->_folderObservers allObjects];
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
          uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
          if (objc_opt_respondsToSelector()) {
            [v13 folder:self didAddIcons:v6 removedIcons:v7];
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
}

- (id)leafIcons
{
  uint64_t v3 = objc_opt_class();
  return [(SBFolder *)self iconsOfClass:v3];
}

- (id)iconsOfClass:(Class)a3
{
  unint64_t v5 = objc_opt_new();
  [(SBFolder *)self addIconsOfClass:a3 toSet:v5];
  return v5;
}

- (void)addIconsOfClass:(Class)a3 toSet:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = self->_lists;
  uint64_t v8 = [(SBIconIndexMutableList *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v11++) addIconsOfClass:a3 toSet:v6];
      }
      while (v9 != v11);
      uint64_t v9 = [(SBIconIndexMutableList *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __34__SBFolder_addIconsOfClass_toSet___block_invoke;
  v13[3] = &unk_1E6AAF398;
  id v14 = v6;
  Class v15 = a3;
  id v12 = v6;
  [(SBFolder *)self enumerateExtraListsUsingBlock:v13];
}

- (NSString)badge
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v29 = 0;
  BOOL v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  objc_opt_class();
  uint64_t v3 = [(SBFolder *)self rootFolder];
  id v4 = SBFSafeCast();

  if (v4 && ([v4 supportsBadging] & 1) == 0)
  {
    id v6 = SBLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138543362;
      unint64_t v38 = v9;
      _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_INFO, "supportsBadging is false for root folder type '%{public}@'", buf, 0xCu);
    }
    id v7 = 0;
  }
  else
  {
    unint64_t v5 = [(SBFolder *)self effectiveBadgeBehaviorProvider];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __17__SBFolder_badge__block_invoke;
    v15[3] = &unk_1E6AAF5F0;
    id v6 = v5;
    long long v16 = v6;
    long long v17 = &v33;
    long long v18 = &v25;
    long long v19 = &v29;
    uint64_t v20 = &v21;
    [(SBFolder *)self enumerateAllIconsUsingBlock:v15];
    if (*((unsigned char *)v34 + 24))
    {
      id v7 = @"!";
    }
    else
    {
      uint64_t v10 = v22[3];
      if (v10 <= 0)
      {
        if (*((unsigned char *)v30 + 24))
        {
          if (v10) {
            id v7 = 0;
          }
          else {
            id v7 = @"+";
          }
        }
        else if (*((unsigned char *)v26 + 24))
        {
          id v7 = &stru_1F2FA0300;
        }
        else
        {
          id v7 = 0;
        }
      }
      else
      {
        uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
        id v12 = objc_msgSend(MEMORY[0x1E4F28EE0], "sbf_cachedDecimalNumberFormatter");
        id v7 = [v12 stringFromNumber:v11];

        if (*((unsigned char *)v30 + 24))
        {
          uint64_t v13 = [(__CFString *)v7 stringByAppendingString:@"+"];

          id v7 = (__CFString *)v13;
        }
      }
    }
  }
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  return (NSString *)v7;
}

- (SBFolder)rootFolder
{
  v2 = self;
  uint64_t v3 = [(SBFolder *)v2 parentFolder];

  if (v3)
  {
    do
    {
      id v4 = [(SBFolder *)v2 parentFolder];

      unint64_t v5 = [(SBFolder *)v4 parentFolder];

      v2 = v4;
    }
    while (v5);
  }
  else
  {
    id v4 = v2;
  }
  return v4;
}

- (SBFolder)parentFolder
{
  v2 = [(SBFolder *)self parent];
  if (v2)
  {
    do
    {
      uint64_t v3 = self;
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        break;
      }
      uint64_t v5 = [v2 parent];

      v2 = (void *)v5;
    }
    while (v5);
  }
  id v6 = self;
  if (objc_opt_isKindOfClass()) {
    id v7 = v2;
  }
  else {
    id v7 = 0;
  }
  uint64_t v8 = v7;

  return v8;
}

- (SBTreeNode)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (SBTreeNode *)WeakRetained;
}

- (BOOL)isLibraryCategoryFolder
{
  return 0;
}

- (unint64_t)maxListCount
{
  return self->_maxListCount;
}

- (SBFolderIcon)icon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icon);
  return (SBFolderIcon *)WeakRetained;
}

- (NSArray)visibleLists
{
  uint64_t v3 = [(SBFolder *)self visibleListIndexes];
  id v4 = [(SBIconIndexMutableList *)self->_lists nodesAtIndexes:v3];

  return (NSArray *)v4;
}

- (id)visibleListIndexes
{
  uint64_t v3 = [MEMORY[0x1E4F28E60] indexSet];
  lists = self->_lists;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__SBFolder_visibleListIndexes__block_invoke;
  v7[3] = &unk_1E6AAF030;
  id v5 = v3;
  id v8 = v5;
  [(SBIconIndexMutableList *)lists enumerateNodesUsingBlock:v7];

  return v5;
}

- (BOOL)canEditDisplayName
{
  return 1;
}

+ (BOOL)isRootFolderClass
{
  return 0;
}

- (void)setRequiredTrailingEmptyListCount:(unint64_t)a3
{
  if (self->_requiredTrailingEmptyListCount != a3)
  {
    self->_requiredTrailingEmptyListCount = a3;
    [(SBFolder *)self compactLists];
  }
}

- (BOOL)isCancelable
{
  return self->_cancelable;
}

uint64_t __33__SBFolder_firstVisibleListIndex__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isHidden] ^ 1;
}

uint64_t __30__SBFolder_visibleListIndexes__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 isHidden];
  if ((result & 1) == 0)
  {
    id v6 = *(void **)(a1 + 32);
    return [v6 addIndex:a3];
  }
  return result;
}

- (Class)listModelClass
{
  return (Class)objc_opt_class();
}

- (SBFolder)initWithDisplayName:(id)a3 maxListCount:(unint64_t)a4 listGridSize:(SBHIconGridSize)a5 iconGridSizeClassSizes:(id)a6
{
  return [(SBFolder *)self initWithUniqueIdentifier:0 displayName:a3 maxListCount:a4 listGridSize:*(unsigned int *)&a5 iconGridSizeClassSizes:a6];
}

- (SBFolder)initWithDisplayName:(id)a3 maxListCount:(unint64_t)a4 listGridSize:(SBHIconGridSize)a5
{
  id v8 = a3;
  uint64_t v9 = objc_alloc_init(SBHIconGridSizeClassSizeMap);
  uint64_t v10 = [(SBFolder *)self initWithUniqueIdentifier:0 displayName:v8 maxListCount:a4 listGridSize:*(unsigned int *)&a5 iconGridSizeClassSizes:v9];

  return v10;
}

- (SBFolder)initWithDisplayName:(id)a3 maxListCount:(unint64_t)a4 maxIconCountInLists:(unint64_t)a5
{
  unsigned __int16 v5 = a5;
  id v8 = a3;
  uint64_t v9 = objc_alloc_init(SBHIconGridSizeClassSizeMap);
  uint64_t v10 = [(SBFolder *)self initWithUniqueIdentifier:0 displayName:v8 maxListCount:a4 listGridSize:v5 | 0x10000 iconGridSizeClassSizes:v9];

  return v10;
}

- (SBFolder)initWithUniqueIdentifier:(id)a3 displayName:(id)a4 maxListCount:(unint64_t)a5 listGridSize:(SBHIconGridSize)a6
{
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc_init(SBHIconGridSizeClassSizeMap);
  uint64_t v13 = [(SBFolder *)self initWithUniqueIdentifier:v11 displayName:v10 maxListCount:a5 listGridSize:*(unsigned int *)&a6 iconGridSizeClassSizes:v12];

  return v13;
}

- (SBFolder)initWithUniqueIdentifier:(id)a3 displayName:(id)a4 maxListCount:(unint64_t)a5 listGridSize:(SBHIconGridSize)a6 iconGridSizeClassSizes:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v36.receiver = self;
  v36.super_class = (Class)SBFolder;
  Class v15 = [(SBFolder *)&v36 init];
  if (v15)
  {
    long long v16 = objc_alloc_init(SBIconIndexMutableList);
    lists = v15->_lists;
    v15->_lists = v16;

    [(SBIconIndexMutableList *)v15->_lists setObserver:v15];
    v15->_maxListCount = a5;
    v15->_listGridSize = a6;
    uint64_t v18 = [v14 copy];
    iconGridSizeClassSizes = v15->_iconGridSizeClassSizes;
    v15->_iconGridSizeClassSizes = (SBHIconGridSizeClassSizeMap *)v18;

    uint64_t v20 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    nodeObservers = v15->_nodeObservers;
    v15->_nodeObservers = (NSHashTable *)v20;

    uint64_t v22 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    folderObservers = v15->_folderObservers;
    v15->_folderObservers = (NSHashTable *)v22;

    if (v12)
    {
      uint64_t v24 = [v12 copy];
      uniqueIdentifier = v15->_uniqueIdentifier;
      v15->_uniqueIdentifier = (NSString *)v24;
    }
    else
    {
      uniqueIdentifier = (NSString *)objc_alloc_init(MEMORY[0x1E4F29128]);
      uint64_t v26 = [(NSString *)uniqueIdentifier UUIDString];
      uint64_t v27 = v15->_uniqueIdentifier;
      v15->_uniqueIdentifier = (NSString *)v26;
    }
    uint64_t v28 = [(id)objc_opt_class() folderNodeIdentifierForUniqueIdentifier:v15->_uniqueIdentifier];
    nodeIdentifier = v15->_nodeIdentifier;
    v15->_nodeIdentifier = (NSString *)v28;

    uint64_t v30 = [v13 copy];
    displayName = v15->_displayName;
    v15->_displayName = (NSString *)v30;

    v15->_visibleListCount = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v32 = +[SBHIconGridSizeClassSet gridSizeClassSetForAllGridSizeClasses];
    listAllowedGridSizeClasses = v15->_listAllowedGridSizeClasses;
    v15->_listAllowedGridSizeClasses = (SBHIconGridSizeClassSet *)v32;

    objc_storeStrong((id *)&v15->_listRotatedLayoutClusterGridSizeClass, @"SBHIconGridSizeClassDefault");
    v15->_listsAllowIndependentRotatedLayout = 1;
    id v34 = [(SBFolder *)v15 addEmptyList];
    [(SBFolder *)v15 markIconStateClean];
  }

  return v15;
}

- (SBFolder)init
{
  uint64_t v3 = objc_alloc_init(SBHIconGridSizeClassSizeMap);
  id v4 = [(SBFolder *)self initWithUniqueIdentifier:0 displayName:&stru_1F2FA0300 maxListCount:1 listGridSize:65537 iconGridSizeClassSizes:v3];

  return v4;
}

- (SBFolder)initWithFolder:(id)a3 copyLeafIcons:(BOOL)a4
{
  return [(SBFolder *)self initWithFolder:a3 options:a4];
}

- (SBFolder)initWithFolder:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = (id *)a3;
  v61.receiver = self;
  v61.super_class = (Class)SBFolder;
  id v7 = [(SBFolder *)&v61 init];
  if (v7)
  {
    if ((v4 & 7) != 0) {
      id v8 = objc_alloc_init(SBIconIndexMutableList);
    }
    else {
      id v8 = [[SBIconIndexMutableList alloc] initWithList:v6[3] copyNodes:1];
    }
    uint64_t v9 = (void *)*((void *)v7 + 3);
    *((void *)v7 + 3) = v8;

    [*((id *)v7 + 3) setObserver:v7];
    *((void *)v7 + 16) = [v6 maxListCount];
    *(_DWORD *)(v7 + 70) = [v6 listGridSize];
    *(_DWORD *)(v7 + 74) = [v6 listWithNonDefaultSizedIconsGridSize];
    id v10 = [v6 iconGridSizeClassSizes];
    uint64_t v11 = [v10 copy];
    id v12 = (void *)*((void *)v7 + 17);
    *((void *)v7 + 17) = v11;

    id v13 = [v6 rotatedIconGridSizeClassSizes];
    uint64_t v14 = [v13 copy];
    Class v15 = (void *)*((void *)v7 + 26);
    *((void *)v7 + 26) = v14;

    uint64_t v16 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    long long v17 = (void *)*((void *)v7 + 1);
    *((void *)v7 + 1) = v16;

    uint64_t v18 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    long long v19 = (void *)*((void *)v7 + 2);
    *((void *)v7 + 2) = v18;

    uint64_t v20 = [v6 uniqueIdentifier];
    uint64_t v21 = [v20 copy];
    uint64_t v22 = (void *)*((void *)v7 + 11);
    *((void *)v7 + 11) = v21;

    uint64_t v23 = [v6 nodeIdentifier];
    uint64_t v24 = (void *)*((void *)v7 + 6);
    *((void *)v7 + 6) = v23;

    uint64_t v25 = [v6 displayName];
    uint64_t v26 = [v25 copy];
    uint64_t v27 = (void *)*((void *)v7 + 12);
    *((void *)v7 + 12) = v26;

    uint64_t v28 = [v6 defaultDisplayName];
    uint64_t v29 = [v28 copy];
    uint64_t v30 = (void *)*((void *)v7 + 13);
    *((void *)v7 + 13) = v29;

    *((void *)v7 + 7) = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v31 = [v6 listAllowedGridSizeClasses];
    uint64_t v32 = [v31 copy];
    uint64_t v33 = (void *)*((void *)v7 + 19);
    *((void *)v7 + 19) = v32;

    uint64_t v34 = [v6 listRotatedLayoutClusterGridSizeClass];
    uint64_t v35 = (void *)*((void *)v7 + 18);
    *((void *)v7 + 18) = v34;

    v7[65] = [v6 listsAllowRotatedLayout];
    v7[66] = [v6 listsAllowIndependentRotatedLayout];
    *((void *)v7 + 20) = [v6 listsFixedIconLocationBehavior];
    *((void *)v7 + 21) = [v6 listsIconLayoutBehavior];
    v7[33] = [v6 isCancelable];
    *((void *)v7 + 24) = [v6 requiredTrailingEmptyListCount];
    objc_super v36 = [v6 badgeBehaviorProvider];
    objc_storeWeak((id *)v7 + 15, v36);

    uint64_t v37 = [v6 gridSizeClassDomain];
    unint64_t v38 = (void *)*((void *)v7 + 22);
    *((void *)v7 + 22) = v37;

    if ((v4 & 2) == 0)
    {
      if ((v4 & 5) != 0)
      {
        uint64_t v39 = (objc_class *)[v7 listModelClass];
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id v40 = v6[3];
        uint64_t v41 = [v40 countByEnumeratingWithState:&v57 objects:v63 count:16];
        if (v41)
        {
          uint64_t v42 = v41;
          uint64_t v43 = *(void *)v58;
          do
          {
            for (uint64_t i = 0; i != v42; ++i)
            {
              if (*(void *)v58 != v43) {
                objc_enumerationMutation(v40);
              }
              uint64_t v45 = *(void *)(*((void *)&v57 + 1) + 8 * i);
              if ((v4 & 4) == 0 || ([*(id *)(*((void *)&v57 + 1) + 8 * i) isHidden] & 1) == 0)
              {
                uint64_t v46 = (void *)[[v39 alloc] initWithIconListModel:v45 copyLeafIcons:v4 & 1];
                [v46 _changeFolderDuringCopy:v7];
                [v7 _addList:v46];
              }
            }
            uint64_t v42 = [v40 countByEnumeratingWithState:&v57 objects:v63 count:16];
          }
          while (v42);
        }
      }
      else
      {
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v40 = *((id *)v7 + 3);
        uint64_t v47 = [v40 countByEnumeratingWithState:&v53 objects:v62 count:16];
        if (v47)
        {
          uint64_t v48 = v47;
          uint64_t v49 = *(void *)v54;
          do
          {
            for (uint64_t j = 0; j != v48; ++j)
            {
              if (*(void *)v54 != v49) {
                objc_enumerationMutation(v40);
              }
              v51 = *(void **)(*((void *)&v53 + 1) + 8 * j);
              objc_msgSend(v51, "_changeFolderDuringCopy:", v7, (void)v53);
              [v7 _didAddList:v51 informObservers:0];
            }
            uint64_t v48 = [v40 countByEnumeratingWithState:&v53 objects:v62 count:16];
          }
          while (v48);
        }
      }
    }
    objc_msgSend(v7, "markIconStateClean", (void)v53);
  }

  return (SBFolder *)v7;
}

- (void)removeFolderObserver:(id)a3
{
}

- (void)setDisplayName:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  char v4 = (NSString *)a3;
  if (self->_displayName != v4)
  {
    defaultDisplayName = self->_defaultDisplayName;
    self->_defaultDisplayName = 0;

    id v6 = (NSString *)[(NSString *)v4 copy];
    displayName = self->_displayName;
    self->_displayName = v6;

    [(SBFolder *)self markIconStateDirty];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_icon);
    [WeakRetained updateLabel];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v9 = [(NSHashTable *)self->_folderObservers allObjects];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
          if (objc_opt_respondsToSelector()) {
            [v14 folderDisplayNameDidChange:self];
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
}

- (void)setCancelable:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_cancelable != a3)
  {
    self->_cancelable = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    char v4 = [(NSHashTable *)self->_folderObservers allObjects];
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
          uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            [v9 folderCancelableDidChange:self];
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

- (void)setListWithNonDefaultSizedIconsGridSize:(SBHIconGridSize)a3
{
  if (!SBHIconGridSizeEqualToIconGridSize(*(_DWORD *)&a3, *(_DWORD *)&self->_listWithNonDefaultSizedIconsGridSize))
  {
    self->_listWithNonDefaultSizedIconsGridSize = a3;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __52__SBFolder_setListWithNonDefaultSizedIconsGridSize___block_invoke;
    v5[3] = &__block_descriptor_36_e32_v32__0__SBIconListModel_8Q16_B24l;
    SBHIconGridSize v6 = a3;
    [(SBFolder *)self enumerateListsWithOptions:4 usingBlock:v5];
  }
}

uint64_t __52__SBFolder_setListWithNonDefaultSizedIconsGridSize___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setGridSizeWhenDirectlyContainingNonDefaultSizedIcons:*(unsigned int *)(a1 + 32)];
}

- (void)setListRotatedLayoutClusterGridSizeClass:(id)a3
{
  char v4 = (NSString *)a3;
  uint64_t v5 = v4;
  if (self->_listRotatedLayoutClusterGridSizeClass != v4)
  {
    SBHIconGridSize v6 = (NSString *)[(NSString *)v4 copy];
    listRotatedLayoutClusterGridSizeClass = self->_listRotatedLayoutClusterGridSizeClass;
    self->_listRotatedLayoutClusterGridSizeClass = v6;

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53__SBFolder_setListRotatedLayoutClusterGridSizeClass___block_invoke;
    v8[3] = &unk_1E6AAF030;
    uint64_t v9 = v5;
    [(SBFolder *)self enumerateListsWithOptions:4 usingBlock:v8];
  }
}

uint64_t __53__SBFolder_setListRotatedLayoutClusterGridSizeClass___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setRotatedLayoutClusterGridSizeClass:*(void *)(a1 + 32)];
}

- (void)setListsAllowRotatedLayout:(BOOL)a3
{
  if (self->_listsAllowRotatedLayout != a3)
  {
    self->_listsAllowRotatedLayout = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __39__SBFolder_setListsAllowRotatedLayout___block_invoke;
    v3[3] = &__block_descriptor_33_e32_v32__0__SBIconListModel_8Q16_B24l;
    BOOL v4 = a3;
    [(SBFolder *)self enumerateListsWithOptions:4 usingBlock:v3];
  }
}

uint64_t __39__SBFolder_setListsAllowRotatedLayout___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAllowsRotatedLayout:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setListsAllowIndependentRotatedLayout:(BOOL)a3
{
  if (self->_listsAllowIndependentRotatedLayout != a3)
  {
    self->_listsAllowIndependentRotatedLayout = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __50__SBFolder_setListsAllowIndependentRotatedLayout___block_invoke;
    v3[3] = &__block_descriptor_33_e32_v32__0__SBIconListModel_8Q16_B24l;
    BOOL v4 = a3;
    [(SBFolder *)self enumerateListsWithOptions:4 usingBlock:v3];
  }
}

uint64_t __50__SBFolder_setListsAllowIndependentRotatedLayout___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAllowsIndependentRotatedLayout:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setListAllowedGridSizeClasses:(id)a3
{
  id v4 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    uint64_t v5 = (SBHIconGridSizeClassSet *)[v4 copy];
    listAllowedGridSizeClasses = self->_listAllowedGridSizeClasses;
    self->_listAllowedGridSizeClasses = v5;

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__SBFolder_setListAllowedGridSizeClasses___block_invoke;
    v7[3] = &unk_1E6AAF030;
    id v8 = v4;
    [(SBFolder *)self enumerateListsWithOptions:4 usingBlock:v7];
  }
}

uint64_t __42__SBFolder_setListAllowedGridSizeClasses___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAllowedGridSizeClasses:*(void *)(a1 + 32)];
}

- (void)setListsFixedIconLocationBehavior:(int64_t)a3
{
  if (self->_listsFixedIconLocationBehavior != a3)
  {
    self->_listsFixedIconLocationBehavior = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __46__SBFolder_setListsFixedIconLocationBehavior___block_invoke;
    v3[3] = &__block_descriptor_40_e32_v32__0__SBIconListModel_8Q16_B24l;
    void v3[4] = a3;
    [(SBFolder *)self enumerateListsWithOptions:4 usingBlock:v3];
  }
}

uint64_t __46__SBFolder_setListsFixedIconLocationBehavior___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setFixedIconLocationBehavior:*(void *)(a1 + 32)];
}

- (void)setListsIconLayoutBehavior:(unint64_t)a3
{
  if (self->_listsIconLayoutBehavior != a3)
  {
    self->_listsIconLayoutBehavior = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __39__SBFolder_setListsIconLayoutBehavior___block_invoke;
    v3[3] = &__block_descriptor_40_e32_v32__0__SBIconListModel_8Q16_B24l;
    void v3[4] = a3;
    [(SBFolder *)self enumerateListsWithOptions:4 usingBlock:v3];
  }
}

uint64_t __39__SBFolder_setListsIconLayoutBehavior___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIconLayoutBehavior:*(void *)(a1 + 32)];
}

- (void)setRotatedIconGridSizeClassSizes:(id)a3
{
  id v4 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    uint64_t v5 = (SBHIconGridSizeClassSizeMap *)[v4 copy];
    rotatedIconGridSizeClassSizes = self->_rotatedIconGridSizeClassSizes;
    self->_rotatedIconGridSizeClassSizes = v5;

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__SBFolder_setRotatedIconGridSizeClassSizes___block_invoke;
    v7[3] = &unk_1E6AAF030;
    id v8 = v4;
    [(SBFolder *)self enumerateListsWithOptions:4 usingBlock:v7];
  }
}

uint64_t __45__SBFolder_setRotatedIconGridSizeClassSizes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setRotatedIconGridSizeClassSizes:*(void *)(a1 + 32)];
}

- (void)setGridSizeClassDomain:(id)a3
{
  uint64_t v5 = (SBHIconGridSizeClassDomain *)a3;
  if (self->_gridSizeClassDomain != v5)
  {
    objc_storeStrong((id *)&self->_gridSizeClassDomain, a3);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __35__SBFolder_setGridSizeClassDomain___block_invoke;
    v6[3] = &unk_1E6AAF030;
    uint64_t v7 = v5;
    [(SBFolder *)self enumerateListsUsingBlock:v6];
  }
}

uint64_t __35__SBFolder_setGridSizeClassDomain___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setGridSizeClassDomain:*(void *)(a1 + 32)];
}

- (SBIconListModel)firstList
{
  return (SBIconListModel *)[(SBIconIndexMutableList *)self->_lists firstNode];
}

- (SBIconListModel)lastList
{
  return (SBIconListModel *)[(SBIconIndexMutableList *)self->_lists lastNode];
}

- (unint64_t)hiddenListCount
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_lists;
  uint64_t v3 = [(SBIconIndexMutableList *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "isHidden", (void)v9);
      }
      uint64_t v4 = [(SBIconIndexMutableList *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)hasMultipleVisibleLists
{
  return [(SBFolder *)self visibleListCount] > 1;
}

- (BOOL)hasMultipleVisibleNonTrailingEmptyLists
{
  unint64_t v3 = [(SBFolder *)self visibleListCount];
  return v3 - [(SBFolder *)self trailingVisibleEmptyListCount] > 1;
}

- (BOOL)hasHiddenLists
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_lists;
  uint64_t v3 = [(SBIconIndexMutableList *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
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
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "isHidden", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(SBIconIndexMutableList *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (unint64_t)iconCount
{
  return [(SBFolder *)self iconCountWithOptions:0];
}

- (unint64_t)visibleIconCount
{
  return [(SBFolder *)self iconCountWithOptions:2];
}

- (unint64_t)iconCountWithOptions:(unint64_t)a3
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__SBFolder_iconCountWithOptions___block_invoke;
  v5[3] = &unk_1E6AAD3D8;
  void v5[4] = &v6;
  [(SBFolder *)self enumerateListsWithOptions:a3 usingBlock:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __33__SBFolder_iconCountWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 numberOfIcons];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (BOOL)isEmpty
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_lists;
  uint64_t v3 = [(SBIconIndexMutableList *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "isEmpty", (void)v9))
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [(SBIconIndexMutableList *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)isFull
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(SBIconIndexMutableList *)self->_lists count];
  if (v3 < [(SBFolder *)self maxListCount]) {
    return 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_lists;
  uint64_t v6 = [(SBIconIndexMutableList *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "isFull", (void)v11))
        {
          BOOL v4 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v7 = [(SBIconIndexMutableList *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v4 = 1;
LABEL_13:

  return v4;
}

- (BOOL)containsOneIcon
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __27__SBFolder_containsOneIcon__block_invoke;
  v4[3] = &unk_1E6AAD3D8;
  v4[4] = &v5;
  [(SBFolder *)self enumerateListsWithOptions:0 usingBlock:v4];
  BOOL v2 = v6[3] == 1;
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __27__SBFolder_containsOneIcon__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 numberOfIcons];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) >= 2uLL) {
    *a4 = 1;
  }
  return result;
}

- (BOOL)shouldRemoveWhenEmpty
{
  return 1;
}

- (BOOL)canRemoveIcons
{
  return 1;
}

- (BOOL)_compactsFirstList
{
  return 1;
}

- (BOOL)compactAllLists
{
  BOOL v2 = self;
  unint64_t v3 = [(SBFolder *)self startCoalescingContentChangesForReason:@"SBCompactListsCoalesceID"];
  [(SBFolder *)v2 compactOverflowLists];
  LOBYTE(v2) = [(SBFolder *)v2 _compactListsAndFirst:1];
  [v3 invalidate];

  return (char)v2;
}

- (void)compactListsInDescendents
{
}

uint64_t __37__SBFolder_compactListsInDescendents__block_invoke(uint64_t a1, void *a2)
{
  return [a2 enumerateFolderIconsUsingBlock:&__block_literal_global_39];
}

void __37__SBFolder_compactListsInDescendents__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 folder];
  [v2 compactLists];
}

- (void)compactOverflowListsAndRemoveEmptyLists:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__SBFolder_compactOverflowListsAndRemoveEmptyLists___block_invoke;
  v3[3] = &unk_1E6AAF100;
  void v3[4] = self;
  BOOL v4 = a3;
  [(SBFolder *)self enumerateVisibleListsUsingBlock:v3];
}

uint64_t __52__SBFolder_compactOverflowListsAndRemoveEmptyLists___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _compactContiguousOverflowListsStartingAtListIndex:a3 withoutMovingIconsPassingTest:0 removeEmptyLists:*(unsigned __int8 *)(a1 + 40)];
}

- (void)compactOverflowListsWithoutMovingIconsPassingTest:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__SBFolder_compactOverflowListsWithoutMovingIconsPassingTest___block_invoke;
  v6[3] = &unk_1E6AAF128;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SBFolder *)self enumerateVisibleListsUsingBlock:v6];
}

uint64_t __62__SBFolder_compactOverflowListsWithoutMovingIconsPassingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _compactContiguousOverflowListsStartingAtListIndex:a3 withoutMovingIconsPassingTest:*(void *)(a1 + 40) removeEmptyLists:0];
}

- (void)compactOverflowListsWithoutMovingIconsPassingTest:(id)a3 removeEmptyLists:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__SBFolder_compactOverflowListsWithoutMovingIconsPassingTest_removeEmptyLists___block_invoke;
  v8[3] = &unk_1E6AAF150;
  void v8[4] = self;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  [(SBFolder *)self enumerateVisibleListsUsingBlock:v8];
}

uint64_t __79__SBFolder_compactOverflowListsWithoutMovingIconsPassingTest_removeEmptyLists___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _compactContiguousOverflowListsStartingAtListIndex:a3 withoutMovingIconsPassingTest:*(void *)(a1 + 40) removeEmptyLists:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t __110__SBFolder__compactContiguousOverflowListsStartingAtListIndex_withoutMovingIconsPassingTest_removeEmptyLists___block_invoke(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))() ^ 1;
}

- (void)pruneEmptyFolders
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__6;
  uint64_t v16 = __Block_byref_object_dispose__6;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __29__SBFolder_pruneEmptyFolders__block_invoke;
  v11[3] = &unk_1E6AAF1A0;
  v11[4] = &v12;
  [(SBFolder *)self enumerateAllIconsWithOptions:1 usingBlock:v11];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v3 = (id)v13[5];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        -[SBFolder removeIcon:options:](self, "removeIcon:options:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), 9437184, (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v18 count:16];
    }
    while (v4);
  }

  _Block_object_dispose(&v12, 8);
}

void __29__SBFolder_pruneEmptyFolders__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if ([v9 isFolderIcon])
  {
    id v3 = [v9 folder];
    int v4 = [v3 isEmpty];

    if (v4)
    {
      uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      if (!v5)
      {
        id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
        long long v8 = *(void **)(v7 + 40);
        *(void *)(v7 + 40) = v6;

        uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      }
      [v5 addObject:v9];
    }
  }
}

- (unint64_t)trailingVisibleEmptyListCount
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lists = self->_lists;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__SBFolder_trailingVisibleEmptyListCount__block_invoke;
  v5[3] = &unk_1E6AAD3D8;
  void v5[4] = &v6;
  [(SBIconIndexMutableList *)lists enumerateNodesWithOptions:2 usingBlock:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __41__SBFolder_trailingVisibleEmptyListCount__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if ([v8 isEmptyIgnoringPlaceholders])
  {
    char v6 = [v8 isHidden];
    uint64_t v7 = v8;
    if ((v6 & 1) == 0) {
      ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    }
  }
  else
  {
    *a4 = 1;
    uint64_t v7 = v8;
  }
}

- (BOOL)isTrailingEmptyListIndex:(unint64_t)a3
{
  int v4 = self;
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  unint64_t v5 = [(SBFolder *)self listCount];
  char v6 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", a3, v5 - a3);
  lists = v4->_lists;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__SBFolder_isTrailingEmptyListIndex___block_invoke;
  v9[3] = &unk_1E6AAD3D8;
  v9[4] = &v10;
  [(SBIconIndexMutableList *)lists enumerateNodesAtIndexes:v6 options:2 usingBlock:v9];
  LOBYTE(v4) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)v4;
}

uint64_t __37__SBFolder_isTrailingEmptyListIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 numberOfNonPlaceholderIcons];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (NSArray)trailingEmptyLists
{
  unint64_t v3 = [(SBFolder *)self trailingEmptyListCount];
  unint64_t v4 = [(SBFolder *)self listCount] - v3;
  lists = self->_lists;
  return (NSArray *)-[SBIconIndexMutableList nodesInRange:](lists, "nodesInRange:", v4, v3);
}

- (BOOL)isTrailingEmptyList:(id)a3
{
  id v4 = a3;
  if ([v4 isEmptyIgnoringPlaceholders]
    && (unint64_t v5 = [(SBFolder *)self trailingEmptyListCount]) != 0)
  {
    unint64_t v6 = v5;
    unint64_t v7 = [(SBFolder *)self indexOfList:v4];
    BOOL v8 = v7 >= [(SBFolder *)self listCount] - v6;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_insertList:(id)a3 atIndex:(unint64_t)a4
{
  if (a3)
  {
    id v6 = a3;
    [(SBFolder *)self _willAddList:v6];
    [(SBIconIndexMutableList *)self->_lists insertNode:v6 atIndex:a4];
    [(SBFolder *)self _didAddList:v6 informObservers:1];

    [(SBFolder *)self markIconStateDirty];
  }
}

- (void)_addList:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [(SBFolder *)self _willAddList:v4];
    [(SBIconIndexMutableList *)self->_lists addNode:v4];
    [(SBFolder *)self _didAddList:v4 informObservers:1];

    [(SBFolder *)self markIconStateDirty];
  }
}

- (void)_willAddList:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SBFolder *)self rootFolder];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __25__SBFolder__willAddList___block_invoke;
  v7[3] = &unk_1E6AAD1C0;
  id v8 = v5;
  id v6 = v5;
  [v4 enumerateIconsWithOptions:1 usingBlock:v7];
}

uint64_t __25__SBFolder__willAddList___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeIcon:a2 options:0];
}

- (void)_didAddList:(id)a3 informObservers:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = [v6 isHidden];
  [v6 setDelegate:self];
  [v6 addListObserver:self];
  SBTreeNodeSetParent(v6, (uint64_t)self);
  id v8 = [(SBFolder *)self gridSizeClassDomain];
  [v6 setGridSizeClassDomain:v8];
  if ([(SBIconIndexMutableList *)self->_lists containsNode:v6])
  {
    uint64_t v9 = [(SBFolder *)self listRotatedLayoutClusterGridSizeClass];
    [v6 setRotatedLayoutClusterGridSizeClass:v9];
    objc_msgSend(v6, "setAllowsRotatedLayout:", -[SBFolder listsAllowRotatedLayout](self, "listsAllowRotatedLayout"));
    objc_msgSend(v6, "setAllowsIndependentRotatedLayout:", -[SBFolder listsAllowIndependentRotatedLayout](self, "listsAllowIndependentRotatedLayout"));
    uint64_t v10 = [(SBFolder *)self listAllowedGridSizeClasses];
    [v6 setAllowedGridSizeClasses:v10];
    objc_msgSend(v6, "setFixedIconLocationBehavior:", -[SBFolder listsFixedIconLocationBehavior](self, "listsFixedIconLocationBehavior"));
    objc_msgSend(v6, "setIconLayoutBehavior:", -[SBFolder listsIconLayoutBehavior](self, "listsIconLayoutBehavior"));
    SBHIconGridSize v11 = (SBHIconGridSize)[(SBFolder *)self listWithNonDefaultSizedIconsGridSize];
    SBHIconGridSize v12 = v11;
    if (*(unsigned int *)&v11 >= 0x10000
      && v11.columns
      && [v6 directlyContainsNonDefaultSizeClassIcon])
    {
      char v13 = [v6 changeGridSize:*(unsigned int *)&v12 options:0];
      if (v13) {
        id v14 = [(SBFolder *)self _handleBumpedIcons:v13 afterInsertingIconIntoListAtIndex:[(SBFolder *)self indexOfList:v6] listGridCellInfoOptions:0 mutationOptions:0 didBump:0];
      }
    }
    [v6 setGridSizeWhenDirectlyContainingNonDefaultSizedIcons:*(unsigned int *)&v12];
    uint64_t v15 = [(SBFolder *)self rotatedIconGridSizeClassSizes];
    [v6 setRotatedIconGridSizeClassSizes:v15];
  }
  self->_visibleListCount = 0x7FFFFFFFFFFFFFFFLL;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __40__SBFolder__didAddList_informObservers___block_invoke;
  v30[3] = &unk_1E6AAF1C8;
  v30[4] = self;
  char v31 = v7;
  [v6 enumerateIconsUsingBlock:v30];
  if (v4)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v16 = [(NSHashTable *)self->_folderObservers allObjects];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v27;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void **)(*((void *)&v26 + 1) + 8 * v20);
          if (objc_opt_respondsToSelector()) {
            [v21 folder:self didAddList:v6];
          }
          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v18);
    }

    uint64_t v22 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v23 = [v6 icons];
    uint64_t v24 = [v22 setWithArray:v23];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_icon);
    [WeakRetained noteContainedIconsAdded:v24 removed:0];

    [(SBFolder *)self _informObserversOfAddedIcons:v24 removedIcons:0];
  }
}

void __40__SBFolder__didAddList_informObservers___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 isFolderIcon])
  {
    unint64_t v3 = [v4 folder];
    [*(id *)(a1 + 32) didAddFolder:v3];
    if (!*(unsigned char *)(a1 + 40)) {
      *(void *)(*(void *)(a1 + 32) + 184) += [v3 visibleWidgetIconCount];
    }
  }
  if (!*(unsigned char *)(a1 + 40) && [v4 isWidgetIcon]) {
    ++*(void *)(*(void *)(a1 + 32) + 184);
  }
}

- (void)_setLists:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(SBFolder *)self maxListCount];
  if ([v4 count] > v5)
  {
    uint64_t v6 = objc_msgSend(v4, "subarrayWithRange:", 0, v5);

    id v4 = (id)v6;
  }
  char v7 = [(SBIconIndexMutableList *)self->_lists nodes];
  [(SBFolder *)self _removeLists:v7];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v4;
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
        -[SBFolder _addList:](self, "_addList:", *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)_willRemoveList:(id)a3 atIndex:(unint64_t)a4 informObservers:(BOOL)a5
{
  BOOL v5 = a5;
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (v5)
  {
    id v17 = v8;
    v23[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    uint64_t v10 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a4];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v11 = [(NSHashTable *)self->_folderObservers allObjects];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = *(void **)(*((void *)&v18 + 1) + 8 * v15);
          if (objc_opt_respondsToSelector()) {
            [v16 folder:self willRemoveLists:v9 atIndexes:v10];
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }

    id v8 = v17;
  }
}

- (void)_didRemoveList:(id)a3 atIndex:(unint64_t)a4 informObservers:(BOOL)a5
{
  BOOL v5 = a5;
  v26[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  char v9 = [v8 isHidden];
  [v8 removeListObserver:self];
  SBTreeNodeSetParent(v8, 0);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __51__SBFolder__didRemoveList_atIndex_informObservers___block_invoke;
  void v23[3] = &unk_1E6AAF1C8;
  v23[4] = self;
  char v24 = v9;
  [v8 enumerateIconsUsingBlock:v23];
  if (v5)
  {
    id v18 = v8;
    v26[0] = v8;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    uint64_t v11 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a4];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v12 = [(NSHashTable *)self->_folderObservers allObjects];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v19 + 1) + 8 * v16);
          if (objc_opt_respondsToSelector()) {
            [v17 folder:self didRemoveLists:v10 atIndexes:v11];
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v14);
    }

    id v8 = v18;
  }
}

void __51__SBFolder__didRemoveList_atIndex_informObservers___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 isFolderIcon])
  {
    unint64_t v3 = [v4 folder];
    [*(id *)(a1 + 32) didRemoveFolder:v3];
    if (!*(unsigned char *)(a1 + 40)) {
      *(void *)(*(void *)(a1 + 32) + 184) -= [v3 visibleWidgetIconCount];
    }
  }
  if (!*(unsigned char *)(a1 + 40) && [v4 isWidgetIcon]) {
    --*(void *)(*(void *)(a1 + 32) + 184);
  }
}

- (id)addEmptyList
{
  unint64_t v3 = [(SBFolder *)self listCount];
  if (v3 >= [(SBFolder *)self maxListCount])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [(SBFolder *)self _createNewListWithIcon:0];
    [(SBFolder *)self _addList:v4];
  }
  return v4;
}

- (id)addEmptyListRemovingLeastRecentlyHiddenListIfNecessary
{
  unint64_t v3 = [(SBFolder *)self addEmptyList];
  if (!v3)
  {
    [(SBFolder *)self removeLeastRecentlyHiddenList];
    unint64_t v3 = [(SBFolder *)self addEmptyList];
  }
  return v3;
}

- (id)insertEmptyListAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(SBFolder *)self listCount];
  if (v5 >= [(SBFolder *)self maxListCount])
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [(SBFolder *)self _createNewListWithIcon:0];
    [(SBFolder *)self _insertList:v6 atIndex:a3];
  }
  return v6;
}

- (id)insertEmptyListRemovingLeastRecentlyHiddenListIfNecessaryAtIndex:(unint64_t)a3
{
  if ([(SBFolder *)self listCount] == a3)
  {
    unint64_t v5 = [(SBFolder *)self addEmptyListRemovingLeastRecentlyHiddenListIfNecessary];
  }
  else
  {
    unint64_t v5 = [(SBFolder *)self insertEmptyListAtIndex:a3];
    if (!v5)
    {
      uint64_t v6 = [(SBFolder *)self listAtIndex:a3];
      [(SBFolder *)self removeLeastRecentlyHiddenList];
      unint64_t v7 = [(SBFolder *)self indexOfList:v6];
      if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
        [(SBFolder *)self addEmptyList];
      }
      else {
      unint64_t v5 = [(SBFolder *)self insertEmptyListAtIndex:v7];
      }
      if (!v5)
      {
        if ([(SBFolder *)self trailingEmptyListCount])
        {
          unint64_t v8 = [(SBFolder *)self listCount] - 1;
          unint64_t v5 = [(SBFolder *)self listAtIndex:v8];
          [(SBFolder *)self moveListAtIndex:v8 toIndex:v7];
        }
        else
        {
          unint64_t v5 = 0;
        }
      }
    }
  }
  return v5;
}

- (id)addEmptyListWithIdentifier:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SBFolder *)self listCount];
  if (v5 >= [(SBFolder *)self maxListCount])
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [(SBFolder *)self _createNewListWithIdentifier:v4];
    [(SBFolder *)self _addList:v6];
  }

  return v6;
}

- (id)addListWithIcon:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SBFolder *)self listCount];
  if (v5 >= [(SBFolder *)self maxListCount])
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [(SBFolder *)self _createNewListWithIcon:v4];
    [(SBFolder *)self _addList:v6];
  }

  return v6;
}

- (id)addListWithIcons:(id)a3
{
  return [(SBFolder *)self addListWithIcons:a3 removingHiddenListsIfNecessary:0];
}

- (id)addListWithIcons:(id)a3 removingHiddenListsIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unint64_t v7 = [(SBFolder *)self maxListCount];
  if (v4 && [(SBFolder *)self listCount] >= v7) {
    [(SBFolder *)self removeLeastRecentlyHiddenList];
  }
  if ([(SBFolder *)self listCount] >= v7)
  {
    unint64_t v8 = 0;
  }
  else
  {
    unint64_t v8 = [(SBFolder *)self _createNewListWithIcons:v6];
    [(SBFolder *)self _addList:v8];
  }

  return v8;
}

- (void)removeList:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  BOOL v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v7 count:1];

  -[SBFolder _removeLists:](self, "_removeLists:", v6, v7, v8);
}

- (void)removeListAtIndex:(unint64_t)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(SBFolder *)self listAtIndex:a3];
  v6[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [(SBFolder *)self _removeLists:v5];
}

- (void)removeListsAtIndexes:(id)a3
{
  id v4 = [(SBIconIndexMutableList *)self->_lists nodesAtIndexes:a3];
  [(SBFolder *)self _removeLists:v4];
}

- (void)removeLastList
{
  id v3 = [(SBFolder *)self lastList];
  [(SBFolder *)self removeList:v3];
}

- (id)listWithGreatestHiddenDateMatchingOrdering:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = self->_lists;
  uint64_t v5 = [(SBIconIndexMutableList *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "hiddenDate", (void)v16);
        if (v11)
        {
          if (v7)
          {
            uint64_t v12 = [v7 hiddenDate];
            uint64_t v13 = [v11 compare:v12];

            if (v13 == a3)
            {
              id v14 = v10;

              id v7 = v14;
            }
          }
          else
          {
            id v7 = v10;
          }
        }
      }
      uint64_t v6 = [(SBIconIndexMutableList *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (SBIconListModel)mostRecentlyHiddenList
{
  return (SBIconListModel *)[(SBFolder *)self listWithGreatestHiddenDateMatchingOrdering:1];
}

- (SBIconListModel)leastRecentlyHiddenList
{
  return (SBIconListModel *)[(SBFolder *)self listWithGreatestHiddenDateMatchingOrdering:-1];
}

- (void)removeHiddenLists
{
  id v4 = [(SBIconIndexMutableList *)self->_lists indexesOfNodesPassingTest:&__block_literal_global_57];
  id v3 = [(SBIconIndexMutableList *)self->_lists nodesAtIndexes:v4];
  [(SBFolder *)self _removeLists:v3];
  [(SBFolder *)self _didExplicitlyRemoveHiddenLists:v3];
}

uint64_t __29__SBFolder_removeHiddenLists__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isHidden];
}

- (void)removeLeastRecentlyHiddenList
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(SBFolder *)self leastRecentlyHiddenList];
  if (v3)
  {
    [(SBFolder *)self removeList:v3];
    v5[0] = v3;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
    [(SBFolder *)self _didExplicitlyRemoveHiddenLists:v4];
  }
}

- (void)moveListAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = -[SBFolder listAtIndex:](self, "listAtIndex:");
  [(SBIconIndexMutableList *)self->_lists moveNode:v7 toIndex:a4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [(NSHashTable *)self->_folderObservers allObjects];
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
        uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 folder:self didMoveList:v7 fromIndex:a3 toIndex:a4];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (BOOL)isVisibleListIndex:(unint64_t)a3
{
  id v3 = [(SBFolder *)self listAtIndex:a3];
  char v4 = [v3 isHidden] ^ 1;

  return v4;
}

- (BOOL)isValidIndexPath:(id)a3
{
  return [(SBFolder *)self isValidIndexPath:a3 forInsertion:0];
}

- (BOOL)isValidIndexPath:(id)a3 forInsertion:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 length];
  if (!v7) {
    goto LABEL_9;
  }
  if (v7 == 2)
  {
    uint64_t v9 = [v6 sbListIndex];
    if ([(SBFolder *)self isValidListIndex:v9])
    {
      uint64_t v10 = [(SBFolder *)self listAtIndex:v9];
      unint64_t v11 = [v10 numberOfIcons];
      unint64_t v12 = [v6 sbIconIndex];
      if (v4) {
        char v8 = v12 <= v11;
      }
      else {
        char v8 = v12 < v11;
      }
LABEL_17:

      goto LABEL_18;
    }
LABEL_9:
    char v8 = 0;
    goto LABEL_18;
  }
  if (v7 != 1)
  {
    uint64_t v10 = objc_msgSend(v6, "sb_firstIconPathComponent");
    if (v10 && [(SBFolder *)self isValidIndexPath:v10])
    {
      uint64_t v13 = [(SBFolder *)self iconAtIndexPath:v10];
      if ([v13 isFolderIcon])
      {
        long long v14 = [v13 folder];
        long long v15 = objc_msgSend(v6, "sb_indexPathByRemovingFirstIconPathComponent");
        char v8 = [v14 isValidIndexPath:v15 forInsertion:v4];
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
    goto LABEL_17;
  }
  char v8 = -[SBFolder isValidListIndex:](self, "isValidListIndex:", [v6 sbListIndex]);
LABEL_18:

  return v8;
}

- (BOOL)isIconStateDirty
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_iconStateDirty) {
    return 1;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = self->_lists;
  uint64_t v4 = [(SBIconIndexMutableList *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v14 + 1) + 8 * i) isIconStateDirty])
        {

          return 1;
        }
      }
      uint64_t v4 = [(SBIconIndexMutableList *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  uint64_t v10 = 0;
  unint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __28__SBFolder_isIconStateDirty__block_invoke;
  v9[3] = &unk_1E6AAD3D8;
  v9[4] = &v10;
  [(SBFolder *)self enumerateExtraListsUsingBlock:v9];
  BOOL v7 = *((unsigned char *)v11 + 24) != 0;
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __28__SBFolder_isIconStateDirty__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isIconStateDirty];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)markIconStateDirty
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->_iconStateDirty)
  {
    self->_iconStateDirty = 1;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = [(NSHashTable *)self->_folderObservers allObjects];
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
          char v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
          if (objc_opt_respondsToSelector()) {
            [v8 folderIconStateDidDirty:self];
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
}

- (void)markIconStateClean
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  self->_iconStateDirty = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = self->_lists;
  uint64_t v4 = [(SBIconIndexMutableList *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "markIconStateClean", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(SBIconIndexMutableList *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(SBFolder *)self enumerateExtraListsUsingBlock:&__block_literal_global_63];
}

uint64_t __30__SBFolder_markIconStateClean__block_invoke(uint64_t a1, void *a2)
{
  return [a2 markIconStateClean];
}

- (id)_createNewList
{
  return [(SBFolder *)self _createNewListWithIdentifier:0];
}

- (id)_createNewListWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(objc_alloc(-[SBFolder listModelClass](self, "listModelClass")), "initWithUniqueIdentifier:folder:gridSize:gridSizeClassSizes:", v4, self, *(_DWORD *)&self->_listGridSize, self->_iconGridSizeClassSizes);

  uint64_t v6 = [(SBFolder *)self gridSizeClassDomain];
  [v5 setGridSizeClassDomain:v6];
  uint64_t v7 = [(SBFolder *)self listAllowedGridSizeClasses];
  [v5 setAllowedGridSizeClasses:v7];
  objc_msgSend(v5, "setFixedIconLocationBehavior:", -[SBFolder listsFixedIconLocationBehavior](self, "listsFixedIconLocationBehavior"));
  objc_msgSend(v5, "setGridSizeWhenDirectlyContainingNonDefaultSizedIcons:", -[SBFolder listWithNonDefaultSizedIconsGridSize](self, "listWithNonDefaultSizedIconsGridSize"));
  long long v8 = [(SBFolder *)self rotatedIconGridSizeClassSizes];
  [v5 setRotatedIconGridSizeClassSizes:v8];

  return v5;
}

- (id)_createNewListWithIcon:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBFolder *)self _createNewList];
  uint64_t v6 = v5;
  if (v4) {
    [v5 addIcon:v4];
  }

  return v6;
}

- (id)_createNewListWithIcons:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBFolder *)self _createNewList];
  uint64_t v6 = v5;
  if (v4) {
    id v7 = (id)[v5 addIcons:v4];
  }

  return v6;
}

- (unint64_t)indexOfListWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__SBFolder_indexOfListWithIdentifier___block_invoke;
  v8[3] = &unk_1E6AAF210;
  id v5 = v4;
  id v9 = v5;
  long long v10 = &v11;
  [(SBFolder *)self enumerateListsUsingBlock:v8];
  unint64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __38__SBFolder_indexOfListWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = [a2 uniqueIdentifier];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (id)listAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 length];
  if (v5)
  {
    if (v5 > 2)
    {
      id v7 = objc_msgSend(v4, "sb_firstIconPathComponent");
      if (v7)
      {
        int v8 = [(SBFolder *)self iconAtIndexPath:v7];
        if ([v8 isFolderIcon])
        {
          id v9 = [v8 folder];
          long long v10 = objc_msgSend(v4, "sb_indexPathByRemovingFirstIconPathComponent");
          unint64_t v6 = [v9 listAtIndexPath:v10];
        }
        else
        {
          unint64_t v6 = 0;
        }
      }
      else
      {
        unint64_t v6 = 0;
      }
    }
    else
    {
      unint64_t v6 = -[SBFolder listAtIndex:](self, "listAtIndex:", [v4 sbListIndex]);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)nextListIndexAfterIndex:(unint64_t)a3
{
  unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (!-[SBFolder isExtraListIndex:](self, "isExtraListIndex:") && a3 + 1 < [(SBFolder *)self listCount]) {
    return a3 + 1;
  }
  return v5;
}

- (id)nextListAfterIndex:(unint64_t)a3
{
  unint64_t v4 = [(SBFolder *)self nextListIndexAfterIndex:a3];
  if ([(SBFolder *)self isValidListIndex:v4])
  {
    unint64_t v5 = [(SBFolder *)self listAtIndex:v4];
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v5;
}

- (unint64_t)precedingListIndexBeforeIndex:(unint64_t)a3
{
  BOOL v4 = -[SBFolder isExtraListIndex:](self, "isExtraListIndex:");
  if (a3) {
    int v5 = v4;
  }
  else {
    int v5 = 1;
  }
  if (v5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return a3 - 1;
  }
}

- (id)precedingListBeforeIndex:(unint64_t)a3
{
  unint64_t v4 = [(SBFolder *)self precedingListIndexBeforeIndex:a3];
  if ([(SBFolder *)self isValidListIndex:v4])
  {
    int v5 = [(SBFolder *)self listAtIndex:v4];
  }
  else
  {
    int v5 = 0;
  }
  return v5;
}

- (unint64_t)hiddenIndexOfList:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isHidden])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    int v5 = self->_lists;
    uint64_t v6 = [(SBIconIndexMutableList *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      unint64_t v8 = 0;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v5);
          }
          id v11 = *(id *)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v11, "isHidden", (void)v13))
          {
            if (v11 == v4) {
              goto LABEL_13;
            }
            ++v8;
          }
        }
        uint64_t v7 = [(SBIconIndexMutableList *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_13:
  }
  else
  {
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (id)nextVisibleListAfterIndex:(unint64_t)a3
{
  unint64_t v4 = [(SBFolder *)self nextVisibleListIndexAfterIndex:a3];
  if ([(SBFolder *)self isValidListIndex:v4])
  {
    int v5 = [(SBFolder *)self listAtIndex:v4];
  }
  else
  {
    int v5 = 0;
  }
  return v5;
}

- (unint64_t)precedingVisibleListIndexBeforeIndex:(unint64_t)a3
{
  if (!a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if ([(SBFolder *)self listCount] > a3)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, a3);
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x2020000000;
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    lists = self->_lists;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49__SBFolder_precedingVisibleListIndexBeforeIndex___block_invoke;
    v9[3] = &unk_1E6AAD3D8;
    v9[4] = &v10;
    [(SBIconIndexMutableList *)lists enumerateNodesAtIndexes:v6 options:2 usingBlock:v9];
    unint64_t v5 = v11[3];
    _Block_object_dispose(&v10, 8);
  }
  return v5;
}

uint64_t __49__SBFolder_precedingVisibleListIndexBeforeIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isHidden];
  if ((result & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (unint64_t)lastVisibleListIndex
{
  return [(SBIconIndexMutableList *)self->_lists indexOfNodeWithOptions:2 passingTest:&__block_literal_global_72];
}

uint64_t __32__SBFolder_lastVisibleListIndex__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isHidden] ^ 1;
}

- (unint64_t)lastVisibleNonEmptyListIndex
{
  return [(SBIconIndexMutableList *)self->_lists indexOfNodeWithOptions:2 passingTest:&__block_literal_global_74_0];
}

uint64_t __40__SBFolder_lastVisibleNonEmptyListIndex__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isHidden]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [v2 isEmpty] ^ 1;
  }

  return v3;
}

- (SBIconListModel)firstVisibleList
{
  unint64_t v3 = [(SBFolder *)self firstVisibleListIndex];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v4 = 0;
  }
  else
  {
    unint64_t v4 = [(SBFolder *)self listAtIndex:v3];
  }
  return (SBIconListModel *)v4;
}

- (SBIconListModel)lastVisibleList
{
  unint64_t v3 = [(SBFolder *)self lastVisibleListIndex];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v4 = 0;
  }
  else
  {
    unint64_t v4 = [(SBFolder *)self listAtIndex:v3];
  }
  return (SBIconListModel *)v4;
}

- (void)removeAllLists
{
  id v3 = [(SBIconIndexMutableList *)self->_lists nodes];
  [(SBFolder *)self _removeLists:v3];
}

- (id)listWithIdentifier:(id)a3
{
  unint64_t v4 = [(SBFolder *)self indexOfListWithIdentifier:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = 0;
  }
  else
  {
    unint64_t v5 = [(SBFolder *)self listAtIndex:v4];
  }
  return v5;
}

- (id)insertIcon:(id)a3 atIndexPath:(id *)a4 options:(unint64_t)a5
{
  id v9 = a3;
  id v10 = *a4;
  id v11 = v10;
  if (v10) {
    uint64_t v12 = [v10 sbListIndex];
  }
  else {
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v12 == [(SBFolder *)self listCount]) {
    id v13 = [(SBFolder *)self addEmptyList];
  }
  long long v14 = NSStringFromSelector(a2);
  uint64_t v15 = [(SBFolder *)self startCoalescingContentChangesForReason:v14];

  long long v16 = [(SBFolder *)self listAtIndex:v12];
  [(SBFolder *)self _updateOverflowCountInList:v16 forInsertingIcon:v9 removingIcon:0 options:a5];
  objc_super v36 = v11;
  if (v11) {
    unint64_t v17 = [v11 sbIconIndex];
  }
  else {
    unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v17 >= [v16 numberOfIcons])
  {
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = [v16 iconAtIndex:v17];
  }
  uint64_t v19 = objc_msgSend(v36, "bs_subpathFromPosition:", 2);
  char v38 = 0;
  uint64_t v35 = v18;
  uint64_t v33 = (void *)v15;
  uint64_t v34 = a4;
  uint64_t v32 = v16;
  if ([v18 isFolderIcon] && objc_msgSend(v19, "length"))
  {
    long long v20 = [v18 folder];
    id v37 = v19;
    uint64_t v21 = v9;
    long long v22 = [v20 insertIcon:v9 atIndexPath:&v37 options:a5];
    id v23 = v37;

    if (v22)
    {
      char v24 = [(SBFolder *)self addIcons:v22 options:16];

      char v38 = 1;
    }
    else
    {
      char v24 = 0;
    }
    uint64_t v19 = v23;
  }
  else
  {
    uint64_t v25 = [(id)objc_opt_class() listModelMutationOptionsForFolderMutationOptions:a5];
    long long v26 = [(SBFolder *)self listAtIndex:v12];
    long long v27 = [v26 insertIcon:v9 atIndex:v17 options:v25];
    char v24 = [(SBFolder *)self _handleBumpedIcons:v27 afterInsertingIconIntoListAtIndex:v12 listGridCellInfoOptions:0 mutationOptions:a5 didBump:&v38];

    uint64_t v21 = v9;
    if ([v24 containsObject:v9]) {
      char v38 = 1;
    }
  }
  [v33 invalidate];
  long long v28 = [MEMORY[0x1E4F28D58] indexPathWithIconIndex:v17 listIndex:v12];
  if (v38)
  {
    uint64_t v29 = [(SBFolder *)self indexPathForIcon:v21];

    long long v28 = (void *)v29;
  }
  if (v28)
  {
    objc_msgSend(v19, "bs_indexPathByAddingPrefix:", v28);
    id v30 = objc_claimAutoreleasedReturnValue();
    *uint64_t v34 = v30;
  }
  else
  {
    *uint64_t v34 = 0;
  }

  return v24;
}

- (void)_updateOverflowCountInList:(id)a3 forInsertingIcon:(id)a4 removingIcon:(id)a5 options:(unint64_t)a6
{
  char v6 = a6;
  id v21 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((v6 & 4) == 0)
  {
    uint64_t v11 = [v21 overflowSlotCount];
    if (v11)
    {
      unint64_t v12 = v11;
      if (v9 && ([v9 isPlaceholder] & 1) == 0)
      {
        id v13 = [v21 iconGridSizeClassSizes];
        long long v14 = [v9 gridSizeClass];
        int v15 = [v13 gridSizeForGridSizeClass:v14];

        v12 += SBHIconGridSizeGetArea(v15);
      }
      if (v10 && ([v10 isPlaceholder] & 1) == 0)
      {
        unint64_t v17 = [v21 iconGridSizeClassSizes];
        uint64_t v18 = [v10 gridSizeClass];
        int v19 = [v17 gridSizeForGridSizeClass:v18];

        unsigned int Area = SBHIconGridSizeGetArea(v19);
        long long v16 = v21;
        if (v12 >= Area) {
          v12 -= Area;
        }
        else {
          unint64_t v12 = 0;
        }
      }
      else
      {
        long long v16 = v21;
      }
      [v16 setOverflowSlotCount:v12];
    }
  }
}

- (void)_updateOverflowCountInList:(id)a3 forResizingIcon:(id)a4 fromGridSizeClass:(id)a5 options:(unint64_t)a6
{
  char v6 = a6;
  id v22 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((v6 & 4) == 0)
  {
    uint64_t v11 = [v22 overflowSlotCount];
    if (v11)
    {
      unint64_t v12 = v11;
      id v13 = [v9 gridSizeClass];
      int v14 = [v22 gridSizeForGridSizeClass:v13];
      int v15 = [v22 gridSizeForGridSizeClass:v10];
      unsigned int Area = SBHIconGridSizeGetArea(v14);
      unsigned int v17 = SBHIconGridSizeGetArea(v15);
      unint64_t v18 = v17 - Area;
      BOOL v19 = v12 >= v18;
      unint64_t v20 = v12 - v18;
      if (!v19) {
        unint64_t v20 = 0;
      }
      if (v17 <= Area) {
        unint64_t v21 = v12;
      }
      else {
        unint64_t v21 = v20;
      }
      [v22 setOverflowSlotCount:v21];
    }
  }
}

- (id)_handleBumpedIcons:(id)a3 afterInsertingIconIntoListAtIndex:(unint64_t)a4 listGridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6 didBump:(BOOL *)a7
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  uint64_t v13 = [(id)objc_opt_class() listModelMutationOptionsForFolderMutationOptions:a6];
  uint64_t v14 = v13 | 1;
  long long v59 = a7;
  if (!v12 || (a6 & 2) == 0)
  {
    BOOL v15 = 0;
    goto LABEL_60;
  }
  uint64_t v58 = v13 | 1;
  uint64_t v16 = [(id)objc_opt_class() listModelMutationOptionsForFolderMutationOptions:a6];
  unint64_t v56 = a4;
  char v57 = a6;
  if ([(SBFolder *)self isValidListIndex:a4])
  {
    unsigned int v17 = [(SBFolder *)self listAtIndex:a4];
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v12 = v12;
    uint64_t v18 = [v12 countByEnumeratingWithState:&v68 objects:v73 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      unint64_t v20 = 0;
      uint64_t v21 = *(void *)v69;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v69 != v21) {
            objc_enumerationMutation(v12);
          }
          uint64_t v23 = *(void *)(*((void *)&v68 + 1) + 8 * i);
          if ([v17 bestGridCellIndexForInsertingIcon:v23 gridCellInfoOptions:a5] != 0x7FFFFFFFFFFFFFFFLL
            && [v17 addIcon:v23 options:v16 & 0xFFFFFFFFFFFFFE73 | 8])
          {
            if (!v20) {
              unint64_t v20 = (void *)[v12 mutableCopy];
            }
            [v20 removeObject:v23];
          }
        }
        uint64_t v19 = [v12 countByEnumeratingWithState:&v68 objects:v73 count:16];
      }
      while (v19);

      if (!v20)
      {
        LOBYTE(a6) = v57;
        uint64_t v14 = v58;
        a4 = v56;
        goto LABEL_23;
      }
      id v24 = v20;

      id v12 = v24;
      LOBYTE(a6) = v57;
      uint64_t v14 = v58;
      a4 = v56;
    }
    else
    {
      uint64_t v14 = v58;
    }

LABEL_23:
    goto LABEL_24;
  }
  uint64_t v14 = v58;
LABEL_24:
  unint64_t v25 = [(SBFolder *)self nextVisibleListIndexAfterIndex:a4];
  if ([(SBFolder *)self isValidListIndex:v25]
    && [(SBFolder *)self isTrailingEmptyListIndex:v25])
  {
    unint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ([(SBFolder *)self isValidListIndex:v25])
  {
    long long v26 = [(SBFolder *)self listAtIndex:v25];
    if (v26 && [v12 count])
    {
      int v27 = 0;
      long long v28 = v26;
      while (([v28 allowsAddingIcons:v12] & 1) != 0 || objc_msgSend(v28, "overflowSlotCount"))
      {
        uint64_t v29 = [v28 overflowSlotCount];
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id v30 = v12;
        uint64_t v31 = [v30 countByEnumeratingWithState:&v64 objects:v72 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          unsigned int v33 = 0;
          uint64_t v34 = *(void *)v65;
          do
          {
            for (uint64_t j = 0; j != v32; ++j)
            {
              if (*(void *)v65 != v34) {
                objc_enumerationMutation(v30);
              }
              objc_super v36 = [*(id *)(*((void *)&v64 + 1) + 8 * j) gridSizeClass];
              v33 += [(SBHIconGridSizeClassSizeMap *)self->_iconGridSizeClassSizes gridSizeAreaForGridSizeClass:v36];
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v64 objects:v72 count:16];
          }
          while (v32);
        }
        else
        {
          unsigned int v33 = 0;
        }

        id v12 = [v28 insertIcons:v30 atIndex:0 options:v58];

        [v28 setOverflowSlotCount:v29 + v33];
        unint64_t v25 = [(SBFolder *)self nextVisibleListIndexAfterIndex:v25];
        if (![(SBFolder *)self isValidListIndex:v25])
        {

          long long v26 = 0;
          int v27 = 1;
          LOBYTE(a6) = v57;
          uint64_t v14 = v58;
          a4 = v56;
          goto LABEL_48;
        }
        long long v26 = [(SBFolder *)self listAtIndex:v25];

        a4 = v56;
        LOBYTE(a6) = v57;
        if (!v26)
        {
          int v27 = 1;
          uint64_t v14 = v58;
          goto LABEL_48;
        }
        int v27 = 1;
        long long v28 = v26;
        uint64_t v14 = v58;
        if (![v12 count]) {
          goto LABEL_48;
        }
      }
      long long v26 = v28;
      goto LABEL_48;
    }
  }
  else
  {
    long long v26 = 0;
  }
  int v27 = 0;
LABEL_48:
  if ([v12 count])
  {
    while (1)
    {
      if (![(SBFolder *)self isValidListIndex:v25])
      {
        unint64_t v25 = [(SBFolder *)self lastVisibleNonEmptyListIndex] + 1;
        if (![(SBFolder *)self isValidListIndex:v25]) {
          unint64_t v25 = [(SBFolder *)self listCount];
        }
      }
      id v37 = [(SBFolder *)self insertEmptyListRemovingLeastRecentlyHiddenListIfNecessaryAtIndex:v25];

      if (!v37) {
        break;
      }
      char v38 = [v37 insertIcons:v12 atIndex:0 options:v14];
      if (BSEqualArrays())
      {
        [(SBFolder *)self removeList:v37];

        break;
      }

      objc_msgSend(v37, "setOverflowSlotCount:", objc_msgSend(v37, "numberOfUsedSlots"));
      ++v25;
      int v27 = 1;
      id v12 = v38;
      long long v26 = v37;
      if (![v38 count]) {
        goto LABEL_59;
      }
    }
    char v38 = v12;
  }
  else
  {
    char v38 = v12;
    id v37 = v26;
  }
LABEL_59:

  BOOL v15 = v27 != 0;
  id v12 = v38;
LABEL_60:
  unint64_t v39 = [(SBFolder *)self nextVisibleListIndexAfterIndex:a4];
  if (v39 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([(SBFolder *)self isExtraListIndex:a4])
    {
      unint64_t v40 = [(SBFolder *)self firstVisibleListIndex];
      int v41 = 1;
    }
    else
    {
      int v41 = 0;
      unint64_t v40 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    unint64_t v40 = v39;
    int v41 = 0;
  }
  uint64_t v42 = [v12 count];
  if ((a6 & 1) != 0 || !v42)
  {
    uint64_t v47 = v12;
  }
  else
  {
    uint64_t v43 = v12;
    if (v40 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v47 = v12;
    }
    else
    {
      BOOL v15 = 1;
      do
      {
        id v44 = [(SBFolder *)self listAtIndex:v40];
        uint64_t v45 = v44;
        if (v41) {
          uint64_t v46 = [v44 numberOfIcons];
        }
        else {
          uint64_t v46 = 0;
        }
        uint64_t v47 = [v45 insertIcons:v43 atIndex:v46 options:v14];

        unint64_t v40 = [(SBFolder *)self nextVisibleListIndexAfterIndex:v40];
        if (![v47 count]) {
          break;
        }
        uint64_t v43 = v47;
      }
      while (v40 != 0x7FFFFFFFFFFFFFFFLL);
    }
  }
  unint64_t v48 = [(SBFolder *)self visibleListCount];
  unint64_t v49 = [(SBFolder *)self maxListCount];
  if ([v47 count] && v48 < v49 && (a6 & 1) == 0)
  {
    BOOL v15 = 1;
    v50 = [(SBFolder *)self addListWithIcons:v47 removingHiddenListsIfNecessary:1];
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __113__SBFolder__handleBumpedIcons_afterInsertingIconIntoListAtIndex_listGridCellInfoOptions_mutationOptions_didBump___block_invoke;
    v62[3] = &unk_1E6AAF238;
    id v51 = v47;
    id v63 = v51;
    uint64_t v52 = [v50 directlyContainedIconsPassingTest:v62];
    if ([v52 isEqualToArray:v51])
    {
      uint64_t v47 = 0;
    }
    else
    {
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __113__SBFolder__handleBumpedIcons_afterInsertingIconIntoListAtIndex_listGridCellInfoOptions_mutationOptions_didBump___block_invoke_2;
      v60[3] = &unk_1E6AAF238;
      id v53 = v52;
      id v61 = v53;
      long long v54 = [v51 indexesOfObjectsPassingTest:v60];
      uint64_t v47 = [v51 objectsAtIndexes:v54];

      BOOL v15 = [v53 count] != 0;
      id v51 = v61;
    }
  }
  if (v59) {
    *long long v59 = v15;
  }
  return v47;
}

uint64_t __113__SBFolder__handleBumpedIcons_afterInsertingIconIntoListAtIndex_listGridCellInfoOptions_mutationOptions_didBump___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

uint64_t __113__SBFolder__handleBumpedIcons_afterInsertingIconIntoListAtIndex_listGridCellInfoOptions_mutationOptions_didBump___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (id)insertIcons:(id)a3 atIndexPath:(id)a4 options:(unint64_t)a5
{
  id v8 = a4;
  id v9 = (void *)MEMORY[0x1E4F1CA48];
  id v10 = a3;
  uint64_t v11 = [v9 array];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __44__SBFolder_insertIcons_atIndexPath_options___block_invoke;
  id v22 = &unk_1E6AAF260;
  id v12 = v8;
  unint64_t v26 = a5;
  id v23 = v12;
  id v24 = self;
  id v13 = v11;
  id v25 = v13;
  [v10 enumerateObjectsWithOptions:2 usingBlock:&v19];

  if (objc_msgSend(v13, "count", v19, v20, v21, v22)) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  id v15 = v14;
  if (v15)
  {
    uint64_t v16 = v15;
    unsigned int v17 = -[SBFolder _handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:](self, "_handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:", v15, [v12 sbListIndex], 0, a5, 0);
  }
  else
  {
    unsigned int v17 = 0;
  }

  return v17;
}

void __44__SBFolder_insertIcons_atIndexPath_options___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    uint64_t v5 = *(void *)(a1 + 56) | 0x400000;
  }
  else {
    uint64_t v5 = *(void *)(a1 + 56);
  }
  char v6 = *(void **)(a1 + 40);
  id v10 = *(id *)(a1 + 32);
  id v7 = v10;
  id v8 = [v6 insertIcon:a2 atIndexPath:&v10 options:v5];
  id v9 = v10;

  if (v8) {
    [*(id *)(a1 + 48) addObjectsFromArray:v8];
  }
}

- (id)insertIcon:(id)a3 atGridPath:(id)a4 options:(unint64_t)a5
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = self;
  id v12 = [v10 folderIdentifier];
  id v13 = v11;
  if (v12)
  {
    id v13 = [(SBFolder *)v11 folderWithUniqueIdentifier:v12];
  }
  if (v13)
  {
    if (v13 == v11)
    {
      id v15 = [v10 listIdentifier];
      uint64_t v16 = [(SBFolder *)v11 listWithIdentifier:v15];
      if (v16)
      {
        long long v28 = v15;
        uint64_t v25 = [(SBFolder *)v11 indexOfList:v16];
        unsigned int v17 = NSStringFromSelector(a2);
        int v27 = [(SBFolder *)v11 startCoalescingContentChangesForReason:v17];

        [(SBFolder *)v11 _updateOverflowCountInList:v16 forInsertingIcon:v9 removingIcon:0 options:a5];
        unint64_t v26 = [v9 gridSizeClass];
        LODWORD(v17) = objc_msgSend(v16, "gridSizeForGridSizeClass:");
        uint64_t v18 = [v10 gridCellIndex];
        uint64_t v19 = [v10 gridCellInfoOptions];
        uint64_t v29 = v17;
        uint64_t v30 = [v16 bestGridCellIndexForInsertingIcon:v9 atGridCellIndex:v18 gridCellInfoOptions:v19];
        uint64_t v20 = [(id)objc_opt_class() listModelMutationOptionsForFolderMutationOptions:a5];
        uint64_t v24 = v18;
        int v21 = [v16 isInsertionFixedForIcon:v9 atGridCellIndex:v18 gridCellInfoOptions:v19 mutationOptions:v20];
        if ((objc_msgSend(v16, "isValidGridRange:options:", v30, v29, v19) & 1) != 0 || v21)
        {
          id v22 = [v16 insertIcon:v9 atGridCellIndex:v24 gridCellInfoOptions:v19 mutationOptions:v20];
          uint64_t v14 = [(SBFolder *)v11 _handleBumpedIcons:v22 afterInsertingIconIntoListAtIndex:v25 listGridCellInfoOptions:v19 mutationOptions:a5 didBump:0];
        }
        else if ([v16 addIcon:v9 gridCellInfoOptions:v19 mutationOptions:v20])
        {
          uint64_t v14 = 0;
        }
        else
        {
          id v31 = v9;
          uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
        }
        id v15 = v28;
        [v27 invalidate];
      }
      else
      {
        v32[0] = v9;
        uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
      }
    }
    else
    {
      uint64_t v14 = [(SBFolder *)v13 insertIcon:v9 atGridPath:v10 options:a5];
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)insertIcons:(id)a3 atGridPath:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(SBFolder *)self listAtGridPath:v9];
  if (v10
    && (uint64_t v11 = [v9 gridCellIndex],
        uint64_t v12 = [v9 gridCellInfoOptions],
        objc_msgSend(v10, "insertIcons:atGridCellIndex:gridCellInfoOptions:mutationOptions:", v8, v11, v12, objc_msgSend((id)objc_opt_class(), "listModelMutationOptionsForFolderMutationOptions:", a5)), (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v14 = (void *)v13;
    id v15 = [(SBFolder *)self folderContainingGridPath:v9];
    uint64_t v16 = v15;
    if (v15 != self)
    {
      uint64_t v17 = [(SBFolder *)v15 _handleBumpedIcons:v14 afterInsertingIconIntoListAtIndex:[(SBFolder *)v15 indexOfList:v10] listGridCellInfoOptions:v12 mutationOptions:a5 didBump:0];

      uint64_t v14 = (void *)v17;
    }
    uint64_t v18 = [(SBFolder *)self indexPathForList:v10];
    uint64_t v19 = -[SBFolder _handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:](self, "_handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:", v14, [v18 sbListIndex], v12, a5, 0);
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

- (id)insertIcon:(id)a3 beforeIcon:(id)a4 options:(unint64_t)a5 listGridCellInfoOptions:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = [(SBFolder *)self indexPathForIcon:v12];
  uint64_t v14 = [(SBFolder *)self folderContainingIndexPath:v13 relativeIndexPath:0];
  id v15 = v14;
  if (v14 == self)
  {
    uint64_t v17 = NSStringFromSelector(a2);
    id v23 = [(SBFolder *)self startCoalescingContentChangesForReason:v17];

    uint64_t v18 = [v13 sbListIndex];
    uint64_t v19 = [(SBFolder *)self listAtIndex:v18];
    uint64_t v20 = objc_msgSend(v19, "insertIcon:beforeIcon:gridCellInfoOptions:mutationOptions:", v11, v12, a6, objc_msgSend((id)objc_opt_class(), "listModelMutationOptionsForFolderMutationOptions:", a5));
    if (v20)
    {
      int v21 = (void *)v20;
      uint64_t v16 = [(SBFolder *)self _handleBumpedIcons:v20 afterInsertingIconIntoListAtIndex:v18 listGridCellInfoOptions:a6 mutationOptions:a5 didBump:0];
    }
    else
    {
      uint64_t v16 = 0;
    }
    [v23 invalidate];
  }
  else
  {
    uint64_t v16 = [(SBFolder *)v14 insertIcon:v11 beforeIcon:v12 options:a5 listGridCellInfoOptions:a6];
  }

  return v16;
}

- (id)insertIcon:(id)a3 afterIcon:(id)a4 options:(unint64_t)a5 listGridCellInfoOptions:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = [(SBFolder *)self indexPathForIcon:v12];
  uint64_t v14 = [(SBFolder *)self folderContainingIndexPath:v13 relativeIndexPath:0];
  id v15 = v14;
  if (v14 == self)
  {
    uint64_t v17 = NSStringFromSelector(a2);
    id v23 = [(SBFolder *)self startCoalescingContentChangesForReason:v17];

    uint64_t v18 = [v13 sbListIndex];
    uint64_t v19 = [(SBFolder *)self listAtIndex:v18];
    uint64_t v20 = objc_msgSend(v19, "insertIcon:afterIcon:gridCellInfoOptions:mutationOptions:", v11, v12, a6, objc_msgSend((id)objc_opt_class(), "listModelMutationOptionsForFolderMutationOptions:", a5));
    if (v20)
    {
      int v21 = (void *)v20;
      uint64_t v16 = [(SBFolder *)self _handleBumpedIcons:v20 afterInsertingIconIntoListAtIndex:v18 listGridCellInfoOptions:a6 mutationOptions:a5 didBump:0];
    }
    else
    {
      uint64_t v16 = 0;
    }
    [v23 invalidate];
  }
  else
  {
    uint64_t v16 = [(SBFolder *)v14 insertIcon:v11 afterIcon:v12 options:a5 listGridCellInfoOptions:a6];
  }

  return v16;
}

- (void)replaceIconAtGridPath:(id)a3 withIcon:(id)a4 options:(unint64_t)a5
{
  id v7 = a4;
  id v8 = [(SBFolder *)self iconAtGridPath:a3];
  [(SBFolder *)self replaceIcon:v8 withIcon:v7];
}

- (BOOL)replaceIcon:(id)a3 withIcon:(id)a4
{
  return [(SBFolder *)self replaceIcon:a3 withIcon:a4 options:0];
}

- (BOOL)replaceIcon:(id)a3 withIcon:(id)a4 options:(unint64_t)a5
{
  id v8 = a4;
  id v9 = [(SBFolder *)self indexPathForIcon:a3];
  if (v9) {
    BOOL v10 = [(SBFolder *)self replaceIconAtIndexPath:v9 withIcon:v8 options:a5];
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)replaceIconAtIndexPath:(id)a3 withIcon:(id)a4 options:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = [(SBFolder *)self iconAtIndexPath:v9];
  id v12 = [(SBFolder *)self folderContainingIndexPath:v9 relativeIndexPath:0];
  uint64_t v13 = v12;
  if (v12 == self)
  {
    id v15 = NSStringFromSelector(a2);
    uint64_t v16 = [(SBFolder *)self startCoalescingContentChangesForReason:v15];

    if (v9) {
      uint64_t v17 = [v9 sbListIndex];
    }
    else {
      uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
    }
    uint64_t v18 = [(SBFolder *)self listAtIndex:v17];
    uint64_t v19 = objc_msgSend(v18, "replaceIcon:withIcon:options:", v11, v10, objc_msgSend((id)objc_opt_class(), "listModelMutationOptionsForFolderMutationOptions:", a5));
    if (v19) {
      id v20 = [(SBFolder *)self _handleBumpedIcons:v19 afterInsertingIconIntoListAtIndex:v17 listGridCellInfoOptions:0 mutationOptions:a5 didBump:0];
    }
    if ((a5 & 0x800000) != 0)
    {
      [(SBFolder *)self _updateOverflowCountInList:v18 forInsertingIcon:v10 removingIcon:v11 options:a5];
      [(SBFolder *)self _compactContiguousOverflowListsStartingAtListIndex:v17 withoutMovingIconsPassingTest:0 removeEmptyLists:1];
    }
    [v16 invalidate];

    char v14 = 1;
  }
  else
  {
    char v14 = [(SBFolder *)v12 replaceIcon:v11 withIcon:v10 options:a5];
  }

  return v14;
}

- (id)replaceIcon:(id)a3 withIcons:(id)a4 options:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = [(SBFolder *)self indexPathForIcon:v9];
  if (v11)
  {
    id v12 = [(SBFolder *)self folderContainingIndexPath:v11 relativeIndexPath:0];
    uint64_t v13 = v12;
    if (v12 == self)
    {
      id v15 = NSStringFromSelector(a2);
      uint64_t v16 = [(SBFolder *)self startCoalescingContentChangesForReason:v15];

      uint64_t v17 = [(SBFolder *)self listContainingIndexPath:v11 relativeIndex:0];
      uint64_t v18 = objc_msgSend(v17, "replaceIcon:withIcons:options:", v9, v10, objc_msgSend((id)objc_opt_class(), "listModelMutationOptionsForFolderMutationOptions:", a5));
      id v14 = [(SBFolder *)self _handleBumpedIcons:v18 afterInsertingIconIntoListAtIndex:[(SBFolder *)self indexOfList:v17] listGridCellInfoOptions:0 mutationOptions:a5 didBump:0];

      [v16 invalidate];
    }
    else
    {
      id v14 = [(SBFolder *)v12 replaceIcon:v9 withIcons:v10 options:a5];
    }
  }
  else
  {
    id v14 = v10;
  }

  return v14;
}

- (id)replaceIcon:(id)a3 withIcons:(id)a4 options:(unint64_t)a5 listGridCellInfoOptions:(unint64_t)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  unint64_t v39 = v9;
  id v11 = [(SBFolder *)self gridPathForIcon:v9 listGridCellInfoOptions:a6];
  id v12 = v11;
  if (v11)
  {
    uint64_t v13 = [v11 folderIdentifier];
    unsigned int v33 = (void *)v13;
    if (v13)
    {
      id v14 = [(SBFolder *)self folderWithUniqueIdentifier:v13];
    }
    else
    {
      id v14 = self;
    }
    id v15 = v14;
    char v38 = [(SBFolder *)self listAtGridPath:v12];
    uint64_t v34 = v12;
    id v31 = [v12 listIdentifier];
    uint64_t v32 = v15;
    uint64_t v36 = -[SBFolder indexOfListWithIdentifier:](v15, "indexOfListWithIdentifier:");
    id v40 = (id)[v10 mutableCopy];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v35 = v10;
    obuint64_t j = v10;
    uint64_t v16 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      id v18 = 0;
      uint64_t v19 = *(void *)v43;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v43 != v19) {
            objc_enumerationMutation(obj);
          }
          int v21 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          uint64_t v22 = [v21 gridSizeClass];
          if (!v22
            || (id v23 = (void *)v22,
                [v21 gridSizeClass],
                uint64_t v24 = objc_claimAutoreleasedReturnValue(),
                int v25 = [v24 isEqualToString:@"SBHIconGridSizeClassDefault"],
                v24,
                v23,
                unint64_t v26 = a5 | 2,
                v25))
          {
            unint64_t v26 = a5;
          }
          if (v18)
          {
            int v27 = [(SBFolder *)self insertIcon:v21 afterIcon:v18 options:v26 listGridCellInfoOptions:a6];
          }
          else
          {
            int v27 = objc_msgSend(v38, "replaceIcon:withIcon:gridCellInfoOptions:mutationOptions:", v39, v21, a6, objc_msgSend((id)objc_opt_class(), "listModelMutationOptionsForFolderMutationOptions:", v26));
            if ([v27 count])
            {
              uint64_t v28 = [(SBFolder *)self _handleBumpedIcons:v27 afterInsertingIconIntoListAtIndex:v36 listGridCellInfoOptions:a6 mutationOptions:v26 didBump:0];

              int v27 = (void *)v28;
            }
            if ((a5 & 0x800000) != 0)
            {
              [(SBFolder *)self _updateOverflowCountInList:v38 forInsertingIcon:v21 removingIcon:v39 options:a5];
              [(SBFolder *)self _compactContiguousOverflowListsStartingAtListIndex:v36 withoutMovingIconsPassingTest:0 removeEmptyLists:1];
            }
            id v18 = v21;
          }
          if ([v27 count])
          {
            uint64_t v29 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v27, "count"));
            [v40 insertObjects:v27 atIndexes:v29];

            goto LABEL_27;
          }
          [v40 removeObject:v21];
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v18 = 0;
    }
LABEL_27:

    id v12 = v34;
    id v10 = v35;
  }
  else
  {
    id v40 = 0;
  }

  return v40;
}

+ (unint64_t)listModelMutationOptionsForFolderMutationOptions:(unint64_t)a3
{
  return (a3 >> 1) & 0x7CC | (a3 >> 2) & 0x100000 | (a3 >> 3) & 0x200000;
}

- (void)removeIconAtIndexPath:(id)a3 options:(unint64_t)a4
{
  id v7 = a3;
  id v16 = 0;
  id v8 = [(SBFolder *)self folderContainingIndexPath:v7 relativeIndexPath:&v16];
  id v9 = v16;
  id v10 = [(SBFolder *)self iconAtIndexPath:v7];
  id v11 = -[SBFolder listAtIndex:](v8, "listAtIndex:", [v9 sbListIndex]);
  if (v8 == self)
  {
    id v12 = NSStringFromSelector(a2);
    uint64_t v13 = [(SBFolder *)self startCoalescingContentChangesForReason:v12];

    uint64_t v14 = [(id)objc_opt_class() listModelMutationOptionsForFolderMutationOptions:a4];
    if (v7) {
      uint64_t v15 = [v7 sbIconIndex];
    }
    else {
      uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
    [v11 removeIconAtIndex:v15 options:v14];
    [v13 invalidate];
  }
  else
  {
    [(SBFolder *)v8 removeIconAtIndexPath:v9 options:a4];
  }
  [(SBFolder *)self didExplicitlyRemoveIcon:v10 fromList:v11 inFolder:v8 options:a4];
}

- (void)didExplicitlyRemoveIcon:(id)a3 fromList:(id)a4 inFolder:(id)a5 options:(unint64_t)a6
{
  id v18 = a3;
  id v10 = a4;
  id v11 = (SBFolder *)a5;
  id v12 = v11;
  if (v11 == self)
  {
    if ((a6 & 0x800000) == 0)
    {
      if ((a6 & 0x100000) == 0) {
        goto LABEL_15;
      }
LABEL_27:
      [(SBFolder *)v12 compactLists];
      if ((a6 & 0x4000000) == 0) {
        goto LABEL_17;
      }
LABEL_16:
      [(SBFolder *)v12 compactListsInDescendents];
      goto LABEL_17;
    }
    [(SBFolder *)v11 _updateOverflowCountInList:v10 forInsertingIcon:0 removingIcon:v18 options:a6];
    uint64_t v16 = [(SBFolder *)v12 indexOfList:v10];
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      NSLog(&cfstr_CanTFindListTh.isa);
      if ((a6 & 0x100000) != 0) {
        goto LABEL_27;
      }
    }
    else
    {
      [(SBFolder *)v12 _compactContiguousOverflowListsStartingAtListIndex:v16 withoutMovingIconsPassingTest:0 removeEmptyLists:1];
      if ((a6 & 0x100000) != 0) {
        goto LABEL_27;
      }
    }
LABEL_15:
    if ((a6 & 0x4000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if ((a6 & 0x200000) == 0) {
    goto LABEL_5;
  }
  uint64_t v13 = [(SBFolder *)v11 parentFolder];
  if (v13 != self) {
    goto LABEL_4;
  }
  BOOL v17 = [(SBFolder *)v12 isEmpty];

  if (v17)
  {
    uint64_t v13 = [(SBFolder *)v12 icon];
    if (v13) {
      [(SBFolder *)self removeIcon:v13 options:0];
    }
LABEL_4:
  }
LABEL_5:
  if ((a6 & 0x2000000) != 0
    && [(SBFolder *)v12 isCancelable]
    && [(SBFolder *)v12 containsOneIcon])
  {
    uint64_t v14 = [(SBFolder *)v12 icon];
    uint64_t v15 = [(SBFolder *)v12 firstIcon];
    if (v14) {
      [(SBFolder *)self replaceIcon:v14 withIcon:v15];
    }
  }
  if ((a6 & 0x4100000) != 0) {
    [(SBFolder *)v12 compactLists];
  }
LABEL_17:
}

- (void)_swapInsertIcons:(id)a3 atIndexPaths:(id)a4
{
  id v26 = a3;
  id v24 = a4;
  if ([v26 count])
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = [v26 objectAtIndexedSubscript:v6];
      id v8 = [v24 objectAtIndexedSubscript:v6];
      id v9 = v8;
      if (v8)
      {
        uint64_t v10 = [v8 sbListIndex];
        uint64_t v11 = [v9 sbIconIndex];
      }
      else
      {
        uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
      }
      id v12 = [(SBFolder *)self listAtIndex:v10];
      id v13 = v7;
      if (v13)
      {
        uint64_t v14 = [MEMORY[0x1E4F28D58] indexPathWithIconIndex:v11 listIndex:v10];
        id v25 = v13;
        if ([(SBFolder *)self isValidIndexPath:v14])
        {
          id v15 = 0;
          while (1)
          {
            uint64_t v16 = [(SBFolder *)self iconAtIndexPath:v14];

            if (!v16)
            {
              id v15 = v13;
              goto LABEL_22;
            }
            [v12 removeIcon:v16];
            id v17 = (id)[v12 insertIcon:v13 atIndex:v11];
            id v15 = v16;

            id v18 = [(SBFolder *)self listAtIndex:[(SBFolder *)self lastVisibleListIndex]];

            if (v12 == v18)
            {
              int v21 = [(SBFolder *)self addEmptyListRemovingLeastRecentlyHiddenListIfNecessary];
              if (!v21)
              {

                uint64_t v14 = v15;
                goto LABEL_23;
              }
              uint64_t v10 = [(SBFolder *)self indexOfList:v21];
              uint64_t v20 = [(SBFolder *)self listAtIndex:v10];
            }
            else
            {
              unint64_t v19 = [(SBFolder *)self nextVisibleListIndexAfterIndex:v10];
              if (v19 == 0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v20 = [(SBFolder *)self addEmptyListRemovingLeastRecentlyHiddenListIfNecessary];

                if (!v20)
                {

                  id v12 = 0;
                  goto LABEL_23;
                }
                uint64_t v10 = [(SBFolder *)self indexOfList:v20];
              }
              else
              {
                uint64_t v10 = v19;
                uint64_t v20 = [(SBFolder *)self listAtIndex:v19];
              }
            }
            id v12 = (void *)v20;

            uint64_t v14 = [MEMORY[0x1E4F28D58] indexPathWithIconIndex:v11 listIndex:v10];
            BOOL v22 = [(SBFolder *)self isValidIndexPath:v14];
            id v23 = v15;
            id v13 = v15;
            if (!v22) {
              goto LABEL_20;
            }
          }
        }
        id v23 = 0;
        id v15 = v13;
LABEL_20:

        id v13 = v15;
LABEL_22:
        [v12 addIcon:v13];
LABEL_23:

        id v13 = v25;
      }

      ++v6;
    }
    while (v6 < [v26 count]);
  }
}

- (void)_swapRestoreIconCount:(unint64_t)a3 toLocation:(id)a4
{
  *(void *)&v35[5] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = v6;
  if (a3)
  {
    if (v6)
    {
      uint64_t v8 = [v6 sbListIndex];
      unint64_t v9 = [v7 sbIconIndex];
    }
    else
    {
      uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
      unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
    uint64_t v10 = [(SBFolder *)self listAtIndex:v8];
    uint64_t v11 = [(SBFolder *)self nextVisibleListAfterIndex:v8];
    if (v11)
    {
      id v12 = (void *)v11;
      uint64_t v32 = v7;
      unint64_t v33 = a3;
      id v13 = 0;
      uint64_t v14 = 0;
      while (1)
      {
        id v15 = [v12 icons];
        uint64_t v16 = [v15 count];

        if (!v16)
        {
          uint64_t v29 = v14;
          uint64_t v14 = v13;
          id v17 = v12;
          goto LABEL_28;
        }
        id v17 = [v12 icons];

        uint64_t v18 = [v17 count];
        if (v9 <= v18 - 1)
        {
          int v25 = 0;
          if (v18 - v9 >= v33) {
            unint64_t v23 = v33;
          }
          else {
            unint64_t v23 = v18 - v9;
          }
          unint64_t v24 = v9;
        }
        else
        {
          unint64_t v19 = [v12 icons];
          unint64_t v20 = [v19 count];

          int v21 = [v12 icons];
          uint64_t v22 = [v21 count];
          unint64_t v23 = v22;
          if (v20 >= v33)
          {
            unint64_t v24 = v22 - v33;

            unint64_t v23 = v33;
            int v25 = 0;
          }
          else
          {

            unint64_t v24 = 0;
            int v25 = 1;
          }
        }
        id v26 = [v12 icons];
        int v27 = objc_msgSend(v26, "subarrayWithRange:", v24, v23);

        unint64_t v28 = [v10 numberOfUsedSlots];
        if (v28 >= [v27 count])
        {
          uint64_t v14 = v27;
        }
        else
        {
          uint64_t v14 = objc_msgSend(v27, "subarrayWithRange:", 0, objc_msgSend(v10, "numberOfUsedSlots"));
        }
        uint64_t v29 = [v10 insertIcons:v14 atIndex:v9 options:1];
        if (v29)
        {
          uint64_t v30 = SBLogCommon();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            [(SBFolder *)v34 _swapRestoreIconCount:(uint64_t *)v35 toLocation:v30];
          }
        }
        if (v25) {
          break;
        }
        id v31 = v12;

        id v12 = [(SBFolder *)self nextVisibleListAfterIndex:[(SBFolder *)self indexOfList:v31]];

        uint64_t v10 = v31;
        id v13 = v17;
        if (!v12)
        {
          uint64_t v29 = v14;
          uint64_t v14 = v17;
          uint64_t v10 = v31;
          id v17 = 0;
          goto LABEL_28;
        }
      }
      [(SBFolder *)self removeList:v12];

LABEL_28:
      id v7 = v32;
    }
  }
}

- (id)addIcon:(id)a3
{
  return [(SBFolder *)self addIcon:a3 options:0];
}

- (id)addIcon:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(SBFolder *)self indexPathForFirstFreeSlotAvoidingFirstList:0];
  if (!v7)
  {
    if ([(SBFolder *)self isFull]
      || (v12 = [(SBFolder *)self addEmptyListRemovingLeastRecentlyHiddenListIfNecessary], [(SBFolder *)self indexPathForFirstFreeSlotAvoidingFirstList:0], (id v7 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v11 = 0;
      goto LABEL_9;
    }
  }
  uint64_t v8 = [v7 sbListIndex];
  if (v8 == [(SBFolder *)self listCount]) {
    id v9 = [(SBFolder *)self addEmptyListRemovingLeastRecentlyHiddenListIfNecessary];
  }
  if ([(SBFolder *)self isValidListIndex:v8])
  {
    id v15 = v7;
    id v10 = [(SBFolder *)self insertIcon:v6 atIndexPath:&v15 options:a4];
    id v11 = v15;

LABEL_9:
    id v13 = v11;
    id v7 = v13;
    goto LABEL_11;
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

- (id)addIcons:(id)a3
{
  return [(SBFolder *)self addIcons:a3 options:0];
}

- (id)addIcons:(id)a3 options:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v13 = [(SBFolder *)self addIcon:v12 options:a4];
        if (!v13)
        {
          if (!v9)
          {
            id v9 = [MEMORY[0x1E4F1CA48] array];
          }
          [v9 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)addIcon:(id)a3 options:(unint64_t)a4 listGridCellInfoOptions:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [(SBFolder *)self gridPathForFirstFreeSlotAvoidingFirstList:0 listGridCellInfoOptions:a5];
  if (v9) {
    id v10 = [(SBFolder *)self insertIcon:v8 atGridPath:v9 options:a4];
  }

  return v9;
}

- (id)addIcon:(id)a3 toListAtIndex:(unint64_t)a4 options:(unint64_t)a5
{
  return [(SBFolder *)self addIcon:a3 toListAtIndex:a4 options:a5 didBump:0];
}

- (id)addIcon:(id)a3 toListAtIndex:(unint64_t)a4 options:(unint64_t)a5 didBump:(BOOL *)a6
{
  id v11 = a3;
  uint64_t v12 = [(SBFolder *)self listAtIndex:a4];
  if ([v12 directlyContainsIcon:v11])
  {
    id v13 = 0;
  }
  else
  {
    uint64_t v14 = NSStringFromSelector(a2);
    long long v15 = [(SBFolder *)self startCoalescingContentChangesForReason:v14];

    long long v16 = objc_msgSend(v12, "insertIcon:atIndex:options:", v11, objc_msgSend(v12, "numberOfIcons"), objc_msgSend((id)objc_opt_class(), "listModelMutationOptionsForFolderMutationOptions:", a5));
    id v13 = [(SBFolder *)self _handleBumpedIcons:v16 afterInsertingIconIntoListAtIndex:a4 listGridCellInfoOptions:0 mutationOptions:a5 didBump:a6];

    [v15 invalidate];
  }

  return v13;
}

- (BOOL)canAddIcon
{
  id v2 = [(SBFolder *)self indexPathForFirstFreeSlotAvoidingFirstList:0];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)canAddIconCount:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = self->_lists;
  uint64_t v6 = [(SBIconIndexMutableList *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        unint64_t v12 = objc_msgSend(v11, "maxNumberOfIcons", (void)v17);
        unint64_t v13 = [v11 numberOfNonPlaceholderIcons];
        if (v12 > v13)
        {
          v8 += v12 - v13;
          if (v8 >= a3)
          {

            return 1;
          }
        }
      }
      uint64_t v7 = [(SBIconIndexMutableList *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v8 = 0;
  }

  unint64_t v15 = [(SBFolder *)self maxListCount];
  unint64_t v16 = v15 - [(SBIconIndexMutableList *)self->_lists count];
  return v8 + v16 * SBHIconGridSizeGetArea(*(_DWORD *)&self->_listGridSize) >= a3;
}

- (BOOL)canAddIcon:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  unint64_t v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithObjects:&v8 count:1];

  LOBYTE(self) = -[SBFolder canAddIcons:](self, "canAddIcons:", v6, v8, v9);
  return (char)self;
}

- (BOOL)canAddIcons:(id)a3
{
  return [(SBFolder *)self canAddIcons:a3 startingAtList:0];
}

- (BOOL)canAddIcons:(id)a3 startingAtList:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SBFolder *)self isAllowedToContainIcons:v6])
  {
    if (v7) {
      BOOL v8 = [(SBFolder *)self isExtraList:v7];
    }
    else {
      BOOL v8 = 0;
    }
    int v10 = !v8;
    if (!v7) {
      int v10 = 1;
    }
    if (v10) {
      uint64_t v11 = 6;
    }
    else {
      uint64_t v11 = 2;
    }
    unint64_t v12 = (void *)[v6 mutableCopy];
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    BOOL v29 = v7 == 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __39__SBFolder_canAddIcons_startingAtList___block_invoke;
    void v24[3] = &unk_1E6AAF288;
    int v27 = v28;
    id v25 = v7;
    id v13 = v12;
    id v26 = v13;
    [(SBFolder *)self enumerateListsWithOptions:v11 usingBlock:v24];
    uint64_t v14 = [v13 count];
    BOOL v9 = v14 == 0;
    if (v14) {
      char v15 = v8;
    }
    else {
      char v15 = 1;
    }
    if ((v15 & 1) == 0)
    {
      unint64_t v16 = [(SBFolder *)self firstList];
      unint64_t v17 = [(SBFolder *)self maxListCount];
      unint64_t v18 = [(SBFolder *)self visibleListCount];
      if (v17 != v18)
      {
        unint64_t v19 = ~v18 + v17;
        do
        {
          unint64_t v20 = v19;
          int v21 = [v16 allowedIconsForByReplacingContentsWithIcons:v13];
          [v13 removeObjectsInArray:v21];
          uint64_t v22 = [v13 count];

          if (!v22) {
            break;
          }
          unint64_t v19 = v20 - 1;
        }
        while (v20);
      }
      BOOL v9 = [v13 count] == 0;
    }
    _Block_object_dispose(v28, 8);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

void __39__SBFolder_canAddIcons_startingAtList___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v7 + 24))
  {
    if (*(id *)(a1 + 32) != v6) {
      goto LABEL_6;
    }
    *(unsigned char *)(v7 + 24) = 1;
  }
  id v9 = v6;
  BOOL v8 = [v6 allowedIconsForIcons:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) removeObjectsInArray:v8];
  if (![*(id *)(a1 + 40) count]) {
    *a4 = 1;
  }

  id v6 = v9;
LABEL_6:
}

- (BOOL)isAllowedToContainIcon:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[SBFolder isRootFolder](self, "isRootFolder") || [v4 canBeAddedToSubfolder];

  return v5;
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
        if (!-[SBFolder isAllowedToContainIcon:](self, "isAllowedToContainIcon:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
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

- (void)swapIconAtIndexPath:(id)a3 withIconAtIndexPath:(id)a4 options:(unint64_t)a5
{
  id v8 = a4;
  id v13 = [(SBFolder *)self iconAtIndexPath:a3];
  BOOL v9 = [(SBFolder *)self iconAtIndexPath:v8];

  int v10 = objc_alloc_init(SBIcon);
  long long v11 = [v9 gridSizeClass];
  [(SBIcon *)v10 setGridSizeClass:v11];

  long long v12 = [(SBFolder *)self startCoalescingContentChangesForReason:@"SBSwapIconsCoalesceID"];
  [(SBFolder *)self replaceIcon:v13 withIcon:v10 options:a5];
  [(SBFolder *)self replaceIcon:v9 withIcon:v13 options:a5];
  [(SBFolder *)self replaceIcon:v10 withIcon:v9 options:a5];
  [v12 invalidate];
  [(SBFolder *)self _informObserversOfMovedIcon:v13];
  [(SBFolder *)self _informObserversOfMovedIcon:v9];
}

- (void)swapIcon:(id)a3 withIcon:(id)a4 options:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  long long v12 = objc_alloc_init(SBIcon);
  int v10 = [v9 gridSizeClass];
  [(SBIcon *)v12 setGridSizeClass:v10];

  long long v11 = [(SBFolder *)self startCoalescingContentChangesForReason:@"SBSwapIconsCoalesceID"];
  [(SBFolder *)self replaceIcon:v9 withIcon:v12 options:a5];
  [(SBFolder *)self replaceIcon:v8 withIcon:v9 options:a5];
  [(SBFolder *)self replaceIcon:v12 withIcon:v8 options:a5];
  [v11 invalidate];
  [(SBFolder *)self _informObserversOfMovedIcon:v9];

  [(SBFolder *)self _informObserversOfMovedIcon:v8];
}

- (id)indexPathForFirstFreeSlotAvoidingFirstList:(BOOL)a3
{
  return [(SBFolder *)self indexPathForFirstFreeSlotStartingAtList:0 avoidingFirstList:a3 searchForwards:1];
}

- (id)indexPathForFirstFreeSlotStartingAtList:(id)a3 avoidingFirstList:(BOOL)a4
{
  return [(SBFolder *)self indexPathForFirstFreeSlotStartingAtList:a3 avoidingFirstList:a4 searchForwards:1];
}

- (id)indexPathForLastFreeSlotAvoidingFirstList:(BOOL)a3
{
  return [(SBFolder *)self indexPathForFirstFreeSlotStartingAtList:0 avoidingFirstList:a3 searchForwards:0];
}

- (id)indexPathForLastFreeSlotStartingAtList:(id)a3 avoidingFirstList:(BOOL)a4
{
  return [(SBFolder *)self indexPathForFirstFreeSlotStartingAtList:a3 avoidingFirstList:a4 searchForwards:0];
}

- (id)indexPathForFirstFreeSlotStartingAtList:(id)a3 avoidingFirstList:(BOOL)a4 searchForwards:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if (v8 && [(SBFolder *)self isExtraList:v8])
  {
    unint64_t v9 = [(SBFolder *)self indexOfList:v8];
    uint64_t v10 = [v8 firstFreeSlotIndex];
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v11 = 0;
    }
    else
    {
      id v11 = [MEMORY[0x1E4F28D58] indexPathWithIconIndex:v10 listIndex:v9];
    }
  }
  else
  {
    uint64_t v18 = 0;
    unint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000;
    int v21 = __Block_byref_object_copy__6;
    uint64_t v22 = __Block_byref_object_dispose__6;
    id v23 = 0;
    unint64_t v12 = [(SBIconIndexMutableList *)self->_lists count];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __85__SBFolder_indexPathForFirstFreeSlotStartingAtList_avoidingFirstList_searchForwards___block_invoke;
    v16[3] = &unk_1E6AAF2B0;
    BOOL v17 = v6;
    v16[5] = &v18;
    v16[6] = v12;
    v16[4] = self;
    [(SBFolder *)self enumerateListsForSearchingForFirstFreeSlotStartingAtList:v8 avoidingFirstList:v6 searchForwards:v5 block:v16];
    if (!v19[5] && v12 < [(SBFolder *)self maxListCount])
    {
      uint64_t v13 = [MEMORY[0x1E4F28D58] indexPathWithIconIndex:0 listIndex:v12];
      long long v14 = (void *)v19[5];
      v19[5] = v13;
    }
    id v11 = (id)v19[5];
    _Block_object_dispose(&v18, 8);
  }
  return v11;
}

void __85__SBFolder_indexPathForFirstFreeSlotStartingAtList_avoidingFirstList_searchForwards___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v17 = v7;
  if (a3
    || !*(unsigned char *)(a1 + 56)
    || (v12 = *(void *)(a1 + 48), v13 = v12 >= [*(id *)(a1 + 32) maxListCount], id v7 = v17, v13))
  {
    uint64_t v8 = [v7 firstFreeSlotIndex];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_8;
    }
    uint64_t v9 = v8;
    uint64_t v10 = (void *)MEMORY[0x1E4F28D58];
    uint64_t v11 = a3;
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28D58];
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v9 = 0;
  }
  uint64_t v14 = [v10 indexPathWithIconIndex:v9 listIndex:v11];
  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  *a4 = 1;
LABEL_8:
}

- (id)_indexPathToRevealForJiggleMode
{
  return [(SBFolder *)self indexPathForFirstFreeSlotAvoidingFirstList:0];
}

- (id)validatedIndexPathForInsertionIndexPath:(id)a3 avoidingFirstList:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 sbListIndex];
  if ([(SBFolder *)self isValidListIndex:v7])
  {
    uint64_t v8 = [(SBFolder *)self listAtIndex:v7];
    unint64_t v9 = [v6 sbIconIndex];
    if (v9 <= [v8 numberOfIcons])
    {
      id v17 = 0;
      unint64_t v12 = [(SBFolder *)self folderContainingIndexPath:v6 relativeIndexPath:&v17];
      id v13 = v17;
      if (v12 == self)
      {
        id v11 = v6;
      }
      else
      {
        uint64_t v14 = [(SBFolder *)v12 validatedIndexPathForInsertionIndexPath:v13 avoidingFirstList:0];
        if (v14)
        {
          uint64_t v15 = objc_msgSend(v6, "sb_firstIconPathComponent");
          objc_msgSend(v15, "sb_indexPathByAddingIndexPath:", v14);
          id v11 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v11 = 0;
        }
      }
    }
    else
    {
      if (v7) {
        BOOL v10 = v4;
      }
      else {
        BOOL v10 = 0;
      }
      id v11 = [(SBFolder *)self indexPathForFirstFreeSlotStartingAtList:v8 avoidingFirstList:v10];
    }
  }
  else
  {
    id v11 = [(SBFolder *)self indexPathForLastFreeSlotAvoidingFirstList:v4];
  }

  return v11;
}

- (id)validatedGridPathForInsertionGridPath:(id)a3 avoidingFirstList:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(SBFolder *)self listAtGridPath:v6];
  if (v7)
  {
    id v8 = v6;
  }
  else
  {
    -[SBFolder gridPathForFirstFreeSlotAvoidingFirstList:listGridCellInfoOptions:](self, "gridPathForFirstFreeSlotAvoidingFirstList:listGridCellInfoOptions:", v4, [v6 gridCellInfoOptions]);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  unint64_t v9 = v8;

  return v9;
}

- (id)sortedAndBucketedGridPaths:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      uint64_t v8 = 0;
      uint64_t v21 = v6;
      do
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        unint64_t v9 = *(void **)(*((void *)&v24 + 1) + 8 * v8);
        BOOL v10 = [v9 folderIdentifier];
        id v11 = [v9 listIdentifier];
        unint64_t v12 = self;
        id v13 = v12;
        if (v10)
        {
          uint64_t v14 = [(SBFolder *)v12 folderWithUniqueIdentifier:v10];

          id v13 = (void *)v14;
          if (!v14) {
            goto LABEL_17;
          }
        }
        else
        {
          BOOL v10 = [(SBFolder *)v12 uniqueIdentifier];
          if (!v13) {
            goto LABEL_17;
          }
        }
        uint64_t v15 = [v13 listWithIdentifier:v11];
        if (v15)
        {
          uint64_t v16 = v7;
          id v17 = self;
          id v18 = [v23 objectForKey:v10];
          if (!v18)
          {
            id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            [v23 setObject:v18 forKey:v10];
          }
          id v19 = [v18 objectForKey:v11];
          if (!v19)
          {
            id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [v18 setObject:v19 forKey:v11];
          }
          objc_msgSend(v19, "insertObject:atIndex:", v9, objc_msgSend(v19, "indexOfObject:inSortedRange:options:usingComparator:", v9, 0, objc_msgSend(v19, "count"), 1024, &__block_literal_global_83_0));

          self = v17;
          uint64_t v7 = v16;
          uint64_t v6 = v21;
        }

LABEL_17:
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v6);
  }

  return v23;
}

uint64_t __39__SBFolder_sortedAndBucketedGridPaths___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 gridCellIndex];
  unint64_t v6 = [v4 gridCellIndex];

  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 > v6;
  }
}

- (id)sortedGridPaths:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v7 = [(SBFolder *)self sortedAndBucketedGridPaths:v5];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __28__SBFolder_sortedGridPaths___block_invoke;
  v12[3] = &unk_1E6AAF320;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  [v7 enumerateKeysAndObjectsUsingBlock:v12];
  unint64_t v9 = v13;
  id v10 = v8;

  return v10;
}

void __28__SBFolder_sortedGridPaths___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) folderWithUniqueIdentifier:a2];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __28__SBFolder_sortedGridPaths___block_invoke_2;
  v8[3] = &unk_1E6AAF2F8;
  id v9 = v5;
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  [v6 enumerateListsUsingBlock:v8];
}

void __28__SBFolder_sortedGridPaths___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = [a2 uniqueIdentifier];
  BOOL v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  if (v3) {
    [*(id *)(a1 + 40) addObjectsFromArray:v3];
  }
}

- (void)enumerateListsForSearchingForFirstFreeSlotStartingAtList:(id)a3 avoidingFirstList:(BOOL)a4 searchForwards:(BOOL)a5 block:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  unint64_t v12 = [(SBFolder *)self listCount];
  if (v10) {
    unint64_t v13 = [(SBFolder *)self indexOfList:v10];
  }
  else {
    unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v14 = v12 - 1;
  if (v12) {
    unint64_t v15 = v12 - 1;
  }
  else {
    unint64_t v15 = 0;
  }
  if (v7) {
    unint64_t v15 = 0;
  }
  if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v16 = 0;
  }
  else {
    unint64_t v16 = v13;
  }
  if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v17 = v15;
  }
  else {
    unint64_t v17 = v13;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __108__SBFolder_enumerateListsForSearchingForFirstFreeSlotStartingAtList_avoidingFirstList_searchForwards_block___block_invoke;
  aBlock[3] = &unk_1E6AAF348;
  aBlock[4] = self;
  id v18 = v11;
  id v24 = v18;
  id v19 = (void (**)(void *, unint64_t, BOOL, char *))_Block_copy(aBlock);
  char v22 = 0;
  if (!v7)
  {
    unint64_t v21 = v17;
    while (v21 != -1)
    {
      v19[2](v19, v21--, v8, &v22);
      if (v22) {
        goto LABEL_32;
      }
    }
    while (v14 > v17)
    {
      v19[2](v19, v14--, v8, &v22);
      if (v22) {
        goto LABEL_32;
      }
    }
    goto LABEL_30;
  }
  if (v16 >= v12)
  {
LABEL_19:
    if (v17)
    {
      unint64_t v20 = 0;
      do
      {
        v19[2](v19, v20, v8, &v22);
        if (v22) {
          goto LABEL_32;
        }
      }
      while (v17 != ++v20);
    }
LABEL_30:
    if (v8) {
      v19[2](v19, 0, 0, &v22);
    }
    goto LABEL_32;
  }
  while (1)
  {
    v19[2](v19, v16, v8, &v22);
    if (v22) {
      break;
    }
    if (v12 == ++v16) {
      goto LABEL_19;
    }
  }
LABEL_32:
}

void __108__SBFolder_enumerateListsForSearchingForFirstFreeSlotStartingAtList_avoidingFirstList_searchForwards_block___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  if (a2 || (a3 & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 32) listAtIndex:a2];
    if (([v4 isHidden] & 1) == 0) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

- (id)gridPathForFirstFreeSlotAvoidingFirstList:(BOOL)a3 listGridCellInfoOptions:(unint64_t)a4
{
  return [(SBFolder *)self gridPathForFirstFreeSlotOfRangeOfSizeClass:@"SBHIconGridSizeClassDefault" startingAtList:0 avoidingFirstList:a3 searchForwards:1 listGridCellInfoOptions:a4];
}

- (id)gridPathForFirstFreeSlotOfRangeOfSizeClass:(id)a3 avoidingFirstList:(BOOL)a4 listGridCellInfoOptions:(unint64_t)a5
{
  return [(SBFolder *)self gridPathForFirstFreeSlotOfRangeOfSizeClass:a3 startingAtList:0 avoidingFirstList:a4 searchForwards:1 listGridCellInfoOptions:a5];
}

- (id)gridPathForFirstFreeSlotOfRangeOfSizeClass:(id)a3 startingAtList:(id)a4 listGridCellInfoOptions:(unint64_t)a5
{
  return [(SBFolder *)self gridPathForFirstFreeSlotOfRangeOfSizeClass:a3 startingAtList:a4 avoidingFirstList:0 searchForwards:1 listGridCellInfoOptions:a5];
}

- (id)gridPathForFirstFreeSlotStartingAtList:(id)a3 avoidingFirstList:(BOOL)a4 listGridCellInfoOptions:(unint64_t)a5
{
  return [(SBFolder *)self gridPathForFirstFreeSlotOfRangeOfSizeClass:@"SBHIconGridSizeClassDefault" startingAtList:a3 avoidingFirstList:a4 searchForwards:1 listGridCellInfoOptions:a5];
}

- (id)gridPathForLastFreeSlotAvoidingFirstList:(BOOL)a3 listGridCellInfoOptions:(unint64_t)a4
{
  return [(SBFolder *)self gridPathForFirstFreeSlotOfRangeOfSizeClass:@"SBHIconGridSizeClassDefault" startingAtList:0 avoidingFirstList:a3 searchForwards:0 listGridCellInfoOptions:a4];
}

- (id)gridPathForLastFreeSlotStartingAtList:(id)a3 avoidingFirstList:(BOOL)a4 listGridCellInfoOptions:(unint64_t)a5
{
  return [(SBFolder *)self gridPathForFirstFreeSlotOfRangeOfSizeClass:@"SBHIconGridSizeClassDefault" startingAtList:a3 avoidingFirstList:a4 searchForwards:0 listGridCellInfoOptions:a5];
}

- (id)gridPathForFirstFreeSlotOfRangeOfSizeClass:(id)a3 startingAtList:(id)a4 avoidingFirstList:(BOOL)a5 searchForwards:(BOOL)a6 listGridCellInfoOptions:(unint64_t)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  unint64_t v14 = [(SBFolder *)self uniqueIdentifier];
  if (v13 && [(SBFolder *)self isExtraList:v13])
  {
    uint64_t v15 = [v13 firstFreeGridCellIndexOfRangeOfSizeClass:v12 gridCellInfoOptions:a7];
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v16 = 0;
    }
    else
    {
      uint64_t v18 = v15;
      id v19 = [SBHIconGridPath alloc];
      unint64_t v20 = [v13 uniqueIdentifier];
      unint64_t v16 = [(SBHIconGridPath *)v19 initWithFolderIdentifier:v14 listIdentifier:v20 gridCellIndex:v18 gridCellInfoOptions:a7];
    }
  }
  else
  {
    uint64_t v26 = 0;
    long long v27 = &v26;
    uint64_t v28 = 0x3032000000;
    uint64_t v29 = __Block_byref_object_copy__6;
    uint64_t v30 = __Block_byref_object_dispose__6;
    id v31 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __127__SBFolder_gridPathForFirstFreeSlotOfRangeOfSizeClass_startingAtList_avoidingFirstList_searchForwards_listGridCellInfoOptions___block_invoke;
    v21[3] = &unk_1E6AAF370;
    id v24 = &v26;
    unint64_t v25 = a7;
    id v22 = v12;
    id v23 = v14;
    [(SBFolder *)self enumerateListsForSearchingForFirstFreeSlotStartingAtList:v13 avoidingFirstList:v9 searchForwards:v8 block:v21];
    unint64_t v16 = (SBHIconGridPath *)(id)v27[5];

    _Block_object_dispose(&v26, 8);
  }

  return v16;
}

void __127__SBFolder_gridPathForFirstFreeSlotOfRangeOfSizeClass_startingAtList_avoidingFirstList_searchForwards_listGridCellInfoOptions___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v14 = a2;
  uint64_t v6 = [v14 firstFreeGridCellIndexOfRangeOfSizeClass:a1[4] gridCellInfoOptions:a1[7]];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = v6;
    BOOL v8 = [SBHIconGridPath alloc];
    uint64_t v9 = a1[5];
    id v10 = [v14 uniqueIdentifier];
    uint64_t v11 = [(SBHIconGridPath *)v8 initWithFolderIdentifier:v9 listIdentifier:v10 gridCellIndex:v7 gridCellInfoOptions:a1[7]];
    uint64_t v12 = *(void *)(a1[6] + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    *a4 = 1;
  }
}

- (void)enumerateListsNearestToList:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, id, unint64_t, unsigned char *))a4;
  unint64_t v8 = [(SBFolder *)self indexOfList:v6];
  unint64_t v9 = [(SBFolder *)self listCount];
  unsigned __int8 v17 = 0;
  v7[2](v7, v6, v8, &v17);
  if (!v17)
  {
    if (v8) {
      uint64_t v10 = v8 - 1;
    }
    else {
      uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    unint64_t v16 = v9 - 1;
    if (v8 < v9 - 1) {
      unint64_t v11 = v8 + 1;
    }
    else {
      unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    do
    {
      while (1)
      {
        if (v10 == 0x7FFFFFFFFFFFFFFFLL && v11 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_2;
        }
        if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
        if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_17;
        }
LABEL_23:
        unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
      }
      uint64_t v12 = [(SBFolder *)self listAtIndex:v10];
      v7[2](v7, v12, v10, &v17);
      int v13 = v17;
      if (v10) {
        --v10;
      }
      else {
        uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
      }

      if (v13) {
        break;
      }
      if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_23;
      }
LABEL_17:
      id v14 = -[SBFolder listAtIndex:](self, "listAtIndex:", v11, v16);
      v7[2](v7, v14, v11, &v17);
      int v15 = v17;
      if (v11 < v16) {
        ++v11;
      }
      else {
        unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    while (!v15);
  }
LABEL_2:
}

- (void)removeIcon:(id)a3 options:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  unint64_t v8 = NSStringFromSelector(a2);
  unsigned __int8 v17 = [(SBFolder *)self startCoalescingContentChangesForReason:v8];

  uint64_t v9 = [(id)objc_opt_class() listModelMutationOptionsForFolderMutationOptions:a4];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = [(SBFolder *)self listsContainingIcon:v7];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        int v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        [v15 removeIcon:v7 options:v9];
        unint64_t v16 = [v15 folder];
        [(SBFolder *)self didExplicitlyRemoveIcon:v7 fromList:v15 inFolder:v16 options:a4];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  [v17 invalidate];
}

- (void)removeIcon:(id)a3 options:(unint64_t)a4 listGridCellInfoOptions:(unint64_t)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = NSStringFromSelector(a2);
  long long v18 = [(SBFolder *)self startCoalescingContentChangesForReason:v10];

  uint64_t v11 = [(id)objc_opt_class() listModelMutationOptionsForFolderMutationOptions:a4];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = [(SBFolder *)self listsContainingIcon:v9];
  uint64_t v12 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(obj);
        }
        unint64_t v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_msgSend(v16, "removeIcon:gridCellInfoOptions:mutationOptions:", v9, a5, v11, v18);
        unsigned __int8 v17 = [v16 folder];
        [(SBFolder *)self didExplicitlyRemoveIcon:v9 fromList:v16 inFolder:v17 options:a4];
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  [v18 invalidate];
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
        [(SBFolder *)self removeIcon:*(void *)(*((void *)&v11 + 1) + 8 * v10++) options:a4];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)removeIcons:(id)a3 options:(unint64_t)a4 listGridCellInfoOptions:(unint64_t)a5
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
        [(SBFolder *)self removeIcon:*(void *)(*((void *)&v13 + 1) + 8 * v12++) options:a4 listGridCellInfoOptions:a5];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

uint64_t __34__SBFolder_addIconsOfClass_toSet___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addIconsOfClass:*(void *)(a1 + 40) toSet:*(void *)(a1 + 32)];
}

- (void)addIconsPassingTest:(id)a3 toSet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__SBFolder_addIconsPassingTest_toSet___block_invoke;
  v10[3] = &unk_1E6AAF3C0;
  id v11 = v7;
  id v12 = v6;
  id v8 = v7;
  id v9 = v6;
  [(SBFolder *)self enumerateAllIconsWithOptions:1 usingBlock:v10];
}

void __38__SBFolder_addIconsPassingTest_toSet___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)iconsPassingTest:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [(SBFolder *)self addIconsPassingTest:v5 toSet:v6];

  return v6;
}

- (id)allIcons
{
  uint64_t v3 = objc_opt_class();
  return [(SBFolder *)self iconsOfClass:v3];
}

- (id)folderIcons
{
  uint64_t v3 = objc_opt_class();
  return [(SBFolder *)self iconsOfClass:v3];
}

- (NSArray)icons
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_lists;
  uint64_t v5 = [(SBIconIndexMutableList *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
        uint64_t v10 = (void *)MEMORY[0x1D9484600](v5);
        id v11 = objc_msgSend(v9, "icons", (void)v13);
        [v3 addObjectsFromArray:v11];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v5 = [(SBIconIndexMutableList *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v6 = v5;
    }
    while (v5);
  }

  return (NSArray *)v3;
}

- (NSArray)iconsInLists
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_lists;
  uint64_t v5 = [(SBIconIndexMutableList *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
        uint64_t v10 = (void *)MEMORY[0x1D9484600](v5);
        id v11 = objc_msgSend(v9, "icons", (void)v13);
        [v3 addObjectsFromArray:v11];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v5 = [(SBIconIndexMutableList *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v6 = v5;
    }
    while (v5);
  }

  return (NSArray *)v3;
}

- (SBIcon)firstIcon
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__6;
  id v9 = __Block_byref_object_dispose__6;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __21__SBFolder_firstIcon__block_invoke;
  v4[3] = &unk_1E6AAF1A0;
  v4[4] = &v5;
  [(SBFolder *)self enumerateAllIconsUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SBIcon *)v2;
}

void __21__SBFolder_firstIcon__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 1;
}

- (BOOL)containsWidgetWithExtensionBundleIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_lists;
  uint64_t v6 = [(SBIconIndexMutableList *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "containsWidgetIconWithExtensionBundleIdentifier:", v4, (void)v10))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(SBIconIndexMutableList *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)listsContainingIcon:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v6 = [v4 nodeIdentifier];
  lists = self->_lists;
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28D58], "bs_emptyPath");
  id v9 = [(SBIconIndexMutableList *)lists indexPathsForContainedNodeIdentifier:v6 prefixPath:v8];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v14), "sb_indexPathByRemovingLastIconIndex");
        long long v16 = [(SBFolder *)self listAtIndexPath:v15];
        [v5 addObject:v16];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v12);
  }

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __32__SBFolder_listsContainingIcon___block_invoke;
  v22[3] = &unk_1E6AAF2F8;
  id v23 = v4;
  id v17 = v5;
  id v24 = v17;
  id v18 = v4;
  [(SBFolder *)self enumerateExtraListsUsingBlock:v22];
  long long v19 = v24;
  id v20 = v17;

  return v20;
}

void __32__SBFolder_listsContainingIcon___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 directlyContainsIcon:*(void *)(a1 + 32)]) {
    [*(id *)(a1 + 40) addObject:v3];
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__SBFolder_listsContainingIcon___block_invoke_2;
  v4[3] = &unk_1E6AADBC8;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v3 enumerateFolderIconsUsingBlock:v4];
}

void __32__SBFolder_listsContainingIcon___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = [a2 folder];
  id v3 = [v4 listsContainingIcon:*(void *)(a1 + 32)];
  if (v3) {
    [*(id *)(a1 + 40) unionSet:v3];
  }
}

- (id)listsContainingLeafIconWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SBIconIndexMutableList *)self->_lists nodesContainingNodeIdentifier:v4];
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__6;
  long long v19 = __Block_byref_object_dispose__6;
  id v20 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__SBFolder_listsContainingLeafIconWithIdentifier___block_invoke;
  v11[3] = &unk_1E6AAF3E8;
  id v6 = v4;
  id v12 = v6;
  uint64_t v14 = &v15;
  id v7 = v5;
  id v13 = v7;
  [(SBFolder *)self enumerateExtraListsUsingBlock:v11];
  uint64_t v8 = (void *)v16[5];
  if (!v8) {
    uint64_t v8 = v7;
  }
  id v9 = v8;

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __50__SBFolder_listsContainingLeafIconWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  if ([v10 directlyContainsLeafIconWithIdentifier:*(void *)(a1 + 32)])
  {
    id v3 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (!v3)
    {
      uint64_t v4 = [*(id *)(a1 + 40) mutableCopy];
      uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
      id v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;

      id v3 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (!v3)
      {
        uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
        uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
        id v9 = *(void **)(v8 + 40);
        *(void *)(v8 + 40) = v7;

        id v3 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      }
    }
    [v3 addObject:v10];
  }
}

- (unint64_t)indexOfListContainingIcon:(id)a3
{
  id v3 = [(SBFolder *)self indexPathForIcon:a3];
  uint64_t v4 = v3;
  if (v3 && objc_msgSend(v3, "sb_iconPathCount") == 1) {
    unint64_t v5 = [v4 sbListIndex];
  }
  else {
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (id)indexPathForIcon:(id)a3 includingPlaceholders:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__6;
  id v24 = __Block_byref_object_dispose__6;
  id v25 = [(SBFolder *)self indexPathForIcon:v6];
  uint64_t v7 = (void *)v21[5];
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v4;
  }
  if (!v8)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __51__SBFolder_indexPathForIcon_includingPlaceholders___block_invoke;
    v16[3] = &unk_1E6AAF410;
    id v9 = v6;
    id v18 = self;
    long long v19 = &v20;
    id v17 = v9;
    [(SBFolder *)self enumerateAllIconsUsingBlock:v16];
    if (!v21[5])
    {
      id v10 = [v9 nodeIdentifier];

      if (v10)
      {
        uint64_t v11 = +[SBPlaceholderIcon placeholderNodeIdentifierForIcon:v9];
        uint64_t v12 = [(SBFolder *)self indexPathForNodeIdentifier:v11];
        id v13 = (void *)v21[5];
        v21[5] = v12;
      }
    }

    uint64_t v7 = (void *)v21[5];
  }
  id v14 = v7;
  _Block_object_dispose(&v20, 8);

  return v14;
}

void __51__SBFolder_indexPathForIcon_includingPlaceholders___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 isGrabbedIconPlaceholder]
    && [v6 referencesIcon:*(void *)(a1 + 32)])
  {
    uint64_t v3 = [*(id *)(a1 + 40) indexPathForIcon:v6];
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    unint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

- (id)indexPathsForIcon:(id)a3
{
  uint64_t v4 = [a3 nodeIdentifier];
  unint64_t v5 = objc_msgSend(MEMORY[0x1E4F28D58], "bs_emptyPath");
  id v6 = [(SBFolder *)self indexPathsForContainedNodeIdentifier:v4 prefixPath:v5];

  uint64_t v7 = [v6 allObjects];

  return v7;
}

- (id)indexPathsForIconWithIdentifier:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F28D58];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "bs_emptyPath");
  uint64_t v7 = [(SBFolder *)self indexPathsForContainedNodeIdentifier:v5 prefixPath:v6];

  BOOL v8 = [v7 allObjects];

  return v8;
}

- (id)indexPathForIconWithIdentifier:(id)a3 includingPlaceholders:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__6;
  id v23 = __Block_byref_object_dispose__6;
  id v24 = [(SBFolder *)self indexPathForNodeIdentifier:v6];
  uint64_t v7 = (void *)v20[5];
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v4;
  }
  if (!v8)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __65__SBFolder_indexPathForIconWithIdentifier_includingPlaceholders___block_invoke;
    v15[3] = &unk_1E6AAF410;
    id v9 = v6;
    id v17 = self;
    id v18 = &v19;
    id v16 = v9;
    [(SBFolder *)self enumerateAllIconsUsingBlock:v15];
    if (!v20[5])
    {
      id v10 = +[SBPlaceholderIcon placeholderNodeIdentifierForIconNodeIdentifier:v9];
      uint64_t v11 = [(SBFolder *)self indexPathForNodeIdentifier:v10];
      uint64_t v12 = (void *)v20[5];
      v20[5] = v11;
    }
    uint64_t v7 = (void *)v20[5];
  }
  id v13 = v7;
  _Block_object_dispose(&v19, 8);

  return v13;
}

void __65__SBFolder_indexPathForIconWithIdentifier_includingPlaceholders___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 isGrabbedIconPlaceholder]
    && [v6 referencesIconWithIdentifier:*(void *)(a1 + 32)])
  {
    uint64_t v3 = [*(id *)(a1 + 40) indexPathForIcon:v6];
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

- (id)indexPathForApplicationIconWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__SBFolder_indexPathForApplicationIconWithBundleIdentifier___block_invoke;
  v8[3] = &unk_1E6AAD320;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(SBFolder *)self indexPathForIconWithOptions:1 passingTest:v8];

  return v6;
}

uint64_t __60__SBFolder_indexPathForApplicationIconWithBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isApplicationIcon])
  {
    id v4 = [v3 applicationBundleID];
    uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)indexPathsForApplicationIconsWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__SBFolder_indexPathsForApplicationIconsWithBundleIdentifier___block_invoke;
  v8[3] = &unk_1E6AAD320;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(SBFolder *)self indexPathsForIconsWithOptions:1 passingTest:v8];

  return v6;
}

uint64_t __62__SBFolder_indexPathsForApplicationIconsWithBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isApplicationIcon])
  {
    id v4 = [v3 applicationBundleID];
    uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)indexPathForIconPassingTest:(id)a3
{
  return [(SBFolder *)self indexPathForIconWithOptions:0 passingTest:a3];
}

- (id)indexPathForIconWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  id v6 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__6;
  id v17 = __Block_byref_object_dispose__6;
  id v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__SBFolder_indexPathForIconWithOptions_passingTest___block_invoke;
  v10[3] = &unk_1E6AAF438;
  id v7 = v6;
  id v11 = v7;
  uint64_t v12 = &v13;
  [(SBFolder *)self enumerateAllIconsWithOptions:a3 usingBlock:v10];
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __52__SBFolder_indexPathForIconWithOptions_passingTest___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v9 = a3;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    uint64_t v6 = [v9 copy];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    *a4 = 1;
  }
}

- (id)indexPathsForIconsPassingTest:(id)a3
{
  return [(SBFolder *)self indexPathsForIconsWithOptions:0 passingTest:a3];
}

- (id)indexPathsForIconsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__SBFolder_indexPathsForIconsWithOptions_passingTest___block_invoke;
  v13[3] = &unk_1E6AAF3C0;
  id v15 = v6;
  id v8 = v7;
  id v14 = v8;
  id v9 = v6;
  [(SBFolder *)self enumerateAllIconsWithOptions:a3 usingBlock:v13];
  id v10 = v14;
  id v11 = v8;

  return v11;
}

void __54__SBFolder_indexPathsForIconsWithOptions_passingTest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = (void *)[v6 copy];
    [v4 addObject:v5];
  }
}

- (id)indexPathForFolder:(id)a3
{
  id v4 = [a3 icon];
  uint64_t v5 = [(SBFolder *)self indexPathForIcon:v4];

  return v5;
}

- (id)indexPathForList:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 folder];
  if (v5 == self)
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathWithIndex:", -[SBFolder indexOfList:](self, "indexOfList:", v4));
  }
  else
  {
    id v6 = [(SBFolder *)self indexPathForFolder:v5];
    id v7 = objc_msgSend(v6, "indexPathByAddingIndex:", -[SBFolder indexOfList:](v5, "indexOfList:", v4));
  }
  return v7;
}

- (id)indexesOfListsPassingTest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F28E60] indexSet];
  lists = self->_lists;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __38__SBFolder_indexesOfListsPassingTest___block_invoke;
  v12[3] = &unk_1E6AAF460;
  id v14 = v4;
  id v7 = v5;
  id v13 = v7;
  id v8 = v4;
  [(SBIconIndexMutableList *)lists enumerateNodesUsingBlock:v12];
  id v9 = v13;
  id v10 = v7;

  return v10;
}

uint64_t __38__SBFolder_indexesOfListsPassingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (result)
  {
    id v6 = *(void **)(a1 + 32);
    return [v6 addIndex:a3];
  }
  return result;
}

- (unint64_t)firstIndexOfListPassingTest:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  lists = self->_lists;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__SBFolder_firstIndexOfListPassingTest___block_invoke;
  v9[3] = &unk_1E6AAF488;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  [(SBIconIndexMutableList *)lists enumerateNodesUsingBlock:v9];
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __40__SBFolder_firstIndexOfListPassingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (id)gridPathForIcon:(id)a3 listGridCellInfoOptions:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [(SBFolder *)self indexPathForIcon:v6];
  if (v7)
  {
    id v16 = 0;
    id v8 = [(SBFolder *)self folderContainingIndexPath:v7 relativeIndexPath:&v16];
    id v9 = v16;
    if (v8)
    {
      id v10 = [v8 listContainingIndexPath:v9 relativeIndex:0];
      id v11 = 0;
      if (([v8 isRootFolder] & 1) == 0)
      {
        id v11 = [v8 uniqueIdentifier];
      }
      uint64_t v12 = [v10 uniqueIdentifier];
      uint64_t v13 = [v10 gridCellIndexForIcon:v6 gridCellInfoOptions:a4];
      if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v14 = 0;
      }
      else {
        uint64_t v14 = [[SBHIconGridPath alloc] initWithFolderIdentifier:v11 listIdentifier:v12 gridCellIndex:v13 gridCellInfoOptions:a4];
      }
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)relativePathForIcon:(id)a3 listGridCellInfoOptions:(unint64_t)a4
{
  id v6 = [(SBFolder *)self indexPathForIcon:a3];
  if (v6)
  {
    id v24 = 0;
    unint64_t v7 = [(SBFolder *)self folderContainingIndexPath:v6 relativeIndexPath:&v24];
    id v8 = v24;
    if (v7)
    {
      unint64_t v23 = a4;
      id v9 = [v7 listContainingIndexPath:v8 relativeIndex:0];
      id v10 = 0;
      if (([v7 isRootFolder] & 1) == 0)
      {
        id v10 = [v7 uniqueIdentifier];
      }
      uint64_t v22 = [v9 uniqueIdentifier];
      uint64_t v11 = [v8 sbIconIndex];
      uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, v11);
      uint64_t v13 = [v9 iconsAtIndexes:v12];

      if (v11 + 1 >= (unint64_t)[v9 numberOfIcons])
      {
        uint64_t v15 = (void *)MEMORY[0x1E4F1CBF0];
      }
      else
      {
        uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v11 + 1, objc_msgSend(v9, "numberOfIcons") + ~v11);
        uint64_t v15 = [v9 iconsAtIndexes:v14];
      }
      id v17 = objc_msgSend(v13, "bs_map:", &__block_literal_global_94, v8);
      objc_msgSend(v15, "bs_map:", &__block_literal_global_96);
      v19 = id v18 = v13;
      id v16 = [[SBHIconRelativePath alloc] initWithFolderIdentifier:v10 listIdentifier:v22 priorIconIdentifiers:v17 subsequentIconIdentifiers:v19 gridCellInfoOptions:v23];

      id v8 = v21;
    }
    else
    {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

uint64_t __56__SBFolder_relativePathForIcon_listGridCellInfoOptions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

uint64_t __56__SBFolder_relativePathForIcon_listGridCellInfoOptions___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

- (id)gridPathForRelativePath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBFolder *)self listAtRelativePath:v4];
  if (v5)
  {
    uint64_t v26 = 0;
    long long v27 = &v26;
    uint64_t v28 = 0x2020000000;
    uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
    id v6 = [v4 subsequentIconIdentifiers];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __36__SBFolder_gridPathForRelativePath___block_invoke;
    void v23[3] = &unk_1E6AAF4B0;
    id v25 = &v26;
    id v7 = v5;
    id v24 = v7;
    [v6 enumerateObjectsWithOptions:0 usingBlock:v23];

    if (v27[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v8 = [v4 priorIconIdentifiers];
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      uint64_t v19 = __36__SBFolder_gridPathForRelativePath___block_invoke_2;
      uint64_t v20 = &unk_1E6AAF4B0;
      uint64_t v22 = &v26;
      id v21 = v7;
      [v8 enumerateObjectsWithOptions:2 usingBlock:&v17];

      uint64_t v9 = v27[3];
      if (v9 != 0x7FFFFFFFFFFFFFFFLL) {
        v27[3] = v9 + 1;
      }
    }
    id v10 = objc_msgSend(v4, "folderIdentifier", v17, v18, v19, v20);
    uint64_t v11 = [v4 listIdentifier];
    uint64_t v12 = [v4 gridCellInfoOptions];
    uint64_t v13 = [v7 gridCellInfoWithOptions:v12];
    uint64_t v14 = [v13 gridCellIndexForIconIndex:v27[3]];
    if (v14 == 0x7FFFFFFFFFFFFFFFLL
      && (uint64_t v14 = [v13 firstTrailingEmptyGridCellIndex], v14 == 0x7FFFFFFFFFFFFFFFLL))
    {
      uint64_t v15 = 0;
    }
    else
    {
      uint64_t v15 = [[SBHIconGridPath alloc] initWithFolderIdentifier:v10 listIdentifier:v11 gridCellIndex:v14 gridCellInfoOptions:v12];
    }

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

uint64_t __36__SBFolder_gridPathForRelativePath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) indexForIconWithIdentifier:a2];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL) {
    *a4 = 1;
  }
  return result;
}

uint64_t __36__SBFolder_gridPathForRelativePath___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) indexForIconWithIdentifier:a2];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL) {
    *a4 = 1;
  }
  return result;
}

- (id)gridPathForIndexPath:(id)a3 listGridCellInfoOptions:(unint64_t)a4
{
  id v18 = 0;
  uint64_t v5 = [(SBFolder *)self folderContainingIndexPath:a3 relativeIndexPath:&v18];
  id v6 = v18;
  id v7 = v6;
  if (v5)
  {
    uint64_t v8 = [v6 sbListIndex];
    uint64_t v9 = [v7 sbIconIndex];
    id v10 = [v5 listAtIndex:v8];
    uint64_t v11 = [v10 gridCellIndexForIconIndex:v9 gridCellInfoOptions:a4];
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v12 = 0;
    }
    else
    {
      uint64_t v13 = v11;
      uint64_t v14 = [SBHIconGridPath alloc];
      uint64_t v15 = [v5 uniqueIdentifier];
      id v16 = [v10 uniqueIdentifier];
      uint64_t v12 = [(SBHIconGridPath *)v14 initWithFolderIdentifier:v15 listIdentifier:v16 gridCellIndex:v13 gridCellInfoOptions:a4];
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)gridPathsForIndexPaths:(id)a3 listGridCellInfoOptions:(unint64_t)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v23 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = v4;
  uint64_t v26 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v26)
  {
    uint64_t v24 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v29 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        id v27 = 0;
        id v7 = [(SBFolder *)self folderContainingIndexPath:v6 relativeIndexPath:&v27];
        id v8 = v27;
        uint64_t v9 = v8;
        if (v7)
        {
          uint64_t v10 = [v8 sbListIndex];
          uint64_t v11 = [v9 sbIconIndex];
          uint64_t v12 = [v7 listAtIndex:v10];
          uint64_t v13 = [v23 objectForKey:v12];
          if (!v13)
          {
            uint64_t v13 = [v12 gridCellInfoWithOptions:a4];
            [v23 setObject:v13 forKey:v12];
          }
          uint64_t v14 = [v12 gridCellIndexForIconIndex:v11 gridCellInfo:v13];
          uint64_t v15 = [SBHIconGridPath alloc];
          id v16 = [v7 uniqueIdentifier];
          uint64_t v17 = [v12 uniqueIdentifier];
          id v18 = [(SBHIconGridPath *)v15 initWithFolderIdentifier:v16 listIdentifier:v17 gridCellIndex:v14 gridCellInfoOptions:a4];

          [v21 setObject:v18 forKey:v6];
        }
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v26);
  }

  return v21;
}

- (id)gridPathWithListAtIndex:(unint64_t)a3 gridCellIndex:(unint64_t)a4 listGridCellInfoOptions:(unint64_t)a5
{
  id v8 = [(SBFolder *)self listAtIndex:a3];
  if ([(SBFolder *)self isRootFolder])
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = [(SBFolder *)self uniqueIdentifier];
  }
  uint64_t v10 = [v8 uniqueIdentifier];
  uint64_t v11 = [[SBHIconGridPath alloc] initWithFolderIdentifier:v9 listIdentifier:v10 gridCellIndex:a4 gridCellInfoOptions:a5];

  return v11;
}

- (id)gridPathWithListAtIndexPath:(id)a3 gridCellIndex:(unint64_t)a4 listGridCellInfoOptions:(unint64_t)a5
{
  id v7 = [(SBFolder *)self listAtIndexPath:a3];
  id v8 = [v7 folder];
  uint64_t v9 = [v8 uniqueIdentifier];
  uint64_t v10 = [v7 uniqueIdentifier];
  uint64_t v11 = [[SBHIconGridPath alloc] initWithFolderIdentifier:v9 listIdentifier:v10 gridCellIndex:a4 gridCellInfoOptions:a5];

  return v11;
}

- (id)gridPathWithList:(id)a3 gridCellIndex:(unint64_t)a4 listGridCellInfoOptions:(unint64_t)a5
{
  id v7 = a3;
  id v8 = [v7 folder];
  uint64_t v9 = [v8 uniqueIdentifier];
  uint64_t v10 = [v7 uniqueIdentifier];

  uint64_t v11 = [[SBHIconGridPath alloc] initWithFolderIdentifier:v9 listIdentifier:v10 gridCellIndex:a4 gridCellInfoOptions:a5];
  return v11;
}

- (id)indexPathForGridPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBFolder *)self listAtGridPath:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v5, "gridCellInfoWithOptions:", objc_msgSend(v4, "gridCellInfoOptions"));
    uint64_t v7 = objc_msgSend(v6, "iconIndexForGridCellIndex:", objc_msgSend(v4, "gridCellIndex"));
    id v8 = [(SBFolder *)self indexPathForList:v5];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v7 = [v5 numberOfIcons];
    }
    uint64_t v9 = [v8 indexPathByAddingIndex:v7];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)indexPathForRelativePath:(id)a3
{
  id v4 = [(SBFolder *)self gridPathForRelativePath:a3];
  if (v4)
  {
    uint64_t v5 = [(SBFolder *)self indexPathForGridPath:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)iconWithIdentifier:(id)a3
{
  id v4 = [(SBFolder *)self indexPathForIconWithIdentifier:a3];
  if (v4)
  {
    uint64_t v5 = [(SBFolder *)self iconAtIndexPath:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)iconAtIndexPath:(id)a3
{
  id v12 = 0;
  id v4 = [(SBFolder *)self folderContainingIndexPath:a3 relativeIndexPath:&v12];
  id v5 = v12;
  uint64_t v6 = v5;
  if (v4 == self)
  {
    uint64_t v8 = [v5 sbListIndex];
    uint64_t v9 = [v6 sbIconIndex];
    uint64_t v10 = [(SBFolder *)self listAtIndex:v8];
    uint64_t v7 = [v10 iconAtIndex:v9];
  }
  else
  {
    uint64_t v7 = [(SBFolder *)v4 iconAtIndexPath:v5];
  }

  return v7;
}

- (id)folderContainingGridPath:(id)a3
{
  id v3 = [(SBFolder *)self listAtGridPath:a3];
  id v4 = [v3 folder];

  return v4;
}

- (SBFolder)folderWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFolder *)self nodeIdentifier];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    uint64_t v7 = self;
  }
  else
  {
    uint64_t v8 = [(SBFolder *)self iconWithIdentifier:v4];
    uint64_t v7 = [v8 folder];
  }
  return v7;
}

- (SBFolder)folderWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFolder *)self uniqueIdentifier];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    uint64_t v7 = self;
  }
  else
  {
    uint64_t v8 = +[SBFolder folderNodeIdentifierForUniqueIdentifier:v4];
    uint64_t v9 = [(SBFolder *)self iconWithIdentifier:v8];
    uint64_t v7 = [v9 folder];
  }
  return v7;
}

- (id)directlyContainedFolderContainingList:(id)a3
{
  id v4 = [a3 folder];
  while (v4)
  {
    if (v4 == self) {
      break;
    }
    id v5 = v4;
    id v4 = [(SBFolder *)v4 parentFolder];
  }
  return v4;
}

- (id)listContainingIndexPath:(id)a3 relativeIndex:(unint64_t *)a4
{
  id v10 = 0;
  id v5 = [(SBFolder *)self folderContainingIndexPath:a3 relativeIndexPath:&v10];
  id v6 = v10;
  uint64_t v7 = v6;
  if (v5)
  {
    uint64_t v8 = objc_msgSend(v5, "listAtIndex:", objc_msgSend(v6, "sbListIndex"));
    if (a4) {
      *a4 = [v7 sbIconIndex];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)firstFolderWithDisplayName:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBFolder *)self displayName];
  int v6 = [v5 isEqualToString:v4];

  if (v6)
  {
    uint64_t v7 = self;
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v8 = [(SBFolder *)self folderIcons];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v7 = [*(id *)(*((void *)&v16 + 1) + 8 * i) folder];
          uint64_t v13 = [(SBFolder *)v7 displayName];
          char v14 = [v13 isEqualToString:v4];

          if (v14)
          {

            goto LABEL_13;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    uint64_t v7 = 0;
  }
LABEL_13:

  return v7;
}

- (id)firstFolderWithDefaultDisplayName:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBFolder *)self defaultDisplayName];
  int v6 = [v5 isEqualToString:v4];

  if (v6)
  {
    uint64_t v7 = self;
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v8 = [(SBFolder *)self folderIcons];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v7 = [*(id *)(*((void *)&v16 + 1) + 8 * i) folder];
          uint64_t v13 = [(SBFolder *)v7 defaultDisplayName];
          char v14 = [v13 isEqualToString:v4];

          if (v14)
          {

            goto LABEL_13;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    uint64_t v7 = 0;
  }
LABEL_13:

  return v7;
}

- (id)firstFolderWithUniqueIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBFolder *)self uniqueIdentifier];
  int v6 = [v5 isEqualToString:v4];

  if (v6)
  {
    uint64_t v7 = self;
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v8 = [(SBFolder *)self folderIcons];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v7 = [*(id *)(*((void *)&v16 + 1) + 8 * i) folder];
          uint64_t v13 = [(SBFolder *)v7 uniqueIdentifier];
          char v14 = [v13 isEqualToString:v4];

          if (v14)
          {

            goto LABEL_13;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    uint64_t v7 = 0;
  }
LABEL_13:

  return v7;
}

- (id)firstFolderWithUniqueIdentifier:(id)a3 displayName:(id)a4 defaultDisplayName:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(SBFolder *)self uniqueIdentifier];
  int v12 = [v11 isEqualToString:v8];

  if (v12)
  {
    uint64_t v13 = self;
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    char v14 = [(SBFolder *)self folderIcons];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          long long v19 = [*(id *)(*((void *)&v28 + 1) + 8 * i) folder];
          uint64_t v20 = v19;
          if (v8)
          {
            uint64_t v21 = [v19 uniqueIdentifier];
            char v22 = [v21 isEqualToString:v8];

            if (v22) {
              goto LABEL_17;
            }
          }
          if (v9)
          {
            unint64_t v23 = [v20 displayName];
            char v24 = [v23 isEqualToString:v9];

            if (v24) {
              goto LABEL_17;
            }
          }
          if (v10)
          {
            id v25 = [v20 defaultDisplayName];
            char v26 = [v25 isEqualToString:v10];

            if (v26)
            {
LABEL_17:
              uint64_t v13 = v20;

              goto LABEL_18;
            }
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    uint64_t v13 = 0;
  }
LABEL_18:

  return v13;
}

- (id)resolvedComponentsForIndexPath:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  int v6 = objc_msgSend(v4, "sb_iconRelativePathComponents");
  uint64_t v7 = self;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    id v20 = v4;
    while (2)
    {
      uint64_t v12 = 0;
      uint64_t v13 = v7;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        char v14 = *(void **)(*((void *)&v21 + 1) + 8 * v12);
        unint64_t v15 = [v14 sbListIndex];
        if (v15 >= [(SBFolder *)v13 listCount]) {
          goto LABEL_14;
        }
        uint64_t v16 = [(SBFolder *)v13 listAtIndex:v15];
        [v5 addObject:v16];
        uint64_t v17 = [v14 sbIconIndex];
        if (v17 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_13;
        }
        long long v18 = [v16 iconAtIndex:v17];
        [v5 addObject:v18];
        if (([v18 isFolderIcon] & 1) == 0)
        {

LABEL_13:
LABEL_14:
          uint64_t v7 = v13;
          id v4 = v20;
          goto LABEL_15;
        }
        uint64_t v7 = [v18 folder];

        ++v12;
        uint64_t v13 = v7;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      id v4 = v20;
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return v5;
}

- (id)resolvedComponentsForUniqueIdentifierPath:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  int v6 = [v4 firstObject];
  uint64_t v7 = [(SBFolder *)self uniqueIdentifier];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    uint64_t v9 = objc_msgSend(v4, "subarrayWithRange:", 1, objc_msgSend(v4, "count") - 1);

    [v5 addObject:self];
    id v4 = (id)v9;
  }
  uint64_t v10 = self;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = v4;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    while (2)
    {
      uint64_t v15 = 0;
      uint64_t v16 = v10;
      do
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = -[SBFolder objectWithUniqueIdentifier:](v16, "objectWithUniqueIdentifier:", *(void *)(*((void *)&v22 + 1) + 8 * v15), (void)v22);
        if (!v17)
        {
LABEL_16:

          uint64_t v10 = v16;
          goto LABEL_17;
        }
        [v5 addObject:v17];
        if (objc_opt_respondsToSelector())
        {
          long long v18 = v17;
        }
        else
        {
          long long v19 = self;
          char isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0) {
            goto LABEL_16;
          }
          long long v18 = [v17 folder];
        }
        uint64_t v10 = v18;

        ++v15;
        uint64_t v16 = v10;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  return v5;
}

- (id)uniqueIdentifiersForIndexPath:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(SBFolder *)self resolvedComponentsForIndexPath:a3];
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
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
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "uniqueIdentifier", (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)listWithIdentifier:(id)a3 inFolderWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  uint64_t v9 = v8;
  if (v7)
  {
    uint64_t v10 = [(SBFolder *)v8 folderWithUniqueIdentifier:v7];

    uint64_t v9 = (void *)v10;
  }
  if (v9)
  {
    id v11 = [v9 listWithIdentifier:v6];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)listAtGridPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 folderIdentifier];
  id v6 = [v4 listIdentifier];

  id v7 = [(SBFolder *)self listWithIdentifier:v6 inFolderWithIdentifier:v5];

  return v7;
}

- (id)iconAtGridPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFolder *)self listAtGridPath:v4];
  if (v5)
  {
    id v6 = objc_msgSend(v5, "iconAtGridCellIndex:gridCellInfoOptions:", objc_msgSend(v4, "gridCellIndex"), objc_msgSend(v4, "gridCellInfoOptions"));
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)listAtRelativePath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 folderIdentifier];
  id v6 = [v4 listIdentifier];

  id v7 = [(SBFolder *)self listWithIdentifier:v6 inFolderWithIdentifier:v5];

  return v7;
}

- (BOOL)containsWidgetIcon
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30__SBFolder_containsWidgetIcon__block_invoke;
  v4[3] = &unk_1E6AAF1A0;
  void v4[4] = &v5;
  [(SBFolder *)self enumerateAllIconsWithOptions:1 usingBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __30__SBFolder_containsWidgetIcon__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isWidgetIcon];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)containsVisibleWidgetIcon
{
  return [(SBFolder *)self visibleWidgetIconCount] != 0;
}

- (BOOL)_isCoalescingContentChanges
{
  return self->_coalesceChangesTransaction != 0;
}

- (void)_informObserversOfToBeAddedIcon:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(NSHashTable *)self->_folderObservers allObjects];
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
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 folder:self willAddIcon:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_informObserversOfMovedIcon:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(NSHashTable *)self->_folderObservers allObjects];
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
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 folder:self didMoveIcon:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)enumerateAllIconsUsingBlock:(id)a3
{
}

- (void)enumerateAllIconsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28D58];
  id v7 = a4;
  objc_msgSend(v6, "bs_emptyPath");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(SBFolder *)self enumerateAllIconsWithBaseIndexPath:v8 options:a3 usingBlock:v7];
}

- (void)enumerateAllIconsWithBaseIndexPath:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__SBFolder_enumerateAllIconsWithBaseIndexPath_options_usingBlock___block_invoke;
  v12[3] = &unk_1E6AAF500;
  BOOL v16 = (a4 & 2) != 0;
  id v13 = v8;
  id v14 = v9;
  unint64_t v15 = a4;
  id v10 = v9;
  id v11 = v8;
  [(SBFolder *)self enumerateListsUsingBlock:v12];
}

void __66__SBFolder_enumerateAllIconsWithBaseIndexPath_options_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = v7;
  if (!*(unsigned char *)(a1 + 56) || ([v7 isHidden] & 1) == 0)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__SBFolder_enumerateAllIconsWithBaseIndexPath_options_usingBlock___block_invoke_2;
    v10[3] = &unk_1E6AAF4D8;
    uint64_t v13 = a3;
    id v11 = *(id *)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v14 = a4;
    uint64_t v15 = v9;
    [v8 enumerateIconsUsingBlock:v10];
  }
}

void __66__SBFolder_enumerateAllIconsWithBaseIndexPath_options_usingBlock___block_invoke_2(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [MEMORY[0x1E4F28D58] indexPathWithIconIndex:a3 listIndex:a1[6]];
  id v7 = objc_msgSend(v6, "bs_indexPathByAddingPrefix:", a1[4]);
  (*(void (**)(void))(a1[5] + 16))();
  if [v5 isFolderIcon] && (a1[8])
  {
    id v8 = [v5 folder];
    [v8 enumerateAllIconsWithBaseIndexPath:v7 options:a1[8] usingBlock:a1[5]];
  }
}

- (void)enumerateListsUsingBlock:(id)a3
{
  lists = self->_lists;
  id v5 = a3;
  [(SBIconIndexMutableList *)lists enumerateNodesUsingBlock:v5];
  [(SBFolder *)self enumerateExtraListsUsingBlock:v5];
}

- (void)enumerateListsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __49__SBFolder_enumerateListsWithOptions_usingBlock___block_invoke;
  id v12 = &unk_1E6AAF528;
  unint64_t v14 = a3;
  id v7 = v6;
  id v13 = v7;
  id v8 = _Block_copy(&v9);
  -[SBIconIndexMutableList enumerateNodesUsingBlock:](self->_lists, "enumerateNodesUsingBlock:", v8, v9, v10, v11, v12);
  if ((a3 & 4) == 0) {
    [(SBFolder *)self enumerateExtraListsUsingBlock:v8];
  }
}

void __49__SBFolder_enumerateListsWithOptions_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if ((*(unsigned char *)(a1 + 40) & 2) == 0 || (v4 = [v3 isHidden], id v5 = v6, (v4 & 1) == 0))
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v5 = v6;
  }
}

- (BOOL)isExtraList:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __24__SBFolder_isExtraList___block_invoke;
  v7[3] = &unk_1E6AAF210;
  id v5 = v4;
  id v8 = v5;
  uint64_t v9 = &v10;
  [(SBFolder *)self enumerateExtraListsUsingBlock:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __24__SBFolder_isExtraList___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (*(void *)(result + 32) == a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)sort
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(SBFolder *)self iconsInLists];
  id v4 = [v3 sortedArrayUsingSelector:sel_localizedCompareDisplayNames_];

  [(SBFolder *)self removeAllLists];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v11 = -[SBFolder addIcon:](self, "addIcon:", v10, (void)v13);
        if ([v10 isFolderIcon])
        {
          uint64_t v12 = [v10 folder];
          [v12 sort];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [(SBFolder *)self enumerateExtraListsUsingBlock:&__block_literal_global_114];
}

uint64_t __16__SBFolder_sort__block_invoke(uint64_t a1, void *a2)
{
  return [a2 sortUsingSelector:sel_localizedCompareDisplayNames_];
}

- (void)didAddFolder:(id)a3
{
}

- (void)didRemoveFolder:(id)a3
{
}

+ (BOOL)isFolderNodeIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = self;
  if (objc_opt_isKindOfClass()) {
    char v5 = [v3 hasPrefix:@"folder:"];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (id)folderNodeIdentifierForUniqueIdentifier:(id)a3
{
  id v3 = (objc_class *)NSString;
  id v4 = a3;
  char v5 = (void *)[[v3 alloc] initWithFormat:@"folder:%@", v4];

  return v5;
}

- (NSString)recursiveDescription
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  [(SBFolder *)self appendRecursiveDescriptionToString:v3 prefixPath:0];
  return (NSString *)v3;
}

- (void)appendRecursiveDescriptionToString:(id)a3 prefixPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SBFolder *)self effectiveGridSizeClassDomain];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__SBFolder_appendRecursiveDescriptionToString_prefixPath___block_invoke;
  v12[3] = &unk_1E6AAF550;
  id v13 = v7;
  id v14 = v6;
  id v15 = v8;
  id v9 = v8;
  id v10 = v6;
  id v11 = v7;
  [(SBFolder *)self enumerateAllIconsUsingBlock:v12];
}

void __58__SBFolder_appendRecursiveDescriptionToString_prefixPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v21 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v6, "sb_indexPathByAddingIndexPath:", v5);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = v5;
  }
  uint64_t v8 = v7;
  uint64_t v9 = [v7 length];
  if (v9)
  {
    uint64_t v10 = v9;
    for (uint64_t i = 0; i != v10; ++i)
    {
      uint64_t v12 = [v8 indexAtPosition:i];
      if (i) {
        id v13 = @"-%lu";
      }
      else {
        id v13 = @"%lu";
      }
      objc_msgSend(*(id *)(a1 + 40), "appendFormat:", v13, v12);
    }
  }
  id v14 = *(void **)(a1 + 40);
  id v15 = [v21 displayName];
  long long v16 = [v21 uniqueIdentifier];
  uint64_t v17 = *(void **)(a1 + 48);
  uint64_t v18 = [v21 gridSizeClass];
  long long v19 = [v17 descriptionForGridSizeClass:v18];
  [v14 appendFormat:@": %@ (%@, size: %@)\n", v15, v16, v19];

  if ([v21 isFolderIcon])
  {
    id v20 = [v21 folder];
    [v20 appendRecursiveDescriptionToString:*(void *)(a1 + 40) prefixPath:v5];
  }
}

- (id)layoutDescription
{
  return [(SBFolder *)self layoutDescriptionWithOptions:0];
}

- (id)rotatedLayoutDescription
{
  return [(SBFolder *)self layoutDescriptionWithOptions:2];
}

- (id)layoutDescriptionWithOptions:(unint64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __41__SBFolder_layoutDescriptionWithOptions___block_invoke;
  v21[3] = &unk_1E6AAF578;
  id v6 = v5;
  id v22 = v6;
  unint64_t v23 = a3;
  [(SBFolder *)self enumerateListsWithOptions:0 usingBlock:v21];
  id v7 = [MEMORY[0x1E4F28E78] string];
  uint64_t v8 = 0;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  do
  {
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __41__SBFolder_layoutDescriptionWithOptions___block_invoke_2;
    v13[3] = &unk_1E6AAF5C8;
    uint64_t v16 = v8;
    id v10 = v7;
    id v14 = v10;
    id v15 = &v17;
    [v6 enumerateObjectsUsingBlock:v13];
    [v10 appendString:@"\n"];
    int v11 = *((unsigned __int8 *)v18 + 24);

    _Block_object_dispose(&v17, 8);
    ++v8;
  }
  while (v11);

  return v10;
}

void __41__SBFolder_layoutDescriptionWithOptions___block_invoke(uint64_t a1, void *a2)
{
  char v2 = *(void **)(a1 + 32);
  id v3 = [a2 layoutDescriptionWithOptions:*(void *)(a1 + 40)];
  [v2 addObject:v3];
}

void __41__SBFolder_layoutDescriptionWithOptions___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __41__SBFolder_layoutDescriptionWithOptions___block_invoke_3;
  v15[3] = &unk_1E6AAF5A0;
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v17 = v25;
  uint64_t v19 = v6;
  uint64_t v20 = a3;
  id v16 = *(id *)(a1 + 32);
  uint64_t v18 = &v21;
  [v5 enumerateLinesUsingBlock:v15];
  if (*((unsigned char *)v22 + 24))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    uint64_t v7 = objc_msgSend(v5, "lineRangeForRange:", 0, 0);
    uint64_t v9 = objc_msgSend(v5, "substringWithRange:", v7, v8);
    id v10 = (void *)[v9 mutableCopy];
    int v11 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    uint64_t v12 = [v11 invertedSet];

    while (1)
    {
      uint64_t v14 = [v10 rangeOfCharacterFromSet:v12];
      if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      objc_msgSend(v10, "replaceCharactersInRange:withString:", v14, v13, @" ");
    }
    [*(id *)(a1 + 32) appendString:v10];
    if (a3) {
      [*(id *)(a1 + 32) appendString:@"\t\t"];
    }
  }
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(v25, 8);
}

void __41__SBFolder_layoutDescriptionWithOptions___block_invoke_3(void *a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1[5] + 8);
  uint64_t v7 = *(void *)(v6 + 24);
  if (v7 == a1[7])
  {
    uint64_t v8 = (void *)a1[4];
    id v9 = v5;
    if (a1[8]) {
      [v8 appendFormat:@"\t\t%@", v5];
    }
    else {
      [v8 appendString:v5];
    }
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    *a3 = 1;
    id v5 = v9;
  }
  else
  {
    *(void *)(v6 + 24) = v7 + 1;
  }
}

- (BOOL)canBounceIcon:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFolder *)self parentFolder];
  uint64_t v6 = v5;
  if (v5) {
    char v7 = [v5 canBounceIcon:v4];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (id)changeGridSizeClassOfIconAtIndexPath:(id)a3 toGridSizeClass:(id)a4 options:(unint64_t)a5 listGridCellInfoOptions:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v26 = 0;
  uint64_t v13 = [(SBFolder *)self folderContainingIndexPath:v11 relativeIndexPath:&v26];
  id v14 = v26;
  id v15 = v14;
  if (v13 == self)
  {
    id v24 = v14;
    uint64_t v17 = NSStringFromSelector(a2);
    long long v25 = [(SBFolder *)self startCoalescingContentChangesForReason:v17];

    uint64_t v18 = [(SBFolder *)self iconAtIndexPath:v11];
    uint64_t v19 = [(SBFolder *)self listContainingIndexPath:v11 relativeIndex:0];
    uint64_t v23 = [v18 gridSizeClass];
    uint64_t v20 = [v11 sbListIndex];
    uint64_t v21 = [v19 changeGridSizeClassOfContainedIcon:v18 toGridSizeClass:v12 gridCellInfoOptions:a6];
    id v16 = [(SBFolder *)self _handleBumpedIcons:v21 afterInsertingIconIntoListAtIndex:v20 listGridCellInfoOptions:a6 mutationOptions:a5 didBump:0];

    if ((a5 & 0x800000) != 0)
    {
      [(SBFolder *)self _updateOverflowCountInList:v19 forResizingIcon:v18 fromGridSizeClass:v23 options:a5];
      [(SBFolder *)self _compactContiguousOverflowListsStartingAtListIndex:v20 withoutMovingIconsPassingTest:0 removeEmptyLists:1];
    }
    [(SBFolder *)self markIconStateDirty];
    [v25 invalidate];

    id v15 = v24;
  }
  else
  {
    id v16 = [(SBFolder *)v13 changeGridSizeClassOfIconAtIndexPath:v14 toGridSizeClass:v12 options:a5 listGridCellInfoOptions:a6];
  }

  return v16;
}

- (id)changeGridSizeClassOfIconAtGridPath:(id)a3 toGridSizeClass:(id)a4 options:(unint64_t)a5 listGridCellInfoOptions:(unint64_t)a6
{
  id v10 = a4;
  id v11 = [(SBFolder *)self indexPathForGridPath:a3];
  id v12 = [(SBFolder *)self changeGridSizeClassOfIconAtIndexPath:v11 toGridSizeClass:v10 options:a5 listGridCellInfoOptions:a6];

  return v12;
}

- (id)changeGridSizeOfListAtIndex:(unint64_t)a3 toGridSize:(SBHIconGridSize)a4 options:(unint64_t)a5
{
  id v10 = -[SBFolder listAtIndex:](self, "listAtIndex:");
  uint64_t v11 = [(id)objc_opt_class() listModelMutationOptionsForFolderMutationOptions:a5];
  id v12 = NSStringFromSelector(a2);
  uint64_t v13 = [(SBFolder *)self startCoalescingContentChangesForReason:v12];

  id v14 = [v10 changeGridSize:*(unsigned int *)&a4 options:v11];
  id v15 = [(SBFolder *)self _handleBumpedIcons:v14 afterInsertingIconIntoListAtIndex:a3 listGridCellInfoOptions:0 mutationOptions:a5 didBump:0];

  [v13 invalidate];
  return v15;
}

- (id)changeGridSizeOfList:(id)a3 toGridSize:(SBHIconGridSize)a4 options:(unint64_t)a5
{
  id v8 = a3;
  unint64_t v9 = [(SBFolder *)self indexOfList:v8];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = [(SBFolder *)self directlyContainedFolderContainingList:v8];
    uint64_t v11 = [v10 changeGridSizeOfList:v8 toGridSize:*(unsigned int *)&a4 options:a5];
    if ([v11 count])
    {
      id v12 = [v10 icon];
      uint64_t v13 = [(SBFolder *)self _handleBumpedIcons:v11 afterInsertingIconIntoListAtIndex:[(SBFolder *)self indexOfListContainingIcon:v12] listGridCellInfoOptions:0 mutationOptions:a5 didBump:0];

      uint64_t v11 = (void *)v13;
    }
  }
  else
  {
    uint64_t v11 = [(SBFolder *)self changeGridSizeOfListAtIndex:v9 toGridSize:*(unsigned int *)&a4 options:a5];
  }

  return v11;
}

- (id)setListsFromFolder:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v6 = [(SBFolder *)self listCount];
  unint64_t v7 = [v4 listCount];
  if (v6 <= v7) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = v6;
  }
  if (v8)
  {
    unint64_t v9 = v7;
    unint64_t v10 = 0;
    while (v10 >= v6 || v10 >= v9)
    {
      if (v10 >= v6)
      {
        if (v10 < v9)
        {
          uint64_t v11 = [v4 listAtIndex:v10];
          uint64_t v13 = [(SBFolder *)self addEmptyList];
          id v12 = v13;
          id v14 = v11;
LABEL_13:
          id v15 = [v13 setIconsFromIconListModel:v14];

          if (v15)
          {
            [v5 addObjectsFromArray:v15];
          }
        }
      }
      else
      {
        [(SBFolder *)self removeLastList];
      }
      if (v8 == ++v10) {
        goto LABEL_16;
      }
    }
    uint64_t v11 = [(SBFolder *)self listAtIndex:v10];
    id v12 = [v4 listAtIndex:v10];
    uint64_t v13 = v11;
    id v14 = v12;
    goto LABEL_13;
  }
LABEL_16:
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  id v22 = __31__SBFolder_setListsFromFolder___block_invoke;
  uint64_t v23 = &unk_1E6AAF2F8;
  id v24 = v4;
  id v16 = v5;
  id v25 = v16;
  id v17 = v4;
  [(SBFolder *)self enumerateExtraListsUsingBlock:&v20];
  if (objc_msgSend(v16, "count", v20, v21, v22, v23))
  {
    uint64_t v18 = [(SBFolder *)self _handleBumpedIcons:v16 afterInsertingIconIntoListAtIndex:[(SBFolder *)self lastVisibleListIndex] listGridCellInfoOptions:0 mutationOptions:0 didBump:0];
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

void __31__SBFolder_setListsFromFolder___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  if ([*(id *)(a1 + 32) isValidListIndex:a3])
  {
    id v5 = [*(id *)(a1 + 32) listAtIndex:a3];
    unint64_t v6 = [v7 setIconsFromIconListModel:v5];
    if (v6) {
      [*(id *)(a1 + 40) addObjectsFromArray:v6];
    }
  }
}

- (BOOL)iconListModel:(id)a3 isAllowedToContainIcon:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  unint64_t v8 = [(SBFolder *)self rootFolder];
  unint64_t v9 = SBFSafeCast();

  unint64_t v10 = [v9 delegate];
  if (objc_opt_respondsToSelector()) {
    char v11 = [v10 rootFolder:v9 canAddIcon:v7 toIconList:v6 inFolder:self];
  }
  else {
    char v11 = 1;
  }

  return v11;
}

- (BOOL)iconListModel:(id)a3 isGridLayoutValid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  unint64_t v8 = [(SBFolder *)self rootFolder];
  unint64_t v9 = SBFSafeCast();

  unint64_t v10 = [v9 delegate];
  if (objc_opt_respondsToSelector()) {
    char v11 = [v10 rootFolder:v9 isGridLayoutValid:v7 forIconList:v6 inFolder:self];
  }
  else {
    char v11 = 1;
  }

  return v11;
}

- (id)iconListModel:(id)a3 shouldBounceIcon:(id)a4 afterInsertingIcons:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  char v11 = [(SBFolder *)self rootFolder];
  id v12 = SBFSafeCast();

  uint64_t v13 = [v12 delegate];
  if (objc_opt_respondsToSelector())
  {
    id v14 = [v13 rootFolder:v12 shouldBounceIcon:v9 afterInsertingIcons:v10 forIconList:v8 inFolder:self];
  }
  else
  {
    id v14 = v9;
  }
  id v15 = v14;

  return v15;
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
    v8[2] = __37__SBFolder_setBadgeBehaviorProvider___block_invoke;
    v8[3] = &unk_1E6AAD1C0;
    id v9 = v6;
    id v7 = v6;
    [(SBFolder *)self enumerateAllIconsUsingBlock:v8];
  }
}

void __37__SBFolder_setBadgeBehaviorProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isFolderIcon]) {
    [v3 badgeBehaviorProviderDidChange:*(void *)(a1 + 32)];
  }
}

- (SBHIconBadgeBehaviorProviding)effectiveBadgeBehaviorProvider
{
  id v3 = [(SBFolder *)self badgeBehaviorProvider];
  uint64_t v4 = [(SBFolder *)self parent];
  id v5 = (void *)v4;
  if (v3 || !v4)
  {
    id v6 = (void *)v4;
  }
  else
  {
    do
    {
      if (objc_opt_respondsToSelector())
      {
        id v3 = [v5 badgeBehaviorProvider];
      }
      else
      {
        id v3 = 0;
      }
      id v6 = [v5 parent];

      if (v3) {
        break;
      }
      id v5 = v6;
    }
    while (v6);
  }

  return (SBHIconBadgeBehaviorProviding *)v3;
}

void __17__SBFolder_badge__block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  if ([v11 isFolderIcon]) {
    goto LABEL_21;
  }
  id v6 = (void *)a1[4];
  if (v6 && ![v6 allowsBadgingForIcon:v11])
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [v11 badgeNumberOrString];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  if (![v7 isEqualToString:@"!"])
  {
    if (![v7 length])
    {
      uint64_t v8 = a1[6];
      goto LABEL_17;
    }
    [v7 rangeOfString:@"+"];
    if (v9) {
      *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
    }
LABEL_14:
    uint64_t v10 = [v7 integerValue];
    if (v10 >= 1) {
      *(void *)(*(void *)(a1[8] + 8) + 24) += v10;
    }
    goto LABEL_18;
  }
  uint64_t v8 = a1[5];
LABEL_17:
  *(unsigned char *)(*(void *)(v8 + 8) + 24) = 1;
LABEL_18:
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24)) {
    *a4 = 1;
  }

LABEL_21:
}

- (BOOL)extraListContainsNodeIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__SBFolder_extraListContainsNodeIdentifier___block_invoke;
  v7[3] = &unk_1E6AAF618;
  uint64_t v9 = &v10;
  id v5 = v4;
  id v8 = v5;
  [(SBFolder *)self enumerateExtraListsUsingBlock:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __44__SBFolder_extraListContainsNodeIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 containsNodeIdentifier:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
  return result;
}

- (id)containedNodeIdentifiers
{
  id v3 = [(SBIconIndexMutableList *)self->_lists containedNodeIdentifiers];
  id v4 = [(SBFolder *)self nodeIdentifier];
  [v3 addObject:v4];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__SBFolder_containedNodeIdentifiers__block_invoke;
  v7[3] = &unk_1E6AAF030;
  id v5 = v3;
  id v8 = v5;
  [(SBFolder *)self enumerateExtraListsUsingBlock:v7];

  return v5;
}

void __36__SBFolder_containedNodeIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 containedNodeIdentifiers];
  id v4 = *(void **)(a1 + 32);
  if (v4) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    id v6 = v3;
    [v4 unionSet:v3];
    id v3 = v6;
  }
}

- (id)nodesAlongIndexPath:(id)a3 consumedIndexes:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 length] <= a4)
  {
LABEL_5:
    id v9 = [(SBIconIndexMutableList *)self->_lists nodesAlongIndexPath:v6 consumedIndexes:a4];
    id WeakRetained = (SBFolder *)objc_loadWeakRetained((id *)&self->_icon);
    id v11 = WeakRetained;
    if (WeakRetained) {
      uint64_t v12 = WeakRetained;
    }
    else {
      uint64_t v12 = self;
    }
    [v9 insertObject:v12 atIndex:0];

    goto LABEL_9;
  }
  uint64_t v7 = [v6 indexAtPosition:a4];
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__6;
  id v24 = __Block_byref_object_dispose__6;
  id v25 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__SBFolder_nodesAlongIndexPath_consumedIndexes___block_invoke;
  v14[3] = &unk_1E6AAF668;
  uint64_t v18 = v7;
  id v15 = v6;
  id v16 = self;
  unint64_t v19 = a4;
  id v17 = &v20;
  [(SBFolder *)self enumerateExtraListsUsingBlock:v14];
  id v8 = (void *)v21[5];
  if (!v8)
  {

    _Block_object_dispose(&v20, 8);
    goto LABEL_5;
  }
  id v9 = v8;

  _Block_object_dispose(&v20, 8);
LABEL_9:

  return v9;
}

void __48__SBFolder_nodesAlongIndexPath_consumedIndexes___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if (a1[7] == a3)
  {
    id v6 = [a2 nodesAlongIndexPath:a1[4] consumedIndexes:a1[8] + 1];
    [v6 insertObject:a1[5] atIndex:0];
    uint64_t v7 = *(void *)(a1[6] + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    *a4 = 1;
  }
}

- (void)addNodeObserver:(id)a3
{
  id v4 = a3;
  if (!-[NSHashTable containsObject:](self->_nodeObservers, "containsObject:")) {
    [(NSHashTable *)self->_nodeObservers addObject:v4];
  }
}

- (void)removeNodeObserver:(id)a3
{
}

- (id)nodeDescriptionWithPrefix:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F28E78];
  BOOL v5 = (__CFString *)a3;
  id v6 = [v4 string];
  uint64_t v7 = (void *)MEMORY[0x1D9484600]();
  id v8 = &stru_1F2FA0300;
  if (v5) {
    id v8 = v5;
  }
  id v9 = v8;

  uint64_t v10 = [(SBFolder *)self nodeIdentifier];

  if (v10)
  {
    [v6 appendString:v9];
    id v11 = [(SBFolder *)self nodeIdentifier];
    uint64_t v12 = SBIconIndexDebugStringForNodeIdentifier(v11);
    [v6 appendString:v12];

    [v6 appendString:@"\n"];
  }
  lists = self->_lists;
  id v14 = [(__CFString *)v9 stringByAppendingString:@" "];
  id v15 = [(SBIconIndexMutableList *)lists indexDescriptionWithPrefix:v14];
  [v6 appendString:v15];

  id v16 = [(__CFString *)v9 stringByAppendingString:@"   F "];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v17 = self->_lists;
  uint64_t v18 = [(SBIconIndexMutableList *)v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
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
        objc_msgSend(v6, "appendString:", @"\n", (void)v25);
        uint64_t v23 = [v22 nodeDescriptionWithPrefix:v16];
        [v6 appendString:v23];
      }
      uint64_t v19 = [(SBIconIndexMutableList *)v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v19);
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)[(SBFolder *)self descriptionWithMultilinePrefix:0];
}

- (void)list:(id)a3 didAddContainedNodeIdentifiers:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([v5 count])
  {
    id v6 = (void *)[(NSHashTable *)self->_nodeObservers copy];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "node:didAddContainedNodeIdentifiers:", self, v5, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void)list:(id)a3 didRemoveContainedNodeIdentifiers:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([v5 count])
  {
    id v6 = (void *)[(NSHashTable *)self->_nodeObservers copy];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "node:didRemoveContainedNodeIdentifiers:", self, v5, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void)listDidMoveNodes:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(SBFolder *)self markIconStateDirty];
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

- (void)iconList:(id)a3 willAddIcon:(id)a4
{
}

- (void)iconList:(id)a3 didAddIcon:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v6)
  {
    char v7 = [v11 isHidden];
    if ([v6 isFolderIcon])
    {
      uint64_t v8 = [v6 folder];
      [(SBFolder *)self didAddFolder:v8];
      if ((v7 & 1) == 0) {
        self->_visibleWidgetIconCount += [v8 visibleWidgetIconCount];
      }
    }
    if ((v7 & 1) == 0 && [v6 isWidgetIcon]) {
      ++self->_visibleWidgetIconCount;
    }
    if ([(SBFolder *)self _isCoalescingContentChanges])
    {
      [(SBFolderTransaction *)self->_coalesceChangesTransaction iconList:v11 didAddIcon:v6];
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_icon);
      [WeakRetained noteContainedIconsAdded:v9 removed:0];

      [(SBFolder *)self _informObserversOfAddedIcons:v9 removedIcons:0];
    }
    [(SBFolder *)self ensureTrailingEmptyLists];
  }
}

- (void)iconList:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v9 && v10)
  {
    char v12 = [v8 isHidden];
    if ([v11 isFolderIcon])
    {
      long long v13 = [v11 folder];
      [(SBFolder *)self didAddFolder:v13];
      if ((v12 & 1) == 0) {
        self->_visibleWidgetIconCount += [v13 visibleWidgetIconCount];
      }
    }
    if ([v9 isFolderIcon])
    {
      long long v14 = [v9 folder];
      [(SBFolder *)self didRemoveFolder:v14];
      if ((v12 & 1) == 0) {
        self->_visibleWidgetIconCount -= [v14 visibleWidgetIconCount];
      }
    }
    if ((v12 & 1) == 0)
    {
      if ([v11 isWidgetIcon]) {
        ++self->_visibleWidgetIconCount;
      }
      if ([v9 isWidgetIcon]) {
        --self->_visibleWidgetIconCount;
      }
    }
    if ([(SBFolder *)self _isCoalescingContentChanges])
    {
      [(SBFolder *)self iconList:v8 didRemoveIcon:v9];
      [(SBFolder *)self iconList:v8 didAddIcon:v11];
    }
    else
    {
      id v22 = v8;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_icon);
      [WeakRetained noteContainedIcon:v11 replacedIcon:v9];

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v16 = [(NSHashTable *)self->_folderObservers allObjects];
      uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v24;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v24 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void **)(*((void *)&v23 + 1) + 8 * v20);
            if (objc_opt_respondsToSelector()) {
              [v21 folder:self didReplaceIcon:v9 withIcon:v11];
            }
            ++v20;
          }
          while (v18 != v20);
          uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v18);
      }

      id v8 = v22;
    }
    [(SBFolder *)self ensureTrailingEmptyLists];
  }
}

- (void)iconList:(id)a3 didRemoveIcon:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v6)
  {
    char v7 = [v11 isHidden];
    if ([v6 isFolderIcon])
    {
      id v8 = [v6 folder];
      [(SBFolder *)self didRemoveFolder:v8];
      if ((v7 & 1) == 0) {
        self->_visibleWidgetIconCount -= [v8 visibleWidgetIconCount];
      }
    }
    if ((v7 & 1) == 0 && [v6 isWidgetIcon]) {
      --self->_visibleWidgetIconCount;
    }
    if ([(SBFolder *)self _isCoalescingContentChanges])
    {
      [(SBFolderTransaction *)self->_coalesceChangesTransaction iconList:v11 didRemoveIcon:v6];
    }
    else
    {
      id v9 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_icon);
      [WeakRetained noteContainedIconsAdded:0 removed:v9];

      [(SBFolder *)self _informObserversOfAddedIcons:0 removedIcons:v9];
    }
  }
}

- (void)iconList:(id)a3 didMoveIcon:(id)a4
{
}

- (void)iconListHiddenWillChange:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(NSHashTable *)self->_folderObservers allObjects];
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
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 folder:self listHiddenWillChange:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)iconListHiddenDidChange:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_visibleListCount = 0x7FFFFFFFFFFFFFFFLL;
  char v5 = [v4 isHidden];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __36__SBFolder_iconListHiddenDidChange___block_invoke;
  v16[3] = &unk_1E6AAF1C8;
  char v17 = v5;
  void v16[4] = self;
  [v4 enumerateIconsUsingBlock:v16];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [(NSHashTable *)self->_folderObservers allObjects];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v18 count:16];
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
        long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          [v11 folder:self listHiddenDidChange:v4];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v8);
  }
}

void __36__SBFolder_iconListHiddenDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  if ([v11 isWidgetIcon])
  {
    id v3 = v11;
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v4 + 184);
    if (*(unsigned char *)(a1 + 40)) {
      uint64_t v6 = v5 - 1;
    }
    else {
      uint64_t v6 = v5 + 1;
    }
    *(void *)(v4 + 184) = v6;
  }
  else
  {
    int v7 = [v11 isFolderIcon];
    id v3 = v11;
    if (v7)
    {
      uint64_t v8 = [v11 folder];
      uint64_t v9 = [v8 visibleWidgetIconCount];
      if (*(unsigned char *)(a1 + 40)) {
        uint64_t v10 = -v9;
      }
      else {
        uint64_t v10 = v9;
      }
      *(void *)(*(void *)(a1 + 32) + 184) += v10;

      id v3 = v11;
    }
  }
}

- (void)iconList:(id)a3 didInvalidateLayoutWithGridCellInfoOptions:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v7 = [(NSHashTable *)self->_folderObservers allObjects];
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
        long long v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          [v12 folder:self list:v6 didInvalidateLayoutWithGridCellInfoOptions:a4];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)folder:(id)a3 willAddIcon:(id)a4
{
}

- (void)folder:(id)a3 didAddIcons:(id)a4 removedIcons:(id)a5
{
}

- (void)folder:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [(NSHashTable *)self->_folderObservers allObjects];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector()) {
          [v14 folder:self didReplaceIcon:v7 withIcon:v8];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithFolder:self copyLeafIcons:0];
}

- (id)copyWithOptions:(unint64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  return (id)[v5 initWithFolder:self options:a3];
}

- (id)succinctDescription
{
  char v2 = [(SBFolder *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (void)setParent:(id)a3
{
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)defaultDisplayName
{
  return self->_defaultDisplayName;
}

- (void)setDefaultDisplayName:(id)a3
{
}

- (void)setIcon:(id)a3
{
}

- (SBHIconBadgeBehaviorProviding)badgeBehaviorProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_badgeBehaviorProvider);
  return (SBHIconBadgeBehaviorProviding *)WeakRetained;
}

- (SBHIconGridSize)listGridSize
{
  return self->_listGridSize;
}

- (SBHIconGridSize)listWithNonDefaultSizedIconsGridSize
{
  return self->_listWithNonDefaultSizedIconsGridSize;
}

- (SBHIconGridSizeClassSizeMap)iconGridSizeClassSizes
{
  return self->_iconGridSizeClassSizes;
}

- (NSString)listRotatedLayoutClusterGridSizeClass
{
  return self->_listRotatedLayoutClusterGridSizeClass;
}

- (BOOL)listsAllowRotatedLayout
{
  return self->_listsAllowRotatedLayout;
}

- (BOOL)listsAllowIndependentRotatedLayout
{
  return self->_listsAllowIndependentRotatedLayout;
}

- (SBHIconGridSizeClassSet)listAllowedGridSizeClasses
{
  return self->_listAllowedGridSizeClasses;
}

- (int64_t)listsFixedIconLocationBehavior
{
  return self->_listsFixedIconLocationBehavior;
}

- (unint64_t)listsIconLayoutBehavior
{
  return self->_listsIconLayoutBehavior;
}

- (SBHIconGridSizeClassDomain)gridSizeClassDomain
{
  return self->_gridSizeClassDomain;
}

- (unint64_t)visibleWidgetIconCount
{
  return self->_visibleWidgetIconCount;
}

- (void)setBadge:(id)a3
{
}

- (BOOL)containsNonDefaultSizedIcon
{
  return self->_containsNonDefaultSizedIcon;
}

- (BOOL)containsVisibleNonDefaultSizedIcon
{
  return self->_containsVisibleNonDefaultSizedIcon;
}

- (SBHIconGridSizeClassSizeMap)rotatedIconGridSizeClassSizes
{
  return self->_rotatedIconGridSizeClassSizes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotatedIconGridSizeClassSizes, 0);
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_gridSizeClassDomain, 0);
  objc_storeStrong((id *)&self->_listAllowedGridSizeClasses, 0);
  objc_storeStrong((id *)&self->_listRotatedLayoutClusterGridSizeClass, 0);
  objc_storeStrong((id *)&self->_iconGridSizeClassSizes, 0);
  objc_destroyWeak((id *)&self->_badgeBehaviorProvider);
  objc_destroyWeak((id *)&self->_icon);
  objc_storeStrong((id *)&self->_defaultDisplayName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_nodeIdentifier, 0);
  objc_storeStrong((id *)&self->_coalesceChangesTransaction, 0);
  objc_storeStrong((id *)&self->_lists, 0);
  objc_storeStrong((id *)&self->_folderObservers, 0);
  objc_storeStrong((id *)&self->_nodeObservers, 0);
}

- (id)layerForListIndex:(unint64_t)a3 gridSize:(SBHIconGridSize)a4 iconImageInfo:(SBIconImageInfo *)a5 cellSpacing:(CGSize)a6 imageAppearance:(id)a7 cellProvider:(id)a8
{
  double v13 = v11;
  double v14 = v10;
  double v15 = v9;
  double v16 = v8;
  double height = a6.height;
  double width = a6.width;
  id v21 = a7;
  id v22 = a5;
  long long v23 = [(SBFolder *)self listAtIndex:a3];
  long long v24 = objc_msgSend(v23, "layerWithIconImageInfo:cellSpacing:imageAppearance:cellProvider:", v22, v21, width, height, v16, v15, v14, v13);

  return v24;
}

- (id)layerForListIndex:(unint64_t)a3 listLayout:(id)a4 traitCollection:(id)a5
{
  double v8 = (void *)MEMORY[0x1E4FB1E20];
  id v9 = a4;
  double v10 = objc_msgSend(v8, "sbh_iconImageAppearanceFromTraitCollection:", a5);
  double v11 = [(SBFolder *)self layerForListIndex:a3 listLayout:v9 imageAppearance:v10];

  return v11;
}

- (id)layerForListIndex:(unint64_t)a3 listLayout:(id)a4 imageAppearance:(id)a5
{
  return [(SBFolder *)self layerForListIndex:a3 listLayout:a4 imageAppearance:a5 cellProvider:0];
}

- (BOOL)isRootFolder
{
  return 0;
}

- (void)_swapRestoreIconCount:(uint64_t *)a3 toLocation:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, uint64_t *a3, NSObject *a4)
{
  uint64_t v7 = [a2 count];
  *(_DWORD *)a1 = 134217984;
  *a3 = v7;
  _os_log_error_impl(&dword_1D7F0A000, a4, OS_LOG_TYPE_ERROR, "Extra %ld icons left for swap restore", a1, 0xCu);
}

@end