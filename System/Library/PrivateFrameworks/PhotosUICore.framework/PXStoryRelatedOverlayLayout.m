@interface PXStoryRelatedOverlayLayout
- (BOOL)_needsRTLFlip;
- (BOOL)allowsDanglingUpdatesAssertions;
- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5;
- (BOOL)isRelatedOverlayScrolledIntoView;
- (BOOL)shouldCountDown;
- (BOOL)wantsNavigationButton;
- (BOOL)wasAnimatingScrollOffsetForNavigation;
- (CGSize)layout:(id)a3 estimatedContentSizeForSublayoutAtIndex:(int64_t)a4 referenceSize:(CGSize)a5;
- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (NSTimer)countDownTimer;
- (PXGScrollLayout)scrollLayout;
- (PXNumberAnimator)countDownAlphaAnimator;
- (PXNumberAnimator)navigationButtonAlphaAnimator;
- (PXNumberAnimator)navigationButtonScrollAnimator;
- (PXStoryChromeButtonConfiguration)navigationButtonConfiguration;
- (PXStoryRelatedLayoutGenerator)layoutGenerator;
- (PXStoryRelatedOverlayItemDecorationSource)decorationSource;
- (PXStoryRelatedOverlayLayout)init;
- (PXStoryRelatedOverlayLayout)initWithViewModel:(id)a3;
- (PXStoryScrollContentLayout)scrollContentLayout;
- (PXStoryViewModel)viewModel;
- (UIEdgeInsets)paddingForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (_PXGSpriteIndexRange)relatedSelectionSpriteIndexRange;
- (double)navigationButtonScrollAnimatorTarget;
- (id)_firstRelatedSublayout;
- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)axLocalizedLabel;
- (id)axSpriteIndexes;
- (id)hitTestResultForSpriteIndex:(unsigned int)a3;
- (id)imageConfigurationAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4;
- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4;
- (id)preferredFocusLayouts;
- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)_relatedIndexForSublayoutIndex:(int64_t)a3;
- (int64_t)_sublayoutIndexForFirstRelated;
- (int64_t)_sublayoutIndexForRelatedIndex:(int64_t)a3;
- (int64_t)countDownValue;
- (int64_t)navigationButtonDirection;
- (int64_t)navigationButtonVersion;
- (int64_t)relatedCardOverlayStartIndex;
- (int64_t)selectedIndex;
- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (void)_arrangeSublayoutAtIndex:(int64_t)a3 frame:(CGRect)a4 zIndex:(int64_t *)a5;
- (void)_autoplayUpNext;
- (void)_considerChangingToSelectedRelatedMemory;
- (void)_createRelatedAnimationIfNeeded;
- (void)_handleCountDownTimer:(id)a3;
- (void)_handleNavigationButton:(id)a3;
- (void)_invalidateAXGroupRole;
- (void)_invalidateContent;
- (void)_invalidateNavigationButton;
- (void)_invalidateRelatedSpritesAndSublayouts;
- (void)_invalidateScrollSpritesAndSublayouts;
- (void)_invalidateShouldCountDown;
- (void)_invalidateSublayoutPositions;
- (void)_invalidateTitleContent;
- (void)_selectRelatedMemoryAtIndex:(int64_t)a3;
- (void)_updateContent;
- (void)_updateNavigationButton;
- (void)_updateRelatedSpritesAndSublayouts;
- (void)_updateScrollSpritesAndSublayouts;
- (void)_updateShouldCountDown;
- (void)_updateSublayoutPositions;
- (void)alphaDidChange;
- (void)dealloc;
- (void)displayScaleDidChange;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)referenceDepthDidChange;
- (void)referenceSizeDidChange;
- (void)scrollContentLayoutScrollOffsetDidChange:(id)a3;
- (void)scrollLayoutWillBeginScrolling:(id)a3;
- (void)scrollLayoutWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5 currentContentOffset:(CGPoint)a6;
- (void)setCountDownTimer:(id)a3;
- (void)setCountDownValue:(int64_t)a3;
- (void)setIsRelatedOverlayScrolledIntoView:(BOOL)a3;
- (void)setNavigationButtonConfiguration:(id)a3;
- (void)setNavigationButtonDirection:(int64_t)a3;
- (void)setNavigationButtonScrollAnimatorTarget:(double)a3;
- (void)setNavigationButtonVersion:(int64_t)a3;
- (void)setSelectedIndex:(int64_t)a3;
- (void)setShouldCountDown:(BOOL)a3;
- (void)setWantsNavigationButton:(BOOL)a3;
- (void)setWasAnimatingScrollOffsetForNavigation:(BOOL)a3;
- (void)showOrHideFullRelated:(BOOL)a3;
- (void)update;
@end

@implementation PXStoryRelatedOverlayLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decorationSource, 0);
  objc_storeStrong((id *)&self->_navigationButtonScrollAnimator, 0);
  objc_storeStrong((id *)&self->_navigationButtonConfiguration, 0);
  objc_storeStrong((id *)&self->_navigationButtonAlphaAnimator, 0);
  objc_storeStrong((id *)&self->_countDownTimer, 0);
  objc_storeStrong((id *)&self->_countDownAlphaAnimator, 0);
  objc_storeStrong((id *)&self->_scrollLayout, 0);
  objc_storeStrong((id *)&self->_scrollContentLayout, 0);
  objc_storeStrong((id *)&self->_layoutGenerator, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (PXStoryRelatedOverlayItemDecorationSource)decorationSource
{
  return self->_decorationSource;
}

- (void)setNavigationButtonScrollAnimatorTarget:(double)a3
{
  self->_navigationButtonScrollAnimatorTarget = a3;
}

- (double)navigationButtonScrollAnimatorTarget
{
  return self->_navigationButtonScrollAnimatorTarget;
}

- (PXNumberAnimator)navigationButtonScrollAnimator
{
  return self->_navigationButtonScrollAnimator;
}

- (void)setWasAnimatingScrollOffsetForNavigation:(BOOL)a3
{
  self->_wasAnimatingScrollOffsetForNavigation = a3;
}

- (BOOL)wasAnimatingScrollOffsetForNavigation
{
  return self->_wasAnimatingScrollOffsetForNavigation;
}

- (void)setNavigationButtonVersion:(int64_t)a3
{
  self->_navigationButtonVersion = a3;
}

- (int64_t)navigationButtonVersion
{
  return self->_navigationButtonVersion;
}

- (void)setNavigationButtonConfiguration:(id)a3
{
}

- (PXStoryChromeButtonConfiguration)navigationButtonConfiguration
{
  return self->_navigationButtonConfiguration;
}

- (int64_t)navigationButtonDirection
{
  return self->_navigationButtonDirection;
}

- (BOOL)wantsNavigationButton
{
  return self->_wantsNavigationButton;
}

- (PXNumberAnimator)navigationButtonAlphaAnimator
{
  return self->_navigationButtonAlphaAnimator;
}

- (void)setSelectedIndex:(int64_t)a3
{
  self->_selectedIndex = a3;
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (int64_t)countDownValue
{
  return self->_countDownValue;
}

- (NSTimer)countDownTimer
{
  return self->_countDownTimer;
}

- (BOOL)shouldCountDown
{
  return self->_shouldCountDown;
}

- (BOOL)isRelatedOverlayScrolledIntoView
{
  return self->_isRelatedOverlayScrolledIntoView;
}

- (PXNumberAnimator)countDownAlphaAnimator
{
  return self->_countDownAlphaAnimator;
}

- (PXGScrollLayout)scrollLayout
{
  return self->_scrollLayout;
}

- (PXStoryScrollContentLayout)scrollContentLayout
{
  return self->_scrollContentLayout;
}

- (PXStoryRelatedLayoutGenerator)layoutGenerator
{
  return self->_layoutGenerator;
}

- (_PXGSpriteIndexRange)relatedSelectionSpriteIndexRange
{
  return self->_relatedSelectionSpriteIndexRange;
}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = v9;
  if (a4 != 1) {
    goto LABEL_5;
  }
  v11 = PXGAXGetElementForUserInfo(v9);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_5:
    v11 = [(PXGLayout *)self axNextResponder];
    char v12 = [v11 axGroup:v8 didRequestToPerformAction:a4 userInfo:v10];
    goto LABEL_6;
  }
  -[PXStoryRelatedOverlayLayout _selectRelatedMemoryAtIndex:](self, "_selectRelatedMemoryAtIndex:", [v11 spriteIndex] - self->_relatedSelectionSpriteIndexRange.location);
  char v12 = 1;
LABEL_6:

  return v12;
}

