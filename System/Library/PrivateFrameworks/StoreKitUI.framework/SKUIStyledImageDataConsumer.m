@interface SKUIStyledImageDataConsumer
+ (BOOL)isImageCompressionEnabled;
+ (id)appIconConsumerWithSize:(CGSize)a3;
+ (id)applePackIconConsumer;
+ (id)brickConsumer;
+ (id)brickConsumerWithBrickSize:(CGSize)a3;
+ (id)cardIconConsumer;
+ (id)cardProductImageConsumer;
+ (id)categoriesMessagesConsumer;
+ (id)categoryIconConsumer;
+ (id)giftComposeProductImageConsumer;
+ (id)giftResultIconConsumer;
+ (id)giftResultProductImageConsumer;
+ (id)giftThemeIconConsumer;
+ (id)giftThemeProductImageConsumer;
+ (id)gridIconConsumer;
+ (id)listIconConsumer;
+ (id)lockupIconConsumerWithSize:(int64_t)a3;
+ (id)lockupProductImageConsumerWithSize:(int64_t)a3;
+ (id)manageMessagesConsumer;
+ (id)mixedTopChartsNewsstandConsumer;
+ (id)newsstandRoomNewsstandConsumer;
+ (id)newsstandSwooshNewsstandConsumer;
+ (id)parentBundleIconConsumer;
+ (id)productImageConsumerWithSize:(CGSize)a3;
+ (id)productPageProductImageConsumer;
+ (id)purchasedIconConsumer;
+ (id)purchasedMessagesConsumer;
+ (id)purchasedProductImageConsumer;
+ (id)roomIconConsumer;
+ (id)roomProductImageConsumer;
+ (id)safariBannerIconConsumer;
+ (id)safariBannerProductImageConsumer;
+ (id)shareSheetIconConsumer;
+ (id)swooshNewsstandConsumer;
+ (id)topChartsIconConsumer;
+ (id)topChartsNewsstandConsumer;
+ (id)updatesIconConsumer;
+ (id)updatesProductImageConsumer;
+ (id)wishlistIconConsumer;
+ (id)wishlistProductImageConsumer;
+ (void)isImageCompressionEnabled;
- (BOOL)_backgroundIsOpaque;
- (BOOL)isImagePlaceholderAvailable;
- (CGSize)imageSize;
- (CGSize)shadowOffset;
- (SKUIStyledImageDataConsumer)init;
- (SKUIStyledImageDataConsumer)initWithSize:(CGSize)a3 treatment:(int64_t)a4;
- (SKUIStyledImageDataConsumer)initWithViewElement:(id)a3;
- (UIColor)backgroundColor;
- (UIColor)borderColor;
- (UIColor)shadowColor;
- (UIEdgeInsets)borderMargins;
- (UIEdgeInsets)borderWidths;
- (UIEdgeInsets)imagePadding;
- (double)shadowRadius;
- (id)_arcRoundedImageWithBounds:(CGRect)a3 contentRect:(CGRect)a4 cornerRadius:(double)a5 drawBlock:(id)a6;
- (id)_defaultPlaceholderColor;
- (id)_dynamicUberImageWithBounds:(CGRect)a3 inputSize:(CGSize)a4 drawBlock:(id)a5;
- (id)_imageWithSize:(CGSize)a3 isOpaque:(BOOL)a4 drawBlock:(id)a5;
- (id)_leftToRightGradient:(CGRect)a3 contentRect:(CGRect)a4 drawBlock:(id)a5;
- (id)_outputImageWithInputSize:(CGSize)a3 outputSize:(CGSize)a4 drawBlock:(id)a5;
- (id)_placeholderCornerPathBlock;
- (id)_radialBlurImageWithBounds:(CGRect)a3 contentRect:(CGRect)a4 drawBlock:(id)a5;
- (id)_roundedBorderWithBounds:(CGRect)a3 contentRect:(CGRect)a4 drawBlock:(id)a5;
- (id)_scaledImageWithBounds:(CGRect)a3 contentRect:(CGRect)a4 drawBlock:(id)a5;
- (id)_uberBannerImageWithBounds:(CGRect)a3 inputSize:(CGSize)a4 drawBlock:(id)a5;
- (id)_uberImageWithBounds:(CGRect)a3 inputSize:(CGSize)a4 backgroundColor:(id)a5 drawBlock:(id)a6;
- (id)imageForColor:(id)a3;
- (id)imageForColor:(id)a3 size:(CGSize)a4;
- (id)imageForImage:(id)a3;
- (id)imagePlaceholderForColor:(id)a3;
- (int64_t)imageContentMode;
- (int64_t)imageTreatment;
- (void)_drawBordersWithImageRect:(CGRect)a3 bounds:(CGRect)a4;
- (void)init;
- (void)isImagePlaceholderAvailable;
- (void)setBackgroundColor:(id)a3;
- (void)setBorderColor:(id)a3;
- (void)setBorderMargins:(UIEdgeInsets)a3;
- (void)setBorderWidths:(UIEdgeInsets)a3;
- (void)setImageContentMode:(int64_t)a3;
- (void)setImagePadding:(UIEdgeInsets)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setImageTreatment:(int64_t)a3;
- (void)setShadowColor:(id)a3;
- (void)setShadowOffset:(CGSize)a3;
- (void)setShadowRadius:(double)a3;
@end

@implementation SKUIStyledImageDataConsumer

+ (id)appIconConsumerWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v6) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) appIconConsumerWithSize:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  v14 = objc_msgSend(objc_alloc((Class)a1), "initWithSize:treatment:", 1, width, height);

  return v14;
}

+ (id)applePackIconConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) applePackIconConsumer];
      }
    }
  }
  uint64_t v11 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  double v13 = 36.0;
  if (v12 == 1) {
    double v13 = 47.0;
  }
  v14 = objc_msgSend(a1, "appIconConsumerWithSize:", v13, v13);

  return v14;
}

+ (id)brickConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) brickConsumer];
      }
    }
  }
  uint64_t v11 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  if (v12 == 1)
  {
    double v13 = 103.0;
    double v14 = 210.0;
  }
  else
  {
    v15 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v15 bounds];
    double v17 = v16;

    if (v17 <= 375.0)
    {
      v18 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v18 bounds];
      double v20 = v19;

      double v13 = 100.0;
      if (v20 <= 320.0) {
        double v13 = 78.0;
      }
      double v14 = dbl_1C1CCB9C0[v20 > 320.0];
    }
    else
    {
      double v13 = 86.0;
      double v14 = 175.0;
    }
  }
  v21 = objc_msgSend(a1, "brickConsumerWithBrickSize:", v14, v13);

  return v21;
}

+ (id)brickConsumerWithBrickSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) brickConsumerWithBrickSize:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  double v14 = objc_msgSend(objc_alloc((Class)a1), "initWithSize:treatment:", 2, width, height);

  return v14;
}

+ (id)cardIconConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) cardIconConsumer];
      }
    }
  }
  uint64_t v11 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  double v13 = 64.0;
  if (v12 == 1) {
    double v13 = 72.0;
  }
  double v14 = objc_msgSend(a1, "appIconConsumerWithSize:", v13, v13);

  return v14;
}

+ (id)cardProductImageConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) cardProductImageConsumer];
      }
    }
  }
  uint64_t v11 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  double v13 = 64.0;
  if (v12 == 1) {
    double v13 = 72.0;
  }
  double v14 = objc_msgSend(a1, "productImageConsumerWithSize:", v13, v13);

  return v14;
}

+ (id)categoryIconConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) categoryIconConsumer];
      }
    }
  }
  uint64_t v11 = objc_msgSend(a1, "appIconConsumerWithSize:", 33.0, 33.0);

  return v11;
}

+ (id)giftComposeProductImageConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) giftComposeProductImageConsumer];
      }
    }
  }
  uint64_t v11 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  double v13 = 64.0;
  if (v12 == 1) {
    double v13 = 75.0;
  }
  double v14 = objc_msgSend(a1, "productImageConsumerWithSize:", v13, v13);

  return v14;
}

+ (id)giftResultIconConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) giftResultIconConsumer];
      }
    }
  }
  uint64_t v11 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  double v13 = 72.0;
  if (v12 == 1) {
    double v13 = 144.0;
  }
  double v14 = objc_msgSend(a1, "appIconConsumerWithSize:", v13, v13);

  return v14;
}

+ (id)giftResultProductImageConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) giftResultProductImageConsumer];
      }
    }
  }
  uint64_t v11 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  double v13 = 72.0;
  if (v12 == 1) {
    double v13 = 144.0;
  }
  double v14 = objc_msgSend(a1, "productImageConsumerWithSize:", v13, v13);

  return v14;
}

