@interface PXBoopFileProviderDomain
@end

@implementation PXBoopFileProviderDomain

uint64_t ___PXBoopFileProviderDomain_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F25DC0]);
  v1 = PXLocalizedStringFromTable(@"BOOP_FILE_PROVIDER_DOMAIN_TITLE", @"PhotosUICore");
  uint64_t v2 = [v0 initWithIdentifier:@"boop" displayName:v1 pathRelativeToDocumentStorage:@"boop" hidden:1];
  v3 = (void *)_PXBoopFileProviderDomain_domain;
  _PXBoopFileProviderDomain_domain = v2;

  v4 = (void *)_PXBoopFileProviderDomain_domain;
  return PXCreateDirectoryForFileProviderDomain(v4, 0);
}

@end