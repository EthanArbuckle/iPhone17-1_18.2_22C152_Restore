@interface XBApplicationSnapshot
+ (BOOL)isValidImageFileExtension:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (CGImage)_createCGImageWithPreferredOptions:(id)a3 fromCGImage:(CGImage *)a4;
+ (NSSet)secureCodableCustomExtendedDataClasses;
+ (id)_allSecureCodingClassesIncludingDefaultAndClientSpecified;
+ (id)dataForImage:(id)a3 withFormat:(int64_t)a4;
+ (id)normalizeSnapshotName:(id)a3;
+ (void)setSecureCodableCustomExtendedDataClasses:(id)a3;
- (BOOL)_generateImageIfPossible;
- (BOOL)_hasGenerationContext;
- (BOOL)_isInvalidated;
- (BOOL)_path:(id)a3 isRelativeToPath:(id)a4 outRelativePath:(id *)a5;
- (BOOL)_shouldDeleteFileOnPurge:(id *)a3;
- (BOOL)_synchronized_hasCachedImage:(id *)a3;
- (BOOL)_synchronized_isExpired;
- (BOOL)_validateWithContainerIdentity:(id)a3;
- (BOOL)fileExists;
- (BOOL)hasCachedImage;
- (BOOL)hasFullSizedContent;
- (BOOL)hasProtectedContent;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExpired;
- (BOOL)isFullScreen;
- (BOOL)isImageOpaque;
- (BOOL)isValid;
- (BOOL)isValidWithReason:(id *)a3;
- (CGAffineTransform)imageTransform;
- (CGRect)_referenceBounds;
- (CGRect)contentFrame;
- (CGSize)naturalSize;
- (CGSize)referenceSize;
- (NSDate)creationDate;
- (NSDate)expirationDate;
- (NSDate)lastUsedDate;
- (NSDictionary)extendedData;
- (NSString)_relativePath;
- (NSString)_sortableLaunchInterfaceIdentifier;
- (NSString)_sortableName;
- (NSString)_sortableRequiredOSVersion;
- (NSString)_sortableScheme;
- (NSString)dataProviderClassName;
- (NSString)description;
- (NSString)filename;
- (NSString)groupID;
- (NSString)identifier;
- (NSString)launchInterfaceIdentifier;
- (NSString)logIdentifier;
- (NSString)name;
- (NSString)path;
- (NSString)requiredOSVersion;
- (NSString)scheme;
- (NSString)variantID;
- (XBApplicationSnapshot)init;
- (XBApplicationSnapshot)initWithCoder:(id)a3;
- (XBApplicationSnapshotGenerationContext)generationContext;
- (XBDisplayEdgeInsetsWrapper)customSafeAreaInsets;
- (XBSnapshotContainerIdentity)containerIdentity;
- (XBSnapshotManifestStore)_store;
- (XBStatusBarSettings)_sortableStatusBarSettings;
- (XBStatusBarSettings)statusBarSettings;
- (double)imageScale;
- (id)_cachedImage;
- (id)_configureDefaultPathWithinGroupForFormat:(int64_t)a3;
- (id)_createVariantWithIdentifier:(id)a3;
- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 includeVariants:(BOOL)a4;
- (id)_determineRelativePathForPath:(id)a3 location:(int64_t *)a4;
- (id)_initWithContainerIdentity:(id)a3 store:(id)a4 groupID:(id)a5 generationContext:(id)a6;
- (id)_sanitizedPathForPath:(id)a3;
- (id)cachedImageForInterfaceOrientation:(int64_t)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionForStateCaptureWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)descriptionWithoutVariants;
- (id)imageForInterfaceOrientation:(int64_t)a3;
- (id)imageForInterfaceOrientation:(int64_t)a3 generationOptions:(unint64_t)a4;
- (id)imageGenerator;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)variantWithIdentifier:(id)a3;
- (id)variants;
- (int64_t)_fileLocation;
- (int64_t)backgroundStyle;
- (int64_t)classicMode;
- (int64_t)compatibilityMode;
- (int64_t)contentType;
- (int64_t)fileFormat;
- (int64_t)fileLocation;
- (int64_t)imageOrientation;
- (int64_t)interfaceOrientation;
- (int64_t)userInterfaceStyle;
- (unint64_t)_contentTypeMask;
- (unint64_t)_interfaceOrientationMask;
- (unint64_t)hash;
- (void)_beginPreHeatImageAccess;
- (void)_cacheImage:(id)a3;
- (void)_commonInitWithIdentifier:(id)a3;
- (void)_configureWithPath:(id)a3;
- (void)_endPreHeatImageAccess;
- (void)_invalidate;
- (void)_locked_loadImageViaGenerationContext:(id)a3 options:(unint64_t)a4;
- (void)_locked_loadImageViaGeneratorFunction:(id)a3;
- (void)_locked_synchronized_loadImageViaFile;
- (void)_manifestQueueDecode_setStore:(id)a3;
- (void)_purgeCachedImageIfAppropriate:(BOOL)a3;
- (void)_setFileLocation:(int64_t)a3;
- (void)_setFilename:(id)a3;
- (void)_setHasProtectedContent:(BOOL)a3;
- (void)_setPath:(id)a3;
- (void)_setRelativePath:(id)a3;
- (void)_synchronized_evaluateImageAccessUntilExpirationEnablingIfNecessary:(BOOL)a3;
- (void)beginImageAccess;
- (void)beginImageAccessUntilExpiration;
- (void)clearImageGenerator;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)endImageAccess;
- (void)loadImage;
- (void)loadImageForPreHeat;
- (void)loadImageWithGenerationOptions:(unint64_t)a3;
- (void)purgeImage;
- (void)setBackgroundStyle:(int64_t)a3;
- (void)setClassicMode:(int64_t)a3;
- (void)setCompatibilityMode:(int64_t)a3;
- (void)setContainerIdentity:(id)a3;
- (void)setContentFrame:(CGRect)a3;
- (void)setContentType:(int64_t)a3;
- (void)setCustomSafeAreaInsets:(id)a3;
- (void)setDataProviderClassName:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setExtendedData:(id)a3;
- (void)setFileLocation:(int64_t)a3;
- (void)setFullScreen:(BOOL)a3;
- (void)setImageGeneratingByProvider:(id)a3 withBlockingImageGenerator:(id)a4;
- (void)setImageGenerator:(id)a3;
- (void)setImageOpaque:(BOOL)a3;
- (void)setImageOrientation:(int64_t)a3;
- (void)setImageScale:(double)a3;
- (void)setImageTransform:(CGAffineTransform *)a3;
- (void)setInterfaceOrientation:(int64_t)a3;
- (void)setLastUsedDate:(id)a3;
- (void)setLaunchInterfaceIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setReferenceSize:(CGSize)a3;
- (void)setRequiredOSVersion:(id)a3;
- (void)setScheme:(id)a3;
- (void)setStatusBarSettings:(id)a3;
- (void)setUserInterfaceStyle:(int64_t)a3;
- (void)setVariantID:(id)a3;
- (void)willDeleteVariant:(id)a3;
@end

@implementation XBApplicationSnapshot

- (BOOL)isValidWithReason:(id *)a3
{
  v4 = self;
  objc_sync_enter(v4);
  if ([(XBApplicationSnapshot *)v4 isExpired])
  {
    if (a3)
    {
      v5 = [(XBApplicationSnapshot *)v4 expirationDate];
      v6 = NSString;
      v7 = [MEMORY[0x263EFF910] now];
      [v7 timeIntervalSinceDate:v5];
      *a3 = [v6 stringWithFormat:@"expired. expirationDate: %@; how long ago (seconds): %f", v5, v8];

      BOOL v9 = 0;
LABEL_9:

      goto LABEL_14;
    }
LABEL_13:
    BOOL v9 = 0;
    goto LABEL_14;
  }
  if (![(XBApplicationSnapshot *)v4 hasCachedImage]
    && ![(XBApplicationSnapshot *)v4 _hasGenerationContext])
  {
    v5 = [(XBApplicationSnapshot *)v4 imageGenerator];
    if (v5)
    {
      BOOL v9 = 1;
      goto LABEL_9;
    }
    if (![(XBApplicationSnapshot *)v4 fileExists])
    {
      if (a3)
      {
        v10 = NSString;
        v5 = [(XBApplicationSnapshot *)v4 path];
        [v10 stringWithFormat:@"no cached image. no generation context. no image generator. no file at path: %@", v5];
        BOOL v9 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      goto LABEL_13;
    }
  }
  BOOL v9 = 1;
LABEL_14:
  objc_sync_exit(v4);

  return v9;
}

- (BOOL)isExpired
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(XBApplicationSnapshot *)v2 _synchronized_isExpired];
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)_synchronized_isExpired
{
  expirationDate = self->_expirationDate;
  if (expirationDate)
  {
    BOOL v3 = [MEMORY[0x263EFF910] date];
    LODWORD(expirationDate) = [(NSDate *)expirationDate isAfterDate:v3] ^ 1;
  }
  return (char)expirationDate;
}

- (BOOL)hasCachedImage
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(XBApplicationSnapshot *)v2 _synchronized_hasCachedImage:0];
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)_synchronized_hasCachedImage:(id *)a3
{
  cachedImage = self->_cachedImage;
  if (a3 && cachedImage)
  {
    v6 = NSString;
    unint64_t imageAccessCount = self->_imageAccessCount;
    if (self->_keepImageAccessUntilExpiration) {
      uint64_t v8 = @"YES";
    }
    else {
      uint64_t v8 = @"NO";
    }
    if ([(BSAtomicFlag *)self->_hasProtectedContent getFlag]) {
      BOOL v9 = @"YES";
    }
    else {
      BOOL v9 = @"NO";
    }
    if (self->_keepImageAccessForPreHeat) {
      v10 = @"YES";
    }
    else {
      v10 = @"NO";
    }
    objc_msgSend(v6, "stringWithFormat:", @"_imageAccessCount: %lu; _keepImageAccessUntilExpiration: %@; _hasProtectedContent: %@; _keepImageAccessForPreHeat: %@",
      imageAccessCount,
      v8,
      v9,
      v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return cachedImage != 0;
}

- (id)imageGenerator
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = (void *)MEMORY[0x223CB2F50](v2->_imageGenerator);
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)fileExists
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v3 = [(XBApplicationSnapshot *)self path];
  if (!v3)
  {
LABEL_7:
    BOOL v6 = 0;
    goto LABEL_8;
  }
  v4 = [MEMORY[0x263F08850] defaultManager];
  char v5 = [v4 fileExistsAtPath:v3];

  if ((v5 & 1) == 0)
  {
    v7 = XBLogSnapshot();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [(XBApplicationSnapshot *)self logIdentifier];
      int v10 = 138543618;
      v11 = v8;
      __int16 v12 = 2114;
      v13 = v3;
      _os_log_impl(&dword_2232AB000, v7, OS_LOG_TYPE_INFO, "%{public}@ we have a path but it doesn't exist: %{public}@", (uint8_t *)&v10, 0x16u);
    }
    goto LABEL_7;
  }
  BOOL v6 = 1;
LABEL_8:

  return v6;
}

- (NSString)path
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = (void *)[(NSString *)v2->_path copy];
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (BOOL)_hasGenerationContext
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_generationContext != 0;
  objc_sync_exit(v2);

  return v3;
}