+ (id)giftThemeIconConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) giftThemeIconConsumer];
      }
    }
  }
  uint64_t v11 = objc_msgSend(a1, "appIconConsumerWithSize:", 57.0, 57.0);

  return v11;
}

+ (id)giftThemeProductImageConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) giftThemeProductImageConsumer];
      }
    }
  }
  uint64_t v11 = objc_msgSend(a1, "productImageConsumerWithSize:", 57.0, 57.0);

  return v11;
}

+ (id)gridIconConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) gridIconConsumer];
      }
    }
  }
  uint64_t v11 = objc_msgSend(a1, "appIconConsumerWithSize:", 75.0, 75.0);

  return v11;
}

+ (id)listIconConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) listIconConsumer];
      }
    }
  }
  uint64_t v11 = objc_msgSend(a1, "appIconConsumerWithSize:", 64.0, 64.0);

  return v11;
}

+ (id)lockupIconConsumerWithSize:(int64_t)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) lockupIconConsumerWithSize:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  double v13 = objc_msgSend(a1, "appIconConsumerWithSize:", SKUILockupImageSizeForLockupSize(a3, 12));

  return v13;
}

+ (id)lockupProductImageConsumerWithSize:(int64_t)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) lockupProductImageConsumerWithSize:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  double v13 = objc_msgSend(a1, "productImageConsumerWithSize:", SKUILockupImageSizeForLockupSize(a3, 12));

  return v13;
}

+ (id)mixedTopChartsNewsstandConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) mixedTopChartsNewsstandConsumer];
      }
    }
  }
  uint64_t v11 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  double v13 = 64.0;
  if (v12 == 1) {
    double v13 = 67.0;
  }
  double v14 = objc_msgSend(a1, "productImageConsumerWithSize:", v13, v13);

  return v14;
}

+ (id)newsstandRoomNewsstandConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) newsstandRoomNewsstandConsumer];
      }
    }
  }
  uint64_t v11 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v12 = [v11 userInterfaceIdiom] == 1;

  double v13 = objc_msgSend(a1, "productImageConsumerWithSize:", dbl_1C1CCB9D0[v12], dbl_1C1CCB9E0[v12]);

  return v13;
}

+ (id)newsstandSwooshNewsstandConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) newsstandSwooshNewsstandConsumer];
      }
    }
  }
  uint64_t v11 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  double v13 = 107.0;
  if (v12 != 1) {
    double v13 = 100.0;
  }
  double v14 = objc_msgSend(a1, "productImageConsumerWithSize:", dbl_1C1CCB9F0[v12 == 1], v13);

  return v14;
}

+ (id)parentBundleIconConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) parentBundleIconConsumer];
      }
    }
  }
  uint64_t v11 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  double v13 = 64.0;
  if (v12 == 1) {
    double v13 = 72.0;
  }
  double v14 = objc_msgSend(a1, "appIconConsumerWithSize:", v13, v13);

  return v14;
}

+ (id)productImageConsumerWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v6) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) productImageConsumerWithSize:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  double v14 = objc_msgSend(objc_alloc((Class)a1), "initWithSize:treatment:", 5, width, height);

  return v14;
}

+ (id)productPageProductImageConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) productPageProductImageConsumer];
      }
    }
  }
  uint64_t v11 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  double v13 = 100.0;
  if (v12 == 1) {
    double v13 = 170.0;
  }
  double v14 = objc_msgSend(a1, "productImageConsumerWithSize:", v13, v13);

  return v14;
}

+ (id)purchasedIconConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) purchasedIconConsumer];
      }
    }
  }
  uint64_t v11 = objc_msgSend(a1, "appIconConsumerWithSize:", 64.0, 64.0);

  return v11;
}

+ (id)purchasedProductImageConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) purchasedProductImageConsumer];
      }
    }
  }
  uint64_t v11 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  double v13 = 57.0;
  if (v12 == 1) {
    double v13 = 72.0;
  }
  double v14 = objc_msgSend(a1, "productImageConsumerWithSize:", v13, v13);

  return v14;
}

+ (id)roomIconConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v3) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) roomIconConsumer];
      }
    }
  }
  uint64_t v11 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  double v13 = 64.0;
  if (v12 == 1) {
    double v13 = 75.0;
  }
  double v14 = objc_msgSend(a1, "appIconConsumerWithSize:", v13, v13);

  return v14;
}

+ (id)roomProductImageConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v3) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) roomProductImageConsumer];
      }
    }
  }
  uint64_t v11 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  double v13 = 64.0;
  if (v12 == 1) {
    double v13 = 75.0;
  }
  double v14 = objc_msgSend(a1, "productImageConsumerWithSize:", v13, v13);

  return v14;
}

+ (id)safariBannerIconConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v3) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) safariBannerIconConsumer];
      }
    }
  }
  uint64_t v11 = [a1 roomIconConsumer];

  return v11;
}

+ (id)safariBannerProductImageConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v3) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) safariBannerProductImageConsumer];
      }
    }
  }
  uint64_t v11 = [a1 roomProductImageConsumer];

  return v11;
}

+ (id)shareSheetIconConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v3) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) shareSheetIconConsumer];
      }
    }
  }
  uint64_t v11 = objc_msgSend(a1, "appIconConsumerWithSize:", 100.0, 100.0);

  return v11;
}

+ (id)swooshNewsstandConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) swooshNewsstandConsumer];
      }
    }
  }
  uint64_t v11 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  double v13 = 200.0;
  if (v12 != 1) {
    double v13 = 107.0;
  }
  double v14 = objc_msgSend(a1, "productImageConsumerWithSize:", dbl_1C1CCBA00[v12 == 1], v13);

  return v14;
}

+ (id)topChartsIconConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) topChartsIconConsumer];
      }
    }
  }
  uint64_t v11 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  double v13 = 64.0;
  if (v12 == 1) {
    double v13 = 75.0;
  }
  double v14 = objc_msgSend(a1, "appIconConsumerWithSize:", v13, v13);

  return v14;
}

+ (id)topChartsNewsstandConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) topChartsNewsstandConsumer];
      }
    }
  }
  uint64_t v11 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v12 = [v11 userInterfaceIdiom] == 1;

  double v13 = objc_msgSend(a1, "productImageConsumerWithSize:", dbl_1C1CCB9D0[v12], dbl_1C1CCB9E0[v12]);

  return v13;
}

+ (id)updatesIconConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) updatesIconConsumer];
      }
    }
  }
  uint64_t v11 = objc_msgSend(a1, "appIconConsumerWithSize:", 57.0, 57.0);

  return v11;
}

+ (id)updatesProductImageConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) updatesProductImageConsumer];
      }
    }
  }
  uint64_t v11 = objc_msgSend(a1, "productImageConsumerWithSize:", 57.0, 57.0);

  return v11;
}

+ (id)wishlistIconConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) wishlistIconConsumer];
      }
    }
  }
  uint64_t v11 = objc_msgSend(a1, "appIconConsumerWithSize:", 64.0, 64.0);

  return v11;
}

+ (id)wishlistProductImageConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) wishlistProductImageConsumer];
      }
    }
  }
  uint64_t v11 = objc_msgSend(a1, "productImageConsumerWithSize:", 64.0, 64.0);

  return v11;
}

+ (id)manageMessagesConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) manageMessagesConsumer];
      }
    }
  }
  uint64_t v11 = objc_msgSend(objc_alloc((Class)a1), "initWithSize:treatment:", 15, 29.0, 22.0);

  return v11;
}

+ (id)categoriesMessagesConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) categoriesMessagesConsumer];
      }
    }
  }
  uint64_t v11 = objc_msgSend(objc_alloc((Class)a1), "initWithSize:treatment:", 15, 35.0, 26.0);

  return v11;
}

+ (id)purchasedMessagesConsumer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        +[SKUIStyledImageDataConsumer(SKUILegacy) purchasedMessagesConsumer];
      }
    }
  }
  uint64_t v11 = objc_msgSend(objc_alloc((Class)a1), "initWithSize:treatment:", 15, 64.0, 48.0);

  return v11;
}

+ (BOOL)isImageCompressionEnabled
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v2) {
        +[SKUIStyledImageDataConsumer isImageCompressionEnabled];
      }
    }
  }
  if (isImageCompressionEnabled_onceToken != -1) {
    dispatch_once(&isImageCompressionEnabled_onceToken, &__block_literal_global_25);
  }
  return isImageCompressionEnabled_isImageCompressionEnabled;
}

