@interface TVRCPointSizeOfSiriRemoteOnMainScreen
@end

@implementation TVRCPointSizeOfSiriRemoteOnMainScreen

void ___TVRCPointSizeOfSiriRemoteOnMainScreen_block_invoke()
{
  id v5 = [MEMORY[0x263F82B60] mainScreen];
  [v5 nativeScale];
  double v1 = v0;
  int v2 = MGGetSInt32Answer();
  [v5 nativeBounds];
  v8.size.width = 1080.0;
  v8.size.height = 1920.0;
  v8.origin.x = 0.0;
  v8.origin.y = 0.0;
  BOOL v3 = CGRectEqualToRect(v7, v8);
  double v4 = (double)v2;
  if (v3) {
    double v4 = 401.0;
  }
  _TVRCPointSizeOfSiriRemoteOnMainScreen_size_0 = round(v4 * 1.4723 / v1);
  _TVRCPointSizeOfSiriRemoteOnMainScreen_size_1 = round(v4 * 1.6 / v1);
}

@end