- (id)preferredFocusLayouts
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(PXStoryRelatedOverlayLayout *)self _firstRelatedSublayout];
  if (v4) {
    [v3 addObject:v4];
  }
  v5 = (void *)[v3 copy];

  return v5;
}

- (id)axSpriteIndexes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  [v3 addIndex:self->_titleSpriteIndex];
  v4 = (void *)[v3 copy];

  return v4;
}

- (void)scrollLayoutWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5 currentContentOffset:(CGPoint)a6
{
  double y = a4.y;
  double x = a4.x;
  v10 = [(PXStoryRelatedOverlayLayout *)self scrollContentLayout];
  objc_msgSend(v10, "scrollOffsetForScrollViewContentOffset:", a5->x, a5->y);
  double v20 = v11;
  double v21 = v12;
  char v19 = 0;
  v13 = [(PXStoryRelatedOverlayLayout *)self layoutGenerator];
  [v10 scrollOffset];
  objc_msgSend(v13, "adjustTargetScrollOffset:forVelocity:currentScrollOffset:shouldHideContent:", &v20, &v19, x, y, v14, v15);

  if (v19)
  {
    v16 = [(PXStoryRelatedOverlayLayout *)self viewModel];
    [v16 performChanges:&__block_literal_global_276_286102];
  }
  objc_msgSend(v10, "scrollViewContentOffsetForScrollOffset:", v20, v21);
  a5->double x = v17;
  a5->double y = v18;
  [(PXStoryRelatedOverlayLayout *)self setNavigationButtonScrollAnimatorTarget:v20];
}

uint64_t __114__PXStoryRelatedOverlayLayout_scrollLayoutWillEndScrolling_withVelocity_targetContentOffset_currentContentOffset___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setWantsRelatedOverlayVisible:0];
}

- (void)scrollLayoutWillBeginScrolling:(id)a3
{
  id v3 = [(PXStoryRelatedOverlayLayout *)self viewModel];
  [v3 performChanges:&__block_literal_global_274_286104];
}

uint64_t __62__PXStoryRelatedOverlayLayout_scrollLayoutWillBeginScrolling___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setShouldCountDownToUpNext:0];
}

- (void)scrollContentLayoutScrollOffsetDidChange:(id)a3
{
  if (!self->_shouldIgnoreContentScrollOffsetChanges) {
    [(PXStoryRelatedOverlayLayout *)self _invalidateSublayoutPositions];
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v11 = a3;
  if ((void *)ViewModelObservationContext_286106 == a5)
  {
    if ((a4 & 0x100) != 0) {
      [(PXStoryRelatedOverlayLayout *)self _invalidateRelatedSpritesAndSublayouts];
    }
    if ((a4 & 0x8100) != 0)
    {
      [(PXStoryRelatedOverlayLayout *)self _invalidateScrollSpritesAndSublayouts];
      [(PXStoryRelatedOverlayLayout *)self _invalidateAXGroupRole];
    }
    if ((a4 & 0x8000) != 0) {
      [(PXStoryRelatedOverlayLayout *)self _invalidateContent];
    }
    if ((a4 & 0x20) != 0) {
      [(PXStoryRelatedOverlayLayout *)self _invalidateTitleContent];
    }
    if ((a4 & 0x10020) != 0) {
      [(PXStoryRelatedOverlayLayout *)self _invalidateSublayoutPositions];
    }
    if ((a4 & 0x10000201) != 0) {
      [(PXStoryRelatedOverlayLayout *)self _invalidateShouldCountDown];
    }
    if ((a4 & 0x20000000000000) != 0) {
      [(PXStoryRelatedOverlayLayout *)self _considerChangingToSelectedRelatedMemory];
    }
    if ((a4 & 0x20000000000) != 0) {
      [(PXStoryRelatedOverlayLayout *)self _createRelatedAnimationIfNeeded];
    }
    if ((a4 & 0x40000008000201) != 0) {
      [(PXStoryRelatedOverlayLayout *)self _invalidateNavigationButton];
    }
  }
  else if ((void *)CountDownAlphaAnimatorObservationContext == a5 {
         || NavigationButtonAlphaAnimatorObservationContext == (void)a5)
  }
  {
    if ((a4 & 2) != 0) {
      [(PXStoryRelatedOverlayLayout *)self _invalidateContent];
    }
  }
  else
  {
    if ((void *)NavigationButtonScrollAnimatorObservationContext != a5)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"PXStoryRelatedOverlayLayout.m" lineNumber:942 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    if ((a4 & 6) != 0) {
      [(PXStoryRelatedOverlayLayout *)self _invalidateSublayoutPositions];
    }
  }
}

- (id)_firstRelatedSublayout
{
  int64_t v3 = [(PXStoryRelatedOverlayLayout *)self _sublayoutIndexForFirstRelated];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0;
  }
  else
  {
    v4 = [(PXGLayout *)self sublayoutAtIndex:v3 loadIfNeeded:0];
  }
  return v4;
}

