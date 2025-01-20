@interface WKBokehWallpaper
+ (id)na_identity;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsCopying;
- (BOOL)supportsSerialization;
- (NSURL)thumbnailImageURL;
- (UIImage)_thumbnailImage;
- (UIImage)thumbnailImage;
- (WKBokehWallpaper)initWithIdentifier:(int64_t)a3 name:(id)a4 backgroundColors:(id)a5 bubbleColors:(id)a6 bubbleCount:(unint64_t)a7 bubbleScale:(double)a8 parallaxMultiplier:(double)a9 thumbnailSeed:(unint64_t)a10;
- (WKBokehWallpaperInput)_wallpaperValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderBlock;
- (id)propertyListRepresentation;
- (unint64_t)hash;
- (void)set_thumbnailImage:(id)a3;
- (void)set_wallpaperValue:(id)a3;
@end

@implementation WKBokehWallpaper

- (WKBokehWallpaper)initWithIdentifier:(int64_t)a3 name:(id)a4 backgroundColors:(id)a5 bubbleColors:(id)a6 bubbleCount:(unint64_t)a7 bubbleScale:(double)a8 parallaxMultiplier:(double)a9 thumbnailSeed:(unint64_t)a10
{
  id v18 = a5;
  id v19 = a6;
  v24.receiver = self;
  v24.super_class = (Class)WKBokehWallpaper;
  v20 = [(WKAbstractWallpaper *)&v24 initWithIdentifier:a3 name:a4 type:6 representedType:6 backingType:1];
  if (v20)
  {
    v21 = [[WKBokehWallpaperInput alloc] initWithBackgroundColors:v18 bubbleColors:v19 bubbleCount:a7 bubbleScale:a10 parallaxMultiplier:a8 thumbnailSeed:a9];
    wallpaperValue = v20->__wallpaperValue;
    v20->__wallpaperValue = v21;
  }
  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v21 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  int64_t v20 = [(WKAbstractWallpaper *)self identifier];
  v4 = [(WKAbstractWallpaper *)self name];
  v5 = [(WKBokehWallpaper *)self wallpaperValue];
  v6 = [v5 backgroundColors];
  v7 = [(WKBokehWallpaper *)self wallpaperValue];
  v8 = [v7 bubbleColors];
  v9 = [(WKBokehWallpaper *)self wallpaperValue];
  uint64_t v10 = [v9 bubbleCount];
  v11 = [(WKBokehWallpaper *)self wallpaperValue];
  [v11 bubbleScale];
  double v13 = v12;
  v14 = [(WKBokehWallpaper *)self wallpaperValue];
  [v14 parallaxMultiplier];
  double v16 = v15;
  v17 = [(WKBokehWallpaper *)self wallpaperValue];
  id v18 = objc_msgSend(v21, "initWithIdentifier:name:backgroundColors:bubbleColors:bubbleCount:bubbleScale:parallaxMultiplier:thumbnailSeed:", v20, v4, v6, v8, v10, objc_msgSend(v17, "thumbnailSeed"), v13, v16);

  return v18;
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
  v25.receiver = self;
  v25.super_class = (Class)WKBokehWallpaper;
  v3 = [(WKAbstractWallpaper *)&v25 propertyListRepresentation];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = v4;
  if (v3) {
    [v4 addEntriesFromDictionary:v3];
  }
  v6 = [(WKBokehWallpaper *)self wallpaperValue];
  v7 = [v6 backgroundColors];
  v8 = objc_msgSend(v7, "na_map:", &__block_literal_global_3);

  objc_msgSend(v5, "na_safeSetObject:forKey:", v8, @"backgroundColors");
  v9 = [(WKBokehWallpaper *)self wallpaperValue];
  uint64_t v10 = [v9 bubbleColors];
  v11 = objc_msgSend(v10, "na_map:", &__block_literal_global_5_0);

  objc_msgSend(v5, "na_safeSetObject:forKey:", v11, @"bubbleColors");
  double v12 = NSNumber;
  double v13 = [(WKBokehWallpaper *)self wallpaperValue];
  v14 = objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "bubbleCount"));
  objc_msgSend(v5, "na_safeSetObject:forKey:", v14, @"bubbleCount");

  double v15 = NSNumber;
  double v16 = [(WKBokehWallpaper *)self wallpaperValue];
  [v16 bubbleScale];
  v17 = objc_msgSend(v15, "numberWithDouble:");
  objc_msgSend(v5, "na_safeSetObject:forKey:", v17, @"bubbleScale");

  id v18 = NSNumber;
  id v19 = [(WKBokehWallpaper *)self wallpaperValue];
  [v19 parallaxMultiplier];
  int64_t v20 = objc_msgSend(v18, "numberWithDouble:");
  objc_msgSend(v5, "na_safeSetObject:forKey:", v20, @"parallaxMultiplier");

  v21 = NSNumber;
  v22 = [(WKBokehWallpaper *)self wallpaperValue];
  v23 = objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v22, "thumbnailSeed"));
  objc_msgSend(v5, "na_safeSetObject:forKey:", v23, @"thumbnailSeed");

  return v5;
}

