@interface PRPosterPathUtilities
+ (BOOL)removeAmbientConfigurationForPath:(id)a3 error:(id *)a4;
+ (BOOL)removeAmbientWidgetLayout:(id)a3 error:(id *)a4;
+ (BOOL)removeColorVariationsConfigurationForPath:(id)a3 error:(id *)a4;
+ (BOOL)removeComplicationLayoutForPath:(id)a3 error:(id *)a4;
+ (BOOL)removeConfigurableOptionsForPath:(id)a3 error:(id *)a4;
+ (BOOL)removeFocusConfigurationForPath:(id)a3 error:(id *)a4;
+ (BOOL)removeOtherMetadataForPath:(id)a3 error:(id *)a4;
+ (BOOL)removePosterDescriptorGalleryOptions:(id)a3 error:(id *)a4;
+ (BOOL)removeProactiveGalleryOptions:(id)a3 error:(id *)a4;
+ (BOOL)removeQuickActionsConfigurationForPath:(id)a3 error:(id *)a4;
+ (BOOL)removeRenderingConfigurationForPath:(id)a3 error:(id *)a4;
+ (BOOL)removeSuggestionMetadataForPath:(id)a3 error:(id *)a4;
+ (BOOL)removeTitleStyleConfigurationForPath:(id)a3 error:(id *)a4;
+ (BOOL)removeUserInfo:(id)a3 error:(id *)a4;
+ (BOOL)storeAmbientConfigurationForPath:(id)a3 ambientConfiguration:(id)a4 error:(id *)a5;
+ (BOOL)storeAmbientWidgetLayoutToPath:(id)a3 posterAmbientWidgetLayout:(id)a4 error:(id *)a5;
+ (BOOL)storeColorVariationsConfigurationForPath:(id)a3 colorVariationsConfiguration:(id)a4 error:(id *)a5;
+ (BOOL)storeComplicationLayoutForPath:(id)a3 complicationLayout:(id)a4 error:(id *)a5;
+ (BOOL)storeConfigurableOptionsForPath:(id)a3 configurableOptions:(id)a4 error:(id *)a5;
+ (BOOL)storeConfiguredPropertiesForPath:(id)a3 configuredProperties:(id)a4 error:(id *)a5;
+ (BOOL)storeFocusConfigurationForPath:(id)a3 focusConfiguration:(id)a4 error:(id *)a5;
+ (BOOL)storeHomeScreenConfigurationForPath:(id)a3 homeScreenConfiguration:(id)a4 error:(id *)a5;
+ (BOOL)storeOtherMetadataForPath:(id)a3 otherMetadata:(id)a4 error:(id *)a5;
+ (BOOL)storePosterDescriptorGalleryOptions:(id)a3 posterDescriptorGalleryOptions:(id)a4 error:(id *)a5;
+ (BOOL)storeProactiveGalleryOptionsToPath:(id)a3 proactiveGalleryOptions:(id)a4 error:(id *)a5;
+ (BOOL)storeQuickActionsConfigurationForPath:(id)a3 quickActionsConfiguration:(id)a4 error:(id *)a5;
+ (BOOL)storeRenderingConfiguration:(id)a3 forPath:(id)a4 error:(id *)a5;
+ (BOOL)storeSuggestionMetadataForPath:(id)a3 suggestionMetadata:(id)a4 error:(id *)a5;
+ (BOOL)storeTitleStyleConfigurationForPath:(id)a3 titleStyleConfiguration:(id)a4 error:(id *)a5;
+ (BOOL)storeUserInfoToPath:(id)a3 userInfo:(id)a4 error:(id *)a5;
+ (BOOL)storeUserObject:(id)a3 path:(id)a4 atURL:(id)a5 clearCache:(BOOL)a6 error:(id *)a7;
+ (id)ambientConfigurationURLForContentsURL:(id)a3;
+ (id)ambientConfigurationURLForPath:(id)a3;
+ (id)ambientWidgetLayoutURLForInstanceURL:(id)a3;
+ (id)ambientWidgetLayoutURLForPath:(id)a3;
+ (id)colorVariationsConfigurationURLForInstanceURL:(id)a3;
+ (id)colorVariationsConfigurationURLForPath:(id)a3;
+ (id)complicationsLayoutURLForInstanceURL:(id)a3;
+ (id)complicationsLayoutURLForPath:(id)a3;
+ (id)configurableOptionsURLForContentsURL:(id)a3;
+ (id)configurableOptionsURLForPath:(id)a3;
+ (id)depthEffectConfigurationURLForPath:(id)a3;
+ (id)depthEffectConfigurationURLForPathInstanceURL:(id)a3;
+ (id)descriptorGalleryOptionsURLForContentsURL:(id)a3;
+ (id)descriptorGalleryOptionsURLForPath:(id)a3;
+ (id)expectedConfigurationFilesForPath:(id)a3;
+ (id)focusConfigurationURLForIdentifierURL:(id)a3;
+ (id)focusConfigurationURLForPath:(id)a3;
+ (id)homeScreenConfigurationURLForPath:(id)a3;
+ (id)homeScreenConfigurationURLForSupplementURL:(id)a3;
+ (id)loadAmbientConfigurationForPath:(id)a3 error:(id *)a4;
+ (id)loadAmbientWidgetLayoutForPath:(id)a3 error:(id *)a4;
+ (id)loadColorVariationsConfigurationForPath:(id)a3 error:(id *)a4;
+ (id)loadComplicationLayoutForPath:(id)a3 error:(id *)a4;
+ (id)loadConfigurableOptionsForPath:(id)a3 error:(id *)a4;
+ (id)loadConfiguredPropertiesForPath:(id)a3 error:(id *)a4;
+ (id)loadFocusConfigurationForPath:(id)a3 error:(id *)a4;
+ (id)loadHomeScreenConfigurationForPath:(id)a3 error:(id *)a4;
+ (id)loadOtherMetadataForPath:(id)a3 error:(id *)a4;
+ (id)loadPosterDescriptorGalleryOptionsForPath:(id)a3 error:(id *)a4;
+ (id)loadPosterDescriptorIdentifierForPathAtURL:(id)a3 type:(int64_t)a4 posterUUID:(id)a5;
+ (id)loadProactiveGalleryOptions:(id)a3 error:(id *)a4;
+ (id)loadQuickActionsConfigurationForPath:(id)a3 error:(id *)a4;
+ (id)loadRenderingConfigurationForPath:(id)a3 error:(id *)a4;
+ (id)loadSuggestionMetadataForPath:(id)a3 error:(id *)a4;
+ (id)loadTitleStyleConfigurationForPath:(id)a3 error:(id *)a4;
+ (id)loadUserInfoForPath:(id)a3 error:(id *)a4;
+ (id)loadUserInfoForURL:(id)a3 error:(id *)a4;
+ (id)loadUserObjectForURL:(id)a3 expectedClass:(Class)a4 strict:(BOOL)a5 error:(id *)a6;
+ (id)oldHomeScreenConfigurationURLForIdentifierURL:(id)a3;
+ (id)oldHomeScreenConfigurationURLForPath:(id)a3;
+ (id)otherMetadataURLForContentsURL:(id)a3;
+ (id)otherMetadataURLForPath:(id)a3;
+ (id)proactiveGalleryOptionsURLForContentsURL:(id)a3;
+ (id)proactiveGalleryOptionsURLForPath:(id)a3;
+ (id)quickActionsConfigurationURLForInstanceURL:(id)a3;
+ (id)quickActionsConfigurationURLForPath:(id)a3;
+ (id)renderingConfigurationURLForPath:(id)a3;
+ (id)renderingConfigurationURLForPathInstanceURL:(id)a3;
+ (id)suggestionMetadataURLForIdentifierURL:(id)a3;
+ (id)suggestionMetadataURLForPath:(id)a3;
+ (id)titleStyleConfigurationURLForPath:(id)a3;
+ (id)titleStyleConfigurationURLForPathInstanceURL:(id)a3;
+ (id)userInfoURLForPath:(id)a3;
+ (id)userInfoURLForPosterContentsURL:(id)a3;
@end