- (int64_t)_sublayoutIndexForFirstRelated
{
  if (self->_relatedSublayoutIndexRange.length) {
    return [(PXStoryRelatedOverlayLayout *)self _sublayoutIndexForRelatedIndex:0];
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (int64_t)_sublayoutIndexForRelatedIndex:(int64_t)a3
{
  if (a3 < 0 || self->_relatedSublayoutIndexRange.length <= a3)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PXStoryRelatedOverlayLayout.m", 879, @"Invalid parameter not satisfying: %@", @"relatedIndex >= 0 && relatedIndex < _relatedSublayoutIndexRange.length" object file lineNumber description];
  }
  return self->_relatedSublayoutIndexRange.location + a3;
}

- (int64_t)_relatedIndexForSublayoutIndex:(int64_t)a3
{
  NSUInteger location = self->_relatedSublayoutIndexRange.location;
  if (a3 - location < self->_relatedSublayoutIndexRange.length && a3 >= location) {
    return a3 - location;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4
{
  return 0;
}

- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4
{
  id v7 = a3;
  int64_t v8 = [(PXStoryRelatedOverlayLayout *)self _relatedIndexForSublayoutIndex:a4];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_scrollSublayoutIndex != a4)
    {
      double v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2 object:self file:@"PXStoryRelatedOverlayLayout.m" lineNumber:862 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    id v9 = [(PXStoryRelatedOverlayLayout *)self scrollLayout];
  }
  else
  {
    int64_t v10 = v8;
    id v11 = [(PXStoryRelatedOverlayLayout *)self viewModel];
    double v12 = [v11 relatedModels];
    v13 = [v12 objectAtIndexedSubscript:v10];

    id v9 = [[PXStoryLayout alloc] initWithModel:v13];
  }

  return v9;
}

- (CGSize)layout:(id)a3 estimatedContentSizeForSublayoutAtIndex:(int64_t)a4 referenceSize:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v10 = a3;
  int64_t v11 = [(PXStoryRelatedOverlayLayout *)self _relatedIndexForSublayoutIndex:a4];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_scrollSublayoutIndex != a4)
    {
      double v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"PXStoryRelatedOverlayLayout.m" lineNumber:846 description:@"Code which should be unreachable has been reached"];

      abort();
    }
  }
  else
  {
    v13 = &self->_relatedDefaultFrames[v11];
    CGFloat width = v13->size.width;
    CGFloat height = v13->size.height;
  }

  double v14 = width;
  double v15 = height;
  result.CGFloat height = v15;
  result.CGFloat width = v14;
  return result;
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_navigationButtonSpriteIndex != a3)
  {
    int64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXStoryRelatedOverlayLayout.m" lineNumber:834 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  int64_t v8 = v7;
  id v9 = [(PXStoryRelatedOverlayLayout *)self navigationButtonConfiguration];

  return v9;
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_navigationButtonSpriteIndex != a3)
  {
    int64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXStoryRelatedOverlayLayout.m" lineNumber:827 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  int64_t v8 = v7;
  id v9 = objc_opt_class();

  return (Class)v9;
}

- (id)imageConfigurationAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_countDownDecorationSpriteIndex != a3)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PXStoryRelatedOverlayLayout.m" lineNumber:817 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  int64_t v8 = v7;
  id v9 = [(PXStoryRelatedOverlayLayout *)self viewModel];
  id v10 = [v9 viewLayoutSpec];
  int64_t v11 = [v10 upNextCountDownDecorationImageConfiguration];

  return v11;
}

- (UIEdgeInsets)paddingForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  double v4 = 6.0;
  double v5 = 0.0;
  double v6 = 6.0;
  double v7 = 0.0;
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_countDownSpriteIndex != a3)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PXStoryRelatedOverlayLayout.m" lineNumber:803 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  int64_t v8 = v7;
  id v9 = [(PXStoryRelatedOverlayLayout *)self viewModel];
  id v10 = [v9 viewLayoutSpec];
  int64_t v11 = [v10 upNextCountDownAttributes];

  return v11;
}

- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_countDownSpriteIndex != a3)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"PXStoryRelatedOverlayLayout.m" lineNumber:795 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  int64_t v8 = v7;
  id v9 = [(PXStoryRelatedOverlayLayout *)self viewModel];
  id v10 = [v9 viewLayoutSpec];
  int64_t v11 = [v10 upNextCountDownFormatter];
  double v12 = objc_msgSend(NSNumber, "numberWithInteger:", -[PXStoryRelatedOverlayLayout countDownValue](self, "countDownValue"));
  v13 = [v11 stringFromNumber:v12];

  return v13;
}

- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_titleSpriteIndex == a3)
  {
    int64_t v8 = 1;
  }
  else
  {
    if (self->_countDownSpriteIndex != a3)
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"PXStoryRelatedOverlayLayout.m" lineNumber:787 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    int64_t v8 = 0;
  }

  return v8;
}

- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_titleSpriteIndex == a3)
  {
    int64_t v8 = [(PXStoryRelatedOverlayLayout *)self viewModel];
    id v9 = [v8 viewLayoutSpec];
    id v10 = [v9 relatedAttributedTitle];
  }
  else
  {
    if (self->_countDownSpriteIndex != a3)
    {
      double v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"PXStoryRelatedOverlayLayout.m" lineNumber:777 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    id v10 = 0;
  }

  return v10;
}

- (id)axLocalizedLabel
{
  return PXLocalizedStringFromTable(@"InteractiveMemoryUpNextTitle", @"PhotosUICore");
}

- (void)_invalidateAXGroupRole
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x40;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x40) != 0)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryRelatedOverlayLayout _invalidateAXGroupRole]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryRelatedOverlayLayout.m", 742, @"invalidating %lu after it already has been updated", 64);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 64;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateContent
{
}

void __45__PXStoryRelatedOverlayLayout__updateContent__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) viewModel];
  id v19 = [v2 viewLayoutSpec];

  uint64_t v3 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v3 + 1116)) {
    double v4 = *(CGFloat **)(v3 + 1088);
  }
  else {
    double v4 = (CGFloat *)off_1E5DAB010;
  }
  CGFloat v6 = *v4;
  CGFloat v5 = v4[1];
  CGFloat v8 = v4[2];
  CGFloat v7 = v4[3];
  [v19 relatedTitleSize];
  CGFloat v20 = v9;
  CGFloat v11 = v10;
  v21.origin.double x = v6;
  v21.origin.double y = v5;
  v21.size.CGFloat width = v8;
  v21.size.CGFloat height = v7;
  double MinX = CGRectGetMinX(v21);
  double v13 = CGRectGetMinX(*(CGRect *)(a1 + 40));
  double v14 = [v19 relatedLayoutMetrics];
  [v14 margins];
  double v16 = v13 + v15;

  if (MinX >= v16) {
    CGFloat v17 = MinX;
  }
  else {
    CGFloat v17 = v16;
  }
  if ([*(id *)(a1 + 32) _needsRTLFlip])
  {
    v22.origin.double x = v6;
    v22.origin.double y = v5;
    v22.size.CGFloat width = v8;
    v22.size.CGFloat height = v7;
    CGRectGetMaxX(v22);
    v23.origin.double x = v17;
    v23.origin.double y = v5;
    v23.size.CGFloat width = v20;
    v23.size.CGFloat height = v11;
    CGRectGetWidth(v23);
    CGRectGetMaxX(*(CGRect *)(a1 + 40));
    v24.origin.double x = v17;
    v24.origin.double y = v5;
    v24.size.CGFloat width = v20;
    v24.size.CGFloat height = v11;
    CGRectGetWidth(v24);
    CGFloat v18 = [v19 relatedLayoutMetrics];
    [v18 margins];
  }
  v25.origin.double x = v6;
  v25.origin.double y = v5;
  v25.size.CGFloat width = v8;
  v25.size.CGFloat height = v7;
  CGRectGetMinY(v25);
  [v19 spacingBetweenRelatedTitleAndMainRelated];
  sub_1AB23B20C();
}

