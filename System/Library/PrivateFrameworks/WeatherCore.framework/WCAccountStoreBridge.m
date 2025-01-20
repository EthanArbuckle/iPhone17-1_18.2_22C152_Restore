@interface WCAccountStoreBridge
+ (id)account;
@end

@implementation WCAccountStoreBridge

+ (id)account
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F179C8]);
  v3 = objc_msgSend(v2, "aa_primaryAppleAccount");

  return v3;
}

@end