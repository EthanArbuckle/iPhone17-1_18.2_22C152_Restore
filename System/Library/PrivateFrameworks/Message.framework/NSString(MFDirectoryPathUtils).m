@interface NSString(MFDirectoryPathUtils)
- (uint64_t)mf_isSubdirectoryOfPath:()MFDirectoryPathUtils;
- (uint64_t)mf_makeDirectoryWithMode:()MFDirectoryPathUtils;
@end

@implementation NSString(MFDirectoryPathUtils)

- (uint64_t)mf_makeDirectoryWithMode:()MFDirectoryPathUtils
{
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v6 = objc_msgSend(v5, "mf_makeCompletePath:mode:", a1, a3);

  return v6;
}

- (uint64_t)mf_isSubdirectoryOfPath:()MFDirectoryPathUtils
{
  id v4 = a3;
  if (([v4 hasSuffix:@"/"] & 1) == 0)
  {
    uint64_t v5 = [v4 stringByAppendingString:@"/"];

    id v4 = (id)v5;
  }
  uint64_t v6 = [a1 hasPrefix:v4];

  return v6;
}

@end