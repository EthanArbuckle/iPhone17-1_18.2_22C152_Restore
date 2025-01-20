@interface WKThumbnailWallpaper
+ (id)na_identity;
- (BOOL)copyWallpaperContentsToDestinationDirectoryURL:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsCopying;
- (BOOL)supportsSerialization;
- (NSURL)thumbnailImageURL;
- (UIImage)_thumbnailImage;
- (WKThumbnailWallpaper)initWithIdentifier:(int64_t)a3 name:(id)a4 type:(unint64_t)a5 representedType:(unint64_t)a6 backingType:(unint64_t)a7 thumbnailImageURL:(id)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderBlock;
- (id)propertyListRepresentation;
- (id)thumbnailImage;
- (unint64_t)hash;
- (void)setThumbnailImageURL:(id)a3;
- (void)set_thumbnailImage:(id)a3;
@end

@implementation WKThumbnailWallpaper

- (WKThumbnailWallpaper)initWithIdentifier:(int64_t)a3 name:(id)a4 type:(unint64_t)a5 representedType:(unint64_t)a6 backingType:(unint64_t)a7 thumbnailImageURL:(id)a8
{
  id v14 = a8;
  v19.receiver = self;
  v19.super_class = (Class)WKThumbnailWallpaper;
  v15 = [(WKAbstractWallpaper *)&v19 initWithIdentifier:a3 name:a4 type:a5 representedType:a6 backingType:a7];
  if (v15)
  {
    uint64_t v16 = [v14 copy];
    thumbnailImageURL = v15->_thumbnailImageURL;
    v15->_thumbnailImageURL = (NSURL *)v16;
  }
  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  int64_t v5 = [(WKAbstractWallpaper *)self identifier];
  v6 = [(WKAbstractWallpaper *)self name];
  unint64_t v7 = [(WKAbstractWallpaper *)self type];
  unint64_t v8 = [(WKAbstractWallpaper *)self representedType];
  unint64_t v9 = [(WKAbstractWallpaper *)self backingType];
  v10 = [(WKThumbnailWallpaper *)self thumbnailImageURL];
  v11 = (void *)[v4 initWithIdentifier:v5 name:v6 type:v7 representedType:v8 backingType:v9 thumbnailImageURL:v10];

  return v11;
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
  v15.receiver = self;
  v15.super_class = (Class)WKThumbnailWallpaper;
  v3 = [(WKAbstractWallpaper *)&v15 propertyListRepresentation];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  int64_t v5 = v4;
  if (v3) {
    [v4 addEntriesFromDictionary:v3];
  }
  v6 = [(WKThumbnailWallpaper *)self thumbnailImageURL];
  unint64_t v7 = [v6 lastPathComponent];
  objc_msgSend(v5, "na_safeSetObject:forKey:", v7, @"thumbnailImageFileName");

  unint64_t v8 = (objc_class *)objc_opt_class();
  unint64_t v9 = NSStringFromClass(v8);
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  int v12 = [v9 isEqualToString:v11];

  if (v12)
  {
    v13 = WKStringFromWallpaperType([(WKAbstractWallpaper *)self representedType]);
    objc_msgSend(v5, "na_safeSetObject:forKey:", v13, @"representedType");
  }
  return v5;
}

- (BOOL)copyWallpaperContentsToDestinationDirectoryURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [(WKThumbnailWallpaper *)self thumbnailImageURL];
  uint64_t v8 = [v7 lastPathComponent];
  unint64_t v9 = [v6 URLByAppendingPathComponent:v8];

  v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  v11 = [v9 path];
  LOBYTE(v8) = [v10 fileExistsAtPath:v11];

  if (v8)
  {
    char v12 = 1;
  }
  else
  {
    v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v14 = [(WKThumbnailWallpaper *)self thumbnailImageURL];
    char v12 = [v13 copyItemAtURL:v14 toURL:v9 error:a4];
  }
  return v12;
}

- (id)thumbnailImage
{
  v3 = [(WKThumbnailWallpaper *)self _thumbnailImage];

  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E4FB1818];
    int64_t v5 = [(WKThumbnailWallpaper *)self thumbnailImageURL];
    id v6 = [v5 path];
    unint64_t v7 = [v4 imageWithContentsOfFile:v6];
    [(WKThumbnailWallpaper *)self set_thumbnailImage:v7];
  }
  return [(WKThumbnailWallpaper *)self _thumbnailImage];
}

+ (id)na_identity
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__WKThumbnailWallpaper_na_identity__block_invoke;
  v4[3] = &__block_descriptor_40_e5__8__0l;
  v4[4] = a1;
  v2 = __35__WKThumbnailWallpaper_na_identity__block_invoke((uint64_t)v4);
  return v2;
}

id __35__WKThumbnailWallpaper_na_identity__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__WKThumbnailWallpaper_na_identity__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  if (_block_invoke_na_once_token_0_6 != -1) {
    dispatch_once(&_block_invoke_na_once_token_0_6, block);
  }
  v1 = (void *)_block_invoke_na_once_object_0_6;
  return v1;
}

void __35__WKThumbnailWallpaper_na_identity__block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__WKThumbnailWallpaper_na_identity__block_invoke_3;
  v3[3] = &__block_descriptor_40_e17___NAIdentity_8__0l;
  v3[4] = *(void *)(a1 + 32);
  uint64_t v1 = __35__WKThumbnailWallpaper_na_identity__block_invoke_3((uint64_t)v3);
  v2 = (void *)_block_invoke_na_once_object_0_6;
  _block_invoke_na_once_object_0_6 = v1;
}

id __35__WKThumbnailWallpaper_na_identity__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F7A0E0];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___WKThumbnailWallpaper;
  v2 = objc_msgSendSuper2(&v7, sel_na_identity);
  v3 = [v1 builderWithIdentity:v2];

  id v4 = (id)[v3 appendCharacteristic:&__block_literal_global_7];
  int64_t v5 = [v3 build];

  return v5;
}

uint64_t __35__WKThumbnailWallpaper_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 thumbnailImageURL];
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
  v9.super_class = (Class)WKThumbnailWallpaper;
  v3 = [(WKAbstractWallpaper *)&v9 descriptionBuilderBlock];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__WKThumbnailWallpaper_descriptionBuilderBlock__block_invoke;
  aBlock[3] = &unk_1E6376828;
  objc_copyWeak(&v7, &location);
  aBlock[4] = v3;
  unint64_t v4 = _Block_copy(aBlock);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

void __47__WKThumbnailWallpaper_descriptionBuilderBlock__block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  int64_t v5 = [WeakRetained thumbnailImageURL];
  id v6 = [v5 path];
  [v4 appendString:v6 withName:@"thumbnailImageURL"];
}

- (NSURL)thumbnailImageURL
{
  return self->_thumbnailImageURL;
}

- (void)setThumbnailImageURL:(id)a3
{
}

- (UIImage)_thumbnailImage
{
  return self->__thumbnailImage;
}

- (void)set_thumbnailImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__thumbnailImage, 0);
  objc_storeStrong((id *)&self->_thumbnailImageURL, 0);
}

@end