@interface PXBadgeHelper
+ (PXAssetBadgeInfo)topLeftPrimaryBadgeInfoForBadgeInfo:(SEL)a3;
+ (PXAssetBadgeInfo)topLeftSecondaryBadgeInfoForBadgeInfo:(SEL)a3;
+ (PXAssetBadgeInfo)topRightBadgeInfoForBadgeInfo:(SEL)a3;
+ (UIImage)autoReframingImage;
+ (UIImage)cloudBadgeImage;
+ (UIImage)cloudBadgeImageMini;
+ (UIImage)contentSyndicationBadgeImage;
+ (UIImage)contentSyndicationBadgeImageMini;
+ (UIImage)contentSyndicationGuestAssetBadgeImage;
+ (UIImage)favoriteBadgeImage;
+ (UIImage)favoriteBadgeImageMini;
+ (UIImage)favoritesCollectionBadgeImage;
+ (UIImage)gradientImage;
+ (UIImage)livePhotoBadgeShadowedImage;
+ (UIImage)loopingBadgeImage;
+ (UIImage)loopingBadgeTemplateImage;
+ (UIImage)ocrAssetBadgeImage;
+ (UIImage)panoramaBadgeImage;
+ (UIImage)panoramaBadgeImageMini;
+ (UIImage)sharedLibraryBadgeImage;
+ (UIImage)sharedLibraryBadgeImageMini;
+ (UIImage)spatialBadgeImage;
+ (UIImageSymbolConfiguration)largeSymbolConfiguration;
+ (UIImageSymbolConfiguration)mediumBodySymbolConfiguration;
+ (UIImageSymbolConfiguration)mediumSymbolConfiguration;
+ (UIImageSymbolConfiguration)miniSymbolConfiguration;
+ (UIImageSymbolConfiguration)smallBodySymbolConfiguration;
+ (UIImageSymbolConfiguration)smallSymbolConfiguration;
+ (id)_favoriteBadgeImageWithSymbolConfiguration:(id)a3;
+ (id)debugBackgroundImageWithBadges:(unint64_t)a3;
+ (id)imageForBadgeInfo:(PXAssetBadgeInfo *)a3 style:(int64_t)a4 isOverContent:(BOOL)a5;
+ (id)leadingCornerGradientBackgroundImageForLayoutDirection:(int64_t)a3;
+ (id)systemImageNameForBadges:(unint64_t)a3;
+ (id)textForBadgeInfo:(PXAssetBadgeInfo *)a3 style:(int64_t)a4;
+ (id)trailingCornerGradientBackgroundImageForLayoutDirection:(int64_t)a3;
@end

@implementation PXBadgeHelper

+ (UIImage)autoReframingImage
{
  if (autoReframingImage_onceToken != -1) {
    dispatch_once(&autoReframingImage_onceToken, &__block_literal_global_61);
  }
  v2 = (void *)autoReframingImage_image;
  return (UIImage *)v2;
}

void __35__PXBadgeHelper_autoReframingImage__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", @"PXAutoReframingBadge");
  v1 = (void *)autoReframingImage_image;
  autoReframingImage_image = v0;
}

+ (UIImage)sharedLibraryBadgeImage
{
  v2 = +[PXBadgeHelper smallSymbolConfiguration];
  v3 = objc_msgSend(MEMORY[0x1E4FB1818], "px_systemImageNamed:", @"person.2.fill");
  v4 = [v3 imageWithSymbolConfiguration:v2];

  v5 = [MEMORY[0x1E4FB1618] whiteColor];
  v6 = objc_msgSend(v4, "px_tintedImageWithColor:", v5);

  return (UIImage *)v6;
}

+ (UIImage)cloudBadgeImage
{
  if (cloudBadgeImage_onceToken != -1) {
    dispatch_once(&cloudBadgeImage_onceToken, &__block_literal_global_53_188979);
  }
  v2 = (void *)cloudBadgeImage_image;
  return (UIImage *)v2;
}

void __32__PXBadgeHelper_cloudBadgeImage__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"icloud.fill"];
  v1 = (void *)cloudBadgeImage_image;
  cloudBadgeImage_image = v0;

  v2 = (void *)cloudBadgeImage_image;
  v3 = +[PXBadgeHelper smallSymbolConfiguration];
  uint64_t v4 = [v2 imageWithSymbolConfiguration:v3];
  v5 = (void *)cloudBadgeImage_image;
  cloudBadgeImage_image = v4;

  v6 = (void *)cloudBadgeImage_image;
  id v9 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  uint64_t v7 = objc_msgSend(v6, "px_tintedImageWithColor:", v9);
  v8 = (void *)cloudBadgeImage_image;
  cloudBadgeImage_image = v7;
}

