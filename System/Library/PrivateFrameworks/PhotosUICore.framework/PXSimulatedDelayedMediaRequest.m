@interface PXSimulatedDelayedMediaRequest
@end

@implementation PXSimulatedDelayedMediaRequest

void __61___PXSimulatedDelayedMediaRequest_handleOriginalResult_info___block_invoke(uint64_t a1, double a2)
{
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(*(double *)(*(void *)(a1 + 32) + 32) * a2 * 1000000000.0));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61___PXSimulatedDelayedMediaRequest_handleOriginalResult_info___block_invoke_2;
  v5[3] = &unk_1E5DD08D8;
  v5[4] = *(void *)(a1 + 32);
  *(double *)&v5[5] = a2;
  dispatch_after(v4, MEMORY[0x1E4F14428], v5);
}

uint64_t __61___PXSimulatedDelayedMediaRequest_handleOriginalResult_info___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _produceFinalCallback];
}

uint64_t __61___PXSimulatedDelayedMediaRequest_handleOriginalResult_info___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDelayFraction:*(double *)(a1 + 40)];
}

@end