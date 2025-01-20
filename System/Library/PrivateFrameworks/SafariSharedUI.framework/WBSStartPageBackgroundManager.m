@interface WBSStartPageBackgroundManager
+ (WBSStartPageBackgroundManager)defaultManager;
+ (id)ciColorKernel;
+ (void)warmUp;
- (BOOL)_isGeneratedBackgroundImageInImageSource:(CGImageSource *)a3;
- (BOOL)_tabGroupShouldInheritProfileBackgroundImage:(id)a3 forProfileWithIdentifier:(id)a4;
- (BOOL)_tabGroupShouldUseGlobalBackgroundImage:(id)a3 forProfileWithIdentifier:(id)a4;
- (BOOL)hasGlobalBackgroundImage;
- (BOOL)hasProfileSpecificBackgroundImage:(id)a3;
- (BOOL)hasTabGroupSpecificBackgroundImage:(id)a3;
- (BOOL)isCorrectBackgroundImageLoadedForIdentifier:(id)a3;
- (WBSCGImage)image;
- (WBSStartPageBackgroundManager)initWithImageURL:(id)a3;
- (double)_iconOpacityForBackgroundColor:(id)a3 forDarkIcon:(BOOL)a4;
- (id).cxx_construct;
- (id)_fetchImage:(id)a3 source:(CGImageSource *)a4 adjustForDarkAppearance:(BOOL)a5;
- (id)_templateImageWithImage:(id)a3 color:(id)a4;
- (id)_thumbnailForImage:(id)a3 source:(CGImageSource *)a4 adjustForDarkAppearance:(BOOL)a5;
- (id)analyzeImageAndThresholdIfNecessary:(CGImage *)a3 thumbnail:(CGImage *)a4 precomputedLuminance:(double)a5 getAppearance:(int64_t *)a6 luminance:(double *)a7;
- (id)assignImage:(id)a3 oldImage:(id)a4;
- (id)ciContext;
- (id)fetchImage:(id)a3;
- (id)imageForIdentifier:(id)a3 forProfile:(id)a4;
- (id)normalizeImage:(id)a3 properties:(id)a4;
- (id)prefetchedImageNameForProfile:(id)a3;
- (id)prefetchedImageThumbnailForProfile:(id)a3;
- (id)presetIconColorForSymbol:(id)a3;
- (id)thresholdImage:(CGImage *)a3 minValue:(double)a4 maxValue:(double)a5 multiplier:(double)a6;
- (int64_t)_generatedImageScaleWithSymbol:(id)a3;
- (int64_t)appearanceForImage:(id)a3;
- (int64_t)appearanceForImageWithIdentifier:(id)a3 forProfile:(id)a4;
- (int64_t)appearanceIfImageExists:(BOOL)a3;
- (unint64_t)_primaryIndexForImage:(id)a3 source:(CGImageSource *)a4 adjustForDarkAppearance:(BOOL)a5;
- (void)_clearPrefetchedImage;
- (void)_commitImage:(id)a3 appearanceName:(int64_t)a4 luminance:(double)a5 forIdentifier:(id)a6 isGeneratedImage:(BOOL)a7 withinProfile:(BOOL)a8 completionHandler:(id)a9;
- (void)_deleteImageWithIdentifier:(id)a3;
- (void)_loadImageFromDiskForIdentifier:(id)a3;
- (void)_prefetchImage:(id)a3 luminance:(double)a4 completion:(id)a5 withNanoSecondDelay:(int64_t)a6;
- (void)_processImageForIdentifier:(id)a3 isGeneratedImage:(BOOL)a4 withinProfile:(BOOL)a5 completionHandler:(id)a6;
- (void)_readImagePropertiesFromImageSource:(CGImageSource *)a3 forImageIdentifier:(id)a4 isNonGlobalBackgroundImage:(BOOL)a5;
- (void)_saveImage:(id)a3 appearance:(int64_t)a4 luminance:(double)a5 forIdentifier:(id)a6 isGeneratedImage:(BOOL)a7 withinProfile:(BOOL)a8 completion:(id)a9;
- (void)_setExtendedAttributesOnBackgroundImage;
- (void)_setHasProfileSpecificBackgroundImage:(BOOL)a3 forIdentifier:(id)a4;
- (void)_setHasTabGroupSpecificBackgroundImage:(BOOL)a3 forIdentifier:(id)a4;
- (void)_setImageOnAnyQueue:(id)a3 withAppearance:(int64_t)a4 forIdentifier:(id)a5;
- (void)_updateThumbnailIfNeeded;
- (void)cacheImageFromURL:(id)a3 completion:(id)a4;
- (void)clearImage;
- (void)clearImageWithIdentifier:(id)a3 withinProfile:(BOOL)a4;
- (void)clearPrefetchedImage;
- (void)commitPrefetchedImageWithLuminance:(double)a3 forIdentifier:(id)a4 isGeneratedImage:(BOOL)a5 withinProfile:(BOOL)a6;
- (void)generateProfileSpecificBackgroundImageWithSymbol:(id)a3 forProfile:(id)a4 withColor:(id)a5 completionHandler:(id)a6;
- (void)getHasGeneratedBackgroundImage:(id)a3 forProfileWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)loadImageFromDiskForIdentifier:(id)a3;
- (void)prefetchImage:(id)a3 completion:(id)a4;
- (void)prefetchImage:(id)a3 luminance:(double)a4 completion:(id)a5;
- (void)processImageForIdentifier:(id)a3 isGeneratedImage:(BOOL)a4 withinProfile:(BOOL)a5;
- (void)processImageForIdentifier:(id)a3 isGeneratedImage:(BOOL)a4 withinProfile:(BOOL)a5 completionHandler:(id)a6;
- (void)reloadProfileSpecificBackgroundImageFromDisk:(id)a3;
- (void)reloadTabGroupSpecificBackgroundImageFromDisk:(id)a3;
- (void)tabGroupManager:(id)a3 didRemoveProfileWithIdentifier:(id)a4;
- (void)tabGroupManager:(id)a3 didRemoveTabGroupWithUUID:(id)a4;
@end

@implementation WBSStartPageBackgroundManager

uint64_t __64__WBSStartPageBackgroundManager_loadImageFromDiskForIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadImageFromDiskForIdentifier:*(void *)(a1 + 40)];
}

uint64_t __65__WBSStartPageBackgroundManager__loadImageFromDiskForIdentifier___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 104) setObject:0 forKeyedSubscript:*(void *)(*(void *)(a1 + 32) + 56)];
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  return self;
}

+ (void)warmUp
{
  id v2 = +[WBSStartPageBackgroundManager defaultManager];
}

+ (WBSStartPageBackgroundManager)defaultManager
{
  if (+[WBSStartPageBackgroundManager defaultManager]::once != -1) {
    dispatch_once(&+[WBSStartPageBackgroundManager defaultManager]::once, &__block_literal_global_38);
  }
  id v2 = (void *)+[WBSStartPageBackgroundManager defaultManager]::instance;

  return (WBSStartPageBackgroundManager *)v2;
}

void __47__WBSStartPageBackgroundManager_defaultManager__block_invoke()
{
  v0 = [WBSStartPageBackgroundManager alloc];
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v1 = objc_msgSend(v4, "safari_startPageBackgroundImageFileURLForDefaultProfile");
  uint64_t v2 = [(WBSStartPageBackgroundManager *)v0 initWithImageURL:v1];
  v3 = (void *)+[WBSStartPageBackgroundManager defaultManager]::instance;
  +[WBSStartPageBackgroundManager defaultManager]::instance = v2;
}

- (WBSStartPageBackgroundManager)initWithImageURL:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)WBSStartPageBackgroundManager;
  v6 = [(WBSStartPageBackgroundManager *)&v25 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    backgroundImageIdentifierToImage = v6->_backgroundImageIdentifierToImage;
    v6->_backgroundImageIdentifierToImage = (NSMutableDictionary *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    backgroundImageIdentifierToLuminance = v6->_backgroundImageIdentifierToLuminance;
    v6->_backgroundImageIdentifierToLuminance = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    imageURLToTileRequired = v6->_imageURLToTileRequired;
    v6->_imageURLToTileRequired = (NSMutableDictionary *)v11;

    objc_storeStrong((id *)&v6->_imageURL, a3);
    v13 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.Safari.StartPageBackgroundManager.ThumbnailLoadingQueue", v13);
    internalQueue = v6->_internalQueue;
    v6->_internalQueue = (OS_dispatch_queue *)v14;

    v16 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.Safari.StartPageBackgroundManager", v16);
    imageReadWriteQueue = v6->_imageReadWriteQueue;
    v6->_imageReadWriteQueue = (OS_dispatch_queue *)v17;

    v19 = v6->_internalQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__WBSStartPageBackgroundManager_initWithImageURL___block_invoke;
    block[3] = &unk_1E5E408C0;
    v20 = v6;
    v24 = v20;
    dispatch_async(v19, block);
    v21 = v20;
  }
  return v6;
}

uint64_t __107__WBSStartPageBackgroundManager_getHasGeneratedBackgroundImage_forProfileWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  [*(id *)(*(void *)(a1 + 32) + 104) setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)getHasGeneratedBackgroundImage:(id)a3 forProfileWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  if ([(WBSStartPageBackgroundManager *)self _tabGroupShouldUseGlobalBackgroundImage:v8 forProfileWithIdentifier:v9])
  {
    uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v12 = objc_msgSend(v11, "safari_startPageBackgroundImageFileURLForDefaultProfile");
  }
  else
  {
    if ([(WBSStartPageBackgroundManager *)self _tabGroupShouldInheritProfileBackgroundImage:v8 forProfileWithIdentifier:v9])
    {
      uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
      objc_msgSend(v11, "safari_startPageBackgroundImageFileURLForIdentifier:", v9);
    }
    else
    {
      uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
      objc_msgSend(v11, "safari_startPageBackgroundImageFileURLForIdentifier:", v8);
    uint64_t v12 = };
  }
  v13 = (void *)v12;

  dispatch_queue_t v14 = [(NSMutableDictionary *)self->_imageURLToTileRequired objectForKeyedSubscript:v13];

  if (v14)
  {
    if (v10)
    {
      v15 = [(NSMutableDictionary *)self->_imageURLToTileRequired objectForKeyedSubscript:v13];
      v10[2](v10, [v15 BOOLValue]);
    }
  }
  else
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __107__WBSStartPageBackgroundManager_getHasGeneratedBackgroundImage_forProfileWithIdentifier_completionHandler___block_invoke;
    block[3] = &unk_1E5E41018;
    id v18 = v13;
    v19 = self;
    v20 = v10;
    dispatch_async(internalQueue, block);
  }
}

