@interface UIContextualAction
@end

@implementation UIContextualAction

void __87__UIContextualAction_IC__contextualActionWithSystemImageNamed_style_color_actionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  uint64_t v6 = *(void *)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__UIContextualAction_IC__contextualActionWithSystemImageNamed_style_color_actionBlock___block_invoke_2;
  v9[3] = &unk_1E5FD9DF0;
  id v10 = v5;
  v7 = *(void (**)(uint64_t, void *))(v6 + 16);
  id v8 = v5;
  v7(v6, v9);
}

uint64_t __87__UIContextualAction_IC__contextualActionWithSystemImageNamed_style_color_actionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end