+ (UIImage)loopingBadgeTemplateImage
{
  if (loopingBadgeTemplateImage_onceToken != -1) {
    dispatch_once(&loopingBadgeTemplateImage_onceToken, &__block_literal_global_51_188984);
  }
  v2 = (void *)loopingBadgeTemplateImage_image;
  return (UIImage *)v2;
}

void __42__PXBadgeHelper_loopingBadgeTemplateImage__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", @"PXAssetsSceneBadgeLoop");
  v1 = (void *)loopingBadgeTemplateImage_image;
  loopingBadgeTemplateImage_image = v0;

  uint64_t v2 = [(id)loopingBadgeTemplateImage_image imageWithRenderingMode:2];
  v3 = (void *)loopingBadgeTemplateImage_image;
  loopingBadgeTemplateImage_image = v2;
}

+ (UIImage)loopingBadgeImage
{
  if (loopingBadgeImage_onceToken != -1) {
    dispatch_once(&loopingBadgeImage_onceToken, &__block_literal_global_46);
  }
  uint64_t v2 = (void *)loopingBadgeImage_image;
  return (UIImage *)v2;
}

void __34__PXBadgeHelper_loopingBadgeImage__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", @"PXAssetsSceneBadgeLoop");
  v1 = (void *)loopingBadgeImage_image;
  loopingBadgeImage_image = v0;
}

+ (UIImage)spatialBadgeImage
{
  if (spatialBadgeImage_onceToken != -1) {
    dispatch_once(&spatialBadgeImage_onceToken, &__block_literal_global_39_188989);
  }
  uint64_t v2 = (void *)spatialBadgeImage_image;
  return (UIImage *)v2;
}

void __34__PXBadgeHelper_spatialBadgeImage__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", @"spatial");
  v1 = (void *)spatialBadgeImage_image;
  spatialBadgeImage_image = v0;

  uint64_t v2 = (void *)spatialBadgeImage_image;
  v3 = +[PXBadgeHelper mediumSymbolConfiguration];
  uint64_t v4 = [v2 imageWithSymbolConfiguration:v3];
  v5 = (void *)spatialBadgeImage_image;
  spatialBadgeImage_image = v4;

  v6 = (void *)spatialBadgeImage_image;
  id v9 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  uint64_t v7 = objc_msgSend(v6, "px_tintedImageWithColor:", v9);
  v8 = (void *)spatialBadgeImage_image;
  spatialBadgeImage_image = v7;
}

+ (UIImage)livePhotoBadgeShadowedImage
{
  if (livePhotoBadgeShadowedImage_onceToken != -1) {
    dispatch_once(&livePhotoBadgeShadowedImage_onceToken, &__block_literal_global_34_188994);
  }
  uint64_t v2 = (void *)livePhotoBadgeShadowedImage_image;
  return (UIImage *)v2;
}

void __44__PXBadgeHelper_livePhotoBadgeShadowedImage__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", @"PXAssetsSceneBadgeOverContentLivePhotoOn");
  v1 = (void *)livePhotoBadgeShadowedImage_image;
  livePhotoBadgeShadowedImage_image = v0;

  uint64_t v2 = [(id)livePhotoBadgeShadowedImage_image imageWithRenderingMode:2];
  v3 = (void *)livePhotoBadgeShadowedImage_image;
  livePhotoBadgeShadowedImage_image = v2;
}

+ (UIImage)gradientImage
{
  if (gradientImage_onceToken != -1) {
    dispatch_once(&gradientImage_onceToken, &__block_literal_global_28_188999);
  }
  uint64_t v2 = (void *)gradientImage_image;
  return (UIImage *)v2;
}

void __30__PXBadgeHelper_gradientImage__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", @"PXAssetsSceneBadgeBannerGradient");
  v1 = (void *)gradientImage_image;
  gradientImage_image = v0;
}

+ (UIImageSymbolConfiguration)smallBodySymbolConfiguration
{
  if (smallBodySymbolConfiguration_onceToken != -1) {
    dispatch_once(&smallBodySymbolConfiguration_onceToken, &__block_literal_global_26_189004);
  }
  return 0;
}