- (BOOL)_tabGroupShouldUseGlobalBackgroundImage:(id)a3 forProfileWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    if ([v7 isEqualToString:*MEMORY[0x1E4F984B8]]) {
      BOOL v8 = ![(WBSStartPageBackgroundManager *)self hasTabGroupSpecificBackgroundImage:v6];
    }
    else {
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

uint64_t __50__WBSStartPageBackgroundManager_initWithImageURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadImageFromDiskForIdentifier:&stru_1F031A860];
}

- (BOOL)isCorrectBackgroundImageLoadedForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 length];
  image = self->_image;
  if (v5)
  {
    if (!image
      || [(WBSStartPageBackgroundManager *)self hasTabGroupSpecificBackgroundImage:v4]|| [(WBSStartPageBackgroundManager *)self hasProfileSpecificBackgroundImage:v4])
    {
      goto LABEL_5;
    }
LABEL_7:
    BOOL v10 = 1;
    goto LABEL_8;
  }
  if (image) {
    goto LABEL_7;
  }
LABEL_5:
  id v7 = (void *)MEMORY[0x1E4F982B8];
  BOOL v8 = [(NSMutableDictionary *)self->_backgroundImageIdentifierToImage objectForKeyedSubscript:v4];
  id v9 = [v7 imageWithCGImage:v8];

  BOOL v10 = v9 != 0;
LABEL_8:

  return v10;
}

- (void)_loadImageFromDiskForIdentifier:(id)a3
{
  id v4 = a3;
  if ((-[WBSStartPageBackgroundManager hasTabGroupSpecificBackgroundImage:](self, "hasTabGroupSpecificBackgroundImage:", v4)|| -[WBSStartPageBackgroundManager hasProfileSpecificBackgroundImage:](self, "hasProfileSpecificBackgroundImage:", v4))&& [v4 length])
  {
    uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    objc_msgSend(v5, "safari_startPageBackgroundImageFileURLForIdentifier:", v4);
    CFURLRef v6 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

    id v7 = CGImageSourceCreateWithURL(v6, 0);
    if (!v7)
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __65__WBSStartPageBackgroundManager__loadImageFromDiskForIdentifier___block_invoke;
      v25[3] = &unk_1E5E40820;
      v25[4] = self;
      CFURLRef v26 = v6;
      id v27 = v4;
      CFURLRef v14 = v6;
      dispatch_async(MEMORY[0x1E4F14428], v25);

      goto LABEL_16;
    }

    uint64_t v8 = 1;
  }
  else
  {
    id v7 = CGImageSourceCreateWithURL((CFURLRef)self->_imageURL, 0);
    if (!v7)
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __65__WBSStartPageBackgroundManager__loadImageFromDiskForIdentifier___block_invoke_2;
      v24[3] = &unk_1E5E408C0;
      v24[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], v24);
      goto LABEL_16;
    }
    uint64_t v8 = 0;
  }
  [(WBSStartPageBackgroundManager *)self _readImagePropertiesFromImageSource:v7 forImageIdentifier:v4 isNonGlobalBackgroundImage:v8];
  id v9 = objc_msgSend(MEMORY[0x1E4F982B8], "imageByAdoptingCGImage:", CGImageSourceCreateThumbnailAtIndex(v7, 0, 0));
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  BOOL v10 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  uint64_t v11 = [v10 integerForKey:*MEMORY[0x1E4F98660]];

  uint64_t v23 = v11;
  if (v21[3] == 1) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = 2;
  }
  v21[3] = v12;
  if (v9) {
    -[WBSStartPageBackgroundManager _setImageOnAnyQueue:withAppearance:forIdentifier:](self, "_setImageOnAnyQueue:withAppearance:forIdentifier:", v9);
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__WBSStartPageBackgroundManager__loadImageFromDiskForIdentifier___block_invoke_3;
  block[3] = &unk_1E5E44CF0;
  char v19 = v8;
  dispatch_queue_t v17 = &v20;
  id v18 = v7;
  void block[4] = self;
  id v16 = v4;
  dispatch_async(internalQueue, block);

  _Block_object_dispose(&v20, 8);
LABEL_16:
}

- (BOOL)hasTabGroupSpecificBackgroundImage:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  uint64_t v5 = [v4 arrayForKey:*MEMORY[0x1E4F988D8]];

  LOBYTE(v4) = [v5 containsObject:v3];
  return (char)v4;
}

- (BOOL)hasProfileSpecificBackgroundImage:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  uint64_t v5 = [v4 arrayForKey:*MEMORY[0x1E4F98790]];

  LOBYTE(v4) = [v5 containsObject:v3];
  return (char)v4;
}

- (id)imageForIdentifier:(id)a3 forProfile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7 && [v7 kind] == 1)
  {
    id v9 = [v8 settingForKey:*MEMORY[0x1E4F98860]];
    char v10 = [v9 BOOLValue];
  }
  else
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    char v10 = [v9 BOOLForKey:*MEMORY[0x1E4F98860]];
  }
  char v11 = v10;

  if (v11)
  {
    if ([v6 length]
      && (-[WBSStartPageBackgroundManager hasTabGroupSpecificBackgroundImage:](self, "hasTabGroupSpecificBackgroundImage:", v6)|| -[WBSStartPageBackgroundManager hasProfileSpecificBackgroundImage:](self, "hasProfileSpecificBackgroundImage:", v6)|| ([v8 identifier], uint64_t v12 = objc_claimAutoreleasedReturnValue(), v13 = -[WBSStartPageBackgroundManager _tabGroupShouldInheritProfileBackgroundImage:forProfileWithIdentifier:](self, "_tabGroupShouldInheritProfileBackgroundImage:forProfileWithIdentifier:", v6, v12), v12, v13)))
    {
      CFURLRef v14 = [v8 identifier];
      BOOL v15 = [(WBSStartPageBackgroundManager *)self _tabGroupShouldInheritProfileBackgroundImage:v6 forProfileWithIdentifier:v14];

      if (v15)
      {
        uint64_t v16 = [v8 identifier];

        id v6 = (id)v16;
      }
      dispatch_queue_t v17 = (void *)MEMORY[0x1E4F982B8];
      id v18 = [(NSMutableDictionary *)self->_backgroundImageIdentifierToImage objectForKeyedSubscript:v6];
      char v19 = [v17 imageWithCGImage:v18];
    }
    else
    {
      char v19 = self->_image;
    }
  }
  else
  {
    char v19 = 0;
  }

  return v19;
}

- (void)loadImageFromDiskForIdentifier:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__WBSStartPageBackgroundManager_loadImageFromDiskForIdentifier___block_invoke;
  v7[3] = &unk_1E5E407D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __107__WBSStartPageBackgroundManager_getHasGeneratedBackgroundImage_forProfileWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  CGImageSourceRef v2 = CGImageSourceCreateWithURL(*(CFURLRef *)(a1 + 32), 0);
  if (v2)
  {
    CGImageSourceRef v3 = v2;
    char v4 = [*(id *)(a1 + 40) _isGeneratedBackgroundImageInImageSource:v2];
    CFRelease(v3);
  }
  else
  {
    char v4 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__WBSStartPageBackgroundManager_getHasGeneratedBackgroundImage_forProfileWithIdentifier_completionHandler___block_invoke_2;
  block[3] = &unk_1E5E44E58;
  int8x16_t v6 = *(int8x16_t *)(a1 + 32);
  id v5 = (id)v6.i64[0];
  int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
  char v10 = v4;
  id v9 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)reloadTabGroupSpecificBackgroundImageFromDisk:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__WBSStartPageBackgroundManager_reloadTabGroupSpecificBackgroundImageFromDisk___block_invoke;
  v7[3] = &unk_1E5E407D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __79__WBSStartPageBackgroundManager_reloadTabGroupSpecificBackgroundImageFromDisk___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadImageFromDiskForIdentifier:*(void *)(a1 + 40)];
}

- (void)reloadProfileSpecificBackgroundImageFromDisk:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__WBSStartPageBackgroundManager_reloadProfileSpecificBackgroundImageFromDisk___block_invoke;
  v7[3] = &unk_1E5E407D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __78__WBSStartPageBackgroundManager_reloadProfileSpecificBackgroundImageFromDisk___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadImageFromDiskForIdentifier:*(void *)(a1 + 40)];
}

- (id)presetIconColorForSymbol:(id)a3
{
  id v3 = a3;
  {
    -[WBSStartPageBackgroundManager presetIconColorForSymbol:]::colors = [MEMORY[0x1E4F982E8] orderedProfileColorOptions];
  }
  if (-[WBSStartPageBackgroundManager presetIconColorForSymbol:]::onceToken != -1) {
    dispatch_once(&-[WBSStartPageBackgroundManager presetIconColorForSymbol:]::onceToken, &__block_literal_global_75_0);
  }
  id v4 = [(id)-[WBSStartPageBackgroundManager presetIconColorForSymbol:]::presetIconColors objectForKeyedSubscript:v3];

  return v4;
}

void __58__WBSStartPageBackgroundManager_presetIconColorForSymbol___block_invoke()
{
  v8[5] = *MEMORY[0x1E4F143B8];
  v7[0] = @"person.lanyardcard.fill";
  v0 = [(id)-[WBSStartPageBackgroundManager presetIconColorForSymbol:]::colors objectAtIndexedSubscript:4];
  v8[0] = v0;
  v7[1] = @"graduationcap.fill";
  v1 = [(id)-[WBSStartPageBackgroundManager presetIconColorForSymbol:]::colors objectAtIndexedSubscript:1];
  v8[1] = v1;
  v7[2] = @"bag.fill";
  CGImageSourceRef v2 = [(id)-[WBSStartPageBackgroundManager presetIconColorForSymbol:]::colors objectAtIndexedSubscript:14];
  v8[2] = v2;
  v7[3] = @"hammer.fill";
  id v3 = [(id)-[WBSStartPageBackgroundManager presetIconColorForSymbol:]::colors objectAtIndexedSubscript:15];
  v8[3] = v3;
  v7[4] = @"building.2.fill";
  id v4 = [(id)-[WBSStartPageBackgroundManager presetIconColorForSymbol:]::colors objectAtIndexedSubscript:7];
  v8[4] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];
  id v6 = (void *)-[WBSStartPageBackgroundManager presetIconColorForSymbol:]::presetIconColors;
  -[WBSStartPageBackgroundManager presetIconColorForSymbol:]::presetIconColors = v5;
}

