@interface NCMaterialDisplayingCaptureOnlyViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_supportsCaptureForMaterialDisplaying:(id)a3;
- (NCMaterialDisplayingCaptureOnlyViewController)init;
- (void)_registerMaterialDisplaying:(BOOL)a3 forDisplaying:(id)a4 persistent:(BOOL)a5;
- (void)loadView;
- (void)registerMaterialDisplaying:(id)a3 persistent:(BOOL)a4;
- (void)unregisterMaterialDisplaying:(id)a3;
@end

@implementation NCMaterialDisplayingCaptureOnlyViewController

- (NCMaterialDisplayingCaptureOnlyViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)NCMaterialDisplayingCaptureOnlyViewController;
  v2 = [(NCMaterialDisplayingCaptureOnlyViewController *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    supplementaryMaterialsAndUsageCounts = v2->_supplementaryMaterialsAndUsageCounts;
    v2->_supplementaryMaterialsAndUsageCounts = v3;
  }
  return v2;
}

- (void)loadView
{
  v3 = objc_alloc_init(NCMaterialDisplayingCaptureOnlyViewControllerView);
  [(NCMaterialDisplayingCaptureOnlyViewController *)self setView:v3];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)registerMaterialDisplaying:(id)a3 persistent:(BOOL)a4
{
}

- (void)unregisterMaterialDisplaying:(id)a3
{
}

- (void)_registerMaterialDisplaying:(BOOL)a3 forDisplaying:(id)a4 persistent:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  v44[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = NSString;
  [v8 materialRecipe];
  v10 = MTStringFromMaterialRecipe();
  uint64_t v11 = [v8 materialGroupNameBase];
  v12 = (void *)v11;
  v13 = @"<NULL>";
  if (v11) {
    v13 = (__CFString *)v11;
  }
  v14 = [v9 stringWithFormat:@"Recipe:%@-GroupNameBase:%@", v10, v13];

  if ([(NCMaterialDisplayingCaptureOnlyViewController *)self _supportsCaptureForMaterialDisplaying:v8])
  {
    v15 = [(NSMutableDictionary *)self->_supplementaryMaterialsAndUsageCounts objectForKey:v14];
    v16 = [v15 firstObject];
    if (v15)
    {
      v17 = [v15 lastObject];
      unint64_t v18 = [v17 unsignedIntegerValue];
    }
    else
    {
      unint64_t v18 = 0;
    }
    if (v16) {
      BOOL v20 = v18 == 0;
    }
    else {
      BOOL v20 = 0;
    }
    int v21 = v20 || v5;
    if (v6)
    {
      if (v21) {
        unint64_t v22 = 0;
      }
      else {
        unint64_t v22 = v18 + 1;
      }
      if (!v16)
      {
        v16 = objc_msgSend(MEMORY[0x1E4F743C8], "materialViewWithRecipe:options:", objc_msgSend(v8, "materialRecipe"), 4);
        v23 = [v8 materialGroupNameBase];
        [v16 setGroupNameBase:v23];

        v24 = [(NCMaterialDisplayingCaptureOnlyViewController *)self view];
        [v24 bounds];
        objc_msgSend(v16, "setFrame:");

        [v16 setAutoresizingMask:18];
        v25 = [(NCMaterialDisplayingCaptureOnlyViewController *)self view];
        [v25 addSubview:v16];
      }
      supplementaryMaterialsAndUsageCounts = self->_supplementaryMaterialsAndUsageCounts;
      v44[0] = v16;
      v27 = [NSNumber numberWithUnsignedInteger:v22];
      v44[1] = v27;
      v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
      [(NSMutableDictionary *)supplementaryMaterialsAndUsageCounts setObject:v28 forKey:v14];

      v29 = *MEMORY[0x1E4FB3750];
      if (v21)
      {
        v30 = v29;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          if (v18)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"Changing previous material of '%lu'reference count to permanent material.", v18);
            v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v36 = &stru_1F2F516F8;
          }
          *(_DWORD *)buf = 138543618;
          v39 = v14;
          __int16 v40 = 2114;
          unint64_t v41 = (unint64_t)v36;
          _os_log_debug_impl(&dword_1D7C04000, v30, OS_LOG_TYPE_DEBUG, "Capture-Only Material - Register '%{public}@': Permanently persisting Material.'%{public}@'", buf, 0x16u);
          if (v18) {
        }
          }
        goto LABEL_33;
      }
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543874;
        v39 = v14;
        __int16 v40 = 2050;
        unint64_t v41 = v18;
        __int16 v42 = 2050;
        unint64_t v43 = v18 + 1;
        v32 = "Capture-Only Material - Register '%{public}@': Changing reference count from '%{public}lu' to '%{public}lu'.";
LABEL_38:
        _os_log_debug_impl(&dword_1D7C04000, v29, OS_LOG_TYPE_DEBUG, v32, buf, 0x20u);
      }
    }
    else
    {
      if (v21)
      {
        v31 = *MEMORY[0x1E4FB3750];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEBUG)) {
          -[NCMaterialDisplayingCaptureOnlyViewController _registerMaterialDisplaying:forDisplaying:persistent:]((uint64_t)v14, v31);
        }
        goto LABEL_33;
      }
      if (v18 < 2)
      {
        [v16 removeFromSuperview];
        [(NSMutableDictionary *)self->_supplementaryMaterialsAndUsageCounts removeObjectForKey:v14];
      }
      else
      {
        v33 = self->_supplementaryMaterialsAndUsageCounts;
        v37[0] = v16;
        v34 = [NSNumber numberWithUnsignedInteger:v18 - 1];
        v37[1] = v34;
        v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
        [(NSMutableDictionary *)v33 setObject:v35 forKey:v14];
      }
      v29 = *MEMORY[0x1E4FB3750];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543874;
        v39 = v14;
        __int16 v40 = 2050;
        unint64_t v41 = v18;
        __int16 v42 = 2050;
        unint64_t v43 = v18 - 1;
        v32 = "Capture-Only Material - Unregister '%{public}@': Changing reference count from '%{public}lu' to '%{public}lu'.";
        goto LABEL_38;
      }
    }
LABEL_33:

    goto LABEL_34;
  }
  v19 = *MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_ERROR)) {
    -[NCMaterialDisplayingCaptureOnlyViewController _registerMaterialDisplaying:forDisplaying:persistent:](v6, (uint64_t)v14, v19);
  }
LABEL_34:
}

- (BOOL)_supportsCaptureForMaterialDisplaying:(id)a3
{
  id v3 = a3;
  v4 = [v3 materialGroupNameBase];
  if ([v4 length]) {
    BOOL v5 = [v3 materialRecipe] != 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (void)_registerMaterialDisplaying:(uint64_t)a1 forDisplaying:(NSObject *)a2 persistent:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D7C04000, a2, OS_LOG_TYPE_DEBUG, "Capture-Only Material - Unregister '%{public}@': Not change being made because this is a permanent material.", (uint8_t *)&v2, 0xCu);
}

- (void)_registerMaterialDisplaying:(char)a1 forDisplaying:(uint64_t)a2 persistent:(os_log_t)log .cold.2(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = @"Register";
  if ((a1 & 1) == 0) {
    uint64_t v3 = @"Unregister";
  }
  int v4 = 138543618;
  BOOL v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1D7C04000, log, OS_LOG_TYPE_ERROR, "Capture-Only Material - %{public}@ '%{public}@': Material configuration unsupported", (uint8_t *)&v4, 0x16u);
}

@end