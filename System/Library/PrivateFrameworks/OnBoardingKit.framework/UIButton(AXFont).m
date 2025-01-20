@interface UIButton(AXFont)
- (id)fontForStyle:()AXFont currentSizeCategory:maxSizeCategory:;
- (id)fontForStyle:()AXFont maxSizeCategory:;
@end

@implementation UIButton(AXFont)

- (id)fontForStyle:()AXFont currentSizeCategory:maxSizeCategory:
{
  id v7 = a3;
  v8 = a5;
  if (UIContentSizeCategoryCompareToCategory(v8, a4) == NSOrderedAscending)
  {
    v10 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:v8];
    v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v7 compatibleWithTraitCollection:v10];
  }
  else
  {
    v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v7];
  }

  return v9;
}

- (id)fontForStyle:()AXFont maxSizeCategory:
{
  v6 = (void *)MEMORY[0x1E4FB1438];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 sharedApplication];
  v10 = [v9 preferredContentSizeCategory];

  v11 = [a1 fontForStyle:v8 currentSizeCategory:v10 maxSizeCategory:v7];

  return v11;
}

@end