- (void)generateProfileSpecificBackgroundImageWithSymbol:(id)a3 forProfile:(id)a4 withColor:(id)a5 completionHandler:(id)a6
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  CFURLRef v14 = (void (**)(void, void))v13;
  v60 = v11;
  if (v10 && v11)
  {
    int64_t v15 = [(WBSStartPageBackgroundManager *)self _generatedImageScaleWithSymbol:v10];
    v58 = [MEMORY[0x1E4F42A98] configurationWithPointSize:4 weight:v15 scale:30.0];
    v57 = [MEMORY[0x1E4F42A80] _systemImageNamed:v10];
    v59 = [v57 imageWithSymbolConfiguration:v58];
    [v59 size];
    uint64_t v17 = v16;
    uint64_t v19 = v18;
    if (v12 && ([v12 isClearColor] & 1) == 0)
    {
      uint64_t v20 = objc_msgSend(MEMORY[0x1E4F428B8], "safari_colorWithWBSNamedColorOption:", v12);
    }
    else
    {
      uint64_t v20 = objc_msgSend(MEMORY[0x1E4F428B8], "safari_colorWithRGBColorComponents:", &unk_1F0341FA8);
    }
    v21 = (void *)v20;
    [(WBSStartPageBackgroundManager *)self _iconOpacityForBackgroundColor:v20 forDarkIcon:0];
    double v23 = v22;
    [(WBSStartPageBackgroundManager *)self _iconOpacityForBackgroundColor:v21 forDarkIcon:1];
    double v25 = v24;
    CFURLRef v26 = (void *)MEMORY[0x1E4F428B8];
    if (v12) {
      unsigned int v27 = [v12 isClearColor] ^ 1;
    }
    else {
      unsigned int v27 = 0;
    }
    v28 = [v26 colorWithWhite:(double)v27 alpha:v23];
    v29 = [(WBSStartPageBackgroundManager *)self _templateImageWithImage:v59 color:v28];

    v30 = (void *)MEMORY[0x1E4F428B8];
    if (v12) {
      unsigned int v31 = [v12 isClearColor] ^ 1;
    }
    else {
      unsigned int v31 = 0;
    }
    v32 = [v30 colorWithWhite:(double)v31 alpha:v25];
    v33 = [(WBSStartPageBackgroundManager *)self _templateImageWithImage:v59 color:v32];

    v34 = (void *)MEMORY[0x1E4F42A80];
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __121__WBSStartPageBackgroundManager_generateProfileSpecificBackgroundImageWithSymbol_forProfile_withColor_completionHandler___block_invoke_2;
    v62[3] = &unk_1E5E44CA0;
    id v35 = v21;
    long long v67 = xmmword_1ABC5F8C0;
    long long v68 = xmmword_1ABC5F870;
    id v63 = v35;
    id v66 = &__block_literal_global_95;
    uint64_t v69 = v17;
    uint64_t v70 = v19;
    long long v71 = xmmword_1ABC5F880;
    id v36 = v29;
    id v64 = v36;
    long long v72 = xmmword_1ABC5F890;
    long long v73 = xmmword_1ABC5F8A0;
    long long v74 = xmmword_1ABC5F8B0;
    id v56 = v33;
    id v65 = v56;
    v37 = objc_msgSend(v34, "safari_imageWithSize:flipped:actions:", 0, v62, 240.0, 320.0);
    if (v37)
    {
      v38 = [MEMORY[0x1E4F28CB8] defaultManager];
      v39 = objc_msgSend(v38, "safari_startPageBackgroundImageFolderURL");
      v40 = [v39 path];
      char v41 = [v38 fileExistsAtPath:v40];

      if ((v41 & 1) == 0
        && (objc_msgSend(v38, "safari_startPageBackgroundImageFolderURL"),
            v42 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v38, "safari_ensureDirectoryExists:", v42),
            v43 = objc_claimAutoreleasedReturnValue(),
            BOOL v44 = v43 == 0,
            v43,
            v42,
            v44))
      {
        v14[2](v14, 0);
      }
      else
      {
        v45 = objc_msgSend(v38, "safari_startPageBackgroundImageFileURLForIdentifier:", v60);
        id v61 = 0;
        v54 = objc_msgSend(v38, "safari_createTemporaryDirectoryAppropriateForURL:error:", v45, &v61);
        id v55 = v61;

        if (v55)
        {
          v46 = (id)WBS_LOG_CHANNEL_PREFIXStartPage();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v55, "safari_privacyPreservingDescription");
            objc_claimAutoreleasedReturnValue();
            -[WBSStartPageBackgroundManager generateProfileSpecificBackgroundImageWithSymbol:forProfile:withColor:completionHandler:]();
          }

          v14[2](v14, 0);
        }
        else
        {
          v48 = [NSString stringWithFormat:@"GeneratedProfileBackground.png"];
          CFURLRef url = [v54 URLByAppendingPathComponent:v48];

          v49 = [(id)*MEMORY[0x1E4F44460] identifier];
          v50 = CGImageDestinationCreateWithURL(url, v49, 1uLL, 0);

          CGImageDestinationAddImage(v50, (CGImageRef)[v37 CGImage], 0);
          if (CGImageDestinationFinalize(v50))
          {
            CFRelease(v50);
            CFURLRef v51 = url;
          }
          else
          {
            v52 = WBS_LOG_CHANNEL_PREFIXStartPage();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
              -[WBSStartPageBackgroundManager generateProfileSpecificBackgroundImageWithSymbol:forProfile:withColor:completionHandler:]((uint64_t)url, v52);
            }
            CFRelease(v50);
            CFURLRef v51 = 0;
          }
          ((void (**)(void, const __CFURL *))v14)[2](v14, v51);
        }
      }
    }
    else
    {
      v47 = WBS_LOG_CHANNEL_PREFIXStartPage();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        -[WBSStartPageBackgroundManager generateProfileSpecificBackgroundImageWithSymbol:forProfile:withColor:completionHandler:](v47);
      }
      v14[2](v14, 0);
    }
  }
  else
  {
    (*((void (**)(id, void))v13 + 2))(v13, 0);
  }
}

double __121__WBSStartPageBackgroundManager_generateProfileSpecificBackgroundImageWithSymbol_forProfile_withColor_completionHandler___block_invoke(double a1, double a2, double a3)
{
  return a3 - a1 * 0.5;
}

void __121__WBSStartPageBackgroundManager_generateProfileSpecificBackgroundImageWithSymbol_forProfile_withColor_completionHandler___block_invoke_2(uint64_t a1, CGContext *a2)
{
  CGContextSetFillColorWithColor(a2, (CGColorRef)[*(id *)(a1 + 32) CGColor]);
  CGContextFillRect(a2, *(CGRect *)(a1 + 64));
  CGContextSetBlendMode(a2, kCGBlendModeNormal);
  CGFloat v4 = (*(double (**)(double, double, double, double))(*(void *)(a1 + 56) + 16))(*(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  id v11 = (CGImage *)[*(id *)(a1 + 40) CGImage];
  v73.origin.x = v4;
  v73.origin.y = v6;
  v73.size.width = v8;
  v73.size.height = v10;
  CGContextDrawImage(a2, v73, v11);
  CGFloat v12 = (*(double (**)(double, double, double, double))(*(void *)(a1 + 56) + 16))(*(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 128), *(double *)(a1 + 136));
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  uint64_t v19 = (CGImage *)[*(id *)(a1 + 40) CGImage];
  v74.origin.x = v12;
  v74.origin.y = v14;
  v74.size.width = v16;
  v74.size.height = v18;
  CGContextDrawImage(a2, v74, v19);
  CGFloat v20 = (*(double (**)(double, double, double, double))(*(void *)(a1 + 56) + 16))(*(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 144), *(double *)(a1 + 152));
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  unsigned int v27 = (CGImage *)[*(id *)(a1 + 40) CGImage];
  v75.origin.x = v20;
  v75.origin.y = v22;
  v75.size.width = v24;
  v75.size.height = v26;
  CGContextDrawImage(a2, v75, v27);
  CGFloat v28 = (*(double (**)(double, double, double, double))(*(void *)(a1 + 56) + 16))(*(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 160), *(double *)(a1 + 168));
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  id v35 = (CGImage *)[*(id *)(a1 + 40) CGImage];
  v76.origin.x = v28;
  v76.origin.y = v30;
  v76.size.width = v32;
  v76.size.height = v34;
  CGContextDrawImage(a2, v76, v35);
  CGFloat v36 = (*(double (**)(double, double, double, double))(*(void *)(a1 + 56) + 16))(*(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 152));
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  CGFloat v42 = v41;
  v43 = (CGImage *)[*(id *)(a1 + 48) CGImage];
  v77.origin.x = v36;
  v77.origin.y = v38;
  v77.size.width = v40;
  v77.size.height = v42;
  CGContextDrawImage(a2, v77, v43);
  CGFloat v44 = (*(double (**)(double, double, double, double))(*(void *)(a1 + 56) + 16))(*(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 128), *(double *)(a1 + 168));
  CGFloat v46 = v45;
  CGFloat v48 = v47;
  CGFloat v50 = v49;
  CFURLRef v51 = (CGImage *)[*(id *)(a1 + 48) CGImage];
  v78.origin.x = v44;
  v78.origin.y = v46;
  v78.size.width = v48;
  v78.size.height = v50;
  CGContextDrawImage(a2, v78, v51);
  CGFloat v52 = (*(double (**)(double, double, double, double))(*(void *)(a1 + 56) + 16))(*(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 144), *(double *)(a1 + 120));
  CGFloat v54 = v53;
  CGFloat v56 = v55;
  CGFloat v58 = v57;
  v59 = (CGImage *)[*(id *)(a1 + 48) CGImage];
  v79.origin.x = v52;
  v79.origin.y = v54;
  v79.size.width = v56;
  v79.size.height = v58;
  CGContextDrawImage(a2, v79, v59);
  double v60 = (*(double (**)(double, double, double, double))(*(void *)(a1 + 56) + 16))(*(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 160), *(double *)(a1 + 136));
  uint64_t v62 = v61;
  uint64_t v64 = v63;
  uint64_t v66 = v65;
  long long v67 = (CGImage *)[*(id *)(a1 + 48) CGImage];
  double v68 = v60;
  uint64_t v69 = v62;
  uint64_t v70 = v64;
  uint64_t v71 = v66;

  CGContextDrawImage(a2, *(CGRect *)&v68, v67);
}

- (double)_iconOpacityForBackgroundColor:(id)a3 forDarkIcon:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  CGFloat v6 = [MEMORY[0x1E4F428B8] colorWithRed:0.91 green:0.95 blue:0.56 alpha:1.0];
  double v7 = objc_msgSend(MEMORY[0x1E4F428B8], "safari_colorWithRGBColorComponents:", &unk_1F0341FC0);
  if (v4)
  {
    int v8 = [v5 isEqual:v6];
    int v9 = [v5 isEqual:v7];
    double v10 = 0.1;
    if (v8) {
      double v10 = 0.3;
    }
    BOOL v11 = v9 == 0;
    double v12 = 0.05;
  }
  else
  {
    int v13 = [v5 isEqual:v6];
    int v14 = [v5 isEqual:v7];
    double v10 = 0.2;
    if (v13) {
      double v10 = 0.5;
    }
    BOOL v11 = v14 == 0;
    double v12 = 0.02;
  }
  if (v11) {
    double v15 = v10;
  }
  else {
    double v15 = v12;
  }

  return v15;
}

- (int64_t)_generatedImageScaleWithSymbol:(id)a3
{
  if ([a3 isEqualToString:@"bicycle"]) {
    return 2;
  }
  else {
    return 3;
  }
}

- (id)_templateImageWithImage:(id)a3 color:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 size];
  double v8 = v7;
  double v10 = v9;
  BOOL v11 = (void *)MEMORY[0x1E4F42A80];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  double v21 = __63__WBSStartPageBackgroundManager__templateImageWithImage_color___block_invoke;
  CGFloat v22 = &unk_1E5E44CC8;
  id v12 = v6;
  id v23 = v12;
  double v25 = v8;
  double v26 = v10;
  id v13 = v5;
  id v24 = v13;
  int v14 = objc_msgSend(v11, "safari_imageWithSize:flipped:actions:", 0, &v19, v8, v10);
  double v15 = (void *)MEMORY[0x1E4F982B8];
  id v16 = v14;
  double v17 = objc_msgSend(v15, "imageWithCGImage:", objc_msgSend(v16, "CGImage", v19, v20, v21, v22));

  return v17;
}

