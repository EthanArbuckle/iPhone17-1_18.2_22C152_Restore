@interface NSURL(VisionCoreE5RT)
- (uint64_t)VisionCoreE5RTPathAndReturnError:()VisionCoreE5RT;
@end

@implementation NSURL(VisionCoreE5RT)

- (uint64_t)VisionCoreE5RTPathAndReturnError:()VisionCoreE5RT
{
  id v4 = a1;
  uint64_t v5 = [v4 fileSystemRepresentation];
  uint64_t v6 = v5;
  if (a3 && !v5)
  {
    char v7 = [v4 isFileURL];
    id v8 = [NSString alloc];
    if (v7)
    {
      v9 = (void *)[v8 initWithFormat:@"%@ cannot be resolved into a file system pathname", v4];
      [MEMORY[0x263F087E8] VisionCoreErrorForInvalidArgumentWithLocalizedDescription:v9];
    }
    else
    {
      v9 = (void *)[v8 initWithFormat:@"%@ does not specify a file", v4];
      [MEMORY[0x263F087E8] VisionCoreErrorForUnavailableResourceWithLocalizedDescription:v9];
    }
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

@end