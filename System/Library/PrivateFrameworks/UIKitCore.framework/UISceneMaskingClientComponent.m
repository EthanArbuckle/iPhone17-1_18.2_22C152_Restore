@interface UISceneMaskingClientComponent
@end

@implementation UISceneMaskingClientComponent

void __60___UISceneMaskingClientComponent_performWhileMasked_reason___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v2();
  }
  else
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __60___UISceneMaskingClientComponent_performWhileMasked_reason___block_invoke_2;
    v4[3] = &unk_1E52DB330;
    id v3 = *(id *)(a1 + 32);
    id v5 = 0;
    id v6 = v3;
    +[UIView performWithoutAnimation:v4];
  }
}

uint64_t __60___UISceneMaskingClientComponent_performWhileMasked_reason___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __60___UISceneMaskingClientComponent_performWhileMasked_reason___block_invoke_3(uint64_t a1)
{
  id v4 = +[_UISceneMaskingAction invalidationAction];
  v2 = [*(id *)(a1 + 32) scene];
  id v3 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
  [v2 sendPrivateActions:v3];
}

@end