@interface UINavigationItem(IC)
- (void)ic_setTitle:()IC andSubtitle:;
@end

@implementation UINavigationItem(IC)

- (void)ic_setTitle:()IC andSubtitle:
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v6 = (objc_class *)MEMORY[0x1E4FB1930];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  v10 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
  [v9 setFont:v10];

  [v9 setAdjustsFontForContentSizeCategory:1];
  [v9 setText:v8];

  id v11 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  v12 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28E0]];
  [v11 setFont:v12];

  [v11 setAdjustsFontForContentSizeCategory:1];
  [v11 setText:v7];

  id v13 = objc_alloc(MEMORY[0x1E4FB1C60]);
  v16[0] = v9;
  v16[1] = v11;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  v15 = (void *)[v13 initWithArrangedSubviews:v14];

  [v15 setDistribution:4];
  [v15 setAlignment:3];
  [v15 setAxis:1];
  [a1 setTitleView:v15];
}

@end