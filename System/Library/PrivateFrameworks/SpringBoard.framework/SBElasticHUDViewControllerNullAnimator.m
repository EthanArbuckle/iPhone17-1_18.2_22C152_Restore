@interface SBElasticHUDViewControllerNullAnimator
@end

@implementation SBElasticHUDViewControllerNullAnimator

id __47___SBElasticHUDViewControllerNullAnimator_init__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc(MEMORY[0x1E4F43008]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47___SBElasticHUDViewControllerNullAnimator_init__block_invoke_2;
  v10[3] = &unk_1E6AF4AC0;
  id v4 = v2;
  id v11 = v4;
  v5 = (void *)[v3 initWithDuration:3 curve:v10 animations:0.001];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47___SBElasticHUDViewControllerNullAnimator_init__block_invoke_3;
  v8[3] = &unk_1E6AF8788;
  id v9 = v4;
  id v6 = v4;
  [v5 addCompletion:v8];

  return v5;
}

void __47___SBElasticHUDViewControllerNullAnimator_init__block_invoke_2(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  id v8 = [*(id *)(a1 + 32) viewControllerForKey:*MEMORY[0x1E4F43EC0]];
  id v2 = [*(id *)(a1 + 32) viewControllerForKey:*MEMORY[0x1E4F43EB0]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v8 view];
    id v4 = [*(id *)(a1 + 32) containerView];
    [v4 bounds];
    objc_msgSend(v3, "setFrame:");

    v5 = [*(id *)(a1 + 32) containerView];
    id v6 = [v8 view];
    [v5 addSubview:v6];
  }
  v7 = [v2 view];
  [v7 removeFromSuperview];

  [MEMORY[0x1E4F39CF8] commit];
}

uint64_t __47___SBElasticHUDViewControllerNullAnimator_init__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransition:1];
}

@end