- (NSDate)expirationDate
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_expirationDate;
  objc_sync_exit(v2);

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  [v10 encodeObject:self->_identifier forKey:@"identifier"];
  [v10 encodeObject:self->_name forKey:@"name"];
  [v10 encodeObject:self->_scheme forKey:@"scheme"];
  [v10 encodeObject:self->_variantID forKey:@"variantID"];
  [v10 encodeObject:self->_groupID forKey:@"groupID"];
  [v10 encodeObject:self->_requiredOSVersion forKey:@"requiredOSVersion"];
  [v10 encodeObject:self->_launchInterfaceIdentifier forKey:@"launchInterfaceIdentifier"];
  relativePath = self->_relativePath;
  if (relativePath)
  {
    char v5 = @"relativePath";
  }
  else
  {
    [v10 encodeObject:self->_path forKey:@"path"];
    relativePath = self->_filename;
    char v5 = @"filename";
  }
  [v10 encodeObject:relativePath forKey:v5];
  [v10 encodeInteger:self->_fileLocation forKey:@"fileLocation"];
  [v10 encodeObject:self->_creationDate forKey:@"creationDate"];
  [v10 encodeObject:self->_lastUsedDate forKey:@"lastUsedDate"];
  [v10 encodeObject:self->_expirationDate forKey:@"expirationDate"];
  [v10 encodeInteger:self->_contentType forKey:@"contentType"];
  [v10 encodeBool:self->_fullScreen forKey:@"fullScreen"];
  if (self->_referenceSize.width != *MEMORY[0x263F001B0]
    || self->_referenceSize.height != *(double *)(MEMORY[0x263F001B0] + 8))
  {
    objc_msgSend(v10, "encodeCGSize:forKey:", @"referenceSize");
  }
  if (!CGRectEqualToRect(self->_contentFrame, *MEMORY[0x263F001A8])) {
    objc_msgSend(v10, "encodeCGRect:forKey:", @"contentFrame", self->_contentFrame.origin.x, self->_contentFrame.origin.y, self->_contentFrame.size.width, self->_contentFrame.size.height);
  }
  [v10 encodeInteger:self->_interfaceOrientation forKey:@"interfaceOrientation"];
  [v10 encodeInteger:self->_userInterfaceStyle forKey:@"userInterfaceStyle"];
  [v10 encodeObject:self->_customSafeAreaInsets forKey:@"customSafeAreaInsets"];
  [v10 encodeBool:self->_imageOpaque forKey:@"imageOpaque"];
  [v10 encodeDouble:@"imageScale" forKey:self->_imageScale];
  [v10 encodeObject:self->_statusBarSettings forKey:@"statusBarSettings"];
  BOOL v6 = UIApplicationSceneStringForClassicMode();
  [v10 encodeObject:v6 forKey:@"classicMode"];

  v7 = UIApplicationSceneStringForCompatibilityMode();
  [v10 encodeObject:v7 forKey:@"compatibilityMode"];

  uint64_t v8 = [MEMORY[0x263F1C408] _stringForBackgroundStyle:self->_backgroundStyle];
  [v10 encodeObject:v8 forKey:@"backgroundStyle"];

  BOOL v9 = [(XBApplicationSnapshot *)self extendedData];
  [v10 encodeObject:v9 forKey:@"extendedData"];

  if ([(NSMutableDictionary *)self->_variantsByID count]) {
    [v10 encodeObject:self->_variantsByID forKey:@"variants"];
  }
}

- (NSDictionary)extendedData
{
  return (NSDictionary *)objc_getProperty(self, a2, 296, 1);
}

- (int64_t)contentType
{
  return self->_contentType;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (CGSize)referenceSize
{
  double width = self->_referenceSize.width;
  double height = self->_referenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (XBStatusBarSettings)statusBarSettings
{
  return self->_statusBarSettings;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (NSString)requiredOSVersion
{
  return self->_requiredOSVersion;
}

- (double)imageScale
{
  return self->_imageScale;
}

- (NSString)_sortableName
{
  v2 = [(XBApplicationSnapshot *)self name];
  BOOL v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    FAKE_NIL_PTR();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  char v5 = v4;

  return (NSString *)v5;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)_sortableScheme
{
  v2 = [(XBApplicationSnapshot *)self scheme];
  BOOL v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    FAKE_NIL_PTR();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  char v5 = v4;

  return (NSString *)v5;
}

- (NSString)scheme
{
  return self->_scheme;
}

- (XBDisplayEdgeInsetsWrapper)customSafeAreaInsets
{
  return self->_customSafeAreaInsets;
}

- (id)variants
{
  return (id)[(NSMutableDictionary *)self->_variantsByID allValues];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __56__XBApplicationSnapshot_loadImageWithGenerationOptions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) endImageAccess];
}

- (BOOL)isImageOpaque
{
  return self->_imageOpaque;
}

- (unint64_t)_interfaceOrientationMask
{
  return 1 << [(XBApplicationSnapshot *)self interfaceOrientation];
}

- (CGRect)contentFrame
{
  if (CGRectEqualToRect(self->_contentFrame, *MEMORY[0x263F001A8]))
  {
    [(XBApplicationSnapshot *)self _referenceBounds];
  }
  else
  {
    double x = self->_contentFrame.origin.x;
    double y = self->_contentFrame.origin.y;
    double width = self->_contentFrame.size.width;
    double height = self->_contentFrame.size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)_referenceBounds
{
  MEMORY[0x270F2D1B0](self->_referenceSize.width, self->_referenceSize.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (NSString)variantID
{
  return self->_variantID;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)dealloc
{
  if (self->_imageAccessCount)
  {
    double v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"XBApplicationSnapshot.m", 286, @"Invalid parameter not satisfying: %@", @"_imageAccessCount == 0" object file lineNumber description];
  }
  [(XBApplicationSnapshot *)self _invalidate];
  v5.receiver = self;
  v5.super_class = (Class)XBApplicationSnapshot;
  [(XBApplicationSnapshot *)&v5 dealloc];
}

- (void)_invalidate
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  double v2 = self;
  objc_sync_enter(v2);
  if (!v2->_invalidated)
  {
    v2->_invalidated = 1;
    double v3 = XBLogSnapshot();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      double v4 = [(XBApplicationSnapshot *)v2 logIdentifier];
      int v5 = 138543362;
      BOOL v6 = v4;
      _os_log_impl(&dword_2232AB000, v3, OS_LOG_TYPE_INFO, "%{public}@ Invalidating snapshot", (uint8_t *)&v5, 0xCu);
    }
  }
  *(_WORD *)&v2->_keepImageAccessUntilExpiration = 0;
  objc_sync_exit(v2);

  [(XBApplicationSnapshot *)v2 _purgeCachedImageIfAppropriate:1];
}

- (BOOL)_shouldDeleteFileOnPurge:(id *)a3
{
  uint64_t v5 = XBApplicationSnapshotContentTypeMaskForContentType(self->_contentType) & 3;
  if (a3 && v5)
  {
    unint64_t contentType = self->_contentType;
    if (contentType > 2) {
      uint64_t v7 = @"{!InvalidType!}";
    }
    else {
      uint64_t v7 = off_2646A5DE8[contentType];
    }
    *a3 = [NSString stringWithFormat:@"_contentType: %@(%ld)", v7, self->_contentType];
  }
  return v5 != 0;
}

- (id)cachedImageForInterfaceOrientation:(int64_t)a3
{
  double v4 = self;
  objc_sync_enter(v4);
  if (v4->_cachedImage) {
    uint64_t v5 = [[XBApplicationSnapshotImage alloc] initWithSnapshot:v4 interfaceOrientation:a3];
  }
  else {
    uint64_t v5 = 0;
  }
  objc_sync_exit(v4);

  return v5;
}

- (id)imageForInterfaceOrientation:(int64_t)a3 generationOptions:(unint64_t)a4
{
  [(XBApplicationSnapshot *)self beginImageAccess];
  [(XBApplicationSnapshot *)self loadImageWithGenerationOptions:a4];
  uint64_t v7 = [(XBApplicationSnapshot *)self cachedImageForInterfaceOrientation:a3];
  [(XBApplicationSnapshot *)self endImageAccess];
  return v7;
}

- (void)loadImageWithGenerationOptions:(unint64_t)a3
{
  [(XBApplicationSnapshot *)self beginImageAccess];
  p_loadImageLock = &self->_loadImageLock;
  os_unfair_lock_assert_not_owner(&self->_loadImageLock);
  os_unfair_lock_lock(&self->_loadImageLock);
  BOOL v6 = self;
  objc_sync_enter(v6);
  if (v6->_cachedImage) {
    goto LABEL_2;
  }
  generationContext = v6->_generationContext;
  if (generationContext)
  {
    uint64_t v7 = generationContext;
    goto LABEL_5;
  }
  if (v6->_path)
  {
    [(XBApplicationSnapshot *)v6 _locked_synchronized_loadImageViaFile];
LABEL_2:
    uint64_t v7 = 0;
LABEL_5:
    BOOL v9 = 0;
    goto LABEL_6;
  }
  if (!v6->_imageGenerator) {
    goto LABEL_2;
  }
  BOOL v9 = (void *)MEMORY[0x223CB2F50]();
  uint64_t v7 = 0;
LABEL_6:
  objc_sync_exit(v6);

  if (v7)
  {
    [(XBApplicationSnapshot *)v6 _locked_loadImageViaGenerationContext:v7 options:a3];
  }
  else if (v9)
  {
    [(XBApplicationSnapshot *)v6 _locked_loadImageViaGeneratorFunction:v9];
  }
  os_unfair_lock_unlock(p_loadImageLock);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__XBApplicationSnapshot_loadImageWithGenerationOptions___block_invoke;
  block[3] = &unk_2646A5938;
  block[4] = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)beginImageAccess
{
  obj = self;
  objc_sync_enter(obj);
  ++obj->_imageAccessCount;
  objc_sync_exit(obj);
}

- (void)_locked_synchronized_loadImageViaFile
{
  double v3 = [a1 logIdentifier];
  id v10 = [a2 description];
  OUTLINED_FUNCTION_4(&dword_2232AB000, v4, v5, "Loading image failed file load for %{public}@ : %{public}@", v6, v7, v8, v9, 2u);
}

- (void)endImageAccess
{
  obj = self;
  objc_sync_enter(obj);
  double v3 = obj;
  unint64_t imageAccessCount = obj->_imageAccessCount;
  if (!imageAccessCount)
  {
    uint64_t v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:a2, obj, @"XBApplicationSnapshot.m", 807, @"Invalid parameter not satisfying: %@", @"_imageAccessCount != 0" object file lineNumber description];

    double v3 = obj;
    unint64_t imageAccessCount = obj->_imageAccessCount;
  }
  v3->_unint64_t imageAccessCount = imageAccessCount - 1;
  [(XBApplicationSnapshot *)v3 _purgeCachedImageIfAppropriate:0];
  objc_sync_exit(obj);
}

- (void)_purgeCachedImageIfAppropriate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v4 = self;
  objc_sync_enter(v4);
  if (!v3
    && (v4->_imageAccessCount
     || v4->_keepImageAccessUntilExpiration
     || ([(BSAtomicFlag *)v4->_hasProtectedContent getFlag] & 1) != 0
     || v4->_keepImageAccessForPreHeat))
  {
    if (v4->_cachedImage)
    {
      cachedImageTransaction = XBLogSnapshot();
      if (os_log_type_enabled(cachedImageTransaction, OS_LOG_TYPE_INFO))
      {
        id v13 = [(XBApplicationSnapshot *)v4 logIdentifier];
        unint64_t imageAccessCount = v4->_imageAccessCount;
        BOOL keepImageAccessUntilExpiration = v4->_keepImageAccessUntilExpiration;
        int v16 = [(BSAtomicFlag *)v4->_hasProtectedContent getFlag];
        BOOL keepImageAccessForPreHeat = v4->_keepImageAccessForPreHeat;
        int v18 = 138544642;
        id v19 = v13;
        __int16 v20 = 1024;
        BOOL v21 = 0;
        __int16 v22 = 2048;
        unint64_t v23 = imageAccessCount;
        __int16 v24 = 1024;
        BOOL v25 = keepImageAccessUntilExpiration;
        __int16 v26 = 1024;
        int v27 = v16;
        __int16 v28 = 1024;
        BOOL v29 = keepImageAccessForPreHeat;
        _os_log_impl(&dword_2232AB000, cachedImageTransaction, OS_LOG_TYPE_INFO, "%{public}@ not purging the cached image; force: %d; _imageAccessCount: %lu; _keepImageAccessUntilExpiration: %"
          "d; _hasProtectedContent: %d; _keepImageAccessForPreheat: %d",
          (uint8_t *)&v18,
          0x2Eu);
      }
LABEL_13:
    }
  }
  else if (v4->_cachedImage)
  {
    uint64_t v5 = XBLogSnapshot();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [(XBApplicationSnapshot *)v4 logIdentifier];
      unint64_t v7 = v4->_imageAccessCount;
      BOOL v8 = v4->_keepImageAccessUntilExpiration;
      int v9 = [(BSAtomicFlag *)v4->_hasProtectedContent getFlag];
      BOOL v10 = v4->_keepImageAccessForPreHeat;
      int v18 = 138544642;
      id v19 = v6;
      __int16 v20 = 1024;
      BOOL v21 = v3;
      __int16 v22 = 2048;
      unint64_t v23 = v7;
      __int16 v24 = 1024;
      BOOL v25 = v8;
      __int16 v26 = 1024;
      int v27 = v9;
      __int16 v28 = 1024;
      BOOL v29 = v10;
      _os_log_impl(&dword_2232AB000, v5, OS_LOG_TYPE_INFO, "%{public}@ Purging the cached image; force: %d; _imageAccessCount: %lu; _keepImageAccessUntilExpiration: %d; _ha"
        "sProtectedContent: %d; _keepImageAccessForPreheat: %d",
        (uint8_t *)&v18,
        0x2Eu);
    }
    cachedImage = v4->_cachedImage;
    v4->_cachedImage = 0;

    cachedImageTransaction = v4->_cachedImageTransaction;
    v4->_cachedImageTransaction = 0;
    goto LABEL_13;
  }
  objc_sync_exit(v4);
}

