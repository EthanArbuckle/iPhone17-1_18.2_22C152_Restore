@interface UIApplication(PXNotificationSuppressionContextManager)
- (id)notificationSuppressionContextManager;
@end

@implementation UIApplication(PXNotificationSuppressionContextManager)

- (id)notificationSuppressionContextManager
{
  if ([a1 conformsToProtocol:&unk_1F050E718]) {
    id v2 = a1;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

@end