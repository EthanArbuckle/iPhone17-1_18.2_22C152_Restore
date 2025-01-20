@interface SFAppIconCardSection(SearchUIGridSectionModel)
- (double)searchUIGridSectionModel_groupInsetFor:()SearchUIGridSectionModel;
- (double)searchUIGridSectionModel_interItemSpacing;
@end

@implementation SFAppIconCardSection(SearchUIGridSectionModel)

- (double)searchUIGridSectionModel_interItemSpacing
{
  return 0.0;
}

- (double)searchUIGridSectionModel_groupInsetFor:()SearchUIGridSectionModel
{
  v3 = [a3 container];
  [v3 effectiveContentSize];
  double v5 = v4;
  +[SearchUIUtilities standardTableCellContentInset];
  double v7 = v5 + v6 * -2.0;

  double v8 = (double)+[SearchUIAppIconUtilities numberOfAppIconsPerRow];
  +[SearchUIAppIconUtilities preferredHorizontalPlatterInsetForAppIcons];
  double v10 = v9;
  +[SearchUIAppIconUtilities appIconItemSize];
  [MEMORY[0x1E4FAE100] deviceScaledRoundedValue:0 forView:-(v7 + -v8 * (v11 + v10 * 2.0)) / (v8 + -1.0)];
  return 0.0;
}

@end