uint64_t __56__SKUIStyledImageDataConsumer_isImageCompressionEnabled__block_invoke()
{
  uint64_t result = CFPreferencesGetAppBooleanValue(@"SKUIImageCompressionEnabled", (CFStringRef)*MEMORY[0x1E4FA89F8], 0);
  isImageCompressionEnabled_isImageCompressionEnabled = result != 0;
  return result;
}

- (SKUIStyledImageDataConsumer)init
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v3) {
        [(SKUIStyledImageDataConsumer *)v3 init];
      }
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIStyledImageDataConsumer;
  uint64_t v11 = [(SKUIStyledImageDataConsumer *)&v16 init];
  BOOL v12 = v11;
  if (v11)
  {
    v11->_imageContentMode = 0;
    uint64_t v13 = [MEMORY[0x1E4FB1E20] _currentTraitCollection];
    startingTraitCollection = v12->_startingTraitCollection;
    v12->_startingTraitCollection = (UITraitCollection *)v13;
  }
  return v12;
}

- (SKUIStyledImageDataConsumer)initWithSize:(CGSize)a3 treatment:(int64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)SKUIStyledImageDataConsumer;
  uint64_t v7 = [(SKUIStyledImageDataConsumer *)&v10 init];
  if (v7)
  {
    if ((unint64_t)a4 <= 0xF && ((1 << a4) & 0x8026) != 0)
    {
      uint64_t v8 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
      [(SKUIStyledImageDataConsumer *)v7 setBorderColor:v8];

      -[SKUIStyledImageDataConsumer setBorderWidths:](v7, "setBorderWidths:", 1.0, 1.0, 1.0, 1.0);
    }
    -[SKUIStyledImageDataConsumer setImageSize:](v7, "setImageSize:", width, height);
    [(SKUIStyledImageDataConsumer *)v7 setImageTreatment:a4];
    [(SKUIStyledImageDataConsumer *)v7 setImageContentMode:0];
  }
  return v7;
}

- (SKUIStyledImageDataConsumer)initWithViewElement:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v5) {
        -[SKUIStyledImageDataConsumer initWithViewElement:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = [(SKUIStyledImageDataConsumer *)self init];
  if (v13)
  {
    double v14 = [v4 style];
    v13->_imageContentMode = [v14 fillImage] == 1;
    [v14 elementPadding];
    v13->_imagePadding.top = v15;
    v13->_imagePadding.left = v16;
    v13->_imagePadding.bottom = v17;
    v13->_imagePadding.right = v18;
    uint64_t v19 = [v14 ikBackgroundColor];
    iKBackgroundColor = v13->_iKBackgroundColor;
    v13->_iKBackgroundColor = (IKColor *)v19;

    v21 = [v14 ikBackgroundColor];
    uint64_t v22 = [v21 color];
    backgroundColor = v13->_backgroundColor;
    v13->_backgroundColor = (UIColor *)v22;

    v24 = [v14 imageTreatment];
    v13->_unint64_t imageTreatment = SKUIImageTreatmentForString(v24);

    unint64_t imageTreatment = v13->_imageTreatment;
    if (imageTreatment <= 0x10)
    {
      if (((1 << imageTreatment) & 0x10026) != 0)
      {
        p_borderWidths = &v13->_borderWidths;
        __asm { FMOV            V0.2D, #1.0 }
        *(_OWORD *)&v13->_borderWidths.top = _Q0;
        v13->_borderWidths.bottom = 1.0;
        double v32 = 1.0;
LABEL_9:
        p_borderWidths->right = v32;
        [v14 borderMargins];
        v13->_borderMargins.top = v33;
        v13->_borderMargins.left = v34;
        v13->_borderMargins.bottom = v35;
        v13->_borderMargins.right = v36;
        if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&v13->_borderWidths.top, *MEMORY[0x1E4FB2848]), (int32x4_t)vceqq_f64(*(float64x2_t *)&v13->_borderWidths.bottom, *(float64x2_t *)(MEMORY[0x1E4FB2848] + 16)))), 0xFuLL))) & 1) == 0)
        {
          v37 = [v14 ikBorderColor];
          uint64_t v38 = [v37 color];
          borderColor = v13->_borderColor;
          v13->_borderColor = (UIColor *)v38;

          if (!v13->_borderColor)
          {
            v40 = v13->_backgroundColor;
            if (v40)
            {
              switch(SKUIColorSchemeStyleForColor(v40))
              {
                case 0:
                case 2:
                  goto LABEL_13;
                case 1:
                case 3:
                  v41 = (void *)MEMORY[0x1E4FB1618];
                  double v42 = 0.15;
                  double v43 = 1.0;
                  goto LABEL_18;
                default:
                  break;
              }
            }
            else
            {
LABEL_13:
              v41 = (void *)MEMORY[0x1E4FB1618];
              double v42 = 0.2;
              double v43 = 0.0;
LABEL_18:
              uint64_t v47 = [v41 colorWithWhite:v43 alpha:v42];
              v48 = v13->_borderColor;
              v13->_borderColor = (UIColor *)v47;
            }
          }
          v49 = [v14 borderRadius];
          [v49 edgeInsetsValue];
          v13->_borderRadii.top = v50;
          v13->_borderRadii.left = v51;
          v13->_borderRadii.bottom = v52;
          v13->_borderRadii.right = v53;
        }
        uint64_t v54 = [v4 shadowColor];
        shadowColor = v13->_shadowColor;
        v13->_shadowColor = (UIColor *)v54;

        [v4 shadowOffset];
        v13->_shadowOffset.double width = v56;
        v13->_shadowOffset.double height = v57;
        [v4 shadowRadius];
        v13->_shadowRadius = v58;

        goto LABEL_21;
      }
      if (imageTreatment == 3)
      {
        p_borderWidths = &v13->_borderWidths;
        v13->_borderWidths.top = 0.0;
        v13->_borderWidths.left = 0.0;
        v13->_borderWidths.bottom = 1.0;
        double v32 = 0.0;
        goto LABEL_9;
      }
    }
    p_borderWidths = &v13->_borderWidths;
    [v14 borderWidths];
    v13->_borderWidths.top = v44;
    v13->_borderWidths.left = v45;
    v13->_borderWidths.bottom = v46;
    goto LABEL_9;
  }
LABEL_21:

  return v13;
}

- (id)imageForColor:(id)a3
{
  return -[SKUIStyledImageDataConsumer imageForColor:size:](self, "imageForColor:size:", a3, self->_imageSize.width, self->_imageSize.height);
}

- (id)imageForColor:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  uint64_t v8 = v7;
  if (width < 0.00000011920929 || height < 0.00000011920929)
  {
    uint64_t v10 = 0;
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __50__SKUIStyledImageDataConsumer_imageForColor_size___block_invoke;
    v12[3] = &unk_1E6426D08;
    id v13 = v7;
    double v14 = self;
    uint64_t v10 = -[SKUIStyledImageDataConsumer _outputImageWithInputSize:outputSize:drawBlock:](self, "_outputImageWithInputSize:outputSize:drawBlock:", v12, width, height, width, height);
  }

  return v10;
}

void __50__SKUIStyledImageDataConsumer_imageForColor_size___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  if (*(void *)(a1 + 32))
  {
    [*(id *)(a1 + 32) set];
  }
  else
  {
    uint64_t v9 = [*(id *)(a1 + 40) _defaultPlaceholderColor];
    [v9 set];
  }
  double v10 = a2;
  double v11 = a3;
  double v12 = a4;
  double v13 = a5;

  UIRectFill(*(CGRect *)&v10);
}

- (id)imageForImage:(id)a3
{
  id v4 = a3;
  [v4 size];
  double v6 = v5;
  double v8 = v7;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __45__SKUIStyledImageDataConsumer_imageForImage___block_invoke;
  v14[3] = &unk_1E6426D30;
  id v15 = v4;
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  id v11 = v4;
  double v12 = -[SKUIStyledImageDataConsumer _outputImageWithInputSize:outputSize:drawBlock:](self, "_outputImageWithInputSize:outputSize:drawBlock:", v14, v6, v8, width, height);

  return v12;
}

uint64_t __45__SKUIStyledImageDataConsumer_imageForImage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:");
}

- (BOOL)isImagePlaceholderAvailable
{
  unint64_t imageTreatment = self->_imageTreatment;
  if (imageTreatment > 0x10) {
    return 0;
  }
  if (((1 << imageTreatment) & 0x1CD06) != 0) {
    return 1;
  }
  if (((1 << imageTreatment) & 0xA9) == 0) {
    return 0;
  }
  double top = self->_borderWidths.top;
  double left = self->_borderWidths.left;
  double bottom = self->_borderWidths.bottom;
  double right = self->_borderWidths.right;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v8) {
        [(SKUIStyledImageDataConsumer *)v8 isImagePlaceholderAvailable];
      }
    }
  }
  BOOL v16 = left == right;
  if (top != bottom) {
    BOOL v16 = 0;
  }
  return left == top && v16;
}

