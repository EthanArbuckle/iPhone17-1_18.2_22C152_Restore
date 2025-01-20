@interface NCNotificationListView
- (BOOL)_animateVisibleRectAdjustmentIfNecessaryWithVisibleRect:(CGRect)a3;
- (BOOL)_isAlwaysPresentedAtTopOfScreenForView:(id)a3;
- (BOOL)_isAnimatingForParentNotificationListView;
- (BOOL)_isAnimationStyleDissolve;
- (BOOL)_isFeaturedLeadingViewAtIndex:(unint64_t)a3;
- (BOOL)_isGrouping;
- (BOOL)_isLayoutFromBottomUp;
- (BOOL)_isPerformingContentModification;
- (BOOL)_isPerformingRollUnderListLayoutForView:(id)a3 atIndex:(unint64_t)a4 viewHeight:(double)a5 atLayoutOffset:(double)MinY targetTransform:(CGAffineTransform *)a7 targetAlpha:(double *)a8 viewFrame:(CGRect *)a9;
- (BOOL)_isShowingFeaturedLeadingViews;
- (BOOL)_isTopSubviewHeightLessThanVisibleRect;
- (BOOL)_isViewWithinVisibleRectForHeight:(double)a3 layoutOffset:(double)a4;
- (BOOL)_isVisibleView:(id)a3;
- (BOOL)_shouldAnimateListLayoutForView:(id)a3 atIndex:(unint64_t)a4 isExistingView:(BOOL)a5 isPerformingRollUnderLayout:(BOOL)a6 shouldUpdateTransformedView:(BOOL)a7;
- (BOOL)_shouldPerformClipping;
- (BOOL)_shouldRollUnderView:(id)a3 withHeight:(double)a4 layoutOffset:(double)a5;
- (BOOL)_shouldThrottleDebugViewUpdate;
- (BOOL)_shouldUpdateTransformedView:(id)a3 toFrame:(CGRect)a4 alpha:(double)a5 transform:(CGAffineTransform *)a6;
- (BOOL)_wasPerformingRollUnderLayoutForView:(id)a3 isPerformingRollUnderLayout:(BOOL)a4;
- (BOOL)areSublistsRevealed;
- (BOOL)containsVisibleView:(id)a3;
- (BOOL)hasPerformedFirstLayout;
- (BOOL)isActiveRevealTransitioning;
- (BOOL)isAnimatingAdditionalYOffset;
- (BOOL)isCachedSizeValid;
- (BOOL)isGrouped;
- (BOOL)isHiddenBelowStack;
- (BOOL)isHoverViewHidden;
- (BOOL)isLeadingRevealView;
- (BOOL)isListRevealTargetContentOffsetClamped;
- (BOOL)isNotificationListViewCurrentlyVisible;
- (BOOL)isPerformingBottomMarginAdjustmentAnimation;
- (BOOL)isPerformingContentRevealAnimation;
- (BOOL)isPerformingGroupingAnimation;
- (BOOL)isPerformingHeaderGroupingAnimation;
- (BOOL)isPerformingHeaderReloadAnimation;
- (BOOL)isPerformingInteractionVelocityAnimation;
- (BOOL)isPerformingInteractiveTranslationAnimation;
- (BOOL)isPerformingOverrideLeadingViewHeightAdjustment;
- (BOOL)isPerformingRemovalAnimation;
- (BOOL)isPerformingRevealAnimation;
- (BOOL)isPerformingRevealTransitionAnimation;
- (BOOL)isPerformingStackVisibilityAnimation;
- (BOOL)isPerformingVisibleRectAdjustment;
- (BOOL)isReactiveLayout;
- (BOOL)isRevealTransitionScrolling;
- (BOOL)isRevealed;
- (BOOL)isRolledUnderView:(id)a3 atIndex:(unint64_t)a4;
- (BOOL)isSubviewPerformingGroupingAnimation;
- (BOOL)isVisibleForViewAtIndex:(unint64_t)a3;
- (BOOL)layoutFromBottom;
- (BOOL)leadingContentShouldFillList;
- (BOOL)shouldBottomViewsRollUnder;
- (BOOL)shouldLimitViewHeightForRollUnder;
- (BOOL)showContentForGroupedViews;
- (BOOL)showStackBelowLeadingView;
- (BOOL)supportsBottomViewsRollUnder;
- (BOOL)supportsGrouping;
- (BOOL)visibleRectIsBounds;
- (CGAffineTransform)_scaleTransformForGroupingAnimationForViewAtIndex:(SEL)a3 leadingViewHeight:(unint64_t)a4;
- (CGAffineTransform)_transformForRollUnderForView:(SEL)a3 withHeight:(id)a4 layoutOffset:(double)a5;
- (CGAffineTransform)overrideTopViewDimmingTransform;
- (CGRect)_frameForViewAtIndex:(unint64_t)a3;
- (CGRect)_visibleRect;
- (CGRect)visibleRect;
- (CGSize)cachedSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NCListAnimationSettings)animationSettings;
- (NCNotificationListDebugView)debugView;
- (NCNotificationListView)initWithModelType:(Class)a3 purpose:(id)a4;
- (NCNotificationListView)initWithModelType:(Class)a3 purpose:(id)a4 purposeWithSensitiveTextHashed:(id)a5;
- (NCNotificationListViewDataSource)dataSource;
- (NSDate)lastDebugViewUpdate;
- (NSHashTable)viewsPerformingAnimation;
- (NSHashTable)viewsPerformingBottomMarginAdjustmentAnimation;
- (NSHashTable)viewsPerformingRollUnderLayout;
- (NSMutableDictionary)visibleViews;
- (NSMutableSet)insertedViewIndices;
- (NSMutableSet)reloadedViewIndices;
- (NSNumber)depth;
- (NSNumber)distanceScrolledBeyondBottomOfContent;
- (NSNumber)footerCenterY;
- (NSNumber)index;
- (NSString)debugDescription;
- (NSString)model;
- (NSString)purpose;
- (NSString)purposeWithSensitiveTextHashed;
- (UILabel)titleLabel;
- (UIView)backgroundView;
- (UIView)footerView;
- (UIView)headerView;
- (UIView)hoverView;
- (UIView)overlayView;
- (UIViewFloatAnimatableProperty)visibleRectHeightAnimatableProperty;
- (double)_adjustedFrictionForRevealAnimation;
- (double)_adjustedTensionForRevealAnimation;
- (double)_alphaForRollUnderForView:(id)a3 withHeight:(double)a4 layoutOffset:(double)a5;
- (double)_animationFriction;
- (double)_animationTension;
- (double)_bottomSpacingForItemAtIndex:(unint64_t)a3;
- (double)_calculateSizeForGrouped:(BOOL)a3 size:(CGSize)a4 idealizedSize:(BOOL)a5 ignoringExpandedNotificationStacks:(BOOL)a6 ignoreFeaturedLeadingView:(BOOL)a7;
- (double)_computeStandardHeightIgnoringExpandedNotificationStacksAtIndex:(unint64_t)a3 width:(double)a4 includeGroup:(BOOL)a5;
- (double)_footerViewHeight;
- (double)_headerViewHeight;
- (double)_heightForFeaturedLeadingView;
- (double)_heightForFeaturedLeadingViewInRect:(CGRect)a3;
- (double)_initialLayoutOffset;
- (double)_layoutViewIfNecessaryAtIndex:(unint64_t)a3 layoutOffset:(double)a4 startingLayoutOffset:(double)a5;
- (double)_positionOffsetForRevealHintingForItemAtIndex:(unint64_t)a3;
- (double)_resolvedViewOverlap;
- (double)_revealAnimationDelayForObjectAtIndex:(unint64_t)a3;
- (double)_rollUnderThresholdOffset;
- (double)_rollUnderTranslationBottomMargin;
- (double)_rollUnderTranslationTopMargin;
- (double)_scaleForRollUnderView:(id)a3 withHeight:(double)a4 layoutOffset:(double)a5;
- (double)_targetContentHeightForProposedHeight:(double)a3;
- (double)_topSpacingForItemAtIndex:(unint64_t)a3;
- (double)_unclampedTranslationProgressForView:(id)a3 withHeight:(double)a4 layoutOffset:(double)a5;
- (double)_verticalTranslationForRollUnderView:(id)a3 withHeight:(double)a4 layoutOffset:(double)a5 scale:(double)a6;
- (double)_verticalTranslationProgressForView:(id)a3 withHeight:(double)a4 layoutOffset:(double)a5;
- (double)_verticalVelocityForSuperview;
- (double)_widthForFeaturedLeadingView;
- (double)_widthForFeaturedLeadingViewInRect:(CGRect)a3;
- (double)_widthForListViewInRect:(CGRect)a3;
- (double)additionalBottomSpace;
- (double)additionalYOffset;
- (double)backgroundViewHorizontalOutsetMargin;
- (double)calculateSizeForGrouped:(BOOL)a3 ignoringExpandedNotificationStacks:(BOOL)a4 ignoreFeaturedLeadingView:(BOOL)a5;
- (double)featuredLeadingViewOcclusionTranslation;
- (double)firstItemOffset;
- (double)footerViewVerticalMargin;
- (double)groupedOverlapHeightMultiple;
- (double)groupedTranslation;
- (double)groupingViewOverlapAlphaFactor;
- (double)groupingViewOverlapCompressionFactor;
- (double)horizontalInsetMargin;
- (double)interactionTranslation;
- (double)interactionTranslationFocalPointY;
- (double)interactionTranslationPercentage;
- (double)interactionVelocity;
- (double)layoutOffsetForViewAtIndex:(unint64_t)a3;
- (double)maximumLeadingViewHeight;
- (double)minimumContentHeight;
- (double)overrideLeadingViewHeight;
- (double)revealPercentage;
- (double)visibleRectBottomMarginForRollUnder;
- (id)_anySuperNotificationListView;
- (id)_backgroundViewFromDataSource;
- (id)_currentAnimator;
- (id)_currentHighFrameRateAnimator;
- (id)_directSuperListView;
- (id)_footerViewFromDataSource;
- (id)_getDepth;
- (id)_headerViewFromDataSource;
- (id)_hoverViewFromDataSource;
- (id)_listViewForView:(id)a3;
- (id)_overlayViewFromDataSource;
- (id)_viewForItemAtIndex:(unint64_t)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)purposeHashed:(BOOL)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)visibleViewAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)groupingAnimationStyle;
- (unint64_t)indexForReveal;
- (unint64_t)numberOfFeaturedLeadingViews;
- (unint64_t)removedViewIndex;
- (unint64_t)revealIndexOffset;
- (void)_adjustContentSizeHeightIfNecessaryForUpdatedHeight:(double)a3;
- (void)_adjustContentSizeWidthIfNecessary;
- (void)_animateVisibleRectHeight:(double)a3;
- (void)_appendBaseDescriptionToBuilder:(id)a3;
- (void)_configureClippingIfNecessary;
- (void)_configureDebugViewIfNeeded;
- (void)_configureStackDimmingForGroupedView:(id)a3 transform:(CGAffineTransform *)a4;
- (void)_currentAnimator;
- (void)_drawRollUnderAreaInDebugViewIfNecessaryWithTopY:(double)a3;
- (void)_giveDataSourceUpdatedTransformWhichIncludesSubviewsXTranslation;
- (void)_layoutBackgroundViewIfNecessary;
- (void)_layoutFooterViewForGroupingIfNecessary;
- (void)_layoutFooterViewIfNecessaryAtLayoutOffset:(double)a3;
- (void)_layoutForGrouping;
- (void)_layoutForList;
- (void)_layoutGroupedViewForGroupingLayout:(id)a3 atIndex:(unint64_t)a4 isExistingView:(BOOL)a5 leadingViewHeight:(double)a6 alpha:(double)a7;
- (void)_layoutHeaderViewForGroupingIfNecessaryWithMaxYOffset:(double)a3;
- (void)_layoutHeaderViewIfNecessaryAtLayoutOffset:(double)a3;
- (void)_layoutHiddenViewsForGroupingLayoutIfNecessaryWithLeadingViewHeight:(double)a3;
- (void)_layoutHoverViewIfNecessary;
- (void)_layoutLeadingViewForGroupingLayoutIfNecessary:(id)a3 hasShadow:(BOOL)a4 isExistingView:(BOOL)a5;
- (void)_layoutOverlayViewIfNecessary;
- (void)_performAnimationForView:(id)a3 atIndex:(unint64_t)a4 animationBlock:(id)a5 completionBlock:(id)a6 type:(unint64_t)a7;
- (void)_performInsertionAnimationForView:(id)a3;
- (void)_performRemovalAnimationForView:(id)a3 index:(unint64_t)a4 isHorizontallyDisplaced:(BOOL)a5;
- (void)_performRetargetableAnimationForView:(id)a3 type:(unint64_t)a4 animationBlock:(id)a5 completionBlock:(id)a6;
- (void)_performViewAnimationBlock:(id)a3 completionBlock:(id)a4 type:(unint64_t)a5;
- (void)_performViewAnimationBlock:(id)a3 completionBlock:(id)a4 withTension:(double)a5 friction:(double)a6 type:(unint64_t)a7;
- (void)_recycleViewIfNecessary:(id)a3;
- (void)_recycleViewIfNecessary:(id)a3 withDataSource:(id)a4;
- (void)_removeAllStoredVisibleViews;
- (void)_removeDebugViewIfNeeded;
- (void)_removeStoredVisibleViewAtIndex:(unint64_t)a3;
- (void)_resetClipping;
- (void)_setContentHiddenForGroupedView:(id)a3 atIndex:(unint64_t)a4;
- (void)_setContentHiddenForView:(id)a3 contentHidden:(BOOL)a4;
- (void)_setHiddenBelowStackForView:(id)a3 hiddenBelowStack:(BOOL)a4;
- (void)_setRevealAlphaForView:(id)a3 desiredAlpha:(double)a4;
- (void)_setVisibleRectWithoutAlteringAnimations:(CGRect)a3;
- (void)_setVisibleView:(id)a3 atIndex:(unint64_t)a4;
- (void)_setupClipping;
- (void)_setupVisibleRectHeightFloatAnimatablePropertyWithStartingValue:(double)a3;
- (void)_updateBlurFilterForHeaderView:(id)a3 translation:(double)a4;
- (void)_updateBottomMarginAdjustmentAnimationForView:(id)a3 isPerformingRollUnderLayout:(BOOL)a4;
- (void)_updateDebugViewFrame;
- (void)_updateLayoutParametersForHiddenGroupListViewAnimationForView:(id)a3 targetTransform:(CGAffineTransform *)a4 targetAlpha:(double *)a5;
- (void)_updateShadowForOverlappingRollUnderView:(id)a3 withProgress:(double)a4;
- (void)_updateStackedViewsForGrouping:(BOOL)a3;
- (void)_updateStoredVisibleViewsForViewInsertedAtIndex:(unint64_t)a3;
- (void)_updateStoredVisibleViewsForViewRemovedAtIndex:(unint64_t)a3;
- (void)_updateTransformedView:(id)a3 toFrame:(CGRect)a4;
- (void)_updateTransformedView:(id)a3 toFrame:(CGRect)a4 withTransform:(CGAffineTransform *)a5;
- (void)_updateVisibleViewsForUpdatedVisibleRect:(CGRect)a3;
- (void)addSubview:(id)a3;
- (void)bringSubviewToFront:(id)a3;
- (void)didExitAlwaysOn;
- (void)didMoveToSuperview;
- (void)insertViewAtIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)invalidateData;
- (void)invalidateHeight;
- (void)layoutSubviews;
- (void)recycleVisibleViews;
- (void)reloadFooterViewAnimated:(BOOL)a3;
- (void)reloadHeaderView;
- (void)reloadHoverView;
- (void)reloadViewAtIndex:(unint64_t)a3;
- (void)removeViewAtIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)removeViewAtIndex:(unint64_t)a3 animated:(BOOL)a4 isHorizontallyDisplaced:(BOOL)a5;
- (void)revealNotificationContentBelowGroupedViewIfNecessary:(id)a3;
- (void)setActiveRevealTransitioning:(BOOL)a3;
- (void)setAdditionalBottomSpace:(double)a3;
- (void)setAdditionalYOffset:(double)a3;
- (void)setAnimatingAdditionalYOffset:(BOOL)a3;
- (void)setAnimationSettings:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setBackgroundViewHorizontalOutsetMargin:(double)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCachedSize:(CGSize)a3;
- (void)setCachedSizeValid:(BOOL)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setDataSource:(id)a3;
- (void)setDepth:(id)a3;
- (void)setFeaturedLeadingViewOcclusionTranslation:(double)a3;
- (void)setFooterCenterY:(id)a3;
- (void)setFooterView:(id)a3;
- (void)setFooterViewVerticalMargin:(double)a3;
- (void)setFrame:(CGRect)a3;
- (void)setGrouped:(BOOL)a3;
- (void)setGroupedOverlapHeightMultiple:(double)a3;
- (void)setGroupedTranslation:(double)a3;
- (void)setGroupingAnimationStyle:(unint64_t)a3;
- (void)setGroupingViewOverlapAlphaFactor:(double)a3;
- (void)setGroupingViewOverlapCompressionFactor:(double)a3;
- (void)setHeaderView:(id)a3;
- (void)setHiddenBelowStack:(BOOL)a3;
- (void)setHorizontalInsetMargin:(double)a3;
- (void)setHoverView:(id)a3;
- (void)setHoverViewHidden:(BOOL)a3;
- (void)setIndex:(id)a3;
- (void)setIndexForReveal:(unint64_t)a3;
- (void)setInsertedViewIndices:(id)a3;
- (void)setInteractionTranslation:(double)a3;
- (void)setInteractionTranslationFocalPointY:(double)a3;
- (void)setInteractionTranslationPercentage:(double)a3;
- (void)setInteractionVelocity:(double)a3;
- (void)setLastDebugViewUpdate:(id)a3;
- (void)setLayoutFromBottom:(BOOL)a3;
- (void)setLeadingContentShouldFillList:(BOOL)a3;
- (void)setLeadingRevealView:(BOOL)a3;
- (void)setListRevealTargetContentOffsetClamped:(BOOL)a3;
- (void)setMaximumLeadingViewHeight:(double)a3;
- (void)setMinimumContentHeight:(double)a3;
- (void)setModel:(id)a3;
- (void)setNumberOfFeaturedLeadingViews:(unint64_t)a3;
- (void)setOverlayView:(id)a3;
- (void)setOverrideLeadingViewHeight:(double)a3;
- (void)setOverrideTopViewDimmingTransform:(CGAffineTransform *)a3;
- (void)setPerformedFirstLayout:(BOOL)a3;
- (void)setPerformingBottomMarginAdjustmentAnimation:(BOOL)a3;
- (void)setPerformingContentRevealAnimation:(BOOL)a3;
- (void)setPerformingGroupingAnimation:(BOOL)a3;
- (void)setPerformingHeaderGroupingAnimation:(BOOL)a3;
- (void)setPerformingHeaderReloadAnimation:(BOOL)a3;
- (void)setPerformingInteractionVelocityAnimation:(BOOL)a3;
- (void)setPerformingInteractiveTranslationAnimation:(BOOL)a3;
- (void)setPerformingOverrideLeadingViewHeightAdjustment:(BOOL)a3;
- (void)setPerformingRemovalAnimation:(BOOL)a3;
- (void)setPerformingRevealAnimation:(BOOL)a3;
- (void)setPerformingRevealTransitionAnimation:(BOOL)a3;
- (void)setPerformingStackVisibilityAnimation:(BOOL)a3;
- (void)setPerformingVisibleRectAdjustment:(BOOL)a3;
- (void)setPurpose:(id)a3;
- (void)setPurposeWithSensitiveTextHashed:(id)a3;
- (void)setReactiveLayout:(BOOL)a3;
- (void)setReloadedViewIndices:(id)a3;
- (void)setRemovedViewIndex:(unint64_t)a3;
- (void)setRevealIndexOffset:(unint64_t)a3;
- (void)setRevealPercentage:(double)a3;
- (void)setRevealTransitionScrolling:(BOOL)a3;
- (void)setRevealed:(BOOL)a3;
- (void)setShouldBottomViewsRollUnder:(BOOL)a3;
- (void)setShouldLimitViewHeightForRollUnder:(BOOL)a3;
- (void)setShowContentForGroupedViews:(BOOL)a3;
- (void)setShowStackBelowLeadingView:(BOOL)a3;
- (void)setSublistsRevealed:(BOOL)a3;
- (void)setSubviewPerformingGroupingAnimation:(BOOL)a3;
- (void)setSupportsBottomViewsRollUnder:(BOOL)a3;
- (void)setSupportsGrouping:(BOOL)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTransform:(CGAffineTransform *)a3;
- (void)setViewsPerformingAnimation:(id)a3;
- (void)setViewsPerformingBottomMarginAdjustmentAnimation:(id)a3;
- (void)setViewsPerformingRollUnderLayout:(id)a3;
- (void)setVisibleRect:(CGRect)a3;
- (void)setVisibleRectBottomMarginForRollUnder:(double)a3;
- (void)setVisibleRectHeightAnimatableProperty:(id)a3;
- (void)setVisibleRectIsBounds:(BOOL)a3;
- (void)setVisibleViews:(id)a3;
- (void)subviewDidLayout;
- (void)updateBottomViewsRollUnder;
- (void)updateSubviewTranslation:(double)a3;
@end

@implementation NCNotificationListView

- (NCNotificationListView)initWithModelType:(Class)a3 purpose:(id)a4
{
  return [(NCNotificationListView *)self initWithModelType:a3 purpose:a4 purposeWithSensitiveTextHashed:a4];
}

- (NCNotificationListView)initWithModelType:(Class)a3 purpose:(id)a4 purposeWithSensitiveTextHashed:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v33.receiver = self;
  v33.super_class = (Class)NCNotificationListView;
  v11 = -[NCNotificationListView initWithFrame:](&v33, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_purpose, a4);
    objc_storeStrong((id *)&v12->_purposeWithSensitiveTextHashed, a5);
    uint64_t v13 = NSStringFromClass(a3);
    model = v12->_model;
    v12->_model = (NSString *)v13;

    v15 = +[NCUNUIKitPrototypeDomain rootSettings];
    v12->_animationSettings = (NCListAnimationSettings *)(id)[v15 listAnimationSettings];

    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    insertedViewIndices = v12->_insertedViewIndices;
    v12->_insertedViewIndices = v16;

    v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    reloadedViewIndices = v12->_reloadedViewIndices;
    v12->_reloadedViewIndices = v18;

    [(NCNotificationListView *)v12 setRemovedViewIndex:0x7FFFFFFFFFFFFFFFLL];
    [(NCNotificationListView *)v12 setShowsHorizontalScrollIndicator:0];
    [(NCNotificationListView *)v12 setAlwaysBounceVertical:1];
    v20 = [MEMORY[0x1E4FB1618] clearColor];
    [(NCNotificationListView *)v12 setBackgroundColor:v20];

    [(NCNotificationListView *)v12 setClipsToBounds:0];
    v21 = [(NCNotificationListView *)v12 layer];
    [v21 setAllowsGroupOpacity:0];

    [(NCNotificationListView *)v12 setRevealed:1];
    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    visibleViews = v12->_visibleViews;
    v12->_visibleViews = v22;

    uint64_t v24 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    viewsPerformingAnimation = v12->_viewsPerformingAnimation;
    v12->_viewsPerformingAnimation = (NSHashTable *)v24;

    uint64_t v26 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    viewsPerformingBottomMarginAdjustmentAnimation = v12->_viewsPerformingBottomMarginAdjustmentAnimation;
    v12->_viewsPerformingBottomMarginAdjustmentAnimation = (NSHashTable *)v26;

    uint64_t v28 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    viewsPerformingRollUnderLayout = v12->_viewsPerformingRollUnderLayout;
    v12->_viewsPerformingRollUnderLayout = (NSHashTable *)v28;

    [(NCNotificationListView *)v12 _setIgnoresLayerTransformForSafeAreaInsets:1];
    v12->_performedFirstLayout = 0;
    v12->_hiddenBelowStack = 0;
    v12->_hoverViewHidden = 1;
    v12->_groupingAnimationStyle = 0;
    v12->_horizontalInsetMargin = 0.0;
    v12->_backgroundViewHorizontalOutsetMargin = 0.0;
    [(NCListAnimationSettings *)v12->_animationSettings viewSpacing];
    v12->_footerViewVerticalMargin = v30;
    v12->_numberOfFeaturedLeadingViews = 0;
    *(_WORD *)&v12->_showStackBelowLeadingView = 1;
    v12->_leadingContentShouldFillList = 0;
    v12->_groupedOverlapHeightMultiple = 1.0;
    v12->_interactionTranslationPercentage = 0.0;
    *(_WORD *)&v12->_supportsBottomViewsRollUnder = 1;
    v12->_groupingViewOverlapCompressionFactor = 1.0;
    v12->_groupingViewOverlapAlphaFactor = 1.0;
    [(NCNotificationListView *)v12 setScrollEnabled:0];
    v31 = [NSString stringWithFormat:@"%@('%@')", v12->_model, v12->_purpose];
    [(NCNotificationListView *)v12 setAccessibilityIdentifier:v31];

    [(NCNotificationListView *)v12 updateBottomViewsRollUnder];
  }

  return v12;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(NCNotificationListView *)self isCachedSizeValid])
  {
    [(NCNotificationListView *)self cachedSize];
  }
  else
  {
    -[NCNotificationListView _calculateSizeForGrouped:size:idealizedSize:ignoringExpandedNotificationStacks:ignoreFeaturedLeadingView:](self, "_calculateSizeForGrouped:size:idealizedSize:ignoringExpandedNotificationStacks:ignoreFeaturedLeadingView:", [(NCNotificationListView *)self _isGrouping], 0, 0, 0, width, height);
    double v9 = v8;
    -[NCNotificationListView setCachedSize:](self, "setCachedSize:", width, v8);
    [(NCNotificationListView *)self setCachedSizeValid:1];
    double v6 = width;
    double v7 = v9;
  }
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (double)calculateSizeForGrouped:(BOOL)a3 ignoringExpandedNotificationStacks:(BOOL)a4 ignoreFeaturedLeadingView:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  [(NCNotificationListView *)self bounds];

  -[NCNotificationListView _calculateSizeForGrouped:size:idealizedSize:ignoringExpandedNotificationStacks:ignoreFeaturedLeadingView:](self, "_calculateSizeForGrouped:size:idealizedSize:ignoringExpandedNotificationStacks:ignoreFeaturedLeadingView:", v7, 0, v6, v5, v9, v10);
  return result;
}

- (double)_computeStandardHeightIgnoringExpandedNotificationStacksAtIndex:(unint64_t)a3 width:(double)a4 includeGroup:(BOOL)a5
{
  BOOL v5 = a5;
  double v9 = [(NCNotificationListView *)self dataSource];
  double v10 = [v9 notificationListView:self viewForItemAtIndex:a3];
  objc_opt_class();
  double v11 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    v12 = [v10 dataSource];
    [v12 notificationListView:v10 heightForItemAtIndex:0 withWidth:a4];
    double v11 = v13;
    if (v5)
    {
      [v10 groupedOverlapHeightMultiple];
      double v15 = v14;
      [v10 _resolvedViewOverlap];
      double v17 = v16;
      unint64_t v18 = [v12 notificationListViewNumberOfItems:v10];
      if ([(NCNotificationListView *)self showStackBelowLeadingView])
      {
        [(NCListAnimationSettings *)self->_animationSettings groupListMaxViewCount];
        if (v19 > (double)v18) {
          double v19 = (double)v18;
        }
        if ((unint64_t)v19 >= 2)
        {
          unint64_t v20 = (unint64_t)v19 - 1;
          do
          {
            double v11 = v15 * v17 + v11;
            --v20;
          }
          while (v20);
        }
      }
    }
  }
  return v11;
}

- (double)_calculateSizeForGrouped:(BOOL)a3 size:(CGSize)a4 idealizedSize:(BOOL)a5 ignoringExpandedNotificationStacks:(BOOL)a6 ignoreFeaturedLeadingView:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  double height = a4.height;
  double width = a4.width;
  BOOL v12 = a3;
  double v14 = [(NCNotificationListView *)self dataSource];
  unint64_t v15 = [v14 notificationListViewNumberOfItems:self];
  -[NCNotificationListView _widthForListViewInRect:](self, "_widthForListViewInRect:", 0.0, 0.0, width, height);
  double v17 = v16;
  if (v12)
  {
    if (!v15) {
      goto LABEL_36;
    }
    if (v15 <= 2) {
      uint64_t v18 = v15 == 2;
    }
    else {
      uint64_t v18 = 2;
    }
    [v14 notificationListView:self heightForItemAtIndex:0 withWidth:v16];
    if (v8) {
      [(NCNotificationListView *)self _computeStandardHeightIgnoringExpandedNotificationStacksAtIndex:0 width:v18 == 0 includeGroup:v17];
    }
    if (v9)
    {
      [(NCNotificationListView *)self groupedOverlapHeightMultiple];
      double v20 = v19;
      [(NCListAnimationSettings *)self->_animationSettings viewOverlap];
LABEL_35:
      double v16 = v20 * v21;
      goto LABEL_36;
    }
    if (![(NCNotificationListView *)self isHiddenBelowStack]
      && [(NCNotificationListView *)self showStackBelowLeadingView])
    {
      [(NCNotificationListView *)self groupedOverlapHeightMultiple];
      double v20 = v42;
      [(NCNotificationListView *)self _resolvedViewOverlap];
      goto LABEL_35;
    }
  }
  else
  {
    [(NCNotificationListView *)self _headerViewHeight];
    double v22 = 0.0;
    if (v23 > 0.0)
    {
      [(NCNotificationListView *)self _headerViewHeight];
      double v25 = v24;
      [(NCListAnimationSettings *)self->_animationSettings headerSpacing];
      double v22 = v25 + v26 + 0.0;
    }
    if (v15)
    {
      BOOL v27 = [(NCNotificationListView *)self _isShowingFeaturedLeadingViews];
      unint64_t v28 = 0;
      if (!v7 && v27)
      {
        -[NCNotificationListView _heightForFeaturedLeadingViewInRect:](self, "_heightForFeaturedLeadingViewInRect:", 0.0, 0.0, width, height);
        double v30 = v22 + v29;
        [(NCListAnimationSettings *)self->_animationSettings viewSpacing];
        double v22 = v30 + v31;
        unint64_t v28 = [(NCNotificationListView *)self numberOfFeaturedLeadingViews];
      }
      if (v28 < v15)
      {
        do
        {
          [v14 notificationListView:self heightForItemAtIndex:v28 withWidth:v17];
          if (v8) {
            [(NCNotificationListView *)self _computeStandardHeightIgnoringExpandedNotificationStacksAtIndex:v28 width:1 includeGroup:v17];
          }
          double v33 = v32;
          if (v32 <= 0.0)
          {
            [(NCListAnimationSettings *)self->_animationSettings viewSpacing];
            double v22 = v22 - v38;
          }
          else
          {
            if (!v28)
            {
              [(NCNotificationListView *)self _topSpacingForItemAtIndex:0];
              double v22 = v22 + v34;
            }
            if (![(NCNotificationListView *)self isRevealed] || (double v35 = 0.0, v9)) {
              -[NCNotificationListView _positionOffsetForRevealHintingForItemAtIndex:](self, "_positionOffsetForRevealHintingForItemAtIndex:", v28, v35);
            }
            double v36 = v33 + v22 + v35;
            [(NCNotificationListView *)self _bottomSpacingForItemAtIndex:v28];
            double v22 = v36 + v37;
          }
          ++v28;
        }
        while (v15 != v28);
      }
    }
    [(NCNotificationListView *)self _footerViewHeight];
    double v40 = v39;
    double v16 = 0.0;
    if (v40 > 0.0)
    {
      [(NCNotificationListView *)self footerViewVerticalMargin];
      double v16 = v40 + v41;
    }
  }
