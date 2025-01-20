@interface PXDragAndDropFileProviderDomain
@end

@implementation PXDragAndDropFileProviderDomain

uint64_t ___PXDragAndDropFileProviderDomain_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F25DC0]);
  v1 = PXLocalizedStringFromTable(@"DRAG_AND_DROP_FILE_PROVIDER_DOMAIN_TITLE", @"PhotosUICore");
  uint64_t v2 = [v0 initWithIdentifier:@"draganddrop" displayName:v1 pathRelativeToDocumentStorage:@"draganddrop" hidden:1];
  v3 = (void *)_PXDragAndDropFileProviderDomain_domain;
  _PXDragAndDropFileProviderDomain_domain = v2;

  v4 = (void *)_PXDragAndDropFileProviderDomain_domain;
  return PXCreateDirectoryForFileProviderDomain(v4, 0);
}

@end