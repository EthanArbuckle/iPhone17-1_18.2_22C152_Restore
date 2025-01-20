@interface UIPresentationController(Bridge)
+ (id)ts_dismissalTransitionDidEndNotification;
+ (id)ts_presentationTransitionDidEndNotification;
@end

@implementation UIPresentationController(Bridge)

+ (id)ts_presentationTransitionDidEndNotification
{
  return (id)*MEMORY[0x1E4FB2E70];
}

+ (id)ts_dismissalTransitionDidEndNotification
{
  return (id)*MEMORY[0x1E4FB2E60];
}

@end