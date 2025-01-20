@interface UIApplication(SiriUI)
- (double)siriui_applicationFrame;
@end

@implementation UIApplication(SiriUI)

- (double)siriui_applicationFrame
{
  v0 = [MEMORY[0x263F1C408] sharedApplication];
  if ([v0 conformsToProtocol:&unk_26D6B1FC0])
  {
    [v0 applicationFrame];
    double v2 = v1;
  }
  else
  {
    v3 = [(id)*MEMORY[0x263F1D020] keyWindow];
    [v3 frame];
    double v2 = v4;
  }
  return v2;
}

@end