- (NSString)logIdentifier
{
  double v2 = self;
  objc_sync_enter(v2);
  if (v2->_logContainerIdentifierDirty)
  {
    BOOL v3 = [(XBApplicationSnapshot *)v2 containerIdentity];
    uint64_t v4 = v3;
    baseLogIdentifier = v2->_baseLogIdentifier;
    if (v3)
    {
      id v6 = [v3 bundleIdentifier];
      uint64_t v7 = [(NSString *)baseLogIdentifier stringByAppendingFormat:@" [%@]", v6];
      logIdentifier = v2->_logIdentifier;
      v2->_logIdentifier = (NSString *)v7;
    }
    else
    {
      int v9 = baseLogIdentifier;
      id v6 = v2->_logIdentifier;
      v2->_logIdentifier = v9;
    }

    v2->_logContainerIdentifierDirtdouble y = 0;
  }
  BOOL v10 = v2->_logIdentifier;
  objc_sync_exit(v2);

  return v10;
}

- (XBSnapshotContainerIdentity)containerIdentity
{
  return (XBSnapshotContainerIdentity *)objc_getProperty(self, a2, 8, 1);
}

- (void)clearImageGenerator
{
  obj = self;
  objc_sync_enter(obj);
  id imageGenerator = obj->_imageGenerator;
  obj->_id imageGenerator = 0;

  dataProviderClassName = obj->_dataProviderClassName;
  obj->_dataProviderClassName = 0;

  objc_sync_exit(obj);
}

- (id)_cachedImage
{
  double v2 = self;
  objc_sync_enter(v2);
  cachedImage = v2->_cachedImage;
  if (cachedImage) {
    uint64_t v4 = cachedImage;
  }
  objc_sync_exit(v2);

  return cachedImage;
}

+ (id)normalizeSnapshotName:(id)a3
{
  BOOL v3 = [a3 stringByDeletingPathExtension];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 pathExtension];
    uint64_t v6 = [v5 caseInsensitiveCompare:@"png"];

    if (!v6)
    {
      uint64_t v7 = [v4 stringByDeletingPathExtension];

      uint64_t v4 = (void *)v7;
    }
  }
  if (([v4 isEqualToString:@"Default"] & 1) != 0
    || ([v4 isEqualToString:*MEMORY[0x263F1D028]] & 1) != 0)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = v4;
  }

  return v8;
}

- (BOOL)isValid
{
  return [(XBApplicationSnapshot *)self isValidWithReason:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProviderClassName, 0);
  objc_storeStrong(&self->_imageGenerator, 0);
  objc_storeStrong((id *)&self->_customSafeAreaInsets, 0);
  objc_storeStrong((id *)&self->_cachedImageTransaction, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_baseLogIdentifier, 0);
  objc_storeStrong((id *)&self->_hasProtectedContent, 0);
  objc_storeStrong((id *)&self->_extendedData, 0);
  objc_storeStrong((id *)&self->_cachedImage, 0);
  objc_storeStrong((id *)&self->_generationContext, 0);
  objc_storeStrong((id *)&self->_statusBarSettings, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_lastUsedDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_relativePath, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_requiredOSVersion, 0);
  objc_storeStrong((id *)&self->_scheme, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_launchInterfaceIdentifier, 0);
  objc_storeStrong((id *)&self->_variantID, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_variantsByID, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_containerIdentity, 0);
}

- (unint64_t)hash
{
  BOOL v3 = [MEMORY[0x263F3F670] builder];
  uint64_t v4 = [v3 appendObject:self->_identifier];
  uint64_t v5 = [v4 appendObject:self->_variantID];
  uint64_t v6 = [v5 appendObject:self->_groupID];
  unint64_t v7 = [v6 hash];

  return v7;
}

uint64_t __33__XBApplicationSnapshot_isEqual___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 40) identifier];
  uint64_t v2 = BSEqualStrings();

  return v2;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (XBApplicationSnapshot *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263F3F668] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __33__XBApplicationSnapshot_isEqual___block_invoke;
    v16[3] = &unk_2646A5D50;
    v16[4] = self;
    v17 = v4;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __33__XBApplicationSnapshot_isEqual___block_invoke_2;
    v14[3] = &unk_2646A5D50;
    v14[4] = self;
    uint64_t v6 = v17;
    v15 = v6;
    unint64_t v7 = (void *)MEMORY[0x223CB2F50](v14);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __33__XBApplicationSnapshot_isEqual___block_invoke_3;
    v12[3] = &unk_2646A5D50;
    v12[4] = self;
    id v13 = v6;
    id v8 = (void *)MEMORY[0x223CB2F50](v12);
    int v9 = objc_msgSend(v5, "appendEqualsBlocks:", v16, v7, v8, 0);
    char v10 = [v9 isEqual];
  }
  return v10;
}

- (void)_commonInitWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (BSAtomicFlag *)objc_opt_new();
  hasProtectedContent = self->_hasProtectedContent;
  self->_hasProtectedContent = v5;

  self->_logContainerIdentifierDirtdouble y = 1;
  self->_loadImageLock._os_unfair_lock_opaque = 0;
  unint64_t v7 = (NSString *)[v4 copy];

  identifier = self->_identifier;
  self->_identifier = v7;

  int v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  variantsByID = self->_variantsByID;
  self->_variantsByID = v9;

  self->_logContainerIdentifierDirtdouble y = 1;
  v11 = NSString;
  __int16 v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = [(NSString *)self->_identifier componentsSeparatedByString:@"-"];
  uint64_t v14 = [v13 lastObject];
  v15 = [v11 stringWithFormat:@"<%@: %p; …%@>", v17, self, v14];
  baseLogIdentifier = self->_baseLogIdentifier;
  self->_baseLogIdentifier = v15;
}

- (XBApplicationSnapshot)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"XBApplicationSnapshot.m" lineNumber:258 description:@"don't do that"];

  return (XBApplicationSnapshot *)[(XBApplicationSnapshot *)self _initWithContainerIdentity:0 store:0 groupID:0 generationContext:0];
}

- (id)_initWithContainerIdentity:(id)a3 store:(id)a4 groupID:(id)a5 generationContext:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_8:
    __int16 v26 = [MEMORY[0x263F08690] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"XBApplicationSnapshot.m", 264, @"Invalid parameter not satisfying: %@", @"store" object file lineNumber description];

    if (v13) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  BOOL v25 = [MEMORY[0x263F08690] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"XBApplicationSnapshot.m", 263, @"Invalid parameter not satisfying: %@", @"containerIdentity" object file lineNumber description];

  if (!v12) {
    goto LABEL_8;
  }
LABEL_3:
  if (v13) {
    goto LABEL_4;
  }
LABEL_9:
  int v27 = [MEMORY[0x263F08690] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"XBApplicationSnapshot.m", 265, @"Invalid parameter not satisfying: %@", @"groupID" object file lineNumber description];

LABEL_4:
  v28.receiver = self;
  v28.super_class = (Class)XBApplicationSnapshot;
  v15 = [(XBApplicationSnapshot *)&v28 init];
  if (v15)
  {
    int v16 = [MEMORY[0x263F08C38] UUID];
    id v17 = [v16 UUIDString];
    [(XBApplicationSnapshot *)v15 _commonInitWithIdentifier:v17];

    uint64_t v18 = [v11 copy];
    containerIdentitdouble y = v15->_containerIdentity;
    v15->_containerIdentitdouble y = (XBSnapshotContainerIdentity *)v18;

    objc_storeStrong((id *)&v15->_store, a4);
    uint64_t v20 = [v13 copy];
    groupID = v15->_groupID;
    v15->_groupID = (NSString *)v20;

    __int16 v22 = (NSDate *)objc_alloc_init(MEMORY[0x263EFF910]);
    creationDate = v15->_creationDate;
    v15->_creationDate = v22;

    v15->_imageScale = 0.0;
    v15->_imageOrientation = 0;
    v15->_interfaceOrientation = 0;
    v15->_userInterfaceStyle = 0;
    v15->_imageOpaque = 1;
    objc_storeStrong((id *)&v15->_generationContext, a6);
    v15->_fileFormat = -1;
  }

  return v15;
}

- (NSString)description
{
  return (NSString *)[(XBApplicationSnapshot *)self descriptionWithMultilinePrefix:0];
}

uint64_t __33__XBApplicationSnapshot_isEqual___block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 40) variantID];
  uint64_t v2 = BSEqualStrings();

  return v2;
}

uint64_t __33__XBApplicationSnapshot_isEqual___block_invoke_3(uint64_t a1)
{
  v1 = [*(id *)(a1 + 40) groupID];
  uint64_t v2 = BSEqualStrings();

  return v2;
}

+ (NSSet)secureCodableCustomExtendedDataClasses
{
  uint64_t v2 = (void *)[(id)__clientSpecifiedSecureCodableCustomExtendedDataClasses copy];
  return (NSSet *)v2;
}

+ (void)setSecureCodableCustomExtendedDataClasses:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (([v10 conformsToProtocol:&unk_26D6677B8] & 1) == 0)
        {
          id v11 = [MEMORY[0x263F08690] currentHandler];
          [v11 handleFailureInMethod:a2, a1, @"XBApplicationSnapshot.m", 352, @"Extended data client class '%@' does not conform to NSSecureCoding", v10 object file lineNumber description];
        }
        if (([v10 supportsSecureCoding] & 1) == 0)
        {
          id v12 = [MEMORY[0x263F08690] currentHandler];
          [v12 handleFailureInMethod:a2, a1, @"XBApplicationSnapshot.m", 353, @"Extended data client class '%@' does not support NSSecureCoding", v10 object file lineNumber description];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  uint64_t v13 = [v5 copy];
  id v14 = (void *)__clientSpecifiedSecureCodableCustomExtendedDataClasses;
  __clientSpecifiedSecureCodableCustomExtendedDataClasses = v13;
}

+ (id)_allSecureCodingClassesIncludingDefaultAndClientSpecified
{
  uint64_t v2 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  id v12 = objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  if (__clientSpecifiedSecureCodableCustomExtendedDataClasses)
  {
    id v13 = (id)__clientSpecifiedSecureCodableCustomExtendedDataClasses;
  }
  else
  {
    id v13 = [MEMORY[0x263EFFA08] set];
  }
  id v14 = v13;
  [v12 unionSet:v13];

  return v12;
}

+ (BOOL)isValidImageFileExtension:(id)a3
{
  return XBApplicationSnapshotOnDiskFormatForFileExtension(a3) != -1;
}

- (int64_t)_fileLocation
{
  return self->_fileLocation;
}

- (void)_setFileLocation:(int64_t)a3
{
  self->_fileLocation = a3;
}

- (void)setExpirationDate:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v5 = (NSDate *)a3;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  if (v6->_expirationDate != v5)
  {
    if (v5)
    {
      uint64_t v7 = XBLogSnapshot();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = [(XBApplicationSnapshot *)v6 logIdentifier];
        int v10 = 138543618;
        uint64_t v11 = v8;
        __int16 v12 = 2114;
        id v13 = v5;
        _os_log_impl(&dword_2232AB000, v7, OS_LOG_TYPE_INFO, "%{public}@ Set expiration date to %{public}@", (uint8_t *)&v10, 0x16u);
      }
    }
    else
    {
      uint64_t v7 = XBLogSnapshot();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = [(XBApplicationSnapshot *)v6 logIdentifier];
        int v10 = 138543362;
        uint64_t v11 = v9;
        _os_log_impl(&dword_2232AB000, v7, OS_LOG_TYPE_INFO, "%{public}@ Clearing expiration date", (uint8_t *)&v10, 0xCu);
      }
    }

    objc_storeStrong((id *)&v6->_expirationDate, a3);
  }
  [(XBApplicationSnapshot *)v6 _synchronized_evaluateImageAccessUntilExpirationEnablingIfNecessary:0];
  objc_sync_exit(v6);
}

