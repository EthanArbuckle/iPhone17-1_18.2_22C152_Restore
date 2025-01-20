@interface ISONotificationContent
+ (id)notImplementedException;
- (BOOL)shouldCallMlDaemon;
@end

@implementation ISONotificationContent

+ (id)notImplementedException
{
  return (id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"NotImplementedException: This method needs overriden." userInfo:0];
}

- (BOOL)shouldCallMlDaemon
{
  id v2 = +[ISONotificationContent notImplementedException];
  objc_exception_throw(v2);
}

@end