@interface PRPosterPathModelObjectCache
+ (id)modelObjectCacheForPath:(id)a3;
+ (id)modelObjectCacheLock;
+ (void)invalidateModelObjectCacheForPath:(id)a3;
- (ATXPosterDescriptorGalleryOptions)proactiveGalleryOptions;
- (NSDictionary)userInfo;
- (PRPosterAmbientConfiguration)ambientConfiguration;
- (PRPosterAmbientWidgetLayout)ambientWidgetLayout;
- (PRPosterColorVariationsConfiguration)colorVariationsConfiguration;
- (PRPosterComplicationLayout)complicationLayout;
- (PRPosterConfigurableOptions)configurableOptions;
- (PRPosterConfiguredProperties)configuredProperties;
- (PRPosterDescriptorGalleryOptions)galleryOptions;
- (PRPosterFocusConfiguration)focusConfiguration;
- (PRPosterHomeScreenConfiguration)homeScreenConfiguration;
- (PRPosterMetadata)otherMetadata;
- (PRPosterPathModelObjectCache)init;
- (PRPosterQuickActionsConfiguration)quickActionsConfiguration;
- (PRPosterRenderingConfiguration)renderingConfiguration;
- (PRPosterSuggestionMetadata)suggestionMetadata;
- (PRPosterTitleStyleConfiguration)titleStyleConfiguration;
- (id)_initWithPath:(id)a3;
- (id)homeScreenConfigurationOrError:(id *)a3;
- (void)configuredProperties;
- (void)dealloc;
- (void)invalidate;
- (void)resetAmbientConfiguration;
- (void)resetAmbientWidgetLayout;
- (void)resetColorVariationsConfiguration;
- (void)resetComplicationLayout;
- (void)resetConfigurableOptions;
- (void)resetConfiguredProperties;
- (void)resetFocusConfiguration;
- (void)resetGalleryOptions;
- (void)resetHomeScreenConfiguration;
- (void)resetOtherMetadata;
- (void)resetProactiveGalleryOptions;
- (void)resetQuickActionsConfiguration;
- (void)resetRenderingConfiguration;
- (void)resetSuggestionMetadata;
- (void)resetTitleStyleConfiguration;
- (void)resetUserInfo;
- (void)userInfo;
@end

@implementation PRPosterPathModelObjectCache

+ (id)modelObjectCacheLock
{
  if (modelObjectCacheLock_onceToken != -1) {
    dispatch_once(&modelObjectCacheLock_onceToken, &__block_literal_global_30);
  }
  v2 = (void *)modelObjectCacheLock_modelObjectCacheLock;
  return v2;
}

uint64_t __52__PRPosterPathModelObjectCache_modelObjectCacheLock__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = modelObjectCacheLock_modelObjectCacheLock;
  modelObjectCacheLock_modelObjectCacheLock = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)modelObjectCacheForPath:(id)a3
{
  id v4 = a3;
  if ([v4 isServerPosterPath])
  {
    v5 = [v4 identity];
    if (v5)
    {
      v6 = [a1 modelObjectCacheLock];
      [v6 lock];

      objc_getAssociatedObject(v4, "modelObjectCache");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        id v7 = [[PRPosterPathModelObjectCache alloc] _initWithPath:v4];
        if (v7) {
          objc_setAssociatedObject(v4, "modelObjectCache", v7, (void *)0x301);
        }
      }
      v8 = [a1 modelObjectCacheLock];
      [v8 unlock];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (void)invalidateModelObjectCacheForPath:(id)a3
{
  id object = a3;
  if ([object isServerPosterPath])
  {
    id v4 = [object identity];
    if (v4)
    {
      v5 = [a1 modelObjectCacheLock];
      [v5 lock];

      v6 = objc_getAssociatedObject(object, "modelObjectCache");
      id v7 = v6;
      if (v6) {
        [v6 invalidate];
      }
      objc_setAssociatedObject(object, "modelObjectCache", 0, (void *)0x301);
      v8 = [a1 modelObjectCacheLock];
      [v8 unlock];
    }
  }
}

- (PRPosterPathModelObjectCache)init
{
  return 0;
}

- (id)_initWithPath:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)PRPosterPathModelObjectCache;
  v5 = [(PRPosterPathModelObjectCache *)&v39 init];
  if (!v5)
  {
LABEL_8:
    v22 = v5;
    goto LABEL_9;
  }
  uint64_t v6 = [v4 identity];
  identity = v5->_identity;
  v5->_identity = (PFServerPosterIdentity *)v6;

  uint64_t v8 = [v4 role];
  role = v5->_role;
  v5->_role = (NSString *)v8;

  uint64_t v10 = [v4 containerURL];
  pathURL = v5->_pathURL;
  v5->_pathURL = (NSURL *)v10;

  uint64_t v12 = [v4 instanceURL];
  pathInstanceURL = v5->_pathInstanceURL;
  v5->_pathInstanceURL = (NSURL *)v12;

  uint64_t v14 = [v4 contentsURL];
  pathContentsURL = v5->_pathContentsURL;
  v5->_pathContentsURL = (NSURL *)v14;

  uint64_t v16 = [v4 identifierURL];
  pathIdentifierURL = v5->_pathIdentifierURL;
  v5->_pathIdentifierURL = (NSURL *)v16;

  uint64_t v18 = [v4 supplementURL];
  pathSupplementURL = v5->_pathSupplementURL;
  v5->_pathSupplementURL = (NSURL *)v18;

  v20 = [(NSURL *)v5->_pathInstanceURL path];
  char v21 = [v20 containsString:@"_STAGED_"];

  if ((v21 & 1) == 0)
  {
    v37 = NSString;
    v38 = [(PFServerPosterIdentity *)v5->_identity provider];
    v36 = [v38 pathExtension];
    [(PFServerPosterIdentity *)v5->_identity type];
    v23 = NSStringFromPFServerPosterType();
    v24 = [(PFServerPosterIdentity *)v5->_identity descriptorIdentifier];
    v25 = [(PFServerPosterIdentity *)v5->_identity posterUUID];
    v26 = [v25 UUIDString];
    v27 = [v26 substringToIndex:7];
    uint64_t v28 = [(PFServerPosterIdentity *)v5->_identity version];
    uint64_t v29 = [(PFServerPosterIdentity *)v5->_identity supplement];
    v30 = [(NSString *)v5->_role stringByReplacingOccurrencesOfString:@"PRPosterRole" withString:&stru_1ED9A3120];
    uint64_t v31 = [v37 stringWithFormat:@"%@:%@:%@:%@:%llu_%llu:%@", v36, v23, v24, v27, v28, v29, v30];
    logPreamble = v5->_logPreamble;
    v5->_logPreamble = (NSString *)v31;

    v33 = PRLogModel();
    LODWORD(v30) = os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG);

    if (v30)
    {
      v34 = PRLogModel();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        -[PRPosterPathModelObjectCache _initWithPath:]();
      }
    }
    goto LABEL_8;
  }
  v22 = 0;
