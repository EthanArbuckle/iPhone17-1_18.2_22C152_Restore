@interface WKLiveWallpaper
+ (id)na_identity;
- (BOOL)copyWallpaperContentsToDestinationDirectoryURL:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSURL)videoAssetURL;
- (WKLiveWallpaper)initWithIdentifier:(int64_t)a3 name:(id)a4 type:(unint64_t)a5 thumbnailImageURL:(id)a6 fullsizeImageURL:(id)a7 videoAssetURL:(id)a8 stillTimeInVideo:(double)a9;
- (double)stillTimeInVideo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderBlock;
- (id)propertyListRepresentation;
- (unint64_t)hash;
- (void)setStillTimeInVideo:(double)a3;
- (void)setVideoAssetURL:(id)a3;
@end

@implementation WKLiveWallpaper

- (WKLiveWallpaper)initWithIdentifier:(int64_t)a3 name:(id)a4 type:(unint64_t)a5 thumbnailImageURL:(id)a6 fullsizeImageURL:(id)a7 videoAssetURL:(id)a8 stillTimeInVideo:(double)a9
{
  id v16 = a8;
  v21.receiver = self;
  v21.super_class = (Class)WKLiveWallpaper;
  v17 = [(WKStillWallpaper *)&v21 initWithIdentifier:a3 name:a4 type:a5 thumbnailImageURL:a6 fullsizeImageURL:a7];
  if (v17)
  {
    uint64_t v18 = [v16 copy];
    videoAssetURL = v17->_videoAssetURL;
    v17->_videoAssetURL = (NSURL *)v18;

    v17->_stillTimeInVideo = a9;
  }

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  int64_t v5 = [(WKAbstractWallpaper *)self identifier];
  v6 = [(WKAbstractWallpaper *)self name];
  unint64_t v7 = [(WKAbstractWallpaper *)self type];
  v8 = [(WKThumbnailWallpaper *)self thumbnailImageURL];
  v9 = [(WKStillWallpaper *)self fullsizeImageURL];
  v10 = [(WKLiveWallpaper *)self videoAssetURL];
  [(WKLiveWallpaper *)self stillTimeInVideo];
  v11 = objc_msgSend(v4, "initWithIdentifier:name:type:thumbnailImageURL:fullsizeImageURL:videoAssetURL:stillTimeInVideo:", v5, v6, v7, v8, v9, v10);

  return v11;
}

- (id)propertyListRepresentation
{
  v11.receiver = self;
  v11.super_class = (Class)WKLiveWallpaper;
  v3 = [(WKStillWallpaper *)&v11 propertyListRepresentation];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  int64_t v5 = v4;
  if (v3) {
    [v4 addEntriesFromDictionary:v3];
  }
  v6 = [(WKLiveWallpaper *)self videoAssetURL];
  unint64_t v7 = [v6 lastPathComponent];
  objc_msgSend(v5, "na_safeSetObject:forKey:", v7, @"videoFileName");

  v8 = NSNumber;
  [(WKLiveWallpaper *)self stillTimeInVideo];
  v9 = objc_msgSend(v8, "numberWithDouble:");
  objc_msgSend(v5, "na_safeSetObject:forKey:", v9, @"stillTimeInVideo");

  return v5;
}

- (BOOL)copyWallpaperContentsToDestinationDirectoryURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WKLiveWallpaper;
  if ([(WKStillWallpaper *)&v14 copyWallpaperContentsToDestinationDirectoryURL:v6 error:a4])
  {
    unint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    v8 = [(WKLiveWallpaper *)self videoAssetURL];
    v9 = [(WKLiveWallpaper *)self videoAssetURL];
    v10 = [v9 lastPathComponent];
    objc_super v11 = [v6 URLByAppendingPathComponent:v10];
    char v12 = [v7 copyItemAtURL:v8 toURL:v11 error:a4];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

+ (id)na_identity
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30__WKLiveWallpaper_na_identity__block_invoke;
  v4[3] = &__block_descriptor_40_e5__8__0l;
  v4[4] = a1;
  v2 = __30__WKLiveWallpaper_na_identity__block_invoke((uint64_t)v4);
  return v2;
}

id __30__WKLiveWallpaper_na_identity__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__WKLiveWallpaper_na_identity__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  if (_block_invoke_na_once_token_0_0 != -1) {
    dispatch_once(&_block_invoke_na_once_token_0_0, block);
  }
  v1 = (void *)_block_invoke_na_once_object_0_0;
  return v1;
}

void __30__WKLiveWallpaper_na_identity__block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __30__WKLiveWallpaper_na_identity__block_invoke_3;
  v3[3] = &__block_descriptor_40_e17___NAIdentity_8__0l;
  v3[4] = *(void *)(a1 + 32);
  uint64_t v1 = __30__WKLiveWallpaper_na_identity__block_invoke_3((uint64_t)v3);
  v2 = (void *)_block_invoke_na_once_object_0_0;
  _block_invoke_na_once_object_0_0 = v1;
}

id __30__WKLiveWallpaper_na_identity__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F7A0E0];
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)&OBJC_METACLASS___WKLiveWallpaper;
  v2 = objc_msgSendSuper2(&v8, sel_na_identity);
  v3 = [v1 builderWithIdentity:v2];

  id v4 = (id)[v3 appendCharacteristic:&__block_literal_global_1];
  id v5 = (id)[v3 appendDoubleCharacteristic:&__block_literal_global_13];
  id v6 = [v3 build];

  return v6;
}

uint64_t __30__WKLiveWallpaper_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 videoAssetURL];
}

uint64_t __30__WKLiveWallpaper_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 stillTimeInVideo];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
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
  v9.super_class = (Class)WKLiveWallpaper;
  v3 = [(WKStillWallpaper *)&v9 descriptionBuilderBlock];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__WKLiveWallpaper_descriptionBuilderBlock__block_invoke;
  aBlock[3] = &unk_1E6376828;
  objc_copyWeak(&v7, &location);
  aBlock[4] = v3;
  unint64_t v4 = _Block_copy(aBlock);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

void __42__WKLiveWallpaper_descriptionBuilderBlock__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  unint64_t v4 = [WeakRetained videoAssetURL];
  id v5 = [v4 path];
  [v7 appendString:v5 withName:@"videoAssetURL"];

  [WeakRetained stillTimeInVideo];
  id v6 = (id)objc_msgSend(v7, "appendTimeInterval:withName:decomposeUnits:", @"stillTimeInVideo", 1);
}

- (NSURL)videoAssetURL
{
  return self->_videoAssetURL;
}

- (void)setVideoAssetURL:(id)a3
{
}

- (double)stillTimeInVideo
{
  return self->_stillTimeInVideo;
}

- (void)setStillTimeInVideo:(double)a3
{
  self->_stillTimeInVideo = a3;
}

- (void).cxx_destruct
{
}

@end