@implementation PRPosterPathUtilities

+ (id)expectedConfigurationFilesForPath:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [a1 descriptorGalleryOptionsURLForPath:v4];
  if ([v6 checkResourceIsReachableAndReturnError:0]) {
    [v5 addObject:v6];
  }
  v7 = [a1 otherMetadataURLForPath:v4];
  if ([v7 checkResourceIsReachableAndReturnError:0]) {
    [v5 addObject:v7];
  }
  v8 = [a1 suggestionMetadataURLForPath:v4];
  if ([v8 checkResourceIsReachableAndReturnError:0]) {
    [v5 addObject:v8];
  }
  v9 = [a1 colorVariationsConfigurationURLForPath:v4];
  if ([v9 checkResourceIsReachableAndReturnError:0]) {
    [v5 addObject:v9];
  }
  v10 = [a1 complicationsLayoutURLForPath:v4];
  if ([v10 checkResourceIsReachableAndReturnError:0]) {
    [v5 addObject:v10];
  }
  v11 = [a1 focusConfigurationURLForPath:v4];
  if ([v11 checkResourceIsReachableAndReturnError:0]) {
    [v5 addObject:v11];
  }
  v12 = [a1 homeScreenConfigurationURLForPath:v4];
  if ([v12 checkResourceIsReachableAndReturnError:0]) {
    [v5 addObject:v12];
  }
  v29 = v7;
  v13 = [a1 oldHomeScreenConfigurationURLForPath:v4];
  if ([v13 checkResourceIsReachableAndReturnError:0]) {
    [v5 addObject:v13];
  }
  v28 = v8;
  v14 = objc_msgSend(a1, "renderingConfigurationURLForPath:", v4, v13);
  if ([v14 checkResourceIsReachableAndReturnError:0]) {
    [v5 addObject:v14];
  }
  v27 = v9;
  v15 = [a1 depthEffectConfigurationURLForPath:v4];
  if ([v15 checkResourceIsReachableAndReturnError:0]) {
    [v5 addObject:v15];
  }
  v26 = v10;
  v16 = [a1 titleStyleConfigurationURLForPath:v4];
  if ([v16 checkResourceIsReachableAndReturnError:0]) {
    [v5 addObject:v16];
  }
  v25 = v11;
  v17 = [a1 ambientConfigurationURLForPath:v4];
  if ([v17 checkResourceIsReachableAndReturnError:0]) {
    [v5 addObject:v17];
  }
  v24 = v12;
  v18 = [a1 ambientWidgetLayoutURLForPath:v4];
  if ([v18 checkResourceIsReachableAndReturnError:0]) {
    [v5 addObject:v18];
  }
  v30 = v6;
  v19 = [a1 userInfoURLForPath:v4];
  if ([v19 checkResourceIsReachableAndReturnError:0]) {
    [v5 addObject:v19];
  }
  v20 = [a1 configurableOptionsURLForPath:v4];
  if ([v20 checkResourceIsReachableAndReturnError:0]) {
    [v5 addObject:v20];
  }
  v21 = (void *)[v5 copy];

  return v21;
}

+ (id)loadUserObjectForURL:(id)a3 expectedClass:(Class)a4 strict:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (![v9 checkResourceIsReachableAndReturnError:a6])
  {
    v16 = 0;
    goto LABEL_18;
  }
  v10 = (void *)MEMORY[0x192F915E0]();
  id v22 = 0;
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v9 options:1 error:&v22];
  id v12 = v22;
  v13 = v12;
  if (v11)
  {
    v14 = (void *)MEMORY[0x1E4F28DC0];
    if (v7)
    {
      uint64_t v15 = [MEMORY[0x1E4F1CAD0] setWithObject:a4];
      id v21 = v13;
      v16 = [v14 _strictlyUnarchivedObjectOfClasses:v15 fromData:v11 error:&v21];
      id v17 = v21;

      v13 = (void *)v15;
    }
    else
    {
      id v20 = v12;
      v16 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:a4 fromData:v11 error:&v20];
      id v17 = v20;
    }

    if (v16) {
      goto LABEL_14;
    }
    v18 = PRLogModel();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v24 = v9;
      __int16 v25 = 2112;
      Class v26 = a4;
      __int16 v27 = 2114;
      id v28 = v17;
      _os_log_debug_impl(&dword_18C1C4000, v18, OS_LOG_TYPE_DEBUG, "Unable to unarchive user object @ %@; expected class %@: %{public}@",
        buf,
        0x20u);
    }
    v13 = v17;
  }
  else
  {
    v18 = PRLogModel();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v24 = v9;
      __int16 v25 = 2112;
      Class v26 = a4;
      __int16 v27 = 2114;
      id v28 = v13;
      _os_log_debug_impl(&dword_18C1C4000, v18, OS_LOG_TYPE_DEBUG, "Unable to load user object @ %@; expected class %@: %{public}@",
        buf,
        0x20u);
    }
  }

  v16 = 0;
  id v17 = v13;
LABEL_14:

  if (a6 && v17) {
    *a6 = v17;
  }

LABEL_18:
  return v16;
}

