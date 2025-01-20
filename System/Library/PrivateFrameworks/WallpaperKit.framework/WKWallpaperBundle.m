@interface WKWallpaperBundle
+ (BOOL)shouldLoadWallpaperBundleAtURL:(id)a3;
+ (id)_createWallpaperBundleInDirectory:(id)a3 version:(int64_t)a4 identifier:(int64_t)a5 name:(id)a6 family:(id)a7 disableParallax:(BOOL)a8 isOffloaded:(BOOL)a9 logicalScreenClass:(id)a10 thumbnailImageURL:(id)a11 adjustmentTraits:(id)a12 preferredProminentColors:(id)a13 preferredTitleColors:(id)a14 assetMapping:(id)a15;
- (BOOL)_hasCalculatedSupportsSerialization;
- (BOOL)_supportsSerialization;
- (BOOL)disableModifyingLegibilityBlur;
- (BOOL)disableParallax;
- (BOOL)hasDistinctWallpapersForLocations;
- (BOOL)isAppearanceAware;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOffloaded;
- (BOOL)supportsCopying;
- (NADescriptionBuilder)wk_descriptionBuilder;
- (NSArray)preferredTitleColors;
- (NSDictionary)preferredProminentColors;
- (NSMutableDictionary)_wallpaperAssetLookup;
- (NSNumber)contentVersion;
- (NSString)description;
- (NSString)family;
- (NSString)identifierString;
- (NSString)logicalScreenClass;
- (NSString)name;
- (NSURL)bundleURL;
- (NSURL)thumbnailImageURL;
- (UIImage)_thumbnailImage;
- (UIImage)thumbnailImage;
- (WKWallpaperAdjustmentTraits)adjustmentTraits;
- (WKWallpaperBundle)initWithURL:(id)a3;
- (id)_bokehWallpaperWithMetadataDictionary:(id)a3 wallpaperAppearance:(id)a4;
- (id)_layeredAnimationWallpaperWithMetadataDictionary:(id)a3 wallpaperAppearance:(id)a4;
- (id)_layeredStillWallpaperWithMetadataDictionary:(id)a3 wallpaperAppearance:(id)a4;
- (id)_layeredStripeWallpaperWithMetadataDictionary:(id)a3 wallpaperAppearance:(id)a4;
- (id)_layeredThumbnailWallpaperWithMetadataDictionary:(id)a3 representedType:(unint64_t)a4 wallpaperAppearance:(id)a5;
- (id)_liveWallpaperWithMetadataDictionary:(id)a3 wallpaperAppearance:(id)a4;
- (id)_parameterizedCAWallpaperWithMetadataDictionary:(id)a3 wallpaperAppearance:(id)a4;
- (id)_processCommonFileBackedWallpaperMetadataWithDictionary:(id)a3 wallpaperAppearance:(id)a4;
- (id)_processCommonWallpaperMetadataWithDictionary:(id)a3 wallpaperAppearance:(id)a4;
- (id)_stillWallpaperWithMetadataDictionary:(id)a3 wallpaperAppearance:(id)a4;
- (id)_thumbnailWallpaperWithMetadataDictionary:(id)a3 representedType:(unint64_t)a4 wallpaperAppearance:(id)a5;
- (id)copyWallpaperRepresentingToDestinationDirectoryURL:(id)a3 error:(id *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderBlock;
- (id)fileBasedWallpaperForLocation:(id)a3;
- (id)fileBasedWallpaperForLocation:(id)a3 andAppearance:(id)a4;
- (id)thumbnailRepresentableForLocation:(id)a3;
- (id)thumbnailRepresentableForLocation:(id)a3 andAppearance:(id)a4;
- (id)valueBasedWallpaperForLocation:(id)a3;
- (id)valueBasedWallpaperForLocation:(id)a3 andAppearance:(id)a4;
- (int64_t)identifier;
- (int64_t)version;
- (unint64_t)hash;
- (unint64_t)wallpaperBackingTypeForLocation:(id)a3;
- (void)_loadBundle;
- (void)_processAssetDictionary:(id)a3 forLocation:(id)a4;
- (void)_raiseInvalidMetadataExceptionForMetadataKeypath:(id)a3;
- (void)setBundleURL:(id)a3;
- (void)set_hasCalculatedSupportsSerialization:(BOOL)a3;
- (void)set_supportsSerialization:(BOOL)a3;
- (void)set_thumbnailImage:(id)a3;
- (void)set_wallpaperAssetLookup:(id)a3;
@end

@implementation WKWallpaperBundle

- (WKWallpaperBundle)initWithURL:(id)a3
{
  id v4 = a3;
  unsigned __int8 v20 = 0;
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  v6 = [v4 path];
  int v7 = [v5 fileExistsAtPath:v6 isDirectory:&v20];
  int v8 = v20;

  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    v10 = WKLogForCategory(3uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      [(WKWallpaperBundle *)(uint64_t)self initWithURL:v10];
    }

    v11 = 0;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)WKWallpaperBundle;
    v12 = [(WKWallpaperBundle *)&v19 init];
    v13 = v12;
    if (v12)
    {
      uint64_t v14 = [v4 copy];
      bundleURL = v13->_bundleURL;
      v13->_bundleURL = (NSURL *)v14;

      uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
      wallpaperAssetLookup = v13->__wallpaperAssetLookup;
      v13->__wallpaperAssetLookup = (NSMutableDictionary *)v16;

      [(WKWallpaperBundle *)v13 _loadBundle];
    }
    self = v13;
    v11 = self;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(WKWallpaperBundle *)self bundleURL];
  v6 = (void *)[v4 initWithURL:v5];

  return v6;
}

- (void)_loadBundle
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = [a1 bundleURL];
  int v8 = 138543618;
  id v9 = v5;
  __int16 v10 = 2114;
  v11 = v6;
  OUTLINED_FUNCTION_2(&dword_1BE13A000, a2, v7, "%{public}@: Wallpaper bundle does not exist at URL '%{public}@'", (uint8_t *)&v8);
}

- (void)_processAssetDictionary:(id)a3 forLocation:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v36 = a4;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v38 = [v6 countByEnumeratingWithState:&v39 objects:v52 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v40;
    *(void *)&long long v7 = 138543874;
    long long v35 = v7;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v40 != v37) {
          objc_enumerationMutation(v6);
        }
        uint64_t v9 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        objc_opt_class();
        __int16 v10 = [v6 objectForKeyedSubscript:v9];
        if (v10)
        {
          if (objc_opt_isKindOfClass()) {
            v11 = v10;
          }
          else {
            v11 = 0;
          }
          id v12 = v11;
        }
        else
        {
          id v12 = 0;
        }

        objc_opt_class();
        v13 = [v12 objectForKeyedSubscript:@"type"];
        if (v13)
        {
          if (objc_opt_isKindOfClass()) {
            uint64_t v14 = v13;
          }
          else {
            uint64_t v14 = 0;
          }
          id v15 = v14;
        }
        else
        {
          id v15 = 0;
        }

        if (!v15)
        {
          v51[0] = @"assets";
          v51[1] = v9;
          v51[2] = @"type";
          uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:3];
          v17 = [v16 componentsJoinedByString:@"."];
          [(WKWallpaperBundle *)self _raiseInvalidMetadataExceptionForMetadataKeypath:v17];
        }
        switch(WKWallpaperTypeFromString(v15))
        {
          case 0:
            uint64_t v18 = [(WKWallpaperBundle *)self _stillWallpaperWithMetadataDictionary:v12 wallpaperAppearance:v9];
            goto LABEL_38;
          case 1:
            uint64_t v18 = [(WKWallpaperBundle *)self _liveWallpaperWithMetadataDictionary:v12 wallpaperAppearance:v9];
            goto LABEL_38;
          case 2:
            objc_opt_class();
            objc_super v19 = [v12 objectForKeyedSubscript:@"representedType"];
            if (v19)
            {
              if (objc_opt_isKindOfClass()) {
                unsigned __int8 v20 = v19;
              }
              else {
                unsigned __int8 v20 = 0;
              }
              id v21 = v20;
            }
            else
            {
              id v21 = 0;
            }

            if (!v21)
            {
              v50[0] = @"assets";
              v50[1] = v9;
              v50[2] = @"representedType";
              v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:3];
              v29 = [v28 componentsJoinedByString:@"."];
              [(WKWallpaperBundle *)self _raiseInvalidMetadataExceptionForMetadataKeypath:v29];
            }
            uint64_t v30 = [(WKWallpaperBundle *)self _thumbnailWallpaperWithMetadataDictionary:v12 representedType:WKWallpaperTypeFromString(v21) wallpaperAppearance:v9];
            goto LABEL_48;
          case 3:
            objc_opt_class();
            v22 = [v12 objectForKeyedSubscript:@"representedType"];
            if (v22)
            {
              if (objc_opt_isKindOfClass()) {
                v23 = v22;
              }
              else {
                v23 = 0;
              }
              id v21 = v23;
            }
            else
            {
              id v21 = 0;
            }

            if (!v21)
            {
              v49[0] = @"assets";
              v49[1] = v9;
              v49[2] = @"representedType";
              v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:3];
              v32 = [v31 componentsJoinedByString:@"."];
              [(WKWallpaperBundle *)self _raiseInvalidMetadataExceptionForMetadataKeypath:v32];
            }
            uint64_t v30 = [(WKWallpaperBundle *)self _layeredThumbnailWallpaperWithMetadataDictionary:v12 representedType:WKWallpaperTypeFromString(v21) wallpaperAppearance:v9];
LABEL_48:
            v24 = v30;

            if (!v24) {
              goto LABEL_49;
            }
            goto LABEL_39;
          case 4:
            uint64_t v18 = [(WKWallpaperBundle *)self _layeredStillWallpaperWithMetadataDictionary:v12 wallpaperAppearance:v9];
            goto LABEL_38;
          case 5:
            uint64_t v18 = [(WKWallpaperBundle *)self _layeredStripeWallpaperWithMetadataDictionary:v12 wallpaperAppearance:v9];
            goto LABEL_38;
          case 6:
            uint64_t v18 = [(WKWallpaperBundle *)self _bokehWallpaperWithMetadataDictionary:v12 wallpaperAppearance:v9];
            goto LABEL_38;
          case 7:
            uint64_t v18 = [(WKWallpaperBundle *)self _layeredAnimationWallpaperWithMetadataDictionary:v12 wallpaperAppearance:v9];
            goto LABEL_38;
          case 8:
            uint64_t v18 = [(WKWallpaperBundle *)self _parameterizedCAWallpaperWithMetadataDictionary:v12 wallpaperAppearance:v9];
LABEL_38:
            v24 = v18;
            if (!v18) {
              goto LABEL_49;
            }
LABEL_39:
            v25 = [(WKWallpaperBundle *)self _wallpaperAssetLookup];
            v26 = objc_msgSend(v25, "na_objectForKey:withDefaultValue:", v36, &__block_literal_global);

            objc_msgSend(v26, "na_safeSetObject:forKey:", v24, v9);
            v27 = [(WKWallpaperBundle *)self _wallpaperAssetLookup];
            objc_msgSend(v27, "na_safeSetObject:forKey:", v26, v36);

            break;
          default:
LABEL_49:
            v24 = WKLogForCategory(3uLL);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              v33 = (objc_class *)objc_opt_class();
              v34 = NSStringFromClass(v33);
              *(_DWORD *)buf = v35;
              v44 = v34;
              __int16 v45 = 2114;
              id v46 = v36;
              __int16 v47 = 2114;
              uint64_t v48 = v9;
              _os_log_error_impl(&dword_1BE13A000, v24, OS_LOG_TYPE_ERROR, "%{public}@: Could not process wallpaper for location '%{public}@' and appearance '%{public}@'.", buf, 0x20u);
            }
            break;
        }
      }
      uint64_t v38 = [v6 countByEnumeratingWithState:&v39 objects:v52 count:16];
    }
    while (v38);
  }
}

uint64_t __57__WKWallpaperBundle__processAssetDictionary_forLocation___block_invoke()
{
  return [MEMORY[0x1E4F1CA60] dictionary];
}

