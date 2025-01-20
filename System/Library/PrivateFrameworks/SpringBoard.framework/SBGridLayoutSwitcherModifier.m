@interface SBGridLayoutSwitcherModifier
- (BOOL)_isIndexVisible:(unint64_t)a3;
- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3;
- (BOOL)isHomeAffordanceSupportedForAppLayout:(id)a3;
- (BOOL)shouldAnimateInsertionOrRemovalOfAppLayout:(id)a3 atIndex:(unint64_t)a4;
- (BOOL)shouldBringCardToFrontDuringInsertionOrRemoval;
- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4;
- (CGRect)_frameForIndex:(unint64_t)a3 ignoringScrollOffset:(BOOL)a4;
- (CGRect)_frameWithScaleAppliedForIndex:(unint64_t)a3 ignoringScrollOffset:(BOOL)a4;
- (CGRect)frameForIndex:(unint64_t)a3;
- (CGSize)_contentSize;
- (CGSize)_fittedContentSize;
- (CGSize)_scaledCardSize;
- (SBGridLayoutSwitcherModifier)initWithAlignment:(unint64_t)a3 layoutDirection:(unint64_t)a4;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (_NSRange)visibleAppLayoutRangeForContentOffset:(CGPoint)a3;
- (double)_cardHeaderHeight;
- (double)_cornerRadius;
- (double)_horizontalSpacing;
- (double)_verticalSpacing;
- (double)contentViewScale;
- (double)distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:(unint64_t)a3;
- (double)minimumTranslationToKillIndex:(unint64_t)a3;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)rotationAngleForIndex:(unint64_t)a3;
- (double)scale;
- (double)shadowOffsetForIndex:(unint64_t)a3;
- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4;
- (double)titleAndIconOpacityForIndex:(unint64_t)a3;
- (double)titleOpacityForIndex:(unint64_t)a3;
- (double)visibleMarginForItemContainerAtIndex:(unint64_t)a3;
- (id)adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip:(id)a3;
- (id)adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher:(id)a3 identifiersInStrip:(id)a4;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)appLayoutsToCacheFullsizeSnapshots;
- (id)appLayoutsToCacheSnapshots;
- (id)handleScrollEvent:(id)a3;
- (id)handleSwitcherSettingsChangedEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)scrollViewAttributes;
- (id)visibleAppLayouts;
- (id)visibleHomeAffordanceLayoutElements;
- (unint64_t)_appLayoutIndexForSpaceIndex:(unint64_t)a3;
- (unint64_t)_columnForIndex:(unint64_t)a3;
- (unint64_t)_firstTrailingIndexForContentOffset:(CGPoint)a3;
- (unint64_t)_indexOfLeadingCard;
- (unint64_t)_numberOfColumns;
- (unint64_t)_numberOfSpaces;
- (unint64_t)_rowForIndex:(unint64_t)a3;
- (unint64_t)alignment;
- (unint64_t)indexToScrollToAfterInsertingAtIndex:(unint64_t)a3;
- (unint64_t)indexToScrollToAfterRemovingIndex:(unint64_t)a3;
- (unint64_t)layoutDirection;
- (void)_applyPrototypeSettings;
- (void)didMoveToParentModifier:(id)a3;
- (void)setAlignment:(unint64_t)a3;
- (void)setLayoutDirection:(unint64_t)a3;
@end

@implementation SBGridLayoutSwitcherModifier

- (SBGridLayoutSwitcherModifier)initWithAlignment:(unint64_t)a3 layoutDirection:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBGridLayoutSwitcherModifier;
  result = [(SBSwitcherModifier *)&v7 init];
  if (result)
  {
    result->_alignment = a3;
    result->_layoutDirection = a4;
  }
  return result;
}

- (void)didMoveToParentModifier:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBGridLayoutSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v5, sel_didMoveToParentModifier_);
  if (a3) {
    [(SBGridLayoutSwitcherModifier *)self _applyPrototypeSettings];
  }
}

