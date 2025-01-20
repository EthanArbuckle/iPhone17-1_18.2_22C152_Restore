@interface UIScreen(VideosUICore)
+ (uint64_t)vui_main;
- (BOOL)vui_canRepresentDisplayGamutP3;
@end

@implementation UIScreen(VideosUICore)

+ (uint64_t)vui_main
{
  return [MEMORY[0x1E4F42D90] mainScreen];
}

- (BOOL)vui_canRepresentDisplayGamutP3
{
  v1 = [a1 traitCollection];
  BOOL v2 = [v1 displayGamut] == 1;

  return v2;
}

@end