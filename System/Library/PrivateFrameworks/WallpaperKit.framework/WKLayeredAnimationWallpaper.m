@interface WKLayeredAnimationWallpaper
+ (id)na_identity;
- (BOOL)copyWallpaperContentsToDestinationDirectoryURL:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsCopying;
- (BOOL)supportsSerialization;
- (NSURL)thumbnailImageURL;
- (UIImage)thumbnailImage;
- (WKLayeredAnimationWallpaper)initWithIdentifier:(int64_t)a3 name:(id)a4 backgroundAnimationFileURL:(id)a5 foregroundAnimationFileURL:(id)a6 floatingAnimationFileURL:(id)a7;
- (WKLayeredAnimationWallpaperInput)_wallpaperValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderBlock;
- (id)propertyListRepresentation;
- (unint64_t)hash;
- (void)set_wallpaperValue:(id)a3;
@end

@implementation WKLayeredAnimationWallpaper

- (WKLayeredAnimationWallpaper)initWithIdentifier:(int64_t)a3 name:(id)a4 backgroundAnimationFileURL:(id)a5 foregroundAnimationFileURL:(id)a6 floatingAnimationFileURL:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v19.receiver = self;
  v19.super_class = (Class)WKLayeredAnimationWallpaper;
  v15 = [(WKAbstractWallpaper *)&v19 initWithIdentifier:a3 name:a4 type:7 representedType:7 backingType:1];
  if (v15)
  {
    v16 = [[WKLayeredAnimationWallpaperInput alloc] initWithBackgroundAnimationFileURL:v12 foregroundAnimationFileURL:v13 floatingAnimationFileURL:v14];
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
  v7 = [(WKLayeredAnimationWallpaper *)self wallpaperValue];
  v8 = [v7 backgroundAnimationFileURL];
  v9 = [(WKLayeredAnimationWallpaper *)self wallpaperValue];
  v10 = [v9 foregroundAnimationFileURL];
  v11 = [(WKLayeredAnimationWallpaper *)self wallpaperValue];
  id v12 = [v11 floatingAnimationFileURL];
  id v13 = (void *)[v4 initWithIdentifier:v5 name:v6 backgroundAnimationFileURL:v8 foregroundAnimationFileURL:v10 floatingAnimationFileURL:v12];

  return v13;
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
  v16.receiver = self;
  v16.super_class = (Class)WKLayeredAnimationWallpaper;
  v3 = [(WKAbstractWallpaper *)&v16 propertyListRepresentation];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  int64_t v5 = v4;
  if (v3) {
    [v4 addEntriesFromDictionary:v3];
  }
  v6 = [(WKLayeredAnimationWallpaper *)self wallpaperValue];
  v7 = [v6 backgroundAnimationFileURL];
  v8 = [v7 lastPathComponent];
  objc_msgSend(v5, "na_safeSetObject:forKey:", v8, @"backgroundAnimationFileName");

  v9 = [(WKLayeredAnimationWallpaper *)self wallpaperValue];
  v10 = [v9 foregroundAnimationFileURL];
  v11 = [v10 lastPathComponent];
  objc_msgSend(v5, "na_safeSetObject:forKey:", v11, @"foregroundAnimationFileName");

  id v12 = [(WKLayeredAnimationWallpaper *)self wallpaperValue];
  id v13 = [v12 floatingAnimationFileURL];
  id v14 = [v13 lastPathComponent];
  objc_msgSend(v5, "na_safeSetObject:forKey:", v14, @"floatingAnimationFileNameKey");

  return v5;
}

