@interface UIImage(SensorKitUI)
+ (UIImage)skui_bulletImage;
+ (uint64_t)skui_imageNamed:()SensorKitUI bundle:imageDescriptor:;
@end

@implementation UIImage(SensorKitUI)

+ (uint64_t)skui_imageNamed:()SensorKitUI bundle:imageDescriptor:
{
  v6 = (void *)[MEMORY[0x263F1C6B0] imageNamed:a3 inBundle:a4 compatibleWithTraitCollection:0];
  [a5 size];
  return objc_msgSend(v6, "imageByPreparingThumbnailOfSize:");
}

+ (UIImage)skui_bulletImage
{
  v2.width = 8.0;
  v2.height = 8.0;
  UIGraphicsBeginImageContextWithOptions(v2, 0, 0.0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C550], "grayColor"), "setFill");
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithOvalInRect:", 0.0, 0.0, 8.0, 8.0), "fill");
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return ImageFromCurrentImageContext;
}

@end