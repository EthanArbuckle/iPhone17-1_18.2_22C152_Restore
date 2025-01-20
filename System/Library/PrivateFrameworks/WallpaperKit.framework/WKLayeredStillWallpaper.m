@interface WKLayeredStillWallpaper
+ (id)na_identity;
- (BOOL)copyWallpaperContentsToDestinationDirectoryURL:(id)a3 error:(id *)a4;
- (BOOL)supportsSerialization;
- (WKLayeredStillWallpaper)initWithIdentifier:(int64_t)a3 name:(id)a4 backgroundThumbnailImageURL:(id)a5 foregroundThumbnailImageURL:(id)a6 floatingThumbnailImageURL:(id)a7 backgroundFullSizeImageURL:(id)a8 foregroundFullSizeImageURL:(id)a9 floatingFullSizeImageURL:(id)a10;
- (WKLayeredStillWallpaperInput)_wallpaperValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)propertyListRepresentation;
- (void)set_wallpaperValue:(id)a3;
@end

@implementation WKLayeredStillWallpaper

- (WKLayeredStillWallpaper)initWithIdentifier:(int64_t)a3 name:(id)a4 backgroundThumbnailImageURL:(id)a5 foregroundThumbnailImageURL:(id)a6 floatingThumbnailImageURL:(id)a7 backgroundFullSizeImageURL:(id)a8 foregroundFullSizeImageURL:(id)a9 floatingFullSizeImageURL:(id)a10
{
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  v26.receiver = self;
  v26.super_class = (Class)WKLayeredStillWallpaper;
  v22 = [(WKLayeredThumbnailWallpaper *)&v26 initWithIdentifier:a3 name:a4 type:4 representedType:4 backgroundThumbnailImageURL:v16 foregroundThumbnailImageURL:v17 floatingThumbnailImageURL:v18];
  if (v22)
  {
    v23 = [[WKLayeredStillWallpaperInput alloc] initWithBackgroundThumbnailImageURL:v16 foregroundThumbnailImageURL:v17 floatingThumbnailImageURL:v18 backgroundFullSizeImageURL:v19 foregroundFullSizeImageURL:v20 floatingFullSizeImageURL:v21];
    wallpaperValue = v22->__wallpaperValue;
    v22->__wallpaperValue = v23;
  }
  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v17 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  int64_t v16 = [(WKAbstractWallpaper *)self identifier];
  v15 = [(WKAbstractWallpaper *)self name];
  id v20 = [(WKLayeredStillWallpaper *)self wallpaperValue];
  v4 = [v20 backgroundThumbnailImageURL];
  id v19 = [(WKLayeredStillWallpaper *)self wallpaperValue];
  v5 = [v19 foregroundThumbnailImageURL];
  id v18 = [(WKLayeredStillWallpaper *)self wallpaperValue];
  v6 = [v18 floatingThumbnailImageURL];
  v7 = [(WKLayeredStillWallpaper *)self wallpaperValue];
  v8 = [v7 backgroundFullSizeImageURL];
  v9 = [(WKLayeredStillWallpaper *)self wallpaperValue];
  v10 = [v9 foregroundFullSizeImageURL];
  v11 = [(WKLayeredStillWallpaper *)self wallpaperValue];
  v12 = [v11 floatingFullSizeImageURL];
  v13 = (void *)[v17 initWithIdentifier:v16 name:v15 backgroundThumbnailImageURL:v4 foregroundThumbnailImageURL:v5 floatingThumbnailImageURL:v6 backgroundFullSizeImageURL:v8 foregroundFullSizeImageURL:v10 floatingFullSizeImageURL:v12];

  return v13;
}

- (BOOL)supportsSerialization
{
  return 1;
}

- (id)propertyListRepresentation
{
  v16.receiver = self;
  v16.super_class = (Class)WKLayeredStillWallpaper;
  v3 = [(WKLayeredThumbnailWallpaper *)&v16 propertyListRepresentation];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = v4;
  if (v3) {
    [v4 addEntriesFromDictionary:v3];
  }
  v6 = [(WKLayeredStillWallpaper *)self wallpaperValue];
  v7 = [v6 backgroundFullSizeImageURL];
  v8 = [v7 lastPathComponent];
  objc_msgSend(v5, "na_safeSetObject:forKey:", v8, @"backgroundFullSizeImageFileName");

  v9 = [(WKLayeredStillWallpaper *)self wallpaperValue];
  v10 = [v9 foregroundFullSizeImageURL];
  v11 = [v10 lastPathComponent];
  objc_msgSend(v5, "na_safeSetObject:forKey:", v11, @"foregroundFullSizeImageFileName");

  v12 = [(WKLayeredStillWallpaper *)self wallpaperValue];
  v13 = [v12 floatingFullSizeImageURL];
  v14 = [v13 lastPathComponent];
  objc_msgSend(v5, "na_safeSetObject:forKey:", v14, @"floatingFullSizeImageFileName");

  return v5;
}