LABEL_9:

  return v22;
}

- (void)invalidate
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_14(&dword_18C1C4000, v0, v1, "[%{public}@ cache] invalidate", v2, v3, v4, v5, v6);
}

- (void)dealloc
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_14(&dword_18C1C4000, v0, v1, "[%{public}@ cache] dealloc", v2, v3, v4, v5, v6);
}

- (PRPosterConfiguredProperties)configuredProperties
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2->_configuredProperties)
  {
    uint64_t v3 = PRLogModel();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

    if (!v4) {
      goto LABEL_15;
    }
    uint64_t v5 = PRLogModel();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache configuredProperties]();
    }
  }
  else
  {
    if ([(NSString *)v2->_role isEqual:@"PRPosterRoleAmbient"])
    {
      uint8_t v6 = [PRPosterConfiguredProperties alloc];
      v24 = [(PRPosterPathModelObjectCache *)v2 ambientConfiguration];
      id v7 = [(PRPosterPathModelObjectCache *)v2 ambientWidgetLayout];
      uint64_t v8 = [(PRPosterPathModelObjectCache *)v2 otherMetadata];
      v9 = [(PRPosterPathModelObjectCache *)v2 userInfo];
      uint64_t v10 = [(PRPosterConfiguredProperties *)v6 initWithAmbientConfiguration:v24 widgetLayout:v7 otherMetadata:v8 userInfo:v9];
      configuredProperties = v2->_configuredProperties;
      v2->_configuredProperties = (PRPosterConfiguredProperties *)v10;
    }
    else
    {
      v23 = [PRPosterConfiguredProperties alloc];
      v24 = [(PRPosterPathModelObjectCache *)v2 titleStyleConfiguration];
      id v7 = [(PRPosterPathModelObjectCache *)v2 focusConfiguration];
      uint64_t v8 = [(PRPosterPathModelObjectCache *)v2 complicationLayout];
      v9 = [(PRPosterPathModelObjectCache *)v2 renderingConfiguration];
      configuredProperties = [(PRPosterPathModelObjectCache *)v2 homeScreenConfiguration];
      uint64_t v12 = [(PRPosterPathModelObjectCache *)v2 colorVariationsConfiguration];
      v13 = [(PRPosterPathModelObjectCache *)v2 quickActionsConfiguration];
      uint64_t v14 = [(PRPosterPathModelObjectCache *)v2 suggestionMetadata];
      v15 = [(PRPosterPathModelObjectCache *)v2 otherMetadata];
      uint64_t v16 = [(PRPosterPathModelObjectCache *)v2 userInfo];
      uint64_t v17 = [(PRPosterConfiguredProperties *)v23 initWithTitleStyleConfiguration:v24 focusConfiguration:v7 complicationLayout:v8 renderingConfiguration:v9 homeScreenConfiguration:configuredProperties colorVariationsConfiguration:v12 quickActionsConfiguration:v13 suggestionMetadata:v14 otherMetadata:v15 userInfo:v16];
      uint64_t v18 = v2->_configuredProperties;
      v2->_configuredProperties = (PRPosterConfiguredProperties *)v17;
    }
    v19 = PRLogModel();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);

    if (!v20) {
      goto LABEL_15;
    }
    if (v2->_configuredProperties)
    {
      uint64_t v5 = PRLogModel();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache configuredProperties]();
      }
    }
    else
    {
      uint64_t v5 = PRLogModel();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache configuredProperties]();
      }
    }
  }

LABEL_15:
  char v21 = v2->_configuredProperties;
  objc_sync_exit(v2);

  return v21;
}

- (void)resetConfiguredProperties
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = NSStringFromSelector(aSelector);
  int v6 = 138543618;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  v9 = v5;
  _os_log_debug_impl(&dword_18C1C4000, a3, OS_LOG_TYPE_DEBUG, "[%{public}@ cache] %{public}@", (uint8_t *)&v6, 0x16u);
}

- (NSDictionary)userInfo
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self;
  objc_sync_enter(v3);
  if (v3->_userInfoLoadError)
  {
    uint64_t v4 = PRLogModel();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
    {
      int v6 = PRLogModel();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache userInfo]();
      }
    }
    uint64_t v7 = 0;
  }
  else if (v3->_userInfo)
  {
    __int16 v8 = PRLogModel();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      uint64_t v10 = PRLogModel();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache configuredProperties]();
      }
    }
    uint64_t v7 = v3->_userInfo;
  }
  else
  {
    v11 = +[PRPosterPathUtilities userInfoURLForPosterContentsURL:v3->_pathContentsURL];
    id v22 = 0;
    uint64_t v12 = +[PRPosterPathUtilities loadUserInfoForURL:v11 error:&v22];
    id v13 = v22;
    userInfo = v3->_userInfo;
    v3->_userInfo = (NSDictionary *)v12;

    v15 = PRLogModel();
    LODWORD(v12) = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

    if (v12)
    {
      if (v3->_userInfo)
      {
        p_super = PRLogModel();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[PRPosterPathModelObjectCache configuredProperties]();
        }
      }
      else
      {
        uint64_t v17 = PRLogModel();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          logPreamble = v3->_logPreamble;
          char v21 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543874;
          v24 = logPreamble;
          __int16 v25 = 2114;
          v26 = v21;
          __int16 v27 = 2114;
          id v28 = v13;
          _os_log_debug_impl(&dword_18C1C4000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@ cache] failed to load cached value for %{public}@: %{public}@", buf, 0x20u);
        }
        uint64_t v18 = (NSError *)v13;
        p_super = &v3->_userInfoLoadError->super;
        v3->_userInfoLoadError = v18;
      }
    }
    uint64_t v7 = v3->_userInfo;
  }
  objc_sync_exit(v3);

  return v7;
}

- (void)resetUserInfo
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_5(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_1(&dword_18C1C4000, "[%{public}@ cache] %{public}@", v4, v5);
}

- (PRPosterTitleStyleConfiguration)titleStyleConfiguration
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self;
  objc_sync_enter(v3);
  if (v3->_titleStyleConfigurationLoadError)
  {
    uint64_t v4 = PRLogModel();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
    {
      int v6 = PRLogModel();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache userInfo]();
      }
    }
    uint64_t v7 = 0;
  }
  else if (v3->_titleStyleConfiguration)
  {
    __int16 v8 = PRLogModel();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      uint64_t v10 = PRLogModel();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache configuredProperties]();
      }
    }
    uint64_t v7 = v3->_titleStyleConfiguration;
  }
  else
  {
    v11 = +[PRPosterPathUtilities titleStyleConfigurationURLForPathInstanceURL:v3->_pathInstanceURL];
    id v22 = 0;
    uint64_t v12 = +[PRPosterPathUtilities loadUserObjectForURL:v11 expectedClass:objc_opt_class() strict:1 error:&v22];
    id v13 = v22;
    titleStyleConfiguration = v3->_titleStyleConfiguration;
    v3->_titleStyleConfiguration = (PRPosterTitleStyleConfiguration *)v12;

    v15 = PRLogModel();
    LODWORD(v12) = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

    if (v12)
    {
      if (v3->_titleStyleConfiguration)
      {
        p_super = PRLogModel();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[PRPosterPathModelObjectCache configuredProperties]();
        }
      }
      else
      {
        uint64_t v17 = PRLogModel();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          logPreamble = v3->_logPreamble;
          char v21 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543874;
          v24 = logPreamble;
          __int16 v25 = 2114;
          v26 = v21;
          __int16 v27 = 2114;
          id v28 = v13;
          _os_log_debug_impl(&dword_18C1C4000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@ cache] failed to load cached value for %{public}@: %{public}@", buf, 0x20u);
        }
        uint64_t v18 = (NSError *)v13;
        p_super = &v3->_titleStyleConfigurationLoadError->super;
        v3->_titleStyleConfigurationLoadError = v18;
      }
    }
    uint64_t v7 = v3->_titleStyleConfiguration;
  }
  objc_sync_exit(v3);

  return v7;
}

