@interface NSURL(PosterFoundation)
+ (id)pf_posterPathContentsURLForProviderURL:()PosterFoundation type:posterUUID:version:;
+ (id)pf_posterPathIdentifierURLProviderURL:()PosterFoundation type:posterUUID:;
+ (id)pf_posterPathInstanceURLForProviderURL:()PosterFoundation type:posterUUID:version:;
+ (id)pf_posterPathInstanceURLForVersionsURL:()PosterFoundation version:;
+ (id)pf_posterPathSupplementURLForInstanceURL:()PosterFoundation supplement:;
+ (id)pf_posterPathTypeURLForProviderURL:()PosterFoundation type:;
+ (id)pf_posterPathVersionsURLForProviderURL:()PosterFoundation type:posterUUID:;
+ (id)pf_temporaryDirectoryURL;
+ (id)pf_temporaryDirectoryURLNamed:()PosterFoundation;
+ (uint64_t)pf_posterPathContentsURLForInstanceURL:()PosterFoundation;
+ (uint64_t)pf_posterPathSupplementContainerURLForInstanceURL:()PosterFoundation;
- (id)pf_loadFromPlistWithError:()PosterFoundation;
- (uint64_t)pf_storeToPlist:()PosterFoundation error:;
@end

@implementation NSURL(PosterFoundation)

+ (id)pf_temporaryDirectoryURL
{
  v0 = NSURL;
  v1 = PFTemporaryDirectory();
  v2 = [v0 fileURLWithPath:v1 isDirectory:1];

  return v2;
}

+ (id)pf_temporaryDirectoryURLNamed:()PosterFoundation
{
  v3 = NSURL;
  v4 = PFTemporaryDirectoryCreatingIfItDoesntExistWithSubdirectoryNamed(a3);
  v5 = [v3 fileURLWithPath:v4 isDirectory:1];

  return v5;
}

+ (id)pf_posterPathTypeURLForProviderURL:()PosterFoundation type:
{
  id v5 = a3;
  NSClassFromString(&cfstr_Nsurl.isa);
  if (!v5)
  {
    v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[NSURL(PosterFoundation) pf_posterPathTypeURLForProviderURL:type:]();
    }
LABEL_11:
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A08F120);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSURLClass]"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[NSURL(PosterFoundation) pf_posterPathTypeURLForProviderURL:type:]();
    }
    goto LABEL_11;
  }

  v6 = PFServerPosterTypeToDirectoryName(a4);
  v7 = [v5 URLByAppendingPathComponent:v6 isDirectory:1];

  return v7;
}

+ (id)pf_posterPathIdentifierURLProviderURL:()PosterFoundation type:posterUUID:
{
  id v8 = a3;
  id v9 = a5;
  NSClassFromString(&cfstr_Nsuuid.isa);
  if (!v9)
  {
    v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[NSURL(PosterFoundation) pf_posterPathIdentifierURLProviderURL:type:posterUUID:]();
    }
LABEL_11:
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A08F2C8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSUUIDClass]"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[NSURL(PosterFoundation) pf_posterPathIdentifierURLProviderURL:type:posterUUID:]();
    }
    goto LABEL_11;
  }

  v10 = objc_msgSend(a1, "pf_posterPathTypeURLForProviderURL:type:", v8, a4);
  v11 = [v9 UUIDString];
  v12 = [v10 URLByAppendingPathComponent:v11 isDirectory:1];

  return v12;
}

+ (id)pf_posterPathVersionsURLForProviderURL:()PosterFoundation type:posterUUID:
{
  v1 = objc_msgSend(a1, "pf_posterPathIdentifierURLProviderURL:type:posterUUID:");
  v2 = [v1 URLByAppendingPathComponent:@"versions" isDirectory:1];

  return v2;
}

+ (id)pf_posterPathInstanceURLForProviderURL:()PosterFoundation type:posterUUID:version:
{
  id v8 = objc_msgSend(a1, "pf_posterPathVersionsURLForProviderURL:type:posterUUID:");
  id v9 = objc_msgSend(a1, "pf_posterPathInstanceURLForVersionsURL:version:", v8, a6);

  return v9;
}

+ (id)pf_posterPathInstanceURLForVersionsURL:()PosterFoundation version:
{
  id v5 = NSString;
  id v6 = a3;
  v7 = objc_msgSend(v5, "stringWithFormat:", @"%llu", a4);
  id v8 = [v6 URLByAppendingPathComponent:v7 isDirectory:1];

  return v8;
}

+ (id)pf_posterPathContentsURLForProviderURL:()PosterFoundation type:posterUUID:version:
{
  v2 = objc_msgSend(a1, "pf_posterPathInstanceURLForProviderURL:type:posterUUID:version:");
  v3 = objc_msgSend(a1, "pf_posterPathContentsURLForInstanceURL:", v2);

  return v3;
}

+ (uint64_t)pf_posterPathContentsURLForInstanceURL:()PosterFoundation
{
  return [a3 URLByAppendingPathComponent:@"contents" isDirectory:1];
}

+ (uint64_t)pf_posterPathSupplementContainerURLForInstanceURL:()PosterFoundation
{
  return [a3 URLByAppendingPathComponent:@"supplements"];
}

