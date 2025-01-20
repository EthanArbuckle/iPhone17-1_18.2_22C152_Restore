@interface PXStoryConcreteColorGradingRepository
- (NSCache)colorLookupCubeCache;
- (OS_os_log)log;
- (PXStoryColorGradingConfiguration)configuration;
- (PXStoryConcreteColorGradingRepository)init;
- (PXStoryConcreteColorGradingRepository)initWithOptions:(unint64_t)a3;
- (id)_cachedColorLookupCubeForColorGradeKind:(int64_t)a3;
- (id)_createColorLookupCubeForColorGradeKind:(int64_t)a3;
- (id)_createCustomColorLookupCubeForResourceName:(id)a3;
- (id)_cubeResourceNameForColorGradeKind:(int64_t)a3;
- (id)_loadCustomColorLookupCubeForResourceName:(id)a3;
- (id)colorLookupCubeForColorGradeKind:(int64_t)a3;
- (id)localizedTitleForColorGradeKind:(int64_t)a3;
- (id)supportedColorGradeKinds;
- (id)supportedUserPickableColorGradeKinds;
- (int64_t)colorGradeKindForColorGradeCategory:(id)a3;
- (int64_t)colorGradeKindForColorGradeCategory:(id)a3 excludingKinds:(id)a4;
- (unint64_t)minimumCategoryKindFallbacks;
- (void)_enumerateSupporedColorGradeCategoriesUsingBlock:(id)a3;
- (void)_writeTemporaryFileWithCompressedColorCube:(id)a3 forResourceName:(id)a4;
- (void)startPreloadingWithCompletionHandler:(id)a3;
@end

@implementation PXStoryConcreteColorGradingRepository

- (id)_loadCustomColorLookupCubeForResourceName:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F1CB10];
  v5 = [MEMORY[0x1E4F8B908] defaultSystemPhotoDataDirectory];
  v6 = [v4 fileURLWithPath:v5];
  v7 = [v6 URLByAppendingPathComponent:@"Configuration"];
  v8 = [v7 URLByAppendingPathComponent:@"Grades"];

  v9 = [v8 URLByAppendingPathComponent:v3];
  v10 = [v9 URLByAppendingPathExtension:@"cube"];

  id v26 = 0;
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v10 options:1 error:&v26];
  id v12 = v26;
  if (!v11)
  {
    v17 = [v8 URLByAppendingPathComponent:v3];
    v15 = [v17 URLByAppendingPathExtension:@"cube.zz"];

    id v24 = v12;
    v16 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v15 options:1 error:&v24];
    id v14 = v24;

    if (v16)
    {
      id v23 = v14;
      v11 = [MEMORY[0x1E4F8CE58] decompressData:v16 options:0 error:&v23];
      id v18 = v23;

      if (v11)
      {
        id v22 = v18;
        v13 = (void *)[objc_alloc((Class)off_1E5DA6830) initWithData:v11 format:1 error:&v22];
        id v14 = v22;

        if (!v13) {
          PXAssertGetLog();
        }
        v19 = PLStoryGetLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v20 = [v15 path];
          *(_DWORD *)buf = 138543618;
          id v28 = v3;
          __int16 v29 = 2114;
          v30 = v20;
          _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_INFO, "Color cube for grade '%{public}@' loaded from on-device file at %{public}@", buf, 0x16u);
        }
      }
      else
      {
        v13 = 0;
        id v14 = v18;
      }
    }
    else
    {
      v11 = 0;
      v13 = 0;
    }
    goto LABEL_15;
  }
  id v25 = v12;
  v13 = (void *)[objc_alloc((Class)off_1E5DA6830) initWithData:v11 format:1 error:&v25];
  id v14 = v25;

  if (!v13) {
    PXAssertGetLog();
  }
  v15 = PLStoryGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = [v10 path];
    *(_DWORD *)buf = 138543618;
    id v28 = v3;
    __int16 v29 = 2114;
    v30 = v16;
    _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_INFO, "Color cube for grade '%{public}@' loaded from uncompressed on-device file at %{public}@", buf, 0x16u);