LABEL_36:
  v43 = [(NCNotificationListView *)self traitCollection];
  [v43 displayScale];
  UICeilToScale();
  double v45 = v44;

  return v45;
}

- (void)didExitAlwaysOn
{
  id v7 = [(NCNotificationListView *)self dataSource];
  uint64_t v3 = [v7 notificationListViewNumberOfItems:self];
  if (v3)
  {
    uint64_t v4 = v3;
    for (uint64_t i = 0; i != v4; ++i)
    {
      BOOL v6 = [(NCNotificationListView *)self _viewForItemAtIndex:i];
      [v6 layoutIfNeeded];
    }
  }
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)NCNotificationListView;
  [(NCNotificationListView *)&v9 layoutSubviews];
  [(NCNotificationListView *)self _configureDebugViewIfNeeded];
  [(NCNotificationListView *)self _removeDebugViewIfNeeded];
  uint64_t v3 = [(NCNotificationListView *)self dataSource];
  if (objc_opt_respondsToSelector()) {
    [v3 notificationListWillLayoutSubviews];
  }
  if ([(NCNotificationListView *)self _isGrouping]) {
    [(NCNotificationListView *)self _layoutForGrouping];
  }
  else {
    [(NCNotificationListView *)self _layoutForList];
  }
  [(NCNotificationListView *)self alpha];
  BOOL v5 = v4 < 1.0
    && [(NCNotificationListView *)self _isGrouping]
    && [(NCNotificationListView *)self count] > 1;
  BOOL v6 = [(NCNotificationListView *)self layer];
  [v6 setAllowsGroupOpacity:v5];

  [(NCNotificationListView *)self _adjustContentSizeWidthIfNecessary];
  [(NCNotificationListView *)self _layoutBackgroundViewIfNecessary];
  [(NCNotificationListView *)self _layoutHoverViewIfNecessary];
  id v7 = [(NCNotificationListView *)self insertedViewIndices];
  [v7 removeAllObjects];

  BOOL v8 = [(NCNotificationListView *)self reloadedViewIndices];
  [v8 removeAllObjects];

  [(NCNotificationListView *)self setRemovedViewIndex:0x7FFFFFFFFFFFFFFFLL];
  [(NCNotificationListView *)self setPerformingGroupingAnimation:0];
  [(NCNotificationListView *)self setSubviewPerformingGroupingAnimation:0];
  [(NCNotificationListView *)self setPerformingRevealAnimation:0];
  [(NCNotificationListView *)self setPerformingHeaderReloadAnimation:0];
  [(NCNotificationListView *)self setPerformingContentRevealAnimation:0];
  [(NCNotificationListView *)self setPerformingVisibleRectAdjustment:0];
  [(NCNotificationListView *)self setPerformingStackVisibilityAnimation:0];
  [(NCNotificationListView *)self setPerformingInteractiveTranslationAnimation:0];
  [(NCNotificationListView *)self setPerformingRevealTransitionAnimation:0];
  [(NCNotificationListView *)self setPerformingBottomMarginAdjustmentAnimation:0];
  [(NCNotificationListView *)self setPerformingInteractionVelocityAnimation:0];
  [(NCNotificationListView *)self setPerformingOverrideLeadingViewHeightAdjustment:0];
  [(NCNotificationListView *)self visibleRect];
  -[NCNotificationListView _updateVisibleViewsForUpdatedVisibleRect:](self, "_updateVisibleViewsForUpdatedVisibleRect:");
  [(NCNotificationListView *)self _layoutOverlayViewIfNecessary];
  [(NCNotificationListView *)self setPerformedFirstLayout:1];
  if (objc_opt_respondsToSelector()) {
    [v3 notificationListDidLayoutSubviews];
  }
}

- (void)subviewDidLayout
{
  id v2 = [(NCNotificationListView *)self dataSource];
  if (objc_opt_respondsToSelector()) {
    [v2 notificationListDidLayoutSubviews];
  }
}

- (BOOL)_shouldThrottleDebugViewUpdate
{
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v4 = [(NCNotificationListView *)self lastDebugViewUpdate];
  if (v4
    && (BOOL v5 = (void *)v4,
        [(NCNotificationListView *)self lastDebugViewUpdate],
        BOOL v6 = objc_claimAutoreleasedReturnValue(),
        [v3 timeIntervalSinceDate:v6],
        double v8 = fabs(v7),
        v6,
        v5,
        v8 < 1.0))
  {
    BOOL v9 = 1;
  }
  else
  {
    [(NCNotificationListView *)self setLastDebugViewUpdate:v3];
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_configureDebugViewIfNeeded
{
  if (_NCDeviceIsRunningInternalBuild())
  {
    if (!self->_debugView
      && ![(NCNotificationListView *)self _shouldThrottleDebugViewUpdate])
    {
      if (+[NCNotificationListDebugView shouldShow])
      {
        uint64_t v3 = [[NCNotificationListDebugView alloc] initWithListView:self];
        debugView = self->_debugView;
        self->_debugView = v3;

        if (self->_debugView)
        {
          -[NCNotificationListView addSubview:](self, "addSubview:");
          [(NCNotificationListView *)self _updateDebugViewFrame];
        }
      }
    }
  }
}

- (void)_removeDebugViewIfNeeded
{
  if (_NCDeviceIsRunningInternalBuild()
    && self->_debugView
    && ![(NCNotificationListView *)self _shouldThrottleDebugViewUpdate]
    && !+[NCNotificationListDebugView shouldShow])
  {
    [(NCNotificationListDebugView *)self->_debugView removeFromSuperview];
    debugView = self->_debugView;
    self->_debugView = 0;
  }
}

- (void)_updateDebugViewFrame
{
  debugView = self->_debugView;
  if (debugView)
  {
    [(NCNotificationListView *)self bounds];
    -[NCNotificationListDebugView setFrame:](debugView, "setFrame:");
  }
}

- (void)addSubview:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationListView;
  [(NCNotificationListView *)&v4 addSubview:a3];
  if (self->_debugView) {
    -[NCNotificationListView bringSubviewToFront:](self, "bringSubviewToFront:");
  }
}

- (void)bringSubviewToFront:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationListView;
  objc_super v4 = (NCNotificationListDebugView *)a3;
  [(NCNotificationListView *)&v6 bringSubviewToFront:v4];
  debugView = self->_debugView;

  if (debugView != v4) {
    -[NCNotificationListView bringSubviewToFront:](self, "bringSubviewToFront:", debugView, v6.receiver, v6.super_class);
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)NCNotificationListView;
  -[NCNotificationListView setFrame:](&v10, sel_setFrame_);
  if (![(NCNotificationListView *)self hasPerformedFirstLayout]) {
    [(NCNotificationListView *)self layoutIfNeeded];
  }
  [(NCNotificationListView *)self _updateDebugViewFrame];
  double v8 = [(NCNotificationListView *)self _directSuperListView];
  BOOL v9 = [v8 dataSource];
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0) {
    objc_msgSend(v9, "notificationListView:changingFrameOfView:toFrame:", v8, self, x, y, width, height);
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(NCNotificationListView *)self bounds];
  v16.origin.double x = v8;
  v16.origin.double y = v9;
  v16.size.double width = v10;
  v16.size.double height = v11;
  v15.origin.double x = x;
  v15.origin.double y = y;
  v15.size.double width = width;
  v15.size.double height = height;
  if (!CGRectEqualToRect(v15, v16))
  {
    v14.receiver = self;
    v14.super_class = (Class)NCNotificationListView;
    -[NCNotificationListView setBounds:](&v14, sel_setBounds_, x, y, width, height);
    [(NCNotificationListView *)self _updateDebugViewFrame];
    BOOL v12 = [(NCNotificationListView *)self _directSuperListView];
    double v13 = [v12 dataSource];
    if (v13)
    {
      if (objc_opt_respondsToSelector()) {
        objc_msgSend(v13, "notificationListView:changingBoundsOfView:toBounds:", v12, self, x, y, width, height);
      }
    }
  }
}

- (void)setAdditionalYOffset:(double)a3
{
  if (self->_additionalYOffset != a3)
  {
    self->_additionalYOffset = a3;
    [(NCNotificationListView *)self setAnimatingAdditionalYOffset:fabs(a3) > 0.001];
    [(NCNotificationListView *)self setNeedsLayout];
  }
}

- (void)setCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(NCNotificationListView *)self center];
  if (x != v7 || y != v6)
  {
    v11.receiver = self;
    v11.super_class = (Class)NCNotificationListView;
    -[NCNotificationListView setCenter:](&v11, sel_setCenter_, x, y);
    [(NCNotificationListView *)self _updateDebugViewFrame];
    CGFloat v9 = [(NCNotificationListView *)self _directSuperListView];
    CGFloat v10 = [v9 dataSource];
    if (v10)
    {
      if (objc_opt_respondsToSelector()) {
        objc_msgSend(v10, "notificationListView:changingCenterOfView:toCenter:", v9, self, x, y);
      }
    }
  }
}

- (void)setTransform:(CGAffineTransform *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationListView;
  long long v4 = *(_OWORD *)&a3->c;
  v5[0] = *(_OWORD *)&a3->a;
  v5[1] = v4;
  v5[2] = *(_OWORD *)&a3->tx;
  [(NCNotificationListView *)&v6 setTransform:v5];
  [(NCNotificationListView *)self _giveDataSourceUpdatedTransformWhichIncludesSubviewsXTranslation];
}

- (void)didMoveToSuperview
{
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationListView;
  [(NCNotificationListView *)&v5 didMoveToSuperview];
  uint64_t v3 = [(NCNotificationListView *)self superview];

  if (v3)
  {
    long long v4 = [(NCNotificationListView *)self _getDepth];
    [(NCNotificationListView *)self setDepth:v4];

    [(NCNotificationListView *)self setCachedSizeValid:0];
    [(NCNotificationListView *)self _configureDebugViewIfNeeded];
  }
}

- (void)setSupportsBottomViewsRollUnder:(BOOL)a3
{
  self->_supportsBottomViewsRollUnder = a3;
}

- (void)setGroupingViewOverlapCompressionFactor:(double)a3
{
  if (self->_groupingViewOverlapCompressionFactor != a3)
  {
    self->_groupingViewOverlapCompressionFactor = a3;
    [(NCNotificationListView *)self setNeedsLayout];
  }
}

- (void)updateBottomViewsRollUnder
{
  BOOL v3 = [(NCNotificationListView *)self supportsBottomViewsRollUnder];
  self->_shouldBottomViewsRollUnder = v3;
  if (!v3) {
    goto LABEL_7;
  }
  if ((unint64_t)([(id)*MEMORY[0x1E4FB2608] activeInterfaceOrientation] - 3) >= 2)
  {
    self->_shouldBottomViewsRollUnder = 1;
    goto LABEL_6;
  }
  long long v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  self->_shouldBottomViewsRollUnder = [v4 userInterfaceIdiom] == 1;

  if (self->_shouldBottomViewsRollUnder)
  {
LABEL_6:
    objc_super v5 = [(NCNotificationListView *)self traitCollection];
    objc_super v6 = [v5 preferredContentSizeCategory];
    self->_shouldBottomViewsRollUnder = !UIContentSizeCategoryIsAccessibilityCategory(v6);
  }
LABEL_7:
  double v7 = [(NCNotificationListView *)self visibleViews];
  CGFloat v8 = [v7 allValues];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__NCNotificationListView_updateBottomViewsRollUnder__block_invoke;
  v9[3] = &unk_1E6A93350;
  v9[4] = self;
  [v8 enumerateObjectsUsingBlock:v9];

  if ([(NCNotificationListView *)self hasPerformedFirstLayout]) {
    [(NCNotificationListView *)self setNeedsLayout];
  }
}

void __52__NCNotificationListView_updateBottomViewsRollUnder__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) _listViewForView:a2];
  [v2 updateBottomViewsRollUnder];
}

- (double)firstItemOffset
{
  if ([(NCNotificationListView *)self count])
  {
    uint64_t v3 = 0;
    while (1)
    {
      long long v4 = [(NCNotificationListView *)self visibleViewAtIndex:v3];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ![(NCNotificationListView *)self _isAlwaysPresentedAtTopOfScreenForView:v4])
      {
        break;
      }

      if (++v3 >= [(NCNotificationListView *)self count]) {
        goto LABEL_6;
      }
    }
    [v4 frame];
    double v11 = v10;

    return v11;
  }
  else
  {
LABEL_6:
    [(NCNotificationListView *)self frame];
    return CGRectGetHeight(*(CGRect *)&v5);
  }
}

- (NSNumber)distanceScrolledBeyondBottomOfContent
{
  uint64_t v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 bounds];
  double Height = CGRectGetHeight(v14);

  [(NCNotificationListView *)self contentSize];
  double v6 = Height - v5;
  [(NCNotificationListView *)self _footerViewHeight];
  double v8 = v6 - v7;
  if (_NCReactiveListUI())
  {
    [(NCNotificationListView *)self contentOffset];
    double v8 = v8 + v10;
  }
  if (v8 <= 0.0)
  {
    double v11 = 0;
  }
  else
  {
    *(float *)&double v9 = v8;
    double v11 = [NSNumber numberWithFloat:v9];
  }

  return (NSNumber *)v11;
}

- (NSString)debugDescription
{
  return (NSString *)[(NCNotificationListView *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)purposeHashed:(BOOL)a3
{
  uint64_t v3 = &OBJC_IVAR___NCNotificationListView__purpose;
  if (a3) {
    uint64_t v3 = &OBJC_IVAR___NCNotificationListView__purposeWithSensitiveTextHashed;
  }
  return *(id *)((char *)&self->super.super.super.super.isa + *v3);
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  long long v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  double v6 = [v4 builderWithObject:self];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__NCNotificationListView_descriptionBuilderWithMultilinePrefix___block_invoke;
  v11[3] = &unk_1E6A91A68;
  v11[4] = self;
  id v7 = v6;
  id v12 = v7;
  [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v11];

  double v8 = v12;
  id v9 = v7;

  return v9;
}

uint64_t __64__NCNotificationListView_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _appendBaseDescriptionToBuilder:*(void *)(a1 + 40)];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(NCNotificationListView *)self descriptionBuilderWithMultilinePrefix:a3];
  long long v4 = [v3 build];

  return v4;
}

- (id)succinctDescription
{
  id v2 = [(NCNotificationListView *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  long long v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  double v6 = [v4 builderWithObject:self];
  [v6 setUseDebugDescription:1];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __62__NCNotificationListView_debugDescriptionWithMultilinePrefix___block_invoke;
  v20[3] = &unk_1E6A91A68;
  v20[4] = self;
  id v7 = v6;
  id v21 = v7;
  [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v20];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  CGRect v16 = __62__NCNotificationListView_debugDescriptionWithMultilinePrefix___block_invoke_2;
  double v17 = &unk_1E6A91A68;
  uint64_t v18 = self;
  id v19 = v7;
  id v8 = v7;
  [v8 appendBodySectionWithName:@"Data" multilinePrefix:v5 block:&v14];
  id v9 = [(NCNotificationListView *)self subviews];
  double v10 = objc_msgSend(v9, "bs_compactMap:", &__block_literal_global_11);

  double v11 = [v10 sortedArrayUsingComparator:&__block_literal_global_59];

  [v8 appendArraySection:v11 withName:@"Subview" multilinePrefix:v5 skipIfEmpty:1];
  id v12 = [v8 build];

  return v12;
}

uint64_t __62__NCNotificationListView_debugDescriptionWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _appendBaseDescriptionToBuilder:*(void *)(a1 + 40)];
}

id __62__NCNotificationListView_debugDescriptionWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) depth];

  uint64_t v3 = *(void **)(a1 + 40);
  if (v2)
  {
    long long v4 = [*(id *)(a1 + 32) depth];
    id v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", objc_msgSend(v4, "unsignedIntegerValue"), @"ListDepth");
  }
  else
  {
    [*(id *)(a1 + 40) appendString:@"<nil>" withName:@"ListDepth"];
  }
  double v6 = [*(id *)(a1 + 32) index];

  id v7 = *(void **)(a1 + 40);
  if (v6)
  {
    id v8 = [*(id *)(a1 + 32) index];
    id v9 = (id)objc_msgSend(v7, "appendUnsignedInteger:withName:", objc_msgSend(v8, "unsignedIntegerValue"), @"Index");
  }
  else
  {
    [*(id *)(a1 + 40) appendString:@"<nil>" withName:@"Index"];
  }
  return (id)objc_msgSend(*(id *)(a1 + 40), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 32), "count"), @"ItemCount");
}

id __62__NCNotificationListView_debugDescriptionWithMultilinePrefix___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
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

uint64_t __62__NCNotificationListView_debugDescriptionWithMultilinePrefix___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 frame];
  double v7 = v6;
  [v5 frame];
  if (v7 == v8)
  {
    uint64_t v9 = 0;
  }
  else
  {
    [v4 frame];
    double v11 = v10;
    [v5 frame];
    if (v11 >= v12) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = -1;
    }
  }

  return v9;
}

- (id)_getDepth
{
  uint64_t v2 = [(NCNotificationListView *)self superview];
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    uint64_t v4 = 0;
    do
    {
      objc_opt_class();
      v4 += objc_opt_isKindOfClass() & 1;
      uint64_t v5 = [v3 superview];

      uint64_t v3 = (void *)v5;
    }
    while (v5);
  }
  else
  {
    uint64_t v4 = 0;
  }
  double v6 = NSNumber;

  return (id)[v6 numberWithUnsignedInteger:v4];
}

- (void)_appendBaseDescriptionToBuilder:(id)a3
{
  purpose = self->_purpose;
  id v5 = a3;
  [v5 appendString:purpose withName:@"Purpose"];
  [v5 appendString:self->_model withName:@"Model"];
  [(NCNotificationListView *)self _visibleRect];
  id v6 = (id)objc_msgSend(v5, "appendRect:withName:", @"VisibleRect");
  [(NCNotificationListView *)self frame];
  id v7 = (id)objc_msgSend(v5, "appendRect:withName:", @"Frame");
  [(NCNotificationListView *)self contentSize];
  id v8 = (id)objc_msgSend(v5, "appendSize:withName:", @"ContentSize");
  [(NCNotificationListView *)self contentOffset];
  id v9 = (id)objc_msgSend(v5, "appendPoint:withName:", @"ContentOffset");
  id v10 = (id)objc_msgSend(v5, "appendBool:withName:", -[NCNotificationListView isHidden](self, "isHidden"), @"IsHidden");
  [(NCNotificationListView *)self alpha];
  id v11 = (id)objc_msgSend(v5, "appendFloat:withName:", @"Alpha");
  [(NCNotificationListView *)self transform];
  double v12 = NSStringFromCGAffineTransform(&v13);
  [v5 appendString:v12 withName:@"Transform"];
}

- (double)_resolvedViewOverlap
{
  [(NCListAnimationSettings *)self->_animationSettings viewOverlap];
  double v4 = v3;
  [(NCNotificationListView *)self groupingViewOverlapCompressionFactor];
  return v4 * v5;
}

- (BOOL)_isViewWithinVisibleRectForHeight:(double)a3 layoutOffset:(double)a4
{
  [(NCNotificationListView *)self visibleRect];
  double MinY = CGRectGetMinY(v12);
  [(NCNotificationListView *)self visibleRect];
  double Height = CGRectGetHeight(v13);
  [(NCListAnimationSettings *)self->_animationSettings viewVisibilityMargin];
  if (a3 + a4 < MinY - v9) {
    return 0;
  }
  [(NCListAnimationSettings *)self->_animationSettings viewVisibilityMargin];
  return MinY + Height + v11 > a4;
}

- (void)_adjustContentSizeWidthIfNecessary
{
  [(NCNotificationListView *)self frame];
  double Width = CGRectGetWidth(v6);
  [(NCNotificationListView *)self contentSize];
  if (vabdd_f64(v4, Width) >= 2.22044605e-16)
  {
    [(NCNotificationListView *)self setContentSize:Width];
  }
}

- (double)_targetContentHeightForProposedHeight:(double)a3
{
  double v5 = [(NCNotificationListView *)self dataSource];
  if (objc_opt_respondsToSelector())
  {
    [v5 targetContentHeightForNotificationList:self];
    a3 = v6;
  }

  return a3;
}

- (void)_adjustContentSizeHeightIfNecessaryForUpdatedHeight:(double)a3
{
  [(NCNotificationListView *)self _targetContentHeightForProposedHeight:a3];
  double v5 = v4;
  [(NCNotificationListView *)self contentSize];
  if ((BSFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    [(NCNotificationListView *)self setCachedSizeValid:0];
    if ([(NCNotificationListView *)self isScrollEnabled])
    {
      if (([(NCNotificationListView *)self isTracking] & 1) == 0
        && ([(NCNotificationListView *)self isDecelerating] & 1) == 0)
      {
        [(NCNotificationListView *)self bounds];
        double v7 = v5 - v6;
        [(NCNotificationListView *)self contentInset];
        double v9 = v8 + v7;
        [(NCNotificationListView *)self contentOffset];
        if (v10 >= v9)
        {
          [(NCNotificationListView *)self contentInset];
          double v12 = -v11;
          if (v9 <= v12) {
            double v13 = v12;
          }
          else {
            double v13 = v9;
          }
          -[NCNotificationListView _setContentOffsetWithDecelerationAnimation:](self, "_setContentOffsetWithDecelerationAnimation:", 0.0, v13);
        }
      }
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __78__NCNotificationListView__adjustContentSizeHeightIfNecessaryForUpdatedHeight___block_invoke;
    v15[3] = &unk_1E6A91E60;
    v15[4] = self;
    *(double *)&v15[5] = v5;
    [(NCNotificationListView *)self _performViewAnimationBlock:v15 completionBlock:0 type:0];
    uint64_t v14 = [(NCNotificationListView *)self superview];
    [v14 setNeedsLayout];
  }
}

uint64_t __78__NCNotificationListView__adjustContentSizeHeightIfNecessaryForUpdatedHeight___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  [v2 frame];
  double Width = CGRectGetWidth(v7);
  double v4 = *(double *)(a1 + 40);

  return objc_msgSend(v2, "setContentSize:", Width, v4);
}

- (void)setContentSize:(CGSize)a3
{
  double v3 = fmax(a3.height, self->_minimumContentHeight);
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationListView;
  -[NCNotificationListView setContentSize:](&v4, sel_setContentSize_, a3.width, v3);
}

- (void)_layoutBackgroundViewIfNecessary
{
  if (self->_backgroundView) {
    goto LABEL_6;
  }
  if (![(NCNotificationListView *)self isGrouped])
  {
    double v3 = [(NCNotificationListView *)self _backgroundViewFromDataSource];
    backgroundView = self->_backgroundView;
    self->_backgroundView = v3;

    double v5 = self->_backgroundView;
    if (!v5) {
      return;
    }
    [(NCNotificationListView *)self bounds];
    -[UIView setFrame:](v5, "setFrame:");
    [(NCNotificationListView *)self addSubview:self->_backgroundView];
  }
  if (self->_backgroundView)
  {
LABEL_6:
    -[NCNotificationListView sendSubviewToBack:](self, "sendSubviewToBack:");
    [(NCNotificationListView *)self bounds];
    CGFloat x = v6;
    CGFloat y = v8;
    CGFloat width = v10;
    CGFloat height = v12;
    [(NCNotificationListView *)self overrideLeadingViewHeight];
    if (v14 > 0.0)
    {
      [(NCNotificationListView *)self overrideLeadingViewHeight];
      CGFloat height = v15;
    }
    [(NCNotificationListView *)self backgroundViewHorizontalOutsetMargin];
    double v17 = v16;
    if (![(NCNotificationListView *)self isGrouped])
    {
      v31.origin.CGFloat x = x;
      v31.origin.CGFloat y = y;
      v31.size.CGFloat width = width;
      v31.size.CGFloat height = height;
      CGRect v32 = CGRectInset(v31, -v17, 0.0);
      CGFloat x = v32.origin.x;
      CGFloat y = v32.origin.y;
      CGFloat width = v32.size.width;
      CGFloat height = v32.size.height;
    }
    if ([(NCNotificationListView *)self isRevealed]) {
      double v18 = 1.0;
    }
    else {
      double v18 = 0.0;
    }
    [(UIView *)self->_backgroundView frame];
    v34.origin.CGFloat x = v19;
    v34.origin.CGFloat y = v20;
    v34.size.CGFloat width = v21;
    v34.size.CGFloat height = v22;
    v33.origin.CGFloat x = x;
    v33.origin.CGFloat y = y;
    v33.size.CGFloat width = width;
    v33.size.CGFloat height = height;
    if (!CGRectEqualToRect(v33, v34)
      || ([(NCNotificationListView *)self backgroundView],
          double v23 = objc_claimAutoreleasedReturnValue(),
          [v23 alpha],
          double v25 = v24,
          v23,
          v18 != v25))
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __58__NCNotificationListView__layoutBackgroundViewIfNecessary__block_invoke;
      aBlock[3] = &unk_1E6A933B8;
      aBlock[4] = self;
      *(double *)&aBlock[5] = v18;
      *(CGFloat *)&aBlock[6] = x;
      *(CGFloat *)&aBlock[7] = y;
      *(CGFloat *)&aBlock[8] = width;
      *(CGFloat *)&aBlock[9] = height;
      double v26 = _Block_copy(aBlock);
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __58__NCNotificationListView__layoutBackgroundViewIfNecessary__block_invoke_2;
      v29[3] = &unk_1E6A91BB0;
      v29[4] = self;
      BOOL v27 = (void (**)(void))_Block_copy(v29);
      if ([(NCNotificationListView *)self isPerformingOverrideLeadingViewHeightAdjustment]|| [(NCNotificationListView *)self isReactiveLayout])
      {
        unint64_t v28 = [(NCNotificationListView *)self _currentAnimator];
        [v28 performWithoutAnimation:v26];

        v27[2](v27);
      }
      else
      {
        [(NCNotificationListView *)self _performViewAnimationBlock:v26 completionBlock:v27 type:0];
      }
    }
  }
}

void __58__NCNotificationListView__layoutBackgroundViewIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) backgroundView];
  [v2 setAlpha:*(double *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) backgroundView];
  objc_msgSend(v3, "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __58__NCNotificationListView__layoutBackgroundViewIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isGrouped];
  if (result)
  {
    [*(id *)(*(void *)(a1 + 32) + 2416) removeFromSuperview];
    id v3 = *(void **)(a1 + 32);
    return [v3 setBackgroundView:0];
  }
  return result;
}

- (void)_layoutOverlayViewIfNecessary
{
  if (self->_overlayView) {
    goto LABEL_6;
  }
  if (![(NCNotificationListView *)self isGrouped])
  {
    id v3 = [(NCNotificationListView *)self _overlayViewFromDataSource];
    overlayView = self->_overlayView;
    self->_overlayView = v3;

    double v5 = self->_overlayView;
    if (!v5) {
      return;
    }
    [(NCNotificationListView *)self bounds];
    -[UIView setFrame:](v5, "setFrame:");
    [(NCNotificationListView *)self addSubview:self->_overlayView];
  }
  if (self->_overlayView)
  {
LABEL_6:
    -[NCNotificationListView bringSubviewToFront:](self, "bringSubviewToFront:");
    [(NCNotificationListView *)self bounds];
    CGFloat x = v6;
    CGFloat y = v8;
    CGFloat width = v10;
    CGFloat height = v12;
    [(NCNotificationListView *)self overrideLeadingViewHeight];
    if (v14 > 0.0)
    {
      [(NCNotificationListView *)self overrideLeadingViewHeight];
      CGFloat height = v15;
    }
    [(NCNotificationListView *)self frame];
    double v17 = v16;
    if (![(NCNotificationListView *)self isGrouped])
    {
      v29.origin.CGFloat x = x;
      v29.origin.CGFloat y = y;
      v29.size.CGFloat width = width;
      v29.size.CGFloat height = height;
      CGRect v30 = CGRectInset(v29, -v17, 0.0);
      CGFloat x = v30.origin.x;
      CGFloat y = v30.origin.y;
      CGFloat width = v30.size.width;
      CGFloat height = v30.size.height;
    }
    if ([(NCNotificationListView *)self isRevealed]) {
      double v18 = 1.0;
    }
    else {
      double v18 = 0.0;
    }
    [(UIView *)self->_overlayView frame];
    v32.origin.CGFloat x = v19;
    v32.origin.CGFloat y = v20;
    v32.size.CGFloat width = v21;
    v32.size.CGFloat height = v22;
    v31.origin.CGFloat x = x;
    v31.origin.CGFloat y = y;
    v31.size.CGFloat width = width;
    v31.size.CGFloat height = height;
    if (!CGRectEqualToRect(v31, v32) || ([(UIView *)self->_overlayView alpha], v18 != v23))
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __55__NCNotificationListView__layoutOverlayViewIfNecessary__block_invoke;
      aBlock[3] = &unk_1E6A933B8;
      aBlock[4] = self;
      *(double *)&aBlock[5] = v18;
      *(CGFloat *)&aBlock[6] = x;
      *(CGFloat *)&aBlock[7] = y;
      *(CGFloat *)&aBlock[8] = width;
      *(CGFloat *)&aBlock[9] = height;
      double v24 = _Block_copy(aBlock);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __55__NCNotificationListView__layoutOverlayViewIfNecessary__block_invoke_2;
      v27[3] = &unk_1E6A91BB0;
      v27[4] = self;
      double v25 = (void (**)(void))_Block_copy(v27);
      if ([(NCNotificationListView *)self isPerformingOverrideLeadingViewHeightAdjustment]|| [(NCNotificationListView *)self isReactiveLayout])
      {
        double v26 = [(NCNotificationListView *)self _currentAnimator];
        [v26 performWithoutAnimation:v24];

        v25[2](v25);
      }
      else
      {
        [(NCNotificationListView *)self _performViewAnimationBlock:v24 completionBlock:v25 type:0];
      }
    }
  }
}

void __55__NCNotificationListView__layoutOverlayViewIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) overlayView];
  [v2 setAlpha:*(double *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) overlayView];
  objc_msgSend(v3, "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __55__NCNotificationListView__layoutOverlayViewIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isGrouped];
  if (result)
  {
    [*(id *)(*(void *)(a1 + 32) + 2424) removeFromSuperview];
    id v3 = *(void **)(a1 + 32);
    return [v3 setOverlayView:0];
  }
  return result;
}

