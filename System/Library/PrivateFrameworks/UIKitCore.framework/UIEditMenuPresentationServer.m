@interface UIEditMenuPresentationServer
@end

@implementation UIEditMenuPresentationServer

void __57___UIEditMenuPresentationServer_sharedPresentationServer__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)qword_1EB262EC8;
  qword_1EB262EC8 = v0;
}

void __84___UIEditMenuPresentationServer__editMenuPresentation_didSelectMenuLeaf_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = [_UIOMenuLeafPerformAction alloc];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84___UIEditMenuPresentationServer__editMenuPresentation_didSelectMenuLeaf_completion___block_invoke_2;
  v9[3] = &unk_1E53057B0;
  id v10 = *(id *)(a1 + 40);
  v8 = [(_UIOMenuLeafPerformAction *)v7 initWithMenuElement:v6 pasteAuthenticationMesage:v5 responseHandler:v9];

  [*(id *)(a1 + 32) sendAction:v8];
}

void __84___UIEditMenuPresentationServer__editMenuPresentation_didSelectMenuLeaf_completion___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84___UIEditMenuPresentationServer__editMenuPresentation_didSelectMenuLeaf_completion___block_invoke_3;
  block[3] = &unk_1E52DA040;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __84___UIEditMenuPresentationServer__editMenuPresentation_didSelectMenuLeaf_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __84___UIEditMenuPresentationServer__editMenuPresentation_didSelectMenuLeaf_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

void __89___UIEditMenuPresentationServer__editMenuPresentation_preparedMenuForDisplay_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __89___UIEditMenuPresentationServer__editMenuPresentation_preparedMenuForDisplay_completion___block_invoke_2;
  v6[3] = &unk_1E52DB330;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __89___UIEditMenuPresentationServer__editMenuPresentation_preparedMenuForDisplay_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) preparedMenu];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t __96___UIEditMenuPresentationServer__editMenuPresentation_willPresentMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendLifecycleEvent:1 forMenuWithIdentifier:*(void *)(a1 + 40)];
}

void __96___UIEditMenuPresentationServer__editMenuPresentation_willDismissMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _sendLifecycleEvent:3 forMenuWithIdentifier:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) configurations];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) presentations];
  [v3 removeObjectForKey:*(void *)(a1 + 40)];

  id v4 = [*(id *)(a1 + 32) connections];
  [v4 removeObjectForKey:*(void *)(a1 + 40)];
}

@end