LABEL_15:
  }
  return v13;
}

- (id)_cubeResourceNameForColorGradeKind:(int64_t)a3
{
  v4 = [(PXStoryConcreteColorGradingRepository *)self configuration];
  v5 = [v4 objectAtIndexedSubscript:a3];

  v6 = [v5 resource];

  return v6;
}

- (id)_createCustomColorLookupCubeForResourceName:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PXStoryConcreteColorGradingRepository *)self _loadCustomColorLookupCubeForResourceName:v4];
  if (!v5) {
    goto LABEL_23;
  }
  v6 = +[PXStorySettings sharedInstance];
  [v6 colorGradeBlendingFactor];
  if (v7 != 0.0)
  {
    float v8 = v7;
    v9 = [(PXStoryConcreteColorGradingRepository *)self _loadCustomColorLookupCubeForResourceName:@"neutral"];
    if (v9)
    {
      *(float *)&double v10 = v8;
      int v11 = [v5 blendWithCube:v9 factor:v10];
      id v12 = PLStoryGetLog();
      v13 = v12;
      if (v11)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)id v26 = 138543618;
          *(void *)&v26[4] = v4;
          *(_WORD *)&v26[12] = 2048;
          *(double *)&v26[14] = v8;
          id v14 = "Blended color cube '%{public}@' with neutral LUT with factor: %0.01f";
          v15 = v13;
          os_log_type_t v16 = OS_LOG_TYPE_INFO;
          uint32_t v17 = 22;
LABEL_12:
          _os_log_impl(&dword_1A9AE7000, v15, v16, v14, v26, v17);
        }
LABEL_13:

        goto LABEL_14;
      }
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      *(_DWORD *)id v26 = 138543362;
      *(void *)&v26[4] = v4;
      id v14 = "Failed to blend color cube '%{public}@' with neutral LUT: size mismatch";
    }
    else
    {
      v13 = PLStoryGetLog();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      *(_DWORD *)id v26 = 138543362;
      *(void *)&v26[4] = v4;
      id v14 = "Failed to blend color cube '%{public}@' with neutral LUT: failed to load neutral LUT";
    }
    v15 = v13;
    os_log_type_t v16 = OS_LOG_TYPE_ERROR;
    uint32_t v17 = 12;
    goto LABEL_12;
  }
LABEL_14:
  objc_msgSend(v6, "colorGradeSmoothingFactor", *(_OWORD *)v26, *(void *)&v26[16]);
  float v19 = v18;
  uint64_t v20 = [v6 colorGradeSmoothingPasses];
  if (v19 != 0.0 && v20 >= 1)
  {
    uint64_t v22 = v20;
    id v23 = PLStoryGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id v26 = 138543874;
      *(void *)&v26[4] = v4;
      *(_WORD *)&v26[12] = 2048;
      *(double *)&v26[14] = v19;
      *(_WORD *)&v26[22] = 2048;
      uint64_t v27 = v22;
      _os_log_impl(&dword_1A9AE7000, v23, OS_LOG_TYPE_INFO, "Smoothing color cube '%{public}@' with factor: %0.2f, %ld passes", v26, 0x20u);
    }

    do
    {
      *(float *)&double v24 = v19;
      [v5 smoothWithFactor:v24];
      --v22;
    }
    while (v22);
  }
  [(PXStoryConcreteColorGradingRepository *)self _writeTemporaryFileWithCompressedColorCube:v5 forResourceName:v4];

LABEL_23:
  return v5;
}