- (id)_sanitizedPathForPath:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v6 = [v5 fileSystemRepresentationWithPath:v4];

    id v7 = [NSString stringWithCString:v6 encoding:4];
  }
  else
  {
    uint64_t v8 = XBLogSnapshot();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [(XBApplicationSnapshot *)self logIdentifier];
      int v12 = 138543618;
      id v13 = v9;
      __int16 v14 = 2114;
      id v15 = v4;
      _os_log_impl(&dword_2232AB000, v8, OS_LOG_TYPE_INFO, "%{public}@ received an empty or nil path for _sanitizedPathForPath: %{public}@. That's weird.", (uint8_t *)&v12, 0x16u);
    }
    id v7 = v4;
  }
  int v10 = v7;

  return v10;
}

- (void)_setPath:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (![(NSString *)v5->_path isEqualToString:v4])
  {
    uint64_t v6 = XBLogSnapshot();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [(XBApplicationSnapshot *)v5 logIdentifier];
      int v10 = 138543618;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      id v13 = v4;
      _os_log_impl(&dword_2232AB000, v6, OS_LOG_TYPE_INFO, "%{public}@ Sanitizing new path before set %{public}@", (uint8_t *)&v10, 0x16u);
    }
    uint64_t v8 = [(XBApplicationSnapshot *)v5 _sanitizedPathForPath:v4];
    path = v5->_path;
    v5->_path = (NSString *)v8;
  }
  objc_sync_exit(v5);
}

- (void)_setRelativePath:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (![(NSString *)v5->_relativePath isEqualToString:v4])
  {
    uint64_t v6 = XBLogSnapshot();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [(XBApplicationSnapshot *)v5 logIdentifier];
      int v10 = 138543618;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      id v13 = v4;
      _os_log_impl(&dword_2232AB000, v6, OS_LOG_TYPE_INFO, "%{public}@ Sanitizing new relativePath before set %{public}@", (uint8_t *)&v10, 0x16u);
    }
    uint64_t v8 = [(XBApplicationSnapshot *)v5 _sanitizedPathForPath:v4];
    relativePath = v5->_relativePath;
    v5->_relativePath = (NSString *)v8;
  }
  objc_sync_exit(v5);
}

- (NSString)filename
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)[(NSString *)v2->_filename copy];
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (BOOL)hasProtectedContent
{
  return [(BSAtomicFlag *)self->_hasProtectedContent getFlag];
}

- (CGSize)naturalSize
{
  uint64_t v2 = 144;
  if ((unint64_t)(self->_interfaceOrientation - 3) >= 2) {
    uint64_t v3 = 144;
  }
  else {
    uint64_t v3 = 152;
  }
  if ((unint64_t)(self->_interfaceOrientation - 3) >= 2) {
    uint64_t v2 = 152;
  }
  double v4 = *(double *)((char *)&self->super.isa + v2);
  double v5 = *(double *)((char *)&self->super.isa + v3);
  result.double height = v4;
  result.double width = v5;
  return result;
}

- (void)setContentFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (CGRectEqualToRect(a3, *MEMORY[0x263F001A8]))
  {
    uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"XBApplicationSnapshot.m" lineNumber:525 description:@"invalid content frame set by client"];
  }
  self->_contentFrame.origin.CGFloat x = x;
  self->_contentFrame.origin.CGFloat y = y;
  self->_contentFrame.size.CGFloat width = width;
  self->_contentFrame.size.CGFloat height = height;
}

- (void)setReferenceSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  if (a3.width == *MEMORY[0x263F001B0] && a3.height == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"XBApplicationSnapshot.m" lineNumber:530 description:@"invalid reference size set by client"];
  }
  self->_referenceSize.CGFloat width = width;
  self->_referenceSize.CGFloat height = height;
}

- (BOOL)hasFullSizedContent
{
  [(XBApplicationSnapshot *)self _referenceBounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(XBApplicationSnapshot *)self contentFrame];
  v19.origin.CGFloat x = v4;
  v19.origin.CGFloat y = v6;
  v19.size.CGFloat width = v8;
  v19.size.CGFloat height = v10;
  CGRect v18 = CGRectIntersection(v17, v19);
  CGFloat v11 = v4;
  CGFloat v12 = v6;
  CGFloat v13 = v8;
  CGFloat v14 = v10;
  return CGRectEqualToRect(v18, *(CGRect *)&v11);
}

- (id)variantWithIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_variantsByID objectForKey:a3];
}

- (void)willDeleteVariant:(id)a3
{
  id v6 = a3;
  CGFloat v4 = self;
  objc_sync_enter(v4);
  double v5 = [(NSMutableDictionary *)v4->_variantsByID allKeysForObject:v6];
  [(NSMutableDictionary *)v4->_variantsByID removeObjectsForKeys:v5];

  objc_sync_exit(v4);
}

- (id)imageForInterfaceOrientation:(int64_t)a3
{
  return [(XBApplicationSnapshot *)self imageForInterfaceOrientation:a3 generationOptions:0];
}

- (void)loadImageForPreHeat
{
  [(XBApplicationSnapshot *)self _beginPreHeatImageAccess];
  [(XBApplicationSnapshot *)self loadImage];
  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__XBApplicationSnapshot_loadImageForPreHeat__block_invoke;
  block[3] = &unk_2646A5938;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x263EF83A0], block);
}

uint64_t __44__XBApplicationSnapshot_loadImageForPreHeat__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endPreHeatImageAccess];
}

- (void)loadImage
{
}

- (void)_locked_loadImageViaGenerationContext:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  os_unfair_lock_assert_owner(&self->_loadImageLock);
  double v7 = XBLogSnapshot();
  if (os_signpost_enabled(v7))
  {
    CGFloat v8 = [(XBApplicationSnapshot *)self containerIdentity];
    double v9 = [v8 bundleIdentifier];
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = (uint64_t)v9;
    __int16 v27 = 2114;
    objc_super v28 = @"generationContext";
    _os_signpost_emit_with_name_impl(&dword_2232AB000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SnapshotImageLoading", "BundleIdOverride=%{public, signpost.description:attribute}@ imageSource=%{public, signpost.telemetry:string2}@ enableTelemetry=YES ", buf, 0x16u);
  }
  CGFloat v10 = +[XBLaunchImageProvider sharedInstance];
  id v24 = 0;
  CGFloat v11 = [v10 createLaunchImageGeneratorWithContext:v6 asyncImageData:v4 & 1 error:&v24];
  id v12 = v24;

  CGFloat v13 = self;
  objc_sync_enter(v13);
  if (v11)
  {
    [(XBApplicationSnapshot *)v13 setExpirationDate:0];
    objc_sync_exit(v13);

    CGFloat v14 = XBLogCapture();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[XBApplicationSnapshot _locked_loadImageViaGenerationContext:options:](v13);
    }

    ((void (**)(void, XBApplicationSnapshot *))v11)[2](v11, v13);
    p_super = XBLogCapture();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG)) {
      -[XBApplicationSnapshot _locked_loadImageViaGenerationContext:options:](v13);
    }
  }
  else
  {
    generationContext = v13->_generationContext;
    v13->_generationContext = 0;

    CGRect v17 = [MEMORY[0x263EFF910] distantPast];
    [(XBApplicationSnapshot *)v13 setExpirationDate:v17];

    objc_sync_exit(v13);
    p_super = &v13->super;
  }

  CGRect v18 = v13;
  objc_sync_enter(v18);
  CGRect v19 = v18->_generationContext;
  v18->_generationContext = 0;

  [(XBApplicationSnapshot *)v18 clearImageGenerator];
  objc_sync_exit(v18);

  if (v12
    && ([v12 domain],
        uint64_t v20 = objc_claimAutoreleasedReturnValue(),
        int v21 = [v20 isEqualToString:@"XBLaunchStoryboardErrorDomain"],
        v20,
        v21))
  {
    uint64_t v22 = [v12 code];
  }
  else
  {
    uint64_t v22 = 0;
  }
  unint64_t v23 = XBLogSnapshot();
  if (os_signpost_enabled(v23))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v26 = v22;
    _os_signpost_emit_with_name_impl(&dword_2232AB000, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SnapshotImageLoading", "error=%{public, signpost.telemetry:number1}zu enableTelemetry=YES ", buf, 0xCu);
  }
}

- (void)_locked_loadImageViaGeneratorFunction:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  char v4 = (void (**)(id, XBApplicationSnapshot *))a3;
  os_unfair_lock_assert_owner(&self->_loadImageLock);
  double v5 = XBLogSnapshot();
  if (os_signpost_enabled(v5))
  {
    id v6 = [(XBApplicationSnapshot *)self containerIdentity];
    double v7 = [v6 bundleIdentifier];
    int v13 = 138543618;
    CGFloat v14 = v7;
    __int16 v15 = 2114;
    uint64_t v16 = @"generatorFunction";
    _os_signpost_emit_with_name_impl(&dword_2232AB000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SnapshotImageLoading", "BundleIdOverride=%{public, signpost.description:attribute}@ imageSource=%{public, signpost.telemetry:string2}@ enableTelemetry=YES ", (uint8_t *)&v13, 0x16u);
  }
  CGFloat v8 = XBLogCapture();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[XBApplicationSnapshot _locked_loadImageViaGeneratorFunction:](self);
  }

  v4[2](v4, self);
  double v9 = XBLogCapture();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[XBApplicationSnapshot _locked_loadImageViaGeneratorFunction:](self);
  }

  CGFloat v10 = self;
  objc_sync_enter(v10);
  generationContext = v10->_generationContext;
  v10->_generationContext = 0;

  [(XBApplicationSnapshot *)v10 clearImageGenerator];
  objc_sync_exit(v10);

  id v12 = XBLogSnapshot();
  if (os_signpost_enabled(v12))
  {
    int v13 = 134349056;
    CGFloat v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_2232AB000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SnapshotImageLoading", "error=%{public, signpost.telemetry:number1}zu enableTelemetry=YES ", (uint8_t *)&v13, 0xCu);
  }
}

- (void)purgeImage
{
}

- (void)beginImageAccessUntilExpiration
{
  obj = self;
  objc_sync_enter(obj);
  dispatch_time_t v3 = obj;
  if (!obj->_expirationDate)
  {
    char v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:a2 object:obj file:@"XBApplicationSnapshot.m" lineNumber:775 description:@"Expiration date is required in order to keep alive until expiration."];

    dispatch_time_t v3 = obj;
  }
  if (v3->_invalidated)
  {
    double v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:a2 object:obj file:@"XBApplicationSnapshot.m" lineNumber:776 description:@"Cannot keep alive an image that is already invalidated."];

    dispatch_time_t v3 = obj;
  }
  [(XBApplicationSnapshot *)v3 _synchronized_evaluateImageAccessUntilExpirationEnablingIfNecessary:1];
  objc_sync_exit(obj);
}

- (void)_synchronized_evaluateImageAccessUntilExpirationEnablingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ([(XBApplicationSnapshot *)self _synchronized_isExpired])
  {
    if (self->_keepImageAccessUntilExpiration)
    {
      double v5 = XBLogSnapshot();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        id v6 = [(XBApplicationSnapshot *)self logIdentifier];
        int v9 = 138543362;
        CGFloat v10 = v6;
        _os_log_impl(&dword_2232AB000, v5, OS_LOG_TYPE_INFO, "%{public}@ Dropping image access until expiration because the expiration has already occurred", (uint8_t *)&v9, 0xCu);
      }
      self->_BOOL keepImageAccessUntilExpiration = 0;
      [(XBApplicationSnapshot *)self _purgeCachedImageIfAppropriate:0];
    }
  }
  else if (v3)
  {
    double v7 = XBLogSnapshot();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      CGFloat v8 = [(XBApplicationSnapshot *)self logIdentifier];
      int v9 = 138543362;
      CGFloat v10 = v8;
      _os_log_impl(&dword_2232AB000, v7, OS_LOG_TYPE_INFO, "%{public}@ Keeping image access on until expiration", (uint8_t *)&v9, 0xCu);
    }
    self->_BOOL keepImageAccessUntilExpiration = 1;
  }
}

- (void)_beginPreHeatImageAccess
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL keepImageAccessForPreHeat = 1;
  objc_sync_exit(obj);
}

- (void)_endPreHeatImageAccess
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL keepImageAccessForPreHeat = 0;
  [(XBApplicationSnapshot *)obj _purgeCachedImageIfAppropriate:0];
  objc_sync_exit(obj);
}

- (id)descriptionWithoutVariants
{
  uint64_t v2 = [(XBApplicationSnapshot *)self _descriptionBuilderWithMultilinePrefix:0 includeVariants:0];
  BOOL v3 = [v2 build];

  return v3;
}

