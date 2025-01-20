@interface UIView(CACUIAdditions)
- (id)cac_snapshot;
@end

@implementation UIView(CACUIAdditions)

- (id)cac_snapshot
{
  v2 = [a1 layer];
  [v2 layoutIfNeeded];

  v3 = [MEMORY[0x263F827B0] defaultFormat];
  id v4 = objc_alloc(MEMORY[0x263F827A0]);
  [a1 bounds];
  v7 = objc_msgSend(v4, "initWithSize:format:", v3, v5, v6);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __38__UIView_CACUIAdditions__cac_snapshot__block_invoke;
  v10[3] = &unk_264D12CE0;
  v10[4] = a1;
  v8 = [v7 imageWithActions:v10];

  return v8;
}

@end