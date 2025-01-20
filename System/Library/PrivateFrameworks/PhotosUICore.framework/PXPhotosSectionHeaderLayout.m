@interface PXPhotosSectionHeaderLayout
- (BOOL)allowsInteraction;
- (BOOL)filterButtonHighlighting;
- (BOOL)isBadgeVisible;
- (BOOL)isFirstSectionHeader;
- (BOOL)isInSelectMode;
- (BOOL)showLegibilityGradient;
- (BOOL)wantsButton;
- (BOOL)wantsChevron;
- (CGRect)axSpriteFrame;
- (CGSize)badgeSize;
- (CGSize)buttonTitleSize;
- (CGSize)filterButtonSize;
- (CGSize)finalTitleSize;
- (CGSize)subtitleSize;
- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (NSDictionary)badgeAttributes;
- (NSDictionary)buttonTitleAttributes;
- (NSDictionary)finalTitleAttributes;
- (NSDictionary)finalTitleLightGradientAttributes;
- (NSDictionary)subtitleAttributes;
- (NSString)axSpriteText;
- (NSString)badgeTitle;
- (NSString)buttonTitle;
- (NSString)filterButtonCaption;
- (NSString)filterButtonTitle;
- (NSString)finalTitle;
- (NSString)subtitle;
- (NSString)title;
- (PXAssetCollectionReference)assetCollectionReference;
- (PXGSpriteReference)filterButtonReference;
- (PXPhotosLayoutSpec)spec;
- (PXPhotosSectionHeaderLayout)init;
- (PXPhotosSectionHeaderLayout)initWithSpec:(id)a3;
- (PXSelectionSnapshot)selectionSnapshot;
- (UIColor)dividerColor;
- (double)relativeOffsetAlpha;
- (id)_filterButtonConfiguration;
- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)axContentInfoAtSpriteIndex:(unsigned int)a3;
- (id)axSpriteIndexes;
- (id)axSpriteIndexesInRect:(CGRect)a3;
- (id)axVisibleSpriteIndexes;
- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)filterActionHandler;
- (id)hitTestResultForSpriteIndex:(unsigned int)a3;
- (id)imageConfigurationAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (void)_handleFilterAction;
- (void)_invalidateAttributes;
- (void)_invalidateBadgeMediaVersion;
- (void)_invalidateButtonTitleMediaVersion;
- (void)_invalidateContent;
- (void)_invalidateDividerMediaVersion;
- (void)_invalidateFilterUI;
- (void)_invalidateFinalTitle;
- (void)_invalidateFinalTitleMediaVersion;
- (void)_invalidateRelativeOffsetAlpha;
- (void)_invalidateSpritesAlpha;
- (void)_invalidateSubtitleMediaVersion;
- (void)_updateAttributes;
- (void)_updateContent;
- (void)_updateFinalTitle;
- (void)_updateRelativeOffsetAlpha;
- (void)_updateSpritesAlpha;
- (void)contentSizeDidChange;
- (void)didUpdate;
- (void)displayScaleDidChange;
- (void)floatingOffsetDidChange;
- (void)referenceSizeDidChange;
- (void)safeAreaInsetsDidChange;
- (void)setAssetCollectionReference:(id)a3;
- (void)setBadgeAttributes:(id)a3;
- (void)setBadgeTitle:(id)a3;
- (void)setButtonTitle:(id)a3;
- (void)setButtonTitleAttributes:(id)a3;
- (void)setDividerColor:(id)a3;
- (void)setFilterActionHandler:(id)a3;
- (void)setFilterButtonCaption:(id)a3;
- (void)setFilterButtonHighlighting:(BOOL)a3;
- (void)setFilterButtonTitle:(id)a3;
- (void)setFinalTitle:(id)a3;
- (void)setFinalTitleAttributes:(id)a3;
- (void)setFinalTitleLightGradientAttributes:(id)a3;
- (void)setFinalTitleLightGradientAttributess:(id)a3;
- (void)setIsBadgeVisible:(BOOL)a3;
- (void)setIsFirstSectionHeader:(BOOL)a3;
- (void)setIsInSelectMode:(BOOL)a3;
- (void)setRelativeOffsetAlpha:(double)a3;
- (void)setSelectionSnapshot:(id)a3;
- (void)setShowLegibilityGradient:(BOOL)a3;
- (void)setSpec:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleAttributes:(id)a3;
- (void)setTitle:(id)a3;
- (void)update;
- (void)viewEnvironmentDidChange;
- (void)visibleRectDidChange;
- (void)willUpdate;
@end

@implementation PXPhotosSectionHeaderLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonTitleAttributes, 0);
  objc_storeStrong((id *)&self->_badgeAttributes, 0);
  objc_storeStrong((id *)&self->_subtitleAttributes, 0);
  objc_storeStrong((id *)&self->_finalTitleLightGradientAttributes, 0);
  objc_storeStrong((id *)&self->_finalTitleAttributes, 0);
  objc_storeStrong((id *)&self->_finalTitle, 0);
  objc_storeStrong((id *)&self->_dividerColor, 0);
  objc_storeStrong((id *)&self->_assetCollectionReference, 0);
  objc_storeStrong(&self->_filterActionHandler, 0);
  objc_storeStrong((id *)&self->_filterButtonCaption, 0);
  objc_storeStrong((id *)&self->_filterButtonTitle, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_badgeTitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_axSpriteText, 0);
  objc_storeStrong((id *)&self->selectionSnapshot, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_axSpriteIndexes, 0);
}

- (double)relativeOffsetAlpha
{
  return self->_relativeOffsetAlpha;
}

- (NSDictionary)buttonTitleAttributes
{
  return self->_buttonTitleAttributes;
}

- (NSDictionary)badgeAttributes
{
  return self->_badgeAttributes;
}

- (NSDictionary)subtitleAttributes
{
  return self->_subtitleAttributes;
}

- (void)setFinalTitleLightGradientAttributes:(id)a3
{
}

- (NSDictionary)finalTitleLightGradientAttributes
{
  return self->_finalTitleLightGradientAttributes;
}

- (NSDictionary)finalTitleAttributes
{
  return self->_finalTitleAttributes;
}

- (NSString)finalTitle
{
  return self->_finalTitle;
}

- (UIColor)dividerColor
{
  return self->_dividerColor;
}

- (PXAssetCollectionReference)assetCollectionReference
{
  return self->_assetCollectionReference;
}

- (BOOL)showLegibilityGradient
{
  return self->_showLegibilityGradient;
}

- (void)setIsFirstSectionHeader:(BOOL)a3
{
  self->_isFirstSectionHeader = a3;
}

- (BOOL)isFirstSectionHeader
{
  return self->_isFirstSectionHeader;
}

- (BOOL)isBadgeVisible
{
  return self->_isBadgeVisible;
}

- (id)filterActionHandler
{
  return self->_filterActionHandler;
}

- (BOOL)filterButtonHighlighting
{
  return self->_filterButtonHighlighting;
}

- (NSString)filterButtonCaption
{
  return self->_filterButtonCaption;
}

- (NSString)filterButtonTitle
{
  return self->_filterButtonTitle;
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (NSString)badgeTitle
{
  return self->_badgeTitle;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (void)setSelectionSnapshot:(id)a3
{
}

- (PXSelectionSnapshot)selectionSnapshot
{
  return self->selectionSnapshot;
}

- (void)setIsInSelectMode:(BOOL)a3
{
  self->isInSelectMode = a3;
}

- (BOOL)isInSelectMode
{
  return self->isInSelectMode;
}

- (NSString)axSpriteText
{
  axSpriteText = self->_axSpriteText;
  if (!axSpriteText)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5 = [(PXPhotosSectionHeaderLayout *)self title];

    if (v5)
    {
      v6 = [(PXPhotosSectionHeaderLayout *)self title];
      [v4 addObject:v6];
    }
    v7 = [(PXPhotosSectionHeaderLayout *)self subtitle];

    if (v7)
    {
      v8 = [(PXPhotosSectionHeaderLayout *)self subtitle];
      [v4 addObject:v8];
    }
    v9 = [v4 componentsJoinedByString:@" "];
    v10 = self->_axSpriteText;
    self->_axSpriteText = v9;

    axSpriteText = self->_axSpriteText;
  }
  return axSpriteText;
}

- (CGRect)axSpriteFrame
{
  long long v2 = 0u;
  long long v3 = 0u;
  [(PXGLayout *)self geometryForSpriteAtIndex:2];
  PXRectWithCenterAndSize();
}

- (id)axSpriteIndexesInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(PXPhotosSectionHeaderLayout *)self axSpriteFrame];
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  if (CGRectIntersectsRect(v11, v12)) {
    v8 = self->_axSpriteIndexes;
  }
  else {
    v8 = (NSIndexSet *)objc_alloc_init(MEMORY[0x1E4F28D60]);
  }
  return v8;
}

