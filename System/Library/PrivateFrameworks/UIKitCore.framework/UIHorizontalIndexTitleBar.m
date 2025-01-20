@interface UIHorizontalIndexTitleBar
@end

@implementation UIHorizontalIndexTitleBar

id __40___UIHorizontalIndexTitleBar_commonInit__block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = [off_1E52D2B08 estimatedDimension:200.0];
  v3 = [off_1E52D2B08 absoluteDimension:54.0];
  v4 = [off_1E52D2B30 sizeWithWidthDimension:v2 heightDimension:v3];

  v5 = [off_1E52D2B20 itemWithLayoutSize:v4];
  v10[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  v7 = [off_1E52D2B18 horizontalGroupWithLayoutSize:v4 subitems:v6];

  v8 = [off_1E52D2B28 sectionWithGroup:v7];
  [*(id *)(a1 + 32) _combinedSectionInset];
  objc_msgSend(v8, "setContentInsets:");
  [v8 setInterGroupSpacing:20.0];

  return v8;
}

@end