- (id)_createColorLookupCubeForColorGradeKind:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = -[PXStoryConcreteColorGradingRepository _cubeResourceNameForColorGradeKind:](self, "_cubeResourceNameForColorGradeKind:");
  if (v5)
  {
    v6 = [(PXStoryConcreteColorGradingRepository *)self _createCustomColorLookupCubeForResourceName:v5];
    if (!v6)
    {
      float v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      float v8 = [v7 URLForResource:v5 withExtension:@"zcube" subdirectory:@"Grades"];

      if (v8)
      {
        id v17 = 0;
        v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v8 options:1 error:&v17];
        id v10 = v17;
        if (!v9) {
          PXAssertGetLog();
        }
        id v16 = v10;
        int v11 = [MEMORY[0x1E4F8CE58] decompressData:v9 options:0 error:&v16];
        id v12 = v16;

        if (!v11) {
          PXAssertGetLog();
        }
        v6 = objc_msgSend(objc_alloc((Class)off_1E5DA6BC0), "initWithData:edgeSize:pixelFormat:", v11, llround(cbrt((double)((unint64_t)objc_msgSend(v11, "length") >> 2))), 70);
        if (!v6) {
          PXAssertGetLog();
        }
        v13 = PLStoryGetLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          id v14 = [v8 lastPathComponent];
          *(_DWORD *)buf = 138543618;
          float v19 = v5;
          __int16 v20 = 2114;
          v21 = v14;
          _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_INFO, "Color cube for grade '%{public}@' loaded from resource: %{public}@", buf, 0x16u);
        }
      }
      else
      {
        if ((unint64_t)a3 >= 2) {
          PXAssertGetLog();
        }
        v6 = 0;
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorLookupCubeCache, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (NSCache)colorLookupCubeCache
{
  return self->_colorLookupCubeCache;
}

- (OS_os_log)log
{
  return self->_log;
}

- (unint64_t)minimumCategoryKindFallbacks
{
  return 3;
}

- (id)colorLookupCubeForColorGradeKind:(int64_t)a3
{
  v5 = [(PXStoryConcreteColorGradingRepository *)self log];
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
  float v7 = v5;
  float v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "StoryColorLookupCubeForKind", "", buf, 2u);
  }

  v9 = [(PXStoryConcreteColorGradingRepository *)self _cachedColorLookupCubeForColorGradeKind:a3];
  id v10 = v8;
  int v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v11, OS_SIGNPOST_INTERVAL_END, v6, "StoryColorLookupCubeForKind", "", v13, 2u);
  }

  return v9;
}

- (id)supportedUserPickableColorGradeKinds
{
  id v3 = objc_opt_new();
  id v4 = [(PXStoryConcreteColorGradingRepository *)self configuration];
  if ((unint64_t)[v4 count] >= 2)
  {
    unint64_t v5 = 1;
    do
    {
      os_signpost_id_t v6 = [v4 objectAtIndexedSubscript:v5];
      if ([v6 isUserSelectable])
      {
        float v7 = [NSNumber numberWithInteger:v5];
        [v3 addObject:v7];
      }
      ++v5;
    }
    while (v5 < [v4 count]);
  }
  float v8 = (void *)[v3 copy];

  return v8;
}

- (id)supportedColorGradeKinds
{
  id v3 = objc_opt_new();
  id v4 = [(PXStoryConcreteColorGradingRepository *)self configuration];
  unint64_t v5 = [v4 count];

  if (v5 >= 2)
  {
    unint64_t v6 = 1;
    do
    {
      float v7 = [NSNumber numberWithInteger:v6];
      [v3 addObject:v7];

      ++v6;
      float v8 = [(PXStoryConcreteColorGradingRepository *)self configuration];
      unint64_t v9 = [v8 count];
    }
    while (v6 < v9);
  }
  id v10 = (void *)[v3 copy];

  return v10;
}

- (id)localizedTitleForColorGradeKind:(int64_t)a3
{
  if ((unint64_t)a3 >= 2
    && ([(PXStoryConcreteColorGradingRepository *)self configuration],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 objectAtIndexedSubscript:a3],
        unint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        v5))
  {
    unint64_t v6 = [v5 resource];
  }
  else
  {
    unint64_t v6 = @"None";
  }
  float v7 = (void *)[[NSString alloc] initWithFormat:@"InteractiveMemoryFilter_%@", v6];
  float v8 = PXLocalizedStringFromTable(v7, @"PhotosUICore");

  return v8;
}

