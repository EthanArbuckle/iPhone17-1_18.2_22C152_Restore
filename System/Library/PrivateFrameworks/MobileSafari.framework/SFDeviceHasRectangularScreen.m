@interface SFDeviceHasRectangularScreen
@end

@implementation SFDeviceHasRectangularScreen

void ___SFDeviceHasRectangularScreen_block_invoke()
{
  id v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v5 _peripheryInsets];
  BOOL v3 = v2 == *(double *)(MEMORY[0x1E4FB2848] + 8);
  if (v4 != *MEMORY[0x1E4FB2848]) {
    BOOL v3 = 0;
  }
  if (v1 != *(double *)(MEMORY[0x1E4FB2848] + 24)) {
    BOOL v3 = 0;
  }
  if (v0 != *(double *)(MEMORY[0x1E4FB2848] + 16)) {
    BOOL v3 = 0;
  }
  _SFDeviceHasRectangularScreen::hasRectangularScreen = v3;
}

@end