+ (BOOL)shouldLoadWallpaperBundleAtURL:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v3 = (__CFString *)a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v5 = [(__CFString *)v3 pathExtension];
  id v6 = [v5 lowercaseString];
  char v7 = [v6 isEqualToString:@"wallpaper"];

  if (v7)
  {
    unsigned __int8 v52 = 0;
    int v8 = [(__CFString *)v3 path];
    int v9 = [v4 fileExistsAtPath:v8 isDirectory:&v52];
    int v10 = v52;

    if (!v9 || !v10)
    {
      v11 = WKLogForCategory(3uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[WKWallpaperBundle shouldLoadWallpaperBundleAtURL:]();
      }
      LOBYTE(v20) = 0;
      goto LABEL_28;
    }
    v11 = [(__CFString *)v3 URLByAppendingPathComponent:@"Wallpaper.plist"];
    id v12 = [(__CFString *)v3 path];
    char v13 = [v4 fileExistsAtPath:v12];

    if ((v13 & 1) == 0)
    {
      uint64_t v16 = WKLogForCategory(3uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        +[WKWallpaperBundle shouldLoadWallpaperBundleAtURL:]();
      }
      LOBYTE(v20) = 0;
      goto LABEL_27;
    }
    uint64_t v14 = [v11 path];
    int v15 = [v14 containsString:CPSharedResourcesDirectory()];

    if (v15)
    {
      uint64_t v16 = WKLogForCategory(3uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (__CFString *)CPSharedResourcesDirectory();
        *(_DWORD *)buf = 136315394;
        v54 = "+[WKWallpaperBundle shouldLoadWallpaperBundleAtURL:]";
        __int16 v55 = 2114;
        v56 = v17;
        uint64_t v18 = v17;
LABEL_20:
        _os_log_impl(&dword_1BE13A000, v16, OS_LOG_TYPE_DEFAULT, "%s: Wallpaper is in '%{public}@', should load.", buf, 0x16u);

        goto LABEL_21;
      }
      goto LABEL_21;
    }
    id v21 = [v11 path];
    v22 = NSTemporaryDirectory();
    int v23 = [v21 containsString:v22];

    if (v23)
    {
      uint64_t v16 = WKLogForCategory(3uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        NSTemporaryDirectory();
        uint64_t v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v54 = "+[WKWallpaperBundle shouldLoadWallpaperBundleAtURL:]";
        __int16 v55 = 2114;
        v56 = v18;
        goto LABEL_20;
      }
LABEL_21:
      LOBYTE(v20) = 1;
LABEL_27:

LABEL_28:
      goto LABEL_29;
    }
    id v51 = 0;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v11 error:&v51];
    uint64_t v16 = v51;
    if (v16)
    {
      v25 = WKLogForCategory(3uLL);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        +[WKWallpaperBundle shouldLoadWallpaperBundleAtURL:]();
      }
LABEL_25:
      LOBYTE(v20) = 0;
LABEL_26:

      goto LABEL_27;
    }
    v27 = objc_msgSend(MEMORY[0x1E4F1CB18], "wk_wallpaperKitUserDefaults");
    char v28 = objc_msgSend(v27, "wk_ignoreLogicalScreenClassForWallpaperBundle");

    if ((v28 & 1) == 0)
    {
      objc_opt_class();
      v29 = [v24 objectForKeyedSubscript:@"logicalScreenClass"];
      if (objc_opt_isKindOfClass()) {
        uint64_t v30 = v29;
      }
      else {
        uint64_t v30 = 0;
      }
      v25 = v30;

      v31 = WKLogForCategory(3uLL);
      BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
      if (!v25)
      {
        if (v32)
        {
          *(_DWORD *)buf = 136315650;
          v54 = "+[WKWallpaperBundle shouldLoadWallpaperBundleAtURL:]";
          __int16 v55 = 2114;
          v56 = @"logicalScreenClass";
          __int16 v57 = 2114;
          v58 = v11;
          _os_log_impl(&dword_1BE13A000, v31, OS_LOG_TYPE_DEFAULT, "%s: No entry found for '%{public}@' key in 'Wallpaper.plist' at URL '%{public}@'.", buf, 0x20u);
        }
        LOBYTE(v20) = 0;
        v25 = v31;
        goto LABEL_26;
      }
      if (v32)
      {
        v33 = [(__CFString *)v3 path];
        *(_DWORD *)buf = 136315650;
        v54 = "+[WKWallpaperBundle shouldLoadWallpaperBundleAtURL:]";
        __int16 v55 = 2114;
        v56 = v33;
        __int16 v57 = 2114;
        v58 = v25;
        _os_log_impl(&dword_1BE13A000, v31, OS_LOG_TYPE_DEFAULT, "%s: Wallpaper '%{public}@' logical screen class is '%{public}@'.", buf, 0x20u);
      }
      v34 = WKLogicalScreenClassString();
      if (([v34 isEqualToString:v25] & 1) == 0
        && ([v25 isEqualToString:@"any"] & 1) == 0)
      {
        v49 = WKLogForCategory(3uLL);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v54 = "+[WKWallpaperBundle shouldLoadWallpaperBundleAtURL:]";
          __int16 v55 = 2114;
          v56 = (__CFString *)v25;
          __int16 v57 = 2114;
          v58 = v34;
          __int16 v59 = 2114;
          v60 = @"any";
          _os_log_impl(&dword_1BE13A000, v49, OS_LOG_TYPE_DEFAULT, "%s: Wallpaper Bundle logical screen class '%{public}@' does not match the current device logical screen class '%{public}@' or '%{public}@'.", buf, 0x2Au);
        }

        goto LABEL_25;
      }
    }
    long long v35 = objc_msgSend(MEMORY[0x1E4F1CB18], "wk_wallpaperKitUserDefaults");
    int v36 = objc_msgSend(v35, "wk_ignoreProductTypesForWallpaperBundle");

    if (v36)
    {
      v25 = WKLogForCategory(3uLL);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v54 = "+[WKWallpaperBundle shouldLoadWallpaperBundleAtURL:]";
        _os_log_impl(&dword_1BE13A000, v25, OS_LOG_TYPE_DEFAULT, "%s: Device is configured to load wallpapers for all product types.", buf, 0xCu);
      }
      LOBYTE(v20) = 1;
      goto LABEL_26;
    }
    uint64_t v37 = [MEMORY[0x1E4FB16C8] currentDevice];
    v25 = objc_msgSend(v37, "sf_productType");

    objc_opt_class();
    uint64_t v38 = [v24 objectForKeyedSubscript:@"unsupportedProductTypes"];
    if (objc_opt_isKindOfClass()) {
      long long v39 = v38;
    }
    else {
      long long v39 = 0;
    }
    long long v40 = v39;

    if ([v40 count])
    {
      long long v41 = WKLogForCategory(3uLL);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v54 = "+[WKWallpaperBundle shouldLoadWallpaperBundleAtURL:]";
        __int16 v55 = 2114;
        v56 = @"unsupportedProductTypes";
        __int16 v57 = 2114;
        v58 = v40;
        __int16 v59 = 2114;
        v60 = (__CFString *)v25;
        _os_log_impl(&dword_1BE13A000, v41, OS_LOG_TYPE_DEFAULT, "%s: Wallpaper bundle has '%{public}@' entry with values '%{public}@', checking if it contains '%{public}@'.", buf, 0x2Au);
      }

      long long v42 = [MEMORY[0x1E4F1CAD0] setWithArray:v40];
      if ([v42 containsObject:v25])
      {
        v43 = WKLogForCategory(3uLL);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v54 = "+[WKWallpaperBundle shouldLoadWallpaperBundleAtURL:]";
          __int16 v55 = 2114;
          v56 = (__CFString *)v25;
          _os_log_impl(&dword_1BE13A000, v43, OS_LOG_TYPE_DEFAULT, "%s: Wallpaper bundle is not supported for product type %{public}@.", buf, 0x16u);
        }
        LOBYTE(v20) = 0;
LABEL_72:

        goto LABEL_26;
      }
    }
    v50 = v40;
    objc_opt_class();
    v44 = [v24 objectForKeyedSubscript:@"productTypes"];
    if (objc_opt_isKindOfClass()) {
      __int16 v45 = v44;
    }
    else {
      __int16 v45 = 0;
    }
    long long v42 = v45;

    uint64_t v46 = [v42 count];
    v43 = WKLogForCategory(3uLL);
    BOOL v47 = os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);
    if (v46)
    {
      if (v47)
      {
        *(_DWORD *)buf = 136315906;
        v54 = "+[WKWallpaperBundle shouldLoadWallpaperBundleAtURL:]";
        __int16 v55 = 2114;
        v56 = @"productTypes";
        __int16 v57 = 2114;
        v58 = v42;
        __int16 v59 = 2114;
        v60 = (__CFString *)v25;
        _os_log_impl(&dword_1BE13A000, v43, OS_LOG_TYPE_DEFAULT, "%s: Wallpaper bundle has '%{public}@' entry with values '%{public}@', checking if it contains '%{public}@'.", buf, 0x2Au);
      }

      v43 = [MEMORY[0x1E4F1CAD0] setWithArray:v42];
      int v20 = [v43 containsObject:v25];
      if (v20)
      {
        uint64_t v48 = WKLogForCategory(3uLL);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v54 = "+[WKWallpaperBundle shouldLoadWallpaperBundleAtURL:]";
          __int16 v55 = 2114;
          v56 = (__CFString *)v25;
          _os_log_impl(&dword_1BE13A000, v48, OS_LOG_TYPE_DEFAULT, "%s: Wallpaper bundle is supported for product type %{public}@.", buf, 0x16u);
        }
      }
    }
    else
    {
      if (v47)
      {
        *(_DWORD *)buf = 136315394;
        v54 = "+[WKWallpaperBundle shouldLoadWallpaperBundleAtURL:]";
        __int16 v55 = 2114;
        v56 = v3;
        _os_log_impl(&dword_1BE13A000, v43, OS_LOG_TYPE_DEFAULT, "%s: Wallpaper bundle at URL '%{public}@' should be loaded", buf, 0x16u);
      }
      LOBYTE(v20) = 1;
    }
    long long v40 = v50;
    goto LABEL_72;
  }
  objc_super v19 = WKLogForCategory(3uLL);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    +[WKWallpaperBundle shouldLoadWallpaperBundleAtURL:].cold.4();
  }

  LOBYTE(v20) = 0;
LABEL_29:

  return v20;
}

- (UIImage)thumbnailImage
{
  v3 = [(WKWallpaperBundle *)self _thumbnailImage];

  if (!v3)
  {
    id v4 = [(WKWallpaperBundle *)self thumbnailImageURL];

    if (v4)
    {
      id v5 = (void *)MEMORY[0x1E4FB1818];
      id v6 = [(WKWallpaperBundle *)self thumbnailImageURL];
      char v7 = [v6 path];
      int v8 = [v5 imageWithContentsOfFile:v7];
      [(WKWallpaperBundle *)self set_thumbnailImage:v8];
    }
    else
    {
      id v6 = [(WKWallpaperBundle *)self thumbnailRepresentableForLocation:@"WKWallpaperLocationCoverSheet" andAppearance:@"default"];
      char v7 = [(WKWallpaperBundle *)self thumbnailRepresentableForLocation:@"WKWallpaperLocationCoverSheet" andAppearance:@"dark"];
      int v9 = (void *)MEMORY[0x1E4FB1818];
      int v8 = [v6 thumbnailImage];
      int v10 = [v7 thumbnailImage];
      v11 = objc_msgSend(v9, "wk_splitThumbnailWithLightAppearanceImage:darkAppearanceImage:", v8, v10);
      [(WKWallpaperBundle *)self set_thumbnailImage:v11];
    }
  }
  return [(WKWallpaperBundle *)self _thumbnailImage];
}

- (unint64_t)wallpaperBackingTypeForLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(WKWallpaperBundle *)self _wallpaperAssetLookup];
  id v6 = [v5 objectForKeyedSubscript:v4];

  char v7 = [v6 objectForKeyedSubscript:@"default"];

  unint64_t v8 = [v7 backingType];
  return v8;
}

- (id)thumbnailRepresentableForLocation:(id)a3
{
  return [(WKWallpaperBundle *)self thumbnailRepresentableForLocation:a3 andAppearance:@"default"];
}

- (id)thumbnailRepresentableForLocation:(id)a3 andAppearance:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(WKWallpaperBundle *)self _wallpaperAssetLookup];
  int v9 = [v8 objectForKeyedSubscript:v7];

  int v10 = [v9 objectForKeyedSubscript:v6];

  if ([v10 conformsToProtocol:&unk_1F18C2AF0]) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  return v12;
}

- (id)fileBasedWallpaperForLocation:(id)a3
{
  return [(WKWallpaperBundle *)self fileBasedWallpaperForLocation:a3 andAppearance:@"default"];
}

- (id)fileBasedWallpaperForLocation:(id)a3 andAppearance:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(WKWallpaperBundle *)self _wallpaperAssetLookup];
  int v9 = [v8 objectForKeyedSubscript:v7];

  int v10 = [v9 objectForKeyedSubscript:v6];

  if ([v10 conformsToProtocol:&unk_1F18C38C0]) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  return v12;
}

- (id)valueBasedWallpaperForLocation:(id)a3
{
  return [(WKWallpaperBundle *)self valueBasedWallpaperForLocation:a3 andAppearance:@"default"];
}

- (id)valueBasedWallpaperForLocation:(id)a3 andAppearance:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(WKWallpaperBundle *)self _wallpaperAssetLookup];
  int v9 = [v8 objectForKeyedSubscript:v7];

  int v10 = [v9 objectForKeyedSubscript:v6];

  if ([v10 conformsToProtocol:&unk_1F18C3698]) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  return v12;
}

