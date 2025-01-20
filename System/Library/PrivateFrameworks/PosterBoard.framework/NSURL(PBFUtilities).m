@interface NSURL(PBFUtilities)
- (BOOL)pbf_allowSuspendWithOpenFileHandle;
- (BOOL)pbf_setAllowSuspendWithOpenFileHandle:()PBFUtilities error:;
- (BOOL)pbf_setPurgable:()PBFUtilities error:;
- (BOOL)pbf_unarchiveToURL:()PBFUtilities error:;
- (id)pbf_creationDate;
- (id)pbf_fileProtectionType;
- (uint64_t)pbf_isDirectory;
- (uint64_t)pbf_isExcludedFromBackup;
- (uint64_t)pbf_isPurgable;
- (uint64_t)pbf_setExcludedFromBackup:()PBFUtilities error:;
- (uint64_t)pbf_setFileProtection:()PBFUtilities error:;
@end

@implementation NSURL(PBFUtilities)

- (uint64_t)pbf_isExcludedFromBackup
{
  id v2 = 0;
  [a1 getResourceValue:&v2 forKey:*MEMORY[0x1E4F1C630] error:0];
  return [v2 BOOLValue];
}

- (uint64_t)pbf_isDirectory
{
  id v2 = 0;
  [a1 getResourceValue:&v2 forKey:*MEMORY[0x1E4F1C628] error:0];
  return [v2 BOOLValue];
}

- (uint64_t)pbf_setExcludedFromBackup:()PBFUtilities error:
{
  v6 = objc_msgSend(NSNumber, "numberWithBool:");
  uint64_t v7 = [a1 setResourceValue:v6 forKey:*MEMORY[0x1E4F1C630] error:a4];

  return v7;
}

- (BOOL)pbf_allowSuspendWithOpenFileHandle
{
  char value = 0;
  id v1 = a1;
  ssize_t v2 = getxattr((const char *)[v1 fileSystemRepresentation], "com.apple.runningboard.can-suspend-locked", 0, 0, 0, 0);
  BOOL result = 0;
  if (v2 == 1)
  {
    getxattr((const char *)[v1 fileSystemRepresentation], "com.apple.runningboard.can-suspend-locked", &value, 1uLL, 0, 0);
    return value != 0;
  }
  return result;
}

- (BOOL)pbf_setAllowSuspendWithOpenFileHandle:()PBFUtilities error:
{
  char value = a3 << 31 >> 31;
  return setxattr((const char *)[a1 fileSystemRepresentation], "com.apple.runningboard.can-suspend-locked", &value, 1uLL, 0, 0) == 0;
}

- (uint64_t)pbf_isPurgable
{
  id v2 = 0;
  [a1 getResourceValue:&v2 forKey:*MEMORY[0x1E4F1C660] error:0];
  return [v2 BOOLValue];
}

- (id)pbf_creationDate
{
  id v3 = 0;
  [a1 getResourceValue:&v3 forKey:*MEMORY[0x1E4F1C540] error:0];
  id v1 = v3;
  if (!v1)
  {
    id v1 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  return v1;
}

- (BOOL)pbf_setPurgable:()PBFUtilities error:
{
  v34[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 98821;
  if (!a3) {
    uint64_t v6 = 0;
  }
  uint64_t v26 = v6;
  id v7 = a1;
  v8 = (const char *)[v7 fileSystemRepresentation];
  int v9 = open(v8, 0);
  if (v9 < 0)
  {
    v19 = PBFLogCommon();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[NSURL(PBFUtilities) pbf_setPurgable:error:]((uint64_t)v8, v19);
    }

    if (a4)
    {
      v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F28798];
      uint64_t v22 = *__error();
      uint64_t v33 = *MEMORY[0x1E4F28328];
      v23 = [v7 path];
      v34[0] = v23;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
      *a4 = [v20 errorWithDomain:v21 code:v22 userInfo:v24];
    }
    return 0;
  }
  else
  {
    int v10 = v9;
    uint64_t v11 = ffsctl(v9, 0xC0084A44uLL, &v26, 0);
    BOOL v12 = v11 == 0;
    if (v11)
    {
      uint64_t v13 = v11;
      v14 = PBFLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v28 = v7;
        __int16 v29 = 1024;
        int v30 = a3;
        __int16 v31 = 1024;
        int v32 = v13;
        _os_log_error_impl(&dword_1D31CE000, v14, OS_LOG_TYPE_ERROR, "Error marking '%{public}@' as purgable: %{BOOL}u - %{darwin.errno}d", buf, 0x18u);
      }

      if (a4)
      {
        v15 = objc_opt_new();
        v16 = [v7 path];

        if (v16)
        {
          v17 = [v7 path];
          [v15 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F289C0]];
        }
        v18 = [NSNumber numberWithInt:v13];
        [v15 setObject:v18 forKeyedSubscript:@"errno"];

        objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 0, v15);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    close(v10);
  }
  return v12;
}

- (uint64_t)pbf_setFileProtection:()PBFUtilities error:
{
  id v6 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v6)
  {
    int v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[NSURL(PBFUtilities) pbf_setFileProtection:error:]();
    }
LABEL_9:
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D326E924);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[NSURL(PBFUtilities) pbf_setFileProtection:error:]();
    }
    goto LABEL_9;
  }

  uint64_t v7 = [a1 setResourceValue:v6 forKey:*MEMORY[0x1E4F1C590] error:a4];
  return v7;
}

- (id)pbf_fileProtectionType
{
  id v3 = 0;
  [a1 getResourceValue:&v3 forKey:*MEMORY[0x1E4F1C590] error:0];
  id v1 = v3;
  return v1;
}

- (BOOL)pbf_unarchiveToURL:()PBFUtilities error:
{
  v10[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOMCopierNew();
  [a1 fileSystemRepresentation];
  id v5 = v4;
  [v5 fileSystemRepresentation];

  uint64_t v6 = *MEMORY[0x1E4F1CFD0];
  v9[0] = @"extractPKZip";
  v9[1] = @"sequesterResources";
  v10[0] = v6;
  v10[1] = v6;
  v9[2] = @"copyResources";
  v10[2] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];
  LODWORD(a1) = BOMCopierCopyWithOptions();
  BOMCopierFree();

  return a1 == 0;
}

- (void)pbf_setPurgable:()PBFUtilities error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v4 = *__error();
  int v5 = 136315394;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl(&dword_1D31CE000, a2, OS_LOG_TYPE_ERROR, "Fail to open %s %{darwin.errno}d", (uint8_t *)&v5, 0x12u);
}

- (void)pbf_setFileProtection:()PBFUtilities error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end