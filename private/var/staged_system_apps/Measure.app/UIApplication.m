@interface UIApplication
+ (BOOL)isDeactivationReasonControlCenterOrSuspension:(int64_t)a3;
+ (id)deactivationReasonUserInfoKey;
+ (id)willAddDeactivationReasonNotification;
@end

@implementation UIApplication

+ (BOOL)isDeactivationReasonControlCenterOrSuspension:(int64_t)a3
{
  return ((unint64_t)a3 < 0xD) & (0x1804u >> a3);
}

+ (id)willAddDeactivationReasonNotification
{
  return _UIApplicationWillAddDeactivationReasonNotification;
}

+ (id)deactivationReasonUserInfoKey
{
  return _UIApplicationDeactivationReasonUserInfoKey;
}

@end