- (id)axContentInfoAtSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 != 10)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"PXPhotosSectionHeaderLayout.m" lineNumber:847 description:@"Unexpected sprite index found"];
  }
  [(PXPhotosSectionHeaderLayout *)self axSpriteFrame];
  CGFloat x = v24.origin.x;
  CGFloat y = v24.origin.y;
  CGFloat width = v24.size.width;
  CGFloat height = v24.size.height;
  CGFloat MidX = CGRectGetMidX(v24);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v25);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  CGFloat v21 = CGRectGetWidth(v26);
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  CGFloat v11 = CGRectGetHeight(v27);
  v12.f64[0] = v21;
  v12.f64[1] = v11;
  float32x2_t v13 = vcvt_f32_f64(v12);
  v14 = [(PXPhotosSectionHeaderLayout *)self axSpriteText];
  v15 = +[PXGReusableAXInfo sharedPool];
  v16 = [v15 checkOutReusableObjectWithReuseIdentifier:1];

  [v16 setSpriteIndex:v3];
  *(CGFloat *)v22 = MidX;
  *(CGFloat *)&v22[1] = MidY;
  v22[2] = 0;
  v22[3] = v13;
  [v16 setSpriteGeometry:v22];
  v17 = [(PXGLayout *)self axGroup];
  [v16 setAxContainingGroup:v17];

  [v16 setContent:v14 ofContentKind:3];
  return v16;
}

- (id)axVisibleSpriteIndexes
{
  [(PXGLayout *)self visibleRect];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(PXPhotosSectionHeaderLayout *)self axSpriteFrame];
  v19.origin.CGFloat x = v11;
  v19.origin.CGFloat y = v12;
  v19.size.CGFloat width = v13;
  v19.size.CGFloat height = v14;
  v18.origin.CGFloat x = v4;
  v18.origin.CGFloat y = v6;
  v18.size.CGFloat width = v8;
  v18.size.CGFloat height = v10;
  if (CGRectIntersectsRect(v18, v19)) {
    id v15 = (id)[(NSIndexSet *)self->_axSpriteIndexes copy];
  }
  else {
    id v15 = objc_alloc_init(MEMORY[0x1E4F28D60]);
  }
  return v15;
}

- (id)axSpriteIndexes
{
  long long v2 = (void *)[(NSIndexSet *)self->_axSpriteIndexes copy];
  return v2;
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return (Class)objc_opt_class();
}

- (id)imageConfigurationAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (a3 == 9)
  {
    CGFloat v8 = [(PXPhotosSectionHeaderLayout *)self spec];
    double v9 = [v8 sectionHeaderSpec];
    uint64_t v10 = [v9 legibilityGradientImageConfiguration];
  }
  else
  {
    if (a3 != 6)
    {
      CGFloat v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"PXPhotosSectionHeaderLayout.m" lineNumber:819 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    CGFloat v8 = [(PXPhotosSectionHeaderLayout *)self spec];
    double v9 = [v8 sectionHeaderSpec];
    uint64_t v10 = [v9 chevronImageConfiguration];
  }
  CGFloat v11 = (void *)v10;

  return v11;
}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (a3 == 1)
  {
    uint64_t v8 = [MEMORY[0x1E4FB1618] clearColor];
  }
  else
  {
    if (a3)
    {
      CGFloat v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"PXPhotosSectionHeaderLayout.m" lineNumber:807 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    uint64_t v8 = [(PXPhotosSectionHeaderLayout *)self dividerColor];
  }
  double v9 = (void *)v8;

  return v9;
}

- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0;
}

- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 1;
}

- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  switch(a3)
  {
    case 2u:
      uint64_t v8 = [(PXPhotosSectionHeaderLayout *)self finalTitleAttributes];
      break;
    case 3u:
      uint64_t v8 = [(PXPhotosSectionHeaderLayout *)self finalTitleLightGradientAttributes];
      break;
    case 4u:
      uint64_t v8 = [(PXPhotosSectionHeaderLayout *)self subtitleAttributes];
      break;
    case 5u:
      uint64_t v8 = [(PXPhotosSectionHeaderLayout *)self badgeAttributes];
      break;
    case 7u:
      uint64_t v8 = [(PXPhotosSectionHeaderLayout *)self buttonTitleAttributes];
      break;
    default:
      CGFloat v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"PXPhotosSectionHeaderLayout.m" lineNumber:787 description:@"Code which should be unreachable has been reached"];

      abort();
  }
  double v9 = (void *)v8;

  return v9;
}

- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if ((a3 & 0xFFFFFFFE) == 2)
  {
    uint64_t v8 = [(PXPhotosSectionHeaderLayout *)self finalTitle];
  }
  else
  {
    switch(a3)
    {
      case 7u:
        uint64_t v8 = [(PXPhotosSectionHeaderLayout *)self buttonTitle];
        break;
      case 5u:
        uint64_t v8 = [(PXPhotosSectionHeaderLayout *)self badgeTitle];
        break;
      case 4u:
        uint64_t v8 = [(PXPhotosSectionHeaderLayout *)self subtitle];
        break;
      default:
        CGFloat v12 = [MEMORY[0x1E4F28B00] currentHandler];
        [v12 handleFailureInMethod:a2 object:self file:@"PXPhotosSectionHeaderLayout.m" lineNumber:771 description:@"Code which should be unreachable has been reached"];

        abort();
    }
  }
  double v9 = v8;
  if (!v8) {
    uint64_t v8 = &stru_1F00B0030;
  }
  uint64_t v10 = v8;

  return v10;
}

- (void)viewEnvironmentDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosSectionHeaderLayout;
  [(PXGLayout *)&v3 viewEnvironmentDidChange];
  [(PXPhotosSectionHeaderLayout *)self _invalidateSpritesAlpha];
}

- (void)displayScaleDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosSectionHeaderLayout;
  [(PXGLayout *)&v3 displayScaleDidChange];
  [(PXPhotosSectionHeaderLayout *)self _invalidateContent];
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosSectionHeaderLayout;
  [(PXGLayout *)&v3 referenceSizeDidChange];
  [(PXPhotosSectionHeaderLayout *)self _invalidateFinalTitleMediaVersion];
  [(PXPhotosSectionHeaderLayout *)self _invalidateSubtitleMediaVersion];
  [(PXPhotosSectionHeaderLayout *)self _invalidateContent];
}

- (void)_invalidateButtonTitleMediaVersion
{
  self->_buttonTitleSize = *(CGSize *)off_1E5DAB030;
  ++self->_buttonVersion;
  [(PXPhotosSectionHeaderLayout *)self _invalidateContent];
}

- (void)_invalidateBadgeMediaVersion
{
  self->_badgeSize = *(CGSize *)off_1E5DAB030;
  ++self->_badgeVersion;
  [(PXPhotosSectionHeaderLayout *)self _invalidateContent];
}

- (void)_invalidateSubtitleMediaVersion
{
  self->_subtitleSize = *(CGSize *)off_1E5DAB030;
  ++self->_subtitleVersion;
  [(PXPhotosSectionHeaderLayout *)self _invalidateContent];
}

- (void)_invalidateFinalTitleMediaVersion
{
  self->_finalTitleSize = *(CGSize *)off_1E5DAB030;
  ++self->_finalTitleVersion;
  [(PXPhotosSectionHeaderLayout *)self _invalidateContent];
}

- (void)_invalidateDividerMediaVersion
{
}

- (void)_updateSpritesAlpha
{
  objc_super v3 = [(PXPhotosSectionHeaderLayout *)self spec];
  CGFloat v4 = [v3 sectionHeaderSpec];

  [(PXPhotosSectionHeaderLayout *)self relativeOffsetAlpha];
  if ([(PXPhotosSectionHeaderLayout *)self wantsChevron]) {
    [v4 chevronAlpha];
  }
  [(PXPhotosSectionHeaderLayout *)self isBadgeVisible];
  [(PXPhotosSectionHeaderLayout *)self wantsButton];
  [(PXPhotosSectionHeaderLayout *)self showLegibilityGradient];
  [(PXGLayout *)self floatingOffset];
  [(PXGLayout *)self contentSize];
  PXClamp();
}

