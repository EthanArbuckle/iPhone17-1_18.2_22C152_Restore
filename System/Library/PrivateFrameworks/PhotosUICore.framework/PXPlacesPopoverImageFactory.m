@interface PXPlacesPopoverImageFactory
+ (CGSize)backgroundImageSizeForType:(int64_t)a3 usingTraitCollection:(id)a4;
+ (PXPlacesPopoverImageFactory)sharedInstance;
- (CGGradient)createLegibilityGradient;
- (CGImage)newImage:(CGImage *)a3 croppedToAspectRatio:(CGSize)a4;
- (CGSize)backgroundImageSizeForType:(int64_t)a3 usingTraitCollection:(id)a4;
- (CGSize)thumbnailImageSizeForImageType:(int64_t)a3 usingTraitCollection:(id)a4 includeScale:(BOOL)a5;
- (NSCache)cachedBackgroundImages;
- (PXPlacesPopoverImageFactory)init;
- (UIColor)defaultBackgroundColor;
- (double)thumbnailTopMarginForImageType:(int64_t)a3 usingTraitCollection:(id)a4;
- (id)_fetchAndCacheBackgroundImageWithName:(id)a3;
- (id)_placesKitFrameworkBundle;
- (id)_thumbnailShadowForType:(int64_t)a3 usingTraitCollection:(id)a4;
- (id)backgroundImageNameForType:(int64_t)a3 usingTraitCollection:(id)a4;
- (id)createAlbumPlaceHolderImageUsingTraitCollection:(id)a3;
- (id)createPopoverImageForGeotaggable:(id)a3 withImage:(CGImage *)a4 imageType:(int64_t)a5 imageOptions:(unint64_t)a6 usingTraitCollection:(id)a7;
- (id)imageNamed:(id)a3;
- (id)placeholderImageForImageType:(int64_t)a3 usingTraitCollection:(id)a4;
- (void)setCachedBackgroundImages:(id)a3;
- (void)setDefaultBackgroundColor:(id)a3;
@end

@implementation PXPlacesPopoverImageFactory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultBackgroundColor, 0);
  objc_storeStrong((id *)&self->_cachedBackgroundImages, 0);
}

- (void)setDefaultBackgroundColor:(id)a3
{
}

- (void)setCachedBackgroundImages:(id)a3
{
}

- (NSCache)cachedBackgroundImages
{
  return self->_cachedBackgroundImages;
}

- (id)_placesKitFrameworkBundle
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PXPlacesPopoverImageFactory__placesKitFrameworkBundle__block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  if (_placesKitFrameworkBundle_onceToken != -1) {
    dispatch_once(&_placesKitFrameworkBundle_onceToken, block);
  }
  return (id)_placesKitFrameworkBundle_frameworkBundle;
}

void __56__PXPlacesPopoverImageFactory__placesKitFrameworkBundle__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v1 = (void *)_placesKitFrameworkBundle_frameworkBundle;
  _placesKitFrameworkBundle_frameworkBundle = v0;
}

- (id)imageNamed:(id)a3
{
  id v4 = a3;
  v5 = [(PXPlacesPopoverImageFactory *)self _placesKitFrameworkBundle];
  v6 = [MEMORY[0x1E4FB1818] imageNamed:v4 inBundle:v5];

  return v6;
}

- (id)_fetchAndCacheBackgroundImageWithName:(id)a3
{
  id v4 = a3;
  v5 = [(PXPlacesPopoverImageFactory *)self cachedBackgroundImages];
  v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    uint64_t v7 = [(PXPlacesPopoverImageFactory *)self imageNamed:v4];
    if (v7)
    {
      v8 = (void *)v7;
      v9 = [(PXPlacesPopoverImageFactory *)self cachedBackgroundImages];
      [v9 setObject:v8 forKey:v4];

      v6 = v8;
    }
  }
  id v10 = v6;

  return v10;
}