- (id)imagePlaceholderForColor:(id)a3
{
  id v4 = (UIColor *)a3;
  if (!v4)
  {
    id v4 = [(SKUIStyledImageDataConsumer *)self _defaultPlaceholderColor];
  }
  double v5 = 0;
  switch(self->_imageTreatment)
  {
    case 0:
    case 3:
    case 5:
    case 7:
      double top = self->_borderWidths.top;
      double left = self->_borderWidths.left;
      double bottom = self->_borderWidths.bottom;
      double right = self->_borderWidths.right;
      if (os_variant_has_internal_content())
      {
        if (_os_feature_enabled_impl())
        {
          BOOL v18 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
          if (v18) {
            [(SKUIStyledImageDataConsumer *)v18 isImagePlaceholderAvailable];
          }
        }
      }
      if (left == right && top == bottom && left == top)
      {
        v28 = [SKUIImagePlaceholder alloc];
        borderColor = self->_borderColor;
        double v30 = self->_borderWidths.left;
        v31 = v4;
        goto LABEL_20;
      }
      double v5 = 0;
      break;
    case 1:
    case 2:
    case 0xALL:
    case 0xBLL:
    case 0xFLL:
    case 0x10:
      double v6 = [SKUIImagePlaceholder alloc];
      double v7 = self->_borderColor;
      CGFloat v8 = self->_borderWidths.top;
      uint64_t v9 = [(SKUIStyledImageDataConsumer *)self _placeholderCornerPathBlock];
      uint64_t v10 = v6;
      uint64_t v11 = v4;
      uint64_t v12 = v7;
      double v13 = v8;
      goto LABEL_5;
    case 8:
      v28 = [SKUIImagePlaceholder alloc];
      double v30 = 0.0;
      v31 = v4;
      borderColor = 0;
LABEL_20:
      double v5 = [(SKUIImagePlaceholder *)v28 initWithBackgroundColor:v31 borderColor:borderColor borderWidth:v30 cornerRadius:0.0];
      break;
    case 0xELL:
      CGFloat v33 = [SKUIImagePlaceholder alloc];
      CGFloat v34 = self->_borderColor;
      uint64_t v9 = [(SKUIStyledImageDataConsumer *)self _placeholderCornerPathBlock];
      double v13 = 0.0;
      uint64_t v10 = v33;
      uint64_t v11 = v34;
      uint64_t v12 = 0;
LABEL_5:
      double v5 = [(SKUIImagePlaceholder *)v10 initWithBackgroundColor:v11 borderColor:v12 borderWidth:v9 cornerPathBlock:v13];

      break;
    default:
      break;
  }

  return v5;
}

- (id)_placeholderCornerPathBlock
{
  BOOL v3 = 0;
  switch(self->_imageTreatment)
  {
    case 1:
      BOOL v3 = &__block_literal_global_10;
      break;
    case 2:
      BOOL v3 = &__block_literal_global_13;
      break;
    case 0xALL:
    case 0xBLL:
      BOOL v3 = &__block_literal_global_15;
      break;
    case 0xELL:
      CGFloat top = self->_borderRadii.top;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __58__SKUIStyledImageDataConsumer__placeholderCornerPathBlock__block_invoke_4;
      aBlock[3] = &__block_descriptor_40_e53___UIBezierPath_40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
      *(CGFloat *)&aBlock[4] = top;
      BOOL v3 = _Block_copy(aBlock);
      break;
    case 0xFLL:
      BOOL v3 = &__block_literal_global_17;
      break;
    case 0x10:
      BOOL v3 = &__block_literal_global_19;
      break;
    default:
      break;
  }

  return v3;
}

id __58__SKUIStyledImageDataConsumer__placeholderCornerPathBlock__block_invoke(double a1, double a2, double a3, double a4)
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v8) {
        __58__SKUIStyledImageDataConsumer__placeholderCornerPathBlock__block_invoke_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  if (a4 >= a3) {
    double v16 = a4;
  }
  else {
    double v16 = a3;
  }
  CGFloat v17 = objc_msgSend(MEMORY[0x1E4FB14C0], "_bezierPathWithArcRoundedRect:cornerRadius:", a1, a2, a3, a4, v16 / 57.0 * 13.5);

  return v17;
}

uint64_t __58__SKUIStyledImageDataConsumer__placeholderCornerPathBlock__block_invoke_2(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(MEMORY[0x1E4FB14C0], "_bezierPathWithArcRoundedRect:cornerRadius:", a1, a2, a3, a4, 10.0);
}

uint64_t __58__SKUIStyledImageDataConsumer__placeholderCornerPathBlock__block_invoke_3()
{
  return objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:");
}

uint64_t __58__SKUIStyledImageDataConsumer__placeholderCornerPathBlock__block_invoke_4(uint64_t a1, double a2, double a3, double a4, double a5)
{
  return objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", a2, a3, a4, a5, *(double *)(a1 + 32));
}

uint64_t __58__SKUIStyledImageDataConsumer__placeholderCornerPathBlock__block_invoke_5(double a1, double a2, double a3, double a4)
{
  double v8 = CGRectGetHeight(*(CGRect *)&a1) * 0.5;
  uint64_t v9 = (void *)MEMORY[0x1E4FB14C0];

  return objc_msgSend(v9, "_bezierPathWithArcRoundedRect:cornerRadius:", a1, a2, a3, a4, v8);
}

uint64_t __58__SKUIStyledImageDataConsumer__placeholderCornerPathBlock__block_invoke_6(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(MEMORY[0x1E4FB14C0], "_bezierPathWithArcRoundedRect:cornerRadius:", a1, a2, a3, a4, 6.0);
}

- (BOOL)_backgroundIsOpaque
{
  backgroundColor = self->_backgroundColor;
  if (backgroundColor) {
    LOBYTE(backgroundColor) = CGColorGetAlpha([(UIColor *)backgroundColor CGColor]) == 1.0;
  }
  return (char)backgroundColor;
}

- (id)_defaultPlaceholderColor
{
  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
  {
    switch(SKUIColorSchemeStyleForColor(backgroundColor))
    {
      case 0:
      case 2:
        id v4 = self->_backgroundColor;
        float v5 = -0.2;
        goto LABEL_6;
      case 1:
      case 3:
        id v4 = self->_backgroundColor;
        float v5 = 0.15;
LABEL_6:
        double v6 = SKUIColorByAdjustingBrightness(v4, v5);
        break;
      default:
        double v6 = 0;
        break;
    }
  }
  else
  {
    double v6 = [MEMORY[0x1E4FB1618] colorWithWhite:0.85 alpha:1.0];
  }

  return v6;
}

- (void)_drawBordersWithImageRect:(CGRect)a3 bounds:(CGRect)a4
{
  borderColor = self->_borderColor;
  if (borderColor)
  {
    double height = a4.size.height;
    double width = a4.size.width;
    double y = a4.origin.y;
    double x = a4.origin.x;
    double v10 = a3.size.height;
    double v11 = a3.size.width;
    double v12 = a3.origin.y;
    double v13 = a3.origin.x;
    [(UIColor *)borderColor set];
    if (x >= v13) {
      double v14 = x;
    }
    else {
      double v14 = v13;
    }
    double rect = v14;
    if (y < v12) {
      double y = v12;
    }
    if (height >= v10) {
      double v15 = v10;
    }
    else {
      double v15 = height;
    }
    if (width >= v11) {
      double v16 = v11;
    }
    else {
      double v16 = width;
    }
    double v33 = v16;
    CGFloat v17 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v17 scale];
    double v19 = v18;

    double left = self->_borderWidths.left;
    double v20 = self->_borderWidths.top / v19;
    double bottom = self->_borderWidths.bottom;
    double v22 = self->_borderWidths.right / v19;
    if (v20 > 0.00000011920929)
    {
      v36.size.double width = v33;
      v36.origin.double x = rect;
      v36.origin.double y = y;
      v36.size.double height = self->_borderWidths.top / v19;
      UIRectFillUsingBlendMode(v36, kCGBlendModeNormal);
    }
    double v23 = y + v20;
    double v24 = v15;
    double v25 = v15 - v20;
    double v26 = bottom / v19;
    if (v22 > 0.00000011920929)
    {
      v37.origin.double x = rect + v33 - v22;
      v37.size.double height = v25 - v26;
      v37.origin.double y = v23;
      v37.size.double width = v22;
      UIRectFillUsingBlendMode(v37, kCGBlendModeNormal);
    }
    double v27 = left / v19;
    if (v26 > 0.00000011920929)
    {
      v38.origin.double y = y + v24 - v26;
      v38.size.double width = v33;
      v38.origin.double x = rect;
      v38.size.double height = v26;
      UIRectFillUsingBlendMode(v38, kCGBlendModeNormal);
    }
    if (v27 > 0.00000011920929)
    {
      double v29 = rect;
      double v30 = v23;
      double v31 = v27;
      double v28 = v25 - v26;
      UIRectFillUsingBlendMode(*(CGRect *)&v29, kCGBlendModeNormal);
    }
  }
}