float __50__PXPhotosSectionHeaderLayout__updateSpritesAlpha__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, float *a4)
{
  float v6 = *(double *)(a1 + 40);
  *a4 = v6;
  if ([*(id *)(a1 + 32) showLegibilityGradient]
    && ([*(id *)(a1 + 32) viewEnvironment],
        id v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 userInterfaceStyle],
        v7,
        v8 == 1))
  {
    double v10 = *(double *)(a1 + 40);
    double v9 = *(double *)(a1 + 48);
    float v11 = 1.0 - v9;
    a4[80] = v11;
    float v12 = v9;
    a4[120] = v12;
    float v13 = v10;
  }
  else
  {
    double v10 = *(double *)(a1 + 40);
    double v9 = *(double *)(a1 + 48);
    float v13 = v10;
    a4[80] = v13;
    a4[120] = 0.0;
  }
  a4[160] = v13;
  double v14 = *(double *)(a1 + 64);
  float v15 = v10 * *(double *)(a1 + 56);
  a4[200] = v15;
  float v16 = v10 * v14;
  a4[240] = v16;
  double v17 = *(double *)(a1 + 80);
  float v18 = v10 * *(double *)(a1 + 72);
  a4[280] = v18;
  float result = v17 * v9;
  a4[360] = result;
  return result;
}

- (void)_invalidateSpritesAlpha
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x10;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x10) != 0)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      float v6 = [NSString stringWithUTF8String:"-[PXPhotosSectionHeaderLayout _invalidateSpritesAlpha]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosSectionHeaderLayout.m", 671, @"invalidating %lu after it already has been updated", 16);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 16;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateRelativeOffsetAlpha
{
  objc_super v3 = [(PXPhotosSectionHeaderLayout *)self spec];
  CGFloat v4 = [v3 sectionHeaderSpec];
  int v5 = [v4 titleShouldFadeOnScroll];

  if (v5)
  {
    [(PXGLayout *)self safeAreaInsets];
    double v7 = v6;
    [(PXGLayout *)self visibleRect];
    double v9 = v8;
    BOOL v10 = [(PXPhotosSectionHeaderLayout *)self isFirstSectionHeader];
    double v11 = 0.0;
    if (!v10)
    {
      [(PXGLayout *)self contentSize];
      double v11 = 0.0;
      if (v12 > 0.0)
      {
        [(PXGLayout *)self contentSize];
        double v11 = (-v7 - v9) / (v13 * 1.5);
      }
    }
    double v14 = fmin(v11, 1.0);
    if (v14 < 0.0) {
      double v14 = 0.0;
    }
    [(PXPhotosSectionHeaderLayout *)self setRelativeOffsetAlpha:v14];
  }
}

- (void)_invalidateRelativeOffsetAlpha
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 8;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 8) != 0)
    {
      int v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXPhotosSectionHeaderLayout _invalidateRelativeOffsetAlpha]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosSectionHeaderLayout.m", 659, @"invalidating %lu after it already has been updated", 8);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 8;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateContent
{
  if ([(PXGLayout *)self localNumberOfSprites] != 10) {
    [(PXGLayout *)self applySpriteChangeDetails:0 countAfterChanges:10 initialState:0 modifyState:0];
  }
  BOOL v3 = [(PXPhotosSectionHeaderLayout *)self wantsButton];
  CGFloat v4 = [(PXPhotosSectionHeaderLayout *)self spec];
  int v5 = [v4 sectionHeaderSpec];

  [v5 minimumHeaderContentHeight];
  [v5 titleHorizontalInset];
  double v6 = [(PXPhotosSectionHeaderLayout *)self subtitle];
  if ([v6 length]) {
    [v5 titleSubtitleHorizontalSpacing];
  }

  [v5 dividerBaselineToTextBaselineSpacing];
  if ([(PXPhotosSectionHeaderLayout *)self wantsChevron]) {
    [v5 chevronSpacing];
  }
  if ([(PXPhotosSectionHeaderLayout *)self wantsChevron]) {
    [v5 chevronSize];
  }
  if (v3)
  {
    [v5 buttonSpacing];
    [(PXPhotosSectionHeaderLayout *)self buttonTitleSize];
  }
  [v5 padding];
  [v5 titleFont];
  objc_claimAutoreleasedReturnValue();
  [v5 subtitleFont];
  objc_claimAutoreleasedReturnValue();
  [v5 badgeFont];
  objc_claimAutoreleasedReturnValue();
  [v5 buttonFont];
  objc_claimAutoreleasedReturnValue();
  [(PXGLayout *)self displayScale];
  [(PXPhotosSectionHeaderLayout *)self isBadgeVisible];
  [(PXGLayout *)self referenceSize];
  PXFloatRoundToPixel();
}

