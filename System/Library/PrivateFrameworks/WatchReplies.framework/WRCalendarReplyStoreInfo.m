@interface WRCalendarReplyStoreInfo
- (id)hiddenTinkerReplyKeys;
- (unint64_t)defaultCount;
@end

@implementation WRCalendarReplyStoreInfo

- (unint64_t)defaultCount
{
  return 7;
}

- (id)hiddenTinkerReplyKeys
{
  return &unk_26DE2DF78;
}

@end