+ (BOOL)storeUserObject:(id)a3 path:(id)a4 atURL:(id)a5 clearCache:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (v8) {
    +[PRPosterPathModelObjectCache invalidateModelObjectCacheForPath:v12];
  }
  v14 = PRLogModel();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v30 = v11;
    __int16 v31 = 2112;
    id v32 = v12;
    __int16 v33 = 2112;
    id v34 = v13;
    _os_log_debug_impl(&dword_18C1C4000, v14, OS_LOG_TYPE_DEBUG, "Storing %@ for path %@ to URL '%@'", buf, 0x20u);
  }

  if (v11)
  {
    id v28 = 0;
    char v15 = [v12 ensureContentsURLIsReachableAndReturnError:&v28];
    id v16 = v28;
    id v17 = v16;
    if (v15)
    {
      id v27 = 0;
      v18 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v27];
      v19 = v27;
      id v20 = v19;
      if (v19)
      {
        if (a7) {
          *a7 = v19;
        }
        id v21 = PRLogModel();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          +[PRPosterPathUtilities storeUserObject:path:atURL:clearCache:error:]();
        }
        char v22 = 0;
      }
      else
      {
        id v26 = 0;
        char v22 = [v18 writeToURL:v13 options:268435457 error:&v26];
        id v21 = v26;
        v23 = PRLogModel();
        id v24 = v23;
        if (v22)
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            id v30 = v11;
            __int16 v31 = 2112;
            id v32 = v12;
            __int16 v33 = 2112;
            id v34 = v13;
            _os_log_debug_impl(&dword_18C1C4000, v24, OS_LOG_TYPE_DEBUG, "Successfuly stored %@ for path %@ to URL '%@'", buf, 0x20u);
          }
        }
        else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          +[PRPosterPathUtilities storeUserObject:path:atURL:clearCache:error:]();
        }
      }
    }
    else
    {
      if (a7) {
        *a7 = v16;
      }
      id v20 = PRLogModel();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        +[PRPosterPathUtilities storeUserObject:path:atURL:clearCache:error:]();
      }
      char v22 = 0;
    }
  }
  else
  {
    char v22 = 0;
  }

  return v22;
}

+ (id)loadConfiguredPropertiesForPath:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_opt_new();
  BOOL v7 = [a1 loadComplicationLayoutForPath:v5 error:0];
  [v6 setComplicationLayout:v7];

  BOOL v8 = [a1 loadFocusConfigurationForPath:v5 error:0];
  [v6 setFocusConfiguration:v8];

  id v9 = [a1 loadTitleStyleConfigurationForPath:v5 error:0];
  [v6 setTitleStyleConfiguration:v9];

  v10 = [a1 loadRenderingConfigurationForPath:v5 error:0];
  [v6 setRenderingConfiguration:v10];

  id v11 = [a1 loadHomeScreenConfigurationForPath:v5 error:0];
  [v6 setHomeScreenConfiguration:v11];

  id v12 = [a1 loadColorVariationsConfigurationForPath:v5 error:0];
  [v6 setColorVariationsConfiguration:v12];

  id v13 = [a1 loadQuickActionsConfigurationForPath:v5 error:0];
  [v6 setQuickActionsConfiguration:v13];

  v14 = [a1 loadSuggestionMetadataForPath:v5 error:0];
  [v6 setSuggestionMetadata:v14];

  char v15 = [a1 loadOtherMetadataForPath:v5 error:0];
  [v6 setOtherMetadata:v15];

  id v16 = [a1 loadUserInfoForPath:v5 error:0];
  [v6 setUserInfo:v16];

  id v17 = [a1 loadAmbientConfigurationForPath:v5 error:0];
  [v6 setAmbientConfiguration:v17];

  v18 = [a1 loadAmbientWidgetLayoutForPath:v5 error:0];

  [v6 setAmbientWidgetLayout:v18];
  return v6;
}

+ (BOOL)storeConfiguredPropertiesForPath:(id)a3 configuredProperties:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  +[PRPosterPathModelObjectCache invalidateModelObjectCacheForPath:v8];
  v10 = [v9 complicationLayout];
  if (v10 && ![a1 storeComplicationLayoutForPath:v8 complicationLayout:v10 error:a5])
  {
    BOOL v25 = 0;
  }
  else
  {
    id v11 = [v9 focusConfiguration];
    if (v11 && ![a1 storeFocusConfigurationForPath:v8 focusConfiguration:v11 error:a5])
    {
      BOOL v25 = 0;
    }
    else
    {
      id v12 = [v9 suggestionMetadata];
      if (v12
        && ![a1 storeSuggestionMetadataForPath:v8 suggestionMetadata:v12 error:a5])
      {
        BOOL v25 = 0;
      }
      else
      {
        id v13 = [v9 otherMetadata];
        if (v13 && ![a1 storeOtherMetadataForPath:v8 otherMetadata:v13 error:a5])
        {
          BOOL v25 = 0;
        }
        else
        {
          v14 = [v9 homeScreenConfiguration];
          if (v14
            && ![a1 storeHomeScreenConfigurationForPath:v8 homeScreenConfiguration:v14 error:a5])
          {
            BOOL v25 = 0;
          }
          else
          {
            char v15 = [v9 titleStyleConfiguration];
            if (v15
              && ![a1 storeTitleStyleConfigurationForPath:v8 titleStyleConfiguration:v15 error:a5])
            {
              BOOL v25 = 0;
            }
            else
            {
              __int16 v31 = v15;
              id v16 = [v9 renderingConfiguration];
              if (v16 && ![a1 storeRenderingConfiguration:v16 forPath:v8 error:a5])
              {
                BOOL v25 = 0;
              }
              else
              {
                id v30 = v16;
                id v17 = [v9 colorVariationsConfiguration];
                if (v17
                  && ![a1 storeColorVariationsConfigurationForPath:v8 colorVariationsConfiguration:v17 error:a5])
                {
                  BOOL v25 = 0;
                }
                else
                {
                  uint64_t v29 = v17;
                  v18 = [v9 quickActionsConfiguration];
                  if (v18
                    && ![a1 storeQuickActionsConfigurationForPath:v8 quickActionsConfiguration:v18 error:a5])
                  {
                    BOOL v25 = 0;
                  }
                  else
                  {
                    id v28 = v18;
                    v19 = [v9 ambientConfiguration];
                    if (v19
                      && ![a1 storeAmbientConfigurationForPath:v8 ambientConfiguration:v19 error:a5])
                    {
                      BOOL v25 = 0;
                    }
                    else
                    {
                      id v27 = v19;
                      id v20 = [v9 ambientWidgetLayout];
                      if (v20
                        && ![a1 storeAmbientWidgetLayoutToPath:v8 posterAmbientWidgetLayout:v20 error:a5])
                      {
                        BOOL v25 = 0;
                      }
                      else
                      {
                        id v21 = [v9 userInfo];
                        BOOL v25 = 1;
                        if (v21)
                        {
                          id v22 = a1;
                          v23 = v21;
                          int v24 = [v22 storeUserInfoToPath:v8 userInfo:v21 error:a5];
                          id v21 = v23;
                          if (!v24) {
                            BOOL v25 = 0;
                          }
                        }
                      }
                      v19 = v27;
                    }

                    v18 = v28;
                  }

                  id v17 = v29;
                }

                id v16 = v30;
              }

              char v15 = v31;
            }
          }
        }
      }
    }
  }
  return v25;
}

