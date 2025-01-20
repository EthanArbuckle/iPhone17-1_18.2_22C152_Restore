@interface STKCallSetupSessionAction
- (STKCallSetupSessionData)sessionData;
@end

@implementation STKCallSetupSessionAction

- (STKCallSetupSessionData)sessionData
{
  v4.receiver = self;
  v4.super_class = (Class)STKCallSetupSessionAction;
  v2 = [(STKTextSessionAction *)&v4 sessionData];

  return (STKCallSetupSessionData *)v2;
}

@end