- (id)_outputImageWithInputSize:(CGSize)a3 outputSize:(CGSize)a4 drawBlock:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  double v7 = a3.height;
  double v8 = a3.width;
  id v10 = a5;
  double v11 = (void *)MEMORY[0x1C8749310]();
  switch(self->_imageTreatment)
  {
    case 0:
    case 3:
    case 5:
    case 7:
      CGFloat right = self->_imagePadding.right;
      long long v101 = *(_OWORD *)&self->_imagePadding.left;
      CGFloat top = self->_imagePadding.top;
      SKUIImageRectForBoundsAndPadding();
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      goto LABEL_3;
    case 1:
      CGFloat v108 = self->_imagePadding.right;
      long long v102 = *(_OWORD *)&self->_imagePadding.left;
      SKUIImageRectForBoundsAndPadding();
      double x = v28;
      double y = v29;
      double v23 = v30;
      double v24 = v31;
      if (os_variant_has_internal_content())
      {
        if (_os_feature_enabled_impl())
        {
          BOOL v32 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
          if (v32) {
            __58__SKUIStyledImageDataConsumer__placeholderCornerPathBlock__block_invoke_cold_1(v32, v33, v34, v35, v36, v37, v38, v39);
          }
        }
      }
      if (v24 >= v23) {
        double v40 = v24;
      }
      else {
        double v40 = v23;
      }
      double v26 = v40 / 57.0 * 13.5;
      goto LABEL_16;
    case 2:
      CGFloat v109 = self->_imagePadding.right;
      long long v103 = *(_OWORD *)&self->_imagePadding.left;
      SKUIImageRectForBoundsAndPadding();
      double v42 = v41;
      double v44 = v43;
      double v46 = v45;
      double v48 = v47;
      *(double *)&uint64_t v49 = 10.0;
      goto LABEL_28;
    case 4:
      CGFloat v110 = self->_imagePadding.right;
      long long v104 = *(_OWORD *)&self->_imagePadding.left;
      CGFloat v97 = self->_imagePadding.top;
      SKUIImageRectForBoundsAndPadding();
      uint64_t v20 = -[SKUIStyledImageDataConsumer _leftToRightGradient:contentRect:drawBlock:](self, "_leftToRightGradient:contentRect:drawBlock:", v10, 0.0, 0.0, width, height, v50, v51, v52, v53, *(void *)&v97, v104, *(void *)&v110);
      goto LABEL_31;
    case 6:
      CGFloat v111 = self->_imagePadding.right;
      long long v105 = *(_OWORD *)&self->_imagePadding.left;
      CGFloat v98 = self->_imagePadding.top;
      SKUIImageRectForBoundsAndPadding();
      double v58 = -[SKUIStyledImageDataConsumer _scaledImageWithBounds:contentRect:drawBlock:](self, "_scaledImageWithBounds:contentRect:drawBlock:", v10, 0.0, 0.0, width, height, v54, v55, v56, v57, *(void *)&v98, v105, *(void *)&v111);
      double v27 = [v58 imageWithRenderingMode:2];

      break;
    case 8:
      uint64_t v20 = -[SKUIStyledImageDataConsumer _dynamicUberImageWithBounds:inputSize:drawBlock:](self, "_dynamicUberImageWithBounds:inputSize:drawBlock:", v10, 0.0, 0.0, width, height, v8, v7);
      goto LABEL_31;
    case 9:
      uint64_t v20 = -[SKUIStyledImageDataConsumer _uberBannerImageWithBounds:inputSize:drawBlock:](self, "_uberBannerImageWithBounds:inputSize:drawBlock:", v10, 0.0, 0.0, width, height, v8, v7);
      goto LABEL_31;
    case 0xALL:
    case 0xBLL:
      CGFloat v108 = self->_imagePadding.right;
      long long v102 = *(_OWORD *)&self->_imagePadding.left;
      SKUIImageRectForBoundsAndPadding();
      double x = v116.origin.x;
      double y = v116.origin.y;
      double v23 = v116.size.width;
      double v24 = v116.size.height;
      double v25 = CGRectGetWidth(v116) * 0.5;
      v117.origin.double x = x;
      v117.origin.double y = y;
      v117.size.double width = v23;
      v117.size.double height = v24;
      double v26 = CGRectGetHeight(v117) * 0.5;
      if (v25 >= v26) {
        double v26 = v25;
      }
LABEL_16:
      -[SKUIStyledImageDataConsumer _arcRoundedImageWithBounds:contentRect:cornerRadius:drawBlock:](self, "_arcRoundedImageWithBounds:contentRect:cornerRadius:drawBlock:", v10, 0.0, 0.0, width, height, x, y, v23, v24, *(void *)&v26, v102, *(void *)&v108);
      goto LABEL_30;
    case 0xCLL:
      CGFloat right = self->_imagePadding.right;
      long long v101 = *(_OWORD *)&self->_imagePadding.left;
      CGFloat top = self->_imagePadding.top;
      SKUIImageRectForBoundsAndPadding();
      double v13 = v59;
      double v15 = v60;
      double v17 = v61;
      double v19 = v62;
      goto LABEL_24;
    case 0xDLL:
      double width = v8 + self->_imagePadding.left + self->_imagePadding.right;
      double height = v7 + self->_imagePadding.top + self->_imagePadding.bottom;
      long long v101 = *(_OWORD *)&self->_imagePadding.left;
      CGFloat right = self->_imagePadding.right;
      CGFloat top = self->_imagePadding.top;
      SKUIImageRectForBoundsAndPadding();
      double v13 = v63;
      double v15 = v64;
      double v17 = v65;
      double v19 = v66;
      if (self->_imagePadding.bottom < 0.00000011920929)
      {
LABEL_3:
        uint64_t v20 = -[SKUIStyledImageDataConsumer _scaledImageWithBounds:contentRect:drawBlock:](self, "_scaledImageWithBounds:contentRect:drawBlock:", v10, 0.0, 0.0, width, height, v13, v15, v17, v19, *(void *)&top, v101, *(void *)&right);
      }
      else
      {
LABEL_24:
        uint64_t v20 = -[SKUIStyledImageDataConsumer _radialBlurImageWithBounds:contentRect:drawBlock:](self, "_radialBlurImageWithBounds:contentRect:drawBlock:", v10, 0.0, 0.0, width, height, v13, v15, v17, v19, *(void *)&top, v101, *(void *)&right);
      }
      goto LABEL_31;
    case 0xELL:
      CGFloat v112 = self->_borderWidths.right;
      long long v106 = *(_OWORD *)&self->_borderWidths.left;
      CGFloat v99 = self->_borderWidths.top;
      SKUIImageRectForBoundsAndPadding();
      uint64_t v20 = -[SKUIStyledImageDataConsumer _roundedBorderWithBounds:contentRect:drawBlock:](self, "_roundedBorderWithBounds:contentRect:drawBlock:", v10, 0.0, 0.0, width, height, v67, v68, v69, v70, *(void *)&v99, v106, *(void *)&v112);
      goto LABEL_31;
    case 0xFLL:
      CGFloat v109 = self->_imagePadding.right;
      long long v103 = *(_OWORD *)&self->_imagePadding.left;
      SKUIImageRectForBoundsAndPadding();
      double v42 = v71;
      double v44 = v72;
      double v46 = v73;
      double v48 = v74;
      double v100 = v74 * 0.5;
      goto LABEL_29;
    case 0x10:
      CGFloat v109 = self->_imagePadding.right;
      long long v103 = *(_OWORD *)&self->_imagePadding.left;
      SKUIImageRectForBoundsAndPadding();
      double v42 = v75;
      double v44 = v76;
      double v46 = v77;
      double v48 = v78;
      *(double *)&uint64_t v49 = 6.0;
LABEL_28:
      double v100 = *(double *)&v49;
LABEL_29:
      -[SKUIStyledImageDataConsumer _arcRoundedImageWithBounds:contentRect:cornerRadius:drawBlock:](self, "_arcRoundedImageWithBounds:contentRect:cornerRadius:drawBlock:", v10, 0.0, 0.0, width, height, v42, v44, v46, v48, *(void *)&v100, v103, *(void *)&v109);
      uint64_t v20 = LABEL_30:;
LABEL_31:
      double v27 = (void *)v20;
      break;
    default:
      double v27 = 0;
      break;
  }
  p_shadowOffset = &self->_shadowOffset;
  if (self->_shadowOffset.width != *MEMORY[0x1E4F1DB30]
    || self->_shadowOffset.height != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    [v27 size];
    CGFloat v82 = v81 + (fabs(p_shadowOffset->width) + self->_shadowRadius) * 2.0;
    [v27 size];
    double shadowRadius = self->_shadowRadius;
    double v84 = fabs(self->_shadowOffset.height) + shadowRadius;
    CGFloat v86 = v85 + v84 * 2.0;
    double v87 = shadowRadius + fabs(p_shadowOffset->width);
    v88 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v88 scale];
    CGFloat v90 = v89;
    v114.double width = v82;
    v114.double height = v86;
    UIGraphicsBeginImageContextWithOptions(v114, 0, v90);

    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSetBlendMode(CurrentContext, kCGBlendModeMultiply);
    double v92 = self->_shadowRadius;
    v93 = [(UIColor *)self->_shadowColor CGColor];
    v115.double width = p_shadowOffset->width;
    v115.double height = self->_shadowOffset.height;
    CGContextSetShadowWithColor(CurrentContext, v115, v92, v93);
    objc_msgSend(v27, "drawAtPoint:", v87, v84);
    uint64_t v94 = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    double v27 = (void *)v94;
  }

  return v27;
}