+ (UIImageSymbolConfiguration)mediumBodySymbolConfiguration
{
  if (mediumBodySymbolConfiguration_onceToken != -1) {
    dispatch_once(&mediumBodySymbolConfiguration_onceToken, &__block_literal_global_24_189006);
  }
  return 0;
}

+ (UIImageSymbolConfiguration)largeSymbolConfiguration
{
  if (largeSymbolConfiguration_onceToken != -1) {
    dispatch_once(&largeSymbolConfiguration_onceToken, &__block_literal_global_22_189008);
  }
  uint64_t v2 = (void *)largeSymbolConfiguration_largeSymbolConfiguration;
  return (UIImageSymbolConfiguration *)v2;
}

void __41__PXBadgeHelper_largeSymbolConfiguration__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
  v1 = (void *)largeSymbolConfiguration_largeSymbolConfiguration;
  largeSymbolConfiguration_largeSymbolConfiguration = v0;
}

+ (UIImageSymbolConfiguration)mediumSymbolConfiguration
{
  if (mediumSymbolConfiguration_onceToken != -1) {
    dispatch_once(&mediumSymbolConfiguration_onceToken, &__block_literal_global_20_189011);
  }
  uint64_t v2 = (void *)mediumSymbolConfiguration_mediumSymbolConfiguration;
  return (UIImageSymbolConfiguration *)v2;
}

void __42__PXBadgeHelper_mediumSymbolConfiguration__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1830] configurationWithScale:2];
  v1 = (void *)mediumSymbolConfiguration_mediumSymbolConfiguration;
  mediumSymbolConfiguration_mediumSymbolConfiguration = v0;
}

+ (UIImageSymbolConfiguration)smallSymbolConfiguration
{
  if (smallSymbolConfiguration_onceToken != -1) {
    dispatch_once(&smallSymbolConfiguration_onceToken, &__block_literal_global_18_189013);
  }
  uint64_t v2 = (void *)smallSymbolConfiguration_smallSymbolConfiguration;
  return (UIImageSymbolConfiguration *)v2;
}

void __41__PXBadgeHelper_smallSymbolConfiguration__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1830] configurationWithScale:1];
  v1 = (void *)smallSymbolConfiguration_smallSymbolConfiguration;
  smallSymbolConfiguration_smallSymbolConfiguration = v0;
}

+ (UIImageSymbolConfiguration)miniSymbolConfiguration
{
  if (miniSymbolConfiguration_onceToken != -1) {
    dispatch_once(&miniSymbolConfiguration_onceToken, &__block_literal_global_189015);
  }
  uint64_t v2 = (void *)miniSymbolConfiguration_miniSymbolConfiguration;
  return (UIImageSymbolConfiguration *)v2;
}

void __40__PXBadgeHelper_miniSymbolConfiguration__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1830] configurationWithPointSize:11.0];
  v1 = (void *)miniSymbolConfiguration_miniSymbolConfiguration;
  miniSymbolConfiguration_miniSymbolConfiguration = v0;
}

+ (id)debugBackgroundImageWithBadges:(unint64_t)a3
{
  v18[3] = *MEMORY[0x1E4F143B8];
  if (debugBackgroundImageWithBadges__onceToken != -1) {
    dispatch_once(&debugBackgroundImageWithBadges__onceToken, &__block_literal_global_299_296763);
  }
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:a3];
  v5 = [(id)debugBackgroundImageWithBadges__cache objectForKey:v4];
  if (!v5)
  {
    v6 = [MEMORY[0x1E4FB1618] grayColor];
    uint64_t v7 = v6;
    if ((a3 & 0x20000000) != 0)
    {
      id v8 = [MEMORY[0x1E4FB1618] orangeColor];
    }
    else
    {
      id v8 = v6;
    }
    id v9 = v8;
    if ((a3 & 0x40000000) != 0)
    {
      id v10 = [MEMORY[0x1E4FB1618] purpleColor];
    }
    else
    {
      id v10 = v7;
    }
    v11 = v10;
    v12 = [MEMORY[0x1E4F39BD0] layer];
    objc_msgSend(v12, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 10.0, 2.0);
    id v13 = v9;
    v18[0] = [v13 CGColor];
    id v14 = v7;
    v18[1] = objc_msgSend(v14, "CGColor", v18[0]);
    id v15 = v11;
    v18[2] = [v15 CGColor];
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
    [v12 setColors:v16];

    objc_msgSend(v12, "setStartPoint:", 0.0, 0.5);
    objc_msgSend(v12, "setEndPoint:", 1.0, 0.5);
    v20.width = 10.0;
    v20.height = 2.0;
    UIGraphicsBeginImageContext(v20);
    [v12 renderInContext:UIGraphicsGetCurrentContext()];
    v5 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [(id)debugBackgroundImageWithBadges__cache setObject:v5 forKey:v4];
  }
  return v5;
}

