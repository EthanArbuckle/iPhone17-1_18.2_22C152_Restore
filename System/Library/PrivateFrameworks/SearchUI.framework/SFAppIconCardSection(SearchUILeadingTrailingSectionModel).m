@interface SFAppIconCardSection(SearchUILeadingTrailingSectionModel)
- (uint64_t)preferredBackgroundStyleForIsLeadingPrimaryCard:()SearchUILeadingTrailingSectionModel;
- (void)customizeRowModelsForAppTopHitWithShortcuts:()SearchUILeadingTrailingSectionModel;
- (void)customizeSection:()SearchUILeadingTrailingSectionModel isLeading:;
@end

@implementation SFAppIconCardSection(SearchUILeadingTrailingSectionModel)

- (void)customizeSection:()SearchUILeadingTrailingSectionModel isLeading:
{
  if (a4)
  {
    id v16 = a3;
    double v5 = (double)+[SearchUIAppIconUtilities numberOfAppIconsPerRow];
    +[SearchUIAppIconUtilities appIconItemSize];
    double v7 = v6;
    BOOL v8 = +[SearchUIUtilities isIpad];
    double v9 = 28.0;
    if (!v8) {
      +[SearchUIAppIconUtilities idealHorizontalSpacingBetweenAppIcons];
    }
    double v10 = (v5 + -1.0) * v9 + v5 * v7;
    BOOL v11 = +[SearchUIUtilities isIpad];
    double v12 = 12.0;
    if (!v11)
    {
      v13 = objc_msgSend(MEMORY[0x1E4FB1BA8], "mainScreen", 12.0);
      [v13 bounds];
      double v15 = (v14 + -32.0 - v10) * 0.5;

      double v12 = fmax(v15, 0.0);
    }
    [v16 setLeadingFractionalWidth:(v7 + v12 * 2.0) / v10];
    [v16 setVerticalSpacing:0.0];
    [v16 setPrefersSeparatorsInTrailingGroup:1];
    [a1 customizeRowModelsForAppTopHitWithShortcuts:v16];
  }
}

- (uint64_t)preferredBackgroundStyleForIsLeadingPrimaryCard:()SearchUILeadingTrailingSectionModel
{
  if (a3) {
    return 4;
  }
  else {
    return 5;
  }
}

- (void)customizeRowModelsForAppTopHitWithShortcuts:()SearchUILeadingTrailingSectionModel
{
  id v18 = a3;
  v3 = [v18 rowModels];
  uint64_t v4 = [v3 count];

  double v5 = [v18 trailingRowModels];
  unint64_t v6 = [v5 count];

  if (v4)
  {
    uint64_t v7 = 0;
    double v8 = *MEMORY[0x1E4F1DB30];
    double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v10 = 110.0 / (double)v6;
    do
    {
      BOOL v11 = [v18 rowModels];
      double v12 = [v11 objectAtIndexedSubscript:v7];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = v12;
        double v14 = v13;
        if (v7)
        {
          double v15 = 0.0;
          if (v7 == 1) {
            uint64_t v16 = 2;
          }
          else {
            uint64_t v16 = 8 * (v4 - 1 == v7);
          }
          double v17 = v10;
        }
        else
        {
          uint64_t v16 = 5;
          double v17 = v9;
          double v15 = v8;
        }
        [v13 setCornerMask:v16];
        objc_msgSend(v14, "setMinimumLayoutSize:", v15, v17);
      }
      ++v7;
    }
    while (v4 != v7);
  }
}

@end