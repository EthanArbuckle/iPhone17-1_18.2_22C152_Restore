@interface TVPContentKeyRequest(VideosUI)
- (uint64_t)offlineKeyRenewalPolicy;
- (void)setOfflineKeyRenewalPolicy:()VideosUI;
@end

@implementation TVPContentKeyRequest(VideosUI)

- (uint64_t)offlineKeyRenewalPolicy
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKey:@"OfflineKeyRenewalPolicyKey"];
  uint64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setOfflineKeyRenewalPolicy:()VideosUI
{
  id v5 = [a1 userInfo];
  v4 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
  [v5 setObject:v4 forKey:@"OfflineKeyRenewalPolicyKey"];
}

@end