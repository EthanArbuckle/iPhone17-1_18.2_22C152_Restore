@interface PXImportConcurrentActionManager
@end

@implementation PXImportConcurrentActionManager

void __50___PXImportConcurrentActionManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(_PXImportConcurrentActionManager);
  v1 = (void *)sharedInstance_sharedInstance_36279;
  sharedInstance_sharedInstance_36279 = (uint64_t)v0;
}

@end