+ (id)titleStyleConfigurationURLForPathInstanceURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"com.apple.posterkit.provider.instance.titleStyleConfiguration.plist" isDirectory:0];
}

+ (id)titleStyleConfigurationURLForPath:(id)a3
{
  id v4 = a3;
  if ([v4 isServerPosterPath])
  {
    id v5 = [v4 instanceURL];
    v6 = [a1 titleStyleConfigurationURLForPathInstanceURL:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)loadTitleStyleConfigurationForPath:(id)a3 error:(id *)a4
{
  v6 = [a1 titleStyleConfigurationURLForPath:a3];
  BOOL v7 = self;
  id v8 = [a1 loadUserObjectForURL:v6 expectedClass:v7 strict:1 error:a4];

  return v8;
}

+ (BOOL)storeTitleStyleConfigurationForPath:(id)a3 titleStyleConfiguration:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = +[PRPosterPathModelObjectCache modelObjectCacheForPath:v8];
  [v10 resetTitleStyleConfiguration];

  id v11 = v9;
  if (v11 && (NSClassFromString(&cfstr_Prpostertitles_0.isa), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterTitleStyleConfigurationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRPosterPathUtilities storeTitleStyleConfigurationForPath:titleStyleConfiguration:error:]();
    }
    [v15 UTF8String];
    BOOL result = _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    id v12 = [a1 titleStyleConfigurationURLForPath:v8];
    char v13 = [a1 storeUserObject:v11 path:v8 atURL:v12 clearCache:0 error:a5];

    return v13;
  }
  return result;
}

+ (BOOL)removeTitleStyleConfigurationForPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = +[PRPosterPathModelObjectCache modelObjectCacheForPath:v6];
  [v7 resetTitleStyleConfiguration];

  id v8 = [a1 titleStyleConfigurationURLForPath:v6];

  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  LOBYTE(a4) = [v9 removeItemAtURL:v8 error:a4];

  return (char)a4;
}

+ (id)renderingConfigurationURLForPath:(id)a3
{
  id v4 = a3;
  if ([v4 isServerPosterPath])
  {
    id v5 = [v4 instanceURL];
    id v6 = [a1 renderingConfigurationURLForPathInstanceURL:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)renderingConfigurationURLForPathInstanceURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"com.apple.posterkit.provider.instance.renderingConfiguration.plist" isDirectory:0];
}

+ (id)depthEffectConfigurationURLForPath:(id)a3
{
  id v3 = a3;
  if ([v3 isServerPosterPath])
  {
    id v4 = [v3 instanceURL];
    id v5 = [v4 URLByAppendingPathComponent:@"com.apple.posterkit.provider.instance.depthEffectConfiguration.plist" isDirectory:0];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)depthEffectConfigurationURLForPathInstanceURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"com.apple.posterkit.provider.instance.depthEffectConfiguration.plist" isDirectory:0];
}

+ (id)loadRenderingConfigurationForPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [a1 depthEffectConfigurationURLForPath:v6];
  id v8 = self;
  id v9 = [a1 loadUserObjectForURL:v7 expectedClass:v8 strict:1 error:a4];

  if (!v9)
  {
    uint64_t v10 = [a1 renderingConfigurationURLForPath:v6];

    id v11 = self;
    id v9 = [a1 loadUserObjectForURL:v10 expectedClass:v11 strict:1 error:a4];

    BOOL v7 = (void *)v10;
  }

  return v9;
}

+ (BOOL)storeRenderingConfiguration:(id)a3 forPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = +[PRPosterPathModelObjectCache modelObjectCacheForPath:v9];
  [v10 resetRenderingConfiguration];

  id v11 = v8;
  if (v11 && (NSClassFromString(&cfstr_Prposterrender.isa), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterRenderingConfigurationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRPosterPathUtilities storeRenderingConfiguration:forPath:error:]();
    }
    [v15 UTF8String];
    BOOL result = _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    id v12 = [a1 renderingConfigurationURLForPath:v9];
    char v13 = [a1 storeUserObject:v11 path:v9 atURL:v12 clearCache:0 error:a5];

    return v13;
  }
  return result;
}

+ (BOOL)removeRenderingConfigurationForPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = +[PRPosterPathModelObjectCache modelObjectCacheForPath:v6];
  [v7 resetRenderingConfiguration];

  id v8 = [a1 depthEffectConfigurationURLForPath:v6];
  id v9 = [a1 renderingConfigurationURLForPath:v6];

  uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v10 removeItemAtURL:v8 error:0];

  id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  LOBYTE(a4) = [v11 removeItemAtURL:v9 error:a4];

  return (char)a4;
}

+ (id)configurableOptionsURLForPath:(id)a3
{
  id v3 = [a3 contentsURL];
  id v4 = [v3 URLByAppendingPathComponent:@".com.apple.posterkit.provider.contents.configurableOptions.plist" isDirectory:0];

  return v4;
}

+ (id)configurableOptionsURLForContentsURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@".com.apple.posterkit.provider.contents.configurableOptions.plist" isDirectory:0];
}

+ (id)loadConfigurableOptionsForPath:(id)a3 error:(id *)a4
{
  id v6 = [a1 configurableOptionsURLForPath:a3];
  BOOL v7 = self;
  id v8 = [a1 loadUserObjectForURL:v6 expectedClass:v7 strict:1 error:a4];

  return v8;
}

+ (BOOL)storeConfigurableOptionsForPath:(id)a3 configurableOptions:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = +[PRPosterPathModelObjectCache modelObjectCacheForPath:v8];
  [v10 resetConfigurableOptions];

  id v11 = v9;
  if (v11 && (NSClassFromString(&cfstr_Prposterconfig_3.isa), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterConfigurableOptionsClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRPosterPathUtilities storeConfigurableOptionsForPath:configurableOptions:error:]();
    }
    [v15 UTF8String];
    BOOL result = _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    id v12 = [a1 configurableOptionsURLForPath:v8];
    char v13 = [a1 storeUserObject:v11 path:v8 atURL:v12 clearCache:0 error:a5];

    return v13;
  }
  return result;
}

+ (BOOL)removeConfigurableOptionsForPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = +[PRPosterPathModelObjectCache modelObjectCacheForPath:v6];
  [v7 resetConfigurableOptions];

  id v8 = [a1 configurableOptionsURLForPath:v6];

  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  LOBYTE(a4) = [v9 removeItemAtURL:v8 error:a4];

  return (char)a4;
}

+ (id)oldHomeScreenConfigurationURLForPath:(id)a3
{
  id v4 = a3;
  if ([v4 isServerPosterPath])
  {
    id v5 = [v4 identifierURL];
    id v6 = [a1 oldHomeScreenConfigurationURLForIdentifierURL:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)homeScreenConfigurationURLForPath:(id)a3
{
  id v4 = a3;
  if ([v4 isServerPosterPath])
  {
    id v5 = [v4 supplementURL];
    id v6 = [a1 homeScreenConfigurationURLForSupplementURL:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)oldHomeScreenConfigurationURLForIdentifierURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"com.apple.posterkit.provider.identifierURL.homescreenConfiguration.plist" isDirectory:0];
}

+ (id)homeScreenConfigurationURLForSupplementURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"com.apple.posterkit.provider.supplementURL.homescreenConfiguration.plist" isDirectory:0];
}

+ (id)loadHomeScreenConfigurationForPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [a1 homeScreenConfigurationURLForPath:v6];
  id v8 = self;
  id v9 = [a1 loadUserObjectForURL:v7 expectedClass:v8 strict:0 error:a4];

  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    uint64_t v11 = [a1 oldHomeScreenConfigurationURLForPath:v6];

    id v12 = self;
    id v10 = [a1 loadUserObjectForURL:v11 expectedClass:v12 strict:0 error:a4];

    BOOL v7 = (void *)v11;
  }

  return v10;
}

+ (BOOL)storeHomeScreenConfigurationForPath:(id)a3 homeScreenConfiguration:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[PRPosterPathModelObjectCache modelObjectCacheForPath:v8];
  [v10 resetHomeScreenConfiguration];

  id v11 = v9;
  if (v11 && (NSClassFromString(&cfstr_Prposterhomesc.isa), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterHomeScreenConfigurationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRPosterPathUtilities storeHomeScreenConfigurationForPath:homeScreenConfiguration:error:]();
    }
    [v15 UTF8String];
    BOOL result = _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    id v12 = [a1 homeScreenConfigurationURLForPath:v8];
    char v13 = [a1 storeUserObject:v11 path:v8 atURL:v12 clearCache:0 error:a5];

    return v13;
  }
  return result;
}

+ (id)focusConfigurationURLForPath:(id)a3
{
  id v4 = a3;
  if ([v4 isServerPosterPath])
  {
    id v5 = [v4 identifierURL];
    id v6 = [a1 focusConfigurationURLForIdentifierURL:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)focusConfigurationURLForIdentifierURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"com.apple.posterkit.provider.identifierURL.focusConfiguration.plist" isDirectory:0];
}

+ (id)loadFocusConfigurationForPath:(id)a3 error:(id *)a4
{
  id v6 = [a1 focusConfigurationURLForPath:a3];
  BOOL v7 = self;
  id v8 = [a1 loadUserObjectForURL:v6 expectedClass:v7 strict:0 error:a4];

  return v8;
}

+ (BOOL)storeFocusConfigurationForPath:(id)a3 focusConfiguration:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[PRPosterPathModelObjectCache modelObjectCacheForPath:v8];
  [v10 resetFocusConfiguration];

  id v11 = v9;
  if (v11 && (NSClassFromString(&cfstr_Prposterfocusc.isa), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterFocusConfigurationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRPosterPathUtilities storeFocusConfigurationForPath:focusConfiguration:error:]();
    }
    [v15 UTF8String];
    BOOL result = _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    id v12 = [a1 focusConfigurationURLForPath:v8];
    char v13 = [a1 storeUserObject:v11 path:v8 atURL:v12 clearCache:0 error:a5];

    return v13;
  }
  return result;
}

+ (BOOL)removeFocusConfigurationForPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = +[PRPosterPathModelObjectCache modelObjectCacheForPath:v6];
  [v7 resetFocusConfiguration];

  id v8 = [a1 focusConfigurationURLForPath:v6];

  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  LOBYTE(a4) = [v9 removeItemAtURL:v8 error:a4];

  return (char)a4;
}

+ (id)complicationsLayoutURLForPath:(id)a3
{
  id v4 = a3;
  if ([v4 isServerPosterPath])
  {
    id v5 = [v4 instanceURL];
    id v6 = [a1 complicationsLayoutURLForInstanceURL:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)complicationsLayoutURLForInstanceURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"com.apple.posterkit.provider.instance.complicationLayout.plist" isDirectory:0];
}

+ (id)loadComplicationLayoutForPath:(id)a3 error:(id *)a4
{
  id v6 = [a1 complicationsLayoutURLForPath:a3];
  BOOL v7 = self;
  id v8 = [a1 loadUserObjectForURL:v6 expectedClass:v7 strict:0 error:a4];

  return v8;
}

+ (BOOL)storeComplicationLayoutForPath:(id)a3 complicationLayout:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[PRPosterPathModelObjectCache modelObjectCacheForPath:v8];
  [v10 resetComplicationLayout];

  id v11 = v9;
  if (v11 && (NSClassFromString(&cfstr_Prpostercompli.isa), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterComplicationLayoutClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRPosterPathUtilities storeComplicationLayoutForPath:complicationLayout:error:]();
    }
    [v15 UTF8String];
    BOOL result = _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    id v12 = [a1 complicationsLayoutURLForPath:v8];
    char v13 = [a1 storeUserObject:v11 path:v8 atURL:v12 clearCache:0 error:a5];

    return v13;
  }
  return result;
}

+ (BOOL)removeComplicationLayoutForPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = +[PRPosterPathModelObjectCache modelObjectCacheForPath:v6];
  [v7 resetComplicationLayout];

  id v8 = [a1 complicationsLayoutURLForPath:v6];

  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  LOBYTE(a4) = [v9 removeItemAtURL:v8 error:a4];

  return (char)a4;
}

+ (id)colorVariationsConfigurationURLForInstanceURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"com.apple.posterkit.provider.instance.colorVariations.plist" isDirectory:0];
}

+ (id)colorVariationsConfigurationURLForPath:(id)a3
{
  id v4 = a3;
  if ([v4 isServerPosterPath])
  {
    id v5 = [v4 instanceURL];
    id v6 = [a1 colorVariationsConfigurationURLForInstanceURL:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)loadColorVariationsConfigurationForPath:(id)a3 error:(id *)a4
{
  id v6 = [a1 colorVariationsConfigurationURLForPath:a3];
  BOOL v7 = self;
  id v8 = [a1 loadUserObjectForURL:v6 expectedClass:v7 strict:1 error:a4];

  return v8;
}

+ (BOOL)storeColorVariationsConfigurationForPath:(id)a3 colorVariationsConfiguration:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[PRPosterPathModelObjectCache modelObjectCacheForPath:v8];
  [v10 resetColorVariationsConfiguration];

  id v11 = v9;
  if (v11 && (NSClassFromString(&cfstr_Prpostercolorv.isa), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterColorVariationsConfigurationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRPosterPathUtilities storeColorVariationsConfigurationForPath:colorVariationsConfiguration:error:]();
    }
    [v15 UTF8String];
    BOOL result = _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    id v12 = [a1 colorVariationsConfigurationURLForPath:v8];
    char v13 = [a1 storeUserObject:v11 path:v8 atURL:v12 clearCache:0 error:a5];

    return v13;
  }
  return result;
}

