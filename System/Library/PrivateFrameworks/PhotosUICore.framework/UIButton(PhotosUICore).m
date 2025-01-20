@interface UIButton(PhotosUICore)
+ (id)px_buttonBackgroundImageForType:()PhotosUICore color:cornerRadius:controlState:;
+ (id)px_buttonWithPXType:()PhotosUICore color:;
- (void)px_setTitle:()PhotosUICore orAttributedTitle:forState:;
- (void)px_updateTitleUsingBlock:()PhotosUICore;
@end

@implementation UIButton(PhotosUICore)

- (void)px_setTitle:()PhotosUICore orAttributedTitle:forState:
{
  id v11 = a3;
  id v9 = a4;
  if (v9)
  {
    if (v11)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:a1 file:@"UIButton+PhotosUICore.m" lineNumber:43 description:@"can't set both title and attributed title on a button"];
    }
    [a1 setTitle:0 forState:a5];
    [a1 setAttributedTitle:v9 forState:a5];
  }
  else
  {
    [a1 setAttributedTitle:0 forState:a5];
    [a1 setTitle:v11 forState:a5];
  }
}

- (void)px_updateTitleUsingBlock:()PhotosUICore
{
  (*(void (**)(uint64_t))(a3 + 16))(a3);
  id v5 = [a1 titleLabel];
  v4 = [v5 layer];
  [v4 removeAllAnimations];
}

+ (id)px_buttonBackgroundImageForType:()PhotosUICore color:cornerRadius:controlState:
{
  id v9 = a5;
  if (px_buttonBackgroundImageForType_color_cornerRadius_controlState__onceToken != -1) {
    dispatch_once(&px_buttonBackgroundImageForType_color_cornerRadius_controlState__onceToken, &__block_literal_global_258576);
  }
  v10 = objc_msgSend(NSString, "stringWithFormat:", @"%u-%p-%u", a4, v9, a6);
  id v11 = [(id)px_buttonBackgroundImageForType_color_cornerRadius_controlState__cachedBackgroundImages objectForKeyedSubscript:v10];
  if (!v11)
  {
    double v12 = ceil(a1 * 1.528665);
    double height = v12 * 2.0 + 1.0;
    double y = 0.0;
    v21.width = height;
    v21.double height = height;
    UIGraphicsBeginImageContextWithOptions(v21, 0, 0.0);
    [v9 set];
    if (a4 == 1)
    {
      v22.origin.x = 0.0;
      v22.origin.double y = 0.0;
      v22.size.width = v12 * 2.0 + 1.0;
      v22.size.double height = v22.size.width;
      CGRect v23 = CGRectInset(v22, 0.5, 0.5);
      double y = v23.origin.y;
      double height = v23.size.height;
      a1 = a1 + -0.5;
    }
    else
    {
      v23.size.width = v12 * 2.0 + 1.0;
      v23.origin.x = 0.0;
    }
    v15 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", v23.origin.x, y, v23.size.width, height, a1);
    v16 = v15;
    if (a4)
    {
      if (a4 == 1) {
        [v15 stroke];
      }
    }
    else
    {
      [v15 fill];
    }
    v17 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    id v11 = objc_msgSend(v17, "resizableImageWithCapInsets:", v12, v12, v12, v12);

    if (!a4)
    {
      uint64_t v18 = [v11 imageWithRenderingMode:2];

      id v11 = (void *)v18;
    }
    [(id)px_buttonBackgroundImageForType_color_cornerRadius_controlState__cachedBackgroundImages setObject:v11 forKeyedSubscript:v10];
  }
  return v11;
}

+ (id)px_buttonWithPXType:()PhotosUICore color:
{
  id v5 = a4;
  v6 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  objc_msgSend(v6, "setContentEdgeInsets:", 6.0, 16.0, 6.0, 16.0);
  v7 = objc_msgSend(MEMORY[0x1E4FB14D0], "px_buttonBackgroundImageForType:color:cornerRadius:controlState:", a3, v5, 0, 6.0);
  [v6 setBackgroundImage:v7 forState:0];

  if (a3)
  {
    id v8 = v5;
  }
  else
  {
    id v8 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  id v9 = v8;
  v10 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  id v11 = [v6 titleLabel];
  [v11 setFont:v10];

  double v12 = [v6 titleLabel];
  [v12 setAdjustsFontForContentSizeCategory:1];

  [v6 setTitleColor:v9 forState:0];
  return v6;
}

@end