uint64_t __46__WKBokehWallpaper_propertyListRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "wk_colorHexString");
}

uint64_t __46__WKBokehWallpaper_propertyListRepresentation__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "wk_colorHexString");
}

- (NSURL)thumbnailImageURL
{
  return 0;
}

- (UIImage)thumbnailImage
{
  v3 = [(WKBokehWallpaper *)self _thumbnailImage];

  if (!v3)
  {
    v4 = +[WKBokehView thumbnailImageWithBokehInput:self->__wallpaperValue];
    [(WKBokehWallpaper *)self set_thumbnailImage:v4];
  }
  return [(WKBokehWallpaper *)self _thumbnailImage];
}

+ (id)na_identity
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __31__WKBokehWallpaper_na_identity__block_invoke;
  v4[3] = &__block_descriptor_40_e5__8__0l;
  v4[4] = a1;
  v2 = __31__WKBokehWallpaper_na_identity__block_invoke((uint64_t)v4);
  return v2;
}

id __31__WKBokehWallpaper_na_identity__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__WKBokehWallpaper_na_identity__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  if (_block_invoke_na_once_token_0_2 != -1) {
    dispatch_once(&_block_invoke_na_once_token_0_2, block);
  }
  v1 = (void *)_block_invoke_na_once_object_0_2;
  return v1;
}

void __31__WKBokehWallpaper_na_identity__block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __31__WKBokehWallpaper_na_identity__block_invoke_3;
  v3[3] = &__block_descriptor_40_e17___NAIdentity_8__0l;
  v3[4] = *(void *)(a1 + 32);
  uint64_t v1 = __31__WKBokehWallpaper_na_identity__block_invoke_3((uint64_t)v3);
  v2 = (void *)_block_invoke_na_once_object_0_2;
  _block_invoke_na_once_object_0_2 = v1;
}

id __31__WKBokehWallpaper_na_identity__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F7A0E0];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___WKBokehWallpaper;
  v2 = objc_msgSendSuper2(&v7, sel_na_identity);
  v3 = [v1 builderWithIdentity:v2];

  id v4 = (id)[v3 appendCharacteristic:&__block_literal_global_14_0];
  v5 = [v3 build];

  return v5;
}

uint64_t __31__WKBokehWallpaper_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 wallpaperValue];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
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
  v9.super_class = (Class)WKBokehWallpaper;
  v3 = [(WKAbstractWallpaper *)&v9 descriptionBuilderBlock];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__WKBokehWallpaper_descriptionBuilderBlock__block_invoke;
  aBlock[3] = &unk_1E6376828;
  objc_copyWeak(&v7, &location);
  aBlock[4] = v3;
  unint64_t v4 = _Block_copy(aBlock);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

void __43__WKBokehWallpaper_descriptionBuilderBlock__block_invoke(uint64_t a1, void *a2)
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

- (WKBokehWallpaperInput)_wallpaperValue
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