- (void)_layoutHoverViewIfNecessary
{
  if (self->_hoverView) {
    goto LABEL_6;
  }
  if (![(NCNotificationListView *)self isGrouped])
  {
    id v3 = [(NCNotificationListView *)self _hoverViewFromDataSource];
    hoverView = self->_hoverView;
    self->_hoverView = v3;

    if (!self->_hoverView) {
      return;
    }
    -[NCNotificationListView addSubview:](self, "addSubview:");
  }
  if (self->_hoverView)
  {
LABEL_6:
    BOOL v5 = [(NCNotificationListView *)self isGrouped];
    double v6 = self->_hoverView;
    if (v5)
    {
      CGRect v7 = v6;
      double v8 = self->_hoverView;
      self->_hoverView = 0;

      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v65[2] = __53__NCNotificationListView__layoutHoverViewIfNecessary__block_invoke_2;
      v65[3] = &unk_1E6A91BB0;
      v66 = v7;
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __53__NCNotificationListView__layoutHoverViewIfNecessary__block_invoke_3;
      v62[3] = &unk_1E6A91A68;
      v63 = v66;
      v64 = self;
      double v9 = v66;
      [(NCNotificationListView *)self _performViewAnimationBlock:v65 completionBlock:v62 type:0];
    }
    else
    {
      [(NCNotificationListView *)self bringSubviewToFront:v6];
      [(NCNotificationListView *)self bounds];
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      [(NCNotificationListView *)self visibleRect];
      CGFloat v60 = v19;
      CGFloat v61 = v18;
      CGFloat v58 = v21;
      CGFloat v59 = v20;
      [(UIView *)self->_hoverView frame];
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      double v27 = v26;
      double v29 = v28;
      if ([(NCNotificationListView *)self _shouldReverseLayoutDirection])
      {
        [(NCNotificationListView *)self horizontalInsetMargin];
        double v31 = v30;
        [(NCListAnimationSettings *)self->_animationSettings hoverViewTrailingMargin];
        double v33 = v31 + v32;
      }
      else
      {
        v68.origin.CGFloat x = v11;
        v68.origin.CGFloat y = v13;
        v68.size.CGFloat width = v15;
        v68.size.double height = v17;
        double Width = CGRectGetWidth(v68);
        [(NCNotificationListView *)self horizontalInsetMargin];
        double v36 = Width - v35;
        v69.origin.CGFloat x = v23;
        v69.origin.CGFloat y = v25;
        v69.size.CGFloat width = v27;
        v69.size.double height = v29;
        double v37 = v36 - CGRectGetWidth(v69);
        [(NCListAnimationSettings *)self->_animationSettings hoverViewTrailingMargin];
        double v33 = v37 - v38;
      }
      BOOL v39 = [(NCNotificationListView *)self isHoverViewHidden];
      v70.origin.CGFloat x = v61;
      v70.origin.CGFloat y = v60;
      v70.size.CGFloat width = v59;
      v70.size.double height = v58;
      double MinY = CGRectGetMinY(v70);
      [(NCListAnimationSettings *)self->_animationSettings hoverViewMovingTopMargin];
      BOOL v42 = MinY > v41;
      self->_hoverViewHidden = MinY <= v41;
      double v43 = 1.0;
      if (!v42) {
        double v43 = 0.0;
      }
      [(UIView *)self->_hoverView setAlpha:v43];
      v71.origin.CGFloat x = v61;
      v71.origin.CGFloat y = v60;
      v71.size.CGFloat width = v59;
      v71.size.double height = v58;
      double v44 = CGRectGetMinY(v71);
      [(NCListAnimationSettings *)self->_animationSettings hoverViewMovingTopMargin];
      double v46 = v44 + v45;
      double height = self->_cachedSize.height;
      [(NCListAnimationSettings *)self->_animationSettings hoverViewBottomMarginMinimum];
      double v49 = height - v48;
      if (v46 >= v49) {
        double v50 = v49;
      }
      else {
        double v50 = v46;
      }
      BOOL v51 = v39 && !self->_hoverViewHidden;
      [(UIView *)self->_hoverView frame];
      v73.origin.CGFloat x = v52;
      v73.origin.CGFloat y = v53;
      v73.size.CGFloat width = v54;
      v73.size.double height = v55;
      v72.origin.CGFloat x = v33;
      v72.origin.CGFloat y = v50;
      v72.size.CGFloat width = v27;
      v72.size.double height = v29;
      if (!CGRectEqualToRect(v72, v73))
      {
        v56 = [(NCNotificationListView *)self hoverView];
        objc_msgSend(v56, "setFrame:", v33, v50, v27, v29);

        if (v51)
        {
          v57 = [(NCNotificationListView *)self hoverView];
          [v57 setAlpha:0.0];

          v67[0] = MEMORY[0x1E4F143A8];
          v67[1] = 3221225472;
          v67[2] = __53__NCNotificationListView__layoutHoverViewIfNecessary__block_invoke;
          v67[3] = &unk_1E6A91BB0;
          v67[4] = self;
          [(NCNotificationListView *)self _performViewAnimationBlock:v67 completionBlock:0 type:0];
        }
      }
    }
  }
}

void __53__NCNotificationListView__layoutHoverViewIfNecessary__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) hoverView];
  [v1 setAlpha:1.0];
}

uint64_t __53__NCNotificationListView__layoutHoverViewIfNecessary__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __53__NCNotificationListView__layoutHoverViewIfNecessary__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) hoverView];

  objc_super v4 = *(void **)(a1 + 32);
  if (v2 == v3)
  {
    int v7 = [*(id *)(a1 + 40) isHoverViewHidden];
    double v8 = 1.0;
    if (v7) {
      double v8 = 0.0;
    }
    return [v4 setAlpha:v8];
  }
  else
  {
    BOOL v5 = *(void **)(a1 + 32);
    return [v5 removeFromSuperview];
  }
}

- (double)_initialLayoutOffset
{
  if (![(NCNotificationListView *)self layoutFromBottom]) {
    return 0.0;
  }
  id v3 = [(NCNotificationListView *)self dataSource];
  [(NCNotificationListView *)self bounds];
  -[NCNotificationListView _widthForListViewInRect:](self, "_widthForListViewInRect:");
  double v5 = v4;
  if ([(NCNotificationListView *)self areSublistsRevealed]
    && ![(NCNotificationListView *)self isActiveRevealTransitioning])
  {
    unint64_t v6 = [(NCNotificationListView *)self count];
  }
  else
  {
    unint64_t v6 = [(NCNotificationListView *)self indexForReveal];
  }
  unint64_t v8 = v6;
  double v9 = 0.0;
  if (v6)
  {
    uint64_t v10 = 0;
    do
    {
      [v3 notificationListView:self heightForItemAtIndex:v10 withWidth:v5];
      if (v11 > 0.0)
      {
        double v12 = v11;
        if (!v10)
        {
          [(NCNotificationListView *)self _topSpacingForItemAtIndex:0];
          double v9 = v9 + v13;
        }
        [(NCNotificationListView *)self _bottomSpacingForItemAtIndex:v10];
        double v9 = v9 + v12 + v14;
      }
      ++v10;
    }
    while (v8 != v10);
  }
  [(NCNotificationListView *)self visibleRectBottomMarginForRollUnder];
  [(NCNotificationListView *)self bounds];
  CGRectGetHeight(v18);
  [(NCNotificationListView *)self contentInset];
  [(NCNotificationListView *)self interactionTranslation];
  CGFloat v15 = [(NCNotificationListView *)self traitCollection];
  [v15 displayScale];
  UIFloorToScale();
  double v17 = v16;

  return v17;
}

- (void)_layoutForList
{
  [(NCNotificationListView *)self _initialLayoutOffset];
  double v4 = v3;
  [(NCNotificationListView *)self _layoutHeaderViewIfNecessaryAtLayoutOffset:"_layoutHeaderViewIfNecessaryAtLayoutOffset:"];
  [(NCNotificationListView *)self _headerViewHeight];
  double v5 = 0.0;
  BOOL v7 = v6 <= 0.0;
  double v8 = 0.0;
  if (!v7)
  {
    [(NCNotificationListView *)self _headerViewHeight];
    double v10 = v9;
    [(NCListAnimationSettings *)self->_animationSettings headerSpacing];
    double v8 = v10 + v11;
  }
  double v12 = v4 + v8;
  unint64_t v13 = [(NCNotificationListView *)self count];
  if (v13)
  {
    unint64_t v14 = v13;
    [(NCNotificationListView *)self _topSpacingForItemAtIndex:0];
    uint64_t v15 = 0;
    char v16 = 0;
    double v12 = v12 + v17;
    double MinY = v12;
    do
    {
      double v19 = [(NCNotificationListView *)self visibleViewAtIndex:v15];
      double v20 = [(NCNotificationListView *)self _listViewForView:v19];
      double v21 = v20;
      if (v20
        && ([v20 isRevealed] & 1) == 0
        && ![(NCNotificationListView *)self isActiveRevealTransitioning])
      {
        BOOL v22 = [(NCNotificationListView *)self _isTopSubviewHeightLessThanVisibleRect];
        double v23 = 100.0;
        if (v22) {
          double v23 = 0.0;
        }
        double v24 = v12 + v23;
        [(NCNotificationListView *)self _topSpacingForItemAtIndex:v15];
        double v5 = v24 - v25;
        char v16 = 1;
      }
      if (!v15)
      {
        [v19 frame];
        double MinY = CGRectGetMinY(v43);
      }
      [(NCNotificationListView *)self _layoutViewIfNecessaryAtIndex:v15 layoutOffset:v12 startingLayoutOffset:MinY];
      double v27 = v26;
      if (v26 > v12 + 0.001)
      {
        [(NCNotificationListView *)self _bottomSpacingForItemAtIndex:v15];
        double v29 = v27 + v28;
        [v21 additionalBottomSpace];
        double v12 = v29 + v30;
      }

      ++v15;
    }
    while (v14 != v15);
  }
  else
  {
    char v16 = 0;
  }
  [(NCNotificationListView *)self footerViewVerticalMargin];
  [(NCNotificationListView *)self _layoutFooterViewIfNecessaryAtLayoutOffset:v12 + v31];
  [(NCNotificationListView *)self _footerViewHeight];
  double v32 = 0.0;
  if (v33 > 0.0)
  {
    [(NCNotificationListView *)self _footerViewHeight];
    double v35 = v34;
    [(NCNotificationListView *)self footerViewVerticalMargin];
    double v32 = v35 + v36;
  }
  BOOL v37 = [(NCNotificationListView *)self isPerformingHeaderGroupingAnimation];
  double v38 = [(NCNotificationListView *)self headerView];
  if (v37) {
    [(NCNotificationListView *)self sendSubviewToBack:v38];
  }
  else {
    [(NCNotificationListView *)self bringSubviewToFront:v38];
  }

  double v39 = v12 + v32;
  double v40 = [(NCNotificationListView *)self footerView];
  [(NCNotificationListView *)self sendSubviewToBack:v40];

  if (v16) {
    double v41 = v5;
  }
  else {
    double v41 = v39;
  }
  if (v41 < 0.0) {
    double v41 = 0.0;
  }

  [(NCNotificationListView *)self _adjustContentSizeHeightIfNecessaryForUpdatedHeight:v41];
}

- (void)_layoutHeaderViewIfNecessaryAtLayoutOffset:(double)a3
{
  [(NCNotificationListView *)self _headerViewHeight];
  double v6 = v5;
  if (-[NCNotificationListView _isViewWithinVisibleRectForHeight:layoutOffset:](self, "_isViewWithinVisibleRectForHeight:layoutOffset:"))
  {
    [(NCNotificationListView *)self bounds];
    -[NCNotificationListView _widthForListViewInRect:](self, "_widthForListViewInRect:");
    double v8 = v7;
    headerView = self->_headerView;
    if (headerView)
    {
      double v10 = headerView;
LABEL_11:
      [(NCNotificationListView *)self sendSubviewToBack:v10];
      if ([(NCNotificationListView *)self isPerformingHeaderReloadAnimation]) {
        [(UIView *)v10 setAlpha:0.0];
      }
      BOOL v21 = [(NCNotificationListView *)self _shouldRollUnderView:v10 withHeight:v6 layoutOffset:a3];
      [(NCNotificationListView *)self horizontalInsetMargin];
      double v23 = v22;
      double v24 = 1.0;
      if (![(NCNotificationListView *)self isRevealed])
      {
        [(NCListAnimationSettings *)self->_animationSettings headerViewRevealAlphaPercentage];
        double v26 = v25;
        [(NCNotificationListView *)self revealPercentage];
        double v24 = v26 * v27;
      }
      long long v28 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v56.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v56.c = v28;
      *(_OWORD *)&v56.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      if ([(NCNotificationListView *)self count])
      {
        double v29 = [(NCNotificationListView *)self visibleViews];
        double v30 = [v29 objectForKey:&unk_1F2F84280];

        double v31 = [(NCNotificationListView *)self dataSource];
        [v31 notificationListView:self heightForItemAtIndex:0 withWidth:v8];
        double v33 = v32;

        [(NCNotificationListView *)self layoutOffsetForViewAtIndex:0];
        if (v30
          && (double v35 = v34,
              [(NCNotificationListView *)self _shouldRollUnderView:v30 withHeight:v33 layoutOffset:v34]))
        {
          [(NCListAnimationSettings *)self->_animationSettings rollUnderLimitHeightMax];
          if (v33 >= v36) {
            double v33 = v36;
          }
          [(NCNotificationListView *)self _visibleRect];
          if (v6 + a3 > CGRectGetMaxY(v58))
          {
            double v24 = 0.0;
            [(UIView *)v10 setAlpha:0.0];
          }
          [(NCNotificationListView *)self _alphaForRollUnderForView:v10 withHeight:v6 layoutOffset:a3];
          double v24 = v24 * v37;
          memset(&v55, 0, sizeof(v55));
          [(NCNotificationListView *)self _transformForRollUnderForView:v30 withHeight:v33 layoutOffset:v35];
          CGAffineTransformMakeTranslation(&v56, 0.0, fmin(v35 + 0.0 - (v6 + a3), 0.0));
        }
        else if (v21)
        {
          [(NCNotificationListView *)self _alphaForRollUnderForView:v10 withHeight:v6 layoutOffset:a3];
          double v24 = v24 * v38;
          [(NCNotificationListView *)self _transformForRollUnderForView:v10 withHeight:v6 layoutOffset:a3];
        }
        double v39 = [(NCNotificationListView *)self _currentAnimator];
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __69__NCNotificationListView__layoutHeaderViewIfNecessaryAtLayoutOffset___block_invoke;
        v52[3] = &unk_1E6A933E0;
        v52[4] = self;
        CGFloat v53 = v10;
        CGAffineTransform v54 = v56;
        [v39 performWithoutAnimation:v52];
      }
      else if (v21)
      {
        [(NCNotificationListView *)self _alphaForRollUnderForView:v10 withHeight:v6 layoutOffset:a3];
        double v24 = v24 * v40;
        [(NCNotificationListView *)self _transformForRollUnderForView:v10 withHeight:v6 layoutOffset:a3];
      }
      CGAffineTransform v55 = v56;
      if (-[NCNotificationListView _shouldUpdateTransformedView:toFrame:alpha:transform:](self, "_shouldUpdateTransformedView:toFrame:alpha:transform:", v10, &v55, v23, a3, v8, v6, v24))
      {
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __69__NCNotificationListView__layoutHeaderViewIfNecessaryAtLayoutOffset___block_invoke_2;
        aBlock[3] = &unk_1E6A93408;
        aBlock[4] = self;
        double v45 = v10;
        double v46 = v23;
        double v47 = a3;
        double v48 = v8;
        double v49 = v6;
        CGAffineTransform v50 = v56;
        double v51 = v24;
        double v41 = _Block_copy(aBlock);
        if ([(NCNotificationListView *)self isPerformingGroupingAnimation]
          && ![(NCNotificationListView *)self _isAnimationStyleDissolve]
          || [(NCNotificationListView *)self isPerformingRevealAnimation])
        {
          [(NCNotificationListView *)self setPerformingHeaderGroupingAnimation:[(NCNotificationListView *)self isPerformingGroupingAnimation]];
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = __69__NCNotificationListView__layoutHeaderViewIfNecessaryAtLayoutOffset___block_invoke_3;
          v43[3] = &unk_1E6A91BB0;
          v43[4] = self;
          [(NCNotificationListView *)self _performViewAnimationBlock:v41 completionBlock:v43 type:0];
        }
        else
        {
          BOOL v42 = [(NCNotificationListView *)self _currentAnimator];
          [v42 performWithoutAnimation:v41];
        }
      }

      return;
    }
    unint64_t v13 = [(NCNotificationListView *)self _headerViewFromDataSource];
    unint64_t v14 = self->_headerView;
    self->_headerView = v13;

    [(NCNotificationListView *)self _headerViewHeight];
    double v6 = v15;
    [(NCNotificationListView *)self horizontalInsetMargin];
    double v17 = v16;
    BOOL v18 = [(NCNotificationListView *)self isPerformingGroupingAnimation];
    double v19 = 0.0;
    if (v18)
    {
      [(NCListAnimationSettings *)self->_animationSettings headerViewInitialOffsetHeightPercentage];
      double v19 = v6 * v20;
    }
    -[NCNotificationListView _updateTransformedView:toFrame:](self, "_updateTransformedView:toFrame:", self->_headerView, v17, v19 + a3, v8, v6);
    [(UIView *)self->_headerView setAlpha:0.0];
    [(NCNotificationListView *)self addSubview:self->_headerView];
    double v10 = self->_headerView;
    if (v10) {
      goto LABEL_11;
    }
  }
  else
  {
    double v11 = self->_headerView;
    if (v11)
    {
      [(UIView *)v11 removeFromSuperview];
      [(NCNotificationListView *)self _recycleViewIfNecessary:self->_headerView];
      double v12 = self->_headerView;
      self->_headerView = 0;
    }
  }
}

uint64_t __69__NCNotificationListView__layoutHeaderViewIfNecessaryAtLayoutOffset___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isPerformingBottomMarginAdjustmentAnimation] & 1) == 0
    && ([*(id *)(a1 + 32) isPerformingRevealAnimation] & 1) == 0
    && ([*(id *)(a1 + 32) isPerformingGroupingAnimation] & 1) == 0)
  {
    uint64_t v2 = *(void **)(a1 + 40);
    long long v3 = *(_OWORD *)(a1 + 64);
    v5[0] = *(_OWORD *)(a1 + 48);
    v5[1] = v3;
    v5[2] = *(_OWORD *)(a1 + 80);
    [v2 setTransform:v5];
  }
  return [*(id *)(a1 + 32) _updateBlurFilterForHeaderView:*(void *)(a1 + 40) translation:fabs(*(double *)(a1 + 88))];
}

uint64_t __69__NCNotificationListView__layoutHeaderViewIfNecessaryAtLayoutOffset___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  double v7 = *(double *)(a1 + 72);
  long long v8 = *(_OWORD *)(a1 + 96);
  v10[0] = *(_OWORD *)(a1 + 80);
  v10[1] = v8;
  v10[2] = *(_OWORD *)(a1 + 112);
  objc_msgSend(v2, "_updateTransformedView:toFrame:withTransform:", v3, v10, v4, v5, v6, v7);
  return [*(id *)(a1 + 40) setAlpha:*(double *)(a1 + 128)];
}

uint64_t __69__NCNotificationListView__layoutHeaderViewIfNecessaryAtLayoutOffset___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPerformingHeaderGroupingAnimation:0];
}

- (void)_updateBlurFilterForHeaderView:(id)a3 translation:(double)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(NCNotificationListView *)self shouldBottomViewsRollUnder];
  BOOL v8 = a4 < 0.0 || !v7;
  if (v8 || ![(NCNotificationListView *)self count])
  {
    unint64_t v13 = [v6 layer];
    [v13 setFilters:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    [(NCListAnimationSettings *)self->_animationSettings headerViewRevealBlurTranslationDistance];
    double v10 = a4 / v9;
    [(NCListAnimationSettings *)self->_animationSettings headerViewRevealBlurRadiusMax];
    double v12 = v10 * v11;
    unint64_t v13 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    [v13 setName:@"gaussianBlur"];
    unint64_t v14 = [NSNumber numberWithDouble:v12];
    [v13 setValue:v14 forKey:@"inputRadius"];

    double v15 = [v6 layer];
    v17[0] = v13;
    double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    [v15 setFilters:v16];
  }
}

- (void)_layoutFooterViewIfNecessaryAtLayoutOffset:(double)a3
{
  [(NCNotificationListView *)self _footerViewHeight];
  double v6 = v5;
  BOOL v7 = -[NCNotificationListView _isViewWithinVisibleRectForHeight:layoutOffset:](self, "_isViewWithinVisibleRectForHeight:layoutOffset:");
  footerView = self->_footerView;
  if (v7)
  {
    if (footerView)
    {
      double v9 = footerView;
    }
    else
    {
      double v11 = [(NCNotificationListView *)self _footerViewFromDataSource];
      double v12 = self->_footerView;
      self->_footerView = v11;

      [(NCNotificationListView *)self addSubview:self->_footerView];
      double v9 = self->_footerView;
      if (!v9) {
        return;
      }
    }
    [(NCNotificationListView *)self sendSubviewToBack:v9];
    [(NCNotificationListView *)self horizontalInsetMargin];
    double v14 = v13;
    [(NCNotificationListView *)self bounds];
    -[NCNotificationListView _widthForListViewInRect:](self, "_widthForListViewInRect:");
    double v16 = v15;
    if ([(NCNotificationListView *)self _shouldRollUnderView:v9 withHeight:v6 layoutOffset:a3])
    {
      [(NCNotificationListView *)self _alphaForRollUnderForView:v9 withHeight:v6 layoutOffset:a3];
      double v18 = v17;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v35 = 0u;
      [(NCNotificationListView *)self _transformForRollUnderForView:v9 withHeight:v6 layoutOffset:a3];
    }
    else
    {
      long long v19 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      long long v35 = *MEMORY[0x1E4F1DAB8];
      long long v36 = v19;
      long long v37 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      double v18 = 1.0;
    }
    double v20 = self->_footerView;
    long long v32 = v35;
    long long v33 = v36;
    long long v34 = v37;
    if (-[NCNotificationListView _shouldUpdateTransformedView:toFrame:alpha:transform:](self, "_shouldUpdateTransformedView:toFrame:alpha:transform:", v20, &v32, v14, a3, v16, v6, v18))
    {
      if ([(NCNotificationListView *)self isPerformingVisibleRectAdjustment])
      {
        BOOL v21 = self->_footerView;
        long long v32 = v35;
        long long v33 = v36;
        long long v34 = v37;
        -[NCNotificationListView _updateTransformedView:toFrame:withTransform:](self, "_updateTransformedView:toFrame:withTransform:", v21, &v32, v14, a3, v16, v6);
        [(UIView *)v9 setAlpha:v18];
      }
      else
      {
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __69__NCNotificationListView__layoutFooterViewIfNecessaryAtLayoutOffset___block_invoke;
        v22[3] = &unk_1E6A93408;
        v22[4] = self;
        double v23 = v9;
        double v24 = v14;
        double v25 = a3;
        double v26 = v16;
        double v27 = v6;
        long long v28 = v35;
        long long v29 = v36;
        long long v30 = v37;
        double v31 = v18;
        [(NCNotificationListView *)self _performViewAnimationBlock:v22 completionBlock:0 type:0];
      }
    }
  }
  else if (footerView)
  {
    [(UIView *)footerView removeFromSuperview];
    [(NCNotificationListView *)self _recycleViewIfNecessary:self->_footerView];
    double v10 = self->_footerView;
    self->_footerView = 0;
  }
}

uint64_t __69__NCNotificationListView__layoutFooterViewIfNecessaryAtLayoutOffset___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  double v7 = *(double *)(a1 + 72);
  long long v8 = *(_OWORD *)(a1 + 96);
  v10[0] = *(_OWORD *)(a1 + 80);
  v10[1] = v8;
  v10[2] = *(_OWORD *)(a1 + 112);
  objc_msgSend(v2, "_updateTransformedView:toFrame:withTransform:", v3, v10, v4, v5, v6, v7);
  return [*(id *)(a1 + 40) setAlpha:*(double *)(a1 + 128)];
}

- (BOOL)_isAlwaysPresentedAtTopOfScreenForView:(id)a3
{
  id v3 = a3;
  double v4 = [v3 purpose];
  if ([v4 isEqualToString:@"clock"])
  {
    char v5 = 1;
  }
  else
  {
    double v6 = [v3 purpose];
    char v5 = [v6 isEqualToString:@"AdjunctTopSticky"];
  }
  return v5;
}

