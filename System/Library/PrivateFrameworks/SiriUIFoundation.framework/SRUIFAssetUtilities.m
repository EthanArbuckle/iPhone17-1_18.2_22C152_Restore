@interface SRUIFAssetUtilities
+ (id)sharedInstance;
- (SRUIFAssetUtilities)init;
- (void)downloadAssets;
@end

@implementation SRUIFAssetUtilities

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__SRUIFAssetUtilities_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, block);
  }
  v2 = (void *)sharedInstance_sSharedInstance;
  return v2;
}

uint64_t __37__SRUIFAssetUtilities_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sSharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (SRUIFAssetUtilities)init
{
  v6.receiver = self;
  v6.super_class = (Class)SRUIFAssetUtilities;
  v2 = [(SRUIFAssetUtilities *)&v6 init];
  if (v2)
  {
    v3 = (UAFAssetUtilities *)objc_alloc_init(MEMORY[0x263F84088]);
    assetUtilities = v2->_assetUtilities;
    v2->_assetUtilities = v3;
  }
  return v2;
}

- (void)downloadAssets
{
}

- (void).cxx_destruct
{
}

@end