void __63__WBSStartPageBackgroundManager__templateImageWithImage_color___block_invoke(uint64_t a1, CGContext *a2)
{
  CGContextSetFillColorWithColor(a2, (CGColorRef)[*(id *)(a1 + 32) CGColor]);
  v12.size.width = *(CGFloat *)(a1 + 48);
  v12.size.height = *(CGFloat *)(a1 + 56);
  v12.origin.x = 0.0;
  v12.origin.y = 0.0;
  CGContextFillRect(a2, v12);
  CGContextSetBlendMode(a2, kCGBlendModeDestinationIn);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v6 = (CGImage *)[*(id *)(a1 + 40) CGImage];
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = v4;
  uint64_t v10 = v5;

  CGContextDrawImage(a2, *(CGRect *)&v7, v6);
}

void __65__WBSStartPageBackgroundManager__loadImageFromDiskForIdentifier___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 104) setObject:0 forKeyedSubscript:a1[5]];
  [*(id *)(a1[4] + 88) setObject:0 forKeyedSubscript:a1[6]];
  [*(id *)(a1[4] + 96) setObject:0 forKeyedSubscript:a1[6]];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"StartPageBackgroundImageDidChangeNotification" object:a1[4]];
}

void __65__WBSStartPageBackgroundManager__loadImageFromDiskForIdentifier___block_invoke_3(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F982B8], "imageByAdoptingCGImage:", CGImageSourceCreateImageAtIndex(*(CGImageSourceRef *)(a1 + 56), 0, 0));
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  int v3 = [v2 BOOLForKey:@"StartPagePopoverUsesDefaultBackground"];
  int v4 = [v2 BOOLForKey:@"DidRecomputeStartPageAppearanceAfterFixes"];
  char v5 = v4;
  int v6 = *(unsigned __int8 *)(a1 + 64);
  if (*(unsigned char *)(a1 + 64)) {
    int v7 = 1;
  }
  else {
    int v7 = v3;
  }
  if (((v7 | v4) & 1) == 0)
  {
    double v8 = WBSComputeAverageLuminance((CGImage *)[v10 CGImage]);
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = appearanceNameForLuminance(v8);
    [v2 setInteger:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) forKey:*MEMORY[0x1E4F98660]];
    int v6 = *(unsigned __int8 *)(a1 + 64);
  }
  if (v6) {
    char v9 = 1;
  }
  else {
    char v9 = v5;
  }
  if ((v9 & 1) == 0) {
    [v2 setBool:1 forKey:@"DidRecomputeStartPageAppearanceAfterFixes"];
  }
  CFRelease(*(CFTypeRef *)(a1 + 56));
  [*(id *)(a1 + 32) _setImage:v10 withAppearance:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) forIdentifier:*(void *)(a1 + 40)];
}

- (void)_setExtendedAttributesOnBackgroundImage
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1ABB70000, v3, v4, "Failed to set iCloud backup exclusion for Safari's background image: %{public}@", v5);
}

- (void)_readImagePropertiesFromImageSource:(CGImageSource *)a3 forImageIdentifier:(id)a4 isNonGlobalBackgroundImage:(BOOL)a5
{
  id v8 = a4;
  CFRetain(a3);
  internalQueue = self->_internalQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __115__WBSStartPageBackgroundManager__readImagePropertiesFromImageSource_forImageIdentifier_isNonGlobalBackgroundImage___block_invoke;
  v11[3] = &unk_1E5E44D40;
  id v12 = v8;
  id v13 = a3;
  BOOL v14 = a5;
  v11[4] = self;
  id v10 = v8;
  dispatch_async(internalQueue, v11);
}

void __115__WBSStartPageBackgroundManager__readImagePropertiesFromImageSource_forImageIdentifier_isNonGlobalBackgroundImage___block_invoke(uint64_t a1)
{
  CFDictionaryRef v2 = CGImageSourceCopyPropertiesAtIndex(*(CGImageSourceRef *)(a1 + 48), 0, 0);
  int v3 = CGImageSourceCopyMetadataAtIndex(*(CGImageSourceRef *)(a1 + 48), 0, 0);
  os_log_t v4 = v3;
  if (v3)
  {
    char v5 = CGImageMetadataCopyTagWithPath(v3, 0, @"safari:fileName");
    int v6 = v5;
    if (v5)
    {
      int v7 = (void *)CGImageMetadataTagCopyValue(v5);
      CFRelease(v6);
    }
    else
    {
      int v7 = 0;
    }
    CFRelease(v4);
    if (v7)
    {
      id v8 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
      [v8 setObject:v7 forKey:*MEMORY[0x1E4F98668]];
    }
  }
  else
  {
    int v7 = 0;
  }
  if (!*(unsigned char *)(a1 + 56)) {
    goto LABEL_11;
  }
  char v9 = [(__CFDictionary *)v2 objectForKeyedSubscript:*MEMORY[0x1E4F2F800]];
  id v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F2F958]];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __115__WBSStartPageBackgroundManager__readImagePropertiesFromImageSource_forImageIdentifier_isNonGlobalBackgroundImage___block_invoke_2;
  block[3] = &unk_1E5E40820;
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(a1 + 40);
  id v22 = v10;
  uint64_t v23 = v11;
  id v24 = v12;
  id v13 = v10;
  dispatch_async(MEMORY[0x1E4F14428], block);

  if (*(unsigned char *)(a1 + 56))
  {
    BOOL v14 = [MEMORY[0x1E4F28CB8] defaultManager];
    objc_msgSend(v14, "safari_startPageBackgroundImageFileURLForIdentifier:", *(void *)(a1 + 40));
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_11:
    id v15 = *(id *)(*(void *)(a1 + 32) + 56);
  }
  char v16 = [*(id *)(a1 + 32) _isGeneratedBackgroundImageInImageSource:*(void *)(a1 + 48)];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __115__WBSStartPageBackgroundManager__readImagePropertiesFromImageSource_forImageIdentifier_isNonGlobalBackgroundImage___block_invoke_3;
  v18[3] = &unk_1E5E44D18;
  v18[4] = *(void *)(a1 + 32);
  id v17 = v15;
  id v19 = v17;
  char v20 = v16;
  dispatch_async(MEMORY[0x1E4F14428], v18);
  CFRelease(*(CFTypeRef *)(a1 + 48));
}

void *__115__WBSStartPageBackgroundManager__readImagePropertiesFromImageSource_forImageIdentifier_isNonGlobalBackgroundImage___block_invoke_2(void *result)
{
  uint64_t v1 = result[4];
  if (v1) {
    return (void *)[*(id *)(result[5] + 96) setObject:v1 forKeyedSubscript:result[6]];
  }
  return result;
}

void __115__WBSStartPageBackgroundManager__readImagePropertiesFromImageSource_forImageIdentifier_isNonGlobalBackgroundImage___block_invoke_3(uint64_t a1)
{
  id v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 104), "setObject:forKeyedSubscript:");
}

- (void)_setImageOnAnyQueue:(id)a3 withAppearance:(int64_t)a4 forIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if ([v10 length])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__WBSStartPageBackgroundManager__setImageOnAnyQueue_withAppearance_forIdentifier___block_invoke;
    block[3] = &unk_1E5E40820;
    void block[4] = self;
    id v27 = v10;
    id v28 = v9;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    objc_storeStrong((id *)&self->_image, a3);
  }
  if ([v10 length])
  {
    uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    objc_msgSend(v11, "safari_startPageBackgroundImageFileURLForIdentifier:", v10);
    id v12 = (NSURL *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = self->_imageURL;
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __82__WBSStartPageBackgroundManager__setImageOnAnyQueue_withAppearance_forIdentifier___block_invoke_2;
  v24[3] = &unk_1E5E407D0;
  v24[4] = self;
  id v13 = v12;
  double v25 = v13;
  dispatch_async(MEMORY[0x1E4F14428], v24);
  if (![v10 length])
  {
    if ([v9 CGImage]) {
      int64_t v14 = a4;
    }
    else {
      int64_t v14 = 0;
    }
    self->_appearance = v14;
  }
  id v15 = self->_prefetchedImageURL;
  if (v15) {
    BOOL v16 = 0;
  }
  else {
    BOOL v16 = self->_lastPrefetchedFilePath == 0;
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __82__WBSStartPageBackgroundManager__setImageOnAnyQueue_withAppearance_forIdentifier___block_invoke_3;
  v19[3] = &unk_1E5E44D68;
  BOOL v22 = v9 != 0;
  BOOL v23 = v16;
  char v20 = v15;
  double v21 = self;
  id v17 = v15;
  CGFloat v18 = (void *)MEMORY[0x1E4F14428];
  dispatch_async(MEMORY[0x1E4F14428], v19);
}

uint64_t __82__WBSStartPageBackgroundManager__setImageOnAnyQueue_withAppearance_forIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 48) CGImage];
  uint64_t v3 = *(void *)(a1 + 40);
  os_log_t v4 = *(void **)(*(void *)(a1 + 32) + 88);

  return [v4 setObject:v2 forKeyedSubscript:v3];
}

uint64_t __82__WBSStartPageBackgroundManager__setImageOnAnyQueue_withAppearance_forIdentifier___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 104) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

void __82__WBSStartPageBackgroundManager__setImageOnAnyQueue_withAppearance_forIdentifier___block_invoke_3(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 48)
    || *(unsigned char *)(a1 + 49)
    || ([*(id *)(a1 + 32) absoluteString],
        id v3 = (id)objc_claimAutoreleasedReturnValue(),
        int v2 = [v3 isEqualToString:*(void *)(*(void *)(a1 + 40) + 40)],
        v3,
        v2))
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"StartPageBackgroundImageDidChangeNotification" object:*(void *)(a1 + 40)];
  }
}

