@interface PRMutablePosterConfiguration
+ (id)mutableConfiguration;
+ (id)mutableConfigurationWithRole:(id)a3;
- (BOOL)copyContentsOfConfiguration:(id)a3 error:(id *)a4;
- (BOOL)copyContentsOfPath:(id)a3 error:(id *)a4;
- (BOOL)setObject:(id)a3 forUserInfoKey:(id)a4;
- (BOOL)storeAmbientConfiguration:(id)a3 error:(id *)a4;
- (BOOL)storeComplicationLayout:(id)a3 error:(id *)a4;
- (BOOL)storeConfigurableOptions:(id)a3 error:(id *)a4;
- (BOOL)storeConfiguredProperties:(id)a3 error:(id *)a4;
- (BOOL)storeFocusConfiguration:(id)a3 error:(id *)a4;
- (BOOL)storeHomeScreenConfiguration:(id)a3 error:(id *)a4;
- (BOOL)storeOtherMetadata:(id)a3 error:(id *)a4;
- (BOOL)storeQuickActionsConfiguration:(id)a3 error:(id *)a4;
- (BOOL)storeSuggestionMetadata:(id)a3 error:(id *)a4;
- (BOOL)storeTitleStyleConfiguration:(id)a3 error:(id *)a4;
- (BOOL)storeUserInfo:(id)a3 error:(id *)a4;
- (void)setDisplayNameLocalizationKey:(id)a3;
@end

@implementation PRMutablePosterConfiguration

+ (id)mutableConfiguration
{
  v3 = PFPosterRoleDefaultRoleForCurrentExtensionProcess();
  v4 = [a1 mutableConfigurationWithRole:v3];

  return v4;
}

+ (id)mutableConfigurationWithRole:(id)a3
{
  v3 = [MEMORY[0x1E4F924B8] temporaryPathForRole:a3];
  id v4 = [(PRPosterConfiguration *)[PRMutablePosterConfiguration alloc] _initWithPath:v3];
  [v3 invalidate];

  return v4;
}

- (void)setDisplayNameLocalizationKey:(id)a3
{
  id v4 = a3;
  v5 = [(PRPosterConfiguration *)self loadOtherMetadataWithError:0];
  if (v5)
  {
    v6 = v5;
    v7 = (void *)[v5 mutableCopy];
    [v7 setDisplayNameLocalizationKey:v4];

    v8 = (PRPosterMetadata *)[v7 copy];
    id v4 = v7;
  }
  else
  {
    v8 = [[PRPosterMetadata alloc] initWithDisplayNameLocalizationKey:v4];
  }

  [(PRMutablePosterConfiguration *)self storeOtherMetadata:v8 error:0];
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
      -[PRMutablePosterConfiguration setObject:forUserInfoKey:]();
    }
LABEL_20:
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C221888);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRMutablePosterConfiguration setObject:forUserInfoKey:]();
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C2218ECLL);
  }

  char v8 = [v6 conformsToProtocol:&unk_1ED9F6F10];
  if (v6 && (v8 & 1) == 0)
  {
    v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[anObject conformsToProtocol:@protocol(NSCoding)] || !anObject"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRMutablePosterConfiguration setObject:forUserInfoKey:]();
    }
    goto LABEL_20;
  }
  v9 = [(PRPosterConfiguration *)self loadUserInfoWithError:0];
  v10 = (void *)[v9 mutableCopy];
  v11 = v10;
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
  v14 = (void *)[v13 copy];
  BOOL v15 = [(PRMutablePosterConfiguration *)self storeUserInfo:v14 error:0];

  return v15;
}

- (BOOL)storeUserInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PRPosterConfiguration *)self _path];
  LOBYTE(a4) = [v7 storeUserInfo:v6 error:a4];

  return (char)a4;
}

- (BOOL)storeConfiguredProperties:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PRPosterConfiguration *)self _path];
  LOBYTE(a4) = +[PRPosterPathUtilities storeConfiguredPropertiesForPath:v7 configuredProperties:v6 error:a4];

  return (char)a4;
}

- (BOOL)storeConfigurableOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PRPosterConfiguration *)self _path];
  LOBYTE(a4) = +[PRPosterPathUtilities storeConfigurableOptionsForPath:v7 configurableOptions:v6 error:a4];

  return (char)a4;
}

- (BOOL)storeFocusConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PRPosterConfiguration *)self _path];
  if (v6) {
    BOOL v8 = +[PRPosterPathUtilities storeFocusConfigurationForPath:v7 focusConfiguration:v6 error:a4];
  }
  else {
    BOOL v8 = +[PRPosterPathUtilities removeFocusConfigurationForPath:v7 error:a4];
  }
  BOOL v9 = v8;

  return v9;
}

- (BOOL)storeHomeScreenConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PRPosterConfiguration *)self _path];
  LOBYTE(a4) = +[PRPosterPathUtilities storeHomeScreenConfigurationForPath:v7 homeScreenConfiguration:v6 error:a4];

  return (char)a4;
}

- (BOOL)storeTitleStyleConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PRPosterConfiguration *)self _path];
  LOBYTE(a4) = +[PRPosterPathUtilities storeTitleStyleConfigurationForPath:v7 titleStyleConfiguration:v6 error:a4];

  return (char)a4;
}

- (BOOL)storeComplicationLayout:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PRPosterConfiguration *)self _path];
  LOBYTE(a4) = +[PRPosterPathUtilities storeComplicationLayoutForPath:v7 complicationLayout:v6 error:a4];

  return (char)a4;
}

- (BOOL)storeQuickActionsConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PRPosterConfiguration *)self _path];
  LOBYTE(a4) = +[PRPosterPathUtilities storeQuickActionsConfigurationForPath:v7 quickActionsConfiguration:v6 error:a4];

  return (char)a4;
}

- (BOOL)storeSuggestionMetadata:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PRPosterConfiguration *)self _path];
  LOBYTE(a4) = +[PRPosterPathUtilities storeSuggestionMetadataForPath:v7 suggestionMetadata:v6 error:a4];

  return (char)a4;
}

- (BOOL)storeOtherMetadata:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PRPosterConfiguration *)self _path];
  LOBYTE(a4) = +[PRPosterPathUtilities storeOtherMetadataForPath:v7 otherMetadata:v6 error:a4];

  return (char)a4;
}

- (BOOL)storeAmbientConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PRPosterConfiguration *)self _path];
  LOBYTE(a4) = +[PRPosterPathUtilities storeAmbientConfigurationForPath:v7 ambientConfiguration:v6 error:a4];

  return (char)a4;
}

- (BOOL)copyContentsOfPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PRPosterConfiguration *)self _path];
  LOBYTE(a4) = [v7 copyContentsOfPath:v6 error:a4];

  return (char)a4;
}

- (BOOL)copyContentsOfConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  NSClassFromString(&cfstr_Prposterconfig.isa);
  if (!v6)
  {
    v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRMutablePosterConfiguration copyContentsOfConfiguration:error:]();
    }
LABEL_9:
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C221F7CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterConfigurationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRMutablePosterConfiguration copyContentsOfConfiguration:error:]();
    }
    goto LABEL_9;
  }

  id v7 = [v6 _path];
  BOOL v8 = [(PRMutablePosterConfiguration *)self copyContentsOfPath:v7 error:a4];

  return v8;
}

- (void)setObject:forUserInfoKey:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
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
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)copyContentsOfConfiguration:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end