- (double)_layoutViewIfNecessaryAtIndex:(unint64_t)a3 layoutOffset:(double)a4 startingLayoutOffset:(double)a5
{
  double v9 = [(NCNotificationListView *)self dataSource];
  BOOL v10 = [(NCNotificationListView *)self _isFeaturedLeadingViewAtIndex:a3];
  if (v10)
  {
    [(NCNotificationListView *)self _widthForFeaturedLeadingView];
    double v12 = v11;
    [(NCNotificationListView *)self _heightForFeaturedLeadingView];
  }
  else
  {
    [(NCNotificationListView *)self bounds];
    -[NCNotificationListView _widthForListViewInRect:](self, "_widthForListViewInRect:");
    double v12 = v14;
    objc_msgSend(v9, "notificationListView:heightForItemAtIndex:withWidth:", self, a3);
  }
  double v15 = v13;
  BOOL v16 = -[NCNotificationListView _isViewWithinVisibleRectForHeight:layoutOffset:](self, "_isViewWithinVisibleRectForHeight:layoutOffset:");
  uint64_t v17 = [(NCNotificationListView *)self visibleViewAtIndex:a3];
  double v18 = (void *)v17;
  if (v16)
  {
    uint64_t v19 = objc_opt_class();
    id v20 = v18;
    double v18 = v20;
    if (v19)
    {
      if (objc_opt_isKindOfClass()) {
        BOOL v21 = v20;
      }
      else {
        BOOL v21 = 0;
      }
    }
    else
    {
      BOOL v21 = 0;
    }
    id v36 = v21;

    double v37 = 0.0;
    if (v36)
    {
      if ([(NCNotificationListView *)self _isAlwaysPresentedAtTopOfScreenForView:v36])
      {
        [v36 setUserInteractionEnabled:0];
      }
      else
      {
        [(NCNotificationListView *)self additionalYOffset];
        double v37 = v38;
      }
    }
    double v39 = v37 + a4;
    BOOL v40 = [(NCNotificationListView *)self _isAnimationStyleDissolve];
    BOOL v113 = [(NCNotificationListView *)self shouldBottomViewsRollUnder];
    double v41 = (long long *)MEMORY[0x1E4F1DAB8];
    v114 = v9;
    if (v20)
    {
      if (v10) {
        goto LABEL_25;
      }
    }
    else
    {
      double v18 = [(NCNotificationListView *)self _viewForItemAtIndex:a3];
      [(NCNotificationListView *)self _setHiddenBelowStackForView:v18 hiddenBelowStack:0];
      [v9 notificationListView:self heightForItemAtIndex:a3 withWidth:*(double *)&v12];
      double v15 = v70;
      [(NCNotificationListView *)self _setVisibleView:v18 atIndex:a3];
      [(NCNotificationListView *)self addSubview:v18];
      if ([(NCNotificationListView *)self isPerformingGroupingAnimation])
      {
        CGRect v71 = [(NCNotificationListView *)self _currentAnimator];
        v145[0] = MEMORY[0x1E4F143A8];
        v145[1] = 3221225472;
        v145[2] = __90__NCNotificationListView__layoutViewIfNecessaryAtIndex_layoutOffset_startingLayoutOffset___block_invoke;
        v145[3] = &unk_1E6A91BB0;
        id v146 = v18;
        [v71 performWithoutAnimation:v145];

        double v9 = v114;
      }
      BOOL v72 = [(NCNotificationListView *)self isRevealed];
      double v73 = 0.0;
      if (v72) {
        double v73 = 1.0;
      }
      [(NCNotificationListView *)self _setRevealAlphaForView:v18 desiredAlpha:v73];
      [(NCNotificationListView *)self horizontalInsetMargin];
      double v75 = v74;
      if (v10)
      {
        int v76 = [(NCNotificationListView *)self _shouldReverseLayoutDirection];
        unint64_t v77 = a3;
        if (v76) {
          unint64_t v77 = [(NCNotificationListView *)self numberOfFeaturedLeadingViews] + ~a3;
        }
        double v78 = (double)v77;
        [(NCListAnimationSettings *)self->_animationSettings featuredLeadingViewSpacing];
        double v75 = v75 + v78 * (*(double *)&v12 + v79);
      }
      long long v109 = v41[1];
      long long v111 = *v41;
      *(_OWORD *)&v144.CGFloat a = *v41;
      *(_OWORD *)&v144.c = v109;
      long long v107 = v41[2];
      *(_OWORD *)&v144.tCGFloat x = v107;
      if (a3 && [(NCNotificationListView *)self isPerformingGroupingAnimation])
      {
        double v80 = 1.0;
        double v81 = v39;
        if (!v40)
        {
          [v9 notificationListView:self heightForItemAtIndex:0 withWidth:*(double *)&v12];
          -[NCNotificationListView _scaleTransformForGroupingAnimationForViewAtIndex:leadingViewHeight:](self, "_scaleTransformForGroupingAnimationForViewAtIndex:leadingViewHeight:", a3);
          double v80 = 0.0;
          double v81 = a5;
        }
      }
      else
      {
        double v80 = 1.0;
        double v81 = v39;
        if (!v40)
        {
          if ([(NCNotificationListView *)self isSubviewPerformingGroupingAnimation]&& ([(NCNotificationListView *)self visibleRect], v39 < CGRectGetMaxY(v150)))
          {
            [(NCNotificationListView *)self visibleRect];
            double MaxY = CGRectGetMaxY(v151);
            double v83 = (double)a3 * 100.0;
            double v80 = 0.0;
            if (v113) {
              double v83 = 0.0;
            }
            double v81 = v83 + MaxY;
            if (v113)
            {
              [(NCListAnimationSettings *)self->_animationSettings rollUnderScaleMinimum];
              CGFloat v85 = v84;
              [(NCListAnimationSettings *)self->_animationSettings rollUnderScaleMinimum];
              CGAffineTransformMakeScale(&v143, v85, v86);
              *(_OWORD *)&v144.CGFloat a = *(_OWORD *)&v143.a;
              *(_OWORD *)&v144.c = *(_OWORD *)&v143.c;
              long long v87 = *(_OWORD *)&v143.tx;
            }
            else
            {
              *(_OWORD *)&v144.CGFloat a = v111;
              *(_OWORD *)&v144.c = v109;
              long long v87 = v107;
            }
            *(_OWORD *)&v144.tCGFloat x = v87;
          }
          else
          {
            double v80 = 0.0;
            if (v113
              && ([(NCNotificationListView *)self _isAnimatingForParentNotificationListView]|| [(NCNotificationListView *)self isPerformingRevealAnimation]|| [(NCNotificationListView *)self isPerformingRevealTransitionAnimation]|| [(NCNotificationListView *)self isRevealTransitionScrolling]))
            {
              -[NCNotificationListView _transformForRollUnderForView:withHeight:layoutOffset:](self, "_transformForRollUnderForView:withHeight:layoutOffset:", v18, *(double *)&v15, v39, v107, v109, v111);
              CGAffineTransform v144 = v143;
            }
            double v81 = v39;
          }
        }
      }
      *(_OWORD *)&v143.CGFloat a = v111;
      *(_OWORD *)&v143.c = v109;
      *(_OWORD *)&v143.tCGFloat x = v107;
      objc_msgSend(v18, "setTransform:", &v143, v107, v109, v111);
      objc_msgSend(v18, "setFrame:", v75, v81, *(double *)&v12, *(double *)&v15);
      CGAffineTransform v143 = v144;
      [v18 setTransform:&v143];
      [v18 setAlpha:v80];
      *(_OWORD *)&v143.CGFloat a = v112;
      *(_OWORD *)&v143.c = v110;
      *(_OWORD *)&v143.tCGFloat x = v108;
      [(NCNotificationListView *)self _configureStackDimmingForGroupedView:v18 transform:&v143];
      if (v10)
      {
LABEL_25:
        [(NCNotificationListView *)self _setHiddenBelowStackForView:v18 hiddenBelowStack:0];
        [(NCNotificationListView *)self _setContentHiddenForView:v18 contentHidden:0];
        if ([(NCNotificationListView *)self isReactiveLayout])
        {
          long long v42 = v41[1];
          *(_OWORD *)&v144.CGFloat a = *v41;
          *(_OWORD *)&v144.c = v42;
          *(_OWORD *)&v144.tCGFloat x = v41[2];
          [v18 setTransform:&v144];
        }
        if (v10)
        {
          [(NCNotificationListView *)self _heightForFeaturedLeadingView];
          double v15 = v43;
          [(NCNotificationListView *)self horizontalInsetMargin];
          double v45 = v44;
          int v46 = [(NCNotificationListView *)self _shouldReverseLayoutDirection];
          unint64_t v47 = a3;
          if (v46) {
            unint64_t v47 = [(NCNotificationListView *)self numberOfFeaturedLeadingViews] + ~a3;
          }
          double v48 = (double)v47;
          [(NCListAnimationSettings *)self->_animationSettings featuredLeadingViewSpacing];
          double v50 = (*(double *)&v12 + v49) * v48;
        }
        else
        {
          [(NCNotificationListView *)self horizontalInsetMargin];
          double v45 = v51;
          double v50 = 0.0;
        }
        BOOL v52 = [(NCNotificationListView *)self isRevealed];
        double v53 = 0.0;
        double v54 = 0.0;
        if (!v52) {
          -[NCNotificationListView _positionOffsetForRevealHintingForItemAtIndex:](self, "_positionOffsetForRevealHintingForItemAtIndex:", a3, 0.0);
        }
        double v55 = v45 + v50;
        double v56 = v39 + v54;
        [(NCNotificationListView *)self interactionTranslationPercentage];
        double v58 = v57;
        [(NCNotificationListView *)self interactionTranslationFocalPointY];
        double v60 = -(v58 * (v59 - v39));
        [(NCListAnimationSettings *)self->_animationSettings interactionTranslationCollapseVerticalOffsetFactor];
        double v62 = v56 + v60 * v61;
        if (![(NCNotificationListView *)self isRevealed])
        {
          if ([(NCNotificationListView *)self isPerformingRevealAnimation]) {
            double v53 = 150.0;
          }
          else {
            double v53 = 0.0;
          }
        }
        v127.CGFloat a = v55;
        v127.b = v62 + v53;
        *(void *)&v127.c = v12;
        *(void *)&v127.d = v15;
        BOOL v63 = [(NCNotificationListView *)self isRevealed];
        double v64 = 1.0;
        if (!v63)
        {
          [(NCNotificationListView *)self revealPercentage];
          double v64 = v65 / ((double)a3 * 0.5 + 1.0);
        }
        t1.CGFloat a = v64;
        long long v66 = v41[1];
        *(_OWORD *)&v144.CGFloat a = *v41;
        *(_OWORD *)&v144.c = v66;
        *(_OWORD *)&v144.tCGFloat x = v41[2];
        BOOL v67 = [(NCNotificationListView *)self _isPerformingRollUnderListLayoutForView:v18 atIndex:a3 viewHeight:&v144 atLayoutOffset:&t1 targetTransform:&v127 targetAlpha:*(double *)&v15 viewFrame:v39];
        [(NCNotificationListView *)self _updateBottomMarginAdjustmentAnimationForView:v18 isPerformingRollUnderLayout:v67];
        [(NCNotificationListView *)self _updateLayoutParametersForHiddenGroupListViewAnimationForView:v18 targetTransform:&v144 targetAlpha:&t1];
        if ([(NCNotificationListView *)self isPerformingGroupingAnimation] && v40)
        {
          CGRect v68 = [(NCNotificationListView *)self _currentAnimator];
          v138[0] = MEMORY[0x1E4F143A8];
          v138[1] = 3221225472;
          v138[2] = __90__NCNotificationListView__layoutViewIfNecessaryAtIndex_layoutOffset_startingLayoutOffset___block_invoke_2;
          v138[3] = &unk_1E6A93430;
          v138[4] = self;
          id v139 = v18;
          long long v140 = *(_OWORD *)&v127.a;
          long long v141 = *(_OWORD *)&v127.c;
          BOOL v142 = v20 != 0;
          [v68 performWithoutAnimation:v138];
        }
        CGAffineTransform v143 = v144;
        if (!-[NCNotificationListView _shouldUpdateTransformedView:toFrame:alpha:transform:](self, "_shouldUpdateTransformedView:toFrame:alpha:transform:", v18, &v143, v127.a, v127.b, v127.c, v127.d, t1.a))goto LABEL_83; {
        BOOL v69 = [(NCNotificationListView *)self _shouldAnimateListLayoutForView:v18 atIndex:a3 isExistingView:v20 != 0 isPerformingRollUnderLayout:v67 shouldUpdateTransformedView:1];
        }
        if ([(NCNotificationListView *)self isPerformingContentRevealAnimation])
        {
          if (!a3)
          {
LABEL_67:
            char v89 = 1;
            goto LABEL_69;
          }
        }
        else
        {
          BOOL v88 = [(NCNotificationListView *)self isPerformingGroupingAnimation];
          if (!a3 && v88) {
            goto LABEL_67;
          }
        }
        v90 = [(NCNotificationListView *)self reloadedViewIndices];
        v91 = [NSNumber numberWithUnsignedInteger:a3];
        char v89 = [v90 containsObject:v91];

LABEL_69:
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __90__NCNotificationListView__layoutViewIfNecessaryAtIndex_layoutOffset_startingLayoutOffset___block_invoke_3;
        aBlock[3] = &unk_1E6A93458;
        aBlock[4] = self;
        id v92 = v18;
        id v132 = v92;
        long long v133 = *(_OWORD *)&v127.a;
        long long v134 = *(_OWORD *)&v127.c;
        CGAffineTransform v135 = v144;
        CGFloat a = t1.a;
        char v137 = v89;
        v93 = _Block_copy(aBlock);
        if (v69)
        {
          if ([(NCNotificationListView *)self isPerformingRevealAnimation] && !v113)
          {
            [(NCNotificationListView *)self _revealAnimationDelayForObjectAtIndex:a3];
            dispatch_time_t v95 = dispatch_time(0, (uint64_t)(v94 * 1000000000.0));
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __90__NCNotificationListView__layoutViewIfNecessaryAtIndex_layoutOffset_startingLayoutOffset___block_invoke_4;
            block[3] = &unk_1E6A930A8;
            block[4] = self;
            id v129 = v92;
            id v130 = v93;
            dispatch_after(v95, MEMORY[0x1E4F14428], block);

LABEL_82:
LABEL_83:
            v103 = [(NCNotificationListView *)self insertedViewIndices];
            v104 = [NSNumber numberWithUnsignedInteger:a3];
            int v105 = [v103 containsObject:v104];

            if (v105) {
              [(NCNotificationListView *)self _performInsertionAnimationForView:v18];
            }
            double v9 = v114;
            if (!v10
              || [(NCNotificationListView *)self numberOfFeaturedLeadingViews] - 1 <= a3)
            {
              double v39 = v39 + *(double *)&v15;
            }
            a4 = v39 - v37;

            goto LABEL_95;
          }
        }
        else
        {
          v96 = [(NCNotificationListView *)self viewsPerformingAnimation];
          int v97 = [v96 containsObject:v92];

          if (!v97)
          {
            v102 = [(NCNotificationListView *)self _currentAnimator];
            [v102 performWithoutAnimation:v93];

            goto LABEL_82;
          }
        }
        [(NCNotificationListView *)self _performRetargetableAnimationForView:v92 type:0 animationBlock:v93 completionBlock:0];
        goto LABEL_82;
      }
    }
    [(NCNotificationListView *)self sendSubviewToBack:v18];
    goto LABEL_25;
  }
  if (v17)
  {
    double v22 = [(NCNotificationListView *)self _listViewForView:v17];
    [(NCNotificationListView *)self visibleRect];
    if (CGRectGetMinY(v147) < a4
      && (-[NCNotificationListView _isAnimatingForParentNotificationListView](self, "_isAnimatingForParentNotificationListView")|| [v22 isGrouped]&& (objc_msgSend(v18, "center"), (BSFloatApproximatelyEqualToFloat() & 1) == 0)))
    {
      [(NCNotificationListView *)self sendSubviewToBack:v18];
      [(NCNotificationListView *)self horizontalInsetMargin];
      double v24 = v23;
      double v25 = a4;
      if ([(NCNotificationListView *)self shouldBottomViewsRollUnder])
      {
        [(NCNotificationListView *)self visibleRect];
        double v26 = CGRectGetMaxY(v148);
        [(NCListAnimationSettings *)self->_animationSettings notRevealedPlacementOffset];
        double v25 = v26 + v27;
      }
      [(NCNotificationListView *)self _visibleRect];
      double v28 = v25 - CGRectGetMaxY(v149);
      [(NCListAnimationSettings *)self->_animationSettings rollUnderNotVisibleTranslation];
      memset(&v144, 0, sizeof(v144));
      CGAffineTransformMakeTranslation(&v144, 0.0, v28 - v29);
      memset(&v143, 0, sizeof(v143));
      [(NCListAnimationSettings *)self->_animationSettings rollUnderScaleMinimum];
      CGFloat v31 = v30;
      [(NCListAnimationSettings *)self->_animationSettings rollUnderScaleMinimum];
      CGAffineTransformMakeScale(&v143, v31, v32);
      CGAffineTransform t1 = v143;
      memset(&v127, 0, sizeof(v127));
      CGAffineTransform t2 = v144;
      CGAffineTransformConcat(&v127, &t1, &t2);
      int v33 = _NCReactiveListUI();
      if (![(NCNotificationListView *)self isPerformingVisibleRectAdjustment]
        || ([(NCNotificationListView *)self visibleRect], v34 == 0.0))
      {
        int v35 = 0;
      }
      else
      {
        int v35 = v33 ^ 1;
      }
      if ((v33 | v35) == 1)
      {
        v100 = (void *)MEMORY[0x1E4FB1EB0];
        v121[0] = MEMORY[0x1E4F143A8];
        v121[1] = 3221225472;
        v121[2] = __90__NCNotificationListView__layoutViewIfNecessaryAtIndex_layoutOffset_startingLayoutOffset___block_invoke_5;
        v121[3] = &unk_1E6A93408;
        v121[4] = self;
        v101 = (id *)v122;
        v122[0] = v18;
        v122[1] = v24;
        *(double *)&v122[2] = v25;
        v122[3] = v12;
        v122[4] = v15;
        CGAffineTransform v123 = v127;
        unint64_t v124 = a3;
        [v100 _performWithoutRetargetingAnimations:v121];
      }
      else
      {
        v118[0] = MEMORY[0x1E4F143A8];
        v118[1] = 3221225472;
        v118[2] = __90__NCNotificationListView__layoutViewIfNecessaryAtIndex_layoutOffset_startingLayoutOffset___block_invoke_6;
        v118[3] = &unk_1E6A93480;
        v118[4] = self;
        v101 = v119;
        v119[0] = v18;
        v119[1] = v24;
        v119[2] = *(id *)&v25;
        v119[3] = v12;
        v119[4] = v15;
        CGAffineTransform v120 = v127;
        v115[0] = MEMORY[0x1E4F143A8];
        v115[1] = 3221225472;
        v115[2] = __90__NCNotificationListView__layoutViewIfNecessaryAtIndex_layoutOffset_startingLayoutOffset___block_invoke_7;
        v115[3] = &unk_1E6A934A8;
        v115[4] = self;
        id v116 = v119[0];
        unint64_t v117 = a3;
        [(NCNotificationListView *)self _performRetargetableAnimationForView:v116 type:0 animationBlock:v118 completionBlock:v115];
      }
    }
    else
    {
      v98 = [(NCNotificationListView *)self viewsPerformingAnimation];
      char v99 = [v98 containsObject:v18];

      if ((v99 & 1) == 0) {
        [(NCNotificationListView *)self _removeStoredVisibleViewAtIndex:a3];
      }
    }
  }
  if (![(NCNotificationListView *)self _isShowingFeaturedLeadingViews]
    || [(NCNotificationListView *)self numberOfFeaturedLeadingViews] - 1 <= a3)
  {
    a4 = *(double *)&v15 + a4;
  }
LABEL_95:

  return a4;
}

uint64_t __90__NCNotificationListView__layoutViewIfNecessaryAtIndex_layoutOffset_startingLayoutOffset___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __90__NCNotificationListView__layoutViewIfNecessaryAtIndex_layoutOffset_startingLayoutOffset___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  double v4 = [v2 traitCollection];
  [v4 displayScale];
  UIRectRoundToScale();
  objc_msgSend(v2, "_updateTransformedView:toFrame:", v3);

  uint64_t result = [*(id *)(a1 + 40) setAlpha:0.0];
  if (!*(unsigned char *)(a1 + 80))
  {
    double v6 = *(void **)(a1 + 40);
    return [v6 layoutIfNeeded];
  }
  return result;
}

uint64_t __90__NCNotificationListView__layoutViewIfNecessaryAtIndex_layoutOffset_startingLayoutOffset___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  double v7 = *(double *)(a1 + 72);
  long long v8 = *(_OWORD *)(a1 + 96);
  long long v13 = *(_OWORD *)(a1 + 80);
  long long v14 = v8;
  long long v15 = *(_OWORD *)(a1 + 112);
  objc_msgSend(v2, "_updateTransformedView:toFrame:withTransform:", v3, &v13, v4, v5, v6, v7);
  [*(id *)(a1 + 32) _setRevealAlphaForView:*(void *)(a1 + 40) desiredAlpha:*(double *)(a1 + 128)];
  if (*(unsigned char *)(a1 + 136)) {
    [*(id *)(a1 + 40) layoutIfNeeded];
  }
  double v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v13 = *MEMORY[0x1E4F1DAB8];
  long long v14 = v11;
  long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v9 _configureStackDimmingForGroupedView:v10 transform:&v13];
}

uint64_t __90__NCNotificationListView__layoutViewIfNecessaryAtIndex_layoutOffset_startingLayoutOffset___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performRetargetableAnimationForView:*(void *)(a1 + 40) type:0 animationBlock:*(void *)(a1 + 48) completionBlock:0];
}

uint64_t __90__NCNotificationListView__layoutViewIfNecessaryAtIndex_layoutOffset_startingLayoutOffset___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  double v7 = *(double *)(a1 + 72);
  long long v8 = *(_OWORD *)(a1 + 96);
  v10[0] = *(_OWORD *)(a1 + 80);
  v10[1] = v8;
  v10[2] = *(_OWORD *)(a1 + 112);
  objc_msgSend(v2, "_updateTransformedView:toFrame:withTransform:", v3, v10, v4, v5, v6, v7);
  [*(id *)(a1 + 40) setAlpha:0.0];
  return [*(id *)(a1 + 32) _removeStoredVisibleViewAtIndex:*(void *)(a1 + 128)];
}

uint64_t __90__NCNotificationListView__layoutViewIfNecessaryAtIndex_layoutOffset_startingLayoutOffset___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  double v7 = *(double *)(a1 + 72);
  long long v8 = *(_OWORD *)(a1 + 96);
  v10[0] = *(_OWORD *)(a1 + 80);
  v10[1] = v8;
  v10[2] = *(_OWORD *)(a1 + 112);
  objc_msgSend(v2, "_updateTransformedView:toFrame:withTransform:", v3, v10, v4, v5, v6, v7);
  return [*(id *)(a1 + 40) setAlpha:0.0];
}

uint64_t __90__NCNotificationListView__layoutViewIfNecessaryAtIndex_layoutOffset_startingLayoutOffset___block_invoke_7(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) viewsPerformingAnimation];
  [v2 removeObject:*(void *)(a1 + 40)];

  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 _removeStoredVisibleViewAtIndex:v4];
}

- (BOOL)_isPerformingRollUnderListLayoutForView:(id)a3 atIndex:(unint64_t)a4 viewHeight:(double)a5 atLayoutOffset:(double)MinY targetTransform:(CGAffineTransform *)a7 targetAlpha:(double *)a8 viewFrame:(CGRect *)a9
{
  id v16 = a3;
  uint64_t v17 = [(NCNotificationListView *)self _listViewForView:v16];
  double v18 = [(NCNotificationListView *)self visibleViewAtIndex:a4 - 1];
  BOOL v19 = [(NCNotificationListView *)self _shouldRollUnderView:v16 withHeight:a5 layoutOffset:MinY];
  if (v19)
  {
    double v20 = a5;
    if (![(NCNotificationListView *)self _isLayoutFromBottomUp])
    {
      [(NCListAnimationSettings *)self->_animationSettings rollUnderLimitHeightMax];
      if (v21 <= a5) {
        double v20 = v21;
      }
      else {
        double v20 = a5;
      }
    }
    double v22 = *a8;
    [(NCNotificationListView *)self _alphaForRollUnderForView:v16 withHeight:v20 layoutOffset:MinY];
    *a8 = v22 * v23;
    [(NCNotificationListView *)self _transformForRollUnderForView:v16 withHeight:v20 layoutOffset:MinY];
    *(_OWORD *)&a7->CGFloat a = v34;
    *(_OWORD *)&a7->c = v35;
    *(_OWORD *)&a7->tCGFloat x = v36;
    [(NCNotificationListView *)self _verticalTranslationProgressForView:v16 withHeight:v20 layoutOffset:MinY];
    -[NCNotificationListView _updateShadowForOverlappingRollUnderView:withProgress:](self, "_updateShadowForOverlappingRollUnderView:withProgress:", v18);
    double height = 0.0;
    if (v20 < a5)
    {
      [(NCNotificationListView *)self _rollUnderThresholdOffset];
      double height = v25 - (a7->ty + MinY);
    }
    if (height > a5) {
      double height = a5;
    }
    if (v17)
    {
      [v17 setOverrideLeadingViewHeight:height];
    }
    else
    {
      if (height <= 0.0) {
        double height = a9->size.height;
      }
      a9->size.double height = height;
    }
  }
  else
  {
    [v17 setOverrideLeadingViewHeight:0.0];
    [(NCNotificationListView *)self _updateShadowForOverlappingRollUnderView:v18 withProgress:0.0];
  }
  double v26 = 0.0;
  if ([(NCNotificationListView *)self shouldBottomViewsRollUnder])
  {
    [(NCNotificationListView *)self maximumLeadingViewHeight];
    if (v27 <= 0.0)
    {
      if (![(NCNotificationListView *)self shouldLimitViewHeightForRollUnder]) {
        goto LABEL_27;
      }
      [(NCNotificationListView *)self _rollUnderThresholdOffset];
      double v31 = v30;
      if (([v17 isGrouped] & 1) == 0)
      {
        [(NCNotificationListView *)self visibleRect];
        double MinY = CGRectGetMinY(v37);
      }
      double v29 = v31 - MinY;
    }
    else
    {
      [(NCNotificationListView *)self maximumLeadingViewHeight];
      double v29 = v28;
    }
    if (v29 > 0.0)
    {
      [(NCListAnimationSettings *)self->_animationSettings rollUnderLimitHeightMax];
      if (v29 >= v32) {
        double v26 = v29;
      }
      else {
        double v26 = v32;
      }
    }
  }
LABEL_27:
  [v17 setMaximumLeadingViewHeight:v26];

  return v19;
}

- (BOOL)_wasPerformingRollUnderLayoutForView:(id)a3 isPerformingRollUnderLayout:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [(NCNotificationListView *)self viewsPerformingRollUnderLayout];
  BOOL v8 = [v7 containsObject:v6] & !v4;

  double v9 = [(NCNotificationListView *)self viewsPerformingRollUnderLayout];
  uint64_t v10 = v9;
  if (v8)
  {
    [v9 removeObject:v6];
LABEL_6:

    goto LABEL_7;
  }
  int v11 = [v9 containsObject:v6];

  if (!v11 && v4)
  {
    uint64_t v10 = [(NCNotificationListView *)self viewsPerformingRollUnderLayout];
    [v10 addObject:v6];
    goto LABEL_6;
  }
LABEL_7:

  return v8;
}

- (void)_updateBottomMarginAdjustmentAnimationForView:(id)a3 isPerformingRollUnderLayout:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  if (v4)
  {
    if ([(NCNotificationListView *)self isPerformingBottomMarginAdjustmentAnimation])
    {
      id v6 = [(NCNotificationListView *)self viewsPerformingBottomMarginAdjustmentAnimation];
      [v6 addObject:v10];
LABEL_6:
    }
  }
  else
  {
    double v7 = [(NCNotificationListView *)self viewsPerformingBottomMarginAdjustmentAnimation];
    int v8 = [v7 containsObject:v10];

    if (v8)
    {
      id v6 = [(NCNotificationListView *)self viewsPerformingBottomMarginAdjustmentAnimation];
      [v6 removeObject:v10];
      goto LABEL_6;
    }
  }
  double v9 = [(NCNotificationListView *)self _listViewForView:v10];
  if (v9
    && [(NCNotificationListView *)self isPerformingBottomMarginAdjustmentAnimation])
  {
    [v9 setPerformingBottomMarginAdjustmentAnimation:1];
  }
}

- (void)_updateLayoutParametersForHiddenGroupListViewAnimationForView:(id)a3 targetTransform:(CGAffineTransform *)a4 targetAlpha:(double *)a5
{
  int v8 = [(NCNotificationListView *)self _listViewForView:a3];
  if ([(NCNotificationListView *)self isReactiveLayout]
    && ([v8 shouldBottomViewsRollUnder] & 1) == 0)
  {
    if (v8)
    {
      [v8 revealPercentage];
      if (v14 < 1.0)
      {
        if ([(NSString *)self->_purpose isEqualToString:@"TopLevel"])
        {
          [v8 revealPercentage];
          [v8 frame];
          double MinY = CGRectGetMinY(v32);
          [v8 frame];
          double Height = CGRectGetHeight(v33);
          uint64_t v17 = [(NCNotificationListView *)self traitCollection];
          [v17 displayScale];
          UIRoundToScale();
          double v19 = v18;

          memset(&v31, 0, sizeof(v31));
          CGAffineTransformMakeScale(&v31, v19 / Height, v19 / Height);
          footerCenterY = self->_footerCenterY;
          if (footerCenterY)
          {
            double v21 = MinY + v19;
            [(NSNumber *)footerCenterY bs_CGFloatValue];
            double v23 = v22;
            [(NCNotificationListView *)self visibleRect];
            double v24 = fmin(v23 + fmax(CGRectGetMinY(v34), 0.0) - v21, 0.0);
          }
          else
          {
            double v24 = 0.0;
          }
          memset(&v30, 0, sizeof(v30));
          CGAffineTransformMakeTranslation(&v30, 0.0, v24);
          CGAffineTransform t1 = v31;
          CGAffineTransform v27 = v30;
          CGAffineTransformConcat(&v29, &t1, &v27);
          long long v25 = *(_OWORD *)&v29.c;
          *(_OWORD *)&a4->CGFloat a = *(_OWORD *)&v29.a;
          *(_OWORD *)&a4->c = v25;
          *(_OWORD *)&a4->tCGFloat x = *(_OWORD *)&v29.tx;
          [v8 revealPercentage];
          *(void *)a5 = v26;
        }
      }
    }
  }
  else if (v8 {
         && ([v8 isRevealed] & 1) == 0
  }
         && [v8 isGrouped]
         && [(NCNotificationListView *)self shouldBottomViewsRollUnder])
  {
    memset(&v31, 0, sizeof(v31));
    [(NCListAnimationSettings *)self->_animationSettings rollUnderNotRevealedTranslationY];
    CGAffineTransformMakeTranslation(&v31, 0.0, v9);
    memset(&v30, 0, sizeof(v30));
    [(NCListAnimationSettings *)self->_animationSettings rollUnderNotRevealedScale];
    CGFloat v11 = v10;
    [(NCListAnimationSettings *)self->_animationSettings rollUnderNotRevealedScale];
    CGAffineTransformMakeScale(&v30, v11, v12);
    CGAffineTransform t1 = v31;
    CGAffineTransform v27 = v30;
    CGAffineTransformConcat(&v29, &t1, &v27);
    long long v13 = *(_OWORD *)&v29.c;
    *(_OWORD *)&a4->CGFloat a = *(_OWORD *)&v29.a;
    *(_OWORD *)&a4->c = v13;
    *(_OWORD *)&a4->tCGFloat x = *(_OWORD *)&v29.tx;
    *a5 = 0.0;
  }
}

- (BOOL)_shouldAnimateListLayoutForView:(id)a3 atIndex:(unint64_t)a4 isExistingView:(BOOL)a5 isPerformingRollUnderLayout:(BOOL)a6 shouldUpdateTransformedView:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  long long v13 = [(NCNotificationListView *)self insertedViewIndices];
  double v14 = [NSNumber numberWithUnsignedInteger:a4];
  int v15 = [v13 containsObject:v14];

  id v16 = [(NCNotificationListView *)self reloadedViewIndices];
  uint64_t v17 = [NSNumber numberWithUnsignedInteger:a4];
  double v18 = (void *)[v16 containsObject:v17];

  BOOL v19 = !v9 && [(NCNotificationListView *)self isPerformingGroupingAnimation];
  if ([(NCNotificationListView *)self isPerformingInteractiveTranslationAnimation])
  {
    [(NCNotificationListView *)self interactionTranslation];
    BOOL v21 = v20 == 0.0;
  }
  else
  {
    BOOL v21 = 0;
  }
  if (![(NCNotificationListView *)self isPerformingVisibleRectAdjustment]
    || [(NCNotificationListView *)self isPerformingGroupingAnimation]
    || [(NCNotificationListView *)self _isPerformingContentModification])
  {
    LOBYTE(v22) = 0;
  }
  else
  {
    int v22 = ![(NCNotificationListView *)self isListRevealTargetContentOffsetClamped]&& !v21;
  }
  unsigned int v23 = 0;
  if (((!v9 | v15) & 1) == 0 && (v22 & 1) == 0) {
    unsigned int v23 = v7 & ~[(NCNotificationListView *)self isActiveRevealTransitioning];
  }
  if ([(NCNotificationListView *)self isPerformingBottomMarginAdjustmentAnimation])
  {
    int v24 = 1;
  }
  else
  {
    long long v25 = [(NCNotificationListView *)self viewsPerformingBottomMarginAdjustmentAnimation];
    int v24 = [v25 containsObject:v12];
  }
  uint64_t v26 = [(NCNotificationListView *)self _listViewForView:v12];
  CGAffineTransform v27 = v26;
  if (v26) {
    int v28 = [v26 isPerformingRevealAnimation];
  }
  else {
    int v28 = 0;
  }
  if ([(NCNotificationListView *)self isPerformingRevealAnimation]
    || [(NCNotificationListView *)self isActiveRevealTransitioning])
  {
    int v29 = ![(NCNotificationListView *)self shouldBottomViewsRollUnder];
    if (v23) {
      goto LABEL_23;
    }
LABEL_26:
    if (v19) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  int v29 = 0;
  if (!v23) {
    goto LABEL_26;
  }
LABEL_23:
  if (![(NCNotificationListView *)self isAnimatingAdditionalYOffset] || v19)
  {
LABEL_28:
    LOBYTE(v30) = 1;
    if (!v8) {
      goto LABEL_33;
    }
    goto LABEL_31;
  }
LABEL_27:
  if (([(NCNotificationListView *)self isSubviewPerformingGroupingAnimation] | v28 | v18)) {
    goto LABEL_28;
  }
  int v30 = [v27 isPerformingRemovalAnimation] | v29;
  if (!v8)
  {
LABEL_33:
    char v31 = 1;
    goto LABEL_34;
  }
LABEL_31:
  if ([(NCNotificationListView *)self isPerformingGroupingAnimation]
    || (([(NCNotificationListView *)self isSubviewPerformingGroupingAnimation] | v24) & 1) != 0)
  {
    goto LABEL_33;
  }
  char v31 = [v27 isPerformingRemovalAnimation];
LABEL_34:
  [(NCNotificationListView *)self contentLayoutOffset];
  BOOL v33 = v32 <= 0.0 || v27 == 0;
  int v34 = !v33;
  if (!v33)
  {
    double v18 = [v27 insertedViewIndices];
    if ([v18 count])
    {
      BOOL v35 = 0;
LABEL_51:

      goto LABEL_52;
    }
    if (![(NCNotificationListView *)self _isLayoutFromBottomUp])
    {
      BOOL v35 = 1;
      goto LABEL_51;
    }
LABEL_46:
    long long v36 = [(NCNotificationListView *)self insertedViewIndices];
    BOOL v35 = [v36 count] == 0;

    if (!v34) {
      goto LABEL_52;
    }
    goto LABEL_51;
  }
  if ([(NCNotificationListView *)self _isLayoutFromBottomUp]) {
    goto LABEL_46;
  }
  BOOL v35 = 1;
LABEL_52:

  return v30 & v31 & v35;
}

- (BOOL)_isPerformingContentModification
{
  uint64_t v3 = [(NCNotificationListView *)self insertedViewIndices];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    double v5 = [(NCNotificationListView *)self reloadedViewIndices];
    if ([v5 count]) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = [(NCNotificationListView *)self removedViewIndex] != 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v4;
}

- (double)_positionOffsetForRevealHintingForItemAtIndex:(unint64_t)a3
{
  BOOL v5 = [(NCNotificationListView *)self shouldBottomViewsRollUnder];
  double result = 0.0;
  if (!v5)
  {
    [(NCNotificationListView *)self revealPercentage];
    return pow(v7, (double)(a3 + 1)) * 8.0;
  }
  return result;
}

- (void)setAnimatingAdditionalYOffset:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL animatingAdditionalYOffset = self->_animatingAdditionalYOffset;
  self->_BOOL animatingAdditionalYOffset = a3;
  if (animatingAdditionalYOffset != a3)
  {
    BOOL v4 = a3;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    BOOL v5 = [(NCNotificationListView *)self visibleViews];
    id v6 = [v5 allValues];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          CGFloat v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v11 setAnimatingAdditionalYOffset:v4];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)_layoutForGrouping
{
  if (![(NCNotificationListView *)self _isGrouping]) {
    return;
  }
  uint64_t v3 = [(NCNotificationListView *)self dataSource];
  unint64_t v4 = [v3 notificationListViewNumberOfItems:self];
  if (![(NCNotificationListView *)self showStackBelowLeadingView])
  {
    unint64_t v6 = 1;
LABEL_10:
    uint64_t v9 = 0;
    double Height = 0.0;
    double v10 = (long long *)MEMORY[0x1E4F1DAB8];
    while (1)
    {
      uint64_t v11 = [(NCNotificationListView *)self visibleViewAtIndex:v9];
      [(NCNotificationListView *)self _updateShadowForOverlappingRollUnderView:v11 withProgress:0.0];
      if (v11)
      {
        [(NCNotificationListView *)self sendSubviewToBack:v11];
        long long v12 = (void *)v11;
        if (!v9) {
          goto LABEL_22;
        }
      }
      else
      {
        long long v12 = [(NCNotificationListView *)self _viewForItemAtIndex:v9];
        [(NCNotificationListView *)self _setHiddenBelowStackForView:v12 hiddenBelowStack:v9 != 0];
        [(NCNotificationListView *)self _setVisibleView:v12 atIndex:v9];
        [(NCNotificationListView *)self addSubview:v12];
        [v12 setAlpha:0.0];
        long long v17 = v10[1];
        long long v18 = *v10;
        long long v16 = v18;
        long long v19 = v17;
        long long v20 = v10[2];
        long long v15 = v20;
        [v12 setTransform:&v18];
        long long v18 = v16;
        long long v19 = v17;
        long long v20 = v15;
        [(NCNotificationListView *)self _configureStackDimmingForGroupedView:v12 transform:&v18];
        [(NCNotificationListView *)self sendSubviewToBack:v12];
        if (!v9)
        {
          [(NCNotificationListView *)self setCachedSizeValid:0];
LABEL_22:
          [(NCNotificationListView *)self bringSubviewToFront:v12];
          [(NCNotificationListView *)self _layoutLeadingViewForGroupingLayoutIfNecessary:v12 hasShadow:v4 > 1 isExistingView:v11 != 0];
          [v12 frame];
          double Height = CGRectGetHeight(v22);
          char v14 = 1;
          if (v11) {
            goto LABEL_17;
          }
LABEL_16:
          [v12 setAlpha:1.0];
          goto LABEL_17;
        }
      }
      [(NCNotificationListView *)self groupingViewOverlapAlphaFactor];
      [(NCNotificationListView *)self _layoutGroupedViewForGroupingLayout:v12 atIndex:v9 isExistingView:v11 != 0 leadingViewHeight:Height alpha:v13];
      char v14 = 0;
      if (!v11) {
        goto LABEL_16;
      }
LABEL_17:
      if ((v14 & 1) == 0)
      {
        [(NCNotificationListView *)self groupingViewOverlapAlphaFactor];
        objc_msgSend(v12, "setAlpha:");
      }
      [v12 frame];
      double MaxY = CGRectGetMaxY(v21);

      if (v6 == ++v9) {
        goto LABEL_7;
      }
    }
  }
  [(NCListAnimationSettings *)self->_animationSettings groupListMaxViewCount];
  if (v5 > (double)v4) {
    double v5 = (double)v4;
  }
  unint64_t v6 = (unint64_t)v5;
  if ((unint64_t)v5) {
    goto LABEL_10;
  }
  double Height = 0.0;
  double MaxY = 0.0;
LABEL_7:
  [(NCNotificationListView *)self _layoutHeaderViewForGroupingIfNecessaryWithMaxYOffset:Height];
  [(NCNotificationListView *)self _layoutFooterViewForGroupingIfNecessary];
  [(NCNotificationListView *)self _layoutHiddenViewsForGroupingLayoutIfNecessaryWithLeadingViewHeight:Height];
  [(NCNotificationListView *)self _adjustContentSizeHeightIfNecessaryForUpdatedHeight:MaxY];
}