- (void)resetTitleStyleConfiguration
{
  uint64_t v3 = self;
  objc_sync_enter(v3);
  uint64_t v4 = PRLogModel();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    int v6 = PRLogModel();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache resetUserInfo]();
    }
  }
  titleStyleConfiguration = v3->_titleStyleConfiguration;
  v3->_titleStyleConfiguration = 0;

  titleStyleConfigurationLoadError = v3->_titleStyleConfigurationLoadError;
  v3->_titleStyleConfigurationLoadError = 0;

  configuredProperties = v3->_configuredProperties;
  v3->_configuredProperties = 0;

  objc_sync_exit(v3);
}

- (PRPosterRenderingConfiguration)renderingConfiguration
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self;
  objc_sync_enter(v3);
  if (v3->_renderingConfigurationLoadError)
  {
    uint64_t v4 = PRLogModel();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
    {
      int v6 = PRLogModel();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache userInfo]();
      }
    }
    uint64_t v7 = 0;
  }
  else if (v3->_renderingConfiguration)
  {
    __int16 v8 = PRLogModel();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      uint64_t v10 = PRLogModel();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache configuredProperties]();
      }
    }
    uint64_t v7 = v3->_renderingConfiguration;
  }
  else
  {
    v11 = +[PRPosterPathUtilities renderingConfigurationURLForPathInstanceURL:v3->_pathInstanceURL];
    id v22 = 0;
    uint64_t v12 = +[PRPosterPathUtilities loadUserObjectForURL:v11 expectedClass:objc_opt_class() strict:1 error:&v22];
    id v13 = v22;
    renderingConfiguration = v3->_renderingConfiguration;
    v3->_renderingConfiguration = (PRPosterRenderingConfiguration *)v12;

    v15 = PRLogModel();
    LODWORD(v12) = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

    if (v12)
    {
      if (v3->_renderingConfiguration)
      {
        p_super = PRLogModel();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[PRPosterPathModelObjectCache configuredProperties]();
        }
      }
      else
      {
        uint64_t v17 = PRLogModel();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          logPreamble = v3->_logPreamble;
          char v21 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543874;
          v24 = logPreamble;
          __int16 v25 = 2114;
          v26 = v21;
          __int16 v27 = 2114;
          id v28 = v13;
          _os_log_debug_impl(&dword_18C1C4000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@ cache] failed to load cached value for %{public}@: %{public}@", buf, 0x20u);
        }
        uint64_t v18 = (NSError *)v13;
        p_super = &v3->_renderingConfigurationLoadError->super;
        v3->_renderingConfigurationLoadError = v18;
      }
    }
    uint64_t v7 = v3->_renderingConfiguration;
  }
  objc_sync_exit(v3);

  return v7;
}

- (void)resetRenderingConfiguration
{
  uint64_t v3 = self;
  objc_sync_enter(v3);
  uint64_t v4 = PRLogModel();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    int v6 = PRLogModel();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache resetUserInfo]();
    }
  }
  renderingConfiguration = v3->_renderingConfiguration;
  v3->_renderingConfiguration = 0;

  renderingConfigurationLoadError = v3->_renderingConfigurationLoadError;
  v3->_renderingConfigurationLoadError = 0;

  configuredProperties = v3->_configuredProperties;
  v3->_configuredProperties = 0;

  objc_sync_exit(v3);
}

- (PRPosterConfigurableOptions)configurableOptions
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self;
  objc_sync_enter(v3);
  if (v3->_configurableOptionsLoadError)
  {
    uint64_t v4 = PRLogModel();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
    {
      int v6 = PRLogModel();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache userInfo]();
      }
    }
    uint64_t v7 = 0;
  }
  else if (v3->_configurableOptions)
  {
    __int16 v8 = PRLogModel();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      uint64_t v10 = PRLogModel();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache configuredProperties]();
      }
    }
    uint64_t v7 = v3->_configurableOptions;
  }
  else
  {
    v11 = +[PRPosterPathUtilities configurableOptionsURLForContentsURL:v3->_pathContentsURL];
    id v22 = 0;
    uint64_t v12 = +[PRPosterPathUtilities loadUserObjectForURL:v11 expectedClass:objc_opt_class() strict:1 error:&v22];
    id v13 = v22;
    configurableOptions = v3->_configurableOptions;
    v3->_configurableOptions = (PRPosterConfigurableOptions *)v12;

    v15 = PRLogModel();
    LODWORD(v12) = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

    if (v12)
    {
      if (v3->_configurableOptions)
      {
        p_super = PRLogModel();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[PRPosterPathModelObjectCache configuredProperties]();
        }
      }
      else
      {
        uint64_t v17 = PRLogModel();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          logPreamble = v3->_logPreamble;
          char v21 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543874;
          v24 = logPreamble;
          __int16 v25 = 2114;
          v26 = v21;
          __int16 v27 = 2114;
          id v28 = v13;
          _os_log_debug_impl(&dword_18C1C4000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@ cache] failed to load cached value for %{public}@: %{public}@", buf, 0x20u);
        }
        uint64_t v18 = (NSError *)v13;
        p_super = &v3->_configurableOptionsLoadError->super;
        v3->_configurableOptionsLoadError = v18;
      }
    }
    uint64_t v7 = v3->_configurableOptions;
  }
  objc_sync_exit(v3);

  return v7;
}

- (void)resetConfigurableOptions
{
  uint64_t v3 = self;
  objc_sync_enter(v3);
  uint64_t v4 = PRLogModel();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    int v6 = PRLogModel();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache resetUserInfo]();
    }
  }
  configurableOptions = v3->_configurableOptions;
  v3->_configurableOptions = 0;

  configurableOptionsLoadError = v3->_configurableOptionsLoadError;
  v3->_configurableOptionsLoadError = 0;

  configuredProperties = v3->_configuredProperties;
  v3->_configuredProperties = 0;

  objc_sync_exit(v3);
}

