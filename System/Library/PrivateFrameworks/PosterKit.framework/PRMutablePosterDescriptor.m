@interface PRMutablePosterDescriptor
+ (id)mutableDescriptorWithIdentifier:(id)a3;
+ (id)mutableDescriptorWithIdentifier:(id)a3 role:(id)a4;
- (BOOL)copyContentsOfPath:(id)a3 error:(id *)a4;
- (BOOL)setObject:(id)a3 forUserInfoKey:(id)a4;
- (BOOL)storeConfigurableOptions:(id)a3 error:(id *)a4;
- (BOOL)storeGalleryOptions:(id)a3 error:(id *)a4;
- (BOOL)storeUserInfo:(id)a3 error:(id *)a4;
- (void)mutateConfigurableOptions:(void *)a1;
- (void)setAmbientConfiguration:(id)a3;
- (void)setAmbientSupportedDataLayout:(int64_t)a3;
- (void)setDisplayNameLocalizationKey:(id)a3;
- (void)setLuminance:(double)a3;
- (void)setPreferredGalleryOptions:(id)a3;
- (void)setPreferredHomeScreenConfiguration:(id)a3;
- (void)setPreferredTimeFontConfigurations:(id)a3;
- (void)setPreferredTitleColors:(id)a3;
- (void)setRole:(id)a3;
@end

@implementation PRMutablePosterDescriptor

+ (id)mutableDescriptorWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = PFPosterRoleDefaultRoleForCurrentExtensionProcess();
  v6 = [a1 mutableDescriptorWithIdentifier:v4 role:v5];

  return v6;
}

+ (id)mutableDescriptorWithIdentifier:(id)a3 role:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v7)
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRMutablePosterDescriptor mutableDescriptorWithIdentifier:role:]();
    }
LABEL_15:
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C1CB388);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRMutablePosterDescriptor mutableDescriptorWithIdentifier:role:]();
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C1CB3ECLL);
  }

  if ((PFPosterRoleIsValid() & 1) == 0)
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"PFPosterRoleIsValid((PFPosterRole)role)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRMutablePosterDescriptor mutableDescriptorWithIdentifier:role:]();
    }
    goto LABEL_15;
  }
  v8 = [MEMORY[0x1E4F924B8] temporaryDescriptorPathWithIdentifier:v7 role:v6];
  id v9 = [(PRPosterDescriptor *)[PRMutablePosterDescriptor alloc] _initWithPath:v8];
  [v8 invalidate];

  return v9;
}

- (void)setDisplayNameLocalizationKey:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__PRMutablePosterDescriptor_setDisplayNameLocalizationKey___block_invoke;
  v6[3] = &unk_1E54DAAA0;
  id v7 = v4;
  id v5 = v4;
  -[PRMutablePosterDescriptor mutateConfigurableOptions:](self, v6);
}

void __59__PRMutablePosterDescriptor_setDisplayNameLocalizationKey___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = (id)[v2 copy];
  [v3 setDisplayNameLocalizationKey:v4];
}

- (void)mutateConfigurableOptions:(void *)a1
{
  if (a1 && a2)
  {
    id v3 = a2;
    id v4 = [a1 loadConfigurableOptionsWithError:0];
    id v5 = (void *)[v4 mutableCopy];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      v8 = [PRPosterMutableConfigurableOptions alloc];
      id v7 = [(PRPosterConfigurableOptions *)v8 initWithDisplayNameLocalizationKey:0 role:@"PRPosterRoleLockScreen" ambientSupportedDataLayout:0 preferredTimeFontConfigurations:MEMORY[0x1E4F1CBF0] preferredTitleColors:MEMORY[0x1E4F1CBF0] preferredHomeScreenConfiguration:0];
    }
    v10 = v7;

    v3[2](v3, v10);
    id v9 = (void *)[(PRPosterMutableConfigurableOptions *)v10 copy];
    [a1 storeConfigurableOptions:v9 error:0];
  }
}

- (void)setRole:(id)a3
{
  id v11 = a3;
  if (PFPosterRoleIsValid())
  {
    id v4 = [(PRPosterDescriptor *)self role];
    char v5 = [v4 isEqual:v11];

    if ((v5 & 1) == 0)
    {
      id v6 = (void *)MEMORY[0x192F915E0]();
      id v7 = [(PRPosterDescriptor *)self descriptorIdentifier];
      v8 = [MEMORY[0x1E4F924B8] temporaryDescriptorPathWithIdentifier:v7 role:v11];
      id v9 = [(PRPosterDescriptor *)self _path];
      [v8 copyContentsOfPath:v9 error:0];

      [(PRPosterDescriptor *)self _swapOutPathForPath:v8];
      [v8 invalidate];
    }
  }
  else
  {
    v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"PFPosterRoleIsValid((PFPosterRole)role)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRMutablePosterDescriptor setRole:]();
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)setPreferredTimeFontConfigurations:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 count])
  {
    char v5 = objc_alloc_init(PRTimeFontConfiguration);
    v15[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];

    id v4 = (id)v6;
  }
  id v7 = PRBundleURLFromReturnAddress();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__PRMutablePosterDescriptor_setPreferredTimeFontConfigurations___block_invoke;
  v13[3] = &unk_1E54DAAC8;
  id v14 = v7;
  id v8 = v7;
  id v9 = objc_msgSend(v4, "bs_compactMap:", v13);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__PRMutablePosterDescriptor_setPreferredTimeFontConfigurations___block_invoke_2;
  v11[3] = &unk_1E54DAAA0;
  id v12 = v9;
  id v10 = v9;
  -[PRMutablePosterDescriptor mutateConfigurableOptions:](self, v11);
}

