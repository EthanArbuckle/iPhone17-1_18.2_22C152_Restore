@interface UIKeyShortcutHUDModel
@end

@implementation UIKeyShortcutHUDModel

uint64_t __36___UIKeyShortcutHUDModel__buildMenu__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 identifier];
  uint64_t v3 = [v2 isEqualToString:@"com.apple.menu.application"];

  return v3;
}

void __36___UIKeyShortcutHUDModel__buildMenu__block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    [*(id *)(a1 + 32) addObject:v8];
    uint64_t v3 = *(void **)(a1 + 40);
    v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "_enumerationPriority"));
    v5 = [v3 objectForKeyedSubscript:v4];

    if (v5)
    {
      [v5 addObject:v8];
    }
    else
    {
      v5 = [MEMORY[0x1E4F1CA48] arrayWithObject:v8];
      v6 = *(void **)(a1 + 40);
      v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "_enumerationPriority"));
      [v6 setObject:v5 forKeyedSubscript:v7];
    }
  }
}

uint64_t __72___UIKeyShortcutHUDModel__responderBasedKeyCommandsStartingAtResponder___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __44___UIKeyShortcutHUDModel__sanitizedMainMenu__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _menuByOmittingNonKeyCommandsInMenu:a2];
  [*(id *)(a1 + 40) addObject:v3];
}

void __44___UIKeyShortcutHUDModel__sanitizedMainMenu__block_invoke_2()
{
  v0 = _UIKeyShortcutHUDLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl(&dword_1853B0000, v0, OS_LOG_TYPE_ERROR, "Main root menu cannot have non-UIMenu children. Ignoring a child.", v1, 2u);
  }
}

void __62___UIKeyShortcutHUDModel__menuByOmittingNonKeyCommandsInMenu___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _menuByOmittingNonKeyCommandsInMenu:a2];
  [*(id *)(a1 + 40) addObject:v3];
}

void __62___UIKeyShortcutHUDModel__menuByOmittingNonKeyCommandsInMenu___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = (void *)[v6 _mutableCopy];
    [*(id *)(a1 + 32) addObject:v5];
  }
}

void __60___UIKeyShortcutHUDModel__enumerateKeyCommandsInMenu_block___block_invoke(uint64_t a1, uint64_t a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60___UIKeyShortcutHUDModel__enumerateKeyCommandsInMenu_block___block_invoke_2;
  v4[3] = &unk_1E52F3790;
  id v3 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v3 _enumerateKeyCommandsInMenu:a2 block:v4];
}

uint64_t __60___UIKeyShortcutHUDModel__enumerateKeyCommandsInMenu_block___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __60___UIKeyShortcutHUDModel__enumerateKeyCommandsInMenu_block___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __54___UIKeyShortcutHUDModel__validatedHUDMenuFromUIMenu___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _validatedHUDMenuFromUIMenu:a2];
  [*(id *)(a1 + 40) addObject:v3];
}

void __54___UIKeyShortcutHUDModel__validatedHUDMenuFromUIMenu___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:a2];
  if (v3)
  {
    v4 = v3;
    [*(id *)(a1 + 40) addObject:v3];
    id v3 = v4;
  }
}

uint64_t __68___UIKeyShortcutHUDModel__addShortcutsFromHUDMenu_toShortcutsArray___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _addShortcutsFromHUDMenu:a2 toShortcutsArray:*(void *)(a1 + 40)];
}

uint64_t __68___UIKeyShortcutHUDModel__addShortcutsFromHUDMenu_toShortcutsArray___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

@end