- (NSString)identifierString
{
  v2 = objc_msgSend(NSNumber, "numberWithInteger:", -[WKWallpaperBundle identifier](self, "identifier"));
  v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (BOOL)supportsCopying
{
  return ![(WKWallpaperBundle *)self isOffloaded];
}

- (id)copyWallpaperRepresentingToDestinationDirectoryURL:(id)a3 error:(id *)a4
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(WKWallpaperBundle *)self supportsCopying])
  {
    id v7 = [(WKWallpaperBundle *)self bundleURL];
    unint64_t v8 = [v7 lastPathComponent];

    int v9 = [v6 URLByAppendingPathComponent:v8];
    int v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    v11 = [(WKWallpaperBundle *)self bundleURL];
    int v12 = [v10 copyItemAtURL:v11 toURL:v9 error:a4];

    if (!v12) {
      goto LABEL_14;
    }
    char v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v14 = *MEMORY[0x1E4F28370];
    uint64_t v35 = *MEMORY[0x1E4F28370];
    uint64_t v15 = *MEMORY[0x1E4F28378];
    uint64_t v36 = *MEMORY[0x1E4F28378];
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    v17 = [v9 path];
    int v18 = [v13 setAttributes:v16 ofItemAtPath:v17 error:a4];

    if (v18)
    {
      objc_super v19 = [MEMORY[0x1E4F28CB8] defaultManager];
      int v20 = [v19 enumeratorAtURL:v9 includingPropertiesForKeys:0 options:0 errorHandler:0];

      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v21 = v20;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v31;
        while (2)
        {
          uint64_t v25 = 0;
          do
          {
            if (*(void *)v31 != v24) {
              objc_enumerationMutation(v21);
            }
            if (!objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * v25), "setResourceValue:forKey:error:", v15, v14, a4, (void)v30))
            {

              id v26 = 0;
              goto LABEL_16;
            }
            ++v25;
          }
          while (v23 != v25);
          uint64_t v23 = [v21 countByEnumeratingWithState:&v30 objects:v34 count:16];
          if (v23) {
            continue;
          }
          break;
        }
      }

      id v26 = v9;
LABEL_16:
    }
    else
    {
LABEL_14:
      id v26 = 0;
    }
  }
  else
  {
    v27 = (void *)MEMORY[0x1E4F28C58];
    char v28 = WKWallpaperKitErrorDomain;
    uint64_t v37 = *MEMORY[0x1E4F28578];
    v38[0] = @"Unsupported copy action for wallpaper (supportsCopying == NO).";
    unint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
    [v27 errorWithDomain:v28 code:-10003 userInfo:v8];
    id v26 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v26;
}

- (void)_raiseInvalidMetadataExceptionForMetadataKeypath:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  id v6 = NSString;
  id v7 = a3;
  unint64_t v8 = (objc_class *)objc_opt_class();
  int v9 = NSStringFromClass(v8);
  int v10 = [(WKWallpaperBundle *)self bundleURL];
  v11 = [v6 stringWithFormat:@"%@: (path: '%@') metadata does not contain valid value for keypath: '%@'", v9, v10, v7];

  id v12 = [v4 exceptionWithName:v5 reason:v11 userInfo:0];

  [v12 raise];
}

- (id)_processCommonWallpaperMetadataWithDictionary:(id)a3 wallpaperAppearance:(id)a4
{
  v46[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  unint64_t v8 = [v6 objectForKeyedSubscript:@"identifier"];
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      int v9 = v8;
    }
    else {
      int v9 = 0;
    }
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }

  if (!v10)
  {
    v46[0] = @"assets";
    v46[1] = v7;
    v46[2] = @"identifier";
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:3];
    id v12 = [v11 componentsJoinedByString:@"."];
    [(WKWallpaperBundle *)self _raiseInvalidMetadataExceptionForMetadataKeypath:v12];
  }
  long long v41 = v10;
  uint64_t v40 = [v10 integerValue];
  objc_opt_class();
  char v13 = [v6 objectForKeyedSubscript:@"name"];
  if (v13)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    id v15 = v14;
  }
  else
  {
    id v15 = 0;
  }

  if (!v15)
  {
    v45[0] = @"assets";
    v45[1] = v7;
    v45[2] = @"name";
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:3];
    v17 = [v16 componentsJoinedByString:@"."];
    [(WKWallpaperBundle *)self _raiseInvalidMetadataExceptionForMetadataKeypath:v17];
  }
  objc_opt_class();
  int v18 = [v6 objectForKeyedSubscript:@"thumbnailImageFileName"];
  if (v18)
  {
    if (objc_opt_isKindOfClass()) {
      objc_super v19 = v18;
    }
    else {
      objc_super v19 = 0;
    }
    id v20 = v19;
  }
  else
  {
    id v20 = 0;
  }

  if (!v20)
  {
    v44[0] = @"assets";
    v44[1] = v7;
    v44[2] = @"thumbnailImageFileName";
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:3];
    uint64_t v22 = [v21 componentsJoinedByString:@"."];
    [(WKWallpaperBundle *)self _raiseInvalidMetadataExceptionForMetadataKeypath:v22];
  }
  uint64_t v23 = v7;
  uint64_t v24 = [(WKWallpaperBundle *)self bundleURL];
  uint64_t v25 = [v24 URLByAppendingPathComponent:v20];

  id v26 = [MEMORY[0x1E4F28CB8] defaultManager];
  v27 = [v25 path];
  char v28 = [v26 fileExistsAtPath:v27];

  if ((v28 & 1) == 0)
  {
    v29 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v30 = *MEMORY[0x1E4F1C3C8];
    long long v31 = NSString;
    long long v32 = (objc_class *)objc_opt_class();
    long long v33 = NSStringFromClass(v32);
    v34 = [v25 path];
    uint64_t v35 = [v31 stringWithFormat:@"%@: Thumbnail image does not exist at path '%@'", v33, v34];
    uint64_t v36 = [v29 exceptionWithName:v30 reason:v35 userInfo:0];

    [v36 raise];
  }
  v42[0] = @"identifier";
  uint64_t v37 = [NSNumber numberWithInteger:v40];
  v43[0] = v37;
  v43[1] = v15;
  v42[1] = @"name";
  v42[2] = @"thumbnailImageFileURL";
  v43[2] = v25;
  uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:3];

  return v38;
}

- (id)_processCommonFileBackedWallpaperMetadataWithDictionary:(id)a3 wallpaperAppearance:(id)a4
{
  v30[3] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(WKWallpaperBundle *)self _processCommonWallpaperMetadataWithDictionary:v7 wallpaperAppearance:v6];
  int v9 = (void *)[v8 mutableCopy];

  objc_opt_class();
  id v10 = [v7 objectForKeyedSubscript:@"fullSizeImageFileName"];

  id v11 = v10;
  if (v11)
  {
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
    id v13 = v12;
  }
  else
  {
    id v13 = 0;
  }

  if (!v13)
  {
    v30[0] = @"assets";
    v30[1] = v6;
    v30[2] = @"fullSizeImageFileName";
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:3];
    id v15 = [v14 componentsJoinedByString:@"."];
    [(WKWallpaperBundle *)self _raiseInvalidMetadataExceptionForMetadataKeypath:v15];
  }
  uint64_t v16 = [(WKWallpaperBundle *)self bundleURL];
  v17 = [v16 URLByAppendingPathComponent:v13];

  int v18 = [MEMORY[0x1E4F28CB8] defaultManager];
  objc_super v19 = [v17 path];
  char v20 = [v18 fileExistsAtPath:v19];

  if ((v20 & 1) == 0)
  {
    id v21 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v22 = *MEMORY[0x1E4F1C3C8];
    uint64_t v23 = NSString;
    uint64_t v24 = (objc_class *)objc_opt_class();
    uint64_t v25 = NSStringFromClass(v24);
    id v26 = [v17 path];
    v27 = [v23 stringWithFormat:@"%@: Full size image does not exist at path '%@'", v25, v26];
    char v28 = [v21 exceptionWithName:v22 reason:v27 userInfo:0];

    [v28 raise];
  }
  [v9 setObject:v17 forKeyedSubscript:@"fullSizeImageFileURL"];

  return v9;
}

- (id)_thumbnailWallpaperWithMetadataDictionary:(id)a3 representedType:(unint64_t)a4 wallpaperAppearance:(id)a5
{
  id v6 = [(WKWallpaperBundle *)self _processCommonWallpaperMetadataWithDictionary:a3 wallpaperAppearance:a5];
  objc_opt_class();
  id v7 = [v6 objectForKeyedSubscript:@"identifier"];
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      unint64_t v8 = v7;
    }
    else {
      unint64_t v8 = 0;
    }
    id v9 = v8;
  }
  else
  {
    id v9 = 0;
  }

  objc_opt_class();
  id v10 = [v6 objectForKeyedSubscript:@"name"];
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
    id v12 = v11;
  }
  else
  {
    id v12 = 0;
  }

  objc_opt_class();
  id v13 = [v6 objectForKeyedSubscript:@"thumbnailImageFileURL"];
  if (v13)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    id v15 = v14;
  }
  else
  {
    id v15 = 0;
  }

  uint64_t v16 = -[WKThumbnailWallpaper initWithIdentifier:name:type:representedType:backingType:thumbnailImageURL:]([WKThumbnailWallpaper alloc], "initWithIdentifier:name:type:representedType:backingType:thumbnailImageURL:", [v9 unsignedIntegerValue], v12, 2, a4, 0, v15);
  return v16;
}

- (id)_stillWallpaperWithMetadataDictionary:(id)a3 wallpaperAppearance:(id)a4
{
  id v4 = [(WKWallpaperBundle *)self _processCommonFileBackedWallpaperMetadataWithDictionary:a3 wallpaperAppearance:a4];
  objc_opt_class();
  uint64_t v5 = [v4 objectForKeyedSubscript:@"identifier"];
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }

  objc_opt_class();
  unint64_t v8 = [v4 objectForKeyedSubscript:@"name"];
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }

  objc_opt_class();
  id v11 = [v4 objectForKeyedSubscript:@"fullSizeImageFileURL"];
  if (v11)
  {
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
    id v13 = v12;
  }
  else
  {
    id v13 = 0;
  }

  objc_opt_class();
  uint64_t v14 = [v4 objectForKeyedSubscript:@"thumbnailImageFileURL"];
  if (v14)
  {
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }
    id v16 = v15;
  }
  else
  {
    id v16 = 0;
  }

  v17 = -[WKStillWallpaper initWithIdentifier:name:type:thumbnailImageURL:fullsizeImageURL:]([WKStillWallpaper alloc], "initWithIdentifier:name:type:thumbnailImageURL:fullsizeImageURL:", [v7 unsignedIntegerValue], v10, 0, v16, v13);
  return v17;
}

- (id)_liveWallpaperWithMetadataDictionary:(id)a3 wallpaperAppearance:(id)a4
{
  v57[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v55 = a4;
  id v7 = -[WKWallpaperBundle _processCommonFileBackedWallpaperMetadataWithDictionary:wallpaperAppearance:](self, "_processCommonFileBackedWallpaperMetadataWithDictionary:wallpaperAppearance:", v6);
  objc_opt_class();
  unint64_t v8 = [v7 objectForKeyedSubscript:@"identifier"];
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v54 = v9;
  }
  else
  {
    id v54 = 0;
  }

  objc_opt_class();
  id v10 = [v7 objectForKeyedSubscript:@"name"];
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
    id v53 = v11;
  }
  else
  {
    id v53 = 0;
  }

  objc_opt_class();
  id v12 = [v7 objectForKeyedSubscript:@"fullSizeImageFileURL"];
  if (v12)
  {
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;
  }
  else
  {
    id v14 = 0;
  }

  objc_opt_class();
  id v15 = [v7 objectForKeyedSubscript:@"thumbnailImageFileURL"];
  if (v15)
  {
    if (objc_opt_isKindOfClass()) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }
    id v17 = v16;
  }
  else
  {
    id v17 = 0;
  }

  objc_opt_class();
  int v18 = [v6 objectForKeyedSubscript:@"videoFileName"];
  if (objc_opt_isKindOfClass()) {
    objc_super v19 = v18;
  }
  else {
    objc_super v19 = 0;
  }
  id v20 = v19;

  if (!v20)
  {
    v57[0] = @"assets";
    v57[1] = v55;
    v57[2] = @"videoFileName";
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:3];
    uint64_t v22 = [v21 componentsJoinedByString:@"."];
    [(WKWallpaperBundle *)self _raiseInvalidMetadataExceptionForMetadataKeypath:v22];
  }
  uint64_t v23 = [(WKWallpaperBundle *)self bundleURL];
  uint64_t v24 = [v23 URLByAppendingPathComponent:v20];

  uint64_t v25 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v26 = [v24 path];
  char v27 = [v25 fileExistsAtPath:v26];

  if ((v27 & 1) == 0)
  {
    unsigned __int8 v52 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v28 = *MEMORY[0x1E4F1C3C8];
    v29 = NSString;
    uint64_t v30 = (objc_class *)objc_opt_class();
    long long v31 = NSStringFromClass(v30);
    [v24 path];
    long long v32 = v7;
    id v33 = v6;
    v34 = self;
    id v35 = v17;
    v37 = id v36 = v14;
    uint64_t v38 = [v29 stringWithFormat:@"%@: Video asset does not exist at path '%@'", v31, v37];
    long long v39 = [v52 exceptionWithName:v28 reason:v38 userInfo:0];

    id v14 = v36;
    id v17 = v35;
    self = v34;
    id v6 = v33;
    id v7 = v32;

    [v39 raise];
  }
  uint64_t v40 = [v6 objectForKeyedSubscript:@"stillTimeInVideo"];
  if (v40)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    long long v42 = v40;
    if ((isKindOfClass & 1) == 0)
    {
      v56[0] = @"assets";
      v56[1] = v55;
      v56[2] = @"stillTimeInVideo";
      v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:3];
      v44 = [v43 componentsJoinedByString:@"."];
      [(WKWallpaperBundle *)self _raiseInvalidMetadataExceptionForMetadataKeypath:v44];

      long long v42 = v40;
    }
  }
  else
  {
    long long v42 = &unk_1F18C1E08;
  }
  id v45 = v42;

  uint64_t v46 = [WKLiveWallpaper alloc];
  uint64_t v47 = [v54 unsignedIntegerValue];
  [v45 doubleValue];
  double v49 = v48;

  v50 = [(WKLiveWallpaper *)v46 initWithIdentifier:v47 name:v53 type:1 thumbnailImageURL:v17 fullsizeImageURL:v14 videoAssetURL:v24 stillTimeInVideo:v49];
  return v50;
}

