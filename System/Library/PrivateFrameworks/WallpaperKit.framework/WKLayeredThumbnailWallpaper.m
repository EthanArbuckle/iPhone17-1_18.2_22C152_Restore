@interface WKLayeredThumbnailWallpaper
+ (id)na_identity;
- (BOOL)copyWallpaperContentsToDestinationDirectoryURL:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsCopying;
- (BOOL)supportsSerialization;
- (NSURL)thumbnailImageURL;
- (UIImage)_thumbnailImage;
- (UIImage)thumbnailImage;
- (WKLayeredThumbnailWallpaper)initWithIdentifier:(int64_t)a3 name:(id)a4 type:(unint64_t)a5 representedType:(unint64_t)a6 backgroundThumbnailImageURL:(id)a7 foregroundThumbnailImageURL:(id)a8 floatingThumbnailImageURL:(id)a9;
- (WKLayeredThumbnailWallpaperInput)_wallpaperValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderBlock;
- (id)propertyListRepresentation;
- (unint64_t)hash;
- (void)set_thumbnailImage:(id)a3;
- (void)set_wallpaperValue:(id)a3;
@end

@implementation WKLayeredThumbnailWallpaper

- (WKLayeredThumbnailWallpaper)initWithIdentifier:(int64_t)a3 name:(id)a4 type:(unint64_t)a5 representedType:(unint64_t)a6 backgroundThumbnailImageURL:(id)a7 foregroundThumbnailImageURL:(id)a8 floatingThumbnailImageURL:(id)a9
{
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  v22.receiver = self;
  v22.super_class = (Class)WKLayeredThumbnailWallpaper;
  v18 = [(WKAbstractWallpaper *)&v22 initWithIdentifier:a3 name:a4 type:a5 representedType:a6 backingType:1];
  if (v18)
  {
    v19 = [[WKLayeredThumbnailWallpaperInput alloc] initWithBackgroundThumbnailImageURL:v15 foregroundThumbnailImageURL:v16 floatingThumbnailImageURL:v17];
    wallpaperValue = v18->__wallpaperValue;
    v18->__wallpaperValue = v19;
  }
  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v16 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  int64_t v4 = [(WKAbstractWallpaper *)self identifier];
  v5 = [(WKAbstractWallpaper *)self name];
  unint64_t v6 = [(WKAbstractWallpaper *)self type];
  unint64_t v7 = [(WKAbstractWallpaper *)self representedType];
  v8 = [(WKLayeredThumbnailWallpaper *)self wallpaperValue];
  v9 = [v8 backgroundThumbnailImageURL];
  v10 = [(WKLayeredThumbnailWallpaper *)self wallpaperValue];
  v11 = [v10 foregroundThumbnailImageURL];
  v12 = [(WKLayeredThumbnailWallpaper *)self wallpaperValue];
  v13 = [v12 floatingThumbnailImageURL];
  v14 = (void *)[v16 initWithIdentifier:v4 name:v5 type:v6 representedType:v7 backgroundThumbnailImageURL:v9 foregroundThumbnailImageURL:v11 floatingThumbnailImageURL:v13];

  return v14;
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
  v21.receiver = self;
  v21.super_class = (Class)WKLayeredThumbnailWallpaper;
  v3 = [(WKAbstractWallpaper *)&v21 propertyListRepresentation];
  int64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = v4;
  if (v3) {
    [v4 addEntriesFromDictionary:v3];
  }
  unint64_t v6 = [(WKLayeredThumbnailWallpaper *)self wallpaperValue];
  unint64_t v7 = [v6 backgroundThumbnailImageURL];
  v8 = [v7 lastPathComponent];
  objc_msgSend(v5, "na_safeSetObject:forKey:", v8, @"backgroundThumbnailImageFileName");

  v9 = [(WKLayeredThumbnailWallpaper *)self wallpaperValue];
  v10 = [v9 foregroundThumbnailImageURL];
  v11 = [v10 lastPathComponent];
  objc_msgSend(v5, "na_safeSetObject:forKey:", v11, @"foregroundThumbnailImageFileName");

  v12 = [(WKLayeredThumbnailWallpaper *)self wallpaperValue];
  v13 = [v12 floatingThumbnailImageURL];
  v14 = [v13 lastPathComponent];
  objc_msgSend(v5, "na_safeSetObject:forKey:", v14, @"floatingThumbnailImageFileName");

  id v15 = (objc_class *)objc_opt_class();
  id v16 = NSStringFromClass(v15);
  id v17 = (objc_class *)objc_opt_class();
  v18 = NSStringFromClass(v17);
  LODWORD(v14) = [v16 isEqualToString:v18];

  if (v14)
  {
    v19 = WKStringFromWallpaperType([(WKAbstractWallpaper *)self representedType]);
    objc_msgSend(v5, "na_safeSetObject:forKey:", v19, @"representedType");
  }
  return v5;
}

