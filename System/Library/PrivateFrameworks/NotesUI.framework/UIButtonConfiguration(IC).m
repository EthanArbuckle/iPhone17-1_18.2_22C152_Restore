@interface UIButtonConfiguration(IC)
+ (id)ic_filledTintedButtonConfiguration;
+ (id)ic_plainButtonConfiguration;
@end

@implementation UIButtonConfiguration(IC)

+ (id)ic_filledTintedButtonConfiguration
{
  v0 = [MEMORY[0x1E4FB14D8] filledButtonConfiguration];
  v1 = [MEMORY[0x1E4FB1618] tintColor];
  v2 = [v0 background];
  [v2 setBackgroundColor:v1];

  return v0;
}

+ (id)ic_plainButtonConfiguration
{
  v0 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  v1 = [MEMORY[0x1E4FB1498] clearConfiguration];
  v2 = [MEMORY[0x1E4FB1618] clearColor];
  [v1 setBackgroundColor:v2];

  [v0 setBackground:v1];
  [v0 setTitleTextAttributesTransformer:&__block_literal_global_65];

  return v0;
}

@end