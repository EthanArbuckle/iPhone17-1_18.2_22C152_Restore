@interface SiriCoreSharedResourcesDirectory
@end

@implementation SiriCoreSharedResourcesDirectory

void ___SiriCoreSharedResourcesDirectory_block_invoke()
{
  CPSharedResourcesDirectory();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 stringByAppendingPathComponent:@"Library/Assistant"];
  v1 = (void *)_SiriCoreSharedResourcesDirectory_sUserSupportDirectoryPath;
  _SiriCoreSharedResourcesDirectory_sUserSupportDirectoryPath = v0;
}

@end