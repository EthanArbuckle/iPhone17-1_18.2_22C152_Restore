@interface SHSheetContentLayoutSpec
- (BOOL)isAccessibilityContentSize;
- (BOOL)shouldUseNarrowLayoutForHeroActionsWithContainerWidth:(double)a3;
- (NSDirectionalEdgeInsets)topContentSectionHeaderInsets;
- (SHSheetContentLayoutSpec)initWithTraitCollection:(id)a3 tintColor:(id)a4 deviceClass:(unint64_t)a5;
- (UIColor)editTintColor;
- (UIColor)footerBackgroundColor;
- (UIColor)tintColor;
- (UIImageSymbolConfiguration)activityImageSymbolConfiguration;
- (UITraitCollection)traitCollection;
- (double)actionInterGroupInset;
- (double)customViewSectionHeight;
- (double)customViewVerticalInset;
- (double)estimatedActionFooterHeight;
- (double)estimatedFooterHeight;
- (double)estimatedHeaderHeight;
- (double)heroActionItemSpacing;
- (double)horizontalCellWidth;
- (double)horizontalCellWidthForContentWidth:(double)a3 sizeOffset:(double)a4;
- (double)horizontalSectionBottomInset;
- (double)peopleIconWidth;
- (double)peopleSectionHeight;
- (double)sharingAppIconWidth;
- (id)actionsLayoutSectionConfigurationWithEnvironment:(id)a3;
- (int64_t)numberOfHorizontalItemsPerGroupForContentWidth:(double)a3;
- (unint64_t)deviceClass;
- (void)setCustomViewSectionHeight:(double)a3;
- (void)setCustomViewVerticalInset:(double)a3;
- (void)setHorizontalCellWidth:(double)a3;
- (void)setTintColor:(id)a3;
- (void)setTraitCollection:(id)a3;
@end

@implementation SHSheetContentLayoutSpec

