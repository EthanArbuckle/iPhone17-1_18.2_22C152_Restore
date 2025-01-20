@interface PXGLayout
+ (unint64_t)scrolledEdgesForVisibleEdges:(unint64_t)a3 scrollableAxis:(int64_t)a4;
- ($16EC8B44B1C22DB88FC318D5A7EDDAB2)geometryForSpriteAtIndex:(unsigned int)a3;
- ($225AF24142A77900D29617A74D173C5F)styleForSpriteAtIndex:(SEL)a3;
- ($294CB042FB18EDF8FD74FDF4F765ED39)stringSourceRespondsTo;
- ($738B17BD11CC339B30296C0EA03CEC2B)entityForSpriteAtIndex:(unsigned int)a3;
- ($786F7D2F4E5B3A0CBB66DF574B7D98CF)infoForSpriteAtIndex:(SEL)a3;
- ($8F6F21C65DCD0A0F8AC24DFE540A6236)orientedContentTransform;
- ($F075B4A35807C7876885CD3A0A1A7192)displayAssetSourceRespondsTo;
- (BOOL)allowsDanglingUpdatesAssertions;
- (BOOL)allowsObjectReferenceSpriteIndexLookup;
- (BOOL)allowsSublayoutUpdateCycleAssertions;
- (BOOL)appliesAlphaToSublayouts;
- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5;
- (BOOL)axShouldBeConsideredAsSubgroup;
- (BOOL)axShouldSearchLeafsInSubgroups;
- (BOOL)canHandleVisibleRectRejection;
- (BOOL)changeVisibleRectToProposedVisibleRect:(CGRect)a3;
- (BOOL)definesContextForPointReferences;
- (BOOL)disableDebugAssertionForAnchorUpdatesWithZeroContentSize;
- (BOOL)disableDebugAssertionForSublayoutUpdates;
- (BOOL)hasPointReferences;
- (BOOL)hasSublayoutsRemainingToBeUpdated;
- (BOOL)isAnimating;
- (BOOL)isDescendantOfLayout:(id)a3;
- (BOOL)isFloating;
- (BOOL)isSpriteIndex:(unsigned int)a3 decoratingSpriteWithIndex:(unsigned int *)a4;
- (BOOL)isUpdatingSpriteStyling;
- (BOOL)needsUpdate;
- (BOOL)shouldApplyItemChangeDetailsToSublayout:(id)a3;
- (BOOL)shouldApplySpriteTransformToSublayouts;
- (BOOL)shouldDecorateUndefinedMediaKind;
- (BOOL)shouldFaultInContentAtAnchoredContentEdges;
- (BOOL)shouldInvalidateDecorationForModifiedSprites;
- (BOOL)shouldUpdateDecorationMediaTargetSizes;
- (CGPoint)_offsetToDescendantLayout:(id)a3;
- (CGPoint)axConvertPoint:(CGPoint)a3 fromDescendantGroup:(id)a4;
- (CGPoint)axConvertPoint:(CGPoint)a3 toDescendantGroup:(id)a4;
- (CGPoint)convertPoint:(CGPoint)a3 fromDescendantLayout:(id)a4;
- (CGPoint)convertPoint:(CGPoint)a3 fromLayout:(id)a4;
- (CGPoint)convertPoint:(CGPoint)a3 toDescendantLayout:(id)a4;
- (CGPoint)lastScrollDirection;
- (CGPoint)pointForPointReference:(id)a3;
- (CGRect)anchoringRectForSpriteAtIndex:(unsigned int)a3;
- (CGRect)axConvertRect:(CGRect)a3 fromDescendantGroup:(id)a4;
- (CGRect)axConvertRect:(CGRect)a3 toDescendantGroup:(id)a4;
- (CGRect)bounds;
- (CGRect)clippingRect;
- (CGRect)convertRect:(CGRect)a3 fromDescendantLayout:(id)a4;
- (CGRect)convertRect:(CGRect)a3 fromLayout:(id)a4;
- (CGRect)convertRect:(CGRect)a3 toDescendantLayout:(id)a4;
- (CGRect)frame;
- (CGRect)visibleRect;
- (CGSize)contentSize;
- (CGSize)estimatedContentSize;
- (CGSize)minPlayableSizeForSpriteAtIndex:(unsigned int)a3;
- (CGSize)referenceSize;
- (NSArray)animations;
- (NSArray)fences;
- (NSArray)interactions;
- (NSArray)pendingAnimations;
- (NSArray)pendingFences;
- (NSArray)preferredFocusLayouts;
- (NSArray)transitions;
- (NSHashTable)pointReferences;
- (NSIndexSet)axBorderSpriteIndexes;
- (NSIndexSet)axSelectedSpriteIndexes;
- (NSIndexSet)axSpriteIndexes;
- (NSIndexSet)axVisibleSpriteIndexes;
- (NSIndexSet)hiddenSpriteIndexes;
- (NSIndexSet)localHiddenSpriteIndexes;
- (NSIndexSet)preferredFocusSpriteIndexes;
- (NSMutableArray)changeDetails;
- (NSString)axLocalizedLabel;
- (NSString)briefDiagnosticDescription;
- (NSString)diagnosticDescription;
- (NSString)parentDescription;
- (NSString)recursiveDescription;
- (OS_dispatch_queue)layoutQueue;
- (PXAssetsSectionLayout)px_assetsSectionLayout;
- (PXGAXResponder)axNextResponder;
- (PXGAnchor)activeAnchor;
- (PXGAnchor)lastVisibleAreaAnchor;
- (PXGBasicAXGroup)axGroup;
- (PXGDataSourceChange)currentDataSourceChange;
- (PXGDataSourceChange)internalCurrentDataSourceChange;
- (PXGDecoratingLayout)decoratingLayout;
- (PXGDisplayAssetSource)displayAssetSource;
- (PXGEntityManager)entityManager;
- (PXGItemsLayout)itemsLayout;
- (PXGItemsLayout)layoutForItemChanges;
- (PXGLayout)init;
- (PXGLayout)nextViewHostingLayout;
- (PXGLayout)rootLayout;
- (PXGLayout)superlayout;
- (PXGLayoutContentSource)contentSource;
- (PXGLayoutFocusDelegate)focusDelegate;
- (PXGLayoutScrollDelegate)scrollDelegate;
- (PXGLayoutSnapshotDataSource)layoutSnapshotDataSource;
- (PXGLayoutSpriteModifier)spriteModifier;
- (PXGLayoutUpdateDelegate)updateDelegate;
- (PXGLayoutViewDelegate)viewDelegate;
- (PXGLayoutVisibleRectDelegate)visibleRectDelegate;
- (PXGSpriteDataStore)modifiedSpriteDataStore;
- (PXGSpriteDataStore)spriteDataStore;
- (PXGSpriteMetadataStore)spriteMetadataStore;
- (PXGSublayoutDataStore)sublayoutDataStore;
- (PXGViewEnvironment)viewEnvironment;
- (PXMediaProvider)mediaProvider;
- (UICoordinateSpace)coordinateSpace;
- (UIEdgeInsets)flexibleRegionInsets;
- (UIEdgeInsets)fullPageSnapshotFloatingInsets;
- (UIEdgeInsets)safeAreaInsets;
- (_PXGSpriteIndexRange)addSpriteCount:(unsigned int)a3 withInitialState:(id)a4;
- (_PXGSpriteIndexRange)convertRange:(_PXGSpriteIndexRange)a3 fromSublayout:(id)a4;
- (_PXGSpriteIndexRange)convertSpriteIndexRange:(_PXGSpriteIndexRange)a3 fromDescendantLayout:(id)a4;
- (_PXGSpriteIndexRange)spriteIndexRangeCoveringRect:(CGRect)a3;
- (__n128)cameraConfiguration;
- (double)alpha;
- (double)displayMaximumHeadroom;
- (double)displayScale;
- (double)floatingOffset;
- (double)lastBaseline;
- (double)referenceDepth;
- (id)_createAnchorForContentEdges:(unint64_t)a3 priority:(int64_t)a4;
- (id)_createAnchorWithAnchor:(id)a3 resetPriority:(BOOL)a4;
- (id)_createAnchorWithPriority:(int64_t)a3 constraints:(id)a4;
- (id)_paddingForLevel:(int64_t)a3;
- (id)ancestorSharedWithLayout:(id)a3;
- (id)axContainingScrollViewForAXGroup:(id)a3;
- (id)axContainingViewForAXGroup:(id)a3;
- (id)axContentInfoAtSpriteIndex:(unsigned int)a3;
- (id)axLeafForObjectReference:(id)a3;
- (id)axSpriteIndexesInRectDefaultImplementation:(CGRect)a3;
- (id)convertChangeDetails:(id)a3 fromSublayout:(id)a4;
- (id)convertSpriteIndexes:(id)a3 fromDescendantLayout:(id)a4;
- (id)createAnchorForContentEdges:(unint64_t)a3;
- (id)createAnchorForScrollingAnimationTowardsContentEdges:(unint64_t)a3;
- (id)createAnchorForScrollingSpriteAtIndex:(unsigned int)a3 toScrollPosition:(unint64_t)a4 padding:(UIEdgeInsets)a5;
- (id)createAnchorForScrollingSpriteForObjectReference:(id)a3 toScrollPosition:(unint64_t)a4 padding:(UIEdgeInsets)a5;
- (id)createAnchorForScrollingSpriteForSpriteReference:(id)a3 normalizedAnchorPoint:(CGPoint)a4 toVisibleLocation:(CGPoint)a5;
- (id)createAnchorForScrollingSpriteForSpriteReference:(id)a3 toScrollPosition:(unint64_t)a4 padding:(UIEdgeInsets)a5;
- (id)createAnchorForScrollingSpriteForSpriteReference:(id)a3 toScrollPosition:(unint64_t)a4 padding:(UIEdgeInsets)a5 customOffset:(id)a6;
- (id)createAnchorForScrollingToContentEdges:(unint64_t)a3 padding:(UIEdgeInsets)a4;
- (id)createAnchorForSpriteAtIndex:(unsigned int)a3;
- (id)createAnchorForSpriteReferences:(id)a3;
- (id)createAnchorForVisibleArea;
- (id)createAnchorForVisibleAreaIgnoringEdges:(unint64_t)a3;
- (id)createAnchorFromSuperlayoutWithSublayoutIndex:(int64_t)a3 sublayoutPositionEdges:(unint64_t)a4 ignoringScrollingAnimationAnchors:(BOOL)a5;
- (id)createAnchorWithAnchor:(id)a3;
- (id)createAnchorWithConstraints:(id)a3;
- (id)createAnimation;
- (id)createCuratedLibraryLayoutAnimationIfNeededWithContext:(int64_t)a3;
- (id)createCuratedLibraryLayoutAnimationIfNeededWithContext:(int64_t)a3 userData:(id)a4;
- (id)createCuratedLibraryLayoutSkimmingSlideshowAnimationFromSectionIndexPath:(PXSimpleIndexPath *)a3 toSectionIndexPath:(PXSimpleIndexPath *)a4;
- (id)createCuratedLibraryLayoutTransitionIfNeededWithContext:(int64_t)a3;
- (id)createCuratedLibraryLayoutZoomLevelChangeAnimationFromZoomLevel:(int64_t)a3 toZoomLevel:(int64_t)a4 withContext:(int64_t)a5;
- (id)createDefaultAnimationForCurrentContext;
- (id)createFenceWithType:(unint64_t)a3;
- (id)createPointReferenceAtPoint:(CGPoint)a3;
- (id)createTransitionWithAnimations:(id)a3;
- (id)diagnosticsItemProvidersInRect:(CGRect)a3;
- (id)dropTargetObjectReferenceForLocation:(CGPoint)a3;
- (id)dynamicSpriteReferenceForObjectReference:(id)a3;
- (id)hitTestResultForSpriteIndex:(unsigned int)a3;
- (id)itemPlacementControllerForItemReference:(id)a3;
- (id)leafSublayoutForSpriteIndex:(unsigned int)a3;
- (id)navigationObjectReferenceForLocation:(CGPoint)a3;
- (id)objectReferenceForSpriteIndex:(unsigned int)a3;
- (id)spriteReferenceForObjectReference:(id)a3;
- (id)spriteReferenceForSpriteIndex:(unsigned int)a3;
- (id)spriteReferenceForSpriteIndex:(unsigned int)a3 objectReference:(id)a4;
- (id)spriteReferenceForSpriteReference:(id)a3;
- (id)sublayoutAtIndex:(int64_t)a3 loadIfNeeded:(BOOL)a4;
- (id)sublayoutForSpriteIndex:(unsigned int)a3;
- (id)userData;
- (id)viewForSpriteIndex:(unsigned int)a3;
- (int64_t)addSublayout:(id)a3;
- (int64_t)anchoredSublayoutIndex;
- (int64_t)indexOfSublayout:(id)a3;
- (int64_t)intrinsicScrollRegime;
- (int64_t)numberOfDescendantAnchors;
- (int64_t)numberOfSublayouts;
- (int64_t)scrollSpeedRegime;
- (int64_t)scrollableAxis;
- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5;
- (int64_t)sublayoutIndexForSpriteIndex:(unsigned int)a3;
- (int64_t)sublayoutIndexForSpriteReference:(id)a3 options:(unint64_t)a4;
- (int64_t)updateCount;
- (int64_t)version;
- (unint64_t)anchoredContentEdges;
- (unint64_t)appearState;
- (unint64_t)axFocusabilityForSpriteAtIndex:(unsigned int)a3;
- (unint64_t)contentChangeTrend;
- (unint64_t)fullyVisibleEdgesWithDefaultTolerance;
- (unint64_t)fullyVisibleEdgesWithEdgeTolerances:(UIEdgeInsets)a3;
- (unint64_t)userInterfaceDirection;
- (unsigned)addResizableCapInsets:(id)a3;
- (unsigned)addSpriteWithInitialState:(id)a3;
- (unsigned)axSpriteIndexClosestToSpriteIndex:(unsigned int)a3 inDirection:(unint64_t)a4;
- (unsigned)axSpriteIndexClosestToSpriteIndexDefaultImplementation:(unsigned int)a3 inDirection:(unint64_t)a4;
- (unsigned)childrenNumberOfSprites;
- (unsigned)convertSpriteIndex:(unsigned int)a3 fromDescendantLayout:(id)a4;
- (unsigned)convertSpriteIndex:(unsigned int)a3 fromLayout:(id)a4;
- (unsigned)convertSpriteIndex:(unsigned int)a3 toDescendantLayout:(id)a4;
- (unsigned)localNumberOfSprites;
- (unsigned)numberOfSprites;
- (unsigned)referenceOptions;
- (unsigned)spriteIndexForObjectReference:(id)a3;
- (unsigned)spriteIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5;
- (unsigned)spriteIndexForSpriteReference:(id)a3;
- (unsigned)spriteIndexForSpriteReference:(id)a3 options:(unint64_t)a4;
- (unsigned)viewHostingSpriteIndex;
- (void)_addAnimations:(id)a3;
- (void)_addFences:(id)a3;
- (void)_addHiddenSpriteIndexes:(id)a3;
- (void)_appendDescription:(id)a3 atLevel:(int64_t)a4;
- (void)_childDidUpdateWithDuration:(unint64_t)a3;
- (void)_destroyModifiedSpriteDataStore;
- (void)_destroySpriteDataStore;
- (void)_ensureModifiedSpriteDataStore;
- (void)_ensureSpriteDataStore;
- (void)_ensureSublayoutDataStore;
- (void)_enumerateSpritesInRange:(_PXGSpriteIndexRange)a3 transform:(id *)a4 spriteOffset:(unsigned int)a5 stop:(BOOL *)a6 usingBlock:(id)a7;
- (void)_enumerateSpritesInRect:(CGRect)a3 transform:(id *)a4 usingBlock:(id)a5;
- (void)_incrementNumberOfSprites:(int64_t)a3;
- (void)_invalidateDecorationForSpriteRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4 invalidateSprites:(BOOL)a5;
- (void)_invalidateStyleOfSpritesWithIndexes:(id)a3;
- (void)_propagateHiddenSpriteIndexes:(id)a3;
- (void)_recursivelyResetHiddenSpriteIndexes;
- (void)_resetHiddenSpriteIndexes;
- (void)_setNeedsUpdateExternally:(BOOL)a3;
- (void)_updateAnchoring;
- (void)_updateVersion;
- (void)_willAddSublayout:(id)a3;
- (void)addAnchor:(id)a3;
- (void)addAnimation:(id)a3;
- (void)addFence:(id)a3;
- (void)addInteraction:(id)a3;
- (void)addPointReference:(id)a3;
- (void)addSpritesAtIndexes:(id)a3 initialState:(id)a4;
- (void)addSpritesInRange:(_PXGSpriteIndexRange)a3 initialState:(id)a4;
- (void)addTransition:(id)a3;
- (void)adjustReferencedSpriteIndexesWithChangeDetails:(id)a3 appliedToLayout:(id)a4;
- (void)applySectionedChangeDetails:(id)a3 dataSourceBeforeChanges:(id)a4 dataSourceAfterChanges:(id)a5 sublayoutProvider:(id)a6 outChangedSections:(id *)a7 outSectionsWithItemChanges:(id *)a8 changeMediaVersionHandler:(id)a9;
- (void)applySectionedChangeDetailsForSingleSection:(id)a3 dataSourceBeforeChanges:(id)a4 dataSourceAfterChanges:(id)a5 changeMediaVersionHandler:(id)a6;
- (void)applySpriteChangeDetails:(id)a3 countAfterChanges:(unsigned int)a4 initialState:(id)a5 modifyFullState:(id)a6;
- (void)applySpriteChangeDetails:(id)a3 countAfterChanges:(unsigned int)a4 initialState:(id)a5 modifyState:(id)a6;
- (void)applySublayoutChangeDetails:(id)a3 countAfterChanges:(int64_t)a4 sublayoutProvider:(id)a5;
- (void)assumeWillUpdateSublayoutInUpdatePass:(id)a3;
- (void)axAddSubgroupForSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5;
- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5;
- (void)axRemoveSubgroupForSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5;
- (void)clearLastVisibleAreaAnchoringInformation;
- (void)containingScrollViewDidScroll:(CGPoint)a3;
- (void)contentSizeDidChange;
- (void)copyLayoutForSpritesInRange:(_PXGSpriteIndexRange)a3 applySpriteTransforms:(BOOL)a4 entities:(id *)a5 geometries:(id *)a6 styles:(id *)a7 infos:(id *)a8;
- (void)copyLayoutForSpritesInRange:(_PXGSpriteIndexRange)a3 applySpriteTransforms:(BOOL)a4 parentTransform:(id *)a5 parentAlpha:(float)a6 parentClippingRect:(CGRect)a7 parentSublayoutOrigin:(id)a8 entities:(id *)a9 geometries:(id *)a10 styles:(id *)a11 infos:(id *)a12;
- (void)copyLayoutForSpritesInRange:(_PXGSpriteIndexRange)a3 entities:(id *)a4 geometries:(id *)a5 styles:(id *)a6 infos:(id *)a7;
- (void)copyLayoutForSpritesInRange:(_PXGSpriteIndexRange)a3 toSpriteDataStore:(id)a4;
- (void)copySpritesToDataStore:(id)a3;
- (void)dealloc;
- (void)didAddSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5;
- (void)didApplySpriteChangeDetails:(id)a3;
- (void)didApplySublayoutChangeDetails:(id)a3 axAdjustedSubgroupChangeDetails:(id)a4 countAfterChanges:(int64_t)a5;
- (void)didChangeSublayoutOrigins;
- (void)didFaultInSublayout:(id)a3 atIndex:(int64_t)a4 fromEstimatedContentSize:(CGSize)a5;
- (void)didRender;
- (void)didUpdate;
- (void)didUpdateSublayout:(id)a3;
- (void)enumerateDescendantsLayoutsBreadthFirstReverseUsingBlock:(id)a3;
- (void)enumerateDescendantsLayoutsUsingBlock:(id)a3;
- (void)enumerateLayoutsForSpritesInRange:(_PXGSpriteIndexRange)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumerateLocalSpritesInRect:(CGRect)a3 usingBlock:(id)a4;
- (void)enumerateSpritesInRange:(_PXGSpriteIndexRange)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumerateSpritesInRange:(_PXGSpriteIndexRange)a3 usingBlock:(id)a4;
- (void)enumerateSpritesInRect:(CGRect)a3 usingBlock:(id)a4;
- (void)enumerateSublayoutsForCreatingPointReferenceUsingBlock:(id)a3;
- (void)enumerateSublayoutsForDetailedPlacement:(id)a3 ofItemWithReference:(id)a4 usingBlock:(id)a5;
- (void)enumerateVisibleAnchoringLayoutsUsingBlock:(id)a3;
- (void)enumerateVisibleAnchoringSpriteIndexesUsingBlock:(id)a3;
- (void)getDetailedPresentedPlacement:(id)a3 forItemReference:(id)a4;
- (void)hideSpritesForObjectReferences:(id)a3;
- (void)hostingControllerProposedReferenceSize:(id)a3;
- (void)insertSublayout:(id)a3 atIndex:(int64_t)a4;
- (void)insertSublayoutProvider:(id)a3 atIndexes:(id)a4;
- (void)insertSublayoutProvider:(id)a3 inRange:(_NSRange)a4;
- (void)installLayoutCompletionBlock:(id)a3;
- (void)invalidateAllSuperlayoutAnchors;
- (void)invalidateDecoration;
- (void)invalidateDecorationAndSprites;
- (void)invalidateDecorationForSpritesInRange:(_PXGSpriteIndexRange)a3;
- (void)invalidateVersion;
- (void)markLastVisibleAreaAnchoringInformationForInvalidation;
- (void)modifySpritesAtIndexes:(id)a3 fullState:(id)a4;
- (void)modifySpritesAtIndexes:(id)a3 state:(id)a4;
- (void)modifySpritesInRange:(_PXGSpriteIndexRange)a3 fullState:(id)a4;
- (void)modifySpritesInRange:(_PXGSpriteIndexRange)a3 state:(id)a4;
- (void)modifySpritesInRect:(CGRect)a3 state:(id)a4;
- (void)moveSpritesInRange:(_PXGSpriteIndexRange)a3 toRange:(_PXGSpriteIndexRange)a4;
- (void)performChangesWithLocalUpdate:(id)a3;
- (void)performRepeatedSublayoutsUpdate:(id)a3;
- (void)performSpriteStylingUpdate:(id)a3;
- (void)px_modifyAssetsSectionLayoutGeometry:(id)a3;
- (void)removeAllAnimations;
- (void)removeAllFences;
- (void)removeAllTransitions;
- (void)removeAnchor:(id)a3;
- (void)removeAnimation:(id)a3;
- (void)removeFromSuperlayout;
- (void)removeInteraction:(id)a3;
- (void)removePointReference:(id)a3;
- (void)removeSpritesAtIndexes:(id)a3;
- (void)removeSpritesInRange:(_PXGSpriteIndexRange)a3;
- (void)removeSublayoutAtIndex:(int64_t)a3;
- (void)removeSublayoutsAtIndexes:(id)a3;
- (void)removeSublayoutsInRange:(_NSRange)a3;
- (void)setAlpha:(double)a3;
- (void)setAppearState:(unint64_t)a3;
- (void)setAxNextResponder:(id)a3;
- (void)setCameraConfiguration:(float32x4_t *)a3;
- (void)setClippingRect:(CGRect)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setContentSource:(id)a3;
- (void)setDetailedPlacementOverride:(id)a3 forItemReference:(id)a4;
- (void)setDisplayMaximumHeadroom:(double)a3;
- (void)setDisplayScale:(double)a3;
- (void)setEntityManager:(id)a3;
- (void)setEstimatedContentSize:(CGSize)a3;
- (void)setFloating:(BOOL)a3;
- (void)setFloatingOffset:(double)a3;
- (void)setFocusDelegate:(id)a3;
- (void)setHiddenSpriteIndexes:(id)a3;
- (void)setInteractions:(id)a3;
- (void)setInternalCurrentDataSourceChange:(id)a3;
- (void)setLastBaseline:(double)a3;
- (void)setLastScrollDirection:(CGPoint)a3;
- (void)setLastVisibleAreaAnchor:(id)a3;
- (void)setLayoutQueue:(id)a3;
- (void)setLocalHiddenSpriteIndexes:(id)a3;
- (void)setMediaProvider:(id)a3;
- (void)setNeedsFocusUpdate;
- (void)setNeedsUpdate;
- (void)setNeedsUpdateOfScrollableAxis;
- (void)setNextViewHostingLayout:(id)a3;
- (void)setReferenceDepth:(double)a3;
- (void)setReferenceOptions:(unsigned __int16)a3;
- (void)setReferenceSize:(CGSize)a3;
- (void)setSafeAreaInsets:(UIEdgeInsets)a3;
- (void)setScrollDelegate:(id)a3;
- (void)setScrollSpeedRegime:(int64_t)a3;
- (void)setSpriteModifier:(id)a3;
- (void)setSuperlayout:(id)a3;
- (void)setUpdateDelegate:(id)a3;
- (void)setUserData:(id)a3;
- (void)setUserInterfaceDirection:(unint64_t)a3;
- (void)setViewDelegate:(id)a3;
- (void)setViewEnvironment:(id)a3;
- (void)setVisibleRect:(CGRect)a3;
- (void)setVisibleRectDelegate:(id)a3;
- (void)sublayout:(id)a3 didAddAnchor:(id)a4;
- (void)sublayout:(id)a3 didApplySpriteChangeDetails:(id)a4 fromDescendentSublayout:(id)a5;
- (void)sublayout:(id)a3 didRemoveAnchor:(id)a4;
- (void)superlayoutDidChange;
- (void)update;
- (void)updateAsRootIfNeeded;
- (void)updateIfNeeded;
- (void)updateStylingForSpritesAtIndexes:(id)a3;
- (void)viewEnvironmentDidChange;
- (void)visibleRectDidChange;
- (void)willFaultOutSublayout:(id)a3 atIndex:(int64_t)a4;
- (void)willRemoveSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5;
- (void)willUpdate;
@end

@implementation PXGLayout

- (unsigned)localNumberOfSprites
{
  v2 = [(PXGLayout *)self spriteDataStore];
  unsigned int v3 = [v2 count];

  return v3;
}

- (void)enumerateLayoutsForSpritesInRange:(_PXGSpriteIndexRange)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  id v6 = a5;
  [(PXGLayout *)self spriteDataStore];
  char v7 = 0;
  [(id)objc_claimAutoreleasedReturnValue() count];
  PXGSpriteIndexRangeIntersection();
}

- (PXGSpriteDataStore)spriteDataStore
{
  return self->_spriteDataStore;
}

- (PXGSublayoutDataStore)sublayoutDataStore
{
  return self->_sublayoutDataStore;
}

void __66__PXGLayout_enumerateLayoutsForSpritesInRange_options_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 36) = [a3 numberOfSprites];
  PXGSpriteIndexRangeIntersection();
}

- (unsigned)numberOfSprites
{
  return self->_numberOfSprites;
}

uint64_t __66__PXGLayout_enumerateLayoutsForSpritesInRange_options_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (*a4) {
    **(unsigned char **)(a1 + 40) = 1;
  }
  return result;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (PXGViewEnvironment)viewEnvironment
{
  return self->_viewEnvironment;
}

- (unint64_t)userInterfaceDirection
{
  return self->_userInterfaceDirection;
}

- (PXGDisplayAssetSource)displayAssetSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayAssetSource);
  return (PXGDisplayAssetSource *)WeakRetained;
}

- (void)clearLastVisibleAreaAnchoringInformation
{
  unsigned int v3 = [(PXGLayout *)self lastVisibleAreaAnchor];

  if (v3) {
    [(PXGLayout *)self setLastVisibleAreaAnchor:0];
  }
  id v4 = [(PXGLayout *)self sublayoutDataStore];
  [v4 enumerateSublayoutsUsingBlock:&__block_literal_global_106591];
}

- (PXGAnchor)lastVisibleAreaAnchor
{
  return self->_lastVisibleAreaAnchor;
}

uint64_t __64__PXGLayout_PXGAnchor__clearLastVisibleAreaAnchoringInformation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 clearLastVisibleAreaAnchoringInformation];
}

uint64_t __28__PXGLayout_setAppearState___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setAppearState:*(void *)(a1 + 32)];
}

