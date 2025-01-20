@interface AX
@end

@implementation AX

void __AX_USING_LEGACY_LOADER_block_invoke()
{
  id v0 = [MEMORY[0x1E4F49458] sharedInstance];
  AX_USING_LEGACY_LOADER__UsesLegacyLoader = [v0 useNewAXBundleLoader] ^ 1;
}

@end