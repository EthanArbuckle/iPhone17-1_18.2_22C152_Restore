@interface PXTapToRadarDiagnosticCollectionOperation
@end

@implementation PXTapToRadarDiagnosticCollectionOperation

uint64_t __71___PXTapToRadarDiagnosticCollectionOperation_installCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(*(void *)(a1 + 32) + 18), *(void *)(*(void *)(a1 + 32) + 24));
}

void __67___PXTapToRadarDiagnosticCollectionOperation_initWithName_timeout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _timedOut];
}

@end