float32x2_t __45__PXPhotosSectionHeaderLayout__updateContent__block_invoke(uint64_t a1, uint64_t a2, float32x2_t *a3, uint64_t a4, float32x2_t *a5)
{
  if ([*(id *)(a1 + 32) dividerLineVisible])
  {
    CGFloat v9 = *(double *)(a1 + 48);
    CGFloat v10 = *(double *)(a1 + 56);
    CGFloat v11 = *(double *)(a1 + 64);
    CGFloat v12 = *(double *)(a1 + 72);
    v133.origin.CGFloat x = v9;
    v133.origin.CGFloat y = v10;
    v133.size.CGFloat width = v11;
    v133.size.CGFloat height = v12;
    CGFloat MidX = CGRectGetMidX(v133);
    v134.origin.CGFloat x = v9;
    v134.origin.CGFloat y = v10;
    v134.size.CGFloat width = v11;
    v134.size.CGFloat height = v12;
    CGFloat MidY = CGRectGetMidY(v134);
    v135.origin.CGFloat x = v9;
    v135.origin.CGFloat y = v10;
    v135.size.CGFloat width = v11;
    v135.size.CGFloat height = v12;
    CGFloat Width = CGRectGetWidth(v135);
    v136.origin.CGFloat x = v9;
    v136.origin.CGFloat y = v10;
    v136.size.CGFloat width = v11;
    v136.size.CGFloat height = v12;
    CGFloat Height = CGRectGetHeight(v136);
    v16.f64[0] = Width;
    v16.f64[1] = Height;
    *(CGFloat *)a3 = MidX;
    *(CGFloat *)&a3[1] = MidY;
    a3[2] = (float32x2_t)0xBFF0000000000000;
    a3[3] = vcvt_f32_f64(v16);
    long long v17 = *((_OWORD *)off_1E5DAAF90 + 1);
    *(_OWORD *)a4 = *(_OWORD *)off_1E5DAAF90;
    *(_OWORD *)(a4 + 16) = v17;
    long long v18 = *((_OWORD *)off_1E5DAAF90 + 5);
    *(_OWORD *)(a4 + 64) = *((_OWORD *)off_1E5DAAF90 + 4);
    *(_OWORD *)(a4 + 80) = v18;
    long long v19 = *((_OWORD *)off_1E5DAAF90 + 3);
    *(_OWORD *)(a4 + 32) = *((_OWORD *)off_1E5DAAF90 + 2);
    *(_OWORD *)(a4 + 48) = v19;
    long long v20 = *((_OWORD *)off_1E5DAAF90 + 9);
    *(_OWORD *)(a4 + 128) = *((_OWORD *)off_1E5DAAF90 + 8);
    *(_OWORD *)(a4 + 144) = v20;
    long long v21 = *((_OWORD *)off_1E5DAAF90 + 7);
    *(_OWORD *)(a4 + 96) = *((_OWORD *)off_1E5DAAF90 + 6);
    *(_OWORD *)(a4 + 112) = v21;
    a5->i8[1] = 5;
    a5[1] = vmul_n_f32(a3[3], *(float *)(a1 + 320));
    a5[4].i16[0] = *(_WORD *)(*(void *)(a1 + 40) + 872);
  }
  CGFloat v22 = *(double *)(a1 + 80);
  CGFloat v23 = *(double *)(a1 + 88);
  CGFloat v24 = *(double *)(a1 + 96);
  CGFloat v25 = *(double *)(a1 + 104);
  v137.origin.CGFloat x = v22;
  v137.origin.CGFloat y = v23;
  v137.size.CGFloat width = v24;
  v137.size.CGFloat height = v25;
  CGFloat v26 = CGRectGetMidX(v137);
  v138.origin.CGFloat x = v22;
  v138.origin.CGFloat y = v23;
  v138.size.CGFloat width = v24;
  v138.size.CGFloat height = v25;
  CGFloat v27 = CGRectGetMidY(v138);
  v139.origin.CGFloat x = v22;
  v139.origin.CGFloat y = v23;
  v139.size.CGFloat width = v24;
  v139.size.CGFloat height = v25;
  CGFloat v131 = CGRectGetWidth(v139);
  v140.origin.CGFloat x = v22;
  v140.origin.CGFloat y = v23;
  v140.size.CGFloat width = v24;
  v140.size.CGFloat height = v25;
  CGFloat v28 = CGRectGetHeight(v140);
  v29.f64[0] = v131;
  v29.f64[1] = v28;
  *(CGFloat *)&a3[4] = v26;
  *(CGFloat *)&a3[5] = v27;
  a3[6] = 0;
  a3[7] = vcvt_f32_f64(v29);
  long long v129 = *(_OWORD *)off_1E5DAAF90;
  long long v132 = *((_OWORD *)off_1E5DAAF90 + 1);
  *(_OWORD *)(a4 + 160) = *(_OWORD *)off_1E5DAAF90;
  *(_OWORD *)(a4 + 176) = v132;
  long long v127 = *((_OWORD *)off_1E5DAAF90 + 5);
  long long v128 = *((_OWORD *)off_1E5DAAF90 + 4);
  *(_OWORD *)(a4 + 224) = v128;
  *(_OWORD *)(a4 + 240) = v127;
  long long v125 = *((_OWORD *)off_1E5DAAF90 + 3);
  long long v126 = *((_OWORD *)off_1E5DAAF90 + 2);
  *(_OWORD *)(a4 + 192) = v126;
  *(_OWORD *)(a4 + 208) = v125;
  long long v123 = *((_OWORD *)off_1E5DAAF90 + 9);
  long long v124 = *((_OWORD *)off_1E5DAAF90 + 8);
  *(_OWORD *)(a4 + 288) = v124;
  *(_OWORD *)(a4 + 304) = v123;
  long long v121 = *((_OWORD *)off_1E5DAAF90 + 7);
  long long v122 = *((_OWORD *)off_1E5DAAF90 + 6);
  *(_OWORD *)(a4 + 256) = v122;
  *(_OWORD *)(a4 + 272) = v121;
  a5[5].i8[1] = 5;
  a5[6] = vmul_n_f32(a3[7], *(float *)(a1 + 320));
  CGFloat v30 = *(double *)(a1 + 112);
  CGFloat v31 = *(double *)(a1 + 120);
  CGFloat v32 = *(double *)(a1 + 128);
  CGFloat v33 = *(double *)(a1 + 136);
  CGFloat v34 = v30;
  v29.f64[0] = v31;
  CGFloat v35 = v32;
  CGFloat v36 = v33;
  CGFloat v37 = CGRectGetMidX(*(CGRect *)((char *)&v29 - 8));
  v141.origin.CGFloat x = v30;
  v141.origin.CGFloat y = v31;
  v141.size.CGFloat width = v32;
  v141.size.CGFloat height = v33;
  CGFloat v38 = CGRectGetMidY(v141);
  v142.origin.CGFloat x = v30;
  v142.origin.CGFloat y = v31;
  v142.size.CGFloat width = v32;
  v142.size.CGFloat height = v33;
  CGFloat v113 = CGRectGetWidth(v142);
  v143.origin.CGFloat x = v30;
  v143.origin.CGFloat y = v31;
  v143.size.CGFloat width = v32;
  v143.size.CGFloat height = v33;
  CGFloat v39 = CGRectGetHeight(v143);
  v40.f64[0] = v113;
  v40.f64[1] = v39;
  *(CGFloat *)&a3[8] = v37;
  *(CGFloat *)&a3[9] = v38;
  a3[10] = (float32x2_t)0xBFF0000000000000;
  a3[11] = vcvt_f32_f64(v40);
  *(_OWORD *)(a4 + 320) = v129;
  *(_OWORD *)(a4 + 336) = v132;
  *(_OWORD *)(a4 + 384) = v128;
  *(_OWORD *)(a4 + 400) = v127;
  *(_OWORD *)(a4 + 352) = v126;
  *(_OWORD *)(a4 + 368) = v125;
  *(_OWORD *)(a4 + 448) = v124;
  *(_OWORD *)(a4 + 464) = v123;
  *(_OWORD *)(a4 + 416) = v122;
  *(_OWORD *)(a4 + 432) = v121;
  a5[10].i8[1] = 3;
  a5[11] = vmul_n_f32(a3[11], *(float *)(a1 + 320));
  a5[14].i16[0] = *(_WORD *)(*(void *)(a1 + 40) + 874);
  CGFloat v41 = *(double *)(a1 + 112);
  CGFloat v42 = *(double *)(a1 + 120);
  CGFloat v43 = *(double *)(a1 + 128);
  CGFloat v44 = *(double *)(a1 + 136);
  CGFloat v45 = v41;
  v40.f64[0] = v42;
  CGFloat v46 = v43;
  CGFloat v47 = v44;
  CGFloat v48 = CGRectGetMidX(*(CGRect *)((char *)&v40 - 8));
  v144.origin.CGFloat x = v41;
  v144.origin.CGFloat y = v42;
  v144.size.CGFloat width = v43;
  v144.size.CGFloat height = v44;
  CGFloat v49 = CGRectGetMidY(v144);
  v145.origin.CGFloat x = v41;
  v145.origin.CGFloat y = v42;
  v145.size.CGFloat width = v43;
  v145.size.CGFloat height = v44;
  CGFloat v114 = CGRectGetWidth(v145);
  v146.origin.CGFloat x = v41;
  v146.origin.CGFloat y = v42;
  v146.size.CGFloat width = v43;
  v146.size.CGFloat height = v44;
  CGFloat v50 = CGRectGetHeight(v146);
  v51.f64[0] = v114;
  v51.f64[1] = v50;
  *(CGFloat *)&a3[12] = v48;
  *(CGFloat *)&a3[13] = v49;
  a3[14] = (float32x2_t)0xBFF0000000000000;
  a3[15] = vcvt_f32_f64(v51);
  *(_OWORD *)(a4 + 480) = v129;
  *(_OWORD *)(a4 + 496) = v132;
  *(_OWORD *)(a4 + 544) = v128;
  *(_OWORD *)(a4 + 560) = v127;
  *(_OWORD *)(a4 + 512) = v126;
  *(_OWORD *)(a4 + 528) = v125;
  *(_OWORD *)(a4 + 608) = v124;
  *(_OWORD *)(a4 + 624) = v123;
  *(_OWORD *)(a4 + 576) = v122;
  *(_OWORD *)(a4 + 592) = v121;
  *(_DWORD *)(a4 + 480) = 0;
  a5[15].i8[1] = 3;
  a5[16] = vmul_n_f32(a3[11], *(float *)(a1 + 320));
  a5[19].i16[0] = *(_WORD *)(*(void *)(a1 + 40) + 874);
  CGFloat v52 = *(double *)(a1 + 144);
  CGFloat v53 = *(double *)(a1 + 152);
  CGFloat v54 = *(double *)(a1 + 160);
  CGFloat v55 = *(double *)(a1 + 168);
  CGFloat v56 = v52;
  v51.f64[0] = v53;
  CGFloat v57 = v54;
  CGFloat v58 = v55;
  CGFloat v59 = CGRectGetMidX(*(CGRect *)((char *)&v51 - 8));
  v147.origin.CGFloat x = v52;
  v147.origin.CGFloat y = v53;
  v147.size.CGFloat width = v54;
  v147.size.CGFloat height = v55;
  CGFloat v60 = CGRectGetMidY(v147);
  v148.origin.CGFloat x = v52;
  v148.origin.CGFloat y = v53;
  v148.size.CGFloat width = v54;
  v148.size.CGFloat height = v55;
  CGFloat v115 = CGRectGetWidth(v148);
  v149.origin.CGFloat x = v52;
  v149.origin.CGFloat y = v53;
  v149.size.CGFloat width = v54;
  v149.size.CGFloat height = v55;
  CGFloat v61 = CGRectGetHeight(v149);
  v62.f64[0] = v115;
  v62.f64[1] = v61;
  *(CGFloat *)&a3[16] = v59;
  *(CGFloat *)&a3[17] = v60;
  a3[18] = (float32x2_t)0xBFF0000000000000;
  a3[19] = vcvt_f32_f64(v62);
  *(_OWORD *)(a4 + 640) = v129;
  *(_OWORD *)(a4 + 656) = v132;
  *(_OWORD *)(a4 + 704) = v128;
  *(_OWORD *)(a4 + 720) = v127;
  *(_OWORD *)(a4 + 672) = v126;
  *(_OWORD *)(a4 + 688) = v125;
  *(_OWORD *)(a4 + 768) = v124;
  *(_OWORD *)(a4 + 784) = v123;
  *(_OWORD *)(a4 + 736) = v122;
  *(_OWORD *)(a4 + 752) = v121;
  a5[20].i8[1] = 3;
  a5[21] = vmul_n_f32(a3[19], *(float *)(a1 + 320));
  a5[24].i16[0] = *(_WORD *)(*(void *)(a1 + 40) + 876);
  CGFloat v63 = *(double *)(a1 + 176);
  CGFloat v64 = *(double *)(a1 + 184);
  CGFloat v65 = *(double *)(a1 + 192);
  CGFloat v66 = *(double *)(a1 + 200);
  CGFloat v67 = v63;
  v62.f64[0] = v64;
  CGFloat v68 = v65;
  CGFloat v69 = v66;
  CGFloat v70 = CGRectGetMidX(*(CGRect *)((char *)&v62 - 8));
  v150.origin.CGFloat x = v63;
  v150.origin.CGFloat y = v64;
  v150.size.CGFloat width = v65;
  v150.size.CGFloat height = v66;
  CGFloat v71 = CGRectGetMidY(v150);
  v151.origin.CGFloat x = v63;
  v151.origin.CGFloat y = v64;
  v151.size.CGFloat width = v65;
  v151.size.CGFloat height = v66;
  CGFloat v116 = CGRectGetWidth(v151);
  v152.origin.CGFloat x = v63;
  v152.origin.CGFloat y = v64;
  v152.size.CGFloat width = v65;
  v152.size.CGFloat height = v66;
  CGFloat v72 = CGRectGetHeight(v152);
  v73.f64[0] = v116;
  v73.f64[1] = v72;
  *(CGFloat *)&a3[20] = v70;
  *(CGFloat *)&a3[21] = v71;
  a3[22] = (float32x2_t)0xBFF0000000000000;
  a3[23] = vcvt_f32_f64(v73);
  *(_OWORD *)(a4 + 800) = v129;
  *(_OWORD *)(a4 + 816) = v132;
  *(_OWORD *)(a4 + 864) = v128;
  *(_OWORD *)(a4 + 880) = v127;
  *(_OWORD *)(a4 + 832) = v126;
  *(_OWORD *)(a4 + 848) = v125;
  *(_OWORD *)(a4 + 928) = v124;
  *(_OWORD *)(a4 + 944) = v123;
  *(_OWORD *)(a4 + 896) = v122;
  *(_OWORD *)(a4 + 912) = v121;
  if (*(unsigned char *)(a1 + 324)) {
    char v74 = 3;
  }
  else {
    char v74 = 0;
  }
  a5[25].i8[1] = v74;
  a5[26] = vmul_n_f32(a3[23], *(float *)(a1 + 320));
  a5[29].i16[0] = *(_WORD *)(*(void *)(a1 + 40) + 878);
  CGFloat v75 = *(double *)(a1 + 208);
  CGFloat v76 = *(double *)(a1 + 216);
  CGFloat v77 = *(double *)(a1 + 224);
  CGFloat v78 = *(double *)(a1 + 232);
  v153.origin.CGFloat x = v75;
  v153.origin.CGFloat y = v76;
  v153.size.CGFloat width = v77;
  v153.size.CGFloat height = v78;
  CGFloat v79 = CGRectGetMidX(v153);
  v154.origin.CGFloat x = v75;
  v154.origin.CGFloat y = v76;
  v154.size.CGFloat width = v77;
  v154.size.CGFloat height = v78;
  CGFloat v80 = CGRectGetMidY(v154);
  v155.origin.CGFloat x = v75;
  v155.origin.CGFloat y = v76;
  v155.size.CGFloat width = v77;
  v155.size.CGFloat height = v78;
  CGFloat v117 = CGRectGetWidth(v155);
  v156.origin.CGFloat x = v75;
  v156.origin.CGFloat y = v76;
  v156.size.CGFloat width = v77;
  v156.size.CGFloat height = v78;
  CGFloat v81 = CGRectGetHeight(v156);
  v82.f64[0] = v117;
  v82.f64[1] = v81;
  *(CGFloat *)&a3[24] = v79;
  *(CGFloat *)&a3[25] = v80;
  a3[26] = (float32x2_t)0xBFF0000000000000;
  a3[27] = vcvt_f32_f64(v82);
  *(_OWORD *)(a4 + 960) = v129;
  *(_OWORD *)(a4 + 976) = v132;
  *(_OWORD *)(a4 + 1040) = v127;
  *(_OWORD *)(a4 + 1008) = v125;
  *(_OWORD *)(a4 + 1024) = v128;
  *(_OWORD *)(a4 + 992) = v126;
  *(_OWORD *)(a4 + 1104) = v123;
  *(_OWORD *)(a4 + 1088) = v124;
  *(_OWORD *)(a4 + 1072) = v121;
  *(_OWORD *)(a4 + 1056) = v122;
  a5[30].i8[1] = 1;
  v83 = [*(id *)(a1 + 40) spec];
  v84 = [v83 sectionHeaderSpec];
  v85 = [v84 chevronImageConfiguration];
  v86 = [v85 imageName];
  a5[34].i16[0] = [v86 hash];

  CGFloat v87 = *(double *)(a1 + 240);
  CGFloat v88 = *(double *)(a1 + 248);
  CGFloat v89 = *(double *)(a1 + 256);
  CGFloat v90 = *(double *)(a1 + 264);
  v157.origin.CGFloat x = v87;
  v157.origin.CGFloat y = v88;
  v157.size.CGFloat width = v89;
  v157.size.CGFloat height = v90;
  CGFloat v91 = CGRectGetMidX(v157);
  v158.origin.CGFloat x = v87;
  v158.origin.CGFloat y = v88;
  v158.size.CGFloat width = v89;
  v158.size.CGFloat height = v90;
  CGFloat v92 = CGRectGetMidY(v158);
  v159.origin.CGFloat x = v87;
  v159.origin.CGFloat y = v88;
  v159.size.CGFloat width = v89;
  v159.size.CGFloat height = v90;
  CGFloat v118 = CGRectGetWidth(v159);
  v160.origin.CGFloat x = v87;
  v160.origin.CGFloat y = v88;
  v160.size.CGFloat width = v89;
  v160.size.CGFloat height = v90;
  CGFloat v93 = CGRectGetHeight(v160);
  v94.f64[0] = v118;
  v94.f64[1] = v93;
  *(CGFloat *)&a3[28] = v91;
  *(CGFloat *)&a3[29] = v92;
  a3[30] = (float32x2_t)0xBFF0000000000000;
  a3[31] = vcvt_f32_f64(v94);
  *(_OWORD *)(a4 + 1120) = v129;
  *(_OWORD *)(a4 + 1136) = v132;
  *(_OWORD *)(a4 + 1200) = v127;
  *(_OWORD *)(a4 + 1184) = v128;
  *(_OWORD *)(a4 + 1168) = v125;
  *(_OWORD *)(a4 + 1152) = v126;
  *(_OWORD *)(a4 + 1264) = v123;
  *(_OWORD *)(a4 + 1248) = v124;
  *(_OWORD *)(a4 + 1232) = v121;
  *(_OWORD *)(a4 + 1216) = v122;
  if (*(unsigned char *)(a1 + 325)) {
    char v95 = 3;
  }
  else {
    char v95 = 0;
  }
  a5[35].i8[1] = v95;
  a5[36] = vmul_n_f32(a3[31], *(float *)(a1 + 320));
  a5[39].i16[0] = *(_WORD *)(*(void *)(a1 + 40) + 880);
  CGFloat v96 = *(double *)(a1 + 272);
  CGFloat v97 = *(double *)(a1 + 280);
  CGFloat v98 = *(double *)(a1 + 288);
  CGFloat v99 = *(double *)(a1 + 296);
  v161.origin.CGFloat x = v96;
  v161.origin.CGFloat y = v97;
  v161.size.CGFloat width = v98;
  v161.size.CGFloat height = v99;
  CGFloat v100 = CGRectGetMidX(v161);
  v162.origin.CGFloat x = v96;
  v162.origin.CGFloat y = v97;
  v162.size.CGFloat width = v98;
  v162.size.CGFloat height = v99;
  CGFloat v101 = CGRectGetMidY(v162);
  v163.origin.CGFloat x = v96;
  v163.origin.CGFloat y = v97;
  v163.size.CGFloat width = v98;
  v163.size.CGFloat height = v99;
  CGFloat v119 = CGRectGetWidth(v163);
  v164.origin.CGFloat x = v96;
  v164.origin.CGFloat y = v97;
  v164.size.CGFloat width = v98;
  v164.size.CGFloat height = v99;
  CGFloat v102 = CGRectGetHeight(v164);
  v103.f64[0] = v119;
  v103.f64[1] = v102;
  *(CGFloat *)&a3[32] = v100;
  *(CGFloat *)&a3[33] = v101;
  a3[34] = (float32x2_t)0xBFF0000000000000;
  a3[35] = vcvt_f32_f64(v103);
  *(_OWORD *)(a4 + 1296) = v132;
  *(_OWORD *)(a4 + 1280) = v129;
  *(_OWORD *)(a4 + 1360) = v127;
  *(_OWORD *)(a4 + 1344) = v128;
  *(_OWORD *)(a4 + 1328) = v125;
  *(_OWORD *)(a4 + 1312) = v126;
  *(_OWORD *)(a4 + 1424) = v123;
  *(_OWORD *)(a4 + 1408) = v124;
  *(_OWORD *)(a4 + 1392) = v121;
  *(_OWORD *)(a4 + 1376) = v122;
  v104 = [*(id *)(a1 + 40) filterButtonTitle];
  if ([v104 length]) {
    char v105 = 10;
  }
  else {
    char v105 = 0;
  }
  a5[40].i8[1] = v105;

  a5[40].i8[0] = 1;
  a5[41] = vmul_n_f32(a3[35], *(float *)(a1 + 320));
  a5[44].i16[0] = *(_WORD *)(*(void *)(a1 + 40) + 882);
  CGFloat v106 = *(double *)(a1 + 304);
  CGFloat v107 = *(double *)(a1 + 312);
  v165.origin.CGFloat x = 0.0;
  v165.origin.CGFloat y = 0.0;
  v165.size.CGFloat width = v106;
  v165.size.CGFloat height = v107;
  CGFloat v108 = CGRectGetMidX(v165);
  v166.origin.CGFloat x = 0.0;
  v166.origin.CGFloat y = 0.0;
  v166.size.CGFloat width = v106;
  v166.size.CGFloat height = v107;
  CGFloat v109 = CGRectGetMidY(v166);
  v167.origin.CGFloat x = 0.0;
  v167.origin.CGFloat y = 0.0;
  v167.size.CGFloat width = v106;
  v167.size.CGFloat height = v107;
  CGFloat v120 = CGRectGetWidth(v167);
  v168.origin.CGFloat x = 0.0;
  v168.origin.CGFloat y = 0.0;
  v168.size.CGFloat width = v106;
  v168.size.CGFloat height = v107;
  CGFloat v110 = CGRectGetHeight(v168);
  v111.f64[0] = v120;
  v111.f64[1] = v110;
  *(CGFloat *)&a3[36] = v108;
  *(CGFloat *)&a3[37] = v109;
  a3[38] = 0;
  a3[39] = vcvt_f32_f64(v111);
  *(_OWORD *)(a4 + 1440) = v129;
  *(_OWORD *)(a4 + 1456) = v132;
  *(_OWORD *)(a4 + 1520) = v127;
  *(_OWORD *)(a4 + 1504) = v128;
  *(_OWORD *)(a4 + 1488) = v125;
  *(_OWORD *)(a4 + 1472) = v126;
  *(_OWORD *)(a4 + 1584) = v123;
  *(_OWORD *)(a4 + 1568) = v124;
  *(_OWORD *)(a4 + 1552) = v121;
  *(_OWORD *)(a4 + 1536) = v122;
  *(_WORD *)(a4 + 1508) = *(_WORD *)(*(void *)(a1 + 40) + 884);
  *(_DWORD *)(a4 + 1440) = 0;
  a5[45].i16[0] = 256;
  float32x2_t result = vmul_n_f32(a3[39], *(float *)(a1 + 320));
  a5[46] = result;
  return result;
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
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 4;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      int v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXPhotosSectionHeaderLayout _invalidateContent]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosSectionHeaderLayout.m", 503, @"invalidating %lu after it already has been updated", 4);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 4;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateAttributes
{
  v37[3] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PXPhotosSectionHeaderLayout *)self spec];
  CGFloat v4 = [v3 sectionHeaderSpec];

  int v5 = [v4 dividerColor];
  [(PXPhotosSectionHeaderLayout *)self setDividerColor:v5];

  double v6 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  double v7 = (void *)[v6 mutableCopy];

  [v7 setLineBreakMode:4];
  uint64_t v34 = *MEMORY[0x1E4FB06F8];
  uint64_t v8 = v34;
  CGFloat v9 = [v4 titleFont];
  v37[0] = v9;
  uint64_t v35 = *MEMORY[0x1E4FB0700];
  uint64_t v10 = v35;
  CGFloat v11 = [v4 titleColor];
  uint64_t v36 = *MEMORY[0x1E4FB0738];
  uint64_t v12 = v36;
  v37[1] = v11;
  v37[2] = v7;
  double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v34 count:3];
  [(PXPhotosSectionHeaderLayout *)self setFinalTitleAttributes:v13];

  v32[0] = v8;
  double v14 = [v4 titleFont];
  v33[0] = v14;
  v32[1] = v10;
  float v15 = [v4 gradientTitleColor];
  v32[2] = v12;
  v33[1] = v15;
  v33[2] = v7;
  float64x2_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:3];
  [(PXPhotosSectionHeaderLayout *)self setFinalTitleLightGradientAttributes:v16];

  v30[0] = v8;
  long long v17 = [v4 subtitleFont];
  v31[0] = v17;
  v30[1] = v10;
  long long v18 = [v4 subtitleColor];
  v30[2] = v12;
  v31[1] = v18;
  v31[2] = v7;
  long long v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];
  [(PXPhotosSectionHeaderLayout *)self setSubtitleAttributes:v19];

  v28[0] = v8;
  long long v20 = [v4 badgeFont];
  v29[0] = v20;
  v28[1] = v10;
  long long v21 = [v4 badgeColor];
  v28[2] = v12;
  v29[1] = v21;
  v29[2] = v7;
  CGFloat v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:3];
  [(PXPhotosSectionHeaderLayout *)self setBadgeAttributes:v22];

  CGFloat v23 = objc_msgSend(v4, "buttonFont", v8);
  v27[0] = v23;
  v26[1] = v10;
  CGFloat v24 = [v4 buttonColor];
  v26[2] = v12;
  v27[1] = v24;
  v27[2] = v7;
  CGFloat v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];
  [(PXPhotosSectionHeaderLayout *)self setButtonTitleAttributes:v25];
}

