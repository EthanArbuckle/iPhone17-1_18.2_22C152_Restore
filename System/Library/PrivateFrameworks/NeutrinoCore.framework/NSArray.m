@interface NSArray
@end

@implementation NSArray

void __72__NSArray_NURenderPipelineFunction__nu_evaluateWithPipelineState_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id obj = 0;
  v8 = objc_msgSend(a2, "nu_evaluateWithPipelineState:error:", v6, &obj);
  objc_storeStrong(v7, obj);
  if (v8)
  {
    [*(id *)(a1 + 40) addObject:v8];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    *a4 = 0;
  }
}

@end