- (BOOL)copyWallpaperContentsToDestinationDirectoryURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(WKLayeredAnimationWallpaper *)self wallpaperValue];
  uint64_t v8 = [v7 backgroundAnimationFileURL];
  v41 = a4;
  if (v8)
  {
    v38 = (void *)v8;
    v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    v36 = [(WKLayeredAnimationWallpaper *)self wallpaperValue];
    v10 = [v36 backgroundAnimationFileURL];
    v11 = [(WKLayeredAnimationWallpaper *)self wallpaperValue];
    id v12 = [v11 backgroundAnimationFileURL];
    [v12 lastPathComponent];
    v14 = id v13 = self;
    v15 = [v6 URLByAppendingPathComponent:v14];
    int v16 = [v9 copyItemAtURL:v10 toURL:v15 error:a4];

    self = v13;
    if (!v16) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  v17 = [(WKLayeredAnimationWallpaper *)self wallpaperValue];
  uint64_t v18 = [v17 foregroundAnimationFileURL];
  if (v18)
  {
    objc_super v19 = (void *)v18;
    v20 = [MEMORY[0x1E4F28CB8] defaultManager];
    v39 = [(WKLayeredAnimationWallpaper *)self wallpaperValue];
    v21 = [v39 foregroundAnimationFileURL];
    v22 = [(WKLayeredAnimationWallpaper *)self wallpaperValue];
    v23 = [v22 foregroundAnimationFileURL];
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
  v26 = [(WKLayeredAnimationWallpaper *)self wallpaperValue];
  uint64_t v27 = [v26 floatingAnimationFileURL];
  if (v27)
  {
    v28 = (void *)v27;
    v40 = [MEMORY[0x1E4F28CB8] defaultManager];
    v29 = [(WKLayeredAnimationWallpaper *)self wallpaperValue];
    v30 = [v29 floatingAnimationFileURL];
    v31 = [(WKLayeredAnimationWallpaper *)self wallpaperValue];
    v32 = [v31 floatingAnimationFileURL];
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
  return 0;
}

+ (id)na_identity
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__WKLayeredAnimationWallpaper_na_identity__block_invoke;
  v4[3] = &__block_descriptor_40_e5__8__0l;
  v4[4] = a1;
  v2 = __42__WKLayeredAnimationWallpaper_na_identity__block_invoke((uint64_t)v4);
  return v2;
}

id __42__WKLayeredAnimationWallpaper_na_identity__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__WKLayeredAnimationWallpaper_na_identity__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  if (_block_invoke_na_once_token_0_3 != -1) {
    dispatch_once(&_block_invoke_na_once_token_0_3, block);
  }
  v1 = (void *)_block_invoke_na_once_object_0_3;
  return v1;
}

void __42__WKLayeredAnimationWallpaper_na_identity__block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__WKLayeredAnimationWallpaper_na_identity__block_invoke_3;
  v3[3] = &__block_descriptor_40_e17___NAIdentity_8__0l;
  v3[4] = *(void *)(a1 + 32);
  uint64_t v1 = __42__WKLayeredAnimationWallpaper_na_identity__block_invoke_3((uint64_t)v3);
  v2 = (void *)_block_invoke_na_once_object_0_3;
  _block_invoke_na_once_object_0_3 = v1;
}

id __42__WKLayeredAnimationWallpaper_na_identity__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F7A0E0];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___WKLayeredAnimationWallpaper;
  v2 = objc_msgSendSuper2(&v7, sel_na_identity);
  v3 = [v1 builderWithIdentity:v2];

  id v4 = (id)[v3 appendCharacteristic:&__block_literal_global_4];
  int64_t v5 = [v3 build];

  return v5;
}

uint64_t __42__WKLayeredAnimationWallpaper_na_identity__block_invoke_4(uint64_t a1, void *a2)
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
  v9.super_class = (Class)WKLayeredAnimationWallpaper;
  v3 = [(WKAbstractWallpaper *)&v9 descriptionBuilderBlock];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__WKLayeredAnimationWallpaper_descriptionBuilderBlock__block_invoke;
  aBlock[3] = &unk_1E6376828;
  objc_copyWeak(&v7, &location);
  aBlock[4] = v3;
  unint64_t v4 = _Block_copy(aBlock);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

void __54__WKLayeredAnimationWallpaper_descriptionBuilderBlock__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  unint64_t v4 = [WeakRetained wallpaperValue];
  id v5 = (id)[v6 appendObject:v4 withName:@"wallpaperValue"];
}

- (WKLayeredAnimationWallpaperInput)_wallpaperValue
{
  return self->__wallpaperValue;
}

- (void)set_wallpaperValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end