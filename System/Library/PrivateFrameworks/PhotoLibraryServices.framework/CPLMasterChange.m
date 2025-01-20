@interface CPLMasterChange
@end

@implementation CPLMasterChange

BOOL __70__CPLMasterChange_BatchUploader__hasResourceOfType_notInMasterChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 resourceType] == *(void *)(a1 + 32);
}

@end