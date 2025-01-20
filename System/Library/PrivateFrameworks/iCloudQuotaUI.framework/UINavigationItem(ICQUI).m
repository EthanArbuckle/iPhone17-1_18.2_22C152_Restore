@interface UINavigationItem(ICQUI)
- (uint64_t)icqui_hideNavigationBarSpinner;
- (void)icqui_showNavigationBarSpinner;
@end

@implementation UINavigationItem(ICQUI)

- (void)icqui_showNavigationBarSpinner
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
  v3 = [MEMORY[0x263F825C8] systemGrayColor];
  [v2 setColor:v3];

  [v2 startAnimating];
  v4 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v2];
  v6[0] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [a1 setRightBarButtonItems:v5];
}

- (uint64_t)icqui_hideNavigationBarSpinner
{
  return [a1 setRightBarButtonItems:MEMORY[0x263EFFA68]];
}

@end