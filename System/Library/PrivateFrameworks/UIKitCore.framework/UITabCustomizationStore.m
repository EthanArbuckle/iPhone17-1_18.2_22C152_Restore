@interface UITabCustomizationStore
@end

@implementation UITabCustomizationStore

void __72___UITabCustomizationStore_customizationStoreWithPersistenceIdentifier___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  v1 = (void *)_MergedGlobals_1123;
  _MergedGlobals_1123 = v0;
}

uint64_t __63___UITabCustomizationStore__saveCustomizationForTab_recursive___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

@end