- (void)processImageForIdentifier:(id)a3 isGeneratedImage:(BOOL)a4 withinProfile:(BOOL)a5
{
}

- (void)processImageForIdentifier:(id)a3 isGeneratedImage:(BOOL)a4 withinProfile:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __108__WBSStartPageBackgroundManager_processImageForIdentifier_isGeneratedImage_withinProfile_completionHandler___block_invoke;
  v15[3] = &unk_1E5E44D90;
  v15[4] = self;
  id v16 = v10;
  BOOL v18 = a4;
  BOOL v19 = a5;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(internalQueue, v15);
}

void *__108__WBSStartPageBackgroundManager_processImageForIdentifier_isGeneratedImage_withinProfile_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result[3]) {
    return (void *)[result _processImageForIdentifier:*(void *)(a1 + 40) isGeneratedImage:*(unsigned __int8 *)(a1 + 56) withinProfile:*(unsigned __int8 *)(a1 + 57) completionHandler:*(void *)(a1 + 48)];
  }
  return result;
}

- (void)_saveImage:(id)a3 appearance:(int64_t)a4 luminance:(double)a5 forIdentifier:(id)a6 isGeneratedImage:(BOOL)a7 withinProfile:(BOOL)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a6;
  id v17 = a9;
  imageReadWriteQueue = self->_imageReadWriteQueue;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __121__WBSStartPageBackgroundManager__saveImage_appearance_luminance_forIdentifier_isGeneratedImage_withinProfile_completion___block_invoke;
  v22[3] = &unk_1E5E44DB8;
  v22[4] = self;
  id v23 = v16;
  BOOL v27 = a8;
  double v26 = a5;
  BOOL v28 = a7;
  id v24 = v15;
  id v25 = v17;
  id v19 = v17;
  id v20 = v15;
  id v21 = v16;
  dispatch_async(imageReadWriteQueue, v22);
}

void __121__WBSStartPageBackgroundManager__saveImage_appearance_luminance_forIdentifier_isGeneratedImage_withinProfile_completion___block_invoke(uint64_t a1)
{
  v54[1] = *MEMORY[0x1E4F143B8];
  double v49 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v2 = *(id *)(*(void *)(a1 + 32) + 56);
  if ([*(id *)(a1 + 40) length])
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    if (*(unsigned char *)(a1 + 72)) {
      [v3 _setHasProfileSpecificBackgroundImage:1 forIdentifier:v4];
    }
    else {
      [v3 _setHasTabGroupSpecificBackgroundImage:1 forIdentifier:v4];
    }
    char v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v6 = objc_msgSend(v5, "safari_startPageBackgroundImageFileURLForIdentifier:", *(void *)(a1 + 40));

    id v2 = (id)v6;
  }
  int v7 = [v2 URLByDeletingLastPathComponent];
  id v8 = (id)objc_msgSend(v49, "safari_ensureDirectoryExists:", v7);

  if (*(void *)(a1 + 48))
  {
    id v44 = *(id *)(*(void *)(a1 + 32) + 32);
    image = (CGImage *)[*(id *)(a1 + 48) CGImage];
    uint64_t v53 = *MEMORY[0x1E4F2F418];
    v54[0] = MEMORY[0x1E4F1CC38];
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:&v53 count:1];
    double v10 = *(double *)(a1 + 64);
    int v11 = *(unsigned __int8 *)(a1 + 73);
    CFURLRef url = (const __CFURL *)v2;
    id v12 = v44;
    id v48 = v9;
    Mutable = CGImageMetadataCreateMutable();
    if (!CGImageMetadataRegisterNamespaceForPrefix(Mutable, @"http://ns.apple.com/safari", @"safari", 0))
    {
      id v14 = WBS_LOG_CHANNEL_PREFIXStartPage();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __121__WBSStartPageBackgroundManager__saveImage_appearance_luminance_forIdentifier_isGeneratedImage_withinProfile_completion___block_invoke_cold_3(v14);
      }
    }
    id v15 = @"True";
    if (!v11) {
      id v15 = @"False";
    }
    CGFloat v46 = v15;
    id v16 = CGImageMetadataTagCreate(@"http://ns.apple.com/safari", @"safari", @"startPageBackgroundTile", kCGImageMetadataTypeString, v46);
    CGImageMetadataSetTagWithPath(Mutable, 0, @"safari:startPageBackgroundTile", v16);
    CFRelease(v16);
    id v17 = [NSNumber numberWithDouble:v10];
    uint64_t v18 = *MEMORY[0x1E4F2F490];
    id v19 = CGImageMetadataTagCreate((CFStringRef)*MEMORY[0x1E4F2F480], (CFStringRef)*MEMORY[0x1E4F2F490], @"luminance", kCGImageMetadataTypeString, v17);

    id v20 = [NSString stringWithFormat:@"%@:%@", v18, *MEMORY[0x1E4F2F958]];
    CGImageMetadataSetTagWithPath(Mutable, 0, v20, v19);
    CFRelease(v19);
    id v21 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F0341FD8];
    BOOL v22 = [v12 URLByDeletingPathExtension];
    id v23 = [v22 lastPathComponent];
    if ([v21 containsObject:v23])
    {
      id v24 = [v12 URLByDeletingPathExtension];
      id v25 = [v24 lastPathComponent];
    }
    else
    {
      id v25 = @"custom";
    }

    double v29 = +[WBSBackgroundImageAssetController mobileAssetBackgroundImageNamesOnDisk];
    CGFloat v30 = [v12 lastPathComponent];
    int v31 = [v29 containsObject:v30];

    if (v31)
    {
      uint64_t v32 = [v12 lastPathComponent];

      id v25 = (__CFString *)v32;
    }
    double v33 = CGImageMetadataTagCreate(@"http://ns.apple.com/safari", @"safari", @"fileName", kCGImageMetadataTypeString, v25);
    CGImageMetadataSetTagWithPath(Mutable, 0, @"safari:fileName", v33);
    CFRelease(v33);
    CGFloat v34 = (void *)[v48 mutableCopy];
    [v34 setObject:Mutable forKeyedSubscript:*MEMORY[0x1E4F2F448]];
    [v34 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F2F440]];
    id v35 = [(id)*MEMORY[0x1E4F44460] identifier];
    CGFloat v36 = CGImageDestinationCreateWithURL(url, v35, 1uLL, 0);

    if (v36)
    {
      CFDictionaryRef v37 = (const __CFDictionary *)[v34 copy];
      CGImageDestinationAddImageAndMetadata(v36, image, Mutable, v37);

      BOOL v38 = CGImageDestinationFinalize(v36);
      CFRelease(v36);
      if (Mutable) {
        CFRelease(Mutable);
      }

      if (v38)
      {
        double v39 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
        CGFloat v40 = [v12 URLByDeletingPathExtension];
        double v41 = [v40 lastPathComponent];
        [v39 setObject:v41 forKey:*MEMORY[0x1E4F98668]];

        [v39 setInteger:*(void *)(*(void *)(a1 + 32) + 64) forKey:*MEMORY[0x1E4F98660]];
        [*(id *)(a1 + 32) _setExtendedAttributesOnBackgroundImage];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __121__WBSStartPageBackgroundManager__saveImage_appearance_luminance_forIdentifier_isGeneratedImage_withinProfile_completion___block_invoke_2;
        block[3] = &unk_1E5E407D0;
        void block[4] = *(void *)(a1 + 32);
        CFURLRef v52 = url;
        dispatch_async(MEMORY[0x1E4F14428], block);

        goto LABEL_32;
      }
    }
    else
    {
      if (Mutable) {
        CFRelease(Mutable);
      }
    }
    CGFloat v42 = WBS_LOG_CHANNEL_PREFIXStartPage();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      __121__WBSStartPageBackgroundManager__saveImage_appearance_luminance_forIdentifier_isGeneratedImage_withinProfile_completion___block_invoke_cold_2((uint64_t)url, v42);
    }
  }
  else
  {
    id v50 = 0;
    char v26 = [v49 removeItemAtURL:v2 error:&v50];
    id v12 = v50;
    if ((v26 & 1) == 0)
    {
      BOOL v27 = (id)WBS_LOG_CHANNEL_PREFIXStartPage();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        __121__WBSStartPageBackgroundManager__saveImage_appearance_luminance_forIdentifier_isGeneratedImage_withinProfile_completion___block_invoke_cold_1();
      }
    }
    BOOL v28 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    [v28 removeObjectForKey:*MEMORY[0x1E4F98660]];
  }
LABEL_32:

  uint64_t v43 = *(void *)(a1 + 56);
  if (v43) {
    (*(void (**)(void))(v43 + 16))();
  }
}

void __121__WBSStartPageBackgroundManager__saveImage_appearance_luminance_forIdentifier_isGeneratedImage_withinProfile_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 104) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"StartPageBackgroundImageDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)_updateThumbnailIfNeeded
{
  if (!self->_prefetchedImageThumbnail)
  {
    id v10 = [(NSURL *)self->_prefetchedImageURL absoluteString];
    int v3 = [v10 hasPrefix:@"file:///System/Library/Desktop%20Pictures/"];

    if (v3)
    {
      id v11 = [(NSURL *)self->_prefetchedImageURL lastPathComponent];
      uint64_t v4 = [(NSURL *)self->_prefetchedImageURL URLByDeletingLastPathComponent];
      char v5 = [v4 URLByAppendingPathComponent:@".thumbnails" isDirectory:1];

      CFURLRef v6 = [v5 URLByAppendingPathComponent:v11 isDirectory:0];
      int v7 = CGImageSourceCreateWithURL(v6, 0);
      objc_msgSend(MEMORY[0x1E4F982B8], "imageByAdoptingCGImage:", CGImageSourceCreateImageAtIndex(v7, 0, 0));
      id v8 = (WBSCGImage *)objc_claimAutoreleasedReturnValue();
      prefetchedImageThumbnail = self->_prefetchedImageThumbnail;
      self->_prefetchedImageThumbnail = v8;

      CFRelease(v7);
    }
  }
}

- (void)commitPrefetchedImageWithLuminance:(double)a3 forIdentifier:(id)a4 isGeneratedImage:(BOOL)a5 withinProfile:(BOOL)a6
{
  id v10 = a4;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __113__WBSStartPageBackgroundManager_commitPrefetchedImageWithLuminance_forIdentifier_isGeneratedImage_withinProfile___block_invoke;
  v13[3] = &unk_1E5E44DE0;
  double v15 = a3;
  v13[4] = self;
  id v14 = v10;
  BOOL v16 = a5;
  BOOL v17 = a6;
  id v12 = v10;
  dispatch_async(internalQueue, v13);
}