- (id)_layeredThumbnailWallpaperWithMetadataDictionary:(id)a3 representedType:(unint64_t)a4 wallpaperAppearance:(id)a5
{
  v83[3] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  id v9 = [v7 objectForKeyedSubscript:@"identifier"];
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;
  }
  else
  {
    id v11 = 0;
  }

  if (!v11)
  {
    v83[0] = @"assets";
    v83[1] = v8;
    v83[2] = @"identifier";
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:3];
    id v13 = [v12 componentsJoinedByString:@"."];
    [(WKWallpaperBundle *)self _raiseInvalidMetadataExceptionForMetadataKeypath:v13];
  }
  uint64_t v80 = [v11 integerValue];
  objc_opt_class();
  id v14 = [v7 objectForKeyedSubscript:@"name"];
  if (v14)
  {
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }
    id v16 = v15;
  }
  else
  {
    id v16 = 0;
  }

  if (!v16)
  {
    v82[0] = @"assets";
    v82[1] = v8;
    v82[2] = @"name";
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:3];
    int v18 = [v17 componentsJoinedByString:@"."];
    [(WKWallpaperBundle *)self _raiseInvalidMetadataExceptionForMetadataKeypath:v18];
  }
  objc_opt_class();
  objc_super v19 = [v7 objectForKeyedSubscript:@"backgroundThumbnailImageFileName"];
  if (v19)
  {
    if (objc_opt_isKindOfClass()) {
      id v20 = v19;
    }
    else {
      id v20 = 0;
    }
    id v21 = v20;
  }
  else
  {
    id v21 = 0;
  }

  unint64_t v22 = 0x1E4F28000uLL;
  v78 = v21;
  v79 = v16;
  if (v21)
  {
    uint64_t v23 = [(WKWallpaperBundle *)self bundleURL];
    uint64_t v24 = [v23 URLByAppendingPathComponent:v21];

    uint64_t v25 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v26 = [v24 path];
    char v27 = [v25 fileExistsAtPath:v26];

    if ((v27 & 1) == 0)
    {
      uint64_t v28 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v29 = *MEMORY[0x1E4F1C3C8];
      uint64_t v30 = NSString;
      long long v31 = (objc_class *)objc_opt_class();
      long long v32 = NSStringFromClass(v31);
      [v24 path];
      v34 = id v33 = v24;
      id v35 = [v30 stringWithFormat:@"%@: Background thumbnail asset does not exist at path '%@'", v32, v34];
      id v36 = [v28 exceptionWithName:v29 reason:v35 userInfo:0];

      uint64_t v24 = v33;
      unint64_t v22 = 0x1E4F28000;

      [v36 raise];
    }
  }
  else
  {
    uint64_t v24 = 0;
  }
  objc_opt_class();
  uint64_t v37 = [v7 objectForKeyedSubscript:@"foregroundThumbnailImageFileName"];
  if (v37)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v38 = v37;
    }
    else {
      uint64_t v38 = 0;
    }
    id v39 = v38;
  }
  else
  {
    id v39 = 0;
  }

  id v76 = v7;
  v77 = v24;
  id v75 = v8;
  if (v39)
  {
    uint64_t v40 = [(WKWallpaperBundle *)self bundleURL];
    long long v41 = [v40 URLByAppendingPathComponent:v39];

    long long v42 = [*(id *)(v22 + 3256) defaultManager];
    v43 = [v41 path];
    char v44 = [v42 fileExistsAtPath:v43];

    if ((v44 & 1) == 0)
    {
      id v45 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v46 = *MEMORY[0x1E4F1C3C8];
      uint64_t v47 = NSString;
      double v48 = (objc_class *)objc_opt_class();
      double v49 = NSStringFromClass(v48);
      [v41 path];
      unint64_t v50 = v22;
      id v51 = self;
      id v53 = v52 = v11;
      id v54 = [v47 stringWithFormat:@"%@: Foreground thumbnail asset does not exist at path '%@'", v49, v53];
      id v55 = [v45 exceptionWithName:v46 reason:v54 userInfo:0];

      id v11 = v52;
      self = v51;
      unint64_t v22 = v50;

      id v8 = v75;
      id v7 = v76;
      [v55 raise];
    }
  }
  else
  {
    long long v41 = 0;
  }
  objc_opt_class();
  v56 = [v7 objectForKeyedSubscript:@"floatingThumbnailImageFileName"];
  if (v56)
  {
    if (objc_opt_isKindOfClass()) {
      __int16 v57 = v56;
    }
    else {
      __int16 v57 = 0;
    }
    id v58 = v57;
  }
  else
  {
    id v58 = 0;
  }

  if (v58)
  {
    id v74 = v11;
    __int16 v59 = [(WKWallpaperBundle *)self bundleURL];
    v60 = [v59 URLByAppendingPathComponent:v58];

    uint64_t v61 = [*(id *)(v22 + 3256) defaultManager];
    v62 = [v60 path];
    char v63 = [v61 fileExistsAtPath:v62];

    if ((v63 & 1) == 0)
    {
      v64 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v65 = *MEMORY[0x1E4F1C3C8];
      v66 = NSString;
      v67 = (objc_class *)objc_opt_class();
      v68 = NSStringFromClass(v67);
      v69 = [v60 path];
      v70 = [v66 stringWithFormat:@"%@: Floating thumbnail asset does not exist at path '%@'", v68, v69];
      v71 = [v64 exceptionWithName:v65 reason:v70 userInfo:0];

      [v71 raise];
    }
    id v8 = v75;
    id v7 = v76;
    id v11 = v74;
  }
  else
  {
    v60 = 0;
  }
  v72 = [[WKLayeredThumbnailWallpaper alloc] initWithIdentifier:v80 name:v79 type:3 representedType:a4 backgroundThumbnailImageURL:v77 foregroundThumbnailImageURL:v41 floatingThumbnailImageURL:v60];

  return v72;
}

- (id)_layeredStillWallpaperWithMetadataDictionary:(id)a3 wallpaperAppearance:(id)a4
{
  v140[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  id v8 = [v6 objectForKeyedSubscript:@"identifier"];
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }

  if (!v10)
  {
    v140[0] = @"assets";
    v140[1] = v7;
    v140[2] = @"identifier";
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v140 count:3];
    id v12 = [v11 componentsJoinedByString:@"."];
    [(WKWallpaperBundle *)self _raiseInvalidMetadataExceptionForMetadataKeypath:v12];
  }
  v135 = v10;
  uint64_t v133 = [v10 integerValue];
  objc_opt_class();
  id v13 = [v6 objectForKeyedSubscript:@"name"];
  if (v13)
  {
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }
    id v15 = v14;
  }
  else
  {
    id v15 = 0;
  }

  if (!v15)
  {
    v139[0] = @"assets";
    v139[1] = v7;
    v139[2] = @"name";
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v139 count:3];
    id v17 = [v16 componentsJoinedByString:@"."];
    [(WKWallpaperBundle *)self _raiseInvalidMetadataExceptionForMetadataKeypath:v17];
  }
  objc_opt_class();
  int v18 = [v6 objectForKeyedSubscript:@"backgroundThumbnailImageFileName"];
  if (v18)
  {
    if (objc_opt_isKindOfClass()) {
      objc_super v19 = v18;
    }
    else {
      objc_super v19 = 0;
    }
    id v20 = v19;
  }
  else
  {
    id v20 = 0;
  }

  unint64_t v21 = 0x1E4F28000uLL;
  v132 = v20;
  if (v20)
  {
    unint64_t v22 = [(WKWallpaperBundle *)self bundleURL];
    uint64_t v23 = [v22 URLByAppendingPathComponent:v20];

    uint64_t v24 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v25 = [v23 path];
    char v26 = [v24 fileExistsAtPath:v25];

    if ((v26 & 1) == 0)
    {
      char v27 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v28 = *MEMORY[0x1E4F1C3C8];
      uint64_t v29 = NSString;
      uint64_t v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      id v31 = v15;
      v33 = id v32 = v7;
      [v23 path];
      id v35 = v34 = v23;
      id v36 = [v29 stringWithFormat:@"%@: Background thumbnail asset does not exist at path '%@'", v33, v35];
      uint64_t v37 = [v27 exceptionWithName:v28 reason:v36 userInfo:0];

      uint64_t v23 = v34;
      unint64_t v21 = 0x1E4F28000;

      id v7 = v32;
      id v15 = v31;
      [v37 raise];
    }
  }
  else
  {
    uint64_t v23 = 0;
  }
  objc_opt_class();
  uint64_t v38 = [v6 objectForKeyedSubscript:@"foregroundThumbnailImageFileName"];
  if (v38)
  {
    if (objc_opt_isKindOfClass()) {
      id v39 = v38;
    }
    else {
      id v39 = 0;
    }
    id v40 = v39;
  }
  else
  {
    id v40 = 0;
  }

  v130 = v40;
  v131 = v23;
  v137 = self;
  if (v40)
  {
    long long v41 = [(WKWallpaperBundle *)self bundleURL];
    long long v42 = [v41 URLByAppendingPathComponent:v40];

    v43 = [*(id *)(v21 + 3256) defaultManager];
    char v44 = [v42 path];
    char v45 = [v43 fileExistsAtPath:v44];

    if ((v45 & 1) == 0)
    {
      uint64_t v46 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v47 = *MEMORY[0x1E4F1C3C8];
      double v48 = NSString;
      double v49 = (objc_class *)objc_opt_class();
      NSStringFromClass(v49);
      id v50 = v15;
      v52 = id v51 = v7;
      id v53 = [v42 path];
      id v54 = [v48 stringWithFormat:@"%@: Foreground thumbnail asset does not exist at path '%@'", v52, v53];
      id v55 = [v46 exceptionWithName:v47 reason:v54 userInfo:0];

      id v7 = v51;
      id v15 = v50;
      self = v137;
      [v55 raise];
    }
  }
  else
  {
    long long v42 = 0;
  }
  objc_opt_class();
  v56 = [v6 objectForKeyedSubscript:@"floatingThumbnailImageFileName"];
  if (v56)
  {
    if (objc_opt_isKindOfClass()) {
      __int16 v57 = v56;
    }
    else {
      __int16 v57 = 0;
    }
    id v58 = v57;
  }
  else
  {
    id v58 = 0;
  }
  v129 = v42;

  v136 = v7;
  v134 = v15;
  v128 = v58;
  if (v58)
  {
    __int16 v59 = [(WKWallpaperBundle *)self bundleURL];
    v60 = [v59 URLByAppendingPathComponent:v58];

    uint64_t v61 = [*(id *)(v21 + 3256) defaultManager];
    v62 = [v60 path];
    char v63 = [v61 fileExistsAtPath:v62];

    if ((v63 & 1) == 0)
    {
      v64 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v65 = *MEMORY[0x1E4F1C3C8];
      v66 = NSString;
      v67 = (objc_class *)objc_opt_class();
      v68 = NSStringFromClass(v67);
      v69 = [v60 path];
      v70 = [v66 stringWithFormat:@"%@: Floating thumbnail asset does not exist at path '%@'", v68, v69];
      v71 = [v64 exceptionWithName:v65 reason:v70 userInfo:0];

      unint64_t v21 = 0x1E4F28000;
      [v71 raise];
    }
  }
  else
  {
    v60 = 0;
  }
  objc_opt_class();
  v72 = [v6 objectForKeyedSubscript:@"backgroundFullSizeImageFileName"];
  if (v72)
  {
    if (objc_opt_isKindOfClass()) {
      v73 = v72;
    }
    else {
      v73 = 0;
    }
    id v74 = v73;
  }
  else
  {
    id v74 = 0;
  }

  if (v74)
  {
    id v75 = [(WKWallpaperBundle *)self bundleURL];
    id v76 = [v75 URLByAppendingPathComponent:v74];

    v77 = [*(id *)(v21 + 3256) defaultManager];
    v78 = [v76 path];
    char v79 = [v77 fileExistsAtPath:v78];

    if ((v79 & 1) == 0)
    {
      uint64_t v80 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v81 = *MEMORY[0x1E4F1C3C8];
      v82 = NSString;
      v83 = (objc_class *)objc_opt_class();
      v84 = NSStringFromClass(v83);
      [v76 path];
      v86 = v85 = v60;
      v87 = [v82 stringWithFormat:@"%@: Background full size asset does not exist at path '%@'", v84, v86];
      v88 = [v80 exceptionWithName:v81 reason:v87 userInfo:0];

      v60 = v85;
      self = v137;
      [v88 raise];
    }
  }
  else
  {
    id v76 = 0;
  }
  objc_opt_class();
  v89 = [v6 objectForKeyedSubscript:@"foregroundFullSizeImageFileName"];
  if (v89)
  {
    if (objc_opt_isKindOfClass()) {
      v90 = v89;
    }
    else {
      v90 = 0;
    }
    id v91 = v90;
  }
  else
  {
    id v91 = 0;
  }

  v138 = v6;
  v92 = v76;
  v127 = v91;
  if (v91)
  {
    v93 = v60;
    v94 = [(WKWallpaperBundle *)self bundleURL];
    v95 = [v94 URLByAppendingPathComponent:v91];

    v96 = [MEMORY[0x1E4F28CB8] defaultManager];
    v97 = [v95 path];
    char v98 = [v96 fileExistsAtPath:v97];

    if ((v98 & 1) == 0)
    {
      v99 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v100 = *MEMORY[0x1E4F1C3C8];
      v101 = NSString;
      v102 = (objc_class *)objc_opt_class();
      v103 = NSStringFromClass(v102);
      v104 = [v95 path];
      v105 = [v101 stringWithFormat:@"%@: Foreground full size asset does not exist at path '%@'", v103, v104];
      v106 = [v99 exceptionWithName:v100 reason:v105 userInfo:0];

      id v6 = v138;
      [v106 raise];
    }
    v60 = v93;
  }
  else
  {
    v95 = 0;
  }
  objc_opt_class();
  v107 = [v6 objectForKeyedSubscript:@"floatingFullSizeImageFileName"];
  if (v107)
  {
    if (objc_opt_isKindOfClass()) {
      v108 = v107;
    }
    else {
      v108 = 0;
    }
    id v109 = v108;
  }
  else
  {
    id v109 = 0;
  }

  if (v109)
  {
    id v126 = v74;
    v110 = v60;
    v111 = [(WKWallpaperBundle *)v137 bundleURL];
    v112 = [v111 URLByAppendingPathComponent:v109];

    v113 = [MEMORY[0x1E4F28CB8] defaultManager];
    v114 = [v112 path];
    char v115 = [v113 fileExistsAtPath:v114];

    if ((v115 & 1) == 0)
    {
      v116 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v117 = *MEMORY[0x1E4F1C3C8];
      v118 = NSString;
      v119 = (objc_class *)objc_opt_class();
      v120 = NSStringFromClass(v119);
      v121 = [v112 path];
      v122 = [v118 stringWithFormat:@"%@: Floating full size asset does not exist at path '%@'", v120, v121];
      v123 = [v116 exceptionWithName:v117 reason:v122 userInfo:0];

      [v123 raise];
    }
    v60 = v110;
    id v74 = v126;
  }
  else
  {
    v112 = 0;
  }
  v124 = [[WKLayeredStillWallpaper alloc] initWithIdentifier:v133 name:v134 backgroundThumbnailImageURL:v131 foregroundThumbnailImageURL:v129 floatingThumbnailImageURL:v60 backgroundFullSizeImageURL:v92 foregroundFullSizeImageURL:v95 floatingFullSizeImageURL:v112];

  return v124;
}

