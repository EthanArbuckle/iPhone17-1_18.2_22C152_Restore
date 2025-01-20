@interface TSNavigationBarTitleView
+ (id)emptyNavigationBarTitleView;
@end

@implementation TSNavigationBarTitleView

+ (id)emptyNavigationBarTitleView
{
  id v2 = objc_alloc(MEMORY[0x1E4FB2200]);
  v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v3 setHideBackButton:1];
  [v3 setHideStandardTitle:1];
  [v3 setHideLeadingBarButtons:1];
  [v3 setHideTrailingBarButtons:1];
  return v3;
}

@end