- (void)_invalidateAttributes
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
      int v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXPhotosSectionHeaderLayout _invalidateAttributes]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosSectionHeaderLayout.m", 476, @"invalidating %lu after it already has been updated", 2);

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

- (void)_updateFinalTitle
{
  id v6 = [(PXPhotosSectionHeaderLayout *)self title];
  if (-[PXPhotosSectionHeaderLayout isBadgeVisible](self, "isBadgeVisible") && [v6 length])
  {
    BOOL v3 = PXLocalizedStringFromTable(@"PXPhotosGridsSectionHeaderBadgeSeparator", @"PhotosUICore");
    id v5 = v6;
    PXStringWithValidatedFormat();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = v6;
  }
  -[PXPhotosSectionHeaderLayout setFinalTitle:](self, "setFinalTitle:", v4, v5);
}

- (void)_invalidateFilterUI
{
  ++self->_filterButtonVersion;
  self->_filterButtonSize = *(CGSize *)off_1E5DAB030;
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 4;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      id v6 = [NSString stringWithUTF8String:"-[PXPhotosSectionHeaderLayout _invalidateFilterUI]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosSectionHeaderLayout.m", 461, @"invalidating %lu after it already has been updated", 4);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 4;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_invalidateFinalTitle
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
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      id v6 = [NSString stringWithUTF8String:"-[PXPhotosSectionHeaderLayout _invalidateFinalTitle]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXPhotosSectionHeaderLayout.m", 455, @"invalidating %lu after it already has been updated", 1);

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

- (void)didUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXPhotosSectionHeaderLayout;
  [(PXGLayout *)&v5 didUpdate];
  if (self->_updateFlags.willPerformUpdate)
  {
    BOOL v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"-[PXPhotosSectionHeaderLayout didUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXPhotosSectionHeaderLayout.m", 451, @"Invalid parameter not satisfying: %@", @"!_updateFlags.willPerformUpdate" file lineNumber description];
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
      CGFloat v9 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v10 = [NSString stringWithUTF8String:"-[PXPhotosSectionHeaderLayout update]"];
      [v9 handleFailureInFunction:v10, @"PXPhotosSectionHeaderLayout.m", 429, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXPhotosSectionHeaderLayout *)self _updateFinalTitle];
      if (!p_updateFlags->isPerformingUpdate)
      {
        long long v19 = [MEMORY[0x1E4F28B00] currentHandler];
        long long v20 = [NSString stringWithUTF8String:"-[PXPhotosSectionHeaderLayout update]"];
        [v19 handleFailureInFunction:v20, @"PXPhotosSectionHeaderLayout.m", 433, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      [(PXPhotosSectionHeaderLayout *)self _updateAttributes];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      CGFloat v11 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PXPhotosSectionHeaderLayout update]"];
      [v11 handleFailureInFunction:v12, @"PXPhotosSectionHeaderLayout.m", 436, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v6 & 4) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v6 & 0xFFFFFFFFFFFFFFFBLL;
      [(PXPhotosSectionHeaderLayout *)self _updateContent];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      double v13 = [MEMORY[0x1E4F28B00] currentHandler];
      double v14 = [NSString stringWithUTF8String:"-[PXPhotosSectionHeaderLayout update]"];
      [v13 handleFailureInFunction:v14, @"PXPhotosSectionHeaderLayout.m", 439, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v7 & 8) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v7 & 0xFFFFFFFFFFFFFFF7;
      [(PXPhotosSectionHeaderLayout *)self _updateRelativeOffsetAlpha];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      float v15 = [MEMORY[0x1E4F28B00] currentHandler];
      float64x2_t v16 = [NSString stringWithUTF8String:"-[PXPhotosSectionHeaderLayout update]"];
      [v15 handleFailureInFunction:v16, @"PXPhotosSectionHeaderLayout.m", 442, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v8 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x10uLL;
    if ((v8 & 0x10) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v8 & 0xFFFFFFFFFFFFFFEFLL;
      [(PXPhotosSectionHeaderLayout *)self _updateSpritesAlpha];
      unint64_t v8 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v8)
    {
      long long v17 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v18 = [NSString stringWithUTF8String:"-[PXPhotosSectionHeaderLayout update]"];
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, @"PXPhotosSectionHeaderLayout.m", 445, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)PXPhotosSectionHeaderLayout;
  [(PXGLayout *)&v21 update];
}

- (void)willUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXPhotosSectionHeaderLayout;
  [(PXGLayout *)&v5 willUpdate];
  self->_updateFlags.BOOL willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    BOOL v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"-[PXPhotosSectionHeaderLayout willUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXPhotosSectionHeaderLayout.m", 425, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];
  }
}