+ (id)pf_posterPathSupplementURLForInstanceURL:()PosterFoundation supplement:
{
  id v5 = objc_msgSend(a1, "pf_posterPathSupplementContainerURLForInstanceURL:");
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", a4);
  v7 = [v5 URLByAppendingPathComponent:v6];

  return v7;
}

- (id)pf_loadFromPlistWithError:()PosterFoundation
{
  if ([a1 isFileURL])
  {
    id v6 = (void *)MEMORY[0x25A2F4780]();
    id v19 = 0;
    v7 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:a1 options:1 error:&v19];
    id v8 = v19;
    id v9 = v8;
    if (v7)
    {
      id v18 = 0;
      v10 = [MEMORY[0x263F08AC0] propertyListWithData:v7 options:0 format:0 error:&v18];
      id v11 = v18;
      if (v11)
      {
        v12 = PFLogPosterContents();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[NSURL(PosterFoundation) pf_loadFromPlistWithError:]();
        }

        id v13 = v11;
      }
    }
    else
    {
      id v11 = v8;
      v10 = 0;
    }

    if (a3 && v11) {
      *a3 = v11;
    }

    return v10;
  }
  else
  {
    v15 = NSString;
    v16 = NSStringFromSelector(a2);
    v17 = [v15 stringWithFormat:@"%@ must be called on a fileURL : %@", v16, a1];

    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[NSURL(PosterFoundation) pf_loadFromPlistWithError:]();
    }
    [v17 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (uint64_t)pf_storeToPlist:()PosterFoundation error:
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (!v7)
  {
    v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"plistable"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[NSURL(PosterFoundation) pf_storeToPlist:error:]();
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A08F9D8);
  }
  id v8 = v7;
  if (([a1 isFileURL] & 1) == 0)
  {
    v23 = NSString;
    v24 = NSStringFromSelector(a2);
    v25 = [v23 stringWithFormat:@"%@ must be called on a fileURL : %@", v24, a1];

    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[NSURL(PosterFoundation) pf_storeToPlist:error:].cold.4();
    }
    [v25 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A08FA4CLL);
  }
  id v9 = (void *)MEMORY[0x25A2F4780]();
  id v27 = 0;
  v10 = [MEMORY[0x263F08AC0] dataWithPropertyList:v8 format:200 options:0 error:&v27];
  id v11 = v27;
  if (v11)
  {
    v12 = PFLogPosterContents();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[NSURL(PosterFoundation) pf_storeToPlist:error:]();
    }

    id v13 = v11;
  }
  if (v10)
  {
    id v26 = 0;
    uint64_t v14 = [v10 writeToURL:a1 options:268435457 error:&v26];
    id v15 = v26;
    v16 = PFLogPosterContents();
    v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[NSURL(PosterFoundation) pf_storeToPlist:error:]();
      }

      id v18 = v15;
      v17 = v11;
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = [a1 lastPathComponent];
        v20 = [a1 URLByDeletingLastPathComponent];
        *(_DWORD *)buf = 138412546;
        v29 = v19;
        __int16 v30 = 2112;
        v31 = v20;
        _os_log_impl(&dword_25A085000, v17, OS_LOG_TYPE_DEFAULT, "saved '%@'': (path=%@)", buf, 0x16u);
      }
      id v18 = v11;
    }
  }
  else
  {
    uint64_t v14 = 0;
    id v18 = v11;
  }

  if (a4 && v18) {
    *a4 = v18;
  }

  return v14;
}

+ (void)pf_posterPathTypeURLForProviderURL:()PosterFoundation type:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)pf_posterPathIdentifierURLProviderURL:()PosterFoundation type:posterUUID:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)pf_loadFromPlistWithError:()PosterFoundation .cold.1()
{
  OUTLINED_FUNCTION_7();
  v2 = [v1 lastPathComponent];
  v3 = [v0 URLByDeletingLastPathComponent];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0(&dword_25A085000, v4, v5, "Error during dict-plist deserializing of '%@': %{public}@ (path=%@)", v6, v7, v8, v9, v10);
}

- (void)pf_loadFromPlistWithError:()PosterFoundation .cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)pf_storeToPlist:()PosterFoundation error:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)pf_storeToPlist:()PosterFoundation error:.cold.2()
{
  OUTLINED_FUNCTION_7();
  v2 = [v1 lastPathComponent];
  v3 = [v0 URLByDeletingLastPathComponent];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0(&dword_25A085000, v4, v5, "Error during dict-plist writing of '%@': %{public}@ (path=%@)", v6, v7, v8, v9, v10);
}

- (void)pf_storeToPlist:()PosterFoundation error:.cold.3()
{
  OUTLINED_FUNCTION_7();
  v2 = [v1 lastPathComponent];
  v3 = [v0 URLByDeletingLastPathComponent];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0(&dword_25A085000, v4, v5, "Error during dict-plist serializing of '%@': %{public}@ (path=%@)", v6, v7, v8, v9, v10);
}

- (void)pf_storeToPlist:()PosterFoundation error:.cold.4()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end