+ (BOOL)removeColorVariationsConfigurationForPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = +[PRPosterPathModelObjectCache modelObjectCacheForPath:v6];
  [v7 resetColorVariationsConfiguration];

  id v8 = [a1 colorVariationsConfigurationURLForPath:v6];

  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  LOBYTE(a4) = [v9 removeItemAtURL:v8 error:a4];

  return (char)a4;
}

+ (id)quickActionsConfigurationURLForPath:(id)a3
{
  id v4 = a3;
  if ([v4 isServerPosterPath])
  {
    id v5 = [v4 instanceURL];
    id v6 = [a1 quickActionsConfigurationURLForInstanceURL:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)quickActionsConfigurationURLForInstanceURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"com.apple.posterkit.provider.instance.quickActions.plist" isDirectory:0];
}

+ (id)loadQuickActionsConfigurationForPath:(id)a3 error:(id *)a4
{
  id v6 = [a1 quickActionsConfigurationURLForPath:a3];
  BOOL v7 = self;
  id v8 = [a1 loadUserObjectForURL:v6 expectedClass:v7 strict:0 error:a4];

  return v8;
}

+ (BOOL)storeQuickActionsConfigurationForPath:(id)a3 quickActionsConfiguration:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[PRPosterPathModelObjectCache modelObjectCacheForPath:v8];
  [v10 resetQuickActionsConfiguration];

  id v11 = v9;
  if (v11 && (NSClassFromString(&cfstr_Prposterquicka.isa), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterQuickActionsConfigurationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRPosterPathUtilities storeQuickActionsConfigurationForPath:quickActionsConfiguration:error:]();
    }
    [v15 UTF8String];
    BOOL result = _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    id v12 = [a1 quickActionsConfigurationURLForPath:v8];
    char v13 = [a1 storeUserObject:v11 path:v8 atURL:v12 clearCache:0 error:a5];

    return v13;
  }
  return result;
}

+ (BOOL)removeQuickActionsConfigurationForPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = +[PRPosterPathModelObjectCache modelObjectCacheForPath:v6];
  [v7 resetQuickActionsConfiguration];

  id v8 = [a1 quickActionsConfigurationURLForPath:v6];

  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  LOBYTE(a4) = [v9 removeItemAtURL:v8 error:a4];

  return (char)a4;
}

+ (id)ambientConfigurationURLForPath:(id)a3
{
  id v4 = [a3 contentsURL];
  id v5 = [a1 ambientConfigurationURLForContentsURL:v4];

  return v5;
}

+ (id)ambientConfigurationURLForContentsURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@".com.apple.posterkit.provider.contents.ambient.plist" isDirectory:0];
}

+ (id)loadAmbientConfigurationForPath:(id)a3 error:(id *)a4
{
  id v6 = [a1 ambientConfigurationURLForPath:a3];
  BOOL v7 = self;
  id v8 = [a1 loadUserObjectForURL:v6 expectedClass:v7 strict:0 error:a4];

  return v8;
}

+ (BOOL)storeAmbientConfigurationForPath:(id)a3 ambientConfiguration:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[PRPosterPathModelObjectCache modelObjectCacheForPath:v8];
  [v10 resetAmbientConfiguration];

  id v11 = v9;
  if (v11 && (NSClassFromString(&cfstr_Prposterambien_1.isa), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterAmbientConfigurationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRPosterPathUtilities storeAmbientConfigurationForPath:ambientConfiguration:error:]();
    }
    [v15 UTF8String];
    BOOL result = _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    id v12 = [a1 ambientConfigurationURLForPath:v8];
    char v13 = [a1 storeUserObject:v11 path:v8 atURL:v12 clearCache:0 error:a5];

    return v13;
  }
  return result;
}

+ (BOOL)removeAmbientConfigurationForPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = +[PRPosterPathModelObjectCache modelObjectCacheForPath:v6];
  [v7 resetAmbientConfiguration];

  id v8 = [a1 ambientConfigurationURLForPath:v6];

  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  LOBYTE(a4) = [v9 removeItemAtURL:v8 error:a4];

  return (char)a4;
}

+ (id)suggestionMetadataURLForPath:(id)a3
{
  id v4 = a3;
  if ([v4 isServerPosterPath])
  {
    id v5 = [v4 identifierURL];
    id v6 = [a1 suggestionMetadataURLForIdentifierURL:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)suggestionMetadataURLForIdentifierURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"com.apple.posterkit.provider.identifierURL.suggestionMetadata.plist" isDirectory:0];
}

+ (id)loadSuggestionMetadataForPath:(id)a3 error:(id *)a4
{
  id v6 = [a1 suggestionMetadataURLForPath:a3];
  BOOL v7 = self;
  id v8 = [a1 loadUserObjectForURL:v6 expectedClass:v7 strict:0 error:a4];

  return v8;
}

+ (BOOL)storeSuggestionMetadataForPath:(id)a3 suggestionMetadata:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[PRPosterPathModelObjectCache modelObjectCacheForPath:v8];
  [v10 resetSuggestionMetadata];

  id v11 = v9;
  if (v11 && (NSClassFromString(&cfstr_Prpostersugges.isa), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterSuggestionMetadataClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRPosterPathUtilities storeSuggestionMetadataForPath:suggestionMetadata:error:]();
    }
    [v15 UTF8String];
    BOOL result = _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    id v12 = [a1 suggestionMetadataURLForPath:v8];
    char v13 = [a1 storeUserObject:v11 path:v8 atURL:v12 clearCache:0 error:a5];

    return v13;
  }
  return result;
}

+ (BOOL)removeSuggestionMetadataForPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = +[PRPosterPathModelObjectCache modelObjectCacheForPath:v6];
  [v7 resetSuggestionMetadata];

  id v8 = [a1 suggestionMetadataURLForPath:v6];

  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  LOBYTE(a4) = [v9 removeItemAtURL:v8 error:a4];

  return (char)a4;
}

+ (id)loadPosterDescriptorIdentifierForPathAtURL:(id)a3 type:(int64_t)a4 posterUUID:(id)a5
{
  id v6 = objc_msgSend(MEMORY[0x1E4F1CB10], "pf_posterPathIdentifierURLProviderURL:type:posterUUID:", a3, a4, a5);
  BOOL v7 = [v6 URLByAppendingPathComponent:@"com.apple.posterkit.provider.identifierURL.suggestionMetadata.plist" isDirectory:0];
  id v8 = self;
  id v9 = [a1 loadUserObjectForURL:v7 expectedClass:v8 strict:0 error:0];

  id v10 = [v9 suggestedGalleryItem];
  id v11 = [v10 descriptorIdentifier];
  id v12 = [v11 stringByDeletingPathExtension];

  return v12;
}

+ (id)otherMetadataURLForContentsURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"com.apple.posterkit.provider.contents.otherMetadata.plist" isDirectory:0];
}

+ (id)otherMetadataURLForPath:(id)a3
{
  id v4 = [a3 contentsURL];
  id v5 = [a1 otherMetadataURLForContentsURL:v4];

  return v5;
}

