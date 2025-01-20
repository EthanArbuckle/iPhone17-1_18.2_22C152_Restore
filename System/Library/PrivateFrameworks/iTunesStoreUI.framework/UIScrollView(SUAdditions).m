@interface UIScrollView(SUAdditions)
- (uint64_t)setTopExtensionViewColor:()SUAdditions;
- (uint64_t)topExtensionViewColor;
@end

@implementation UIScrollView(SUAdditions)

- (uint64_t)setTopExtensionViewColor:()SUAdditions
{
  v5 = (void *)[a1 viewWithTag:800];
  v6 = v5;
  if (a3)
  {
    if (v5)
    {
      [a1 sendSubviewToBack:v5];
    }
    else
    {
      double v7 = *MEMORY[0x263F001A8];
      long long v12 = *MEMORY[0x263F001B0];
      if (SUGradientColorIsPatternColor(a3, &v12))
      {
        double v8 = *((double *)&v12 + 1);
      }
      else
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "bounds");
        double v8 = v9;
      }
      [a1 frame];
      v6 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v7, -v8, v10, v8);
      [v6 setAutoresizingMask:2];
      [v6 setTag:800];
      [a1 insertSubview:v6 atIndex:0];
    }
  }
  else
  {
    [v5 removeFromSuperview];
    v6 = 0;
  }
  return [v6 setBackgroundColor:a3];
}

- (uint64_t)topExtensionViewColor
{
  v1 = (void *)[a1 viewWithTag:800];

  return [v1 backgroundColor];
}

@end