void __165__PXGLayout_copyLayoutForSpritesInRange_applySpriteTransforms_parentTransform_parentAlpha_parentClippingRect_parentSublayoutOrigin_entities_geometries_styles_infos___block_invoke(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v5 = HIDWORD(a2);
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  if (v7 == v6)
  {
    if ((int)v5 + (int)a2 > [*(id *)(a1 + 40) count])
    {
      [MEMORY[0x1E4F28B00] currentHandler];
      objc_claimAutoreleasedReturnValue();
      [NSString stringWithUTF8String:"-[PXGLayout copyLayoutForSpritesInRange:applySpriteTransforms:parentTransform:parentAlpha:parentClippingRect:parentSublayoutOrigin:entities:geometries:styles:infos:]_block_invoke"];
      objc_claimAutoreleasedReturnValue();
      NSStringFromPXGSpriteIndexRange();
    }
    unsigned int v11 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    if (v11 + v5 > *(_DWORD *)(a1 + 188) + *(_DWORD *)(a1 + 184))
    {
      [MEMORY[0x1E4F28B00] currentHandler];
      objc_claimAutoreleasedReturnValue();
      [NSString stringWithUTF8String:"-[PXGLayout copyLayoutForSpritesInRange:applySpriteTransforms:parentTransform:parentAlpha:parentClippingRect:parentSublayoutOrigin:entities:geometries:styles:infos:]_block_invoke"];
      objc_claimAutoreleasedReturnValue();
      NSStringFromPXGSpriteIndexRange();
    }
    memcpy((void *)(*(void *)(a1 + 64) + 4 * v11), (const void *)([*(id *)(a1 + 40) entities] + 4 * a2), 4 * v5);
    memcpy((void *)(*(void *)(a1 + 72) + 32 * *(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)), (const void *)([*(id *)(a1 + 40) geometries] + 32 * a2), 32 * v5);
    memcpy((void *)(*(void *)(a1 + 80) + 160 * *(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)), (const void *)([*(id *)(a1 + 40) styles] + 160 * a2), 160 * v5);
    memcpy((void *)(*(void *)(a1 + 88) + 40 * *(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)), (const void *)([*(id *)(a1 + 40) infos] + 40 * a2), 40 * v5);
    uint64_t v12 = *(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    uint64_t v13 = *(void *)(a1 + 72);
    uint64_t v14 = *(void *)(a1 + 80);
    BOOL IsInfinite = CGRectIsInfinite(*(CGRect *)(a1 + 96));
    if (v5)
    {
      float32x2_t v18 = vcvt_f32_f64(*(float64x2_t *)(a1 + 96));
      float32x2_t v19 = vadd_f32(v18, vcvt_f32_f64(*(float64x2_t *)(a1 + 112)));
      v20 = (float *)(v14 + 160 * v12 + 20);
      uint64_t v21 = v13 + 32 * v12 + 16;
      int v22 = v5;
      do
      {
        double v23 = *(double *)(a1 + 128);
        double v24 = *(double *)(a1 + 136);
        double v25 = *(double *)(a1 + 144);
        double v26 = *(double *)(a1 + 152);
        double v27 = *(double *)v21;
        double v28 = COERCE_FLOAT(HIDWORD(*(void *)(v21 + 8)));
        *(float *)&uint64_t v29 = v25 * v28 + v23 * COERCE_FLOAT(*(void *)(v21 + 8));
        double v30 = *(double *)(a1 + 160);
        double v31 = *(double *)(a1 + 168);
        *(float *)&double v28 = v26 * v28 + v24 * *(float *)&v29;
        HIDWORD(v29) = LODWORD(v28);
        *(void *)(v21 + 8) = v29;
        double v32 = *(double *)(v21 - 8);
        double v33 = v30 + v25 * v32 + v23 * *(double *)(v21 - 16);
        *(double *)v16.i64 = v31 + v26 * v32 + v24 * v33;
        *(double *)(v21 - 16) = v33;
        *(void *)(v21 - 8) = v16.i64[0];
        *(float *)&double v33 = *(double *)(a1 + 176);
        *(double *)uint64_t v21 = v27 + *(float *)&v33;
        *(v20 - 5) = *(float *)(a1 + 192) * *(v20 - 5);
        int8x16_t v34 = *(int8x16_t *)v20;
        if (!IsInfinite)
        {
          v16.i32[0] = 0;
          float32x2_t v35 = vadd_f32(*(float32x2_t *)v34.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v34, v34, 8uLL));
          *(float32x2_t *)v36.i8 = vmaxnm_f32(*(float32x2_t *)v34.i8, v18);
          float32x2_t v37 = vsub_f32(vminnm_f32(v35, v19), *(float32x2_t *)v36.i8);
          *(int32x2_t *)v17.i8 = vcgez_f32(v37);
          *(uint32x2_t *)v17.i8 = vpmin_u32(*(uint32x2_t *)v17.i8, *(uint32x2_t *)v17.i8);
          int32x4_t v16 = vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32(v16, v17), 0);
          v36.u64[1] = (unint64_t)v37;
          int8x16_t v34 = vandq_s8(v36, (int8x16_t)v16);
          *(int8x16_t *)v20 = v34;
        }
        float v38 = *(double *)(a1 + 196) + *(float *)v34.i32;
        float *v20 = v38;
        *(float *)v34.i32 = v38;
        *(float *)&__int32 v39 = *(double *)(a1 + 204) + *(float *)&v34.i32[1];
        v34.i32[1] = v39;
        *(int8x16_t *)v20 = v34;
        v20 += 40;
        v21 += 32;
        --v22;
      }
      while (v22);
    }
  }
  else
  {
    uint64_t v80 = 0;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v75 = 0u;
    memset(v74, 0, sizeof(v74));
    if (*(void *)(a1 + 48))
    {
      [*(id *)(a1 + 48) geometryForSublayout:v6];
      double v8 = *((double *)&v75 + 1);
      double v9 = *(double *)&v75;
      double v10 = *(double *)&v76;
      id v7 = *(id *)(a1 + 32);
    }
    else
    {
      double v10 = 0.0;
      double v8 = 0.0;
      double v9 = 0.0;
    }
    double v40 = *(double *)(a1 + 196) + v9;
    double v41 = *(double *)(a1 + 204) + v8;
    double v42 = *(double *)(a1 + 212) + v10;
    if ([v7 shouldApplySpriteTransformToSublayouts])
    {
      long long v43 = *(_OWORD *)(a1 + 144);
      long long v70 = *(_OWORD *)(a1 + 128);
      long long v71 = v43;
      long long v72 = *(_OWORD *)(a1 + 160);
      uint64_t v44 = *(void *)(a1 + 176);
    }
    else
    {
      long long v45 = *((_OWORD *)off_1E5DAAF78 + 1);
      long long v70 = *(_OWORD *)off_1E5DAAF78;
      long long v71 = v45;
      long long v72 = *((_OWORD *)off_1E5DAAF78 + 2);
      uint64_t v44 = *((void *)off_1E5DAAF78 + 6);
    }
    uint64_t v73 = v44;
    uint64_t v69 = 0;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v66 = 0u;
    int v46 = *(unsigned __int8 *)(a1 + 220);
    long long v62 = v70;
    long long v63 = v71;
    long long v64 = v72;
    uint64_t v65 = v44;
    _spriteTransformFromSelfAndParent(&v66, (uint64_t)v74, (uint64_t)&v62, v46);
    double v47 = *(double *)(a1 + 96);
    double v48 = *(double *)(a1 + 104);
    double v49 = *(double *)(a1 + 112);
    double v50 = *(double *)(a1 + 120);
    v81.origin.x = v47;
    v81.origin.y = v48;
    v81.size.width = v49;
    v81.size.height = v50;
    BOOL v51 = CGRectIsInfinite(v81);
    double v52 = *(double *)&v75;
    if (v51) {
      double v52 = 0.0;
    }
    double v53 = v47 - v52;
    if (v51) {
      double v54 = 0.0;
    }
    else {
      double v54 = *((double *)&v75 + 1);
    }
    double v55 = v48 - v54;
    uint64_t v56 = *(unsigned __int8 *)(a1 + 220);
    LODWORD(v54) = *(_DWORD *)(a1 + 192);
    uint64_t v57 = *(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    uint64_t v58 = *(void *)(a1 + 64) + 4 * v57;
    uint64_t v59 = *(void *)(a1 + 72) + 32 * v57;
    uint64_t v60 = *(void *)(a1 + 80) + 160 * v57;
    uint64_t v61 = *(void *)(a1 + 88) + 40 * v57;
    long long v62 = v66;
    long long v63 = v67;
    long long v64 = v68;
    uint64_t v65 = v69;
    objc_msgSend(v6, "copyLayoutForSpritesInRange:applySpriteTransforms:parentTransform:parentAlpha:parentClippingRect:parentSublayoutOrigin:entities:geometries:styles:infos:", a2, v56, &v62, v58, v59, v60, v54, v53, v55, v49, v50, v40, v41, v42, v61);
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += v5;
}

- (BOOL)shouldApplySpriteTransformToSublayouts
{
  return 1;
}

uint64_t __32__PXGLayout_setViewEnvironment___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setViewEnvironment:*(void *)(a1 + 32)];
}

uint64_t __30__PXGLayout_setMediaProvider___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setMediaProvider:*(void *)(a1 + 32)];
}

uint64_t __51__PXGLayout_convertSpriteIndex_toDescendantLayout___block_invoke(uint64_t result, int a2, uint64_t a3, unsigned char *a4)
{
  if (*(void *)(result + 32) == a3)
  {
    *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a2;
    *a4 = 1;
  }
  return result;
}

- (PXGEntityManager)entityManager
{
  return self->_entityManager;
}

- (double)displayMaximumHeadroom
{
  return self->_displayMaximumHeadroom;
}

- ($F075B4A35807C7876885CD3A0A1A7192)displayAssetSourceRespondsTo
{
  __int16 v2 = *(_WORD *)&self->_displayAssetSourceRespondsTo.useLowMemoryDecodeInLayout;
  uint64_t v3 = *(void *)&self->_displayAssetSourceRespondsTo.supportedDisplayAssetPresentationStylesInLayout;
  result.var0 = v3;
  result.var1 = BYTE1(v3);
  result.var2 = BYTE2(v3);
  result.var3 = BYTE3(v3);
  result.var4 = BYTE4(v3);
  result.var5 = BYTE5(v3);
  result.var6 = BYTE6(v3);
  result.var7 = HIBYTE(v3);
  result.var8 = v2;
  result.var9 = HIBYTE(v2);
  return result;
}

- (void)setVisibleRectDelegate:(id)a3
{
}

- (id)axContentInfoAtSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(PXGLayout *)self spriteDataStore];
  if ([v5 count] <= v3) {
    goto LABEL_11;
  }
  id v6 = v5;
  uint64_t v7 = [v6 infos] + 40 * v3;
  unsigned int v8 = *(unsigned __int8 *)(v7 + 34);
  uint64_t v9 = PXGAXInfoKindForMediaKind(*(unsigned __int8 *)(v7 + 1));
  uint64_t v10 = 6;
  if ((v8 & 4) == 0) {
    uint64_t v10 = 0;
  }
  uint64_t v11 = v9 ? v9 : v10;
  if (v11)
  {
    uint64_t v12 = +[PXGReusableAXInfo sharedPool];
    uint64_t v13 = [v12 checkOutReusableObjectWithReuseIdentifier:1];
    if ([v13 fillContentForContentKind:v11 inLayout:self atIndex:v3])
    {
      id v14 = v6;
      v15 = (long long *)([v14 geometries] + 32 * v3);
      long long v16 = v15[1];
      long long v35 = *v15;
      long long v36 = v16;
      id v17 = v14;
      float32x2_t v18 = (long long *)([v17 styles] + 160 * v3);
      long long v19 = v18[7];
      long long v44 = v18[6];
      long long v45 = v19;
      long long v20 = v18[9];
      long long v46 = v18[8];
      long long v47 = v20;
      long long v21 = v18[3];
      long long v40 = v18[2];
      long long v41 = v21;
      long long v22 = v18[5];
      long long v42 = v18[4];
      long long v43 = v22;
      long long v23 = v18[1];
      long long v38 = *v18;
      long long v39 = v23;
      double v24 = [(PXGLayout *)self decoratingLayout];
      if (v24)
      {
        double v25 = [(PXGLayout *)self decoratingLayout];
        uint64_t v26 = [v25 focusRingType];
      }
      else
      {
        uint64_t v26 = 1;
      }

      [v13 setSpriteIndex:v3];
      v34[0] = v35;
      v34[1] = v36;
      [v13 setSpriteGeometry:v34];
      v37[6] = v44;
      v37[7] = v45;
      v37[8] = v46;
      v37[9] = v47;
      v37[2] = v40;
      v37[3] = v41;
      v37[4] = v42;
      v37[5] = v43;
      v37[0] = v38;
      v37[1] = v39;
      [v13 setSpriteStyle:v37];
      double v28 = (_DWORD *)([v17 styles] + 160 * v3);
      LODWORD(v29) = v28[9];
      LODWORD(v30) = v28[10];
      LODWORD(v31) = v28[11];
      LODWORD(v32) = v28[12];
      objc_msgSend(v13, "setSpriteStyleCornerRadius:", v29, v30, v31, v32);
      [v13 setFocusRingType:v26];
      [v13 setAxAccessibleWhenTransparent:(v8 >> 2) & 1];
      id v27 = v13;
    }
    else
    {
      [v12 checkInReusableObject:v13];
      id v27 = 0;
    }
  }
  else
  {
LABEL_11:
    id v27 = 0;
  }

  return v27;
}

- (void)enumerateSpritesInRange:(_PXGSpriteIndexRange)a3 usingBlock:(id)a4
{
}

- (void)enumerateSpritesInRange:(_PXGSpriteIndexRange)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  char v5 = a4;
  id v8 = a5;
  char v16 = 0;
  long long v9 = *((_OWORD *)off_1E5DAAF78 + 1);
  long long v12 = *(_OWORD *)off_1E5DAAF78;
  long long v13 = v9;
  long long v14 = *((_OWORD *)off_1E5DAAF78 + 2);
  uint64_t v15 = *((void *)off_1E5DAAF78 + 6);
  if (v5) {
    [(PXGLayout *)self orientedContentTransform];
  }
  v10[0] = v12;
  v10[1] = v13;
  v10[2] = v14;
  uint64_t v11 = v15;
  [(PXGLayout *)self _enumerateSpritesInRange:a3 transform:v10 spriteOffset:0 stop:&v16 usingBlock:v8];
}

- (void)_enumerateSpritesInRange:(_PXGSpriteIndexRange)a3 transform:(id *)a4 spriteOffset:(unsigned int)a5 stop:(BOOL *)a6 usingBlock:(id)a7
{
  id v8 = a7;
  long long v9 = [(PXGLayout *)self modifiedSpriteDataStore];
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [(PXGLayout *)self spriteDataStore];
  }
  long long v12 = v11;

  [v12 count];
  PXGSpriteIndexRangeIntersection();
}

- (PXGLayoutContentSource)contentSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentSource);
  return (PXGLayoutContentSource *)WeakRetained;
}

- (id)createAnchorFromSuperlayoutWithSublayoutIndex:(int64_t)a3 sublayoutPositionEdges:(unint64_t)a4 ignoringScrollingAnimationAnchors:(BOOL)a5
{
  BOOL v5 = a5;
  long long v9 = [(PXGLayout *)self superlayout];
  uint64_t v10 = [v9 activeAnchor];
  id v11 = v10;
  if (v5 && [v10 isScrollingAnimationAnchor])
  {

    id v11 = 0;
  }
  uint64_t v12 = [v11 type];
  if ((unint64_t)(v12 - 3) >= 3)
  {
    if ((unint64_t)(v12 - 1) <= 1)
    {
      uint64_t v20 = 0;
      long long v21 = &v20;
      uint64_t v22 = 0x2020000000;
      char v23 = 0;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __127__PXGLayout_PXGAnchor__createAnchorFromSuperlayoutWithSublayoutIndex_sublayoutPositionEdges_ignoringScrollingAnimationAnchors___block_invoke;
      v16[3] = &unk_1E5DBA418;
      float32x2_t v18 = &v20;
      int64_t v19 = a3;
      id v17 = v9;
      [v11 enumerateAllSpriteReferencesUsingBlock:v16];
      if (*((unsigned char *)v21 + 24))
      {
        long long v14 = (void *)[v11 copyWithLayout:self];
        [(PXGLayout *)self addAnchor:v14];
      }
      else
      {
        long long v14 = 0;
      }

      _Block_object_dispose(&v20, 8);
      goto LABEL_13;
    }
  }
  else
  {
    unint64_t v13 = [v11 edges] & a4;
    if (v13)
    {
      long long v14 = (void *)[v11 copyWithLayout:self];
      [v14 setEdges:v13];
      [(PXGLayout *)self addAnchor:v14];
      goto LABEL_13;
    }
  }
  long long v14 = 0;
LABEL_13:

  return v14;
}

- (void)applySpriteChangeDetails:(id)a3 countAfterChanges:(unsigned int)a4 initialState:(id)a5 modifyFullState:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  [(PXGLayout *)self _ensureSpriteDataStore];
  uint64_t v13 = [(PXGLayout *)self spriteModifier];
  double v53 = v12;
  if (v13)
  {
    [(PXGLayout *)self _ensureModifiedSpriteDataStore];
  }
  else
  {
    long long v14 = [(PXGLayout *)self modifiedSpriteDataStore];

    if (v14) {
      [(PXGLayout *)self _destroyModifiedSpriteDataStore];
    }
  }
  uint64_t v15 = [(PXGLayout *)self spriteDataStore];
  char v16 = [(PXGLayout *)self modifiedSpriteDataStore];
  uint64_t v17 = [(PXGLayout *)self localNumberOfSprites];
  double v54 = (void *)v13;
  uint64_t v50 = v17;
  uint64_t v51 = v8;
  if ([v10 hasIncrementalChanges])
  {
    uint64_t v18 = v8;
    uint64_t v17 = v17;
  }
  else
  {
    int64_t v19 = v15;
    uint64_t v20 = v16;
    id v21 = v11;
    id v22 = objc_alloc((Class)off_1E5DA5568);
    uint64_t v17 = v17;
    char v23 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, v17);
    uint64_t v18 = v8;
    double v24 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, v8);
    uint64_t v25 = [v22 initWithIncrementalChangeDetailsRemovedIndexes:v23 insertedIndexes:v24 movesToIndexes:0 movesFromIndexes:0 changedIndexes:0];

    id v10 = (id)v25;
    id v11 = v21;
    char v16 = v20;
    uint64_t v15 = v19;
  }
  uint64_t v26 = [v10 insertedIndexes];
  uint64_t v27 = [v26 count] + v17;
  double v28 = [v10 removedIndexes];
  uint64_t v29 = v27 - [v28 count];

  if (v29 != v18)
  {
    double v49 = [MEMORY[0x1E4F28B00] currentHandler];
    [v49 handleFailureInMethod:a2, self, @"PXGLayout.m", 1551, @"countBeforeChanges(%d) + spriteChangeDetails(%@) does not match countAfterChanges(%d)", v50, v10, v51 object file lineNumber description];
  }
  double v30 = [v10 removedIndexes];
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __85__PXGLayout_applySpriteChangeDetails_countAfterChanges_initialState_modifyFullState___block_invoke;
  _OWORD v74[3] = &unk_1E5DB06D8;
  v74[4] = self;
  id v31 = v15;
  id v75 = v31;
  id v32 = v16;
  id v76 = v32;
  [v30 enumerateRangesWithOptions:2 usingBlock:v74];

  double v33 = [v10 insertedIndexes];
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __85__PXGLayout_applySpriteChangeDetails_countAfterChanges_initialState_modifyFullState___block_invoke_2;
  v69[3] = &unk_1E5DB0810;
  id v34 = v31;
  id v70 = v34;
  id v35 = v32;
  id v71 = v35;
  long long v72 = self;
  id v36 = v11;
  id v73 = v36;
  [v33 enumerateRangesWithOptions:0 usingBlock:v69];

  if ([v10 hasMoves])
  {
    uint64_t v37 = [v10 movesFromIndexes];
    long long v38 = [v10 movesToIndexes];
    [v34 moveSpritesFromIndexes:v37 toIndexes:v38];

    uint64_t v39 = [v10 movesFromIndexes];
    long long v40 = [v10 movesToIndexes];
    [v35 moveSpritesFromIndexes:v39 toIndexes:v40];
  }
  if (v53)
  {
    long long v41 = [v10 changedIndexes];
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __85__PXGLayout_applySpriteChangeDetails_countAfterChanges_initialState_modifyFullState___block_invoke_3;
    v63[3] = &unk_1E5DB0838;
    SEL v68 = a2;
    id v64 = v34;
    uint64_t v65 = self;
    id v67 = v53;
    id v66 = v35;
    [v41 enumerateRangesUsingBlock:v63];
  }
  long long v42 = v54;
  if (v54)
  {
    long long v43 = [v10 insertedIndexes];
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __85__PXGLayout_applySpriteChangeDetails_countAfterChanges_initialState_modifyFullState___block_invoke_4;
    v59[3] = &unk_1E5DB06D8;
    id v44 = v54;
    id v60 = v44;
    id v45 = v35;
    id v61 = v45;
    long long v62 = self;
    [v43 enumerateRangesUsingBlock:v59];

    long long v46 = [v10 changedIndexes];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __85__PXGLayout_applySpriteChangeDetails_countAfterChanges_initialState_modifyFullState___block_invoke_5;
    v55[3] = &unk_1E5DB06D8;
    id v47 = v44;
    long long v42 = v54;
    id v56 = v47;
    id v57 = v45;
    uint64_t v58 = self;
    [v46 enumerateRangesUsingBlock:v55];
  }
  [(PXGLayout *)self sublayout:self didApplySpriteChangeDetails:v10 fromDescendentSublayout:self];
  uint64_t v48 = [(PXGLayout *)self axGroup];
  [v48 invalidateLeafs];
}

- (PXGSpriteDataStore)modifiedSpriteDataStore
{
  return self->_modifiedSpriteDataStore;
}

- (void)invalidateVersion
{
  self->_version = -(uint64_t)(int)atomic_fetch_add(PXGLayoutVersionMakeUnique_lastVersion, 1u);
  uint64_t v3 = [(PXGLayout *)self superlayout];
  [v3 invalidateVersion];

  id v4 = [(PXGLayout *)self axGroup];
  [v4 invalidateVersion];
}

- (PXGBasicAXGroup)axGroup
{
  return self->_reusableAXGroup;
}

- (PXGDecoratingLayout)decoratingLayout
{
  __int16 v2 = [(PXGLayout *)self superlayout];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (void)_setNeedsUpdateExternally:(BOOL)a3
{
  if (!self->_isPerformingWithLocalUpdate)
  {
    if (self->_isUpdating)
    {
      if (a3 && !self->_isUpdatingAnchoring)
      {
        self->_needsUpdate = 1;
        if ([(PXGLayout *)self allowsDanglingUpdatesAssertions])
        {
          if (!self->_isPropagatingAdjustedReferencedHiddenSpriteIndexes) {
            PXAssertGetLog();
          }
        }
      }
    }
    else
    {
      self->_needsUpdate = 1;
    }
    id v4 = [(PXGLayout *)self superlayout];
    [v4 sublayoutNeedsUpdate:self];

    BOOL v5 = [(PXGLayout *)self rootLayout];
    id v6 = [v5 updateDelegate];
    [v6 layoutNeedsUpdate:v5];

    uint64_t v7 = [(PXGLayout *)self activeAnchor];
    [v7 setNeedsUpdate:1];
  }
}

- (PXGLayout)rootLayout
{
  __int16 v2 = self;
  uint64_t v3 = [(PXGLayout *)v2 superlayout];

  if (v3)
  {
    do
    {
      id v4 = [(PXGLayout *)v2 superlayout];

      BOOL v5 = [(PXGLayout *)v4 superlayout];

      __int16 v2 = v4;
    }
    while (v5);
  }
  else
  {
    id v4 = v2;
  }
  return v4;
}

- (PXGLayout)superlayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_superlayout);
  return (PXGLayout *)WeakRetained;
}

- (void)sublayout:(id)a3 didApplySpriteChangeDetails:(id)a4 fromDescendentSublayout:(id)a5
{
  id v22 = (PXGLayout *)a3;
  id v9 = a4;
  id v10 = a5;
  if (v22 == self) {
    [(PXGLayout *)v22 didApplySpriteChangeDetails:v9];
  }
  if ([v9 hasAnyChanges])
  {
    if ([v9 hasAnyInsertionsRemovalsOrMoves]) {
      [(PXGLayout *)self invalidateVersion];
    }
    if (([v9 hasIncrementalChanges] & 1) == 0)
    {
      id v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2, self, @"PXGLayout.m", 1644, @"%@ didn't recieve incremental change details:%@", self, v9 object file lineNumber description];
    }
    if (v22 != self)
    {
      id v11 = [v9 insertedIndexes];
      uint64_t v12 = [v11 count];
      uint64_t v13 = [v9 removedIndexes];
      uint64_t v14 = v12 - [v13 count];

      [(PXGLayout *)self _incrementNumberOfSprites:v14];
    }
    uint64_t v15 = [(PXGLayout *)self convertChangeDetails:v9 fromSublayout:v22];
    [(PXGLayout *)self adjustReferencedSpriteIndexesWithChangeDetails:v15 appliedToLayout:self];
    char v16 = [(PXGLayout *)self superlayout];
    uint64_t v17 = v16;
    if (v16)
    {
      [v16 sublayout:self didApplySpriteChangeDetails:v15 fromDescendentSublayout:v10];
    }
    else
    {
      uint64_t v18 = [(PXGLayout *)self changeDetails];
      int64_t v19 = [v18 lastObject];
      if ([v19 canPreserveIncrementalChangesWhenAddingChangeDetails:v15])
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v19 addChangeDetails:v15];
        }
        else
        {
          uint64_t v20 = (void *)[v19 mutableCopy];
          [v18 removeLastObject];
          [v18 addObject:v20];
          [v20 addChangeDetails:v15];
        }
      }
      else
      {
        [v18 addObject:v15];
      }
      [(PXGLayout *)self _setNeedsUpdateExternally:0];
    }
  }
}

- (void)adjustReferencedSpriteIndexesWithChangeDetails:(id)a3 appliedToLayout:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_spriteIndexesWithInvalidatedStyle)
  {
    objc_msgSend(v6, "indexSetAfterApplyingChangesToIndexSet:");
    uint64_t v8 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
    spriteIndexesWithInvalidatedStyle = self->_spriteIndexesWithInvalidatedStyle;
    self->_spriteIndexesWithInvalidatedStyle = v8;
  }
  if (self->_localHiddenSpriteIndexes)
  {
    id v10 = objc_msgSend(v6, "indexSetAfterApplyingChangesToIndexSet:");
    [(PXGLayout *)self setLocalHiddenSpriteIndexes:v10];

    [(PXGLayout *)self _invalidateStyleOfSpritesWithIndexes:self->_localHiddenSpriteIndexes];
  }
  id v11 = [(PXGLayout *)self superlayout];
  if (v11)
  {
  }
  else if ([(NSMutableArray *)self->_spriteReferencesForHiddenSprites count])
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v13 = self->_spriteReferencesForHiddenSprites;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          objc_msgSend(v18, "adjustReferencedSpriteIndexesWithChangeDetails:appliedToLayout:", v6, v7, (void)v22);
          unsigned int v19 = [(PXGLayout *)self spriteIndexForSpriteReference:v18 options:1024];
          if (v19 != -1) {
            [v12 addIndex:v19];
          }
        }
        uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v15);
    }

    BOOL isPropagatingAdjustedReferencedHiddenSpriteIndexes = self->_isPropagatingAdjustedReferencedHiddenSpriteIndexes;
    self->_BOOL isPropagatingAdjustedReferencedHiddenSpriteIndexes = 1;
    [(PXGLayout *)self _propagateHiddenSpriteIndexes:v12];
    self->_BOOL isPropagatingAdjustedReferencedHiddenSpriteIndexes = isPropagatingAdjustedReferencedHiddenSpriteIndexes;
  }
  id v21 = [(PXGLayout *)self activeAnchor];
  [v21 adjustReferencedSpriteIndexesWithChangeDetails:v6 appliedToLayout:v7];
}

- (PXGAnchor)activeAnchor
{
  return self->_activeAnchor;
}

- (id)convertChangeDetails:(id)a3 fromSublayout:(id)a4
{
  id v7 = a3;
  uint64_t v8 = v7;
  if (a4 == self)
  {
    id v13 = v7;
  }
  else
  {
    id v9 = a4;
    if (([v8 hasIncrementalChanges] & 1) == 0)
    {
      uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, self, @"PXGLayout.m", 1694, @"Invalid parameter not satisfying: %@", @"changeDetails.hasIncrementalChanges" object file lineNumber description];
    }
    id v10 = [(PXGLayout *)self spriteDataStore];
    unsigned int v11 = [v10 count];

    id v12 = [(PXGLayout *)self sublayoutDataStore];
    LODWORD(v10) = [v12 spriteIndexOriginForSublayout:v9];

    id v13 = [v8 changeDetailsShiftedBy:v10 + (unint64_t)v11];
  }
  uint64_t v14 = v13;

  return v14;
}

- (PXGLayoutUpdateDelegate)updateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateDelegate);
  return (PXGLayoutUpdateDelegate *)WeakRetained;
}

- (void)_incrementNumberOfSprites:(int64_t)a3
{
  self->_numberOfSprites += a3;
}

- (NSMutableArray)changeDetails
{
  changeDetails = self->_changeDetails;
  if (!changeDetails)
  {
    id v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    BOOL v5 = self->_changeDetails;
    self->_changeDetails = v4;

    changeDetails = self->_changeDetails;
  }
  return changeDetails;
}

- (PXGLayoutSpriteModifier)spriteModifier
{
  return self->_spriteModifier;
}

- (void)didApplySpriteChangeDetails:(id)a3
{
  id v4 = a3;
  id v5 = [(PXGLayout *)self axGroup];
  [v5 updateLeafsWithChangeDetails:v4];
}

- (void)_ensureSpriteDataStore
{
  if (!self->_spriteDataStore)
  {
    uint64_t v3 = (PXGSpriteDataStore *)[off_1E5DA6B40 newSpriteDataStore];
    spriteDataStore = self->_spriteDataStore;
    self->_spriteDataStore = v3;
  }
}

- (NSIndexSet)axSelectedSpriteIndexes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28D60]);
  id v4 = [(PXGLayout *)self decoratingLayout];
  id v5 = [v4 selectionDecorationSource];

  if (v5)
  {
    id v6 = [v5 selectedSpriteIndexesInLayout:self];
    id v7 = [(PXGLayout *)self axSpriteIndexes];
    uint64_t v8 = objc_msgSend(v7, "px_intersectionWithIndexSet:", v6);

    id v3 = (id)v8;
  }

  return (NSIndexSet *)v3;
}

- (NSIndexSet)axBorderSpriteIndexes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v4 = [(PXGLayout *)self axSpriteIndexes];
  if ([v4 count])
  {
    objc_msgSend(v3, "addIndex:", objc_msgSend(v4, "firstIndex"));
    objc_msgSend(v3, "addIndex:", objc_msgSend(v4, "lastIndex"));
  }

  return (NSIndexSet *)v3;
}

- (void)assumeWillUpdateSublayoutInUpdatePass:(id)a3
{
}

- (NSIndexSet)axVisibleSpriteIndexes
{
  id v3 = [(PXGLayout *)self axSpriteIndexes];
  id v4 = [(PXGLayout *)self spriteDataStore];
  if ([v3 lastIndex] != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = [v3 lastIndex];
    if (v5 > [v4 count]) {
      PXAssertGetLog();
    }
  }
  [(PXGLayout *)self visibleRect];
  id v6 = objc_msgSend(v4, "spriteAtIndexes:inRect:", v3);

  return (NSIndexSet *)v6;
}

- (void)setFloatingOffset:(double)a3
{
  if (self->_floatingOffset != a3)
  {
    self->_floatingOffset = a3;
    [(PXGLayout *)self floatingOffsetDidChange];
  }
}

- (void)setFloating:(BOOL)a3
{
  if (self->_floating != a3)
  {
    self->_floating = a3;
    [(PXGLayout *)self floatingDidChange];
  }
}

void __43__PXGLayout_sublayoutAtIndex_loadIfNeeded___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, id *a4)
{
  id v6 = *a4;
  if (*a4)
  {
    id v7 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_storeStrong(v7, v6);
  }
  else if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = a4[1];
    uint64_t v11 = [v10 layout:v9 createSublayoutAtIndex:a2];
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    uint64_t v14 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v14)
    {
      id v15 = v14;
      if (*a4 != v15)
      {

        *a4 = v15;
      }

      PXSizeIsNull();
    }
  }
}

- (NSIndexSet)axSpriteIndexes
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28D60]);
  return (NSIndexSet *)v2;
}

BOOL __56__PXGLayout_enumerateVisibleAnchoringLayoutsUsingBlock___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  BOOL result = CGRectIntersectsRect(*(CGRect *)&a2, *(CGRect *)(a1 + 40));
  if (result) {
    PXRectShortestDistanceToPoint();
  }
  return result;
}

void __56__PXGLayout_enumerateVisibleAnchoringLayoutsUsingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "sublayoutAtIndex:loadIfNeeded:", objc_msgSend(a2, "integerValue"), 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    [v3 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"PXGLayout.m", 1789, @"Invalid parameter not satisfying: %@", @"sublayout != nil" object file lineNumber description];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (unsigned)spriteIndexForObjectReference:(id)a3
{
  uint64_t v4 = 0;
  return [(PXGLayout *)self spriteIndexForObjectReference:a3 options:0 updatedObjectReference:&v4];
}

- (unsigned)spriteIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  id v21 = 0;
  int64_t v8 = [(PXGLayout *)self sublayoutIndexForObjectReference:a3 options:a4 updatedObjectReference:&v21];
  id v9 = v21;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned int v10 = -1;
  }
  else
  {
    uint64_t v11 = [(PXGLayout *)self sublayoutAtIndex:v8 loadIfNeeded:0];
    uint64_t v12 = v11;
    if (v11)
    {
      id v20 = 0;
      uint64_t v13 = [v11 spriteIndexForObjectReference:v9 options:a4 updatedObjectReference:&v20];
      id v14 = v20;

      id v15 = v12;
      id v9 = v14;
      if (v13 != -1 && [v15 numberOfSprites] <= v13)
      {
        uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
        unsigned int v19 = objc_msgSend(NSString, "stringWithUTF8String:", "void PXValidateLayoutSpriteIndexForObjectReference(PXGLayout * _Nonnull __strong, PXGSpriteIndex, id  _Nonnull __strong)");
        [v18 handleFailureInFunction:v19, @"PXGLayout_Internal.h", 223, @"%@ returned invalid spriteIndex %li for objectReference %@", v15, v13, v9 file lineNumber description];
      }
      unsigned int v10 = [(PXGLayout *)self convertSpriteIndex:v13 fromDescendantLayout:v15];
    }
    else
    {
      unsigned int v10 = -1;
    }
  }
  id v16 = v9;
  *a5 = v16;

  return v10;
}

- (id)sublayoutAtIndex:(int64_t)a3 loadIfNeeded:(BOOL)a4
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__16685;
  id v16 = __Block_byref_object_dispose__16686;
  id v17 = 0;
  id v7 = [(PXGLayout *)self sublayoutDataStore];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__PXGLayout_sublayoutAtIndex_loadIfNeeded___block_invoke;
  _OWORD v10[3] = &unk_1E5DB0798;
  BOOL v11 = a4;
  v10[4] = self;
  v10[5] = &v12;
  objc_msgSend(v7, "enumerateSublayoutGeometriesInRange:options:usingBlock:", a3, 1, 0, v10);

  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (unsigned)convertSpriteIndex:(unsigned int)a3 fromDescendantLayout:(id)a4
{
  return [(PXGLayout *)self convertSpriteIndexRange:a3 | 0x100000000 fromDescendantLayout:a4];
}

- (_PXGSpriteIndexRange)convertSpriteIndexRange:(_PXGSpriteIndexRange)a3 fromDescendantLayout:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (a3.location == -1 || !v6)
  {
    a3.location = *(_DWORD *)off_1E5DAAF80;
    unint64_t v8 = *((unsigned int *)off_1E5DAAF80 + 1);
  }
  else
  {
    unint64_t v8 = HIDWORD(*(unint64_t *)&a3);
    id v9 = (PXGLayout *)v6;
    if (v9 != self)
    {
      while (1)
      {
        unsigned int v10 = [(PXGLayout *)v9 superlayout];
        if (!v10) {
          break;
        }
        BOOL v11 = v10;
        uint64_t v12 = [(PXGLayout *)v10 spriteDataStore];
        int v13 = [v12 count];
        uint64_t v14 = [(PXGLayout *)v11 sublayoutDataStore];
        a3.location += v13 + [v14 spriteIndexOriginForSublayout:v9];

        id v9 = v11;
        if (v11 == self)
        {
          id v9 = self;
          goto LABEL_9;
        }
      }
      a3.location = *(_DWORD *)off_1E5DAAF80;
      unint64_t v8 = *((unsigned int *)off_1E5DAAF80 + 1);
    }
LABEL_9:
  }
  return (_PXGSpriteIndexRange)(a3.location | (v8 << 32));
}

