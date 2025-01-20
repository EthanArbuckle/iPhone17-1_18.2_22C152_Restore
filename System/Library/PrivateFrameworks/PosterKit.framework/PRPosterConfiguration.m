@interface PRPosterConfiguration
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)descriptorIdentifier;
- (NSString)displayNameLocalizationKey;
- (NSString)role;
- (NSURL)assetDirectory;
- (PFPosterPath)_path;
- (PRPosterConfiguration)init;
- (id)_initWithPath:(id)a3;
- (id)loadAmbientConfigurationWithError:(id *)a3;
- (id)loadAmbientWidgetLayoutWithError:(id *)a1;
- (id)loadColorVariationsConfigurationWithError:(id *)a1;
- (id)loadComplicationLayoutWithError:(id *)a3;
- (id)loadConfigurableOptionsWithError:(id *)a3;
- (id)loadConfiguredPropertiesWithError:(id *)a3;
- (id)loadFocusConfigurationWithError:(id *)a3;
- (id)loadHomeScreenConfigurationWithError:(id *)a3;
- (id)loadOtherMetadataWithError:(id *)a3;
- (id)loadQuickActionsConfigurationWithError:(id *)a3;
- (id)loadSuggestionMetadataWithError:(id *)a3;
- (id)loadTitleStyleConfigurationWithError:(id *)a3;
- (id)loadUserInfoWithError:(id *)a3;
- (id)objectForUserInfoKey:(id)a3;
- (id)pr_posterProvider;
- (id)pr_posterUUID;
- (unint64_t)hash;
- (void)_invalidate;
- (void)dealloc;
@end

@implementation PRPosterConfiguration

- (id)pr_posterUUID
{
  v2 = [(PRPosterConfiguration *)self _path];
  v3 = [v2 serverIdentity];
  v4 = [v3 posterUUID];

  return v4;
}

- (id)pr_posterProvider
{
  v2 = [(PRPosterConfiguration *)self _path];
  v3 = [v2 serverIdentity];
  v4 = [v3 provider];

  return v4;
}

- (PRPosterConfiguration)init
{
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v4 stringWithFormat:@"%@ is not allowed on %@", v5, v7];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = NSStringFromSelector(a2);
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    *(_DWORD *)buf = 138544642;
    v14 = v9;
    __int16 v15 = 2114;
    v16 = v11;
    __int16 v17 = 2048;
    v18 = self;
    __int16 v19 = 2114;
    v20 = @"PRPosterConfiguration.m";
    __int16 v21 = 1024;
    int v22 = 29;
    __int16 v23 = 2114;
    v24 = v8;
    _os_log_error_impl(&dword_18C1C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v8 UTF8String];
  result = (PRPosterConfiguration *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_pathValidityExtension invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PRPosterConfiguration;
  [(PRPosterConfiguration *)&v3 dealloc];
}

- (id)_initWithPath:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v17.receiver = self;
    v17.super_class = (Class)PRPosterConfiguration;
    v7 = [(PRPosterConfiguration *)&v17 init];
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_path, a3);
      path = v8->_path;
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      uint64_t v12 = [(PFPosterPath *)path extendValidityForReason:v11];
      pathValidityExtension = v8->_pathValidityExtension;
      v8->_pathValidityExtension = (BSInvalidatable *)v12;

      if ([v6 isServerPosterPath])
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v14 = +[PRPosterPathModelObjectCache modelObjectCacheForPath:v6];
          objc_storeWeak((id *)&v8->_cache, v14);
        }
      }
    }

    return v8;
  }
  else
  {
    v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"path"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterConfiguration _initWithPath:]();
    }
    [v16 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)_invalidate
{
  objc_storeWeak((id *)&self->_cache, 0);
  pathValidityExtension = self->_pathValidityExtension;
  [(BSInvalidatable *)pathValidityExtension invalidate];
}

- (NSString)displayNameLocalizationKey
{
  v2 = [(PRPosterConfiguration *)self loadOtherMetadataWithError:0];
  objc_super v3 = [v2 displayNameLocalizationKey];

  return (NSString *)v3;
}

- (NSString)descriptorIdentifier
{
  return (NSString *)[(PFPosterPath *)self->_path descriptorIdentifier];
}

- (NSString)role
{
  return (NSString *)[(PFPosterPath *)self->_path role];
}

- (NSURL)assetDirectory
{
  return (NSURL *)[(PFPosterPath *)self->_path contentsURL];
}

- (id)objectForUserInfoKey:(id)a3
{
  id v4 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v4)
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterConfiguration objectForUserInfoKey:]();
    }
LABEL_11:
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C2209FCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterConfiguration objectForUserInfoKey:]();
    }
    goto LABEL_11;
  }

  id v5 = [(PRPosterConfiguration *)self loadUserInfoWithError:0];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)loadUserInfoWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
  v6 = [WeakRetained userInfo];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [(PFPosterPath *)self->_path loadUserInfoWithError:a3];
  }
  v9 = v8;

  return v9;
}