uint64_t __113__WBSStartPageBackgroundManager_commitPrefetchedImageWithLuminance_forIdentifier_isGeneratedImage_withinProfile___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void **)(result + 32);
  uint64_t v2 = v1[3];
  if (v2)
  {
    uint64_t v3 = result;
    uint64_t v4 = appearanceNameForLuminance(*(double *)(result + 48));
    double v5 = *(double *)(v3 + 48);
    uint64_t v6 = *(void *)(v3 + 40);
    uint64_t v7 = *(unsigned __int8 *)(v3 + 56);
    uint64_t v8 = *(unsigned __int8 *)(v3 + 57);
    return [v1 _commitImage:v2 appearanceName:v4 luminance:v6 forIdentifier:v7 isGeneratedImage:v8 withinProfile:0 completionHandler:v5];
  }
  return result;
}

- (void)_commitImage:(id)a3 appearanceName:(int64_t)a4 luminance:(double)a5 forIdentifier:(id)a6 isGeneratedImage:(BOOL)a7 withinProfile:(BOOL)a8 completionHandler:(id)a9
{
  BOOL v10 = a8;
  BOOL v11 = a7;
  id v16 = a3;
  id v17 = a6;
  id v18 = a9;
  if (v17 && [v16 CGImage])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __134__WBSStartPageBackgroundManager__commitImage_appearanceName_luminance_forIdentifier_isGeneratedImage_withinProfile_completionHandler___block_invoke;
    block[3] = &unk_1E5E446D0;
    void block[4] = self;
    id v26 = v17;
    double v27 = a5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  [(WBSStartPageBackgroundManager *)self _clearPrefetchedImage];
  [(WBSStartPageBackgroundManager *)self _setImage:v16 withAppearance:a4 forIdentifier:v17];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __134__WBSStartPageBackgroundManager__commitImage_appearanceName_luminance_forIdentifier_isGeneratedImage_withinProfile_completionHandler___block_invoke_2;
  v21[3] = &unk_1E5E44E08;
  id v19 = v17;
  id v22 = v19;
  BOOL v24 = v10;
  id v20 = v18;
  id v23 = v20;
  [(WBSStartPageBackgroundManager *)self _saveImage:v16 appearance:a4 luminance:v19 forIdentifier:v11 isGeneratedImage:v10 withinProfile:v21 completion:a5];
}

void __134__WBSStartPageBackgroundManager__commitImage_appearanceName_luminance_forIdentifier_isGeneratedImage_withinProfile_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "setObject:forKeyedSubscript:");
}

void __134__WBSStartPageBackgroundManager__commitImage_appearanceName_luminance_forIdentifier_isGeneratedImage_withinProfile_completionHandler___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __134__WBSStartPageBackgroundManager__commitImage_appearanceName_luminance_forIdentifier_isGeneratedImage_withinProfile_completionHandler___block_invoke_3;
  block[3] = &unk_1E5E44E08;
  id v3 = *(id *)(a1 + 32);
  char v5 = *(unsigned char *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __134__WBSStartPageBackgroundManager__commitImage_appearanceName_luminance_forIdentifier_isGeneratedImage_withinProfile_completionHandler___block_invoke_3(uint64_t a1)
{
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  [v5 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"BackgroundImageIdentifier"];
  if (*(unsigned char *)(a1 + 48)) {
    [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ProfileBackgroundImageIsDefined"];
  }
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v3 = (void *)[v5 copy];
  [v2 postNotificationName:@"StartPageBackgroundImageNeedsCloudKitUpdateNotification" object:0 userInfo:v3];

  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
}

- (void)_processImageForIdentifier:(id)a3 isGeneratedImage:(BOOL)a4 withinProfile:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  [(WBSStartPageBackgroundManager *)self _updateThumbnailIfNeeded];
  double v14 = 0.0;
  uint64_t v15 = 0;
  id v12 = [(WBSStartPageBackgroundManager *)self analyzeImageAndThresholdIfNecessary:[(WBSCGImage *)self->_prefetchedImage CGImage] thumbnail:[(WBSCGImage *)self->_prefetchedImageThumbnail CGImage] precomputedLuminance:&v15 getAppearance:&v14 luminance:self->_prefetchedImageLuminance];
  id v13 = [(WBSStartPageBackgroundManager *)self assignImage:v12 oldImage:self->_prefetchedImage];

  [(WBSStartPageBackgroundManager *)self _commitImage:v13 appearanceName:v15 luminance:v10 forIdentifier:v8 isGeneratedImage:v7 withinProfile:v11 completionHandler:v14];
}

- (void)cacheImageFromURL:(id)a3 completion:(id)a4
{
}

- (void)_clearPrefetchedImage
{
  prefetchedImage = self->_prefetchedImage;
  self->_prefetchedImage = 0;

  prefetchedImageThumbnail = self->_prefetchedImageThumbnail;
  self->_prefetchedImageThumbnail = 0;

  self->_prefetchedImageLuminance = 0.0;
}

- (void)clearPrefetchedImage
{
  lastPrefetchedFilePath = self->_lastPrefetchedFilePath;
  self->_lastPrefetchedFilePath = 0;

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__WBSStartPageBackgroundManager_clearPrefetchedImage__block_invoke;
  block[3] = &unk_1E5E408C0;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __53__WBSStartPageBackgroundManager_clearPrefetchedImage__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearPrefetchedImage];
}

- (void)clearImage
{
  [(WBSStartPageBackgroundManager *)self clearPrefetchedImage];
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__WBSStartPageBackgroundManager_clearImage__block_invoke;
  block[3] = &unk_1E5E408C0;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __43__WBSStartPageBackgroundManager_clearImage__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processImageForIdentifier:&stru_1F031A860 isGeneratedImage:0 withinProfile:0 completionHandler:0];
}

- (void)clearImageWithIdentifier:(id)a3 withinProfile:(BOOL)a4
{
  id v6 = a3;
  [(WBSStartPageBackgroundManager *)self _deleteImageWithIdentifier:v6];
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__WBSStartPageBackgroundManager_clearImageWithIdentifier_withinProfile___block_invoke;
  block[3] = &unk_1E5E44D18;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(internalQueue, block);
}

uint64_t __72__WBSStartPageBackgroundManager_clearImageWithIdentifier_withinProfile___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processImageForIdentifier:*(void *)(a1 + 40) isGeneratedImage:0 withinProfile:*(unsigned __int8 *)(a1 + 48) completionHandler:0];
}

- (id)fetchImage:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_prefetchedImage
    && ([v4 absoluteString],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [(NSURL *)self->_prefetchedImageURL absoluteString],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v6 isEqualToString:v7],
        v7,
        v6,
        v8))
  {
    id v9 = self->_prefetchedImage;
  }
  else
  {
    id v9 = [(WBSStartPageBackgroundManager *)self _fetchImage:v5 source:0 adjustForDarkAppearance:0];
  }
  id v10 = v9;

  return v10;
}

- (id)_fetchImage:(id)a3 source:(CGImageSource *)a4 adjustForDarkAppearance:(BOOL)a5
{
  BOOL v5 = a5;
  CFURLRef v8 = (const __CFURL *)a3;
  CFURLRef v9 = v8;
  if (self->_prefetchedImage)
  {
    id v10 = [(__CFURL *)v8 absoluteString];
    BOOL v11 = [(NSURL *)self->_prefetchedImageURL absoluteString];
    int v12 = [v10 isEqualToString:v11];

    if (v12)
    {
      id v13 = self->_prefetchedImage;
      goto LABEL_8;
    }
  }
  if (a4)
  {
    CFRetain(a4);
LABEL_7:
    size_t v14 = [(WBSStartPageBackgroundManager *)self _primaryIndexForImage:v9 source:a4 adjustForDarkAppearance:v5];
    CFDictionaryRef v15 = CGImageSourceCopyPropertiesAtIndex(a4, v14, 0);
    id v16 = objc_msgSend(MEMORY[0x1E4F982B8], "imageByAdoptingCGImage:", CGImageSourceCreateImageAtIndex(a4, v14, 0));
    CFRelease(a4);
    id v17 = [(WBSStartPageBackgroundManager *)self normalizeImage:v16 properties:v15];
    id v13 = [(WBSStartPageBackgroundManager *)self assignImage:v17 oldImage:self->_prefetchedImage];

    goto LABEL_8;
  }
  a4 = CGImageSourceCreateWithURL(v9, 0);
  if (a4) {
    goto LABEL_7;
  }
  id v13 = 0;
LABEL_8:

  return v13;
}

- (unint64_t)_primaryIndexForImage:(id)a3 source:(CGImageSource *)a4 adjustForDarkAppearance:(BOOL)a5
{
  return 0;
}

- (id)_thumbnailForImage:(id)a3 source:(CGImageSource *)a4 adjustForDarkAppearance:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  size_t v9 = [(WBSStartPageBackgroundManager *)self _primaryIndexForImage:v8 source:a4 adjustForDarkAppearance:v5];
  id v10 = objc_msgSend(MEMORY[0x1E4F982B8], "imageByAdoptingCGImage:", CGImageSourceCreateThumbnailAtIndex(a4, v9, 0));

  return v10;
}

- (void)_prefetchImage:(id)a3 luminance:(double)a4 completion:(id)a5 withNanoSecondDelay:(int64_t)a6
{
  id v10 = a3;
  BOOL v11 = (void (**)(id, WBSCGImage *))a5;
  if (self->_prefetchedImage
    && ([v10 absoluteString],
        int v12 = objc_claimAutoreleasedReturnValue(),
        [(NSURL *)self->_prefetchedImageURL absoluteString],
        id v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = [v12 isEqualToString:v13],
        v13,
        v12,
        v14))
  {
    v11[2](v11, self->_prefetchedImage);
  }
  else
  {
    CFDictionaryRef v15 = [v10 absoluteString];
    lastPrefetchedFilePath = self->_lastPrefetchedFilePath;
    self->_lastPrefetchedFilePath = v15;

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __89__WBSStartPageBackgroundManager__prefetchImage_luminance_completion_withNanoSecondDelay___block_invoke;
    v19[3] = &unk_1E5E44E30;
    id v20 = v10;
    id v21 = self;
    id v22 = v11;
    char v24 = 0;
    double v23 = a4;
    id v17 = (void *)MEMORY[0x1AD115160](v19);
    if (a6)
    {
      dispatch_time_t v18 = dispatch_time(0, a6);
      dispatch_after(v18, (dispatch_queue_t)self->_internalQueue, v17);
    }
    else
    {
      dispatch_async((dispatch_queue_t)self->_internalQueue, v17);
    }
  }
}

