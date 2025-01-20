@interface PBUIWallpaperConfigurationManager
+ (void)initialize;
- (BOOL)cachedVariantsShareWallpaperConfiguration;
- (BOOL)enableWallpaperDimming;
- (BOOL)hasWallpaperImageForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4;
- (BOOL)isCachedVariantsShareWallpaperConfigurationValid;
- (BOOL)isInChangeBatch;
- (BOOL)isProceduralWallpaperInfoValid:(id)a3;
- (BOOL)isVideoSupportedByDefaultForVariant:(int64_t)a3;
- (BOOL)isVideoSupportedForVariant:(int64_t)a3;
- (BOOL)safeMigrateWallpaperImageIfNecessaryForVariant:(int64_t)a3 representingVariants:(int64_t)a4 wallpaperMode:(int64_t)a5;
- (BOOL)setProceduralWallpaperIdentifier:(id)a3 options:(id)a4 forVariants:(int64_t)a5;
- (BOOL)setVideoURL:(id)a3 forVariant:(int64_t)a4 shoudCrop:(BOOL)a5 relativeCropRect:(CGRect)a6 wallpaperMode:(int64_t)a7;
- (BOOL)setWallpaperColor:(id)a3 forVariants:(int64_t)a4;
- (BOOL)setWallpaperColorName:(id)a3 forVariants:(int64_t)a4;
- (BOOL)setWallpaperConfigurationFromDefaultWallpaperConfiguration:(id)a3 forVariants:(int64_t)a4 wallpaperMode:(int64_t)a5 name:(id)a6;
- (BOOL)setWallpaperGradient:(id)a3 forVariants:(int64_t)a4;
- (BOOL)setWallpaperImage:(id)a3 adjustedImage:(id)a4 thumbnailData:(id)a5 imageHashData:(id)a6 wallpaperOptions:(id)a7 forVariants:(int64_t)a8 wallpaperMode:(int64_t)a9;
- (BOOL)setWallpaperImage:(id)a3 originalImage:(id)a4 forVariants:(int64_t)a5 options:(unint64_t)a6;
- (BOOL)setWallpaperImage:(id)a3 originalImage:(id)a4 thumbnailData:(id)a5 imageHashData:(id)a6 wallpaperOptions:(id)a7 forVariants:(int64_t)a8 options:(unint64_t)a9 wallpaperMode:(int64_t)a10 isMigrating:(BOOL)a11;
- (BOOL)setWallpaperImage:(id)a3 wallpaperOptions:(id)a4 forVariants:(int64_t)a5;
- (BOOL)setWallpaperImageHashData:(id)a3 forVariants:(int64_t)a4 wallpaperMode:(int64_t)a5;
- (BOOL)setWallpaperOptions:(id)a3 forVariants:(int64_t)a4;
- (BOOL)setWallpaperOptions:(id)a3 forVariants:(int64_t)a4 wallpaperMode:(int64_t)a5;
- (BOOL)setWallpaperThumbnailData:(id)a3 forVariant:(int64_t)a4;
- (BOOL)setWallpaperThumbnailData:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5;
- (BOOL)setWallpaperThumbnailFromFullsizeImage:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5;
- (BOOL)shouldSetWallpaperImageHashData;
- (BOOL)variantsShareWallpaperConfiguration;
- (BOOL)variantsShareWallpaperConfigurationForTypes:(unint64_t)a3;
- (CGAffineTransform)_naturalPreferredTransform:(SEL)a3 forNaturalSize:(CGAffineTransform *)a4;
- (CGRect)cropRectForOldCropRect:(CGRect)a3 portrait:(BOOL)a4 zoomScale:(double)a5 oldParallaxFactor:(double)a6 forImageSize:(CGSize)a7 newZoomScale:(double *)a8;
- (CGRect)cropRectForViewPort:(CGRect)a3 portrait:(BOOL)a4 zoomScale:(double)a5 parallaxFactor:(double)a6 forImageSize:(CGSize)a7 contentScaleFactor:(double)a8;
- (CGSize)wallpaperSize;
- (CGSize)wallpaperSizeIncludingParallaxOverhang;
- (Class)proceduralWallpaperClassForIdentifier:(id)a3;
- (NSArray)dataStores;
- (NSString)description;
- (PBUIMagnifyMode)magnifyMode;
- (PBUIProceduralWallpaperProvider)proceduralWallpaperProvider;
- (PBUIWallpaperConfiguration)homeScreenWallpaperConfiguration;
- (PBUIWallpaperConfiguration)lockScreenWallpaperConfiguration;
- (PBUIWallpaperConfigurationManager)init;
- (PBUIWallpaperConfigurationManager)initWithWallpaperDataStores:(id)a3;
- (PBUIWallpaperConfigurationManager)initWithWallpaperDataStores:(id)a3 wallpaperSize:(CGSize)a4 scale:(double)a5 sizeType:(int64_t)a6;
- (PBUIWallpaperConfigurationManagerDelegate)delegate;
- (char)_providerForVariant:(int64_t)a3 lockConfig:(id)a4 homeConfig:(id)a5;
- (double)parallaxFactorForCropRect:(CGRect)a3 portrait:(BOOL)a4 forImageSize:(CGSize)a5 zoomScale:(double)a6;
- (double)thumbnailWidth;
- (double)wallpaperScale;
- (id)cleanedProceduralWallpaperInfo:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)fallbackWallpaperConfigurationForVarient:(int64_t)a3;
- (id)getWallpaperLegibilitySettingsForVariant:(int64_t)a3;
- (id)homeScreenWallpaperConfigurationIncludingValuesForTypes:(unint64_t)a3;
- (id)lockScreenWallpaperConfigurationIncludingValuesForTypes:(unint64_t)a3;
- (id)migratedWallpaperOptionsForWallpaperOptions:(id)a3 originalImageSize:(CGSize)a4;
- (id)normalizeImage:(id)a3;
- (id)posterMigrationInfo;
- (id)proceduralWallpaperInfoForVariant:(int64_t)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)thumbnailDataForImage:(id)a3;
- (id)videoURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4;
- (id)wallpaperColorForVariant:(int64_t)a3 fromDataStore:(id)a4 colorName:(id *)a5;
- (id)wallpaperConfigurationForVariant:(int64_t)a3;
- (id)wallpaperConfigurationForVariant:(int64_t)a3 includingValuesForTypes:(unint64_t)a4;
- (id)wallpaperConfigurationForVariant:(int64_t)a3 includingValuesForTypes:(unint64_t)a4 wallpaperMode:(int64_t)a5;
- (id)wallpaperImageForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4;
- (id)wallpaperImageHashDataForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4;
- (id)wallpaperOptionsForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4;
- (id)wallpaperOriginalImageForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4;
- (id)wallpaperThumbnailImageDataForFulfillingLookupForConfiguration:(id)a3;
- (id)wallpaperThumbnailImageDataForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4;
- (id)wallpaperThumbnailImageDataForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4 inDataStore:(id)a5;
- (id)wallpaperThumbnailImageForFulfillingLookupForConfiguration:(id)a3;
- (id)wallpaperThumbnailImageForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4;
- (int64_t)effectiveSharedVariantForVariants:(int64_t)a3;
- (int64_t)parallaxDeviceType;
- (int64_t)wallpaperMode;
- (int64_t)wallpaperSizeType;
- (int64_t)wallpaperTypeForSharedWallpaperConfigurationForTypes:(unint64_t)a3;
- (unint64_t)numberOfCachedStaticImages;
- (void)beginChangeBatch;
- (void)clearCacheForVariants:(int64_t)a3;
- (void)clearCacheForVariants:(int64_t)a3 memoryOnly:(BOOL)a4;
- (void)clearDelayedChangeNotifications;
- (void)dealloc;
- (void)delayNotifyingChangeForVariants:(int64_t)a3;
- (void)endChangeBatch;
- (void)getBestCropRect:(CGRect *)a3 zoomScale:(double *)a4 forImageSize:(CGSize)a5 portrait:(BOOL)a6 parallaxFactor:(double)a7;
- (void)migrateWallpaperOptionsForImageIfNecessaryForVariant:(int64_t)a3 representingVariants:(int64_t)a4;
- (void)notifyDelegateOfChangesToVariants:(int64_t)a3;
- (void)performMigrationWithFailureHandler:(id)a3;
- (void)posterMigrationInfo;
- (void)regenerateStaticWallpaperThumbnailImages;
- (void)regenerateThumbnailIfNecessaryForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4;
- (void)regenerateThumbnailsIfNecessary;
- (void)removeAllDataExceptForType:(int64_t)a3 variants:(int64_t)a4 variantsShareWallpaperConfiguration:(BOOL)a5;
- (void)removeAllDataExceptForTypes:(unint64_t)a3 variants:(int64_t)a4 variantsShareWallpaperConfiguration:(BOOL)a5;
- (void)removeDataForTypes:(unint64_t)a3 variants:(int64_t)a4 variantsShareWallpaperConfiguration:(BOOL)a5;
- (void)removeProceduralWallpaperForVariants:(int64_t)a3;
- (void)removeVideoForVariants:(int64_t)a3;
- (void)removeWallpaperColorForVariants:(int64_t)a3;
- (void)removeWallpaperGradientForVariants:(int64_t)a3;
- (void)removeWallpaperImageDataTypes:(unint64_t)a3 forVariants:(int64_t)a4;
- (void)removeWallpaperImageHashDataForVariants:(int64_t)a3;
- (void)removeWallpaperImagesForVariants:(int64_t)a3;
- (void)removeWallpaperImagesForVariants:(int64_t)a3 variantsShareWallpaperConfiguration:(BOOL)a4;
- (void)removeWallpaperOptionsForVariants:(int64_t)a3;
- (void)restoreDefaultWallpaperForAllVariantsAndNotify:(BOOL)a3;
- (void)safeMigrateWallpaperImageIfNecessary;
- (void)saveCroppedVideo:(id)a3 toURL:(id)a4 cropRect:(CGRect)a5 completionHandler:(id)a6;
- (void)setCachedVariantsShareWallpaperConfiguration:(BOOL)a3;
- (void)setCachedVariantsShareWallpaperConfigurationValid:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEnableWallpaperDimming:(BOOL)a3;
- (void)setMagnifyMode:(id)a3;
- (void)setProceduralWallpaperProvider:(id)a3;
- (void)setWallpaperMode:(int64_t)a3;
- (void)wallpaperDidChangeForVariants:(int64_t)a3 shouldNotify:(BOOL)a4;
- (void)wallpaperWillChangeForVariants:(int64_t)a3;
@end

@implementation PBUIWallpaperConfigurationManager

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1 && PBUIRegisterForWallpaperExternalChangeNotification___once != -1)
  {
    dispatch_once(&PBUIRegisterForWallpaperExternalChangeNotification___once, &__block_literal_global_3);
  }
}

- (PBUIWallpaperConfigurationManager)initWithWallpaperDataStores:(id)a3 wallpaperSize:(CGSize)a4 scale:(double)a5 sizeType:(int64_t)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PBUIWallpaperConfigurationManager;
  v12 = [(PBUIWallpaperConfigurationManager *)&v24 init];
  if (v12)
  {
    v13 = PBUILogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v33.CGFloat width = width;
      v33.CGFloat height = height;
      uint64_t v19 = NSStringFromCGSize(v33);
      v20 = (void *)v19;
      if ((unint64_t)a6 > 4) {
        v21 = &stru_1F1606C18;
      }
      else {
        v21 = (__CFString *)*((void *)&off_1E62B2E10 + a6);
      }
      *(_DWORD *)location = 138413058;
      *(void *)&location[4] = v11;
      __int16 v26 = 2112;
      uint64_t v27 = v19;
      __int16 v28 = 2048;
      double v29 = a5;
      __int16 v30 = 2112;
      v31 = v21;
      _os_log_debug_impl(&dword_1BC4B3000, v13, OS_LOG_TYPE_DEBUG, "Initialize PBUIWallpaperConfigurationManager with data stores: %@, wallpaper size: %@, scale: %f, size type: %@", location, 0x2Au);
    }
    uint64_t v14 = [v11 copy];
    dataStores = v12->_dataStores;
    v12->_dataStores = (NSArray *)v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    wallpaperImageCache = v12->_wallpaperImageCache;
    v12->_wallpaperImageCache = v16;

    v12->_wallpaperSize.CGFloat width = width;
    v12->_wallpaperSize.CGFloat height = height;
    v12->_wallpaperScale = a5;
    v12->_wallpaperMode = 0;
    v12->_wallpaperSizeType = a6;
    v12->_enableWallpaperDimming = 0;
    objc_initWeak((id *)location, v12);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __94__PBUIWallpaperConfigurationManager_initWithWallpaperDataStores_wallpaperSize_scale_sizeType___block_invoke;
    v22[3] = &unk_1E62B2CD8;
    objc_copyWeak(&v23, (id *)location);
    v12->_externalNotificationToken = PBUIRegisterForExternalWallpaperChangeNotificationWithHandler(v22);
    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)location);
  }

  return v12;
}

void __94__PBUIWallpaperConfigurationManager_initWithWallpaperDataStores_wallpaperSize_scale_sizeType___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((a3 & 1) == 0)
  {
    id v5 = WeakRetained;
    [WeakRetained clearCacheForVariants:3 memoryOnly:1];
    id WeakRetained = v5;
  }
}

- (PBUIWallpaperConfigurationManager)initWithWallpaperDataStores:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F42D90];
  id v5 = a3;
  v6 = [v4 mainScreen];
  uint64_t v7 = PBUICurrentDeviceWallpaperSizeType();
  [v6 _referenceBounds];
  double v9 = v8;
  double v11 = v10;
  [v6 scale];
  v13 = -[PBUIWallpaperConfigurationManager initWithWallpaperDataStores:wallpaperSize:scale:sizeType:](self, "initWithWallpaperDataStores:wallpaperSize:scale:sizeType:", v5, v7, v9, v11, v12);

  return v13;
}

- (PBUIWallpaperConfigurationManager)init
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F74230] sharedConnection];
  if ([v3 userMode] == 1)
  {
  }
  else
  {
    int v4 = [v3 isEphemeralMultiUser];

    if (!v4)
    {
      id v5 = objc_alloc_init(PBUIWallpaperDirectoryDataStore);
      uint64_t v7 = objc_alloc_init(PBUIWallpaperUserDefaultsDataStore);
      v10[0] = v5;
      v10[1] = v7;
      v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];

      goto LABEL_6;
    }
  }
  id v5 = objc_alloc_init(PBUIWallpaperSharedDirectoryDataStore);
  v11[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
LABEL_6:

  double v8 = [(PBUIWallpaperConfigurationManager *)self initWithWallpaperDataStores:v6];
  return v8;
}

- (void)dealloc
{
  notify_cancel(self->_externalNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)PBUIWallpaperConfigurationManager;
  [(PBUIWallpaperConfigurationManager *)&v3 dealloc];
}

- (int64_t)parallaxDeviceType
{
  return (unint64_t)([(PBUIWallpaperConfigurationManager *)self wallpaperSizeType] - 3) < 2;
}

- (CGSize)wallpaperSizeIncludingParallaxOverhang
{
  [(PBUIWallpaperConfigurationManager *)self wallpaperSize];
  double v3 = v2;
  double v5 = v4;
  BOOL v6 = PBUICurrentParallaxDeviceType();
  +[PBUIWallpaperParallaxSettings minimumWallpaperSizeForWallpaperSize:deviceType:](PBUIWallpaperParallaxSettings, "minimumWallpaperSizeForWallpaperSize:deviceType:", v6, v3, v5);
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (void)beginChangeBatch
{
}

- (void)endChangeBatch
{
  unint64_t v2 = self->_batchChangeCount - 1;
  self->_batchChangeCount = v2;
  if (!v2)
  {
    if (self->_batchNotifyVariants)
    {
      -[PBUIWallpaperConfigurationManager notifyDelegateOfChangesToVariants:](self, "notifyDelegateOfChangesToVariants:");
      self->_batchNotifyVariants = 0;
    }
  }
}

- (BOOL)isInChangeBatch
{
  return self->_batchChangeCount != 0;
}

- (void)delayNotifyingChangeForVariants:(int64_t)a3
{
  if (![(PBUIWallpaperConfigurationManager *)self isInChangeBatch])
  {
    BOOL v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PBUIWallpaperConfigurationManager.m" lineNumber:242 description:@"Should only call this when in a change batch"];
  }
  self->_batchNotifyVariants |= a3;
}

- (void)clearDelayedChangeNotifications
{
  self->_batchNotifyVariants = 0;
}

- (BOOL)isVideoSupportedForVariant:(int64_t)a3
{
  double v5 = [(PBUIWallpaperConfigurationManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v6 = [v5 wallpaperConfigurationManager:self isVideoSupportedForVariant:a3];
  }
  else {
    char v6 = [(PBUIWallpaperConfigurationManager *)self isVideoSupportedByDefaultForVariant:a3];
  }
  BOOL v7 = v6;

  return v7;
}

- (BOOL)isVideoSupportedByDefaultForVariant:(int64_t)a3
{
  return a3 == 0;
}

- (id)wallpaperConfigurationForVariant:(int64_t)a3 includingValuesForTypes:(unint64_t)a4
{
  return [(PBUIWallpaperConfigurationManager *)self wallpaperConfigurationForVariant:a3 includingValuesForTypes:a4 wallpaperMode:0];
}

- (id)wallpaperConfigurationForVariant:(int64_t)a3 includingValuesForTypes:(unint64_t)a4 wallpaperMode:(int64_t)a5
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  double v8 = PBUILogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[PBUIWallpaperConfigurationManager wallpaperConfigurationForVariant:includingValuesForTypes:wallpaperMode:](a3, a4, (uint64_t)v8);
  }

  BOOL v73 = [(PBUIWallpaperConfigurationManager *)self isVideoSupportedForVariant:a3];
  if (a3 == 1) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = -1;
  }
  BOOL v10 = a3 == 1
     && [(PBUIWallpaperConfigurationManager *)self isVideoSupportedForVariant:1];
  unint64_t v76 = a5;
  v77 = self;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id obj = [(PBUIWallpaperConfigurationManager *)self dataStores];
  uint64_t v11 = [obj countByEnumeratingWithState:&v79 objects:v89 count:16];
  if (!v11)
  {
    LOBYTE(v68) = 0;
    LOBYTE(v9) = 0;
    v42 = 0;
    id v14 = 0;
    id v23 = 0;
    v75 = 0;
    v15 = 0;
    v71 = 0;
    v43 = 0;
    int64_t v69 = -1;
    goto LABEL_74;
  }
  uint64_t v13 = v11;
  int64_t v67 = v9;
  int v68 = 0;
  LOBYTE(v9) = 0;
  id v14 = 0;
  v15 = 0;
  v71 = 0;
  uint64_t v74 = *(void *)v80;
  v75 = 0;
  BOOL v17 = a3 != 1 || !v10;
  BOOL v66 = v17;
  int64_t v69 = -1;
  *(void *)&long long v12 = 138543618;
  long long v65 = v12;
  do
  {
    uint64_t v18 = 0;
    do
    {
      uint64_t v19 = v14;
      if (*(void *)v80 != v74) {
        objc_enumerationMutation(obj);
      }
      v20 = *(void **)(*((void *)&v79 + 1) + 8 * v18);
      uint64_t v21 = objc_msgSend(v20, "proceduralWallpaperInfoForVariant:", a3, v65);
      if (v21)
      {
        v22 = (void *)v21;
        if ([(PBUIWallpaperConfigurationManager *)v77 isProceduralWallpaperInfoValid:v21])
        {
          uint64_t v44 = [(PBUIWallpaperConfigurationManager *)v77 cleanedProceduralWallpaperInfo:v22];
          uint64_t v45 = PBUIWallpaperLocationForVariant(a3);
          v46 = v20;
          v43 = (void *)v44;
          [v46 setProceduralWallpaperInfo:v44 forVariants:v45];

          v42 = 0;
          id v23 = 0;
          goto LABEL_74;
        }
      }
      id v78 = v14;
      id v23 = [(PBUIWallpaperConfigurationManager *)v77 wallpaperColorForVariant:a3 fromDataStore:v20 colorName:&v78];
      id v14 = v78;

      if (v23)
      {
        v42 = 0;
LABEL_72:
        v43 = 0;
        goto LABEL_74;
      }
      uint64_t v24 = [v20 wallpaperGradientForVariant:a3];
      if (v24)
      {
        v42 = (void *)v24;
        id v23 = 0;
        goto LABEL_72;
      }
      if (v9)
      {
        LOBYTE(v9) = 1;
        unint64_t v25 = v76;
        goto LABEL_46;
      }
      unint64_t v25 = v76;
      if (a4)
      {
        uint64_t v26 = [v20 wallpaperImageForVariant:a3 wallpaperMode:v76];

        if (v26)
        {
          LOBYTE(v9) = 1;
          int64_t v69 = a3;
          v71 = (void *)v26;
          goto LABEL_46;
        }
        uint64_t v9 = PBUILogCommon();
        if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
        {
          double v29 = PBUIStringForWallpaperVariant(a3);
          __int16 v30 = PBUIStringForWallpaperMode(v76);
          *(_DWORD *)buf = v65;
          v84 = v29;
          __int16 v85 = 2114;
          v86 = v30;
          _os_log_impl(&dword_1BC4B3000, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "Cannot find image for variant: %{public}@ with wallpaper mode: %{public}@. Defaulting to PBUIWallpaperModeNone image.", buf, 0x16u);
        }
        uint64_t v31 = [v20 wallpaperImageForVariant:a3 wallpaperMode:0];
        LODWORD(v9) = v31 != 0;
        v68 |= v9;
        if (a3 == 1 && !v31)
        {
          uint64_t v32 = [v20 wallpaperImageForVariant:v67 wallpaperMode:v76];
          if (!v32)
          {
            uint64_t v32 = [v20 wallpaperImageForVariant:v67 wallpaperMode:0];
            v68 |= v32 != 0;
          }
          v71 = (void *)v32;
          int64_t v28 = v67;
          LOBYTE(v9) = v32 != 0;
          goto LABEL_43;
        }
        v71 = (void *)v31;
        goto LABEL_45;
      }
      if ([v20 hasWallpaperImageForVariant:a3 wallpaperMode:v76])
      {
        LOBYTE(v9) = 1;
LABEL_45:
        int64_t v69 = a3;
        goto LABEL_46;
      }
      int v27 = [v20 hasWallpaperImageForVariant:a3 wallpaperMode:0];
      LOBYTE(v9) = v27;
      v68 |= v27;
      if (a3 != 1 || (v27 & 1) != 0) {
        goto LABEL_45;
      }
      if ([v20 hasWallpaperImageForVariant:v67 wallpaperMode:v76])
      {
        int64_t v28 = v67;
        LOBYTE(v9) = 1;
LABEL_43:
        int64_t v69 = v28;
        goto LABEL_46;
      }
      LODWORD(v9) = [v20 hasWallpaperImageForVariant:v67 wallpaperMode:0];
      v68 |= v9;
      int64_t v69 = v67;
LABEL_46:
      if (v15) {
        BOOL v33 = 0;
      }
      else {
        BOOL v33 = v73;
      }
      if (v33)
      {
        uint64_t v34 = [v20 verifiedVideoURLForVariant:a3 wallpaperMode:v25];
        if (v34)
        {
          v15 = (void *)v34;
          v35 = v20;
          int64_t v36 = a3;
          goto LABEL_52;
        }
        if (!v66)
        {
          uint64_t v38 = [v20 verifiedVideoURLForVariant:v67 wallpaperMode:v25];
          if (v38)
          {
            v15 = (void *)v38;
            v35 = v20;
            int64_t v36 = v67;
LABEL_52:
            unint64_t v37 = v25;
LABEL_59:
            uint64_t v40 = [v35 verifiedOriginalVideoURLForVariant:v36 wallpaperMode:v37];

            v75 = (void *)v40;
            goto LABEL_60;
          }
        }
        uint64_t v39 = [v20 verifiedVideoURLForVariant:a3 wallpaperMode:0];
        if (v39)
        {
          v15 = (void *)v39;
          v35 = v20;
          int64_t v36 = a3;
LABEL_58:
          unint64_t v37 = 0;
          goto LABEL_59;
        }
        if (v66)
        {
          v15 = 0;
        }
        else
        {
          v15 = [v20 verifiedVideoURLForVariant:v67 wallpaperMode:0];
          if (v15)
          {
            v35 = v20;
            int64_t v36 = v67;
            goto LABEL_58;
          }
        }
      }
LABEL_60:
      ++v18;
    }
    while (v13 != v18);
    uint64_t v41 = [obj countByEnumeratingWithState:&v79 objects:v89 count:16];
    uint64_t v13 = v41;
    v42 = 0;
    id v23 = 0;
    v43 = 0;
  }
  while (v41);
