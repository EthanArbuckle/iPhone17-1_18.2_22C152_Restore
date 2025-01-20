@interface UIHIDTransformer
@end

@implementation UIHIDTransformer

void __37___UIHIDTransformer_initWithRunLoop___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 userInfo];
  v4 = [v3 objectForKeyedSubscript:@"contextId"];

  if (v4)
  {
    v5 = (const void *)*MEMORY[0x1E4F1D410];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __37___UIHIDTransformer_initWithRunLoop___block_invoke_2;
    v7[3] = &unk_1E52D9F98;
    v6 = *(__CFRunLoop **)(a1 + 40);
    id v8 = *(id *)(a1 + 32);
    id v9 = v4;
    CFRunLoopPerformBlock(v6, v5, v7);
  }
}

uint64_t __37___UIHIDTransformer_initWithRunLoop___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(a1 + 40)];
}

@end