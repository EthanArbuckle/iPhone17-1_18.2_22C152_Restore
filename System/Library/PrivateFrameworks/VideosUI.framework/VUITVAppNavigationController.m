@interface VUITVAppNavigationController
@end

@implementation VUITVAppNavigationController

uint64_t __50___VUITVAppNavigationController_dismissAllModals___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __81___VUITVAppNavigationController__notifyObserversOfViewControllerChange_animated___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = [WeakRetained viewControllers];
    uint64_t v5 = [v4 count];

    if (*(void *)(a1 + 40) != v5)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      v6 = objc_msgSend(v3[179], "allObjects", 0);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v6);
            }
            [*(id *)(*((void *)&v11 + 1) + 8 * v10++) numberOfChildControllersDidChangeFor:v3 from:*(void *)(a1 + 40) to:v5 animated:*(unsigned __int8 *)(a1 + 48)];
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v8);
      }
    }
  }
}

void __83___VUITVAppNavigationController_iOS__accessibilityButtonBackgroundDefaultTintColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.15];
  v1 = (void *)_accessibilityButtonBackgroundDefaultTintColor_defaultTintColor;
  _accessibilityButtonBackgroundDefaultTintColor_defaultTintColor = v0;
}

@end