void __53__PXBadgeHelper_iOS__debugBackgroundImageWithBadges___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)debugBackgroundImageWithBadges__cache;
  debugBackgroundImageWithBadges__cache = (uint64_t)v0;
}

+ (id)trailingCornerGradientBackgroundImageForLayoutDirection:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 2)
  {
    v3 = 0;
  }
  else
  {
    v3 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", *off_1E5DD23B0[a3 + 1]);
  }
  uint64_t v4 = [v3 imageWithRenderingMode:2];

  return v4;
}

+ (id)leadingCornerGradientBackgroundImageForLayoutDirection:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 2)
  {
    v3 = 0;
  }
  else
  {
    v3 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", *off_1E5DD2398[a3 + 1]);
  }
  uint64_t v4 = [v3 imageWithRenderingMode:2];

  return v4;
}

+ (UIImage)cloudBadgeImageMini
{
  uint64_t v2 = [MEMORY[0x1E4FB1818] systemImageNamed:@"icloud.fill"];
  v3 = +[PXBadgeHelper miniSymbolConfiguration];
  uint64_t v4 = [v2 imageWithSymbolConfiguration:v3];

  v5 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  v6 = objc_msgSend(v4, "px_tintedImageWithColor:", v5);

  return (UIImage *)v6;
}

+ (UIImage)sharedLibraryBadgeImageMini
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4FB1818], "px_systemImageNamed:", @"person.2.fill");
  v3 = +[PXBadgeHelper miniSymbolConfiguration];
  uint64_t v4 = [v2 imageWithSymbolConfiguration:v3];

  v5 = [MEMORY[0x1E4FB1618] whiteColor];
  v6 = objc_msgSend(v4, "px_tintedImageWithColor:", v5);

  return (UIImage *)v6;
}

+ (UIImage)ocrAssetBadgeImage
{
  uint64_t v2 = [MEMORY[0x1E4FB1818] systemImageNamed:@"text.viewfinder"];
  v3 = +[PXBadgeHelper smallSymbolConfiguration];
  uint64_t v4 = [v2 imageWithSymbolConfiguration:v3];

  v5 = [MEMORY[0x1E4FB1618] whiteColor];
  v6 = objc_msgSend(v4, "px_tintedImageWithColor:", v5);

  return (UIImage *)v6;
}

+ (UIImage)contentSyndicationGuestAssetBadgeImage
{
  uint64_t v2 = [MEMORY[0x1E4FB1818] systemImageNamed:@"message"];
  v3 = +[PXBadgeHelper smallSymbolConfiguration];
  uint64_t v4 = [v2 imageWithSymbolConfiguration:v3];

  v5 = [MEMORY[0x1E4FB1618] whiteColor];
  v6 = objc_msgSend(v4, "px_tintedImageWithColor:", v5);

  return (UIImage *)v6;
}

+ (UIImage)contentSyndicationBadgeImageMini
{
  uint64_t v2 = [MEMORY[0x1E4FB1818] systemImageNamed:@"message"];
  v3 = +[PXBadgeHelper miniSymbolConfiguration];
  uint64_t v4 = [v2 imageWithSymbolConfiguration:v3];

  v5 = [MEMORY[0x1E4FB1618] whiteColor];
  v6 = objc_msgSend(v4, "px_tintedImageWithColor:", v5);

  return (UIImage *)v6;
}

+ (UIImage)contentSyndicationBadgeImage
{
  uint64_t v2 = [MEMORY[0x1E4FB1818] systemImageNamed:@"message"];
  v3 = +[PXBadgeHelper smallSymbolConfiguration];
  uint64_t v4 = [v2 imageWithSymbolConfiguration:v3];

  v5 = [MEMORY[0x1E4FB1618] whiteColor];
  v6 = objc_msgSend(v4, "px_tintedImageWithColor:", v5);

  return (UIImage *)v6;
}

