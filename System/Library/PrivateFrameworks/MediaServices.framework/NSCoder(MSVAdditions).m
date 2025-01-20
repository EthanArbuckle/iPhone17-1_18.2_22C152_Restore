@interface NSCoder(MSVAdditions)
- (id)decodeTCCIdentityForKey:()MSVAdditions;
- (id)msv_userInfo;
- (void)encodeTCCIdentity:()MSVAdditions forKey:;
- (void)msv_setUserInfo:()MSVAdditions;
@end

@implementation NSCoder(MSVAdditions)

- (id)decodeTCCIdentityForKey:()MSVAdditions
{
  [a1 decodeInt64ForKey:@"tccType"];
  v2 = [a1 decodeObjectOfClass:objc_opt_class() forKey:@"tccIdentifier"];
  v3 = v2;
  if (v2)
  {
    [v2 UTF8String];
    v4 = (void *)tcc_identity_create();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)encodeTCCIdentity:()MSVAdditions forKey:
{
  if (a3)
  {
    v4 = NSString;
    id v5 = a3;
    id v7 = [v4 stringWithUTF8String:tcc_identity_get_identifier()];
    uint64_t type = tcc_identity_get_type();

    [a1 encodeObject:v7 forKey:@"tccIdentifier"];
    [a1 encodeInt64:type forKey:@"tccType"];
  }
}

- (void)msv_setUserInfo:()MSVAdditions
{
}

- (id)msv_userInfo
{
  v1 = objc_getAssociatedObject(a1, (const void *)_MSVCoderUserInfoKey);
  v2 = v1;
  if (!v1) {
    v1 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v3 = v1;

  return v3;
}

@end