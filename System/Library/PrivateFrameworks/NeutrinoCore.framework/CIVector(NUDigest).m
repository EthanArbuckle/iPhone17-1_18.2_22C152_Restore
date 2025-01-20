@interface CIVector(NUDigest)
- (void)nu_updateDigest:()NUDigest;
@end

@implementation CIVector(NUDigest)

- (void)nu_updateDigest:()NUDigest
{
  id v4 = a3;
  objc_msgSend(v4, "addCString:", "CIVector(");
  uint64_t v5 = [a1 count];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
    {
      uint64_t v9 = 0;
      [a1 valueAtIndex:i];
      uint64_t v9 = v8;
      [v4 addBytes:&v9 length:8];
    }
  }
  [v4 addCString:"]");
}

@end