- (id)_layeredStripeWallpaperWithMetadataDictionary:(id)a3 wallpaperAppearance:(id)a4
{
  v55[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  id v8 = [v6 objectForKeyedSubscript:@"identifier"];
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }

  if (!v10)
  {
    v55[0] = @"assets";
    v55[1] = v7;
    v55[2] = @"identifier";
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:3];
    id v12 = [v11 componentsJoinedByString:@"."];
    [(WKWallpaperBundle *)self _raiseInvalidMetadataExceptionForMetadataKeypath:v12];
  }
  uint64_t v49 = [v10 integerValue];
  objc_opt_class();
  id v13 = [v6 objectForKeyedSubscript:@"name"];
  if (v13)
  {
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }
    id v15 = v14;
  }
  else
  {
    id v15 = 0;
  }

  if (!v15)
  {
    v54[0] = @"assets";
    v54[1] = v7;
    v54[2] = @"name";
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:3];
    id v17 = [v16 componentsJoinedByString:@"."];
    [(WKWallpaperBundle *)self _raiseInvalidMetadataExceptionForMetadataKeypath:v17];
  }
  objc_opt_class();
  int v18 = [v6 objectForKeyedSubscript:@"backgroundColor"];
  if (v18)
  {
    if (objc_opt_isKindOfClass()) {
      objc_super v19 = v18;
    }
    else {
      objc_super v19 = 0;
    }
    id v20 = v19;
  }
  else
  {
    id v20 = 0;
  }
  id v50 = v10;

  if (!v20)
  {
    v53[0] = @"assets";
    v53[1] = v7;
    v53[2] = @"backgroundColor";
    unint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:3];
    unint64_t v22 = [v21 componentsJoinedByString:@"."];
    [(WKWallpaperBundle *)self _raiseInvalidMetadataExceptionForMetadataKeypath:v22];
  }
  uint64_t v23 = v7;
  uint64_t v24 = objc_msgSend(MEMORY[0x1E4FB1618], "wk_colorWithHexString:", v20);
  objc_opt_class();
  uint64_t v25 = [v6 objectForKeyedSubscript:@"stripeAngleDegrees"];
  if (v25)
  {
    if (objc_opt_isKindOfClass()) {
      char v26 = v25;
    }
    else {
      char v26 = 0;
    }
    id v27 = v26;
  }
  else
  {
    id v27 = 0;
  }

  if (!v27)
  {
    v52[0] = @"assets";
    v52[1] = v23;
    v52[2] = @"stripeAngleDegrees";
    uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:3];
    uint64_t v29 = [v28 componentsJoinedByString:@"."];
    [(WKWallpaperBundle *)self _raiseInvalidMetadataExceptionForMetadataKeypath:v29];
  }
  objc_opt_class();
  uint64_t v30 = [v6 objectForKeyedSubscript:@"stripeHeightFactor"];
  if (v30)
  {
    if (objc_opt_isKindOfClass()) {
      id v31 = v30;
    }
    else {
      id v31 = 0;
    }
    id v32 = v31;
  }
  else
  {
    id v32 = 0;
  }

  if (!v32)
  {
    v51[0] = @"assets";
    v51[1] = v23;
    v51[2] = @"stripeHeightFactor";
    id v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:3];
    v34 = [v33 componentsJoinedByString:@"."];
    [(WKWallpaperBundle *)self _raiseInvalidMetadataExceptionForMetadataKeypath:v34];
  }
  objc_opt_class();
  id v35 = [v6 objectForKeyedSubscript:@"firstStripeVerticalOffsetScaleFactor"];
  if (v35)
  {
    if (objc_opt_isKindOfClass()) {
      id v36 = v35;
    }
    else {
      id v36 = 0;
    }
    id v37 = v36;
  }
  else
  {
    id v37 = 0;
  }

  if (v37)
  {
    objc_opt_class();
    uint64_t v38 = [v6 objectForKeyedSubscript:@"firstStripeVerticalOffsetScaleFactor"];
    if (v38)
    {
      if (objc_opt_isKindOfClass()) {
        id v39 = v38;
      }
      else {
        id v39 = 0;
      }
      id v40 = v39;
    }
    else
    {
      id v40 = 0;
    }
  }
  else
  {
    id v40 = &unk_1F18C1E20;
  }
  long long v41 = [WKLayeredStripeWallpaper alloc];
  [v27 doubleValue];
  double v43 = v42;
  [v32 doubleValue];
  double v45 = v44;
  [v40 doubleValue];
  uint64_t v47 = [(WKLayeredStripeWallpaper *)v41 initWithIdentifier:v49 name:v15 backgroundColor:v24 stripeAngleDegrees:v43 stripeHeightFactor:v45 firstStripeOffsetScaleFactor:v46];

  return v47;
}

- (id)_bokehWallpaperWithMetadataDictionary:(id)a3 wallpaperAppearance:(id)a4
{
  v71[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  id v8 = [v6 objectForKeyedSubscript:@"identifier"];
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }

  if (!v10)
  {
    v71[0] = @"assets";
    v71[1] = v7;
    v71[2] = @"identifier";
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:3];
    id v12 = [v11 componentsJoinedByString:@"."];
    [(WKWallpaperBundle *)self _raiseInvalidMetadataExceptionForMetadataKeypath:v12];
  }
  char v63 = v10;
  uint64_t v61 = [v10 integerValue];
  objc_opt_class();
  id v13 = [v6 objectForKeyedSubscript:@"name"];
  if (v13)
  {
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }
    id v15 = v14;
  }
  else
  {
    id v15 = 0;
  }

  v62 = v15;
  if (!v15)
  {
    v70[0] = @"assets";
    v70[1] = v7;
    v70[2] = @"name";
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:3];
    id v17 = [v16 componentsJoinedByString:@"."];
    [(WKWallpaperBundle *)self _raiseInvalidMetadataExceptionForMetadataKeypath:v17];
  }
  objc_opt_class();
  int v18 = [v6 objectForKeyedSubscript:@"backgroundColors"];
  if (v18)
  {
    if (objc_opt_isKindOfClass()) {
      objc_super v19 = v18;
    }
    else {
      objc_super v19 = 0;
    }
    id v20 = v19;
  }
  else
  {
    id v20 = 0;
  }

  if (!v20)
  {
    v69[0] = @"assets";
    v69[1] = v7;
    v69[2] = @"backgroundColors";
    unint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:3];
    unint64_t v22 = [v21 componentsJoinedByString:@"."];
    [(WKWallpaperBundle *)self _raiseInvalidMetadataExceptionForMetadataKeypath:v22];
  }
  v60 = v20;
  __int16 v59 = objc_msgSend(v20, "na_map:", &__block_literal_global_271);
  objc_opt_class();
  uint64_t v23 = [v6 objectForKeyedSubscript:@"bubbleColors"];
  if (v23)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v24 = v23;
    }
    else {
      uint64_t v24 = 0;
    }
    id v25 = v24;
  }
  else
  {
    id v25 = 0;
  }

  if (!v25)
  {
    v68[0] = @"assets";
    v68[1] = v7;
    v68[2] = @"bubbleColors";
    char v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:3];
    id v27 = [v26 componentsJoinedByString:@"."];
    [(WKWallpaperBundle *)self _raiseInvalidMetadataExceptionForMetadataKeypath:v27];
  }
  __int16 v57 = v25;
  id v58 = objc_msgSend(v25, "na_map:", &__block_literal_global_273);
  objc_opt_class();
  uint64_t v28 = [v6 objectForKeyedSubscript:@"bubbleCount"];
  if (v28)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v29 = v28;
    }
    else {
      uint64_t v29 = 0;
    }
    id v30 = v29;
  }
  else
  {
    id v30 = 0;
  }

  if (!v30)
  {
    v67[0] = @"assets";
    v67[1] = v7;
    v67[2] = @"bubbleCount";
    id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:3];
    id v32 = [v31 componentsJoinedByString:@"."];
    [(WKWallpaperBundle *)self _raiseInvalidMetadataExceptionForMetadataKeypath:v32];
  }
  objc_opt_class();
  id v33 = [v6 objectForKeyedSubscript:@"bubbleScale"];
  if (v33)
  {
    if (objc_opt_isKindOfClass()) {
      v34 = v33;
    }
    else {
      v34 = 0;
    }
    id v35 = v34;
  }
  else
  {
    id v35 = 0;
  }

  if (!v35)
  {
    v66[0] = @"assets";
    v66[1] = v7;
    v66[2] = @"bubbleScale";
    id v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:3];
    id v37 = [v36 componentsJoinedByString:@"."];
    [(WKWallpaperBundle *)self _raiseInvalidMetadataExceptionForMetadataKeypath:v37];
  }
  uint64_t v38 = self;
  id v39 = v7;
  objc_opt_class();
  id v40 = [v6 objectForKeyedSubscript:@"parallaxMultiplier"];
  if (v40)
  {
    if (objc_opt_isKindOfClass()) {
      long long v41 = v40;
    }
    else {
      long long v41 = 0;
    }
    id v42 = v41;
  }
  else
  {
    id v42 = 0;
  }

  if (!v42)
  {
    v65[0] = @"assets";
    v65[1] = v7;
    v65[2] = @"parallaxMultiplier";
    double v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:3];
    double v44 = [v43 componentsJoinedByString:@"."];
    [(WKWallpaperBundle *)v38 _raiseInvalidMetadataExceptionForMetadataKeypath:v44];
  }
  objc_opt_class();
  double v45 = [v6 objectForKeyedSubscript:@"thumbnailSeed"];
  if (v45)
  {
    if (objc_opt_isKindOfClass()) {
      double v46 = v45;
    }
    else {
      double v46 = 0;
    }
    id v47 = v46;
  }
  else
  {
    id v47 = 0;
  }

  if (!v47)
  {
    v64[0] = @"assets";
    v64[1] = v39;
    v64[2] = @"thumbnailSeed";
    double v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:3];
    uint64_t v49 = [v48 componentsJoinedByString:@"."];
    [(WKWallpaperBundle *)v38 _raiseInvalidMetadataExceptionForMetadataKeypath:v49];
  }
  id v50 = [WKBokehWallpaper alloc];
  uint64_t v51 = [v30 integerValue];
  [v35 doubleValue];
  double v53 = v52;
  [v42 doubleValue];
  id v55 = -[WKBokehWallpaper initWithIdentifier:name:backgroundColors:bubbleColors:bubbleCount:bubbleScale:parallaxMultiplier:thumbnailSeed:](v50, "initWithIdentifier:name:backgroundColors:bubbleColors:bubbleCount:bubbleScale:parallaxMultiplier:thumbnailSeed:", v61, v62, v59, v58, v51, [v47 integerValue], v53, v54);

  return v55;
}

