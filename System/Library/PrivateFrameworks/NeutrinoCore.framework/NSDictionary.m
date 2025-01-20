@interface NSDictionary
@end

@implementation NSDictionary

void __77__NSDictionary_NURenderPipelineFunction__nu_evaluateWithPipelineState_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id obj = 0;
  v10 = objc_msgSend(a3, "nu_evaluateWithPipelineState:error:", v8, &obj);
  objc_storeStrong(v9, obj);
  if (v10)
  {
    [*(id *)(a1 + 40) setObject:v10 forKey:v7];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    *a4 = 0;
  }
}

@end