- (BOOL)copyWallpaperContentsToDestinationDirectoryURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [(WKLayeredThumbnailWallpaper *)self wallpaperValue];
  uint64_t v8 = [v7 backgroundThumbnailImageURL];
  v41 = a4;
  if (v8)
  {
    v38 = (void *)v8;
    v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    v36 = [(WKLayeredThumbnailWallpaper *)self wallpaperValue];
    v10 = [v36 backgroundThumbnailImageURL];
    v11 = [(WKLayeredThumbnailWallpaper *)self wallpaperValue];
    v12 = [v11 backgroundThumbnailImageURL];
    [v12 lastPathComponent];
    v14 = v13 = self;
    id v15 = [v6 URLByAppendingPathComponent:v14];
    int v16 = [v9 copyItemAtURL:v10 toURL:v15 error:a4];

    self = v13;
    if (!v16) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  id v17 = [(WKLayeredThumbnailWallpaper *)self wallpaperValue];
  uint64_t v18 = [v17 foregroundThumbnailImageURL];
  if (v18)
  {
    v19 = (void *)v18;
    v20 = [MEMORY[0x1E4F28CB8] defaultManager];
    v39 = [(WKLayeredThumbnailWallpaper *)self wallpaperValue];
    objc_super v21 = [v39 foregroundThumbnailImageURL];
    objc_super v22 = [(WKLayeredThumbnailWallpaper *)self wallpaperValue];
    v23 = [v22 foregroundThumbnailImageURL];
    v24 = [v23 lastPathComponent];
    v25 = [v6 URLByAppendingPathComponent:v24];
    int v37 = [v20 copyItemAtURL:v21 toURL:v25 error:v41];

    if (!v37)
    {
      LOBYTE(v16) = 0;
      goto LABEL_13;
    }
  }
  else
  {
  }
  v26 = [(WKLayeredThumbnailWallpaper *)self wallpaperValue];
  uint64_t v27 = [v26 floatingThumbnailImageURL];
  if (v27)
  {
    v28 = (void *)v27;
    v40 = [MEMORY[0x1E4F28CB8] defaultManager];
    v29 = [(WKLayeredThumbnailWallpaper *)self wallpaperValue];
    v30 = [v29 floatingThumbnailImageURL];
    v31 = [(WKLayeredThumbnailWallpaper *)self wallpaperValue];
    v32 = [v31 floatingThumbnailImageURL];
    v33 = [v32 lastPathComponent];
    v34 = [v6 URLByAppendingPathComponent:v33];
    LOBYTE(v16) = [v40 copyItemAtURL:v30 toURL:v34 error:v41];
  }
  else
  {
    LOBYTE(v16) = 1;
  }

LABEL_13:
  return v16;
}

- (NSURL)thumbnailImageURL
{
  return 0;
}