- (SHSheetContentLayoutSpec)initWithTraitCollection:(id)a3 tintColor:(id)a4 deviceClass:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v22.receiver = self;
  v22.super_class = (Class)SHSheetContentLayoutSpec;
  v11 = [(SHSheetContentLayoutSpec *)&v22 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_traitCollection, a3);
    v12->_deviceClass = a5;
    objc_storeStrong((id *)&v12->_tintColor, a4);
    v12->_estimatedHeaderHeight = 10.0;
    v13 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v13 scale];
    v12->_estimatedFooterHeight = 1.0 / v14;

    v12->_customViewVerticalInset = 12.0;
    *(_OWORD *)&v12->_peopleIconWidth = xmmword_1A0BA0140;
    *(_OWORD *)&v12->_actionInterGroupInset = xmmword_1A0BA0150;
    v12->_heroActionItemSpacing = 7.0;
    v12->_horizontalCellWidth = 78.0;
    *(_OWORD *)&v12->_horizontalSectionBottomInset = xmmword_1A0BA0160;
    uint64_t v15 = [MEMORY[0x1E4FB1618] separatorColor];
    footerBackgroundColor = v12->_footerBackgroundColor;
    v12->_footerBackgroundColor = (UIColor *)v15;

    switch(a5)
    {
      case 0uLL:
        *(_OWORD *)&v12->_customViewSectionHeight = xmmword_1A0BA01F0;
        uint64_t v17 = 0x405D800000000000;
        goto LABEL_20;
      case 1uLL:
        *(_OWORD *)&v12->_customViewSectionHeight = xmmword_1A0BA01E0;
        goto LABEL_19;
      case 2uLL:
        v12->_customViewSectionHeight = 275.0;
        *(_OWORD *)&v12->_peopleSectionHeight = xmmword_1A0BA01D0;
        v12->_sharingAppIconWidth = 64.0;
        break;
      case 3uLL:
        *(_OWORD *)&v12->_customViewSectionHeight = xmmword_1A0BA01C0;
        break;
      case 4uLL:
        v12->_customViewSectionHeight = 320.0;
        int64x2_t v18 = vdupq_n_s64(0x4050000000000000uLL);
        goto LABEL_11;
      case 5uLL:
        uint64_t v19 = 0x4074E00000000000;
        goto LABEL_10;
      case 6uLL:
        uint64_t v19 = 0x4076000000000000;
LABEL_10:
        *(void *)&v12->_customViewSectionHeight = v19;
        int64x2_t v18 = (int64x2_t)xmmword_1A0BA01B0;
LABEL_11:
        *(int64x2_t *)&v12->_peopleIconWidth = v18;
        break;
      case 7uLL:
        uint64_t v20 = 0x406BE00000000000;
        goto LABEL_18;
      case 8uLL:
        uint64_t v20 = 0x4071800000000000;
LABEL_18:
        *(void *)&v12->_customViewSectionHeight = v20;
LABEL_19:
        uint64_t v17 = 0x4060000000000000;
LABEL_20:
        *(void *)&v12->_peopleSectionHeight = v17;
        break;
      case 9uLL:
        v12->_customViewSectionHeight = 280.0;
        v12->_horizontalCellWidth = 84.0;
        *(int64x2_t *)&v12->_peopleIconWidth = vdupq_n_s64(0x404A000000000000uLL);
        *(_OWORD *)&v12->_horizontalSectionBottomInset = xmmword_1A0BA01A0;
        goto LABEL_15;
      case 0xAuLL:
        v12->_customViewSectionHeight = 280.0;
        v12->_horizontalCellWidth = 92.0;
        *(int64x2_t *)&v12->_peopleIconWidth = vdupq_n_s64(0x4051000000000000uLL);
        *(_OWORD *)&v12->_horizontalSectionBottomInset = xmmword_1A0BA0170;
LABEL_15:
        v12->_estimatedActionFooterHeight = 84.0;
        if (_ShareSheetIsRealityLauncher())
        {
          *(_OWORD *)&v12->_topContentSectionHeaderInsets.top = xmmword_1A0BA0180;
          *(_OWORD *)&v12->_topContentSectionHeaderInsets.bottom = xmmword_1A0BA0190;
        }
        break;
      default:
        break;
    }
  }

  return v12;
}

- (BOOL)isAccessibilityContentSize
{
  v2 = [(SHSheetContentLayoutSpec *)self traitCollection];
  v3 = [v2 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  return IsAccessibilityCategory;
}

- (UIColor)editTintColor
{
  v3 = [(SHSheetContentLayoutSpec *)self tintColor];

  if (v3) {
    [(SHSheetContentLayoutSpec *)self tintColor];
  }
  else {
  v4 = SHSheetTintColor();
  }
  return (UIColor *)v4;
}

- (double)horizontalCellWidthForContentWidth:(double)a3 sizeOffset:(double)a4
{
  [(SHSheetContentLayoutSpec *)self horizontalCellWidth];
  double v8 = v7;
  BOOL v9 = [(SHSheetContentLayoutSpec *)self isAccessibilityContentSize];
  double result = -(a4 - a3 * 0.666666667);
  if (!v9) {
    return v8;
  }
  return result;
}

- (int64_t)numberOfHorizontalItemsPerGroupForContentWidth:(double)a3
{
  BOOL v5 = _ShareSheetPlatformPrefersPopover();
  if ([(SHSheetContentLayoutSpec *)self isAccessibilityContentSize]) {
    return 1;
  }
  if (a3 == 540.0 && v5) {
    return 6;
  }
  if (a3 <= 320.0) {
    return 3;
  }
  if (a3 >= 568.0) {
    return 6;
  }
  return 4;
}

- (UIImageSymbolConfiguration)activityImageSymbolConfiguration
{
  BOOL v2 = [(SHSheetContentLayoutSpec *)self isAccessibilityContentSize];
  uint64_t v3 = *MEMORY[0x1E4FB28C8];
  if (v2)
  {
    v4 = (void *)MEMORY[0x1E4FB17A0];
    BOOL v5 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x1E4FB2798]];
    v6 = [v4 preferredFontDescriptorWithTextStyle:v3 compatibleWithTraitCollection:v5];

    double v7 = [v6 fontDescriptorWithSymbolicTraits:0x8000];

    double v8 = [MEMORY[0x1E4FB1798] fontWithDescriptor:v7 size:0.0];
    BOOL v9 = (void *)MEMORY[0x1E4FB1830];
    [v8 pointSize];
    id v10 = objc_msgSend(v9, "configurationWithPointSize:");
  }
  else
  {
    id v10 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8] scale:3];
  }
  return (UIImageSymbolConfiguration *)v10;
}