id __79__WKWallpaperBundle__bokehWallpaperWithMetadataDictionary_wallpaperAppearance___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }

  id v6 = objc_msgSend(MEMORY[0x1E4FB1618], "wk_colorWithHexString:", v3);

  return v6;
}

id __79__WKWallpaperBundle__bokehWallpaperWithMetadataDictionary_wallpaperAppearance___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }

  id v6 = objc_msgSend(MEMORY[0x1E4FB1618], "wk_colorWithHexString:", v3);

  return v6;
}

- (id)_layeredAnimationWallpaperWithMetadataDictionary:(id)a3 wallpaperAppearance:(id)a4
{
  v77[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v75 = a4;
  objc_opt_class();
  id v7 = [v6 objectForKeyedSubscript:@"identifier"];
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;
  }
  else
  {
    id v9 = 0;
  }

  if (!v9)
  {
    v77[0] = @"assets";
    v77[1] = v75;
    v77[2] = @"identifier";
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:3];
    id v11 = [v10 componentsJoinedByString:@"."];
    [(WKWallpaperBundle *)self _raiseInvalidMetadataExceptionForMetadataKeypath:v11];
  }
  uint64_t v72 = [v9 integerValue];
  objc_opt_class();
  id v12 = [v6 objectForKeyedSubscript:@"name"];
  if (v12)
  {
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;
  }
  else
  {
    id v14 = 0;
  }

  if (!v14)
  {
    v76[0] = @"assets";
    v76[1] = v75;
    v76[2] = @"name";
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:3];
    id v16 = [v15 componentsJoinedByString:@"."];
    [(WKWallpaperBundle *)self _raiseInvalidMetadataExceptionForMetadataKeypath:v16];
  }
  objc_opt_class();
  id v17 = [v6 objectForKeyedSubscript:@"backgroundAnimationFileName"];
  if (v17)
  {
    if (objc_opt_isKindOfClass()) {
      int v18 = v17;
    }
    else {
      int v18 = 0;
    }
    id v19 = v18;
  }
  else
  {
    id v19 = 0;
  }

  v73 = v19;
  id v74 = v14;
  if (v19)
  {
    id v20 = [(WKWallpaperBundle *)self bundleURL];
    unint64_t v21 = [v20 URLByAppendingPathComponent:v19];

    unint64_t v22 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v23 = [v21 path];
    char v24 = [v22 fileExistsAtPath:v23];

    if ((v24 & 1) == 0)
    {
      id v25 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v26 = *MEMORY[0x1E4F1C3C8];
      id v27 = NSString;
      uint64_t v28 = (objc_class *)objc_opt_class();
      uint64_t v29 = NSStringFromClass(v28);
      id v30 = [v21 path];
      id v31 = [v27 stringWithFormat:@"%@: Background animation asset does not exist at path '%@'", v29, v30];
      id v32 = [v25 exceptionWithName:v26 reason:v31 userInfo:0];

      [v32 raise];
    }
  }
  else
  {
    unint64_t v21 = 0;
  }
  objc_opt_class();
  id v33 = [v6 objectForKeyedSubscript:@"foregroundAnimationFileName"];
  if (v33)
  {
    if (objc_opt_isKindOfClass()) {
      v34 = v33;
    }
    else {
      v34 = 0;
    }
    id v35 = v34;
  }
  else
  {
    id v35 = 0;
  }

  if (v35)
  {
    id v36 = [(WKWallpaperBundle *)self bundleURL];
    id v37 = [v36 URLByAppendingPathComponent:v35];

    uint64_t v38 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v39 = [v37 path];
    char v40 = [v38 fileExistsAtPath:v39];

    if ((v40 & 1) == 0)
    {
      v68 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v41 = *MEMORY[0x1E4F1C3C8];
      id v42 = NSString;
      double v43 = (objc_class *)objc_opt_class();
      NSStringFromClass(v43);
      double v44 = v70 = v21;
      double v45 = [v37 path];
      double v46 = [v42 stringWithFormat:@"%@: Foreground animation asset does not exist at path '%@'", v44, v45];
      id v47 = [v68 exceptionWithName:v41 reason:v46 userInfo:0];

      unint64_t v21 = v70;
      [v47 raise];
    }
  }
  else
  {
    id v37 = 0;
  }
  objc_opt_class();
  double v48 = [v6 objectForKeyedSubscript:@"floatingAnimationFileNameKey"];
  if (v48)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v49 = v48;
    }
    else {
      uint64_t v49 = 0;
    }
    id v50 = v49;
  }
  else
  {
    id v50 = 0;
  }

  if (v50)
  {
    id v69 = v35;
    id v71 = v6;
    uint64_t v51 = v21;
    double v52 = [(WKWallpaperBundle *)self bundleURL];
    double v53 = [v52 URLByAppendingPathComponent:v50];

    double v54 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v55 = [v53 path];
    char v56 = [v54 fileExistsAtPath:v55];

    if ((v56 & 1) == 0)
    {
      __int16 v57 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v58 = *MEMORY[0x1E4F1C3C8];
      __int16 v59 = NSString;
      v60 = (objc_class *)objc_opt_class();
      uint64_t v61 = NSStringFromClass(v60);
      [v53 path];
      char v63 = v62 = v9;
      v64 = [v59 stringWithFormat:@"%@: Floating animation asset does not exist at path '%@'", v61, v63];
      uint64_t v65 = [v57 exceptionWithName:v58 reason:v64 userInfo:0];

      id v9 = v62;
      [v65 raise];
    }
    unint64_t v21 = v51;
    id v35 = v69;
    id v6 = v71;
  }
  else
  {
    double v53 = 0;
  }
  v66 = [[WKLayeredAnimationWallpaper alloc] initWithIdentifier:v72 name:v74 backgroundAnimationFileURL:v21 foregroundAnimationFileURL:v37 floatingAnimationFileURL:v53];

  return v66;
}

- (id)_parameterizedCAWallpaperWithMetadataDictionary:(id)a3 wallpaperAppearance:(id)a4
{
  v40[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  id v8 = [v6 objectForKeyedSubscript:@"identifier"];
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }

  if (!v10)
  {
    v40[0] = @"assets";
    v40[1] = v7;
    v40[2] = @"identifier";
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:3];
    id v12 = [v11 componentsJoinedByString:@"."];
    [(WKWallpaperBundle *)self _raiseInvalidMetadataExceptionForMetadataKeypath:v12];
  }
  uint64_t v13 = [v10 integerValue];
  objc_opt_class();
  id v14 = [v6 objectForKeyedSubscript:@"name"];
  if (v14)
  {
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }
    id v16 = v15;
  }
  else
  {
    id v16 = 0;
  }

  if (!v16)
  {
    v39[0] = @"assets";
    v39[1] = v7;
    v39[2] = @"name";
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:3];
    int v18 = [v17 componentsJoinedByString:@"."];
    [(WKWallpaperBundle *)self _raiseInvalidMetadataExceptionForMetadataKeypath:v18];
  }
  objc_opt_class();
  id v19 = [v6 objectForKeyedSubscript:@"assetFileName"];
  if (v19)
  {
    if (objc_opt_isKindOfClass()) {
      id v20 = v19;
    }
    else {
      id v20 = 0;
    }
    id v21 = v20;
  }
  else
  {
    id v21 = 0;
  }

  if (v21)
  {
    uint64_t v37 = v13;
    id v38 = v7;
    unint64_t v22 = [(WKWallpaperBundle *)self bundleURL];
    uint64_t v23 = [v22 URLByAppendingPathComponent:v21];

    char v24 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v25 = [v23 path];
    char v26 = [v24 fileExistsAtPath:v25];

    if ((v26 & 1) == 0)
    {
      id v27 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v28 = *MEMORY[0x1E4F1C3C8];
      uint64_t v29 = NSString;
      id v30 = (objc_class *)objc_opt_class();
      id v31 = NSStringFromClass(v30);
      id v32 = [v23 path];
      id v33 = [v29 stringWithFormat:@"%@: CA asset does not exist at path '%@'", v31, v32];
      v34 = [v27 exceptionWithName:v28 reason:v33 userInfo:0];

      [v34 raise];
    }
    uint64_t v13 = v37;
    id v7 = v38;
  }
  else
  {
    uint64_t v23 = 0;
  }
  id v35 = [[WKParameterizedCAWallpaper alloc] initWithIdentifier:v13 name:v16 fileURL:v23];

  return v35;
}

id __32__WKWallpaperBundle_na_identity__block_invoke()
{
  if (WKWallpaperMetadataOptionPreferredTitleColorKey_block_invoke_na_once_token_21 != -1) {
    dispatch_once(&WKWallpaperMetadataOptionPreferredTitleColorKey_block_invoke_na_once_token_21, &__block_literal_global_294);
  }
  v0 = (void *)WKWallpaperMetadataOptionPreferredTitleColorKey_block_invoke_na_once_object_21;
  return v0;
}

uint64_t __32__WKWallpaperBundle_na_identity__block_invoke_2()
{
  WKWallpaperMetadataOptionPreferredTitleColorKey_block_invoke_na_once_object_21 = __32__WKWallpaperBundle_na_identity__block_invoke_3();
  return MEMORY[0x1F41817F8]();
}

id __32__WKWallpaperBundle_na_identity__block_invoke_3()
{
  v0 = [MEMORY[0x1E4F7A0E0] builder];
  id v1 = (id)[v0 appendIntegerCharacteristic:&__block_literal_global_301];
  id v2 = (id)[v0 appendIntegerCharacteristic:&__block_literal_global_303];
  id v3 = (id)[v0 appendCharacteristic:&__block_literal_global_306];
  id v4 = (id)[v0 appendCharacteristic:&__block_literal_global_308];
  id v5 = (id)[v0 appendCharacteristic:&__block_literal_global_310];
  id v6 = (id)[v0 appendCharacteristic:&__block_literal_global_312];
  id v7 = (id)[v0 appendCharacteristic:&__block_literal_global_314];
  id v8 = (id)[v0 appendCharacteristic:&__block_literal_global_316];
  id v9 = (id)[v0 appendCharacteristic:&__block_literal_global_318];
  id v10 = (id)[v0 appendCharacteristic:&__block_literal_global_320];
  id v11 = (id)[v0 appendCharacteristic:&__block_literal_global_322];
  id v12 = (id)[v0 appendCharacteristic:&__block_literal_global_324];
  id v13 = (id)[v0 appendCharacteristic:&__block_literal_global_326];
  id v14 = (id)[v0 appendCharacteristic:&__block_literal_global_328];
  id v15 = [v0 build];

  return v15;
}

uint64_t __32__WKWallpaperBundle_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 version];
}

uint64_t __32__WKWallpaperBundle_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __32__WKWallpaperBundle_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 name];
}

uint64_t __32__WKWallpaperBundle_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 family];
}

id __32__WKWallpaperBundle_na_identity__block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [a2 _wallpaperAssetLookup];
  id v4 = [v3 allValues];
  id v5 = [v2 setWithArray:v4];

  return v5;
}

uint64_t __32__WKWallpaperBundle_na_identity__block_invoke_9(uint64_t a1, void *a2)
{
  return [a2 bundleURL];
}

uint64_t __32__WKWallpaperBundle_na_identity__block_invoke_10(uint64_t a1, void *a2)
{
  return [a2 thumbnailImageURL];
}

uint64_t __32__WKWallpaperBundle_na_identity__block_invoke_11(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 isAppearanceAware];
  return [v2 numberWithBool:v3];
}