LABEL_74:

  v47 = PBUILogCommon();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v84 = v43;
    __int16 v85 = 2112;
    v86 = v15;
    __int16 v87 = 2112;
    v88 = v71;
    _os_log_debug_impl(&dword_1BC4B3000, v47, OS_LOG_TYPE_DEBUG, "Procedural: %@, Video: %@, Static: %@", buf, 0x20u);
  }

  if (v43)
  {
    v48 = [[PBUIWallpaperConfiguration alloc] initWithVariant:a3 type:2];
    [(PBUIWallpaperConfiguration *)v48 setProceduralWallpaperInfo:v43];
    goto LABEL_82;
  }
  if (v23)
  {
    v48 = [[PBUIWallpaperConfiguration alloc] initWithVariant:a3 type:4];
    [(PBUIWallpaperConfiguration *)v48 setWallpaperColor:v23];
    [(PBUIWallpaperConfiguration *)v48 setWallpaperColorName:v14];
    goto LABEL_82;
  }
  if (v42)
  {
    v48 = [[PBUIWallpaperConfiguration alloc] initWithVariant:a3 type:5];
    [(PBUIWallpaperConfiguration *)v48 setWallpaperGradient:v42];
    goto LABEL_82;
  }
  if (((v15 != 0) & v9) == 1)
  {
    v48 = [[PBUIWallpaperConfiguration alloc] initWithVariant:a3 type:3];
    [(PBUIWallpaperConfiguration *)v48 setVideoURL:v15];
    [(PBUIWallpaperConfiguration *)v48 setOriginalVideoURL:v75];
    v64 = v48;
    goto LABEL_113;
  }
  if ((v9 & 1) == 0)
  {
    v48 = 0;
LABEL_82:
    if (!v71) {
      goto LABEL_85;
    }
LABEL_83:
    if (v69 != -1)
    {
      wallpaperImageCache = v77->_wallpaperImageCache;
      [NSNumber numberWithInteger:v69];
      v51 = v50 = v43;
      [(NSMutableDictionary *)wallpaperImageCache setObject:v71 forKey:v51];

      v43 = v50;
    }
    goto LABEL_85;
  }
  v64 = [[PBUIWallpaperConfiguration alloc] initWithVariant:a3 type:1];
  v48 = v64;
LABEL_113:
  [(PBUIWallpaperConfiguration *)v64 setWallpaperImage:v71];
  if (v71) {
    goto LABEL_83;
  }
LABEL_85:
  if (v48) {
    goto LABEL_90;
  }
  v52 = PBUILogCommon();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
    -[PBUIWallpaperConfigurationManager wallpaperConfigurationForVariant:includingValuesForTypes:wallpaperMode:]();
  }

  v48 = [(PBUIWallpaperConfigurationManager *)v77 fallbackWallpaperConfigurationForVarient:a3];
  if (v48)
  {
LABEL_90:
    if ((a4 & 0x10) != 0 && !v43)
    {
      if (v68)
      {
        v53 = [(PBUIWallpaperConfigurationManager *)v77 wallpaperOptionsForVariant:a3 wallpaperMode:0];
        v54 = v53;
        if (v77->_enableWallpaperDimming)
        {
          [v53 setWallpaperMode:v76];
          [(PBUIWallpaperConfiguration *)v48 setNeedsWallpaperDimmingTreatment:1];
        }
      }
      else
      {
        v54 = [(PBUIWallpaperConfigurationManager *)v77 wallpaperOptionsForVariant:a3 wallpaperMode:v76];
      }
      if (v76 == 3) {
        [(PBUIWallpaperConfiguration *)v48 setNeedsInactiveAppearanceTreatment:1];
      }
      [(PBUIWallpaperConfiguration *)v48 setWallpaperOptions:v54];
    }
    if ((a4 & 2) != 0 && !v43)
    {
      v55 = [(PBUIWallpaperConfiguration *)v48 wallpaperOptions];
      v56 = -[PBUIWallpaperConfigurationManager wallpaperOriginalImageForVariant:wallpaperMode:](v77, "wallpaperOriginalImageForVariant:wallpaperMode:", a3, [v55 wallpaperMode]);

      [(PBUIWallpaperConfiguration *)v48 setWallpaperOriginalImage:v56];
      v43 = 0;
    }
    if ((a4 & 4) != 0)
    {
      v57 = [(PBUIWallpaperConfigurationManager *)v77 wallpaperThumbnailImageForFulfillingLookupForConfiguration:v48];
      [(PBUIWallpaperConfiguration *)v48 setWallpaperThumbnailImage:v57];
    }
    if ((a4 & 8) != 0)
    {
      v58 = [(PBUIWallpaperConfigurationManager *)v77 wallpaperThumbnailImageDataForFulfillingLookupForConfiguration:v48];
      [(PBUIWallpaperConfiguration *)v48 setWallpaperThumbnailImageData:v58];
    }
    v59 = [(PBUIWallpaperConfiguration *)v48 wallpaperOptions];
    v60 = -[PBUIWallpaperConfigurationManager wallpaperImageHashDataForVariant:wallpaperMode:](v77, "wallpaperImageHashDataForVariant:wallpaperMode:", a3, [v59 wallpaperMode]);

    [(PBUIWallpaperConfiguration *)v48 setWallpaperImageHashData:v60];
  }
  v61 = PBUILogCommon();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG)) {
    -[PBUIWallpaperConfigurationManager wallpaperConfigurationForVariant:includingValuesForTypes:wallpaperMode:]((uint64_t)v48, a3, v61);
  }

  v62 = v48;
  return v62;
}

- (id)lockScreenWallpaperConfigurationIncludingValuesForTypes:(unint64_t)a3
{
  return [(PBUIWallpaperConfigurationManager *)self wallpaperConfigurationForVariant:0 includingValuesForTypes:a3];
}

- (id)homeScreenWallpaperConfigurationIncludingValuesForTypes:(unint64_t)a3
{
  return [(PBUIWallpaperConfigurationManager *)self wallpaperConfigurationForVariant:1 includingValuesForTypes:a3];
}

- (id)wallpaperConfigurationForVariant:(int64_t)a3
{
  double v5 = [MEMORY[0x1E4F28B50] mainBundle];
  char v6 = [v5 bundleIdentifier];

  if ([v6 isEqualToString:@"com.apple.mobilesafari"]) {
    uint64_t v7 = 4;
  }
  else {
    uint64_t v7 = 0;
  }
  double v8 = [(PBUIWallpaperConfigurationManager *)self wallpaperConfigurationForVariant:a3 includingValuesForTypes:v7];

  return v8;
}

- (PBUIWallpaperConfiguration)lockScreenWallpaperConfiguration
{
  return (PBUIWallpaperConfiguration *)[(PBUIWallpaperConfigurationManager *)self wallpaperConfigurationForVariant:0];
}

- (PBUIWallpaperConfiguration)homeScreenWallpaperConfiguration
{
  return (PBUIWallpaperConfiguration *)[(PBUIWallpaperConfigurationManager *)self wallpaperConfigurationForVariant:1];
}

- (id)fallbackWallpaperConfigurationForVarient:(int64_t)a3
{
  double v3 = [[PBUIWallpaperConfiguration alloc] initWithVariant:a3 type:4];
  double v4 = [MEMORY[0x1E4F428B8] blackColor];
  [(PBUIWallpaperConfiguration *)v3 setWallpaperColor:v4];

  return v3;
}

- (char)_providerForVariant:(int64_t)a3 lockConfig:(id)a4 homeConfig:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = v9;
  int64_t v11 = a3;
  if (a3 == 1)
  {
    uint64_t v12 = [v9 wallpaperType];
    uint64_t v13 = v12;
    if ((v12 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      unsigned int v14 = 2;
      if ([(PBUIWallpaperConfigurationManager *)self hasWallpaperImageForVariant:1 wallpaperMode:2])
      {
        goto LABEL_24;
      }
      v15 = [v10 wallpaperOptions];
      v16 = [v15 name];
      uint64_t v17 = [v16 length];

      if (v17)
      {
        int v18 = 2;
LABEL_23:

        unsigned int v14 = v18;
LABEL_24:
        uint64_t v21 = PBUILogCommon();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v26 = PBUIStringForWallpaperVariant(1);
          int v27 = PBUIStringForPosterWallpaperMigrationProvider(v14);
          int v35 = 138543874;
          int64_t v36 = v26;
          __int16 v37 = 2114;
          id v38 = v27;
          __int16 v39 = 2114;
          id v40 = v10;
          int64_t v28 = "provider for variant %{public}@ is %{public}@ by looking at homescreen variant : %{public}@";
LABEL_34:
          _os_log_impl(&dword_1BC4B3000, v21, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v35, 0x20u);

          goto LABEL_35;
        }
        goto LABEL_35;
      }
      int v18 = 1;
      if ([(PBUIWallpaperConfigurationManager *)self hasWallpaperImageForVariant:1 wallpaperMode:0])
      {
        goto LABEL_23;
      }
      int64_t v11 = 0;
      if (v13 != [v8 wallpaperType])
      {
        double v29 = [v10 wallpaperImageHashData];
        __int16 v30 = [v8 wallpaperImageHashData];
        int v31 = [v29 isEqual:v30];

        if (!v31) {
          int64_t v11 = 1;
        }
      }
    }
    else
    {
      if (v12 == 2)
      {
        unsigned int v14 = 2;
        goto LABEL_24;
      }
      int64_t v11 = 1;
    }
    uint64_t v19 = PBUILogCommon();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = PBUIStringForWallpaperVariant(1);
      int v35 = 138543618;
      int64_t v36 = v20;
      __int16 v37 = 2114;
      id v38 = v10;
      _os_log_impl(&dword_1BC4B3000, v19, OS_LOG_TYPE_DEFAULT, "cannot determine provider for variant %{public}@ by looking at homescreen variant : %{public}@", (uint8_t *)&v35, 0x16u);
    }
  }
  if (v11)
  {
LABEL_13:
    uint64_t v21 = PBUILogCommon();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[PBUIWallpaperConfigurationManager _providerForVariant:lockConfig:homeConfig:](a3);
    }
    LOBYTE(v14) = 0;
    goto LABEL_35;
  }
  uint64_t v22 = [v8 wallpaperType];
  if ((v22 & 0xFFFFFFFFFFFFFFFDLL) != 1)
  {
    if (v22 == 2)
    {
      unsigned int v14 = 2;
      goto LABEL_32;
    }
    goto LABEL_37;
  }
  unsigned int v14 = 2;
  if ([(PBUIWallpaperConfigurationManager *)self hasWallpaperImageForVariant:0 wallpaperMode:2])
  {
    goto LABEL_32;
  }
  id v23 = [v8 wallpaperOptions];
  uint64_t v24 = [v23 name];
  uint64_t v25 = [v24 length];

  if (!v25)
  {
    if ([(PBUIWallpaperConfigurationManager *)self hasWallpaperImageForVariant:0 wallpaperMode:0])
    {
      unsigned int v14 = 1;
      goto LABEL_31;
    }

LABEL_37:
    BOOL v33 = PBUILogCommon();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v34 = PBUIStringForWallpaperVariant(a3);
      int v35 = 138543618;
      int64_t v36 = v34;
      __int16 v37 = 2114;
      id v38 = v8;
      _os_log_impl(&dword_1BC4B3000, v33, OS_LOG_TYPE_DEFAULT, "cannot determine provider for variant %{public}@ by looking at homescreen variant : %{public}@", (uint8_t *)&v35, 0x16u);
    }
    goto LABEL_13;
  }
  unsigned int v14 = 2;
LABEL_31:

LABEL_32:
  uint64_t v21 = PBUILogCommon();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v26 = PBUIStringForWallpaperVariant(a3);
    int v27 = PBUIStringForPosterWallpaperMigrationProvider(v14);
    int v35 = 138543874;
    int64_t v36 = v26;
    __int16 v37 = 2114;
    id v38 = v27;
    __int16 v39 = 2114;
    id v40 = v8;
    int64_t v28 = "provider for variant %{public}@ is %{public}@ by looking at lockscreen variant : %{public}@";
    goto LABEL_34;
  }
LABEL_35:

  return v14;
}

- (id)posterMigrationInfo
{
  double v3 = [(PBUIWallpaperConfigurationManager *)self wallpaperConfigurationForVariant:0 includingValuesForTypes:16 wallpaperMode:0];
  double v4 = [(PBUIWallpaperConfigurationManager *)self wallpaperConfigurationForVariant:1 includingValuesForTypes:16 wallpaperMode:0];
  uint64_t v5 = [(PBUIWallpaperConfigurationManager *)self _providerForVariant:0 lockConfig:v3 homeConfig:v4];
  uint64_t v6 = [(PBUIWallpaperConfigurationManager *)self _providerForVariant:1 lockConfig:v3 homeConfig:v4];
  uint64_t v7 = v6;
  char v8 = 0;
  if (!v5 || !v6) {
    goto LABEL_25;
  }
  if (v5 != v6)
  {
    char v8 = 2 * (v6 == 1);
    goto LABEL_25;
  }
  if (v5 != 2)
  {
    if ([(PBUIWallpaperConfigurationManager *)self variantsShareWallpaperConfigurationForTypes:54])
    {
      char v8 = 1;
    }
    else
    {
      char v8 = 2;
    }
    goto LABEL_25;
  }
  uint64_t v9 = [v3 wallpaperType];
  if (v9 != [v4 wallpaperType]) {
    goto LABEL_20;
  }
  if (v9 == 2)
  {
    BOOL v10 = [v3 proceduralWallpaperIdentifier];
    int64_t v11 = [v4 proceduralWallpaperIdentifier];
    if (BSEqualStrings())
    {
      uint64_t v12 = [v3 proceduralWallpaperInfo];
      uint64_t v13 = [v4 proceduralWallpaperInfo];
      if (BSEqualDictionaries())
      {
        id v23 = [v3 proceduralWallpaperOptions];
        unsigned int v14 = [v4 proceduralWallpaperOptions];
        char v8 = BSEqualDictionaries();
      }
      else
      {
        char v8 = 0;
      }

      goto LABEL_25;
    }

LABEL_20:
    char v8 = 0;
    goto LABEL_25;
  }
  v15 = [v3 wallpaperOptions];
  v16 = [v4 wallpaperOptions];
  int v17 = BSEqualObjects();

  if (v17)
  {
    int v18 = [v15 name];
    uint64_t v19 = [v18 length];

    char v8 = 1;
    if (!v19)
    {
      if ([(PBUIWallpaperConfigurationManager *)self hasWallpaperImageForVariant:1 wallpaperMode:0])
      {
        char v8 = 2;
      }
      else
      {
        char v8 = 1;
      }
    }
  }
  else
  {
    char v8 = 2;
  }

LABEL_25:
  id v20 = [[PBUIPosterWallpaperMigrationInfo alloc] _initWithPairingType:v8 lockProvider:v5 homeProvider:v7];
  uint64_t v21 = PBUILogCommon();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    -[PBUIWallpaperConfigurationManager posterMigrationInfo]();
  }

  return v20;
}

- (BOOL)hasWallpaperImageForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [(PBUIWallpaperConfigurationManager *)self dataStores];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(*((void *)&v13 + 1) + 8 * i) hasWallpaperImageForVariant:a3 wallpaperMode:a4])
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (id)wallpaperImageForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  wallpaperImageCache = self->_wallpaperImageCache;
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:");
  uint64_t v9 = [(NSMutableDictionary *)wallpaperImageCache objectForKey:v8];

  if (!v9)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    BOOL v10 = [(PBUIWallpaperConfigurationManager *)self dataStores];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = [*(id *)(*((void *)&v18 + 1) + 8 * i) wallpaperImageForVariant:a3 wallpaperMode:a4];
          if (v15)
          {
            uint64_t v9 = (void *)v15;

            long long v16 = self->_wallpaperImageCache;
            BOOL v10 = [NSNumber numberWithInteger:a3];
            [(NSMutableDictionary *)v16 setObject:v9 forKey:v10];
            goto LABEL_12;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    uint64_t v9 = 0;
LABEL_12:
  }
  return v9;
}

- (id)wallpaperOriginalImageForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v7 = [(PBUIWallpaperConfigurationManager *)self variantsShareWallpaperConfigurationForTypes:54];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = [(PBUIWallpaperConfigurationManager *)self dataStores];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    BOOL v12 = a3 == 1 && v7;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v15 = [v14 wallpaperOriginalImageForVariant:a3 wallpaperMode:a4];
        if (!v15)
        {
          if (!v12) {
            continue;
          }
          if ([v14 hasWallpaperImageForVariant:1 wallpaperMode:a4]) {
            continue;
          }
          uint64_t v15 = [v14 wallpaperOriginalImageForVariant:0 wallpaperMode:a4];
          if (!v15) {
            continue;
          }
        }
        long long v16 = (void *)v15;
        goto LABEL_16;
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  long long v16 = 0;
LABEL_16:

  return v16;
}

- (id)wallpaperThumbnailImageDataForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v7 = [(PBUIWallpaperConfigurationManager *)self dataStores];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
      uint64_t v13 = [(PBUIWallpaperConfigurationManager *)self wallpaperThumbnailImageDataForVariant:a3 wallpaperMode:a4 inDataStore:v12];
      long long v14 = (void *)v13;
      if (a3 == 1 && !v13)
      {
        long long v14 = [(PBUIWallpaperConfigurationManager *)self wallpaperThumbnailImageDataForVariant:0 wallpaperMode:a4 inDataStore:v12];
      }
      if (v14) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    long long v14 = 0;
  }

  return v14;
}

- (id)wallpaperThumbnailImageDataForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4 inDataStore:(id)a5
{
  id v7 = a5;
  uint64_t v8 = [v7 wallpaperThumbnailDataForVariant:a3 wallpaperMode:a4];
  if (!v8)
  {
    uint64_t v8 = [v7 wallpaperThumbnailDataForVariant:a3 wallpaperMode:0];
  }

  return v8;
}

- (id)wallpaperThumbnailImageForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  double v4 = [(PBUIWallpaperConfigurationManager *)self wallpaperThumbnailImageDataForVariant:a3 wallpaperMode:a4];
  if (v4) {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F42A80]) _initWithData:v4 preserveScale:1];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)wallpaperThumbnailImageForFulfillingLookupForConfiguration:(id)a3
{
  id v4 = a3;
  switch([v4 wallpaperType])
  {
    case 1:
    case 3:
      uint64_t v5 = -[PBUIWallpaperConfigurationManager wallpaperThumbnailImageForVariant:wallpaperMode:](self, "wallpaperThumbnailImageForVariant:wallpaperMode:", [v4 variant], -[PBUIWallpaperConfigurationManager wallpaperMode](self, "wallpaperMode"));
      break;
    case 2:
      uint64_t v6 = [v4 proceduralWallpaperInfo];
      uint64_t v7 = PBUIMagicWallpaperThumbnail(v6);
      goto LABEL_7;
    case 4:
      [(PBUIWallpaperConfigurationManager *)self wallpaperScale];
      double v9 = v8;
      [(PBUIWallpaperConfigurationManager *)self wallpaperSize];
      double v11 = v9 * v10;
      double v13 = v9 * v12;
      [(PBUIWallpaperConfigurationManager *)self thumbnailWidth];
      CGFloat v15 = round(v14);
      CGFloat v16 = round(v13 * (v14 / v11));
      uint64_t v6 = [v4 wallpaperColor];
      uint64_t v7 = PBUIWallpaperImageWithFlatColor(v6, v15, v16, 1.0);
      goto LABEL_7;
    case 5:
      [(PBUIWallpaperConfigurationManager *)self wallpaperScale];
      double v18 = v17;
      [(PBUIWallpaperConfigurationManager *)self wallpaperSize];
      double v20 = v18 * v19;
      double v22 = v18 * v21;
      [(PBUIWallpaperConfigurationManager *)self thumbnailWidth];
      double v24 = round(v23);
      double v25 = round(v22 * (v23 / v20));
      uint64_t v6 = [v4 wallpaperGradient];
      uint64_t v7 = PBUIWallpaperImageWithGradient(v6, v24, v25, 1.0);
LABEL_7:
      uint64_t v5 = (void *)v7;

      break;
    default:
      uint64_t v5 = 0;
      break;
  }

  return v5;
}

- (id)wallpaperThumbnailImageDataForFulfillingLookupForConfiguration:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 wallpaperType];
  uint64_t v6 = 0;
  if (v5 <= 5)
  {
    if (((1 << v5) & 0x34) != 0)
    {
      uint64_t v7 = [(PBUIWallpaperConfigurationManager *)self wallpaperThumbnailImageForFulfillingLookupForConfiguration:v4];
      uint64_t v6 = UIImagePNGRepresentation(v7);
    }
    else if (((1 << v5) & 0xA) != 0)
    {
      uint64_t v6 = -[PBUIWallpaperConfigurationManager wallpaperThumbnailImageDataForVariant:wallpaperMode:](self, "wallpaperThumbnailImageDataForVariant:wallpaperMode:", [v4 variant], -[PBUIWallpaperConfigurationManager wallpaperMode](self, "wallpaperMode"));
    }
  }

  return v6;
}

- (int64_t)effectiveSharedVariantForVariants:(int64_t)a3
{
  int64_t v3 = -1;
  if ((a3 & 2) != 0) {
    int64_t v3 = 1;
  }
  if (a3) {
    return 0;
  }
  else {
    return v3;
  }
}

- (BOOL)setWallpaperImage:(id)a3 wallpaperOptions:(id)a4 forVariants:(int64_t)a5
{
  return [(PBUIWallpaperConfigurationManager *)self setWallpaperImage:a3 adjustedImage:0 thumbnailData:0 imageHashData:0 wallpaperOptions:a4 forVariants:a5 wallpaperMode:0];
}

- (BOOL)setWallpaperImage:(id)a3 adjustedImage:(id)a4 thumbnailData:(id)a5 imageHashData:(id)a6 wallpaperOptions:(id)a7 forVariants:(int64_t)a8 wallpaperMode:(int64_t)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  [(PBUIWallpaperConfigurationManager *)self wallpaperSize];
  double v21 = v20;
  double v23 = v22;
  [(PBUIWallpaperConfigurationManager *)self wallpaperScale];
  double v25 = v24;
  int64_t v26 = [(PBUIWallpaperConfigurationManager *)self parallaxDeviceType];
  [v15 scale];
  objc_msgSend(v19, "bestWallpaperSizeForWallpaperSize:wallpaperScale:deviceType:imageScale:", v26, v21, v23, v25, v27);
  if (!v16)
  {
    [v19 cropRect];
    objc_msgSend(v15, "pbui_cropImageWithRect:outputSize:");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!v16) {
      id v16 = v15;
    }
  }
  [v19 zoomScale];
  double v29 = v28;
  if (([v19 supportsCropping] & 1) == 0 && fabs(v29 + -1.0) >= 2.22044605e-16)
  {
    __int16 v30 = objc_msgSend(v16, "pbui_scaleImage:", v29);

    uint64_t v31 = objc_msgSend(v30, "pbui_imageHashData");

    id v18 = (id)v31;
    id v16 = v30;
  }
  LOBYTE(v34) = 0;
  BOOL v32 = [(PBUIWallpaperConfigurationManager *)self setWallpaperImage:v16 originalImage:v15 thumbnailData:v17 imageHashData:v18 wallpaperOptions:v19 forVariants:a8 options:1 wallpaperMode:a9 isMigrating:v34];

  return v32;
}

- (BOOL)setWallpaperImage:(id)a3 originalImage:(id)a4 forVariants:(int64_t)a5 options:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  if (!v11)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PBUIWallpaperConfigurationManager.m", 845, @"Invalid parameter not satisfying: %@", @"image" object file lineNumber description];
  }
  LOBYTE(v16) = 0;
  BOOL v13 = [(PBUIWallpaperConfigurationManager *)self setWallpaperImage:v11 originalImage:v12 thumbnailData:0 imageHashData:0 wallpaperOptions:0 forVariants:a5 options:a6 wallpaperMode:0 isMigrating:v16];

  return v13;
}

- (BOOL)setWallpaperImage:(id)a3 originalImage:(id)a4 thumbnailData:(id)a5 imageHashData:(id)a6 wallpaperOptions:(id)a7 forVariants:(int64_t)a8 options:(unint64_t)a9 wallpaperMode:(int64_t)a10 isMigrating:(BOOL)a11
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  if (!v17)
  {
    v48 = [MEMORY[0x1E4F28B00] currentHandler];
    [v48 handleFailureInMethod:a2, self, @"PBUIWallpaperConfigurationManager.m", 851, @"Invalid parameter not satisfying: %@", @"image" object file lineNumber description];
  }
  double v22 = PBUILogCommon();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    double v23 = PBUIStringForWallpaperLocations(a8);
    *(_DWORD *)buf = 138543618;
    id v65 = v21;
    __int16 v66 = 2114;
    int64_t v67 = v23;
    _os_log_impl(&dword_1BC4B3000, v22, OS_LOG_TYPE_DEFAULT, "Set wallpaper options: %{public}@ for variants: %{public}@", buf, 0x16u);
  }
  double v24 = (void *)MEMORY[0x1C1872330]();
  double v25 = objc_msgSend(v17, "pbui_CGImageBackedImage");
  v56 = objc_msgSend(v18, "pbui_CGImageBackedImage");

  if (a9)
  {
    uint64_t v26 = [(PBUIWallpaperConfigurationManager *)self normalizeImage:v25];

    double v25 = (void *)v26;
  }
  if (![v20 length])
  {
    uint64_t v27 = objc_msgSend(v25, "pbui_imageHashData");

    id v20 = (id)v27;
  }
  id v54 = v20;
  if (![v19 length])
  {
    uint64_t v28 = [(PBUIWallpaperConfigurationManager *)self thumbnailDataForImage:v25];

    id v19 = (id)v28;
  }
  uint64_t v29 = [(PBUIWallpaperConfigurationManager *)self effectiveSharedVariantForVariants:a8];
  id v30 = v25;
  if ([v30 CGImage])
  {
    id v50 = v17;
    id v51 = v19;
    if ([v21 wallpaperStatus] == 1
      || [v21 wallpaperStatus] == 3
      || a11 && [v21 wallpaperMode] == a10)
    {
      [(PBUIWallpaperConfigurationManager *)self wallpaperWillChangeForVariants:a8];
    }
    if (((v56 == 0) & (a9 >> 1)) != 0) {
      uint64_t v31 = -3;
    }
    else {
      uint64_t v31 = -1;
    }
    long long v59 = 0u;
    long long v60 = 0u;
    uint64_t v55 = v31;
    if ([(PBUIWallpaperConfigurationManager *)self variantsShareWallpaperConfigurationForTypes:54])
    {
      uint64_t v32 = v31;
    }
    else
    {
      uint64_t v32 = 0;
    }
    uint64_t v52 = v32;
    long long v61 = 0uLL;
    long long v62 = 0uLL;
    BOOL v33 = [(PBUIWallpaperConfigurationManager *)self dataStores];
    uint64_t v34 = [v33 countByEnumeratingWithState:&v59 objects:v63 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      v49 = self;
      int64_t v57 = a10;
      uint64_t v36 = *(void *)v60;
      int64_t v37 = a8 & 3;
      while (2)
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v60 != v36) {
            objc_enumerationMutation(v33);
          }
          __int16 v39 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          if (a11)
          {
            if ([*(id *)(*((void *)&v59 + 1) + 8 * i) setWallpaperImage:v30 forVariant:v29 wallpaperMode:a10])goto LABEL_40; {
          }
            }
          else
          {
            if ([v21 wallpaperStatus] == 1 || objc_msgSend(v21, "wallpaperStatus") == 2)
            {
              if (v37 == 3)
              {
                [v39 removeWallpaperImageDataTypes:v55 forVariants:2];
              }
              else if (a8)
              {
                [v39 moveWallpaperImageDataTypes:v52 fromVariant:0 toVariant:1];
              }
              [v39 removeWallpaperImageDataTypes:1 forVariants:a8];
            }
            if (objc_msgSend(v39, "setWallpaperImage:forVariant:wallpaperMode:", v30, v29, objc_msgSend(v21, "wallpaperMode")))
            {
LABEL_40:
              if (v56)
              {
                id v17 = v50;
                id v19 = v51;
                if ([v21 wallpaperStatus] == 1)
                {
                  if (a11)
                  {
LABEL_55:
                    [v39 setWallpaperOriginalImage:v56 forVariant:v29 wallpaperMode:a10];
LABEL_56:
                    if (v19) {
                      goto LABEL_57;
                    }
LABEL_68:
                    BOOL v43 = v37 == 3;
                    v42 = v49;
                    if (!v43 && !a11)
                    {
                      uint64_t v44 = [v39 wallpaperThumbnailDataForVariant:0 wallpaperMode:1];
                      v53 = [v39 wallpaperThumbnailDataForVariant:1 wallpaperMode:1];
                      uint64_t v45 = [v39 wallpaperThumbnailDataForVariant:0 wallpaperMode:2];
                      v46 = [v39 wallpaperThumbnailDataForVariant:1 wallpaperMode:2];
                      if ([v44 isEqualToData:v53]
                        && [v45 isEqualToData:v46])
                      {
                        [v39 removeWallpaperImageDataTypes:-1 forVariants:2];
                      }

                      id v19 = v51;
                    }
LABEL_74:

                    uint64_t v41 = v54;
                    if (v21) {
                      -[PBUIWallpaperConfigurationManager setWallpaperOptions:forVariants:wallpaperMode:](v42, "setWallpaperOptions:forVariants:wallpaperMode:", v21, a8, [v21 wallpaperMode]);
                    }
                    if (v54)
                    {
                      if ([v21 wallpaperStatus] == 1)
                      {
                        if (a11) {
                          goto LABEL_85;
                        }
LABEL_82:
                        [(PBUIWallpaperConfigurationManager *)v42 removeWallpaperImageHashDataForVariants:a8];
                      }
                      else if ([v21 wallpaperStatus] == 2 && !a11)
                      {
                        goto LABEL_82;
                      }
                      if (!a11) {
                        int64_t v57 = [v21 wallpaperMode];
                      }
LABEL_85:
                      [(PBUIWallpaperConfigurationManager *)v42 setWallpaperImageHashData:v54 forVariants:a8 wallpaperMode:v57];
                    }
                    if ([v21 wallpaperStatus] == 1 || objc_msgSend(v21, "wallpaperStatus") == 2) {
                      [(PBUIWallpaperConfigurationManager *)v42 removeAllDataExceptForTypes:10 variants:a8 variantsShareWallpaperConfiguration:0];
                    }
                    if ([v21 wallpaperStatus] == 1
                      || [v21 wallpaperStatus] == 3
                      || a11 && [v21 wallpaperMode] == a10)
                    {
                      BOOL v40 = 1;
                      [(PBUIWallpaperConfigurationManager *)v42 wallpaperDidChangeForVariants:a8 shouldNotify:1];
                    }
                    else
                    {
                      BOOL v40 = 1;
                    }
                    goto LABEL_94;
                  }
LABEL_53:
                  [v39 removeWallpaperImageDataTypes:2 forVariants:a8];
                }
                else if ([v21 wallpaperStatus] == 2 && !a11)
                {
                  goto LABEL_53;
                }
                if (a11) {
                  goto LABEL_55;
                }
                objc_msgSend(v39, "setWallpaperOriginalImage:forVariant:wallpaperMode:", v56, v29, objc_msgSend(v21, "wallpaperMode"));
                if (v51) {
                  goto LABEL_57;
                }
                goto LABEL_68;
              }
              id v17 = v50;
              id v19 = v51;
              if ((a9 >> 1)) {
                goto LABEL_56;
              }
              [v39 removeWallpaperImageDataTypes:2 forVariants:PBUIWallpaperLocationForVariant(v29)];
              if (!v51) {
                goto LABEL_68;
              }
LABEL_57:
              if ([v21 wallpaperStatus] == 1)
              {
                if (a11)
                {
LABEL_64:
                  v42 = v49;
                  [(PBUIWallpaperConfigurationManager *)v49 setWallpaperThumbnailData:v19 forVariant:v29 wallpaperMode:a10];
                  goto LABEL_74;
                }
LABEL_62:
                [(PBUIWallpaperConfigurationManager *)v49 removeWallpaperImageDataTypes:4 forVariants:a8];
              }
              else if ([v21 wallpaperStatus] == 2 && !a11)
              {
                goto LABEL_62;
              }
              if (!a11)
              {
                -[PBUIWallpaperConfigurationManager setWallpaperThumbnailData:forVariant:wallpaperMode:](v49, "setWallpaperThumbnailData:forVariant:wallpaperMode:", v19, v29, [v21 wallpaperMode]);
                goto LABEL_68;
              }
              goto LABEL_64;
            }
          }
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v59 objects:v63 count:16];
        if (v35) {
          continue;
        }
        break;
      }
    }

    BOOL v40 = 0;
    id v17 = v50;
    id v19 = v51;
    uint64_t v41 = v54;
  }
  else
  {
    BOOL v40 = 0;
    uint64_t v41 = v54;
  }
LABEL_94:

  return v40;
}

- (id)normalizeImage:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    unint64_t v5 = [(PBUIWallpaperConfigurationManager *)self dataStores];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v45 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v34;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v34 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = [*(id *)(*((void *)&v33 + 1) + 8 * i) verifiedVideoURLForVariant:0 wallpaperMode:0];

          if (v10)
          {
            uint64_t v27 = v4;

            uint64_t v26 = v27;
            goto LABEL_21;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v33 objects:v45 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    id v4 = v4;
    id v11 = (CGImage *)[v4 CGImage];
    double Height = (double)CGImageGetHeight(v11);
    double Width = (double)CGImageGetWidth(v11);
    [(PBUIWallpaperConfigurationManager *)self wallpaperScale];
    double v15 = v14;
    [(PBUIWallpaperConfigurationManager *)self wallpaperSize];
    +[PBUIWallpaperParallaxSettings minimumWallpaperSizeForWallpaperSize:deviceType:](PBUIWallpaperParallaxSettings, "minimumWallpaperSizeForWallpaperSize:deviceType:", [(PBUIWallpaperConfigurationManager *)self parallaxDeviceType], v16, v17);
    if (v19 > v18) {
      double v18 = v19;
    }
    double v20 = v15 * v18;
    if (v20 < Height && v20 < Width)
    {
      UIRectCenteredIntegralRect();
      CGFloat v22 = v50.size.width;
      CGFloat v23 = v50.size.height;
      CGImageRef v24 = CGImageCreateWithImageInRect(v11, v50);
      if (v24)
      {
        double v25 = v24;
        uint64_t v26 = [objc_alloc(MEMORY[0x1E4F42A80]) initWithCGImage:v24 scale:0 orientation:v15];

        CGImageRelease(v25);
        uint64_t v27 = PBUILogCommon();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          [v26 size];
          uint64_t v28 = NSStringFromCGSize(v48);
          [v26 scale];
          uint64_t v30 = v29;
          v49.CGFloat width = v22;
          v49.CGFloat height = v23;
          uint64_t v31 = NSStringFromCGSize(v49);
          *(_DWORD *)buf = 138544130;
          id v38 = v26;
          __int16 v39 = 2114;
          BOOL v40 = v28;
          __int16 v41 = 2048;
          uint64_t v42 = v30;
          __int16 v43 = 2114;
          uint64_t v44 = v31;
          _os_log_impl(&dword_1BC4B3000, v27, OS_LOG_TYPE_DEFAULT, "<SpringBoardUI>: Modified wallpaper image: %{public}@ [size=%{public}@, scale=%f] - cgImageSize=%{public}@", buf, 0x2Au);
        }
LABEL_21:

        id v4 = v26;
      }
    }
  }
  return v4;
}

