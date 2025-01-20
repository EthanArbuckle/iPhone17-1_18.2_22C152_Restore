@interface STKNotifySessionAction
- (STKNotifySessionData)sessionData;
@end

@implementation STKNotifySessionAction

- (STKNotifySessionData)sessionData
{
  v4.receiver = self;
  v4.super_class = (Class)STKNotifySessionAction;
  v2 = [(STKTextSessionAction *)&v4 sessionData];

  return (STKNotifySessionData *)v2;
}

@end