- (id)_imageWithSize:(CGSize)a3 isOpaque:(BOOL)a4 drawBlock:(id)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  double v8 = (void (**)(id, uint64_t))a5;
  uint64_t v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v9 scale];
  CGFloat v11 = v10;

  v17.CGFloat width = width;
  v17.CGFloat height = height;
  UIGraphicsBeginImageContextWithOptions(v17, a4, v11);
  if (+[SKUIStyledImageDataConsumer isImageCompressionEnabled])
  {
    uint64_t HasASTCSupport = SKUIGraphicsDeviceHasASTCSupport();
    v8[2](v8, HasASTCSupport);
    if (HasASTCSupport)
    {
      uint64_t v13 = SKUIGraphicsGetASTCImageFromCurrentImageContext(v11);
      goto LABEL_6;
    }
  }
  else
  {
    v8[2](v8, 0);
  }
  uint64_t v13 = UIGraphicsGetImageFromCurrentImageContext();
LABEL_6:
  double v14 = (void *)v13;
  UIGraphicsEndImageContext();

  return v14;
}

- (id)_arcRoundedImageWithBounds:(CGRect)a3 contentRect:(CGRect)a4 cornerRadius:(double)a5 drawBlock:(id)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v10 = a3.size.height;
  double v11 = a3.size.width;
  id v13 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __93__SKUIStyledImageDataConsumer__arcRoundedImageWithBounds_contentRect_cornerRadius_drawBlock___block_invoke;
  v18[3] = &unk_1E6426D98;
  CGFloat v20 = x;
  CGFloat v21 = y;
  CGFloat v22 = width;
  CGFloat v23 = height;
  double v24 = a5;
  id v14 = v13;
  v18[4] = self;
  id v19 = v14;
  double v15 = -[SKUIStyledImageDataConsumer _imageWithSize:isOpaque:drawBlock:](self, "_imageWithSize:isOpaque:drawBlock:", 0, v18, v11, v10);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v15;
    [v16 setCornerRadius:a5];
    [v16 setCornerType:1];
    if (self->_borderColor)
    {
      objc_msgSend(v16, "setBorderColor:");
      [v16 setBorderWidth:1.0];
    }
  }

  return v15;
}