uint64_t __32__WKWallpaperBundle_na_identity__block_invoke_12(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 hasDistinctWallpapersForLocations];
  return [v2 numberWithBool:v3];
}

uint64_t __32__WKWallpaperBundle_na_identity__block_invoke_13(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 disableParallax];
  return [v2 numberWithBool:v3];
}

uint64_t __32__WKWallpaperBundle_na_identity__block_invoke_14(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 isOffloaded];
  return [v2 numberWithBool:v3];
}

uint64_t __32__WKWallpaperBundle_na_identity__block_invoke_15(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 disableModifyingLegibilityBlur];
  return [v2 numberWithBool:v3];
}

uint64_t __32__WKWallpaperBundle_na_identity__block_invoke_16(uint64_t a1, void *a2)
{
  return [a2 adjustmentTraits];
}

uint64_t __32__WKWallpaperBundle_na_identity__block_invoke_17(uint64_t a1, void *a2)
{
  return [a2 preferredTitleColors];
}

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

+ (id)_createWallpaperBundleInDirectory:(id)a3 version:(int64_t)a4 identifier:(int64_t)a5 name:(id)a6 family:(id)a7 disableParallax:(BOOL)a8 isOffloaded:(BOOL)a9 logicalScreenClass:(id)a10 thumbnailImageURL:(id)a11 adjustmentTraits:(id)a12 preferredProminentColors:(id)a13 preferredTitleColors:(id)a14 assetMapping:(id)a15
{
  BOOL v70 = a8;
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v80 = a3;
  id v76 = a6;
  id v77 = a7;
  id v75 = a10;
  id v82 = a11;
  id v74 = a12;
  id v78 = a13;
  id v79 = a14;
  id v19 = a15;
  if (objc_msgSend(v19, "na_allSatisfy:", &__block_literal_global_331))
  {
    v73 = [MEMORY[0x1E4F29128] UUID];
    id v20 = [v73 UUIDString];
    uint64_t v72 = [v20 stringByAppendingPathExtension:@"wallpaper"];

    uint64_t v81 = [v80 URLByAppendingPathComponent:v72 isDirectory:1];
    id v21 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v97 = 0;
    char v22 = [v21 createDirectoryAtURL:v81 withIntermediateDirectories:1 attributes:0 error:&v97];
    id v23 = v97;

    if ((v22 & 1) == 0)
    {
      id v38 = WKLogForCategory(3uLL);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        +[WKWallpaperBundle _createWallpaperBundleInDirectory:version:identifier:name:family:disableParallax:isOffloaded:logicalScreenClass:thumbnailImageURL:adjustmentTraits:preferredProminentColors:preferredTitleColors:assetMapping:].cold.5();
      }

      uint64_t v37 = 0;
      goto LABEL_54;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __227__WKWallpaperBundle__createWallpaperBundleInDirectory_version_identifier_name_family_disableParallax_isOffloaded_logicalScreenClass_thumbnailImageURL_adjustmentTraits_preferredProminentColors_preferredTitleColors_assetMapping___block_invoke_336;
    aBlock[3] = &unk_1E63766D0;
    char v96 = 0;
    aBlock[4] = v81;
    v68 = (void (**)(void))_Block_copy(aBlock);
    if (v82)
    {
      char v24 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v25 = [v82 lastPathComponent];
      char v26 = [v81 URLByAppendingPathComponent:v25];
      id v94 = v23;
      char v27 = [v24 copyItemAtURL:v82 toURL:v26 error:&v94];
      id v28 = v94;

      if ((v27 & 1) == 0)
      {
        uint64_t v29 = WKLogForCategory(3uLL);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          +[WKWallpaperBundle _createWallpaperBundleInDirectory:version:identifier:name:family:disableParallax:isOffloaded:logicalScreenClass:thumbnailImageURL:adjustmentTraits:preferredProminentColors:preferredTitleColors:assetMapping:].cold.4();
        }
        uint64_t v37 = 0;
        goto LABEL_53;
      }
      id v23 = v28;
    }
    uint64_t v29 = [MEMORY[0x1E4F1CA60] dictionary];
    id v30 = [NSNumber numberWithInteger:a4];
    [v29 na_safeSetObject:v30 forKey:@"version"];

    id v31 = [NSNumber numberWithInteger:a5];
    [v29 na_safeSetObject:v31 forKey:@"identifier"];

    [v29 na_safeSetObject:v76 forKey:@"name"];
    [v29 na_safeSetObject:v77 forKey:@"family"];
    unint64_t v32 = [v19 count];
    if (v32 < 2)
    {
      id v39 = [v19 objectForKeyedSubscript:@"WKWallpaperLocationLockAndHomeScreen"];

      if (v39) {
        [v19 objectForKeyedSubscript:@"WKWallpaperLocationLockAndHomeScreen"];
      }
      else {
      id v33 = [v19 objectForKeyedSubscript:@"WKWallpaperLocationCoverSheet"];
      }
      v34 = [v33 objectForKey:@"dark"];
    }
    else
    {
      id v33 = [v19 objectForKeyedSubscript:@"WKWallpaperLocationCoverSheet"];
      v34 = [v33 objectForKey:@"dark"];
    }
    char v40 = v34;

    uint64_t v41 = [NSNumber numberWithBool:v40 != 0];
    [v29 na_safeSetObject:v41 forKey:@"appearanceAware"];

    id v42 = [NSNumber numberWithBool:v70];
    [v29 na_safeSetObject:v42 forKey:@"disableParallax"];

    double v43 = [NSNumber numberWithBool:a9];
    [v29 na_safeSetObject:v43 forKey:@"offloaded"];

    [v29 na_safeSetObject:v75 forKey:@"logicalScreenClass"];
    [v29 na_safeSetObject:v78 forKey:@"preferredProminentColor"];
    [v29 na_safeSetObject:v79 forKey:@"preferredTitleColor"];
    double v44 = [v82 lastPathComponent];
    [v29 na_safeSetObject:v44 forKey:@"thumbnailImageFileName"];

    id v71 = [MEMORY[0x1E4F1CA60] dictionary];
    if (v32 < 2)
    {
      id v47 = [v19 objectForKeyedSubscript:@"WKWallpaperLocationLockAndHomeScreen"];
      if (!v47)
      {
        id v47 = [v19 objectForKeyedSubscript:@"WKWallpaperLocationCoverSheet"];
      }
      double v48 = objc_msgSend(v47, "na_dictionaryByMappingValues:", &__block_literal_global_345);
      [v71 setObject:v48 forKeyedSubscript:@"lockAndHome"];
    }
    else
    {
      double v45 = [v19 objectForKeyedSubscript:@"WKWallpaperLocationCoverSheet"];
      double v46 = objc_msgSend(v45, "na_dictionaryByMappingValues:", &__block_literal_global_340);
      [v71 setObject:v46 forKeyedSubscript:@"lock"];

      id v47 = [v19 objectForKeyedSubscript:@"WKWallpaperLocationHomeScreen"];
      double v48 = objc_msgSend(v47, "na_dictionaryByMappingValues:", &__block_literal_global_343);
      [v71 setObject:v48 forKeyedSubscript:@"home"];
    }

    [v29 na_safeSetObject:v71 forKey:@"assets"];
    uint64_t v49 = [v74 propertyListRepresentation];
    [v29 na_safeSetObject:v49 forKey:@"adjustments"];

    id v69 = [v81 URLByAppendingPathComponent:@"Wallpaper.plist"];
    id v93 = 0;
    v67 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v29 format:100 options:0 error:&v93];
    id v28 = v93;

    if (v28)
    {
      id v50 = WKLogForCategory(3uLL);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
        +[WKWallpaperBundle _createWallpaperBundleInDirectory:version:identifier:name:family:disableParallax:isOffloaded:logicalScreenClass:thumbnailImageURL:adjustmentTraits:preferredProminentColors:preferredTitleColors:assetMapping:]();
      }
    }
    else
    {
      id v92 = 0;
      char v51 = [v67 writeToURL:v69 options:1 error:&v92];
      id v28 = v92;
      if (v51)
      {
        long long v90 = 0u;
        long long v91 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        id v50 = v19;
        uint64_t v52 = [v50 countByEnumeratingWithState:&v88 objects:v99 count:16];
        if (v52)
        {
          uint64_t v53 = *(void *)v89;
          uint64_t v64 = *(void *)v89;
          do
          {
            uint64_t v65 = v52;
            for (uint64_t i = 0; i != v65; ++i)
            {
              if (*(void *)v89 != v53) {
                objc_enumerationMutation(v50);
              }
              double v54 = [v50 objectForKeyedSubscript:*(void *)(*((void *)&v88 + 1) + 8 * i)];
              long long v86 = 0u;
              long long v87 = 0u;
              long long v84 = 0u;
              long long v85 = 0u;
              id v55 = v54;
              uint64_t v56 = [v55 countByEnumeratingWithState:&v84 objects:v98 count:16];
              if (v56)
              {
                uint64_t v57 = *(void *)v85;
                uint64_t v58 = v28;
                while (2)
                {
                  for (uint64_t j = 0; j != v56; ++j)
                  {
                    if (*(void *)v85 != v57) {
                      objc_enumerationMutation(v55);
                    }
                    v60 = [v55 objectForKeyedSubscript:*(void *)(*((void *)&v84 + 1) + 8 * j)];
                    id v83 = v58;
                    [v60 copyWallpaperContentsToDestinationDirectoryURL:v81 error:&v83];
                    id v28 = v83;

                    if (v28)
                    {
                      id v62 = WKLogForCategory(3uLL);
                      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
                        +[WKWallpaperBundle _createWallpaperBundleInDirectory:version:identifier:name:family:disableParallax:isOffloaded:logicalScreenClass:thumbnailImageURL:adjustmentTraits:preferredProminentColors:preferredTitleColors:assetMapping:]();
                      }

                      goto LABEL_51;
                    }

                    uint64_t v58 = 0;
                  }
                  uint64_t v56 = [v55 countByEnumeratingWithState:&v84 objects:v98 count:16];
                  uint64_t v58 = 0;
                  id v28 = 0;
                  if (v56) {
                    continue;
                  }
                  break;
                }
              }

              uint64_t v53 = v64;
            }
            uint64_t v52 = [v50 countByEnumeratingWithState:&v88 objects:v99 count:16];
          }
          while (v52);
        }

        uint64_t v37 = [[WKWallpaperBundle alloc] initWithURL:v81];
        goto LABEL_52;
      }
      id v50 = WKLogForCategory(3uLL);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        uint64_t v61 = [v69 path];
        +[WKWallpaperBundle _createWallpaperBundleInDirectory:version:identifier:name:family:disableParallax:isOffloaded:logicalScreenClass:thumbnailImageURL:adjustmentTraits:preferredProminentColors:preferredTitleColors:assetMapping:](v61, (uint64_t)v28, buf, v50);
      }
    }
LABEL_51:

    uint64_t v37 = 0;
LABEL_52:

LABEL_53:
    v68[2]();

    id v23 = v28;
LABEL_54:

    id v36 = v73;
    goto LABEL_55;
  }
  id v35 = WKLogForCategory(3uLL);
  id v36 = v35;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    +[WKWallpaperBundle _createWallpaperBundleInDirectory:version:identifier:name:family:disableParallax:isOffloaded:logicalScreenClass:thumbnailImageURL:adjustmentTraits:preferredProminentColors:preferredTitleColors:assetMapping:].cold.6(v35);
    uint64_t v37 = 0;
    id v36 = v35;
  }
  else
  {
    uint64_t v37 = 0;
  }
LABEL_55:

  return v37;
}

uint64_t __227__WKWallpaperBundle__createWallpaperBundleInDirectory_version_identifier_name_family_disableParallax_isOffloaded_logicalScreenClass_thumbnailImageURL_adjustmentTraits_preferredProminentColors_preferredTitleColors_assetMapping___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "na_allSatisfy:", &__block_literal_global_334);
}

uint64_t __227__WKWallpaperBundle__createWallpaperBundleInDirectory_version_identifier_name_family_disableParallax_isOffloaded_logicalScreenClass_thumbnailImageURL_adjustmentTraits_preferredProminentColors_preferredTitleColors_assetMapping___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  int v4 = [v3 supportsCopying];
  uint64_t v5 = v4 & [v3 supportsSerialization];
  if ((v5 & 1) == 0)
  {
    id v6 = WKLogForCategory(3uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __227__WKWallpaperBundle__createWallpaperBundleInDirectory_version_identifier_name_family_disableParallax_isOffloaded_logicalScreenClass_thumbnailImageURL_adjustmentTraits_preferredProminentColors_preferredTitleColors_assetMapping___block_invoke_2_cold_1();
    }
  }
  return v5;
}