- (id)thumbnailDataForImage:(id)a3
{
  int64_t v3 = objc_msgSend(MEMORY[0x1E4F42A80], "pbui_thumbnailImageForImage:", a3);
  objc_msgSend(v3, "pbui_CGImageBackedImage");
  id v4 = (UIImage *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    unint64_t v5 = UIImageJPEGRepresentation(v4, 0.8);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (double)thumbnailWidth
{
  unint64_t v2 = [(PBUIWallpaperConfigurationManager *)self wallpaperSizeType];
  double result = 0.0;
  if (v2 <= 4) {
    return dbl_1BC53F118[v2];
  }
  return result;
}

- (BOOL)setWallpaperThumbnailFromFullsizeImage:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  uint64_t v8 = [(PBUIWallpaperConfigurationManager *)self thumbnailDataForImage:a3];
  if (v8) {
    BOOL v9 = [(PBUIWallpaperConfigurationManager *)self setWallpaperThumbnailData:v8 forVariant:a4 wallpaperMode:a5];
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)setWallpaperThumbnailData:(id)a3 forVariant:(int64_t)a4
{
  return [(PBUIWallpaperConfigurationManager *)self setWallpaperThumbnailData:a3 forVariant:a4 wallpaperMode:0];
}

- (BOOL)setWallpaperThumbnailData:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v9 = [(PBUIWallpaperConfigurationManager *)self dataStores];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        if ([*(id *)(*((void *)&v16 + 1) + 8 * i) setWallpaperThumbnailData:v8 forVariant:a4 wallpaperMode:a5])
        {
          BOOL v14 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (void)removeWallpaperImagesForVariants:(int64_t)a3
{
  BOOL v5 = [(PBUIWallpaperConfigurationManager *)self variantsShareWallpaperConfiguration];
  [(PBUIWallpaperConfigurationManager *)self removeWallpaperImagesForVariants:a3 variantsShareWallpaperConfiguration:v5];
}

- (void)removeWallpaperImagesForVariants:(int64_t)a3 variantsShareWallpaperConfiguration:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(PBUIWallpaperConfigurationManager *)self clearCacheForVariants:3];
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v7 = (a3 & 3) == 1 && v4;
  *((void *)&v14 + 1) = 0;
  long long v15 = 0uLL;
  id v8 = [(PBUIWallpaperConfigurationManager *)self dataStores];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        BOOL v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (v7) {
          [v13 moveWallpaperImageDataTypes:-1 fromVariant:0 toVariant:1];
        }
        else {
          [v13 removeWallpaperImageDataTypes:-1 forVariants:a3];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)removeWallpaperImageDataTypes:(unint64_t)a3 forVariants:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [(PBUIWallpaperConfigurationManager *)self dataStores];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) removeWallpaperImageDataTypes:a3 forVariants:a4];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (id)wallpaperOptionsForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [(PBUIWallpaperConfigurationManager *)self dataStores];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) wallpaperOptionsForVariant:a3 wallpaperMode:a4];
        if (v11)
        {
          long long v12 = (void *)v11;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  long long v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)setWallpaperOptions:(id)a3 forVariants:(int64_t)a4
{
  return [(PBUIWallpaperConfigurationManager *)self setWallpaperOptions:a3 forVariants:a4 wallpaperMode:0];
}

- (BOOL)setWallpaperOptions:(id)a3 forVariants:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void *)[a3 copy];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = [(PBUIWallpaperConfigurationManager *)self dataStores];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        if ([*(id *)(*((void *)&v16 + 1) + 8 * i) setWallpaperOptions:v8 forVariants:a4 wallpaperMode:a5])
        {
          BOOL v14 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (void)removeWallpaperOptionsForVariants:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v4 = [(PBUIWallpaperConfigurationManager *)self dataStores];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) removeWallpaperOptionsForVariants:a3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)wallpaperImageHashDataForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [(PBUIWallpaperConfigurationManager *)self dataStores];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) wallpaperImageHashDataForVariant:a3 wallpaperMode:a4];
        if (v11)
        {
          long long v12 = (void *)v11;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  long long v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)shouldSetWallpaperImageHashData
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  unint64_t v2 = [(PBUIWallpaperConfigurationManager *)self dataStores];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) supportsWallpaperImageHashDataStorage])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)setWallpaperImageHashData:(id)a3 forVariants:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v8 = (void *)[a3 copy];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v9 = [(PBUIWallpaperConfigurationManager *)self dataStores];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        if ([*(id *)(*((void *)&v16 + 1) + 8 * i) setWallpaperImageHashData:v8 forVariants:a4 wallpaperMode:a5])
        {
          BOOL v14 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (void)removeWallpaperImageHashDataForVariants:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [(PBUIWallpaperConfigurationManager *)self dataStores];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) removeWallpaperImageHashDataForVariants:a3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)variantsShareWallpaperConfiguration
{
  if ([(PBUIWallpaperConfigurationManager *)self isCachedVariantsShareWallpaperConfigurationValid])
  {
    return [(PBUIWallpaperConfigurationManager *)self cachedVariantsShareWallpaperConfiguration];
  }
  else
  {
    BOOL v4 = [(PBUIWallpaperConfigurationManager *)self variantsShareWallpaperConfigurationForTypes:-1];
    BOOL v5 = v4;
    [(PBUIWallpaperConfigurationManager *)self setCachedVariantsShareWallpaperConfiguration:v4];
    [(PBUIWallpaperConfigurationManager *)self setCachedVariantsShareWallpaperConfigurationValid:1];
    return v5;
  }
}

- (BOOL)variantsShareWallpaperConfigurationForTypes:(unint64_t)a3
{
  return [(PBUIWallpaperConfigurationManager *)self wallpaperTypeForSharedWallpaperConfigurationForTypes:a3] != 0;
}

- (int64_t)wallpaperTypeForSharedWallpaperConfigurationForTypes:(unint64_t)a3
{
  char v3 = a3;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(PBUIWallpaperConfigurationManager *)self isVideoSupportedForVariant:0];
  BOOL v6 = [(PBUIWallpaperConfigurationManager *)self isVideoSupportedForVariant:1];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v29 = self;
  uint64_t v7 = [(PBUIWallpaperConfigurationManager *)self dataStores];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (!v8)
  {

    long long v10 = 0;
    LODWORD(v11) = 0;
    LODWORD(v12) = 0;
    long long v13 = 0;
    long long v33 = 0;
    uint64_t v14 = 0;
LABEL_42:
    int64_t v27 = v12 & ~v11 & 1;
    goto LABEL_51;
  }
  uint64_t v9 = v8;
  long long v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  BOOL v34 = 0;
  long long v13 = 0;
  uint64_t v32 = v7;
  long long v33 = 0;
  uint64_t v14 = 0;
  BOOL v35 = 0;
  uint64_t v36 = *(void *)v38;
  int v30 = !v6;
  int v31 = !v5;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v38 != v36) {
        objc_enumerationMutation(v7);
      }
      long long v16 = *(void **)(*((void *)&v37 + 1) + 8 * i);
      if ((v3 & 4) == 0)
      {
LABEL_9:
        if ((v3 & 0x10) == 0) {
          goto LABEL_18;
        }
        goto LABEL_10;
      }
      if (v14)
      {
        if (v10) {
          goto LABEL_9;
        }
      }
      else
      {
        uint64_t v14 = [*(id *)(*((void *)&v37 + 1) + 8 * i) proceduralWallpaperInfoForVariant:1];
        if (v10) {
          goto LABEL_9;
        }
      }
      long long v10 = [v16 proceduralWallpaperInfoForVariant:0];
      if ((v3 & 0x10) == 0) {
        goto LABEL_18;
      }
LABEL_10:
      if (v33)
      {
        if (!v13) {
          goto LABEL_17;
        }
      }
      else
      {
        long long v33 = [(PBUIWallpaperConfigurationManager *)v29 wallpaperColorForVariant:1 fromDataStore:v16 colorName:0];
        if (!v13)
        {
LABEL_17:
          long long v13 = [(PBUIWallpaperConfigurationManager *)v29 wallpaperColorForVariant:0 fromDataStore:v16 colorName:0];
        }
      }
LABEL_18:
      if ((v3 & 2) != 0)
      {
        if (!(v11 & 1 | (v14 != 0)))
        {
          uint64_t v11 = 1;
          if (([v16 hasWallpaperImageForVariant:1 wallpaperMode:0] & 1) == 0) {
            uint64_t v11 = [v16 hasWallpaperImageForVariant:1 wallpaperMode:2];
          }
        }
        if (!(v12 & 1 | (v10 != 0)))
        {
          if (([v16 hasWallpaperImageForVariant:0 wallpaperMode:0] & 1) == 0)
          {
            uint64_t v12 = [v16 hasWallpaperImageForVariant:0 wallpaperMode:2];
            if ((v3 & 8) == 0) {
              continue;
            }
            goto LABEL_26;
          }
          uint64_t v12 = 1;
        }
      }
      if ((v3 & 8) == 0) {
        continue;
      }
LABEL_26:
      if (!((v34 | v31) & 1 | (v10 != 0)))
      {
        uint64_t v17 = v12;
        uint64_t v18 = v11;
        long long v19 = v13;
        double v20 = [v16 verifiedVideoURLForVariant:0 wallpaperMode:0];
        if (v20)
        {
          BOOL v34 = 1;
        }
        else
        {
          uint64_t v21 = [v16 verifiedVideoURLForVariant:0 wallpaperMode:2];
          BOOL v34 = v21 != 0;
        }
        long long v13 = v19;
        uint64_t v11 = v18;
        uint64_t v12 = v17;
        uint64_t v7 = v32;
      }
      if (!((v35 | v30) & 1 | (v14 != 0)))
      {
        uint64_t v22 = v12;
        uint64_t v23 = v11;
        CGImageRef v24 = v13;
        BOOL v35 = 1;
        double v25 = [v16 verifiedVideoURLForVariant:1 wallpaperMode:0];
        if (!v25)
        {
          uint64_t v26 = [v16 verifiedVideoURLForVariant:1 wallpaperMode:2];
          BOOL v35 = v26 != 0;
        }
        long long v13 = v24;
        uint64_t v11 = v23;
        uint64_t v12 = v22;
        uint64_t v7 = v32;
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v37 objects:v41 count:16];
  }
  while (v9);

  if ((v10 != 0) != (v14 != 0)) {
    goto LABEL_40;
  }
  if (!v10 || !v14)
  {
    if (v10 && !v14)
    {
      int64_t v27 = 2;
      goto LABEL_51;
    }
    if ((v13 != 0) != (v33 != 0)) {
      goto LABEL_40;
    }
    if (v13 && v33)
    {
      if (([v33 isEqual:v13] & 1) == 0) {
        goto LABEL_61;
      }
    }
    else
    {
      if (!v13 || v33)
      {
LABEL_61:
        if (((v35 ^ v34) & 1) == 0) {
          goto LABEL_42;
        }
LABEL_40:
        int64_t v27 = 0;
        goto LABEL_51;
      }
      long long v33 = 0;
    }
    int64_t v27 = 4;
    goto LABEL_51;
  }
  if ([v14 isEqualToDictionary:v10]) {
    int64_t v27 = 2;
  }
  else {
    int64_t v27 = 0;
  }
LABEL_51:

  return v27;
}

- (void)restoreDefaultWallpaperForAllVariantsAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = PBUILogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PBUIWallpaperConfigurationManager restoreDefaultWallpaperForAllVariantsAndNotify:]();
  }

  if (soft_PF_IS_PAD_DEVICE() && !soft_PUIFeatureEnabled(0))
  {
    [(PBUIWallpaperConfigurationManager *)self wallpaperWillChangeForVariants:3];
    [(PBUIWallpaperConfigurationManager *)self beginChangeBatch];
    [(PBUIWallpaperConfigurationManager *)self removeDataForTypes:-1 variants:3 variantsShareWallpaperConfiguration:0];
    [(PBUIWallpaperConfigurationManager *)self clearDelayedChangeNotifications];
    [(PBUIWallpaperConfigurationManager *)self endChangeBatch];
    [(PBUIWallpaperConfigurationManager *)self wallpaperDidChangeForVariants:3 shouldNotify:v3];
  }
  else
  {
    BOOL v6 = PBUILogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[PBUIWallpaperConfigurationManager restoreDefaultWallpaperForAllVariantsAndNotify:]();
    }
  }
}

- (BOOL)setWallpaperConfigurationFromDefaultWallpaperConfiguration:(id)a3 forVariants:(int64_t)a4 wallpaperMode:(int64_t)a5 name:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  switch([v10 wallpaperType])
  {
    case 1:
      uint64_t v12 = [v10 staticImageURL];
      long long v13 = [v12 path];
      if (v13
        && ([MEMORY[0x1E4F42A80] imageWithContentsOfFile:v13],
            (uint64_t v14 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        long long v15 = (void *)v14;
        long long v16 = objc_alloc_init(PBUIWallpaperOptions);
        [(PBUIWallpaperOptions *)v16 setWallpaperMode:a5];
        [(PBUIWallpaperOptions *)v16 setName:v11];
        LOBYTE(v40) = 0;
        LOBYTE(v17) = 1;
        [(PBUIWallpaperConfigurationManager *)self setWallpaperImage:v15 originalImage:v15 thumbnailData:0 imageHashData:0 wallpaperOptions:v16 forVariants:a4 options:1 wallpaperMode:0 isMigrating:v40];
      }
      else
      {
        LOBYTE(v17) = 0;
      }

      break;
    case 2:
      uint64_t v18 = [v10 proceduralWallpaperIdentifier];
      long long v19 = [v10 proceduralWallpaperOptions];
      double v20 = objc_alloc_init(PBUIWallpaperDefaultsDomain);
      uint64_t v21 = [[PBUIWallpaperDefaults alloc] initWithdefaultsDomain:v20];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __127__PBUIWallpaperConfigurationManager_setWallpaperConfigurationFromDefaultWallpaperConfiguration_forVariants_wallpaperMode_name___block_invoke;
      v43[3] = &unk_1E62B2D00;
      uint64_t v44 = v21;
      id v45 = v18;
      id v46 = v19;
      id v22 = v19;
      id v23 = v18;
      CGImageRef v24 = v21;
      PBUIWallpaperEnumerateVariantsForLocations(a4, v43);

      goto LABEL_6;
    case 3:
      double v25 = [v10 staticImageURL];
      uint64_t v26 = [v25 path];
      uint64_t v42 = (void *)v26;
      if (v26)
      {
        uint64_t v17 = [MEMORY[0x1E4F42A80] imageWithContentsOfFile:v26];
        if (v17)
        {
          [(PBUIWallpaperConfigurationManager *)self setWallpaperImage:v17 originalImage:v17 forVariants:a4 options:1];

          LOBYTE(v17) = 1;
        }
      }
      else
      {
        LOBYTE(v17) = 0;
      }
      int v30 = [v10 videoURL];
      double v31 = *MEMORY[0x1E4F1DB28];
      double v32 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v33 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v34 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      if (v30) {
        -[PBUIWallpaperConfigurationManager setVideoURL:forVariant:shoudCrop:relativeCropRect:wallpaperMode:](self, "setVideoURL:forVariant:shoudCrop:relativeCropRect:wallpaperMode:", v30, 0, 0, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      }
      [v25 lastPathComponent];
      v35 = __int16 v41 = v25;
      uint64_t v36 = [v35 stringByDeletingPathExtension];
      long long v37 = +[PBUIWallpaperOptions optionsWithName:parallaxFactor:zoomScale:supportsCropping:cropRect:portrait:hasVideo:stillTimeInVideo:](PBUIWallpaperOptions, "optionsWithName:parallaxFactor:zoomScale:supportsCropping:cropRect:portrait:hasVideo:stillTimeInVideo:", v36, 0, 1, 1, 0.0, 1.0, v31, v32, v33, v34, 0.0);

      [v37 setWallpaperMode:a5];
      [(PBUIWallpaperConfigurationManager *)self setWallpaperOptions:v37 forVariants:a4 wallpaperMode:a5];

      break;
    case 4:
      int64_t v27 = [v10 wallpaperColorName];
      if (v27)
      {
        [(PBUIWallpaperConfigurationManager *)self setWallpaperColorName:v27 forVariants:a4];
        int v28 = 1;
      }
      else
      {
        long long v38 = [v10 wallpaperColor];
        if (v38)
        {
          [(PBUIWallpaperConfigurationManager *)self setWallpaperColor:v38 forVariants:a4];
          int v28 = 1;
        }
        else
        {
          int v28 = 0;
        }
      }
      LOBYTE(v17) = v28 != 0;
      break;
    case 5:
      uint64_t v29 = [v10 wallpaperGradient];
      LOBYTE(v17) = v29 != 0;
      if (v29) {
        [(PBUIWallpaperConfigurationManager *)self setWallpaperGradient:v29 forVariants:a4];
      }

      break;
    default:
LABEL_6:
      LOBYTE(v17) = 0;
      break;
  }

  return (char)v17;
}

uint64_t __127__PBUIWallpaperConfigurationManager_setWallpaperConfigurationFromDefaultWallpaperConfiguration_forVariants_wallpaperMode_name___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  if (a2 == 1)
  {
    uint64_t v3 = 2;
  }
  else
  {
    if (a2) {
      return result;
    }
    uint64_t v3 = 1;
  }
  [*(id *)(result + 32) setProceduralIdentifier:*(void *)(result + 40) forLocations:v3];
  [*(id *)(v2 + 32) setProceduralOptions:*(void *)(v2 + 48) forLocations:v3];
  BOOL v4 = *(void **)(v2 + 32);
  return [v4 setProceduralUserSet:0 forLocations:v3];
}

- (void)clearCacheForVariants:(int64_t)a3
{
}

- (void)clearCacheForVariants:(int64_t)a3 memoryOnly:(BOOL)a4
{
  char v5 = a3;
  uint64_t v7 = PBUILogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[PBUIWallpaperConfigurationManager clearCacheForVariants:memoryOnly:]();
  }

  if (!a4)
  {
    uint64_t v8 = +[PBUIWallpaperCache wallpaperCache];
    [v8 removeEverythingWithCompletion:0];
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__PBUIWallpaperConfigurationManager_clearCacheForVariants_memoryOnly___block_invoke;
  v9[3] = &unk_1E62B2D28;
  v9[4] = self;
  PBUIWallpaperEnumerateVariantsForLocations(v5, v9);
}

void __70__PBUIWallpaperConfigurationManager_clearCacheForVariants_memoryOnly___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v3 = [NSNumber numberWithInteger:a2];
  [v2 removeObjectForKey:v3];
}

- (unint64_t)numberOfCachedStaticImages
{
  return [(NSMutableDictionary *)self->_wallpaperImageCache count];
}

- (PBUIMagnifyMode)magnifyMode
{
  uint64_t v2 = self->_magnifyMode;
  if (!v2)
  {
    uint64_t v2 = +[PBUIMagnifyMode currentMagnifyMode];
    if (!v2) {
      uint64_t v2 = objc_alloc_init(PBUIMagnifyMode);
    }
  }
  return v2;
}

- (void)performMigrationWithFailureHandler:(id)a3
{
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(void))a3;
  if (!soft_PF_IS_PAD_DEVICE() || soft_PUIFeatureEnabled(0))
  {
    char v5 = [MEMORY[0x1E4F28B50] mainBundle];
    BOOL v6 = [v5 bundleIdentifier];
    int v7 = [v6 isEqualToString:@"com.apple.springboard"];

    if (v7)
    {
      uint64_t v8 = PBUILogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[PBUIWallpaperConfigurationManager performMigrationWithFailureHandler:]();
      }
      goto LABEL_139;
    }
  }
  v103 = (void *)os_transaction_create();
  context = (void *)MEMORY[0x1C1872330]();
  uint64_t v9 = PBUILogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[PBUIWallpaperConfigurationManager performMigrationWithFailureHandler:]5();
  }

  id v10 = objc_alloc_init(PBUIWallpaperDefaultsDomain);
  id v11 = [(PBUIWallpaperDefaultsDomain *)v10 lockScreenWallpapers];

  if (!v11)
  {
    uint64_t v12 = objc_alloc_init(PBUIWallpaperLegacyDefaultsDomain);
    long long v13 = +[PBUIWallpaperDefaultsWrapper lockScreenWrapperForLegacyDefaults:v12];
    uint64_t v14 = [v13 wallpaperDefaultsDict];

    long long v15 = (void *)MEMORY[0x1E4F1C9E8];
    long long v16 = PBUIStringForWallpaperMode(0);
    uint64_t v17 = [v15 dictionaryWithObject:v14 forKey:v16];

    uint64_t v18 = +[PBUIWallpaperDefaultsWrapper homeScreenWrapperForLegacyDefaults:v12];
    long long v19 = [v18 wallpaperDefaultsDict];

    double v20 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v21 = PBUIStringForWallpaperMode(0);
    id v22 = [v20 dictionaryWithObject:v19 forKey:v21];

    [(PBUIWallpaperDefaultsDomain *)v10 setLockScreenWallpapers:v17];
    [(PBUIWallpaperDefaultsDomain *)v10 setHomeScreenWallpapers:v22];
    [(BSAbstractDefaultDomain *)v12 resetAllDefaults];
  }
  id v23 = [MEMORY[0x1E4F28CB8] defaultManager];
  CGImageRef v24 = +[PBUIWallpaperDirectoryDataStore defaultDirectoryURL];
  double v25 = [v24 URLByAppendingPathComponent:@"LockBackground.jpg" isDirectory:0];
  uint64_t v26 = NSHomeDirectory();
  uint64_t v27 = [v26 stringByAppendingPathComponent:@"Library/LockBackground.jpg"];

  v109 = v24;
  v106 = [v24 URLByAppendingPathComponent:@"HomeBackground.jpg" isDirectory:0];
  v108 = v25;
  v100 = v23;
  if (([v25 checkResourceIsReachableAndReturnError:0] & 1) != 0
    || ([v23 fileExistsAtPath:v27] & 1) != 0)
  {
    int v28 = 1;
  }
  else
  {
    int v28 = [v106 checkResourceIsReachableAndReturnError:0];
  }
  int v99 = v28;
  v107 = (void *)v27;
  v101 = v10;
  v104 = self;
  v105 = v4;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  id obj = [(PBUIWallpaperConfigurationManager *)self dataStores];
  uint64_t v29 = [obj countByEnumeratingWithState:&v119 objects:v124 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    LOBYTE(v31) = 0;
    LOBYTE(v32) = 0;
    LOBYTE(v33) = 0;
    LOBYTE(v34) = 0;
    BOOL v35 = 0;
    LOBYTE(v36) = 0;
    uint64_t v112 = *(void *)v120;
    uint64_t v114 = 0;
    while (1)
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v120 != v112) {
          objc_enumerationMutation(obj);
        }
        long long v38 = *(void **)(*((void *)&v119 + 1) + 8 * i);
        if ((v114 & 0x100000000) != 0) {
          HIDWORD(v114) = 1;
        }
        else {
          HIDWORD(v114) = [*(id *)(*((void *)&v119 + 1) + 8 * i) hasWallpaperImageForVariant:0 wallpaperMode:0];
        }
        if (v114)
        {
          LODWORD(v114) = 1;
          if (!v36) {
            goto LABEL_24;
          }
        }
        else
        {
          LODWORD(v114) = [v38 hasWallpaperImageForVariant:1 wallpaperMode:0];
          if (!v36)
          {
LABEL_24:
            long long v39 = [v38 proceduralWallpaperInfoForVariant:0];
            BOOL v36 = v39 != 0;

            if (!v35) {
              goto LABEL_25;
            }
            goto LABEL_30;
          }
        }
        BOOL v36 = 1;
        if (!v35)
        {
LABEL_25:
          uint64_t v40 = [v38 proceduralWallpaperInfoForVariant:1];
          BOOL v35 = v40 != 0;

          if (v34) {
            goto LABEL_31;
          }
          goto LABEL_26;
        }