void __93__SKUIStyledImageDataConsumer__arcRoundedImageWithBounds_contentRect_cornerRadius_drawBlock___block_invoke(uint64_t a1, char a2)
{
  objc_msgSend(MEMORY[0x1E4FB14C0], "_bezierPathWithArcRoundedRect:cornerRadius:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setLineWidth:1.0];
  [v5 addClip];
  (*(void (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(*(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  if ((a2 & 1) == 0)
  {
    id v4 = *(void **)(*(void *)(a1 + 32) + 64);
    if (v4)
    {
      [v4 set];
      [v5 strokeWithBlendMode:0 alpha:1.0];
    }
  }
}

- (id)_scaledImageWithBounds:(CGRect)a3 contentRect:(CGRect)a4 drawBlock:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v9 = a3.size.height;
  double v10 = a3.size.width;
  CGFloat v11 = a3.origin.y;
  CGFloat v12 = a3.origin.x;
  id v14 = a5;
  BOOL v15 = [(SKUIStyledImageDataConsumer *)self _backgroundIsOpaque];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __76__SKUIStyledImageDataConsumer__scaledImageWithBounds_contentRect_drawBlock___block_invoke;
  v19[3] = &unk_1E6426DC0;
  CGFloat v21 = v12;
  CGFloat v22 = v11;
  double v23 = v10;
  double v24 = v9;
  v19[4] = self;
  id v20 = v14;
  CGFloat v25 = x;
  CGFloat v26 = y;
  CGFloat v27 = width;
  CGFloat v28 = height;
  id v16 = v14;
  CGSize v17 = -[SKUIStyledImageDataConsumer _imageWithSize:isOpaque:drawBlock:](self, "_imageWithSize:isOpaque:drawBlock:", v15, v19, v10, v9);

  return v17;
}

uint64_t __76__SKUIStyledImageDataConsumer__scaledImageWithBounds_contentRect_drawBlock___block_invoke(uint64_t a1)
{
  BOOL v2 = *(void **)(*(void *)(a1 + 32) + 56);
  if (v2)
  {
    [v2 set];
    UIRectFill(*(CGRect *)(a1 + 48));
  }
  (*(void (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(*(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  BOOL v3 = *(void **)(a1 + 32);
  double v4 = *(double *)(a1 + 80);
  double v5 = *(double *)(a1 + 88);
  double v6 = *(double *)(a1 + 96);
  double v7 = *(double *)(a1 + 104);
  double v8 = *(double *)(a1 + 48);
  double v9 = *(double *)(a1 + 56);
  double v10 = *(double *)(a1 + 64);
  double v11 = *(double *)(a1 + 72);

  return objc_msgSend(v3, "_drawBordersWithImageRect:bounds:", v4, v5, v6, v7, v8, v9, v10, v11);
}

- (id)_radialBlurImageWithBounds:(CGRect)a3 contentRect:(CGRect)a4 drawBlock:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v9 = a3.size.height;
  double v10 = a3.size.width;
  CGFloat v11 = a3.origin.y;
  CGFloat v12 = a3.origin.x;
  id v14 = a5;
  BOOL v15 = [(SKUIStyledImageDataConsumer *)self _backgroundIsOpaque];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __80__SKUIStyledImageDataConsumer__radialBlurImageWithBounds_contentRect_drawBlock___block_invoke;
  v19[3] = &unk_1E6426DC0;
  CGFloat v21 = v12;
  CGFloat v22 = v11;
  double v23 = v10;
  double v24 = v9;
  v19[4] = self;
  id v20 = v14;
  CGFloat v25 = x;
  CGFloat v26 = y;
  CGFloat v27 = width;
  CGFloat v28 = height;
  id v16 = v14;
  CGSize v17 = -[SKUIStyledImageDataConsumer _imageWithSize:isOpaque:drawBlock:](self, "_imageWithSize:isOpaque:drawBlock:", v15, v19, v10, v9);

  return v17;
}

void __80__SKUIStyledImageDataConsumer__radialBlurImageWithBounds_contentRect_drawBlock___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  BOOL v2 = *(void **)(*(void *)(a1 + 32) + 56);
  if (v2)
  {
    [v2 set];
    UIRectFill(*(CGRect *)(a1 + 48));
  }
  (*(void (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(*(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  BOOL v3 = *(void **)(*(void *)(a1 + 32) + 56);
  if (v3)
  {
    long long v37 = 0u;
    memset(v38, 0, 48);
    __asm { FMOV            V0.2D, #1.0 }
    v38[3] = _Q0;
    [v3 getRed:&v37 green:(char *)&v37 + 8 blue:v38 alpha:0];
    *(_OWORD *)((char *)&v38[1] + 8) = v37;
    *((void *)&v38[2] + 1) = *(void *)&v38[0];
    double v10 = *(double *)(a1 + 64);
    double v9 = *(double *)(a1 + 72);
    *(_OWORD *)locations = xmmword_1C1CCBCE0;
    uint64_t v36 = 0x3FF0000000000000;
    *(_OWORD *)components = v37;
    components[2] = *(CGFloat *)v38;
    components[3] = 0.0;
    long long v29 = v37;
    uint64_t v30 = *(void *)&v38[0];
    uint64_t v31 = 0x3FE3333340000000;
    long long v32 = v37;
    uint64_t v33 = *(void *)&v38[0];
    uint64_t v34 = 0x3FF0000000000000;
    CurrentContext = UIGraphicsGetCurrentContext();
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    id v13 = CGGradientCreateWithColorComponents(DeviceRGB, components, locations, 3uLL);
    float v14 = v10 * 0.25;
    double v15 = ceilf(v14);
    uint64_t v16 = *(void *)(a1 + 32);
    CGSize v17 = (float64x2_t *)(v16 + 200);
    double v18 = (float64x2_t *)(v16 + 168);
    float64x2_t v19 = *(float64x2_t *)(MEMORY[0x1E4FB2848] + 16);
    double v20 = -0.0;
    if (vaddv_s16((int16x4_t)vand_s8((int8x8_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*v17, *MEMORY[0x1E4FB2848]), (int32x4_t)vceqq_f64(v17[1], v19))), 0xFuLL)), (int8x8_t)0x8000400020001)) != 15)double v20 = v17[1].f64[0]; {
    double v21 = v20 + v15;
    }
    double v22 = 0.0;
    if (vaddv_s16((int16x4_t)vand_s8((int8x8_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*v18, *MEMORY[0x1E4FB2848]), (int32x4_t)vceqq_f64(v18[1], v19))), 0xFuLL)), (int8x8_t)0x8000400020001)) != 15)double v22 = v18[1].f64[0]; {
    double v23 = v21 - v22;
    }
    float v24 = v10 * 0.5;
    v40.CGFloat x = floorf(v24);
    float v25 = v10 * 1.70000005;
    CGFloat v26 = ceilf(v25);
    float v27 = v10 * 1.89999998;
    v40.CGFloat y = v9 - v26 - v23;
    CGContextDrawRadialGradient(CurrentContext, v13, v40, v26, v40, ceilf(v27), 2u);
    CGColorSpaceRelease(DeviceRGB);
    CGGradientRelease(v13);
  }
}

- (id)_roundedBorderWithBounds:(CGRect)a3 contentRect:(CGRect)a4 drawBlock:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v9 = a3.size.height;
  double v10 = a3.size.width;
  CGFloat v11 = a3.origin.y;
  CGFloat v12 = a3.origin.x;
  id v14 = a5;
  BOOL v15 = [(SKUIStyledImageDataConsumer *)self _backgroundIsOpaque];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __78__SKUIStyledImageDataConsumer__roundedBorderWithBounds_contentRect_drawBlock___block_invoke;
  v19[3] = &unk_1E6426DC0;
  CGFloat v21 = v12;
  CGFloat v22 = v11;
  double v23 = v10;
  double v24 = v9;
  CGFloat v25 = x;
  CGFloat v26 = y;
  CGFloat v27 = width;
  CGFloat v28 = height;
  v19[4] = self;
  id v20 = v14;
  id v16 = v14;
  CGSize v17 = -[SKUIStyledImageDataConsumer _imageWithSize:isOpaque:drawBlock:](self, "_imageWithSize:isOpaque:drawBlock:", v15, v19, v10, v9);

  return v17;
}

void __78__SKUIStyledImageDataConsumer__roundedBorderWithBounds_contentRect_drawBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(*(void *)(a1 + 32) + 8));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(a1 + 32) + 64) setFill];
  [v8 fill];
  double Width = CGRectGetWidth(*(CGRect *)(a1 + 48));
  double v3 = floor((Width - CGRectGetWidth(*(CGRect *)(a1 + 80))) * 0.5);
  double Height = CGRectGetHeight(*(CGRect *)(a1 + 48));
  double v5 = floor((Height - CGRectGetHeight(*(CGRect *)(a1 + 80))) * 0.5);
  double v6 = CGRectGetWidth(*(CGRect *)(a1 + 80));
  CGFloat v7 = CGRectGetHeight(*(CGRect *)(a1 + 80));
  (*(void (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(v3, v5, v6, v7);
}

- (id)_uberBannerImageWithBounds:(CGRect)a3 inputSize:(CGSize)a4 drawBlock:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  double v7 = a3.size.height;
  double v8 = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v12 = a5;
  BOOL v13 = [(SKUIStyledImageDataConsumer *)self _backgroundIsOpaque];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __78__SKUIStyledImageDataConsumer__uberBannerImageWithBounds_inputSize_drawBlock___block_invoke;
  v17[3] = &unk_1E6426DE8;
  CGFloat v19 = x;
  CGFloat v20 = y;
  double v21 = v8;
  double v22 = v7;
  CGFloat v23 = width;
  CGFloat v24 = height;
  v17[4] = self;
  id v18 = v12;
  id v14 = v12;
  BOOL v15 = -[SKUIStyledImageDataConsumer _imageWithSize:isOpaque:drawBlock:](self, "_imageWithSize:isOpaque:drawBlock:", v13, v17, v8, v7);

  return v15;
}

uint64_t __78__SKUIStyledImageDataConsumer__uberBannerImageWithBounds_inputSize_drawBlock___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v2 = *(void **)(*(void *)(a1 + 32) + 56);
  if (v2)
  {
    [v2 set];
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextFillRect(CurrentContext, *(CGRect *)(a1 + 48));
    double v5 = *(double *)(a1 + 80);
    double v4 = *(double *)(a1 + 88);
    double v6 = *(double *)(a1 + 72);
    if (*(void *)(*(void *)(a1 + 32) + 56))
    {
      *(_OWORD *)locations = xmmword_1C1CCB440;
      memset(v19, 0, sizeof(v19));
      uint64_t v20 = 0;
      uint64_t v21 = 0x3FF0000000000000;
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      double v8 = CGGradientCreateWithColorComponents(DeviceRGB, (const CGFloat *)v19, locations, 2uLL);
      CGColorSpaceRelease(DeviceRGB);
      double MidX = CGRectGetMidX(*(CGRect *)(a1 + 48));
      CGFloat v10 = MidX + CGRectGetWidth(*(CGRect *)(a1 + 48)) * -0.25;
      CGFloat v11 = CGRectGetMidY(*(CGRect *)(a1 + 48)) + 40.0;
      float v12 = *(double *)(a1 + 64) * 0.9;
      BOOL v13 = UIGraphicsGetCurrentContext();
      v24.CGFloat x = v10;
      v24.CGFloat y = v11;
      v25.CGFloat x = v10;
      v25.CGFloat y = v11;
      CGContextDrawRadialGradient(v13, v8, v24, 0.0, v25, v12, 2u);
      CGGradientRelease(v8);
    }
  }
  else
  {
    double v5 = *(double *)(a1 + 80);
    double v4 = *(double *)(a1 + 88);
    double v6 = *(double *)(a1 + 72);
  }
  double v14 = (double)(int)(v6 + -8.0 + -8.0);
  float v15 = (v6 - v14) * 0.5;
  double v16 = floorf(v15);
  float v17 = v5 * (v14 / v4);
  return (*(uint64_t (**)(double, double, double))(*(void *)(a1 + 40) + 16))(15.0, v16, ceilf(v17));
}

- (id)_dynamicUberImageWithBounds:(CGRect)a3 inputSize:(CGSize)a4 drawBlock:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  double v7 = a3.size.height;
  double v8 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v35[2] = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  BOOL v13 = objc_msgSend(MEMORY[0x1E4FB1E20], "traitCollectionWithUserInterfaceLevel:", -[UITraitCollection userInterfaceLevel](self->_startingTraitCollection, "userInterfaceLevel"));
  double v14 = (void *)MEMORY[0x1E4FB1E20];
  v35[0] = v13;
  float v15 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:1];
  v35[1] = v15;
  double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  float v17 = [v14 traitCollectionWithTraitsFromCollections:v16];

  id v18 = (void *)MEMORY[0x1E4FB1E20];
  v34[0] = v13;
  CGFloat v19 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:2];
  v34[1] = v19;
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  uint64_t v21 = [v18 traitCollectionWithTraitsFromCollections:v20];

  double v22 = [(UIColor *)self->_backgroundColor resolvedColorWithTraitCollection:v17];
  uint64_t v23 = -[SKUIStyledImageDataConsumer _uberImageWithBounds:inputSize:backgroundColor:drawBlock:](self, "_uberImageWithBounds:inputSize:backgroundColor:drawBlock:", v22, v12, x, y, v8, v7, width, height);
  CGPoint v24 = [(UIColor *)self->_backgroundColor resolvedColorWithTraitCollection:v21];
  if ([v24 isEqual:v22])
  {
    id v25 = v23;
  }
  else
  {
    id v25 = objc_alloc_init(MEMORY[0x1E4FB1818]);
    CGFloat v26 = -[SKUIStyledImageDataConsumer _uberImageWithBounds:inputSize:backgroundColor:drawBlock:](self, "_uberImageWithBounds:inputSize:backgroundColor:drawBlock:", v24, v12, x, y, v8, v7, width, height);
    [v25 imageAsset];
    uint64_t v33 = v17;
    v28 = id v27 = v12;
    long long v29 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:1];
    [v28 registerImage:v23 withTraitCollection:v29];

    uint64_t v30 = [v25 imageAsset];
    uint64_t v31 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:2];
    [v30 registerImage:v26 withTraitCollection:v31];

    id v12 = v27;
    float v17 = v33;
  }

  return v25;
}