- (BOOL)_needsRTLFlip
{
  return 0;
}

- (void)_invalidateTitleContent
{
}

- (void)_invalidateContent
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x10;
      goto LABEL_7;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x10) != 0)
    {
      CGFloat v6 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v7 = [NSString stringWithUTF8String:"-[PXStoryRelatedOverlayLayout _invalidateContent]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXStoryRelatedOverlayLayout.m", 617, @"invalidating %lu after it already has been updated", 16);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 16;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
LABEL_7:
  [(PXGLayout *)self setNeedsUpdate];
}

- (void)_updateNavigationButton
{
  id v8 = [(PXStoryRelatedOverlayLayout *)self viewModel];
  uint64_t v3 = [v8 viewLayoutSpec];
  [v3 canShowRelatedNavigationButton];
  double v5 = v4;

  if (v5 != 0.0)
  {
    if ([v8 wantsRelatedOverlayNavigationButtonsVisible]
      && ([v8 isActive] & 1) != 0)
    {
      CGFloat v6 = [v8 relatedConfigurations];
      -[PXStoryRelatedOverlayLayout setWantsNavigationButton:](self, "setWantsNavigationButton:", [v6 count] != 0);
    }
    else
    {
      [(PXStoryRelatedOverlayLayout *)self setWantsNavigationButton:0];
    }
    if ([v8 isRelatedOverlayScrolledIntoView]) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 2;
    }
    [(PXStoryRelatedOverlayLayout *)self setNavigationButtonDirection:v7];
  }
}

- (void)_invalidateNavigationButton
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x20;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x20) != 0)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v6 = [NSString stringWithUTF8String:"-[PXStoryRelatedOverlayLayout _invalidateNavigationButton]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryRelatedOverlayLayout.m", 604, @"invalidating %lu after it already has been updated", 32);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 32;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateShouldCountDown
{
  id v4 = [(PXStoryRelatedOverlayLayout *)self viewModel];
  if [v4 shouldCountDownToUpNext] && (objc_msgSend(v4, "isActive"))
  {
    uint64_t v3 = [v4 relatedConfigurations];
    -[PXStoryRelatedOverlayLayout setShouldCountDown:](self, "setShouldCountDown:", [v3 count] != 0);
  }
  else
  {
    [(PXStoryRelatedOverlayLayout *)self setShouldCountDown:0];
  }
}

- (void)_invalidateShouldCountDown
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 8;
      goto LABEL_7;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 8) != 0)
    {
      CGFloat v6 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v7 = [NSString stringWithUTF8String:"-[PXStoryRelatedOverlayLayout _invalidateShouldCountDown]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXStoryRelatedOverlayLayout.m", 592, @"invalidating %lu after it already has been updated", 8);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 8;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
LABEL_7:
  [(PXGLayout *)self setNeedsUpdate];
}

- (void)_arrangeSublayoutAtIndex:(int64_t)a3 frame:(CGRect)a4 zIndex:(int64_t *)a5
{
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double height = a4.size.height;
    double width = a4.size.width;
    double y = a4.origin.y;
    double x = a4.origin.x;
    int64_t v12 = (*a5)++;
    uint64_t v13 = [(PXGLayout *)self numberOfSublayouts];
    [(PXGLayout *)self referenceDepth];
    double v15 = v14 / (double)v13;
    -[PXGAbsoluteCompositeLayout setFrame:forSublayoutAtIndex:](self, "setFrame:forSublayoutAtIndex:", a3, x, y, width, height);
    [(PXGAbsoluteCompositeLayout *)self setZPosition:a3 forSublayoutAtIndex:v15 * (double)-v12];
    [(PXGAbsoluteCompositeLayout *)self setReferenceDepth:a3 forSublayoutAtIndex:v15];
  }
}

- (void)_updateSublayoutPositions
{
}

- (void)_invalidateSublayoutPositions
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 4;
      goto LABEL_7;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      CGFloat v6 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v7 = [NSString stringWithUTF8String:"-[PXStoryRelatedOverlayLayout _invalidateSublayoutPositions]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXStoryRelatedOverlayLayout.m", 501, @"invalidating %lu after it already has been updated", 4);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 4;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
LABEL_7:
  [(PXGLayout *)self setNeedsUpdate];
}

- (void)_updateScrollSpritesAndSublayouts
{
  uint64_t v3 = [(PXStoryRelatedOverlayLayout *)self viewModel];
  int v4 = [v3 wantsRelatedOverlayScrollable];

  scrollSublayoutIndedouble x = self->_scrollSublayoutIndex;
  if (v4)
  {
    if (scrollSublayoutIndex == 0x7FFFFFFFFFFFFFFFLL)
    {
      self->_scrollSublayoutIndedouble x = self->_relatedSublayoutIndexRange.length
                                  + self->_relatedSublayoutIndexRange.location;
      CGFloat v6 = objc_alloc_init(PXStoryScrollContentLayout);
      scrollContentLayout = self->_scrollContentLayout;
      self->_scrollContentLayout = v6;

      [(PXStoryScrollContentLayout *)self->_scrollContentLayout setDelegate:self];
      id v8 = [[PXGScrollLayout alloc] initWithContentLayout:self->_scrollContentLayout];
      scrollLayout = self->_scrollLayout;
      self->_scrollLayout = v8;

      [(PXGScrollLayout *)self->_scrollLayout setDelegate:self];
      [(PXGScrollLayout *)self->_scrollLayout setScrollDecelerationRate:1];
      -[PXGAbsoluteCompositeLayout insertSublayoutProvider:inRange:](self, "insertSublayoutProvider:inRange:", self, self->_scrollSublayoutIndex, 1);
    }
  }
  else if (scrollSublayoutIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(PXGLayout *)self removeSublayoutAtIndex:"removeSublayoutAtIndex:"];
    self->_scrollSublayoutIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
  }
  [(PXStoryRelatedOverlayLayout *)self _invalidateSublayoutPositions];
}

