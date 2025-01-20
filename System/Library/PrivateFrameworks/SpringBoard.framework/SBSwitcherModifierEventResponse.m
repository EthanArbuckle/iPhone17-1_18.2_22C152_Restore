@interface SBSwitcherModifierEventResponse
+ (id)newEventResponse;
- (int64_t)type;
@end

@implementation SBSwitcherModifierEventResponse

- (int64_t)type
{
  return 0;
}

+ (id)newEventResponse
{
  return objc_alloc_init(SBSwitcherModifierEventResponse);
}

@end