void __42__PXGLayout_sublayoutIndexForSpriteIndex___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v7 = [v4 sublayoutDataStore];
  uint64_t v6 = [v7 indexOfSublayout:v5];

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
}

- (id)createAnchorForVisibleAreaIgnoringEdges:(unint64_t)a3
{
  id v5 = [(PXGLayout *)self lastVisibleAreaAnchor];
  if (![v5 canBeReused] || a3 && objc_msgSend(v5, "type") == 3)
  {
    if (a3 == 15
      || (unint64_t v6 = +[PXGLayout scrolledEdgesForVisibleEdges:[(PXGLayout *)self fullyVisibleEdgesWithDefaultTolerance] & ~a3 scrollableAxis:[(PXGLayout *)self scrollableAxis]]) == 0)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __64__PXGLayout_PXGAnchor__createAnchorForVisibleAreaIgnoringEdges___block_invoke;
      v13[3] = &unk_1E5DBA3A0;
      v13[4] = self;
      id v7 = [(PXGLayout *)self _createAnchorWithPriority:0 constraints:v13];
    }
    else
    {
      id v7 = [(PXGLayout *)self _createAnchorForContentEdges:v6 priority:0];
    }
    unint64_t v8 = v7;
    id v9 = [v7 layout];
    unsigned int v10 = [v9 activeAnchor];

    if (v8 == v10)
    {
      BOOL v11 = [MEMORY[0x1E4F1C9C8] date];
      [v8 setDate:v11];

      [(PXGLayout *)self setLastVisibleAreaAnchor:v8];
    }
  }
  else
  {
    unint64_t v8 = [(PXGLayout *)self _createAnchorWithAnchor:v5 resetPriority:0];
  }

  return v8;
}

- (unint64_t)fullyVisibleEdgesWithEdgeTolerances:(UIEdgeInsets)a3
{
}

- (unint64_t)fullyVisibleEdgesWithDefaultTolerance
{
}

+ (unint64_t)scrolledEdgesForVisibleEdges:(unint64_t)a3 scrollableAxis:(int64_t)a4
{
  unint64_t v4 = a3 & ~(4 * a3) & 8;
  if ((a3 & 0xA) == 2) {
    unint64_t v4 = 2;
  }
  if ((a4 & 2) == 0) {
    unint64_t v4 = 0;
  }
  unint64_t v5 = v4 | ~(4 * (_BYTE)a3) & 4;
  if ((a3 & 4) == 0) {
    unint64_t v5 = v4;
  }
  if ((a3 & 5) == 1) {
    unint64_t v6 = v4 | 1;
  }
  else {
    unint64_t v6 = v5;
  }
  if (a4) {
    return v6;
  }
  else {
    return v4;
  }
}

- (void)setLastVisibleAreaAnchor:(id)a3
{
}

- (UIEdgeInsets)safeAreaInsets
{
  double top = self->_safeAreaInsets.top;
  double left = self->_safeAreaInsets.left;
  double bottom = self->_safeAreaInsets.bottom;
  double right = self->_safeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGSize)referenceSize
{
  double width = self->_referenceSize.width;
  double height = self->_referenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)changeVisibleRectToProposedVisibleRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  self->_isRequestingVisibleRect = 1;
  [(PXGLayout *)self visibleRect];
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  id v16 = [(PXGLayout *)self superlayout];
  if (v16)
  {
    objc_msgSend(v16, "sublayout:visibleRectForRequestedVisibleRect:", self, x, y, width, height, v15, v13, v11, v9);
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
  }
  else
  {
    long long v25 = [(PXGLayout *)self visibleRectDelegate];
    uint64_t v26 = v25;
    if (v25)
    {
      objc_msgSend(v25, "layout:visibleRectForRequestedVisibleRect:", self, x, y, width, height);
      double v18 = v27;
      double v20 = v28;
      double v22 = v29;
      double v24 = v30;
    }
    else
    {
      double v24 = height;
      double v22 = width;
      double v20 = y;
      double v18 = x;
    }
    [(PXGLayout *)self visibleRect];
    v33.origin.double x = v18;
    v33.origin.double y = v20;
    v33.size.double width = v22;
    v33.size.double height = v24;
    if (!CGRectEqualToRect(v32, v33))
    {
      [(PXGLayout *)self visibleRect];
      kdebug_trace();
    }
  }
  -[PXGLayout setVisibleRect:](self, "setVisibleRect:", v18, v20, v22, v24);
  PXRectApproximatelyEqualToRect();
}

- (CGRect)visibleRect
{
  double x = self->_visibleRect.origin.x;
  double y = self->_visibleRect.origin.y;
  double width = self->_visibleRect.size.width;
  double height = self->_visibleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setVisibleRect:(CGRect)a3
{
  if (!CGRectEqualToRect(a3, self->_visibleRect)) {
    PXRectApproximatelyEqualToRect();
  }
}

- (int64_t)scrollSpeedRegime
{
  return self->_scrollSpeedRegime;
}

- (void)setContentSize:(CGSize)a3
{
  self->_estimatedContentSize = a3;
  if (a3.width != self->_contentSize.width || a3.height != self->_contentSize.height)
  {
    self->_contentSize = a3;
    [(PXGLayout *)self contentSizeDidChange];
    id v5 = [(PXGLayout *)self superlayout];
    [v5 sublayoutDidChangeContentSize:self];
  }
}

- (double)referenceDepth
{
  return self->_referenceDepth;
}

- (void)setLastBaseline:(double)a3
{
}

- (CGPoint)lastScrollDirection
{
  double x = self->_lastScrollDirection.x;
  double y = self->_lastScrollDirection.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)lastBaseline
{
  return self->_lastBaseline;
}

- (unsigned)referenceOptions
{
  return self->_referenceOptions;
}

- (int64_t)scrollableAxis
{
  return 1;
}

- (void)enumerateDescendantsLayoutsUsingBlock:(id)a3
{
  unint64_t v4 = (void (**)(id, PXGLayout *, unsigned char *))a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  v15[0] = 0;
  v4[2](v4, self, v15);
  if (!*((unsigned char *)v13 + 24))
  {
    id v5 = [(PXGLayout *)self sublayoutDataStore];
    uint64_t v6 = 0;
    do
    {
      if (v6 >= [v5 count]) {
        break;
      }
      id v7 = [v5 sublayoutAtIndex:v6];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __51__PXGLayout_enumerateDescendantsLayoutsUsingBlock___block_invoke;
      v9[3] = &unk_1E5DB0A68;
      uint64_t v10 = v4;
      uint64_t v11 = &v12;
      [v7 enumerateDescendantsLayoutsUsingBlock:v9];
      int v8 = *((unsigned __int8 *)v13 + 24);

      ++v6;
    }
    while (!v8);
  }
  _Block_object_dispose(&v12, 8);
}

uint64_t __51__PXGLayout_enumerateDescendantsLayoutsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a3 = 1;
  }
  return result;
}

- (int64_t)intrinsicScrollRegime
{
  return self->_intrinsicScrollRegime;
}

- (void)setInternalCurrentDataSourceChange:(id)a3
{
}

uint64_t __22__PXGLayout_didRender__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setInternalCurrentDataSourceChange:0];
}

- (BOOL)isAnimating
{
  return 0;
}

- (unint64_t)contentChangeTrend
{
  return 0;
}

- (PXGLayoutSnapshotDataSource)layoutSnapshotDataSource
{
  return 0;
}

- (NSArray)interactions
{
  return self->_interactions;
}

- (void)contentSizeDidChange
{
  id v2 = [(PXGLayout *)self axGroup];
  [v2 invalidateVisibility];
}

- (void)visibleRectDidChange
{
  if (!self->_isRequestingVisibleRect)
  {
    id v3 = [(PXGLayout *)self axGroup];
    [v3 invalidateVisibility];
    [v3 invalidateLeafs];
    [(PXGLayout *)self _setNeedsUpdateExternally:0];
  }
}

- (PXGLayoutVisibleRectDelegate)visibleRectDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_visibleRectDelegate);
  return (PXGLayoutVisibleRectDelegate *)WeakRetained;
}

- (BOOL)isDescendantOfLayout:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = v5;
  for (BOOL i = v5 != 0; v6 != v4 && v6; BOOL i = v6 != 0)
  {
    int v8 = v6;
    id v6 = [v6 superlayout];
  }
  return i;
}

uint64_t __62__PXGLayout_enumerateVisibleAnchoringSpriteIndexesUsingBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) convertSpriteIndex:a2 fromDescendantLayout:*(void *)(a1 + 40)];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v3();
}

- (id)objectReferenceForSpriteIndex:(unsigned int)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__16685;
  uint64_t v10 = __Block_byref_object_dispose__16686;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__PXGLayout_objectReferenceForSpriteIndex___block_invoke;
  v5[3] = &unk_1E5DB0978;
  v5[4] = self;
  v5[5] = &v6;
  [(PXGLayout *)self enumerateLayoutsForSpritesInRange:a3 | 0x100000000 options:0 usingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)update
{
  ++self->_updateCount;
  [(PXGLayout *)self _updateVersion];
  [(PXGLayout *)self _updateAnchoring];
  self->_updateFlags.willPerformUpdate = 0;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXGLayout update]"];
      [v5 handleFailureInFunction:v6, @"PXGLayout.m", 629, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    }
    self->_updateFlags.isPerformingUpdate = 1;
    self->_updateFlags.updated = 1;
    if (needsUpdate)
    {
      self->_updateFlags.unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXGLayout *)self updateStylingForSpritesAtIndexes:self->_spriteIndexesWithInvalidatedStyle];
      spriteIndexesWithInvalidatedStyle = self->_spriteIndexesWithInvalidatedStyle;
      self->_spriteIndexesWithInvalidatedStyle = 0;

      unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    }
    self->_updateFlags.isPerformingUpdate = 0;
    if (needsUpdate)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PXGLayout update]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PXGLayout.m", 635, @"still needing to update %lu after update pass", self->_updateFlags.needsUpdate);
    }
  }
  id v9 = [(PXGLayout *)self axGroup];
  [v9 updateIfNeeded];
}

- (void)_updateVersion
{
  int64_t version = self->_version;
  if (version < 0)
  {
    self->_int64_t version = -version;
    id v4 = [off_1E5DA5568 changeDetailsWithNoChanges];
    [(PXGLayout *)self adjustReferencedSpriteIndexesWithChangeDetails:v4 appliedToLayout:self];

    [(PXGLayout *)self updateIfNeeded];
  }
}

- (void)_updateAnchoring
{
  BOOL isUpdatingAnchoring = self->_isUpdatingAnchoring;
  self->_BOOL isUpdatingAnchoring = 1;
  id v4 = [(PXGLayout *)self activeAnchor];
  if ([v4 needsUpdate])
  {
    [v4 setNeedsUpdate:0];
    [(PXGLayout *)self visibleRect];
    objc_msgSend(v4, "adjustVisibleRect:");
    BOOL v5 = -[PXGLayout changeVisibleRectToProposedVisibleRect:](self, "changeVisibleRectToProposedVisibleRect:");
    if (v5
      && ![(PXGLayout *)self disableDebugAssertionForAnchorUpdatesWithZeroContentSize])
    {
      [(PXGLayout *)self contentSize];
      if (v7 == *MEMORY[0x1E4F1DB30] && v6 == *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
        PXAssertGetLog();
      }
    }
    if (self->_nestedAnchorVisibleRectChanges >= 11) {
      PXGTungstenGetLog();
    }
  }
  else
  {
    BOOL v5 = 0;
  }
  if ([v4 isAutoInvalidated]) {
    [v4 invalidate];
  }
  if (self->_isLastVisibleAreaAnchoringInformationInvalidated)
  {
    [(PXGLayout *)self clearLastVisibleAreaAnchoringInformation];
    self->_isLastVisibleAreaAnchoringInformationInvalidated = 0;
  }
  if (v5)
  {
    ++self->_nestedAnchorVisibleRectChanges;
    self->_unint64_t needsUpdate = 1;
    [(PXGLayout *)self updateIfNeeded];
    --self->_nestedAnchorVisibleRectChanges;
  }
  self->_BOOL isUpdatingAnchoring = isUpdatingAnchoring;
}

- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(PXGLayout *)self axNextResponder];
  [v10 axGroup:v9 didChange:a4 userInfo:v8];
}

- (PXGAXResponder)axNextResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_axNextResponder);
  return (PXGAXResponder *)WeakRetained;
}

- (CGRect)frame
{
  id v3 = [(PXGLayout *)self superlayout];

  if (v3)
  {
    long long v18 = 0u;
    id v4 = [(PXGLayout *)self superlayout];
    BOOL v5 = [v4 sublayoutDataStore];
    double v6 = v5;
    if (v5)
    {
      [v5 geometryForSublayout:self];
    }
    else
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
    }

    double v8 = *((double *)&v18 + 1);
    double v7 = *(double *)&v18;
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  }
  [(PXGLayout *)self contentSize];
  double v10 = v9;
  double v12 = v11;
  double v13 = v7;
  double v14 = v8;
  result.size.double height = v12;
  result.size.double width = v10;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGPoint)_offsetToDescendantLayout:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = *MEMORY[0x1E4F1DAD8];
  double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v7 = (PXGLayout *)v4;
  if (v7 != self)
  {
    double v8 = [(PXGLayout *)v7 superlayout];
    if (v8)
    {
      objc_msgSend(v8, "sublayoutDataStore", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      double v9 = v13);
      double v10 = v9;
      if (v9) {
        [v9 geometryForSublayout:v7];
      }

      PXPointIsNull();
    }
    PXAssertGetLog();
  }

  double v11 = v5;
  double v12 = v6;
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (void)removeAnchor:(id)a3
{
  id v4 = (PXGAnchor *)a3;
  if (self->_activeAnchor == v4)
  {
    self->_activeAnchor = 0;
    double v5 = v4;

    [(PXGLayout *)self sublayout:self didRemoveAnchor:v5];
    id v4 = v5;
  }
}

- (void)sublayout:(id)a3 didRemoveAnchor:(id)a4
{
  --self->_numberOfDescendantAnchors;
  id v5 = a4;
  id v6 = [(PXGLayout *)self superlayout];
  [v6 sublayout:self didRemoveAnchor:v5];
}

- (id)createAnchorForVisibleArea
{
  return [(PXGLayout *)self createAnchorForVisibleAreaIgnoringEdges:0];
}

- (BOOL)disableDebugAssertionForAnchorUpdatesWithZeroContentSize
{
  return self->_disableDebugAssertionForAnchorUpdatesWithZeroContentSize;
}

- (id)_createAnchorWithAnchor:(id)a3 resetPriority:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (void *)[a3 copyWithLayout:self];
  double v7 = [off_1E5DA5568 changeDetailsWithNoIncrementalChanges];
  [v6 adjustReferencedSpriteIndexesWithChangeDetails:v7 appliedToLayout:self];

  if (v4) {
    [v6 setPriority:1];
  }
  [(PXGLayout *)self addAnchor:v6];
  return v6;
}

- (void)addAnchor:(id)a3
{
  id v6 = a3;
  uint64_t v5 = [v6 priority];
  if (v5 >= [(PXGAnchor *)self->_activeAnchor priority])
  {
    [(PXGAnchor *)self->_activeAnchor invalidate];
    objc_storeStrong((id *)&self->_activeAnchor, a3);
    [(PXGLayout *)self _setNeedsUpdateExternally:0];
    [(PXGLayout *)self sublayout:self didAddAnchor:v6];
  }
}

- (void)sublayout:(id)a3 didAddAnchor:(id)a4
{
  ++self->_numberOfDescendantAnchors;
  id v5 = a4;
  id v6 = [(PXGLayout *)self superlayout];
  [v6 sublayout:self didAddAnchor:v5];

  unint64_t v7 = [v5 type];
  if (v7 <= 5 && ((1 << v7) & 0x34) != 0)
  {
    [(PXGLayout *)self clearLastVisibleAreaAnchoringInformation];
  }
}

- (void)updateIfNeeded
{
  if (self->_needsUpdate)
  {
    self->_unint64_t needsUpdate = 0;
    BOOL isUpdating = self->_isUpdating;
    self->_BOOL isUpdating = 1;
    if (!isUpdating) {
      self->_childrenTotalUpdateDuration = 0;
    }
    uint64_t v4 = mach_continuous_time();
    [(PXGLayout *)self willUpdate];
    [(PXGLayout *)self update];
    [(PXGLayout *)self didUpdate];
    if (!isUpdating)
    {
      if (updateIfNeeded_onceToken != -1) {
        dispatch_once(&updateIfNeeded_onceToken, &__block_literal_global_68);
      }
      uint64_t v5 = mach_continuous_time() - v4;
      unint64_t v6 = v5 - self->_childrenTotalUpdateDuration;
      unint64_t v7 = [(PXGLayout *)self superlayout];
      [v7 _childDidUpdateWithDuration:v5];

      if (v6 > updateIfNeeded_slowUpdateThreshold) {
        PXGTungstenGetLog();
      }
    }
    self->_BOOL isUpdating = isUpdating;
  }
}

- (void)setViewEnvironment:(id)a3
{
  uint64_t v5 = (PXGViewEnvironment *)a3;
  unint64_t v6 = self->_viewEnvironment;
  if (v6 == v5)
  {
  }
  else
  {
    unint64_t v7 = v6;
    BOOL v8 = [(PXGViewEnvironment *)v6 isEqual:v5];

    if (!v8)
    {
      [(PXGLayout *)self viewEnvironmentWillChange:v5];
      objc_storeStrong((id *)&self->_viewEnvironment, a3);
      [(PXGLayout *)self viewEnvironmentDidChange];
      double v9 = [(PXGLayout *)self sublayoutDataStore];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __32__PXGLayout_setViewEnvironment___block_invoke;
      _OWORD v10[3] = &unk_1E5DB0670;
      double v11 = v5;
      [v9 enumerateSublayoutsUsingBlock:v10];
    }
  }
}

- (void)setSafeAreaInsets:(UIEdgeInsets)a3
{
}

- (void)setReferenceSize:(CGSize)a3
{
  if (a3.width != self->_referenceSize.width || a3.height != self->_referenceSize.height)
  {
    self->_referenceSize = a3;
    [(PXGLayout *)self referenceSizeDidChange];
  }
}

- (void)setDisplayScale:(double)a3
{
  if (self->_displayScale != a3)
  {
    self->_displayScale = a3;
    [(PXGLayout *)self displayScaleDidChange];
  }
}

- (void)setScrollSpeedRegime:(int64_t)a3
{
  if (self->_scrollSpeedRegime != a3)
  {
    self->_scrollSpeedRegime = a3;
    [(PXGLayout *)self scrollSpeedRegimeDidChange];
  }
}

- (void)setLastScrollDirection:(CGPoint)a3
{
  if (a3.x != self->_lastScrollDirection.x || a3.y != self->_lastScrollDirection.y)
  {
    self->_lastScrollDirection = a3;
    [(PXGLayout *)self lastScrollDirectionDidChange];
  }
}

- (void)setUserInterfaceDirection:(unint64_t)a3
{
  if (self->_userInterfaceDirection != a3)
  {
    self->_userInterfaceDirection = a3;
    [(PXGLayout *)self userInterfaceDirectionDidChange];
  }
}

- (void)setReferenceDepth:(double)a3
{
  if (self->_referenceDepth != a3)
  {
    self->_referenceDepth = a3;
    [(PXGLayout *)self referenceDepthDidChange];
  }
}

- (void)_childDidUpdateWithDuration:(unint64_t)a3
{
  self->_childrenTotalUpdateDuration += a3;
}

- (void)didUpdateSublayout:(id)a3
{
}

- (void)setReferenceOptions:(unsigned __int16)a3
{
  if (self->_referenceOptions != a3)
  {
    self->_referenceOptions = a3;
    [(PXGLayout *)self referenceOptionsDidChange];
  }
}

- (void)willUpdate
{
  self->_updateFlags.willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v2 = [NSString stringWithUTF8String:"-[PXGLayout willUpdate]"];
    [v3 handleFailureInFunction:v2, @"PXGLayout.m", 619, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];
  }
}

- (void)didAddSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5
{
  uint64_t v13 = (id *)a3;
  [v13[4] removeAllObjects];
  if ([v13 needsUpdate]) {
    [(PXGLayout *)self sublayoutNeedsUpdate:v13];
  }
  self->_numberOfDescendantAnchors += [v13 numberOfDescendantAnchors];
  BOOL v8 = [(PXGLayout *)self rootLayout];
  double v9 = [v13 animations];
  [v8 _addAnimations:v9];

  [v13 removeAllAnimations];
  double v10 = [(PXGLayout *)self rootLayout];
  double v11 = [v13 fences];
  [v10 _addFences:v11];

  [v13 removeAllFences];
  double v12 = [(PXGLayout *)self viewEnvironment];
  [v13 setViewEnvironment:v12];

  [(PXGLayout *)self axAddSubgroupForSublayout:v13 atIndex:a4 flags:a5];
}

- (void)didUpdate
{
  if (self->_updateFlags.willPerformUpdate)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[PXGLayout didUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXGLayout.m", 641, @"Invalid parameter not satisfying: %@", @"!_updateFlags.willPerformUpdate" file lineNumber description];
  }
  if ([(NSMutableSet *)self->_sublayoutsExpectedToBeUpdatedInUpdatePass count])
  {
    if (didUpdate_onceToken != -1) {
      dispatch_once(&didUpdate_onceToken, &__block_literal_global_83);
    }
    if (([(id)didUpdate_reportedClasses containsObject:objc_opt_class()] & 1) == 0) {
      PXGTungstenGetLog();
    }
  }
  [(NSMutableSet *)self->_sublayoutsExpectedToBeUpdatedInUpdatePass removeAllObjects];
  self->_numberOfRepeatedSublayoutUpdatesInUpdatePass = 0;
}

- (int64_t)numberOfDescendantAnchors
{
  return self->_numberOfDescendantAnchors;
}

- (BOOL)hasSublayoutsRemainingToBeUpdated
{
  return [(NSMutableSet *)self->_sublayoutsExpectedToBeUpdatedInUpdatePass count] != 0;
}

- (NSArray)animations
{
  id v2 = (void *)[(NSMutableArray *)self->_animations copy];
  return (NSArray *)v2;
}

- (void)removeAllFences
{
}

- (NSArray)fences
{
  id v2 = (void *)[(NSMutableArray *)self->_fences copy];
  return (NSArray *)v2;
}

- (void)axAddSubgroupForSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5
{
  char v5 = a5;
  id v11 = a3;
  BOOL v8 = [(PXGLayout *)self axGroup];
  if (v8)
  {
    if ((v5 & 1) == 0)
    {
      double v9 = objc_msgSend(off_1E5DA5568, "changeDetailsWithInsertedIndexRange:", a4, 1);
      [v8 updateSubgroupsWithChangeDetails:v9];
    }
    double v10 = [v11 axGroup];
    [v8 loadSubgroup:v10 atIndex:a4];
  }
}

- (void)removeAllAnimations
{
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)_addFences:(id)a3
{
  id v7 = a3;
  if ([v7 count])
  {
    fences = self->_fences;
    if (!fences)
    {
      char v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v6 = self->_fences;
      self->_fences = v5;

      fences = self->_fences;
    }
    [(NSMutableArray *)fences addObjectsFromArray:v7];
    [(PXGLayout *)self _setNeedsUpdateExternally:0];
  }
}

- (void)_addAnimations:(id)a3
{
  id v7 = a3;
  if ([v7 count])
  {
    animations = self->_animations;
    if (!animations)
    {
      char v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v6 = self->_animations;
      self->_animations = v5;

      animations = self->_animations;
    }
    [(NSMutableArray *)animations addObjectsFromArray:v7];
    [(PXGLayout *)self _setNeedsUpdateExternally:0];
  }
}

- (void)viewEnvironmentDidChange
{
  id v3 = [(PXGLayout *)self viewEnvironment];
  int v4 = [v3 accessibilityEnabled];

  if (v4)
  {
    id v5 = [(PXGLayout *)self axGroup];
    objc_msgSend(v5, "setLeafFeatures:", objc_msgSend(v5, "leafFeatures") | 4);
  }
}

- (id)axSpriteIndexesInRectDefaultImplementation:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  double v9 = [(PXGLayout *)self axSpriteIndexes];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__PXGLayout_AX__axSpriteIndexesInRectDefaultImplementation___block_invoke;
  v14[3] = &unk_1E5DCB288;
  v14[4] = self;
  CGFloat v16 = x;
  CGFloat v17 = y;
  CGFloat v18 = width;
  CGFloat v19 = height;
  id v10 = v8;
  id v15 = v10;
  [v9 enumerateIndexesUsingBlock:v14];

  id v11 = v15;
  id v12 = v10;

  return v12;
}

- (int64_t)version
{
  return self->_version;
}

- (__n128)cameraConfiguration
{
  long long v2 = *(_OWORD *)(a1 + 816);
  *(_OWORD *)(a2 + 160) = *(_OWORD *)(a1 + 800);
  *(_OWORD *)(a2 + 176) = v2;
  *(_OWORD *)(a2 + 192) = *(_OWORD *)(a1 + 832);
  long long v3 = *(_OWORD *)(a1 + 752);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 736);
  *(_OWORD *)(a2 + 112) = v3;
  long long v4 = *(_OWORD *)(a1 + 784);
  *(_OWORD *)(a2 + 128) = *(_OWORD *)(a1 + 768);
  *(_OWORD *)(a2 + 144) = v4;
  long long v5 = *(_OWORD *)(a1 + 688);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 672);
  *(_OWORD *)(a2 + 48) = v5;
  long long v6 = *(_OWORD *)(a1 + 720);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 704);
  *(_OWORD *)(a2 + 80) = v6;
  __n128 result = *(__n128 *)(a1 + 656);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 640);
  *(__n128 *)(a2 + 16) = result;
  return result;
}

- (void)setAppearState:(unint64_t)a3
{
  if (self->_appearState != a3)
  {
    self->_appearState = a3;
    [(PXGLayout *)self appearStateDidChange];
  }
  long long v5 = [(PXGLayout *)self sublayoutDataStore];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __28__PXGLayout_setAppearState___block_invoke;
  v6[3] = &__block_descriptor_40_e26_v32__0q8__PXGLayout_16_B24l;
  v6[4] = a3;
  [v5 enumerateSublayoutsUsingBlock:v6];
}

- (void)didRender
{
}

- (void)copyLayoutForSpritesInRange:(_PXGSpriteIndexRange)a3 toSpriteDataStore:(id)a4
{
  uint64_t length = a3.length;
  id v7 = a4;
  [v7 setCount:length];
  id v8 = v7;
  uint64_t v9 = [v8 entities];
  id v10 = v8;
  uint64_t v11 = [v10 geometries];
  id v12 = v10;
  uint64_t v13 = [v12 styles];
  id v14 = v12;
  uint64_t v15 = [v14 infos];

  [(PXGLayout *)self copyLayoutForSpritesInRange:a3 entities:v9 geometries:v11 styles:v13 infos:v15];
}

- (void)copyLayoutForSpritesInRange:(_PXGSpriteIndexRange)a3 entities:(id *)a4 geometries:(id *)a5 styles:(id *)a6 infos:(id *)a7
{
}

- (void)copyLayoutForSpritesInRange:(_PXGSpriteIndexRange)a3 applySpriteTransforms:(BOOL)a4 entities:(id *)a5 geometries:(id *)a6 styles:(id *)a7 infos:(id *)a8
{
  long long v8 = *((_OWORD *)off_1E5DAAF78 + 1);
  v9[0] = *(_OWORD *)off_1E5DAAF78;
  v9[1] = v8;
  long long v10 = *((_OWORD *)off_1E5DAAF78 + 2);
  uint64_t v11 = *((void *)off_1E5DAAF78 + 6);
  -[PXGLayout copyLayoutForSpritesInRange:applySpriteTransforms:parentTransform:parentAlpha:parentClippingRect:parentSublayoutOrigin:entities:geometries:styles:infos:](self, "copyLayoutForSpritesInRange:applySpriteTransforms:parentTransform:parentAlpha:parentClippingRect:parentSublayoutOrigin:entities:geometries:styles:infos:", a3, a4, v9, a5, a6, a7, COERCE_DOUBLE(__PAIR64__(DWORD1(v10), 1.0)), *MEMORY[0x1E4F1DB10], *(double *)(MEMORY[0x1E4F1DB10] + 8), *(double *)(MEMORY[0x1E4F1DB10] + 16), *(double *)(MEMORY[0x1E4F1DB10] + 24), *(double *)off_1E5DAAF68, *((double *)off_1E5DAAF68 + 1), *((double *)off_1E5DAAF68 + 2), a8);
}

- (void)setDisplayMaximumHeadroom:(double)a3
{
  self->_displayMaximumHeadroom = a3;
}

- (void)setViewDelegate:(id)a3
{
}

- (void)setScrollDelegate:(id)a3
{
}

- (void)setFocusDelegate:(id)a3
{
}

- (void)setAlpha:(double)a3
{
  if (self->_alpha != a3)
  {
    self->_alpha = a3;
    [(PXGLayout *)self alphaDidChange];
    if ([(PXGLayout *)self appliesAlphaToSublayouts])
    {
      [(PXGLayout *)self _setNeedsUpdateExternally:0];
    }
  }
}

- (int64_t)numberOfSublayouts
{
  long long v2 = [(PXGLayout *)self sublayoutDataStore];
  int64_t v3 = [v2 count];

  return v3;
}

- (void)copyLayoutForSpritesInRange:(_PXGSpriteIndexRange)a3 applySpriteTransforms:(BOOL)a4 parentTransform:(id *)a5 parentAlpha:(float)a6 parentClippingRect:(CGRect)a7 parentSublayoutOrigin:(id)a8 entities:(id *)a9 geometries:(id *)a10 styles:(id *)a11 infos:(id *)a12
{
  BOOL v15 = a4;
  double var2 = a8.var2;
  double var1 = a8.var1;
  double var0 = a8.var0;
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  uint64_t v26 = [(PXGLayout *)self sublayoutDataStore];
  double v27 = [(PXGLayout *)self spriteDataStore];
  long long v43 = a9;
  long long v42 = (void *)v26;
  if (v15)
  {
    double v28 = [(PXGLayout *)self modifiedSpriteDataStore];

    if (v28)
    {
      uint64_t v29 = [(PXGLayout *)self modifiedSpriteDataStore];

      double v27 = (void *)v29;
    }
  }
  double v30 = [(PXGLayout *)self spriteDataStore];
  int v31 = [v30 count];
  int v32 = [v27 count];

  if (v31 != v32)
  {
    long long v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2, self, @"PXGLayout.m", 2282, @"Invalid parameter not satisfying: %@", @"self.spriteDataStore.count == spriteDataStore.count", v26 object file lineNumber description];
  }
  if ([(PXGLayout *)self appliesAlphaToSublayouts])
  {
    [(PXGLayout *)self alpha];
    a6 = v33 * a6;
  }
  [(PXGLayout *)self clippingRect];
  if (!CGRectIsInfinite(v75))
  {
    [(PXGLayout *)self clippingRect];
    v78.origin.CGFloat x = v34;
    v78.origin.CGFloat y = v35;
    v78.size.CGFloat width = v36;
    v78.size.CGFloat height = v37;
    v76.origin.CGFloat x = x;
    v76.origin.CGFloat y = y;
    v76.size.CGFloat width = width;
    v76.size.CGFloat height = height;
    CGRect v77 = CGRectIntersection(v76, v78);
    CGFloat x = v77.origin.x;
    CGFloat y = v77.origin.y;
    CGFloat width = v77.size.width;
    CGFloat height = v77.size.height;
  }
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x2020000000;
  int v74 = 0;
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __165__PXGLayout_copyLayoutForSpritesInRange_applySpriteTransforms_parentTransform_parentAlpha_parentClippingRect_parentSublayoutOrigin_entities_geometries_styles_infos___block_invoke;
  v51[3] = &unk_1E5DB0928;
  v51[4] = self;
  id v38 = v27;
  id v52 = v38;
  _PXGSpriteIndexRange v67 = a3;
  double v54 = v73;
  double v55 = v43;
  id v56 = a10;
  id v57 = a11;
  uint64_t v58 = a12;
  CGFloat v59 = x;
  CGFloat v60 = y;
  CGFloat v61 = width;
  CGFloat v62 = height;
  long long v39 = *(_OWORD *)&a5->var0.c;
  long long v63 = *(_OWORD *)&a5->var0.a;
  long long v64 = v39;
  long long v65 = *(_OWORD *)&a5->var0.tx;
  double v66 = a5->var1;
  float v68 = a6;
  double v69 = var0;
  double v70 = var1;
  double v71 = var2;
  id v40 = v42;
  id v53 = v40;
  BOOL v72 = v15;
  [(PXGLayout *)self enumerateLayoutsForSpritesInRange:a3 options:0 usingBlock:v51];
  unsigned int length = a3.length;
  id v47 = v43;
  uint64_t v48 = a10;
  double v49 = a11;
  uint64_t v50 = a12;
  [(PXGLayout *)self adjustCopiedSprites:&length];

  _Block_object_dispose(v73, 8);
}

