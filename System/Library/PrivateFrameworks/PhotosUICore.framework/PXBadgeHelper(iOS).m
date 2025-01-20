@interface PXBadgeHelper(iOS)
+ (UIImage)spatialBadgeImage;
@end

@implementation PXBadgeHelper(iOS)

+ (UIImage)spatialBadgeImage
{
  v2 = +[PXBadgeHelper systemImageNameForBadges:0x20000000000];
  v3 = +[PXBadgeHelper smallSymbolConfiguration];
  v4 = [MEMORY[0x1E4FB1818] _systemImageNamed:v2];
  v5 = [v4 imageWithSymbolConfiguration:v3];

  v6 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  v7 = objc_msgSend(v5, "px_tintedImageWithColor:", v6);

  return (UIImage *)v7;
}

@end