- (void)_layoutHeaderViewForGroupingIfNecessaryWithMaxYOffset:(double)a3
{
  double v5 = [(NCNotificationListView *)self headerView];
  if (v5)
  {
    unint64_t v6 = [(NCNotificationListView *)self viewsPerformingAnimation];
    char v7 = [v6 containsObject:v5];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = [(NCNotificationListView *)self viewsPerformingAnimation];
      [v8 addObject:v5];

      [v5 frame];
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      if (![(NCNotificationListView *)self _isAnimationStyleDissolve])
      {
        v27.origin.CGFloat x = v10;
        v27.origin.CGFloat y = v12;
        v27.size.CGFloat width = v14;
        v27.size.double height = v16;
        double v17 = a3 - CGRectGetHeight(v27);
        v28.origin.CGFloat x = v10;
        v28.origin.CGFloat y = v12;
        v28.size.CGFloat width = v14;
        v28.size.double height = v16;
        double v18 = CGRectGetMaxY(v28) * 0.5;
        if (v17 >= v18) {
          CGFloat v12 = v18;
        }
        else {
          CGFloat v12 = v17;
        }
      }
      [(NCNotificationListView *)self sendSubviewToBack:v5];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __80__NCNotificationListView__layoutHeaderViewForGroupingIfNecessaryWithMaxYOffset___block_invoke;
      v21[3] = &unk_1E6A923E8;
      id v22 = v5;
      CGFloat v23 = v10;
      CGFloat v24 = v12;
      CGFloat v25 = v14;
      CGFloat v26 = v16;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __80__NCNotificationListView__layoutHeaderViewForGroupingIfNecessaryWithMaxYOffset___block_invoke_2;
      v19[3] = &unk_1E6A91A68;
      v19[4] = self;
      id v20 = v22;
      [(NCNotificationListView *)self _performViewAnimationBlock:v21 completionBlock:v19 type:0];
    }
  }
}

uint64_t __80__NCNotificationListView__layoutHeaderViewForGroupingIfNecessaryWithMaxYOffset___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 setAlpha:0.0];
}

uint64_t __80__NCNotificationListView__layoutHeaderViewForGroupingIfNecessaryWithMaxYOffset___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) viewsPerformingAnimation];
  [v2 removeObject:*(void *)(a1 + 40)];

  [*(id *)(a1 + 40) removeFromSuperview];
  [*(id *)(a1 + 32) _recycleViewIfNecessary:*(void *)(a1 + 40)];
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 setHeaderView:0];
}

- (void)_layoutFooterViewForGroupingIfNecessary
{
  uint64_t v3 = [(NCNotificationListView *)self footerView];
  if (v3)
  {
    unint64_t v4 = [(NCNotificationListView *)self viewsPerformingAnimation];
    char v5 = [v4 containsObject:v3];

    if ((v5 & 1) == 0)
    {
      unint64_t v6 = [(NCNotificationListView *)self viewsPerformingAnimation];
      [v6 addObject:v3];

      [v3 frame];
      uint64_t v8 = v7;
      uint64_t v10 = v9;
      uint64_t v12 = v11;
      [(NCNotificationListView *)self sendSubviewToBack:v3];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __65__NCNotificationListView__layoutFooterViewForGroupingIfNecessary__block_invoke;
      v15[3] = &unk_1E6A923E8;
      id v16 = v3;
      uint64_t v17 = v8;
      uint64_t v18 = 0;
      uint64_t v19 = v10;
      uint64_t v20 = v12;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __65__NCNotificationListView__layoutFooterViewForGroupingIfNecessary__block_invoke_2;
      v13[3] = &unk_1E6A91A68;
      v13[4] = self;
      id v14 = v16;
      [(NCNotificationListView *)self _performViewAnimationBlock:v15 completionBlock:v13 type:0];
    }
  }
}

uint64_t __65__NCNotificationListView__layoutFooterViewForGroupingIfNecessary__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 setAlpha:0.0];
}

uint64_t __65__NCNotificationListView__layoutFooterViewForGroupingIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) viewsPerformingAnimation];
  [v2 removeObject:*(void *)(a1 + 40)];

  [*(id *)(a1 + 40) removeFromSuperview];
  [*(id *)(a1 + 32) _recycleViewIfNecessary:*(void *)(a1 + 40)];
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 setFooterView:0];
}

- (CGRect)_frameForViewAtIndex:(unint64_t)a3
{
  [(NCNotificationListView *)self bounds];
  -[NCNotificationListView _widthForListViewInRect:](self, "_widthForListViewInRect:");
  double v6 = v5;
  uint64_t v7 = [(NCNotificationListView *)self dataSource];
  [v7 notificationListView:self heightForItemAtIndex:a3 withWidth:v6];
  double Height = v8;

  if ([(NCNotificationListView *)self leadingContentShouldFillList]
    && [(NCNotificationListView *)self count] == 1
    && ![(NCNotificationListView *)self isPerformingGroupingAnimation])
  {
    [(NCNotificationListView *)self bounds];
    double Height = CGRectGetHeight(v18);
  }
  if (!a3)
  {
    [(NCNotificationListView *)self overrideLeadingViewHeight];
    if (v10 > 0.0)
    {
      [(NCNotificationListView *)self overrideLeadingViewHeight];
      if (v11 < Height) {
        double Height = v11;
      }
    }
    [(NCNotificationListView *)self maximumLeadingViewHeight];
    if (v12 > 0.0)
    {
      [(NCNotificationListView *)self maximumLeadingViewHeight];
      if (v13 < Height) {
        double Height = v13;
      }
    }
  }
  [(NCNotificationListView *)self horizontalInsetMargin];
  double v15 = 0.0;
  double v16 = v6;
  double v17 = Height;
  result.size.double height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (void)_layoutLeadingViewForGroupingLayoutIfNecessary:(id)a3 hasShadow:(BOOL)a4 isExistingView:(BOOL)a5
{
  id v7 = a3;
  [(NCNotificationListView *)self _frameForViewAtIndex:0];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  if (!a5)
  {
    double v16 = [(NCNotificationListView *)self _currentAnimator];
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __98__NCNotificationListView__layoutLeadingViewForGroupingLayoutIfNecessary_hasShadow_isExistingView___block_invoke;
    v69[3] = &unk_1E6A923E8;
    id v70 = v7;
    double v71 = v9;
    double v72 = v11;
    double v73 = v13;
    double v74 = v15;
    [v16 performWithoutAnimation:v69];
  }
  double v17 = [(NCNotificationListView *)self insertedViewIndices];
  int v18 = [v17 containsObject:&unk_1F2F84280];

  uint64_t v19 = [(NCNotificationListView *)self reloadedViewIndices];
  int v20 = [v19 containsObject:&unk_1F2F84280];

  if ((v18 & 1) != 0 || v20) {
    [(NCNotificationListView *)self setCachedSizeValid:0];
  }
  [(NCNotificationListView *)self interactionTranslationPercentage];
  double v22 = v21;
  [(NCListAnimationSettings *)self->_animationSettings interactionTranslationVerticalOffsetMax];
  double v24 = v23;
  [(NCNotificationListView *)self interactionTranslationPercentage];
  double v26 = v25;
  [(NCListAnimationSettings *)self->_animationSettings interactionTranslationOffsetMax];
  double v28 = -(v26 * v27) - v22 * v24;
  if (v11 != v28) {
    goto LABEL_11;
  }
  [v7 frame];
  v78.origin.CGFloat x = v29;
  v78.origin.CGFloat y = v30;
  v78.size.CGFloat width = v31;
  v78.size.double height = v32;
  v75.origin.CGFloat x = v9;
  v75.origin.CGFloat y = v11;
  v75.size.CGFloat width = v13;
  v75.size.double height = v15;
  if (((!CGRectEqualToRect(v75, v78) | v18 | v20) & 1) != 0
    || [(NCNotificationListView *)self isPerformingStackVisibilityAnimation]
    || -[NCNotificationListView isPerformingInteractiveTranslationAnimation](self, "isPerformingInteractiveTranslationAnimation")|| ([v7 alpha], v33 != 1.0))
  {
LABEL_11:
    int v34 = (_OWORD *)MEMORY[0x1E4F1DAB8];
    if (v18
      && (v76.origin.CGFloat x = v9,
          v76.origin.CGFloat y = v28,
          v76.size.CGFloat width = v13,
          v76.size.double height = v15,
          [(NCNotificationListView *)self _isViewWithinVisibleRectForHeight:CGRectGetHeight(v76) layoutOffset:0.0]))
    {
      objc_msgSend(v7, "setFrame:", v9, v28, v13, v15);
      [(NCListAnimationSettings *)self->_animationSettings animationInsertionStartAlpha];
      objc_msgSend(v7, "setAlpha:");
      if ([(NCNotificationListView *)self isPerformingGroupingAnimation])
      {
        double v35 = 1.0;
        if (![(NCNotificationListView *)self _isAnimationStyleDissolve])
        {
          [(NCListAnimationSettings *)self->_animationSettings animationScaleWhileGrouping];
          double v35 = v36;
        }
        memset(&v68, 0, sizeof(v68));
        CGAffineTransformMakeScale(&v68, v35, v35);
        BOOL v37 = [(NCNotificationListView *)self _isAnimationStyleDissolve];
        double v38 = 0.0;
        if (!v37)
        {
          [(NCListAnimationSettings *)self->_animationSettings animationTranslation];
          double v40 = v39;
          v77.origin.CGFloat x = v9;
          v77.origin.CGFloat y = v28;
          v77.size.CGFloat width = v13;
          v77.size.double height = v15;
          double v38 = v40 + (1.0 - v35) * -0.5 * CGRectGetHeight(v77);
        }
        memset(&v67, 0, sizeof(v67));
        CGAffineTransformMakeTranslation(&v67, 0.0, v38);
        CGAffineTransform t1 = v68;
        memset(&v66, 0, sizeof(v66));
        CGAffineTransform t2 = v67;
        CGAffineTransformConcat(&v66, &t1, &t2);
        CGAffineTransform t1 = v66;
        p_CGAffineTransform t1 = &t1;
      }
      else
      {
        unint64_t v45 = [(NCNotificationListView *)self count];
        animationSettings = self->_animationSettings;
        if (v45 < 2) {
          [(NCListAnimationSettings *)animationSettings animationScale];
        }
        else {
          [(NCListAnimationSettings *)animationSettings animationScaleGroupInsertion];
        }
        memset(&v68, 0, sizeof(v68));
        CGAffineTransformMakeScale(&v68, v47, v47);
        CGAffineTransform v67 = v68;
        p_CGAffineTransform t1 = &v67;
      }
      [v7 setTransform:p_t1];
    }
    else
    {
      [v7 setAlpha:1.0];
      if (![(NCNotificationListView *)self isPerformingGroupingAnimation]
        && ![(NCNotificationListView *)self isPerformingContentRevealAnimation])
      {
        unint64_t v42 = [(NCNotificationListView *)self removedViewIndex];
        char v43 = v28 == 0.0 ? 1 : v20;
        if (v42 && (v43 & 1) == 0)
        {
          long long v44 = v34[1];
          *(_OWORD *)&v68.CGFloat a = *v34;
          *(_OWORD *)&v68.c = v44;
          *(_OWORD *)&v68.tCGFloat x = v34[2];
          -[NCNotificationListView _updateTransformedView:toFrame:withTransform:](self, "_updateTransformedView:toFrame:withTransform:", v7, &v68, v9, v28, v13, v15);
        }
      }
    }
    if ([(NCNotificationListView *)self isHiddenBelowStack]) {
      uint64_t v48 = [(NCNotificationListView *)self showContentForGroupedViews] ^ 1;
    }
    else {
      uint64_t v48 = 0;
    }
    if ([(NCNotificationListView *)self isPerformingGroupingAnimation]
      || [(NCNotificationListView *)self isPerformingContentRevealAnimation])
    {
      LOBYTE(v20) = 1;
    }
    else if (![(NCNotificationListView *)self removedViewIndex])
    {
      LOBYTE(v20) = 1;
    }
    long long v52 = v34[1];
    *(_OWORD *)&v68.CGFloat a = *v34;
    *(_OWORD *)&v68.c = v52;
    *(_OWORD *)&v68.tCGFloat x = v34[2];
    if (-[NCNotificationListView _shouldUpdateTransformedView:toFrame:alpha:transform:](self, "_shouldUpdateTransformedView:toFrame:alpha:transform:", v7, &v68, v9, v28, v13, v15, 1.0, *(void *)&v68.tx, *(void *)&v68.ty, v52, *(void *)&v68.a, *(void *)&v68.b)|| [(NCNotificationListView *)self isPerformingStackVisibilityAnimation]|| [(NCNotificationListView *)self isPerformingInteractiveTranslationAnimation])
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __98__NCNotificationListView__layoutLeadingViewForGroupingLayoutIfNecessary_hasShadow_isExistingView___block_invoke_2;
      aBlock[3] = &unk_1E6A934D0;
      aBlock[4] = self;
      id v56 = v7;
      double v57 = v9;
      double v58 = v28;
      double v59 = v13;
      double v60 = v15;
      uint64_t v61 = 0x3FF0000000000000;
      char v62 = v20;
      char v63 = v48;
      double v49 = _Block_copy(aBlock);
      if (![(NCNotificationListView *)self isPerformingOverrideLeadingViewHeightAdjustment]|| [(NCNotificationListView *)self isPerformingGroupingAnimation]|| [(NCNotificationListView *)self isPerformingContentRevealAnimation]|| [(NCNotificationListView *)self isPerformingRevealAnimation]|| [(NCNotificationListView *)self isPerformingBottomMarginAdjustmentAnimation])
      {
        [(NCNotificationListView *)self _performViewAnimationBlock:v49 completionBlock:0 type:0];
      }
      else
      {
        double v50 = [(NCNotificationListView *)self _currentAnimator];
        [v50 performWithoutAnimation:v49];
      }
    }
    else
    {
      [(NCNotificationListView *)self _setContentHiddenForView:v7 contentHidden:v48];
      *(_OWORD *)&v68.CGFloat a = v54;
      *(_OWORD *)&v68.c = v53;
      *(_OWORD *)&v68.tCGFloat x = v51;
      [(NCNotificationListView *)self _configureStackDimmingForGroupedView:v7 transform:&v68];
    }
  }
}

uint64_t __98__NCNotificationListView__layoutLeadingViewForGroupingLayoutIfNecessary_hasShadow_isExistingView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __98__NCNotificationListView__layoutLeadingViewForGroupingLayoutIfNecessary_hasShadow_isExistingView___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  double v7 = *(double *)(a1 + 72);
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v14 = *MEMORY[0x1E4F1DAB8];
  long long v15 = *MEMORY[0x1E4F1DAB8];
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v13 = v8;
  long long v16 = v8;
  long long v17 = v12;
  objc_msgSend(v2, "_updateTransformedView:toFrame:withTransform:", v3, &v15, v4, v5, v6, v7);
  [*(id *)(a1 + 40) setAlpha:*(double *)(a1 + 80)];
  if (*(unsigned char *)(a1 + 88)) {
    [*(id *)(a1 + 40) layoutIfNeeded];
  }
  [*(id *)(a1 + 32) _setContentHiddenForView:*(void *)(a1 + 40) contentHidden:*(unsigned __int8 *)(a1 + 89)];
  double v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  long long v15 = v14;
  long long v16 = v13;
  long long v17 = v12;
  return [v9 _configureStackDimmingForGroupedView:v10 transform:&v15];
}

- (void)_layoutGroupedViewForGroupingLayout:(id)a3 atIndex:(unint64_t)a4 isExistingView:(BOOL)a5 leadingViewHeight:(double)a6 alpha:(double)a7
{
  BOOL v7 = a5;
  id v10 = a3;
  [(NCNotificationListView *)self _frameForViewAtIndex:a4];
  double y = v61.origin.y;
  double x = v61.origin.x;
  double width = v61.size.width;
  double height = v61.size.height;
  double v13 = CGRectGetHeight(v61);
  [(NCNotificationListView *)self groupedOverlapHeightMultiple];
  double v15 = v14;
  [(NCNotificationListView *)self _resolvedViewOverlap];
  double v17 = v16;
  [(NCNotificationListView *)self interactionTranslationPercentage];
  double v19 = v18;
  [(NCListAnimationSettings *)self->_animationSettings interactionTranslationOffsetMax];
  double v21 = v20;
  double v22 = 0.0;
  if (![(NCNotificationListView *)self isHiddenBelowStack]
    && [(NCNotificationListView *)self showStackBelowLeadingView])
  {
    double v22 = (v19 * v21 + v15 * v17) * (double)a4;
  }
  [(NCNotificationListView *)self interactionTranslationPercentage];
  double v24 = v23;
  [(NCListAnimationSettings *)self->_animationSettings interactionTranslationVerticalOffsetMax];
  double v26 = dbl_1D7D95B40[a4 == 1];
  double v27 = v22 - v24 * v25 + v41;
  [(NCNotificationListView *)self overrideLeadingViewHeight];
  if (v28 > 0.0)
  {
    [(NCNotificationListView *)self overrideLeadingViewHeight];
    if (v29 < v27) {
      double v27 = v29;
    }
  }
  memset(&v60.c, 0, 32);
  if (v27 >= v13) {
    double v30 = v26;
  }
  else {
    double v30 = v27 / v13;
  }
  *(_OWORD *)&v60.CGFloat a = 0uLL;
  CGAffineTransformMakeScale(&v60, v26, v30);
  [(NCNotificationListView *)self groupedTranslation];
  double v31 = v27 - (v30 * 0.5 + 0.5) * v13;
  memset(&v59, 0, sizeof(v59));
  CGAffineTransformMakeTranslation(&v59, v32, v31);
  CGAffineTransform t1 = v60;
  memset(&v58, 0, sizeof(v58));
  CGAffineTransform t2 = v59;
  CGAffineTransformConcat(&v58, &t1, &t2);
  CGAffineTransform t1 = v58;
  if (-[NCNotificationListView _shouldUpdateTransformedView:toFrame:alpha:transform:](self, "_shouldUpdateTransformedView:toFrame:alpha:transform:", v10, &t1, x, y, width, height, 1.0))
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __109__NCNotificationListView__layoutGroupedViewForGroupingLayout_atIndex_isExistingView_leadingViewHeight_alpha___block_invoke;
    aBlock[3] = &unk_1E6A934F8;
    id v33 = v10;
    id v46 = v33;
    CGFloat v47 = self;
    uint64_t v48 = v40;
    double v49 = x;
    double v50 = y;
    double v51 = width;
    double v52 = height;
    CGAffineTransform v53 = v58;
    CGAffineTransform v54 = v60;
    unint64_t v55 = a4;
    int v34 = (void (**)(void))_Block_copy(aBlock);
    if (![(NCNotificationListView *)self isPerformingOverrideLeadingViewHeightAdjustment]|| [(NCNotificationListView *)self isPerformingGroupingAnimation]|| [(NCNotificationListView *)self isPerformingContentRevealAnimation]|| ([(NCNotificationListView *)self overrideLeadingViewHeight], v35 == 0.0))
    {
      LOBYTE(v36) = 0;
      if (!v7) {
        goto LABEL_28;
      }
    }
    else
    {
      int v36 = ![(NCNotificationListView *)self isPerformingBottomMarginAdjustmentAnimation];
      if (!v7) {
        goto LABEL_28;
      }
    }
    if ((v36 & 1) == 0)
    {
      if ([(NCNotificationListView *)self isPerformingGroupingAnimation]
        || [(NCNotificationListView *)self isPerformingContentRevealAnimation]
        || [(NCNotificationListView *)self isPerformingStackVisibilityAnimation]
        || [(NCNotificationListView *)self isPerformingInteractiveTranslationAnimation]|| [(NCNotificationListView *)self removedViewIndex] < 3)
      {
        goto LABEL_26;
      }
      BOOL v37 = [(NCNotificationListView *)self reloadedViewIndices];
      if ([v37 count])
      {
LABEL_25:

LABEL_26:
        [(NCNotificationListView *)self _performViewAnimationBlock:v34 completionBlock:0 type:0];
LABEL_29:

        goto LABEL_30;
      }
      double v38 = [(NCNotificationListView *)self insertedViewIndices];
      if ([v38 count])
      {

        goto LABEL_25;
      }
      if (v33)
      {
        [v33 transform];
        double v39 = v44;
      }
      else
      {
        double v39 = 0.0;
      }

      if (v31 != v39) {
        goto LABEL_26;
      }
    }
LABEL_28:
    v34[2](v34);
    goto LABEL_29;
  }
LABEL_30:
}

uint64_t __109__NCNotificationListView__layoutGroupedViewForGroupingLayout_atIndex_isExistingView_leadingViewHeight_alpha___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 48)];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  double v6 = *(double *)(a1 + 72);
  double v7 = *(double *)(a1 + 80);
  long long v8 = *(_OWORD *)(a1 + 104);
  long long v13 = *(_OWORD *)(a1 + 88);
  long long v14 = v8;
  long long v15 = *(_OWORD *)(a1 + 120);
  objc_msgSend(v2, "_updateTransformedView:toFrame:withTransform:", v3, &v13, v4, v5, v6, v7);
  uint64_t v10 = *(void *)(a1 + 32);
  double v9 = *(void **)(a1 + 40);
  long long v11 = *(_OWORD *)(a1 + 152);
  long long v13 = *(_OWORD *)(a1 + 136);
  long long v14 = v11;
  long long v15 = *(_OWORD *)(a1 + 168);
  [v9 _configureStackDimmingForGroupedView:v10 transform:&v13];
  return [*(id *)(a1 + 40) _setContentHiddenForGroupedView:*(void *)(a1 + 32) atIndex:*(void *)(a1 + 184)];
}

- (void)_setContentHiddenForView:(id)a3 contentHidden:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) == 0;
  double v6 = v9;
  if (v5) {
    double v6 = 0;
  }
  double v7 = [v6 notificationViewController];
  long long v8 = v7;
  if (v7 && [v7 isNotificationContentViewHidden] != v4) {
    [v8 setNotificationContentViewHidden:v4];
  }
}

- (void)_setContentHiddenForGroupedView:(id)a3 atIndex:(unint64_t)a4
{
  [(NCNotificationListView *)self _setContentHiddenForView:a3 contentHidden:a4 != 0];
}

- (void)revealNotificationContentBelowGroupedViewIfNecessary:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NCNotificationListView *)self visibleViews];
  id v9 = [v5 objectForKey:&unk_1F2F84280];

  double v6 = v9;
  if (v9 == v4)
  {
    double v7 = [(NCNotificationListView *)self visibleViews];
    long long v8 = [v7 objectForKey:&unk_1F2F84298];

    [(NCNotificationListView *)self _setContentHiddenForView:v8 contentHidden:0];
    double v6 = v9;
  }
}

- (void)_configureStackDimmingForGroupedView:(id)a3 transform:(CGAffineTransform *)a4
{
  id v6 = a3;
  double v7 = [(NCNotificationListView *)self visibleViews];
  id v8 = [v7 objectForKey:&unk_1F2F84280];

  if (v8 == v6)
  {
    [(NCNotificationListView *)self overrideTopViewDimmingTransform];
    long long v9 = v18;
    *(_OWORD *)&a4->CGFloat a = v17;
    *(_OWORD *)&a4->c = v9;
    *(_OWORD *)&a4->tdouble x = v19;
  }
  id v10 = v6;
  if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    long long v11 = *(_OWORD *)&a4->c;
    long long v17 = *(_OWORD *)&a4->a;
    long long v18 = v11;
    long long v19 = *(_OWORD *)&a4->tx;
    [v10 configureStackDimmingForTransform:&v17];
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v10 && (isKindOfClass & 1) != 0)
  {
    id v13 = v10;
    if (![(NCNotificationListView *)self _isGrouping])
    {
      uint64_t v14 = MEMORY[0x1E4F1DAB8];
      long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&a4->CGFloat a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&a4->c = v15;
      *(_OWORD *)&a4->tdouble x = *(_OWORD *)(v14 + 32);
    }
    long long v16 = *(_OWORD *)&a4->c;
    long long v17 = *(_OWORD *)&a4->a;
    long long v18 = v16;
    long long v19 = *(_OWORD *)&a4->tx;
    [v13 setOverrideTopViewDimmingTransform:&v17];
  }
}

- (void)_layoutHiddenViewsForGroupingLayoutIfNecessaryWithLeadingViewHeight:(double)a3
{
  BOOL v5 = [(NCNotificationListView *)self visibleViews];
  id v6 = [v5 allKeys];

  double v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_120];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __94__NCNotificationListView__layoutHiddenViewsForGroupingLayoutIfNecessaryWithLeadingViewHeight___block_invoke_2;
  v8[3] = &unk_1E6A93540;
  v8[4] = self;
  *(double *)&v8[5] = a3;
  [v7 enumerateObjectsUsingBlock:v8];
}

uint64_t __94__NCNotificationListView__layoutHiddenViewsForGroupingLayoutIfNecessaryWithLeadingViewHeight___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __94__NCNotificationListView__layoutHiddenViewsForGroupingLayoutIfNecessaryWithLeadingViewHeight___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [v3 unsignedIntegerValue];
  if ([*(id *)(a1 + 32) showStackBelowLeadingView])
  {
    [*(id *)(*(void *)(a1 + 32) + 2464) groupListMaxViewCount];
    unint64_t v6 = (unint64_t)v5;
  }
  else
  {
    unint64_t v6 = 1;
  }
  if (v4 >= v6)
  {
    double v7 = [*(id *)(a1 + 32) visibleViews];
    id v8 = [v7 objectForKey:v3];

    [v8 bounds];
    double v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    [*(id *)(a1 + 32) horizontalInsetMargin];
    CGFloat v16 = v15;
    if (([*(id *)(a1 + 32) _isAnimationStyleDissolve] & 1) == 0)
    {
      v36.origin.double x = v16;
      v36.origin.double y = v10;
      v36.size.double width = v12;
      v36.size.double height = v14;
      double v10 = fmax(*(double *)(a1 + 40) - CGRectGetHeight(v36), 0.0);
    }
    [*(id *)(a1 + 32) sendSubviewToBack:v8];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v33 = 0u;
    if ([*(id *)(a1 + 32) _isAnimationStyleDissolve])
    {
      long long v17 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      long long v33 = *MEMORY[0x1E4F1DAB8];
      long long v34 = v17;
      long long v35 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    }
    else
    {
      long long v18 = *(void **)(a1 + 32);
      uint64_t v19 = [v3 unsignedIntegerValue];
      if (v18)
      {
        [v18 _scaleTransformForGroupingAnimationForViewAtIndex:v19 leadingViewHeight:*(double *)(a1 + 40)];
      }
      else
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v33 = 0u;
      }
    }
    double v20 = *(void **)(a1 + 32);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __94__NCNotificationListView__layoutHiddenViewsForGroupingLayoutIfNecessaryWithLeadingViewHeight___block_invoke_3;
    v24[3] = &unk_1E6A93480;
    v24[4] = v20;
    id v25 = v8;
    CGFloat v26 = v16;
    double v27 = v10;
    CGFloat v28 = v12;
    CGFloat v29 = v14;
    long long v30 = v33;
    long long v31 = v34;
    long long v32 = v35;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __94__NCNotificationListView__layoutHiddenViewsForGroupingLayoutIfNecessaryWithLeadingViewHeight___block_invoke_4;
    v22[3] = &unk_1E6A91A68;
    v22[4] = *(void *)(a1 + 32);
    id v23 = v3;
    id v21 = v8;
    [v20 _performRetargetableAnimationForView:v21 type:0 animationBlock:v24 completionBlock:v22];
  }
}

void __94__NCNotificationListView__layoutHiddenViewsForGroupingLayoutIfNecessaryWithLeadingViewHeight___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  double v7 = *(double *)(a1 + 72);
  long long v8 = *(_OWORD *)(a1 + 96);
  long long v14 = *(_OWORD *)(a1 + 80);
  long long v15 = v8;
  long long v16 = *(_OWORD *)(a1 + 112);
  objc_msgSend(v2, "_updateTransformedView:toFrame:withTransform:", v3, &v14, v4, v5, v6, v7);
  double v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  long long v11 = *(_OWORD *)(a1 + 96);
  long long v14 = *(_OWORD *)(a1 + 80);
  long long v15 = v11;
  long long v16 = *(_OWORD *)(a1 + 112);
  [v9 _configureStackDimmingForGroupedView:v10 transform:&v14];
  if ([*(id *)(a1 + 32) _isAnimationStyleDissolve])
  {
LABEL_4:
    [*(id *)(a1 + 40) setAlpha:0.0];
    return;
  }
  CGFloat v12 = [*(id *)(a1 + 32) insertedViewIndices];
  if ([v12 count])
  {
    char v13 = [*(id *)(a1 + 32) isPerformingGroupingAnimation];

    if (v13) {
      return;
    }
    goto LABEL_4;
  }
}

uint64_t __94__NCNotificationListView__layoutHiddenViewsForGroupingLayoutIfNecessaryWithLeadingViewHeight___block_invoke_4(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) unsignedIntegerValue];

  return [v1 _removeStoredVisibleViewAtIndex:v2];
}

- (void)setVisibleRect:(CGRect)a3
{
  if (self->_visibleRectIsBounds)
  {
    [(NCNotificationListView *)self bounds];
    double x = v4;
    double y = v6;
    double width = v8;
    double height = v10;
  }
  else
  {
    double height = a3.size.height;
    double width = a3.size.width;
    double y = a3.origin.y;
    double x = a3.origin.x;
  }
  [(NCNotificationListView *)self _visibleRect];
  v14.origin.double x = x;
  v14.origin.double y = y;
  v14.size.double width = width;
  v14.size.double height = height;
  if (!CGRectEqualToRect(v13, v14))
  {
    if (!-[NCNotificationListView _animateVisibleRectAdjustmentIfNecessaryWithVisibleRect:](self, "_animateVisibleRectAdjustmentIfNecessaryWithVisibleRect:", x, y, width, height))-[NCNotificationListView _setVisibleRectWithoutAlteringAnimations:](self, "_setVisibleRectWithoutAlteringAnimations:", x, y, width, height); {
    [(NCNotificationListView *)self setPerformingVisibleRectAdjustment:1];
    }
    [(NCNotificationListView *)self setNeedsLayout];
    [(NCNotificationListView *)self _visibleRect];
    -[NCNotificationListView _updateVisibleViewsForUpdatedVisibleRect:](self, "_updateVisibleViewsForUpdatedVisibleRect:");
  }
}