- (void)_manifestQueueDecode_setStore:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  double v5 = (XBSnapshotManifestStore *)a3;
  if (self->_store != v5)
  {
    objc_storeStrong((id *)&self->_store, a3);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = [(NSMutableDictionary *)self->_variantsByID allValues];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "_manifestQueueDecode_setStore:", v5);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)setImageGeneratingByProvider:(id)a3 withBlockingImageGenerator:(id)a4
{
  id v6 = (NSString *)a3;
  id v11 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  uint64_t v8 = [v11 copy];
  id imageGenerator = v7->_imageGenerator;
  v7->_id imageGenerator = (id)v8;

  dataProviderClassName = v7->_dataProviderClassName;
  v7->_dataProviderClassName = v6;

  objc_sync_exit(v7);
}

- (BOOL)_path:(id)a3 isRelativeToPath:(id)a4 outRelativePath:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (v8 && ![v7 rangeOfString:v8])
  {
    long long v13 = [v7 substringFromIndex:v9];
    long long v14 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"/"];
    id v11 = [v13 stringByTrimmingCharactersInSet:v14];

    BOOL v10 = 1;
    if (!a5) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  BOOL v10 = 0;
  id v11 = 0;
  if (a5) {
LABEL_4:
  }
    *a5 = v11;
LABEL_5:

  return v10;
}

- (id)_determineRelativePathForPath:(id)a3 location:(int64_t *)a4
{
  id v6 = a3;
  id v7 = [(XBApplicationSnapshot *)self containerIdentity];
  id v8 = [v7 snapshotContainerPathForSnapshot:self];
  id v24 = 0;
  BOOL v9 = [(XBApplicationSnapshot *)self _path:v6 isRelativeToPath:v8 outRelativePath:&v24];
  id v10 = v24;

  if (v9)
  {
    int64_t v11 = 1;
    if (!a4) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  long long v12 = [v7 bundlePath];
  id v23 = v10;
  BOOL v13 = [(XBApplicationSnapshot *)self _path:v6 isRelativeToPath:v12 outRelativePath:&v23];
  id v14 = v23;

  if (v13)
  {
    int64_t v11 = 3;
    id v10 = v14;
    if (a4) {
      goto LABEL_14;
    }
  }
  else
  {
    __int16 v15 = [v7 bundleContainerPath];
    id v22 = v14;
    BOOL v16 = [(XBApplicationSnapshot *)self _path:v6 isRelativeToPath:v15 outRelativePath:&v22];
    id v10 = v22;

    if (v16)
    {
      int64_t v11 = 4;
      if (a4) {
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v17 = [v7 dataContainerPath];
      id v21 = v10;
      BOOL v18 = [(XBApplicationSnapshot *)self _path:v6 isRelativeToPath:v17 outRelativePath:&v21];
      id v19 = v21;

      if (!v18)
      {
        id v10 = v6;

        int64_t v11 = 0;
        if (!a4) {
          goto LABEL_15;
        }
        goto LABEL_14;
      }
      int64_t v11 = 2;
      id v10 = v19;
      if (a4) {
LABEL_14:
      }
        *a4 = v11;
    }
  }
LABEL_15:

  return v10;
}

- (BOOL)_validateWithContainerIdentity:(id)a3
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    v63 = [MEMORY[0x263F08690] currentHandler];
    [v63 handleFailureInMethod:a2, self, @"XBApplicationSnapshot.m", 945, @"Invalid parameter not satisfying: %@", @"containerIdentity" object file lineNumber description];
  }
  id v6 = [(XBApplicationSnapshot *)self containerIdentity];
  char v7 = BSEqualObjects();

  if ((v7 & 1) == 0)
  {
    [(XBApplicationSnapshot *)self setContainerIdentity:v5];
    self->_logContainerIdentifierDirtCGFloat y = 1;
  }
  if (self->_contentType == 1 && !self->_launchInterfaceIdentifier)
  {
    __int16 v15 = XBLogFileManifest();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [(XBApplicationSnapshot *)self logIdentifier];
      uint64_t v17 = (void *)v16;
      unint64_t contentType = self->_contentType;
      if (contentType > 2) {
        id v19 = @"{!InvalidType!}";
      }
      else {
        id v19 = off_2646A5DE8[contentType];
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v71 = v16;
      __int16 v72 = 2114;
      int64_t v73 = (int64_t)v19;
      BOOL v25 = "%{public}@ we're invalid because we don't have a launchInterfaceIdentifier and our content type is: %{public}@";
      goto LABEL_54;
    }
  }
  else
  {
    if (self->_path && !self->_relativePath)
    {
      id v8 = -[XBApplicationSnapshot _determineRelativePathForPath:location:](self, "_determineRelativePathForPath:location:");
      [(XBApplicationSnapshot *)self _setRelativePath:v8];

      BOOL v9 = XBLogFileManifest();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = [(XBApplicationSnapshot *)self logIdentifier];
        int64_t v11 = (void *)v10;
        relativePath = self->_relativePath;
        unint64_t fileLocation = self->_fileLocation;
        if (fileLocation > 4) {
          id v14 = @"(unknown)";
        }
        else {
          id v14 = off_2646A5E00[fileLocation];
        }
        *(_DWORD *)buf = 138543874;
        uint64_t v71 = v10;
        __int16 v72 = 2114;
        int64_t v73 = (int64_t)relativePath;
        __int16 v74 = 2114;
        v75 = v14;
        _os_log_impl(&dword_2232AB000, v9, OS_LOG_TYPE_INFO, "%{public}@ Snapshot migrated snapshot path to %{public}@, relative to %{public}@", buf, 0x20u);
      }
    }
    if (self->_relativePath)
    {
      switch(self->_fileLocation)
      {
        case 0:
          uint64_t v20 = XBLogFileManifest();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            id v21 = [(XBApplicationSnapshot *)self logIdentifier];
            id v23 = self->_relativePath;
            int64_t v22 = self->_fileLocation;
            *(_DWORD *)buf = 138543874;
            uint64_t v71 = (uint64_t)v21;
            __int16 v72 = 2048;
            int64_t v73 = v22;
            __int16 v74 = 2114;
            v75 = (__CFString *)v23;
            _os_log_impl(&dword_2232AB000, v20, OS_LOG_TYPE_INFO, "%{public}@ has fileLocation of %ld\nsetting to newPath: %{public}@", buf, 0x20u);
          }
          __int16 v15 = self->_relativePath;
          break;
        case 1:
          uint64_t v26 = [v5 snapshotContainerPathForSnapshot:self];
          goto LABEL_29;
        case 2:
          uint64_t v26 = [v5 dataContainerPath];
          goto LABEL_29;
        case 3:
          uint64_t v26 = [v5 bundlePath];
          goto LABEL_29;
        case 4:
          uint64_t v26 = [v5 bundleContainerPath];
LABEL_29:
          __int16 v27 = v26;
          if (!v26) {
            goto LABEL_33;
          }
          __int16 v15 = [(__CFString *)v26 stringByAppendingPathComponent:self->_relativePath];
          objc_super v28 = XBLogFileManifest();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            uint64_t v29 = [(XBApplicationSnapshot *)self logIdentifier];
            v31 = self->_relativePath;
            int64_t v30 = self->_fileLocation;
            *(_DWORD *)buf = 138544386;
            uint64_t v71 = (uint64_t)v29;
            __int16 v72 = 2048;
            int64_t v73 = v30;
            __int16 v74 = 2114;
            v75 = v27;
            __int16 v76 = 2114;
            v77 = v31;
            __int16 v78 = 2114;
            v79 = v15;
            _os_log_impl(&dword_2232AB000, v28, OS_LOG_TYPE_INFO, "%{public}@ has fileLocation of %ld\ncalculated rootPath of %{public}@\nrelativePath: %{public}@\nsetting to newPath: %{public}@", buf, 0x34u);
          }
          break;
        default:
LABEL_33:
          __int16 v15 = 0;
          break;
      }
      if ((BSEqualStrings() & 1) == 0)
      {
        [(XBApplicationSnapshot *)self _setPath:v15];
        if (self->_path)
        {
          v32 = XBLogFileManifest();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            v33 = [(XBApplicationSnapshot *)self logIdentifier];
            path = self->_path;
            *(_DWORD *)buf = 138543618;
            uint64_t v71 = (uint64_t)v33;
            __int16 v72 = 2114;
            int64_t v73 = (int64_t)path;
            _os_log_impl(&dword_2232AB000, v32, OS_LOG_TYPE_INFO, "%{public}@ Snapshot rebuilt absolute path to: %{public}@", buf, 0x16u);
          }
        }
      }
      filename = self->_filename;
      if (!filename)
      {
        v36 = [(NSString *)self->_relativePath lastPathComponent];
        v37 = (NSString *)[v36 copy];
        v38 = self->_filename;
        self->_filename = v37;

        filename = self->_filename;
      }
      v39 = [(NSString *)filename pathExtension];
      self->_fileFormat = XBApplicationSnapshotOnDiskFormatForFileExtension(v39);

      if (!self->_identifier || !self->_groupID) {
        goto LABEL_62;
      }
      if (!self->_path) {
        goto LABEL_70;
      }
      if ([(XBApplicationSnapshot *)self isExpired])
      {
LABEL_62:
        if (self->_path)
        {
          id v68 = 0;
          LODWORD(v47) = [(XBApplicationSnapshot *)self _shouldDeleteFileOnPurge:&v68];
          id v48 = v68;
          if (v47)
          {
            v50 = XBLogFileManifest();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              v51 = [(XBApplicationSnapshot *)self logIdentifier];
              v52 = self->_path;
              *(_DWORD *)buf = 138543874;
              uint64_t v71 = (uint64_t)v51;
              __int16 v72 = 2114;
              int64_t v73 = (int64_t)v48;
              __int16 v74 = 2114;
              v75 = (__CFString *)v52;
              _os_log_impl(&dword_2232AB000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@ deleting file on purge because we're invalid.\n\tdeleteReason: %{public}@;\n"
                "\tpath: %{public}@",
                buf,
                0x20u);
            }
            v53 = [MEMORY[0x263F08850] defaultManager];
            v54 = self->_path;
            id v67 = 0;
            char v55 = [v53 removeItemAtPath:v54 error:&v67];
            v47 = (__CFString *)v67;

            if (v55) {
              goto LABEL_75;
            }
            v56 = [(__CFString *)v47 domain];
            if ([v56 isEqualToString:*MEMORY[0x263F07F70]])
            {
              uint64_t v57 = [(__CFString *)v47 code];

              if (v57 == 4)
              {
LABEL_75:

                LOBYTE(v47) = 0;
                goto LABEL_76;
              }
            }
            else
            {
            }
            v58 = XBLogFileManifest();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
            {
              v61 = [(XBApplicationSnapshot *)self logIdentifier];
              v62 = self->_path;
              *(_DWORD *)buf = 138543874;
              uint64_t v71 = (uint64_t)v61;
              __int16 v72 = 2114;
              int64_t v73 = (int64_t)v62;
              __int16 v74 = 2114;
              v75 = v47;
              _os_log_error_impl(&dword_2232AB000, v58, OS_LOG_TYPE_ERROR, "%{public}@ Error deleting file on purge at %{public}@: %{public}@", buf, 0x20u);
            }
            goto LABEL_75;
          }
LABEL_76:
          v59 = (void *)[(NSMutableDictionary *)self->_variantsByID copy];
          v64[0] = MEMORY[0x263EF8330];
          v64[1] = 3221225472;
          v64[2] = __56__XBApplicationSnapshot__validateWithContainerIdentity___block_invoke;
          v64[3] = &unk_2646A5D78;
          id v65 = v5;
          v66 = self;
          [v59 enumerateKeysAndObjectsUsingBlock:v64];

          goto LABEL_77;
        }
