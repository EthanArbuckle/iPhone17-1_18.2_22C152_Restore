@interface SPUIGradientMaskView
+ (Class)layerClass;
- (SPUIGradientMaskView)init;
@end

@implementation SPUIGradientMaskView

- (SPUIGradientMaskView)init
{
  v21[2] = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)SPUIGradientMaskView;
  v2 = [(SPUIGradientMaskView *)&v19 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F82438] sharedApplication];
    uint64_t v4 = [v3 userInterfaceLayoutDirection];

    if (v4 == 1)
    {
      id v5 = [MEMORY[0x263F825C8] clearColor];
      v21[0] = [v5 CGColor];
      id v6 = [MEMORY[0x263F825C8] whiteColor];
      v21[1] = [v6 CGColor];
      v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
      v8 = [(SPUIGradientMaskView *)v2 layer];
      [v8 setColors:v7];

      v9 = [(SPUIGradientMaskView *)v2 layer];
      objc_msgSend(v9, "setStartPoint:", 0.0, 0.5);

      v10 = [(SPUIGradientMaskView *)v2 layer];
      v11 = v10;
      double v12 = 0.1;
    }
    else
    {
      id v13 = [MEMORY[0x263F825C8] whiteColor];
      v20[0] = [v13 CGColor];
      id v14 = [MEMORY[0x263F825C8] clearColor];
      v20[1] = [v14 CGColor];
      v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
      v16 = [(SPUIGradientMaskView *)v2 layer];
      [v16 setColors:v15];

      v17 = [(SPUIGradientMaskView *)v2 layer];
      objc_msgSend(v17, "setStartPoint:", 0.9, 0.5);

      v10 = [(SPUIGradientMaskView *)v2 layer];
      v11 = v10;
      double v12 = 1.0;
    }
    objc_msgSend(v10, "setEndPoint:", v12, 0.5);
  }
  return v2;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end