LABEL_30:
        BOOL v35 = 1;
        if (v34)
        {
LABEL_31:
          BOOL v34 = 1;
          if (v33) {
            goto LABEL_39;
          }
          goto LABEL_32;
        }
LABEL_26:
        __int16 v41 = [v38 wallpaperColorForVariant:0];
        if (v41)
        {
          BOOL v34 = 1;
        }
        else
        {
          id v46 = [v38 wallpaperColorNameForVariant:0];
          BOOL v34 = v46 != 0;
        }
        if (v33)
        {
LABEL_39:
          BOOL v33 = 1;
          if (!v32) {
            goto LABEL_35;
          }
          goto LABEL_40;
        }
LABEL_32:
        BOOL v33 = 1;
        uint64_t v42 = [v38 wallpaperColorForVariant:1];
        if (!v42)
        {
          __int16 v43 = [v38 wallpaperColorNameForVariant:1];
          BOOL v33 = v43 != 0;
        }
        if (!v32)
        {
LABEL_35:
          uint64_t v44 = [v38 wallpaperGradientForVariant:0];
          BOOL v32 = v44 != 0;

          if (!v31) {
            goto LABEL_36;
          }
          goto LABEL_41;
        }
LABEL_40:
        BOOL v32 = 1;
        if (!v31)
        {
LABEL_36:
          id v45 = [v38 wallpaperGradientForVariant:1];
          BOOL v31 = v45 != 0;

          continue;
        }
LABEL_41:
        BOOL v31 = 1;
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v119 objects:v124 count:16];
      if (!v30) {
        goto LABEL_46;
      }
    }
  }
  BOOL v31 = 0;
  BOOL v32 = 0;
  BOOL v33 = 0;
  BOOL v34 = 0;
  BOOL v35 = 0;
  BOOL v36 = 0;
  uint64_t v114 = 0;
LABEL_46:

  v113 = objc_alloc_init(PBUIWallpaperDefaultsDomain);
  v47 = [[PBUIWallpaperDefaults alloc] initWithdefaultsDomain:v113];
  CGSize v48 = v47;
  if (v36 && v35)
  {
    BOOL v97 = 1;
    BOOL v98 = 1;
    CGSize v49 = v113;
  }
  else
  {
    if (v36)
    {
      BOOL v97 = 1;
    }
    else if ([(PBUIWallpaperDefaults *)v47 proceduralUserSetForVariant:0])
    {
      CGRect v50 = [(PBUIWallpaperDefaults *)v48 proceduralIdentifierForVariant:0];
      BOOL v97 = v50 != 0;
    }
    else
    {
      BOOL v97 = 0;
    }
    CGSize v49 = v113;
    if (v35)
    {
      BOOL v98 = 1;
    }
    else if ([(PBUIWallpaperDefaults *)v48 proceduralUserSetForVariant:1])
    {
      id v51 = [(PBUIWallpaperDefaults *)v48 proceduralIdentifierForVariant:1];
      BOOL v98 = v51 != 0;
    }
    else
    {
      BOOL v98 = 0;
    }
  }
  if (!v34 || !v33)
  {
    BOOL v4 = v105;
    if (v34)
    {
      BOOL obja = 1;
      v53 = v107;
      if (!v33)
      {
LABEL_63:
        id v54 = [(PBUIWallpaperDefaults *)v48 wallpaperColorDataForVariant:1];
        if (v54)
        {
          uint64_t v55 = [(PBUIWallpaperDefaults *)v48 wallpaperColorNameForVariant:1];
          BOOL v52 = v55 != 0;
        }
        else
        {
          BOOL v52 = 0;
        }
        int v58 = v99;

        goto LABEL_73;
      }
    }
    else
    {
      v56 = [(PBUIWallpaperDefaults *)v48 wallpaperColorDataForVariant:0];
      if (v56)
      {
        int64_t v57 = [(PBUIWallpaperDefaults *)v48 wallpaperColorNameForVariant:0];
        BOOL obja = v57 != 0;
      }
      else
      {
        BOOL obja = 0;
      }
      v53 = v107;

      if (!v33) {
        goto LABEL_63;
      }
    }
    BOOL v52 = 1;
    goto LABEL_72;
  }
  BOOL v52 = 1;
  BOOL obja = 1;
  BOOL v4 = v105;
  v53 = v107;
LABEL_72:
  int v58 = v99;
LABEL_73:
  if (v32 && v31)
  {
    BOOL v59 = 1;
    BOOL v60 = 1;
    long long v61 = v104;
  }
  else
  {
    if (v32)
    {
      BOOL v60 = 1;
    }
    else
    {
      long long v62 = [(PBUIWallpaperDefaults *)v48 wallpaperGradientDataForVariant:0];
      BOOL v60 = v62 != 0;
    }
    long long v61 = v104;
    if (v31)
    {
      BOOL v59 = 1;
    }
    else
    {
      v63 = [(PBUIWallpaperDefaults *)v48 wallpaperGradientDataForVariant:1];
      BOOL v59 = v63 != 0;
    }
  }
  v64 = PBUILogCommon();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG)) {
    -[PBUIWallpaperConfigurationManager performMigrationWithFailureHandler:]4();
  }

  id v65 = PBUILogCommon();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG)) {
    -[PBUIWallpaperConfigurationManager performMigrationWithFailureHandler:]3();
  }

  __int16 v66 = PBUILogCommon();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG)) {
    -[PBUIWallpaperConfigurationManager performMigrationWithFailureHandler:]2();
  }

  int64_t v67 = PBUILogCommon();
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG)) {
    -[PBUIWallpaperConfigurationManager performMigrationWithFailureHandler:]1();
  }

  uint64_t v68 = PBUILogCommon();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG)) {
    -[PBUIWallpaperConfigurationManager performMigrationWithFailureHandler:]0();
  }

  int64_t v69 = PBUILogCommon();
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG)) {
    -[PBUIWallpaperConfigurationManager performMigrationWithFailureHandler:].cold.9();
  }

  if ((v58 | HIDWORD(v114) ^ 1) == 1)
  {
    char v70 = [(PBUIWallpaperDefaultsDomain *)v49 legacyUsesUniqueHomeScreenWallpaper];
    BOOL v71 = v98 || v97 || obja || v52 || v60 || v59;
    v72 = (void *)MEMORY[0x1E4F42A80];
    BOOL v73 = [v108 path];
    uint64_t v74 = [v72 imageWithContentsOfFile:v73];
    v75 = v74;
    if (v74)
    {
      id v76 = v74;
    }
    else
    {
      id v76 = [MEMORY[0x1E4F42A80] imageWithContentsOfFile:v53];
    }
    char v81 = v70 | v71;

    long long v82 = PBUILogCommon();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG)) {
      -[PBUIWallpaperConfigurationManager performMigrationWithFailureHandler:].cold.8();
    }

    v83 = PBUILogCommon();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG)) {
      -[PBUIWallpaperConfigurationManager performMigrationWithFailureHandler:].cold.7();
    }

    if ((v81 & 1) == 0)
    {
      if (v76)
      {
        v91 = PBUILogCommon();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG)) {
          -[PBUIWallpaperConfigurationManager performMigrationWithFailureHandler:].cold.6();
        }

        char v89 = [(PBUIWallpaperConfigurationManager *)v61 setWallpaperImage:v76 originalImage:0 forVariants:3 options:1];
        if (!v4) {
          goto LABEL_129;
        }
        goto LABEL_126;
      }
      [(PBUIWallpaperConfigurationManager *)v61 restoreDefaultWallpaperForAllVariantsAndNotify:0];
LABEL_129:
      long long v117 = 0u;
      long long v118 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      uint64_t v92 = [&unk_1F162C558 countByEnumeratingWithState:&v115 objects:v123 count:16];
      long long v80 = v100;
      if (v92)
      {
        uint64_t v93 = v92;
        uint64_t v94 = *(void *)v116;
        do
        {
          for (uint64_t j = 0; j != v93; ++j)
          {
            if (*(void *)v116 != v94) {
              objc_enumerationMutation(&unk_1F162C558);
            }
            v96 = [v109 URLByAppendingPathComponent:*(void *)(*((void *)&v115 + 1) + 8 * j) isDirectory:0];
            [v100 removeItemAtURL:v96 error:0];
          }
          uint64_t v93 = [&unk_1F162C558 countByEnumeratingWithState:&v115 objects:v123 count:16];
        }
        while (v93);
      }
      v53 = v107;
      [v100 removeItemAtPath:v107 error:0];
      CGSize v49 = v113;
      [(PBUIWallpaperDefaultsDomain *)v113 clearLegacyDefaults];

      goto LABEL_137;
    }
    v84 = (void *)MEMORY[0x1E4F42A80];
    __int16 v85 = [v106 path];
    v86 = [v84 imageWithContentsOfFile:v85];

    __int16 v87 = PBUILogCommon();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG)) {
      -[PBUIWallpaperConfigurationManager performMigrationWithFailureHandler:].cold.5();
    }

    if (v76)
    {
      v88 = PBUILogCommon();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG)) {
        -[PBUIWallpaperConfigurationManager performMigrationWithFailureHandler:].cold.4();
      }

      char v89 = [(PBUIWallpaperConfigurationManager *)v61 setWallpaperImage:v76 originalImage:0 forVariants:1 options:1];
      if (v86)
      {
LABEL_112:
        uint64_t v90 = PBUILogCommon();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG)) {
          -[PBUIWallpaperConfigurationManager performMigrationWithFailureHandler:]();
        }

        v89 &= [(PBUIWallpaperConfigurationManager *)v61 setWallpaperImage:v86 originalImage:0 forVariants:2 options:1];
        goto LABEL_125;
      }
    }
    else
    {
      if (((v97 | HIDWORD(v114) | obja) & 1) == 0) {
        [(PBUIWallpaperConfigurationManager *)v61 restoreDefaultWallpaperForAllVariantsAndNotify:0];
      }
      char v89 = 1;
      if (v86) {
        goto LABEL_112;
      }
    }
    if (((v98 | v114 | obja) & 1) == 0) {
      [(PBUIWallpaperConfigurationManager *)v61 restoreDefaultWallpaperForAllVariantsAndNotify:0];
    }
LABEL_125:

    if (v4)
    {
LABEL_126:
      if ((v89 & 1) == 0) {
        v4[2](v4);
      }
      goto LABEL_129;
    }
    goto LABEL_129;
  }
  if ([(PBUIWallpaperConfigurationManager *)v61 variantsShareWallpaperConfigurationForTypes:54])
  {
    v77 = v61;
    uint64_t v78 = 0;
    uint64_t v79 = 3;
  }
  else
  {
    [(PBUIWallpaperConfigurationManager *)v61 migrateWallpaperOptionsForImageIfNecessaryForVariant:0 representingVariants:PBUIWallpaperLocationForVariant(0)];
    uint64_t v79 = PBUIWallpaperLocationForVariant(1);
    v77 = v61;
    uint64_t v78 = 1;
  }
  [(PBUIWallpaperConfigurationManager *)v77 migrateWallpaperOptionsForImageIfNecessaryForVariant:v78 representingVariants:v79];
  long long v80 = v100;
  [(PBUIWallpaperConfigurationManager *)v61 safeMigrateWallpaperImageIfNecessary];
LABEL_137:
  [(PBUIWallpaperConfigurationManager *)v61 regenerateThumbnailsIfNecessary];

  uint64_t v8 = PBUILogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[PBUIWallpaperConfigurationManager performMigrationWithFailureHandler:]();
  }
LABEL_139:
}

- (void)migrateWallpaperOptionsForImageIfNecessaryForVariant:(int64_t)a3 representingVariants:(int64_t)a4
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  int v7 = PBUILogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[PBUIWallpaperConfigurationManager migrateWallpaperOptionsForImageIfNecessaryForVariant:representingVariants:].cold.6(a3, v7);
  }

  uint64_t v8 = [(PBUIWallpaperConfigurationManager *)self wallpaperConfigurationForVariant:a3 includingValuesForTypes:19 wallpaperMode:[(PBUIWallpaperConfigurationManager *)self wallpaperMode]];
  uint64_t v9 = [v8 wallpaperOptions];
  id v10 = [v8 wallpaperImage];
  id v11 = [v8 wallpaperOriginalImage];
  uint64_t v12 = [v8 proceduralWallpaperInfo];
  long long v13 = (void *)v12;
  if (v9 && v11 && !v12)
  {
    uint64_t v14 = PBUIWallpaperLocationForVariant(a3);
    if (![v9 supportsCropping])
    {
      uint64_t v29 = [(PBUIWallpaperConfigurationManager *)self magnifyMode];
      [v29 zoomFactor];
      float v31 = v30;
      uint64_t v32 = [v9 isMagnifyEnabled];
      if (!v29)
      {
        CGImageRef v24 = 0;
        goto LABEL_63;
      }
      uint64_t v33 = v32;
      v110 = v29;
      double v34 = v31;
      double v35 = fabs(v34 + -1.0);
      if (v32 == v35 >= 2.22044605e-16)
      {
        CGImageRef v24 = 0;
LABEL_62:
        uint64_t v29 = v110;
LABEL_63:

        if (v10)
        {
          uint64_t v92 = [v8 wallpaperImageHashData];
          if (!v92)
          {
            if (![(PBUIWallpaperConfigurationManager *)self shouldSetWallpaperImageHashData])goto LABEL_66; {
            uint64_t v92 = [v10 pbui_imageHashData];
            }
            if (v92) {
              [(PBUIWallpaperConfigurationManager *)self setWallpaperImageHashData:v92 forVariants:a4 wallpaperMode:[(PBUIWallpaperConfigurationManager *)self wallpaperMode]];
            }
          }
        }
LABEL_66:
        uint64_t v93 = PBUILogCommon();
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG)) {
          -[PBUIWallpaperConfigurationManager migrateWallpaperOptionsForImageIfNecessaryForVariant:representingVariants:]();
        }

        goto LABEL_69;
      }
      BOOL v36 = PBUILogCommon();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
        -[PBUIWallpaperConfigurationManager migrateWallpaperOptionsForImageIfNecessaryForVariant:representingVariants:].cold.5(v35 >= 2.22044605e-16, v33, v36);
      }

      long long v37 = objc_msgSend(v11, "pbui_resizedImageForCurrentMagnifyMode");
      LOBYTE(v94) = 1;
      if (![(PBUIWallpaperConfigurationManager *)self setWallpaperImage:v37 originalImage:v11 thumbnailData:0 imageHashData:0 wallpaperOptions:0 forVariants:a4 options:1 wallpaperMode:[(PBUIWallpaperConfigurationManager *)self wallpaperMode] isMigrating:v94])
      {
        CGImageRef v24 = 0;
LABEL_61:

        goto LABEL_62;
      }
      CGImageRef v24 = objc_msgSend(v9, "copy", 2.22044605e-16);
      [v24 setMagnifyEnabled:v35 >= 2.22044605e-16];
      [v24 setZoomScale:1.0 / v34];
      [(PBUIWallpaperConfigurationManager *)self setWallpaperOptions:v24 forVariants:a4 wallpaperMode:[(PBUIWallpaperConfigurationManager *)self wallpaperMode]];
      long long v37 = v37;
      int v28 = v37;
