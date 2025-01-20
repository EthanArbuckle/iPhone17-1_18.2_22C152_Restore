@interface NSString(TPSEncryptedIdentityAdditions)
+ (id)tps_ctStringWithTPSEncryptedIdentityType:()TPSEncryptedIdentityAdditions;
+ (id)tps_stringWithTPSEncryptedIdentityType:()TPSEncryptedIdentityAdditions;
- (uint64_t)tps_encryptedIdentityType;
@end

@implementation NSString(TPSEncryptedIdentityAdditions)

+ (id)tps_ctStringWithTPSEncryptedIdentityType:()TPSEncryptedIdentityAdditions
{
  if (a3 == 1)
  {
    v4 = (id *)MEMORY[0x1E4F23D70];
LABEL_5:
    id v5 = *v4;
    return v5;
  }
  if (a3 == 2)
  {
    v4 = (id *)MEMORY[0x1E4F23D78];
    goto LABEL_5;
  }
  id v5 = 0;
  return v5;
}

+ (id)tps_stringWithTPSEncryptedIdentityType:()TPSEncryptedIdentityAdditions
{
  if (a3 > 2)
  {
    v4 = 0;
  }
  else
  {
    v4 = (void *)[[NSString alloc] initWithUTF8String:off_1E6EB24B0[a3]];
  }
  return v4;
}

- (uint64_t)tps_encryptedIdentityType
{
  if ([a1 isEqualToString:*MEMORY[0x1E4F23D70]]) {
    return 1;
  }
  if ([a1 isEqualToString:*MEMORY[0x1E4F23D78]]) {
    return 2;
  }
  return 0;
}

@end