+ (UIImage)panoramaBadgeImageMini
{
  uint64_t v2 = [MEMORY[0x1E4FB1818] systemImageNamed:@"pano.fill"];
  v3 = +[PXBadgeHelper miniSymbolConfiguration];
  uint64_t v4 = [v2 imageWithSymbolConfiguration:v3];

  v5 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  v6 = objc_msgSend(v4, "px_tintedImageWithColor:", v5);

  return (UIImage *)v6;
}

+ (UIImage)panoramaBadgeImage
{
  if (panoramaBadgeImage_onceToken != -1) {
    dispatch_once(&panoramaBadgeImage_onceToken, &__block_literal_global_296780);
  }
  uint64_t v2 = (void *)panoramaBadgeImage_panoBadgeImage;
  return (UIImage *)v2;
}

void __40__PXBadgeHelper_iOS__panoramaBadgeImage__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"pano.fill"];
  v1 = (void *)panoramaBadgeImage_panoBadgeImage;
  panoramaBadgeImage_panoBadgeImage = v0;

  uint64_t v2 = +[PXBadgeHelper smallSymbolConfiguration];
  v3 = (void *)panoramaBadgeImage_symbolConfig;
  panoramaBadgeImage_symbolConfig = v2;

  uint64_t v4 = [(id)panoramaBadgeImage_panoBadgeImage imageWithSymbolConfiguration:panoramaBadgeImage_symbolConfig];
  v5 = (void *)panoramaBadgeImage_panoBadgeImage;
  panoramaBadgeImage_panoBadgeImage = v4;

  v6 = (void *)panoramaBadgeImage_panoBadgeImage;
  id v9 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  uint64_t v7 = objc_msgSend(v6, "px_tintedImageWithColor:", v9);
  id v8 = (void *)panoramaBadgeImage_panoBadgeImage;
  panoramaBadgeImage_panoBadgeImage = v7;
}

+ (id)_favoriteBadgeImageWithSymbolConfiguration:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FB1818];
  id v4 = a3;
  v5 = [v3 systemImageNamed:@"heart.fill"];
  v6 = [v5 imageWithSymbolConfiguration:v4];

  uint64_t v7 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  id v8 = objc_msgSend(v6, "px_tintedImageWithColor:", v7);

  return v8;
}

+ (UIImage)favoritesCollectionBadgeImage
{
  uint64_t v2 = +[PXBadgeHelper mediumSymbolConfiguration];
  v3 = +[PXBadgeHelper _favoriteBadgeImageWithSymbolConfiguration:v2];

  return (UIImage *)v3;
}

+ (UIImage)favoriteBadgeImageMini
{
  uint64_t v2 = +[PXBadgeHelper miniSymbolConfiguration];
  v3 = +[PXBadgeHelper _favoriteBadgeImageWithSymbolConfiguration:v2];

  return (UIImage *)v3;
}

+ (UIImage)favoriteBadgeImage
{
  uint64_t v2 = +[PXBadgeHelper smallSymbolConfiguration];
  v3 = +[PXBadgeHelper _favoriteBadgeImageWithSymbolConfiguration:v2];

  return (UIImage *)v3;
}

+ (id)textForBadgeInfo:(PXAssetBadgeInfo *)a3 style:(int64_t)a4
{
  unint64_t badges = a3->badges;
  if ((a3->badges & 0x404) != 0) {
    goto LABEL_2;
  }
  if ((badges & 8) != 0)
  {
    v6 = PXLocalizedStringFromTable(@"AVALANCHE_BADGE_TEXT", @"PhotosUICore");
    uint64_t v7 = PXLocalizedStringWithValidatedFormat(v6, @"%ld");
    goto LABEL_4;
  }
  if ((badges & 0x3C0) != 0)
  {
    id v8 = 0;
    if ((unint64_t)a4 <= 6 && ((1 << a4) & 0x58) != 0)
    {
      if ((badges & 0x80) == 0 && (badges & 0x100) == 0 && (badges & 0x200) == 0 && (badges & 0x10) != 0)
      {
        v5 = PLServicesLivePortraitLocalizedFrameworkString();
        goto LABEL_3;
      }
LABEL_2:
      v5 = PLLocalizedFrameworkString();
LABEL_3:
      v6 = v5;
      uint64_t v7 = [v5 localizedUppercaseString];
LABEL_4:
      id v8 = (void *)v7;
    }
  }
  else
  {
    if ((badges & 0x10) != 0 || (badges & 0x20000) != 0 || (badges & 0x40000) != 0 || (badges & 0x80000) != 0) {
      goto LABEL_2;
    }
    if ((badges & 0x400000000) != 0)
    {
      id v8 = PXLocalizedStringFromTable(@"PXInfoPanelEXIFVideoProResBadge", @"PhotosUICore");
    }
    else
    {
      if ((badges & 0x800000000) != 0 || (badges & 0x20000000000) != 0) {
        goto LABEL_2;
      }
      id v8 = 0;
    }
  }
  return v8;
}