- (CGGradient)createLegibilityGradient
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4FB1618] systemBlackColor];
  [off_1E5DA6D58 opacityValuesForSmoothDescendingGradient];
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  v6 = __55__PXPlacesPopoverImageFactory_createLegibilityGradient__block_invoke;
  uint64_t v7 = &unk_1E5DB9398;
  id v8 = v2;
  PXMap();
}

id __55__PXPlacesPopoverImageFactory_createLegibilityGradient__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  [a2 doubleValue];
  id v4 = [v2 colorWithAlphaComponent:v3 * 0.4];
  uint64_t v5 = [v4 CGColor];

  return v5;
}

- (CGImage)newImage:(CGImage *)a3 croppedToAspectRatio:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v7 = (double)CGImageGetWidth(a3);
  double v8 = (double)CGImageGetHeight(a3);
  double v9 = width / height;
  if (v7 / v8 >= width / height)
  {
    double v11 = 0.0;
    if (v7 / v8 <= width / height)
    {
      double v12 = 0.0;
    }
    else
    {
      double v13 = v9 * v8;
      double v12 = (v7 - v9 * v8) * 0.5;
      double v7 = v13;
    }
  }
  else
  {
    double v10 = v7 / v9;
    double v11 = (v8 - v7 / v9) * 0.5;
    double v12 = 0.0;
    double v8 = v10;
  }
  double v14 = v7;
  return CGImageCreateWithImageInRect(a3, *(CGRect *)(&v8 - 3));
}

- (CGSize)thumbnailImageSizeForImageType:(int64_t)a3 usingTraitCollection:(id)a4 includeScale:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  [v7 displayScale];
  double v9 = v8;
  int64_t v10 = a3 - 1;
  if ((unint64_t)(a3 - 1) >= 5)
  {
    double v12 = *MEMORY[0x1E4F1DB30];
    double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    uint64_t v13 = [v7 userInterfaceIdiom];
    uint64_t v14 = [v7 layoutSizeSubclass];
    switch(v13)
    {
      case 0:
      case 2:
      case 4:
        double v11 = 74.0;
        goto LABEL_5;
      case 1:
        if ((unint64_t)(v14 - 1) < 3)
        {
          double v11 = dbl_1AB35ACC8[v14 - 1];
LABEL_5:
          double v12 = v11;
        }
        break;
      default:
        break;
    }
  }
  else
  {
    double v11 = dbl_1AB35AC78[v10];
    double v12 = dbl_1AB35ACA0[v10];
  }
  double v15 = 1.0;
  if (v5) {
    double v15 = v9;
  }
  double v16 = v15 * v11;
  double v17 = v15 * v12;

  double v18 = v17;
  double v19 = v16;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (double)thumbnailTopMarginForImageType:(int64_t)a3 usingTraitCollection:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 userInterfaceIdiom];
  uint64_t v7 = [v5 layoutSizeSubclass];

  double result = 3.0;
  switch(a3)
  {
    case 0:
      if (v6 == 4) {
        goto LABEL_9;
      }
      if (v6 == 2)
      {
        double result = 39.0;
      }
      else
      {
        if (v6 != 1 || (unint64_t)(v7 - 1) >= 3) {
          goto LABEL_8;
        }
        double result = dbl_1AB35AC60[v7 - 1];
      }
      break;
    case 1:
    case 4:
      double result = 2.5;
      break;
    case 2:
LABEL_9:
      double result = 4.0;
      break;
    case 3:
      double result = 5.0;
      break;
    case 5:
      return result;
    default:
LABEL_8:
      double result = 0.0;
      break;
  }
  return result;
}

