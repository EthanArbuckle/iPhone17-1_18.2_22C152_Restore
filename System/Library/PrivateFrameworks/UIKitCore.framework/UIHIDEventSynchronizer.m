@interface UIHIDEventSynchronizer
@end

@implementation UIHIDEventSynchronizer

uint64_t __57___UIHIDEventSynchronizer__processInitialDigitizerEvent___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  *a4 = 1;
  return result;
}

uint64_t __47___UIHIDEventSynchronizer__logPerformanceData___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  *a4 = 1;
  return result;
}

void __50___UIHIDEventSynchronizer__processDigitizerEvent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v9 = [NSNumber numberWithLong:IOHIDEventGetIntegerValue()];
  v7 = [*(id *)(*(void *)(a1 + 32) + 72) pathId];
  int v8 = [v7 isEqual:v9];

  if (v8)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    *a4 = 1;
  }
}

@end