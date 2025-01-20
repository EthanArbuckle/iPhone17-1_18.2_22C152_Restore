@interface PRPosterDescriptorGalleryAssetLookupInfo(Project)
- (id)pbf_imageFromBundle:()Project displayContext:error:;
@end

@implementation PRPosterDescriptorGalleryAssetLookupInfo(Project)

- (id)pbf_imageFromBundle:()Project displayContext:error:
{
  id v9 = a3;
  id v10 = a4;
  id v11 = v9;
  NSClassFromString(&cfstr_Nsbundle.isa);
  if (!v11)
  {
    v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterDescriptorGalleryAssetLookupInfo(Project) pbf_imageFromBundle:displayContext:error:](a2);
    }
LABEL_21:
    [v24 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D322BBC8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSBundleClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterDescriptorGalleryAssetLookupInfo(Project) pbf_imageFromBundle:displayContext:error:](a2);
    }
    [v25 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D322BC2CLL);
  }

  if (!v10)
  {
    v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"displayContext"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterDescriptorGalleryAssetLookupInfo(Project) pbf_imageFromBundle:displayContext:error:](a2);
    }
    goto LABEL_21;
  }
  v12 = [a1 lookupInfo];
  v13 = [v12 objectForKeyedSubscript:@"assetCatalogIdentifier"];

  if (v13)
  {
    v14 = [v11 URLForResource:@"Assets" withExtension:@"car"];
    v15 = NSString;
    v16 = [v14 path];
    v17 = objc_msgSend(v10, "pbf_displayContextPersistenceIdentifier");
    v18 = [v15 stringWithFormat:@"[url,%@]-[assetid,%@]-[displayContext,%@]", v16, v13, v17];

    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__2;
    v36 = __Block_byref_object_dispose__2;
    id v37 = 0;
    v19 = [(id)objc_opt_class() imageCache];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __94__PRPosterDescriptorGalleryAssetLookupInfo_Project__pbf_imageFromBundle_displayContext_error___block_invoke;
    v26[3] = &unk_1E6982800;
    id v27 = v10;
    v28 = a1;
    id v20 = v14;
    id v29 = v20;
    v31 = &v32;
    id v30 = v13;
    v21 = [v19 imageForKey:v18 generatingIfNecessaryWithBlock:v26];

    if (a5)
    {
      v22 = (void *)v33[5];
      if (v22) {
        *a5 = v22;
      }
    }

    _Block_object_dispose(&v32, 8);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)pbf_imageFromBundle:()Project displayContext:error:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)pbf_imageFromBundle:()Project displayContext:error:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)pbf_imageFromBundle:()Project displayContext:error:.cold.3(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end