- (int64_t)colorGradeKindForColorGradeCategory:(id)a3 excludingKinds:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v23 = self;
    float v8 = [(PXStoryConcreteColorGradingRepository *)self configuration];
    if ((unint64_t)[v8 count] >= 2)
    {
      uint64_t v9 = 0;
      unint64_t v10 = 1;
      do
      {
        int v11 = [v8 objectAtIndexedSubscript:v10];
        if ([v11 isAutoSelectable])
        {
          id v12 = [v11 categories];
          unint64_t v13 = [v12 count];

          if (v9 <= v13) {
            uint64_t v9 = v13;
          }
        }

        ++v10;
      }
      while (v10 < [v8 count]);
      if (v9 >= 1)
      {
        for (unint64_t i = 0; i != v9; ++i)
        {
          if ((unint64_t)[v8 count] >= 2)
          {
            for (unint64_t j = 1; j < [v8 count]; ++j)
            {
              id v16 = [v8 objectAtIndexedSubscript:j];
              if ([v16 isAutoSelectable])
              {
                id v17 = [v16 categories];
                if ([v17 count] > i)
                {
                  float v18 = [v17 objectAtIndexedSubscript:i];
                  int v19 = [v6 isEqualToString:v18];

                  if (v19)
                  {
                    if (![v7 containsIndex:j])
                    {

                      goto LABEL_28;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    __int16 v20 = PLStoryGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v25 = v6;
      __int16 v26 = 2112;
      id v27 = v7;
      _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_DEFAULT, "no color grade kind found for '%@' excluding %@", buf, 0x16u);
    }

    if ([v7 count])
    {
      v21 = PLStoryGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v6;
        _os_log_impl(&dword_1A9AE7000, v21, OS_LOG_TYPE_DEFAULT, "trying to find color grade kind for '%@', ignoring exclusion list", buf, 0xCu);
      }

      unint64_t j = [(PXStoryConcreteColorGradingRepository *)v23 colorGradeKindForColorGradeCategory:v6 excludingKinds:0];
    }
    else
    {
      unint64_t j = 1;
    }
LABEL_28:
  }
  else
  {
    unint64_t j = 1;
  }

  return j;
}

- (int64_t)colorGradeKindForColorGradeCategory:(id)a3
{
  return [(PXStoryConcreteColorGradingRepository *)self colorGradeKindForColorGradeCategory:a3 excludingKinds:0];
}

- (void)_writeTemporaryFileWithCompressedColorCube:(id)a3 forResourceName:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [a3 textureData];
  if (!v6) {
    PXAssertGetLog();
  }
  uint64_t v7 = NSTemporaryDirectory();
  float v8 = [(id)v7 stringByAppendingString:v5];
  uint64_t v9 = [v8 stringByAppendingPathExtension:@"scube"];

  id v21 = 0;
  LOBYTE(v7) = [v6 writeToFile:v9 options:1 error:&v21];
  id v10 = v21;
  if ((v7 & 1) == 0) {
    PXAssertGetLog();
  }
  int v11 = PLStoryGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v9;
    _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_INFO, "uncompressed color cube written to %@", buf, 0xCu);
  }

  id v20 = v10;
  id v12 = [MEMORY[0x1E4F8CE58] compressData:v6 options:0 error:&v20];
  id v13 = v20;

  if (!v12) {
    PXAssertGetLog();
  }
  id v14 = NSTemporaryDirectory();
  uint64_t v15 = [v14 stringByAppendingString:v5];
  id v16 = [(id)v15 stringByAppendingPathExtension:@"zcube"];

  id v19 = v13;
  LOBYTE(v15) = [v12 writeToFile:v16 options:1 error:&v19];
  id v17 = v19;

  if ((v15 & 1) == 0) {
    PXAssertGetLog();
  }
  float v18 = PLStoryGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v16;
    _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_INFO, "compressed color cube written to %@", buf, 0xCu);
  }
}

- (id)_cachedColorLookupCubeForColorGradeKind:(int64_t)a3
{
  id v5 = [(PXStoryConcreteColorGradingRepository *)self colorLookupCubeCache];
  if (a3 < 0)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [NSNumber numberWithInteger:a3];
  }
  uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  float v8 = [v5 objectForKey:v6];
  if (!v8)
  {
    uint64_t v9 = [(PXStoryConcreteColorGradingRepository *)self _createColorLookupCubeForColorGradeKind:a3];
    float v8 = (void *)v9;
    if (v9) {
      id v10 = (void *)v9;
    }
    else {
      id v10 = v7;
    }
    [v5 setObject:v10 forKey:v6];
  }
  if (v8 == v7)
  {

    float v8 = 0;
  }

  return v8;
}