void __227__WKWallpaperBundle__createWallpaperBundleInDirectory_version_identifier_name_family_disableParallax_isOffloaded_logicalScreenClass_thumbnailImageURL_adjustmentTraits_preferredProminentColors_preferredTitleColors_assetMapping___block_invoke_336(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v2 = WKLogForCategory(3uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __227__WKWallpaperBundle__createWallpaperBundleInDirectory_version_identifier_name_family_disableParallax_isOffloaded_logicalScreenClass_thumbnailImageURL_adjustmentTraits_preferredProminentColors_preferredTitleColors_assetMapping___block_invoke_336_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
    }

    id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v9 removeItemAtURL:*(void *)(a1 + 32) error:0];
  }
}

uint64_t __227__WKWallpaperBundle__createWallpaperBundleInDirectory_version_identifier_name_family_disableParallax_isOffloaded_logicalScreenClass_thumbnailImageURL_adjustmentTraits_preferredProminentColors_preferredTitleColors_assetMapping___block_invoke_337(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 propertyListRepresentation];
}

uint64_t __227__WKWallpaperBundle__createWallpaperBundleInDirectory_version_identifier_name_family_disableParallax_isOffloaded_logicalScreenClass_thumbnailImageURL_adjustmentTraits_preferredProminentColors_preferredTitleColors_assetMapping___block_invoke_2_341(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 propertyListRepresentation];
}

uint64_t __227__WKWallpaperBundle__createWallpaperBundleInDirectory_version_identifier_name_family_disableParallax_isOffloaded_logicalScreenClass_thumbnailImageURL_adjustmentTraits_preferredProminentColors_preferredTitleColors_assetMapping___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 propertyListRepresentation];
}

- (NADescriptionBuilder)wk_descriptionBuilder
{
  uint64_t v3 = [MEMORY[0x1E4F7A0D0] builderWithObject:self];
  objc_initWeak(&location, self);
  uint64_t v4 = [v3 activeMultilinePrefix];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__WKWallpaperBundle_wk_descriptionBuilder__block_invoke;
  v7[3] = &unk_1E6376718;
  objc_copyWeak(&v9, &location);
  id v5 = v3;
  id v8 = v5;
  [v5 appendBodySectionWithName:0 multilinePrefix:v4 block:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return (NADescriptionBuilder *)v5;
}

void __42__WKWallpaperBundle_wk_descriptionBuilder__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained descriptionBuilderBlock];
  v2[2](v2, *(void *)(a1 + 32));
}

- (NSString)description
{
  id v2 = [(WKWallpaperBundle *)self wk_descriptionBuilder];
  uint64_t v3 = [v2 build];

  return (NSString *)v3;
}

- (id)descriptionBuilderBlock
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__WKWallpaperBundle_descriptionBuilderBlock__block_invoke;
  v4[3] = &unk_1E6376740;
  objc_copyWeak(&v5, &location);
  id v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __44__WKWallpaperBundle_descriptionBuilderBlock__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained identifierString];
  [v3 appendString:v5 withName:@"identifierString"];

  id v6 = (id)objc_msgSend(v3, "appendInteger:withName:", objc_msgSend(WeakRetained, "version"), @"version");
  uint64_t v7 = [WeakRetained name];
  [v3 appendString:v7 withName:@"name"];

  id v8 = [WeakRetained family];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    id v10 = [WeakRetained family];
    [v3 appendString:v10 withName:@"family"];
  }
  id v11 = (id)objc_msgSend(v3, "appendBool:withName:", objc_msgSend(WeakRetained, "isAppearanceAware"), @"isAppearanceAware");
  id v12 = (id)objc_msgSend(v3, "appendBool:withName:", objc_msgSend(WeakRetained, "hasDistinctWallpapersForLocations"), @"hasDistinctWallpapersForLocations");
  id v13 = (id)objc_msgSend(v3, "appendBool:withName:", objc_msgSend(WeakRetained, "disableParallax"), @"disableParallax");
  id v14 = (id)objc_msgSend(v3, "appendBool:withName:", objc_msgSend(WeakRetained, "isOffloaded"), @"isOffloaded");
  id v15 = [WeakRetained adjustmentTraits];
  id v16 = (id)[v3 appendObject:v15 withName:@"adjustmentTraits"];

  id v17 = [WeakRetained preferredTitleColors];
  id v39 = v3;
  id v18 = (id)[v3 appendObject:v17 withName:@"preferredTitleColors"];

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = [WeakRetained _wallpaperAssetLookup];
  uint64_t v36 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v36)
  {
    uint64_t v35 = *(void *)v45;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v45 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = v19;
        uint64_t v20 = *(void *)(*((void *)&v44 + 1) + 8 * v19);
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v21 = [WeakRetained _wallpaperAssetLookup];
        char v22 = [v21 objectForKeyedSubscript:v20];

        id v38 = v22;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v40 objects:v49 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v41;
          do
          {
            uint64_t v26 = 0;
            do
            {
              if (*(void *)v41 != v25) {
                objc_enumerationMutation(v38);
              }
              uint64_t v27 = *(void *)(*((void *)&v40 + 1) + 8 * v26);
              id v28 = [WeakRetained _wallpaperAssetLookup];
              uint64_t v29 = [v28 objectForKeyedSubscript:v20];
              id v30 = [v29 objectForKeyedSubscript:v27];
              v48[0] = @"_wallpaperAssetLookup";
              v48[1] = v20;
              v48[2] = v27;
              id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:3];
              unint64_t v32 = [v31 componentsJoinedByString:@"."];
              id v33 = (id)[v39 appendObject:v30 withName:v32];

              ++v26;
            }
            while (v24 != v26);
            uint64_t v24 = [v38 countByEnumeratingWithState:&v40 objects:v49 count:16];
          }
          while (v24);
        }

        uint64_t v19 = v37 + 1;
      }
      while (v37 + 1 != v36);
      uint64_t v36 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v36);
  }
}

- (NSNumber)contentVersion
{
  return self->_contentVersion;
}

- (NSURL)thumbnailImageURL
{
  return self->_thumbnailImageURL;
}

- (BOOL)isAppearanceAware
{
  return self->_appearanceAware;
}

- (BOOL)hasDistinctWallpapersForLocations
{
  return self->_distinctWallpapersForLocations;
}

- (BOOL)disableParallax
{
  return self->_disableParallax;
}

- (BOOL)isOffloaded
{
  return self->_offloaded;
}

- (NSString)logicalScreenClass
{
  return self->_logicalScreenClass;
}

- (BOOL)disableModifyingLegibilityBlur
{
  return self->_disableModifyingLegibilityBlur;
}

- (WKWallpaperAdjustmentTraits)adjustmentTraits
{
  return self->_adjustmentTraits;
}

- (NSArray)preferredTitleColors
{
  return self->_preferredTitleColors;
}

- (int64_t)version
{
  return self->_version;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)family
{
  return self->_family;
}

- (NSDictionary)preferredProminentColors
{
  return self->_preferredProminentColors;
}

- (NSMutableDictionary)_wallpaperAssetLookup
{
  return self->__wallpaperAssetLookup;
}

- (void)set_wallpaperAssetLookup:(id)a3
{
}

- (UIImage)_thumbnailImage
{
  return self->__thumbnailImage;
}

- (void)set_thumbnailImage:(id)a3
{
}

- (BOOL)_hasCalculatedSupportsSerialization
{
  return self->__hasCalculatedSupportsSerialization;
}

- (void)set_hasCalculatedSupportsSerialization:(BOOL)a3
{
  self->__hasCalculatedSupportsSerialization = a3;
}

- (BOOL)_supportsSerialization
{
  return self->__supportsSerialization;
}

- (void)set_supportsSerialization:(BOOL)a3
{
  self->__supportsSerialization = a3;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (void)setBundleURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->__thumbnailImage, 0);
  objc_storeStrong((id *)&self->__wallpaperAssetLookup, 0);
  objc_storeStrong((id *)&self->_preferredProminentColors, 0);
  objc_storeStrong((id *)&self->_family, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_preferredTitleColors, 0);
  objc_storeStrong((id *)&self->_adjustmentTraits, 0);
  objc_storeStrong((id *)&self->_logicalScreenClass, 0);
  objc_storeStrong((id *)&self->_thumbnailImageURL, 0);
  objc_storeStrong((id *)&self->_contentVersion, 0);
}

- (void)initWithURL:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1BE13A000, a3, v6, "%{public}@: Wallpaper bundle does not exist at URL '%{public}@', returning nil.", v7);
}

+ (void)shouldLoadWallpaperBundleAtURL:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1BE13A000, v0, v1, "%s: Could not decode 'Wallpaper.plist' at URL '%{public}@', error '%{public}@'.", v2);
}

+ (void)shouldLoadWallpaperBundleAtURL:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BE13A000, v0, v1, "%s: No 'Wallpaper.plist' file found at URL '%{public}@.", v2, v3, v4, v5, 2u);
}

+ (void)shouldLoadWallpaperBundleAtURL:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BE13A000, v0, v1, "%s: No wallpaper bundle found at URL '%{public}@.", v2, v3, v4, v5, 2u);
}

+ (void)shouldLoadWallpaperBundleAtURL:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BE13A000, v0, v1, "%s: URL does not have valid path extension ('.wallpaper') '%{public}@.", v2, v3, v4, v5, 2u);
}

+ (void)_createWallpaperBundleInDirectory:version:identifier:name:family:disableParallax:isOffloaded:logicalScreenClass:thumbnailImageURL:adjustmentTraits:preferredProminentColors:preferredTitleColors:assetMapping:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BE13A000, v0, v1, "%s: Failed to copy wallpaper resources, error '%{public}@'.", v2, v3, v4, v5, 2u);
}

+ (void)_createWallpaperBundleInDirectory:(uint8_t *)buf version:(os_log_t)log identifier:name:family:disableParallax:isOffloaded:logicalScreenClass:thumbnailImageURL:adjustmentTraits:preferredProminentColors:preferredTitleColors:assetMapping:.cold.2(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315650;
  *(void *)(buf + 4) = "+[WKWallpaperBundle _createWallpaperBundleInDirectory:version:identifier:name:family:disablePar"
                         "allax:isOffloaded:logicalScreenClass:thumbnailImageURL:adjustmentTraits:preferredProminentColor"
                         "s:preferredTitleColors:assetMapping:]";
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a1;
  *((_WORD *)buf + 11) = 2114;
  *((void *)buf + 3) = a2;
  _os_log_error_impl(&dword_1BE13A000, log, OS_LOG_TYPE_ERROR, "%s: Could not write out wallpaper metadata to path '%{public}@'.  Error: '%{public}@'.", buf, 0x20u);
}

+ (void)_createWallpaperBundleInDirectory:version:identifier:name:family:disableParallax:isOffloaded:logicalScreenClass:thumbnailImageURL:adjustmentTraits:preferredProminentColors:preferredTitleColors:assetMapping:.cold.3()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1BE13A000, v0, v1, "%s: Could not serialized wallpaper metadata '%{public}@'.  Error: '%{public}@'.", v2);
}

+ (void)_createWallpaperBundleInDirectory:version:identifier:name:family:disableParallax:isOffloaded:logicalScreenClass:thumbnailImageURL:adjustmentTraits:preferredProminentColors:preferredTitleColors:assetMapping:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BE13A000, v0, v1, "%s: Failed to copy bundle thumbnail image, error '%{public}@'.", v2, v3, v4, v5, 2u);
}

+ (void)_createWallpaperBundleInDirectory:version:identifier:name:family:disableParallax:isOffloaded:logicalScreenClass:thumbnailImageURL:adjustmentTraits:preferredProminentColors:preferredTitleColors:assetMapping:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BE13A000, v0, v1, "%s: Failed to create wallpaper bundle directory, error '%{public}@'.", v2, v3, v4, v5, 2u);
}

+ (void)_createWallpaperBundleInDirectory:(os_log_t)log version:identifier:name:family:disableParallax:isOffloaded:logicalScreenClass:thumbnailImageURL:adjustmentTraits:preferredProminentColors:preferredTitleColors:assetMapping:.cold.6(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "+[WKWallpaperBundle _createWallpaperBundleInDirectory:version:identifier:name:family:disableParallax:isOffloaded:"
       "logicalScreenClass:thumbnailImageURL:adjustmentTraits:preferredProminentColors:preferredTitleColors:assetMapping:]";
  _os_log_error_impl(&dword_1BE13A000, log, OS_LOG_TYPE_ERROR, "%s: Cannot create wallpaper bundle because one or more assets do not support copying or serialization.", (uint8_t *)&v1, 0xCu);
}

void __227__WKWallpaperBundle__createWallpaperBundleInDirectory_version_identifier_name_family_disableParallax_isOffloaded_logicalScreenClass_thumbnailImageURL_adjustmentTraits_preferredProminentColors_preferredTitleColors_assetMapping___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BE13A000, v0, v1, "%s: Cannot create wallpaper bundle because wallpaper %{public}@ either cannot copy or cannot serialize.", v2, v3, v4, v5, 2u);
}

void __227__WKWallpaperBundle__createWallpaperBundleInDirectory_version_identifier_name_family_disableParallax_isOffloaded_logicalScreenClass_thumbnailImageURL_adjustmentTraits_preferredProminentColors_preferredTitleColors_assetMapping___block_invoke_336_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end