- (double)scale
{
  v3 = [(SBGridLayoutSwitcherModifier *)self switcherSettings];
  [v3 gridSwitcherPageScale];
  double v5 = v4;

  [(SBGridLayoutSwitcherModifier *)self containerViewBounds];
  double Width = CGRectGetWidth(v9);
  char IsZero = BSFloatIsZero();
  double result = 0.0;
  if ((IsZero & 1) == 0) {
    return round(v5 * Width) / Width;
  }
  return result;
}

- (_NSRange)visibleAppLayoutRangeForContentOffset:(CGPoint)a3
{
  [(SBGridLayoutSwitcherModifier *)self scrollViewContentOffset];
  unint64_t v4 = -[SBGridLayoutSwitcherModifier _firstTrailingIndexForContentOffset:](self, "_firstTrailingIndexForContentOffset:");
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_2;
  }
  unint64_t v7 = v4;
  if (([(SBGridLayoutSwitcherModifier *)self isRTLEnabled] & 1) == 0)
  {
    if ((v7 & 0x8000000000000000) == 0)
    {
      uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        if ([(SBGridLayoutSwitcherModifier *)self _isIndexVisible:v7])
        {
          if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v13 = v7;
          }
          else {
            uint64_t v13 = v11;
          }
          uint64_t v10 = v7;
        }
        else
        {
          uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
          if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_24;
          }
        }
        uint64_t v11 = v13;
      }
      while ((uint64_t)v7-- > 0);
      goto LABEL_24;
    }
LABEL_2:
    NSUInteger v5 = 0;
    NSUInteger v6 = 0;
    goto LABEL_36;
  }
  unint64_t v8 = [(SBGridLayoutSwitcherModifier *)self _numberOfSpaces];
  if (v7 >= v8) {
    goto LABEL_2;
  }
  unint64_t v9 = v8;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    if ([(SBGridLayoutSwitcherModifier *)self _isIndexVisible:v7])
    {
      if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v12 = v7;
      }
      else {
        uint64_t v12 = v10;
      }
      uint64_t v11 = v7;
    }
    else
    {
      uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
    }
    ++v7;
    uint64_t v10 = v12;
  }
  while (v9 != v7);
LABEL_24:
  if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger v15 = 0;
  }
  else {
    NSUInteger v15 = v10;
  }
  if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = v11 - v10 + 1;
  }
  if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger v5 = 0;
  }
  else {
    NSUInteger v5 = v15;
  }
  if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger v6 = 0;
  }
  else {
    NSUInteger v6 = v16;
  }
LABEL_36:
  result.length = v6;
  result.location = v5;
  return result;
}

- (id)handleSwitcherSettingsChangedEvent:(id)a3
{
  id v4 = a3;
  [(SBGridLayoutSwitcherModifier *)self _applyPrototypeSettings];
  v7.receiver = self;
  v7.super_class = (Class)SBGridLayoutSwitcherModifier;
  NSUInteger v5 = [(SBSwitcherModifier *)&v7 handleSwitcherSettingsChangedEvent:v4];

  return v5;
}

- (id)handleScrollEvent:(id)a3
{
  id v4 = a3;
  [v4 contentOffset];
  double x = self->_previousContentOffset.x;
  if (x != 1.79769313e308 || self->_previousContentOffset.y != 1.79769313e308) {
    self->_isScrollingForward = x > v5;
  }
  self->_previousContentOffset.double x = v5;
  self->_previousContentOffset.y = v6;
  v11.receiver = self;
  v11.super_class = (Class)SBGridLayoutSwitcherModifier;
  unint64_t v9 = [(SBSwitcherModifier *)&v11 handleScrollEvent:v4];

  return v9;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  if ([v4 toEnvironmentMode] == 2 && objc_msgSend(v4, "fromEnvironmentMode") != 2)
  {
    self->_previousContentOffset = (CGPoint)SBInvalidPoint;
    self->_isScrollingForward = 1;
  }
  v7.receiver = self;
  v7.super_class = (Class)SBGridLayoutSwitcherModifier;
  double v5 = [(SBSwitcherModifier *)&v7 handleTransitionEvent:v4];

  return v5;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  [(SBGridLayoutSwitcherModifier *)self _frameForIndex:a3 ignoringScrollOffset:1];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.double x = v3;
  return result;
}