- (id)backgroundImageNameForType:(int64_t)a3 usingTraitCollection:(id)a4
{
  id v5 = a4;
  uint64_t v6 = v5;
  uint64_t v7 = 0;
  switch(a3)
  {
    case 0:
      uint64_t v8 = [v5 userInterfaceIdiom];
      uint64_t v9 = [v6 layoutSizeSubclass];
      uint64_t v7 = 0;
      switch(v8)
      {
        case 0:
        case 2:
          uint64_t v7 = @"PXPlacesAlbumCover-iPad";
          break;
        case 1:
          if ((unint64_t)(v9 - 1) >= 3) {
            uint64_t v7 = 0;
          }
          else {
            uint64_t v7 = off_1E5DB93B8[v9 - 1];
          }
          break;
        case 4:
          uint64_t v7 = @"PXPlacesAlbumCover-OSX";
          break;
        default:
          goto LABEL_7;
      }
      break;
    case 2:
    case 4:
      uint64_t v7 = @"PXPlacesThumbnailPopover";
      break;
    case 3:
      uint64_t v7 = @"PXPlacesThumbnail2024";
      break;
    case 5:
      uint64_t v7 = @"PXPlacesThumbnailPopoverInfoPanel";
      break;
    default:
      break;
  }
LABEL_7:

  return v7;
}

- (id)_thumbnailShadowForType:(int64_t)a3 usingTraitCollection:(id)a4
{
  if (a3 == 5)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB0858]);
    id v5 = [MEMORY[0x1E4FB1618] systemBlackColor];
    uint64_t v6 = [v5 colorWithAlphaComponent:0.2];
    [v4 setShadowColor:v6];

    [v4 setShadowBlurRadius:4.0];
    objc_msgSend(v4, "setShadowOffset:", 0.0, 2.0);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (CGSize)backgroundImageSizeForType:(int64_t)a3 usingTraitCollection:(id)a4
{
  int64_t v4 = a3;
  if (a3 == 1) {
    a3 = 0;
  }
  uint64_t v6 = [(PXPlacesPopoverImageFactory *)self backgroundImageNameForType:a3 usingTraitCollection:a4];
  uint64_t v7 = [(PXPlacesPopoverImageFactory *)self _fetchAndCacheBackgroundImageWithName:v6];
  [v7 size];
  double v10 = v8;
  if (v4 == 1) {
    double v11 = v8;
  }
  else {
    double v11 = v9;
  }

  double v12 = v10;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (UIColor)defaultBackgroundColor
{
  defaultBackgroundColor = self->_defaultBackgroundColor;
  if (!defaultBackgroundColor)
  {
    int64_t v4 = [MEMORY[0x1E4FB1618] colorWithRed:0.941176474 green:0.941176474 blue:0.941176474 alpha:1.0];
    id v5 = self->_defaultBackgroundColor;
    self->_defaultBackgroundColor = v4;

    defaultBackgroundColor = self->_defaultBackgroundColor;
  }
  return defaultBackgroundColor;
}

- (id)placeholderImageForImageType:(int64_t)a3 usingTraitCollection:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(PXPlacesPopoverImageFactory *)self defaultBackgroundColor];
  double v8 = [v6 traitCollectionForMapKit];

  if (v8)
  {
    double v9 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    double v10 = [v6 traitCollectionForMapKit];
    double v8 = [v9 resolvedColorWithTraitCollection:v10];

    double v11 = [MEMORY[0x1E4FB1618] quaternarySystemFillColor];
    double v12 = [v6 traitCollectionForMapKit];
    uint64_t v13 = [v11 resolvedColorWithTraitCollection:v12];

    uint64_t v7 = (void *)v13;
  }
  uint64_t v14 = [NSString stringWithFormat:@"PXPlacesPlaceholderImage-%@-%@", v8, v7];
  double v15 = [(PXPlacesPopoverImageFactory *)self cachedBackgroundImages];
  double v16 = [v15 objectForKey:v14];

  if (v16)
  {
    id v17 = v16;
  }
  else
  {
    [(PXPlacesPopoverImageFactory *)self thumbnailImageSizeForImageType:a3 usingTraitCollection:v6 includeScale:0];
    double v19 = v18;
    double v21 = v20;
    v22 = [(PXPlacesPopoverImageFactory *)self imageNamed:@"PXAssetsSceneBadgeInCloud"];
    [v22 size];
    double v24 = v23;
    double v26 = v25;
    double v27 = v19 - v23 + -5.0;
    double v28 = v21 - v25 + -5.0;
    v36.double width = v19;
    v36.double height = v21;
    UIGraphicsBeginImageContextWithOptions(v36, 0, 0.0);
    if (v8)
    {
      [v8 setFill];
      CurrentContext = UIGraphicsGetCurrentContext();
      v37.origin.x = 0.0;
      v37.origin.y = 0.0;
      v37.size.double width = v19;
      v37.size.double height = v21;
      CGContextFillRect(CurrentContext, v37);
    }
    [v7 setFill];
    v30 = UIGraphicsGetCurrentContext();
    v38.origin.x = 0.0;
    v38.origin.y = 0.0;
    v38.size.double width = v19;
    v38.size.double height = v21;
    CGContextFillRect(v30, v38);
    objc_msgSend(v22, "drawInRect:", v27, v28, v24, v26);
    v31 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    id v32 = v31;
    -[PXPlacesPopoverImageFactory createPopoverImageForGeotaggable:withImage:imageType:imageOptions:usingTraitCollection:](self, "createPopoverImageForGeotaggable:withImage:imageType:imageOptions:usingTraitCollection:", 0, [v32 CGImage], a3, 0, v6);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    v33 = [(PXPlacesPopoverImageFactory *)self cachedBackgroundImages];
    [v33 setObject:v17 forKey:v14];
  }
  return v17;
}

