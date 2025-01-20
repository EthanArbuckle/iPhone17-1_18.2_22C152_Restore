@interface NSObject(SBSwitcherModifierDebugTimelineDescription)
- (id)sb_switcherModifierDebugTimelineDescription;
@end

@implementation NSObject(SBSwitcherModifierDebugTimelineDescription)

- (id)sb_switcherModifierDebugTimelineDescription
{
  if (objc_opt_respondsToSelector()) {
    [a1 succinctDescription];
  }
  else {
  v2 = [a1 description];
  }
  return v2;
}

@end