@interface UIAsyncInvocation
@end

@implementation UIAsyncInvocation

uint64_t __28___UIAsyncInvocation_invoke__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  v6 = __28___UIAsyncInvocation_invoke__block_invoke_2;
  v7 = &unk_1E52D9F70;
  uint64_t v8 = v1;
  return (*(uint64_t (**)(void))(v2 + 16))();
}

void __28___UIAsyncInvocation_invoke__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(unint64_t **)(a1 + 32);
  uint64_t v2 = (void *)atomic_load(v1 + 1);
  v3 = v1;
  [v2 _didCompleteInvocation];
}

uint64_t __37___UIAsyncInvocation_emptyInvocation__block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

@end