@interface WRMailReplyStoreInfo
- (id)defaultsChangedNotificationName;
- (id)defaultsDomain;
- (id)defaultsKey;
- (unint64_t)defaultCount;
@end

@implementation WRMailReplyStoreInfo

- (unint64_t)defaultCount
{
  return 13;
}

- (id)defaultsDomain
{
  return @"com.apple.NanoMail";
}

- (id)defaultsKey
{
  return @"NanoMailCannedRepliesArray";
}

- (id)defaultsChangedNotificationName
{
  return @"com.apple.NanoMail.NanoMailCannedRepliesArray.changed";
}

@end