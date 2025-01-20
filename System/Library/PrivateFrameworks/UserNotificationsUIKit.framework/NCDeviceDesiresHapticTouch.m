@interface NCDeviceDesiresHapticTouch
@end

@implementation NCDeviceDesiresHapticTouch

void ___NCDeviceDesiresHapticTouch_block_invoke()
{
  if (MGGetBoolAnswer() && !MGGetBoolAnswer())
  {
    id v0 = [MEMORY[0x1E4F4F7D0] sharedInstance];
    _NCDeviceDesiresHapticTouch___deviceDesiresHapticTouch = [v0 homeButtonType] == 2;
  }
  else
  {
    _NCDeviceDesiresHapticTouch___deviceDesiresHapticTouch = 0;
  }
}

@end