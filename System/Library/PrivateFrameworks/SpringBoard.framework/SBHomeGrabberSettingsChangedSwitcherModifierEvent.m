@interface SBHomeGrabberSettingsChangedSwitcherModifierEvent
- (int64_t)type;
@end

@implementation SBHomeGrabberSettingsChangedSwitcherModifierEvent

- (int64_t)type
{
  return 10;
}

@end