@interface MFMimePart(SMIMESupport)
- (BOOL)isSigned;
- (uint64_t)SMIMEError;
- (uint64_t)copySigners;
- (uint64_t)isEncrypted;
- (uint64_t)signatureInfo;
@end

@implementation MFMimePart(SMIMESupport)

- (BOOL)isSigned
{
  v2 = [a1 _objectInOtherIvarsForKey:@"x-is-signed"];
  if ([v2 BOOLValue])
  {
    BOOL v3 = 1;
  }
  else
  {
    v4 = [a1 _objectInOtherIvarsForKey:@"x-apple-smime-signers"];
    BOOL v3 = v4 != 0;
  }
  return v3;
}

- (uint64_t)isEncrypted
{
  v1 = [a1 _objectInOtherIvarsForKey:@"x-is-encrypted"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)signatureInfo
{
  return [a1 _objectInOtherIvarsForKey:@"x-apple-smime-signature-info"];
}

- (uint64_t)SMIMEError
{
  return [a1 _objectInOtherIvarsForKey:@"x-apple-smime-error"];
}

- (uint64_t)copySigners
{
  return objc_claimAutoreleasedReturnValue();
}

@end