- (id)_uberImageWithBounds:(CGRect)a3 inputSize:(CGSize)a4 backgroundColor:(id)a5 drawBlock:(id)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  double v9 = a3.size.height;
  double v10 = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v14 = a5;
  id v15 = a6;
  BOOL v16 = [(SKUIStyledImageDataConsumer *)self _backgroundIsOpaque];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __88__SKUIStyledImageDataConsumer__uberImageWithBounds_inputSize_backgroundColor_drawBlock___block_invoke;
  v21[3] = &unk_1E6426DE8;
  CGFloat v24 = x;
  CGFloat v25 = y;
  double v26 = v10;
  double v27 = v9;
  CGFloat v28 = width;
  CGFloat v29 = height;
  id v22 = v14;
  id v23 = v15;
  id v17 = v15;
  id v18 = v14;
  CGFloat v19 = -[SKUIStyledImageDataConsumer _imageWithSize:isOpaque:drawBlock:](self, "_imageWithSize:isOpaque:drawBlock:", v16, v21, v10, v9);

  return v19;
}

void __88__SKUIStyledImageDataConsumer__uberImageWithBounds_inputSize_backgroundColor_drawBlock___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 set];
    UIRectFill(*(CGRect *)(a1 + 48));
  }
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(a1 + 72);
  float v5 = *(double *)(a1 + 80) * (v4 / *(double *)(a1 + 88));
  double v6 = ceilf(v5);
  float v7 = (*(double *)(a1 + 64) - v6) * 0.5;
  double v8 = floorf(v7);
  (*(void (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(v8, v3, v6, v4);
  double v9 = *(void **)(a1 + 32);
  if (v9)
  {
    long long v18 = 0u;
    memset(v19, 0, 48);
    __asm { FMOV            V0.2D, #1.0 }
    _OWORD v19[3] = _Q0;
    [v9 getRed:&v18 green:(char *)&v18 + 8 blue:v19 alpha:0];
    *(_OWORD *)((char *)&v19[1] + 8) = v18;
    *((void *)&v19[2] + 1) = *(void *)&v19[0];
    float v15 = v4 * 0.48;
    double v16 = ceilf(v15);
    id v17 = (void *)[objc_alloc(MEMORY[0x1E4FB17D0]) initVerticalWithValues:&v18];
    v21.origin.CGFloat x = v8;
    v21.origin.CGFloat y = v3;
    v21.size.CGFloat width = v6;
    v21.size.CGFloat height = v4;
    objc_msgSend(v17, "fillRect:", v8, CGRectGetMaxY(v21) - v16, v6, v16);
  }
}

- (id)_leftToRightGradient:(CGRect)a3 contentRect:(CGRect)a4 drawBlock:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v9 = a3.size.height;
  double v10 = a3.size.width;
  CGFloat v11 = a3.origin.y;
  CGFloat v12 = a3.origin.x;
  id v14 = a5;
  if ([(IKColor *)self->_iKBackgroundColor colorType] == 3)
  {
    BOOL v15 = [(SKUIStyledImageDataConsumer *)self _backgroundIsOpaque];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __74__SKUIStyledImageDataConsumer__leftToRightGradient_contentRect_drawBlock___block_invoke;
    v18[3] = &unk_1E6426DC0;
    v18[4] = self;
    CGFloat v20 = v12;
    CGFloat v21 = v11;
    double v22 = v10;
    double v23 = v9;
    id v19 = v14;
    CGFloat v24 = x;
    CGFloat v25 = y;
    CGFloat v26 = width;
    CGFloat v27 = height;
    double v16 = -[SKUIStyledImageDataConsumer _imageWithSize:isOpaque:drawBlock:](self, "_imageWithSize:isOpaque:drawBlock:", v15, v18, v10, v9);
  }
  else
  {
    double v16 = 0;
  }

  return v16;
}

void __74__SKUIStyledImageDataConsumer__leftToRightGradient_contentRect_drawBlock___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  BOOL v2 = [*(id *)(*(void *)(a1 + 32) + 40) color];

  if (v2)
  {
    double v3 = [*(id *)(*(void *)(a1 + 32) + 40) color];
    [v3 set];

    UIRectFill(*(CGRect *)(a1 + 48));
  }
  (*(void (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(*(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  __asm { FMOV            V0.2D, #1.0 }
  long long v30 = _Q0;
  double v9 = [*(id *)(*(void *)(a1 + 32) + 40) gradientColors];
  double v10 = [v9 firstObject];

  CGFloat v11 = [*(id *)(*(void *)(a1 + 32) + 40) gradientColors];
  CGFloat v12 = [v11 lastObject];

  [v10 getRed:&v26 green:(char *)&v26 + 8 blue:&v27 alpha:(char *)&v27 + 8];
  [v12 getRed:(char *)&v28 + 8 green:&v29 blue:(char *)&v29 + 8 alpha:&v30];
  CGFloat v13 = *(double *)(a1 + 64);
  *(_OWORD *)locations = xmmword_1C1CCBCF8;
  uint64_t v25 = 0x3FF0000000000000;
  v17[0] = v26;
  v17[1] = v27;
  uint64_t v18 = *((void *)&v28 + 1);
  long long v19 = v29;
  uint64_t v20 = v30;
  uint64_t v21 = *((void *)&v28 + 1);
  long long v22 = v29;
  uint64_t v23 = v30;
  CurrentContext = UIGraphicsGetCurrentContext();
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  double v16 = CGGradientCreateWithColorComponents(DeviceRGB, (const CGFloat *)v17, locations, 3uLL);
  v32.CGFloat x = 0.0;
  v32.CGFloat y = 0.5;
  v33.CGFloat y = 0.5;
  v33.CGFloat x = v13;
  CGContextDrawLinearGradient(CurrentContext, v16, v32, v33, 0);
  CGColorSpaceRelease(DeviceRGB);
  CGGradientRelease(v16);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
}

- (UIEdgeInsets)borderWidths
{
  double top = self->_borderWidths.top;
  double left = self->_borderWidths.left;
  double bottom = self->_borderWidths.bottom;
  double right = self->_borderWidths.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setBorderWidths:(UIEdgeInsets)a3
{
  self->_borderWidths = a3;
}

- (UIEdgeInsets)borderMargins
{
  double top = self->_borderMargins.top;
  double left = self->_borderMargins.left;
  double bottom = self->_borderMargins.bottom;
  double right = self->_borderMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setBorderMargins:(UIEdgeInsets)a3
{
  self->_borderMargins = a3;
}

- (int64_t)imageContentMode
{
  return self->_imageContentMode;
}

- (void)setImageContentMode:(int64_t)a3
{
  self->_imageContentMode = a3;
}

- (UIEdgeInsets)imagePadding
{
  double top = self->_imagePadding.top;
  double left = self->_imagePadding.left;
  double bottom = self->_imagePadding.bottom;
  double right = self->_imagePadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setImagePadding:(UIEdgeInsets)a3
{
  self->_imagePadding = a3;
}

- (int64_t)imageTreatment
{
  return self->_imageTreatment;
}

- (void)setImageTreatment:(int64_t)a3
{
  self->_unint64_t imageTreatment = a3;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (CGSize)shadowOffset
{
  double width = self->_shadowOffset.width;
  double height = self->_shadowOffset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setShadowOffset:(CGSize)a3
{
  self->_shadowOffset = a3;
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (void)setShadowRadius:(double)a3
{
  self->_double shadowRadius = a3;
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (void)setShadowColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_startingTraitCollection, 0);

  objc_storeStrong((id *)&self->_iKBackgroundColor, 0);
}

+ (void)isImageCompressionEnabled
{
}

- (void)init
{
}

- (void)initWithViewElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)isImagePlaceholderAvailable
{
}

void __58__SKUIStyledImageDataConsumer__placeholderCornerPathBlock__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end