@interface UIDialogForAddingKeyboard
@end

@implementation UIDialogForAddingKeyboard

void __37___UIDialogForAddingKeyboard_dismiss__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37___UIDialogForAddingKeyboard_dismiss__block_invoke_2;
  block[3] = &unk_1E52D9F70;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __37___UIDialogForAddingKeyboard_dismiss__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  [*(id *)(*(void *)(a1 + 32) + 8) resignKeyWindow];
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = 0;

  v6 = objc_opt_class();
  return [v6 presentDialogForAddingKeyboard];
}

void __60___UIDialogForAddingKeyboard_presentDialogForAddingKeyboard__block_invoke(uint64_t a1, uint64_t a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __60___UIDialogForAddingKeyboard_presentDialogForAddingKeyboard__block_invoke_2;
  v2[3] = &unk_1E52D9CD0;
  v2[4] = *(void *)(a1 + 32);
  v2[5] = a2;
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __60___UIDialogForAddingKeyboard_presentDialogForAddingKeyboard__block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 40) == 2) {
    return [*(id *)(a1 + 32) presentPrivacySheet];
  }
  else {
    return [MEMORY[0x1E4FAE270] dismissDialog];
  }
}

@end