- (double)alpha
{
  return self->_alpha;
}

- (BOOL)appliesAlphaToSublayouts
{
  return 1;
}

- (CGRect)clippingRect
{
  double x = self->_clippingRect.origin.x;
  double y = self->_clippingRect.origin.y;
  double width = self->_clippingRect.size.width;
  double height = self->_clippingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)_createAnchorForContentEdges:(unint64_t)a3 priority:(int64_t)a4
{
  if ((a3 & 8) != 0 && (a3 & 0xA) != 8) {
    PXAssertGetLog();
  }
  id v7 = [[PXGAnchor alloc] initWithLayout:self];
  [(PXGAnchor *)v7 setType:3];
  [(PXGAnchor *)v7 setEdges:a3];
  [(PXGLayout *)self estimatedContentSize];
  -[PXGAnchor setContentSize:](v7, "setContentSize:");
  [(PXGLayout *)self visibleRect];
  -[PXGAnchor setVisibleRect:](v7, "setVisibleRect:");
  [(PXGAnchor *)v7 setPriority:a4];
  [(PXGLayout *)self addAnchor:v7];
  return v7;
}

- (CGSize)estimatedContentSize
{
  double width = self->_estimatedContentSize.width;
  double height = self->_estimatedContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)removeFromSuperlayout
{
  int64_t v3 = [(PXGLayout *)self superlayout];
  if (v3)
  {
    id v6 = v3;
    long long v4 = [v3 sublayoutDataStore];
    uint64_t v5 = [v4 indexOfSublayout:self];

    int64_t v3 = v6;
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v6, "removeSublayoutsInRange:", v5, 1);
      int64_t v3 = v6;
    }
  }
}

- (id)createAnchorForScrollingToContentEdges:(unint64_t)a3 padding:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  if ((a3 & 8) != 0 && (a3 & 0xA) != 8) {
    PXAssertGetLog();
  }
  long long v10 = [[PXGAnchor alloc] initWithLayout:self];
  [(PXGAnchor *)v10 setType:4];
  [(PXGAnchor *)v10 setEdges:a3];
  -[PXGAnchor setPadding:](v10, "setPadding:", top, left, bottom, right);
  [(PXGLayout *)self addAnchor:v10];
  return v10;
}

- (id)_createAnchorWithPriority:(int64_t)a3 constraints:(id)a4
{
  id v6 = (void (**)(id, PXGAnchorConstraintsBuilder *))a4;
  id v7 = objc_alloc_init(PXGAnchorConstraintsBuilder);
  v6[2](v6, v7);

  uint64_t v8 = [(PXGAnchorConstraintsBuilder *)v7 constraints];
  uint64_t v9 = [[PXGAnchor alloc] initWithLayout:self];
  [(PXGAnchor *)v9 setType:1];
  [(PXGAnchor *)v9 setPriority:a3];
  [(PXGAnchor *)v9 setConstraints:v8];
  PXMap();
}

void __64__PXGLayout_PXGAnchor__createAnchorForVisibleAreaIgnoringEdges___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__PXGLayout_PXGAnchor__createAnchorForVisibleAreaIgnoringEdges___block_invoke_2;
  v6[3] = &unk_1E5DBA378;
  v6[4] = v4;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateVisibleAnchoringSpriteIndexesUsingBlock:v6];
}

- (void)enumerateVisibleAnchoringSpriteIndexesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__PXGLayout_enumerateVisibleAnchoringSpriteIndexesUsingBlock___block_invoke;
  v6[3] = &unk_1E5DB6998;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXGLayout *)self enumerateVisibleAnchoringLayoutsUsingBlock:v6];
}

- (void)enumerateVisibleAnchoringLayoutsUsingBlock:(id)a3
{
  id v4 = (void (**)(id, PXGLayout *, unsigned char *))a3;
  if ([(PXGLayout *)self numberOfSublayouts])
  {
    [(PXGLayout *)self visibleRect];
    PXRectGetCenter();
  }
  char v5 = 0;
  v4[2](v4, self, &v5);
}

void __62__PXGLayout_enumerateVisibleAnchoringSpriteIndexesUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  id v5 = *(id *)(a1 + 32);
  if (v5 == v3)
  {
    [v3 visibleRect];
    PXRectGetCenter();
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__PXGLayout_enumerateVisibleAnchoringSpriteIndexesUsingBlock___block_invoke_3;
  v6[3] = &unk_1E5DB0860;
  v6[4] = v5;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  [v7 enumerateVisibleAnchoringSpriteIndexesUsingBlock:v6];
}

- (void)enumerateSpritesInRect:(CGRect)a3 usingBlock:(id)a4
{
  long long v4 = *((_OWORD *)off_1E5DAAF78 + 1);
  v5[0] = *(_OWORD *)off_1E5DAAF78;
  v5[1] = v4;
  v5[2] = *((_OWORD *)off_1E5DAAF78 + 2);
  uint64_t v6 = *((void *)off_1E5DAAF78 + 6);
  -[PXGLayout _enumerateSpritesInRect:transform:usingBlock:](self, "_enumerateSpritesInRect:transform:usingBlock:", v5, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_enumerateSpritesInRect:(CGRect)a3 transform:(id *)a4 usingBlock:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a5;
  CGFloat v12 = *MEMORY[0x1E4F1DAD8];
  CGFloat v13 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(PXGLayout *)self contentSize];
  v47.size.double width = v14;
  v47.size.double height = v15;
  v46.origin.double x = x;
  v46.origin.double y = y;
  v46.size.double width = width;
  v46.size.double height = height;
  v47.origin.double x = v12;
  v47.origin.double y = v13;
  if (CGRectIntersectsRect(v46, v47))
  {
    uint64_t v42 = 0;
    long long v43 = &v42;
    uint64_t v44 = 0x2020000000;
    char v45 = 0;
    CGFloat v16 = [(PXGLayout *)self spriteDataStore];
    unsigned int v17 = [v16 count];
    if (v17)
    {
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __58__PXGLayout__enumerateSpritesInRect_transform_usingBlock___block_invoke;
      v35[3] = &unk_1E5DB09C8;
      id v18 = v11;
      long long v19 = *(_OWORD *)&a4->var0.c;
      long long v38 = *(_OWORD *)&a4->var0.a;
      long long v39 = v19;
      long long v40 = *(_OWORD *)&a4->var0.tx;
      double var1 = a4->var1;
      v35[4] = self;
      id v36 = v18;
      double v41 = var1;
      CGFloat v37 = &v42;
      objc_msgSend(v16, "enumerateSpritesInRect:usingBlock:", v35, x, y, width, height);
    }
    if (!*((unsigned char *)v43 + 24))
    {
      v34[0] = 0;
      v34[1] = v34;
      _OWORD v34[2] = 0x2810000000;
      v34[3] = &unk_1AB5D584F;
      v34[4] = v17;
      double v21 = [(PXGLayout *)self sublayoutDataStore];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __58__PXGLayout__enumerateSpritesInRect_transform_usingBlock___block_invoke_2;
      v23[3] = &unk_1E5DB0A18;
      long long v25 = v34;
      double v26 = x;
      double v27 = y;
      double v28 = width;
      double v29 = height;
      long long v22 = *(_OWORD *)&a4->var0.c;
      long long v30 = *(_OWORD *)&a4->var0.a;
      long long v31 = v22;
      long long v32 = *(_OWORD *)&a4->var0.tx;
      double v33 = a4->var1;
      id v24 = v11;
      [v21 enumerateSublayoutGeometriesUsingBlock:v23];

      _Block_object_dispose(v34, 8);
    }

    _Block_object_dispose(&v42, 8);
  }
}

uint64_t __85__PXGLayout_applySpriteChangeDetails_countAfterChanges_initialState_modifyFullState___block_invoke(id *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = [a1[4] entityManager];
  objc_msgSend(v6, "destroyEntities:count:", objc_msgSend(a1[5], "entities") + 4 * a2, a3);

  unint64_t v7 = a2 | ((unint64_t)a3 << 32);
  [a1[5] removeSpritesInRange:v7];
  [a1[6] removeSpritesInRange:v7];
  id v8 = a1[4];
  return [v8 _incrementNumberOfSprites:-a3];
}

- (void)setNeedsUpdateOfScrollableAxis
{
  id v3 = [(PXGLayout *)self superlayout];
  [v3 setNeedsUpdateOfScrollableAxis];

  id v4 = [(PXGLayout *)self scrollDelegate];
  [v4 setNeedsUpdateOfScrollableAxisForLayout:self];
}

- (PXGLayoutScrollDelegate)scrollDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollDelegate);
  return (PXGLayoutScrollDelegate *)WeakRetained;
}

- (void)insertSublayout:(id)a3 atIndex:(int64_t)a4
{
  id v8 = a3;
  [(PXGLayout *)self _willAddSublayout:v8];
  [(PXGLayout *)self _ensureSublayoutDataStore];
  uint64_t v6 = [(PXGLayout *)self sublayoutDataStore];
  [v6 insertSublayout:v8 atIndex:a4];

  unint64_t v7 = objc_msgSend(off_1E5DA5568, "changeDetailsWithInsertedIndexRange:", 0, objc_msgSend(v8, "numberOfSprites"));
  [(PXGLayout *)self sublayout:v8 didApplySpriteChangeDetails:v7 fromDescendentSublayout:v8];

  [(PXGLayout *)self didAddSublayout:v8 atIndex:a4 flags:0];
}

- (void)_willAddSublayout:(id)a3
{
  id v4 = a3;
  [v4 setSuperlayout:self];
  id v5 = [(PXGLayout *)self layoutQueue];
  [v4 setLayoutQueue:v5];

  [v4 setAxNextResponder:self];
  uint64_t v6 = [(PXGLayout *)self mediaProvider];
  [v4 setMediaProvider:v6];

  id v7 = [(PXGLayout *)self entityManager];
  [v4 setEntityManager:v7];
}

- (void)setMediaProvider:(id)a3
{
  id v5 = (PXMediaProvider *)a3;
  if (self->_mediaProvider != v5)
  {
    objc_storeStrong((id *)&self->_mediaProvider, a3);
    uint64_t v6 = [(PXGLayout *)self sublayoutDataStore];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __30__PXGLayout_setMediaProvider___block_invoke;
    v7[3] = &unk_1E5DB0670;
    id v8 = v5;
    [v6 enumerateSublayoutsUsingBlock:v7];

    [(PXGLayout *)self mediaProviderDidChange];
  }
}

- (PXGLayout)init
{
  v16.receiver = self;
  v16.super_class = (Class)PXGLayout;
  long long v2 = [(PXGLayout *)&v16 init];
  id v3 = v2;
  if (v2)
  {
    v2->_displayMaximumHeadroom = 1.0;
    v2->_alpha = 1.0;
    CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB10] + 16);
    v2->_clippingRect.origin = (CGPoint)*MEMORY[0x1E4F1DB10];
    v2->_clippingRect.size = v4;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v2->_referenceDepth = _Q0;
    interactions = v2->_interactions;
    v2->_interactions = (NSArray *)MEMORY[0x1E4F1CBF0];

    objc_storeStrong((id *)&v3->_layoutQueue, MEMORY[0x1E4F14428]);
    if (init_onceToken_16799 != -1) {
      dispatch_once(&init_onceToken_16799, &__block_literal_global_16800);
    }
    objc_storeStrong((id *)&v3->_spriteMetadataStore, (id)init_spriteMetadataStore);
    id v11 = [[PXGBasicAXGroup alloc] initWithLayout:v3];
    reusableAXGroup = v3->_reusableAXGroup;
    v3->_reusableAXGroup = v11;

    *(_OWORD *)&v3[1]._modifiedSpriteDataStore = xmmword_1AB35A6D0;
    *(_OWORD *)&v3[1]._interactions = unk_1AB35A6E0;
    *(_OWORD *)&v3[1]._entityManager = xmmword_1AB35A6F0;
    *(_OWORD *)&v3[1]._nestedAnchorVisibleRectChanges = xmmword_1AB35A690;
    *(_OWORD *)&v3[1]._numberOfRepeatedSublayoutUpdatesInUpdatePass = unk_1AB35A6A0;
    *(_OWORD *)&v3[1]._unint64_t needsUpdate = xmmword_1AB35A6B0;
    *(_OWORD *)&v3[1]._viewHostingSpriteIndedouble x = unk_1AB35A6C0;
    *(_OWORD *)&v3[1]._changeDetails = xmmword_1AB35A650;
    *(_OWORD *)&v3[1]._transitions = unk_1AB35A660;
    *(_OWORD *)&v3[1]._spriteReferencesForHiddenSprites = xmmword_1AB35A670;
    *(_OWORD *)&v3[1]._isRequestingVisibleRect = unk_1AB35A680;
    *(_OWORD *)&v3[1].super.isa = PXGCameraConfigurationNull;
    *(_OWORD *)&v3[1]._updateFlags.updated = unk_1AB35A640;
    if ([(PXGLayout *)v3 allowsSublayoutUpdateCycleAssertions])
    {
      CGFloat v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      sublayoutsExpectedToBeUpdatedInUpdatePass = v3->_sublayoutsExpectedToBeUpdatedInUpdatePass;
      v3->_sublayoutsExpectedToBeUpdatedInUpdatePass = v13;
    }
    v3->_viewHostingSpriteIndedouble x = -1;
  }
  return v3;
}

- (BOOL)allowsSublayoutUpdateCycleAssertions
{
  long long v2 = [off_1E5DA9658 sharedInstance];
  char v3 = [v2 enableSublayoutUpdateCycleAssertions];

  return v3;
}

- (void)setLayoutQueue:(id)a3
{
  id v5 = (OS_dispatch_queue *)a3;
  if (self->_layoutQueue != v5)
  {
    objc_storeStrong((id *)&self->_layoutQueue, a3);
    [(PXGLayout *)self layoutQueueDidChange];
    uint64_t v6 = [(PXGLayout *)self sublayoutDataStore];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __28__PXGLayout_setLayoutQueue___block_invoke;
    v7[3] = &unk_1E5DB0670;
    id v8 = v5;
    [v6 enumerateSublayoutsUsingBlock:v7];
  }
}

- (void)setAxNextResponder:(id)a3
{
}

- (void)setSuperlayout:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_superlayout);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_superlayout, obj);
    [(PXGLayout *)self superlayoutDidChange];
    id v5 = obj;
  }
}

- (void)superlayoutDidChange
{
  char v3 = [(PXGLayout *)self superlayout];

  if (!v3)
  {
    [(PXGLayout *)self setInternalCurrentDataSourceChange:0];
    [(PXGLayout *)self setAppearState:3];
  }
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (OS_dispatch_queue)layoutQueue
{
  return self->_layoutQueue;
}

- (void)_ensureSublayoutDataStore
{
  if (!self->_sublayoutDataStore)
  {
    char v3 = objc_alloc_init(PXGSublayoutDataStore);
    sublayoutDataStore = self->_sublayoutDataStore;
    self->_sublayoutDataStore = v3;
  }
}

uint64_t __85__PXGLayout_applySpriteChangeDetails_countAfterChanges_initialState_modifyFullState___block_invoke_2(uint64_t a1, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = a3;
  uint64_t v6 = a3;
  uint64_t v7 = a2;
  unint64_t v8 = a2 | ((unint64_t)a3 << 32);
  [*(id *)(a1 + 32) insertSpritesInRange:v8];
  [*(id *)(a1 + 40) insertSpritesInRange:v8];
  [*(id *)(a1 + 48) _incrementNumberOfSprites:v6];
  if (a2 + v3 > a2)
  {
    uint64_t v9 = 40 * v7;
    long long v17 = *((_OWORD *)off_1E5DAAF88 + 1);
    long long v18 = *(_OWORD *)off_1E5DAAF88;
    uint64_t v10 = *((void *)off_1E5DAAF88 + 4);
    do
    {
      uint64_t v11 = [*(id *)(a1 + 32) infos] + v9;
      *(_OWORD *)uint64_t v11 = v18;
      *(_OWORD *)(v11 + 16) = v17;
      *(void *)(v11 + 32) = v10;
      v9 += 40;
      --v3;
    }
    while (v3);
  }
  uint64_t v12 = [*(id *)(a1 + 32) entities] + 4 * v7;
  CGFloat v13 = [*(id *)(a1 + 48) entityManager];
  [v13 createEntitiesWithCount:v6 addingToArray:v12];

  uint64_t v14 = *(void *)(a1 + 56);
  if (v14)
  {
    CGFloat v15 = *(void **)(a1 + 32);
    if (v15)
    {
      [v15 spritesInRange:v8];
    }
    else
    {
      uint64_t v21 = 0;
      long long v19 = 0u;
      long long v20 = 0u;
    }
    (*(void (**)(uint64_t, unint64_t, long long *))(v14 + 16))(v14, v8, &v19);
  }
  return objc_msgSend(*(id *)(a1 + 40), "copySpritesInRange:fromSpriteDataStore:", v8, *(void *)(a1 + 32), v17, v18, v19, v20, v21);
}

uint64_t __85__PXGLayout_applySpriteChangeDetails_countAfterChanges_initialState_modifyFullState___block_invoke_3(uint64_t a1, unsigned int a2, unsigned int a3)
{
  unint64_t v4 = a2 | ((unint64_t)a3 << 32);
  if (a2 + a3 > [*(id *)(a1 + 32) count])
  {
    unint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 40), @"PXGLayout.m", 1596, @"Invalid parameter not satisfying: %@", @"PXGSpriteIndexRangeMax(range) <= spriteDataStore.count" object file lineNumber description];
  }
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void **)(a1 + 32);
  if (v6)
  {
    [v6 spritesInRange:v4];
  }
  else
  {
    uint64_t v10 = 0;
    memset(v9, 0, sizeof(v9));
  }
  (*(void (**)(uint64_t, unint64_t, _OWORD *))(v5 + 16))(v5, v4, v9);
  return [*(id *)(a1 + 48) copySpritesInRange:v4 fromSpriteDataStore:*(void *)(a1 + 32)];
}

uint64_t __40__PXGLayout_modifySpritesInRange_state___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), a3[2], a3[3], a3[4]);
}

- (void)setEntityManager:(id)a3
{
  uint64_t v5 = (PXGEntityManager *)a3;
  entityManager = self->_entityManager;
  if (entityManager != v5)
  {
    objc_super v16 = v5;
    id v7 = [(PXGLayout *)self spriteDataStore];
    uint64_t v8 = [v7 entities];
    uint64_t v9 = [(PXGLayout *)self spriteDataStore];
    -[PXGEntityManager destroyEntities:count:](entityManager, "destroyEntities:count:", v8, [v9 count]);

    objc_storeStrong((id *)&self->_entityManager, a3);
    uint64_t v10 = [(PXGLayout *)self spriteDataStore];
    if (v16)
    {
      uint64_t v11 = [v10 count];
      id v12 = [(PXGLayout *)self spriteDataStore];
      -[PXGEntityManager createEntitiesWithCount:addingToArray:](v16, "createEntitiesWithCount:addingToArray:", v11, [v12 entities]);
    }
    else
    {
      [v10 clearEntities];
    }

    CGFloat v13 = [(PXGLayout *)self sublayoutDataStore];
    if ([v13 count] >= 1)
    {
      uint64_t v14 = 0;
      do
      {
        CGFloat v15 = [v13 sublayoutAtIndex:v14];
        [v15 setEntityManager:v16];

        ++v14;
      }
      while (v14 < [v13 count]);
    }
    [(PXGLayout *)self entityManagerDidChange];

    uint64_t v5 = v16;
  }
}

uint64_t __81__PXGLayout_applySpriteChangeDetails_countAfterChanges_initialState_modifyState___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void, void, void))(result + 16))(result, a2, a3[2], a3[3], a3[4]);
  }
  return result;
}

- (void)setUpdateDelegate:(id)a3
{
}

void __157__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetailsForSingleSection_dataSourceBeforeChanges_dataSourceAfterChanges_changeMediaVersionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = [*(id *)(a1 + 32) lastObject];
  uint64_t v5 = [v4 toDataSourceIdentifier];

  if (v5 != a2)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = [*(id *)(a1 + 32) lastObject];
    [v9 handleFailureInMethod:v6, v7, @"PXGDataSourceDrivenLayout.m", 189, @"Data source identifier in itemsWithChanges %lu != %lu from the change details. allChangeDetails:%@ itemsWithChanges:%@ ", a2, objc_msgSend(v8, "toDataSourceIdentifier"), *(void *)(a1 + 32), *(void *)(a1 + 48) object file lineNumber description];
  }
}

void __157__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetailsForSingleSection_dataSourceBeforeChanges_dataSourceAfterChanges_changeMediaVersionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    CGFloat v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"PXGDataSourceDrivenLayout.m" lineNumber:174 description:@"Only supports changes to section 0"];
  }
  if (*(void *)(a1 + 40))
  {
    unint64_t v4 = [*(id *)(a1 + 48) itemChangesInSection:a2];
    if (([v4 hasIncrementalChanges] & 1) == 0)
    {
      uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"PXGDataSourceDrivenLayout.m", 177, @"Invalid parameter not satisfying: %@", @"itemChanges.hasIncrementalChanges" object file lineNumber description];
    }
    uint64_t v5 = [*(id *)(a1 + 40) numberOfItems];
    uint64_t v6 = [v4 insertedIndexes];
    uint64_t v7 = [v6 count] + v5;
    uint64_t v8 = [v4 removedIndexes];
    uint64_t v9 = v7 - [v8 count];

    [*(id *)(a1 + 40) setNumberOfItems:v9 withChangeDetails:v4];
    uint64_t v10 = *(void **)(a1 + 56);
    uint64_t v11 = [*(id *)(a1 + 48) toDataSourceIdentifier];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __157__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetailsForSingleSection_dataSourceBeforeChanges_dataSourceAfterChanges_changeMediaVersionHandler___block_invoke_3;
    v15[3] = &unk_1E5DBB990;
    id v16 = v4;
    id v12 = v4;
    [v10 modifyItemIndexSetForDataSourceIdentifier:v11 section:a2 usingBlock:v15];
  }
}

- (void)setNeedsUpdate
{
}

- (void)setContentSource:(id)a3
{
  p_contentSource = &self->_contentSource;
  id v19 = a3;
  objc_storeWeak((id *)p_contentSource, v19);
  if (objc_opt_respondsToSelector()) {
    uint64_t v5 = v19;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = objc_storeWeak((id *)&self->_displayAssetSource, v5);
  self->_displayAssetSourceRespondsTo.supportedDisplayAssetPresentationStylesInLayout = objc_opt_respondsToSelector() & 1;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayAssetSource);
  self->_displayAssetSourceRespondsTo.minSpriteSizeForPresentationStyle = objc_opt_respondsToSelector() & 1;

  id v8 = objc_loadWeakRetained((id *)&self->_displayAssetSource);
  self->_displayAssetSourceRespondsTo.displayAssetRequestObserverForSpritesInRangeInLayout = objc_opt_respondsToSelector() & 1;

  id v9 = objc_loadWeakRetained((id *)&self->_displayAssetSource);
  self->_displayAssetSourceRespondsTo.videoPresentationControllerForDisplayAssetSpriteIndexInLayout = objc_opt_respondsToSelector() & 1;

  id v10 = objc_loadWeakRetained((id *)&self->_displayAssetSource);
  self->_displayAssetSourceRespondsTo.adjustmentForDisplayAssetSpriteIndexInLayout = objc_opt_respondsToSelector() & 1;

  id v11 = objc_loadWeakRetained((id *)&self->_displayAssetSource);
  self->_displayAssetSourceRespondsTo.presentationIntentForSpritesInRangeInLayout = objc_opt_respondsToSelector() & 1;

  id v12 = objc_loadWeakRetained((id *)&self->_displayAssetSource);
  self->_displayAssetSourceRespondsTo.customMediaProviderForDisplayAssetsInLayout = objc_opt_respondsToSelector() & 1;

  id v13 = objc_loadWeakRetained((id *)&self->_displayAssetSource);
  self->_displayAssetSourceRespondsTo.customPixelBufferSourcesProviderForDisplayAssetsInLayout = objc_opt_respondsToSelector() & 1;

  id v14 = objc_loadWeakRetained((id *)&self->_displayAssetSource);
  self->_displayAssetSourceRespondsTo.useLowMemoryDecodeInLayout = objc_opt_respondsToSelector() & 1;

  id v15 = objc_loadWeakRetained((id *)&self->_displayAssetSource);
  self->_displayAssetSourceRespondsTo.shouldApplyCleanApertureCropToStillImagesInLayout = objc_opt_respondsToSelector() & 1;

  if (objc_opt_respondsToSelector()) {
    id v16 = v19;
  }
  else {
    id v16 = 0;
  }
  id v17 = v16;
  self->_stringSourceRespondsTo.stringDrawingOptionsForSpriteAtIndexInLayout = objc_opt_respondsToSelector() & 1;
  self->_stringSourceRespondsTo.paddingForSpriteAtIndexInLayout = objc_opt_respondsToSelector() & 1;
  self->_stringSourceRespondsTo.drawingContextForSpriteAtIndexInLayout = objc_opt_respondsToSelector() & 1;
  char v18 = objc_opt_respondsToSelector();

  self->_stringSourceRespondsTo.attributedStringBoundingSizeForSpriteAtIndexInLayout = v18 & 1;
}

- (void)applySectionedChangeDetailsForSingleSection:(id)a3 dataSourceBeforeChanges:(id)a4 dataSourceAfterChanges:(id)a5 changeMediaVersionHandler:(id)a6
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v12 numberOfSections] != 1 && objc_msgSend(v12, "numberOfSections"))
  {
    double v49 = [MEMORY[0x1E4F28B00] currentHandler];
    [v49 handleFailureInMethod:a2, self, @"PXGDataSourceDrivenLayout.m", 138, @"Invalid parameter not satisfying: %@", @"dataSourceAfterChanges.numberOfSections == 1 || dataSourceAfterChanges.numberOfSections == 0" object file lineNumber description];
  }
  id v14 = [[PXGDataSourceChange alloc] initWithChangeDetails:v10 dataSourceBeforeChanges:v11 dataSourceAfterChanges:v12];
  [(PXGLayout *)self setInternalCurrentDataSourceChange:v14];

  CGFloat v59 = self;
  id v15 = [(PXGLayout *)self layoutForItemChanges];
  if (v13) {
    id v16 = v13;
  }
  else {
    id v16 = &__block_literal_global_25_117878;
  }
  double v54 = _Block_copy(v16);

  uint64_t v17 = [v10 count];
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id obj = v10;
  uint64_t v18 = [obj countByEnumeratingWithState:&v82 objects:v87 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v83;
    id v50 = v12;
    id v52 = v11;
    CGFloat v61 = v15;
    uint64_t v57 = v17;
    while (2)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v83 != v20) {
          objc_enumerationMutation(obj);
        }
        long long v22 = *(void **)(*((void *)&v82 + 1) + 8 * i);
        double v23 = [v22 sectionChanges];
        if (![v23 hasIncrementalChanges]) {
          goto LABEL_32;
        }
        id v24 = [v22 itemChangesInSection:0];
        if (![v24 hasIncrementalChanges]) {
          goto LABEL_31;
        }
        long long v25 = [v22 sectionChanges];
        double v26 = [v25 removedIndexes];
        if ([v26 count])
        {

LABEL_31:
LABEL_32:

LABEL_33:
          id v12 = v50;
          id v11 = v52;
          id v15 = v61;
          goto LABEL_34;
        }
        double v27 = [v22 sectionChanges];
        double v28 = [v27 insertedIndexes];
        uint64_t v29 = [v28 count];

        if (v29) {
          goto LABEL_33;
        }
      }
      id v12 = v50;
      id v11 = v52;
      id v15 = v61;
      uint64_t v17 = v57;
      uint64_t v19 = [obj countByEnumeratingWithState:&v82 objects:v87 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }

  if (v17 && [v12 numberOfSections])
  {
    CGFloat v62 = v15;
    id v51 = v12;
    id v53 = v11;
    id v30 = [off_1E5DA7430 indexPathSet];
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v56 = obj;
    uint64_t v31 = [v56 countByEnumeratingWithState:&v78 objects:v86 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v58 = *(void *)v79;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v79 != v58) {
            objc_enumerationMutation(v56);
          }
          CGFloat v34 = *(void **)(*((void *)&v78 + 1) + 8 * j);
          CGFloat v35 = [v34 sectionChanges];
          id v36 = [v35 insertedIndexes];
          uint64_t v37 = [v36 count];
          long long v38 = [v35 removedIndexes];
          uint64_t v39 = [v38 count];

          if (v37 != v39)
          {
            long long v43 = [MEMORY[0x1E4F28B00] currentHandler];
            [v43 handleFailureInMethod:a2, v59, @"PXGDataSourceDrivenLayout.m", 167, @"Invalid parameter not satisfying: %@", @"sectionChangeDetails.insertedIndexes.count - sectionChangeDetails.removedIndexes.count == 0" object file lineNumber description];
          }
          long long v40 = [v34 indexPathSetAfterApplyingChangesToIndexPathSet:v30 hasIncrementalChanges:0];
          double v41 = (void *)[v40 mutableCopy];

          uint64_t v42 = [v34 sectionsWithItemChanges];
          v73[0] = MEMORY[0x1E4F143A8];
          v73[1] = 3221225472;
          v73[2] = __157__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetailsForSingleSection_dataSourceBeforeChanges_dataSourceAfterChanges_changeMediaVersionHandler___block_invoke_2;
          void v73[3] = &unk_1E5DC4690;
          SEL v77 = a2;
          v73[4] = v59;
          id v74 = v62;
          CGRect v75 = v34;
          id v30 = v41;
          id v76 = v30;
          [v42 enumerateIndexesUsingBlock:v73];
        }
        uint64_t v32 = [v56 countByEnumeratingWithState:&v78 objects:v86 count:16];
      }
      while (v32);
    }

    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __157__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetailsForSingleSection_dataSourceBeforeChanges_dataSourceAfterChanges_changeMediaVersionHandler___block_invoke_4;
    v68[3] = &unk_1E5DBB9E0;
    id v44 = v56;
    id v69 = v44;
    double v70 = v59;
    id v71 = v30;
    SEL v72 = a2;
    id v45 = v30;
    [v45 enumerateDataSourceIdentifiers:v68];
    id v46 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __157__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetailsForSingleSection_dataSourceBeforeChanges_dataSourceAfterChanges_changeMediaVersionHandler___block_invoke_5;
    v63[3] = &unk_1E5DBBA30;
    id v15 = v62;
    id v64 = v62;
    id v65 = v44;
    id v66 = v46;
    id v67 = v54;
    id v47 = v46;
    [v45 enumerateItemIndexSetsUsingBlock:v63];

    id v12 = v51;
    id v11 = v53;
  }
  else
  {
LABEL_34:
    if ([v12 numberOfSections] == 1) {
      uint64_t v48 = [v12 numberOfItemsInSection:0];
    }
    else {
      uint64_t v48 = 0;
    }
    id v45 = [off_1E5DA5568 changeDetailsWithNoIncrementalChanges];
    [v15 setNumberOfItems:v48 withChangeDetails:v45];
  }
}

- (unint64_t)anchoredContentEdges
{
  long long v2 = [(PXGLayout *)self activeAnchor];
  unint64_t v3 = [v2 anchoredContentEdges];

  return v3;
}

- (void)performSpriteStylingUpdate:(id)a3
{
  BOOL isUpdatingSpriteStyling = self->_isUpdatingSpriteStyling;
  self->_BOOL isUpdatingSpriteStyling = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_BOOL isUpdatingSpriteStyling = isUpdatingSpriteStyling;
}

- (BOOL)shouldDecorateUndefinedMediaKind
{
  return 1;
}

- (void)invalidateDecoration
{
  uint64_t v3 = [(PXGLayout *)self localNumberOfSprites] << 32;
  [(PXGLayout *)self invalidateDecorationForSpritesInRange:v3];
}