- (void)floatingOffsetDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)PXPhotosSectionHeaderLayout;
  [(PXGLayout *)&v4 floatingOffsetDidChange];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__PXPhotosSectionHeaderLayout_floatingOffsetDidChange__block_invoke;
  v3[3] = &unk_1E5DD36F8;
  v3[4] = self;
  [(PXGLayout *)self performChangesWithLocalUpdate:v3];
}

uint64_t __54__PXPhotosSectionHeaderLayout_floatingOffsetDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateSpritesAlpha];
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosSectionHeaderLayout;
  [(PXGLayout *)&v3 safeAreaInsetsDidChange];
  [(PXPhotosSectionHeaderLayout *)self _invalidateRelativeOffsetAlpha];
}

- (void)contentSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosSectionHeaderLayout;
  [(PXGLayout *)&v3 contentSizeDidChange];
  [(PXPhotosSectionHeaderLayout *)self _invalidateRelativeOffsetAlpha];
}

- (void)visibleRectDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosSectionHeaderLayout;
  [(PXGLayout *)&v3 visibleRectDidChange];
  [(PXPhotosSectionHeaderLayout *)self _invalidateRelativeOffsetAlpha];
}

- (void)setRelativeOffsetAlpha:(double)a3
{
  if (self->_relativeOffsetAlpha != a3)
  {
    self->_relativeOffsetAlpha = a3;
    [(PXPhotosSectionHeaderLayout *)self _invalidateSpritesAlpha];
  }
}

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(PXPhotosSectionHeaderLayout *)self allowsInteraction]
    && v3
    && (v3 == 7 || [(PXPhotosSectionHeaderLayout *)self wantsChevron]))
  {
    objc_super v5 = @"PXPhotosLayoutHitTestIdentifierSectionHeader";
    if (v3 == 7) {
      objc_super v5 = @"PXPhotosLayoutHitTestIdentifierSectionHeaderButton";
    }
    unint64_t v6 = v5;
    unint64_t v7 = [(PXGLayout *)self spriteReferenceForSpriteIndex:v3];
    unint64_t v8 = [(PXPhotosSectionHeaderLayout *)self assetCollectionReference];
    CGFloat v9 = [v8 assetCollection];

    uint64_t v10 = [[PXGHitTestResult alloc] initWithSpriteReference:v7 layout:self identifier:v6 userData:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }
  return v10;
}

