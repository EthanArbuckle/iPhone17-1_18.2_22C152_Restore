@interface CIImage(NUDigest)
- (void)nu_updateDigest:()NUDigest;
@end

@implementation CIImage(NUDigest)

- (void)nu_updateDigest:()NUDigest
{
  id v4 = a3;
  uint64_t v5 = [a1 hash];
  [v4 addString:@"CIImage<"];
  [v4 addBytes:&v5 length:8];
  [v4 addString:@">"];
}

@end