@interface SBFFluidBehaviorSettings(SBSwitcherModifierDebugTimelineDescription)
- (id)sb_switcherModifierDebugTimelineDescription;
@end

@implementation SBFFluidBehaviorSettings(SBSwitcherModifierDebugTimelineDescription)

- (id)sb_switcherModifierDebugTimelineDescription
{
  v2 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  [a1 response];
  uint64_t v6 = v5;
  [a1 dampingRatio];
  uint64_t v8 = v7;
  [a1 trackingResponse];
  uint64_t v10 = v9;
  [a1 trackingDampingRatio];
  v12 = [v2 stringWithFormat:@"<%@:%p response: %0.3f\ndampingRatio: %0.3f\ntrackingResponse: %0.3f\ntrackingDampingRatio: %0.3f>", v4, a1, v6, v8, v10, v11];

  return v12;
}

@end