- (CGRect)visibleRect
{
  if (self->_visibleRectIsBounds) {
    [(NCNotificationListView *)self bounds];
  }
  else {
    [(NCNotificationListView *)self _visibleRect];
  }
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)_setVisibleRectWithoutAlteringAnimations:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(NCNotificationListView *)self willChangeValueForKey:@"visibleRect"];
  self->__visibleRect.origin.CGFloat x = x;
  self->__visibleRect.origin.CGFloat y = y;
  self->__visibleRect.size.CGFloat width = width;
  self->__visibleRect.size.CGFloat height = height;

  [(NCNotificationListView *)self didChangeValueForKey:@"visibleRect"];
}

- (void)setRevealPercentage:(double)a3
{
  int v5 = _NCReactiveListUI();
  double v6 = 1.0;
  if (!v5) {
    double v6 = a3;
  }
  if (vabdd_f64(self->_revealPercentage, v6) >= 2.22044605e-16)
  {
    self->_revealPercentage = v6;
    [(NCNotificationListView *)self setCachedSizeValid:0];
    [(NCNotificationListView *)self setNeedsLayout];
  }
}

- (void)setRevealed:(BOOL)a3
{
  if (self->_revealed != a3)
  {
    self->_revealed = a3;
    [(NCNotificationListView *)self setPerformingRevealAnimation:1];
    [(NCNotificationListView *)self setCachedSizeValid:0];
    [(NCNotificationListView *)self setNeedsLayout];
  }
}

- (void)setPerformingContentRevealAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(NCNotificationListView *)self isNotificationListViewCurrentlyVisible];
  self->_performingContentRevealAnimation = v5 && v3;
  if (v5 && v3)
  {
    [(NCNotificationListView *)self setCachedSizeValid:0];
    [(NCNotificationListView *)self setNeedsLayout];
  }
}

- (void)setSubviewPerformingGroupingAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(NCNotificationListView *)self isNotificationListViewCurrentlyVisible];
  self->_subviewPerformingGroupingAnimation = v5 && v3;
  if (v5 && v3)
  {
    double v6 = [(NCNotificationListView *)self superview];
    double v7 = [(NCNotificationListView *)self _listViewForView:v6];
    [v7 setSubviewPerformingGroupingAnimation:1];

    [(NCNotificationListView *)self setCachedSizeValid:0];
    [(NCNotificationListView *)self setNeedsLayout];
  }
}

- (void)setGrouped:(BOOL)a3
{
  if (self->_grouped != a3)
  {
    BOOL v3 = a3;
    BOOL v5 = [(NCNotificationListView *)self isNotificationListViewCurrentlyVisible];
    [(NCNotificationListView *)self setGroupedTranslation:0.0];
    [(NCNotificationListView *)self setPerformingGroupingAnimation:v5];
    double v6 = [(NCNotificationListView *)self superview];
    double v7 = [(NCNotificationListView *)self _listViewForView:v6];
    [v7 setSubviewPerformingGroupingAnimation:v5];

    self->_grouped = v3;
    [(NCNotificationListView *)self setCachedSizeValid:0];
    [(NCNotificationListView *)self _updateStackedViewsForGrouping:v3];
    [(NCNotificationListView *)self setNeedsLayout];
  }
}

- (void)insertViewAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = [(NCNotificationListView *)self insertedViewIndices];
  double v8 = (void *)[v7 copy];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__NCNotificationListView_insertViewAtIndex_animated___block_invoke;
  v12[3] = &unk_1E6A93568;
  v12[4] = self;
  v12[5] = a3;
  [v8 enumerateObjectsUsingBlock:v12];
  if (v4
    && [(NCNotificationListView *)self isNotificationListViewCurrentlyVisible])
  {
    double v9 = [(NCNotificationListView *)self insertedViewIndices];
    double v10 = [NSNumber numberWithUnsignedInteger:a3];
    [v9 addObject:v10];
  }
  [(NCNotificationListView *)self _updateStoredVisibleViewsForViewInsertedAtIndex:a3];
  [(NCNotificationListView *)self setCachedSizeValid:0];
  [(NCNotificationListView *)self setNeedsLayout];
  long long v11 = [(NCNotificationListView *)self superview];
  [v11 setNeedsLayout];
}

void __53__NCNotificationListView_insertViewAtIndex_animated___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  unint64_t v3 = [v8 unsignedIntegerValue];
  if (v3 > *(void *)(a1 + 40))
  {
    unint64_t v4 = v3;
    BOOL v5 = [*(id *)(a1 + 32) insertedViewIndices];
    [v5 removeObject:v8];

    double v6 = [*(id *)(a1 + 32) insertedViewIndices];
    double v7 = [NSNumber numberWithUnsignedInteger:v4 + 1];
    [v6 addObject:v7];
  }
}

- (void)removeViewAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
}

- (void)removeViewAtIndex:(unint64_t)a3 animated:(BOOL)a4 isHorizontallyDisplaced:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  -[NCNotificationListView visibleViewAtIndex:](self, "visibleViewAtIndex:");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [(NCNotificationListView *)self _updateStoredVisibleViewsForViewRemovedAtIndex:a3];
  if (v10)
  {
    if (v6
      && [(NCNotificationListView *)self isNotificationListViewCurrentlyVisible])
    {
      [(NCNotificationListView *)self _performRemovalAnimationForView:v10 index:a3 isHorizontallyDisplaced:v5];
    }
    else
    {
      double v9 = [(NCNotificationListView *)self dataSource];
      if (objc_opt_respondsToSelector())
      {
        [(NCNotificationListView *)self _bottomSpacingForItemAtIndex:a3];
        objc_msgSend(v9, "notificationListView:willRemoveView:bottomSpacing:", self, v10);
      }
      [v10 removeFromSuperview];
      [(NCNotificationListView *)self _recycleViewIfNecessary:v10];
      if (objc_opt_respondsToSelector()) {
        [v9 notificationListView:self didRemoveView:v10];
      }
    }
  }
  [(NCNotificationListView *)self setRemovedViewIndex:a3];
  if (v5) {
    [(NCNotificationListView *)self _configureClippingIfNecessary];
  }
  [(NCNotificationListView *)self setCachedSizeValid:0];
  [(NCNotificationListView *)self setNeedsLayout];
}

- (void)reloadViewAtIndex:(unint64_t)a3
{
  if ([(NCNotificationListView *)self isNotificationListViewCurrentlyVisible])
  {
    BOOL v5 = [(NCNotificationListView *)self reloadedViewIndices];
    BOOL v6 = [NSNumber numberWithUnsignedInteger:a3];
    [v5 addObject:v6];
  }
  [(NCNotificationListView *)self setCachedSizeValid:0];
  [(NCNotificationListView *)self setNeedsLayout];
  id v7 = [(NCNotificationListView *)self superview];
  [v7 setNeedsLayout];
}

- (void)invalidateData
{
  [(NCNotificationListView *)self _removeAllStoredVisibleViews];
  headerView = self->_headerView;
  if (headerView)
  {
    [(UIView *)headerView removeFromSuperview];
    [(NCNotificationListView *)self _recycleViewIfNecessary:self->_headerView];
    unint64_t v4 = self->_headerView;
    self->_headerView = 0;
  }
  footerView = self->_footerView;
  if (footerView)
  {
    [(UIView *)footerView removeFromSuperview];
    [(NCNotificationListView *)self _recycleViewIfNecessary:self->_footerView];
    BOOL v6 = self->_footerView;
    self->_footerView = 0;
  }
  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    [(UIView *)backgroundView removeFromSuperview];
    id v8 = self->_backgroundView;
    self->_backgroundView = 0;
  }
  hoverView = self->_hoverView;
  if (hoverView)
  {
    [(UIView *)hoverView removeFromSuperview];
    id v10 = self->_hoverView;
    self->_hoverView = 0;
  }
  [(NCNotificationListView *)self setCachedSizeValid:0];

  [(NCNotificationListView *)self setNeedsLayout];
}

- (void)invalidateHeight
{
}

- (void)reloadHeaderView
{
  if (self->_headerView)
  {
    [(NCNotificationListView *)self setPerformingHeaderReloadAnimation:1];
    unint64_t v3 = self->_headerView;
    headerView = self->_headerView;
    self->_headerView = 0;

    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __42__NCNotificationListView_reloadHeaderView__block_invoke;
    v13[3] = &unk_1E6A91A68;
    CGRect v14 = v3;
    long long v15 = self;
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    id v8 = __42__NCNotificationListView_reloadHeaderView__block_invoke_2;
    double v9 = &unk_1E6A93590;
    BOOL v5 = v14;
    id v10 = v5;
    objc_copyWeak(&v12, &location);
    long long v11 = self;
    [(NCNotificationListView *)self _performViewAnimationBlock:v13 completionBlock:&v6 type:0];
    -[NCNotificationListView setCachedSizeValid:](self, "setCachedSizeValid:", 0, v6, v7, v8, v9);
    [(NCNotificationListView *)self setNeedsLayout];
    objc_destroyWeak(&v12);

    objc_destroyWeak(&location);
  }
}

uint64_t __42__NCNotificationListView_reloadHeaderView__block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  unint64_t v3 = [*(id *)(a1 + 40) animationSettings];
  [v3 headerViewRemoveAnimationTransform];
  CGFloat v5 = v4;
  uint64_t v6 = [*(id *)(a1 + 40) animationSettings];
  [v6 headerViewRemoveAnimationTransform];
  CGAffineTransformMakeScale(&v9, v5, v7);
  [v2 setTransform:&v9];

  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __42__NCNotificationListView_reloadHeaderView__block_invoke_2(id *a1)
{
  id v2 = a1[4];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v4 = [WeakRetained headerView];

  if (v2 != v4)
  {
    [a1[4] removeFromSuperview];
    [a1[4] setAlpha:1.0];
    id v5 = a1[4];
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v7[0] = *MEMORY[0x1E4F1DAB8];
    v7[1] = v6;
    v7[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v5 setTransform:v7];
    [a1[5] _recycleViewIfNecessary:a1[4]];
  }
}

- (void)reloadFooterViewAnimated:(BOOL)a3
{
  footerView = self->_footerView;
  if (footerView)
  {
    BOOL v4 = a3;
    long long v6 = footerView;
    CGFloat v7 = self->_footerView;
    self->_footerView = 0;

    objc_initWeak(&location, self);
    if (v4)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __51__NCNotificationListView_reloadFooterViewAnimated___block_invoke;
      v12[3] = &unk_1E6A91BB0;
      CGRect v13 = v6;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __51__NCNotificationListView_reloadFooterViewAnimated___block_invoke_2;
      v8[3] = &unk_1E6A93590;
      CGAffineTransform v9 = v13;
      objc_copyWeak(&v11, &location);
      id v10 = self;
      [(NCNotificationListView *)self _performViewAnimationBlock:v12 completionBlock:v8 type:0];
      objc_destroyWeak(&v11);
    }
    else
    {
      [(UIView *)v6 removeFromSuperview];
      [(UIView *)v6 setAlpha:1.0];
      [(NCNotificationListView *)self _recycleViewIfNecessary:v6];
    }
    [(NCNotificationListView *)self setCachedSizeValid:0];
    [(NCNotificationListView *)self setNeedsLayout];
    objc_destroyWeak(&location);
  }
}

uint64_t __51__NCNotificationListView_reloadFooterViewAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __51__NCNotificationListView_reloadFooterViewAnimated___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v4 = [WeakRetained footerView];

  if (v2 != v4)
  {
    [*(id *)(a1 + 32) removeFromSuperview];
    [*(id *)(a1 + 32) setAlpha:1.0];
    uint64_t v6 = *(void *)(a1 + 32);
    id v5 = *(void **)(a1 + 40);
    [v5 _recycleViewIfNecessary:v6];
  }
}

- (void)reloadHoverView
{
  hoverView = self->_hoverView;
  if (hoverView)
  {
    self->_hoverView = 0;
    BOOL v4 = hoverView;

    [(UIView *)v4 removeFromSuperview];
    [(NCNotificationListView *)self _recycleViewIfNecessary:v4];

    [(NCNotificationListView *)self setNeedsLayout];
  }
}

- (void)recycleVisibleViews
{
  [(NCNotificationListView *)self _removeAllStoredVisibleViews];
  headerView = self->_headerView;
  if (headerView)
  {
    [(UIView *)headerView removeFromSuperview];
    [(NCNotificationListView *)self _recycleViewIfNecessary:self->_headerView];
    BOOL v4 = self->_headerView;
    self->_headerView = 0;
  }
  footerView = self->_footerView;
  if (footerView)
  {
    [(UIView *)footerView removeFromSuperview];
    [(NCNotificationListView *)self _recycleViewIfNecessary:self->_footerView];
    uint64_t v6 = self->_footerView;
    self->_footerView = 0;
  }
  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    [(UIView *)backgroundView removeFromSuperview];
    [(NCNotificationListView *)self _recycleViewIfNecessary:self->_backgroundView];
    id v8 = self->_backgroundView;
    self->_backgroundView = 0;
  }
}

- (unint64_t)count
{
  unint64_t v3 = [(NCNotificationListView *)self dataSource];
  unint64_t v4 = [v3 notificationListViewNumberOfItems:self];

  return v4;
}

- (void)setActiveRevealTransitioning:(BOOL)a3
{
  if (self->_activeRevealTransitioning != a3)
  {
    BOOL v3 = a3;
    self->_activeRevealTransitioning = a3;
    [(NCNotificationListView *)self setPerformingRevealTransitionAnimation:1];
    [(NCNotificationListView *)self setCachedSizeValid:0];
    [(NCNotificationListView *)self setNeedsLayout];
    if (v3)
    {
      [(NCNotificationListView *)self layoutIfNeeded];
    }
  }
}

- (double)layoutOffsetForViewAtIndex:(unint64_t)a3
{
  [(NCNotificationListView *)self _initialLayoutOffset];
  double v6 = v5;
  if ([(NCNotificationListView *)self count] > a3)
  {
    CGFloat v7 = [(NCNotificationListView *)self dataSource];
    [(NCNotificationListView *)self _headerViewHeight];
    double v8 = 0.0;
    if (v9 > 0.0)
    {
      [(NCNotificationListView *)self _headerViewHeight];
      double v11 = v10;
      [(NCListAnimationSettings *)self->_animationSettings viewSpacing];
      double v8 = v11 + v12;
    }
    double v6 = v6 + v8;
    if ([(NCNotificationListView *)self _isShowingFeaturedLeadingViews])
    {
      if ([(NCNotificationListView *)self numberOfFeaturedLeadingViews] <= a3)
      {
        [(NCNotificationListView *)self _heightForFeaturedLeadingView];
        double v14 = v6 + v13;
        [(NCListAnimationSettings *)self->_animationSettings viewSpacing];
        double v6 = v14 + v15;
      }
      unint64_t v16 = [(NCNotificationListView *)self numberOfFeaturedLeadingViews];
    }
    else
    {
      unint64_t v16 = 0;
    }
    [(NCNotificationListView *)self bounds];
    -[NCNotificationListView _widthForListViewInRect:](self, "_widthForListViewInRect:");
    if (v16 < a3)
    {
      double v18 = v17;
      do
      {
        [v7 notificationListView:self heightForItemAtIndex:v16 withWidth:v18];
        if (v19 > 0.0)
        {
          double v20 = v19;
          if (!v16)
          {
            [(NCNotificationListView *)self _topSpacingForItemAtIndex:0];
            double v6 = v6 + v21;
          }
          BOOL v22 = [(NCNotificationListView *)self isRevealed];
          double v23 = 0.0;
          if (!v22) {
            -[NCNotificationListView _positionOffsetForRevealHintingForItemAtIndex:](self, "_positionOffsetForRevealHintingForItemAtIndex:", v16, 0.0);
          }
          double v24 = v20 + v6 + v23;
          [(NCNotificationListView *)self _bottomSpacingForItemAtIndex:v16];
          double v6 = v24 + v25;
        }
        ++v16;
      }
      while (a3 != v16);
    }
  }
  return v6;
}

- (BOOL)isVisibleForViewAtIndex:(unint64_t)a3
{
  if ([(NCNotificationListView *)self count] <= a3) {
    return 0;
  }
  [(NCNotificationListView *)self layoutOffsetForViewAtIndex:a3];
  double v6 = v5;
  CGFloat v7 = [(NCNotificationListView *)self dataSource];
  [(NCNotificationListView *)self bounds];
  -[NCNotificationListView _widthForListViewInRect:](self, "_widthForListViewInRect:");
  objc_msgSend(v7, "notificationListView:heightForItemAtIndex:withWidth:", self, a3);
  double v9 = v8;

  [(NCNotificationListView *)self visibleRect];
  if (v6 >= CGRectGetMaxY(v11)) {
    return 0;
  }
  [(NCNotificationListView *)self visibleRect];
  return v6 + v9 > CGRectGetMinY(v12);
}

- (void)updateSubviewTranslation:(double)a3
{
  if (![(NCNotificationListView *)self isGrouped]
    || [(NCNotificationListView *)self isPerformingGroupingAnimation])
  {
    a3 = 0.0;
  }

  [(NCNotificationListView *)self setGroupedTranslation:a3];
}

- (void)setHiddenBelowStack:(BOOL)a3
{
  if (self->_hiddenBelowStack != a3)
  {
    self->_hiddenBelowStack = a3;
    self->_performingStackVisibilityAnimation = 1;
    [(NCNotificationListView *)self setCachedSizeValid:0];
    [(NCNotificationListView *)self setNeedsLayout];
  }
}

- (void)setOverrideTopViewDimmingTransform:(CGAffineTransform *)a3
{
  p_overrideTopViewDimmingTransform = &self->_overrideTopViewDimmingTransform;
  long long v6 = *(_OWORD *)&self->_overrideTopViewDimmingTransform.c;
  *(_OWORD *)&t1.CGFloat a = *(_OWORD *)&self->_overrideTopViewDimmingTransform.a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&self->_overrideTopViewDimmingTransform.tx;
  long long v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v13.CGFloat a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v13.c = v7;
  *(_OWORD *)&v13.tCGFloat x = *(_OWORD *)&a3->tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v13))
  {
    long long v8 = *(_OWORD *)&a3->a;
    long long v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_overrideTopViewDimmingTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_overrideTopViewDimmingTransform->tCGFloat x = v9;
    *(_OWORD *)&p_overrideTopViewDimmingTransform->CGFloat a = v8;
    double v10 = [(NCNotificationListView *)self visibleViews];
    CGRect v11 = [v10 objectForKey:&unk_1F2F84280];

    if (v11)
    {
      long long v12 = *(_OWORD *)&a3->c;
      *(_OWORD *)&t1.CGFloat a = *(_OWORD *)&a3->a;
      *(_OWORD *)&t1.c = v12;
      *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&a3->tx;
      [(NCNotificationListView *)self _configureStackDimmingForGroupedView:v11 transform:&t1];
    }
  }
}

- (void)setFeaturedLeadingViewOcclusionTranslation:(double)a3
{
  double v5 = [(NCNotificationListView *)self visibleViews];
  unint64_t v16 = [v5 objectForKey:&unk_1F2F84280];

  long long v6 = v16;
  if (v16)
  {
    BOOL v7 = [(NCNotificationListView *)self _isFeaturedLeadingViewAtIndex:0];
    long long v6 = v16;
    if (v7)
    {
      [(NCNotificationListView *)self _widthForFeaturedLeadingView];
      double v9 = v8;
      int v10 = [(NCNotificationListView *)self _shouldReverseLayoutDirection];
      double v11 = -a3;
      if (!v10) {
        double v11 = a3;
      }
      double v12 = v9 + v11;
      [(NCListAnimationSettings *)self->_animationSettings featuredViewOcclusionMinimumAlpha];
      double v14 = v13;
      [(NCListAnimationSettings *)self->_animationSettings featuredViewOcclusionMinimumAlpha];
      [v16 setAlpha:v14 + (1.0 - v15) * (v12 / v9)];
      long long v6 = v16;
    }
  }
}

- (void)setShowContentForGroupedViews:(BOOL)a3
{
  if (self->_showContentForGroupedViews != a3)
  {
    self->_showContentForGroupedViews = a3;
    [(NCNotificationListView *)self setNeedsLayout];
  }
}

- (void)setInteractionTranslationPercentage:(double)a3
{
  if (vabdd_f64(self->_interactionTranslationPercentage, a3) >= 2.22044605e-16)
  {
    [(NCNotificationListView *)self setPerformingInteractiveTranslationAnimation:1];
    self->_interactionTranslationPercentage = a3;
    [(NCNotificationListView *)self setNeedsLayout];
  }
}

- (void)setVisibleRectBottomMarginForRollUnder:(double)a3
{
  if (vabdd_f64(a3, self->_visibleRectBottomMarginForRollUnder) >= 2.22044605e-16)
  {
    [(NCNotificationListView *)self setPerformingBottomMarginAdjustmentAnimation:1];
    self->_visibleRectBottomMarginForRollUnder = a3;
    [(NCNotificationListView *)self setNeedsLayout];
  }
}

- (void)setInteractionTranslation:(double)a3
{
  if (vabdd_f64(a3, self->_interactionTranslation) >= 2.22044605e-16)
  {
    [(NCNotificationListView *)self setPerformingInteractiveTranslationAnimation:1];
    self->_interactionTranslation = a3;
    [(NCNotificationListView *)self setNeedsLayout];
  }
}

- (void)setInteractionVelocity:(double)a3
{
  if (vabdd_f64(a3, self->_interactionVelocity) >= 2.22044605e-16)
  {
    [(NCNotificationListView *)self setPerformingInteractionVelocityAnimation:1];
    self->_interactionVelocitCGFloat y = a3;
    [(NCNotificationListView *)self setNeedsLayout];
  }
}

- (BOOL)isRolledUnderView:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  [(NCNotificationListView *)self layoutOffsetForViewAtIndex:a4];
  double v8 = v7;
  double v9 = [(NCNotificationListView *)self dataSource];
  [(NCNotificationListView *)self bounds];
  -[NCNotificationListView _widthForListViewInRect:](self, "_widthForListViewInRect:");
  objc_msgSend(v9, "notificationListView:heightForItemAtIndex:withWidth:", self, a4);
  double v11 = v10;

  LOBYTE(a4) = [(NCNotificationListView *)self _shouldRollUnderView:v6 withHeight:v11 layoutOffset:v8];
  return a4;
}

- (void)setSublistsRevealed:(BOOL)a3
{
  if (self->_sublistsRevealed != a3)
  {
    self->_sublistsRevealed = a3;
    [(NCNotificationListView *)self setNeedsLayout];
  }
}

- (void)setOverrideLeadingViewHeight:(double)a3
{
  if (vabdd_f64(self->_overrideLeadingViewHeight, a3) >= 2.22044605e-16)
  {
    [(NCNotificationListView *)self setPerformingOverrideLeadingViewHeightAdjustment:1];
    self->_overrideLeadingViewdouble Height = a3;
    [(NCNotificationListView *)self setNeedsLayout];
  }
}

- (void)setMaximumLeadingViewHeight:(double)a3
{
  if (vabdd_f64(self->_maximumLeadingViewHeight, a3) >= 2.22044605e-16)
  {
    self->_maximumLeadingViewdouble Height = a3;
    [(NCNotificationListView *)self setNeedsLayout];
  }
}

- (id)visibleViewAtIndex:(unint64_t)a3
{
  unint64_t v4 = [(NCNotificationListView *)self visibleViews];
  double v5 = [NSNumber numberWithUnsignedInteger:a3];
  id v6 = [v4 objectForKey:v5];

  return v6;
}

- (BOOL)containsVisibleView:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v5 = [(NCNotificationListView *)self subviews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(id *)(*((void *)&v11 + 1) + 8 * i);
        if (v9 == v4
          || (objc_opt_respondsToSelector() & 1) != 0 && ([v9 containsVisibleView:v4] & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_13;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v6;
}

- (BOOL)_isVisibleView:(id)a3
{
  id v4 = a3;
  double v5 = [(NCNotificationListView *)self visibleViews];
  uint64_t v6 = [v5 allValues];
  char v7 = [v6 containsObject:v4];

  return v7;
}

- (void)_setVisibleView:(id)a3 atIndex:(unint64_t)a4
{
  if (a3)
  {
    id v6 = a3;
    char v7 = [(NCNotificationListView *)self visibleViews];
    double v8 = [NSNumber numberWithUnsignedInteger:a4];
    [v7 setObject:v6 forKey:v8];

    id v9 = [(NCNotificationListView *)self _listViewForView:v6];

    [v9 updateBottomViewsRollUnder];
  }
}

- (void)_updateStoredVisibleViewsForViewInsertedAtIndex:(unint64_t)a3
{
  double v5 = [(NCNotificationListView *)self visibleViews];
  id v6 = [v5 allKeys];
  char v7 = (void *)[v6 copy];

  double v8 = [v7 sortedArrayUsingComparator:&__block_literal_global_133];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__NCNotificationListView__updateStoredVisibleViewsForViewInsertedAtIndex___block_invoke_2;
  v9[3] = &unk_1E6A93540;
  v9[4] = self;
  void v9[5] = a3;
  [v8 enumerateObjectsUsingBlock:v9];
}

uint64_t __74__NCNotificationListView__updateStoredVisibleViewsForViewInsertedAtIndex___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

void __74__NCNotificationListView__updateStoredVisibleViewsForViewInsertedAtIndex___block_invoke_2(uint64_t a1, void *a2)
{
  id v10 = a2;
  unint64_t v3 = [v10 unsignedIntegerValue];
  if (v3 >= *(void *)(a1 + 40))
  {
    unint64_t v4 = v3;
    double v5 = [*(id *)(a1 + 32) visibleViews];
    id v6 = [v5 objectForKey:v10];

    char v7 = [*(id *)(a1 + 32) visibleViews];
    [v7 removeObjectForKey:v10];

    double v8 = [*(id *)(a1 + 32) visibleViews];
    id v9 = [NSNumber numberWithUnsignedInteger:v4 + 1];
    [v8 setObject:v6 forKey:v9];
  }
}

- (void)_updateStoredVisibleViewsForViewRemovedAtIndex:(unint64_t)a3
{
  double v5 = [(NCNotificationListView *)self visibleViews];
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 removeObjectForKey:v6];

  char v7 = [(NCNotificationListView *)self visibleViews];
  double v8 = [v7 allKeys];
  id v9 = (void *)[v8 copy];

  id v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_135];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__NCNotificationListView__updateStoredVisibleViewsForViewRemovedAtIndex___block_invoke_2;
  v11[3] = &unk_1E6A93540;
  v11[4] = self;
  void v11[5] = a3;
  [v10 enumerateObjectsUsingBlock:v11];
}

uint64_t __73__NCNotificationListView__updateStoredVisibleViewsForViewRemovedAtIndex___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __73__NCNotificationListView__updateStoredVisibleViewsForViewRemovedAtIndex___block_invoke_2(uint64_t a1, void *a2)
{
  id v10 = a2;
  unint64_t v3 = [v10 unsignedIntegerValue];
  if (v3 >= *(void *)(a1 + 40))
  {
    unint64_t v4 = v3;
    double v5 = [*(id *)(a1 + 32) visibleViews];
    id v6 = [v5 objectForKey:v10];

    char v7 = [*(id *)(a1 + 32) visibleViews];
    [v7 removeObjectForKey:v10];

    double v8 = [*(id *)(a1 + 32) visibleViews];
    id v9 = [NSNumber numberWithUnsignedInteger:v4 - 1];
    [v8 setObject:v6 forKey:v9];
  }
}

- (void)_removeStoredVisibleViewAtIndex:(unint64_t)a3
{
  double v5 = [(NCNotificationListView *)self visibleViews];
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  id v9 = [v5 objectForKey:v6];

  if (v9)
  {
    [v9 removeFromSuperview];
    char v7 = [(NCNotificationListView *)self visibleViews];
    double v8 = [NSNumber numberWithUnsignedInteger:a3];
    [v7 removeObjectForKey:v8];

    [(NCNotificationListView *)self _recycleViewIfNecessary:v9];
  }
}

- (void)_removeAllStoredVisibleViews
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unint64_t v3 = [(NCNotificationListView *)self visibleViews];
  unint64_t v4 = [v3 allValues];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v10 = [v9 superview];

        if (v10 == self)
        {
          [v9 removeFromSuperview];
          [(NCNotificationListView *)self _recycleViewIfNecessary:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  long long v11 = [(NCNotificationListView *)self visibleViews];
  [v11 removeAllObjects];
}

- (void)_updateVisibleViewsForUpdatedVisibleRect:(CGRect)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  unint64_t v4 = [(NCNotificationListView *)self visibleViews];
  uint64_t v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [(NCNotificationListView *)self _listViewForView:*(void *)(*((void *)&v37 + 1) + 8 * i)];
        long long v11 = v10;
        if (v10)
        {
          [v10 frame];
          CGFloat v13 = v12;
          double v15 = v14;
          CGFloat v17 = v16;
          CGFloat v19 = v18;
          [(NCNotificationListView *)self visibleRectBottomMarginForRollUnder];
          UIRectInset();
          CGFloat x = v43.origin.x;
          CGFloat y = v43.origin.y;
          CGFloat width = v43.size.width;
          CGFloat height = v43.size.height;
          v52.origin.CGFloat x = v13;
          v52.origin.CGFloat y = v15;
          v52.size.CGFloat width = v17;
          v52.size.CGFloat height = v19;
          if (CGRectIntersectsRect(v43, v52))
          {
            v44.origin.CGFloat x = x;
            v44.origin.CGFloat y = y;
            v44.size.CGFloat width = width;
            v44.size.CGFloat height = height;
            v53.origin.CGFloat x = v13;
            v53.origin.CGFloat y = v15;
            v53.size.CGFloat width = v17;
            CGFloat rect = v19;
            v53.size.CGFloat height = v19;
            CGRect v45 = CGRectIntersection(v44, v53);
            CGFloat v34 = v45.size.width;
            CGFloat v35 = v45.origin.x;
            double v33 = v45.origin.y;
            double v24 = v45.size.height;
            if ([v11 isPerformingGroupingAnimation])
            {
              v46.origin.CGFloat x = x;
              v46.origin.CGFloat y = y;
              v46.size.CGFloat width = width;
              v46.size.CGFloat height = height;
              double MaxY = CGRectGetMaxY(v46);
              v47.origin.CGFloat x = v13;
              v47.origin.CGFloat y = v15;
              v47.size.CGFloat width = v17;
              v47.size.CGFloat height = rect;
              double v26 = MaxY - CGRectGetMinY(v47);
              if (v24 < v26) {
                double v24 = v26;
              }
            }
            double v27 = v34;
            double v28 = v33 - v15;
            double v29 = v35;
          }
          else
          {
            v48.origin.CGFloat x = v13;
            v48.origin.CGFloat y = v15;
            v48.size.CGFloat width = v17;
            v48.size.CGFloat height = v19;
            CGFloat v36 = v17;
            CGFloat v30 = v19;
            double MinY = CGRectGetMinY(v48);
            v49.origin.CGFloat x = x;
            v49.origin.CGFloat y = y;
            v49.size.CGFloat width = width;
            v49.size.CGFloat height = height;
            double v29 = 0.0;
            double v28 = 0.0;
            if (MinY <= CGRectGetMaxY(v49))
            {
              v50.origin.CGFloat x = v13;
              v50.origin.CGFloat y = v15;
              v50.size.CGFloat width = v36;
              v50.size.CGFloat height = v30;
              double v28 = CGRectGetHeight(v50);
            }
            v51.origin.CGFloat x = v13;
            v51.origin.CGFloat y = v15;
            v51.size.CGFloat width = v36;
            v51.size.CGFloat height = v30;
            double v27 = CGRectGetWidth(v51);
            double v24 = 0.0;
          }
          objc_msgSend(v11, "setVisibleRect:", v29, v28, v27, v24, *(void *)&rect);
          if ([(NCNotificationListView *)self isPerformingBottomMarginAdjustmentAnimation])
          {
            [v11 setPerformingBottomMarginAdjustmentAnimation:1];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v7);
  }
}

