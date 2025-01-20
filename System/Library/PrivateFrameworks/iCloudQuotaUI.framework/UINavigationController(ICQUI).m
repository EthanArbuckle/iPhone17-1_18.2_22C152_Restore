@interface UINavigationController(ICQUI)
- (void)addBlurEffect;
@end

@implementation UINavigationController(ICQUI)

- (void)addBlurEffect
{
  id v2 = objc_alloc(MEMORY[0x263F827E8]);
  v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  id v15 = [v2 imageWithTintColor:v3];

  v4 = [a1 navigationBar];
  [v4 setBackgroundImage:v15 forBarMetrics:0];

  v5 = [a1 navigationBar];
  [v5 setShadowImage:v15];

  id v6 = objc_alloc(MEMORY[0x263F82E50]);
  v7 = [MEMORY[0x263F824D8] effectWithStyle:4];
  v8 = (void *)[v6 initWithEffect:v7];

  v9 = [a1 navigationBar];
  [v9 bounds];
  objc_msgSend(v8, "setFrame:");

  [v8 setAutoresizingMask:18];
  v10 = [v8 layer];
  [v10 setZPosition:-1.0];

  [v8 setUserInteractionEnabled:0];
  v11 = [a1 navigationBar];
  [v11 addSubview:v8];

  v12 = [a1 navigationBar];
  [v12 sendSubviewToBack:v8];

  v13 = [MEMORY[0x263F825C8] clearColor];
  v14 = [a1 navigationBar];
  [v14 setBackgroundColor:v13];
}

@end