@interface SMHandle
@end

@implementation SMHandle

void __58__SMHandle_RTCoreDataTransformable__createWithSMHandleMO___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) secondaryHandles];
  uint64_t v3 = [v2 array];
  v4 = (void *)v3;
  v5 = (void *)MEMORY[0x1E4F1CBF0];
  if (v3) {
    v5 = (void *)v3;
  }
  id v6 = v5;

  id v7 = objc_alloc(MEMORY[0x1E4F99888]);
  id v11 = [*(id *)(a1 + 32) primaryHandle];
  uint64_t v8 = [v7 initWithPrimaryHandle:v11 secondaryHandles:v6];

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

@end