- (PRPosterHomeScreenConfiguration)homeScreenConfiguration
{
  return (PRPosterHomeScreenConfiguration *)[(PRPosterPathModelObjectCache *)self homeScreenConfigurationOrError:0];
}

- (id)homeScreenConfigurationOrError:(id *)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  BOOL v5 = self;
  objc_sync_enter(v5);
  p_homeScreenConfigurationLoadError = (id *)&v5->_homeScreenConfigurationLoadError;
  if (v5->_homeScreenConfigurationLoadError)
  {
    uint64_t v7 = PRLogModel();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

    if (v8)
    {
      BOOL v9 = PRLogModel();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache userInfo]();
      }
    }
    if (a3 && (objc_msgSend(*p_homeScreenConfigurationLoadError, "pf_isFileNotFoundError") & 1) == 0)
    {
      id v14 = (id)[*p_homeScreenConfigurationLoadError copy];
      uint64_t v10 = 0;
      *a3 = v14;
    }
    else
    {
      uint64_t v10 = 0;
    }
    goto LABEL_35;
  }
  if (!v5->_homeScreenConfiguration)
  {
    v15 = +[PRPosterPathUtilities homeScreenConfigurationURLForSupplementURL:v5->_pathSupplementURL];
    id v35 = 0;
    uint64_t v16 = +[PRPosterPathUtilities loadUserObjectForURL:v15 expectedClass:objc_opt_class() strict:0 error:&v35];
    id v17 = v35;
    homeScreenConfiguration = v5->_homeScreenConfiguration;
    v5->_homeScreenConfiguration = (PRPosterHomeScreenConfiguration *)v16;

    if (v5->_homeScreenConfiguration)
    {
      id v19 = 0;
    }
    else
    {
      BOOL v20 = +[PRPosterPathUtilities oldHomeScreenConfigurationURLForIdentifierURL:v5->_pathIdentifierURL];
      id v34 = 0;
      uint64_t v21 = +[PRPosterPathUtilities loadUserObjectForURL:v20 expectedClass:objc_opt_class() strict:0 error:&v34];
      id v19 = v34;
      id v22 = v5->_homeScreenConfiguration;
      v5->_homeScreenConfiguration = (PRPosterHomeScreenConfiguration *)v21;

      if (!v5->_homeScreenConfiguration)
      {
        if (v17) {
          v26 = v17;
        }
        else {
          v26 = v19;
        }
        __int16 v25 = v26;
        __int16 v27 = PRLogModel();
        BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);

        if (v28)
        {
          uint64_t v29 = PRLogModel();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            logPreamble = v5->_logPreamble;
            v33 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138543874;
            v37 = logPreamble;
            __int16 v38 = 2114;
            objc_super v39 = v33;
            __int16 v40 = 2114;
            v41 = v25;
            _os_log_debug_impl(&dword_18C1C4000, v29, OS_LOG_TYPE_DEBUG, "[%{public}@ cache] failed to load cached value for %{public}@: %{public}@", buf, 0x20u);
          }
        }
        if ([v25 pf_isFileNotFoundError])
        {
          v30 = PRLogModel();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            -[PRPosterPathModelObjectCache homeScreenConfigurationOrError:]();
          }

          objc_storeStrong((id *)&v5->_homeScreenConfigurationLoadError, v26);
        }
        goto LABEL_33;
      }
    }
    v23 = PRLogModel();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);

    if (!v24)
    {
LABEL_34:
      uint64_t v10 = v5->_homeScreenConfiguration;

      goto LABEL_35;
    }
    __int16 v25 = PRLogModel();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache configuredProperties]();
    }
LABEL_33:

    goto LABEL_34;
  }
  v11 = PRLogModel();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);

  if (v12)
  {
    id v13 = PRLogModel();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache configuredProperties]();
    }
  }
  uint64_t v10 = v5->_homeScreenConfiguration;
LABEL_35:
  objc_sync_exit(v5);

  return v10;
}

- (void)resetHomeScreenConfiguration
{
  uint64_t v3 = self;
  objc_sync_enter(v3);
  uint64_t v4 = PRLogModel();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    int v6 = PRLogModel();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache resetUserInfo]();
    }
  }
  homeScreenConfiguration = v3->_homeScreenConfiguration;
  v3->_homeScreenConfiguration = 0;

  homeScreenConfigurationLoadError = v3->_homeScreenConfigurationLoadError;
  v3->_homeScreenConfigurationLoadError = 0;

  configuredProperties = v3->_configuredProperties;
  v3->_configuredProperties = 0;

  objc_sync_exit(v3);
}

- (PRPosterFocusConfiguration)focusConfiguration
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self;
  objc_sync_enter(v3);
  if (v3->_focusConfigurationLoadError)
  {
    uint64_t v4 = PRLogModel();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
    {
      int v6 = PRLogModel();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache userInfo]();
      }
    }
    uint64_t v7 = 0;
  }
  else if (v3->_focusConfiguration)
  {
    BOOL v8 = PRLogModel();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      uint64_t v10 = PRLogModel();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache configuredProperties]();
      }
    }
    uint64_t v7 = v3->_focusConfiguration;
  }
  else
  {
    v11 = +[PRPosterPathUtilities focusConfigurationURLForIdentifierURL:v3->_pathIdentifierURL];
    id v22 = 0;
    uint64_t v12 = +[PRPosterPathUtilities loadUserObjectForURL:v11 expectedClass:objc_opt_class() strict:0 error:&v22];
    id v13 = v22;
    focusConfiguration = v3->_focusConfiguration;
    v3->_focusConfiguration = (PRPosterFocusConfiguration *)v12;

    v15 = PRLogModel();
    LODWORD(v12) = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

    if (v12)
    {
      if (v3->_focusConfiguration)
      {
        p_super = PRLogModel();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[PRPosterPathModelObjectCache configuredProperties]();
        }
      }
      else
      {
        id v17 = PRLogModel();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          logPreamble = v3->_logPreamble;
          uint64_t v21 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543874;
          BOOL v24 = logPreamble;
          __int16 v25 = 2114;
          v26 = v21;
          __int16 v27 = 2114;
          id v28 = v13;
          _os_log_debug_impl(&dword_18C1C4000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@ cache] failed to load cached value for %{public}@: %{public}@", buf, 0x20u);
        }
        uint64_t v18 = (NSError *)v13;
        p_super = &v3->_focusConfigurationLoadError->super;
        v3->_focusConfigurationLoadError = v18;
      }
    }
    uint64_t v7 = v3->_focusConfiguration;
  }
  objc_sync_exit(v3);

  return v7;
}

- (void)resetFocusConfiguration
{
  uint64_t v3 = self;
  objc_sync_enter(v3);
  uint64_t v4 = PRLogModel();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    int v6 = PRLogModel();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache resetUserInfo]();
    }
  }
  focusConfiguration = v3->_focusConfiguration;
  v3->_focusConfiguration = 0;

  focusConfigurationLoadError = v3->_focusConfigurationLoadError;
  v3->_focusConfigurationLoadError = 0;

  configuredProperties = v3->_configuredProperties;
  v3->_configuredProperties = 0;

  objc_sync_exit(v3);
}