LABEL_70:
        LOBYTE(v47) = 0;
        id v48 = 0;
        goto LABEL_76;
      }
      char v69 = 0;
      v40 = [MEMORY[0x263F08850] defaultManager];
      int v41 = [v40 fileExistsAtPath:self->_path isDirectory:&v69];
      if (v69) {
        int v42 = 0;
      }
      else {
        int v42 = v41;
      }

      if ((v42 & 1) != 0 || !v69)
      {
        if (v42)
        {
          id v48 = 0;
          LOBYTE(v47) = 1;
          goto LABEL_76;
        }
        v43 = XBLogFileManifest();
        if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_61;
        }
        v44 = [(XBApplicationSnapshot *)self logIdentifier];
        v49 = self->_path;
        *(_DWORD *)buf = 138543618;
        uint64_t v71 = (uint64_t)v44;
        __int16 v72 = 2114;
        int64_t v73 = (int64_t)v49;
        v46 = "%{public}@ we're invalid because _path doesn't exist: %{public}@";
      }
      else
      {
        v43 = XBLogFileManifest();
        if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
LABEL_61:

          goto LABEL_62;
        }
        v44 = [(XBApplicationSnapshot *)self logIdentifier];
        v45 = self->_path;
        *(_DWORD *)buf = 138543618;
        uint64_t v71 = (uint64_t)v44;
        __int16 v72 = 2114;
        int64_t v73 = (int64_t)v45;
        v46 = "%{public}@ we're invalid because _path is a directory: %{public}@";
      }
      _os_log_impl(&dword_2232AB000, v43, OS_LOG_TYPE_DEFAULT, v46, buf, 0x16u);

      goto LABEL_61;
    }
    __int16 v15 = XBLogFileManifest();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [(XBApplicationSnapshot *)self logIdentifier];
      id v24 = self->_path;
      *(_DWORD *)buf = 138543618;
      uint64_t v71 = (uint64_t)v17;
      __int16 v72 = 2114;
      int64_t v73 = (int64_t)v24;
      BOOL v25 = "%{public}@ we're invalid because we don't have a relativePath. path: %{public}@";
LABEL_54:
      _os_log_impl(&dword_2232AB000, v15, OS_LOG_TYPE_DEFAULT, v25, buf, 0x16u);
    }
  }
  LOBYTE(v47) = 0;
LABEL_77:

  return (char)v47;
}

void __56__XBApplicationSnapshot__validateWithContainerIdentity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (![v6 _validateWithContainerIdentity:*(void *)(a1 + 32)]
    || ([v6 variantID],
        char v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = BSEqualObjects(),
        v7,
        (v8 & 1) == 0))
  {
    BOOL v9 = XBLogFileManifest();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = [*(id *)(a1 + 40) logIdentifier];
      int64_t v11 = [v6 succinctDescription];
      int v12 = 138543874;
      BOOL v13 = v10;
      __int16 v14 = 2114;
      id v15 = v5;
      __int16 v16 = 2114;
      uint64_t v17 = v11;
      _os_log_error_impl(&dword_2232AB000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Found invalid variant. Removing. variantID: %{public}@; variant: %{public}@",
        (uint8_t *)&v12,
        0x20u);
    }
    [*(id *)(*(void *)(a1 + 40) + 24) removeObjectForKey:v5];
  }
}

- (BOOL)_isInvalidated
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL invalidated = v2->_invalidated;
  objc_sync_exit(v2);

  return invalidated;
}

- (id)_createVariantWithIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    id v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"XBApplicationSnapshot.m", 1075, @"Invalid parameter not satisfying: %@", @"variantID" object file lineNumber description];
  }
  if (![(XBApplicationSnapshot *)self _isInvalidated])
  {
    char v8 = [(XBApplicationSnapshot *)self variantWithIdentifier:v5];
    id v6 = v8;
    if (v8)
    {
      if ([v8 isValid])
      {
        __int16 v16 = [MEMORY[0x263F08690] currentHandler];
        [v16 handleFailureInMethod:a2, self, @"XBApplicationSnapshot.m", 1084, @"Invalid parameter not satisfying: %@", @"variant == nil || ![variant isValid]" object file lineNumber description];
      }
      BOOL v9 = XBLogFileManifest();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        goto LABEL_15;
      }
      uint64_t v10 = [(XBApplicationSnapshot *)self logIdentifier];
      *(_DWORD *)buf = 138543874;
      uint64_t v18 = v10;
      __int16 v19 = 2114;
      id v20 = v5;
      __int16 v21 = 2114;
      int64_t v22 = v6;
      int64_t v11 = "[%{public}@] had invalid variant -- overwriting. variantID: %{public}@\n old variant: %{public}@";
      int v12 = v9;
      uint32_t v13 = 32;
    }
    else
    {
      BOOL v9 = XBLogFileManifest();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
LABEL_15:

        id v7 = [[XBApplicationSnapshot alloc] _initWithContainerIdentity:self->_containerIdentity store:self->_store groupID:self->_groupID generationContext:0];
        [v7 setName:self->_name];
        [v7 setScheme:self->_scheme];
        [v7 setVariantID:v5];
        [v7 setRequiredOSVersion:self->_requiredOSVersion];
        [v7 setExpirationDate:0];
        [v7 setContentType:self->_contentType];
        [v7 setLaunchInterfaceIdentifier:self->_launchInterfaceIdentifier];
        [v7 setFullScreen:self->_fullScreen];
        objc_msgSend(v7, "setReferenceSize:", self->_referenceSize.width, self->_referenceSize.height);
        objc_msgSend(v7, "setContentFrame:", self->_contentFrame.origin.x, self->_contentFrame.origin.y, self->_contentFrame.size.width, self->_contentFrame.size.height);
        [v7 setInterfaceOrientation:self->_interfaceOrientation];
        [v7 setUserInterfaceStyle:self->_userInterfaceStyle];
        [v7 setCustomSafeAreaInsets:self->_customSafeAreaInsets];
        [v7 setStatusBarSettings:self->_statusBarSettings];
        [v7 setClassicMode:self->_classicMode];
        [v7 setCompatibilityMode:self->_compatibilityMode];
        [v7 setBackgroundStyle:self->_backgroundStyle];
        [v7 setImageOpaque:self->_imageOpaque];
        [v7 setImageScale:self->_imageScale];
        [v7 setImageOrientation:self->_imageOrientation];
        [(NSMutableDictionary *)self->_variantsByID setObject:v7 forKey:v5];
        goto LABEL_16;
      }
      uint64_t v10 = [(XBApplicationSnapshot *)self logIdentifier];
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v10;
      __int16 v19 = 2114;
      id v20 = v5;
      int64_t v11 = "[%{public}@] creating new variant. variantID: %{public}@";
      int v12 = v9;
      uint32_t v13 = 22;
    }
    _os_log_impl(&dword_2232AB000, v12, OS_LOG_TYPE_INFO, v11, buf, v13);

    goto LABEL_15;
  }
  id v6 = XBLogFileManifest();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[XBApplicationSnapshot _createVariantWithIdentifier:](self);
  }
  id v7 = 0;
LABEL_16:

  return v7;
}

- (id)_configureDefaultPathWithinGroupForFormat:(int64_t)a3
{
  if (self->_filename)
  {
    id v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"XBApplicationSnapshot.m", 1123, @"Invalid parameter not satisfying: %@", @"_filename == nil" object file lineNumber description];
  }
  if (self->_path)
  {
    __int16 v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"XBApplicationSnapshot.m", 1124, @"Invalid parameter not satisfying: %@", @"_path == nil" object file lineNumber description];
  }
  if (self->_relativePath)
  {
    int64_t v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"XBApplicationSnapshot.m", 1125, @"Invalid parameter not satisfying: %@", @"_relativePath == nil" object file lineNumber description];
  }
  id v6 = self;
  objc_sync_enter(v6);
  [(XBApplicationSnapshot *)v6 imageScale];
  if (v7 <= 1.0)
  {
    uint64_t v10 = &stru_26D65DBC8;
  }
  else
  {
    char v8 = NSString;
    [(XBApplicationSnapshot *)v6 imageScale];
    objc_msgSend(v8, "stringWithFormat:", @"@%lux", (unint64_t)v9);
    uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if ((unint64_t)a3 > 3) {
    int64_t v11 = 0;
  }
  else {
    int64_t v11 = off_2646A5E28[a3];
  }
  id v12 = [NSString alloc];
  uint32_t v13 = [(XBApplicationSnapshot *)v6 identifier];
  __int16 v14 = (NSString *)[v12 initWithFormat:@"%@%@.%@", v13, v10, v11];
  filename = self->_filename;
  self->_filename = v14;

  v6->_fileFormat = a3;
  [(XBApplicationSnapshot *)v6 _setRelativePath:self->_filename];
  v6->_unint64_t fileLocation = 1;
  __int16 v16 = [(XBApplicationSnapshot *)v6 containerIdentity];
  uint64_t v17 = [v16 snapshotContainerPathForSnapshot:v6];
  uint64_t v18 = [v17 stringByAppendingPathComponent:self->_filename];
  [(XBApplicationSnapshot *)v6 _setPath:v18];

  objc_sync_exit(v6);
  return [(XBApplicationSnapshot *)v6 path];
}

- (void)_configureWithPath:(id)a3
{
  id v15 = a3;
  if (self->_filename)
  {
    int64_t v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"XBApplicationSnapshot.m", 1140, @"Invalid parameter not satisfying: %@", @"_filename == nil" object file lineNumber description];
  }
  if (self->_path)
  {
    id v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"XBApplicationSnapshot.m", 1141, @"Invalid parameter not satisfying: %@", @"_path == nil" object file lineNumber description];
  }
  if (self->_relativePath)
  {
    uint32_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"XBApplicationSnapshot.m", 1142, @"Invalid parameter not satisfying: %@", @"_relativePath == nil" object file lineNumber description];
  }
  id v5 = self;
  objc_sync_enter(v5);
  [(XBApplicationSnapshot *)v5 _setPath:v15];
  id v6 = [(XBApplicationSnapshot *)v5 _determineRelativePathForPath:v15 location:&v5->_fileLocation];
  [(XBApplicationSnapshot *)v5 _setRelativePath:v6];

  double v7 = [(NSString *)self->_relativePath lastPathComponent];
  char v8 = (NSString *)[v7 copy];
  filename = self->_filename;
  self->_filename = v8;

  uint64_t v10 = [v15 pathExtension];
  if (([(id)objc_opt_class() isValidImageFileExtension:v10] & 1) == 0)
  {
    __int16 v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, v5, @"XBApplicationSnapshot.m", 1149, @"Invalid file extension: %@ for path: %@", v10, v15 object file lineNumber description];
  }
  v5->_fileFormat = XBApplicationSnapshotOnDiskFormatForFileExtension(v10);

  objc_sync_exit(v5);
}

- (void)_cacheImage:(id)a3
{
  char v4 = (UIImage *)a3;
  obj = self;
  objc_sync_enter(obj);
  if (!obj->_cachedImageTransaction)
  {
    uint64_t v5 = os_transaction_create();
    cachedImageTransaction = obj->_cachedImageTransaction;
    obj->_cachedImageTransaction = (OS_os_transaction *)v5;
  }
  [(XBApplicationSnapshot *)obj _purgeCachedImageIfAppropriate:1];
  cachedImage = obj->_cachedImage;
  obj->_cachedImage = v4;

  objc_sync_exit(obj);
}

- (BOOL)_generateImageIfPossible
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id imageGenerator = v2->_imageGenerator;
  if (imageGenerator) {
    char v4 = (void (**)(void, void))[imageGenerator copy];
  }
  else {
    char v4 = 0;
  }
  objc_sync_exit(v2);

  if (v4) {
    ((void (**)(void, XBApplicationSnapshot *))v4)[2](v4, v2);
  }

  return v4 != 0;
}

- (void)_setHasProtectedContent:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  [(BSAtomicFlag *)obj->_hasProtectedContent setFlag:v3];
  if (v3 && !obj->_expirationDate)
  {
    uint64_t v4 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:480.0];
    expirationDate = obj->_expirationDate;
    obj->_expirationDate = (NSDate *)v4;
  }
  objc_sync_exit(obj);
}

