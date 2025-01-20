@interface WRMessagesReplyStoreInfo
- (BOOL)supportsSmartReplies;
- (id)defaultsChangedNotificationName;
- (id)defaultsDomain;
- (id)defaultsKey;
- (unint64_t)defaultCount;
@end

@implementation WRMessagesReplyStoreInfo

- (unint64_t)defaultCount
{
  return 5;
}

- (id)defaultsDomain
{
  return @"com.apple.MobileSMS";
}

- (id)defaultsKey
{
  return @"CKNanoCannedRepliesArray";
}

- (id)defaultsChangedNotificationName
{
  return @"com.apple.MobileSMS.CKNanoCannedRepliesArray.changed";
}

- (BOOL)supportsSmartReplies
{
  return 1;
}

@end