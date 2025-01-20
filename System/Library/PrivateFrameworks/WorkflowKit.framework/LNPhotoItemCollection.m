@interface LNPhotoItemCollection
@end

@implementation LNPhotoItemCollection

uint64_t __59__LNPhotoItemCollection_Workflow__serializedRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializedRepresentation];
}

id __95__LNPhotoItemCollection_Workflow__initWithSerializedRepresentation_variableProvider_parameter___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F72D08];
  id v3 = a2;
  v4 = (void *)[[v2 alloc] initWithSerializedRepresentation:v3];

  return v4;
}

@end