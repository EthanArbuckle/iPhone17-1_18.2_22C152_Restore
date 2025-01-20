@interface TVStackCommonTemplateController
@end

@implementation TVStackCommonTemplateController

void __44___TVStackCommonTemplateController_loadView__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v4 = objc_loadWeakRetained(&to);

  if (v4)
  {
    id v5 = objc_loadWeakRetained(&to);
    [v5 _updateViewLayout];

    id v6 = objc_loadWeakRetained(&to);
    objc_msgSend(v3, "setSupplementaryCellSection:", objc_msgSend(v6, "_supplementaryViewSectionIndex"));

    id v7 = objc_loadWeakRetained(&to);
    v8 = [v7 stackWrappingView];
    v9 = [v8 supplementaryCellLayoutAttributes];
    [v3 setSupplementaryCellLayoutAttributes:v9];
  }
  objc_destroyWeak(&to);
}

void __56___TVStackCommonTemplateController_scrollViewDidScroll___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v2 = [v5 viewController];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [v5 viewController];
    [v4 performSelector:sel__cancelImpressionsUpdate];
  }
}

void __97___TVStackCommonTemplateController__updateSupplementaryViewControllersWithElements_updateStyles___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 supplementaryViewControllers];
  id v9 = [v7 objectAtIndexedSubscript:a3];

  v8 = [*(id *)(a1 + 32) viewControllerWithElement:v6 layout:0 existingController:v9];
}

uint64_t __65___TVStackCommonTemplateController__updateViewSupplementaryViews__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSemanticContentAttribute:*(void *)(a1 + 32)];
}

@end