void __89__WBSStartPageBackgroundManager__prefetchImage_luminance_completion_withNanoSecondDelay___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) absoluteString];
  if ([v2 isEqualToString:*(void *)(*(void *)(a1 + 40) + 40)])
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (!*(void *)(v3 + 24))
    {

LABEL_10:
      CGImageSourceRef v6 = CGImageSourceCreateWithURL(*(CFURLRef *)(a1 + 32), 0);
      id v7 = objc_alloc_init(MEMORY[0x1E4F983D8]);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __89__WBSStartPageBackgroundManager__prefetchImage_luminance_completion_withNanoSecondDelay___block_invoke_2;
      v12[3] = &__block_descriptor_40_e5_v8__0l;
      v12[4] = v6;
      [v7 setHandler:v12];
      id v8 = [*(id *)(a1 + 40) _fetchImage:*(void *)(a1 + 32) source:v6 adjustForDarkAppearance:*(unsigned __int8 *)(a1 + 64)];
      if (v8)
      {
        objc_storeStrong((id *)(*(void *)(a1 + 40) + 24), v8);
        objc_storeStrong((id *)(*(void *)(a1 + 40) + 32), *(id *)(a1 + 32));
        atomic_store(0, (unint64_t *)(*(void *)(a1 + 40) + 48));
        uint64_t v9 = [*(id *)(a1 + 40) _thumbnailForImage:*(void *)(a1 + 32) source:v6 adjustForDarkAppearance:*(unsigned __int8 *)(a1 + 64)];
        uint64_t v10 = *(void *)(a1 + 40);
        BOOL v11 = *(void **)(v10 + 72);
        *(void *)(v10 + 72) = v9;

        *(void *)(*(void *)(a1 + 40) + 80) = *(void *)(a1 + 56);
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

      return;
    }
    char v4 = [*(id *)(v3 + 32) isEqual:*(void *)(a1 + 32)];

    if ((v4 & 1) == 0) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  BOOL v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);

  v5();
}

void __89__WBSStartPageBackgroundManager__prefetchImage_luminance_completion_withNanoSecondDelay___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

- (void)prefetchImage:(id)a3 completion:(id)a4
{
}

- (void)prefetchImage:(id)a3 luminance:(double)a4 completion:(id)a5
{
  uint64_t v8 = 1000000000;
  id v12 = a3;
  id v9 = a5;
  uint64_t v10 = atomic_load((unint64_t *)&self->_prefetchingCoalescingDelay);
  if (v10 < 1000000000) {
    uint64_t v8 = atomic_load((unint64_t *)&self->_prefetchingCoalescingDelay);
  }
  [(WBSStartPageBackgroundManager *)self _prefetchImage:v12 luminance:v9 completion:v8 withNanoSecondDelay:a4];
  uint64_t v11 = 100000000;
  if (v8 > 100000000) {
    uint64_t v11 = v8;
  }
  atomic_store(2 * v11, (unint64_t *)&self->_prefetchingCoalescingDelay);
}

- (WBSCGImage)image
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  if ([v3 BOOLForKey:*MEMORY[0x1E4F98860]]) {
    image = self->_image;
  }
  else {
    image = 0;
  }
  BOOL v5 = image;

  return v5;
}

- (BOOL)_tabGroupShouldInheritProfileBackgroundImage:(id)a3 forProfileWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7
    && ([v6 isEqualToString:v7] & 1) == 0
    && [v6 length]
    && ([v7 isEqualToString:*MEMORY[0x1E4F984B8]] & 1) == 0)
  {
    BOOL v8 = ![(WBSStartPageBackgroundManager *)self hasTabGroupSpecificBackgroundImage:v6];
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (void)_setHasTabGroupSpecificBackgroundImage:(BOOL)a3 forIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  BOOL v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v6 = v5;
  uint64_t v7 = *MEMORY[0x1E4F988D8];
  if (v4) {
    objc_msgSend(v5, "safari_addStringValue:toArrayWithKey:", v8, v7);
  }
  else {
    objc_msgSend(v5, "safari_removeStringValue:fromArrayWithKey:", v8, v7);
  }
}

- (void)_setHasProfileSpecificBackgroundImage:(BOOL)a3 forIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  BOOL v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v6 = v5;
  uint64_t v7 = *MEMORY[0x1E4F98790];
  if (v4) {
    objc_msgSend(v5, "safari_addStringValue:toArrayWithKey:", v8, v7);
  }
  else {
    objc_msgSend(v5, "safari_removeStringValue:fromArrayWithKey:", v8, v7);
  }
}

- (BOOL)_isGeneratedBackgroundImageInImageSource:(CGImageSource *)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v3 = CGImageSourceCopyMetadataAtIndex(a3, 0, 0);
  if (!v3) {
    return 0;
  }
  BOOL v4 = v3;
  BOOL v5 = CGImageMetadataCopyTagWithPath(v3, 0, @"safari:startPageBackgroundTile");
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = (void *)CGImageMetadataTagCopyValue(v5);
    char v8 = [v7 BOOLValue];
    CFRelease(v6);
  }
  else
  {
    char v8 = 0;
  }
  CFRelease(v4);
  return v8;
}

- (BOOL)hasGlobalBackgroundImage
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = objc_msgSend(v2, "safari_startPageBackgroundImageFileURLForDefaultProfile");
  BOOL v4 = [v3 path];
  char v5 = [v2 fileExistsAtPath:v4];

  return v5;
}

- (int64_t)appearanceForImage:(id)a3
{
  return [(WBSStartPageBackgroundManager *)self appearanceIfImageExists:a3 != 0];
}

- (int64_t)appearanceIfImageExists:(BOOL)a3
{
  if (a3) {
    return self->_appearance;
  }
  else {
    return 0;
  }
}

- (int64_t)appearanceForImageWithIdentifier:(id)a3 forProfile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = v7;
  if (v7 && [v7 kind] == 1)
  {
    id v9 = [v8 settingForKey:*MEMORY[0x1E4F98860]];
    char v10 = [v9 BOOLValue];
  }
  else
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    char v10 = [v9 BOOLForKey:*MEMORY[0x1E4F98860]];
  }
  char v11 = v10;

  if ((v11 & 1) == 0)
  {
    id v12 = 0;
    goto LABEL_18;
  }
  if (![v6 length]) {
    goto LABEL_15;
  }
  if (![(WBSStartPageBackgroundManager *)self hasTabGroupSpecificBackgroundImage:v6]|| ([(NSMutableDictionary *)self->_backgroundImageIdentifierToImage objectForKeyedSubscript:v6], id v12 = objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    if (![(WBSStartPageBackgroundManager *)self hasProfileSpecificBackgroundImage:v6]|| ([(NSMutableDictionary *)self->_backgroundImageIdentifierToImage objectForKeyedSubscript:v6], id v12 = objc_claimAutoreleasedReturnValue(), v12, v12))
    {
      id v13 = [(NSMutableDictionary *)self->_backgroundImageIdentifierToImage objectForKeyedSubscript:v6];

      if (v13)
      {
        int v14 = [(NSMutableDictionary *)self->_backgroundImageIdentifierToLuminance objectForKeyedSubscript:v6];
        CFDictionaryRef v15 = v14;
        if (v14)
        {
          [v14 doubleValue];
          id v12 = (void *)appearanceNameForLuminance(v16);
        }
        else
        {
          id v12 = 0;
        }

        goto LABEL_18;
      }
LABEL_15:
      id v12 = [(WBSStartPageBackgroundManager *)self appearanceIfImageExists:self->_image != 0];
    }
  }
LABEL_18:

  return (int64_t)v12;
}

- (id)prefetchedImageThumbnailForProfile:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  if (self->_lastPrefetchedFilePath
    && (!v4 || [v4 kind] != 1
      ? (objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults"),
         id v6 = objc_claimAutoreleasedReturnValue(),
         char v7 = [v6 BOOLForKey:*MEMORY[0x1E4F98860]])
      : ([v5 settingForKey:*MEMORY[0x1E4F98860]],
         id v6 = objc_claimAutoreleasedReturnValue(),
         char v7 = [v6 BOOLValue]),
        char v8 = v7,
        v6,
        (v8 & 1) != 0))
  {
    id v9 = self->_prefetchedImage;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)prefetchedImageNameForProfile:(id)a3
{
  id v4 = a3;
  char v5 = [(WBSStartPageBackgroundManager *)self prefetchedImageThumbnailForProfile:v4];

  if (v5)
  {
    id v6 = [(NSString *)self->_lastPrefetchedFilePath stringByDeletingPathExtension];
    char v7 = [v6 lastPathComponent];
  }
  else
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    char v8 = [v6 objectForKey:*MEMORY[0x1E4F98668]];
    id v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      _WBSLocalizedString();
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    char v7 = v10;
  }

  return v7;
}

- (void)_deleteImageWithIdentifier:(id)a3
{
  id v9 = a3;
  if ([v9 length])
  {
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v5 = objc_msgSend(v4, "safari_startPageBackgroundImageFileURLForIdentifier:", v9);
    [v4 removeItemAtURL:v5 error:0];
    [(NSMutableDictionary *)self->_backgroundImageIdentifierToImage setObject:0 forKeyedSubscript:v9];
    [(NSMutableDictionary *)self->_backgroundImageIdentifierToLuminance setObject:0 forKeyedSubscript:v9];
    [(NSMutableDictionary *)self->_imageURLToTileRequired setObject:0 forKeyedSubscript:v5];
    id v6 = [MEMORY[0x1E4F1CA60] dictionary];
    [v6 setObject:v9 forKeyedSubscript:@"BackgroundImageIdentifier"];
    if ([(WBSStartPageBackgroundManager *)self hasProfileSpecificBackgroundImage:v9])
    {
      [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ProfileBackgroundImageIsDefined"];
    }
    char v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    char v8 = (void *)[v6 copy];
    [v7 postNotificationName:@"StartPageBackgroundImageNeedsCloudKitUpdateNotification" object:0 userInfo:v8];
  }
}

- (void)tabGroupManager:(id)a3 didRemoveTabGroupWithUUID:(id)a4
{
  char v5 = [a3 removedTabGroupWithUUID:a4];
  id v6 = v5;
  if (v5)
  {
    id v10 = v5;
    char v7 = [v5 isLocal];
    id v6 = v10;
    if ((v7 & 1) == 0)
    {
      char v8 = [v10 isPrivateBrowsing];
      id v6 = v10;
      if ((v8 & 1) == 0)
      {
        id v9 = [v10 uuid];
        if ([(WBSStartPageBackgroundManager *)self hasTabGroupSpecificBackgroundImage:v9])
        {
          [(WBSStartPageBackgroundManager *)self _deleteImageWithIdentifier:v9];
          [(WBSStartPageBackgroundManager *)self _setHasTabGroupSpecificBackgroundImage:0 forIdentifier:v9];
        }

        id v6 = v10;
      }
    }
  }
}

- (void)tabGroupManager:(id)a3 didRemoveProfileWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [v6 profileWithIdentifier:v7];
  if (v8)
  {
    if ([(WBSStartPageBackgroundManager *)self hasProfileSpecificBackgroundImage:v7])
    {
      [(WBSStartPageBackgroundManager *)self _deleteImageWithIdentifier:v7];
      [(WBSStartPageBackgroundManager *)self _setHasProfileSpecificBackgroundImage:0 forIdentifier:v7];
      id v9 = [v6 namedProfiles];
      uint64_t v10 = [v9 count];

      if (!v10)
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __80__WBSStartPageBackgroundManager_tabGroupManager_didRemoveProfileWithIdentifier___block_invoke;
        v11[3] = &unk_1E5E408E8;
        v11[4] = self;
        [(WBSStartPageBackgroundManager *)self getHasGeneratedBackgroundImage:&stru_1F031A860 forProfileWithIdentifier:v7 completionHandler:v11];
      }
    }
  }
}

