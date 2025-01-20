@interface IDSService
+ (id)mr_sharedGroupSessionService;
+ (id)mr_sharedGroupSessionServiceName;
@end

@implementation IDSService

+ (id)mr_sharedGroupSessionServiceName
{
  return @"com.apple.private.alloy.groupRemoteControl.messaging";
}

+ (id)mr_sharedGroupSessionService
{
  if (qword_10047E020 != -1) {
    dispatch_once(&qword_10047E020, &stru_100419080);
  }
  v2 = (void *)qword_10047E018;

  return v2;
}

@end