- (void)_invalidateScrollSpritesAndSublayouts
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v6 = [NSString stringWithUTF8String:"-[PXStoryRelatedOverlayLayout _invalidateScrollSpritesAndSublayouts]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryRelatedOverlayLayout.m", 471, @"invalidating %lu after it already has been updated", 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 2;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateRelatedSpritesAndSublayouts
{
  uint64_t v3 = [(PXStoryRelatedOverlayLayout *)self viewModel];
  int v4 = [v3 relatedModels];
  uint64_t v5 = [v4 count];

  _PXGSpriteIndexRange relatedSelectionSpriteIndexRange = self->_relatedSelectionSpriteIndexRange;
  self->_relatedSelectionSpriteIndexRange.NSUInteger length = v5;
  [(PXGLayout *)self removeSpritesInRange:relatedSelectionSpriteIndexRange];
  [(PXGLayout *)self addSpritesInRange:*(void *)&self->_relatedSelectionSpriteIndexRange initialState:0];
  NSUInteger location = self->_relatedSublayoutIndexRange.location;
  NSUInteger length = self->_relatedSublayoutIndexRange.length;
  self->_relatedSublayoutIndexRange.NSUInteger length = v5;
  -[PXGAbsoluteCompositeLayout removeSublayoutsInRange:](self, "removeSublayoutsInRange:", location, length);
  -[PXGAbsoluteCompositeLayout insertSublayoutProvider:inRange:](self, "insertSublayoutProvider:inRange:", self, self->_relatedSublayoutIndexRange.location, self->_relatedSublayoutIndexRange.length);
  scrollSublayoutIndedouble x = self->_scrollSublayoutIndex;
  if (scrollSublayoutIndex != 0x7FFFFFFFFFFFFFFFLL) {
    self->_scrollSublayoutIndedouble x = scrollSublayoutIndex - length + self->_relatedSublayoutIndexRange.length;
  }
  [(PXStoryRelatedOverlayLayout *)self _invalidateScrollSpritesAndSublayouts];
  [(PXStoryRelatedOverlayLayout *)self _invalidateContent];
  [(PXStoryRelatedOverlayLayout *)self _invalidateSublayoutPositions];
  [(PXGLayout *)self invalidateDecoration];
}

- (void)_invalidateRelatedSpritesAndSublayouts
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_updateFlags.updated)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v6 = [NSString stringWithUTF8String:"-[PXStoryRelatedOverlayLayout _invalidateRelatedSpritesAndSublayouts]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryRelatedOverlayLayout.m", 445, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)update
{
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.BOOL willPerformUpdate = 0;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      CGFloat v11 = [MEMORY[0x1E4F28B00] currentHandler];
      int64_t v12 = [NSString stringWithUTF8String:"-[PXStoryRelatedOverlayLayout update]"];
      [v11 handleFailureInFunction:v12, @"PXStoryRelatedOverlayLayout.m", 418, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXStoryRelatedOverlayLayout *)self _updateRelatedSpritesAndSublayouts];
      if (!p_updateFlags->isPerformingUpdate)
      {
        CGRect v25 = [MEMORY[0x1E4F28B00] currentHandler];
        v26 = [NSString stringWithUTF8String:"-[PXStoryRelatedOverlayLayout update]"];
        [v25 handleFailureInFunction:v26, @"PXStoryRelatedOverlayLayout.m", 422, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      [(PXStoryRelatedOverlayLayout *)self _updateScrollSpritesAndSublayouts];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
      double v14 = [NSString stringWithUTF8String:"-[PXStoryRelatedOverlayLayout update]"];
      [v13 handleFailureInFunction:v14, @"PXStoryRelatedOverlayLayout.m", 425, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v6 & 4) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v6 & 0xFFFFFFFFFFFFFFFBLL;
      [(PXStoryRelatedOverlayLayout *)self _updateSublayoutPositions];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      double v15 = [MEMORY[0x1E4F28B00] currentHandler];
      double v16 = [NSString stringWithUTF8String:"-[PXStoryRelatedOverlayLayout update]"];
      [v15 handleFailureInFunction:v16, @"PXStoryRelatedOverlayLayout.m", 428, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v7 & 8) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v7 & 0xFFFFFFFFFFFFFFF7;
      [(PXStoryRelatedOverlayLayout *)self _updateShouldCountDown];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      CGFloat v17 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v18 = [NSString stringWithUTF8String:"-[PXStoryRelatedOverlayLayout update]"];
      [v17 handleFailureInFunction:v18, @"PXStoryRelatedOverlayLayout.m", 431, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v8 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x20uLL;
    if ((v8 & 0x20) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v8 & 0xFFFFFFFFFFFFFFDFLL;
      [(PXStoryRelatedOverlayLayout *)self _updateNavigationButton];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      id v19 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v20 = [NSString stringWithUTF8String:"-[PXStoryRelatedOverlayLayout update]"];
      [v19 handleFailureInFunction:v20, @"PXStoryRelatedOverlayLayout.m", 434, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v9 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x10uLL;
    if ((v9 & 0x10) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v9 & 0xFFFFFFFFFFFFFFEFLL;
      [(PXStoryRelatedOverlayLayout *)self _updateContent];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      CGRect v21 = [MEMORY[0x1E4F28B00] currentHandler];
      CGRect v22 = [NSString stringWithUTF8String:"-[PXStoryRelatedOverlayLayout update]"];
      [v21 handleFailureInFunction:v22, @"PXStoryRelatedOverlayLayout.m", 437, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v10 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x40uLL;
    if ((v10 & 0x40) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v10 & 0xFFFFFFFFFFFFFFBFLL;
      [(PXStoryRelatedOverlayLayout *)self _updateAXGroupRole];
      unint64_t v10 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v10)
    {
      CGRect v23 = [MEMORY[0x1E4F28B00] currentHandler];
      CGRect v24 = [NSString stringWithUTF8String:"-[PXStoryRelatedOverlayLayout update]"];
      objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, @"PXStoryRelatedOverlayLayout.m", 440, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v27.receiver = self;
  v27.super_class = (Class)PXStoryRelatedOverlayLayout;
  [(PXGCompositeLayout *)&v27 update];
}

- (int64_t)relatedCardOverlayStartIndex
{
  return self->_relatedSelectionSpriteIndexRange.location;
}

- (void)_autoplayUpNext
{
  id v2 = [(PXStoryRelatedOverlayLayout *)self viewModel];
  [v2 performChanges:&__block_literal_global_245_286144];
}

uint64_t __46__PXStoryRelatedOverlayLayout__autoplayUpNext__block_invoke(uint64_t a1, void *a2)
{
  return [a2 autoPlayUpNext];
}

- (void)_considerChangingToSelectedRelatedMemory
{
  uint64_t v3 = [(PXStoryRelatedOverlayLayout *)self viewModel];
  int v4 = [v3 viewLayoutSpec];
  if ([v4 upNextAnimationStyle] == 2
    && ([v3 isPerformingCrossfadeTransitionToRelated] & 1) == 0)
  {
    selectedIndedouble x = self->_selectedIndex;

    if (selectedIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v6 = self->_selectedIndex;
      self->_selectedIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __71__PXStoryRelatedOverlayLayout__considerChangingToSelectedRelatedMemory__block_invoke;
      v7[3] = &__block_descriptor_40_e35_v16__0___PXStoryMutableViewModel__8l;
      v7[4] = v6;
      [v3 performChanges:v7];
    }
  }
  else
  {
  }
}

void __71__PXStoryRelatedOverlayLayout__considerChangingToSelectedRelatedMemory__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setWantsChromeVisible:0];
  [v3 selectRelatedAtIndex:*(void *)(a1 + 32)];
}

- (void)_createRelatedAnimationIfNeeded
{
  id v11 = [(PXStoryRelatedOverlayLayout *)self viewModel];
  int v4 = [v11 viewLayoutSpec];
  if ([v4 upNextAnimationStyle] != 1)
  {
LABEL_7:

    int64_t v6 = v11;
    goto LABEL_8;
  }
  char v5 = [v11 shouldSimplifyUIForAccessibility];

  int64_t v6 = v11;
  if ((v5 & 1) == 0)
  {
    uint64_t v7 = [v11 selectedRelatedIndex];
    int64_t v6 = v11;
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v8 = [(PXGLayout *)self sublayoutAtIndex:[(PXStoryRelatedOverlayLayout *)self _sublayoutIndexForRelatedIndex:"_sublayoutIndexForRelatedIndex:"] loadIfNeeded:0];
      int v4 = v8;
      if (!v8)
      {
        unint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
        [v10 handleFailureInMethod:a2, self, @"PXStoryRelatedOverlayLayout.m", 377, @"Invalid parameter not satisfying: %@", @"sublayout != nil" object file lineNumber description];

        unint64_t v8 = 0;
      }
      id v9 = PXStoryRelatedAnimationCreate(v8);
      goto LABEL_7;
    }
  }
LABEL_8:
}

- (BOOL)allowsDanglingUpdatesAssertions
{
  return 0;
}

- (void)setWantsNavigationButton:(BOOL)a3
{
  if (self->_wantsNavigationButton != a3)
  {
    self->_wantsNavigationButton = a3;
    [(PXStoryRelatedOverlayLayout *)self _invalidateContent];
    char v5 = [(PXStoryRelatedOverlayLayout *)self viewModel];
    int64_t v6 = [v5 viewLayoutSpec];
    [v6 relatedNavigationButtonFadeDuration];
    double v8 = v7;

    id v9 = [(PXStoryRelatedOverlayLayout *)self navigationButtonAlphaAnimator];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__PXStoryRelatedOverlayLayout_setWantsNavigationButton___block_invoke;
    v10[3] = &__block_descriptor_33_e35_v16__0___PXMutableNumberAnimator__8l;
    BOOL v11 = a3;
    [v9 performChangesWithDuration:1 curve:v10 changes:v8];
  }
}

uint64_t __56__PXStoryRelatedOverlayLayout_setWantsNavigationButton___block_invoke(uint64_t a1, void *a2)
{
  double v2 = 1.0;
  if (!*(unsigned char *)(a1 + 32)) {
    double v2 = 0.0;
  }
  return [a2 setValue:v2];
}

- (void)setNavigationButtonDirection:(int64_t)a3
{
  if (self->_navigationButtonDirection != a3)
  {
    self->_navigationButtonDirection = a3;
    char v5 = [(PXStoryRelatedOverlayLayout *)self viewModel];
    id v12 = [v5 viewLayoutSpec];

    int64_t v6 = objc_alloc_init(PXStoryChromeButtonConfiguration);
    [(PXStoryChromeButtonConfiguration *)v6 setBackgroundStyle:3];
    [(PXStoryChromeButtonConfiguration *)v6 setTarget:self];
    [v12 relatedNavigationButtonSystemImagePointSize];
    -[PXStoryChromeButtonConfiguration setPreferredSystemImagePointSize:](v6, "setPreferredSystemImagePointSize:");
    double v7 = [MEMORY[0x1E4FB1618] blackColor];
    [(PXStoryChromeButtonConfiguration *)v6 setTintColor:v7];

    double v8 = [MEMORY[0x1E4FB1618] colorWithWhite:0.75 alpha:1.0];
    [(PXStoryChromeButtonConfiguration *)v6 setSolidBackgroundColor:v8];

    [(PXStoryChromeButtonConfiguration *)v6 setPreferredSystemImageWeight:(uint64_t)*MEMORY[0x1E4FB09B8]];
    [(PXStoryChromeButtonConfiguration *)v6 setAction:sel__handleNavigationButton_];
    id v9 = [v12 relatedNavigationChromeButtonSpec];
    [(PXStoryChromeButtonConfiguration *)v6 setSpec:v9];

    if (a3 == 1) {
      unint64_t v10 = @"chevron.left";
    }
    else {
      unint64_t v10 = @"chevron.right";
    }
    [(PXStoryChromeButtonConfiguration *)v6 setSystemImageName:v10];
    [(PXStoryChromeButtonConfiguration *)v6 setBackgroundColorAdaptsToHoveredState:0];
    BOOL v11 = PXLocalizedStringFromTable(@"InteractiveMemoryButtonAccessibilityLabelRelatedNavigation", @"PhotosUICore");
    [(PXStoryChromeButtonConfiguration *)v6 setAxLabel:v11];

    [(PXStoryRelatedOverlayLayout *)self setNavigationButtonConfiguration:v6];
    [(PXStoryRelatedOverlayLayout *)self setNavigationButtonVersion:[(PXStoryRelatedOverlayLayout *)self navigationButtonVersion] + 1];
    [(PXStoryRelatedOverlayLayout *)self _invalidateContent];
  }
}

- (void)showOrHideFullRelated:(BOOL)a3
{
  if (a3)
  {
    int v4 = [(PXStoryRelatedOverlayLayout *)self scrollContentLayout];
    [v4 scrollableOutsets];
  }
  [(PXStoryRelatedOverlayLayout *)self navigationButtonScrollAnimatorTarget];
  PXFloatEqualToFloatWithTolerance();
}

void __53__PXStoryRelatedOverlayLayout_showOrHideFullRelated___block_invoke_2(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 scrollContentLayout];
  [v4 scrollOffset];
  objc_msgSend(v3, "setValue:");
}

uint64_t __53__PXStoryRelatedOverlayLayout_showOrHideFullRelated___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setValue:*(double *)(a1 + 32)];
}

uint64_t __53__PXStoryRelatedOverlayLayout_showOrHideFullRelated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setShouldCountDownToUpNext:0];
}

