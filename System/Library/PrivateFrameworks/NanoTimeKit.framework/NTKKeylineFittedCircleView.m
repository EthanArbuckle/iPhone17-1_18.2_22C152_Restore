@interface NTKKeylineFittedCircleView
@end

@implementation NTKKeylineFittedCircleView

void __45___NTKKeylineFittedCircleView_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v4 = [WeakRetained layer];
  id v5 = v3;
  uint64_t v6 = [v5 CGColor];

  [v4 setBorderColor:v6];
}

@end