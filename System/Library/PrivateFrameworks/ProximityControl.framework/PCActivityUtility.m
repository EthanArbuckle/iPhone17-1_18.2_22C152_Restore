@interface PCActivityUtility
+ (BOOL)activity:(id)a3 isLessThan:(id)a4;
+ (id)activityFrom:(id)a3;
+ (id)composedImageFor:(id)a3;
+ (id)composedImageFor:(id)a3 assetType:(int64_t)a4;
+ (id)composedImageWithArtworkFor:(id)a3 assetType:(int64_t)a4;
+ (id)composedImageWithDeviceImage:(id)a3 badgeImage:(id)a4;
+ (id)deviceNameFor:(id)a3;
+ (id)disambiguationButtonImageForActivity:(id)a3;
+ (id)formattedDurationFor:(double)a3;
+ (id)iconForBundleIdentifier:(id)a3;
+ (id)imageForAssetType:(int64_t)a3;
+ (id)order:(id)a3;
+ (id)scaleImageIfNeeded:(id)a3 toFitSize:(CGSize)a4 withCornerRadius:(double)a5;
@end

@implementation PCActivityUtility

+ (id)order:(id)a3
{
  v3 = [a3 sortedArrayUsingComparator:&__block_literal_global];
  v4 = (void *)[objc_alloc(MEMORY[0x263EFF9D8]) initWithArray:v3];

  return v4;
}

+ (id)activityFrom:(id)a3
{
  id v3 = a3;
  v4 = [v3 activityType];
  char v5 = [@"com.apple.ProximityControl.activity.call" isEqualToString:v4];

  if (v5)
  {
    v6 = off_26443DCF0;
LABEL_11:
    v15 = (void *)[objc_alloc(*v6) initWithActivity:v3];
    goto LABEL_12;
  }
  v7 = [v3 activityType];
  char v8 = [@"com.apple.ProximityControl.activity.media" isEqualToString:v7];

  if (v8)
  {
    v6 = off_26443DCE8;
    goto LABEL_11;
  }
  v9 = [v3 activityType];
  char v10 = [@"com.apple.ProximityControl.activity.alarm" isEqualToString:v9];

  if (v10)
  {
    v6 = off_26443DCB0;
    goto LABEL_11;
  }
  v11 = [v3 activityType];
  char v12 = [@"com.apple.ProximityControl.activity.annoucement" isEqualToString:v11];

  if (v12)
  {
    v6 = off_26443DCB8;
    goto LABEL_11;
  }
  v13 = [v3 activityType];
  int v14 = [@"com.apple.ProximityControl.activity.timer" isEqualToString:v13];

  if (v14)
  {
    v6 = &off_26443DCF8;
    goto LABEL_11;
  }
  v15 = 0;
LABEL_12:

  return v15;
}

BOOL __27__PCActivityUtility_order___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[PCActivityUtility activity:a3 isLessThan:a2];
}

+ (BOOL)activity:(id)a3 isLessThan:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [a3 pcactivityType];
  unint64_t v7 = [v5 pcactivityType];

  return v6 < v7;
}

+ (id)deviceNameFor:(id)a3
{
  return @"HomePod";
}

+ (id)composedImageFor:(id)a3
{
  return +[PCActivityUtility composedImageFor:a3 assetType:0];
}

+ (id)composedImageFor:(id)a3 assetType:(int64_t)a4
{
  id v5 = a3;
  unint64_t v6 = +[PCActivityUtility imageForAssetType:a4];
  if ([v5 pcactivityType] == 1)
  {
    unint64_t v7 = 0;
  }
  else
  {
    unint64_t v7 = [v5 image];
  }
  char v8 = +[PCActivityUtility composedImageWithDeviceImage:v6 badgeImage:v7];

  return v8;
}

+ (id)composedImageWithArtworkFor:(id)a3 assetType:(int64_t)a4
{
  id v5 = a3;
  unint64_t v6 = +[PCActivityUtility imageForAssetType:a4];
  unint64_t v7 = [v5 image];

  char v8 = +[PCActivityUtility scaleImageIfNeeded:toFitSize:withCornerRadius:](PCActivityUtility, "scaleImageIfNeeded:toFitSize:withCornerRadius:", v7, 14.0, 14.0, 1.75);

  v9 = +[PCActivityUtility composedImageWithDeviceImage:v6 badgeImage:v8];

  return v9;
}