- (void)_handleNavigationButton:(id)a3
{
  BOOL v4 = [(PXStoryRelatedOverlayLayout *)self navigationButtonDirection] == 2;
  [(PXStoryRelatedOverlayLayout *)self showOrHideFullRelated:v4];
}

- (void)setCountDownValue:(int64_t)a3
{
  if (self->_countDownValue != a3)
  {
    self->_countDownValue = a3;
    [(PXStoryRelatedOverlayLayout *)self _invalidateContent];
  }
}

- (void)setCountDownTimer:(id)a3
{
  char v5 = (NSTimer *)a3;
  p_countDownTimer = &self->_countDownTimer;
  if (*p_countDownTimer != v5)
  {
    double v7 = v5;
    [(NSTimer *)*p_countDownTimer invalidate];
    objc_storeStrong((id *)p_countDownTimer, a3);
    char v5 = v7;
  }
}

- (void)_handleCountDownTimer:(id)a3
{
  if ([(PXStoryRelatedOverlayLayout *)self countDownValue] < 1)
  {
    [(PXStoryRelatedOverlayLayout *)self _autoplayUpNext];
  }
  else
  {
    [(PXStoryRelatedOverlayLayout *)self setCountDownValue:[(PXStoryRelatedOverlayLayout *)self countDownValue] - 1];
    BOOL v4 = [(PXStoryRelatedOverlayLayout *)self viewModel];
    id v10 = [v4 viewLayoutSpec];

    double v5 = (double)[(PXStoryRelatedOverlayLayout *)self countDownValue];
    [v10 upNextCountDownInitialVisibleValue];
    if (v6 == v5 && [v10 upNextCountdownPlacement] == 1)
    {
      double v7 = [(PXStoryRelatedOverlayLayout *)self countDownAlphaAnimator];
      [v7 performChangesUsingDefaultSpringAnimationWithInitialVelocity:&__block_literal_global_220_286165 changes:0.0];
    }
    double v8 = (double)[(PXStoryRelatedOverlayLayout *)self countDownValue];
    [v10 upNextCountDownInitialVisibleValue];
    if (v9 >= v8 && [v10 upNextCountdownPlacement] == 2) {
      [(PXStoryRelatedOverlayLayout *)self _setFirstRelatedLayoutCountdownValue:[(PXStoryRelatedOverlayLayout *)self countDownValue]];
    }
  }
}

