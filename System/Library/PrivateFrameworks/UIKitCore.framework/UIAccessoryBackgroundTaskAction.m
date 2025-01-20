@interface UIAccessoryBackgroundTaskAction
- (UIAccessoryBackgroundTaskAction)init;
- (int64_t)UIActionType;
@end

@implementation UIAccessoryBackgroundTaskAction

- (UIAccessoryBackgroundTaskAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIAccessoryBackgroundTaskAction;
  return [(UIAccessoryBackgroundTaskAction *)&v3 initWithInfo:0 timeout:0 forResponseOnQueue:0 withHandler:0.0];
}

- (int64_t)UIActionType
{
  return 11;
}

@end