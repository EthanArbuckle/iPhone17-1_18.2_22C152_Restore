@interface NSURL(OCPURLAdditions)
+ (id)URLWithPackagePart:()OCPURLAdditions;
- (BOOL)isInternalToPackage;
- (uint64_t)initWithPackagePart:()OCPURLAdditions;
@end

@implementation NSURL(OCPURLAdditions)

+ (id)URLWithPackagePart:()OCPURLAdditions
{
  id v4 = a3;
  v5 = (void *)[[a1 alloc] initWithPackagePart:v4];

  return v5;
}

- (uint64_t)initWithPackagePart:()OCPURLAdditions
{
  id v4 = a3;
  if (([v4 isAbsolutePath] & 1) == 0)
  {
    uint64_t v5 = [@"/" stringByAppendingPathComponent:v4];

    id v4 = (id)v5;
  }
  uint64_t v6 = [a1 initWithString:v4];

  return v6;
}

- (BOOL)isInternalToPackage
{
  v2 = [a1 host];
  if (v2)
  {
    BOOL v3 = 0;
  }
  else
  {
    id v4 = [a1 scheme];
    BOOL v3 = v4 == 0;
  }
  return v3;
}

@end