uint64_t __80__WBSStartPageBackgroundManager_tabGroupManager_didRemoveProfileWithIdentifier___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) clearImageWithIdentifier:&stru_1F031A860 withinProfile:0];
  }
  return result;
}

+ (id)ciColorKernel
{
  if (+[WBSStartPageBackgroundManager ciColorKernel]::once != -1) {
    dispatch_once(&+[WBSStartPageBackgroundManager ciColorKernel]::once, &__block_literal_global_118);
  }
  id v2 = (void *)+[WBSStartPageBackgroundManager ciColorKernel]::kernel;

  return v2;
}

void __46__WBSStartPageBackgroundManager_ciColorKernel__block_invoke()
{
  v9[4] = *(id *)MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v1 = [v0 URLForResource:@"default" withExtension:@"metallib"];

  v9[0] = 0;
  id v2 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v1 options:0 error:v9];
  id v3 = v9[0];
  if (v2)
  {
    id v8 = v3;
    uint64_t v4 = [MEMORY[0x1E4F1E010] kernelWithFunctionName:@"safari_threshold" fromMetalLibraryData:v2 error:&v8];
    id v5 = v8;

    id v6 = (void *)+[WBSStartPageBackgroundManager ciColorKernel]::kernel;
    +[WBSStartPageBackgroundManager ciColorKernel]::kernel = v4;

    if (!v5)
    {
      id v3 = 0;
      goto LABEL_10;
    }
    id v7 = (id)WBS_LOG_CHANNEL_PREFIXStartPage();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __46__WBSStartPageBackgroundManager_ciColorKernel__block_invoke_cold_2();
    }
    id v3 = v5;
  }
  else
  {
    id v7 = (id)WBS_LOG_CHANNEL_PREFIXStartPage();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __46__WBSStartPageBackgroundManager_ciColorKernel__block_invoke_cold_1();
    }
  }

LABEL_10:
}

- (id)ciContext
{
  if (-[WBSStartPageBackgroundManager ciContext]::once != -1) {
    dispatch_once(&-[WBSStartPageBackgroundManager ciContext]::once, &__block_literal_global_132);
  }
  id v2 = (void *)-[WBSStartPageBackgroundManager ciContext]::ciContext;

  return v2;
}

void __42__WBSStartPageBackgroundManager_ciContext__block_invoke()
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1E018];
  uint64_t v1 = *MEMORY[0x1E4F1E1F0];
  v8[0] = MEMORY[0x1E4F1CC28];
  uint64_t v2 = *MEMORY[0x1E4F1E248];
  v7[0] = v1;
  v7[1] = v2;
  id v3 = [NSNumber numberWithInt:*MEMORY[0x1E4F1E2F0]];
  v8[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  uint64_t v5 = [v0 contextWithOptions:v4];
  id v6 = (void *)-[WBSStartPageBackgroundManager ciContext]::ciContext;
  -[WBSStartPageBackgroundManager ciContext]::ciContext = v5;
}

- (id)thresholdImage:(CGImage *)a3 minValue:(double)a4 maxValue:(double)a5 multiplier:(double)a6
{
  v25[4] = *MEMORY[0x1E4F143B8];
  char v11 = +[WBSStartPageBackgroundManager ciColorKernel];
  size_t Width = CGImageGetWidth(a3);
  size_t Height = CGImageGetHeight(a3);
  int v14 = [MEMORY[0x1E4F1E050] imageWithCGImage:a3];
  v25[0] = v14;
  CFDictionaryRef v15 = [NSNumber numberWithDouble:a4];
  v25[1] = v15;
  double v16 = [NSNumber numberWithDouble:a5];
  v25[2] = v16;
  id v17 = [NSNumber numberWithDouble:a6];
  v25[3] = v17;
  dispatch_time_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
  id v19 = objc_msgSend(v11, "applyWithExtent:arguments:", v18, 0.0, 0.0, (double)Width, (double)Height);

  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  id v21 = (void *)MEMORY[0x1E4F982B8];
  id v22 = [(WBSStartPageBackgroundManager *)self ciContext];
  [v19 extent];
  double v23 = objc_msgSend(v21, "imageByAdoptingCGImage:", objc_msgSend(v22, "createCGImage:fromRect:format:colorSpace:deferred:", v19, *MEMORY[0x1E4F1E2F0], DeviceRGB, 0));

  CGColorSpaceRelease(DeviceRGB);

  return v23;
}

- (id)assignImage:(id)a3 oldImage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (CGImageGetWidth((CGImageRef)[v5 CGImage])
    && CGImageGetHeight((CGImageRef)[v5 CGImage]))
  {

    id v7 = 0;
  }
  else
  {
    id v7 = v5;
    id v5 = v6;
  }

  return v5;
}

- (id)normalizeImage:(id)a3 properties:(id)a4
{
  id v6 = a3;
  id v7 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F2FCA0]];
  id v8 = v7;
  if (v7 && (uint64_t v9 = [v7 intValue], v8, v9 != 1))
  {
    char v11 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCGImage:", objc_msgSend(v6, "CGImage"));
    id v12 = [v11 imageByApplyingOrientation:v9];

    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    int v14 = (void *)MEMORY[0x1E4F982B8];
    CFDictionaryRef v15 = [(WBSStartPageBackgroundManager *)self ciContext];
    [v12 extent];
    uint64_t v10 = objc_msgSend(v14, "imageByAdoptingCGImage:", objc_msgSend(v15, "createCGImage:fromRect:format:colorSpace:deferred:", v12, *MEMORY[0x1E4F1E2F0], DeviceRGB, 0));

    CGColorSpaceRelease(DeviceRGB);
  }
  else
  {
    uint64_t v10 = v6;
  }

  return v10;
}

- (id)analyzeImageAndThresholdIfNecessary:(CGImage *)a3 thumbnail:(CGImage *)a4 precomputedLuminance:(double)a5 getAppearance:(int64_t *)a6 luminance:(double *)a7
{
  if (a3)
  {
    double v9 = a5;
    if (a5 == 0.0)
    {
      if (a4) {
        id v12 = a4;
      }
      else {
        id v12 = a3;
      }
      double v9 = WBSComputeAverageLuminance(v12);
    }
    int64_t v13 = appearanceNameForLuminance(v9);
    *a6 = v13;
    if (a7) {
      *a7 = v9;
    }
    if (v13 == 1)
    {
      double v14 = 0.05;
      double v15 = 1.0;
      double v16 = 1.0;
      id v17 = self;
      dispatch_time_t v18 = a3;
    }
    else
    {
      id v20 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
      [v20 floatForKey:*MEMORY[0x1E4F98868]];
      if (v21 == 0.0) {
        double v22 = 0.9;
      }
      else {
        double v22 = v21;
      }

      double v15 = 0.7;
      double v14 = 0.0;
      id v17 = self;
      dispatch_time_t v18 = a3;
      double v16 = v22;
    }
    id v19 = [(WBSStartPageBackgroundManager *)v17 thresholdImage:v18 minValue:v14 maxValue:v15 multiplier:v16];
  }
  else
  {
    id v19 = 0;
    *a6 = 1;
  }

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageURLToTileRequired, 0);
  objc_storeStrong((id *)&self->_backgroundImageIdentifierToLuminance, 0);
  objc_storeStrong((id *)&self->_backgroundImageIdentifierToImage, 0);
  objc_storeStrong((id *)&self->_prefetchedImageThumbnail, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_lastPrefetchedFilePath, 0);
  objc_storeStrong((id *)&self->_prefetchedImageURL, 0);
  objc_storeStrong((id *)&self->_prefetchedImage, 0);
  objc_storeStrong((id *)&self->_imageReadWriteQueue, 0);

  objc_storeStrong((id *)&self->_internalQueue, 0);
}

- (void)generateProfileSpecificBackgroundImageWithSymbol:(os_log_t)log forProfile:withColor:completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1ABB70000, log, OS_LOG_TYPE_ERROR, "Failed to generate profile specific background image", v1, 2u);
}

- (void)generateProfileSpecificBackgroundImageWithSymbol:(uint64_t)a1 forProfile:(NSObject *)a2 withColor:completionHandler:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 141558275;
  uint64_t v3 = 1752392040;
  __int16 v4 = 2117;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1ABB70000, a2, OS_LOG_TYPE_ERROR, "Failed to save generated profile specific background image to %{sensitive, mask.hash}@", (uint8_t *)&v2, 0x16u);
}

- (void)generateProfileSpecificBackgroundImageWithSymbol:forProfile:withColor:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1ABB70000, v3, v4, "Failed to create directory for profile specific generated background image: %{public}@", v5);
}

void __121__WBSStartPageBackgroundManager__saveImage_appearance_luminance_forIdentifier_isGeneratedImage_withinProfile_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1ABB70000, v3, v4, "Failed to clear wallpaper %{public}@", v5);
}

void __121__WBSStartPageBackgroundManager__saveImage_appearance_luminance_forIdentifier_isGeneratedImage_withinProfile_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1ABB70000, a2, OS_LOG_TYPE_ERROR, "Unable to save image to path %@", (uint8_t *)&v2, 0xCu);
}

void __121__WBSStartPageBackgroundManager__saveImage_appearance_luminance_forIdentifier_isGeneratedImage_withinProfile_completion___block_invoke_cold_3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1ABB70000, log, OS_LOG_TYPE_ERROR, "Failed to register Safari metadata namespace for profile specific generated background image", v1, 2u);
}

void __46__WBSStartPageBackgroundManager_ciColorKernel__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1ABB70000, v3, v4, "Error loading metallib %{public}@", v5);
}

void __46__WBSStartPageBackgroundManager_ciColorKernel__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1ABB70000, v3, v4, "Error loading CI kernel %{public}@", v5);
}

@end