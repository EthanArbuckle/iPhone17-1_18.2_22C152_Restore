@interface PXBoopPhotosFileProviderRegisterConfiguration
@end

@implementation PXBoopPhotosFileProviderRegisterConfiguration

uint64_t ___PXBoopPhotosFileProviderRegisterConfiguration_block_invoke()
{
  v0 = [[PXPhotosFileProviderRegisterConfiguration alloc] initWithUsage:2];
  v1 = (void *)_PXBoopPhotosFileProviderRegisterConfiguration_configuration;
  _PXBoopPhotosFileProviderRegisterConfiguration_configuration = (uint64_t)v0;

  v2 = (void *)_PXBoopPhotosFileProviderRegisterConfiguration_configuration;
  return [v2 setClientEncodingPolicy:1];
}

@end