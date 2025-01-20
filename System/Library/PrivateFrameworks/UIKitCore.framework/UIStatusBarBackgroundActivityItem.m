@interface UIStatusBarBackgroundActivityItem
@end

@implementation UIStatusBarBackgroundActivityItem

void __64___UIStatusBarBackgroundActivityItem_applyUpdate_toDisplayItem___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64___UIStatusBarBackgroundActivityItem_applyUpdate_toDisplayItem___block_invoke_2;
  v6[3] = &unk_1E52D9F98;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  +[UIView animateWithDuration:0 delay:v6 options:a4 animations:0.333 completion:0.0];
}

uint64_t __64___UIStatusBarBackgroundActivityItem_applyUpdate_toDisplayItem___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPillColor:*(void *)(a1 + 40)];
}

uint64_t __53___UIStatusBarBackgroundActivityItem_imageForUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

@end