- (BOOL)copyWallpaperContentsToDestinationDirectoryURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v45.receiver = self;
  v45.super_class = (Class)WKLayeredStillWallpaper;
  v43 = a4;
  LODWORD(a4) = [(WKLayeredThumbnailWallpaper *)&v45 copyWallpaperContentsToDestinationDirectoryURL:v5 error:a4];
  if (a4)
  {
    v7 = [(WKLayeredStillWallpaper *)self wallpaperValue];
    uint64_t v8 = [v7 backgroundFullSizeImageURL];
    char v42 = (char)a4;
    if (v8)
    {
      v9 = (void *)v8;
      v10 = [MEMORY[0x1E4F28CB8] defaultManager];
      v40 = [(WKLayeredStillWallpaper *)self wallpaperValue];
      v11 = [v40 backgroundFullSizeImageURL];
      v12 = [(WKLayeredStillWallpaper *)self wallpaperValue];
      v13 = [v12 backgroundFullSizeImageURL];
      v14 = [v13 lastPathComponent];
      [v5 URLByAppendingPathComponent:v14];
      objc_super v16 = v15 = v5;
      int v38 = [v10 copyItemAtURL:v11 toURL:v16 error:v43];

      id v5 = v15;
      if (!v38)
      {
LABEL_12:
        LOBYTE(a4) = 0;
        goto LABEL_14;
      }
    }
    else
    {
    }
    id v17 = [(WKLayeredStillWallpaper *)self wallpaperValue];
    uint64_t v18 = [v17 foregroundFullSizeImageURL];
    if (v18)
    {
      id v19 = (void *)v18;
      id v20 = [MEMORY[0x1E4F28CB8] defaultManager];
      v41 = [(WKLayeredStillWallpaper *)self wallpaperValue];
      [v41 foregroundFullSizeImageURL];
      v22 = id v21 = v5;
      v23 = [(WKLayeredStillWallpaper *)self wallpaperValue];
      v24 = [v23 foregroundFullSizeImageURL];
      v25 = [v24 lastPathComponent];
      objc_super v26 = [v21 URLByAppendingPathComponent:v25];
      int v39 = [v20 copyItemAtURL:v22 toURL:v26 error:v43];

      id v5 = v21;
      if (!v39) {
        goto LABEL_12;
      }
    }
    else
    {
    }
    v27 = [(WKLayeredStillWallpaper *)self wallpaperValue];
    uint64_t v28 = [v27 floatingFullSizeImageURL];
    if (!v28)
    {

      LOBYTE(a4) = v42;
      goto LABEL_14;
    }
    v29 = (void *)v28;
    v30 = [MEMORY[0x1E4F28CB8] defaultManager];
    v31 = [(WKLayeredStillWallpaper *)self wallpaperValue];
    [v31 floatingFullSizeImageURL];
    v33 = v32 = v5;
    a4 = [(WKLayeredStillWallpaper *)self wallpaperValue];
    v34 = [a4 floatingFullSizeImageURL];
    v35 = [v34 lastPathComponent];
    v36 = [v32 URLByAppendingPathComponent:v35];
    int v44 = [v30 copyItemAtURL:v33 toURL:v36 error:v43];

    id v5 = v32;
    LOBYTE(a4) = v42;
    if (!v44) {
      goto LABEL_12;
    }
  }
LABEL_14:

  return (char)a4;
}

+ (id)na_identity
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__WKLayeredStillWallpaper_na_identity__block_invoke;
  v4[3] = &__block_descriptor_40_e5__8__0l;
  v4[4] = a1;
  v2 = __38__WKLayeredStillWallpaper_na_identity__block_invoke((uint64_t)v4);
  return v2;
}

id __38__WKLayeredStillWallpaper_na_identity__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__WKLayeredStillWallpaper_na_identity__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  if (_block_invoke_na_once_token_0_10 != -1) {
    dispatch_once(&_block_invoke_na_once_token_0_10, block);
  }
  v1 = (void *)_block_invoke_na_once_object_0_10;
  return v1;
}

void __38__WKLayeredStillWallpaper_na_identity__block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__WKLayeredStillWallpaper_na_identity__block_invoke_3;
  v3[3] = &__block_descriptor_40_e17___NAIdentity_8__0l;
  v3[4] = *(void *)(a1 + 32);
  uint64_t v1 = __38__WKLayeredStillWallpaper_na_identity__block_invoke_3((uint64_t)v3);
  v2 = (void *)_block_invoke_na_once_object_0_10;
  _block_invoke_na_once_object_0_10 = v1;
}

id __38__WKLayeredStillWallpaper_na_identity__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F7A0E0];
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)&OBJC_METACLASS___WKLayeredStillWallpaper;
  v2 = objc_msgSendSuper2(&v6, sel_na_identity);
  v3 = [v1 builderWithIdentity:v2];

  v4 = [v3 build];

  return v4;
}

- (WKLayeredStillWallpaperInput)_wallpaperValue
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