LABEL_60:

      id v10 = v28;
      goto LABEL_61;
    }
    int64_t rect_24 = a4;
    [v11 size];
    double v16 = v15;
    double v18 = v17;
    [v11 scale];
    double v20 = v19;
    uint64_t v21 = PBUILogCommon();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BC4B3000, v21, OS_LOG_TYPE_INFO, "//////////__migrateWallpaperOptionsForImageIfNecessary//////////", buf, 2u);
    }

    id v22 = PBUILogCommon();
    uint64_t rect_8 = v14;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v123.double width = v16;
      v123.double height = v18;
      NSStringFromSize(v123);
      id v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v113 = v23;
      __int16 v114 = 2048;
      os_log_t v115 = *(os_log_t *)&v20;
      _os_log_impl(&dword_1BC4B3000, v22, OS_LOG_TYPE_INFO, "originalImage size %{public}@ scale %g", buf, 0x16u);
    }
    CGImageRef v24 = -[PBUIWallpaperConfigurationManager migratedWallpaperOptionsForWallpaperOptions:originalImageSize:](self, "migratedWallpaperOptionsForWallpaperOptions:originalImageSize:", v9, v16, v18);
    uint64_t v25 = [v8 videoURL];
    uint64_t rect_16 = [v8 originalVideoURL];
    [(PBUIWallpaperConfigurationManager *)self wallpaperScale];
    double v27 = v26;
    v110 = (void *)v25;
    if ([v24 isLooselyEqualToWallpaperOptions:v9])
    {
      int v28 = v10;
      a4 = rect_24;
      goto LABEL_58;
    }
    a4 = rect_24;
    if (v25 && !rect_16)
    {
      int v28 = v10;
      goto LABEL_58;
    }
    double v100 = v27;
    double v101 = v20;
    long long v38 = PBUILogCommon();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
      -[PBUIWallpaperConfigurationManager migrateWallpaperOptionsForImageIfNecessaryForVariant:representingVariants:].cold.4();
    }

    [v9 cropRect];
    CGFloat v40 = v39;
    CGFloat v42 = v41;
    CGFloat v44 = v43;
    CGFloat v46 = v45;
    [v9 parallaxFactor];
    uint64_t v48 = v47;
    [v9 zoomScale];
    uint64_t v50 = v49;
    [v24 cropRect];
    CGFloat v103 = v52;
    double rect = v51;
    CGFloat v102 = v53;
    CGFloat v99 = v54;
    uint64_t v55 = PBUILogCommon();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      if (rect_8 == 2) {
        v56 = @"Home";
      }
      else {
        v56 = @"Lock";
      }
      v129.origin.double x = v40;
      v129.origin.double y = v42;
      v129.size.double width = v44;
      v129.size.double height = v46;
      NSStringFromCGRect(v129);
      os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
      v130.origin.double x = v40;
      v130.origin.double y = v42;
      v130.size.double width = v44;
      v130.size.double height = v46;
      double v96 = v18;
      double v57 = v16;
      uint64_t v58 = v48;
      CGFloat MidX = CGRectGetMidX(v130);
      v131.origin.double x = v40;
      v131.origin.double y = v42;
      v131.size.double width = v44;
      v131.size.double height = v46;
      v124.double y = CGRectGetMidY(v131);
      v124.double x = MidX;
      v95 = NSStringFromCGPoint(v124);
      *(_DWORD *)buf = 138413314;
      v113 = v56;
      a4 = rect_24;
      __int16 v114 = 2114;
      os_log_t v115 = log;
      __int16 v116 = 2114;
      long long v117 = v95;
      __int16 v118 = 2048;
      uint64_t v119 = v50;
      __int16 v120 = 2048;
      uint64_t v121 = v58;
      double v16 = v57;
      double v18 = v96;
      _os_log_impl(&dword_1BC4B3000, v55, OS_LOG_TYPE_INFO, "%@ Old Crop: %{public}@ Center: %{public}@ Zoom: %g Parallax: %g", buf, 0x34u);
    }
    BOOL v60 = PBUILogCommon();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
      if (rect_8 == 2) {
        long long v61 = @"Home";
      }
      else {
        long long v61 = @"Lock";
      }
      double v62 = v103;
      v132.origin.double x = rect;
      v132.origin.double y = v103;
      double v63 = v102;
      v132.size.double width = v102;
      double v64 = v99;
      v132.size.double height = v99;
      rect_8b = NSStringFromCGRect(v132);
      v133.origin.double x = rect;
      v133.origin.double y = v103;
      v133.size.double width = v102;
      v133.size.double height = v99;
      CGFloat v65 = CGRectGetMidX(v133);
      v134.origin.double x = rect;
      v134.origin.double y = v103;
      v134.size.double width = v102;
      v134.size.double height = v99;
      v125.double y = CGRectGetMidY(v134);
      v125.double x = v65;
      NSStringFromCGPoint(v125);
      loga = v60;
      v67 = __int16 v66 = v24;
      [v66 zoomScale];
      uint64_t v69 = v68;
      [v66 parallaxFactor];
      *(_DWORD *)buf = 138413314;
      v113 = v61;
      a4 = rect_24;
      __int16 v114 = 2114;
      os_log_t v115 = rect_8b;
      __int16 v116 = 2114;
      long long v117 = v67;
      __int16 v118 = 2048;
      uint64_t v119 = v69;
      __int16 v120 = 2048;
      uint64_t v121 = v70;
      _os_log_impl(&dword_1BC4B3000, loga, OS_LOG_TYPE_INFO, "%@ New Crop: %{public}@ Center: %{public}@ Zoom: %g Parallax: %g", buf, 0x34u);

      CGImageRef v24 = v66;
      BOOL v60 = loga;
    }
    else
    {
      double v63 = v102;
      double v62 = v103;
      double v64 = v99;
    }

    [(PBUIWallpaperConfigurationManager *)self setWallpaperOptions:v24 forVariants:a4 wallpaperMode:[(PBUIWallpaperConfigurationManager *)self wallpaperMode]];
    [(PBUIWallpaperConfigurationManager *)self wallpaperSize];
    objc_msgSend(v24, "bestWallpaperSizeForWallpaperSize:wallpaperScale:deviceType:imageScale:", -[PBUIWallpaperConfigurationManager parallaxDeviceType](self, "parallaxDeviceType"), v71, v72, v100, v101);
    CGFloat v74 = v73;
    CGFloat v76 = v75;
    rect_8a = objc_msgSend(v11, "pbui_cropImageWithRect:outputSize:", rect, v62, v63, v64, v73, v75);
    v77 = PBUILogCommon();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
    {
      v126.double width = v16;
      v126.double height = v18;
      NSStringFromCGSize(v126);
      uint64_t v78 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v113 = v78;
      _os_log_impl(&dword_1BC4B3000, v77, OS_LOG_TYPE_INFO, "originalImageSize: %{public}@", buf, 0xCu);

      a4 = rect_24;
    }

    uint64_t v79 = PBUILogCommon();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
    {
      v127.double width = v74;
      v127.double height = v76;
      NSStringFromCGSize(v127);
      long long v80 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v113 = v80;
      _os_log_impl(&dword_1BC4B3000, v79, OS_LOG_TYPE_INFO, "outputSize: %{public}@", buf, 0xCu);

      a4 = rect_24;
    }

    char v81 = PBUILogCommon();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
    {
      [rect_8a size];
      NSStringFromCGSize(v128);
      long long v82 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v113 = v82;
      _os_log_impl(&dword_1BC4B3000, v81, OS_LOG_TYPE_INFO, "adjustedImageSize: %{public}@", buf, 0xCu);

      a4 = rect_24;
    }

    if (rect_8a)
    {
      BOOL v83 = [(PBUIWallpaperConfigurationManager *)self setWallpaperImage:rect_8a originalImage:v11 forVariants:a4 options:0];
      int v28 = rect_8a;

      if (v83)
      {
        if (rect_16)
        {
          CGAffineTransformMakeScale(&v111, 1.0 / v16, 1.0 / v18);
          v135.origin.double x = rect;
          v135.origin.double y = v62;
          v135.size.double width = v63;
          v135.size.double height = v64;
          CGRect v136 = CGRectApplyAffineTransform(v135, &v111);
          double x = v136.origin.x;
          double y = v136.origin.y;
          double width = v136.size.width;
          double height = v136.size.height;
          v88 = PBUILogCommon();
          if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
          {
            v137.origin.double x = x;
            v137.origin.double y = y;
            v137.size.double width = width;
            v137.size.double height = height;
            NSStringFromCGRect(v137);
            char v89 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v113 = v89;
            _os_log_impl(&dword_1BC4B3000, v88, OS_LOG_TYPE_INFO, "Re-cropping video to relative rect: %{public}@", buf, 0xCu);
          }
          uint64_t v90 = PBUILogCommon();
          a4 = rect_24;
          if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR)) {
            -[PBUIWallpaperConfigurationManager migrateWallpaperOptionsForImageIfNecessaryForVariant:representingVariants:]();
          }

          -[PBUIWallpaperConfigurationManager setVideoURL:forVariant:shoudCrop:relativeCropRect:wallpaperMode:](self, "setVideoURL:forVariant:shoudCrop:relativeCropRect:wallpaperMode:", rect_16, a3, 0, 0, x, y, width, height);
        }
        else
        {
          a4 = rect_24;
        }
LABEL_57:

LABEL_58:
        id v10 = PBUILogCommon();
        long long v37 = rect_16;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BC4B3000, v10, OS_LOG_TYPE_INFO, "/////////////////////////", buf, 2u);
        }
        goto LABEL_60;
      }
      a4 = rect_24;
    }
    else
    {
      int v28 = v10;
    }
    v91 = PBUILogCommon();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR)) {
      -[PBUIWallpaperConfigurationManager migrateWallpaperOptionsForImageIfNecessaryForVariant:representingVariants:]();
    }

    [(PBUIWallpaperConfigurationManager *)self setWallpaperOptions:v9 forVariants:a4 wallpaperMode:[(PBUIWallpaperConfigurationManager *)self wallpaperMode]];
    goto LABEL_57;
  }
LABEL_69:
}

- (id)migratedWallpaperOptionsForWallpaperOptions:(id)a3 originalImageSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  [v7 cropRect];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [v7 parallaxFactor];
  double v17 = v16;
  [v7 zoomScale];
  double v19 = v18;
  uint64_t v20 = [v7 isPortrait];
  double v32 = 0.0;
  -[PBUIWallpaperConfigurationManager cropRectForOldCropRect:portrait:zoomScale:oldParallaxFactor:forImageSize:newZoomScale:](self, "cropRectForOldCropRect:portrait:zoomScale:oldParallaxFactor:forImageSize:newZoomScale:", v20, &v32, v9, v11, v13, v15, v19, v17, width, height);
  double v25 = v21;
  double v26 = v22;
  double v27 = v23;
  double v28 = v24;
  if (v17 != 0.0)
  {
    -[PBUIWallpaperConfigurationManager parallaxFactorForCropRect:portrait:forImageSize:zoomScale:](self, "parallaxFactorForCropRect:portrait:forImageSize:zoomScale:", v20, v21, v22, v23, v24, width, height, v32);
    double v17 = v29;
  }
  float v30 = (void *)[v7 copy];
  [v30 setParallaxFactor:v17];
  [v30 setZoomScale:v32];
  objc_msgSend(v30, "setCropRect:", v25, v26, v27, v28);

  return v30;
}

- (BOOL)safeMigrateWallpaperImageIfNecessaryForVariant:(int64_t)a3 representingVariants:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  double v8 = [(PBUIWallpaperConfigurationManager *)self wallpaperImageForVariant:a3 wallpaperMode:a5];
  double v9 = [(PBUIWallpaperConfigurationManager *)self normalizeImage:v8];
  if (v8 != v9)
  {
    LOBYTE(v11) = 1;
    [(PBUIWallpaperConfigurationManager *)self setWallpaperImage:v9 originalImage:0 thumbnailData:0 imageHashData:0 wallpaperOptions:0 forVariants:a4 options:2 wallpaperMode:a5 isMigrating:v11];
  }

  return v8 != v9;
}

- (void)safeMigrateWallpaperImageIfNecessary
{
  if ([(PBUIWallpaperConfigurationManager *)self variantsShareWallpaperConfigurationForTypes:54])
  {
    int64_t v3 = [(PBUIWallpaperConfigurationManager *)self wallpaperMode];
    BOOL v4 = self;
    uint64_t v5 = 0;
    uint64_t v6 = 3;
  }
  else
  {
    [(PBUIWallpaperConfigurationManager *)self safeMigrateWallpaperImageIfNecessaryForVariant:0 representingVariants:PBUIWallpaperLocationForVariant(0) wallpaperMode:[(PBUIWallpaperConfigurationManager *)self wallpaperMode]];
    uint64_t v7 = PBUIWallpaperLocationForVariant(1);
    int64_t v3 = [(PBUIWallpaperConfigurationManager *)self wallpaperMode];
    BOOL v4 = self;
    uint64_t v5 = 1;
    uint64_t v6 = v7;
  }
  [(PBUIWallpaperConfigurationManager *)v4 safeMigrateWallpaperImageIfNecessaryForVariant:v5 representingVariants:v6 wallpaperMode:v3];
}

- (void)regenerateThumbnailIfNecessaryForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = -[PBUIWallpaperConfigurationManager wallpaperThumbnailImageForVariant:wallpaperMode:](self, "wallpaperThumbnailImageForVariant:wallpaperMode:");
  [v7 scale];
  double v9 = v8;
  [(PBUIWallpaperConfigurationManager *)self wallpaperScale];
  if (v9 != v10)
  {
    uint64_t v11 = PBUILogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      double v12 = PBUIStringForWallpaperVariant(a3);
      [v7 scale];
      uint64_t v14 = v13;
      [(PBUIWallpaperConfigurationManager *)self wallpaperScale];
      int v17 = 138543874;
      double v18 = v12;
      __int16 v19 = 2048;
      uint64_t v20 = v14;
      __int16 v21 = 2048;
      uint64_t v22 = v15;
      _os_log_impl(&dword_1BC4B3000, v11, OS_LOG_TYPE_INFO, "Regenerating thumbnail for variant: %{public}@ (existing thumbnail scale: %f, expected scale: %f)", (uint8_t *)&v17, 0x20u);
    }
    double v16 = [(PBUIWallpaperConfigurationManager *)self wallpaperImageForVariant:a3 wallpaperMode:a4];
    if (v16) {
      [(PBUIWallpaperConfigurationManager *)self setWallpaperThumbnailFromFullsizeImage:v16 forVariant:a3 wallpaperMode:a4];
    }
  }
}

- (void)regenerateThumbnailsIfNecessary
{
  [(PBUIWallpaperConfigurationManager *)self regenerateThumbnailIfNecessaryForVariant:0 wallpaperMode:[(PBUIWallpaperConfigurationManager *)self wallpaperMode]];
  if (![(PBUIWallpaperConfigurationManager *)self variantsShareWallpaperConfiguration])
  {
    int64_t v3 = [(PBUIWallpaperConfigurationManager *)self wallpaperMode];
    [(PBUIWallpaperConfigurationManager *)self regenerateThumbnailIfNecessaryForVariant:1 wallpaperMode:v3];
  }
}

- (void)regenerateStaticWallpaperThumbnailImages
{
  id v4 = [(PBUIWallpaperConfigurationManager *)self wallpaperImageForVariant:0 wallpaperMode:[(PBUIWallpaperConfigurationManager *)self wallpaperMode]];
  if (v4) {
    [(PBUIWallpaperConfigurationManager *)self setWallpaperThumbnailFromFullsizeImage:v4 forVariant:0 wallpaperMode:[(PBUIWallpaperConfigurationManager *)self wallpaperMode]];
  }
  if (![(PBUIWallpaperConfigurationManager *)self variantsShareWallpaperConfigurationForTypes:54])
  {
    int64_t v3 = [(PBUIWallpaperConfigurationManager *)self wallpaperImageForVariant:1 wallpaperMode:[(PBUIWallpaperConfigurationManager *)self wallpaperMode]];
    if (v3) {
      [(PBUIWallpaperConfigurationManager *)self setWallpaperThumbnailFromFullsizeImage:v3 forVariant:1 wallpaperMode:[(PBUIWallpaperConfigurationManager *)self wallpaperMode]];
    }
  }
}

- (id)videoURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [(PBUIWallpaperConfigurationManager *)self dataStores];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) verifiedVideoURLForVariant:a3 wallpaperMode:a4];
        if (v11)
        {
          double v12 = (void *)v11;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  double v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)setVideoURL:(id)a3 forVariant:(int64_t)a4 shoudCrop:(BOOL)a5 relativeCropRect:(CGRect)a6 wallpaperMode:(int64_t)a7
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  BOOL v12 = a5;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  [(PBUIWallpaperConfigurationManager *)self wallpaperWillChangeForVariants:PBUIWallpaperLocationForVariant(a4)];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v16 = [(PBUIWallpaperConfigurationManager *)self dataStores];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v16);
        }
        uint64_t v20 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if ([v20 setOriginalVideoURL:v15 forVariant:a4 wallpaperMode:a7])
        {
          if (v12)
          {
            uint64_t v22 = [v20 verifiedOriginalVideoURLForVariant:a4 wallpaperMode:a7];
            uint64_t v23 = [v20 unverifiedVideoURLForVariant:a4 wallpaperMode:a7];
            dispatch_semaphore_t v24 = dispatch_semaphore_create(0);
            v31[0] = 0;
            v31[1] = v31;
            v31[2] = 0x2020000000;
            char v32 = 0;
            double v25 = [MEMORY[0x1E4F166C8] assetWithURL:v22];
            v28[0] = MEMORY[0x1E4F143A8];
            v28[1] = 3221225472;
            v28[2] = __101__PBUIWallpaperConfigurationManager_setVideoURL_forVariant_shoudCrop_relativeCropRect_wallpaperMode___block_invoke;
            v28[3] = &unk_1E62B2D50;
            float v30 = v31;
            double v26 = v24;
            double v29 = v26;
            -[PBUIWallpaperConfigurationManager saveCroppedVideo:toURL:cropRect:completionHandler:](self, "saveCroppedVideo:toURL:cropRect:completionHandler:", v25, v23, v28, x, y, width, height);

            dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
            _Block_object_dispose(v31, 8);

            char v21 = 1;
          }
          else
          {
            char v21 = [v20 setVideoURL:v15 forVariant:a4 wallpaperMode:a7];
          }
          goto LABEL_13;
        }
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }
  char v21 = 0;
LABEL_13:

  return v21;
}

intptr_t __101__PBUIWallpaperConfigurationManager_setVideoURL_forVariant_shoudCrop_relativeCropRect_wallpaperMode___block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)saveCroppedVideo:(id)a3 toURL:(id)a4 cropRect:(CGRect)a5 completionHandler:(id)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  v63[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a6;
  uint64_t v15 = *MEMORY[0x1E4F15C18];
  id v16 = a4;
  uint64_t v17 = [v13 tracksWithMediaType:v15];
  uint64_t v18 = [v17 firstObject];

  float64x2_t v60 = 0u;
  long long v61 = 0u;
  float64x2_t v59 = 0u;
  if (v18) {
    [v18 preferredTransform];
  }
  [v18 naturalSize];
  long long v41 = v19;
  double v42 = v20;
  float64x2_t v44 = vabsq_f64(vmlaq_n_f64(vmulq_n_f64(v60, v20), v59, *(double *)&v19));
  CGAffineTransformMakeScale(&v58, v44.f64[0], v44.f64[1]);
  v64.origin.CGFloat x = x;
  v64.origin.CGFloat y = y;
  v64.size.CGFloat width = width;
  v64.size.CGFloat height = height;
  CGRect v65 = CGRectApplyAffineTransform(v64, &v58);
  double v21 = v65.origin.x;
  double v22 = v65.origin.y;
  CGFloat v23 = v65.size.width;
  CGFloat v24 = v65.size.height;
  if (v44.f64[0] / v65.size.width >= v44.f64[1] / v65.size.height) {
    double v25 = v44.f64[0] / v65.size.width;
  }
  else {
    double v25 = v44.f64[1] / v65.size.height;
  }
  *(float64x2_t *)&v56.a = v59;
  *(float64x2_t *)&v56.CGFloat c = v60;
  *(_OWORD *)&v56.tCGFloat x = v61;
  memset(&v57, 0, sizeof(v57));
  -[PBUIWallpaperConfigurationManager _naturalPreferredTransform:forNaturalSize:](self, "_naturalPreferredTransform:forNaturalSize:", &v56, *(double *)&v41, v42, v41);
  CGAffineTransform v56 = v57;
  CGAffineTransformInvert(&v55, &v56);
  v66.origin.CGFloat x = v21;
  v66.origin.CGFloat y = v22;
  v66.size.CGFloat width = v23;
  v66.size.CGFloat height = v24;
  CGRect v67 = CGRectApplyAffineTransform(v66, &v55);
  double v26 = v67.origin.x;
  double v27 = v67.origin.y;
  double v28 = v67.size.width;
  double v29 = v67.size.height;
  CGAffineTransform v53 = v57;
  memset(&v56, 0, sizeof(v56));
  CGAffineTransformMakeTranslation(&v56, -v21, -v22);
  memset(&v54, 0, sizeof(v54));
  CGAffineTransformMakeScale(&v54, v25, v25);
  CGAffineTransform t1 = v57;
  CGAffineTransform t2 = v56;
  CGAffineTransformConcat(&v53, &t1, &t2);
  CGAffineTransform t2 = v53;
  CGAffineTransform v50 = v54;
  CGAffineTransformConcat(&t1, &t2, &v50);
  CGAffineTransform v53 = t1;
  float v30 = [MEMORY[0x1E4F165C0] videoCompositionLayerInstructionWithAssetTrack:v18];
  *(_OWORD *)&t1.a = *MEMORY[0x1E4F1FA48];
  long long v43 = *(_OWORD *)&t1.a;
  t1.CGFloat c = *(CGFloat *)(MEMORY[0x1E4F1FA48] + 16);
  CGFloat c = t1.c;
  objc_msgSend(v30, "setCropRectangle:atTime:", &t1, v26, v27, v28, v29);
  CGAffineTransform t1 = v53;
  *(_OWORD *)&t2.a = v43;
  t2.CGFloat c = c;
  [v30 setTransform:&t1 atTime:&t2];
  char v32 = [MEMORY[0x1E4F165B8] videoCompositionInstruction];
  if (v13) {
    [v13 duration];
  }
  else {
    memset(&duration, 0, sizeof(duration));
  }
  *(_OWORD *)&t1.a = v43;
  t1.CGFloat c = c;
  CMTimeRangeMake(&v49, (CMTime *)&t1, &duration);
  [v32 setTimeRange:&v49];
  v63[0] = v30;
  long long v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:1];
  [v32 setLayerInstructions:v33];

  long long v34 = [MEMORY[0x1E4F165B0] videoCompositionWithPropertiesOfAsset:v13];
  [v34 setRenderSize:*(_OWORD *)&v44];
  double v62 = v32;
  long long v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
  [v34 setInstructions:v35];

  long long v36 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v36 removeItemAtURL:v16 error:0];

  id v37 = objc_alloc(MEMORY[0x1E4F16360]);
  uint64_t v38 = (void *)[v37 initWithAsset:v13 presetName:*MEMORY[0x1E4F15700]];
  [v38 setVideoComposition:v34];
  [v38 setOutputURL:v16];

  [v38 setOutputFileType:*MEMORY[0x1E4F15AB0]];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __87__PBUIWallpaperConfigurationManager_saveCroppedVideo_toURL_cropRect_completionHandler___block_invoke;
  v45[3] = &unk_1E62B2D78;
  id v46 = v38;
  id v47 = v14;
  id v39 = v14;
  id v40 = v38;
  [v40 exportAsynchronouslyWithCompletionHandler:v45];
}

void __87__PBUIWallpaperConfigurationManager_saveCroppedVideo_toURL_cropRect_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  if ([*(id *)(a1 + 32) status] == 4)
  {
    int64_t v3 = PBUILogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __87__PBUIWallpaperConfigurationManager_saveCroppedVideo_toURL_cropRect_completionHandler___block_invoke_cold_1(v2);
    }
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, BOOL))(v4 + 16))(v4, [*v2 status] == 3);
  }
}

