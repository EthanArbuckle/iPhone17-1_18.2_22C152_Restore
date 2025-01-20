@interface PHObject
@end

@implementation PHObject

void __68__PHObject_PhotosUICore___px_initializeUserInterfaceIdentifierCache__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
  v1 = (void *)_PXUserInterfaceIdentifierCache;
  _PXUserInterfaceIdentifierCache = v0;

  _PXUserInterfaceIdentifierCacheLock = 0;
}

@end