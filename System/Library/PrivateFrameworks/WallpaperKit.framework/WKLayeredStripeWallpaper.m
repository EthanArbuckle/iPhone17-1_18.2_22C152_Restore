@interface WKLayeredStripeWallpaper
+ (id)na_identity;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsCopying;
- (BOOL)supportsSerialization;
- (NSURL)thumbnailImageURL;
- (UIImage)_thumbnailImage;
- (UIImage)thumbnailImage;
- (WKLayeredStripeWallpaper)initWithIdentifier:(int64_t)a3 name:(id)a4 backgroundColor:(id)a5 stripeAngleDegrees:(double)a6 stripeHeightFactor:(double)a7 firstStripeOffsetScaleFactor:(double)a8;
- (WKLayeredStripeWallpaperInput)_wallpaperValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderBlock;
- (id)propertyListRepresentation;
- (unint64_t)hash;
- (void)set_thumbnailImage:(id)a3;
- (void)set_wallpaperValue:(id)a3;
@end

@implementation WKLayeredStripeWallpaper

- (WKLayeredStripeWallpaper)initWithIdentifier:(int64_t)a3 name:(id)a4 backgroundColor:(id)a5 stripeAngleDegrees:(double)a6 stripeHeightFactor:(double)a7 firstStripeOffsetScaleFactor:(double)a8
{
  id v14 = a5;
  v19.receiver = self;
  v19.super_class = (Class)WKLayeredStripeWallpaper;
  v15 = [(WKAbstractWallpaper *)&v19 initWithIdentifier:a3 name:a4 type:5 representedType:5 backingType:1];
  if (v15)
  {
    v16 = [[WKLayeredStripeWallpaperInput alloc] initWithBackgroundColor:v14 stripeAngleDegrees:a6 stripeHeightFactor:a7 firstStripeOffsetScaleFactor:a8];
    wallpaperValue = v15->__wallpaperValue;
    v15->__wallpaperValue = v16;
  }
  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  int64_t v5 = [(WKAbstractWallpaper *)self identifier];
  v6 = [(WKAbstractWallpaper *)self name];
  v7 = [(WKLayeredStripeWallpaper *)self wallpaperValue];
  v8 = [v7 backgroundColor];
  v9 = [(WKLayeredStripeWallpaper *)self wallpaperValue];
  [v9 stripeAngleDegrees];
  double v11 = v10;
  v12 = [(WKLayeredStripeWallpaper *)self wallpaperValue];
  [v12 stripeHeightFactor];
  double v14 = v13;
  v15 = [(WKLayeredStripeWallpaper *)self wallpaperValue];
  [v15 firstStripeOffsetScaleFactor];
  v17 = (void *)[v4 initWithIdentifier:v5 name:v6 backgroundColor:v8 stripeAngleDegrees:v11 stripeHeightFactor:v14 firstStripeOffsetScaleFactor:v16];

  return v17;
}

- (BOOL)supportsSerialization
{
  return 1;
}

- (BOOL)supportsCopying
{
  return 1;
}

- (id)propertyListRepresentation
{
  v19.receiver = self;
  v19.super_class = (Class)WKLayeredStripeWallpaper;
  v3 = [(WKAbstractWallpaper *)&v19 propertyListRepresentation];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  int64_t v5 = v4;
  if (v3) {
    [v4 addEntriesFromDictionary:v3];
  }
  v6 = [(WKLayeredStripeWallpaper *)self wallpaperValue];
  v7 = [v6 backgroundColor];
  v8 = objc_msgSend(v7, "wk_colorHexString");
  objc_msgSend(v5, "na_safeSetObject:forKey:", v8, @"backgroundColor");

  v9 = NSNumber;
  double v10 = [(WKLayeredStripeWallpaper *)self wallpaperValue];
  [v10 stripeAngleDegrees];
  double v11 = objc_msgSend(v9, "numberWithDouble:");
  objc_msgSend(v5, "na_safeSetObject:forKey:", v11, @"stripeAngleDegrees");

  v12 = NSNumber;
  double v13 = [(WKLayeredStripeWallpaper *)self wallpaperValue];
  [v13 stripeHeightFactor];
  double v14 = objc_msgSend(v12, "numberWithDouble:");
  objc_msgSend(v5, "na_safeSetObject:forKey:", v14, @"stripeHeightFactor");

  v15 = NSNumber;
  double v16 = [(WKLayeredStripeWallpaper *)self wallpaperValue];
  [v16 firstStripeOffsetScaleFactor];
  v17 = objc_msgSend(v15, "numberWithDouble:");
  objc_msgSend(v5, "na_safeSetObject:forKey:", v17, @"firstStripeVerticalOffsetScaleFactor");

  return v5;
}

- (NSURL)thumbnailImageURL
{
  return 0;
}

- (UIImage)thumbnailImage
{
  return 0;
}

+ (id)na_identity
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__WKLayeredStripeWallpaper_na_identity__block_invoke;
  v4[3] = &__block_descriptor_40_e5__8__0l;
  v4[4] = a1;
  v2 = __39__WKLayeredStripeWallpaper_na_identity__block_invoke((uint64_t)v4);
  return v2;
}

id __39__WKLayeredStripeWallpaper_na_identity__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__WKLayeredStripeWallpaper_na_identity__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  if (_block_invoke_na_once_token_0 != -1) {
    dispatch_once(&_block_invoke_na_once_token_0, block);
  }
  v1 = (void *)_block_invoke_na_once_object_0;
  return v1;
}

void __39__WKLayeredStripeWallpaper_na_identity__block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__WKLayeredStripeWallpaper_na_identity__block_invoke_3;
  v3[3] = &__block_descriptor_40_e17___NAIdentity_8__0l;
  v3[4] = *(void *)(a1 + 32);
  uint64_t v1 = __39__WKLayeredStripeWallpaper_na_identity__block_invoke_3((uint64_t)v3);
  v2 = (void *)_block_invoke_na_once_object_0;
  _block_invoke_na_once_object_0 = v1;
}

id __39__WKLayeredStripeWallpaper_na_identity__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F7A0E0];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___WKLayeredStripeWallpaper;
  v2 = objc_msgSendSuper2(&v7, sel_na_identity);
  v3 = [v1 builderWithIdentity:v2];

  id v4 = (id)[v3 appendCharacteristic:&__block_literal_global_0];
  int64_t v5 = [v3 build];

  return v5;
}

uint64_t __39__WKLayeredStripeWallpaper_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 wallpaperValue];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  int64_t v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (id)descriptionBuilderBlock
{
  v9.receiver = self;
  v9.super_class = (Class)WKLayeredStripeWallpaper;
  v3 = [(WKAbstractWallpaper *)&v9 descriptionBuilderBlock];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__WKLayeredStripeWallpaper_descriptionBuilderBlock__block_invoke;
  aBlock[3] = &unk_1E6376828;
  objc_copyWeak(&v7, &location);
  aBlock[4] = v3;
  unint64_t v4 = _Block_copy(aBlock);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

void __51__WKLayeredStripeWallpaper_descriptionBuilderBlock__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  unint64_t v4 = [WeakRetained wallpaperValue];
  id v5 = (id)[v6 appendObject:v4 withName:@"wallpaperValue"];
}

- (UIImage)_thumbnailImage
{
  return self->__thumbnailImage;
}

- (void)set_thumbnailImage:(id)a3
{
}

- (WKLayeredStripeWallpaperInput)_wallpaperValue
{
  return self->__wallpaperValue;
}

- (void)set_wallpaperValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__wallpaperValue, 0);
  objc_storeStrong((id *)&self->__thumbnailImage, 0);
}

@end