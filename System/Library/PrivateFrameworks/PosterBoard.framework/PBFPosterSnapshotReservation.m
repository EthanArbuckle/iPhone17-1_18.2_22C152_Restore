@interface PBFPosterSnapshotReservation
+ (id)globalCache;
+ (void)noteAllSnapshotsWereReaped;
+ (void)noteSnapshotWasReaped:(id)a3;
- (BOOL)isValid;
- (NSError)error;
- (NSURL)URL;
- (PBFDisplayContext)displayContext;
- (PBFPosterSnapshotReservation)initWithURL:(id)a3 displayContext:(id)a4 image:(id)a5 error:(id)a6;
- (UIImage)image;
- (id)fetchImageWithError:(id *)a3;
- (void)cancel;
@end

@implementation PBFPosterSnapshotReservation

+ (id)globalCache
{
  if (globalCache_onceToken != -1) {
    dispatch_once(&globalCache_onceToken, &__block_literal_global_37);
  }
  v2 = (void *)globalCache_cache;
  return v2;
}

void __43__PBFPosterSnapshotReservation_globalCache__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F4F8C0]) initWithUniqueIdentifier:@"PBFPosterSnapshotReservation global cache"];
  v1 = (void *)globalCache_cache;
  globalCache_cache = v0;
}

+ (void)noteSnapshotWasReaped:(id)a3
{
  id v3 = a3;
  id v5 = [(id)objc_opt_class() globalCache];
  v4 = [v3 path];

  [v5 removeImageForKey:v4];
}

+ (void)noteAllSnapshotsWereReaped
{
  v2 = [(id)objc_opt_class() globalCache];
  [v2 removeAllImagesWithCompletion:&__block_literal_global_3];

  id v3 = [MEMORY[0x1E4F28C40] notificationCenterForType:@"POSTERBOARD"];
  [v3 postNotificationName:@"POSTERBOARD_CLEAR_ALL_CACHED_SNAPSHOTS" object:0 userInfo:0 deliverImmediately:1];
}

- (PBFPosterSnapshotReservation)initWithURL:(id)a3 displayContext:(id)a4 image:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v10;
  NSClassFromString(&cfstr_Nsurl.isa);
  if (!v14)
  {
    v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotReservation initWithURL:displayContext:image:error:]();
    }
LABEL_32:
    [v25 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32A2480);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSURLClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotReservation initWithURL:displayContext:image:error:]();
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32A24E4);
  }

  id v15 = v12;
  if (v15)
  {
    NSClassFromString(&cfstr_Uiimage.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:UIImageClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PBFPosterSnapshotReservation initWithURL:displayContext:image:error:].cold.5();
      }
      [v29 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D32A2610);
    }
  }

  id v16 = v13;
  if (v16)
  {
    NSClassFromString(&cfstr_Nserror.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSErrorClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PBFPosterSnapshotReservation initWithURL:displayContext:image:error:].cold.4();
      }
      goto LABEL_32;
    }
  }

  id v17 = v11;
  if (!v17)
  {
    v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotReservation initWithURL:displayContext:image:error:]();
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32A2548);
  }
  v18 = v17;
  if (([v17 conformsToProtocol:&unk_1F2AE68B8] & 1) == 0)
  {
    v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(PBFDisplayContext)]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotReservation initWithURL:displayContext:image:error:]();
    }
    [v28 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32A25ACLL);
  }

  v30.receiver = self;
  v30.super_class = (Class)PBFPosterSnapshotReservation;
  v19 = [(PBFPosterSnapshotReservation *)&v30 init];
  if (v19)
  {
    uint64_t v20 = [v14 copy];
    URL = v19->_URL;
    v19->_URL = (NSURL *)v20;

    objc_storeStrong((id *)&v19->_error, a6);
    objc_storeStrong((id *)&v19->_displayContext, a4);
    v22 = [(id)objc_opt_class() globalCache];
    v23 = [v14 path];
    if (v15) {
      [v22 setImage:v15 forKey:v23];
    }
    else {
      [v22 removeImageForKey:v23];
    }
  }
  return v19;
}

- (void)cancel
{
  obj = self;
  objc_sync_enter(obj);
  error = obj->_error;
  obj->_error = 0;

  objc_sync_exit(obj);
}

