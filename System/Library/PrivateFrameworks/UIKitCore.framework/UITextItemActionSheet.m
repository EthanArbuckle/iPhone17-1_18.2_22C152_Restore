@interface UITextItemActionSheet
@end

@implementation UITextItemActionSheet

void __54___UITextItemActionSheet__alertActionsWithController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2050000000;
  v4 = (void *)_MergedGlobals_1051;
  uint64_t v14 = _MergedGlobals_1051;
  if (!_MergedGlobals_1051)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __getDDDetectionControllerClass_block_invoke_0;
    v10[3] = &unk_1E52D9900;
    v10[4] = &v11;
    __getDDDetectionControllerClass_block_invoke_0((uint64_t)v10);
    v4 = (void *)v12[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v11, 8);
  v6 = [v5 sharedController];
  uint64_t v7 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = objc_loadWeakRetained((id *)(a1 + 48));
  [v6 performAction:v7 fromView:WeakRetained alertController:v9 interactionDelegate:0];
}

uint64_t __54___UITextItemActionSheet__alertActionsWithController___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) hasUserInterface] ^ 1;
}

@end