- (CGSize)filterButtonSize
{
}

- (CGSize)buttonTitleSize
{
}

- (CGSize)badgeSize
{
}

- (CGSize)subtitleSize
{
}

- (CGSize)finalTitleSize
{
}

- (PXGSpriteReference)filterButtonReference
{
  return (PXGSpriteReference *)[(PXGLayout *)self spriteReferenceForSpriteIndex:8];
}

- (id)_filterButtonConfiguration
{
  uint64_t v3 = [(PXPhotosSectionHeaderLayout *)self filterButtonTitle];
  objc_super v4 = [(PXPhotosSectionHeaderLayout *)self spec];
  objc_super v5 = [v4 sectionHeaderSpec];
  unint64_t v6 = [v5 curatedLibraryHeaderSpec];
  unint64_t v7 = +[PXCuratedLibraryOverlayButtonConfiguration configurationWithButtonType:4 title:v3 spec:v6];

  [v7 setStyle:10];
  unint64_t v8 = [(PXPhotosSectionHeaderLayout *)self filterButtonCaption];
  [v7 setCaption:v8];

  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__PXPhotosSectionHeaderLayout__filterButtonConfiguration__block_invoke;
  v10[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v11, &location);
  [v7 setActionHandler:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v7;
}

void __57__PXPhotosSectionHeaderLayout__filterButtonConfiguration__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleFilterAction];
}

- (void)_handleFilterAction
{
  uint64_t v3 = [(PXPhotosSectionHeaderLayout *)self filterActionHandler];
  if (v3)
  {
    id v4 = v3;
    ((void (**)(void, PXPhotosSectionHeaderLayout *))v3)[2](v3, self);
    uint64_t v3 = (void (**)(void, void))v4;
  }
}

- (void)setShowLegibilityGradient:(BOOL)a3
{
  if (self->_showLegibilityGradient != a3)
  {
    self->_showLegibilityGradient = a3;
    [(PXPhotosSectionHeaderLayout *)self _invalidateSpritesAlpha];
  }
}

- (void)setFilterActionHandler:(id)a3
{
  if (self->_filterActionHandler != a3)
  {
    id v4 = (void *)[a3 copy];
    id filterActionHandler = self->_filterActionHandler;
    self->_id filterActionHandler = v4;

    [(PXPhotosSectionHeaderLayout *)self _invalidateFilterUI];
  }
}

- (void)setFilterButtonHighlighting:(BOOL)a3
{
  if (self->_filterButtonHighlighting != a3)
  {
    self->_filterButtonHighlighting = a3;
    [(PXPhotosSectionHeaderLayout *)self _invalidateFilterUI];
  }
}

- (void)setFilterButtonCaption:(id)a3
{
  unint64_t v8 = (NSString *)a3;
  id v4 = self->_filterButtonCaption;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      unint64_t v6 = (NSString *)[(NSString *)v8 copy];
      filterButtonCaption = self->_filterButtonCaption;
      self->_filterButtonCaption = v6;

      [(PXPhotosSectionHeaderLayout *)self _invalidateFilterUI];
    }
  }
}

- (void)setFilterButtonTitle:(id)a3
{
  unint64_t v8 = (NSString *)a3;
  id v4 = self->_filterButtonTitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      unint64_t v6 = (NSString *)[(NSString *)v8 copy];
      filterButtonTitle = self->_filterButtonTitle;
      self->_filterButtonTitle = v6;

      [(PXPhotosSectionHeaderLayout *)self _invalidateFilterUI];
    }
  }
}

