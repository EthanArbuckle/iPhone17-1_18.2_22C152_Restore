@interface PXSimulatedMediaRequest
@end

@implementation PXSimulatedMediaRequest

uint64_t __56___PXSimulatedMediaRequest_initWithWrappedMediaRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handleOriginalResult:a2 info:a3];
}

void __75___PXSimulatedMediaRequest_initWithOriginalOptions_simulatedResultHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, double a5)
{
  v8 = (id *)(a1 + 32);
  id v9 = a4;
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained(v8);
  [WeakRetained handleOriginalProgress:v10 error:a3 stop:v9 info:a5];
}

@end