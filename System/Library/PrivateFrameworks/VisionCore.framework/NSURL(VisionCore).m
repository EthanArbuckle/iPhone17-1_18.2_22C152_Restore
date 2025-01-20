@interface NSURL(VisionCore)
- (id)VisionCoreFileSystemPathAndReturnError:()VisionCore;
@end

@implementation NSURL(VisionCore)

- (id)VisionCoreFileSystemPathAndReturnError:()VisionCore
{
  v4 = [a1 filePathURL];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = [v6 fileSystemRepresentation];
    if (v7)
    {
      v8 = (void *)[[NSString alloc] initWithUTF8String:v7];
      goto LABEL_9;
    }
    if (a3)
    {
      v9 = (void *)[[NSString alloc] initWithFormat:@"could not obtain file system representation for %@", v6];
      *a3 = [MEMORY[0x263F087E8] VisionCoreErrorForInternalErrorWithLocalizedDescription:v9];
    }
  }
  else if (a3)
  {
    [MEMORY[0x263F087E8] VisionCoreErrorForInvalidArgumentWithLocalizedDescription:@"file URL was not provided"];
    v8 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v8 = 0;
LABEL_9:

  return v8;
}

@end