- (CGAffineTransform)_naturalPreferredTransform:(SEL)a3 forNaturalSize:(CGAffineTransform *)a4
{
  long long v6 = *(_OWORD *)&a4->c;
  *(_OWORD *)&retstr->double a = *(_OWORD *)&a4->a;
  *(_OWORD *)&retstr->double c = v6;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&a4->tx;
  double a = retstr->a;
  double b = retstr->b;
  double c = retstr->c;
  double d = retstr->d;
  if (retstr->a == 1.0 && b == 0.0 && (c == 0.0 ? (BOOL v11 = d == 1.0) : (BOOL v11 = 0), v11))
  {
    retstr->tCGFloat x = 0.0;
    retstr->tCGFloat y = 0.0;
  }
  else
  {
    BOOL v13 = a == 0.0 && b == -1.0 && c == 1.0;
    if (v13 && d == 0.0)
    {
      retstr->tCGFloat x = 0.0;
      retstr->tCGFloat y = a5.width;
    }
    else if (a == -1.0 && b == 0.0 && (c == 0.0 ? (BOOL v14 = d == -1.0) : (BOOL v14 = 0), v14))
    {
      *(CGSize *)&retstr->tCGFloat x = a5;
    }
    else
    {
      BOOL v16 = a == 0.0 && b == 1.0 && c == -1.0;
      if (v16 && d == 0.0)
      {
        retstr->tCGFloat x = a5.height;
        retstr->tCGFloat y = 0.0;
      }
      else
      {
        uint64_t v17 = PBUILogCommon();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[PBUIWallpaperConfigurationManager _naturalPreferredTransform:forNaturalSize:](retstr);
        }

        uint64_t v18 = MEMORY[0x1E4F1DAB8];
        long long v19 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        *(_OWORD *)&retstr->double a = *MEMORY[0x1E4F1DAB8];
        *(_OWORD *)&retstr->double c = v19;
        *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)(v18 + 32);
      }
    }
  }
  return self;
}

- (void)removeVideoForVariants:(int64_t)a3
{
  char v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(PBUIWallpaperConfigurationManager *)self dataStores];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        void v10[2] = __60__PBUIWallpaperConfigurationManager_removeVideoForVariants___block_invoke;
        v10[3] = &unk_1E62B2D28;
        v10[4] = v9;
        PBUIWallpaperEnumerateVariantsForLocations(v3, v10);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

uint64_t __60__PBUIWallpaperConfigurationManager_removeVideoForVariants___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeVideoForVariant:a2];
}

- (Class)proceduralWallpaperClassForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PBUIWallpaperConfigurationManager *)self proceduralWallpaperProvider];
  uint64_t v6 = v5;
  if (v5) {
    [v5 proceduralWallpaperClassForIdentifier:v4];
  }
  else {
  uint64_t v7 = PBUIMagicWallpaperClassForIdentifier(v4);
  }

  return (Class)v7;
}

- (BOOL)isProceduralWallpaperInfoValid:(id)a3
{
  id v4 = [a3 objectForKey:@"kSBUIMagicWallpaperIdentifierKey"];
  if (v4) {
    BOOL v5 = [(PBUIWallpaperConfigurationManager *)self proceduralWallpaperClassForIdentifier:v4] != 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)cleanedProceduralWallpaperInfo:(id)a3
{
  char v3 = (void *)[a3 mutableCopy];
  id v4 = [v3 objectForKeyedSubscript:@"kSBUIMagicWallpaperPresetOptionsKey"];
  BOOL v5 = [v4 objectForKeyedSubscript:@"kSBUIMagicWallpaperThumbnailNameKey"];

  uint64_t v6 = [&unk_1F162C5D0 objectForKeyedSubscript:v5];
  if (v6)
  {
    uint64_t v7 = [v3 objectForKeyedSubscript:@"kSBUIMagicWallpaperPresetOptionsKey"];
    uint64_t v8 = (void *)[v7 mutableCopy];

    [v8 setObject:v6 forKeyedSubscript:@"kSBUIMagicWallpaperThumbnailNameKey"];
    [v3 setObject:v8 forKeyedSubscript:@"kSBUIMagicWallpaperPresetOptionsKey"];
  }
  return v3;
}

- (id)proceduralWallpaperInfoForVariant:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v5 = [(PBUIWallpaperConfigurationManager *)self dataStores];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0;
    long long v11 = v8;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v5);
      }
      uint64_t v8 = [*(id *)(*((void *)&v13 + 1) + 8 * v10) proceduralWallpaperInfoForVariant:a3];

      if (v8)
      {
        if ([(PBUIWallpaperConfigurationManager *)self isProceduralWallpaperInfoValid:v8])
        {
          break;
        }
      }
      ++v10;
      long long v11 = v8;
      if (v7 == v10)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)setProceduralWallpaperIdentifier:(id)a3 options:(id)a4 forVariants:(int64_t)a5
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(PBUIWallpaperConfigurationManager *)self variantsShareWallpaperConfigurationForTypes:54];
  [(PBUIWallpaperConfigurationManager *)self wallpaperWillChangeForVariants:a5];
  v24[0] = @"kSBUIMagicWallpaperIdentifierKey";
  v24[1] = @"kSBUIMagicWallpaperPresetOptionsKey";
  v25[0] = v8;
  v25[1] = v9;
  long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v12 = [(PBUIWallpaperConfigurationManager *)self dataStores];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        if ([*(id *)(*((void *)&v19 + 1) + 8 * i) setProceduralWallpaperInfo:v11 forVariants:a5])
        {

          [(PBUIWallpaperConfigurationManager *)self removeAllDataExceptForType:2 variants:a5 variantsShareWallpaperConfiguration:v10];
          BOOL v17 = 1;
          [(PBUIWallpaperConfigurationManager *)self wallpaperDidChangeForVariants:a5 shouldNotify:1];
          goto LABEL_11;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  BOOL v17 = 0;
LABEL_11:

  return v17;
}

- (void)removeProceduralWallpaperForVariants:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __74__PBUIWallpaperConfigurationManager_removeProceduralWallpaperForVariants___block_invoke;
  v3[3] = &unk_1E62B2DA0;
  v3[4] = self;
  v3[5] = a3;
  PBUIWallpaperEnumerateVariantsForLocations(a3, v3);
}

void __74__PBUIWallpaperConfigurationManager_removeProceduralWallpaperForVariants___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "dataStores", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) removeProceduralWallpaperForVariants:*(void *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)setWallpaperColor:(id)a3 forVariants:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(PBUIWallpaperConfigurationManager *)self variantsShareWallpaperConfigurationForTypes:54];
  [(PBUIWallpaperConfigurationManager *)self wallpaperWillChangeForVariants:a4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v8 = [(PBUIWallpaperConfigurationManager *)self dataStores];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        if ([*(id *)(*((void *)&v15 + 1) + 8 * i) setWallpaperColor:v6 forVariants:a4])
        {

          [(PBUIWallpaperConfigurationManager *)self removeAllDataExceptForType:4 variants:a4 variantsShareWallpaperConfiguration:v7];
          BOOL v13 = 1;
          [(PBUIWallpaperConfigurationManager *)self wallpaperDidChangeForVariants:a4 shouldNotify:1];
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)setWallpaperColorName:(id)a3 forVariants:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(PBUIWallpaperConfigurationManager *)self variantsShareWallpaperConfigurationForTypes:54];
  [(PBUIWallpaperConfigurationManager *)self wallpaperWillChangeForVariants:a4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v8 = [(PBUIWallpaperConfigurationManager *)self dataStores];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        if ([*(id *)(*((void *)&v15 + 1) + 8 * i) setWallpaperColorName:v6 forVariants:a4])
        {

          [(PBUIWallpaperConfigurationManager *)self removeAllDataExceptForType:4 variants:a4 variantsShareWallpaperConfiguration:v7];
          BOOL v13 = 1;
          [(PBUIWallpaperConfigurationManager *)self wallpaperDidChangeForVariants:a4 shouldNotify:1];
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (void)removeWallpaperColorForVariants:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __69__PBUIWallpaperConfigurationManager_removeWallpaperColorForVariants___block_invoke;
  v3[3] = &unk_1E62B2DA0;
  v3[4] = self;
  v3[5] = a3;
  PBUIWallpaperEnumerateVariantsForLocations(a3, v3);
}

void __69__PBUIWallpaperConfigurationManager_removeWallpaperColorForVariants___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "dataStores", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) removeWallpaperColorForVariants:*(void *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)wallpaperColorForVariant:(int64_t)a3 fromDataStore:(id)a4 colorName:(id *)a5
{
  id v7 = a4;
  long long v8 = [v7 wallpaperColorNameForVariant:a3];
  if (!v8)
  {
LABEL_8:
    long long v10 = [v7 wallpaperColorForVariant:a3];
    goto LABEL_9;
  }
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F428B8], "pui_wallpaperColorForName:", v8);
  if (!v9)
  {
    uint64_t v11 = PBUILogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PBUIWallpaperConfigurationManager wallpaperColorForVariant:fromDataStore:colorName:]();
    }

    goto LABEL_8;
  }
  long long v10 = (void *)v9;
  if (a5) {
    *a5 = v8;
  }
LABEL_9:

  return v10;
}

- (BOOL)setWallpaperGradient:(id)a3 forVariants:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(PBUIWallpaperConfigurationManager *)self variantsShareWallpaperConfigurationForTypes:54];
  [(PBUIWallpaperConfigurationManager *)self wallpaperWillChangeForVariants:a4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v8 = [(PBUIWallpaperConfigurationManager *)self dataStores];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        if ([*(id *)(*((void *)&v15 + 1) + 8 * i) setWallpaperGradient:v6 forVariants:a4])
        {

          [(PBUIWallpaperConfigurationManager *)self removeAllDataExceptForType:5 variants:a4 variantsShareWallpaperConfiguration:v7];
          BOOL v13 = 1;
          [(PBUIWallpaperConfigurationManager *)self wallpaperDidChangeForVariants:a4 shouldNotify:1];
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (void)removeWallpaperGradientForVariants:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __72__PBUIWallpaperConfigurationManager_removeWallpaperGradientForVariants___block_invoke;
  v3[3] = &unk_1E62B2DA0;
  v3[4] = self;
  v3[5] = a3;
  PBUIWallpaperEnumerateVariantsForLocations(a3, v3);
}

void __72__PBUIWallpaperConfigurationManager_removeWallpaperGradientForVariants___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "dataStores", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) removeWallpaperGradientForVariants:*(void *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)removeAllDataExceptForType:(int64_t)a3 variants:(int64_t)a4 variantsShareWallpaperConfiguration:(BOOL)a5
{
}

- (void)removeAllDataExceptForTypes:(unint64_t)a3 variants:(int64_t)a4 variantsShareWallpaperConfiguration:(BOOL)a5
{
}

- (void)removeDataForTypes:(unint64_t)a3 variants:(int64_t)a4 variantsShareWallpaperConfiguration:(BOOL)a5
{
  BOOL v5 = a5;
  char v7 = a3;
  if ((a3 & 8) != 0)
  {
    [(PBUIWallpaperConfigurationManager *)self removeVideoForVariants:a4];
    if ((v7 & 2) == 0)
    {
LABEL_3:
      if ((v7 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_3;
  }
  [(PBUIWallpaperConfigurationManager *)self removeWallpaperImagesForVariants:a4 variantsShareWallpaperConfiguration:v5];
  [(PBUIWallpaperConfigurationManager *)self removeWallpaperOptionsForVariants:a4];
  [(PBUIWallpaperConfigurationManager *)self removeWallpaperImageHashDataForVariants:a4];
  if ((v7 & 4) == 0)
  {
LABEL_4:
    if ((v7 & 0x10) == 0) {
      goto LABEL_5;
    }
LABEL_10:
    [(PBUIWallpaperConfigurationManager *)self removeWallpaperColorForVariants:a4];
    if ((v7 & 0x20) == 0) {
      return;
    }
    goto LABEL_11;
  }
LABEL_9:
  [(PBUIWallpaperConfigurationManager *)self removeProceduralWallpaperForVariants:a4];
  if ((v7 & 0x10) != 0) {
    goto LABEL_10;
  }
LABEL_5:
  if ((v7 & 0x20) == 0) {
    return;
  }
LABEL_11:
  [(PBUIWallpaperConfigurationManager *)self removeWallpaperGradientForVariants:a4];
}

- (void)wallpaperWillChangeForVariants:(int64_t)a3
{
}

- (void)wallpaperDidChangeForVariants:(int64_t)a3 shouldNotify:(BOOL)a4
{
  BOOL v4 = a4;
  [(PBUIWallpaperConfigurationManager *)self setCachedVariantsShareWallpaperConfigurationValid:0];
  [(PBUIWallpaperConfigurationManager *)self clearCacheForVariants:a3];
  if (v4)
  {
    if ([(PBUIWallpaperConfigurationManager *)self isInChangeBatch])
    {
      [(PBUIWallpaperConfigurationManager *)self delayNotifyingChangeForVariants:a3];
    }
    else
    {
      [(PBUIWallpaperConfigurationManager *)self notifyDelegateOfChangesToVariants:a3];
    }
  }
}

- (void)notifyDelegateOfChangesToVariants:(int64_t)a3
{
  id v5 = [(PBUIWallpaperConfigurationManager *)self delegate];
  [v5 wallpaperConfigurationManager:self didChangeWallpaperConfigurationForVariants:a3];
}

- (id)getWallpaperLegibilitySettingsForVariant:(int64_t)a3
{
  id v5 = [(PBUIWallpaperConfigurationManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v5 wallpaperConfigurationManager:self legibilitySettingsForVariant:a3];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (CGRect)cropRectForViewPort:(CGRect)a3 portrait:(BOOL)a4 zoomScale:(double)a5 parallaxFactor:(double)a6 forImageSize:(CGSize)a7 contentScaleFactor:(double)a8
{
  double height = a7.height;
  double width = a7.width;
  BOOL v12 = a4;
  double v13 = a3.size.height;
  double v14 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  long long v18 = PBUILogCommon();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BC4B3000, v18, OS_LOG_TYPE_INFO, "//////////PBUIWallpaperCropRectForViewPort//////////", buf, 2u);
  }

  long long v19 = PBUILogCommon();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v68.origin.double x = x;
    v68.origin.double y = y;
    v68.size.double width = v14;
    v68.size.double height = v13;
    NSStringFromCGRect(v68);
    double v20 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 138543362;
    double v64 = v20;
    _os_log_impl(&dword_1BC4B3000, v19, OS_LOG_TYPE_INFO, "viewPort: %{public}@", buf, 0xCu);
  }
  long long v21 = PBUILogCommon();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v64 = a5;
    _os_log_impl(&dword_1BC4B3000, v21, OS_LOG_TYPE_INFO, "zoomScale: %g", buf, 0xCu);
  }

  if (a5 == 0.0
    || (width == *MEMORY[0x1E4F1DB30] ? (BOOL v22 = height == *(double *)(MEMORY[0x1E4F1DB30] + 8)) : (BOOL v22 = 0), v22))
  {
    CGFloat v46 = *MEMORY[0x1E4F1DB28];
    CGFloat v48 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v50 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v52 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    double v23 = width * a5;
    double v24 = height * a5;
    double v25 = PBUILogCommon();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v66.double width = v23;
      v66.double height = v24;
      NSStringFromCGSize(v66);
      double v26 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138543362;
      double v64 = v26;
      _os_log_impl(&dword_1BC4B3000, v25, OS_LOG_TYPE_INFO, "scaledImageSize: %{public}@", buf, 0xCu);
    }
    double v61 = v24;

    [(PBUIWallpaperConfigurationManager *)self wallpaperSize];
    double v28 = v27;
    double v30 = v29;
    int64_t v31 = [(PBUIWallpaperConfigurationManager *)self parallaxDeviceType];
    if (a6 == 0.0) {
      double v32 = 0.0;
    }
    else {
      double v32 = 1.0;
    }
    +[PBUIWallpaperParallaxSettings bestWallpaperSizeForWallpaperSize:deviceType:parallaxFactor:portrait:](PBUIWallpaperParallaxSettings, "bestWallpaperSizeForWallpaperSize:deviceType:parallaxFactor:portrait:", v31, v12, v28, v30, v32, *(void *)&v23);
    double v34 = v33;
    double v36 = v35;
    id v37 = PBUILogCommon();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      v67.double width = v34;
      v67.double height = v36;
      NSStringFromCGSize(v67);
      double v38 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138543362;
      double v64 = v38;
      _os_log_impl(&dword_1BC4B3000, v37, OS_LOG_TYPE_INFO, "bestSize: %{public}@", buf, 0xCu);
    }
    double v39 = (v34 - v14) * 0.5;
    double v40 = (v36 - v13) * 0.5;
    if (v39 >= x) {
      double v39 = x;
    }
    if (v39 >= v60 - (x + v14)) {
      double v39 = v60 - (x + v14);
    }
    if (v40 >= y) {
      double v40 = y;
    }
    if (v40 >= v61 - (y + v13)) {
      double v40 = v61 - (y + v13);
    }
    if (v39 >= 0.0) {
      double v41 = v39;
    }
    else {
      double v41 = 0.0;
    }
    if (v40 >= 0.0) {
      double v42 = v40;
    }
    else {
      double v42 = 0.0;
    }
    long long v43 = PBUILogCommon();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v64 = v41;
      _os_log_impl(&dword_1BC4B3000, v43, OS_LOG_TYPE_INFO, "extraX: %g", buf, 0xCu);
    }

    float64x2_t v44 = PBUILogCommon();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v64 = v42;
      _os_log_impl(&dword_1BC4B3000, v44, OS_LOG_TYPE_INFO, "extraY: %g", buf, 0xCu);
    }

    CGAffineTransformMakeScale(&v62, 1.0 / a8, 1.0 / a8);
    v69.origin.double x = x - v41;
    v69.origin.double y = y - v42;
    v69.size.double width = v14 + v41 * 2.0;
    v69.size.double height = v13 + v42 * 2.0;
    CGRectApplyAffineTransform(v69, &v62);
    UIRectCenteredRect();
    CGFloat v46 = v45;
    CGFloat v48 = v47;
    CGFloat v50 = v49;
    CGFloat v52 = v51;
    CGAffineTransform v53 = PBUILogCommon();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      v70.origin.double x = v46;
      v70.origin.double y = v48;
      v70.size.double width = v50;
      v70.size.double height = v52;
      NSStringFromCGRect(v70);
      double v54 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138543362;
      double v64 = v54;
      _os_log_impl(&dword_1BC4B3000, v53, OS_LOG_TYPE_INFO, "PBUIWallpaperCropRectForViewPort: %{public}@", buf, 0xCu);
    }
    CGAffineTransform v55 = PBUILogCommon();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BC4B3000, v55, OS_LOG_TYPE_INFO, "/////////////////////////", buf, 2u);
    }
  }
  double v56 = v46;
  double v57 = v48;
  double v58 = v50;
  double v59 = v52;
  result.size.double height = v59;
  result.size.double width = v58;
  result.origin.double y = v57;
  result.origin.double x = v56;
  return result;
}

- (CGRect)cropRectForOldCropRect:(CGRect)a3 portrait:(BOOL)a4 zoomScale:(double)a5 oldParallaxFactor:(double)a6 forImageSize:(CGSize)a7 newZoomScale:(double *)a8
{
  double height = a7.height;
  double width = a7.width;
  BOOL v12 = a4;
  CGFloat v13 = a3.size.height;
  CGFloat v14 = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGAffineTransformMakeScale(&v43, a5, a5);
  v44.origin.CGFloat x = x;
  v44.origin.CGFloat y = y;
  v44.size.double width = v14;
  v44.size.double height = v13;
  CGRectApplyAffineTransform(v44, &v43);
  [(PBUIWallpaperConfigurationManager *)self wallpaperSize];
  UIRectCenteredRect();
  -[PBUIWallpaperConfigurationManager cropRectForViewPort:portrait:zoomScale:parallaxFactor:forImageSize:contentScaleFactor:](self, "cropRectForViewPort:portrait:zoomScale:parallaxFactor:forImageSize:contentScaleFactor:", v12, 0x3FF0000000000000);
  CGFloat v18 = v45.origin.x;
  CGFloat v19 = v45.origin.y;
  double v20 = v45.size.width;
  double v21 = v45.size.height;
  double v22 = width * a5;
  double v40 = height * a5;
  double MinX = CGRectGetMinX(v45);
  if (MinX <= -0.0) {
    double v24 = MinX;
  }
  else {
    double v24 = -0.0;
  }
  v46.origin.CGFloat x = v18;
  v46.origin.CGFloat y = v19;
  v46.size.double width = v20;
  v46.size.double height = v21;
  double v25 = CGRectGetMaxX(v46) - v22;
  if (v25 < 0.0) {
    double v25 = 0.0;
  }
  double v26 = v25 - v24;
  v47.origin.CGFloat x = v18;
  v47.origin.CGFloat y = v19;
  v47.size.double width = v20;
  v47.size.double height = v21;
  double MinY = CGRectGetMinY(v47);
  if (MinY <= -0.0) {
    double v28 = -MinY;
  }
  else {
    double v28 = 0.0;
  }
  v48.origin.CGFloat x = v18;
  v48.origin.CGFloat y = v19;
  v48.size.double width = v20;
  v48.size.double height = v21;
  double v29 = CGRectGetMaxY(v48) - v40;
  if (v29 < 0.0) {
    double v29 = 0.0;
  }
  double v30 = (v28 + v29) / v21;
  if (v26 / v20 >= v30) {
    double v30 = v26 / v20;
  }
  double v31 = 1.0 - v30;
  CGAffineTransformMakeScale(&v42, v31, v31);
  v49.origin.CGFloat x = v18;
  v49.origin.CGFloat y = v19;
  v49.size.double width = v20;
  v49.size.double height = v21;
  CGRectApplyAffineTransform(v49, &v42);
  UIRectCenteredIntegralRect();
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  CGFloat v37 = v36;
  CGFloat v39 = v38;
  CGAffineTransformMakeScale(&v41, 1.0 / a5, 1.0 / a5);
  v50.origin.CGFloat x = v33;
  v50.origin.CGFloat y = v35;
  v50.size.double width = v37;
  v50.size.double height = v39;
  CGRect result = CGRectApplyAffineTransform(v50, &v41);
  if (a8) {
    *a8 = 1.0 / v31 * a5;
  }
  return result;
}

