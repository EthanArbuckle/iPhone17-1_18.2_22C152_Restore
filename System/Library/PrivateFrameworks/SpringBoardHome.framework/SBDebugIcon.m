@interface SBDebugIcon
- (BOOL)canBeReceivedByIcon;
- (BOOL)canReceiveGrabbedIcon;
- (BOOL)isDebugIcon;
@end

@implementation SBDebugIcon

- (BOOL)isDebugIcon
{
  return 1;
}

- (BOOL)canReceiveGrabbedIcon
{
  return 0;
}

- (BOOL)canBeReceivedByIcon
{
  return 0;
}

@end