uint64_t __53__PXStoryRelatedOverlayLayout__handleCountDownTimer___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setValue:1.0];
}

- (void)setShouldCountDown:(BOOL)a3
{
  if (self->_shouldCountDown != a3)
  {
    self->_shouldCountDown = a3;
    [(PXStoryRelatedOverlayLayout *)self _invalidateContent];
    if (self->_shouldCountDown)
    {
      objc_msgSend(MEMORY[0x1E4F1CB00], "px_timerWithTimeInterval:weakTarget:selector:userInfo:repeats:", self, sel__handleCountDownTimer_, 0, 1, 1.0);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      double v5 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
      [v5 addTimer:v20 forMode:*MEMORY[0x1E4F1C4B0]];

      double v6 = [(PXStoryRelatedOverlayLayout *)self viewModel];
      double v7 = [v6 viewLayoutSpec];

      [v7 upNextCountDownAppearDelay];
      double v9 = v8;
      [v7 upNextCountDownInitialVisibleValue];
      [(PXStoryRelatedOverlayLayout *)self setCountDownValue:(uint64_t)(v9 + v10)];
    }
    else
    {
      BOOL v11 = [(PXStoryRelatedOverlayLayout *)self viewModel];
      id v12 = [v11 viewLayoutSpec];
      uint64_t v13 = [v12 upNextCountdownPlacement];

      switch(v13)
      {
        case 1:
          double v15 = [(PXStoryRelatedOverlayLayout *)self countDownAlphaAnimator];
          double v16 = [(PXStoryRelatedOverlayLayout *)self viewModel];
          CGFloat v17 = [v16 viewLayoutSpec];
          [v17 upNextCountDownFadeOutDuration];
          double v19 = v18;

          [v15 performChangesWithDuration:1 curve:&__block_literal_global_286170 changes:v19];
          break;
        case 2:
          [(PXStoryRelatedOverlayLayout *)self _setFirstRelatedLayoutCountdownValue:0x7FFFFFFFFFFFFFFFLL];
          break;
        case 0:
          double v14 = [MEMORY[0x1E4F28B00] currentHandler];
          [v14 handleFailureInMethod:a2 object:self file:@"PXStoryRelatedOverlayLayout.m" lineNumber:249 description:@"Code which should be unreachable has been reached"];

          abort();
      }
      id v20 = 0;
    }
    [(PXStoryRelatedOverlayLayout *)self setCountDownTimer:v20];
  }
}

uint64_t __50__PXStoryRelatedOverlayLayout_setShouldCountDown___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setValue:0.0];
}

- (void)setIsRelatedOverlayScrolledIntoView:(BOOL)a3
{
  if (self->_isRelatedOverlayScrolledIntoView != a3)
  {
    self->_isRelatedOverlayScrolledIntoView = a3;
    BOOL v4 = [(PXStoryRelatedOverlayLayout *)self viewModel];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __67__PXStoryRelatedOverlayLayout_setIsRelatedOverlayScrolledIntoView___block_invoke;
    v5[3] = &unk_1E5DD1EF0;
    v5[4] = self;
    [v4 performChanges:v5];
  }
}

uint64_t __67__PXStoryRelatedOverlayLayout_setIsRelatedOverlayScrolledIntoView___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsRelatedOverlayScrolledIntoView:*(unsigned __int8 *)(*(void *)(a1 + 32) + 1096)];
}

- (void)_selectRelatedMemoryAtIndex:(int64_t)a3
{
  self->_selectedIndedouble x = a3;
  double v6 = [(PXStoryRelatedOverlayLayout *)self viewModel];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__PXStoryRelatedOverlayLayout__selectRelatedMemoryAtIndex___block_invoke;
  v8[3] = &unk_1E5DD0C98;
  int64_t v11 = a3;
  SEL v12 = a2;
  id v9 = v6;
  double v10 = self;
  id v7 = v6;
  [v7 performChanges:v8];
}

