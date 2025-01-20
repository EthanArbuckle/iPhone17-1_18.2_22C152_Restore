@interface UIView(SVAdditions)
- (void)setHidden:()SVAdditions withShowDelay:;
@end

@implementation UIView(SVAdditions)

- (void)setHidden:()SVAdditions withShowDelay:
{
  if (a4)
  {
    [a1 setHidden:1];
  }
  else
  {
    dispatch_time_t v5 = dispatch_time(0, (uint64_t)(a2 * 1000000000.0));
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__UIView_SVAdditions__setHidden_withShowDelay___block_invoke;
    block[3] = &unk_264771008;
    block[4] = a1;
    dispatch_after(v5, MEMORY[0x263EF83A0], block);
  }
}

@end