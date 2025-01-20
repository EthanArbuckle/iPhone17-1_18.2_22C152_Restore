@interface WTView
@end

@implementation WTView

void __32___WTView__commonLayoutSubviews__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) bounds];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  id v10 = [*(id *)(a1 + 32) layer];
  objc_msgSend(v10, "setFrame:", v3, v5, v7, v9);
}

@end