void __59__PXStoryRelatedOverlayLayout__selectRelatedMemoryAtIndex___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [*(id *)(a1 + 32) viewLayoutSpec];
  uint64_t v4 = [v3 upNextAnimationStyle];

  if (v4 == 1)
  {
    [v7 selectRelatedAtIndex:*(void *)(a1 + 48)];
LABEL_7:
    double v5 = v7;
    goto LABEL_8;
  }
  if (v4 == 2)
  {
    [v7 setIsPerformingCrossfadeTransitionToRelated:1];
    goto LABEL_7;
  }
  double v5 = v7;
  if (!v4)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 40) file:@"PXStoryRelatedOverlayLayout.m" lineNumber:206 description:@"Code which should be unreachable has been reached"];

    abort();
  }
LABEL_8:
}

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  _PXGSpriteIndexRange relatedSelectionSpriteIndexRange = self->_relatedSelectionSpriteIndexRange;
  BOOL v5 = a3 >= relatedSelectionSpriteIndexRange.location;
  uint64_t v6 = a3 - relatedSelectionSpriteIndexRange.location;
  unsigned int v7 = relatedSelectionSpriteIndexRange.length + relatedSelectionSpriteIndexRange.location;
  if (v5 && v7 > a3)
  {
    double v10 = [[PXStoryHitTestResult alloc] initWithSpriteIndex:*(void *)&a3 layout:self identifier:@"PXStoryHitTestIdentifierRelated"];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __59__PXStoryRelatedOverlayLayout_hitTestResultForSpriteIndex___block_invoke;
    v12[3] = &unk_1E5DD0C70;
    v12[4] = self;
    v12[5] = v6;
    id v9 = [(PXFeedHitTestResult *)v10 primaryAction:v12];
  }
  else
  {
    id v9 = [[PXStoryHitTestResult alloc] initWithSpriteIndex:*(void *)&a3 layout:self identifier:@"PXStoryHitTestIdentifierRelated"];
  }
  return v9;
}

uint64_t __59__PXStoryRelatedOverlayLayout_hitTestResultForSpriteIndex___block_invoke(uint64_t a1)
{
  return 1;
}

- (void)alphaDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryRelatedOverlayLayout;
  [(PXGLayout *)&v3 alphaDidChange];
  [(PXStoryRelatedOverlayLayout *)self _invalidateContent];
}

- (void)displayScaleDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryRelatedOverlayLayout;
  [(PXGCompositeLayout *)&v3 displayScaleDidChange];
  [(PXStoryRelatedOverlayLayout *)self _invalidateContent];
}

- (void)referenceDepthDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryRelatedOverlayLayout;
  [(PXGCompositeLayout *)&v3 referenceDepthDidChange];
  [(PXStoryRelatedOverlayLayout *)self _invalidateSublayoutPositions];
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryRelatedOverlayLayout;
  [(PXGCompositeLayout *)&v3 referenceSizeDidChange];
  [(PXGLayout *)self referenceSize];
  -[PXGAbsoluteCompositeLayout setContentSize:](self, "setContentSize:");
  [(PXStoryRelatedOverlayLayout *)self _invalidateSublayoutPositions];
  [(PXStoryRelatedOverlayLayout *)self _invalidateContent];
}

- (void)dealloc
{
  free(self->_relatedDefaultFrames);
  [(NSTimer *)self->_countDownTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PXStoryRelatedOverlayLayout;
  [(PXGCompositeLayout *)&v3 dealloc];
}

- (PXStoryRelatedOverlayLayout)initWithViewModel:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PXStoryRelatedOverlayLayout;
  uint64_t v6 = [(PXGAbsoluteCompositeLayout *)&v21 init];
  unsigned int v7 = v6;
  if (v6)
  {
    p_viewModel = (id *)&v6->_viewModel;
    objc_storeStrong((id *)&v6->_viewModel, a3);
    [*p_viewModel registerChangeObserver:v7 context:ViewModelObservationContext_286106];
    id v9 = [PXStoryRelatedLayoutGenerator alloc];
    double v10 = [*p_viewModel viewLayoutSpec];
    int64_t v11 = [v10 relatedLayoutMetrics];
    uint64_t v12 = [(PXStoryRelatedLayoutGenerator *)v9 initWithMetrics:v11];
    layoutGenerator = v7->_layoutGenerator;
    v7->_layoutGenerator = (PXStoryRelatedLayoutGenerator *)v12;

    uint64_t v14 = [objc_alloc((Class)off_1E5DA74E8) initWithValue:0.0];
    countDownAlphaAnimator = v7->_countDownAlphaAnimator;
    v7->_countDownAlphaAnimator = (PXNumberAnimator *)v14;

    [(PXNumberAnimator *)v7->_countDownAlphaAnimator registerChangeObserver:v7 context:CountDownAlphaAnimatorObservationContext];
    uint64_t v16 = [objc_alloc((Class)off_1E5DA74E8) initWithValue:0.0];
    navigationButtonAlphaAnimator = v7->_navigationButtonAlphaAnimator;
    v7->_navigationButtonAlphaAnimator = (PXNumberAnimator *)v16;

    [(PXNumberAnimator *)v7->_navigationButtonAlphaAnimator registerChangeObserver:v7 context:NavigationButtonAlphaAnimatorObservationContext];
    uint64_t v18 = [objc_alloc((Class)off_1E5DA74E8) initWithValue:0.0];
    navigationButtonScrollAnimator = v7->_navigationButtonScrollAnimator;
    v7->_navigationButtonScrollAnimator = (PXNumberAnimator *)v18;

    [(PXNumberAnimator *)v7->_navigationButtonScrollAnimator registerChangeObserver:v7 context:NavigationButtonScrollAnimatorObservationContext];
    v7->_navigationButtonScrollAnimatorTarget = 0.0;
    v7->_scrollSublayoutIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
    v7->_titleSpriteIndedouble x = 0;
    v7->_countDownSpriteIndedouble x = 1;
    v7->_countDownDecorationSpriteIndedouble x = 2;
    v7->_navigationButtonSpriteIndedouble x = 3;
    v7->_navigationHitTestVisabilitySpriteIndedouble x = 4;
    v7->__PXGSpriteIndexRange relatedSelectionSpriteIndexRange = (_PXGSpriteIndexRange)5;
    v7->_selectedIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
    [(PXGLayout *)v7 addSpriteCount:5 withInitialState:0];
    [(PXGLayout *)v7 setContentSource:v7];
    [(PXStoryRelatedOverlayLayout *)v7 _invalidateRelatedSpritesAndSublayouts];
    [(PXStoryRelatedOverlayLayout *)v7 _invalidateScrollSpritesAndSublayouts];
    [(PXStoryRelatedOverlayLayout *)v7 _invalidateNavigationButton];
    [(PXStoryRelatedOverlayLayout *)v7 _invalidateAXGroupRole];
  }

  return v7;
}

- (PXStoryRelatedOverlayLayout)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryRelatedOverlayLayout.m", 109, @"%s is not available as initializer", "-[PXStoryRelatedOverlayLayout init]");

  abort();
}

@end