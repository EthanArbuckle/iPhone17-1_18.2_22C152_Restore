@interface UIColor(PhotosUICore)
+ (id)px_colorNamed:()PhotosUICore;
+ (id)px_dynamicHighlightColor;
+ (uint64_t)px_assetExplorerBackgroundColor;
+ (uint64_t)px_assetPlaceholderGray;
+ (uint64_t)px_messagesBubbleGray;
+ (uint64_t)px_placeholderBackgroundColor;
@end

@implementation UIColor(PhotosUICore)

+ (id)px_colorNamed:()PhotosUICore
{
  v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  v5 = objc_msgSend(v3, "px_bundle");
  v6 = [MEMORY[0x1E4FB1618] colorNamed:v4 inBundle:v5 compatibleWithTraitCollection:0];

  return v6;
}

+ (uint64_t)px_placeholderBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E4FB1618], "px_colorNamed:", @"PXPlaceholderBackgroundColor");
}

+ (id)px_dynamicHighlightColor
{
  if (px_dynamicHighlightColor_onceToken != -1) {
    dispatch_once(&px_dynamicHighlightColor_onceToken, &__block_literal_global_3_118178);
  }
  v0 = (void *)px_dynamicHighlightColor_color;
  return v0;
}

+ (uint64_t)px_assetExplorerBackgroundColor
{
  return [MEMORY[0x1E4FB1618] colorWithRed:0.82 green:0.835 blue:0.854 alpha:1.0];
}

+ (uint64_t)px_assetPlaceholderGray
{
  return [MEMORY[0x1E4FB1618] colorWithWhite:0.930000007 alpha:1.0];
}

+ (uint64_t)px_messagesBubbleGray
{
  return [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_118183];
}

@end