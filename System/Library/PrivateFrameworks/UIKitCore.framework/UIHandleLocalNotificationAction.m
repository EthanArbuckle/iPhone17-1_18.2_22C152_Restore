@interface UIHandleLocalNotificationAction
- (NSDictionary)userResponse;
- (NSString)action;
- (UIHandleLocalNotificationAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6;
- (UIHandleLocalNotificationAction)initWithNotification:(id)a3;
- (UIHandleLocalNotificationAction)initWithNotification:(id)a3 action:(id)a4 userResponse:(id)a5 withHandler:(id)a6;
- (UIHandleLocalNotificationAction)initWithNotification:(id)a3 action:(id)a4 withHandler:(id)a5;
- (UIHandleLocalNotificationAction)initWithNotification:(id)a3 withHandler:(id)a4;
- (UIHandleLocalNotificationAction)initWithXPCDictionary:(id)a3;
- (UILocalNotification)notification;
- (id)_initWithNotification:(id)a3 action:(id)a4 userResponse:(id)a5 type:(int64_t)a6 withHandler:(id)a7;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (int64_t)UIActionType;
@end

@implementation UIHandleLocalNotificationAction

- (id)_initWithNotification:(id)a3 action:(id)a4 userResponse:(id)a5 type:(int64_t)a6 withHandler:(id)a7
{
  return 0;
}

- (UIHandleLocalNotificationAction)initWithNotification:(id)a3
{
  return 0;
}

- (UIHandleLocalNotificationAction)initWithNotification:(id)a3 withHandler:(id)a4
{
  return 0;
}

- (UIHandleLocalNotificationAction)initWithNotification:(id)a3 action:(id)a4 withHandler:(id)a5
{
  return 0;
}

- (UIHandleLocalNotificationAction)initWithNotification:(id)a3 action:(id)a4 userResponse:(id)a5 withHandler:(id)a6
{
  return 0;
}

- (UIHandleLocalNotificationAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{
  return 0;
}

- (UILocalNotification)notification
{
  if (pthread_main_np() != 1)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"UIHandleLocalNotificationAction.m" lineNumber:71 description:@"you should only call this on the main thread"];
  }
  return 0;
}

- (NSString)action
{
  return 0;
}

- (NSDictionary)userResponse
{
  return 0;
}

- (int64_t)UIActionType
{
  return 0;
}

- (UIHandleLocalNotificationAction)initWithXPCDictionary:(id)a3
{
  return 0;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  return 0;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  return 0;
}

@end