- (PRPosterComplicationLayout)complicationLayout
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self;
  objc_sync_enter(v3);
  if (v3->_complicationLayoutLoadError)
  {
    uint64_t v4 = PRLogModel();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
    {
      int v6 = PRLogModel();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache userInfo]();
      }
    }
    uint64_t v7 = 0;
  }
  else if (v3->_complicationLayout)
  {
    BOOL v8 = PRLogModel();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      uint64_t v10 = PRLogModel();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache configuredProperties]();
      }
    }
    uint64_t v7 = v3->_complicationLayout;
  }
  else
  {
    v11 = +[PRPosterPathUtilities complicationsLayoutURLForInstanceURL:v3->_pathInstanceURL];
    id v22 = 0;
    uint64_t v12 = +[PRPosterPathUtilities loadUserObjectForURL:v11 expectedClass:objc_opt_class() strict:0 error:&v22];
    id v13 = v22;
    complicationLayout = v3->_complicationLayout;
    v3->_complicationLayout = (PRPosterComplicationLayout *)v12;

    v15 = PRLogModel();
    LODWORD(v12) = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

    if (v12)
    {
      if (v3->_complicationLayout)
      {
        p_super = PRLogModel();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[PRPosterPathModelObjectCache configuredProperties]();
        }
      }
      else
      {
        id v17 = PRLogModel();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          logPreamble = v3->_logPreamble;
          uint64_t v21 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543874;
          BOOL v24 = logPreamble;
          __int16 v25 = 2114;
          v26 = v21;
          __int16 v27 = 2114;
          id v28 = v13;
          _os_log_debug_impl(&dword_18C1C4000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@ cache] failed to load cached value for %{public}@: %{public}@", buf, 0x20u);
        }
        uint64_t v18 = (NSError *)v13;
        p_super = &v3->_complicationLayoutLoadError->super;
        v3->_complicationLayoutLoadError = v18;
      }
    }
    uint64_t v7 = v3->_complicationLayout;
  }
  objc_sync_exit(v3);

  return v7;
}

- (void)resetComplicationLayout
{
  uint64_t v3 = self;
  objc_sync_enter(v3);
  uint64_t v4 = PRLogModel();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    int v6 = PRLogModel();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache resetUserInfo]();
    }
  }
  complicationLayout = v3->_complicationLayout;
  v3->_complicationLayout = 0;

  complicationLayoutLoadError = v3->_complicationLayoutLoadError;
  v3->_complicationLayoutLoadError = 0;

  configuredProperties = v3->_configuredProperties;
  v3->_configuredProperties = 0;

  objc_sync_exit(v3);
}

- (PRPosterColorVariationsConfiguration)colorVariationsConfiguration
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self;
  objc_sync_enter(v3);
  if (v3->_colorVariationsConfigurationLoadError)
  {
    uint64_t v4 = PRLogModel();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
    {
      int v6 = PRLogModel();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache userInfo]();
      }
    }
    uint64_t v7 = 0;
  }
  else if (v3->_colorVariationsConfiguration)
  {
    BOOL v8 = PRLogModel();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      uint64_t v10 = PRLogModel();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache configuredProperties]();
      }
    }
    uint64_t v7 = v3->_colorVariationsConfiguration;
  }
  else
  {
    v11 = +[PRPosterPathUtilities colorVariationsConfigurationURLForInstanceURL:v3->_pathInstanceURL];
    id v22 = 0;
    uint64_t v12 = +[PRPosterPathUtilities loadUserObjectForURL:v11 expectedClass:objc_opt_class() strict:1 error:&v22];
    id v13 = v22;
    colorVariationsConfiguration = v3->_colorVariationsConfiguration;
    v3->_colorVariationsConfiguration = (PRPosterColorVariationsConfiguration *)v12;

    v15 = PRLogModel();
    LODWORD(v12) = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

    if (v12)
    {
      if (v3->_colorVariationsConfiguration)
      {
        p_super = PRLogModel();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[PRPosterPathModelObjectCache configuredProperties]();
        }
      }
      else
      {
        id v17 = PRLogModel();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          logPreamble = v3->_logPreamble;
          uint64_t v21 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543874;
          BOOL v24 = logPreamble;
          __int16 v25 = 2114;
          v26 = v21;
          __int16 v27 = 2114;
          id v28 = v13;
          _os_log_debug_impl(&dword_18C1C4000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@ cache] failed to load cached value for %{public}@: %{public}@", buf, 0x20u);
        }
        uint64_t v18 = (NSError *)v13;
        p_super = &v3->_colorVariationsConfigurationLoadError->super;
        v3->_colorVariationsConfigurationLoadError = v18;
      }
    }
    uint64_t v7 = v3->_colorVariationsConfiguration;
  }
  objc_sync_exit(v3);

  return v7;
}

- (void)resetColorVariationsConfiguration
{
  uint64_t v3 = self;
  objc_sync_enter(v3);
  uint64_t v4 = PRLogModel();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    int v6 = PRLogModel();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache resetUserInfo]();
    }
  }
  colorVariationsConfiguration = v3->_colorVariationsConfiguration;
  v3->_colorVariationsConfiguration = 0;

  colorVariationsConfigurationLoadError = v3->_colorVariationsConfigurationLoadError;
  v3->_colorVariationsConfigurationLoadError = 0;

  configuredProperties = v3->_configuredProperties;
  v3->_configuredProperties = 0;

  objc_sync_exit(v3);
}

- (PRPosterQuickActionsConfiguration)quickActionsConfiguration
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self;
  objc_sync_enter(v3);
  if (v3->_quickActionsConfigurationLoadError)
  {
    uint64_t v4 = PRLogModel();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
    {
      int v6 = PRLogModel();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache userInfo]();
      }
    }
    uint64_t v7 = 0;
  }
  else if (v3->_quickActionsConfiguration)
  {
    BOOL v8 = PRLogModel();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      uint64_t v10 = PRLogModel();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache configuredProperties]();
      }
    }
    uint64_t v7 = v3->_quickActionsConfiguration;
  }
  else
  {
    v11 = +[PRPosterPathUtilities quickActionsConfigurationURLForInstanceURL:v3->_pathInstanceURL];
    id v22 = 0;
    uint64_t v12 = +[PRPosterPathUtilities loadUserObjectForURL:v11 expectedClass:objc_opt_class() strict:0 error:&v22];
    id v13 = v22;
    quickActionsConfiguration = v3->_quickActionsConfiguration;
    v3->_quickActionsConfiguration = (PRPosterQuickActionsConfiguration *)v12;

    v15 = PRLogModel();
    LODWORD(v12) = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

    if (v12)
    {
      if (v3->_quickActionsConfiguration)
      {
        p_super = PRLogModel();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[PRPosterPathModelObjectCache configuredProperties]();
        }
      }
      else
      {
        id v17 = PRLogModel();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          logPreamble = v3->_logPreamble;
          uint64_t v21 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543874;
          BOOL v24 = logPreamble;
          __int16 v25 = 2114;
          v26 = v21;
          __int16 v27 = 2114;
          id v28 = v13;
          _os_log_debug_impl(&dword_18C1C4000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@ cache] failed to load cached value for %{public}@: %{public}@", buf, 0x20u);
        }
        uint64_t v18 = (NSError *)v13;
        p_super = &v3->_quickActionsConfigurationLoadError->super;
        v3->_quickActionsConfigurationLoadError = v18;
      }
    }
    uint64_t v7 = v3->_quickActionsConfiguration;
  }
  objc_sync_exit(v3);

  return v7;
}

