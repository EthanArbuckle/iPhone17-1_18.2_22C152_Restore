@interface NUStyleEngine
@end

@implementation NUStyleEngine

uint64_t __106___NUStyleEngine_usingSharedStyleEngineForUsage_withMetalCommandQueue_configuration_tuningParams_perform___block_invoke(void *a1, void *a2)
{
  return [a2 matchesUsage:a1[4] metalCommandQueue:a1[5] configuration:a1[6] tuning:a1[7]];
}

uint64_t __106___NUStyleEngine_usingSharedStyleEngineForUsage_withMetalCommandQueue_configuration_tuningParams_perform___block_invoke_658(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 processor];
  [v5 setExternalMemoryResource:v4];

  uint64_t v6 = *(void *)(a1 + 40);
  v7 = [*(id *)(a1 + 32) processor];
  uint64_t v8 = (*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  return v8;
}

@end