@interface SFSafariNonContaineredSettingsDirectoryPath
@end

@implementation SFSafariNonContaineredSettingsDirectoryPath

void ___SFSafariNonContaineredSettingsDirectoryPath_block_invoke()
{
  uint64_t v0 = [(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"Library/Safari/"];
  v1 = (void *)_SFSafariNonContaineredSettingsDirectoryPath::path;
  _SFSafariNonContaineredSettingsDirectoryPath::path = v0;
}

@end