@interface NSString(NUDigest)
- (uint64_t)nu_updateDigest:()NUDigest;
@end

@implementation NSString(NUDigest)

- (uint64_t)nu_updateDigest:()NUDigest
{
  return [a3 addString:a1];
}

@end