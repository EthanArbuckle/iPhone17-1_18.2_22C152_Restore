@interface UIImageView(VideosUICore)
+ (id)vui_imageViewWithFrame:()VideosUICore;
+ (id)vui_imageViewWithImage:()VideosUICore;
@end

@implementation UIImageView(VideosUICore)

+ (id)vui_imageViewWithFrame:()VideosUICore
{
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", a1, a2, a3, a4);
  return v4;
}

+ (id)vui_imageViewWithImage:()VideosUICore
{
  v3 = (void *)MEMORY[0x1E4F42AA0];
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  id v8 = a3;
  v9 = objc_msgSend(v3, "vui_imageViewWithFrame:", v4, v5, v6, v7);
  [v9 setImage:v8];

  return v9;
}

@end