+ (id)loadOtherMetadataForPath:(id)a3 error:(id *)a4
{
  id v6 = [a1 otherMetadataURLForPath:a3];
  BOOL v7 = self;
  id v8 = [a1 loadUserObjectForURL:v6 expectedClass:v7 strict:1 error:a4];

  return v8;
}

+ (BOOL)storeOtherMetadataForPath:(id)a3 otherMetadata:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[PRPosterPathModelObjectCache modelObjectCacheForPath:v8];
  [v10 resetOtherMetadata];

  id v11 = v9;
  if (v11 && (NSClassFromString(&cfstr_Prpostermetada.isa), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterMetadataClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRPosterPathUtilities storeOtherMetadataForPath:otherMetadata:error:]();
    }
    [v15 UTF8String];
    BOOL result = _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    id v12 = [a1 otherMetadataURLForPath:v8];
    char v13 = [a1 storeUserObject:v11 path:v8 atURL:v12 clearCache:0 error:a5];

    return v13;
  }
  return result;
}

+ (BOOL)removeOtherMetadataForPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = +[PRPosterPathModelObjectCache modelObjectCacheForPath:v6];
  [v7 resetOtherMetadata];

  id v8 = [a1 otherMetadataURLForPath:v6];

  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  LOBYTE(a4) = [v9 removeItemAtURL:v8 error:a4];

  return (char)a4;
}

+ (id)descriptorGalleryOptionsURLForPath:(id)a3
{
  id v4 = [a3 contentsURL];
  id v5 = [a1 descriptorGalleryOptionsURLForContentsURL:v4];

  return v5;
}

+ (id)descriptorGalleryOptionsURLForContentsURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@".com.apple.posterkit.provider.containerURL.posterDescriptorGalleryOptions.plist" isDirectory:0];
}

+ (id)loadPosterDescriptorGalleryOptionsForPath:(id)a3 error:(id *)a4
{
  id v6 = [a1 descriptorGalleryOptionsURLForPath:a3];
  BOOL v7 = self;
  id v8 = [a1 loadUserObjectForURL:v6 expectedClass:v7 strict:0 error:a4];

  return v8;
}

+ (BOOL)storePosterDescriptorGalleryOptions:(id)a3 posterDescriptorGalleryOptions:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[PRPosterPathModelObjectCache modelObjectCacheForPath:v8];
  [v10 resetGalleryOptions];

  id v11 = v9;
  if (v11 && (NSClassFromString(&cfstr_Prposterdescri_1.isa), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterDescriptorGalleryOptionsClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRPosterPathUtilities storePosterDescriptorGalleryOptions:posterDescriptorGalleryOptions:error:]();
    }
    [v15 UTF8String];
    BOOL result = _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    id v12 = [a1 descriptorGalleryOptionsURLForPath:v8];
    char v13 = [a1 storeUserObject:v11 path:v8 atURL:v12 clearCache:0 error:a5];

    return v13;
  }
  return result;
}

+ (BOOL)removePosterDescriptorGalleryOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = +[PRPosterPathModelObjectCache modelObjectCacheForPath:v6];
  [v7 resetGalleryOptions];

  id v8 = [a1 descriptorGalleryOptionsURLForPath:v6];

  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  LOBYTE(a4) = [v9 removeItemAtURL:v8 error:a4];

  return (char)a4;
}

+ (id)ambientWidgetLayoutURLForInstanceURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"com.apple.posterkit.provider.instance.ambientWidgetLayout.plist" isDirectory:0];
}

+ (id)ambientWidgetLayoutURLForPath:(id)a3
{
  id v4 = a3;
  if ([v4 isServerPosterPath])
  {
    id v5 = [v4 instanceURL];
    id v6 = [a1 ambientWidgetLayoutURLForInstanceURL:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)loadAmbientWidgetLayoutForPath:(id)a3 error:(id *)a4
{
  id v6 = [a1 ambientWidgetLayoutURLForPath:a3];
  BOOL v7 = self;
  id v8 = [a1 loadUserObjectForURL:v6 expectedClass:v7 strict:0 error:a4];

  return v8;
}

+ (BOOL)storeAmbientWidgetLayoutToPath:(id)a3 posterAmbientWidgetLayout:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[PRPosterPathModelObjectCache modelObjectCacheForPath:v8];
  [v10 resetAmbientWidgetLayout];

  id v11 = v9;
  if (v11 && (NSClassFromString(&cfstr_Prposterambien_3.isa), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterAmbientWidgetLayoutClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRPosterPathUtilities storeAmbientWidgetLayoutToPath:posterAmbientWidgetLayout:error:]();
    }
    [v15 UTF8String];
    BOOL result = _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    id v12 = [a1 ambientWidgetLayoutURLForPath:v8];
    char v13 = [a1 storeUserObject:v11 path:v8 atURL:v12 clearCache:0 error:a5];

    return v13;
  }
  return result;
}

+ (BOOL)removeAmbientWidgetLayout:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = +[PRPosterPathModelObjectCache modelObjectCacheForPath:v6];
  [v7 resetAmbientWidgetLayout];

  id v8 = [a1 ambientWidgetLayoutURLForPath:v6];

  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  LOBYTE(a4) = [v9 removeItemAtURL:v8 error:a4];

  return (char)a4;
}

+ (id)userInfoURLForPath:(id)a3
{
  id v3 = [a3 contentsURL];
  id v4 = [v3 URLByAppendingPathComponent:@"com.apple.posterkit.provider.contents.userInfo" isDirectory:0];

  return v4;
}

+ (id)userInfoURLForPosterContentsURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"com.apple.posterkit.provider.contents.userInfo" isDirectory:0];
}

+ (id)loadUserInfoForPath:(id)a3 error:(id *)a4
{
  id v6 = [a1 userInfoURLForPath:a3];
  BOOL v7 = [a1 loadUserInfoForURL:v6 error:a4];

  return v7;
}

+ (id)loadUserInfoForURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)MEMORY[0x192F915E0]();
  id v16 = 0;
  BOOL v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v5 options:1 error:&v16];
  id v8 = v16;
  id v9 = v8;
  if (v7)
  {
    id v15 = 0;
    id v10 = [MEMORY[0x1E4F28F98] propertyListWithData:v7 options:0 format:0 error:&v15];
    id v11 = v15;
    if (v11)
    {
      id v12 = PRLogModel();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[PRPosterPathUtilities loadUserInfoForURL:error:]();
      }

      id v13 = v11;
    }
  }
  else
  {
    id v11 = v8;
    id v10 = 0;
  }

  if (a4 && v11) {
    *a4 = v11;
  }

  return v10;
}