- (double)rotationAngleForIndex:(unint64_t)a3
{
  return 0.0;
}

- (id)visibleAppLayouts
{
  [(SBGridLayoutSwitcherModifier *)self scrollViewContentOffset];
  uint64_t v3 = [(SBGridLayoutSwitcherModifier *)self visibleAppLayoutRangeForContentOffset:"visibleAppLayoutRangeForContentOffset:"];
  uint64_t v5 = v4;
  v11.receiver = self;
  v11.super_class = (Class)SBGridLayoutSwitcherModifier;
  double v6 = [(SBGridLayoutSwitcherModifier *)&v11 visibleAppLayouts];
  objc_super v7 = [(SBGridLayoutSwitcherModifier *)self appLayouts];
  unint64_t v8 = objc_msgSend(v7, "subarrayWithRange:", v3, v5);
  unint64_t v9 = [v6 setByAddingObjectsFromArray:v8];

  return v9;
}

- (BOOL)isHomeAffordanceSupportedForAppLayout:(id)a3
{
  uint64_t v3 = [(SBGridLayoutSwitcherModifier *)self homeGrabberSettings];
  char v4 = [v3 isEnabled];

  return v4;
}

- (id)visibleHomeAffordanceLayoutElements
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (BOOL)_isIndexVisible:(unint64_t)a3
{
  [(SBGridLayoutSwitcherModifier *)self _frameWithScaleAppliedForIndex:a3 ignoringScrollOffset:1];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v12 = [(SBGridLayoutSwitcherModifier *)self switcherSettings];
  [v12 switcherCardShadowRadius];
  double v14 = v13;

  [(SBGridLayoutSwitcherModifier *)self switcherViewBounds];
  CGRect v22 = CGRectInset(v21, v14 * -2.8, v14 * -2.8);
  uint64_t v15 = v5;
  uint64_t v16 = v7;
  uint64_t v17 = v9;
  uint64_t v18 = v11;
  return CGRectIntersectsRect(v22, *(CGRect *)&v15);
}

- (double)contentViewScale
{
  return 1.0;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  uint64_t v3 = [(SBGridLayoutSwitcherModifier *)self switcherSettings];
  uint64_t v4 = [v3 animationSettings];

  uint64_t v5 = objc_alloc_init(SBMutableSwitcherAnimationAttributes);
  [(SBSwitcherAnimationAttributes *)v5 setUpdateMode:1];
  uint64_t v6 = [v4 layoutSettings];
  [(SBSwitcherAnimationAttributes *)v5 setLayoutSettings:v6];

  uint64_t v7 = [v4 opacitySettings];
  [(SBSwitcherAnimationAttributes *)v5 setOpacitySettings:v7];

  return v5;
}

- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3
{
  return 0;
}

- (double)visibleMarginForItemContainerAtIndex:(unint64_t)a3
{
  [(SBGridLayoutSwitcherModifier *)self frameForIndex:a3];
  return CGRectGetWidth(*(CGRect *)&v3);
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return 1.0;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  return 1.0;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  return 1.0;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  return 1.0;
}

- (double)shadowOffsetForIndex:(unint64_t)a3
{
  return 0.0;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  [(SBGridLayoutSwitcherModifier *)self _cornerRadius];
  [(SBGridLayoutSwitcherModifier *)self scaleForIndex:a3];
  SBRectCornerRadiiForRadius();
  result.topRight = v8;
  result.bottomRight = v7;
  result.bottomLeft = v6;
  result.topLeft = v5;
  return result;
}