- (void)setButtonTitleAttributes:(id)a3
{
  unint64_t v8 = (NSDictionary *)a3;
  id v4 = self->_buttonTitleAttributes;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSDictionary *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      unint64_t v6 = (NSDictionary *)[(NSDictionary *)v8 copy];
      buttonTitleAttributes = self->_buttonTitleAttributes;
      self->_buttonTitleAttributes = v6;

      [(PXPhotosSectionHeaderLayout *)self _invalidateButtonTitleMediaVersion];
    }
  }
}

- (void)setBadgeAttributes:(id)a3
{
  unint64_t v8 = (NSDictionary *)a3;
  id v4 = self->_badgeAttributes;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSDictionary *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      unint64_t v6 = (NSDictionary *)[(NSDictionary *)v8 copy];
      badgeAttributes = self->_badgeAttributes;
      self->_badgeAttributes = v6;

      [(PXPhotosSectionHeaderLayout *)self _invalidateBadgeMediaVersion];
    }
  }
}

- (void)setButtonTitle:(id)a3
{
  unint64_t v8 = (NSString *)a3;
  id v4 = self->_buttonTitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      unint64_t v6 = (NSString *)[(NSString *)v8 copy];
      buttonTitle = self->_buttonTitle;
      self->_buttonTitle = v6;

      [(PXPhotosSectionHeaderLayout *)self _invalidateButtonTitleMediaVersion];
    }
  }
}

- (void)setBadgeTitle:(id)a3
{
  unint64_t v8 = (NSString *)a3;
  id v4 = self->_badgeTitle;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSString *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      unint64_t v6 = (NSString *)[(NSString *)v8 copy];
      badgeTitle = self->_badgeTitle;
      self->_badgeTitle = v6;

      [(PXPhotosSectionHeaderLayout *)self _invalidateFinalTitle];
      [(PXPhotosSectionHeaderLayout *)self _invalidateBadgeMediaVersion];
    }
  }
}

- (void)setIsBadgeVisible:(BOOL)a3
{
  if (self->_isBadgeVisible != a3)
  {
    self->_isBadgeVisible = a3;
    [(PXPhotosSectionHeaderLayout *)self _invalidateFinalTitle];
    [(PXPhotosSectionHeaderLayout *)self _invalidateContent];
    [(PXPhotosSectionHeaderLayout *)self _invalidateSpritesAlpha];
  }
}

- (void)setSubtitle:(id)a3
{
  unint64_t v8 = (NSString *)a3;
  id v4 = self->_subtitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      unint64_t v6 = (NSString *)[(NSString *)v8 copy];
      subtitle = self->_subtitle;
      self->_subtitle = v6;

      [(PXPhotosSectionHeaderLayout *)self _invalidateSubtitleMediaVersion];
    }
  }
}

- (void)setSubtitleAttributes:(id)a3
{
  unint64_t v8 = (NSDictionary *)a3;
  id v4 = self->_subtitleAttributes;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSDictionary *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      unint64_t v6 = (NSDictionary *)[(NSDictionary *)v8 copy];
      subtitleAttributes = self->_subtitleAttributes;
      self->_subtitleAttributes = v6;

      [(PXPhotosSectionHeaderLayout *)self _invalidateSubtitleMediaVersion];
    }
  }
}

- (void)setFinalTitle:(id)a3
{
  unint64_t v7 = (NSString *)a3;
  char v5 = self->_finalTitle;
  if (v5 == v7)
  {
  }
  else
  {
    BOOL v6 = [(NSString *)v7 isEqualToString:v5];

    if (!v6)
    {
      objc_storeStrong((id *)&self->_finalTitle, a3);
      [(PXPhotosSectionHeaderLayout *)self _invalidateFinalTitleMediaVersion];
    }
  }
}

- (void)setTitle:(id)a3
{
  unint64_t v8 = (NSString *)a3;
  id v4 = self->_title;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      BOOL v6 = (NSString *)[(NSString *)v8 copy];
      title = self->_title;
      self->_title = v6;

      [(PXPhotosSectionHeaderLayout *)self _invalidateFinalTitle];
    }
  }
}

- (void)setFinalTitleLightGradientAttributess:(id)a3
{
  unint64_t v8 = (NSDictionary *)a3;
  id v4 = self->_finalTitleLightGradientAttributes;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSDictionary *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      BOOL v6 = (NSDictionary *)[(NSDictionary *)v8 copy];
      finalTitleLightGradientAttributes = self->_finalTitleLightGradientAttributes;
      self->_finalTitleLightGradientAttributes = v6;

      [(PXPhotosSectionHeaderLayout *)self _invalidateFinalTitleMediaVersion];
    }
  }
}

- (void)setFinalTitleAttributes:(id)a3
{
  unint64_t v8 = (NSDictionary *)a3;
  id v4 = self->_finalTitleAttributes;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSDictionary *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      BOOL v6 = (NSDictionary *)[(NSDictionary *)v8 copy];
      finalTitleAttributes = self->_finalTitleAttributes;
      self->_finalTitleAttributes = v6;

      [(PXPhotosSectionHeaderLayout *)self _invalidateFinalTitleMediaVersion];
    }
  }
}

- (void)setDividerColor:(id)a3
{
  unint64_t v7 = (UIColor *)a3;
  char v5 = self->_dividerColor;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(UIColor *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_dividerColor, a3);
      [(PXPhotosSectionHeaderLayout *)self _invalidateDividerMediaVersion];
    }
  }
}

- (PXPhotosLayoutSpec)spec
{
  spec = self->_spec;
  if (!spec)
  {
    char v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PXPhotosSectionHeaderLayout.m" lineNumber:161 description:@"Must be non-null"];

    spec = self->_spec;
  }
  return spec;
}

- (void)setSpec:(id)a3
{
  unint64_t v7 = (PXPhotosLayoutSpec *)a3;
  char v5 = self->_spec;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXPhotosLayoutSpec *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_spec, a3);
      [(PXPhotosSectionHeaderLayout *)self _invalidateAttributes];
      [(PXPhotosSectionHeaderLayout *)self _invalidateContent];
      [(PXPhotosSectionHeaderLayout *)self _invalidateSpritesAlpha];
    }
  }
}

- (BOOL)wantsButton
{
  long long v2 = [(PXPhotosSectionHeaderLayout *)self buttonTitle];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (BOOL)wantsChevron
{
  BOOL v3 = [(PXPhotosSectionHeaderLayout *)self assetCollectionReference];
  if (v3) {
    BOOL v4 = ![(PXPhotosSectionHeaderLayout *)self wantsButton];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)allowsInteraction
{
  if ([(PXPhotosSectionHeaderLayout *)self wantsChevron]) {
    return 1;
  }
  return [(PXPhotosSectionHeaderLayout *)self wantsButton];
}

- (void)setAssetCollectionReference:(id)a3
{
  unint64_t v7 = (PXAssetCollectionReference *)a3;
  char v5 = self->_assetCollectionReference;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXAssetCollectionReference *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_assetCollectionReference, a3);
      [(PXPhotosSectionHeaderLayout *)self _invalidateContent];
      [(PXPhotosSectionHeaderLayout *)self _invalidateSpritesAlpha];
    }
  }
}

- (PXPhotosSectionHeaderLayout)init
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosSectionHeaderLayout.m", 122, @"%s is not available as initializer", "-[PXPhotosSectionHeaderLayout init]");

  abort();
}

- (PXPhotosSectionHeaderLayout)initWithSpec:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXPhotosSectionHeaderLayout;
  char v6 = [(PXGLayout *)&v13 init];
  unint64_t v7 = v6;
  if (v6)
  {
    [(PXGLayout *)v6 setContentSource:v6];
    objc_storeStrong((id *)&v7->_spec, a3);
    LODWORD(v8) = 1.0;
    v7->_gradientResizableCapInsetsIndeCGFloat x = -[PXGLayout addResizableCapInsets:](v7, "addResizableCapInsets:", 0.0, 0.0, v8, 0.0);
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:10];
    axSpriteIndexes = v7->_axSpriteIndexes;
    v7->_axSpriteIndexes = (NSIndexSet *)v9;

    CGSize v11 = *(CGSize *)off_1E5DAB030;
    v7->_finalTitleSize = *(CGSize *)off_1E5DAB030;
    v7->_subtitleSize = v11;
    v7->_badgeSize = v11;
    v7->_buttonTitleSize = v11;
    v7->_filterButtonSize = v11;
    [(PXPhotosSectionHeaderLayout *)v7 _invalidateAttributes];
    [(PXPhotosSectionHeaderLayout *)v7 _invalidateContent];
    v7->_relativeOffsetAlpha = 1.0;
    [(PXPhotosSectionHeaderLayout *)v7 _invalidateSpritesAlpha];
  }

  return v7;
}

@end