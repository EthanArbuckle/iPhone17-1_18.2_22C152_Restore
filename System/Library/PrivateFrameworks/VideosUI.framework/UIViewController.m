@interface UIViewController
@end

@implementation UIViewController

void __47__UIViewController_VideosUI__vui_ppt_isLoading__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v6 = [a2 subviews];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__UIViewController_VideosUI__vui_ppt_isLoading__block_invoke_2;
  v7[3] = &unk_1E6DF8350;
  v7[4] = *(void *)(a1 + 32);
  v7[5] = a4;
  [v6 enumerateObjectsUsingBlock:v7];
}

void __47__UIViewController_VideosUI__vui_ppt_isLoading__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    **(unsigned char **)(a1 + 40) = 1;
    *a4 = 1;
  }
}

Class __63__UIViewController_VideosUI___vui_TVLoadingViewControllerClass__block_invoke()
{
  Class result = NSClassFromString(&cfstr_Tvloadingviewc.isa);
  _vui_TVLoadingViewControllerClass___loadingViewClass = (uint64_t)result;
  return result;
}

uint64_t __76__UIViewController_VideosUI__vui_presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

@end