+ (id)dataForImage:(id)a3 withFormat:(int64_t)a4
{
  v34[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  double v7 = v6;
  if (a4 == -1) {
    goto LABEL_11;
  }
  char v8 = (UIImage *)v6;
  if (![(UIImage *)v8 CGImage]) {
    goto LABEL_11;
  }
  if (a4 == 3)
  {
    uint64_t v9 = _UIImageJPEGRepresentation();
    goto LABEL_7;
  }
  if (!a4)
  {
    uint64_t v9 = UIImagePNGRepresentation(v8);
LABEL_7:
    Mutable = (__CFData *)v9;
    goto LABEL_12;
  }
  if ((unint64_t)a4 > 2)
  {
LABEL_11:
    Mutable = 0;
  }
  else
  {
    uint64_t v11 = *MEMORY[0x263F0F038];
    v33[0] = *MEMORY[0x263F0EFC0];
    v33[1] = v11;
    v34[0] = &unk_26D665FD8;
    v34[1] = &unk_26D665FF0;
    uint64_t v12 = MEMORY[0x263EFFA88];
    v33[2] = *MEMORY[0x263F0F598];
    v33[3] = @"kCGImageConversionReason";
    v34[2] = MEMORY[0x263EFFA88];
    v34[3] = @"XBApplicationSnapshot";
    uint32_t v13 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:4];
    __int16 v14 = (CGImage *)objc_msgSend(a1, "_createCGImageWithPreferredOptions:fromCGImage:", v13, -[UIImage CGImage](v8, "CGImage"));
    if (a4 == 2)
    {
      uint64_t v15 = *MEMORY[0x263F0F040];
      uint64_t v16 = *MEMORY[0x263F0F048];
      v31[0] = *MEMORY[0x263F0F1B0];
      v31[1] = v16;
      v32[0] = v15;
      v32[1] = v12;
      uint64_t v17 = NSDictionary;
      uint64_t v18 = v32;
      __int16 v19 = v31;
      uint64_t v20 = 2;
    }
    else
    {
      uint64_t v22 = *MEMORY[0x263F0F1B0];
      v29[0] = *MEMORY[0x263F0F078];
      v29[1] = v22;
      uint64_t v23 = *MEMORY[0x263F0F080];
      v30[0] = &unk_26D666008;
      v30[1] = v23;
      v29[2] = *MEMORY[0x263F0F090];
      v30[2] = v12;
      uint64_t v17 = NSDictionary;
      uint64_t v18 = v30;
      __int16 v19 = v29;
      uint64_t v20 = 3;
    }
    CFDictionaryRef v24 = [v17 dictionaryWithObjects:v18 forKeys:v19 count:v20];
    Mutable = CFDataCreateMutable(0, 0);
    BOOL v25 = CGImageDestinationCreateWithData(Mutable, @"com.apple.atx", 1uLL, 0);
    if (!v25
      || (uint64_t v26 = v25,
          CGImageDestinationAddImage(v25, v14, v24),
          BOOL v27 = CGImageDestinationFinalize(v26),
          CFRelease(v26),
          !v27))
    {
      objc_super v28 = XBLogSnapshot();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        +[XBApplicationSnapshot dataForImage:withFormat:]();
      }
    }
    CGImageRelease(v14);
  }
LABEL_12:

  return Mutable;
}

+ (CGImage)_createCGImageWithPreferredOptions:(id)a3 fromCGImage:(CGImage *)a4
{
  id v5 = a3;
  if (a4)
  {
    CGImageGetImageProvider();
    id v6 = (void *)CGImageProviderCopyIOSurface();
    if (!v6 || (double v7 = (CGImage *)CGImageCreateFromIOSurface()) == 0)
    {
      CGImageRetain(a4);
      double v7 = a4;
    }
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (XBApplicationSnapshot)initWithCoder:(id)a3
{
  id v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)XBApplicationSnapshot;
  id v5 = [(XBApplicationSnapshot *)&v56 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x223CB2D30]();
    double v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(XBApplicationSnapshot *)v5 _commonInitWithIdentifier:v7];

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scheme"];
    scheme = v5->_scheme;
    v5->_scheme = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"variantID"];
    variantID = v5->_variantID;
    v5->_variantID = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupID"];
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requiredOSVersion"];
    requiredOSVersion = v5->_requiredOSVersion;
    v5->_requiredOSVersion = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"launchInterfaceIdentifier"];
    launchInterfaceIdentifier = v5->_launchInterfaceIdentifier;
    v5->_launchInterfaceIdentifier = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relativePath"];
    [(XBApplicationSnapshot *)v5 _setRelativePath:v20];

    if (!v5->_relativePath)
    {
      __int16 v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"path"];
      [(XBApplicationSnapshot *)v5 _setPath:v21];

      uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"filename"];
      filename = v5->_filename;
      v5->_filename = (NSString *)v22;
    }
    v5->_unint64_t fileLocation = [v4 decodeIntegerForKey:@"fileLocation"];
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUsedDate"];
    lastUsedDate = v5->_lastUsedDate;
    v5->_lastUsedDate = (NSDate *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v28;

    v5->_unint64_t contentType = [v4 decodeIntegerForKey:@"contentType"];
    v5->_fullScreen = [v4 decodeBoolForKey:@"fullScreen"];
    [v4 decodeCGSizeForKey:@"referenceSize"];
    v5->_referenceSize.CGFloat width = v30;
    v5->_referenceSize.CGFloat height = v31;
    [v4 decodeCGRectForKey:@"contentFrame"];
    v5->_contentFrame.origin.CGFloat x = v32;
    v5->_contentFrame.origin.CGFloat y = v33;
    v5->_contentFrame.size.CGFloat width = v34;
    v5->_contentFrame.size.CGFloat height = v35;
    v5->_interfaceOrientation = [v4 decodeIntegerForKey:@"interfaceOrientation"];
    v5->_userInterfaceStyle = [v4 decodeIntegerForKey:@"userInterfaceStyle"];
    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customSafeAreaInsets"];
    customSafeAreaInsets = v5->_customSafeAreaInsets;
    v5->_customSafeAreaInsets = (XBDisplayEdgeInsetsWrapper *)v36;

    v5->_imageOpaque = [v4 decodeBoolForKey:@"imageOpaque"];
    [v4 decodeDoubleForKey:@"imageScale"];
    v5->_imageScale = v38;
    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statusBarSettings"];
    statusBarSettings = v5->_statusBarSettings;
    v5->_statusBarSettings = (XBStatusBarSettings *)v39;

    int v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"classicMode"];
    v5->_classicMode = UIApplicationSceneClassicModeForString();

    int v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"compatibilityMode"];
    v5->_compatibilityMode = UIApplicationSceneCompatibilityModeForString();

    v43 = (void *)MEMORY[0x263F1C408];
    v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundStyle"];
    v5->_backgroundStyle = [v43 _backgroundStyleForString:v44];

    v45 = +[XBApplicationSnapshot _allSecureCodingClassesIncludingDefaultAndClientSpecified];
    uint64_t v46 = [v4 decodeObjectOfClasses:v45 forKey:@"extendedData"];
    extendedData = v5->_extendedData;
    v5->_extendedData = (NSDictionary *)v46;

    id v48 = (void *)MEMORY[0x263EFFA08];
    uint64_t v49 = objc_opt_class();
    uint64_t v50 = objc_opt_class();
    v51 = objc_msgSend(v48, "setWithObjects:", v49, v50, objc_opt_class(), 0);
    v52 = [v4 decodeObjectOfClasses:v51 forKey:@"variants"];
    if (v52)
    {
      uint64_t v53 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v52];
      variantsByID = v5->_variantsByID;
      v5->_variantsByID = (NSMutableDictionary *)v53;
    }
  }

  return v5;
}

- (id)descriptionForStateCaptureWithMultilinePrefix:(id)a3
{
  id v5 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  double v7 = [(XBApplicationSnapshot *)v6 succinctDescriptionBuilder];
  uint64_t v8 = v7;
  if (v6->_cachedImage)
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __71__XBApplicationSnapshot_descriptionForStateCaptureWithMultilinePrefix___block_invoke;
    v22[3] = &unk_2646A5C10;
    id v23 = v7;
    uint64_t v24 = v6;
    SEL v25 = a2;
    [v23 appendBodySectionWithName:@"Cache" multilinePrefix:v5 block:v22];
  }
  uint64_t v18 = 0;
  __int16 v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  if ([(NSMutableDictionary *)v6->_variantsByID count])
  {
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    uint32_t v13 = __71__XBApplicationSnapshot_descriptionForStateCaptureWithMultilinePrefix___block_invoke_2;
    uint64_t v14 = &unk_2646A5BE8;
    uint64_t v15 = v6;
    id v16 = v8;
    uint64_t v17 = &v18;
    [v16 appendBodySectionWithName:@"Variants" multilinePrefix:v5 block:&v11];
  }
  if (v6->_cachedImage || *((unsigned char *)v19 + 24))
  {
    uint64_t v9 = objc_msgSend(v8, "build", v11, v12, v13, v14, v15);
  }
  else
  {
    uint64_t v9 = 0;
  }
  _Block_object_dispose(&v18, 8);

  objc_sync_exit(v6);
  return v9;
}

void __71__XBApplicationSnapshot_descriptionForStateCaptureWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendPointer:*(void *)(*(void *)(a1 + 40) + 280) withName:@"_cachedImage"];
  BOOL v3 = [*(id *)(*(void *)(a1 + 40) + 280) ioSurface];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 40) + 280) CGImage];
  if (v3)
  {
    id v5 = (id)[*(id *)(a1 + 32) appendPointer:v3 withName:@"IOSurfaceRef"];
    id v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInt64:withName:", objc_msgSend(v3, "allocationSize"), @"allocSize");
  }
  else
  {
    double v7 = (CGImage *)v4;
    if (v4)
    {
      id v8 = (id)[*(id *)(a1 + 32) appendPointer:v4 withName:@"CGImageRef"];
      size_t Height = CGImageGetHeight(v7);
      id v10 = (id)[*(id *)(a1 + 32) appendUInt64:CGImageGetBytesPerRow(v7) * Height withName:@"allocSize"];
    }
  }
  uint64_t v11 = *(void **)(a1 + 40);
  id v15 = 0;
  objc_msgSend(v11, "_synchronized_hasCachedImage:", &v15);
  id v12 = v15;
  if (!v12)
  {
    uint64_t v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 40) file:@"XBApplicationSnapshot.m" lineNumber:1438 description:@"_synchronized_hasCachedImage: isn't giving us a reason even though we have a cached image"];
  }
  id v13 = (id)[*(id *)(a1 + 32) appendObject:v12 withName:@"reason"];
}

void __71__XBApplicationSnapshot_descriptionForStateCaptureWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __71__XBApplicationSnapshot_descriptionForStateCaptureWithMultilinePrefix___block_invoke_3;
  v5[3] = &unk_2646A5DA0;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];
}

void __71__XBApplicationSnapshot_descriptionForStateCaptureWithMultilinePrefix___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 activeMultilinePrefix];
  id v8 = [v6 descriptionForStateCaptureWithMultilinePrefix:v7];

  if (v8)
  {
    id v9 = (id)[*(id *)(a1 + 32) appendObject:v8 withName:v10 skipIfNil:1];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (id)succinctDescription
{
  id v2 = [(XBApplicationSnapshot *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x263F3F658] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_name withName:@"name" skipIfNil:1];
  id v5 = (id)[v3 appendObject:self->_identifier withName:@"identifier" skipIfNil:1];
  id v6 = (id)[v3 appendObject:self->_scheme withName:@"scheme" skipIfNil:1];
  id v7 = (id)[v3 appendObject:self->_launchInterfaceIdentifier withName:@"launchInterfaceIdentifier" skipIfNil:1];
  id v8 = (id)[v3 appendObject:self->_variantID withName:@"variantID" skipIfNil:1];
  id v9 = XBApplicationSnapshotContentTypeDescription(self->_contentType);
  id v10 = (id)[v3 appendObject:v9 withName:@"contentType"];

  id v11 = (id)objc_msgSend(v3, "appendSize:withName:", @"referenceSize", self->_referenceSize.width, self->_referenceSize.height);
  id v12 = XBStringForInterfaceOrientation(self->_interfaceOrientation);
  id v13 = (id)[v3 appendObject:v12 withName:@"interfaceOrientation"];

  uint64_t v14 = XBStringForUserInterfaceStyle(self->_userInterfaceStyle);
  id v15 = (id)[v3 appendObject:v14 withName:@"userInterfaceStyle"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(XBApplicationSnapshot *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return [(XBApplicationSnapshot *)self _descriptionBuilderWithMultilinePrefix:a3 includeVariants:1];
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 includeVariants:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(XBApplicationSnapshot *)self succinctDescriptionBuilder];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __80__XBApplicationSnapshot__descriptionBuilderWithMultilinePrefix_includeVariants___block_invoke;
  v11[3] = &unk_2646A5980;
  id v8 = v7;
  id v12 = v8;
  id v13 = self;
  BOOL v14 = a4;
  [v8 appendBodySectionWithName:0 multilinePrefix:v6 block:v11];

  id v9 = v8;
  return v9;
}

void __80__XBApplicationSnapshot__descriptionBuilderWithMultilinePrefix_includeVariants___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 80) withName:@"requiredOSVersion" skipIfNil:1];
  id v3 = *(void **)(a1 + 32);
  id v4 = [MEMORY[0x263F08790] localizedStringFromDate:*(void *)(*(void *)(a1 + 40) + 120) dateStyle:3 timeStyle:3];
  id v5 = (id)[v3 appendObject:v4 withName:@"creationDate" skipIfNil:1];

  id v6 = *(void **)(a1 + 32);
  id v7 = [MEMORY[0x263F08790] localizedStringFromDate:*(void *)(*(void *)(a1 + 40) + 128) dateStyle:3 timeStyle:3];
  id v8 = (id)[v6 appendObject:v7 withName:@"lastUsedDate" skipIfNil:1];

  id v9 = *(void **)(a1 + 32);
  id v10 = [MEMORY[0x263F08790] localizedStringFromDate:*(void *)(*(void *)(a1 + 40) + 136) dateStyle:3 timeStyle:3];
  id v11 = (id)[v9 appendObject:v10 withName:@"expirationDate" skipIfNil:1];

  id v12 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 307) withName:@"keepsImageAccessUntilExpiration"];
  id v13 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "_hasGenerationContext"), @"hasGenerationContext");
  uint64_t v35 = 0;
  if (!fsctl((const char *)[*(id *)(*(void *)(a1 + 40) + 88) UTF8String], 0x40084A47uLL, &v35, 0))
  {
    if ((v35 & 0x400) != 0)
    {
      id v16 = *(void **)(a1 + 32);
      uint64_t v17 = @"medium";
    }
    else
    {
      BOOL v14 = *(void **)(a1 + 32);
      if ((v35 & 0x800) == 0)
      {
        id v15 = objc_msgSend(NSString, "stringWithFormat:", @"disallowed(%llu)", v35);
        [v14 appendString:v15 withName:@"purge"];

        goto LABEL_8;
      }
      uint64_t v17 = @"high";
      id v16 = *(void **)(a1 + 32);
    }
    [v16 appendString:v17 withName:@"purge"];
  }
