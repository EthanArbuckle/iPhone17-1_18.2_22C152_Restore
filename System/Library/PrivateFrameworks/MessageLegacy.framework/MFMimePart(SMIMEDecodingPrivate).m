@interface MFMimePart(SMIMEDecodingPrivate)
- (BOOL)_needsSignatureVerification:()SMIMEDecodingPrivate;
- (uint64_t)_setSMIMEError:()SMIMEDecodingPrivate;
- (uint64_t)_setSigners:()SMIMEDecodingPrivate;
@end

@implementation MFMimePart(SMIMEDecodingPrivate)

- (uint64_t)_setSMIMEError:()SMIMEDecodingPrivate
{
  return MEMORY[0x1F412C190](a1, a1 + (int)*MEMORY[0x1E4F73620], @"x-apple-smime-error", a3);
}

- (uint64_t)_setSigners:()SMIMEDecodingPrivate
{
  return MEMORY[0x1F412C190](a1, a1 + (int)*MEMORY[0x1E4F73620], @"x-apple-smime-signers", a3);
}

- (BOOL)_needsSignatureVerification:()SMIMEDecodingPrivate
{
  uint64_t v5 = (int)*MEMORY[0x1E4F73620];
  uint64_t v6 = [*(id *)(a1 + v5) objectForKey:@"x-apple-smime-error"];
  *a3 = v6;
  return !v6 && [*(id *)(a1 + v5) objectForKey:@"x-apple-smime-signers"] == 0;
}

@end