PRPosterTimeFontConfiguration *__64__PRMutablePosterDescriptor_setPreferredTimeFontConfigurations___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PRPosterTimeFontConfiguration configurationWithTimeFontConfiguration:a2 extensionBundleURL:*(void *)(a1 + 32) systemItem:0];
}

uint64_t __64__PRMutablePosterDescriptor_setPreferredTimeFontConfigurations___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setPreferredTimeFontConfigurations:*(void *)(a1 + 32)];
}

- (void)setPreferredTitleColors:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__PRMutablePosterDescriptor_setPreferredTitleColors___block_invoke;
  v6[3] = &unk_1E54DAAA0;
  id v7 = v4;
  id v5 = v4;
  -[PRMutablePosterDescriptor mutateConfigurableOptions:](self, v6);
}

void __53__PRMutablePosterDescriptor_setPreferredTitleColors___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = (id)[v2 copy];
  [v3 setPreferredTitleColors:v4];
}

- (void)setLuminance:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__PRMutablePosterDescriptor_setLuminance___block_invoke;
  v3[3] = &__block_descriptor_40_e44_v16__0__PRPosterMutableConfigurableOptions_8l;
  *(double *)&v3[4] = a3;
  -[PRMutablePosterDescriptor mutateConfigurableOptions:](self, v3);
}

uint64_t __42__PRMutablePosterDescriptor_setLuminance___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setLuminance:*(double *)(a1 + 32)];
}

- (void)setPreferredHomeScreenConfiguration:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__PRMutablePosterDescriptor_setPreferredHomeScreenConfiguration___block_invoke;
  v6[3] = &unk_1E54DAAA0;
  id v7 = v4;
  id v5 = v4;
  -[PRMutablePosterDescriptor mutateConfigurableOptions:](self, v6);
}

uint64_t __65__PRMutablePosterDescriptor_setPreferredHomeScreenConfiguration___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPreferredHomeScreenConfiguration:*(void *)(a1 + 32)];
}

- (void)setPreferredGalleryOptions:(id)a3
{
  id v5 = a3;
  id v4 = [(PRPosterDescriptor *)self _path];
  if (v5) {
    +[PRPosterPathUtilities storePosterDescriptorGalleryOptions:v4 posterDescriptorGalleryOptions:v5 error:0];
  }
  else {
    +[PRPosterPathUtilities removePosterDescriptorGalleryOptions:v4 error:0];
  }
}

- (BOOL)setObject:(id)a3 forUserInfoKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v7)
  {
    v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRMutablePosterDescriptor setObject:forUserInfoKey:]();
    }
LABEL_20:
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C1CBD80);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRMutablePosterDescriptor setObject:forUserInfoKey:]();
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C1CBDE4);
  }

  char v8 = [v6 conformsToProtocol:&unk_1ED9F6F10];
  if (v6 && (v8 & 1) == 0)
  {
    v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[anObject conformsToProtocol:@protocol(NSCoding)] || !anObject"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRMutablePosterDescriptor setObject:forUserInfoKey:]();
    }
    goto LABEL_20;
  }
  id v9 = [(PRPosterDescriptor *)self loadUserInfoWithError:0];
  id v10 = (void *)[v9 mutableCopy];
  id v11 = v10;
  if (v10) {
    id v12 = v10;
  }
  else {
    id v12 = (id)objc_opt_new();
  }
  v13 = v12;

  if (v6) {
    [v13 setObject:v6 forKey:v7];
  }
  else {
    [v13 removeObjectForKey:v7];
  }
  id v14 = (void *)[v13 copy];
  BOOL v15 = [(PRMutablePosterDescriptor *)self storeUserInfo:v14 error:0];

  return v15;
}

- (BOOL)storeUserInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PRPosterDescriptor *)self _path];
  LOBYTE(a4) = [v7 storeUserInfo:v6 error:a4];

  return (char)a4;
}

- (BOOL)storeGalleryOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PRPosterDescriptor *)self _path];
  LOBYTE(a4) = +[PRPosterPathUtilities storeProactiveGalleryOptionsToPath:v7 proactiveGalleryOptions:v6 error:a4];

  return (char)a4;
}

- (BOOL)storeConfigurableOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PRPosterDescriptor *)self _path];
  LOBYTE(a4) = +[PRPosterPathUtilities storeConfigurableOptionsForPath:v7 configurableOptions:v6 error:a4];

  return (char)a4;
}

- (void)setAmbientSupportedDataLayout:(int64_t)a3
{
  id v5 = [(PRPosterDescriptor *)self ambientConfiguration];
  id v6 = (void *)[v5 mutableCopy];
  id v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  id v10 = v8;

  [v10 setSupportedDataLayout:a3];
  id v9 = [(PRPosterDescriptor *)self _path];
  +[PRPosterPathUtilities storeAmbientConfigurationForPath:v9 ambientConfiguration:v10 error:0];
}

- (void)setAmbientConfiguration:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(PRPosterDescriptor *)self _path];
  id v5 = (void *)v4;
  if (v7)
  {
    +[PRPosterPathUtilities storeAmbientConfigurationForPath:v4 ambientConfiguration:v7 error:0];
  }
  else
  {
    id v6 = objc_opt_new();
    +[PRPosterPathUtilities storeAmbientConfigurationForPath:v5 ambientConfiguration:v6 error:0];
  }
}

- (BOOL)copyContentsOfPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PRPosterDescriptor *)self _path];
  LOBYTE(a4) = [v7 copyContentsOfPath:v6 error:a4];

  return (char)a4;
}

+ (void)mutableDescriptorWithIdentifier:role:.cold.1()
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

+ (void)mutableDescriptorWithIdentifier:role:.cold.2()
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

- (void)setRole:.cold.1()
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

- (void)setObject:forUserInfoKey:.cold.1()
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

- (void)setObject:forUserInfoKey:.cold.2()
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

@end