- (void)invalidateDecorationForSpritesInRange:(_PXGSpriteIndexRange)a3
{
}

- (void)_invalidateDecorationForSpriteRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4 invalidateSprites:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = [(PXGLayout *)self superlayout];
  [v9 _invalidateDecorationForSpriteRange:a3 inLayout:v8 invalidateSprites:v5];
}

- (void)applySpriteChangeDetails:(id)a3 countAfterChanges:(unsigned int)a4 initialState:(id)a5 modifyState:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__PXGLayout_applySpriteChangeDetails_countAfterChanges_initialState_modifyState___block_invoke;
  v12[3] = &unk_1E5DB07E8;
  id v13 = v10;
  id v11 = v10;
  [(PXGLayout *)self applySpriteChangeDetails:a3 countAfterChanges:v7 initialState:a5 modifyFullState:v12];
}

- (void)modifySpritesInRange:(_PXGSpriteIndexRange)a3 state:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__PXGLayout_modifySpritesInRange_state___block_invoke;
  v8[3] = &unk_1E5DB07C0;
  id v9 = v6;
  _PXGSpriteIndexRange v10 = a3;
  id v7 = v6;
  [(PXGLayout *)self modifySpritesInRange:a3 fullState:v8];
}

- (void)modifySpritesInRange:(_PXGSpriteIndexRange)a3 fullState:(id)a4
{
  uint64_t length = a3.length;
  if (a3.length)
  {
    uint64_t location = a3.location;
    id v7 = a4;
    objc_msgSend(off_1E5DA5568, "changeDetailsWithChangedIndexRange:", location, length);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [(PXGLayout *)self applySpriteChangeDetails:v8 countAfterChanges:[(PXGLayout *)self localNumberOfSprites] initialState:0 modifyFullState:v7];
  }
}

void __157__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetailsForSingleSection_dataSourceBeforeChanges_dataSourceAfterChanges_changeMediaVersionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  long long v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 changedIndexes];
  [v3 addIndexes:v4];
}

- (CGRect)convertRect:(CGRect)a3 fromLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  _PXGSpriteIndexRange v10 = [(PXGLayout *)self ancestorSharedWithLayout:v9];
  id v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "convertRect:fromDescendantLayout:", v9, x, y, width, height);
    objc_msgSend(v11, "convertRect:toDescendantLayout:", self);
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
  }
  else
  {
    double v13 = *MEMORY[0x1E4F1DB20];
    double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v17 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v19 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toDescendantLayout:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a4;
  double v10 = *MEMORY[0x1E4F1DB20];
  double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  if (!CGRectIsNull(v18))
  {
    [(PXGLayout *)self _offsetToDescendantLayout:v9];
    PXPointIsNull();
  }

  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromDescendantLayout:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a4;
  double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v17 = *MEMORY[0x1E4F1DB20];
  double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  if (!CGRectIsNull(v18))
  {
    [(PXGLayout *)self _offsetToDescendantLayout:v9];
    PXPointIsNull();
  }

  double v13 = v16;
  double v12 = v17;
  double v14 = v10;
  double v15 = v11;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (id)ancestorSharedWithLayout:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  if (v5)
  {
    while (1)
    {
      id v6 = (PXGLayout *)v4;
      if (v4) {
        break;
      }
LABEL_6:
      uint64_t v9 = [(PXGLayout *)v5 superlayout];

      BOOL v5 = (PXGLayout *)v9;
      if (!v9) {
        goto LABEL_9;
      }
    }
    id v7 = v6;
    while (v5 != v7)
    {
      uint64_t v8 = [(PXGLayout *)v7 superlayout];

      id v7 = (PXGLayout *)v8;
      if (!v8) {
        goto LABEL_6;
      }
    }
  }
LABEL_9:

  return v5;
}

- (unint64_t)appearState
{
  return self->_appearState;
}

- (void)setSpriteModifier:(id)a3
{
  if (self->_spriteModifier != a3)
  {
    id v4 = (PXGLayoutSpriteModifier *)[a3 copy];
    spriteModifier = self->_spriteModifier;
    self->_spriteModifier = v4;

    uint64_t v6 = [(PXGLayout *)self localNumberOfSprites] << 32;
    [(PXGLayout *)self modifySpritesInRange:v6 state:&__block_literal_global_95];
  }
}

- ($225AF24142A77900D29617A74D173C5F)styleForSpriteAtIndex:(SEL)a3
{
  id v13 = [(PXGLayout *)self spriteDataStore];
  uint64_t v6 = (_OWORD *)([v13 styles] + 160 * a4);
  long long v7 = v6[7];
  *($6FCFBD36564ECBB6D9D1614A84D6F83D *)((char *)&retstr[2].var1 + 4) = ($6FCFBD36564ECBB6D9D1614A84D6F83D)v6[6];
  *(_OWORD *)&retstr[2].var3 = v7;
  $6FCFBD36564ECBB6D9D1614A84D6F83D v8 = ($6FCFBD36564ECBB6D9D1614A84D6F83D)v6[9];
  *(_OWORD *)&retstr[2].var8 = v6[8];
  *($6FCFBD36564ECBB6D9D1614A84D6F83D *)((char *)&retstr[3].var1 + 8) = v8;
  $6FCFBD36564ECBB6D9D1614A84D6F83D v9 = ($6FCFBD36564ECBB6D9D1614A84D6F83D)v6[3];
  *(_OWORD *)&retstr->var5 = v6[2];
  retstr[1].double var1 = v9;
  long long v10 = v6[5];
  *(_OWORD *)&retstr[1].double var2 = v6[4];
  *(_OWORD *)&retstr[1].var6 = v10;
  $6FCFBD36564ECBB6D9D1614A84D6F83D v11 = ($6FCFBD36564ECBB6D9D1614A84D6F83D)v6[1];
  *(_OWORD *)&retstr->double var0 = *v6;
  *($6FCFBD36564ECBB6D9D1614A84D6F83D *)((char *)&retstr->var1 + 12) = v11;

  return result;
}

- (_PXGSpriteIndexRange)addSpriteCount:(unsigned int)a3 withInitialState:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  _PXGSpriteIndexRange v7 = (_PXGSpriteIndexRange)([(PXGLayout *)self localNumberOfSprites] | (unint64_t)(v4 << 32));
  [(PXGLayout *)self addSpritesInRange:v7 initialState:v6];

  return v7;
}

- (void)addSpritesInRange:(_PXGSpriteIndexRange)a3 initialState:(id)a4
{
  uint64_t length = a3.length;
  if (a3.length)
  {
    uint64_t location = a3.location;
    id v7 = a4;
    objc_msgSend(off_1E5DA5568, "changeDetailsWithInsertedIndexRange:", location, length);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [(PXGLayout *)self applySpriteChangeDetails:v8 countAfterChanges:[(PXGLayout *)self localNumberOfSprites] + length initialState:v7 modifyState:0];
  }
}

- (unsigned)addSpriteWithInitialState:(id)a3
{
  return [(PXGLayout *)self addSpriteCount:1 withInitialState:a3];
}

- (id)createCuratedLibraryLayoutZoomLevelChangeAnimationFromZoomLevel:(int64_t)a3 toZoomLevel:(int64_t)a4 withContext:(int64_t)a5
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = @"PXCuratedLibraryZoomLevelChangeFromKey";
  id v8 = [NSNumber numberWithInteger:a3];
  v13[1] = @"PXCuratedLibraryZoomLevelChangeToKey";
  v14[0] = v8;
  $6FCFBD36564ECBB6D9D1614A84D6F83D v9 = [NSNumber numberWithInteger:a4];
  v14[1] = v9;
  long long v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  $6FCFBD36564ECBB6D9D1614A84D6F83D v11 = [(PXGLayout *)self createCuratedLibraryLayoutAnimationIfNeededWithContext:a5 userData:v10];

  return v11;
}

void __43__PXGLayout_objectReferenceForSpriteIndex___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (*(void **)(a1 + 32) != a3)
  {
    uint64_t v4 = [a3 objectReferenceForSpriteIndex:a2];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

- (unsigned)convertSpriteIndex:(unsigned int)a3 toDescendantLayout:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = (PXGLayout *)a4;
  id v7 = v6;
  unsigned int v8 = -1;
  if (v4 != -1 && v6)
  {
    uint64_t v17 = 0;
    CGRect v18 = &v17;
    uint64_t v19 = 0x2020000000;
    int v20 = -1;
    if (v6 == self)
    {
      int v20 = v4;
    }
    else
    {
      $6FCFBD36564ECBB6D9D1614A84D6F83D v9 = [(PXGLayout *)v6 superlayout];

      if (v9 == self)
      {
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __51__PXGLayout_convertSpriteIndex_toDescendantLayout___block_invoke;
        void v14[3] = &unk_1E5DB0978;
        double v15 = v7;
        double v16 = &v17;
        [(PXGLayout *)self enumerateLayoutsForSpritesInRange:v4 | 0x100000000 options:0 usingBlock:v14];
      }
      else
      {
        long long v10 = [(PXGLayout *)v7 superlayout];
        if (v10)
        {
          uint64_t v11 = [(PXGLayout *)self convertSpriteIndex:v4 toDescendantLayout:v10];
          *((_DWORD *)v18 + 6) = v11;
          if (v11 != -1)
          {
            int v12 = [v10 convertSpriteIndex:v11 toDescendantLayout:v7];
            *((_DWORD *)v18 + 6) = v12;
          }
        }
      }
    }
    unsigned int v8 = *((_DWORD *)v18 + 6);
    _Block_object_dispose(&v17, 8);
  }

  return v8;
}

- (id)sublayoutForSpriteIndex:(unsigned int)a3
{
  int64_t v4 = [(PXGLayout *)self sublayoutIndexForSpriteIndex:*(void *)&a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = 0;
  }
  else
  {
    int64_t v6 = v4;
    id v7 = [(PXGLayout *)self sublayoutDataStore];
    uint64_t v5 = [v7 sublayoutAtIndex:v6];
  }
  return v5;
}

- (int64_t)sublayoutIndexForSpriteIndex:(unsigned int)a3
{
  int64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != -1)
  {
    uint64_t v6 = 0;
    id v7 = &v6;
    uint64_t v8 = 0x2020000000;
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __42__PXGLayout_sublayoutIndexForSpriteIndex___block_invoke;
    _OWORD v5[3] = &unk_1E5DB0978;
    v5[4] = self;
    v5[5] = &v6;
    [(PXGLayout *)self enumerateLayoutsForSpritesInRange:a3 | 0x100000000 options:0 usingBlock:v5];
    int64_t v3 = v7[3];
    _Block_object_dispose(&v6, 8);
  }
  return v3;
}

- (id)createFenceWithType:(unint64_t)a3
{
  int64_t v4 = [[PXGFence alloc] initWithLayout:self type:a3];
  uint64_t v5 = [(PXGLayout *)self rootLayout];
  [v5 addFence:v4];

  return v4;
}

- (void)addFence:(id)a3
{
  id v4 = a3;
  fences = self->_fences;
  id v8 = v4;
  if (!fences)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v7 = self->_fences;
    self->_fences = v6;

    id v4 = v8;
    fences = self->_fences;
  }
  [(NSMutableArray *)fences addObject:v4];
  [(PXGLayout *)self _setNeedsUpdateExternally:0];
}

- (void)removeSublayoutsAtIndexes:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__PXGLayout_removeSublayoutsAtIndexes___block_invoke;
  v3[3] = &unk_1E5DCD248;
  v3[4] = self;
  [a3 enumerateRangesWithOptions:2 usingBlock:v3];
}

- (int64_t)addSublayout:(id)a3
{
  uint64_t v5 = (PXGLayout *)a3;
  if (v5 == self)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, v5, @"PXGLayout.m", 1144, @"Invalid parameter not satisfying: %@", @"sublayout != self" object file lineNumber description];
  }
  int64_t v6 = [(PXGLayout *)self numberOfSublayouts];
  [(PXGLayout *)self insertSublayout:v5 atIndex:v6];

  return v6;
}

void __17__PXGLayout_init__block_invoke()
{
  v0 = objc_alloc_init(PXGSpriteMetadataStore);
  v1 = (void *)init_spriteMetadataStore;
  init_spriteMetadataStore = (uint64_t)v0;
}

- (unsigned)addResizableCapInsets:(id)a3
{
  float var3 = a3.var3;
  float var2 = a3.var2;
  float var1 = a3.var1;
  float var0 = a3.var0;
  id v7 = [(PXGLayout *)self spriteMetadataStore];
  *(float *)&double v8 = var0;
  *(float *)&double v9 = var1;
  *(float *)&double v10 = var2;
  *(float *)&double v11 = var3;
  unsigned __int16 v12 = objc_msgSend(v7, "addResizableCapInsets:", v8, v9, v10, v11);

  return v12;
}

- (PXGSpriteMetadataStore)spriteMetadataStore
{
  return self->_spriteMetadataStore;
}

- (NSArray)transitions
{
  long long v2 = (void *)[(NSMutableArray *)self->_transitions copy];
  return (NSArray *)v2;
}

void __27__PXGLayout_updateIfNeeded__block_invoke()
{
}

- (NSArray)pendingFences
{
  long long v2 = [(PXGLayout *)self rootLayout];
  int64_t v3 = [v2 fences];

  return (NSArray *)v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_nextViewHostingLayout);
  objc_destroyWeak((id *)&self->_axNextResponder);
  objc_storeStrong((id *)&self->_pointReferences, 0);
  objc_storeStrong((id *)&self->_localHiddenSpriteIndexes, 0);
  objc_storeStrong((id *)&self->_lastVisibleAreaAnchor, 0);
  objc_storeStrong((id *)&self->_activeAnchor, 0);
  objc_storeStrong((id *)&self->_internalCurrentDataSourceChange, 0);
  objc_destroyWeak((id *)&self->_displayAssetSource);
  objc_destroyWeak((id *)&self->_focusDelegate);
  objc_destroyWeak((id *)&self->_viewDelegate);
  objc_destroyWeak((id *)&self->_scrollDelegate);
  objc_destroyWeak((id *)&self->_visibleRectDelegate);
  objc_destroyWeak((id *)&self->_updateDelegate);
  objc_storeStrong((id *)&self->_spriteMetadataStore, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong(&self->_userData, 0);
  objc_destroyWeak((id *)&self->_contentSource);
  objc_storeStrong((id *)&self->_spriteModifier, 0);
  objc_storeStrong((id *)&self->_viewEnvironment, 0);
  objc_storeStrong((id *)&self->_layoutQueue, 0);
  objc_storeStrong((id *)&self->_entityManager, 0);
  objc_destroyWeak((id *)&self->_superlayout);
  objc_storeStrong((id *)&self->_interactions, 0);
  objc_storeStrong((id *)&self->_sublayoutDataStore, 0);
  objc_storeStrong((id *)&self->_modifiedSpriteDataStore, 0);
  objc_storeStrong((id *)&self->_spriteDataStore, 0);
  objc_storeStrong((id *)&self->_sublayoutsExpectedToBeUpdatedInUpdatePass, 0);
  objc_storeStrong((id *)&self->_reusableAXGroup, 0);
  objc_storeStrong((id *)&self->_spriteIndexesWithInvalidatedStyle, 0);
  objc_storeStrong((id *)&self->_spriteReferencesForHiddenSprites, 0);
  objc_storeStrong((id *)&self->_fences, 0);
  objc_storeStrong((id *)&self->_transitions, 0);
  objc_storeStrong((id *)&self->_animations, 0);
  objc_storeStrong((id *)&self->_changeDetails, 0);
}

- (void)setNextViewHostingLayout:(id)a3
{
}

- (unsigned)viewHostingSpriteIndex
{
  return self->_viewHostingSpriteIndex;
}

- (NSHashTable)pointReferences
{
  return self->_pointReferences;
}

- (BOOL)disableDebugAssertionForSublayoutUpdates
{
  return self->_disableDebugAssertionForSublayoutUpdates;
}

- (NSIndexSet)localHiddenSpriteIndexes
{
  return self->_localHiddenSpriteIndexes;
}

- (void)setEstimatedContentSize:(CGSize)a3
{
  self->_estimatedContentSize = a3;
}

- (PXGDataSourceChange)internalCurrentDataSourceChange
{
  return self->_internalCurrentDataSourceChange;
}

- ($294CB042FB18EDF8FD74FDF4F765ED39)stringSourceRespondsTo
{
  return ($294CB042FB18EDF8FD74FDF4F765ED39)self->_stringSourceRespondsTo;
}

- (int64_t)updateCount
{
  return self->_updateCount;
}

- (PXGLayoutFocusDelegate)focusDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusDelegate);
  return (PXGLayoutFocusDelegate *)WeakRetained;
}

- (PXGLayoutViewDelegate)viewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewDelegate);
  return (PXGLayoutViewDelegate *)WeakRetained;
}

- (void)setUserData:(id)a3
{
}

- (id)userData
{
  return self->_userData;
}

- (double)floatingOffset
{
  return self->_floatingOffset;
}

- (BOOL)isFloating
{
  return self->_floating;
}

- (void)setNeedsFocusUpdate
{
  id v4 = [(PXGLayout *)self rootLayout];
  int64_t v3 = [v4 focusDelegate];
  [v3 setNeedsFocusUpdateForLayout:self];
}

- (NSIndexSet)preferredFocusSpriteIndexes
{
  return (NSIndexSet *)[MEMORY[0x1E4F28D60] indexSet];
}

- (NSArray)preferredFocusLayouts
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (void)setCameraConfiguration:(float32x4_t *)a3
{
  if ((vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(a3[1], a1[41]), (int8x16_t)vceqq_f32(*a3, a1[40])), vandq_s8((int8x16_t)vceqq_f32(a3[2], a1[42]), (int8x16_t)vceqq_f32(a3[3], a1[43])))) & 0x80000000) == 0|| (vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(a3[6], a1[46]), (int8x16_t)vceqq_f32(a3[7], a1[47])), vandq_s8((int8x16_t)vceqq_f32(a3[5], a1[45]), (int8x16_t)vceqq_f32(a3[4], a1[44])))) & 0x80000000) == 0|| (vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(a3[9], a1[49]), (int8x16_t)vceqq_f32(a3[8], a1[48])), vandq_s8((int8x16_t)vceqq_f32(a3[10], a1[50]), (int8x16_t)vceqq_f32(a3[11], a1[51])))) & 0x80000000) == 0|| (uint32x4_t v4 = (uint32x4_t)vceqq_f32(a3[12], a1[52]), v4.i32[3] = v4.i32[2], (vminvq_u32(v4) & 0x80000000) == 0))
  {
    a1[40] = *a3;
    float32x4_t v5 = a3[1];
    float32x4_t v6 = a3[2];
    float32x4_t v7 = a3[4];
    a1[43] = a3[3];
    a1[44] = v7;
    a1[41] = v5;
    a1[42] = v6;
    float32x4_t v8 = a3[5];
    float32x4_t v9 = a3[6];
    float32x4_t v10 = a3[8];
    a1[47] = a3[7];
    a1[48] = v10;
    a1[45] = v8;
    a1[46] = v9;
    float32x4_t v11 = a3[9];
    float32x4_t v12 = a3[10];
    float32x4_t v13 = a3[12];
    a1[51] = a3[11];
    a1[52] = v13;
    a1[49] = v11;
    a1[50] = v12;
    id v14 = [(float32x4_t *)a1 updateDelegate];
    [v14 layoutNeedsRenderUpdate:a1];
  }
}

- (void)enumerateDescendantsLayoutsBreadthFirstReverseUsingBlock:(id)a3
{
  id v4 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  char v20 = 0;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v6 addObject:self];
  float32x4_t v7 = [MEMORY[0x1E4F1CA98] null];
  [v6 addObject:v7];
  while (1)
  {

    float32x4_t v7 = [v6 firstObject];

    if (v7)
    {
      float32x4_t v7 = [v6 firstObject];
      [v6 removeObject:v7];
    }
    float32x4_t v8 = [MEMORY[0x1E4F1CA98] null];
    int v9 = [v7 isEqual:v8];

    if (v9) {
      break;
    }
    if (v7) {
      [v5 addObject:v7];
    }
    float32x4_t v10 = [v7 sublayoutDataStore];
    for (uint64_t i = 0; i < [v10 count]; ++i)
    {
      float32x4_t v12 = [v10 sublayoutAtIndex:i];
      if (v12) {
        [v6 addObject:v12];
      }
    }
LABEL_7:
  }
  if ([v6 count])
  {
    float32x4_t v10 = [MEMORY[0x1E4F1CA98] null];
    [v6 addObject:v10];
    goto LABEL_7;
  }

  float32x4_t v13 = [v5 reverseObjectEnumerator];
  id v14 = [v13 allObjects];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __70__PXGLayout_enumerateDescendantsLayoutsBreadthFirstReverseUsingBlock___block_invoke;
  v16[3] = &unk_1E5DB0A90;
  id v15 = v4;
  id v17 = v15;
  CGRect v18 = v19;
  [v14 enumerateObjectsUsingBlock:v16];

  _Block_object_dispose(v19, 8);
}

uint64_t __70__PXGLayout_enumerateDescendantsLayoutsBreadthFirstReverseUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
  return result;
}

- (id)diagnosticsItemProvidersInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v9 = [(PXGLayout *)self sublayoutDataStore];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __44__PXGLayout_diagnosticsItemProvidersInRect___block_invoke;
  double v16 = &unk_1E5DB0A40;
  id v17 = v8;
  CGRect v18 = self;
  double v19 = x;
  double v20 = y;
  double v21 = width;
  double v22 = height;
  id v10 = v8;
  objc_msgSend(v9, "enumerateSublayoutsInRect:usingBlock:", &v13, x, y, width, height);

  float32x4_t v11 = objc_msgSend(v10, "copy", v13, v14, v15, v16);
  return v11;
}

void __44__PXGLayout_diagnosticsItemProvidersInRect___block_invoke(double *a1, uint64_t a2, void *a3)
{
  int64_t v3 = (void *)*((void *)a1 + 4);
  id v4 = (void *)*((void *)a1 + 5);
  double v5 = a1[6];
  double v6 = a1[7];
  double v7 = a1[8];
  double v8 = a1[9];
  id v9 = a3;
  objc_msgSend(v4, "convertRect:toDescendantLayout:", v9, v5, v6, v7, v8);
  objc_msgSend(v9, "diagnosticsItemProvidersInRect:");
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  [v3 addObjectsFromArray:v10];
}

- (UIEdgeInsets)fullPageSnapshotFloatingInsets
{
  [(PXGLayout *)self safeAreaInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  [(PXGLayout *)self visibleRect];
  double v9 = CGRectGetHeight(v14) * 0.5;
  double v10 = 200.0;
  if (v9 <= 200.0) {
    double v10 = v9;
  }
  if (v10 < v4) {
    double v10 = v4;
  }
  if (v9 > 100.0) {
    double v9 = 100.0;
  }
  if (v9 >= v10) {
    double v11 = v9;
  }
  else {
    double v11 = v10;
  }
  double v12 = v6;
  double v13 = v8;
  result.double right = v13;
  result.double bottom = v11;
  result.double left = v12;
  result.double top = v10;
  return result;
}

- (NSString)briefDiagnosticDescription
{
  return 0;
}

- (void)_appendDescription:(id)a3 atLevel:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = a4 + 1;
  double v8 = [(PXGLayout *)self _paddingForLevel:a4 + 1];
  double v9 = [(PXGLayout *)self description];
  [v6 appendFormat:@"%@", v9];

  if (!a4)
  {
    [(PXGLayout *)self contentSize];
    double v10 = NSStringFromCGSize(v21);
    [(PXGLayout *)self visibleRect];
    double v11 = NSStringFromCGRect(v22);
    [v6 appendFormat:@", contentSize=%@, visibleRect=%@", v10, v11];
  }
  uint64_t v12 = [(PXGLayout *)self briefDiagnosticDescription];
  double v13 = (void *)v12;
  if (v12) {
    [v6 appendFormat:@", %@", v12];
  }
  [v6 appendString:@"\n"];
  CGRect v14 = [(PXGLayout *)self sublayoutDataStore];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __40__PXGLayout__appendDescription_atLevel___block_invoke;
  v17[3] = &unk_1E5DCC0F0;
  v17[4] = self;
  id v18 = v6;
  id v19 = v8;
  int64_t v20 = v7;
  id v15 = v8;
  id v16 = v6;
  [v14 enumerateSublayoutsUsingBlock:v17];
}

void __40__PXGLayout__appendDescription_atLevel___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) sublayoutDataStore];
  uint64_t v7 = [v6 geometries] + 136 * a2;
  long long v8 = *(_OWORD *)(v7 + 88);
  long long v9 = *(_OWORD *)(v7 + 72);
  long long v10 = v8;
  long long v11 = *(_OWORD *)(v7 + 104);

  PXGPositionDescription();
}

- (id)_paddingForLevel:(int64_t)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if (a3 >= 1)
  {
    do
    {
      [v4 appendString:@"   | "];
      --a3;
    }
    while (a3);
  }
  id v5 = (void *)[v4 copy];

  return v5;
}

- (NSString)parentDescription
{
  double v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = self;
  if (v4)
  {
    id v5 = v4;
    unint64_t v6 = 0;
    do
    {
      if ([v3 length]) {
        [v3 appendString:@"\n"];
      }
      if (v6)
      {
        for (unint64_t i = 1; i <= v6; ++i)
          [v3 appendString:@"    "];
      }
      long long v8 = [v5 description];
      [v3 appendString:v8];

      uint64_t v9 = [v5 superlayout];

      ++v6;
      id v5 = (void *)v9;
    }
    while (v9);
  }
  [v3 appendString:@" (root)"];
  return (NSString *)v3;
}

- (NSString)recursiveDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [(PXGLayout *)self _appendDescription:v3 atLevel:0];
  objc_msgSend(v3, "px_removeSuffix:", @"\n");
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (NSString)diagnosticDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = [(PXGLayout *)self description];
  id v5 = (void *)[v3 initWithString:v4];

  objc_msgSend(v5, "px_removeSuffix:", @">");
  [(PXGLayout *)self contentSize];
  PXSizeDescription();
}

- ($8F6F21C65DCD0A0F8AC24DFE540A6236)orientedContentTransform
{
  long long v4 = *((_OWORD *)off_1E5DAAF78 + 1);
  *(_OWORD *)&retstr->var0.a = *(_OWORD *)off_1E5DAAF78;
  *(_OWORD *)&retstr->var0.c = v4;
  *(_OWORD *)&retstr->var0.tdouble x = *((_OWORD *)off_1E5DAAF78 + 2);
  retstr->float var1 = *((double *)off_1E5DAAF78 + 6);
  UIEdgeInsets result = [(PXGLayout *)self userInterfaceDirection];
  if (result == ($8F6F21C65DCD0A0F8AC24DFE540A6236 *)1)
  {
    [(PXGLayout *)self referenceSize];
    PXAffineTransformMakeHorizontalFlip();
  }
  return result;
}

- (_PXGSpriteIndexRange)spriteIndexRangeCoveringRect:(CGRect)a3
{
  return (_PXGSpriteIndexRange)([(PXGLayout *)self numberOfSprites] << 32);
}

uint64_t __58__PXGLayout__enumerateSpritesInRect_transform_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
  if (*a4) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  return result;
}

void __58__PXGLayout__enumerateSpritesInRect_transform_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, CGFloat *a3, id *a4, uint64_t a5)
{
  if (*a4)
  {
    id v8 = *a4;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 36) = [v8 numberOfSprites];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 36))
    {
      v29.origin.double x = a3[6];
      v29.origin.double y = a3[7];
      v29.size.double width = a3[4];
      v29.size.double height = a3[5];
      if (CGRectIntersectsRect(*(CGRect *)(a1 + 48), v29))
      {
        uint64_t v27 = 0;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v24 = 0u;
        long long v9 = *(_OWORD *)(a1 + 96);
        long long v20 = *(_OWORD *)(a1 + 80);
        long long v21 = v9;
        long long v22 = *(_OWORD *)(a1 + 112);
        uint64_t v23 = *(void *)(a1 + 128);
        _spriteTransformFromSelfAndParent(&v24, (uint64_t)a3, (uint64_t)&v20, 1);
        CGRect v28 = CGRectOffset(*(CGRect *)(a1 + 48), -a3[6], -a3[7]);
        double x = v28.origin.x;
        double y = v28.origin.y;
        double width = v28.size.width;
        double height = v28.size.height;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __58__PXGLayout__enumerateSpritesInRect_transform_usingBlock___block_invoke_3;
        v16[3] = &unk_1E5DB09F0;
        id v14 = *(id *)(a1 + 32);
        uint64_t v15 = *(void *)(a1 + 40);
        id v17 = v14;
        uint64_t v18 = v15;
        uint64_t v19 = a5;
        long long v20 = v24;
        long long v21 = v25;
        long long v22 = v26;
        uint64_t v23 = v27;
        objc_msgSend(v8, "_enumerateSpritesInRect:transform:usingBlock:", &v20, v16, x, y, width, height);
      }
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) += *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                             + 36);
  }
}

uint64_t __58__PXGLayout__enumerateSpritesInRect_transform_usingBlock___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned char *a9)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
  if (*a9) {
    **(unsigned char **)(a1 + 48) = 1;
  }
  return result;
}

- (void)enumerateLocalSpritesInRect:(CGRect)a3 usingBlock:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  long long v10 = [(PXGLayout *)self spriteDataStore];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __52__PXGLayout_enumerateLocalSpritesInRect_usingBlock___block_invoke;
  v13[3] = &unk_1E5DB09A0;
  long long v11 = *((_OWORD *)off_1E5DAAF78 + 1);
  long long v15 = *(_OWORD *)off_1E5DAAF78;
  long long v16 = v11;
  long long v17 = *((_OWORD *)off_1E5DAAF78 + 2);
  uint64_t v18 = *((void *)off_1E5DAAF78 + 6);
  v13[4] = self;
  id v14 = v9;
  id v12 = v9;
  objc_msgSend(v10, "enumerateSpritesInRect:usingBlock:", v13, x, y, width, height);
}

uint64_t __52__PXGLayout_enumerateLocalSpritesInRect_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, void, void, void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, a1 + 48, a3[1], a3[2], a3[3], *(void *)(a1 + 32), a2, a4);
}

- (id)leafSublayoutForSpriteIndex:(unsigned int)a3
{
  if (a3 == -1)
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = &v6;
    uint64_t v8 = 0x3032000000;
    id v9 = __Block_byref_object_copy__16685;
    long long v10 = __Block_byref_object_dispose__16686;
    id v11 = 0;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __41__PXGLayout_leafSublayoutForSpriteIndex___block_invoke;
    _OWORD v5[3] = &unk_1E5DC2218;
    v5[4] = &v6;
    [(PXGLayout *)self enumerateLayoutsForSpritesInRange:a3 | 0x100000000 options:1 usingBlock:v5];
    id v3 = (id)v7[5];
    _Block_object_dispose(&v6, 8);
  }
  return v3;
}

void __41__PXGLayout_leafSublayoutForSpriteIndex___block_invoke(uint64_t a1, int a2, id obj)
{
}

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  if (a3 == -1)
  {
    id v5 = 0;
  }
  else
  {
    uint64_t v3 = *(void *)&a3;
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = __Block_byref_object_copy__16685;
    long long v15 = __Block_byref_object_dispose__16686;
    id v16 = 0;
    if ([(PXGLayout *)self numberOfSublayouts] < 1)
    {
      uint64_t v6 = [(PXGLayout *)self spriteReferenceForSpriteIndex:v3];
      uint64_t v7 = [[PXGHitTestResult alloc] initWithSpriteReference:v6 layout:self identifier:0 userData:0];
      uint64_t v8 = (void *)v12[5];
      v12[5] = (uint64_t)v7;
    }
    else
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __41__PXGLayout_hitTestResultForSpriteIndex___block_invoke;
      _OWORD v10[3] = &unk_1E5DB0978;
      void v10[4] = self;
      v10[5] = &v11;
      [(PXGLayout *)self enumerateLayoutsForSpritesInRange:v3 | 0x100000000 options:0 usingBlock:v10];
    }
    id v5 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  return v5;
}

void __41__PXGLayout_hitTestResultForSpriteIndex___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (*(void **)(a1 + 32) != a3)
  {
    uint64_t v4 = [a3 hitTestResultForSpriteIndex:a2];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

uint64_t __77__PXGLayout__enumerateSpritesInRange_transform_spriteOffset_stop_usingBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, id *a4)
{
  if (*a4)
  {
    *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 36) = [*a4 numberOfSprites];
    PXGSpriteIndexRangeIntersection();
  }
  return result;
}