- (void)resetQuickActionsConfiguration
{
  uint64_t v3 = self;
  objc_sync_enter(v3);
  uint64_t v4 = PRLogModel();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    int v6 = PRLogModel();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache resetUserInfo]();
    }
  }
  quickActionsConfiguration = v3->_quickActionsConfiguration;
  v3->_quickActionsConfiguration = 0;

  quickActionsConfigurationLoadError = v3->_quickActionsConfigurationLoadError;
  v3->_quickActionsConfigurationLoadError = 0;

  configuredProperties = v3->_configuredProperties;
  v3->_configuredProperties = 0;

  objc_sync_exit(v3);
}

- (PRPosterSuggestionMetadata)suggestionMetadata
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self;
  objc_sync_enter(v3);
  if (v3->_suggestionMetadataLoadError)
  {
    uint64_t v4 = PRLogModel();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
    {
      int v6 = PRLogModel();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache userInfo]();
      }
    }
    uint64_t v7 = 0;
  }
  else if (v3->_suggestionMetadata)
  {
    BOOL v8 = PRLogModel();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      uint64_t v10 = PRLogModel();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache configuredProperties]();
      }
    }
    uint64_t v7 = v3->_suggestionMetadata;
  }
  else
  {
    v11 = +[PRPosterPathUtilities suggestionMetadataURLForIdentifierURL:v3->_pathIdentifierURL];
    id v22 = 0;
    uint64_t v12 = +[PRPosterPathUtilities loadUserObjectForURL:v11 expectedClass:objc_opt_class() strict:0 error:&v22];
    id v13 = v22;
    suggestionMetadata = v3->_suggestionMetadata;
    v3->_suggestionMetadata = (PRPosterSuggestionMetadata *)v12;

    v15 = PRLogModel();
    LODWORD(v12) = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

    if (v12)
    {
      if (v3->_suggestionMetadata)
      {
        p_super = PRLogModel();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[PRPosterPathModelObjectCache configuredProperties]();
        }
      }
      else
      {
        id v17 = PRLogModel();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          logPreamble = v3->_logPreamble;
          uint64_t v21 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543874;
          BOOL v24 = logPreamble;
          __int16 v25 = 2114;
          v26 = v21;
          __int16 v27 = 2114;
          id v28 = v13;
          _os_log_debug_impl(&dword_18C1C4000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@ cache] failed to load cached value for %{public}@: %{public}@", buf, 0x20u);
        }
        uint64_t v18 = (NSError *)v13;
        p_super = &v3->_suggestionMetadataLoadError->super;
        v3->_suggestionMetadataLoadError = v18;
      }
    }
    uint64_t v7 = v3->_suggestionMetadata;
  }
  objc_sync_exit(v3);

  return v7;
}

- (void)resetSuggestionMetadata
{
  uint64_t v3 = self;
  objc_sync_enter(v3);
  uint64_t v4 = PRLogModel();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    int v6 = PRLogModel();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache resetUserInfo]();
    }
  }
  suggestionMetadata = v3->_suggestionMetadata;
  v3->_suggestionMetadata = 0;

  suggestionMetadataLoadError = v3->_suggestionMetadataLoadError;
  v3->_suggestionMetadataLoadError = 0;

  configuredProperties = v3->_configuredProperties;
  v3->_configuredProperties = 0;

  objc_sync_exit(v3);
}

- (PRPosterMetadata)otherMetadata
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self;
  objc_sync_enter(v3);
  if (v3->_otherMetadataLoadError)
  {
    uint64_t v4 = PRLogModel();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
    {
      int v6 = PRLogModel();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache userInfo]();
      }
    }
    uint64_t v7 = 0;
  }
  else if (v3->_otherMetadata)
  {
    BOOL v8 = PRLogModel();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      uint64_t v10 = PRLogModel();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache configuredProperties]();
      }
    }
    uint64_t v7 = v3->_otherMetadata;
  }
  else
  {
    v11 = +[PRPosterPathUtilities otherMetadataURLForContentsURL:v3->_pathContentsURL];
    id v22 = 0;
    uint64_t v12 = +[PRPosterPathUtilities loadUserObjectForURL:v11 expectedClass:objc_opt_class() strict:1 error:&v22];
    id v13 = v22;
    otherMetadata = v3->_otherMetadata;
    v3->_otherMetadata = (PRPosterMetadata *)v12;

    v15 = PRLogModel();
    LODWORD(v12) = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

    if (v12)
    {
      if (v3->_otherMetadata)
      {
        p_super = PRLogModel();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[PRPosterPathModelObjectCache configuredProperties]();
        }
      }
      else
      {
        id v17 = PRLogModel();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          logPreamble = v3->_logPreamble;
          uint64_t v21 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543874;
          BOOL v24 = logPreamble;
          __int16 v25 = 2114;
          v26 = v21;
          __int16 v27 = 2114;
          id v28 = v13;
          _os_log_debug_impl(&dword_18C1C4000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@ cache] failed to load cached value for %{public}@: %{public}@", buf, 0x20u);
        }
        uint64_t v18 = (NSError *)v13;
        p_super = &v3->_otherMetadataLoadError->super;
        v3->_otherMetadataLoadError = v18;
      }
    }
    uint64_t v7 = v3->_otherMetadata;
  }
  objc_sync_exit(v3);

  return v7;
}

- (void)resetOtherMetadata
{
  uint64_t v3 = self;
  objc_sync_enter(v3);
  uint64_t v4 = PRLogModel();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    int v6 = PRLogModel();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache resetUserInfo]();
    }
  }
  otherMetadata = v3->_otherMetadata;
  v3->_otherMetadata = 0;

  otherMetadataLoadError = v3->_otherMetadataLoadError;
  v3->_otherMetadataLoadError = 0;

  configuredProperties = v3->_configuredProperties;
  v3->_configuredProperties = 0;

  objc_sync_exit(v3);
}