- (BOOL)_isTopSubviewHeightLessThanVisibleRect
{
  unint64_t v3 = [(NCNotificationListView *)self visibleViews];
  unint64_t v4 = [v3 objectForKey:&unk_1F2F84280];

  if (v4)
  {
    [v4 frame];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    [(NCNotificationListView *)self visibleRect];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    v24.origin.CGFloat x = v6;
    v24.origin.CGFloat y = v8;
    v24.size.CGFloat width = v10;
    v24.size.CGFloat height = v12;
    double Height = CGRectGetHeight(v24);
    v25.origin.CGFloat x = v14;
    v25.origin.CGFloat y = v16;
    v25.size.CGFloat width = v18;
    v25.size.CGFloat height = v20;
    BOOL v22 = Height < CGRectGetHeight(v25);
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (void)_setRevealAlphaForView:(id)a3 desiredAlpha:(double)a4
{
  id v9 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v5 = v9;
  }
  else {
    double v5 = 0;
  }
  id v6 = v5;
  double v7 = v6;
  if (v6 && ([v6 isRevealed] & 1) == 0 && objc_msgSend(v7, "_isGrouping"))
  {
    [v7 revealPercentage];
    a4 = v8;
  }
  [v9 setAlpha:a4];
}

- (id)_currentAnimator
{
  unint64_t v3 = [(NCNotificationListView *)self dataSource];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v3 animator];
  }
  else
  {
    if (_NCReactiveListUI())
    {
      double v5 = *MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_FAULT)) {
        [(NCNotificationListView *)(uint64_t)v3 _currentAnimator];
      }
    }
    uint64_t v4 = NCDefaultAnimator();
  }
  id v6 = (void *)v4;

  return v6;
}

- (id)_currentHighFrameRateAnimator
{
  unint64_t v3 = [NCHighFrameRateAnimator alloc];
  uint64_t v4 = [(NCNotificationListView *)self _currentAnimator];
  double v5 = [(NCHighFrameRateAnimator *)v3 initWithAnimator:v4];

  return v5;
}

- (void)_performInsertionAnimationForView:(id)a3
{
  id v4 = a3;
  if ([(NCNotificationListView *)self groupingAnimationStyle] == 1)
  {
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v21.CGFloat a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v21.c = v5;
    *(_OWORD *)&v21.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    id v6 = &v21;
  }
  else
  {
    memset(&v21, 0, sizeof(v21));
    [(NCListAnimationSettings *)self->_animationSettings animationScale];
    CGFloat v8 = v7;
    [(NCListAnimationSettings *)self->_animationSettings animationScale];
    CGAffineTransformMakeScale(&v21, v8, v9);
    CGAffineTransform v20 = v21;
    id v6 = &v20;
  }
  [v4 setTransform:v6];
  BOOL v10 = [(NCNotificationListView *)self isRevealed];
  double v11 = 0.0;
  if (v10) {
    [(NCListAnimationSettings *)self->_animationSettings animationInsertionStartAlpha];
  }
  [v4 setAlpha:v11];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __60__NCNotificationListView__performInsertionAnimationForView___block_invoke;
  v17[3] = &unk_1E6A91A68;
  id v18 = v4;
  double v19 = self;
  animationSettings = self->_animationSettings;
  id v13 = v4;
  [(NCListAnimationSettings *)animationSettings insertionTension];
  double v15 = v14;
  [(NCListAnimationSettings *)self->_animationSettings insertionFriction];
  [(NCNotificationListView *)self _performViewAnimationBlock:v17 completionBlock:0 withTension:1 friction:v15 type:v16];
}

uint64_t __60__NCNotificationListView__performInsertionAnimationForView___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v8[0] = *MEMORY[0x1E4F1DAB8];
  v8[1] = v3;
  v8[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v8];
  id v4 = *(void **)(a1 + 32);
  int v5 = [*(id *)(a1 + 40) isRevealed];
  double v6 = 0.0;
  if (v5) {
    double v6 = 1.0;
  }
  return [v4 setAlpha:v6];
}

- (void)_performRemovalAnimationForView:(id)a3 index:(unint64_t)a4 isHorizontallyDisplaced:(BOOL)a5
{
  id v8 = a3;
  CGFloat v9 = [(NCNotificationListView *)self dataSource];
  [(NCNotificationListView *)self setPerformingRemovalAnimation:1];
  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __88__NCNotificationListView__performRemovalAnimationForView_index_isHorizontallyDisplaced___block_invoke;
  v19[3] = &unk_1E6A935B8;
  id v10 = v8;
  id v20 = v10;
  objc_copyWeak(v23, &location);
  BOOL v24 = a5;
  id v11 = v9;
  id v21 = v11;
  BOOL v22 = self;
  v23[1] = (id)a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __88__NCNotificationListView__performRemovalAnimationForView_index_isHorizontallyDisplaced___block_invoke_2;
  v14[3] = &unk_1E6A935E0;
  objc_copyWeak(&v18, &location);
  id v12 = v10;
  id v15 = v12;
  double v16 = self;
  id v13 = v11;
  id v17 = v13;
  [(NCNotificationListView *)self _performViewAnimationBlock:v19 completionBlock:v14 type:2];

  objc_destroyWeak(&v18);
  objc_destroyWeak(v23);

  objc_destroyWeak(&location);
}

void __88__NCNotificationListView__performRemovalAnimationForView_index_isHorizontallyDisplaced___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) frame];
  CGFloat v3 = v2;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if ([WeakRetained _isAnimationStyleDissolve])
  {
    id v11 = *(void **)(a1 + 32);
    double v12 = 0.0;
    goto LABEL_25;
  }
  if (!*(unsigned char *)(a1 + 72) || (double v13 = 1.0, [WeakRetained isPerformingGroupingAnimation]))
  {
    double v14 = [WeakRetained animationSettings];
    [v14 animationScaleWhileGrouping];
    double v13 = v15;
  }
  memset(&v33, 0, sizeof(v33));
  CGAffineTransformMakeScale(&v33, v13, v13);
  if (*(unsigned char *)(a1 + 72) && [WeakRetained _isLayoutFromBottomUp])
  {
    if (![WeakRetained isGrouped])
    {
      if ([WeakRetained isPerformingGroupingAnimation]) {
        goto LABEL_12;
      }
      goto LABEL_17;
    }
    BOOL v16 = [WeakRetained count] == 0;
  }
  else
  {
    BOOL v16 = 0;
  }
  if ([WeakRetained isPerformingGroupingAnimation])
  {
LABEL_12:
    id v17 = [WeakRetained animationSettings];
    [v17 animationTranslationWhileGrouping];
    double v19 = v18;
    v34.origin.CGFloat x = v3;
    v34.origin.CGFloat y = v5;
    v34.size.CGFloat width = v7;
    v34.size.CGFloat height = v9;
    double v20 = v19 + (1.0 - v13) * -0.5 * CGRectGetHeight(v34);
LABEL_15:

    goto LABEL_18;
  }
  if (!v16)
  {
    id v17 = [WeakRetained animationSettings];
    [v17 animationTranslation];
    double v20 = -v21;
    goto LABEL_15;
  }
LABEL_17:
  [*(id *)(a1 + 32) bounds];
  double v20 = -CGRectGetHeight(v35);
LABEL_18:
  double v22 = 0.0;
  if (*(unsigned char *)(a1 + 72) && ([WeakRetained isPerformingGroupingAnimation] & 1) == 0)
  {
    [WeakRetained bounds];
    double v22 = CGRectGetWidth(v36) * 1.5;
  }
  int v23 = [WeakRetained _shouldReverseLayoutDirection];
  double v24 = -v22;
  memset(&v32.c, 0, 32);
  if (v23) {
    double v24 = v22;
  }
  *(_OWORD *)&v32.CGFloat a = 0uLL;
  CGAffineTransformMakeTranslation(&v32, v24, v20);
  CGAffineTransform t1 = v33;
  memset(&v31, 0, sizeof(v31));
  CGAffineTransform v29 = v32;
  CGAffineTransformConcat(&v31, &t1, &v29);
  CGRect v25 = *(void **)(a1 + 32);
  CGAffineTransform t1 = v31;
  [v25 setTransform:&t1];
  id v11 = *(void **)(a1 + 32);
  double v12 = 1.0;
  if (!*(unsigned char *)(a1 + 72)) {
    double v12 = 0.0;
  }
LABEL_25:
  [v11 setAlpha:v12];
  if (objc_opt_respondsToSelector())
  {
    double v27 = *(void **)(a1 + 40);
    double v26 = *(void **)(a1 + 48);
    uint64_t v28 = *(void *)(a1 + 32);
    [v26 _bottomSpacingForItemAtIndex:*(void *)(a1 + 64)];
    objc_msgSend(v27, "notificationListView:willRemoveView:bottomSpacing:", v26, v28);
  }
}

void __88__NCNotificationListView__performRemovalAnimationForView_index_isHorizontallyDisplaced___block_invoke_2(id *a1)
{
  double v2 = *MEMORY[0x1E4FB3778];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E4FB3778]))
  {
    LOWORD(v8[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7C04000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "NC_NOTIFICATION_DISMISSAL_END", " enableTelemetry=YES ", (uint8_t *)v8, 2u);
  }
  kdebug_trace();
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v4 = [a1[4] superview];
  if (v4 == WeakRetained)
  {
    char v5 = [a1[5] _isVisibleView:a1[4]];

    if ((v5 & 1) == 0)
    {
      [a1[4] removeFromSuperview];
      id v6 = a1[4];
      long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v8[0] = *MEMORY[0x1E4F1DAB8];
      v8[1] = v7;
      v8[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [v6 setTransform:v8];
      [a1[5] _recycleViewIfNecessary:a1[4] withDataSource:a1[6]];
    }
  }
  else
  {
  }
  [WeakRetained setPerformingRemovalAnimation:0];
  [WeakRetained _configureClippingIfNecessary];
  if (objc_opt_respondsToSelector()) {
    [a1[6] notificationListView:a1[5] didRemoveView:a1[4]];
  }
}

- (double)_animationTension
{
  [(NCListAnimationSettings *)self->_animationSettings animationTension];
  double v4 = v3;
  if ([(NCNotificationListView *)self isPerformingRevealAnimation]
    || [(NCNotificationListView *)self isRevealTransitionScrolling])
  {
    [(NCNotificationListView *)self _adjustedTensionForRevealAnimation];
  }
  else if ([(NCNotificationListView *)self isPerformingInteractionVelocityAnimation])
  {
    [(NCListAnimationSettings *)self->_animationSettings animationTension];
    double v7 = v6;
    [(NCListAnimationSettings *)self->_animationSettings animationTensionVelocityFactor];
    double v9 = v8;
    [(NCNotificationListView *)self interactionVelocity];
    return v7 + v9 * v10;
  }
  else
  {
    return v4;
  }
  return result;
}

- (double)_animationFriction
{
  [(NCListAnimationSettings *)self->_animationSettings animationFriction];
  double v4 = v3;
  if ([(NCNotificationListView *)self isPerformingRevealAnimation]
    || [(NCNotificationListView *)self isRevealTransitionScrolling])
  {
    [(NCNotificationListView *)self _adjustedFrictionForRevealAnimation];
  }
  else if ([(NCNotificationListView *)self isPerformingInteractionVelocityAnimation])
  {
    [(NCListAnimationSettings *)self->_animationSettings animationFriction];
    double v7 = v6;
    [(NCListAnimationSettings *)self->_animationSettings animationFrictionVelocityFactor];
    double v9 = v8;
    [(NCNotificationListView *)self interactionVelocity];
    return v7 + v9 * v10;
  }
  else
  {
    return v4;
  }
  return result;
}

- (void)_performViewAnimationBlock:(id)a3 completionBlock:(id)a4 type:(unint64_t)a5
{
  id v8 = a4;
  id v12 = a3;
  [(NCNotificationListView *)self _animationTension];
  double v10 = v9;
  [(NCNotificationListView *)self _animationFriction];
  [(NCNotificationListView *)self _performViewAnimationBlock:v12 completionBlock:v8 withTension:a5 friction:v10 type:v11];
}

- (void)_performAnimationForView:(id)a3 atIndex:(unint64_t)a4 animationBlock:(id)a5 completionBlock:(id)a6 type:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if ([(NCNotificationListView *)self isPerformingRevealAnimation])
  {
    [(NCNotificationListView *)self _revealAnimationDelayForObjectAtIndex:a4];
    double v16 = v15;
    id v17 = [(NCNotificationListView *)self viewsPerformingAnimation];
    [v17 addObject:v12];

    dispatch_time_t v18 = dispatch_time(0, (uint64_t)(v16 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__NCNotificationListView__performAnimationForView_atIndex_animationBlock_completionBlock_type___block_invoke;
    block[3] = &unk_1E6A93630;
    block[4] = self;
    id v31 = v13;
    id v32 = v14;
    id v30 = v12;
    unint64_t v33 = a7;
    dispatch_after(v18, MEMORY[0x1E4F14428], block);

    double v19 = v31;
LABEL_5:

    goto LABEL_6;
  }
  double v20 = [(NCNotificationListView *)self viewsPerformingAnimation];
  char v21 = [v20 containsObject:v12];

  if ((v21 & 1) == 0)
  {
    double v22 = [(NCNotificationListView *)self viewsPerformingAnimation];
    [v22 addObject:v12];

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __95__NCNotificationListView__performAnimationForView_atIndex_animationBlock_completionBlock_type___block_invoke_3;
    v26[3] = &unk_1E6A93608;
    id v28 = v14;
    v26[4] = self;
    id v27 = v12;
    [(NCListAnimationSettings *)self->_animationSettings animationTension];
    double v24 = v23;
    [(NCListAnimationSettings *)self->_animationSettings animationFriction];
    [(NCNotificationListView *)self _performViewAnimationBlock:v13 completionBlock:v26 withTension:a7 friction:v24 type:v25];

    double v19 = v28;
    goto LABEL_5;
  }
LABEL_6:
}

void __95__NCNotificationListView__performAnimationForView_atIndex_animationBlock_completionBlock_type___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __95__NCNotificationListView__performAnimationForView_atIndex_animationBlock_completionBlock_type___block_invoke_2;
  _OWORD v10[3] = &unk_1E6A93608;
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 32);
  double v6 = *(void **)(a1 + 40);
  id v12 = v4;
  v10[4] = v5;
  id v11 = v6;
  [*(id *)(a1 + 32) _adjustedTensionForRevealAnimation];
  double v8 = v7;
  [*(id *)(a1 + 32) _adjustedFrictionForRevealAnimation];
  [v2 _performViewAnimationBlock:v3 completionBlock:v10 withTension:*(void *)(a1 + 64) friction:v8 type:v9];
}

void __95__NCNotificationListView__performAnimationForView_atIndex_animationBlock_completionBlock_type___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = [*(id *)(a1 + 32) viewsPerformingAnimation];
  [v3 removeObject:*(void *)(a1 + 40)];
}

void __95__NCNotificationListView__performAnimationForView_atIndex_animationBlock_completionBlock_type___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = [*(id *)(a1 + 32) viewsPerformingAnimation];
  [v3 removeObject:*(void *)(a1 + 40)];
}

- (void)_performViewAnimationBlock:(id)a3 completionBlock:(id)a4 withTension:(double)a5 friction:(double)a6 type:(unint64_t)a7
{
  id v12 = a4;
  id v13 = a3;
  id v14 = [(NCNotificationListView *)self _currentHighFrameRateAnimator];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __95__NCNotificationListView__performViewAnimationBlock_completionBlock_withTension_friction_type___block_invoke;
  v16[3] = &unk_1E6A92320;
  id v17 = v12;
  id v15 = v12;
  [v14 animateUsingSpringWithTension:0 friction:a7 interactive:v13 type:v16 animations:a5 completion:a6];
}

uint64_t __95__NCNotificationListView__performViewAnimationBlock_completionBlock_withTension_friction_type___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_performRetargetableAnimationForView:(id)a3 type:(unint64_t)a4 animationBlock:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(NCNotificationListView *)self viewsPerformingAnimation];
  char v14 = [v13 containsObject:v10];

  if (v14)
  {
    id v15 = [(NCNotificationListView *)self _currentHighFrameRateAnimator];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    id v23[2] = __99__NCNotificationListView__performRetargetableAnimationForView_type_animationBlock_completionBlock___block_invoke_2;
    v23[3] = &unk_1E6A93658;
    double v16 = &v25;
    v24[1] = self;
    id v25 = v12;
    id v17 = (id *)v24;
    v24[0] = v10;
    id v18 = v10;
    id v19 = v12;
    [v15 animateByRetargetingType:a4 animations:v11 completion:v23];
  }
  else
  {
    if (v10)
    {
      double v20 = [(NCNotificationListView *)self viewsPerformingAnimation];
      [v20 addObject:v10];
    }
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __99__NCNotificationListView__performRetargetableAnimationForView_type_animationBlock_completionBlock___block_invoke;
    v26[3] = &unk_1E6A93608;
    double v16 = &v28;
    v27[1] = self;
    id v28 = v12;
    id v17 = (id *)v27;
    v27[0] = v10;
    id v21 = v10;
    id v22 = v12;
    [(NCNotificationListView *)self _performViewAnimationBlock:v11 completionBlock:v26 type:a4];
  }
}

void __99__NCNotificationListView__performRetargetableAnimationForView_type_animationBlock_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  if (*(void *)(a1 + 32))
  {
    id v3 = [*(id *)(a1 + 40) viewsPerformingAnimation];
    [v3 removeObject:*(void *)(a1 + 32)];
  }
}

void __99__NCNotificationListView__performRetargetableAnimationForView_type_animationBlock_completionBlock___block_invoke_2(uint64_t a1, int a2, int a3)
{
  if (a2 && a3)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4) {
      (*(void (**)(void))(v4 + 16))();
    }
    if (*(void *)(a1 + 32))
    {
      id v5 = [*(id *)(a1 + 40) viewsPerformingAnimation];
      [v5 removeObject:*(void *)(a1 + 32)];
    }
  }
}

- (double)_adjustedTensionForRevealAnimation
{
  [(NCNotificationListView *)self _verticalVelocityForSuperview];
  double v4 = v3;
  [(NCListAnimationSettings *)self->_animationSettings revealHintingAnimationTension];
  double v6 = v5;
  [(NCListAnimationSettings *)self->_animationSettings revealHintingAnimationTensionVelocityFactor];
  return v6 + v7 * v4;
}

- (double)_adjustedFrictionForRevealAnimation
{
  [(NCNotificationListView *)self _verticalVelocityForSuperview];
  double v4 = v3;
  [(NCListAnimationSettings *)self->_animationSettings revealHintingAnimationFriction];
  double v6 = v5;
  [(NCListAnimationSettings *)self->_animationSettings revealHintingAnimationFrictionVelocityFactor];
  return v6 + v7 * v4;
}

- (double)_verticalVelocityForSuperview
{
  uint64_t v2 = [(NCNotificationListView *)self superview];
  objc_opt_class();
  double v3 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    [v2 _verticalVelocity];
    double v3 = fabs(v4);
  }

  return v3;
}

- (double)_revealAnimationDelayForObjectAtIndex:(unint64_t)a3
{
  double v4 = (double)([(NCNotificationListView *)self revealIndexOffset] + a3);
  [(NCListAnimationSettings *)self->_animationSettings revealGestureAnimationRevealDelayStep];
  return fmin(fmax(v5 * v4, 0.0), 1.0);
}

- (void)_configureClippingIfNecessary
{
  if ([(NCNotificationListView *)self _shouldPerformClipping])
  {
    [(NCNotificationListView *)self _setupClipping];
  }
  else
  {
    [(NCNotificationListView *)self _resetClipping];
  }
}

- (void)_setupClipping
{
  double v3 = [(NCNotificationListView *)self layer];
  [v3 setMaskedCorners:15];

  [(NCNotificationListView *)self _setContinuousCornerRadius:13.0];

  [(NCNotificationListView *)self setClipsToBounds:1];
}

- (void)_resetClipping
{
  double v3 = [(NCNotificationListView *)self layer];
  [v3 setMaskedCorners:0];

  [(NCNotificationListView *)self setClipsToBounds:0];
}

- (BOOL)_shouldPerformClipping
{
  uint64_t v3 = [(id)*MEMORY[0x1E4FB2608] activeInterfaceOrientation];
  double v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v4 userInterfaceIdiom] != 1 && (unint64_t)(v3 - 3) > 1) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = [(NCNotificationListView *)self _isGrouping]
  }
      && ([(NCNotificationListView *)self groupedTranslation],
          double v7 = fabs(v6),
          [(NCNotificationListView *)self horizontalInsetMargin],
          v7 > v8)
      || [(NCNotificationListView *)self removedViewIndex] != 0x7FFFFFFFFFFFFFFFLL;

  return v9;
}

- (BOOL)_isGrouping
{
  BOOL v3 = [(NCNotificationListView *)self isGrouped];
  if (v3)
  {
    LOBYTE(v3) = [(NCNotificationListView *)self supportsGrouping];
  }
  return v3;
}

- (id)_headerViewFromDataSource
{
  BOOL v3 = [(NCNotificationListView *)self dataSource];
  if (objc_opt_respondsToSelector())
  {
    double v4 = [v3 headerViewForNotificationList:self];
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

- (id)_footerViewFromDataSource
{
  BOOL v3 = [(NCNotificationListView *)self dataSource];
  if (objc_opt_respondsToSelector())
  {
    double v4 = [v3 footerViewForNotificationList:self];
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

- (double)_headerViewHeight
{
  BOOL v3 = [(NCNotificationListView *)self dataSource];
  double v4 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [(NCNotificationListView *)self bounds];
    -[NCNotificationListView _widthForListViewInRect:](self, "_widthForListViewInRect:");
    objc_msgSend(v3, "headerViewHeightForNotificationList:withWidth:", self);
    double v4 = v5;
  }

  return v4;
}

- (double)_footerViewHeight
{
  BOOL v3 = [(NCNotificationListView *)self dataSource];
  double v4 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [(NCNotificationListView *)self bounds];
    -[NCNotificationListView _widthForListViewInRect:](self, "_widthForListViewInRect:");
    objc_msgSend(v3, "footerViewHeightForNotificationList:withWidth:", self);
    double v4 = v5;
  }

  return v4;
}

- (id)_backgroundViewFromDataSource
{
  BOOL v3 = [(NCNotificationListView *)self dataSource];
  if (objc_opt_respondsToSelector())
  {
    double v4 = [v3 backgroundViewForNotificationList:self];
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

- (id)_overlayViewFromDataSource
{
  BOOL v3 = [(NCNotificationListView *)self dataSource];
  if (objc_opt_respondsToSelector())
  {
    double v4 = [v3 overlayViewForNotificationList:self];
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

- (id)_hoverViewFromDataSource
{
  BOOL v3 = [(NCNotificationListView *)self dataSource];
  if (objc_opt_respondsToSelector())
  {
    double v4 = [v3 hoverViewForNotificationList:self];
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

- (id)_listViewForView:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v4 = v3;
  }
  else {
    double v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (void)_recycleViewIfNecessary:(id)a3
{
}

- (void)_recycleViewIfNecessary:(id)a3 withDataSource:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  double v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [(NCNotificationListView *)self dataSource];
    if (!v8) {
      goto LABEL_6;
    }
  }
  if (objc_opt_respondsToSelector())
  {
    BOOL v9 = [(NCNotificationListView *)self _listViewForView:v10];
    [v9 recycleVisibleViews];

    [v8 recycleView:v10];
  }
LABEL_6:
}

- (CGAffineTransform)_scaleTransformForGroupingAnimationForViewAtIndex:(SEL)a3 leadingViewHeight:(unint64_t)a4
{
  BOOL v9 = [(NCNotificationListView *)self dataSource];
  [(NCNotificationListView *)self bounds];
  -[NCNotificationListView _widthForListViewInRect:](self, "_widthForListViewInRect:");
  objc_msgSend(v9, "notificationListView:heightForItemAtIndex:withWidth:", self, a4);
  double v11 = v10;

  double v12 = 0.0;
  if (![(NCNotificationListView *)self isHiddenBelowStack]
    && [(NCNotificationListView *)self showStackBelowLeadingView])
  {
    [(NCNotificationListView *)self groupedOverlapHeightMultiple];
    double v14 = v13;
    [(NCNotificationListView *)self _resolvedViewOverlap];
    double v16 = v14 * v15;
    double v17 = 0.0;
    if (a4) {
      double v17 = 1.0;
    }
    double v12 = v16 * v17;
  }
  double v18 = pow(0.94, (double)a4);
  if (v12 + a5 >= v11) {
    double v19 = v18;
  }
  else {
    double v19 = (v12 + a5) / v11;
  }
  if (v19 >= v18) {
    double v19 = v18;
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tCGFloat x = 0u;
  *(_OWORD *)&retstr->CGFloat a = 0u;

  return CGAffineTransformMakeScale(retstr, v18, v19);
}

- (BOOL)isNotificationListViewCurrentlyVisible
{
  id v3 = [(NCNotificationListView *)self superview];
  if (v3)
  {
    if ([(NCNotificationListView *)self isRevealed])
    {
      BOOL v4 = 1;
    }
    else
    {
      [(NCNotificationListView *)self revealPercentage];
      BOOL v4 = v5 > 0.0;
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_setHiddenBelowStackForView:(id)a3 hiddenBelowStack:(BOOL)a4
{
  BOOL v4 = a4;
  double v5 = [(NCNotificationListView *)self _listViewForView:a3];
  if (v5)
  {
    id v6 = v5;
    [v5 setHiddenBelowStack:v4];
    double v5 = v6;
  }
}

- (void)_updateStackedViewsForGrouping:(BOOL)a3
{
  double v5 = [(NCNotificationListView *)self visibleViews];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__NCNotificationListView__updateStackedViewsForGrouping___block_invoke;
  v6[3] = &unk_1E6A93680;
  BOOL v7 = a3;
  v6[4] = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v6];
}

void __57__NCNotificationListView__updateStackedViewsForGrouping___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  unint64_t v5 = [a2 unsignedIntegerValue];
  if (*(unsigned char *)(a1 + 40)) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    BOOL v9 = 1;
LABEL_9:
    [*(id *)(a1 + 32) _setHiddenBelowStackForView:v10 hiddenBelowStack:v9];
    goto LABEL_10;
  }
  if (!*(unsigned char *)(a1 + 40))
  {
    double v7 = (double)v5;
    [*(id *)(*(void *)(a1 + 32) + 2464) groupListMaxViewCount];
    if (v8 > v7)
    {
      BOOL v9 = *(unsigned char *)(a1 + 40) != 0;
      goto LABEL_9;
    }
  }
LABEL_10:
}

- (BOOL)_isAnimationStyleDissolve
{
  return [(NCNotificationListView *)self groupingAnimationStyle] == 1;
}

- (double)_widthForListViewInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(NCNotificationListView *)self horizontalInsetMargin];
  CGFloat v8 = v7;
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  CGRect v12 = CGRectInset(v11, v8, 0.0);

  return CGRectGetWidth(v12);
}

- (void)setGroupedTranslation:(double)a3
{
  if (self->_groupedTranslation != a3)
  {
    self->_groupedTranslation = a3;
    [(NCNotificationListView *)self _configureClippingIfNecessary];
    [(NCNotificationListView *)self _giveDataSourceUpdatedTransformWhichIncludesSubviewsXTranslation];
    [(NCNotificationListView *)self setNeedsLayout];
  }
}

- (void)_giveDataSourceUpdatedTransformWhichIncludesSubviewsXTranslation
{
  id v3 = [(NCNotificationListView *)self _directSuperListView];
  BOOL v4 = [v3 dataSource];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    memset(&v9, 0, sizeof(v9));
    [(NCNotificationListView *)self groupedTranslation];
    CGAffineTransformMakeTranslation(&v9, v5, 0.0);
    memset(&v8, 0, sizeof(v8));
    [(NCNotificationListView *)self transform];
    CGAffineTransform v6 = v9;
    CGAffineTransformConcat(&v8, &t1, &v6);
    CGAffineTransform v6 = v8;
    [v4 notificationListView:v3 changingTransformOfView:self toTransform:&v6];
  }
}

- (BOOL)_isAnimatingForParentNotificationListView
{
  id v3 = [(NCNotificationListView *)self _directSuperListView];
  BOOL v4 = v3;
  if (v3)
  {
    CGFloat v5 = [v3 viewsPerformingAnimation];
    char v6 = [v5 containsObject:self];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)_isLayoutFromBottomUp
{
  uint64_t v2 = [(NCNotificationListView *)self _anySuperNotificationListView];
  id v3 = v2;
  if (v2)
  {
    [v2 contentLayoutOffset];
    BOOL v5 = v4 > 0.0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)_anySuperNotificationListView
{
  uint64_t v2 = [(NCNotificationListView *)self superview];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = 0;
    do
    {
      id v4 = v2;

      uint64_t v2 = [v4 superview];

      objc_opt_class();
      id v3 = v4;
    }
    while ((objc_opt_isKindOfClass() & 1) != 0);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_directSuperListView
{
  uint64_t v2 = [(NCNotificationListView *)self superview];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (BOOL)_animateVisibleRectAdjustmentIfNecessaryWithVisibleRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  BOOL v8 = [(NCNotificationListView *)self isListRevealTargetContentOffsetClamped];
  if (v8)
  {
    [(NCNotificationListView *)self _visibleRect];
    double v9 = CGRectGetHeight(v13);
    -[NCNotificationListView _setVisibleRectWithoutAlteringAnimations:](self, "_setVisibleRectWithoutAlteringAnimations:", x, y, width, height);
    [(NCNotificationListView *)self _setupVisibleRectHeightFloatAnimatablePropertyWithStartingValue:v9];
    v14.origin.double x = x;
    v14.origin.double y = y;
    v14.size.double width = width;
    v14.size.double height = height;
    [(NCNotificationListView *)self _animateVisibleRectHeight:CGRectGetHeight(v14)];
  }
  else
  {
    id v10 = [(NCNotificationListView *)self visibleRectHeightAnimatableProperty];

    if (v10)
    {
      CGRect v11 = [(NCNotificationListView *)self visibleRectHeightAnimatableProperty];
      [v11 invalidate];

      [(NCNotificationListView *)self setVisibleRectHeightAnimatableProperty:0];
    }
  }
  return v8;
}

- (void)_animateVisibleRectHeight:(double)a3
{
  BOOL v5 = [(NCNotificationListView *)self visibleRectHeightAnimatableProperty];

  if (v5)
  {
    char v6 = [(NCNotificationListView *)self visibleRectHeightAnimatableProperty];
    [v6 value];
    double v8 = v7;

    if (v8 != a3)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __52__NCNotificationListView__animateVisibleRectHeight___block_invoke;
      v13[3] = &unk_1E6A91E60;
      void v13[4] = self;
      *(double *)&void v13[5] = a3;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __52__NCNotificationListView__animateVisibleRectHeight___block_invoke_2;
      v12[3] = &unk_1E6A91BB0;
      void v12[4] = self;
      [(NCNotificationListView *)self _adjustedTensionForRevealAnimation];
      double v10 = v9;
      [(NCNotificationListView *)self _adjustedFrictionForRevealAnimation];
      [(NCNotificationListView *)self _performViewAnimationBlock:v13 completionBlock:v12 withTension:0 friction:v10 type:v11];
    }
  }
}

void __52__NCNotificationListView__animateVisibleRectHeight___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) visibleRectHeightAnimatableProperty];
  [v2 setValue:*(double *)(a1 + 40)];
}

uint64_t __52__NCNotificationListView__animateVisibleRectHeight___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setListRevealTargetContentOffsetClamped:0];
}

- (void)_setupVisibleRectHeightFloatAnimatablePropertyWithStartingValue:(double)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  visibleRectHeightAnimatablePropertdouble y = self->_visibleRectHeightAnimatableProperty;
  if (!visibleRectHeightAnimatableProperty)
  {
    char v6 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4FB1ED0]);
    double v7 = self->_visibleRectHeightAnimatableProperty;
    self->_visibleRectHeightAnimatablePropertdouble y = v6;

    visibleRectHeightAnimatablePropertdouble y = self->_visibleRectHeightAnimatableProperty;
  }
  [(UIViewFloatAnimatableProperty *)visibleRectHeightAnimatableProperty setValue:a3];
  double v8 = (void *)MEMORY[0x1E4FB1EB0];
  v13[0] = self->_visibleRectHeightAnimatableProperty;
  double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __90__NCNotificationListView__setupVisibleRectHeightFloatAnimatablePropertyWithStartingValue___block_invoke;
  _OWORD v10[3] = &unk_1E6A919A0;
  objc_copyWeak(&v11, &location);
  [v8 _createTransformerWithInputAnimatableProperties:v9 presentationValueChangedCallback:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __90__NCNotificationListView__setupVisibleRectHeightFloatAnimatablePropertyWithStartingValue___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v11 = WeakRetained;
    id v2 = WeakRetained[305];
    if (v2 && [v11 isRevealed])
    {
      [v2 presentationValue];
      double v4 = v3;
      [v11 visibleRect];
      double v6 = v5;
      double v8 = v7;
      double v10 = v9;
      objc_msgSend(v11, "_setVisibleRectWithoutAlteringAnimations:");
      [v11 setPerformingVisibleRectAdjustment:1];
      [v11 setNeedsLayout];
      objc_msgSend(v11, "_updateVisibleViewsForUpdatedVisibleRect:", v6, v8, v10, v4);
    }

    id WeakRetained = v11;
  }
}

