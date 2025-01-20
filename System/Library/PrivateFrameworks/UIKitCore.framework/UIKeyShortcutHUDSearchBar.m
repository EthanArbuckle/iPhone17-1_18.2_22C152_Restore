@interface UIKeyShortcutHUDSearchBar
@end

@implementation UIKeyShortcutHUDSearchBar

void __49___UIKeyShortcutHUDSearchBar__createCancelButton__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v4 = objc_loadWeakRetained(&to);

  if (v4)
  {
    id v5 = objc_loadWeakRetained(&to);
    v6 = [v5 delegate];
    id v7 = objc_loadWeakRetained(&to);
    [v6 searchBarDidPressCancelButton:v7];
  }
  objc_destroyWeak(&to);
}

@end