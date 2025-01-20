@interface PBUIWallpaperRemoteViewControllerSceneWorkspace
@end

@implementation PBUIWallpaperRemoteViewControllerSceneWorkspace

uint64_t ___PBUIWallpaperRemoteViewControllerSceneWorkspace_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F624B0]) initWithIdentifier:@"PBUIWallpaperWorkspace"];
  uint64_t v1 = _PBUIWallpaperRemoteViewControllerSceneWorkspace_workspace;
  _PBUIWallpaperRemoteViewControllerSceneWorkspace_workspace = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end