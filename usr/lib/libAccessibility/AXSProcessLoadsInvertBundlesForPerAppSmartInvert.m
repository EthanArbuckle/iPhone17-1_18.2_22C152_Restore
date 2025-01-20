@interface AXSProcessLoadsInvertBundlesForPerAppSmartInvert
@end

@implementation AXSProcessLoadsInvertBundlesForPerAppSmartInvert

void ___AXSProcessLoadsInvertBundlesForPerAppSmartInvert_block_invoke()
{
  v2[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"com.apple.springboard";
  v2[1] = @"com.apple.iMessageAppsViewService";
  v2[2] = @"com.apple.Animoji.StickersApp.MessagesExtension";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:3];
  v1 = (void *)_AXSProcessLoadsInvertBundlesForPerAppSmartInvert_appIDs;
  _AXSProcessLoadsInvertBundlesForPerAppSmartInvert_appIDs = v0;
}

@end