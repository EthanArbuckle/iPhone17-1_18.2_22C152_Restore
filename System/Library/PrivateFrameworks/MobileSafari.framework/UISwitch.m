@interface UISwitch
@end

@implementation UISwitch

void __65__UISwitch_MobileSafariExtras__sf_initWithOn_valueChangeHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 sender];
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v3 isOn]);
}

@end