- (UIImage)thumbnailImage
{
  v3 = [(WKLayeredThumbnailWallpaper *)self _thumbnailImage];

  if (!v3)
  {
    int64_t v4 = [(WKLayeredThumbnailWallpaper *)self wallpaperValue];
    v5 = [v4 backgroundThumbnailImageURL];

    if (v5)
    {
      id v6 = (void *)MEMORY[0x1E4FB1818];
      unint64_t v7 = [(WKLayeredThumbnailWallpaper *)self wallpaperValue];
      uint64_t v8 = [v7 backgroundThumbnailImageURL];
      v9 = [v8 path];
      v10 = [v6 imageWithContentsOfFile:v9];
    }
    else
    {
      v10 = 0;
    }
    v11 = [(WKLayeredThumbnailWallpaper *)self wallpaperValue];
    v12 = [v11 foregroundThumbnailImageURL];

    if (v12)
    {
      v13 = (void *)MEMORY[0x1E4FB1818];
      v14 = [(WKLayeredThumbnailWallpaper *)self wallpaperValue];
      id v15 = [v14 foregroundThumbnailImageURL];
      int v16 = [v15 path];
      id v17 = [v13 imageWithContentsOfFile:v16];
    }
    else
    {
      id v17 = 0;
    }
    uint64_t v18 = [(WKLayeredThumbnailWallpaper *)self wallpaperValue];
    v19 = [v18 floatingThumbnailImageURL];

    if (v19)
    {
      v20 = (void *)MEMORY[0x1E4FB1818];
      objc_super v21 = [(WKLayeredThumbnailWallpaper *)self wallpaperValue];
      objc_super v22 = [v21 floatingThumbnailImageURL];
      v23 = [v22 path];
      v24 = [v20 imageWithContentsOfFile:v23];
    }
    else
    {
      v24 = 0;
    }
    v25 = (void *)MEMORY[0x1E4FB1818];
    v26 = objc_msgSend(MEMORY[0x1E4FB1818], "wk_overlayForegroundImage:overBackgroundImage:", v17, v10);
    uint64_t v27 = objc_msgSend(v25, "wk_overlayForegroundImage:overBackgroundImage:", v24, v26);
    [(WKLayeredThumbnailWallpaper *)self set_thumbnailImage:v27];
  }
  return [(WKLayeredThumbnailWallpaper *)self _thumbnailImage];
}

+ (id)na_identity
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__WKLayeredThumbnailWallpaper_na_identity__block_invoke;
  v4[3] = &__block_descriptor_40_e5__8__0l;
  v4[4] = a1;
  v2 = __42__WKLayeredThumbnailWallpaper_na_identity__block_invoke((uint64_t)v4);
  return v2;
}

id __42__WKLayeredThumbnailWallpaper_na_identity__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__WKLayeredThumbnailWallpaper_na_identity__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  if (_block_invoke_na_once_token_0_4 != -1) {
    dispatch_once(&_block_invoke_na_once_token_0_4, block);
  }
  v1 = (void *)_block_invoke_na_once_object_0_4;
  return v1;
}

void __42__WKLayeredThumbnailWallpaper_na_identity__block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__WKLayeredThumbnailWallpaper_na_identity__block_invoke_3;
  v3[3] = &__block_descriptor_40_e17___NAIdentity_8__0l;
  v3[4] = *(void *)(a1 + 32);
  uint64_t v1 = __42__WKLayeredThumbnailWallpaper_na_identity__block_invoke_3((uint64_t)v3);
  v2 = (void *)_block_invoke_na_once_object_0_4;
  _block_invoke_na_once_object_0_4 = v1;
}

id __42__WKLayeredThumbnailWallpaper_na_identity__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F7A0E0];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___WKLayeredThumbnailWallpaper;
  v2 = objc_msgSendSuper2(&v7, sel_na_identity);
  v3 = [v1 builderWithIdentity:v2];

  id v4 = (id)[v3 appendCharacteristic:&__block_literal_global_5];
  v5 = [v3 build];

  return v5;
}

uint64_t __42__WKLayeredThumbnailWallpaper_na_identity__block_invoke_4(uint64_t a1, void *a2)
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
  v9.super_class = (Class)WKLayeredThumbnailWallpaper;
  v3 = [(WKAbstractWallpaper *)&v9 descriptionBuilderBlock];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__WKLayeredThumbnailWallpaper_descriptionBuilderBlock__block_invoke;
  aBlock[3] = &unk_1E6376828;
  objc_copyWeak(&v7, &location);
  aBlock[4] = v3;
  unint64_t v4 = _Block_copy(aBlock);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

void __54__WKLayeredThumbnailWallpaper_descriptionBuilderBlock__block_invoke(uint64_t a1, void *a2)
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

- (WKLayeredThumbnailWallpaperInput)_wallpaperValue
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