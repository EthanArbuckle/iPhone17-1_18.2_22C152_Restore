@interface NSString(MFDirectoryPathUtils)
- (uint64_t)mf_isSubdirectoryOfPath:()MFDirectoryPathUtils;
- (uint64_t)mf_makeDirectoryWithMode:()MFDirectoryPathUtils;
@end

@implementation NSString(MFDirectoryPathUtils)

- (uint64_t)mf_makeDirectoryWithMode:()MFDirectoryPathUtils
{
  v5 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  return objc_msgSend(v5, "mf_makeCompletePath:mode:", a1, a3);
}

- (uint64_t)mf_isSubdirectoryOfPath:()MFDirectoryPathUtils
{
  v3 = a3;
  if (([a3 hasSuffix:@"/"] & 1) == 0) {
    v3 = (void *)[v3 stringByAppendingString:@"/"];
  }
  return [a1 hasPrefix:v3];
}

@end