@interface PRPosterDescriptor
- (BOOL)isEqual:(id)a3;
- (NSArray)preferredTimeFontConfigurations;
- (NSArray)preferredTitleColors;
- (NSString)description;
- (NSString)descriptorIdentifier;
- (NSString)displayNameLocalizationKey;
- (NSString)identifier;
- (NSString)role;
- (NSURL)assetDirectory;
- (PFPosterPath)_path;
- (PRPosterAmbientConfiguration)ambientConfiguration;
- (PRPosterDescriptor)init;
- (PRPosterDescriptorGalleryOptions)preferredGalleryOptions;
- (PRPosterDescriptorHomeScreenConfiguration)preferredHomeScreenConfiguration;
- (double)luminance;
- (id)_initWithPath:(id)a3;
- (id)loadConfigurableOptionsWithError:(id *)a3;
- (id)loadGalleryOptionsWithError:(id *)a3;
- (id)loadUserInfoWithError:(id *)a3;
- (id)objectForUserInfoKey:(id)a3;
- (id)pr_posterProvider;
- (id)pr_posterUUID;
- (id)preferredTimeFontConfigurationsWithExtensionBundleURL:(id)a3;
- (int64_t)ambientSupportedDataLayout;
- (unint64_t)hash;
- (void)_swapOutPathForPath:(id)a3;
- (void)appendDescriptionToFormatter:(void *)result;
- (void)dealloc;
@end

@implementation PRPosterDescriptor

- (PRPosterDescriptor)init
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
    v20 = @"PRPosterDescriptor.m";
    __int16 v21 = 1024;
    int v22 = 39;
    __int16 v23 = 2114;
    v24 = v8;
    _os_log_error_impl(&dword_18C1C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v8 UTF8String];
  result = (PRPosterDescriptor *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_pathValidityExtension invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PRPosterDescriptor;
  [(PRPosterDescriptor *)&v3 dealloc];
}

- (void)_swapOutPathForPath:(id)a3
{
  id v4 = a3;
  NSClassFromString(&cfstr_Pfposterpath.isa);
  if (!v4)
  {
    v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterDescriptor _swapOutPathForPath:]();
    }
LABEL_11:
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C1CA4CCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PFPosterPathClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterDescriptor _swapOutPathForPath:]();
    }
    goto LABEL_11;
  }

  path = self->_path;
  pathValidityExtension = self->_pathValidityExtension;
  self->_path = (PFPosterPath *)v4;
  id v15 = v4;
  v7 = pathValidityExtension;
  v8 = path;

  v9 = self->_path;
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  v12 = [(PFPosterPath *)v9 extendValidityForReason:v11];
  v13 = self->_pathValidityExtension;
  self->_pathValidityExtension = v12;

  [(BSInvalidatable *)v7 invalidate];
}

- (id)_initWithPath:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    __int16 v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"path"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterDescriptor _initWithPath:]();
    }
LABEL_13:
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C1CA6B4);
  }
  v6 = v5;
  v7 = [v5 descriptorIdentifier];

  if (!v7)
  {
    __int16 v17 = [NSString stringWithFormat:@"descriptors must have descriptorIdentifiers : %@", v6];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterDescriptor _initWithPath:]();
    }
    goto LABEL_13;
  }
  v18.receiver = self;
  v18.super_class = (Class)PRPosterDescriptor;
  v8 = [(PRPosterDescriptor *)&v18 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_path, a3);
    path = v9->_path;
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    uint64_t v13 = [(PFPosterPath *)path extendValidityForReason:v12];
    pathValidityExtension = v9->_pathValidityExtension;
    v9->_pathValidityExtension = (BSInvalidatable *)v13;

    if ([v6 isServerPosterPath])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v15 = +[PRPosterPathModelObjectCache modelObjectCacheForPath:v6];
        objc_storeWeak((id *)&v9->_cache, v15);
      }
    }
  }

  return v9;
}

- (NSString)role
{
  return (NSString *)[(PFPosterPath *)self->_path role];
}

- (NSString)identifier
{
  return (NSString *)[(PFPosterPath *)self->_path descriptorIdentifier];
}

- (NSString)displayNameLocalizationKey
{
  v2 = [(PRPosterDescriptor *)self loadConfigurableOptionsWithError:0];
  objc_super v3 = [v2 displayNameLocalizationKey];

  return (NSString *)v3;
}

- (NSArray)preferredTimeFontConfigurations
{
  objc_super v3 = PRBundleURLFromReturnAddress();
  id v4 = [(PRPosterDescriptor *)self preferredTimeFontConfigurationsWithExtensionBundleURL:v3];

  return (NSArray *)v4;
}

- (NSArray)preferredTitleColors
{
  v2 = [(PRPosterDescriptor *)self loadConfigurableOptionsWithError:0];
  objc_super v3 = [v2 preferredTitleColors];

  return (NSArray *)v3;
}

- (double)luminance
{
  v2 = [(PRPosterDescriptor *)self loadConfigurableOptionsWithError:0];
  objc_super v3 = v2;
  if (v2)
  {
    [v2 luminance];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.5;
  }

  return v5;
}