- (id)actionsLayoutSectionConfigurationWithEnvironment:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4FB16C8];
  id v4 = a3;
  BOOL v5 = [v3 currentDevice];
  if ([v5 userInterfaceIdiom])
  {
    if (_ShareSheetPlatformPrefersPopover()) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 2;
  }

  double v7 = (void *)[objc_alloc(MEMORY[0x1E4FB2050]) initWithAppearanceStyle:v6 layoutEnvironment:v4];
  objc_msgSend(v7, "setSeparatorInset:", 0.0, 0.0, 0.0, 0.0);
  [v7 setEstimatedRowHeight:52.0];
  return v7;
}

- (BOOL)shouldUseNarrowLayoutForHeroActionsWithContainerWidth:(double)a3
{
  id v4 = [(SHSheetContentLayoutSpec *)self traitCollection];
  BOOL v5 = [v4 preferredContentSizeCategory];
  NSComparisonResult v6 = UIContentSizeCategoryCompareToCategory(v5, (UIContentSizeCategory)*MEMORY[0x1E4FB27B8]);

  return a3 <= 320.0 || v6 != NSOrderedAscending;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
}

- (unint64_t)deviceClass
{
  return self->_deviceClass;
}

- (NSDirectionalEdgeInsets)topContentSectionHeaderInsets
{
  double top = self->_topContentSectionHeaderInsets.top;
  double leading = self->_topContentSectionHeaderInsets.leading;
  double bottom = self->_topContentSectionHeaderInsets.bottom;
  double trailing = self->_topContentSectionHeaderInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (double)customViewSectionHeight
{
  return self->_customViewSectionHeight;
}

- (void)setCustomViewSectionHeight:(double)a3
{
  self->_customViewSectionHeight = a3;
}

- (double)customViewVerticalInset
{
  return self->_customViewVerticalInset;
}

- (void)setCustomViewVerticalInset:(double)a3
{
  self->_customViewVerticalInset = a3;
}

- (double)estimatedHeaderHeight
{
  return self->_estimatedHeaderHeight;
}

- (double)estimatedFooterHeight
{
  return self->_estimatedFooterHeight;
}

- (double)horizontalSectionBottomInset
{
  return self->_horizontalSectionBottomInset;
}

- (double)peopleSectionHeight
{
  return self->_peopleSectionHeight;
}

- (double)peopleIconWidth
{
  return self->_peopleIconWidth;
}

- (double)sharingAppIconWidth
{
  return self->_sharingAppIconWidth;
}

- (double)actionInterGroupInset
{
  return self->_actionInterGroupInset;
}

- (double)estimatedActionFooterHeight
{
  return self->_estimatedActionFooterHeight;
}

- (double)heroActionItemSpacing
{
  return self->_heroActionItemSpacing;
}

- (UIColor)footerBackgroundColor
{
  return self->_footerBackgroundColor;
}

- (double)horizontalCellWidth
{
  return self->_horizontalCellWidth;
}

- (void)setHorizontalCellWidth:(double)a3
{
  self->_horizontalCellWidth = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_footerBackgroundColor, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
}

@end