- (PRPosterDescriptorGalleryOptions)galleryOptions
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self;
  objc_sync_enter(v3);
  if (v3->_galleryOptionsLoadError)
  {
    uint64_t v4 = PRLogModel();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
    {
      int v6 = PRLogModel();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache userInfo]();
      }
    }
    uint64_t v7 = 0;
  }
  else if (v3->_galleryOptions)
  {
    BOOL v8 = PRLogModel();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      uint64_t v10 = PRLogModel();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache configuredProperties]();
      }
    }
    uint64_t v7 = v3->_galleryOptions;
  }
  else
  {
    v11 = +[PRPosterPathUtilities descriptorGalleryOptionsURLForContentsURL:v3->_pathContentsURL];
    id v22 = 0;
    uint64_t v12 = +[PRPosterPathUtilities loadUserObjectForURL:v11 expectedClass:objc_opt_class() strict:0 error:&v22];
    id v13 = v22;
    galleryOptions = v3->_galleryOptions;
    v3->_galleryOptions = (PRPosterDescriptorGalleryOptions *)v12;

    v15 = PRLogModel();
    LODWORD(v12) = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

    if (v12)
    {
      if (v3->_galleryOptions)
      {
        p_super = PRLogModel();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[PRPosterPathModelObjectCache configuredProperties]();
        }
      }
      else
      {
        id v17 = PRLogModel();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          logPreamble = v3->_logPreamble;
          uint64_t v21 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543874;
          BOOL v24 = logPreamble;
          __int16 v25 = 2114;
          v26 = v21;
          __int16 v27 = 2114;
          id v28 = v13;
          _os_log_debug_impl(&dword_18C1C4000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@ cache] failed to load cached value for %{public}@: %{public}@", buf, 0x20u);
        }
        uint64_t v18 = (NSError *)v13;
        p_super = &v3->_galleryOptionsLoadError->super;
        v3->_galleryOptionsLoadError = v18;
      }
    }
    uint64_t v7 = v3->_galleryOptions;
  }
  objc_sync_exit(v3);

  return v7;
}

- (void)resetGalleryOptions
{
  uint64_t v3 = self;
  objc_sync_enter(v3);
  uint64_t v4 = PRLogModel();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    int v6 = PRLogModel();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache resetUserInfo]();
    }
  }
  galleryOptions = v3->_galleryOptions;
  v3->_galleryOptions = 0;

  galleryOptionsLoadError = v3->_galleryOptionsLoadError;
  v3->_galleryOptionsLoadError = 0;

  configuredProperties = v3->_configuredProperties;
  v3->_configuredProperties = 0;

  objc_sync_exit(v3);
}

- (ATXPosterDescriptorGalleryOptions)proactiveGalleryOptions
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self;
  objc_sync_enter(v3);
  if (v3->_proactiveGalleryOptionsLoadError)
  {
    uint64_t v4 = PRLogModel();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
    {
      int v6 = PRLogModel();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache userInfo]();
      }
    }
    uint64_t v7 = 0;
  }
  else if (v3->_proactiveGalleryOptions)
  {
    BOOL v8 = PRLogModel();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      uint64_t v10 = PRLogModel();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache configuredProperties]();
      }
    }
    uint64_t v7 = v3->_proactiveGalleryOptions;
  }
  else
  {
    v11 = +[PRPosterPathUtilities proactiveGalleryOptionsURLForContentsURL:v3->_pathContentsURL];
    id v22 = 0;
    uint64_t v12 = +[PRPosterPathUtilities loadUserObjectForURL:v11 expectedClass:objc_opt_class() strict:0 error:&v22];
    id v13 = v22;
    proactiveGalleryOptions = v3->_proactiveGalleryOptions;
    v3->_proactiveGalleryOptions = (ATXPosterDescriptorGalleryOptions *)v12;

    v15 = PRLogModel();
    LODWORD(v12) = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

    if (v12)
    {
      if (v3->_proactiveGalleryOptions)
      {
        p_super = PRLogModel();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[PRPosterPathModelObjectCache configuredProperties]();
        }
      }
      else
      {
        id v17 = PRLogModel();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          logPreamble = v3->_logPreamble;
          uint64_t v21 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543874;
          BOOL v24 = logPreamble;
          __int16 v25 = 2114;
          v26 = v21;
          __int16 v27 = 2114;
          id v28 = v13;
          _os_log_debug_impl(&dword_18C1C4000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@ cache] failed to load cached value for %{public}@: %{public}@", buf, 0x20u);
        }
        uint64_t v18 = (NSError *)v13;
        p_super = &v3->_proactiveGalleryOptionsLoadError->super;
        v3->_proactiveGalleryOptionsLoadError = v18;
      }
    }
    uint64_t v7 = v3->_proactiveGalleryOptions;
  }
  objc_sync_exit(v3);

  return v7;
}

- (void)resetProactiveGalleryOptions
{
  uint64_t v3 = self;
  objc_sync_enter(v3);
  uint64_t v4 = PRLogModel();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    int v6 = PRLogModel();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache resetUserInfo]();
    }
  }
  proactiveGalleryOptions = v3->_proactiveGalleryOptions;
  v3->_proactiveGalleryOptions = 0;

  proactiveGalleryOptionsLoadError = v3->_proactiveGalleryOptionsLoadError;
  v3->_proactiveGalleryOptionsLoadError = 0;

  configuredProperties = v3->_configuredProperties;
  v3->_configuredProperties = 0;

  objc_sync_exit(v3);
}

- (PRPosterAmbientConfiguration)ambientConfiguration
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self;
  objc_sync_enter(v3);
  if (v3->_ambientConfigurationLoadError)
  {
    uint64_t v4 = PRLogModel();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
    {
      int v6 = PRLogModel();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache userInfo]();
      }
    }
    uint64_t v7 = 0;
  }
  else if (v3->_ambientConfiguration)
  {
    BOOL v8 = PRLogModel();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      uint64_t v10 = PRLogModel();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache configuredProperties]();
      }
    }
    uint64_t v7 = v3->_ambientConfiguration;
  }
  else
  {
    v11 = +[PRPosterPathUtilities ambientConfigurationURLForContentsURL:v3->_pathContentsURL];
    id v22 = 0;
    uint64_t v12 = +[PRPosterPathUtilities loadUserObjectForURL:v11 expectedClass:objc_opt_class() strict:0 error:&v22];
    id v13 = v22;
    ambientConfiguration = v3->_ambientConfiguration;
    v3->_ambientConfiguration = (PRPosterAmbientConfiguration *)v12;

    v15 = PRLogModel();
    LODWORD(v12) = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

    if (v12)
    {
      if (v3->_ambientConfiguration)
      {
        p_super = PRLogModel();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[PRPosterPathModelObjectCache configuredProperties]();
        }
      }
      else
      {
        id v17 = PRLogModel();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          logPreamble = v3->_logPreamble;
          uint64_t v21 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543874;
          BOOL v24 = logPreamble;
          __int16 v25 = 2114;
          v26 = v21;
          __int16 v27 = 2114;
          id v28 = v13;
          _os_log_debug_impl(&dword_18C1C4000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@ cache] failed to load cached value for %{public}@: %{public}@", buf, 0x20u);
        }
        uint64_t v18 = (NSError *)v13;
        p_super = &v3->_ambientConfigurationLoadError->super;
        v3->_ambientConfigurationLoadError = v18;
      }
    }
    uint64_t v7 = v3->_ambientConfiguration;
  }
  objc_sync_exit(v3);

  return v7;
}

