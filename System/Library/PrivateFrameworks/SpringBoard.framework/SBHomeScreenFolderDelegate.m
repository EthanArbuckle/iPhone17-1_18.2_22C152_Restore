@interface SBHomeScreenFolderDelegate
@end

@implementation SBHomeScreenFolderDelegate

uint64_t __76___SBHomeScreenFolderDelegate_backgroundViewForDockForRootFolderController___block_invoke(uint64_t a1, void *a2)
{
  double v2 = dbl_1D8FD29F0[[a2 userInterfaceStyle] == 2];
  v3 = (void *)MEMORY[0x1E4F428B8];
  return [v3 colorWithWhite:v2 alpha:0.6];
}

@end