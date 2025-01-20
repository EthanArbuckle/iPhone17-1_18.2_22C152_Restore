@interface UINavigationItem(SUAdditions)
- (uint64_t)fadeInTitleView;
- (uint64_t)mergeValuesFromItem:()SUAdditions;
- (uint64_t)resetAllValues;
- (uint64_t)setTitleView:()SUAdditions animated:;
- (void)fadeOutTitleView;
@end

@implementation UINavigationItem(SUAdditions)

- (uint64_t)fadeInTitleView
{
  objc_msgSend((id)objc_msgSend(a1, "_titleView"), "setAlpha:", 0.0);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __48__UINavigationItem_SUAdditions__fadeInTitleView__block_invoke;
  v3[3] = &unk_264812130;
  v3[4] = a1;
  return [MEMORY[0x263F1CB60] animateWithDuration:v3 animations:0.35];
}

- (void)fadeOutTitleView
{
  objc_msgSend((id)objc_msgSend(a1, "_titleView"), "bounds");
  v8.width = v2;
  v8.height = v3;
  UIGraphicsBeginImageContextWithOptions(v8, 0, 0.0);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "_titleView"), "layer"), "renderInContext:", UIGraphicsGetCurrentContext());
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  v5 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:ImageFromCurrentImageContext];
  objc_msgSend((id)objc_msgSend(a1, "_titleView"), "frame");
  objc_msgSend(v5, "setFrame:");
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "_titleView"), "superview"), "addSubview:", v5);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__UINavigationItem_SUAdditions__fadeOutTitleView__block_invoke;
  v7[3] = &unk_264812130;
  v7[4] = v5;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__UINavigationItem_SUAdditions__fadeOutTitleView__block_invoke_2;
  v6[3] = &unk_264812908;
  v6[4] = v5;
  [MEMORY[0x263F1CB60] animateWithDuration:v7 animations:v6 completion:0.35];
}

- (uint64_t)mergeValuesFromItem:()SUAdditions
{
  if ((void *)result != a3)
  {
    v4 = (void *)result;
    uint64_t v5 = [a3 backBarButtonItem];
    if (v5)
    {
      [v4 setBackBarButtonItem:v5];
      [a3 setBackBarButtonItem:0];
    }
    uint64_t v6 = [a3 leftBarButtonItem];
    if (v6)
    {
      [v4 setLeftBarButtonItem:v6];
      [a3 setLeftBarButtonItem:0];
    }
    uint64_t v7 = [a3 prompt];
    if (v7)
    {
      [v4 setPrompt:v7];
      [a3 setPrompt:0];
    }
    uint64_t v8 = [a3 rightBarButtonItem];
    if (v8)
    {
      [v4 setRightBarButtonItem:v8];
      [a3 setRightBarButtonItem:0];
    }
    uint64_t v9 = [a3 title];
    if (v9)
    {
      [v4 setTitle:v9];
      [a3 setTitle:0];
    }
    uint64_t v10 = [a3 titleView];
    if (v10)
    {
      [v4 setTitleView:v10];
      [a3 setTitleView:0];
    }
    result = [a3 hidesBackButton];
    if (result)
    {
      return [v4 setHidesBackButton:1];
    }
  }
  return result;
}

- (uint64_t)resetAllValues
{
  [a1 setBackBarButtonItem:0];
  [a1 setHidesBackButton:0];
  [a1 setLeftBarButtonItem:0];
  [a1 setPrompt:0];
  [a1 setRightBarButtonItem:0];
  [a1 setTitle:0];
  [a1 titleView];
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if ((result & 1) == 0)
  {
    uint64_t result = [a1 titleView];
    if (result)
    {
      return [a1 setTitleView:0];
    }
  }
  return result;
}

- (uint64_t)setTitleView:()SUAdditions animated:
{
  if (a4)
  {
    [a1 fadeOutTitleView];
    [a1 setTitleView:a3];
    return [a1 fadeInTitleView];
  }
  else
  {
    return objc_msgSend(a1, "setTitleView:");
  }
}

@end