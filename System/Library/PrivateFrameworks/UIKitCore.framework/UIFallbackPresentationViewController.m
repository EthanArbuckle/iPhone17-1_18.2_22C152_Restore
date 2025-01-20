@interface UIFallbackPresentationViewController
@end

@implementation UIFallbackPresentationViewController

void __85___UIFallbackPresentationViewController__presentViewController_sendingView_animated___block_invoke(void *a1)
{
  id v2 = *(id *)(a1[4] + 984);
  v3 = [v2 rootViewController];
  v4 = [v3 presentedViewController];

  if (!v4)
  {
    [*(id *)(*(void *)(a1[6] + 8) + 40) setRotationDecider:0];
    uint64_t v5 = *(void *)(*(void *)(a1[6] + 8) + 40);
    if (v5)
    {
      *(void *)(v5 + 264) = 0;
      v6 = *(void **)(*(void *)(a1[6] + 8) + 40);
    }
    else
    {
      v6 = 0;
    }
    v7 = [v6 view];
    [v7 removeFromSuperview];

    [v2 setHidden:1];
    [v2 setRootViewController:0];
    uint64_t v8 = a1[4];
    v9 = *(void **)(v8 + 984);
    *(void *)(v8 + 984) = 0;

    _RestoreKeyWindow();
    [*(id *)(*(void *)(a1[6] + 8) + 40) _restoreInputViewsAnimated:1];
    uint64_t v10 = a1[5];
    if (v10)
    {
      v11 = *(void (**)(void))(v10 + 16);
      v11();
    }
  }
}

void __94___UIFallbackPresentationViewController__dismissViewControllerWithTransition_from_completion___block_invoke(uint64_t a1)
{
  VisibleViewController(*(void **)(a1 + 32));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = [v5 dismissCompletionHandler];
    v3 = (void *)v2;
    if (v2) {
      (*(void (**)(uint64_t))(v2 + 16))(v2);
    }
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
}

@end