@interface NSNull(NUDigest)
- (uint64_t)nu_updateDigest:()NUDigest;
@end

@implementation NSNull(NUDigest)

- (uint64_t)nu_updateDigest:()NUDigest
{
  return [a3 addCString:"<NSNull>"];
}

@end