- (id)createAlbumPlaceHolderImageUsingTraitCollection:(id)a3
{
  int64_t v4 = [(PXPlacesPopoverImageFactory *)self backgroundImageNameForType:0 usingTraitCollection:a3];
  id v5 = [(PXPlacesPopoverImageFactory *)self _fetchAndCacheBackgroundImageWithName:v4];

  return v5;
}

- (id)createPopoverImageForGeotaggable:(id)a3 withImage:(CGImage *)a4 imageType:(int64_t)a5 imageOptions:(unint64_t)a6 usingTraitCollection:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  if (a6 == 1)
  {
    uint64_t v14 = [(PXPlacesPopoverImageFactory *)self _thumbnailShadowForType:a5 usingTraitCollection:v13];
  }
  else
  {
    uint64_t v14 = 0;
  }
  double v15 = 0;
  double v16 = 65.0;
  double v17 = 65.0;
  if (a5 != 1 && a5 != 4)
  {
    double v18 = [(PXPlacesPopoverImageFactory *)self backgroundImageNameForType:a5 usingTraitCollection:v13];
    double v15 = [(PXPlacesPopoverImageFactory *)self _fetchAndCacheBackgroundImageWithName:v18];
    [v15 size];
    double v17 = v19;
    [v15 size];
    double v16 = v20;
  }
  if (v14) {
    [v14 shadowBlurRadius];
  }
  else {
    double v21 = 0.0;
  }
  v58.double height = v16 + v21;
  v58.double width = v17;
  UIGraphicsBeginImageContextWithOptions(v58, 0, 0.0);
  [(PXPlacesPopoverImageFactory *)self thumbnailTopMarginForImageType:a5 usingTraitCollection:v13];
  double v56 = v22;
  [(PXPlacesPopoverImageFactory *)self thumbnailImageSizeForImageType:a5 usingTraitCollection:v13 includeScale:0];
  double v24 = v23;
  double v26 = v25;
  double v27 = v17 * 0.5;
  double v28 = v23 * 0.5;
  v29 = [(PXPlacesPopoverImageFactory *)self newImage:a4 croppedToAspectRatio:v23];
  id v30 = objc_alloc(MEMORY[0x1E4FB1818]);
  [v13 displayScale];
  v31 = objc_msgSend(v30, "initWithCGImage:scale:orientation:", v29, 0);
  CGImageRelease(v29);
  if (v14)
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    [v14 shadowOffset];
    CGFloat v34 = v33;
    double v55 = v24;
    double v35 = v17 * 0.5;
    double v36 = v26;
    double v37 = v17;
    double v38 = v16;
    CGFloat v40 = v39;
    [v14 shadowBlurRadius];
    CGFloat v42 = v41;
    id v43 = [v14 shadowColor];
    v44 = (CGColor *)[v43 CGColor];
    v59.double width = v34;
    v59.double height = v40;
    double v16 = v38;
    double v17 = v37;
    double v26 = v36;
    double v27 = v35;
    double v24 = v55;
    CGContextSetShadowWithColor(CurrentContext, v59, v42, v44);
  }
  double v45 = v27 - v28;
  if (v15)
  {
    if (a5 == 3)
    {
      v46 = UIGraphicsGetCurrentContext();
      CGContextSaveGState(v46);
      v62.origin.x = v27 - v28;
      v62.origin.y = v56;
      v62.size.double width = v24;
      v62.size.double height = v26;
      v47 = CGPathCreateWithRoundedRect(v62, 10.0, 10.0, 0);
      CGContextAddPath(v46, v47);
      CGContextClip(v46);
      CGPathRelease(v47);
      objc_msgSend(v31, "drawInRect:", v45, v56, v24, v26);
      v48 = [(PXPlacesPopoverImageFactory *)self createLegibilityGradient];
      v60.y = v56 + v26;
      v60.x = v27 - v28;
      v61.x = v27 - v28;
      v61.y = v56;
      CGContextDrawLinearGradient(v46, v48, v60, v61, 0);
      CGGradientRelease(v48);
      CGContextRestoreGState(v46);
    }
    else
    {
      objc_msgSend(v31, "drawInRect:", v27 - v28, v56, v24, v26);
    }
    objc_msgSend(v15, "drawInRect:", 0.0, 0.0, v17, v16);
  }
  else
  {
    v49 = UIGraphicsGetCurrentContext();
    v50 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v17, v16, 6.0);
    id v51 = [MEMORY[0x1E4FB1618] systemWhiteColor];
    CGContextSetFillColorWithColor(v49, (CGColorRef)[v51 CGColor]);

    [v50 fill];
    v52 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", v27 - v28, v56, v24, v26, 6.0);
    [v52 addClip];

    objc_msgSend(v31, "drawInRect:", v45, v56, v24, v26);
  }
  v53 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v53;
}

- (PXPlacesPopoverImageFactory)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXPlacesPopoverImageFactory;
  v2 = [(PXPlacesPopoverImageFactory *)&v6 init];
  if (v2)
  {
    double v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    cachedBackgroundImages = v2->_cachedBackgroundImages;
    v2->_cachedBackgroundImages = v3;
  }
  return v2;
}

+ (PXPlacesPopoverImageFactory)sharedInstance
{
  if (sharedInstance_token != -1) {
    dispatch_once(&sharedInstance_token, &__block_literal_global_97777);
  }
  v2 = (void *)_sharedInstance;
  return (PXPlacesPopoverImageFactory *)v2;
}

void __45__PXPlacesPopoverImageFactory_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_alloc_init(PXPlacesPopoverImageFactory);
  v1 = (void *)_sharedInstance;
  _sharedInstance = (uint64_t)v0;
}

+ (CGSize)backgroundImageSizeForType:(int64_t)a3 usingTraitCollection:(id)a4
{
  id v5 = a4;
  objc_super v6 = +[PXPlacesPopoverImageFactory sharedInstance];
  [v6 backgroundImageSizeForType:a3 usingTraitCollection:v5];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

@end