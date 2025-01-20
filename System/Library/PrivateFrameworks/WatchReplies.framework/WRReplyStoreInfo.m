@interface WRReplyStoreInfo
+ (id)infoForCategory:(unint64_t)a3;
- (BOOL)supportsSmartReplies;
- (NSArray)hiddenTinkerReplyKeys;
- (NSString)defaultsChangedNotificationName;
- (NSString)defaultsDomain;
- (NSString)defaultsKey;
- (unint64_t)defaultCount;
@end

@implementation WRReplyStoreInfo

+ (id)infoForCategory:(unint64_t)a3
{
  if (a3 - 1 <= 7 && ((0x8Fu >> (a3 - 1)) & 1) != 0) {
    v3 = (objc_class *)objc_opt_class();
  }
  else {
    v3 = 0;
  }
  id v4 = objc_alloc_init(v3);

  return v4;
}

- (unint64_t)defaultCount
{
  return self->_defaultCount;
}

- (NSString)defaultsDomain
{
  return self->_defaultsDomain;
}

- (NSString)defaultsKey
{
  return self->_defaultsKey;
}

- (NSString)defaultsChangedNotificationName
{
  return self->_defaultsChangedNotificationName;
}

- (BOOL)supportsSmartReplies
{
  return self->_supportsSmartReplies;
}

- (NSArray)hiddenTinkerReplyKeys
{
  return self->_hiddenTinkerReplyKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenTinkerReplyKeys, 0);
  objc_storeStrong((id *)&self->_defaultsChangedNotificationName, 0);
  objc_storeStrong((id *)&self->_defaultsKey, 0);

  objc_storeStrong((id *)&self->_defaultsDomain, 0);
}

@end