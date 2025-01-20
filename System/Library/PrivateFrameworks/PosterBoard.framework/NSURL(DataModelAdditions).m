@interface NSURL(DataModelAdditions)
+ (id)pbf_descriptorIdentifierURLForType:()DataModelAdditions identifierURL:;
+ (id)pbf_providerInfoFileURLForIdentifierURL:()DataModelAdditions;
+ (id)pbf_roleIdentifierURLForType:()DataModelAdditions identifierURL:;
+ (id)pbf_versionsURLForIdentifierURL:()DataModelAdditions;
@end

@implementation NSURL(DataModelAdditions)

+ (id)pbf_descriptorIdentifierURLForType:()DataModelAdditions identifierURL:
{
  id v7 = a4;
  NSClassFromString(&cfstr_Nsurl.isa);
  if (!v7)
  {
    v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[NSURL(DataModelAdditions) pbf_descriptorIdentifierURLForType:identifierURL:]();
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
LABEL_16:
    JUMPOUT(0x1D324C6BCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSURLClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[NSURL(DataModelAdditions) pbf_descriptorIdentifierURLForType:identifierURL:]();
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D324C718);
  }

  if ((unint64_t)(a3 - 1) > 2)
  {
    v12 = NSString;
    v13 = NSStringFromPFServerPosterType();
    v14 = [v12 stringWithFormat:@"Unsupported type: %@", v13];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[NSURL(DataModelAdditions) pbf_descriptorIdentifierURLForType:identifierURL:](a2, a1, (uint64_t)v14);
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    goto LABEL_16;
  }
  v8 = [v7 URLByAppendingPathComponent:@"com.apple.posterkit.provider.descriptor.identifier" isDirectory:0];

  return v8;
}

+ (id)pbf_roleIdentifierURLForType:()DataModelAdditions identifierURL:
{
  id v7 = a4;
  NSClassFromString(&cfstr_Nsurl.isa);
  if (!v7)
  {
    v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[NSURL(DataModelAdditions) pbf_roleIdentifierURLForType:identifierURL:]();
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
LABEL_16:
    JUMPOUT(0x1D324C898);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSURLClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[NSURL(DataModelAdditions) pbf_roleIdentifierURLForType:identifierURL:]();
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D324C8F4);
  }

  if ((unint64_t)(a3 - 1) > 2)
  {
    v12 = NSString;
    v13 = NSStringFromPFServerPosterType();
    v14 = [v12 stringWithFormat:@"Unsupported type: %@", v13];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[NSURL(DataModelAdditions) pbf_roleIdentifierURLForType:identifierURL:](a2, a1, (uint64_t)v14);
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    goto LABEL_16;
  }
  v8 = [v7 URLByAppendingPathComponent:@"com.apple.posterkit.role.identifier" isDirectory:0];

  return v8;
}

+ (id)pbf_providerInfoFileURLForIdentifierURL:()DataModelAdditions
{
  id v3 = a3;
  NSClassFromString(&cfstr_Nsurl.isa);
  if (!v3)
  {
    v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[NSURL(DataModelAdditions) pbf_providerInfoFileURLForIdentifierURL:]();
    }
LABEL_11:
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D324CA4CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSURLClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[NSURL(DataModelAdditions) pbf_providerInfoFileURLForIdentifierURL:]();
    }
    goto LABEL_11;
  }

  v4 = [v3 URLByAppendingPathComponent:@"providerInfo.plist" isDirectory:0];

  return v4;
}

+ (id)pbf_versionsURLForIdentifierURL:()DataModelAdditions
{
  id v3 = a3;
  NSClassFromString(&cfstr_Nsurl.isa);
  if (!v3)
  {
    v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[NSURL(DataModelAdditions) pbf_versionsURLForIdentifierURL:]();
    }
LABEL_11:
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D324CB8CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSURLClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[NSURL(DataModelAdditions) pbf_versionsURLForIdentifierURL:]();
    }
    goto LABEL_11;
  }

  v4 = [v3 URLByAppendingPathComponent:@"versions" isDirectory:1];

  return v4;
}

+ (void)pbf_descriptorIdentifierURLForType:()DataModelAdditions identifierURL:.cold.1()
{
  v0 = [NSString stringWithUTF8String:"+[NSURL(DataModelAdditions) pbf_descriptorIdentifierURLForType:identifierURL:]"];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(&dword_1D31CE000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

+ (void)pbf_descriptorIdentifierURLForType:()DataModelAdditions identifierURL:.cold.2(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = NSStringFromSelector(a1);
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint8_t v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  v9 = @"NSURL+DataModelAdditions.m";
  __int16 v10 = 1024;
  int v11 = 22;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

+ (void)pbf_roleIdentifierURLForType:()DataModelAdditions identifierURL:.cold.1()
{
  v0 = [NSString stringWithUTF8String:"+[NSURL(DataModelAdditions) pbf_roleIdentifierURLForType:identifierURL:]"];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(&dword_1D31CE000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

+ (void)pbf_roleIdentifierURLForType:()DataModelAdditions identifierURL:.cold.2(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = NSStringFromSelector(a1);
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint8_t v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  v9 = @"NSURL+DataModelAdditions.m";
  __int16 v10 = 1024;
  int v11 = 35;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

+ (void)pbf_providerInfoFileURLForIdentifierURL:()DataModelAdditions .cold.1()
{
  v0 = [NSString stringWithUTF8String:"+[NSURL(DataModelAdditions) pbf_providerInfoFileURLForIdentifierURL:]"];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(&dword_1D31CE000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

+ (void)pbf_versionsURLForIdentifierURL:()DataModelAdditions .cold.1()
{
  v0 = [NSString stringWithUTF8String:"+[NSURL(DataModelAdditions) pbf_versionsURLForIdentifierURL:]"];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(&dword_1D31CE000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

@end