+ (id)systemImageNameForBadges:(unint64_t)a3
{
  if ((a3 & 4) != 0) {
    return @"square.stack.3d.up";
  }
  if ((a3 & 0x400) != 0) {
    return @"tv";
  }
  if ((a3 & 8) != 0) {
    return @"square.stack.3d.down.right";
  }
  if ((a3 & 0x40) != 0)
  {
    id v4 = @"livephoto.portrait";
    v5 = @"livephoto.slash";
    if ((a3 & 0x1000000) == 0) {
      v5 = @"livephoto";
    }
    if ((a3 & 0x10) == 0) {
      id v4 = v5;
    }
    if ((~a3 & 0x1000010) != 0) {
      return v4;
    }
    else {
      return @"livephoto.slash.portrait";
    }
  }
  else if ((a3 & 0x200) != 0)
  {
    return @"livephoto.long.exposure";
  }
  else if ((a3 & 0x80) != 0)
  {
    return @"livephoto.loop";
  }
  else if ((a3 & 0x100) != 0)
  {
    return @"livephoto.bounce";
  }
  else if ((a3 & 0x10) != 0)
  {
    return @"f.cursive.circle";
  }
  else if ((a3 & 0x8000000000) != 0)
  {
    return @"person.2";
  }
  else if ((a3 & 0x4000000000) != 0)
  {
    return @"person";
  }
  else if ((a3 & 0x800000000) != 0)
  {
    return @"cinematic.video";
  }
  else if ((a3 & 0x200000E0000) == 0x20000000000)
  {
    return @"spatial";
  }
  else
  {
    return 0;
  }
}

+ (id)imageForBadgeInfo:(PXAssetBadgeInfo *)a3 style:(int64_t)a4 isOverContent:(BOOL)a5
{
  unint64_t badges = a3->badges;
  if (a4 == 1 && (badges & 0x380) != 0)
  {
    uint64_t v6 = [(id)objc_opt_class() loopingBadgeTemplateImage];
LABEL_10:
    id v8 = (void *)v6;
    goto LABEL_12;
  }
  if (a4 == 5 && (badges & 0x40) != 0 && a5)
  {
    uint64_t v6 = [(id)objc_opt_class() livePhotoBadgeShadowedImage];
    goto LABEL_10;
  }
  id v9 = (void *)MEMORY[0x1E4FB1818];
  id v10 = [(id)objc_opt_class() systemImageNameForBadges:a3->badges];
  id v8 = [v9 _systemImageNamed:v10];

LABEL_12:
  return v8;
}

+ (PXAssetBadgeInfo)topRightBadgeInfoForBadgeInfo:(SEL)a3
{
  *(_OWORD *)&retstr->unint64_t badges = 0u;
  *(_OWORD *)&retstr->count = 0u;
  PXAssetBadgeInfoCreateWithBadges();
}

+ (PXAssetBadgeInfo)topLeftSecondaryBadgeInfoForBadgeInfo:(SEL)a3
{
  long long v7 = *(_OWORD *)&a4->count;
  long long v13 = *(_OWORD *)&a4->badges;
  long long v14 = v7;
  [a2 topLeftPrimaryBadgeInfoForBadgeInfo:&v13];
  uint64_t v8 = v15;
  long long v9 = *(_OWORD *)&a4->count;
  long long v13 = *(_OWORD *)&a4->badges;
  long long v14 = v9;
  result = (PXAssetBadgeInfo *)[a2 topRightBadgeInfoForBadgeInfo:&v13];
  a4->badges &= ~(v12 | v8);
  long long v11 = *(_OWORD *)&a4->count;
  *(_OWORD *)&retstr->unint64_t badges = *(_OWORD *)&a4->badges;
  *(_OWORD *)&retstr->count = v11;
  return result;
}

+ (PXAssetBadgeInfo)topLeftPrimaryBadgeInfoForBadgeInfo:(SEL)a3
{
  *(_OWORD *)&retstr->unint64_t badges = 0u;
  *(_OWORD *)&retstr->count = 0u;
  PXAssetBadgeInfoCreateWithBadges();
}

@end