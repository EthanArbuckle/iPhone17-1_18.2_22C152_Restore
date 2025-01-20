@interface UISplitViewController
@end

@implementation UISplitViewController

void __99__UISplitViewController_PXProgrammaticNavigation__navigateToDestination_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = v5;
  if ((unint64_t)(a2 - 2) < 4)
  {
    id v8 = v5;
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_7:
    v6 = v8;
    goto LABEL_8;
  }
  if (a2 == 1)
  {
    id v8 = v5;
    [*(id *)(a1 + 40) navigateToDestination:*(void *)(a1 + 48) options:*(void *)(a1 + 72) completionHandler:*(void *)(a1 + 56)];
    goto LABEL_7;
  }
  if (!a2)
  {
    v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v5);
    [v7 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"UIViewController+PXProgrammaticNavigation.m" lineNumber:434 description:@"Code which should be unreachable has been reached"];

    abort();
  }
LABEL_8:
}

@end