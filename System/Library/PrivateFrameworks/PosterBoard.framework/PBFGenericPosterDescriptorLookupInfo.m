@interface PBFGenericPosterDescriptorLookupInfo
+ (id)nullPosterDescriptorLookupInfo;
+ (id)posterDescriptorLookupInfoForPath:(id)a3 extension:(id)a4;
- (BOOL)isEqual:(id)a3;
- (PBFGenericPosterDescriptorLookupInfo)init;
- (PFPosterExtension)posterDescriptorExtension;
- (PFServerPosterPath)posterDescriptorPath;
- (id)_initWithPath:(id)a3 extension:(id)a4;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation PBFGenericPosterDescriptorLookupInfo

- (PBFGenericPosterDescriptorLookupInfo)init
{
  result = (PBFGenericPosterDescriptorLookupInfo *)os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (result)
  {
    v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v8 = 138413314;
    v9 = v5;
    __int16 v10 = 2112;
    v11 = v7;
    __int16 v12 = 2048;
    v13 = self;
    __int16 v14 = 2112;
    v15 = @"PBFPosterPreview.m";
    __int16 v16 = 1024;
    int v17 = 31;
    _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %@ of <%@:%p> (%@:%i)", (uint8_t *)&v8, 0x30u);
  }
  __break(0);
  return result;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_pathValidityExtension invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PBFGenericPosterDescriptorLookupInfo;
  [(PBFGenericPosterDescriptorLookupInfo *)&v3 dealloc];
}

- (id)_initWithPath:(id)a3 extension:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PBFGenericPosterDescriptorLookupInfo;
  v9 = [(PBFGenericPosterDescriptorLookupInfo *)&v16 init];
  __int16 v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_path, a3);
    v11 = (objc_class *)objc_opt_class();
    __int16 v12 = NSStringFromClass(v11);
    uint64_t v13 = [v7 extendValidityForReason:v12];
    pathValidityExtension = v10->_pathValidityExtension;
    v10->_pathValidityExtension = (BSInvalidatable *)v13;

    objc_storeStrong((id *)&v10->_extension, a4);
  }

  return v10;
}

+ (id)posterDescriptorLookupInfoForPath:(id)a3 extension:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    __int16 v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"path"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBFGenericPosterDescriptorLookupInfo posterDescriptorLookupInfoForPath:extension:](a2, (uint64_t)a1, (uint64_t)v12);
    }
LABEL_11:
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D327A034);
  }
  v9 = v8;
  if (!v8)
  {
    __int16 v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"extension"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBFGenericPosterDescriptorLookupInfo posterDescriptorLookupInfoForPath:extension:](a2, (uint64_t)a1, (uint64_t)v12);
    }
    goto LABEL_11;
  }
  id v10 = [[PBFGenericPosterDescriptorLookupInfo alloc] _initWithPath:v7 extension:v8];

  return v10;
}

+ (id)nullPosterDescriptorLookupInfo
{
  if (nullPosterDescriptorLookupInfo___once != -1) {
    dispatch_once(&nullPosterDescriptorLookupInfo___once, &__block_literal_global_26);
  }
  v2 = (void *)nullPosterDescriptorLookupInfo___nullInfo;
  return v2;
}

void __70__PBFGenericPosterDescriptorLookupInfo_nullPosterDescriptorLookupInfo__block_invoke()
{
  id v0 = [[PBFGenericPosterDescriptorLookupInfo alloc] _initWithPath:0 extension:0];
  v1 = (void *)nullPosterDescriptorLookupInfo___nullInfo;
  nullPosterDescriptorLookupInfo___nullInfo = (uint64_t)v0;
}

- (unint64_t)hash
{
  return [(PFServerPosterPath *)self->_path hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PBFGenericPosterDescriptorLookupInfo *)a3;
  if (v4 == self)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && BSEqualObjects()) {
      char v5 = BSEqualObjects();
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (PFServerPosterPath)posterDescriptorPath
{
  return self->_path;
}

- (PFPosterExtension)posterDescriptorExtension
{
  return self->_extension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_pathValidityExtension, 0);
}

+ (void)posterDescriptorLookupInfoForPath:(uint64_t)a3 extension:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = NSStringFromSelector(a1);
  char v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  v9 = @"PBFPosterPreview.m";
  __int16 v10 = 1024;
  int v11 = 50;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

+ (void)posterDescriptorLookupInfoForPath:(uint64_t)a3 extension:.cold.2(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = NSStringFromSelector(a1);
  char v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  v9 = @"PBFPosterPreview.m";
  __int16 v10 = 1024;
  int v11 = 51;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end