- (void)resetAmbientConfiguration
{
  uint64_t v3 = self;
  objc_sync_enter(v3);
  uint64_t v4 = PRLogModel();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    int v6 = PRLogModel();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache resetUserInfo]();
    }
  }
  ambientConfiguration = v3->_ambientConfiguration;
  v3->_ambientConfiguration = 0;

  ambientConfigurationLoadError = v3->_ambientConfigurationLoadError;
  v3->_ambientConfigurationLoadError = 0;

  configuredProperties = v3->_configuredProperties;
  v3->_configuredProperties = 0;

  objc_sync_exit(v3);
}

- (PRPosterAmbientWidgetLayout)ambientWidgetLayout
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self;
  objc_sync_enter(v3);
  if (v3->_ambientWidgetLayoutLoadError)
  {
    uint64_t v4 = PRLogModel();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
    {
      int v6 = PRLogModel();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache userInfo]();
      }
    }
    uint64_t v7 = 0;
  }
  else if (v3->_ambientWidgetLayout)
  {
    BOOL v8 = PRLogModel();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      uint64_t v10 = PRLogModel();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[PRPosterPathModelObjectCache configuredProperties]();
      }
    }
    uint64_t v7 = v3->_ambientWidgetLayout;
  }
  else
  {
    v11 = +[PRPosterPathUtilities ambientWidgetLayoutURLForInstanceURL:v3->_pathInstanceURL];
    id v22 = 0;
    uint64_t v12 = +[PRPosterPathUtilities loadUserObjectForURL:v11 expectedClass:objc_opt_class() strict:0 error:&v22];
    id v13 = v22;
    ambientWidgetLayout = v3->_ambientWidgetLayout;
    v3->_ambientWidgetLayout = (PRPosterAmbientWidgetLayout *)v12;

    v15 = PRLogModel();
    LODWORD(v12) = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

    if (v12)
    {
      if (v3->_ambientWidgetLayout)
      {
        p_super = PRLogModel();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[PRPosterPathModelObjectCache configuredProperties]();
        }
      }
      else
      {
        id v17 = PRLogModel();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          logPreamble = v3->_logPreamble;
          uint64_t v21 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543874;
          BOOL v24 = logPreamble;
          __int16 v25 = 2114;
          v26 = v21;
          __int16 v27 = 2114;
          id v28 = v13;
          _os_log_debug_impl(&dword_18C1C4000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@ cache] failed to load cached value for %{public}@: %{public}@", buf, 0x20u);
        }
        uint64_t v18 = (NSError *)v13;
        p_super = &v3->_ambientWidgetLayoutLoadError->super;
        v3->_ambientWidgetLayoutLoadError = v18;
      }
    }
    uint64_t v7 = v3->_ambientWidgetLayout;
  }
  objc_sync_exit(v3);

  return v7;
}

- (void)resetAmbientWidgetLayout
{
  uint64_t v3 = self;
  objc_sync_enter(v3);
  uint64_t v4 = PRLogModel();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    int v6 = PRLogModel();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[PRPosterPathModelObjectCache resetUserInfo]();
    }
  }
  ambientWidgetLayout = v3->_ambientWidgetLayout;
  v3->_ambientWidgetLayout = 0;

  ambientWidgetLayoutLoadError = v3->_ambientWidgetLayoutLoadError;
  v3->_ambientWidgetLayoutLoadError = 0;

  configuredProperties = v3->_configuredProperties;
  v3->_configuredProperties = 0;

  objc_sync_exit(v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proactiveGalleryOptionsLoadError, 0);
  objc_storeStrong((id *)&self->_proactiveGalleryOptions, 0);
  objc_storeStrong((id *)&self->_ambientWidgetLayout, 0);
  objc_storeStrong((id *)&self->_ambientWidgetLayoutLoadError, 0);
  objc_storeStrong((id *)&self->_ambientConfiguration, 0);
  objc_storeStrong((id *)&self->_ambientConfigurationLoadError, 0);
  objc_storeStrong((id *)&self->_galleryOptions, 0);
  objc_storeStrong((id *)&self->_galleryOptionsLoadError, 0);
  objc_storeStrong((id *)&self->_otherMetadata, 0);
  objc_storeStrong((id *)&self->_otherMetadataLoadError, 0);
  objc_storeStrong((id *)&self->_suggestionMetadata, 0);
  objc_storeStrong((id *)&self->_suggestionMetadataLoadError, 0);
  objc_storeStrong((id *)&self->_quickActionsConfiguration, 0);
  objc_storeStrong((id *)&self->_quickActionsConfigurationLoadError, 0);
  objc_storeStrong((id *)&self->_colorVariationsConfiguration, 0);
  objc_storeStrong((id *)&self->_colorVariationsConfigurationLoadError, 0);
  objc_storeStrong((id *)&self->_complicationLayout, 0);
  objc_storeStrong((id *)&self->_complicationLayoutLoadError, 0);
  objc_storeStrong((id *)&self->_focusConfiguration, 0);
  objc_storeStrong((id *)&self->_focusConfigurationLoadError, 0);
  objc_storeStrong((id *)&self->_homeScreenConfiguration, 0);
  objc_storeStrong((id *)&self->_homeScreenConfigurationLoadError, 0);
  objc_storeStrong((id *)&self->_configurableOptions, 0);
  objc_storeStrong((id *)&self->_configurableOptionsLoadError, 0);
  objc_storeStrong((id *)&self->_renderingConfiguration, 0);
  objc_storeStrong((id *)&self->_renderingConfigurationLoadError, 0);
  objc_storeStrong((id *)&self->_titleStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_titleStyleConfigurationLoadError, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_userInfoLoadError, 0);
  objc_storeStrong((id *)&self->_configuredProperties, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_logPreamble, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_pathSupplementURL, 0);
  objc_storeStrong((id *)&self->_pathContentsURL, 0);
  objc_storeStrong((id *)&self->_pathIdentifierURL, 0);
  objc_storeStrong((id *)&self->_pathInstanceURL, 0);
  objc_storeStrong((id *)&self->_pathURL, 0);
}

- (void)_initWithPath:.cold.1()
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_14(&dword_18C1C4000, v0, v1, "[%{public}@ cache] init", v2, v3, v4, v5, v6);
}

- (void)configuredProperties
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_5(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_1(&dword_18C1C4000, "[%{public}@ cache] using cached value for %{public}@", v4, v5);
}

- (void)userInfo
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_5(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_1(&dword_18C1C4000, "[%{public}@ cache] bailing; previous loading error %{public}@", v4, v5);
}

- (void)homeScreenConfigurationOrError:.cold.1()
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_1_0(&dword_18C1C4000, v0, v1, "[%{public}@ cache] Caching error result for missing homeScreenConfiguration file: %@");
}

@end