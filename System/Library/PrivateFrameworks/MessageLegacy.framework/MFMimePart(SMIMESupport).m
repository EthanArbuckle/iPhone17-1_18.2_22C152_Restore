@interface MFMimePart(SMIMESupport)
- (id)SMIMEError;
- (uint64_t)copySigners;
@end

@implementation MFMimePart(SMIMESupport)

- (id)SMIMEError
{
  id v1 = (id)[*(id *)(a1 + (int)*MEMORY[0x1E4F73620]) objectForKey:@"x-apple-smime-error"];
  return v1;
}

- (uint64_t)copySigners
{
  id v1 = (void *)[*(id *)(a1 + (int)*MEMORY[0x1E4F73620]) objectForKey:@"x-apple-smime-signers"];
  return [v1 copy];
}

@end