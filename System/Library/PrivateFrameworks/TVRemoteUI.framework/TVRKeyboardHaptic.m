@interface TVRKeyboardHaptic
- (void)play;
@end

@implementation TVRKeyboardHaptic

- (void)play
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  int v3 = [v2 _supportsForceTouch];

  if (v3)
  {
    v4 = [MEMORY[0x263F82670] currentDevice];
    id v5 = [v4 _tapticEngine];

    [v5 actuateFeedback:1];
  }
  else
  {
    AudioServicesPlaySystemSound(0xFFFu);
  }
}

@end