LABEL_8:
  uint64_t v18 = *(void **)(a1 + 32);
  __int16 v19 = [v18 activeMultilinePrefix];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  void v32[2] = __80__XBApplicationSnapshot__descriptionBuilderWithMultilinePrefix_includeVariants___block_invoke_2;
  v32[3] = &unk_2646A5BC0;
  id v20 = *(id *)(a1 + 32);
  uint64_t v21 = *(void *)(a1 + 40);
  id v33 = v20;
  uint64_t v34 = v21;
  [v18 appendBodySectionWithName:@"context" multilinePrefix:v19 block:v32];

  uint64_t v22 = *(void **)(a1 + 32);
  id v23 = [v22 activeMultilinePrefix];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __80__XBApplicationSnapshot__descriptionBuilderWithMultilinePrefix_includeVariants___block_invoke_4;
  void v29[3] = &unk_2646A5BC0;
  id v24 = *(id *)(a1 + 32);
  uint64_t v25 = *(void *)(a1 + 40);
  id v30 = v24;
  uint64_t v31 = v25;
  [v22 appendBodySectionWithName:@"imageContext" multilinePrefix:v23 block:v29];

  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) appendDictionarySection:*(void *)(*(void *)(a1 + 40) + 24) withName:@"variants" skipIfEmpty:1];
  }
  uint64_t v26 = *(void **)(a1 + 32);
  BOOL v27 = [*(id *)(a1 + 40) extendedData];
  id v28 = (id)[v26 appendObject:v27 withName:@"extendedData" skipIfNil:1];
}

void __80__XBApplicationSnapshot__descriptionBuilderWithMultilinePrefix_includeVariants___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = XBApplicationSnapshotContentTypeDescription(*(void *)(*(void *)(a1 + 40) + 208));
  id v4 = (id)[v2 appendObject:v3 withName:@"contentType"];

  id v5 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 305) withName:@"fullScreen"];
  id v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendSize:withName:", @"referenceSize", *(double *)(*(void *)(a1 + 40) + 144), *(double *)(*(void *)(a1 + 40) + 152));
  if (!CGRectEqualToRect(*(CGRect *)(*(void *)(a1 + 40) + 160), *MEMORY[0x263F001A8])) {
    id v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendRect:withName:", @"contentFrame", *(double *)(*(void *)(a1 + 40) + 160), *(double *)(*(void *)(a1 + 40) + 168), *(double *)(*(void *)(a1 + 40) + 176), *(double *)(*(void *)(a1 + 40) + 184));
  }
  id v8 = *(void **)(a1 + 32);
  id v9 = XBStringForInterfaceOrientation(*(void *)(*(void *)(a1 + 40) + 192));
  id v10 = (id)[v8 appendObject:v9 withName:@"interfaceOrientation"];

  id v11 = *(void **)(a1 + 32);
  id v12 = XBStringForUserInterfaceStyle(*(void *)(*(void *)(a1 + 40) + 200));
  id v13 = (id)[v11 appendObject:v12 withName:@"userInterfaceStyle"];

  id v14 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 360) withName:@"customSafeAreaInsets" skipIfNil:1];
  id v15 = *(void **)(a1 + 32);
  id v16 = [v15 activeMultilinePrefix];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __80__XBApplicationSnapshot__descriptionBuilderWithMultilinePrefix_includeVariants___block_invoke_3;
  v19[3] = &unk_2646A5BC0;
  id v17 = *(id *)(a1 + 32);
  uint64_t v18 = *(void *)(a1 + 40);
  id v20 = v17;
  uint64_t v21 = v18;
  [v15 appendBodySectionWithName:@"additionalContext" multilinePrefix:v16 block:v19];
}

void __80__XBApplicationSnapshot__descriptionBuilderWithMultilinePrefix_includeVariants___block_invoke_3(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 240) withName:@"statusBarSettings" skipIfNil:1];
  id v3 = *(void **)(a1 + 40);
  if (v3[32])
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = UIApplicationSceneStringForCompatibilityMode();
    id v6 = (id)[v4 appendObject:v5 withName:@"compatibilityMode" skipIfNil:1];

    id v3 = *(void **)(a1 + 40);
  }
  if (v3[31])
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = UIApplicationSceneStringForClassicMode();
    id v9 = (id)[v7 appendObject:v8 withName:@"classicMode" skipIfNil:1];

    id v3 = *(void **)(a1 + 40);
  }
  if (v3[33])
  {
    id v10 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x263F1C408], "_stringForBackgroundStyle:");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = (id)[v10 appendObject:v12 withName:@"backgroundStyle" skipIfNil:1];
  }
}

id __80__XBApplicationSnapshot__descriptionBuilderWithMultilinePrefix_includeVariants___block_invoke_4(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendFloat:@"scale" withName:1 decimalPrecision:*(double *)(*(void *)(a1 + 40) + 224)];
  id v3 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 306) withName:@"opaque"];
  unint64_t v4 = *(void *)(*(void *)(a1 + 40) + 112);
  if (v4 > 4) {
    id v5 = @"(unknown)";
  }
  else {
    id v5 = off_2646A5E00[v4];
  }
  id v6 = (id)[*(id *)(a1 + 32) appendObject:v5 withName:@"fileRelativeLocation"];
  id v7 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 88) withName:@"path" skipIfNil:1];
  unint64_t v8 = *(void *)(*(void *)(a1 + 40) + 216);
  if (v8 > 3) {
    id v9 = 0;
  }
  else {
    id v9 = off_2646A5E28[v8];
  }
  return (id)[*(id *)(a1 + 32) appendObject:v9 withName:@"fileFormat" skipIfNil:1];
}

- (void)setVariantID:(id)a3
{
}

- (NSString)launchInterfaceIdentifier
{
  return self->_launchInterfaceIdentifier;
}

- (void)setLaunchInterfaceIdentifier:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (void)setScheme:(id)a3
{
}

- (void)setRequiredOSVersion:(id)a3
{
}

- (void)_setFilename:(id)a3
{
}

- (int64_t)fileFormat
{
  return self->_fileFormat;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)lastUsedDate
{
  return self->_lastUsedDate;
}

- (void)setLastUsedDate:(id)a3
{
}

- (void)setContentType:(int64_t)a3
{
  self->_unint64_t contentType = a3;
}

- (BOOL)isFullScreen
{
  return self->_fullScreen;
}

- (void)setFullScreen:(BOOL)a3
{
  self->_fullScreen = a3;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (void)setCustomSafeAreaInsets:(id)a3
{
}

- (void)setStatusBarSettings:(id)a3
{
}

- (int64_t)classicMode
{
  return self->_classicMode;
}

- (void)setClassicMode:(int64_t)a3
{
  self->_classicMode = a3;
}

- (int64_t)compatibilityMode
{
  return self->_compatibilityMode;
}

- (void)setCompatibilityMode:(int64_t)a3
{
  self->_compatibilityMode = a3;
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setBackgroundStyle:(int64_t)a3
{
  self->_backgroundStyle = a3;
}

- (XBApplicationSnapshotGenerationContext)generationContext
{
  return self->_generationContext;
}

- (void)setExtendedData:(id)a3
{
}

- (XBSnapshotManifestStore)_store
{
  return self->_store;
}

- (void)setContainerIdentity:(id)a3
{
}

- (void)setImageGenerator:(id)a3
{
}

- (void)setImageScale:(double)a3
{
  self->_imageScale = a3;
}

- (void)setImageOpaque:(BOOL)a3
{
  self->_imageOpaque = a3;
}

- (int64_t)imageOrientation
{
  return self->_imageOrientation;
}

- (void)setImageOrientation:(int64_t)a3
{
  self->_imageOrientation = a3;
}

- (NSString)dataProviderClassName
{
  return self->_dataProviderClassName;
}

- (void)setDataProviderClassName:(id)a3
{
}

- (NSString)_relativePath
{
  return self->_relativePath;
}

- (int64_t)fileLocation
{
  return self->_fileLocation;
}

- (void)setFileLocation:(int64_t)a3
{
  self->_unint64_t fileLocation = a3;
}

- (CGAffineTransform)imageTransform
{
  long long v3 = *(_OWORD *)&self[8].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[8].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&self[8].tx;
  return self;
}

- (void)setImageTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_imageTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_imageTransform.tCGFloat x = v4;
  *(_OWORD *)&self->_imageTransform.a = v3;
}

- (NSString)_sortableLaunchInterfaceIdentifier
{
  id v2 = [(XBApplicationSnapshot *)self launchInterfaceIdentifier];
  long long v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    FAKE_NIL_PTR();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v5 = v4;

  return (NSString *)v5;
}

- (NSString)_sortableRequiredOSVersion
{
  id v2 = [(XBApplicationSnapshot *)self requiredOSVersion];
  long long v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    FAKE_NIL_PTR();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v5 = v4;

  return (NSString *)v5;
}

- (XBStatusBarSettings)_sortableStatusBarSettings
{
  id v2 = [(XBApplicationSnapshot *)self statusBarSettings];
  long long v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    FAKE_NIL_PTR();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v5 = v4;

  return (XBStatusBarSettings *)v5;
}

- (unint64_t)_contentTypeMask
{
  return (1 << [(XBApplicationSnapshot *)self contentType]);
}

- (void)_sanitizedPathForPath:(uint8_t *)buf .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_2232AB000, log, OS_LOG_TYPE_FAULT, "%{public}@ received invalid path\npath: %{public}@", buf, 0x16u);
}

- (void)_locked_loadImageViaGenerationContext:(void *)a1 options:.cold.1(void *a1)
{
  v1 = [a1 logIdentifier];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2232AB000, v2, v3, "%{public}@ finished calling imageGenerator", v4, v5, v6, v7, v8);
}

- (void)_locked_loadImageViaGenerationContext:(void *)a1 options:.cold.2(void *a1)
{
  v1 = [a1 logIdentifier];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2232AB000, v2, v3, "%{public}@ calling imageGenerator", v4, v5, v6, v7, v8);
}

- (void)_locked_loadImageViaGeneratorFunction:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 logIdentifier];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2232AB000, v2, v3, "%{public}@ finished calling generatorFunction", v4, v5, v6, v7, v8);
}

- (void)_locked_loadImageViaGeneratorFunction:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 logIdentifier];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2232AB000, v2, v3, "%{public}@ calling generatorFunction", v4, v5, v6, v7, v8);
}

- (void)_createVariantWithIdentifier:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 logIdentifier];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_2232AB000, v2, v3, "[%{public}@] asked to create variant but we're invalidated. variantID: %{public}@", v4, v5, v6, v7, v8);
}

+ (void)dataForImage:withFormat:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_2232AB000, v0, OS_LOG_TYPE_ERROR, "Failed to generate ATX data for %@", v1, 0xCu);
}

@end