- (id)appLayoutsToCacheSnapshots
{
  [(SBGridLayoutSwitcherModifier *)self scrollViewContentOffset];
  uint64_t v3 = [(SBGridLayoutSwitcherModifier *)self visibleAppLayoutRangeForContentOffset:"visibleAppLayoutRangeForContentOffset:"];
  uint64_t v5 = v4;
  double v6 = [(SBGridLayoutSwitcherModifier *)self switcherSettings];
  uint64_t v7 = [v6 numberOfSnapshotsToCacheInSwitcher];

  BOOL isScrollingForward = self->_isScrollingForward;
  return -[SBSwitcherModifier appLayoutsToCacheSnapshotsWithVisibleRange:numberOfSnapshotsToCache:biasForward:](self, "appLayoutsToCacheSnapshotsWithVisibleRange:numberOfSnapshotsToCache:biasForward:", v3, v5, v7, isScrollingForward);
}

- (id)appLayoutsToCacheFullsizeSnapshots
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)shouldAnimateInsertionOrRemovalOfAppLayout:(id)a3 atIndex:(unint64_t)a4
{
  return [(SBGridLayoutSwitcherModifier *)self _isIndexVisible:a4];
}

- (BOOL)shouldBringCardToFrontDuringInsertionOrRemoval
{
  return 1;
}

