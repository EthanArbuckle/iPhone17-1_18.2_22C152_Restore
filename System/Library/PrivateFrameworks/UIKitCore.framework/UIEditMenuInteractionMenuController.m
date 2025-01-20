@interface UIEditMenuInteractionMenuController
@end

@implementation UIEditMenuInteractionMenuController

uint64_t __64___UIEditMenuInteractionMenuController_setMenuVisible_animated___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    [v3 _prepareEditMenuInteractionIfNeeded];
    v4 = *(void **)(a1 + 32);
    return [v4 _presentEditMenu];
  }
  else
  {
    return [v3 _dismissEditMenu];
  }
}

void __101___UIEditMenuInteractionMenuController_editMenuInteraction_willPresentMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"UIMenuControllerDidShowMenuNotification" object:*(void *)(a1 + 32)];
}

void __101___UIEditMenuInteractionMenuController_editMenuInteraction_willDismissMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isDisplayingMenu] & 1) == 0)
  {
    id v2 = [*(id *)(a1 + 32) view];
    [v2 removeInteraction:*(void *)(a1 + 32)];

    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    if (v3 == *(void **)(v4 + 24))
    {
      *(void *)(v4 + 24) = 0;
    }
  }
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"UIMenuControllerDidHideMenuNotification" object:*(void *)(a1 + 40)];
}

@end