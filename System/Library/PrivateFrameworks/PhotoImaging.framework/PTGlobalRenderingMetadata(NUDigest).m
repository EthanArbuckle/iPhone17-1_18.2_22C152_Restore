@interface PTGlobalRenderingMetadata(NUDigest)
- (void)nu_updateDigest:()NUDigest;
@end

@implementation PTGlobalRenderingMetadata(NUDigest)

- (void)nu_updateDigest:()NUDigest
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5[0] = [a1 majorVersion];
  v5[1] = [a1 minorVersion];
  v5[2] = [a1 renderingVersion];
  [v4 addBytes:v5 length:12];
}

@end