- (id)loadConfigurableOptionsWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
  v6 = [WeakRetained configurableOptions];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    v9 = [(PRPosterConfiguration *)self _path];
    id v8 = +[PRPosterPathUtilities loadConfigurableOptionsForPath:v9 error:a3];
  }
  return v8;
}

- (id)loadConfiguredPropertiesWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
  v6 = [WeakRetained configuredProperties];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    v9 = [(PRPosterConfiguration *)self _path];
    id v8 = +[PRPosterPathUtilities loadConfiguredPropertiesForPath:v9 error:a3];
  }
  return v8;
}

- (id)loadFocusConfigurationWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
  v6 = [WeakRetained focusConfiguration];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    v9 = [(PRPosterConfiguration *)self _path];
    id v8 = +[PRPosterPathUtilities loadFocusConfigurationForPath:v9 error:a3];
  }
  return v8;
}

- (id)loadHomeScreenConfigurationWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
  v6 = [WeakRetained homeScreenConfiguration];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    v9 = [(PRPosterConfiguration *)self _path];
    id v8 = +[PRPosterPathUtilities loadHomeScreenConfigurationForPath:v9 error:a3];
  }
  return v8;
}

- (id)loadTitleStyleConfigurationWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
  v6 = [WeakRetained titleStyleConfiguration];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    v9 = [(PRPosterConfiguration *)self _path];
    id v8 = +[PRPosterPathUtilities loadTitleStyleConfigurationForPath:v9 error:a3];
  }
  return v8;
}

- (id)loadComplicationLayoutWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
  v6 = [WeakRetained complicationLayout];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    v9 = [(PRPosterConfiguration *)self _path];
    id v8 = +[PRPosterPathUtilities loadComplicationLayoutForPath:v9 error:a3];
  }
  return v8;
}

- (id)loadColorVariationsConfigurationWithError:(id *)a1
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 2);
    id v5 = [WeakRetained colorVariationsConfiguration];
    v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v8 = [a1 _path];
      id v7 = +[PRPosterPathUtilities loadColorVariationsConfigurationForPath:v8 error:a2];
    }
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (id)loadQuickActionsConfigurationWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
  v6 = [WeakRetained quickActionsConfiguration];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    v9 = [(PRPosterConfiguration *)self _path];
    id v8 = +[PRPosterPathUtilities loadQuickActionsConfigurationForPath:v9 error:a3];
  }
  return v8;
}

- (id)loadSuggestionMetadataWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
  v6 = [WeakRetained suggestionMetadata];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    v9 = [(PRPosterConfiguration *)self _path];
    id v8 = +[PRPosterPathUtilities loadSuggestionMetadataForPath:v9 error:a3];
  }
  return v8;
}

- (id)loadOtherMetadataWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
  v6 = [WeakRetained otherMetadata];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    v9 = [(PRPosterConfiguration *)self _path];
    id v8 = +[PRPosterPathUtilities loadOtherMetadataForPath:v9 error:a3];
  }
  return v8;
}

- (id)loadAmbientConfigurationWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
  v6 = [WeakRetained ambientConfiguration];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    v9 = [(PRPosterConfiguration *)self _path];
    id v8 = +[PRPosterPathUtilities loadAmbientConfigurationForPath:v9 error:a3];
  }
  return v8;
}

- (id)loadAmbientWidgetLayoutWithError:(id *)a1
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 2);
    id v5 = [WeakRetained ambientWidgetLayout];
    v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v8 = [a1 _path];
      id v7 = +[PRPosterPathUtilities loadAmbientWidgetLayoutForPath:v8 error:a2];
    }
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (unint64_t)hash
{
  objc_super v3 = [(PFPosterPath *)self->_path serverIdentity];
  id v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 hash];
  }
  else
  {
    v6 = [(PFPosterPath *)self->_path contentsURL];
    unint64_t v5 = [v6 hash];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PRPosterConfiguration *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      id v7 = [(PFPosterPath *)self->_path serverIdentity];
      if (v7)
      {
        id v8 = [(PFPosterPath *)v4->_path serverIdentity];
        char v6 = BSEqualObjects();
      }
      else
      {
        char v6 = [(PFPosterPath *)self->_path isEqual:v4->_path];
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __36__PRPosterConfiguration_description__block_invoke;
  v10 = &unk_1E54DAA08;
  v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  uint64_t v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

id __36__PRPosterConfiguration_description__block_invoke(id result)
{
  uint64_t v1 = *((void *)result + 4);
  if (v1) {
    return (id)[*((id *)result + 5) appendObject:*(void *)(v1 + 24) withName:@"path"];
  }
  return result;
}

- (PFPosterPath)_path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_destroyWeak((id *)&self->_cache);
  objc_storeStrong((id *)&self->_pathValidityExtension, 0);
}

- (void)_initWithPath:.cold.1()
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

- (void)objectForUserInfoKey:.cold.1()
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