+ (id)composedImageWithDeviceImage:(id)a3 badgeImage:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v13.width = 44.0;
  v13.height = 44.0;
  UIGraphicsBeginImageContextWithOptions(v13, 0, 0.0);
  objc_msgSend(v6, "drawInRect:", 0.0, 0.0, 44.0, 44.0);

  if (v5)
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    id v8 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.2];
    v9 = (CGColor *)[v8 CGColor];
    v14.width = 0.0;
    v14.height = 1.0;
    CGContextSetShadowWithColor(CurrentContext, v14, 2.0, v9);

    objc_msgSend(v5, "drawInRect:", 27.0, 27.0, 14.0, 14.0);
  }
  char v10 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v10;
}

+ (id)disambiguationButtonImageForActivity:(id)a3
{
  id v3 = a3;
  v4 = [v3 bundleIdentifier];
  id v5 = +[PCActivityUtility iconForBundleIdentifier:v4];

  if ([v3 pcactivityType] == 1)
  {
    id v6 = [v3 image];
    unint64_t v7 = +[PCActivityUtility scaleImageIfNeeded:toFitSize:withCornerRadius:](PCActivityUtility, "scaleImageIfNeeded:toFitSize:withCornerRadius:", v6, 34.0, 34.0, 2.0);

    if (!v7) {
      goto LABEL_9;
    }
  }
  else
  {
    if ([v3 pcactivityType])
    {
      unint64_t v7 = 0;
      goto LABEL_9;
    }
    unint64_t v7 = [v3 callImage];
    if (!v7) {
      goto LABEL_9;
    }
  }
  if (v5)
  {
    v14.width = 42.0;
    v14.height = 42.0;
    UIGraphicsBeginImageContextWithOptions(v14, 0, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    id v9 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.2];
    char v10 = (CGColor *)[v9 CGColor];
    v15.width = 0.0;
    v15.height = 1.0;
    CGContextSetShadowWithColor(CurrentContext, v15, 2.0, v10);

    objc_msgSend(v7, "drawInRect:", 4.0, 4.0, 34.0, 34.0);
    objc_msgSend(v5, "drawInRect:", 26.0, 26.0, 16.0, 16.0);
    UIGraphicsGetImageFromCurrentImageContext();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    goto LABEL_10;
  }
LABEL_9:
  id v11 = objc_alloc_init(MEMORY[0x263F1C6B0]);
LABEL_10:

  return v11;
}

+ (id)iconForBundleIdentifier:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F4B540];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithBundleIdentifier:v4];

  id v6 = objc_msgSend(objc_alloc(MEMORY[0x263F4B558]), "initWithSize:scale:", 60.0, 60.0, 3.0);
  id v7 = (id)[v5 prepareImageForDescriptor:v6];
  uint64_t v8 = [v5 CGImageForDescriptor:v6];
  id v9 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithCGImage:v8];

  return v9;
}

+ (id)imageForAssetType:(int64_t)a3
{
  id v4 = +[PCAssetManager sharedInstance];
  id v5 = [v4 imageForAssetType:a3];

  return v5;
}

+ (id)formattedDurationFor:(double)a3
{
  if (a3 >= 3600.0) {
    uint64_t v4 = 224;
  }
  else {
    uint64_t v4 = 192;
  }
  id v5 = objc_alloc_init(MEMORY[0x263F08780]);
  [v5 setAllowedUnits:v4];
  [v5 setUnitsStyle:0];
  [v5 setZeroFormattingBehavior:0x10000];
  id v6 = [v5 stringFromTimeInterval:a3];

  return v6;
}

+ (id)scaleImageIfNeeded:(id)a3 toFitSize:(CGSize)a4 withCornerRadius:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  if (v8)
  {
    double v9 = 0.0;
    v26.double width = width;
    v26.double height = height;
    UIGraphicsBeginImageContextWithOptions(v26, 0, 0.0);
    [v8 size];
    double v11 = v10;
    [v8 size];
    if (vabdd_f64(v11, v12) >= 0.00000011920929)
    {
      [v8 size];
      double v17 = width / v16;
      [v8 size];
      if (v17 < height / v18) {
        double v17 = height / v18;
      }
      [v8 size];
      double v20 = v19 * v17;
      [v8 size];
      double v22 = v21 * v17;
      double v9 = (width - v20) * 0.5;
      double v14 = (height - v22) * 0.5;
      v23 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, width, height, a5);
      [v23 addClip];

      double width = v20;
      double height = v22;
    }
    else
    {
      CGSize v13 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, width, height, a5);
      [v13 addClip];

      double v14 = 0.0;
    }
    objc_msgSend(v8, "drawInRect:", v9, v14, width, height);
    CGSize v15 = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
  }
  else
  {
    CGSize v15 = 0;
  }

  return v15;
}

@end