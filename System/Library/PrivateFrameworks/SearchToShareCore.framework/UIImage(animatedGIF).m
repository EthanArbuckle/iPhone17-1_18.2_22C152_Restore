@interface UIImage(animatedGIF)
+ (id)agif_animatedImageWithAnimatedGIFData:()animatedGIF;
+ (id)agif_animatedImageWithAnimatedGIFURL:()animatedGIF;
+ (id)agif_animatedImageWithImageInfo:()animatedGIF;
@end

@implementation UIImage(animatedGIF)

+ (id)agif_animatedImageWithAnimatedGIFData:()animatedGIF
{
  v3 = CGImageSourceCreateWithData(data, 0);

  return animatedImageWithAnimatedGIFReleasingImageSource(v3);
}

+ (id)agif_animatedImageWithAnimatedGIFURL:()animatedGIF
{
  v3 = CGImageSourceCreateWithURL(url, 0);

  return animatedImageWithAnimatedGIFReleasingImageSource(v3);
}

+ (id)agif_animatedImageWithImageInfo:()animatedGIF
{
  id v3 = a3;
  [v3 duration];
  double v5 = v4;
  v6 = (void *)MEMORY[0x263F827E8];
  v7 = [v3 frames];

  v8 = [v6 animatedImageWithImages:v7 duration:v5];

  return v8;
}

@end