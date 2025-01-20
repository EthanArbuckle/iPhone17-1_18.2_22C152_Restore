@interface TVSwipeUpMessageView
@end

@implementation TVSwipeUpMessageView

uint64_t __36___TVSwipeUpMessageView_setMessage___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F1C360]);
  v1 = (void *)setMessage__textShadow;
  setMessage__textShadow = (uint64_t)v0;

  v2 = (void *)setMessage__textShadow;
  v3 = [MEMORY[0x263F1C550] blackColor];
  v4 = [v3 colorWithAlphaComponent:0.4];
  [v2 setShadowColor:v4];

  objc_msgSend((id)setMessage__textShadow, "setShadowOffset:", 0.0, 0.0);
  v5 = (void *)setMessage__textShadow;
  return [v5 setShadowBlurRadius:2.0];
}

uint64_t __53___TVSwipeUpMessageView__processSwipeUpMessageEvent___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) chevronView];
  [v2 setAlpha:1.0];

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53___TVSwipeUpMessageView__processSwipeUpMessageEvent___block_invoke_2;
  v4[3] = &unk_264BA69A0;
  v4[4] = *(void *)(a1 + 32);
  return [MEMORY[0x263F1CB60] animateWithDuration:0 delay:v4 options:0 animations:0.75 completion:0.75];
}

void __53___TVSwipeUpMessageView__processSwipeUpMessageEvent___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) messageView];
  [v2 setAlpha:1.0];

  v3 = [*(id *)(a1 + 32) messageView];
  long long v4 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v5[0] = *MEMORY[0x263F000D0];
  v5[1] = v4;
  v5[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v3 setTransform:v5];
}

uint64_t __53___TVSwipeUpMessageView__processSwipeUpMessageEvent___block_invoke_3(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _processSwipeUpMessageEvent:2];
  }
  return result;
}

void __53___TVSwipeUpMessageView__processSwipeUpMessageEvent___block_invoke_4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) chevronView];
  [v2 setAlpha:0.0];

  id v3 = [*(id *)(a1 + 32) messageView];
  [v3 setAlpha:0.0];
}

uint64_t __53___TVSwipeUpMessageView__processSwipeUpMessageEvent___block_invoke_5(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _processSwipeUpMessageEvent:2];
  }
  return result;
}

@end