- (void)_enumerateSupporedColorGradeCategoriesUsingBlock:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = (void (**)(id, void))a3;
  v3[2](v3, 0);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = PFStoryColorGradeSupportedCategories();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        v3[2](v3, *(void *)(*((void *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)startPreloadingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXStoryConcreteColorGradingRepository *)self log];
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
  uint64_t v7 = v5;
  uint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "StoryColorLookupCubePreloading", "", (uint8_t *)buf, 2u);
  }

  dispatch_group_t v9 = dispatch_group_create();
  long long v10 = +[PXPreloadScheduler sharedScheduler];
  objc_initWeak(buf, self);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __78__PXStoryConcreteColorGradingRepository_startPreloadingWithCompletionHandler___block_invoke;
  v19[3] = &unk_1E5DCBF70;
  long long v11 = v9;
  id v20 = v11;
  id v12 = v10;
  id v21 = v12;
  objc_copyWeak(&v22, buf);
  [(PXStoryConcreteColorGradingRepository *)self _enumerateSupporedColorGradeCategoriesUsingBlock:v19];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__PXStoryConcreteColorGradingRepository_startPreloadingWithCompletionHandler___block_invoke_3;
  v15[3] = &unk_1E5DD34C0;
  id v17 = v4;
  os_signpost_id_t v18 = v6;
  id v16 = v8;
  id v13 = v4;
  uint64_t v14 = v8;
  dispatch_group_notify(v11, MEMORY[0x1E4F14428], v15);

  objc_destroyWeak(&v22);
  objc_destroyWeak(buf);
}

void __78__PXStoryConcreteColorGradingRepository_startPreloadingWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id v4 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__PXStoryConcreteColorGradingRepository_startPreloadingWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E5DD2548;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  id v5 = v3;
  id v7 = v5;
  id v8 = *(id *)(a1 + 32);
  [v4 scheduleTaskWithQoS:1 block:v6];

  objc_destroyWeak(&v9);
}

uint64_t __78__PXStoryConcreteColorGradingRepository_startPreloadingWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  v2 = *(id *)(a1 + 32);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)os_signpost_id_t v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v3, OS_SIGNPOST_INTERVAL_END, v4, "StoryColorLookupCubePreloading", "", v6, 2u);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __78__PXStoryConcreteColorGradingRepository_startPreloadingWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = [WeakRetained colorGradeKindForColorGradeCategory:*(void *)(a1 + 32)];

  id v5 = objc_loadWeakRetained(v2);
  id v6 = (id)[v5 colorLookupCubeForColorGradeKind:v4];

  id v7 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v7);
}

- (PXStoryColorGradingConfiguration)configuration
{
  return +[PXStoryColorGradingConfigurationFactory sharedConfiguration];
}

- (PXStoryConcreteColorGradingRepository)initWithOptions:(unint64_t)a3
{
  char v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXStoryConcreteColorGradingRepository;
  uint64_t v4 = [(PXStoryConcreteColorGradingRepository *)&v13 init];
  if (v4)
  {
    id v5 = (const char *)*MEMORY[0x1E4F8C518];
    id v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    id v7 = objc_claimAutoreleasedReturnValue();
    os_log_t v8 = os_log_create(v5, (const char *)[v7 UTF8String]);
    log = v4->_log;
    v4->_log = (OS_os_log *)v8;

    if ((v3 & 1) == 0)
    {
      long long v10 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
      colorLookupCubeCache = v4->_colorLookupCubeCache;
      v4->_colorLookupCubeCache = v10;
    }
  }
  return v4;
}

- (PXStoryConcreteColorGradingRepository)init
{
  return [(PXStoryConcreteColorGradingRepository *)self initWithOptions:0];
}

@end