- (id)preferredTimeFontConfigurationsWithExtensionBundleURL:(id)a3
{
  id v4 = a3;
  double v5 = [(PRPosterDescriptor *)self loadConfigurableOptionsWithError:0];
  v6 = [v5 preferredTimeFontConfigurations];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__PRPosterDescriptor_preferredTimeFontConfigurationsWithExtensionBundleURL___block_invoke;
  v10[3] = &unk_1E54DAA78;
  id v11 = v4;
  id v7 = v4;
  v8 = objc_msgSend(v6, "bs_compactMap:", v10);

  return v8;
}

uint64_t __76__PRPosterDescriptor_preferredTimeFontConfigurationsWithExtensionBundleURL___block_invoke(uint64_t a1, void *a2)
{
  return [a2 timeFontConfigurationWithExtensionBundleURL:*(void *)(a1 + 32)];
}

- (PRPosterDescriptorHomeScreenConfiguration)preferredHomeScreenConfiguration
{
  v2 = [(PRPosterDescriptor *)self loadConfigurableOptionsWithError:0];
  objc_super v3 = [v2 preferredHomeScreenConfiguration];

  return (PRPosterDescriptorHomeScreenConfiguration *)v3;
}

- (id)loadGalleryOptionsWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
  id v4 = [WeakRetained proactiveGalleryOptions];

  return v4;
}

- (PRPosterDescriptorGalleryOptions)preferredGalleryOptions
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
  id v4 = [WeakRetained galleryOptions];
  double v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = [(PRPosterDescriptor *)self _path];
    id v6 = +[PRPosterPathUtilities loadPosterDescriptorGalleryOptionsForPath:v7 error:0];
  }
  return (PRPosterDescriptorGalleryOptions *)v6;
}

- (int64_t)ambientSupportedDataLayout
{
  objc_super v3 = [(PRPosterDescriptor *)self ambientConfiguration];
  id v4 = v3;
  if (v3)
  {
    int64_t v5 = [v3 supportedDataLayout];
  }
  else
  {
    id v6 = [(PRPosterDescriptor *)self loadConfigurableOptionsWithError:0];
    int64_t v5 = [v6 ambientSupportedDataLayout];
  }
  return v5;
}

- (PRPosterAmbientConfiguration)ambientConfiguration
{
  objc_super v3 = [(PRPosterDescriptor *)self _path];
  id v4 = +[PRPosterPathUtilities loadAmbientConfigurationForPath:v3 error:0];

  if (!v4)
  {
    int64_t v5 = objc_alloc_init(PRMutablePosterAmbientConfiguration);
    id v6 = [(PRPosterDescriptor *)self loadConfigurableOptionsWithError:0];
    -[PRPosterAmbientConfiguration setSupportedDataLayout:](v5, "setSupportedDataLayout:", [v6 ambientSupportedDataLayout]);

    id v7 = [(PRPosterDescriptor *)self _path];
    v8 = objc_opt_new();
    +[PRPosterPathUtilities storeAmbientConfigurationForPath:v7 ambientConfiguration:v8 error:0];

    id v4 = (void *)[(PRMutablePosterAmbientConfiguration *)v5 copy];
  }
  return (PRPosterAmbientConfiguration *)v4;
}

- (id)loadConfigurableOptionsWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
  id v6 = [WeakRetained configurableOptions];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    v9 = [(PRPosterDescriptor *)self _path];
    id v8 = +[PRPosterPathUtilities loadConfigurableOptionsForPath:v9 error:a3];
  }
  return v8;
}

- (id)objectForUserInfoKey:(id)a3
{
  id v4 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v4)
  {
    id v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterDescriptor objectForUserInfoKey:]();
    }
LABEL_11:
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C1CAE30);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterDescriptor objectForUserInfoKey:]();
    }
    goto LABEL_11;
  }

  int64_t v5 = [(PRPosterDescriptor *)self loadUserInfoWithError:0];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (NSString)descriptorIdentifier
{
  return (NSString *)[(PFPosterPath *)self->_path descriptorIdentifier];
}

- (NSURL)assetDirectory
{
  return (NSURL *)[(PFPosterPath *)self->_path contentsURL];
}

- (id)loadUserInfoWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
  id v6 = [WeakRetained userInfo];
  id v7 = v6;
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
    id v6 = [(PFPosterPath *)self->_path contentsURL];
    unint64_t v5 = [v6 hash];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PRPosterDescriptor *)a3;
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
  v9 = __33__PRPosterDescriptor_description__block_invoke;
  v10 = &unk_1E54DAA08;
  id v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  uint64_t v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

id __33__PRPosterDescriptor_description__block_invoke(id result)
{
  uint64_t v1 = *((void *)result + 4);
  if (v1) {
    return (id)[*((id *)result + 5) appendObject:*(void *)(v1 + 24) withName:@"path"];
  }
  return result;
}

- (void)appendDescriptionToFormatter:(void *)result
{
  if (result) {
    return (id)[a2 appendObject:result[3] withName:@"path"];
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

- (id)pr_posterUUID
{
  v2 = [(PRPosterDescriptor *)self _path];
  id v3 = [v2 serverIdentity];
  id v4 = [v3 posterUUID];

  return v4;
}

- (id)pr_posterProvider
{
  v2 = [(PRPosterDescriptor *)self _path];
  id v3 = [v2 serverIdentity];
  id v4 = [v3 provider];

  return v4;
}

- (void)_swapOutPathForPath:.cold.1()
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

- (void)_initWithPath:.cold.1()
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

- (void)_initWithPath:.cold.2()
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