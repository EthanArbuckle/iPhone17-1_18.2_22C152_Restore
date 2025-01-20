@interface SearchUINewsCardGradientView
+ (Class)layerClass;
- (SearchUINewsCardGradientView)init;
@end

@implementation SearchUINewsCardGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (SearchUINewsCardGradientView)init
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)SearchUINewsCardGradientView;
  v2 = [(SearchUINewsCardGradientView *)&v12 init];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4FB1618] clearColor];
    v13[0] = [v3 CGColor];
    v4 = [MEMORY[0x1E4FB1618] blackColor];
    id v5 = [v4 colorWithAlphaComponent:0.5];
    v13[1] = [v5 CGColor];
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v7 = [(SearchUINewsCardGradientView *)v2 layer];
    [v7 setColors:v6];

    v8 = [(SearchUINewsCardGradientView *)v2 layer];
    double v9 = 0.0;
    objc_msgSend(v8, "setStartPoint:", 0.0, 0.5);

    if (![MEMORY[0x1E4FAE198] isMacOS]) {
      double v9 = 1.0;
    }
    v10 = [(SearchUINewsCardGradientView *)v2 layer];
    objc_msgSend(v10, "setEndPoint:", 0.0, v9);
  }
  return v2;
}

@end