- (unint64_t)indexToScrollToAfterInsertingAtIndex:(unint64_t)a3
{
  unint64_t result = [(SBGridLayoutSwitcherModifier *)self _indexOfLeadingCard];
  if (result == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  return result;
}

- (unint64_t)indexToScrollToAfterRemovingIndex:(unint64_t)a3
{
  if ([(SBGridLayoutSwitcherModifier *)self _numberOfSpaces] < 2) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return [(SBGridLayoutSwitcherModifier *)self _indexOfLeadingCard];
}

- (unint64_t)_indexOfLeadingCard
{
  [(SBGridLayoutSwitcherModifier *)self scrollViewContentOffset];
  uint64_t v3 = [(SBGridLayoutSwitcherModifier *)self visibleAppLayoutRangeForContentOffset:"visibleAppLayoutRangeForContentOffset:"];
  if (!v4) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v5 = v3;
  [(SBSwitcherModifier *)self scaledFrameForIndex:v3];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [(SBGridLayoutSwitcherModifier *)self switcherViewBounds];
  v16.origin.double x = v7;
  v16.origin.y = v9;
  v16.size.width = v11;
  v16.size.height = v13;
  if (!CGRectIntersectsRect(v15, v16)
    && v5 < [(SBGridLayoutSwitcherModifier *)self _numberOfSpaces] - 1)
  {
    v5 += [(SBGridLayoutSwitcherModifier *)self numberOfRowsInGridSwitcher];
  }
  return v5;
}

- (id)adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher:(id)a3 identifiersInStrip:(id)a4
{
  id v4 = a3;
  return v4;
}

- (id)adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip:(id)a3
{
  id v3 = a3;
  return v3;
}

- (id)scrollViewAttributes
{
  id v3 = objc_alloc_init(SBMutableSwitcherScrollViewAttributes);
  [(SBGridLayoutSwitcherModifier *)self _contentSize];
  -[SBSwitcherScrollViewAttributes setContentSize:](v3, "setContentSize:");
  [(SBSwitcherScrollViewAttributes *)v3 setDecelerationRate:*MEMORY[0x1E4F43CE0]];
  [(SBSwitcherScrollViewAttributes *)v3 setScrollViewPagingEnabled:0];
  -[SBSwitcherScrollViewAttributes setInterpageSpacingForPaging:](v3, "setInterpageSpacingForPaging:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  -[SBSwitcherScrollViewAttributes setPagingOrigin:](v3, "setPagingOrigin:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  [(SBSwitcherScrollViewAttributes *)v3 setInterpolatesDuringSwipeToKill:0];
  return v3;
}

- (double)minimumTranslationToKillIndex:(unint64_t)a3
{
  -[SBGridLayoutSwitcherModifier frameForIndex:](self, "frameForIndex:");
  [(SBGridLayoutSwitcherModifier *)self scaleForIndex:a3];
  SBTransformedRectWithScale();
  return CGRectGetMinY(*(CGRect *)&v5);
}

- (CGSize)_contentSize
{
  [(SBGridLayoutSwitcherModifier *)self _fittedContentSize];
  double v4 = v3;
  double v6 = v5;
  [(SBGridLayoutSwitcherModifier *)self _horizontalSpacing];
  double v8 = v4 + v7;
  [(SBGridLayoutSwitcherModifier *)self switcherViewBounds];
  double Width = CGRectGetWidth(v14);
  if (v8 < Width) {
    double v8 = Width;
  }
  [(SBGridLayoutSwitcherModifier *)self switcherViewBounds];
  double Height = CGRectGetHeight(v15);
  if (v6 >= Height) {
    double v11 = v6;
  }
  else {
    double v11 = Height;
  }
  double v12 = v8;
  result.height = v11;
  result.width = v12;
  return result;
}

- (CGSize)_fittedContentSize
{
  [(SBGridLayoutSwitcherModifier *)self _scaledCardSize];
  [(SBGridLayoutSwitcherModifier *)self _numberOfColumns];
  [(SBGridLayoutSwitcherModifier *)self _horizontalSpacing];
  [(SBGridLayoutSwitcherModifier *)self numberOfRowsInGridSwitcher];
  [(SBGridLayoutSwitcherModifier *)self _verticalSpacing];
  [(SBGridLayoutSwitcherModifier *)self screenScale];
  BSSizeRoundForScale();
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4
{
  int v7 = [(SBGridLayoutSwitcherModifier *)self isRTLEnabled];
  [(SBGridLayoutSwitcherModifier *)self _contentSize];
  double v9 = v8;
  [(SBGridLayoutSwitcherModifier *)self switcherViewBounds];
  double v11 = v10;
  [(SBGridLayoutSwitcherModifier *)self _frameWithScaleAppliedForIndex:a3 ignoringScrollOffset:1];
  double v13 = v12;
  [(SBGridLayoutSwitcherModifier *)self _horizontalSpacing];
  double v15 = v14;
  [(SBGridLayoutSwitcherModifier *)self _frameWithScaleAppliedForIndex:a3 ignoringScrollOffset:0];
  double v17 = v16;
  double v18 = v15 + v13;
  switch(a4)
  {
    case 0:
    case 3:
      if (v7)
      {
        [(SBGridLayoutSwitcherModifier *)self _horizontalSpacing];
        goto LABEL_8;
      }
      break;
    case 1:
      if (v7)
      {
        double v18 = v18 - v11;
      }
      else
      {
        [(SBGridLayoutSwitcherModifier *)self _horizontalSpacing];
        double v18 = v11 - v21;
      }
      break;
    case 2:
      if (v7)
      {
        [(SBGridLayoutSwitcherModifier *)self _horizontalSpacing];
        double v19 = v18 + v20;
LABEL_8:
        double v18 = -v19;
      }
      else
      {
        double v18 = v18 + v18;
      }
      break;
    default:
      break;
  }
  if (v7) {
    double v22 = 0.0;
  }
  else {
    double v22 = v11;
  }
  double v23 = fmax(v17 + v18 - v22, 0.0);
  if (v9 - v11 <= v23) {
    double v23 = v9 - v11;
  }
  double v24 = 0.0;
  result.y = v24;
  result.double x = v23;
  return result;
}

- (double)distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:(unint64_t)a3
{
  uint64_t v5 = [(SBGridLayoutSwitcherModifier *)self numberOfRowsInGridSwitcher];
  [(SBGridLayoutSwitcherModifier *)self _horizontalSpacing];
  unint64_t layoutDirection = self->_layoutDirection;
  -[SBSwitcherModifier distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:numberOfRows:padding:layoutDirection:](self, "distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:numberOfRows:padding:layoutDirection:", a3, v5, layoutDirection);
  return result;
}

- (void)_applyPrototypeSettings
{
  id v6 = [(SBGridLayoutSwitcherModifier *)self switcherSettings];
  [v6 gridSwitcherHorizontalInterpageSpacingLandscape];
  kGridSwitcherHorizontalInterpageSpacingLandscape = v2;
  [v6 gridSwitcherVerticalNaturalSpacingLandscape];
  kGridSwitcherVerticalNaturalSpacingLandscape = v3;
  [v6 gridSwitcherHorizontalInterpageSpacingPortrait];
  kGridSwitcherHorizontalInterpageSpacingPortrait = v4;
  [v6 gridSwitcherVerticalNaturalSpacingPortrait];
  kGridSwitcherVerticalNaturalSpacingPortrait = v5;
}

- (unint64_t)_firstTrailingIndexForContentOffset:(CGPoint)a3
{
  double x = a3.x;
  unint64_t v5 = [(SBGridLayoutSwitcherModifier *)self _numberOfSpaces];
  if (!v5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v6 = v5;
  [(SBGridLayoutSwitcherModifier *)self _scaledCardSize];
  double v8 = v7;
  [(SBGridLayoutSwitcherModifier *)self _horizontalSpacing];
  double v10 = x / (v8 + v9 * 2.0);
  int v11 = BSFloatLessThanOrEqualToFloat();
  unint64_t v12 = vcvtmd_u64_f64(v10);
  if (v11) {
    unint64_t v13 = 0;
  }
  else {
    unint64_t v13 = v12;
  }
  if ([(SBGridLayoutSwitcherModifier *)self isRTLEnabled]) {
    return [(SBGridLayoutSwitcherModifier *)self numberOfRowsInGridSwitcher] * v13;
  }
  unint64_t v15 = [(SBGridLayoutSwitcherModifier *)self _numberOfColumns] - v13;
  unint64_t v16 = v6 - 1;
  uint64_t v17 = [(SBGridLayoutSwitcherModifier *)self numberOfRowsInGridSwitcher];
  if (v16 >= v15 * v17 - 1) {
    return v15 * v17 - 1;
  }
  else {
    return v16;
  }
}

- (CGRect)_frameForIndex:(unint64_t)a3 ignoringScrollOffset:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v7 = [(SBGridLayoutSwitcherModifier *)self _numberOfSpaces];
  unint64_t v8 = a3;
  if (v7)
  {
    if (self->_layoutDirection) {
      unint64_t v8 = v7 + ~a3;
    }
    else {
      unint64_t v8 = a3;
    }
  }
  [(SBGridLayoutSwitcherModifier *)self _rowForIndex:v8];
  [(SBGridLayoutSwitcherModifier *)self _columnForIndex:v8];
  [(SBGridLayoutSwitcherModifier *)self switcherViewBounds];
  [(SBGridLayoutSwitcherModifier *)self _scaledCardSize];
  [(SBGridLayoutSwitcherModifier *)self _horizontalSpacing];
  [(SBGridLayoutSwitcherModifier *)self _fittedContentSize];
  [(SBGridLayoutSwitcherModifier *)self _horizontalSpacing];
  [(SBGridLayoutSwitcherModifier *)self _fittedContentSize];
  [(SBGridLayoutSwitcherModifier *)self _verticalSpacing];
  [(SBGridLayoutSwitcherModifier *)self _horizontalSpacing];
  [(SBGridLayoutSwitcherModifier *)self _horizontalSpacing];
  if (![(SBGridLayoutSwitcherModifier *)self isRTLEnabled]) {
    [(SBGridLayoutSwitcherModifier *)self _contentSize];
  }
  [(SBGridLayoutSwitcherModifier *)self _horizontalSpacing];
  [(SBGridLayoutSwitcherModifier *)self _cardHeaderHeight];
  [(SBGridLayoutSwitcherModifier *)self numberOfRowsInGridSwitcher];
  [(SBGridLayoutSwitcherModifier *)self _verticalSpacing];
  [(SBGridLayoutSwitcherModifier *)self numberOfRowsInGridSwitcher];
  [(SBGridLayoutSwitcherModifier *)self floatingDockHeight];
  [(SBGridLayoutSwitcherModifier *)self _verticalSpacing];
  if (self->_alignment == 1)
  {
    [(SBGridLayoutSwitcherModifier *)self _contentSize];
    [(SBGridLayoutSwitcherModifier *)self _horizontalSpacing];
    if (BSFloatLessThanOrEqualToFloat()) {
      [(SBGridLayoutSwitcherModifier *)self isRTLEnabled];
    }
  }
  v22.receiver = self;
  v22.super_class = (Class)SBGridLayoutSwitcherModifier;
  [(SBGridLayoutSwitcherModifier *)&v22 frameForIndex:a3];
  SBRectWithSize();
  SBUnintegralizedRectCenteredAboutPoint();
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  if (v4)
  {
    [(SBGridLayoutSwitcherModifier *)self scrollViewContentOffset];
    double v10 = v10 - v17;
  }
  double v18 = v10;
  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.double x = v18;
  return result;
}

- (double)_verticalSpacing
{
  [(SBGridLayoutSwitcherModifier *)self switcherInterfaceOrientation];
  [(SBGridLayoutSwitcherModifier *)self screenScale];
  BSFloatRoundForScale();
  return result;
}

- (double)_horizontalSpacing
{
  [(SBGridLayoutSwitcherModifier *)self switcherInterfaceOrientation];
  [(SBGridLayoutSwitcherModifier *)self screenScale];
  BSFloatRoundForScale();
  return result;
}

- (double)_cornerRadius
{
  [(SBGridLayoutSwitcherModifier *)self displayCornerRadius];
  BOOL v3 = v2 <= 0.0;
  double result = 7.0;
  if (!v3) {
    return 10.0;
  }
  return result;
}

- (unint64_t)_rowForIndex:(unint64_t)a3
{
  unint64_t v4 = [(SBGridLayoutSwitcherModifier *)self numberOfRowsInGridSwitcher];
  if (v4 <= 1) {
    unint64_t v5 = 1;
  }
  else {
    unint64_t v5 = v4;
  }
  return a3 % v5;
}

- (unint64_t)_columnForIndex:(unint64_t)a3
{
  unint64_t v4 = [(SBGridLayoutSwitcherModifier *)self numberOfRowsInGridSwitcher];
  if (v4 <= 1) {
    unint64_t v5 = 1;
  }
  else {
    unint64_t v5 = v4;
  }
  return a3 / v5;
}

- (double)_cardHeaderHeight
{
  double v2 = [(SBGridLayoutSwitcherModifier *)self switcherSettings];
  [v2 spacingBetweenSnapshotAndIcon];
  double v4 = v3;
  [v2 iconSideLength];
  double v6 = v4 + v5;

  return v6;
}

- (CGRect)_frameWithScaleAppliedForIndex:(unint64_t)a3 ignoringScrollOffset:(BOOL)a4
{
  [(SBGridLayoutSwitcherModifier *)self _frameForIndex:a3 ignoringScrollOffset:a4];
  [(SBGridLayoutSwitcherModifier *)self scaleForIndex:a3];
  SBTransformedRectWithScale();
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.double x = v6;
  return result;
}

- (unint64_t)_numberOfColumns
{
  return vcvtpd_u64_f64((double)[(SBGridLayoutSwitcherModifier *)self _numberOfSpaces]/ (double)(unint64_t)[(SBGridLayoutSwitcherModifier *)self numberOfRowsInGridSwitcher]);
}

- (unint64_t)_numberOfSpaces
{
  double v2 = [(SBGridLayoutSwitcherModifier *)self appLayouts];
  unint64_t v3 = [v2 count];

  return v3;
}

- (unint64_t)_appLayoutIndexForSpaceIndex:(unint64_t)a3
{
  return a3;
}

- (CGSize)_scaledCardSize
{
  [(SBGridLayoutSwitcherModifier *)self scale];
  double v4 = v3;
  [(SBGridLayoutSwitcherModifier *)self containerViewBounds];
  double v6 = v4 * v5;
  double v8 = v4 * v7;
  result.height = v8;
  result.width = v6;
  return result;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(unint64_t)a3
{
  self->_alignment = a3;
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(unint64_t)a3
{
  self->_unint64_t layoutDirection = a3;
}

@end