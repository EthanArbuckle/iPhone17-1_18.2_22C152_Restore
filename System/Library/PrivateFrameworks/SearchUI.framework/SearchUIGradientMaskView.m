@interface SearchUIGradientMaskView
+ (Class)layerClass;
- (SearchUIGradientMaskView)init;
@end

@implementation SearchUIGradientMaskView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (SearchUIGradientMaskView)init
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)SearchUIGradientMaskView;
  v2 = [(SearchUIGradientMaskView *)&v17 init];
  if (v2)
  {
    if ([MEMORY[0x1E4FAE100] isLTR])
    {
      id v3 = [MEMORY[0x1E4FB1618] whiteColor];
      v18[0] = [v3 CGColor];
      id v4 = [MEMORY[0x1E4FB1618] clearColor];
      v18[1] = [v4 CGColor];
      v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
      v6 = [(SearchUIGradientMaskView *)v2 layer];
      [v6 setColors:v5];

      v7 = [(SearchUIGradientMaskView *)v2 layer];
      objc_msgSend(v7, "setStartPoint:", 0.9, 0.5);

      v8 = [(SearchUIGradientMaskView *)v2 layer];
      v9 = v8;
      double v10 = 1.0;
    }
    else
    {
      id v11 = [MEMORY[0x1E4FB1618] clearColor];
      v19[0] = [v11 CGColor];
      id v12 = [MEMORY[0x1E4FB1618] whiteColor];
      v19[1] = [v12 CGColor];
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
      v14 = [(SearchUIGradientMaskView *)v2 layer];
      [v14 setColors:v13];

      v15 = [(SearchUIGradientMaskView *)v2 layer];
      objc_msgSend(v15, "setStartPoint:", 0.0, 0.5);

      v8 = [(SearchUIGradientMaskView *)v2 layer];
      v9 = v8;
      double v10 = 0.1;
    }
    objc_msgSend(v8, "setEndPoint:", v10, 0.5);
  }
  return v2;
}

@end