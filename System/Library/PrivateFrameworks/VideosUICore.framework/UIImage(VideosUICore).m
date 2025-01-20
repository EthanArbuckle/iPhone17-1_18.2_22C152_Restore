@interface UIImage(VideosUICore)
+ (id)vuiImageNamed:()VideosUICore;
+ (id)vuiSystemImageNamed:()VideosUICore withConfiguration:accessibilityDescription:;
+ (uint64_t)vuiImageNamed:()VideosUICore inBundle:;
+ (uint64_t)vuiImageWithCGImage:()VideosUICore;
- (NSData)vuiJPEGRepresentation;
- (uint64_t)vuiCGImage;
- (uint64_t)vuiTemplateImage;
@end

@implementation UIImage(VideosUICore)

+ (id)vuiImageNamed:()VideosUICore
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F42A80];
  v5 = [MEMORY[0x1E4F28B50] mainBundle];
  v6 = [v4 vuiImageNamed:v3 inBundle:v5];

  if (!v6)
  {
    v7 = (void *)MEMORY[0x1E4F42A80];
    v8 = objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
    v6 = [v7 vuiImageNamed:v3 inBundle:v8];
  }
  return v6;
}

+ (uint64_t)vuiImageNamed:()VideosUICore inBundle:
{
  return [MEMORY[0x1E4F42A80] imageNamed:a3 inBundle:a4 withConfiguration:0];
}

+ (uint64_t)vuiImageWithCGImage:()VideosUICore
{
  return objc_msgSend(MEMORY[0x1E4F42A80], "imageWithCGImage:");
}

+ (id)vuiSystemImageNamed:()VideosUICore withConfiguration:accessibilityDescription:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [MEMORY[0x1E4F42A80] systemImageNamed:v7 withConfiguration:v8];
  if (v10)
  {
    if (!v9) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v10 = [MEMORY[0x1E4F42A80] _systemImageNamed:v7 withConfiguration:v8];
  if (v9) {
LABEL_3:
  }
    [v10 setAccessibilityLabel:v9];
LABEL_4:

  return v10;
}

- (uint64_t)vuiCGImage
{
  id v1 = a1;
  return [v1 CGImage];
}

- (uint64_t)vuiTemplateImage
{
  return [a1 imageWithRenderingMode:2];
}

- (NSData)vuiJPEGRepresentation
{
  return UIImageJPEGRepresentation(a1, 1.0);
}

@end