- (void)copySpritesToDataStore:(id)a3
{
  id v4 = a3;
  [(PXGLayout *)self copyLayoutForSpritesInRange:[(PXGLayout *)self numberOfSprites] << 32 toSpriteDataStore:v4];
}

- ($786F7D2F4E5B3A0CBB66DF574B7D98CF)infoForSpriteAtIndex:(SEL)a3
{
  id v9 = [(PXGLayout *)self spriteDataStore];
  uint64_t v6 = [v9 infos] + 40 * a4;
  long long v7 = *(_OWORD *)(v6 + 16);
  *(_OWORD *)&retstr->float var0 = *(_OWORD *)v6;
  *(_OWORD *)&retstr->var4 = v7;
  retstr[1].float var3 = *(void *)(v6 + 32);

  return result;
}

- ($16EC8B44B1C22DB88FC318D5A7EDDAB2)geometryForSpriteAtIndex:(unsigned int)a3
{
  uint64_t v5 = v3;
  id v11 = [(PXGLayout *)self spriteDataStore];
  uint64_t v6 = (_OWORD *)([v11 geometries] + 32 * a3);
  long long v7 = v6[1];
  *uint64_t v5 = *v6;
  v5[1] = v7;

  result.var0.float var2 = v10;
  result.var0.float var1 = v9;
  result.var0.float var0 = v8;
  return result;
}

- ($738B17BD11CC339B30296C0EA03CEC2B)entityForSpriteAtIndex:(unsigned int)a3
{
  id v4 = [(PXGLayout *)self spriteDataStore];
  v5.float var0 = *(_DWORD *)([v4 entities] + 4 * a3);

  return v5;
}

- (void)removeAllTransitions
{
}

- (void)addTransition:(id)a3
{
  id v4 = a3;
  transitions = self->_transitions;
  id v8 = v4;
  if (!transitions)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v7 = self->_transitions;
    self->_transitions = v6;

    id v4 = v8;
    transitions = self->_transitions;
  }
  [(NSMutableArray *)transitions addObject:v4];
  [(PXGLayout *)self _setNeedsUpdateExternally:0];
}

- (void)removeAnimation:(id)a3
{
  [(NSMutableArray *)self->_animations removeObject:a3];
  [(PXGLayout *)self _setNeedsUpdateExternally:0];
}

- (void)addAnimation:(id)a3
{
  id v4 = a3;
  animations = self->_animations;
  id v8 = v4;
  if (!animations)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v7 = self->_animations;
    self->_animations = v6;

    id v4 = v8;
    animations = self->_animations;
  }
  [(NSMutableArray *)animations addObject:v4];
  [(PXGLayout *)self _setNeedsUpdateExternally:0];
}

- (void)setInteractions:(id)a3
{
  double v9 = (NSArray *)a3;
  id v4 = self->_interactions;
  interactions = v9;
  if (v4 != v9)
  {
    uint64_t v6 = v4;
    char v7 = [(NSArray *)v4 isEqual:v9];

    if (v7) {
      goto LABEL_5;
    }
    id v8 = (NSArray *)[(NSArray *)v9 copy];
    interactions = self->_interactions;
    self->_interactions = v8;
  }

LABEL_5:
}

- (BOOL)definesContextForPointReferences
{
  return 1;
}

- (void)removePointReference:(id)a3
{
  id v4 = a3;
  id v6 = [(PXGLayout *)self pointReferences];
  [v6 removeObject:v4];

  if (![v6 count])
  {
    pointReferences = self->_pointReferences;
    self->_pointReferences = 0;
  }
}

- (void)addPointReference:(id)a3
{
  id v5 = a3;
  id v4 = [(PXGLayout *)self pointReferences];
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    objc_storeStrong((id *)&self->_pointReferences, v4);
  }
  [v4 addObject:v5];
}

- (id)navigationObjectReferenceForLocation:(CGPoint)a3
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__16685;
  v6[4] = __Block_byref_object_dispose__16686;
  void v6[5] = 0;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  _OWORD v5[3] = 0;
  [(PXGLayout *)self referenceSize];
  [(PXGLayout *)self scrollableAxis];
  PXSizeValueForAxis();
}

void __50__PXGLayout_navigationObjectReferenceForLocation___block_invoke(uint64_t a1, uint64_t a2, CGFloat *a3)
{
  v3.origin.double x = a3[6];
  v3.origin.double y = a3[7];
  v3.size.double width = a3[4];
  v3.size.double height = a3[5];
  CGRectContainsPoint(v3, *(CGPoint *)(a1 + 56));
  PXRectShortestDistanceToPoint();
}

void __50__PXGLayout_navigationObjectReferenceForLocation___block_invoke_2()
{
}

- (id)dropTargetObjectReferenceForLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__16685;
  id v14 = __Block_byref_object_dispose__16686;
  id v15 = 0;
  id v6 = [(PXGLayout *)self sublayoutDataStore];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _OWORD v9[2] = __50__PXGLayout_dropTargetObjectReferenceForLocation___block_invoke;
  v9[3] = &unk_1E5DB08D8;
  *(CGFloat *)&v9[6] = x;
  *(CGFloat *)&v9[7] = y;
  void v9[4] = self;
  v9[5] = &v10;
  [v6 enumerateSublayoutsUsingBlock:v9];

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __50__PXGLayout_dropTargetObjectReferenceForLocation___block_invoke(double *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v6 = *((void *)a1 + 4);
  double v7 = a1[6];
  double v8 = a1[7];
  id v9 = a3;
  objc_msgSend(v9, "convertPoint:fromLayout:", v6, v7, v8);
  uint64_t v10 = objc_msgSend(v9, "dropTargetObjectReferenceForLocation:");

  uint64_t v11 = *(void *)(*((void *)a1 + 5) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  if (*(void *)(*(void *)(*((void *)a1 + 5) + 8) + 40)) {
    *a4 = 1;
  }
}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)allowsObjectReferenceSpriteIndexLookup
{
  return [(PXGLayout *)self version] > 0;
}

- (int64_t)anchoredSublayoutIndex
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  CGRect v3 = [(PXGLayout *)self activeAnchor];
  if (!v3)
  {
    id v4 = [(PXGLayout *)self superlayout];
    CGRect v3 = [v4 activeAnchor];
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__PXGLayout_anchoredSublayoutIndex__block_invoke;
  v7[3] = &unk_1E5DB6E30;
  void v7[4] = self;
  v7[5] = &v8;
  [v3 enumerateAllSpriteReferencesUsingBlock:v7];
  int64_t v5 = v9[3];

  _Block_object_dispose(&v8, 8);
  return v5;
}

void __35__PXGLayout_anchoredSublayoutIndex__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  int v7 = objc_msgSend(*(id *)(a1 + 32), "spriteIndexForSpriteReference:options:");
  uint64_t v8 = *(void **)(a1 + 32);
  if (v7 == -1)
  {
    uint64_t v9 = [v8 sublayoutIndexForSpriteReference:v10 options:a3];
    if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v9 = objc_msgSend(v8, "sublayoutIndexForSpriteIndex:");
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;
  *a4 = 1;
LABEL_5:
}

- (BOOL)shouldFaultInContentAtAnchoredContentEdges
{
  long long v2 = [(PXGLayout *)self activeAnchor];
  char v3 = [v2 shouldFaultInContentAtAnchoredContentEdges];

  return v3;
}

- (void)markLastVisibleAreaAnchoringInformationForInvalidation
{
  self->_isLastVisibleAreaAnchoringInformationInvalidated = 1;
}

- (BOOL)canHandleVisibleRectRejection
{
  return 0;
}

void __62__PXGLayout_enumerateVisibleAnchoringSpriteIndexesUsingBlock___block_invoke_2()
{
}

- (_PXGSpriteIndexRange)convertRange:(_PXGSpriteIndexRange)a3 fromSublayout:(id)a4
{
  unsigned int location = a3.location;
  if (a4 != self)
  {
    id v7 = a4;
    uint64_t v8 = [(PXGLayout *)self spriteDataStore];
    int v9 = [v8 count];

    id v10 = [(PXGLayout *)self sublayoutDataStore];
    LODWORD(v8) = [v10 spriteIndexOriginForSublayout:v7];

    unsigned int location = a3.location + v9 + v8;
  }
  return (_PXGSpriteIndexRange)(*(void *)&a3 & 0xFFFFFFFF00000000 | location);
}

uint64_t __85__PXGLayout_applySpriteChangeDetails_countAfterChanges_initialState_modifyFullState___block_invoke_4(uint64_t a1, unsigned int a2, unsigned int a3)
{
  return [*(id *)(a1 + 32) modifySpriteDataStore:*(void *)(a1 + 40) spriteIndexRange:a2 | ((unint64_t)a3 << 32) forLayout:*(void *)(a1 + 48)];
}

uint64_t __85__PXGLayout_applySpriteChangeDetails_countAfterChanges_initialState_modifyFullState___block_invoke_5(uint64_t a1, unsigned int a2, unsigned int a3)
{
  return [*(id *)(a1 + 32) modifySpriteDataStore:*(void *)(a1 + 40) spriteIndexRange:a2 | ((unint64_t)a3 << 32) forLayout:*(void *)(a1 + 48)];
}

- (void)modifySpritesAtIndexes:(id)a3 fullState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)[objc_alloc((Class)off_1E5DA5568) initWithIncrementalChangeDetailsRemovedIndexes:0 insertedIndexes:0 movesToIndexes:0 movesFromIndexes:0 changedIndexes:v7];

  [(PXGLayout *)self applySpriteChangeDetails:v8 countAfterChanges:[(PXGLayout *)self localNumberOfSprites] initialState:0 modifyFullState:v6];
}

- (void)modifySpritesAtIndexes:(id)a3 state:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__PXGLayout_modifySpritesAtIndexes_state___block_invoke;
  v8[3] = &unk_1E5DB07E8;
  id v9 = v6;
  id v7 = v6;
  [(PXGLayout *)self modifySpritesAtIndexes:a3 fullState:v8];
}

uint64_t __42__PXGLayout_modifySpritesAtIndexes_state___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)modifySpritesInRect:(CGRect)a3 state:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  id v9 = [(PXGLayout *)self spriteDataStore];
  id v10 = objc_msgSend(v9, "spriteIndexesInRect:", x, y, width, height);

  if ([v10 count])
  {
    uint64_t v11 = [off_1E5DA5568 changeDetailsWithChangedIndexes:v10];
    [(PXGLayout *)self applySpriteChangeDetails:v11 countAfterChanges:[(PXGLayout *)self numberOfSprites] initialState:0 modifyState:v12];
  }
}

- (void)moveSpritesInRange:(_PXGSpriteIndexRange)a3 toRange:(_PXGSpriteIndexRange)a4
{
  if (a3.length)
  {
    objc_msgSend(off_1E5DA5568, "changeDetailsWithMovedFromIndexRange:toIndexRange:", a3.location, a3.length, a4.location, a4.length);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(PXGLayout *)self applySpriteChangeDetails:v6 countAfterChanges:[(PXGLayout *)self localNumberOfSprites] initialState:0 modifyState:0];
  }
}

- (void)removeSpritesAtIndexes:(id)a3
{
  id v4 = a3;
  id v7 = (id)[objc_alloc((Class)off_1E5DA5568) initWithIncrementalChangeDetailsRemovedIndexes:v4 insertedIndexes:0 movesToIndexes:0 movesFromIndexes:0 changedIndexes:0];
  unsigned int v5 = [(PXGLayout *)self localNumberOfSprites];
  int v6 = [v4 count];

  [(PXGLayout *)self applySpriteChangeDetails:v7 countAfterChanges:v5 - v6 initialState:0 modifyState:0];
}

- (void)removeSpritesInRange:(_PXGSpriteIndexRange)a3
{
  unsigned int length = a3.length;
  if (a3.length)
  {
    objc_msgSend(off_1E5DA5568, "changeDetailsWithRemovedIndexRange:", a3.location, a3.length);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(PXGLayout *)self applySpriteChangeDetails:v5 countAfterChanges:[(PXGLayout *)self localNumberOfSprites] - length initialState:0 modifyState:0];
  }
}

- (void)addSpritesAtIndexes:(id)a3 initialState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = (id)[objc_alloc((Class)off_1E5DA5568) initWithIncrementalChangeDetailsRemovedIndexes:0 insertedIndexes:v7 movesToIndexes:0 movesFromIndexes:0 changedIndexes:0];
  unsigned int v8 = [(PXGLayout *)self localNumberOfSprites];
  int v9 = [v7 count];

  [(PXGLayout *)self applySpriteChangeDetails:v10 countAfterChanges:v8 + v9 initialState:v6 modifyState:0];
}

- (void)performRepeatedSublayoutsUpdate:(id)a3
{
  ++self->_numberOfRepeatedSublayoutUpdatesInUpdatePass;
  char v3 = (void (**)(void))a3;
  kdebug_trace();
  v3[2](v3);

  kdebug_trace();
}

- (void)didChangeSublayoutOrigins
{
  id v2 = [(PXGLayout *)self superlayout];
  [v2 didChangeSublayoutOrigins];
}

- (void)insertSublayoutProvider:(id)a3 atIndexes:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__PXGLayout_insertSublayoutProvider_atIndexes___block_invoke;
  v8[3] = &unk_1E5DB0770;
  void v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a4 enumerateRangesUsingBlock:v8];
}

uint64_t __47__PXGLayout_insertSublayoutProvider_atIndexes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "insertSublayoutProvider:inRange:", *(void *)(a1 + 40), a2, a3);
}

- (void)insertSublayoutProvider:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  [(PXGLayout *)self invalidateVersion];
  [(PXGLayout *)self _ensureSublayoutDataStore];
  id v8 = [(PXGLayout *)self sublayoutDataStore];
  objc_msgSend(v8, "insertSublayoutProvider:inRange:", v7, location, length);
}

- (void)willRemoveSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = [v9 superlayout];

  if (v10 != self)
  {
    long long v17 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v18 = [v9 superlayout];
    [v17 handleFailureInMethod:a2, self, @"PXGLayout.m", 1309, @"unexpected superlayout of removed sublayout (sublayout=%@, superlayout=%@, self=%@)", v9, v18, self object file lineNumber description];
  }
  [v9 _recursivelyResetHiddenSpriteIndexes];
  [v9 setSuperlayout:0];
  [v9 setAxNextResponder:0];
  [v9 setEntityManager:0];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v11 = [v9 interactions];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        [v16 setScrollViewController:0];
        [v16 setView:0];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  self->_numberOfDescendantAnchors -= [v9 numberOfDescendantAnchors];
  [(NSMutableSet *)self->_sublayoutsExpectedToBeUpdatedInUpdatePass removeObject:v9];
  [(PXGLayout *)self axRemoveSubgroupForSublayout:v9 atIndex:a4 flags:a5];
}

- (void)willFaultOutSublayout:(id)a3 atIndex:(int64_t)a4
{
  id v7 = a3;
  id v6 = objc_msgSend(off_1E5DA5568, "changeDetailsWithRemovedIndexRange:", 0, objc_msgSend(v7, "numberOfSprites"));
  [(PXGLayout *)self sublayout:v7 didApplySpriteChangeDetails:v6 fromDescendentSublayout:v7];

  [(PXGLayout *)self willRemoveSublayout:v7 atIndex:a4 flags:1];
}

- (void)didFaultInSublayout:(id)a3 atIndex:(int64_t)a4 fromEstimatedContentSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v10 = a3;
  objc_msgSend(v10, "setEstimatedContentSize:", width, height);
  [(PXGLayout *)self _willAddSublayout:v10];
  id v9 = objc_msgSend(off_1E5DA5568, "changeDetailsWithInsertedIndexRange:", 0, objc_msgSend(v10, "numberOfSprites"));
  [(PXGLayout *)self sublayout:v10 didApplySpriteChangeDetails:v9 fromDescendentSublayout:v10];

  [(PXGLayout *)self didAddSublayout:v10 atIndex:a4 flags:1];
}

- (void)didApplySublayoutChangeDetails:(id)a3 axAdjustedSubgroupChangeDetails:(id)a4 countAfterChanges:(int64_t)a5
{
  id v6 = a4;
  id v7 = [(PXGLayout *)self axGroup];
  [v7 updateSubgroupsWithChangeDetails:v6];
}

- (void)applySublayoutChangeDetails:(id)a3 countAfterChanges:(int64_t)a4 sublayoutProvider:(id)a5
{
  aBlock[21] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = [(PXGLayout *)self sublayoutDataStore];
  uint64_t v12 = [v11 count];
  if ([v9 hasIncrementalChanges])
  {
    uint64_t v13 = [v9 insertedIndexes];
    uint64_t v14 = [v13 count] + v12;
    id v15 = [v9 removedIndexes];
    uint64_t v16 = v14 - [v15 count];

    if (v16 != a4)
    {
      uint64_t v37 = [MEMORY[0x1E4F28B00] currentHandler];
      [v37 handleFailureInMethod:a2, self, @"PXGLayout.m", 1199, @"Invalid parameter not satisfying: %@", @"countBeforeChange + sublayoutChangeDetails.insertedIndexes.count - sublayoutChangeDetails.removedIndexes.count == countAfterChanges" object file lineNumber description];
    }
    long long v17 = [v9 removedIndexes];
    [(PXGLayout *)self removeSublayoutsAtIndexes:v17];

    uint64_t v18 = [v9 insertedIndexes];
    [(PXGLayout *)self insertSublayoutProvider:v10 atIndexes:v18];

    if ([v9 hasMoves])
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __77__PXGLayout_applySublayoutChangeDetails_countAfterChanges_sublayoutProvider___block_invoke;
      aBlock[3] = &unk_1E5DD2988;
      aBlock[4] = self;
      SEL v19 = a2;
      long long v20 = (char *)_Block_copy(aBlock);
      long long v21 = (void (**)(char *))(v20 + 16);
      long long v22 = (*((void (**)(void))v20 + 2))();
      uint64_t v23 = [v9 movesFromIndexes];
      uint64_t v24 = [v9 movesToIndexes];
      [v11 moveSublayoutsFromIndexes:v23 toIndexes:v24];

      long long v25 = v20;
      SEL v26 = v19;
      uint64_t v27 = (*v21)(v25);
      id v28 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __77__PXGLayout_applySublayoutChangeDetails_countAfterChanges_sublayoutProvider___block_invoke_3;
      v39[3] = &unk_1E5DB0748;
      v39[4] = self;
      v39[5] = v22;
      v39[6] = v27;
      id v30 = v28;
      v39[7] = v30;
      v39[9] = v26;
      id v31 = v29;
      v39[8] = v31;
      [v9 enumerateMovedIndexesUsingBlock:v39];
      uint64_t v32 = [v31 count];
      if (v32 != [v30 count])
      {
        long long v38 = [MEMORY[0x1E4F28B00] currentHandler];
        [v38 handleFailureInMethod:v26 object:self file:@"PXGLayout.m" lineNumber:1239 description:@"Count mismatch"];
      }
      [v31 count];
      PXCreateMutableIntegerArrayRef();
    }
    id v33 = objc_alloc((Class)off_1E5DA5568);
    CGFloat v34 = [v9 insertedIndexes];
    CGFloat v35 = [v9 movesToIndexes];
    id v36 = objc_msgSend(v33, "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", 0, v34, v35, objc_msgSend(v9, "movesFromIndexes"), 0);
  }
  else
  {
    -[PXGLayout removeSublayoutsInRange:](self, "removeSublayoutsInRange:", 0, v12);
    -[PXGLayout insertSublayoutProvider:inRange:](self, "insertSublayoutProvider:inRange:", v10, 0, a4);
    id v36 = objc_msgSend(off_1E5DA5568, "changeDetailsWithInsertedIndexRange:", 0, a4);
  }
  [(PXGLayout *)self didApplySublayoutChangeDetails:v9 axAdjustedSubgroupChangeDetails:v36 countAfterChanges:a4];
}

id __77__PXGLayout_applySublayoutChangeDetails_countAfterChanges_sublayoutProvider___block_invoke(uint64_t a1)
{
  v13[0] = 0;
  v13[1] = v13;
  void v13[2] = 0x2020000000;
  v13[3] = 0;
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  char v3 = [*(id *)(a1 + 32) sublayoutDataStore];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __77__PXGLayout_applySublayoutChangeDetails_countAfterChanges_sublayoutProvider___block_invoke_2;
  id v10 = &unk_1E5DBD708;
  id v4 = v2;
  id v11 = v4;
  uint64_t v12 = v13;
  [v3 enumerateSublayoutsUsingBlock:&v7];

  id v5 = objc_msgSend(v4, "copy", v7, v8, v9, v10);
  _Block_object_dispose(v13, 8);
  return v5;
}

void __77__PXGLayout_applySublayoutChangeDetails_countAfterChanges_sublayoutProvider___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v18 = [*(id *)(a1 + 32) sublayoutAtIndex:a3 loadIfNeeded:0];
  uint64_t v6 = [v18 numberOfSprites];
  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v8 = [NSNumber numberWithUnsignedLong:a2];
  id v9 = [v7 objectForKeyedSubscript:v8];
  unint64_t v10 = [v9 integerValue];

  id v11 = *(void **)(a1 + 48);
  uint64_t v12 = [NSNumber numberWithUnsignedLong:a3];
  uint64_t v13 = [v11 objectForKeyedSubscript:v12];
  uint64_t v14 = [v13 integerValue];

  if (objc_msgSend(*(id *)(a1 + 56), "containsIndexesInRange:", v14, v6))
  {
    long long v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:*(void *)(a1 + 72) object:*(void *)(a1 + 32) file:@"PXGLayout.m" lineNumber:1232 description:@"Trying to move to the same indexes multiple times"];
  }
  objc_msgSend(*(id *)(a1 + 56), "addIndexesInRange:", v14, v6);
  if (v10 < v10 + v6)
  {
    do
    {
      id v15 = *(void **)(a1 + 64);
      uint64_t v16 = [NSNumber numberWithInteger:v10];
      [v15 addObject:v16];

      ++v10;
      --v6;
    }
    while (v6);
  }
}

void __77__PXGLayout_applySublayoutChangeDetails_countAfterChanges_sublayoutProvider___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v5 = [a3 numberOfSprites];
  uint64_t v6 = [NSNumber numberWithInteger:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = [NSNumber numberWithInteger:a2];
  [v7 setObject:v6 forKeyedSubscript:v8];

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v5;
}

uint64_t __39__PXGLayout_removeSublayoutsAtIndexes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeSublayoutsInRange:", a2, a3);
}

- (void)removeSublayoutsInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  [(PXGLayout *)self invalidateVersion];
  uint64_t v6 = [(PXGLayout *)self sublayoutDataStore];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__PXGLayout_removeSublayoutsInRange___block_invoke;
  v7[3] = &unk_1E5DB0670;
  void v7[4] = self;
  objc_msgSend(v6, "enumerateSublayoutsInRange:options:usingBlock:", location, length, 2, v7);
  objc_msgSend(v6, "removeSublayoutsInRange:", location, length);
}

void __37__PXGLayout_removeSublayoutsInRange___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v5 = *(void **)(a1 + 32);
  id v7 = a3;
  uint64_t v6 = objc_msgSend(off_1E5DA5568, "changeDetailsWithRemovedIndexRange:", 0, objc_msgSend(v7, "numberOfSprites"));
  [v5 sublayout:v7 didApplySpriteChangeDetails:v6 fromDescendentSublayout:v7];

  [*(id *)(a1 + 32) willRemoveSublayout:v7 atIndex:a2 flags:0];
}

- (void)removeSublayoutAtIndex:(int64_t)a3
{
}

- (int64_t)indexOfSublayout:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(PXGLayout *)self sublayoutDataStore];
  int64_t v6 = [v5 indexOfSublayout:v4];

  return v6;
}

- (void)_invalidateStyleOfSpritesWithIndexes:(id)a3
{
  id v15 = a3;
  uint64_t v5 = [v15 count];
  int64_t v6 = v15;
  if (v5)
  {
    unint64_t v7 = [v15 lastIndex];
    if (v7 >= [(PXGLayout *)self localNumberOfSprites])
    {
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, self, @"PXGLayout.m", 1117, @"Invalid parameter not satisfying: %@", @"indexSet.lastIndex < self.localNumberOfSprites" object file lineNumber description];
    }
    uint64_t v8 = (void *)[v15 mutableCopy];
    id v9 = v8;
    if (self->_spriteIndexesWithInvalidatedStyle) {
      objc_msgSend(v8, "addIndexes:");
    }
    objc_storeStrong((id *)&self->_spriteIndexesWithInvalidatedStyle, v9);
    if ([(PXGLayout *)self isUpdatingSpriteStyling]) {
      goto LABEL_13;
    }
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_12:
        self->_updateFlags.unint64_t needsUpdate = needsUpdate | 1;
LABEL_13:

        int64_t v6 = v15;
        goto LABEL_14;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      self->_updateFlags.unint64_t needsUpdate = 1;
      if (!willPerformUpdate) {
        [(PXGLayout *)self setNeedsUpdate];
      }
      goto LABEL_13;
    }
    if (self->_updateFlags.updated)
    {
      uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v14 = [NSString stringWithUTF8String:"-[PXGLayout _invalidateStyleOfSpritesWithIndexes:]"];
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"PXGLayout.m", 1125, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_12;
  }
LABEL_14:
}

- (void)setLocalHiddenSpriteIndexes:(id)a3
{
  unint64_t v10 = (NSIndexSet *)a3;
  id v4 = self->_localHiddenSpriteIndexes;
  if (v4 == v10)
  {
  }
  else
  {
    uint64_t v5 = v4;
    char v6 = [(NSIndexSet *)v4 isEqual:v10];

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = [(NSIndexSet *)self->_localHiddenSpriteIndexes count];
      uint64_t v8 = (NSIndexSet *)[(NSIndexSet *)v10 copy];
      localHiddenSpriteIndexes = self->_localHiddenSpriteIndexes;
      self->_localHiddenSpriteIndexes = v8;

      if (v7 > 0 || [(NSIndexSet *)v10 count]) {
        [(PXGLayout *)self localHiddenSpriteIndexesDidChange];
      }
    }
  }
}

- (void)_addHiddenSpriteIndexes:(id)a3
{
  id v7 = a3;
  NSUInteger v4 = [(NSIndexSet *)self->_localHiddenSpriteIndexes count];
  localHiddenSpriteIndexes = self->_localHiddenSpriteIndexes;
  if (localHiddenSpriteIndexes)
  {
    char v6 = (void *)[(NSIndexSet *)localHiddenSpriteIndexes mutableCopy];
    [v6 addIndexes:v7];
  }
  else
  {
    char v6 = (void *)[v7 copy];
  }
  [(PXGLayout *)self setLocalHiddenSpriteIndexes:v6];

  if ([(NSIndexSet *)self->_localHiddenSpriteIndexes count] != v4) {
    [(PXGLayout *)self _invalidateStyleOfSpritesWithIndexes:v7];
  }
}

- (void)_recursivelyResetHiddenSpriteIndexes
{
}

uint64_t __49__PXGLayout__recursivelyResetHiddenSpriteIndexes__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _resetHiddenSpriteIndexes];
}

- (void)_resetHiddenSpriteIndexes
{
  if ([(NSIndexSet *)self->_localHiddenSpriteIndexes count])
  {
    [(PXGLayout *)self _invalidateStyleOfSpritesWithIndexes:self->_localHiddenSpriteIndexes];
    [(PXGLayout *)self localHiddenSpriteIndexesDidChange];
  }
  [(PXGLayout *)self setLocalHiddenSpriteIndexes:0];
}

- (void)_propagateHiddenSpriteIndexes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXGLayout *)self hiddenSpriteIndexes];
  char v6 = (void *)[v5 mutableCopy];
  [v6 removeIndexes:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _OWORD v9[2] = __43__PXGLayout__propagateHiddenSpriteIndexes___block_invoke;
  v9[3] = &unk_1E5DCD248;
  void v9[4] = self;
  [v6 enumerateRangesUsingBlock:v9];
  id v7 = (void *)[v4 mutableCopy];

  [v7 removeIndexes:v5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__PXGLayout__propagateHiddenSpriteIndexes___block_invoke_3;
  v8[3] = &unk_1E5DCD248;
  void v8[4] = self;
  [v7 enumerateRangesUsingBlock:v8];
}

uint64_t __43__PXGLayout__propagateHiddenSpriteIndexes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = a3;
  unsigned int v4 = a2;
  unint64_t v6 = a2 + a3;
  uint64_t result = [*(id *)(a1 + 32) numberOfSprites];
  if (v6 <= result)
  {
    uint64_t v8 = *(void **)(a1 + 32);
    return [v8 enumerateLayoutsForSpritesInRange:v4 | ((unint64_t)v3 << 32) options:1 usingBlock:&__block_literal_global_99];
  }
  return result;
}

uint64_t __43__PXGLayout__propagateHiddenSpriteIndexes___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = a3;
  unsigned int v4 = a2;
  unint64_t v6 = a2 + a3;
  uint64_t result = [*(id *)(a1 + 32) numberOfSprites];
  if (v6 <= result)
  {
    uint64_t v8 = *(void **)(a1 + 32);
    return [v8 enumerateLayoutsForSpritesInRange:v4 | ((unint64_t)v3 << 32) options:1 usingBlock:&__block_literal_global_101];
  }
  return result;
}

void __43__PXGLayout__propagateHiddenSpriteIndexes___block_invoke_4(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v3 = HIDWORD(a2);
  uint64_t v4 = a2;
  uint64_t v5 = (void *)MEMORY[0x1E4F28D60];
  id v6 = a3;
  objc_msgSend(v5, "indexSetWithIndexesInRange:", v4, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v6 _addHiddenSpriteIndexes:v7];
}

uint64_t __43__PXGLayout__propagateHiddenSpriteIndexes___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 _resetHiddenSpriteIndexes];
}

- (void)hideSpritesForObjectReferences:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PXGLayout *)self superlayout];

  if (v5) {
    PXAssertGetLog();
  }
  id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v21;
    do
    {
      uint64_t v13 = 0;
      uint64_t v14 = v11;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * v13);
        id v19 = 0;
        uint64_t v16 = [(PXGLayout *)self spriteIndexForObjectReference:v15 options:0 updatedObjectReference:&v19];
        id v11 = v19;

        if (v16 != -1)
        {
          long long v17 = [(PXGLayout *)self spriteReferenceForSpriteIndex:v16 objectReference:v11];
          [(NSMutableArray *)v6 addObject:v17];
          [v7 addIndex:v16];
        }
        ++v13;
        uint64_t v14 = v11;
      }
      while (v10 != v13);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }
  else
  {
    id v11 = 0;
  }

  spriteReferencesForHiddenSprites = self->_spriteReferencesForHiddenSprites;
  self->_spriteReferencesForHiddenSprites = v6;

  [(PXGLayout *)self _propagateHiddenSpriteIndexes:v7];
}

- (void)setHiddenSpriteIndexes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXGLayout *)self superlayout];

  if (v5) {
    PXAssertGetLog();
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __36__PXGLayout_setHiddenSpriteIndexes___block_invoke;
  uint64_t v13 = &unk_1E5DD1558;
  uint64_t v14 = self;
  id v7 = (NSMutableArray *)v6;
  uint64_t v15 = v7;
  [v4 enumerateIndexesUsingBlock:&v10];
  spriteReferencesForHiddenSprites = self->_spriteReferencesForHiddenSprites;
  self->_spriteReferencesForHiddenSprites = v7;
  uint64_t v9 = v7;

  -[PXGLayout _propagateHiddenSpriteIndexes:](self, "_propagateHiddenSpriteIndexes:", v4, v10, v11, v12, v13, v14);
}

void __36__PXGLayout_setHiddenSpriteIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 != -1)
  {
    id v4 = [*(id *)(a1 + 32) spriteReferenceForSpriteIndex:a2];
    [*(id *)(a1 + 40) addObject:v4];
  }
}

- (NSIndexSet)hiddenSpriteIndexes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  uint64_t v4 = [(PXGLayout *)self numberOfSprites];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __32__PXGLayout_hiddenSpriteIndexes__block_invoke;
  uint64_t v13 = &unk_1E5DB0700;
  uint64_t v5 = v4 << 32;
  uint64_t v14 = self;
  id v15 = v3;
  id v6 = v3;
  [(PXGLayout *)self enumerateLayoutsForSpritesInRange:v5 options:1 usingBlock:&v10];
  id v7 = objc_alloc(MEMORY[0x1E4F28D60]);
  id v8 = objc_msgSend(v7, "initWithIndexSet:", v6, v10, v11, v12, v13, v14);

  return (NSIndexSet *)v8;
}

