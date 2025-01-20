@interface SBControlCenterSystemControlsHost
- (id)observeSilentModeWithBlock:(id)a3;
@end

@implementation SBControlCenterSystemControlsHost

- (id)observeSilentModeWithBlock:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F29060];
  id v4 = a3;
  if (([v3 isMainThread] & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = [NSString stringWithUTF8String:"-[SBControlCenterSystemControlsHost observeSilentModeWithBlock:]"];
    [v8 handleFailureInFunction:v9 file:@"SBControlCenterSystemControlsHost.m" lineNumber:19 description:@"this call must be made on the main thread"];
  }
  v5 = [(id)SBApp ringerControl];
  v6 = [v5 observeRingerMutedWithBlock:v4];

  return v6;
}

@end