- (BOOL)_isFeaturedLeadingViewAtIndex:(unint64_t)a3
{
  if ([(NCNotificationListView *)self numberOfFeaturedLeadingViews] <= a3) {
    return 0;
  }

  return [(NCNotificationListView *)self _isShowingFeaturedLeadingViews];
}

- (BOOL)_isShowingFeaturedLeadingViews
{
  double v3 = [(NCNotificationListView *)self dataSource];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 isShowingFeaturedLeadingViewsForNotificationListView:self];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (double)_widthForFeaturedLeadingViewInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(NCNotificationListView *)self horizontalInsetMargin];
  CGFloat v9 = v8;
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  CGRect v15 = CGRectInset(v14, v9, 0.0);
  double v10 = CGRectGetWidth(v15);
  double v11 = (double)([(NCNotificationListView *)self numberOfFeaturedLeadingViews] - 1);
  [(NCListAnimationSettings *)self->_animationSettings featuredLeadingViewSpacing];
  return (v10 - v11 * v12)
       / (double)[(NCNotificationListView *)self numberOfFeaturedLeadingViews];
}

- (double)_widthForFeaturedLeadingView
{
  [(NCNotificationListView *)self bounds];

  -[NCNotificationListView _widthForFeaturedLeadingViewInRect:](self, "_widthForFeaturedLeadingViewInRect:");
  return result;
}

- (double)_heightForFeaturedLeadingViewInRect:(CGRect)a3
{
  -[NCNotificationListView _widthForFeaturedLeadingViewInRect:](self, "_widthForFeaturedLeadingViewInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v5 = v4;
  double v6 = [(NCNotificationListView *)self dataSource];
  if ([(NCNotificationListView *)self numberOfFeaturedLeadingViews])
  {
    unint64_t v7 = 0;
    double v8 = 0.0;
    do
    {
      [v6 notificationListView:self heightForItemAtIndex:v7 withWidth:v5];
      if (v8 < v9) {
        double v8 = v9;
      }
      ++v7;
    }
    while ([(NCNotificationListView *)self numberOfFeaturedLeadingViews] > v7);
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (double)_heightForFeaturedLeadingView
{
  [(NCNotificationListView *)self bounds];

  -[NCNotificationListView _heightForFeaturedLeadingViewInRect:](self, "_heightForFeaturedLeadingViewInRect:");
  return result;
}

- (void)_updateTransformedView:(id)a3 toFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  id v19 = a3;
  UIRectGetCenter();
  unint64_t v7 = [(NCNotificationListView *)self traitCollection];
  [v7 displayScale];
  UIPointRoundToScale();
  double v9 = v8;
  double v11 = v10;

  [v19 frame];
  UIRectGetCenter();
  if (v9 != v13 || v11 != v12) {
    objc_msgSend(v19, "setCenter:", v9, v11);
  }
  [v19 bounds];
  v22.origin.CGFloat x = v15;
  v22.origin.CGFloat y = v16;
  v22.size.double width = v17;
  v22.size.double height = v18;
  v21.origin.CGFloat x = 0.0;
  v21.origin.CGFloat y = 0.0;
  v21.size.double width = width;
  v21.size.double height = height;
  if (!CGRectEqualToRect(v21, v22)) {
    objc_msgSend(v19, "setBounds:", 0.0, 0.0, width, height);
  }
}

- (void)_updateTransformedView:(id)a3 toFrame:(CGRect)a4 withTransform:(CGAffineTransform *)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  -[NCNotificationListView _updateTransformedView:toFrame:](self, "_updateTransformedView:toFrame:", v11, x, y, width, height);
  if (v11) {
    [v11 transform];
  }
  else {
    memset(&t1, 0, sizeof(t1));
  }
  long long v12 = *(_OWORD *)&a5->c;
  *(_OWORD *)&v14.CGFloat a = *(_OWORD *)&a5->a;
  *(_OWORD *)&v14.c = v12;
  *(_OWORD *)&v14.tdouble x = *(_OWORD *)&a5->tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v14))
  {
    long long v13 = *(_OWORD *)&a5->c;
    *(_OWORD *)&v14.CGFloat a = *(_OWORD *)&a5->a;
    *(_OWORD *)&v14.c = v13;
    *(_OWORD *)&v14.tdouble x = *(_OWORD *)&a5->tx;
    [v11 setTransform:&v14];
  }
}

- (BOOL)_shouldUpdateTransformedView:(id)a3 toFrame:(CGRect)a4 alpha:(double)a5 transform:(CGAffineTransform *)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v12 = a3;
  [v12 bounds];
  double v13 = CGRectGetWidth(v27);
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  if (v13 == CGRectGetWidth(v28)
    && ([v12 bounds],
        double v14 = CGRectGetHeight(v29),
        v30.origin.CGFloat x = x,
        v30.origin.CGFloat y = y,
        v30.size.CGFloat width = width,
        v30.size.CGFloat height = height,
        v14 == CGRectGetHeight(v30)))
  {
    [v12 center];
    double v18 = v17;
    double v20 = v19;
    UIRectGetCenter();
    LOBYTE(v15) = 1;
    if (v18 == v22 && v20 == v21)
    {
      [v12 alpha];
      if (v23 == a5)
      {
        if (v12) {
          [v12 transform];
        }
        else {
          memset(&t1, 0, sizeof(t1));
        }
        long long v24 = *(_OWORD *)&a6->c;
        *(_OWORD *)&v25.CGFloat a = *(_OWORD *)&a6->a;
        *(_OWORD *)&v25.c = v24;
        *(_OWORD *)&v25.tCGFloat x = *(_OWORD *)&a6->tx;
        BOOL v15 = !CGAffineTransformEqualToTransform(&t1, &v25);
      }
    }
  }
  else
  {
    LOBYTE(v15) = 1;
  }

  return v15;
}

- (double)_rollUnderThresholdOffset
{
  [(NCNotificationListView *)self visibleRect];
  double MaxY = CGRectGetMaxY(v6);
  [(NCNotificationListView *)self visibleRectBottomMarginForRollUnder];
  return MaxY - v4;
}

- (BOOL)_shouldRollUnderView:(id)a3 withHeight:(double)a4 layoutOffset:(double)a5
{
  double v8 = [(NCNotificationListView *)self _listViewForView:a3];
  if (_NCReactiveListUI())
  {
    BOOL v9 = 0;
  }
  else
  {
    double v10 = [(NCNotificationListView *)self insertedViewIndices];
    if ([v10 count])
    {
      BOOL v9 = 1;
    }
    else
    {
      id v11 = [(NCNotificationListView *)self reloadedViewIndices];
      if ([v11 count])
      {
        BOOL v9 = 1;
      }
      else
      {
        id v12 = [v8 reloadedViewIndices];
        BOOL v9 = [v12 count] != 0;
      }
    }
  }
  char v13 = 0;
  if ([(NCNotificationListView *)self shouldBottomViewsRollUnder] && !v9)
  {
    [(NCNotificationListView *)self _visibleRect];
    if (CGRectGetMinY(v17) > a5 + 0.001)
    {
      char v13 = 0;
      goto LABEL_21;
    }
    [(NCNotificationListView *)self _rollUnderTranslationTopMargin];
    double v14 = [(NCNotificationListView *)self traitCollection];
    [v14 displayScale];
    UIFloorToScale();
    if (a4 + a5 + 0.001 <= v15) {
      goto LABEL_18;
    }
    if (!v8)
    {
      char v13 = 1;
      goto LABEL_20;
    }
    if ([v8 isGrouped]) {
      char v13 = [v8 isRevealed];
    }
    else {
LABEL_18:
    }
      char v13 = 0;
LABEL_20:
  }
LABEL_21:

  return v13;
}

- (double)_rollUnderTranslationTopMargin
{
  [(NCNotificationListView *)self bounds];
  double MaxY = CGRectGetMaxY(v9);
  [(NCNotificationListView *)self _visibleRect];
  double v4 = MaxY - CGRectGetMaxY(v10);
  if (v4 >= 104.0) {
    double v5 = 1.0;
  }
  else {
    double v5 = v4 / 104.0;
  }
  [(NCNotificationListView *)self _rollUnderThresholdOffset];
  double v7 = v6 + v5 * v5 * -52.0;
  [(NCNotificationListView *)self _drawRollUnderAreaInDebugViewIfNecessaryWithTopY:v7];
  return v7;
}

- (double)_rollUnderTranslationBottomMargin
{
  [(NCNotificationListView *)self _rollUnderTranslationTopMargin];
  return v2 + 156.0;
}

- (void)_drawRollUnderAreaInDebugViewIfNecessaryWithTopY:(double)a3
{
  if (self->_debugView && [(NSNumber *)self->_depth unsignedIntegerValue] == 1)
  {
    debugView = self->_debugView;
    [(NCNotificationListView *)self frame];
    double v7 = v6;
    [NSString stringWithFormat:@"[Depth=%lu,Index=%lu]: Roll Under Area: %@", -[NSNumber unsignedIntegerValue](self->_depth, "unsignedIntegerValue"), -[NSNumber unsignedIntegerValue](self->_index, "unsignedIntegerValue"), self->_purpose];
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListDebugView displayRect:withName:](debugView, "displayRect:withName:", v8, 0.0, a3, v7, 156.0);
  }
}

- (double)_unclampedTranslationProgressForView:(id)a3 withHeight:(double)a4 layoutOffset:(double)a5
{
  double v6 = a4 + a5;
  [(NCNotificationListView *)self _rollUnderTranslationTopMargin];
  double v8 = v7;
  [(NCNotificationListView *)self _rollUnderTranslationBottomMargin];
  double v10 = v9;
  double result = 0.0;
  if (v6 > v8) {
    return (v6 - v8) / (v10 - v8);
  }
  return result;
}

- (double)_verticalTranslationProgressForView:(id)a3 withHeight:(double)a4 layoutOffset:(double)a5
{
  [(NCNotificationListView *)self _unclampedTranslationProgressForView:a3 withHeight:a4 layoutOffset:a5];
  double v6 = v5;
  double v7 = sin(v5 * 3.14159265 * 0.5);
  double v8 = 0.0;
  if (v6 >= 0.0) {
    double v8 = v6;
  }
  if (v8 > 1.0) {
    double v8 = 1.0;
  }
  return v7 + (v8 - v7) * 0.4;
}

- (double)_scaleForRollUnderView:(id)a3 withHeight:(double)a4 layoutOffset:(double)a5
{
  [(NCNotificationListView *)self _unclampedTranslationProgressForView:a3 withHeight:a4 layoutOffset:a5];
  return (1.0 - cos(v5)) * -0.3 + 1.0;
}

- (double)_verticalTranslationForRollUnderView:(id)a3 withHeight:(double)a4 layoutOffset:(double)a5 scale:(double)a6
{
  -[NCNotificationListView _verticalTranslationProgressForView:withHeight:layoutOffset:](self, "_verticalTranslationProgressForView:withHeight:layoutOffset:", a3);
  double v11 = v10;
  double result = 0.0;
  if (v11 > 0.0)
  {
    [(NCNotificationListView *)self _rollUnderTranslationTopMargin];
    double v14 = v13;
    [(NCNotificationListView *)self _rollUnderThresholdOffset];
    return a4 + a5 - (v14 + v11 * (v15 - v14)) + (1.0 - a6) * a4 * -0.5;
  }
  return result;
}

- (double)_alphaForRollUnderForView:(id)a3 withHeight:(double)a4 layoutOffset:(double)a5
{
  [(NCNotificationListView *)self _unclampedTranslationProgressForView:a3 withHeight:a4 layoutOffset:a5];
  double v7 = (v6 + -1.2) / -0.2 + 1.0;
  if (v7 < 0.0) {
    double v7 = 0.0;
  }
  if (v7 <= 1.0) {
    double v8 = v7;
  }
  else {
    double v8 = 1.0;
  }
  [(NCNotificationListView *)self _visibleRect];
  if (CGRectGetHeight(v10) == 0.0) {
    return 0.0;
  }
  else {
    return v8;
  }
}

- (CGAffineTransform)_transformForRollUnderForView:(SEL)a3 withHeight:(id)a4 layoutOffset:(double)a5
{
  id v10 = a4;
  [(NCNotificationListView *)self _scaleForRollUnderView:v10 withHeight:a5 layoutOffset:a6];
  CGFloat v12 = v11;
  [(NCNotificationListView *)self _verticalTranslationForRollUnderView:v10 withHeight:a5 layoutOffset:a6 scale:v11];
  double v14 = v13;

  memset(&v19, 0, sizeof(v19));
  CGAffineTransformMakeTranslation(&v19, 0.0, -v14);
  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeScale(&v18, v12, v12);
  CGAffineTransform t1 = v18;
  CGAffineTransform v16 = v19;
  return CGAffineTransformConcat(retstr, &t1, &v16);
}

- (void)_updateShadowForOverlappingRollUnderView:(id)a3 withProgress:(double)a4
{
  id v12 = a3;
  double v6 = -[NCNotificationListView _listViewForView:](self, "_listViewForView:");
  double v7 = v6;
  if (v6 && [v6 count] != 1 && objc_msgSend(v7, "showStackBelowLeadingView")) {
    a4 = 0.0;
  }
  double v8 = a4 * 0.15;
  double v9 = [v12 layer];
  [v9 shadowOpacity];
  if (v8 != v10)
  {
    [v9 setShadowRadius:10.0];
    objc_msgSend(v9, "setShadowOffset:", 0.0, 5.0);
    *(float *)&double v11 = v8;
    [v9 setShadowOpacity:v11];
    [v9 setShadowPathIsBounds:1];
  }
}

- (double)_topSpacingForItemAtIndex:(unint64_t)a3
{
  long double v5 = [(NCNotificationListView *)self dataSource];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v5 notificationListView:self topSpacingForItemAtIndex:a3],
        (double v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v7 = v6;
    [v6 floatValue];
    double v9 = v8;
  }
  else if (a3)
  {
    [(NCListAnimationSettings *)self->_animationSettings viewSpacing];
    double v9 = v10;
  }
  else
  {
    double v9 = 0.0;
  }

  return v9;
}

- (double)_bottomSpacingForItemAtIndex:(unint64_t)a3
{
  if ([(NCNotificationListView *)self count] - 1 <= a3) {
    return 0.0;
  }

  [(NCNotificationListView *)self _topSpacingForItemAtIndex:a3 + 1];
  return result;
}

- (id)_viewForItemAtIndex:(unint64_t)a3
{
  long double v5 = [(NCNotificationListView *)self dataSource];
  double v6 = [v5 notificationListView:self viewForItemAtIndex:a3];

  uint64_t v7 = objc_opt_class();
  id v8 = v6;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      double v9 = v8;
    }
    else {
      double v9 = 0;
    }
  }
  else
  {
    double v9 = 0;
  }
  id v10 = v9;

  double v11 = [NSNumber numberWithUnsignedInteger:a3];
  [v10 setIndex:v11];

  return v8;
}

- (BOOL)visibleRectIsBounds
{
  return self->_visibleRectIsBounds;
}

- (void)setVisibleRectIsBounds:(BOOL)a3
{
  self->_visibleRectIsBounds = a3;
}

- (BOOL)isAnimatingAdditionalYOffset
{
  return self->_animatingAdditionalYOffset;
}

- (BOOL)isReactiveLayout
{
  return self->_reactiveLayout;
}

- (void)setReactiveLayout:(BOOL)a3
{
  self->_reactiveLayout = a3;
}

- (BOOL)isGrouped
{
  return self->_grouped;
}

- (double)featuredLeadingViewOcclusionTranslation
{
  return self->_featuredLeadingViewOcclusionTranslation;
}

- (BOOL)isSubviewPerformingGroupingAnimation
{
  return self->_subviewPerformingGroupingAnimation;
}

- (BOOL)isPerformingContentRevealAnimation
{
  return self->_performingContentRevealAnimation;
}

- (BOOL)isHiddenBelowStack
{
  return self->_hiddenBelowStack;
}

- (BOOL)showStackBelowLeadingView
{
  return self->_showStackBelowLeadingView;
}

- (void)setShowStackBelowLeadingView:(BOOL)a3
{
  self->_showStackBelowLeadingView = a3;
}

- (BOOL)supportsGrouping
{
  return self->_supportsGrouping;
}

- (void)setSupportsGrouping:(BOOL)a3
{
  self->_supportsGrouping = a3;
}

- (double)additionalBottomSpace
{
  return self->_additionalBottomSpace;
}

- (void)setAdditionalBottomSpace:(double)a3
{
  self->_additionalBottomSpace = a3;
}

- (double)minimumContentHeight
{
  return self->_minimumContentHeight;
}

- (void)setMinimumContentHeight:(double)a3
{
  self->_minimumContentdouble Height = a3;
}

- (unint64_t)groupingAnimationStyle
{
  return self->_groupingAnimationStyle;
}

- (void)setGroupingAnimationStyle:(unint64_t)a3
{
  self->_groupingAnimationStyle = a3;
}

- (BOOL)leadingContentShouldFillList
{
  return self->_leadingContentShouldFillList;
}

- (void)setLeadingContentShouldFillList:(BOOL)a3
{
  self->_leadingContentShouldFillList = a3;
}

- (BOOL)showContentForGroupedViews
{
  return self->_showContentForGroupedViews;
}

- (BOOL)layoutFromBottom
{
  return self->_layoutFromBottom;
}

- (void)setLayoutFromBottom:(BOOL)a3
{
  self->_layoutFromBottom = a3;
}

- (BOOL)supportsBottomViewsRollUnder
{
  return self->_supportsBottomViewsRollUnder;
}

- (double)visibleRectBottomMarginForRollUnder
{
  return self->_visibleRectBottomMarginForRollUnder;
}

- (BOOL)shouldLimitViewHeightForRollUnder
{
  return self->_shouldLimitViewHeightForRollUnder;
}

- (void)setShouldLimitViewHeightForRollUnder:(BOOL)a3
{
  self->_shouldLimitViewHeightForRollUnder = a3;
}

- (double)groupingViewOverlapCompressionFactor
{
  return self->_groupingViewOverlapCompressionFactor;
}

- (double)groupingViewOverlapAlphaFactor
{
  return self->_groupingViewOverlapAlphaFactor;
}

- (void)setGroupingViewOverlapAlphaFactor:(double)a3
{
  self->_groupingViewOverlapAlphaFactor = a3;
}

- (double)horizontalInsetMargin
{
  return self->_horizontalInsetMargin;
}

- (void)setHorizontalInsetMargin:(double)a3
{
  self->_horizontalInsetMargin = a3;
}

- (double)backgroundViewHorizontalOutsetMargin
{
  return self->_backgroundViewHorizontalOutsetMargin;
}

- (void)setBackgroundViewHorizontalOutsetMargin:(double)a3
{
  self->_backgroundViewHorizontalOutsetMargin = a3;
}

- (double)footerViewVerticalMargin
{
  return self->_footerViewVerticalMargin;
}

- (void)setFooterViewVerticalMargin:(double)a3
{
  self->_footerViewVerticalMargin = a3;
}

- (unint64_t)numberOfFeaturedLeadingViews
{
  return self->_numberOfFeaturedLeadingViews;
}

- (void)setNumberOfFeaturedLeadingViews:(unint64_t)a3
{
  self->_numberOfFeaturedLeadingViews = a3;
}

- (double)groupedOverlapHeightMultiple
{
  return self->_groupedOverlapHeightMultiple;
}

- (void)setGroupedOverlapHeightMultiple:(double)a3
{
  self->_groupedOverlapHeightMultiple = a3;
}

- (double)overrideLeadingViewHeight
{
  return self->_overrideLeadingViewHeight;
}

- (double)maximumLeadingViewHeight
{
  return self->_maximumLeadingViewHeight;
}

- (double)additionalYOffset
{
  return self->_additionalYOffset;
}

- (unint64_t)indexForReveal
{
  return self->_indexForReveal;
}

- (void)setIndexForReveal:(unint64_t)a3
{
  self->_indexForReveal = a3;
}

- (BOOL)areSublistsRevealed
{
  return self->_sublistsRevealed;
}

- (BOOL)isRevealed
{
  return self->_revealed;
}

- (BOOL)isLeadingRevealView
{
  return self->_leadingRevealView;
}

- (void)setLeadingRevealView:(BOOL)a3
{
  self->_leadingRevealView = a3;
}

- (BOOL)isActiveRevealTransitioning
{
  return self->_activeRevealTransitioning;
}

- (BOOL)isRevealTransitionScrolling
{
  return self->_revealTransitionScrolling;
}

- (void)setRevealTransitionScrolling:(BOOL)a3
{
  self->_revealTransitionScrolling = a3;
}

- (BOOL)isListRevealTargetContentOffsetClamped
{
  return self->_listRevealTargetContentOffsetClamped;
}

- (void)setListRevealTargetContentOffsetClamped:(BOOL)a3
{
  self->_listRevealTargetContentOffsetClamped = a3;
}

- (double)revealPercentage
{
  return self->_revealPercentage;
}

- (unint64_t)revealIndexOffset
{
  return self->_revealIndexOffset;
}

- (void)setRevealIndexOffset:(unint64_t)a3
{
  self->_revealIndexOffset = a3;
}

- (double)interactionTranslation
{
  return self->_interactionTranslation;
}

- (double)interactionTranslationPercentage
{
  return self->_interactionTranslationPercentage;
}

- (double)interactionVelocity
{
  return self->_interactionVelocity;
}

- (double)interactionTranslationFocalPointY
{
  return self->_interactionTranslationFocalPointY;
}

- (void)setInteractionTranslationFocalPointY:(double)a3
{
  self->_interactionTranslationFocalPointY = a3;
}

- (NCNotificationListViewDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (NCNotificationListViewDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (NSNumber)footerCenterY
{
  return self->_footerCenterY;
}

- (void)setFooterCenterY:(id)a3
{
}

- (NCNotificationListDebugView)debugView
{
  return self->_debugView;
}

- (NSNumber)depth
{
  return self->_depth;
}

- (void)setDepth:(id)a3
{
}

- (NSNumber)index
{
  return self->_index;
}

- (void)setIndex:(id)a3
{
}

- (NSMutableDictionary)visibleViews
{
  return self->_visibleViews;
}

- (void)setVisibleViews:(id)a3
{
}

- (NSMutableSet)insertedViewIndices
{
  return self->_insertedViewIndices;
}

- (void)setInsertedViewIndices:(id)a3
{
}

- (NSMutableSet)reloadedViewIndices
{
  return self->_reloadedViewIndices;
}

- (void)setReloadedViewIndices:(id)a3
{
}

- (unint64_t)removedViewIndex
{
  return self->_removedViewIndex;
}

- (void)setRemovedViewIndex:(unint64_t)a3
{
  self->_removedViewIndeCGFloat x = a3;
}

- (BOOL)shouldBottomViewsRollUnder
{
  return self->_shouldBottomViewsRollUnder;
}

- (void)setShouldBottomViewsRollUnder:(BOOL)a3
{
  self->_shouldBottomViewsRollUnder = a3;
}

- (BOOL)isPerformingGroupingAnimation
{
  return self->_performingGroupingAnimation;
}

- (void)setPerformingGroupingAnimation:(BOOL)a3
{
  self->_performingGroupingAnimation = a3;
}

- (BOOL)isPerformingRevealAnimation
{
  return self->_performingRevealAnimation;
}

- (void)setPerformingRevealAnimation:(BOOL)a3
{
  self->_performingRevealAnimation = a3;
}

- (BOOL)isPerformingRemovalAnimation
{
  return self->_performingRemovalAnimation;
}

- (void)setPerformingRemovalAnimation:(BOOL)a3
{
  self->_performingRemovalAnimation = a3;
}

- (BOOL)isPerformingHeaderReloadAnimation
{
  return self->_performingHeaderReloadAnimation;
}

- (void)setPerformingHeaderReloadAnimation:(BOOL)a3
{
  self->_performingHeaderReloadAnimation = a3;
}

- (BOOL)isPerformingVisibleRectAdjustment
{
  return self->_performingVisibleRectAdjustment;
}

- (void)setPerformingVisibleRectAdjustment:(BOOL)a3
{
  self->_performingVisibleRectAdjustment = a3;
}

- (BOOL)isPerformingStackVisibilityAnimation
{
  return self->_performingStackVisibilityAnimation;
}

- (void)setPerformingStackVisibilityAnimation:(BOOL)a3
{
  self->_performingStackVisibilityAnimation = a3;
}

- (BOOL)isPerformingInteractiveTranslationAnimation
{
  return self->_performingInteractiveTranslationAnimation;
}

- (void)setPerformingInteractiveTranslationAnimation:(BOOL)a3
{
  self->_performingInteractiveTranslationAnimation = a3;
}

- (BOOL)isPerformingHeaderGroupingAnimation
{
  return self->_performingHeaderGroupingAnimation;
}

- (void)setPerformingHeaderGroupingAnimation:(BOOL)a3
{
  self->_performingHeaderGroupingAnimation = a3;
}

- (BOOL)isPerformingRevealTransitionAnimation
{
  return self->_performingRevealTransitionAnimation;
}

- (void)setPerformingRevealTransitionAnimation:(BOOL)a3
{
  self->_performingRevealTransitionAnimation = a3;
}

- (BOOL)isPerformingBottomMarginAdjustmentAnimation
{
  return self->_performingBottomMarginAdjustmentAnimation;
}

- (void)setPerformingBottomMarginAdjustmentAnimation:(BOOL)a3
{
  self->_performingBottomMarginAdjustmentAnimation = a3;
}

- (BOOL)isPerformingInteractionVelocityAnimation
{
  return self->_performingInteractionVelocityAnimation;
}

- (void)setPerformingInteractionVelocityAnimation:(BOOL)a3
{
  self->_performingInteractionVelocityAnimation = a3;
}

- (BOOL)isPerformingOverrideLeadingViewHeightAdjustment
{
  return self->_performingOverrideLeadingViewHeightAdjustment;
}

- (void)setPerformingOverrideLeadingViewHeightAdjustment:(BOOL)a3
{
  self->_performingOverrideLeadingViewHeightAdjustment = a3;
}

- (NSHashTable)viewsPerformingAnimation
{
  return self->_viewsPerformingAnimation;
}

- (void)setViewsPerformingAnimation:(id)a3
{
}

- (NSHashTable)viewsPerformingBottomMarginAdjustmentAnimation
{
  return self->_viewsPerformingBottomMarginAdjustmentAnimation;
}

- (void)setViewsPerformingBottomMarginAdjustmentAnimation:(id)a3
{
}

- (NSHashTable)viewsPerformingRollUnderLayout
{
  return self->_viewsPerformingRollUnderLayout;
}

- (void)setViewsPerformingRollUnderLayout:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
}

- (UIView)hoverView
{
  return self->_hoverView;
}

- (void)setHoverView:(id)a3
{
}

- (BOOL)isHoverViewHidden
{
  return self->_hoverViewHidden;
}

- (void)setHoverViewHidden:(BOOL)a3
{
  self->_hoverViewHidden = a3;
}

- (BOOL)hasPerformedFirstLayout
{
  return self->_performedFirstLayout;
}

- (void)setPerformedFirstLayout:(BOOL)a3
{
  self->_performedFirstLayout = a3;
}

- (BOOL)isCachedSizeValid
{
  return self->_cachedSizeValid;
}

- (void)setCachedSizeValid:(BOOL)a3
{
  self->_cachedSizeValid = a3;
}

- (CGSize)cachedSize
{
  double width = self->_cachedSize.width;
  double height = self->_cachedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCachedSize:(CGSize)a3
{
  self->_cachedSize = a3;
}

- (CGAffineTransform)overrideTopViewDimmingTransform
{
  long long v3 = *(_OWORD *)&self[53].c;
  *(_OWORD *)&retstr->CGFloat a = *(_OWORD *)&self[53].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&self[53].tx;
  return self;
}

- (UIViewFloatAnimatableProperty)visibleRectHeightAnimatableProperty
{
  return self->_visibleRectHeightAnimatableProperty;
}

- (void)setVisibleRectHeightAnimatableProperty:(id)a3
{
}

- (double)groupedTranslation
{
  return self->_groupedTranslation;
}

- (NSDate)lastDebugViewUpdate
{
  return self->_lastDebugViewUpdate;
}

- (void)setLastDebugViewUpdate:(id)a3
{
}

- (NCListAnimationSettings)animationSettings
{
  return self->_animationSettings;
}

- (void)setAnimationSettings:(id)a3
{
  self->_animationSettings = (NCListAnimationSettings *)a3;
}

- (NSString)purpose
{
  return self->_purpose;
}

- (void)setPurpose:(id)a3
{
}

- (NSString)purposeWithSensitiveTextHashed
{
  return self->_purposeWithSensitiveTextHashed;
}

- (void)setPurposeWithSensitiveTextHashed:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (CGRect)_visibleRect
{
  double x = self->__visibleRect.origin.x;
  double y = self->__visibleRect.origin.y;
  double width = self->__visibleRect.size.width;
  double height = self->__visibleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_purposeWithSensitiveTextHashed, 0);
  objc_storeStrong((id *)&self->_purpose, 0);
  objc_storeStrong((id *)&self->_lastDebugViewUpdate, 0);
  objc_storeStrong((id *)&self->_visibleRectHeightAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_hoverView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_viewsPerformingRollUnderLayout, 0);
  objc_storeStrong((id *)&self->_viewsPerformingBottomMarginAdjustmentAnimation, 0);
  objc_storeStrong((id *)&self->_viewsPerformingAnimation, 0);
  objc_storeStrong((id *)&self->_reloadedViewIndices, 0);
  objc_storeStrong((id *)&self->_insertedViewIndices, 0);
  objc_storeStrong((id *)&self->_visibleViews, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_depth, 0);
  objc_storeStrong((id *)&self->_debugView, 0);
  objc_storeStrong((id *)&self->_footerCenterY, 0);

  objc_destroyWeak((id *)&self->_dataSource);
}

- (void)_currentAnimator
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_1D7C04000, log, OS_LOG_TYPE_FAULT, "Unexpectedly didn't recieve animator from data source: %@, for object: %@", (uint8_t *)&v3, 0x16u);
}

@end