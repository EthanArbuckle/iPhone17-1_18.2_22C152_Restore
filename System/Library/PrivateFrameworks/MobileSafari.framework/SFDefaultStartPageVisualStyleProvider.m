@interface SFDefaultStartPageVisualStyleProvider
+ (SFDefaultStartPageVisualStyleProvider)sharedProvider;
- (NSDirectionalEdgeInsets)sectionContentInsetsWithViewLayoutMargins:(NSDirectionalEdgeInsets)result;
- (UIEdgeInsets)collectionViewContentInsetsWithNavigationBarPosition:(int64_t)a3;
- (UIFont)sectionHeaderLargeTitleFont;
- (double)defaultRowSpacing;
- (double)rowSpacingForSectionItemType:(int64_t)a3 containerSize:(CGSize)a4;
- (double)sectionHeaderBottomGapForSectionItemType:(int64_t)a3;
- (double)siteIconSizeForContainerSize:(CGSize)a3;
- (id)backgroundEffectForSupplementaryActions;
- (id)interItemSpacingForSectionItemType:(int64_t)a3;
- (id)tintColorForSupplementaryActions;
- (int64_t)numberOfColumnsForSectionItemType:(int64_t)a3 sectionWidth:(double)a4 traitCollection:(id)a5;
- (int64_t)numberOfRowsForSection:(int64_t)a3 traitCollectionIsHorizontalCompact:(BOOL)a4;
@end

@implementation SFDefaultStartPageVisualStyleProvider

- (double)sectionHeaderBottomGapForSectionItemType:(int64_t)a3
{
  return 10.0;
}

- (int64_t)numberOfColumnsForSectionItemType:(int64_t)a3 sectionWidth:(double)a4 traitCollection:(id)a5
{
  v7 = [a5 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

  int v9 = [MEMORY[0x1E4F97EA0] is2024FavoritesEnabled];
  double v10 = 1010.0;
  if (!v9) {
    double v10 = 900.0;
  }
  if (v10 <= a4)
  {
    int64_t v15 = (uint64_t)(a4 / 350.0);
    uint64_t v16 = 4 * v15;
    uint64_t v14 = 6;
    int64_t result = 6;
  }
  else
  {
    int v11 = [MEMORY[0x1E4F97EA0] is2024FavoritesEnabled];
    double v12 = 700.0;
    if (!v11) {
      double v12 = 900.0;
    }
    if (v12 <= a4)
    {
      if ([MEMORY[0x1E4F97EA0] is2024FavoritesEnabled]) {
        uint64_t v16 = 8;
      }
      else {
        uint64_t v16 = 6;
      }
      int64_t result = 5;
      uint64_t v14 = 4;
      int64_t v15 = 2;
    }
    else if (a4 >= 500.0)
    {
      uint64_t v14 = 3;
      int64_t v15 = 2;
      uint64_t v16 = 6;
      int64_t result = 3;
    }
    else if ([MEMORY[0x1E4F97EA0] is2024SuggestionsEnabled])
    {
      int64_t result = 2;
      if (a4 < 300.0) {
        uint64_t v14 = 1;
      }
      else {
        uint64_t v14 = 2;
      }
      int64_t v15 = 1;
      uint64_t v16 = 4;
    }
    else
    {
      uint64_t v14 = 2;
      int64_t v15 = 1;
      uint64_t v16 = 4;
      int64_t result = 2;
    }
  }
  switch(a3)
  {
    case 2:
      if (v16 - IsAccessibilityCategory <= 1) {
        int64_t result = 1;
      }
      else {
        int64_t result = v16 - IsAccessibilityCategory;
      }
      break;
    case 3:
    case 5:
      int64_t result = v15;
      break;
    case 4:
      unint64_t v17 = v14 - IsAccessibilityCategory;
      if (v17 <= 1) {
        int64_t result = 1;
      }
      else {
        int64_t result = v17;
      }
      break;
    case 6:
      return result;
    default:
      int64_t result = 1;
      break;
  }
  return result;
}

- (NSDirectionalEdgeInsets)sectionContentInsetsWithViewLayoutMargins:(NSDirectionalEdgeInsets)result
{
  double v3 = 0.0;
  double v4 = 10.0;
  result.bottom = v4;
  result.top = v3;
  return result;
}

- (double)rowSpacingForSectionItemType:(int64_t)a3 containerSize:(CGSize)a4
{
  double result = 20.0;
  if ((unint64_t)(a3 - 2) <= 4) {
    return dbl_18C70E960[a3 - 2];
  }
  return result;
}

- (double)siteIconSizeForContainerSize:(CGSize)a3
{
  double width = a3.width;
  if (a3.width > 500.0 && a3.height > 428.0) {
    goto LABEL_6;
  }
  if (deviceUsesLargeIcons_onceToken != -1) {
    dispatch_once(&deviceUsesLargeIcons_onceToken, &__block_literal_global_84);
  }
  if (deviceUsesLargeIcons_result)
  {
LABEL_6:
    double v4 = 76.0;
  }
  else
  {
    double v4 = 60.0;
    if (width <= 300.0) {
      return v4;
    }
  }
  if ([MEMORY[0x1E4F97EA0] is2024FavoritesEnabled]) {
    return 72.0;
  }
  return v4;
}

- (id)interItemSpacingForSectionItemType:(int64_t)a3
{
  v5 = 0;
  if ((unint64_t)a3 <= 6 && ((1 << a3) & 0x58) != 0)
  {
    v5 = objc_msgSend(MEMORY[0x1E4FB1340], "fixedSpacing:", 8.0, v3);
  }
  return v5;
}

- (UIEdgeInsets)collectionViewContentInsetsWithNavigationBarPosition:(int64_t)a3
{
  double v3 = 20.0;
  if (a3 == 3) {
    double v3 = 4.0;
  }
  double v4 = 0.0;
  double v5 = 20.0;
  double v6 = 0.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (double)defaultRowSpacing
{
  return 20.0;
}

void __55__SFDefaultStartPageVisualStyleProvider_sharedProvider__block_invoke()
{
  v0 = objc_alloc_init(SFDefaultStartPageVisualStyleProvider);
  v1 = (void *)sharedProvider_sharedProvider;
  sharedProvider_sharedProvider = (uint64_t)v0;
}

+ (SFDefaultStartPageVisualStyleProvider)sharedProvider
{
  if (sharedProvider_onceToken != -1) {
    dispatch_once(&sharedProvider_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)sharedProvider_sharedProvider;

  return (SFDefaultStartPageVisualStyleProvider *)v2;
}

- (int64_t)numberOfRowsForSection:(int64_t)a3 traitCollectionIsHorizontalCompact:(BOOL)a4
{
  switch(a3)
  {
    case 3:
      if (a4) {
        int64_t result = 3;
      }
      else {
        int64_t result = 2;
      }
      break;
    case 4:
      int64_t result = 2;
      break;
    case 5:
    case 6:
      int64_t result = 3;
      break;
    default:
      int64_t result = 1;
      break;
  }
  return result;
}

- (UIFont)sectionHeaderLargeTitleFont
{
  v2 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2928]];
  double v3 = [v2 fontDescriptorWithSymbolicTraits:2];

  double v4 = (void *)MEMORY[0x1E4FB08E0];
  [v3 pointSize];
  double v5 = objc_msgSend(v4, "fontWithDescriptor:size:", v3);

  return (UIFont *)v5;
}

- (id)tintColorForSupplementaryActions
{
  return 0;
}

- (id)backgroundEffectForSupplementaryActions
{
  return 0;
}

@end