- (double)parallaxFactorForCropRect:(CGRect)a3 portrait:(BOOL)a4 forImageSize:(CGSize)a5 zoomScale:(double)a6
{
  double size = a5.height;
  double width = a5.width;
  CGFloat height = a3.size.height;
  CGFloat v9 = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  CGFloat v13 = PBUILogCommon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BC4B3000, v13, OS_LOG_TYPE_INFO, "//////////PBUIWallpaperParallaxFactorForCropRect//////////", buf, 2u);
  }

  CGAffineTransformMakeScale(&v69, a6, a6);
  v75.origin.CGFloat x = x;
  v75.origin.CGFloat y = y;
  v75.size.double width = v9;
  v75.size.CGFloat height = height;
  CGRectApplyAffineTransform(v75, &v69);
  [(PBUIWallpaperConfigurationManager *)self wallpaperSize];
  double v15 = v14;
  double v17 = v16;
  UIRectCenteredRect();
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v66 = v24;
  double v25 = PBUILogCommon();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v73.double width = width;
    v73.CGFloat height = size;
    NSStringFromCGSize(v73);
    double v26 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 138543362;
    double v71 = v26;
    _os_log_impl(&dword_1BC4B3000, v25, OS_LOG_TYPE_INFO, "imageSize %{public}@", buf, 0xCu);
  }
  int64_t v27 = [(PBUIWallpaperConfigurationManager *)self parallaxDeviceType];
  CGFloat v65 = v23;
  if (v23 / width >= v66 / size) {
    double v28 = v23 / width;
  }
  else {
    double v28 = v66 / size;
  }
  +[PBUIWallpaperParallaxSettings minimumWallpaperSizeForWallpaperSize:deviceType:](PBUIWallpaperParallaxSettings, "minimumWallpaperSizeForWallpaperSize:deviceType:", v27, v15, v17);
  double v30 = v29 / width;
  double v32 = v31 / size;
  if (v30 >= v32) {
    double v33 = v30;
  }
  else {
    double v33 = v32;
  }
  double v34 = PBUILogCommon();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v71 = a6;
    _os_log_impl(&dword_1BC4B3000, v34, OS_LOG_TYPE_INFO, "zoomScale %g", buf, 0xCu);
  }

  CGFloat v35 = PBUILogCommon();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v71 = v28;
    _os_log_impl(&dword_1BC4B3000, v35, OS_LOG_TYPE_INFO, "minimumZoomScale %g", buf, 0xCu);
  }

  double v36 = PBUILogCommon();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v71 = v33;
    _os_log_impl(&dword_1BC4B3000, v36, OS_LOG_TYPE_INFO, "minimumZoomScaleForParallax %g", buf, 0xCu);
  }

  double v37 = fmin(fmax((a6 - v28) / (v33 - v28), 0.0), 1.0);
  double v38 = PBUILogCommon();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v71 = v37;
    _os_log_impl(&dword_1BC4B3000, v38, OS_LOG_TYPE_INFO, "zoomFactor %g", buf, 0xCu);
  }
  double v64 = v37;

  +[PBUIWallpaperParallaxSettings overhangSizeForDeviceType:v27];
  double v40 = v39;
  double v67 = v41;
  CGAffineTransform v42 = PBUILogCommon();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    v74.double width = v40;
    v74.CGFloat height = v67;
    NSStringFromCGSize(v74);
    double v43 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 138543362;
    double v71 = v43;
    _os_log_impl(&dword_1BC4B3000, v42, OS_LOG_TYPE_INFO, "overhangSize %{public}@", buf, 0xCu);
  }
  CGFloat v44 = v19;
  double v45 = v19 / v40;
  CGRect v46 = PBUILogCommon();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v71 = v19 / v40;
    _os_log_impl(&dword_1BC4B3000, v46, OS_LOG_TYPE_INFO, "minOffsetXFactor %g", buf, 0xCu);
  }

  CGFloat v47 = v21;
  double v48 = v21 / v67;
  CGRect v49 = PBUILogCommon();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v71 = v21 / v67;
    _os_log_impl(&dword_1BC4B3000, v49, OS_LOG_TYPE_INFO, "minOffsetYFactor %g", buf, 0xCu);
  }
  double v50 = width * a6;
  double v51 = size * a6;

  if (v45 >= v48) {
    double v52 = v48;
  }
  else {
    double v52 = v45;
  }
  double v53 = fmin(fmax(v52, 0.0), 1.0);
  double v54 = PBUILogCommon();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v71 = v53;
    _os_log_impl(&dword_1BC4B3000, v54, OS_LOG_TYPE_INFO, "minOffsetFactor %g", buf, 0xCu);
  }

  v76.origin.CGFloat x = v44;
  v76.origin.CGFloat y = v47;
  v76.size.double width = v65;
  v76.size.CGFloat height = v66;
  double v55 = (v50 - CGRectGetMaxX(v76)) / v40;
  v77.origin.CGFloat x = v44;
  v77.origin.CGFloat y = v47;
  v77.size.double width = v65;
  v77.size.CGFloat height = v66;
  double v56 = (v51 - CGRectGetMaxY(v77)) / v67;
  if (v55 < v56) {
    double v56 = v55;
  }
  double v57 = fmin(fmax(v56, 0.0), 1.0);
  double v58 = PBUILogCommon();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v71 = v57;
    _os_log_impl(&dword_1BC4B3000, v58, OS_LOG_TYPE_INFO, "maxOffsetFactor %g", buf, 0xCu);
  }

  double v59 = v64;
  if (v64 > v53) {
    double v59 = v53;
  }
  if (v59 <= v57) {
    double v60 = v59;
  }
  else {
    double v60 = v57;
  }
  double v61 = PBUILogCommon();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v71 = v60;
    _os_log_impl(&dword_1BC4B3000, v61, OS_LOG_TYPE_INFO, "result: %g", buf, 0xCu);
  }

  CGAffineTransform v62 = PBUILogCommon();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BC4B3000, v62, OS_LOG_TYPE_INFO, "/////////////////////////", buf, 2u);
  }

  return v60;
}

- (void)getBestCropRect:(CGRect *)a3 zoomScale:(double *)a4 forImageSize:(CGSize)a5 portrait:(BOOL)a6 parallaxFactor:(double)a7
{
  BOOL v8 = a6;
  double height = a5.height;
  double width = a5.width;
  +[PBUIWallpaperParallaxSettings minimumZoomScaleForWallpaperSize:parallaxFactor:deviceType:](PBUIWallpaperParallaxSettings, "minimumZoomScaleForWallpaperSize:parallaxFactor:deviceType:", [(PBUIWallpaperConfigurationManager *)self parallaxDeviceType], a5.width, a5.height, a7);
  double v19 = v14;
  -[PBUIWallpaperConfigurationManager cropRectForOldCropRect:portrait:zoomScale:oldParallaxFactor:forImageSize:newZoomScale:](self, "cropRectForOldCropRect:portrait:zoomScale:oldParallaxFactor:forImageSize:newZoomScale:", v8, &v19, 0.0, 0.0, width, height, v14, a7, width, height);
  if (a3)
  {
    a3->origin.CGFloat x = v15;
    a3->origin.CGFloat y = v16;
    a3->size.double width = v17;
    a3->size.double height = v18;
  }
  if (a4) {
    *a4 = v19;
  }
}

- (NSString)description
{
  return (NSString *)[(PBUIWallpaperConfigurationManager *)self descriptionWithMultilinePrefix:@"\t"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(PBUIWallpaperConfigurationManager *)self descriptionBuilderWithMultilinePrefix:a3];
  BOOL v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  BOOL v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = [(PBUIWallpaperConfigurationManager *)self dataStores];
  [v4 appendArraySection:v5 withName:@"dataStores" skipIfEmpty:0];

  [(PBUIWallpaperConfigurationManager *)self wallpaperSize];
  id v6 = (id)objc_msgSend(v4, "appendSize:withName:", @"wallpaperSize");
  [(PBUIWallpaperConfigurationManager *)self wallpaperScale];
  id v7 = (id)objc_msgSend(v4, "appendFloat:withName:", @"wallpaperScale");
  unint64_t v8 = [(PBUIWallpaperConfigurationManager *)self wallpaperSizeType];
  if (v8 > 4) {
    CGFloat v9 = &stru_1F1606C18;
  }
  else {
    CGFloat v9 = (__CFString *)*((void *)&off_1E62B2E10 + v8);
  }
  id v10 = (id)[v4 appendObject:v9 withName:@"wallpaperSizeType"];
  return v4;
}

- (id)succinctDescription
{
  uint64_t v2 = [(PBUIWallpaperConfigurationManager *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (NSArray)dataStores
{
  return self->_dataStores;
}

- (PBUIWallpaperConfigurationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PBUIWallpaperConfigurationManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CGSize)wallpaperSize
{
  double width = self->_wallpaperSize.width;
  double height = self->_wallpaperSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)wallpaperScale
{
  return self->_wallpaperScale;
}

- (int64_t)wallpaperMode
{
  return self->_wallpaperMode;
}

- (void)setWallpaperMode:(int64_t)a3
{
  self->_wallpaperMode = a3;
}

- (BOOL)enableWallpaperDimming
{
  return self->_enableWallpaperDimming;
}

- (void)setEnableWallpaperDimming:(BOOL)a3
{
  self->_enableWallpaperDimming = a3;
}

- (int64_t)wallpaperSizeType
{
  return self->_wallpaperSizeType;
}

- (PBUIProceduralWallpaperProvider)proceduralWallpaperProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proceduralWallpaperProvider);
  return (PBUIProceduralWallpaperProvider *)WeakRetained;
}

- (void)setProceduralWallpaperProvider:(id)a3
{
}

- (void)setMagnifyMode:(id)a3
{
}

- (BOOL)cachedVariantsShareWallpaperConfiguration
{
  return self->_cachedVariantsShareWallpaperConfiguration;
}

- (void)setCachedVariantsShareWallpaperConfiguration:(BOOL)a3
{
  self->_cachedVariantsShareWallpaperConfiguration = a3;
}

- (BOOL)isCachedVariantsShareWallpaperConfigurationValid
{
  return self->_cachedVariantsShareWallpaperConfigurationValid;
}

- (void)setCachedVariantsShareWallpaperConfigurationValid:(BOOL)a3
{
  self->_cachedVariantsShareWallpaperConfigurationValidouble d = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_magnifyMode, 0);
  objc_destroyWeak((id *)&self->_proceduralWallpaperProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataStores, 0);
  objc_storeStrong((id *)&self->_wallpaperImageCache, 0);
}

- (void)wallpaperConfigurationForVariant:(uint64_t)a1 includingValuesForTypes:(uint64_t)a2 wallpaperMode:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = PBUIStringForWallpaperVariant(a2);
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  CGFloat v9 = v5;
  _os_log_debug_impl(&dword_1BC4B3000, a3, OS_LOG_TYPE_DEBUG, "Constructed configuration %@ for variant %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)wallpaperConfigurationForVariant:includingValuesForTypes:wallpaperMode:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_1BC4B3000, v0, v1, "Constructing fallback configuration with black image", v2, v3, v4, v5, v6);
}

- (void)wallpaperConfigurationForVariant:(uint64_t)a1 includingValuesForTypes:(unint64_t)a2 wallpaperMode:(uint64_t)a3 .cold.3(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v11 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  CGFloat v13 = PBUIStringForWallpaperVariant(a1);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a2)
  {
    char v5 = 0;
    do
    {
      if (a2)
      {
        uint64_t v6 = 1 << v5;
        uint64_t v7 = &stru_1F1606C18;
        switch(1 << v5)
        {
          case 1:
            uint64_t v7 = @"static image";
            break;
          case 2:
            uint64_t v7 = @"original static image";
            break;
          case 3:
          case 5:
          case 6:
          case 7:
            break;
          case 4:
            uint64_t v7 = @"thumbnail image";
            break;
          case 8:
            uint64_t v7 = @"thumbnail image data";
            break;
          default:
            if (v6 == 32) {
              __int16 v8 = @"procedural wallpaper instance";
            }
            else {
              __int16 v8 = &stru_1F1606C18;
            }
            if (v6 == 16) {
              uint64_t v7 = @"wallpaper options";
            }
            else {
              uint64_t v7 = v8;
            }
            break;
        }
        objc_msgSend(v4, "addObject:", v7, v11);
      }
      ++v5;
      BOOL v9 = a2 >= 2;
      a2 >>= 1;
    }
    while (v9);
  }
  uint64_t v10 = [v4 componentsJoinedByString:@", ", v11];

  *(_DWORD *)buf = 138543618;
  CGFloat v15 = v13;
  __int16 v16 = 2114;
  CGFloat v17 = v10;
  _os_log_debug_impl(&dword_1BC4B3000, v12, OS_LOG_TYPE_DEBUG, "Get wallpaper configuration for variant: %{public}@ (include: %{public}@)", buf, 0x16u);
}

- (void)_providerForVariant:(uint64_t)a1 lockConfig:homeConfig:.cold.1(uint64_t a1)
{
  uint64_t v1 = PBUIStringForWallpaperVariant(a1);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_1BC4B3000, v2, v3, "failed to determine provider of variant %{public}@", v4, v5, v6, v7, v8);
}

- (void)posterMigrationInfo
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_1BC4B3000, v0, OS_LOG_TYPE_ERROR, "migration info resolved to %{public}@", v1, 0xCu);
}

- (void)restoreDefaultWallpaperForAllVariantsAndNotify:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_1BC4B3000, v0, v1, "Hello NOT iPad, trying to restoreDefaultWallpaperForAllVariantsAndNotify? not today.", v2, v3, v4, v5, v6);
}

- (void)restoreDefaultWallpaperForAllVariantsAndNotify:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1BC4B3000, v0, v1, "restoreDefaultWallpaperForAllVariantsAndNotify:%i", v2, v3, v4, v5, v6);
}

- (void)clearCacheForVariants:memoryOnly:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1BC4B3000, v0, v1, "Clear wallpaper cache (memory only: %{BOOL}u", v2, v3, v4, v5, v6);
}

- (void)performMigrationWithFailureHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_1BC4B3000, v0, v1, "wallpaper migration will not run in SpringBoard with Autobahn enabled.", v2, v3, v4, v5, v6);
}

- (void)performMigrationWithFailureHandler:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_1BC4B3000, v0, v1, "End wallpaper migration", v2, v3, v4, v5, v6);
}

- (void)performMigrationWithFailureHandler:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_1BC4B3000, v0, v1, "Setting home image", v2, v3, v4, v5, v6);
}

- (void)performMigrationWithFailureHandler:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_1BC4B3000, v0, v1, "Setting lock image", v2, v3, v4, v5, v6);
}

- (void)performMigrationWithFailureHandler:.cold.5()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_1BC4B3000, v0, OS_LOG_TYPE_DEBUG, "homeImage: %@", v1, 0xCu);
}

- (void)performMigrationWithFailureHandler:.cold.6()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_1BC4B3000, v0, v1, "Setting shared image", v2, v3, v4, v5, v6);
}

- (void)performMigrationWithFailureHandler:.cold.7()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_1BC4B3000, v0, OS_LOG_TYPE_DEBUG, "lockImage: %@", v1, 0xCu);
}

- (void)performMigrationWithFailureHandler:.cold.8()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1BC4B3000, v0, v1, "lockScreenAndHomeScreenShareWallpaper: %i", v2, v3, v4, v5, v6);
}

- (void)performMigrationWithFailureHandler:.cold.9()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5(&dword_1BC4B3000, v0, v1, "Gradient Lock: %i, Home: %i", v2, v3);
}

- (void)performMigrationWithFailureHandler:.cold.10()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5(&dword_1BC4B3000, v0, v1, "Color Lock: %i, Home: %i", v2, v3);
}

- (void)performMigrationWithFailureHandler:.cold.11()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5(&dword_1BC4B3000, v0, v1, "Procedural Lock: %i, Home: %i", v2, v3);
}

- (void)performMigrationWithFailureHandler:.cold.12()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1BC4B3000, v0, v1, "Old wallpaper files exist: %i", v2, v3, v4, v5, v6);
}

- (void)performMigrationWithFailureHandler:.cold.13()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1BC4B3000, v0, v1, "Home wallpaper exists: %i", v2, v3, v4, v5, v6);
}

- (void)performMigrationWithFailureHandler:.cold.14()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1BC4B3000, v0, v1, "Lock wallpaper exists: %i", v2, v3, v4, v5, v6);
}

- (void)performMigrationWithFailureHandler:.cold.15()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_1BC4B3000, v0, v1, "Start wallpaper migration", v2, v3, v4, v5, v6);
}

- (void)migrateWallpaperOptionsForImageIfNecessaryForVariant:representingVariants:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_1BC4B3000, v0, v1, "End migrating wallpaper options", v2, v3, v4, v5, v6);
}

- (void)migrateWallpaperOptionsForImageIfNecessaryForVariant:representingVariants:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_1BC4B3000, v0, v1, "SpringBoard failed to migrate wallpaper settings -- reverting to previous settings", v2, v3, v4, v5, v6);
}

- (void)migrateWallpaperOptionsForImageIfNecessaryForVariant:representingVariants:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_1BC4B3000, v0, v1, "MARKING shouldCrop AS NO", v2, v3, v4, v5, v6);
}

- (void)migrateWallpaperOptionsForImageIfNecessaryForVariant:representingVariants:.cold.4()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_7();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1BC4B3000, v1, OS_LOG_TYPE_DEBUG, "Setting wallpaper image because options were different: old: %@, new: %@", v2, 0x16u);
}

- (void)migrateWallpaperOptionsForImageIfNecessaryForVariant:(NSObject *)a3 representingVariants:.cold.5(uint64_t a1, uint64_t a2, NSObject *a3)
{
  LOWORD(v3) = 1024;
  HIWORD(v3) = a2;
  OUTLINED_FUNCTION_5(&dword_1BC4B3000, a2, a3, "Setting wallpaper image because magnify modes are different. In magnify mode: %u, wallpaper magnified: %u", 67109376, v3);
}

- (void)migrateWallpaperOptionsForImageIfNecessaryForVariant:(uint64_t)a1 representingVariants:(NSObject *)a2 .cold.6(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = PBUIStringForWallpaperVariant(a1);
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_1BC4B3000, a2, OS_LOG_TYPE_DEBUG, "Migrate wallpaper options for %{public}@", v4, 0xCu);
}

void __87__PBUIWallpaperConfigurationManager_saveCroppedVideo_toURL_cropRect_completionHandler___block_invoke_cold_1(id *a1)
{
  os_log_t v1 = [*a1 error];
  uint64_t v2 = [v1 localizedDescription];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_1BC4B3000, v3, v4, "Failed with error: %{public}@", v5, v6, v7, v8, v9);
}

- (void)_naturalPreferredTransform:(_OWORD *)a1 forNaturalSize:.cold.1(_OWORD *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  long long v1 = a1[1];
  *(_OWORD *)&v9.double a = *a1;
  *(_OWORD *)&v9.double c = v1;
  *(_OWORD *)&v9.tCGFloat x = a1[2];
  uint64_t v2 = NSStringFromCGAffineTransform(&v9);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_1BC4B3000, v3, v4, "naturalPreferredTransform: unrecognized preferred transform (%@). The resulting video may be (part) black\n", v5, v6, v7, v8, LOBYTE(v9.a));
}

- (void)wallpaperColorForVariant:fromDataStore:colorName:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_1BC4B3000, v0, OS_LOG_TYPE_ERROR, "Error retrieving color from user defaults: unknown color name '%{public}@' specified.", v1, 0xCu);
}

@end