void __32__PXGLayout_hiddenSpriteIndexes__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (*(id *)(a1 + 32) == v4)
  {
    [*(id *)(a1 + 40) addIndexes:*((void *)v4 + 53)];
  }
  else
  {
    id v6 = (void *)*((void *)v4 + 53);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __32__PXGLayout_hiddenSpriteIndexes__block_invoke_2;
    _OWORD v10[3] = &unk_1E5DB06D8;
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 32);
    id v11 = v7;
    uint64_t v12 = v8;
    id v13 = v5;
    id v9 = v6;
    [v9 enumerateRangesUsingBlock:v10];
  }
}

uint64_t __32__PXGLayout_hiddenSpriteIndexes__block_invoke_2(uint64_t a1, unsigned int a2, unsigned int a3)
{
  id v3 = *(void **)(a1 + 32);
  unint64_t v4 = [*(id *)(a1 + 40) convertSpriteIndexRange:a2 | ((unint64_t)a3 << 32) fromDescendantLayout:*(void *)(a1 + 48)];
  return objc_msgSend(v3, "addIndexesInRange:", v4, HIDWORD(v4));
}

- (void)setClippingRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(self->_clippingRect, a3))
  {
    self->_clippingRect.origin.CGFloat x = x;
    self->_clippingRect.origin.CGFloat y = y;
    self->_clippingRect.size.CGFloat width = width;
    self->_clippingRect.size.CGFloat height = height;
    [(PXGLayout *)self _setNeedsUpdateExternally:0];
  }
}

- (void)containingScrollViewDidScroll:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v5 = [(PXGLayout *)self sublayoutDataStore];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__PXGLayout_containingScrollViewDidScroll___block_invoke;
  v6[3] = &__block_descriptor_48_e26_v32__0q8__PXGLayout_16_B24l;
  *(CGFloat *)&v6[4] = x;
  *(CGFloat *)&void v6[5] = y;
  [v5 enumerateSublayoutsUsingBlock:v6];
}

uint64_t __43__PXGLayout_containingScrollViewDidScroll___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "containingScrollViewDidScroll:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

uint64_t __28__PXGLayout_setLayoutQueue___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setLayoutQueue:*(void *)(a1 + 32)];
}

- (id)viewForSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(PXGLayout *)self viewDelegate];
  id v6 = [v5 layout:self viewForSpriteIndex:v3];

  return v6;
}

- (void)updateAsRootIfNeeded
{
  unint64_t v4 = [(PXGLayout *)self rootLayout];

  if (v4 != self)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PXGLayout.m", 722, @"Invalid parameter not satisfying: %@", @"self == self.rootLayout" object file lineNumber description];
  }
  if (PXGLayoutCanInstallLayoutCompletionBlock)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXGLayout.m", 723, @"Invalid parameter not satisfying: %@", @"PXGLayoutCanInstallLayoutCompletionBlock == NO" object file lineNumber description];
  }
  PXGLayoutCanInstallLayoutCompletionBlock = 1;
  [(PXGLayout *)self updateIfNeeded];
  PXGLayoutCanInstallLayoutCompletionBlock = 0;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v9 = _Block_copy((const void *)PXGLayoutLayoutCompletionBlock);
    uint64_t v5 = (void *)PXGLayoutLayoutCompletionBlock;
    PXGLayoutLayoutCompletionBlock = 0;

    id v6 = v9;
    if (v9)
    {
      (*((void (**)(void *))v9 + 2))(v9);
      id v6 = v9;
    }
  }
}

- (void)installLayoutCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXGLayout *)self layoutQueue];
  dispatch_assert_queue_V2(v5);

  if (!PXGLayoutCanInstallLayoutCompletionBlock) {
    PXAssertGetLog();
  }
  if (PXGLayoutLayoutCompletionBlock)
  {
    id v6 = _Block_copy((const void *)PXGLayoutLayoutCompletionBlock);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __42__PXGLayout_installLayoutCompletionBlock___block_invoke;
    v11[3] = &unk_1E5DCC5D0;
    id v12 = v6;
    id v13 = v4;
    id v7 = v6;
    uint64_t v8 = [v11 copy];
    id v9 = (void *)PXGLayoutLayoutCompletionBlock;
    PXGLayoutLayoutCompletionBlock = v8;
  }
  else
  {
    uint64_t v10 = [v4 copy];
    id v7 = (id)PXGLayoutLayoutCompletionBlock;
    PXGLayoutLayoutCompletionBlock = v10;
  }
}

uint64_t __42__PXGLayout_installLayoutCompletionBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)performChangesWithLocalUpdate:(id)a3
{
  BOOL isPerformingWithLocalUpdate = self->_isPerformingWithLocalUpdate;
  self->_BOOL isPerformingWithLocalUpdate = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_BOOL isPerformingWithLocalUpdate = isPerformingWithLocalUpdate;
  if (!isPerformingWithLocalUpdate)
  {
    self->_unint64_t needsUpdate = 1;
    [(PXGLayout *)self updateIfNeeded];
  }
}

- (BOOL)isUpdatingSpriteStyling
{
  return self->_isUpdatingSpriteStyling;
}

- (void)updateStylingForSpritesAtIndexes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXGLayout *)self hiddenSpriteIndexes];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__PXGLayout_updateStylingForSpritesAtIndexes___block_invoke;
  v8[3] = &unk_1E5DD0F30;
  void v8[4] = self;
  id v9 = v4;
  id v10 = v5;
  id v6 = v5;
  id v7 = v4;
  [(PXGLayout *)self performSpriteStylingUpdate:v8];
}

void __46__PXGLayout_updateStylingForSpritesAtIndexes___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__PXGLayout_updateStylingForSpritesAtIndexes___block_invoke_2;
  v3[3] = &unk_1E5DBA978;
  id v4 = *(id *)(a1 + 48);
  [v1 modifySpritesAtIndexes:v2 state:v3];
}

uint64_t __46__PXGLayout_updateStylingForSpritesAtIndexes___block_invoke_2(uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    uint64_t v6 = result;
    uint64_t v7 = a2;
    do
    {
      *(_DWORD *)(a4 + 52) = 0;
      uint64_t result = [*(id *)(v6 + 32) containsIndex:v7];
      if (result) {
        float v8 = 0.00000001;
      }
      else {
        float v8 = 1.0;
      }
      *(float *)a4 = v8;
      a4 += 160;
      ++v7;
      --v4;
    }
    while (v4);
  }
  return result;
}

void __22__PXGLayout_didUpdate__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA80] set];
  v1 = (void *)didUpdate_reportedClasses;
  didUpdate_reportedClasses = v0;
}

- (BOOL)allowsDanglingUpdatesAssertions
{
  uint64_t v2 = [off_1E5DA9658 sharedInstance];
  char v3 = [v2 enableLayoutDanglingUpdatesAssertions];

  return v3;
}

- (UICoordinateSpace)coordinateSpace
{
  char v3 = [(PXGLayout *)self scrollDelegate];
  unint64_t v4 = [v3 contentCoordinateSpaceForLayout:self];

  return (UICoordinateSpace *)v4;
}

- (unsigned)convertSpriteIndex:(unsigned int)a3 fromLayout:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = [(PXGLayout *)self ancestorSharedWithLayout:v6];
  float v8 = v7;
  if (v7) {
    unsigned int v9 = objc_msgSend(v7, "convertSpriteIndex:toDescendantLayout:", objc_msgSend(v7, "convertSpriteIndex:fromDescendantLayout:", v4, v6), self);
  }
  else {
    unsigned int v9 = -1;
  }

  return v9;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromDescendantLayout:(id)a4
{
  -[PXGLayout convertRect:fromDescendantLayout:](self, "convertRect:fromDescendantLayout:", a4, a3.x, a3.y, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double x = v10.origin.x;
  double y = v10.origin.y;
  BOOL IsNull = CGRectIsNull(v10);
  double v7 = *(double *)off_1E5DAB000;
  double v8 = *((double *)off_1E5DAB000 + 1);
  if (!IsNull)
  {
    double v8 = y;
    double v7 = x;
  }
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 toDescendantLayout:(id)a4
{
  -[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", a4, a3.x, a3.y, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double x = v10.origin.x;
  double y = v10.origin.y;
  BOOL IsNull = CGRectIsNull(v10);
  double v7 = *(double *)off_1E5DAB000;
  double v8 = *((double *)off_1E5DAB000 + 1);
  if (!IsNull)
  {
    double v8 = y;
    double v7 = x;
  }
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromLayout:(id)a4
{
  -[PXGLayout convertRect:fromLayout:](self, "convertRect:fromLayout:", a4, a3.x, a3.y, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double x = v10.origin.x;
  double y = v10.origin.y;
  BOOL IsNull = CGRectIsNull(v10);
  double v7 = *(double *)off_1E5DAB000;
  double v8 = *((double *)off_1E5DAB000 + 1);
  if (!IsNull)
  {
    double v7 = x;
    double v8 = y;
  }
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (id)convertSpriteIndexes:(id)a3 fromDescendantLayout:(id)a4
{
  id v7 = a3;
  double v8 = (PXGLayout *)a4;
  unsigned int v9 = v8;
  if (v8)
  {
    CGRect v10 = v8;
    if (v10 != self)
    {
      id v11 = v10;
      do
      {
        id v12 = v11;
        id v11 = [(PXGLayout *)v11 superlayout];
        id v13 = [(PXGLayout *)v11 spriteDataStore];
        int v14 = [v13 count];
        id v15 = [(PXGLayout *)v11 sublayoutDataStore];
        int v16 = [v15 spriteIndexOriginForSublayout:v12];
      }
      while (v11 != self && v11);
      uint64_t v17 = (v16 + v14);
      goto LABEL_7;
    }
  }
  else
  {
    long long v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PXGLayout.m", 407, @"Invalid parameter not satisfying: %@", @"descendantLayout" object file lineNumber description];

    if (self)
    {
      uint64_t v17 = 0;
      id v11 = 0;
LABEL_7:
      id v18 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __55__PXGLayout_convertSpriteIndexes_fromDescendantLayout___block_invoke;
      v22[3] = &unk_1E5DC80D8;
      uint64_t v24 = v17;
      id v19 = v18;
      id v23 = v19;
      [v7 enumerateRangesUsingBlock:v22];

      goto LABEL_11;
    }
  }
  id v19 = v7;
  id v11 = v9;
LABEL_11:

  return v19;
}

uint64_t __55__PXGLayout_convertSpriteIndexes_fromDescendantLayout___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndexesInRange:", *(void *)(a1 + 40) + a2, a3);
}

- (UIEdgeInsets)flexibleRegionInsets
{
  double v2 = *(double *)off_1E5DAAF10;
  double v3 = *((double *)off_1E5DAAF10 + 1);
  double v4 = *((double *)off_1E5DAAF10 + 2);
  double v5 = *((double *)off_1E5DAAF10 + 3);
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (CGRect)bounds
{
  [(PXGLayout *)self contentSize];
  double v3 = v2;
  double v5 = v4;
  double v6 = 0.0;
  double v7 = 0.0;
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v3;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (unsigned)childrenNumberOfSprites
{
  unsigned int v3 = [(PXGLayout *)self numberOfSprites];
  return v3 - [(PXGLayout *)self localNumberOfSprites];
}

- (void)_destroyModifiedSpriteDataStore
{
  [(PXGSpriteDataStore *)self->_modifiedSpriteDataStore recycle];
  modifiedSpriteDataStore = self->_modifiedSpriteDataStore;
  self->_modifiedSpriteDataStore = 0;
}

- (void)_ensureModifiedSpriteDataStore
{
  if (!self->_modifiedSpriteDataStore)
  {
    unsigned int v3 = (PXGSpriteDataStore *)[off_1E5DA6B40 newSpriteDataStore];
    modifiedSpriteDataStore = self->_modifiedSpriteDataStore;
    self->_modifiedSpriteDataStore = v3;

    double v5 = [(PXGLayout *)self spriteDataStore];
    double v6 = v5;
    if (v5)
    {
      [v5 sprites];
      double v7 = self->_modifiedSpriteDataStore;
      v8[0] = v10;
      v8[1] = v11;
      uint64_t v9 = v12;
      [(PXGSpriteDataStore *)v7 setSprites:v8];
    }
  }
}

- (void)_destroySpriteDataStore
{
  [(PXGSpriteDataStore *)self->_spriteDataStore recycle];
  spriteDataStore = self->_spriteDataStore;
  self->_spriteDataStore = 0;
}

- (void)dealloc
{
  [(PXGSpriteDataStore *)self->_spriteDataStore recycle];
  [(PXGBasicAXGroup *)self->_reusableAXGroup unloadFromParent];
  v3.receiver = self;
  v3.super_class = (Class)PXGLayout;
  [(PXGLayout *)&v3 dealloc];
}

- (PXGLayout)nextViewHostingLayout
{
  p_nextViewHostingLayout = &self->_nextViewHostingLayout;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nextViewHostingLayout);

  if (WeakRetained)
  {
    double v5 = objc_loadWeakRetained((id *)p_nextViewHostingLayout);
  }
  else
  {
    double v5 = [(PXGLayout *)self superlayout];
  }
  return (PXGLayout *)v5;
}

- (PXGItemsLayout)itemsLayout
{
  return 0;
}

- (void)enumerateSublayoutsForCreatingPointReferenceUsingBlock:(id)a3
{
  id v4 = a3;
  double v5 = [(PXGLayout *)self sublayoutDataStore];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87__PXGLayout_PXGPointReference__enumerateSublayoutsForCreatingPointReferenceUsingBlock___block_invoke;
  v7[3] = &unk_1E5DC94B0;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateSublayoutsUsingBlock:v7];
}

uint64_t __87__PXGLayout_PXGPointReference__enumerateSublayoutsForCreatingPointReferenceUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)hasPointReferences
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(PXGLayout *)self pointReferences];
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        if (*(void *)(*((void *)&v11 + 1) + 8 * i))
        {
          *((unsigned char *)v16 + 24) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (*((unsigned char *)v16 + 24))
  {
    BOOL v7 = 1;
  }
  else
  {
    id v8 = [(PXGLayout *)self sublayoutDataStore];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__PXGLayout_PXGPointReference__hasPointReferences__block_invoke;
    _OWORD v10[3] = &unk_1E5DB8BC8;
    void v10[4] = &v15;
    [v8 enumerateSublayoutsUsingBlock:v10];

    BOOL v7 = *((unsigned char *)v16 + 24) != 0;
  }
  _Block_object_dispose(&v15, 8);

  return v7;
}

uint64_t __50__PXGLayout_PXGPointReference__hasPointReferences__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 hasPointReferences];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

- (CGPoint)pointForPointReference:(id)a3
{
  id v4 = a3;
  [v4 point];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [v4 layout];

  if (v9)
  {
    if (v9 != self)
    {
      -[PXGLayout convertPoint:fromDescendantLayout:](self, "convertPoint:fromDescendantLayout:", v9, v6, v8);
      double v6 = v10;
      double v8 = v11;
    }
  }
  else
  {
    double v6 = *(double *)off_1E5DAB000;
    double v8 = *((double *)off_1E5DAB000 + 1);
  }

  double v12 = v6;
  double v13 = v8;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (id)createPointReferenceAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(PXGLayout *)self sublayoutDataStore];
  BOOL v7 = [(PXGLayout *)self definesContextForPointReferences];
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  int v16 = __Block_byref_object_copy__92653;
  uint64_t v17 = __Block_byref_object_dispose__92654;
  id v18 = 0;
  if (v7)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__PXGLayout_PXGPointReference__createPointReferenceAtPoint___block_invoke;
    v12[3] = &unk_1E5DB8B78;
    void v12[4] = &v13;
    objc_msgSend(v6, "enumerateSublayoutsAtPoint:usingBlock:", v12, x, y);
  }
  else
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v11[3] = 0x7FEFFFFFFFFFFFFFLL;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__PXGLayout_PXGPointReference__createPointReferenceAtPoint___block_invoke_2;
    _OWORD v10[3] = &unk_1E5DB8BA0;
    *(double *)&void v10[6] = x;
    *(double *)&v10[7] = y;
    void v10[4] = v11;
    void v10[5] = &v13;
    [(PXGLayout *)self enumerateSublayoutsForCreatingPointReferenceUsingBlock:v10];
    _Block_object_dispose(v11, 8);
  }
  if (v14[5])
  {
    [(PXGLayout *)self convertPoint:x toDescendantLayout:y];
    objc_msgSend((id)v14[5], "createPointReferenceAtPoint:");
    double v8 = (PXGPointReference *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v8 = -[PXGPointReference initWithPoint:layout:]([PXGPointReference alloc], "initWithPoint:layout:", self, x, y);
    [(PXGLayout *)self addPointReference:v8];
  }
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __60__PXGLayout_PXGPointReference__createPointReferenceAtPoint___block_invoke(uint64_t a1, int a2, id obj, unsigned char *a4)
{
  *a4 = 1;
}

void __60__PXGLayout_PXGPointReference__createPointReferenceAtPoint___block_invoke_2(uint64_t a1, void *a2)
{
}

- (CGRect)anchoringRectForSpriteAtIndex:(unsigned int)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v13 = *(_DWORD *)off_1E5DAAF60;
  long long v3 = *((_OWORD *)off_1E5DAAF70 + 1);
  v12[0] = *(_OWORD *)off_1E5DAAF70;
  v12[1] = v3;
  long long v4 = *((_OWORD *)off_1E5DAAF90 + 7);
  v14[6] = *((_OWORD *)off_1E5DAAF90 + 6);
  v14[7] = v4;
  long long v5 = *((_OWORD *)off_1E5DAAF90 + 9);
  v14[8] = *((_OWORD *)off_1E5DAAF90 + 8);
  v14[9] = v5;
  long long v6 = *((_OWORD *)off_1E5DAAF90 + 3);
  v14[2] = *((_OWORD *)off_1E5DAAF90 + 2);
  void v14[3] = v6;
  long long v7 = *((_OWORD *)off_1E5DAAF90 + 5);
  void v14[4] = *((_OWORD *)off_1E5DAAF90 + 4);
  void v14[5] = v7;
  long long v8 = *((_OWORD *)off_1E5DAAF90 + 1);
  v14[0] = *(_OWORD *)off_1E5DAAF90;
  v14[1] = v8;
  long long v9 = *((_OWORD *)off_1E5DAAF88 + 1);
  v10[0] = *(_OWORD *)off_1E5DAAF88;
  v10[1] = v9;
  uint64_t v11 = *((void *)off_1E5DAAF88 + 4);
  [(PXGLayout *)self copyLayoutForSpritesInRange:a3 | 0x100000000 applySpriteTransforms:0 entities:&v13 geometries:v12 styles:v14 infos:v10];
  PXRectWithCenterAndSize();
}

- (void)invalidateAllSuperlayoutAnchors
{
  double v2 = self;
  if (v2)
  {
    long long v3 = v2;
    do
    {
      long long v4 = [v3 activeAnchor];
      [v4 invalidate];

      uint64_t v5 = [v3 superlayout];

      long long v3 = (void *)v5;
    }
    while (v5);
  }
}

- (id)createAnchorWithAnchor:(id)a3
{
  return [(PXGLayout *)self _createAnchorWithAnchor:a3 resetPriority:1];
}

uint64_t __127__PXGLayout_PXGAnchor__createAnchorFromSuperlayoutWithSublayoutIndex_sublayoutPositionEdges_ignoringScrollingAnimationAnchors___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) sublayoutIndexForSpriteReference:a2 options:a3];
  if (result == *(void *)(a1 + 48))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (id)createAnchorForScrollingAnimationTowardsContentEdges:(unint64_t)a3
{
  if ((a3 & 8) != 0 && (a3 & 0xA) != 8) {
    PXAssertGetLog();
  }
  uint64_t v5 = [[PXGAnchor alloc] initWithLayout:self];
  [(PXGAnchor *)v5 setType:5];
  [(PXGAnchor *)v5 setEdges:a3];
  [(PXGLayout *)self addAnchor:v5];
  return v5;
}

- (id)createAnchorForContentEdges:(unint64_t)a3
{
  return [(PXGLayout *)self _createAnchorForContentEdges:a3 priority:1];
}

- (id)createAnchorForScrollingSpriteForSpriteReference:(id)a3 normalizedAnchorPoint:(CGPoint)a4 toVisibleLocation:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v7 = a4.y;
  double v8 = a4.x;
  v14[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v11 = [[PXGAnchor alloc] initWithLayout:self];
  [(PXGAnchor *)v11 setType:2];
  v14[0] = v10;
  double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];

  [(PXGAnchor *)v11 setSpriteReferences:v12];
  -[PXGAnchor setVisibleLocation:](v11, "setVisibleLocation:", x, y);
  -[PXGAnchor setNormalizedAnchorPoint:](v11, "setNormalizedAnchorPoint:", v8, v7);
  [(PXGLayout *)self addAnchor:v11];
  return v11;
}

- (id)createAnchorForScrollingSpriteForSpriteReference:(id)a3 toScrollPosition:(unint64_t)a4 padding:(UIEdgeInsets)a5 customOffset:(id)a6
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a6;
  if ((a4 & 0x30) != 0 && (a4 & 0x38) != 0x20 && (a4 & 0x38) != 0x10 || (a4 & 7) > 4 || (a4 & 7) == 3) {
    PXAssertGetLog();
  }
  uint64_t v15 = [[PXGAnchor alloc] initWithLayout:self];
  [(PXGAnchor *)v15 setType:2];
  id v18 = v13;
  int v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  [(PXGAnchor *)v15 setSpriteReferences:v16];

  [(PXGAnchor *)v15 setScrollPosition:a4];
  -[PXGAnchor setPadding:](v15, "setPadding:", top, left, bottom, right);
  [(PXGAnchor *)v15 setCustomOffset:v14];
  [(PXGLayout *)self addAnchor:v15];

  return v15;
}

- (id)createAnchorForScrollingSpriteForSpriteReference:(id)a3 toScrollPosition:(unint64_t)a4 padding:(UIEdgeInsets)a5
{
  return -[PXGLayout createAnchorForScrollingSpriteForSpriteReference:toScrollPosition:padding:customOffset:](self, "createAnchorForScrollingSpriteForSpriteReference:toScrollPosition:padding:customOffset:", a3, a4, 0, a5.top, a5.left, a5.bottom, a5.right);
}

- (id)createAnchorForScrollingSpriteAtIndex:(unsigned int)a3 toScrollPosition:(unint64_t)a4 padding:(UIEdgeInsets)a5
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  double v12 = __Block_byref_object_copy__106382;
  id v13 = __Block_byref_object_dispose__106383;
  id v14 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87__PXGLayout_PXGAnchor__createAnchorForScrollingSpriteAtIndex_toScrollPosition_padding___block_invoke;
  v7[3] = &unk_1E5DBA3F0;
  void v7[4] = self;
  void v7[5] = &v9;
  void v7[6] = a4;
  UIEdgeInsets v8 = a5;
  [(PXGLayout *)self enumerateLayoutsForSpritesInRange:a3 | 0x100000000 options:1 usingBlock:v7];
  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __87__PXGLayout_PXGAnchor__createAnchorForScrollingSpriteAtIndex_toScrollPosition_padding___block_invoke(uint64_t a1, uint64_t a2)
{
  long long v3 = *(void **)(a1 + 32);
  id v7 = [v3 spriteReferenceForSpriteIndex:a2];
  uint64_t v4 = objc_msgSend(v3, "createAnchorForScrollingSpriteForSpriteReference:toScrollPosition:padding:", v7, *(void *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)createAnchorForScrollingSpriteForObjectReference:(id)a3 toScrollPosition:(unint64_t)a4 padding:(UIEdgeInsets)a5
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  uint64_t v11 = [(PXGLayout *)self spriteReferenceForObjectReference:a3];
  double v12 = -[PXGLayout createAnchorForScrollingSpriteForSpriteReference:toScrollPosition:padding:](self, "createAnchorForScrollingSpriteForSpriteReference:toScrollPosition:padding:", v11, a4, top, left, bottom, right);

  return v12;
}

id __62__PXGLayout_PXGAnchor___createAnchorWithPriority_constraints___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 spriteReference];
  if (!v4)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"PXGAnchor.m", 714, @"missing sprite reference for %@", v3 object file lineNumber description];
  }
  objc_msgSend(*(id *)(a1 + 32), "anchoringRectForSpriteAtIndex:", objc_msgSend(*(id *)(a1 + 32), "spriteIndexForSpriteReference:options:", v4, 0));
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:");

  return v5;
}

- (id)createAnchorWithConstraints:(id)a3
{
  return [(PXGLayout *)self _createAnchorWithPriority:1 constraints:a3];
}

- (id)createAnchorForSpriteReferences:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _OWORD v8[2] = __56__PXGLayout_PXGAnchor__createAnchorForSpriteReferences___block_invoke;
  v8[3] = &unk_1E5DBA3A0;
  id v9 = v4;
  id v5 = v4;
  long long v6 = [(PXGLayout *)self createAnchorWithConstraints:v8];

  return v6;
}

void __56__PXGLayout_PXGAnchor__createAnchorForSpriteReferences___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
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
        objc_msgSend(v3, "keepSpriteWithReference:referencingOptions:visuallyStableForAttribute:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), 0, 1, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)createAnchorForSpriteAtIndex:(unsigned int)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(PXGLayout *)self spriteReferenceForSpriteIndex:*(void *)&a3 objectReference:0];
  v8[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  uint64_t v6 = [(PXGLayout *)self createAnchorForSpriteReferences:v5];

  return v6;
}

void __64__PXGLayout_PXGAnchor__createAnchorForVisibleAreaIgnoringEdges___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [*(id *)(a1 + 32) spriteReferenceForSpriteIndex:a2];
  [*(id *)(a1 + 40) keepSpriteWithReference:v5 referencingOptions:1 visuallyStableForAttribute:a3];
}

- (BOOL)shouldApplyItemChangeDetailsToSublayout:(id)a3
{
  return 1;
}

- (PXGDataSourceChange)currentDataSourceChange
{
  id v3 = [(PXGLayout *)self internalCurrentDataSourceChange];
  if (!v3)
  {
    id v4 = [(PXGLayout *)self superlayout];
    if (v4)
    {
      do
      {
        id v5 = v4;
        id v3 = [v4 internalCurrentDataSourceChange];
        id v4 = [v4 superlayout];
      }
      while (v4 && !v3);
    }
    else
    {
      id v3 = 0;
    }
    [(PXGLayout *)self setInternalCurrentDataSourceChange:v3];
  }
  return (PXGDataSourceChange *)v3;
}

- (PXGItemsLayout)layoutForItemChanges
{
  return 0;
}

void __157__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetailsForSingleSection_dataSourceBeforeChanges_dataSourceAfterChanges_changeMediaVersionHandler___block_invoke_5(id *a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a1[4])
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F28E60];
    id v8 = a4;
    long long v9 = [v7 indexSet];
    long long v10 = [a1[4] loadedItemsForItems:v8];

    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __157__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetailsForSingleSection_dataSourceBeforeChanges_dataSourceAfterChanges_changeMediaVersionHandler___block_invoke_6;
    id v18 = &unk_1E5DBBA08;
    uint64_t v23 = a2;
    uint64_t v24 = a3;
    id v19 = a1[5];
    id v20 = a1[6];
    id v22 = a1[7];
    id v11 = v9;
    id v21 = v11;
    [v10 enumerateIndexesUsingBlock:&v15];
    if (objc_msgSend(v11, "count", v15, v16, v17, v18))
    {
      id v12 = a1[4];
      uint64_t v13 = [v12 numberOfItems];
      uint64_t v14 = [off_1E5DA5568 changeDetailsWithChangedIndexes:v11];
      [v12 setNumberOfItems:v13 withChangeDetails:v14 changeMediaVersionHandler:&__block_literal_global_36_117881];
    }
  }
}

uint64_t __157__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetailsForSingleSection_dataSourceBeforeChanges_dataSourceAfterChanges_changeMediaVersionHandler___block_invoke_6(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 72);
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  *(void *)&long long v19 = v4;
  *((void *)&v19 + 1) = v5;
  *(void *)&long long v20 = a2;
  *((void *)&v20 + 1) = 0x7FFFFFFFFFFFFFFFLL;
  [off_1E5DA8488 indexPathAfterRevertingChanges:v6 fromIndexPath:&v19 hasIncrementalChanges:0 objectChanged:0 changedProperties:v7];
  if ((void)v21 != *(void *)off_1E5DAAED8)
  {
    char v8 = [*(id *)(a1 + 40) containsObject:*(void *)off_1E5DAAEF0];
    uint64_t v9 = *(void *)(a1 + 56);
    long long v10 = *(uint64_t (**)(uint64_t, long long *, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 16);
    long long v19 = v21;
    long long v20 = v22;
    v18[0] = v4;
    v18[1] = v5;
    v18[2] = a2;
    v18[3] = 0x7FFFFFFFFFFFFFFFLL;
    int v16 = v10(v9, &v19, v18, v11, v12, v13, v14, v15);
    if ((v8 & 1) != 0 || v16) {
      [*(id *)(a1 + 48) addIndex:a2];
    }
  }
  return [*(id *)(a1 + 40) removeAllObjects];
}

uint64_t __157__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetailsForSingleSection_dataSourceBeforeChanges_dataSourceAfterChanges_changeMediaVersionHandler___block_invoke_7()
{
  return 1;
}

uint64_t __157__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetailsForSingleSection_dataSourceBeforeChanges_dataSourceAfterChanges_changeMediaVersionHandler___block_invoke()
{
  return 0;
}

- (void)applySectionedChangeDetails:(id)a3 dataSourceBeforeChanges:(id)a4 dataSourceAfterChanges:(id)a5 sublayoutProvider:(id)a6 outChangedSections:(id *)a7 outSectionsWithItemChanges:(id *)a8 changeMediaVersionHandler:(id)a9
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a9;
  id v63 = v14;
  id v18 = [[PXGDataSourceChange alloc] initWithChangeDetails:v13 dataSourceBeforeChanges:v14 dataSourceAfterChanges:v15];
  [(PXGLayout *)self setInternalCurrentDataSourceChange:v18];

  long long v92 = 0u;
  long long v93 = 0u;
  BOOL v19 = [v13 count] == 0;
  long long v94 = 0u;
  long long v95 = 0u;
  id v20 = v13;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v92 objects:v97 count:16];
  id v67 = v16;
  float v68 = self;
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = v20;
    uint64_t v24 = *(void *)v93;
    while (2)
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v93 != v24) {
          objc_enumerationMutation(v23);
        }
        SEL v26 = [*(id *)(*((void *)&v92 + 1) + 8 * i) sectionChanges];
        int v27 = [v26 hasIncrementalChanges];

        if (!v27)
        {
          BOOL v19 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v22 = [v23 countByEnumeratingWithState:&v92 objects:v97 count:16];
      if (v22) {
        continue;
      }
      break;
    }