- (id)fetchImageWithError:(id *)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = self->_URL;
  v6 = self->_displayContext;
  v7 = PBFLogSnapshotter();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [(NSURL *)v5 lastPathComponent];
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_1D31CE000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Begin fetch for image of displayContext %{public}@", buf, 0x16u);
  }
  v9 = self;
  objc_sync_enter(v9);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v41 = __Block_byref_object_copy__14;
  v42 = __Block_byref_object_dispose__14;
  id v43 = 0;
  id v10 = [(id)objc_opt_class() globalCache];
  id v11 = [(NSURL *)v5 path];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __52__PBFPosterSnapshotReservation_fetchImageWithError___block_invoke;
  v28[3] = &unk_1E6984300;
  id v12 = v5;
  v29 = v12;
  v31 = buf;
  id v13 = v6;
  objc_super v30 = v13;
  id v14 = [v10 imageForKey:v11 generatingIfNecessaryWithBlock:v28];

  if (v14)
  {
    id v15 = PBFLogSnapshotter();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [(NSURL *)v12 lastPathComponent];
      *(_DWORD *)v32 = 138543618;
      v33 = v16;
      __int16 v34 = 2114;
      v35 = v13;
      _os_log_impl(&dword_1D31CE000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Image for displayContext %{public}@ was fetched; returning",
        v32,
        0x16u);
    }
    id v17 = v14;
  }
  else
  {
    if (*(void *)(*(void *)&buf[8] + 40)) {
      goto LABEL_11;
    }
    v18 = (void *)MEMORY[0x1E4F28C58];
    URL = (NSURL *)CFSTR("(nil URL");
    if (self->_URL) {
      URL = self->_URL;
    }
    uint64_t v38 = *MEMORY[0x1E4F289D0];
    v39 = URL;
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    uint64_t v21 = objc_msgSend(v18, "pbf_generalErrorWithCode:userInfo:", 7, v20);
    v22 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v21;

    if (*(void *)(*(void *)&buf[8] + 40))
    {
LABEL_11:
      v23 = PBFLogSnapshotter();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v25 = [(NSURL *)v12 lastPathComponent];
        displayContext = self->_displayContext;
        uint64_t v27 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)v32 = 138543874;
        v33 = v25;
        __int16 v34 = 2114;
        v35 = displayContext;
        __int16 v36 = 2114;
        uint64_t v37 = v27;
        _os_log_error_impl(&dword_1D31CE000, v23, OS_LOG_TYPE_ERROR, "[%{public}@] Error fetching image for displayContext %{public}@: %{public}@", v32, 0x20u);
      }
      objc_storeStrong((id *)&v9->_error, *(id *)(*(void *)&buf[8] + 40));
      if (a3) {
        *a3 = *(id *)(*(void *)&buf[8] + 40);
      }
    }
  }

  _Block_object_dispose(buf, 8);
  objc_sync_exit(v9);

  return v14;
}

id __52__PBFPosterSnapshotReservation_fetchImageWithError___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  int v4 = [v2 checkResourceIsReachableAndReturnError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  id v5 = PBFLogSnapshotter();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [*(id *)(a1 + 32) lastPathComponent];
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v7;
      __int16 v22 = 2114;
      uint64_t v23 = v8;
      _os_log_impl(&dword_1D31CE000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Loading image of displayContext %{public}@", buf, 0x16u);
    }
    id v9 = objc_alloc(MEMORY[0x1E4F927D8]);
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = [MEMORY[0x1E4F927E0] defaultFormat];
    v6 = [v9 initWithURL:v10 format:v11];

    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    id v18 = *(id *)(v12 + 40);
    id v13 = [v6 createUIImageWithError:&v18];
    objc_storeStrong((id *)(v12 + 40), v18);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v15 = [*(id *)(a1 + 32) lastPathComponent];
      uint64_t v16 = *(void *)(a1 + 40);
      uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v21 = v15;
      __int16 v22 = 2114;
      uint64_t v23 = v16;
      __int16 v24 = 2114;
      uint64_t v25 = v17;
      _os_log_error_impl(&dword_1D31CE000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] Failed fetch for image of displayContext %{public}@: %{public}@", buf, 0x20u);
    }
    id v13 = 0;
  }

  return v13;
}

- (UIImage)image
{
  return (UIImage *)[(PBFPosterSnapshotReservation *)self fetchImageWithError:0];
}

- (BOOL)isValid
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(id)objc_opt_class() globalCache];
  int v4 = [(NSURL *)v2->_URL path];
  id v5 = [v3 imageForKey:v4];

  if (v5) {
    char v6 = 1;
  }
  else {
    char v6 = [(NSURL *)v2->_URL checkResourceIsReachableAndReturnError:0];
  }
  objc_sync_exit(v2);

  return v6;
}

- (NSError)error
{
  return self->_error;
}

- (NSURL)URL
{
  return self->_URL;
}

- (PBFDisplayContext)displayContext
{
  return self->_displayContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayContext, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)initWithURL:displayContext:image:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithURL:displayContext:image:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithURL:displayContext:image:error:.cold.4()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithURL:displayContext:image:error:.cold.5()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end