+ (BOOL)storeUserInfoToPath:(id)a3 userInfo:(id)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = +[PRPosterPathModelObjectCache modelObjectCacheForPath:v8];
  [v10 resetUserInfo];

  id v11 = v9;
  NSClassFromString(&cfstr_Nsdictionary.isa);
  if (!v11)
  {
    id v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRPosterPathUtilities storeUserInfoToPath:userInfo:error:]();
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C242F10);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSDictionaryClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRPosterPathUtilities storeUserInfoToPath:userInfo:error:]();
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C242F74);
  }

  id v12 = [a1 userInfoURLForPath:v8];
  id v13 = (void *)MEMORY[0x192F915E0]();
  id v31 = 0;
  v14 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v11 format:200 options:0 error:&v31];
  id v15 = v31;
  if (v15)
  {
    id v16 = PRLogModel();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[PRPosterPathUtilities storeUserInfoToPath:userInfo:error:]();
    }

    id v17 = v15;
  }
  if (v14)
  {
    uint64_t v29 = a5;
    id v30 = 0;
    char v18 = [v14 writeToURL:v12 options:268435457 error:&v30];
    id v19 = v30;
    id v20 = PRLogModel();
    id v21 = v20;
    if (v19)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        +[PRPosterPathUtilities storeUserInfoToPath:userInfo:error:]();
      }

      id v22 = v19;
      id v21 = v15;
    }
    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = [v12 lastPathComponent];
        uint64_t v23 = [v12 URLByDeletingLastPathComponent];
        *(_DWORD *)buf = 138412546;
        __int16 v33 = v28;
        __int16 v34 = 2112;
        uint64_t v35 = v23;
        int v24 = (void *)v23;
        _os_log_impl(&dword_18C1C4000, v21, OS_LOG_TYPE_DEFAULT, "saved '%@'': (path=%@)", buf, 0x16u);
      }
      id v22 = v15;
    }

    a5 = v29;
  }
  else
  {
    char v18 = 0;
    id v22 = v15;
  }

  if (a5 && v22) {
    *a5 = v22;
  }

  return v18;
}

+ (BOOL)removeUserInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = +[PRPosterPathModelObjectCache modelObjectCacheForPath:v6];
  [v7 resetUserInfo];

  id v8 = [a1 userInfoURLForPath:v6];

  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  LOBYTE(a4) = [v9 removeItemAtURL:v8 error:a4];

  return (char)a4;
}

+ (id)proactiveGalleryOptionsURLForPath:(id)a3
{
  id v4 = [a3 contentsURL];
  id v5 = [a1 proactiveGalleryOptionsURLForContentsURL:v4];

  return v5;
}

+ (id)proactiveGalleryOptionsURLForContentsURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"com.apple.posterkit.provider.contents.galleryOptions" isDirectory:0];
}

+ (id)loadProactiveGalleryOptions:(id)a3 error:(id *)a4
{
  id v6 = [a1 proactiveGalleryOptionsURLForPath:a3];
  BOOL v7 = self;
  id v8 = [a1 loadUserObjectForURL:v6 expectedClass:v7 strict:0 error:a4];

  return v8;
}

+ (BOOL)storeProactiveGalleryOptionsToPath:(id)a3 proactiveGalleryOptions:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[PRPosterPathModelObjectCache modelObjectCacheForPath:v8];
  [v10 resetProactiveGalleryOptions];

  id v11 = v9;
  NSClassFromString(&cfstr_Atxposterdescr.isa);
  if (!v11)
  {
    id v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRPosterPathUtilities storeProactiveGalleryOptionsToPath:proactiveGalleryOptions:error:]();
    }
LABEL_9:
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C243258);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:ATXPosterDescriptorGalleryOptionsClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRPosterPathUtilities storeProactiveGalleryOptionsToPath:proactiveGalleryOptions:error:]();
    }
    goto LABEL_9;
  }

  id v12 = [a1 proactiveGalleryOptionsURLForPath:v8];
  char v13 = [a1 storeUserObject:v11 path:v8 atURL:v12 clearCache:0 error:a5];

  return v13;
}

+ (BOOL)removeProactiveGalleryOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = +[PRPosterPathModelObjectCache modelObjectCacheForPath:v6];
  [v7 resetProactiveGalleryOptions];

  id v8 = [a1 proactiveGalleryOptionsURLForPath:v6];

  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  LOBYTE(a4) = [v9 removeItemAtURL:v8 error:a4];

  return (char)a4;
}

+ (void)storeUserObject:path:atURL:clearCache:error:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_18C1C4000, v0, v1, "Failed to write %@: %{public}@");
}

+ (void)storeUserObject:path:atURL:clearCache:error:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_18C1C4000, v0, v1, "Failed to archive %@: %{public}@");
}

+ (void)storeUserObject:path:atURL:clearCache:error:.cold.3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_18C1C4000, v0, v1, "Failed to store %@: %{public}@");
}

+ (void)storeTitleStyleConfigurationForPath:titleStyleConfiguration:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)storeRenderingConfiguration:forPath:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)storeConfigurableOptionsForPath:configurableOptions:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)storeHomeScreenConfigurationForPath:homeScreenConfiguration:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)storeFocusConfigurationForPath:focusConfiguration:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)storeComplicationLayoutForPath:complicationLayout:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)storeColorVariationsConfigurationForPath:colorVariationsConfiguration:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)storeQuickActionsConfigurationForPath:quickActionsConfiguration:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)storeAmbientConfigurationForPath:ambientConfiguration:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)storeSuggestionMetadataForPath:suggestionMetadata:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)storeOtherMetadataForPath:otherMetadata:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)storePosterDescriptorGalleryOptions:posterDescriptorGalleryOptions:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)storeAmbientWidgetLayoutToPath:posterAmbientWidgetLayout:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)loadUserInfoForURL:error:.cold.1()
{
  OUTLINED_FUNCTION_13();
  v2 = [v1 lastPathComponent];
  id v3 = [v0 URLByDeletingLastPathComponent];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_12(&dword_18C1C4000, v4, v5, "Error during dict-plist deserializing of '%@': %{public}@ (path=%@)", v6, v7, v8, v9, v10);
}

+ (void)storeUserInfoToPath:userInfo:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)storeUserInfoToPath:userInfo:error:.cold.2()
{
  OUTLINED_FUNCTION_13();
  v2 = [v1 lastPathComponent];
  id v3 = [v0 URLByDeletingLastPathComponent];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_12(&dword_18C1C4000, v4, v5, "Error during dict-plist writing of '%@': %{public}@ (path=%@)", v6, v7, v8, v9, v10);
}

+ (void)storeUserInfoToPath:userInfo:error:.cold.3()
{
  OUTLINED_FUNCTION_13();
  v2 = [v1 lastPathComponent];
  id v3 = [v0 URLByDeletingLastPathComponent];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_12(&dword_18C1C4000, v4, v5, "Error during dict-plist serializing of '%@': %{public}@ (path=%@)", v6, v7, v8, v9, v10);
}

+ (void)storeProactiveGalleryOptionsToPath:proactiveGalleryOptions:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end