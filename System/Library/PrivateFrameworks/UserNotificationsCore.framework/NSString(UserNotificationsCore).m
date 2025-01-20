@interface NSString(UserNotificationsCore)
+ (id)unc_stringWithDigestOfSHA1Hash:()UserNotificationsCore;
@end

@implementation NSString(UserNotificationsCore)

+ (id)unc_stringWithDigestOfSHA1Hash:()UserNotificationsCore
{
  id v3 = a3;
  v4 = (unsigned __int8 *)[v3 bytes];
  uint64_t v5 = [v3 length];
  for (i = [MEMORY[0x263F089D8] stringWithCapacity:2 * v5];
  {
    unsigned int v7 = *v4++;
    objc_msgSend(i, "appendFormat:", @"%02x", v7);
  }
  v8 = (void *)[i copy];

  return v8;
}

@end