LABEL_11:
    id v20 = v23;
    self = v68;
  }

  id v28 = [(PXGLayout *)self sublayoutDataStore];
  uint64_t v29 = [v28 count];
  if (v17) {
    id v30 = v17;
  }
  else {
    id v30 = &__block_literal_global_117903;
  }
  id v31 = _Block_copy(v30);

  uint64_t v32 = v63;
  if (v19)
  {
    id v33 = v67;
    -[PXGLayout applySublayoutChangeDetails:countAfterChanges:sublayoutProvider:](self, "applySublayoutChangeDetails:countAfterChanges:sublayoutProvider:", 0, [v15 numberOfSections], v67);
  }
  else
  {
    uint64_t v57 = v31;
    id v66 = v28;
    id v59 = v15;
    CGFloat v34 = [MEMORY[0x1E4F28E60] indexSet];
    id v35 = [MEMORY[0x1E4F28E60] indexSet];
    id v36 = [off_1E5DA7430 indexPathSet];
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id v58 = v20;
    id obj = v20;
    uint64_t v69 = [obj countByEnumeratingWithState:&v88 objects:v96 count:16];
    if (v69)
    {
      uint64_t v70 = v29;
      uint64_t v65 = *(void *)v89;
      do
      {
        uint64_t v37 = 0;
        long long v38 = v34;
        do
        {
          if (*(void *)v89 != v65) {
            objc_enumerationMutation(obj);
          }
          uint64_t v39 = *(void **)(*((void *)&v88 + 1) + 8 * v37);
          long long v40 = [v39 sectionChanges];
          double v41 = [v40 insertedIndexes];
          uint64_t v42 = [v41 count] + v70;
          long long v43 = [v40 removedIndexes];
          uint64_t v44 = v42 - [v43 count];

          uint64_t v70 = v44;
          [(PXGLayout *)v68 applySublayoutChangeDetails:v40 countAfterChanges:v44 sublayoutProvider:v67];
          id v45 = [v40 indexSetAfterApplyingChangesToIndexSet:v38];
          CGFloat v34 = (void *)[v45 mutableCopy];

          id v46 = [v40 changedIndexes];
          [v34 addIndexes:v46];

          id v47 = [v40 indexSetAfterApplyingChangesToIndexSet:v35];
          uint64_t v48 = (void *)[v47 mutableCopy];

          double v49 = [v39 sectionsWithItemChanges];
          [v48 addIndexes:v49];

          id v50 = [v39 indexPathSetAfterApplyingChangesToIndexPathSet:v36 hasIncrementalChanges:0];
          id v51 = (void *)[v50 mutableCopy];

          id v52 = [v39 sectionsWithItemChanges];
          v81[0] = MEMORY[0x1E4F143A8];
          v81[1] = 3221225472;
          v81[2] = __205__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetails_dataSourceBeforeChanges_dataSourceAfterChanges_sublayoutProvider_outChangedSections_outSectionsWithItemChanges_changeMediaVersionHandler___block_invoke_2;
          v81[3] = &unk_1E5DBB9B8;
          id v82 = v66;
          long long v83 = v68;
          long long v84 = v39;
          id v36 = v51;
          id v85 = v36;
          id v35 = v48;
          id v86 = v35;
          id v87 = v67;
          [v52 enumerateIndexesUsingBlock:v81];

          ++v37;
          long long v38 = v34;
        }
        while (v69 != v37);
        uint64_t v69 = [obj countByEnumeratingWithState:&v88 objects:v96 count:16];
      }
      while (v69);
    }

    if (a7) {
      *a7 = (id)[v34 copy];
    }
    uint64_t v32 = v63;
    id v33 = v67;
    id v20 = v58;
    id v28 = v66;
    if (a8) {
      *a8 = (id)[v35 copy];
    }
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __205__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetails_dataSourceBeforeChanges_dataSourceAfterChanges_sublayoutProvider_outChangedSections_outSectionsWithItemChanges_changeMediaVersionHandler___block_invoke_4;
    v76[3] = &unk_1E5DBB9E0;
    id v53 = obj;
    id v77 = v53;
    long long v78 = v68;
    id v79 = v36;
    SEL v80 = a2;
    id v54 = v36;
    [v54 enumerateDataSourceIdentifiers:v76];
    id v55 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __205__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetails_dataSourceBeforeChanges_dataSourceAfterChanges_sublayoutProvider_outChangedSections_outSectionsWithItemChanges_changeMediaVersionHandler___block_invoke_5;
    v71[3] = &unk_1E5DBBA30;
    id v72 = v66;
    id v73 = v53;
    id v74 = v55;
    id v75 = v57;
    id v56 = v55;
    [v54 enumerateItemIndexSetsUsingBlock:v71];

    id v31 = v57;
    id v15 = v59;
  }
}

void __205__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetails_dataSourceBeforeChanges_dataSourceAfterChanges_sublayoutProvider_outChangedSections_outSectionsWithItemChanges_changeMediaVersionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) sublayoutAtIndex:a2];
  uint64_t v5 = [v4 layoutForItemChanges];
  if (v5 && [*(id *)(a1 + 40) shouldApplyItemChangeDetailsToSublayout:v4])
  {
    uint64_t v6 = [*(id *)(a1 + 48) itemChangesInSection:a2];
    if ([v6 hasIncrementalChanges])
    {
      uint64_t v7 = [v5 numberOfItems];
      char v8 = [v6 insertedIndexes];
      uint64_t v9 = [v8 count] + v7;
      long long v10 = [v6 removedIndexes];
      uint64_t v11 = v9 - [v10 count];

      [v5 setNumberOfItems:v11 withChangeDetails:v6];
      uint64_t v12 = *(void **)(a1 + 56);
      uint64_t v13 = [*(id *)(a1 + 48) toDataSourceIdentifier];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      void v14[2] = __205__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetails_dataSourceBeforeChanges_dataSourceAfterChanges_sublayoutProvider_outChangedSections_outSectionsWithItemChanges_changeMediaVersionHandler___block_invoke_3;
      void v14[3] = &unk_1E5DBB990;
      id v15 = v6;
      [v12 modifyItemIndexSetForDataSourceIdentifier:v13 section:a2 usingBlock:v14];
    }
    else
    {
      [*(id *)(a1 + 64) removeIndex:a2];
      objc_msgSend(*(id *)(a1 + 40), "removeSublayoutsInRange:", a2, 1);
      objc_msgSend(*(id *)(a1 + 40), "insertSublayoutProvider:inRange:", *(void *)(a1 + 72), a2, 1);
    }
  }
}

void __205__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetails_dataSourceBeforeChanges_dataSourceAfterChanges_sublayoutProvider_outChangedSections_outSectionsWithItemChanges_changeMediaVersionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) lastObject];
  uint64_t v5 = [v4 toDataSourceIdentifier];

  if (v5 != a2)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 40);
    char v8 = [*(id *)(a1 + 32) lastObject];
    [v9 handleFailureInMethod:v6, v7, @"PXGDataSourceDrivenLayout.m", 100, @"Data source identifier in itemsWithChanges %lu != %lu from the change details. allChangeDetails:%@ itemsWithChanges:%@ ", a2, objc_msgSend(v8, "toDataSourceIdentifier"), *(void *)(a1 + 32), *(void *)(a1 + 48) object file lineNumber description];
  }
}

void __205__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetails_dataSourceBeforeChanges_dataSourceAfterChanges_sublayoutProvider_outChangedSections_outSectionsWithItemChanges_changeMediaVersionHandler___block_invoke_5(id *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  char v8 = [a1[4] sublayoutAtIndex:a3];
  id v9 = [v8 layoutForItemChanges];

  if (v9)
  {
    long long v10 = [MEMORY[0x1E4F28E60] indexSet];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __205__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetails_dataSourceBeforeChanges_dataSourceAfterChanges_sublayoutProvider_outChangedSections_outSectionsWithItemChanges_changeMediaVersionHandler___block_invoke_6;
    id v17 = &unk_1E5DBBA08;
    uint64_t v22 = a2;
    uint64_t v23 = a3;
    id v18 = a1[5];
    id v19 = a1[6];
    id v21 = a1[7];
    id v11 = v10;
    id v20 = v11;
    [v7 enumerateIndexesUsingBlock:&v14];
    if (objc_msgSend(v11, "count", v14, v15, v16, v17))
    {
      uint64_t v12 = [v9 numberOfItems];
      uint64_t v13 = [off_1E5DA5568 changeDetailsWithChangedIndexes:v11];
      [v9 setNumberOfItems:v12 withChangeDetails:v13 changeMediaVersionHandler:&__block_literal_global_16_117904];
    }
  }
}

uint64_t __205__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetails_dataSourceBeforeChanges_dataSourceAfterChanges_sublayoutProvider_outChangedSections_outSectionsWithItemChanges_changeMediaVersionHandler___block_invoke_6(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 72);
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  *(void *)&long long v19 = v4;
  *((void *)&v19 + 1) = v5;
  *(void *)&long long v20 = a2;
  *((void *)&v20 + 1) = 0x7FFFFFFFFFFFFFFFLL;
  [off_1E5DA8488 indexPathAfterRevertingChanges:v6 fromIndexPath:&v19 hasIncrementalChanges:0 objectChanged:0 changedProperties:v7];
  if ((void)v21 != *(void *)off_1E5DAAED8)
  {
    char v8 = [*(id *)(a1 + 40) containsObject:*(void *)off_1E5DAAEF0];
    uint64_t v9 = *(void *)(a1 + 56);
    long long v10 = *(uint64_t (**)(uint64_t, long long *, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 16);
    long long v19 = v21;
    long long v20 = v22;
    v18[0] = v4;
    v18[1] = v5;
    v18[2] = a2;
    v18[3] = 0x7FFFFFFFFFFFFFFFLL;
    int v16 = v10(v9, &v19, v18, v11, v12, v13, v14, v15);
    if ((v8 & 1) != 0 || v16) {
      [*(id *)(a1 + 48) addIndex:a2];
    }
  }
  return [*(id *)(a1 + 40) removeAllObjects];
}

uint64_t __205__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetails_dataSourceBeforeChanges_dataSourceAfterChanges_sublayoutProvider_outChangedSections_outSectionsWithItemChanges_changeMediaVersionHandler___block_invoke_7()
{
  return 1;
}

void __205__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetails_dataSourceBeforeChanges_dataSourceAfterChanges_sublayoutProvider_outChangedSections_outSectionsWithItemChanges_changeMediaVersionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 changedIndexes];
  [v3 addIndexes:v4];
}

uint64_t __205__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetails_dataSourceBeforeChanges_dataSourceAfterChanges_sublayoutProvider_outChangedSections_outSectionsWithItemChanges_changeMediaVersionHandler___block_invoke()
{
  return 0;
}

- (void)enumerateSublayoutsForDetailedPlacement:(id)a3 ofItemWithReference:(id)a4 usingBlock:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [(PXGLayout *)self sublayoutDataStore];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  _OWORD v12[2] = __102__PXGLayout_PXGItemPlacement__enumerateSublayoutsForDetailedPlacement_ofItemWithReference_usingBlock___block_invoke;
  v12[3] = &unk_1E5DBCC70;
  id v13 = v7;
  id v14 = v8;
  id v10 = v7;
  id v11 = v8;
  [v9 enumerateSublayoutsUsingBlock:v12];
}

uint64_t __102__PXGLayout_PXGItemPlacement__enumerateSublayoutsForDetailedPlacement_ofItemWithReference_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a3, *(void *)(a1 + 32));
}

- (void)setDetailedPlacementOverride:(id)a3 forItemReference:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __77__PXGLayout_PXGItemPlacement__setDetailedPlacementOverride_forItemReference___block_invoke;
  v8[3] = &unk_1E5DBCC48;
  id v9 = v6;
  id v7 = v6;
  [(PXGLayout *)self enumerateSublayoutsForDetailedPlacement:v7 ofItemWithReference:a4 usingBlock:v8];
}

uint64_t __77__PXGLayout_PXGItemPlacement__setDetailedPlacementOverride_forItemReference___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 setDetailedPlacementOverride:*(void *)(a1 + 32) forItemReference:a3];
}

- (void)getDetailedPresentedPlacement:(id)a3 forItemReference:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __78__PXGLayout_PXGItemPlacement__getDetailedPresentedPlacement_forItemReference___block_invoke;
  v8[3] = &unk_1E5DBCC48;
  id v9 = v6;
  id v7 = v6;
  [(PXGLayout *)self enumerateSublayoutsForDetailedPlacement:v7 ofItemWithReference:a4 usingBlock:v8];
}

uint64_t __78__PXGLayout_PXGItemPlacement__getDetailedPresentedPlacement_forItemReference___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 getDetailedPresentedPlacement:*(void *)(a1 + 32) forItemReference:a3];
}

- (NSArray)pendingAnimations
{
  double v2 = [(PXGLayout *)self rootLayout];
  id v3 = [v2 animations];

  return (NSArray *)v3;
}

- (id)createDefaultAnimationForCurrentContext
{
  id v3 = [(PXGLayout *)self superlayout];

  if (v3)
  {
    id v4 = [(PXGLayout *)self superlayout];
    uint64_t v5 = [v4 createDefaultAnimationForCurrentContext];
  }
  else
  {
    uint64_t v5 = [(PXGLayout *)self createAnimation];
  }
  return v5;
}

- (id)createAnimation
{
  id v3 = [[PXGAnimation alloc] initWithLayout:self];
  id v4 = [(PXGLayout *)self rootLayout];
  [v4 addAnimation:v3];

  return v3;
}

- (id)itemPlacementControllerForItemReference:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__131800;
  int v16 = __Block_byref_object_dispose__131801;
  id v17 = 0;
  uint64_t v5 = [(PXGLayout *)self sublayoutDataStore];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _OWORD v9[2] = __90__PXGLayout_PXGViewControllerTransitionEndPoint__itemPlacementControllerForItemReference___block_invoke;
  v9[3] = &unk_1E5DBD708;
  id v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [v5 enumerateSublayoutsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __90__PXGLayout_PXGViewControllerTransitionEndPoint__itemPlacementControllerForItemReference___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v6 = [a3 itemPlacementControllerForItemReference:*(void *)(a1 + 32)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a4 = 1;
  }
}

- (CGSize)minPlayableSizeForSpriteAtIndex:(unsigned int)a3
{
  uint64_t v10 = 0;
  id v11 = (double *)&v10;
  uint64_t v12 = 0x3010000000;
  id v13 = &unk_1AB5D584F;
  long long v14 = *(_OWORD *)off_1E5DAB030;
  if ([(PXGLayout *)self numberOfSprites] > a3)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    _OWORD v9[2] = __62__PXGLayout_MinPlayableSize__minPlayableSizeForSpriteAtIndex___block_invoke;
    v9[3] = &unk_1E5DC2218;
    void v9[4] = &v10;
    [(PXGLayout *)self enumerateLayoutsForSpritesInRange:a3 | 0x100000000 options:1 usingBlock:v9];
  }
  double v5 = v11[4];
  double v6 = v11[5];
  _Block_object_dispose(&v10, 8);
  double v7 = v5;
  double v8 = v6;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

void __62__PXGLayout_MinPlayableSize__minPlayableSizeForSpriteAtIndex___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = [a3 contentSource];
  [v7 minSpriteSizeForPresentationStyle:2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  *(void *)(v4 + 32) = v5;
  *(void *)(v4 + 40) = v6;
}

- (id)createCuratedLibraryLayoutTransitionIfNeededWithContext:(int64_t)a3
{
  uint64_t v4 = [(PXGLayout *)self superlayout];
  if (!v4) {
    PXAssertGetLog();
  }
  uint64_t v5 = [v4 createCuratedLibraryLayoutTransitionIfNeededWithContext:a3];

  return v5;
}

- (id)createCuratedLibraryLayoutAnimationIfNeededWithContext:(int64_t)a3
{
  return [(PXGLayout *)self createCuratedLibraryLayoutAnimationIfNeededWithContext:a3 userData:0];
}

- (id)createCuratedLibraryLayoutSkimmingSlideshowAnimationFromSectionIndexPath:(PXSimpleIndexPath *)a3 toSectionIndexPath:(PXSimpleIndexPath *)a4
{
}

- (id)createCuratedLibraryLayoutAnimationIfNeededWithContext:(int64_t)a3 userData:(id)a4
{
  id v6 = a4;
  id v7 = [(PXGLayout *)self superlayout];
  if (!v7) {
    PXAssertGetLog();
  }
  double v8 = [v7 createCuratedLibraryLayoutAnimationIfNeededWithContext:a3 userData:v6];

  return v8;
}

- (void)removeInteraction:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(PXGLayout *)self interactions];
  int v5 = [v4 containsObject:v8];

  if (v5)
  {
    id v6 = [(PXGLayout *)self interactions];
    id v7 = (void *)[v6 mutableCopy];

    [v7 removeObject:v8];
    [(PXGLayout *)self setInteractions:v7];
    [v8 setLayout:0];
  }
}

- (void)addInteraction:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(PXGLayout *)self interactions];
  char v5 = [v4 containsObject:v8];

  if ((v5 & 1) == 0)
  {
    [v8 setLayout:self];
    id v6 = [(PXGLayout *)self interactions];
    id v7 = [v6 arrayByAddingObject:v8];
    [(PXGLayout *)self setInteractions:v7];
  }
}

- (id)createTransitionWithAnimations:(id)a3
{
  id v4 = a3;
  char v5 = [[PXGTransition alloc] initWithAnimations:v4 layout:self];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _OWORD v9[2] = __59__PXGLayout_PXGTransition__createTransitionWithAnimations___block_invoke;
  v9[3] = &unk_1E5DC4050;
  id v6 = v5;
  uint64_t v10 = v6;
  [v4 enumerateObjectsUsingBlock:v9];

  id v7 = [(PXGLayout *)self rootLayout];
  [v7 addTransition:v6];

  return v6;
}

uint64_t __59__PXGLayout_PXGTransition__createTransitionWithAnimations___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setTransition:*(void *)(a1 + 32)];
}

- (BOOL)shouldUpdateDecorationMediaTargetSizes
{
  return 1;
}

- (BOOL)shouldInvalidateDecorationForModifiedSprites
{
  return 1;
}

- (BOOL)isSpriteIndex:(unsigned int)a3 decoratingSpriteWithIndex:(unsigned int *)a4
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  unsigned int v11 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__PXGLayout_PXGDecoratingLayout__isSpriteIndex_decoratingSpriteWithIndex___block_invoke;
  v7[3] = &unk_1E5DC5588;
  void v7[4] = self;
  void v7[5] = &v12;
  void v7[6] = &v8;
  [(PXGLayout *)self enumerateLayoutsForSpritesInRange:a3 | 0x100000000 options:1 usingBlock:v7];
  if (a4) {
    *a4 = *((_DWORD *)v9 + 6);
  }
  char v5 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

void __74__PXGLayout_PXGDecoratingLayout__isSpriteIndex_decoratingSpriteWithIndex___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (*(void **)(a1 + 32) != a3)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8) + 24;
    id v6 = a3;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 isSpriteIndex:a2 decoratingSpriteWithIndex:v5];
    LODWORD(a2) = [*(id *)(a1 + 32) convertSpriteIndex:*(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) fromDescendantLayout:v6];

    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  }
}

- (void)invalidateDecorationAndSprites
{
  uint64_t v3 = [(PXGLayout *)self localNumberOfSprites] << 32;
  [(PXGLayout *)self _invalidateDecorationForSpriteRange:v3 inLayout:self invalidateSprites:1];
}

- (void)px_modifyAssetsSectionLayoutGeometry:(id)a3
{
  char v6 = 0;
  memset(v4, 0, sizeof(v4));
  uint64_t v5 = 0;
  v3[0] = 0;
  v3[1] = 0;
  (*((void (**)(id, uint64_t, _OWORD *, void *, char *))a3 + 2))(a3, 0x7FFFFFFFFFFFFFFFLL, v4, v3, &v6);
}

- (PXAssetsSectionLayout)px_assetsSectionLayout
{
  return 0;
}

- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(PXGLayout *)self axNextResponder];
  LOBYTE(a4) = [v10 axGroup:v9 didRequestToPerformAction:a4 userInfo:v8];

  return a4;
}

- (id)axContainingViewForAXGroup:(id)a3
{
  uint64_t v3 = [(PXGLayout *)self axContainingScrollViewForAXGroup:a3];
  id v4 = [v3 superview];
  if (v4)
  {
    do
    {
      uint64_t v5 = v4;
      char v6 = self;
      if (objc_opt_isKindOfClass()) {
        id v7 = v5;
      }
      else {
        id v7 = 0;
      }
      id v8 = v7;

      id v4 = [v5 superview];
    }
    while (v4 && !v8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)axContainingScrollViewForAXGroup:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXGLayout *)self axNextResponder];
  char v6 = [v5 axContainingScrollViewForAXGroup:v4];

  return v6;
}

- (id)axLeafForObjectReference:(id)a3
{
  uint64_t v4 = [(PXGLayout *)self spriteIndexForObjectReference:a3];
  uint64_t v5 = [(PXGLayout *)self leafSublayoutForSpriteIndex:v4];
  char v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 convertSpriteIndex:v4 fromLayout:self];
    id v8 = [v6 axGroup];
    id v9 = (id)[v8 loadLeafAtSpriteIndexIfNeeded:v7 usingOptions:1];

    uint64_t v10 = [v6 axGroup];
    unsigned int v11 = [v10 loadedLeafAtSpriteIndex:v7];
  }
  else
  {
    unsigned int v11 = 0;
  }

  return v11;
}

- (unint64_t)axFocusabilityForSpriteAtIndex:(unsigned int)a3
{
  uint64_t v4 = [(PXGLayout *)self spriteDataStore];
  if ([v4 count] <= a3)
  {
    unint64_t v5 = 0;
  }
  else if (PXGAXInfoKindForMediaKind(*(unsigned __int8 *)([v4 infos] {
                                                         + 40 * a3
  }
                                                         + 1)) == 6)
  {
    unint64_t v5 = 2;
  }
  else
  {
    unint64_t v5 = 1;
  }

  return v5;
}

- (unsigned)axSpriteIndexClosestToSpriteIndexDefaultImplementation:(unsigned int)a3 inDirection:(unint64_t)a4
{
  if (a3 == -1 || [(PXGLayout *)self localNumberOfSprites] > a3)
  {
    if (a4 - 4 < 2)
    {
      uint64_t v7 = [(PXGLayout *)self axSpriteIndexes];
      unsigned int v8 = [v7 indexGreaterThanIndex:a3];
      goto LABEL_9;
    }
    if (a4 == 6 || a4 == 3)
    {
      uint64_t v7 = [(PXGLayout *)self axSpriteIndexes];
      unsigned int v8 = [v7 indexLessThanIndex:a3];
LABEL_9:
      unsigned int v9 = v8;

      return v9;
    }
  }
  return -1;
}

void __60__PXGLayout_AX__axSpriteIndexesInRectDefaultImplementation___block_invoke(uint64_t a1, uint64_t a2)
{
  double v2 = *(void **)(a1 + 32);
  if (v2) {
    objc_msgSend(v2, "geometryForSpriteAtIndex:", a2, (unsigned __int128)0, (unsigned __int128)0);
  }
  PXRectWithCenterAndSize();
}

- (unsigned)axSpriteIndexClosestToSpriteIndex:(unsigned int)a3 inDirection:(unint64_t)a4
{
  return -1;
}

- (BOOL)axShouldBeConsideredAsSubgroup
{
  return 1;
}

- (BOOL)axShouldSearchLeafsInSubgroups
{
  return 1;
}

- (CGPoint)axConvertPoint:(CGPoint)a3 toDescendantGroup:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    long long v19 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v22 = (objc_class *)objc_opt_class();
    long long v21 = NSStringFromClass(v22);
    uint64_t v23 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
    [v19 handleFailureInMethod:a2, self, @"PXGLayout+AX.m", 126, @"%@ should be an instance inheriting from %@, but it is %@", @"descendantGroup", v21, v23 object file lineNumber description];
  }
  else
  {
    long long v19 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v20 = (objc_class *)objc_opt_class();
    long long v21 = NSStringFromClass(v20);
    [v19 handleFailureInMethod:a2, self, @"PXGLayout+AX.m", 126, @"%@ should be an instance inheriting from %@, but it is nil", @"descendantGroup", v21 object file lineNumber description];
  }

LABEL_3:
  double v9 = *MEMORY[0x1E4F1DB20];
  double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  unsigned int v11 = [v8 containingLayout];

  if (v11)
  {
    double v12 = *MEMORY[0x1E4F1DB30];
    double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    uint64_t v14 = [v8 containingLayout];
    -[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", v14, x, y, v12, v13);
    double v9 = v15;
    double v10 = v16;
  }
  double v17 = v9;
  double v18 = v10;
  result.double y = v18;
  result.double x = v17;
  return result;
}

- (CGPoint)axConvertPoint:(CGPoint)a3 fromDescendantGroup:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    long long v19 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v22 = (objc_class *)objc_opt_class();
    long long v21 = NSStringFromClass(v22);
    uint64_t v23 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
    [v19 handleFailureInMethod:a2, self, @"PXGLayout+AX.m", 116, @"%@ should be an instance inheriting from %@, but it is %@", @"descendantGroup", v21, v23 object file lineNumber description];
  }
  else
  {
    long long v19 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v20 = (objc_class *)objc_opt_class();
    long long v21 = NSStringFromClass(v20);
    [v19 handleFailureInMethod:a2, self, @"PXGLayout+AX.m", 116, @"%@ should be an instance inheriting from %@, but it is nil", @"descendantGroup", v21 object file lineNumber description];
  }

LABEL_3:
  double v9 = *MEMORY[0x1E4F1DB20];
  double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  unsigned int v11 = [v8 containingLayout];

  if (v11)
  {
    double v12 = *MEMORY[0x1E4F1DB30];
    double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    uint64_t v14 = [v8 containingLayout];
    -[PXGLayout convertRect:fromDescendantLayout:](self, "convertRect:fromDescendantLayout:", v14, x, y, v12, v13);
    double v9 = v15;
    double v10 = v16;
  }
  double v17 = v9;
  double v18 = v10;
  result.double y = v18;
  result.double x = v17;
  return result;
}

- (CGRect)axConvertRect:(CGRect)a3 toDescendantGroup:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    id v28 = (objc_class *)objc_opt_class();
    int v27 = NSStringFromClass(v28);
    uint64_t v29 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
    [v25 handleFailureInMethod:a2, self, @"PXGLayout+AX.m", 107, @"%@ should be an instance inheriting from %@, but it is %@", @"descendantGroup", v27, v29 object file lineNumber description];
  }
  else
  {
    uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    SEL v26 = (objc_class *)objc_opt_class();
    int v27 = NSStringFromClass(v26);
    [v25 handleFailureInMethod:a2, self, @"PXGLayout+AX.m", 107, @"%@ should be an instance inheriting from %@, but it is nil", @"descendantGroup", v27 object file lineNumber description];
  }

LABEL_3:
  double v11 = *MEMORY[0x1E4F1DB20];
  double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  double v15 = [v10 containingLayout];

  if (v15)
  {
    double v16 = [v10 containingLayout];
    -[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", v16, x, y, width, height);
    double v11 = v17;
    double v12 = v18;
    double v13 = v19;
    double v14 = v20;
  }
  double v21 = v11;
  double v22 = v12;
  double v23 = v13;
  double v24 = v14;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (CGRect)axConvertRect:(CGRect)a3 fromDescendantGroup:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    id v28 = (objc_class *)objc_opt_class();
    int v27 = NSStringFromClass(v28);
    uint64_t v29 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
    [v25 handleFailureInMethod:a2, self, @"PXGLayout+AX.m", 98, @"%@ should be an instance inheriting from %@, but it is %@", @"descendantGroup", v27, v29 object file lineNumber description];
  }
  else
  {
    uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    SEL v26 = (objc_class *)objc_opt_class();
    int v27 = NSStringFromClass(v26);
    [v25 handleFailureInMethod:a2, self, @"PXGLayout+AX.m", 98, @"%@ should be an instance inheriting from %@, but it is nil", @"descendantGroup", v27 object file lineNumber description];
  }

LABEL_3:
  double v11 = *MEMORY[0x1E4F1DB20];
  double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  double v15 = [v10 containingLayout];

  if (v15)
  {
    double v16 = [v10 containingLayout];
    -[PXGLayout convertRect:fromDescendantLayout:](self, "convertRect:fromDescendantLayout:", v16, x, y, width, height);
    double v11 = v17;
    double v12 = v18;
    double v13 = v19;
    double v14 = v20;
  }
  double v21 = v11;
  double v22 = v12;
  double v23 = v13;
  double v24 = v14;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (NSString)axLocalizedLabel
{
  return 0;
}

- (void)axRemoveSubgroupForSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5
{
  char v5 = a5;
  uint64_t v7 = [(PXGLayout *)self axGroup];
  if (v7)
  {
    id v9 = v7;
    if (v5)
    {
      [v7 unloadSubgroupAtIndex:a4];
    }
    else
    {
      id v8 = objc_msgSend(off_1E5DA5568, "changeDetailsWithRemovedIndexRange:", a4, 1);
      [v9 updateSubgroupsWithChangeDetails:v8];
    }
    uint64_t v7 = v9;
  }
}

- (int64_t)sublayoutIndexForSpriteReference:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 spriteIndex] != -1)
  {
    uint64_t v7 = [v6 layoutVersion];
    id v8 = [v6 layout];
    if (v7 == [v8 version])
    {
      id v9 = [v6 layout];

      if (v9)
      {
        uint64_t v10 = [v6 spriteIndex];
        double v11 = [v6 layout];
        uint64_t v12 = [(PXGLayout *)self convertSpriteIndex:v10 fromLayout:v11];

        int64_t v13 = [(PXGLayout *)self sublayoutIndexForSpriteIndex:v12];
        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        {
          int64_t v14 = v13;
          id v15 = 0;
          goto LABEL_12;
        }
      }
    }
    else
    {
    }
  }
  double v16 = [v6 objectReference];

  if (v16)
  {
    double v17 = [v6 objectReference];
    id v19 = 0;
    int64_t v14 = [(PXGLayout *)self sublayoutIndexForObjectReference:v17 options:a4 updatedObjectReference:&v19];
    id v15 = v19;

    if (v14 != 0x7FFFFFFFFFFFFFFFLL && v15) {
      [v6 setObjectReference:v15];
    }
  }
  else
  {
    id v15 = 0;
    int64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_12:

  return v14;
}

- (unsigned)spriteIndexForSpriteReference:(id)a3 options:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 layout];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 version];
    if ([v6 layoutVersion] == v9) {
      uint64_t v10 = [v6 spriteIndex];
    }
    else {
      uint64_t v10 = 0xFFFFFFFFLL;
    }
    uint64_t v12 = [v6 objectReference];
    int64_t v13 = (void *)v12;
    if (v10 == -1 && v12)
    {
      if ([v8 allowsObjectReferenceSpriteIndexLookup])
      {
        id v21 = 0;
        uint64_t v10 = [v8 spriteIndexForObjectReference:v13 options:a4 updatedObjectReference:&v21];
        id v14 = v21;
        id v15 = v8;
        id v16 = v13;
        double v17 = v16;
        if (v10 == -1)
        {
        }
        else
        {
          if ([v15 numberOfSprites] <= v10)
          {
            id v19 = [MEMORY[0x1E4F28B00] currentHandler];
            double v20 = objc_msgSend(NSString, "stringWithUTF8String:", "void PXValidateLayoutSpriteIndexForObjectReference(PXGLayout * _Nonnull __strong, PXGSpriteIndex, id  _Nonnull __strong)");
            [v19 handleFailureInFunction:v20, @"PXGLayout_Internal.h", 223, @"%@ returned invalid spriteIndex %li for objectReference %@", v15, v10, v17 file lineNumber description];
          }
          [v6 setSpriteIndex:v10];
          [v6 setLayoutVersion:v9];
          if (v14) {
            [v6 setObjectReference:v14];
          }
        }
      }
      else
      {
        if ((a4 & 0x400) == 0) {
          PXAssertGetLog();
        }
        uint64_t v10 = 0xFFFFFFFFLL;
      }
    }
    unsigned int v11 = [(PXGLayout *)self convertSpriteIndex:v10 fromLayout:v8];
  }
  else
  {
    unsigned int v11 = -1;
  }

  return v11;
}

- (id)spriteReferenceForSpriteReference:(id)a3
{
  id v4 = a3;
  char v5 = [v4 layout];
  if (v5 == self)
  {
    uint64_t v6 = [v4 layoutVersion];
    int64_t v7 = [(PXGLayout *)self version];

    if (v6 == v7)
    {
      id v8 = v4;
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v8 = [[PXGSpriteReference alloc] _init];
  uint64_t v9 = [v4 objectReference];
  [v8 setObjectReference:v9];

  objc_msgSend(v8, "setIsDynamic:", objc_msgSend(v4, "isDynamic"));
  [v8 setLayout:self];
LABEL_6:

  return v8;
}

- (id)dynamicSpriteReferenceForObjectReference:(id)a3
{
  id v4 = a3;
  id v5 = [[PXGSpriteReference alloc] _init];
  [v5 setObjectReference:v4];

  [v5 setLayout:self];
  [v5 setIsDynamic:1];
  return v5;
}

- (id)spriteReferenceForObjectReference:(id)a3
{
  return [(PXGLayout *)self spriteReferenceForSpriteIndex:0xFFFFFFFFLL objectReference:a3];
}

- (id)spriteReferenceForSpriteIndex:(unsigned int)a3 objectReference:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [[PXGSpriteReference alloc] _init];
  [v7 setSpriteIndex:v4];
  if (v4 != -1)
  {
    objc_msgSend(v7, "setLayoutVersion:", -[PXGLayout version](self, "version"));
    if (!v6)
    {
      if ([(PXGLayout *)self allowsObjectReferenceSpriteIndexLookup])
      {
        id v6 = [(PXGLayout *)self objectReferenceForSpriteIndex:v4];
      }
      else
      {
        id v6 = 0;
      }
    }
  }
  [v7 setObjectReference:v6];
  [v7 setLayout:self];

  return v7;
}

- (unsigned)spriteIndexForSpriteReference:(id)a3
{
  return [(PXGLayout *)self spriteIndexForSpriteReference:a3 options:0];
}

- (id)spriteReferenceForSpriteIndex:(unsigned int)a3
{
  return [(PXGLayout *)self spriteReferenceForSpriteIndex:*(void *)&a3 objectReference:0];
}

- (void)hostingControllerProposedReferenceSize:(id)a3
{
}

@end