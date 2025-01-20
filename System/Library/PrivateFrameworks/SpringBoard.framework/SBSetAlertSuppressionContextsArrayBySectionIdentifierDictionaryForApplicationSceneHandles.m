@interface SBSetAlertSuppressionContextsArrayBySectionIdentifierDictionaryForApplicationSceneHandles
@end

@implementation SBSetAlertSuppressionContextsArrayBySectionIdentifierDictionaryForApplicationSceneHandles

void ___SBSetAlertSuppressionContextsArrayBySectionIdentifierDictionaryForApplicationSceneHandles_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = a2;
  id v7 = [v5 setWithArray:a3];
  [v4 setObject:v7 forKey:v6];
}

@end