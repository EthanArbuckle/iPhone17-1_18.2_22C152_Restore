@interface PRSPosterUpdater
+ (BOOL)canUpdatesBeAppliedLocally:(id)a3;
+ (id)updaterForPath:(id)a3;
- (BOOL)applyUpdateLocally:(id)a3 error:(id *)a4;
- (BOOL)applyUpdatesLocally:(id)a3 error:(id *)a4;
- (PRSPosterUpdater)init;
- (id)_initWithWeakPath:(id)a3;
@end

@implementation PRSPosterUpdater

+ (BOOL)canUpdatesBeAppliedLocally:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "type", (void)v12);
        if ((unint64_t)(v8 - 13) >= 5 && v8 != 0)
        {
          BOOL v10 = 0;
          goto LABEL_14;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  BOOL v10 = 1;
LABEL_14:

  return v10;
}

+ (id)updaterForPath:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = a1;
    objc_sync_enter(v6);
    objc_getAssociatedObject(v5, a2);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      id v7 = [[PRSPosterUpdater alloc] _initWithWeakPath:v5];
      objc_setAssociatedObject(v5, a2, v7, (void *)1);
    }
    objc_sync_exit(v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (PRSPosterUpdater)init
{
  return 0;
}

- (id)_initWithWeakPath:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PRSPosterUpdater;
  id v5 = [(PRSPosterUpdater *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_weakPath, v4);
  }

  return v6;
}

- (BOOL)applyUpdateLocally:(id)a3 error:(id *)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 1;
  }
  id v11 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  objc_super v8 = [v6 arrayWithObjects:&v11 count:1];

  BOOL v9 = -[PRSPosterUpdater applyUpdatesLocally:error:](self, "applyUpdatesLocally:error:", v8, a4, v11, v12);
  return v9;
}

- (BOOL)applyUpdatesLocally:(id)a3 error:(id *)a4
{
  v66[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_weakPath);
    if (!WeakRetained)
    {
      if (!a4)
      {
        BOOL v24 = 0;
LABEL_57:

        goto LABEL_58;
      }
      v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v65 = *MEMORY[0x1E4F28588];
      v66[0] = @"path is no longer valid.";
      objc_super v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:&v65 count:1];
      [v25 errorWithDomain:@"com.apple.PosterBoardServices" code:-1 userInfo:v8];
      BOOL v24 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_56:

      goto LABEL_57;
    }
    objc_super v8 = self;
    objc_sync_enter(v8);
    BOOL v9 = [WeakRetained instanceURL];
    if (([v9 checkResourceIsReachableAndReturnError:a4] & 1) == 0)
    {
      BOOL v24 = 0;
LABEL_55:

      objc_sync_exit(v8);
      goto LABEL_56;
    }
    BOOL v10 = [WeakRetained role];
    v46 = a4;
    v45 = v9;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v49 objects:v64 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v50;
      uint64_t v14 = *MEMORY[0x1E4F924F0];
      uint64_t v15 = *MEMORY[0x1E4F924E0];
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v50 != v13) {
            objc_enumerationMutation(v11);
          }
          unint64_t v17 = [*(id *)(*((void *)&v49 + 1) + 8 * v16) type];
          if (v17 <= 0x11)
          {
            if (((1 << v17) & 0x3E1C6) != 0)
            {
              if (([v10 isEqualToString:v14] & 1) == 0)
              {
                v19 = v46;
                if (v46)
                {
                  v26 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v60 = *MEMORY[0x1E4F28588];
                  v61 = @"Lockscreen role is inconsistent with provided updates.";
                  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
                  v27 = BOOL v9 = v45;
                  v28 = [v26 errorWithDomain:@"com.apple.PosterBoardServices" code:-1 userInfo:v27];
LABEL_43:
                  id v32 = v28;
                  goto LABEL_44;
                }
                goto LABEL_45;
              }
            }
            else if (((1 << v17) & 0x1200) != 0)
            {
              if (([v10 isEqualToString:v15] & 1) == 0)
              {
                v19 = v46;
                if (v46)
                {
                  v36 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v58 = *MEMORY[0x1E4F28588];
                  v59 = @"Ambient role is inconsistent with provided updates.";
                  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
                  v27 = BOOL v9 = v45;
                  v28 = [v36 errorWithDomain:@"com.apple.PosterBoardServices" code:-1 userInfo:v27];
                  goto LABEL_43;
                }
LABEL_45:
                BOOL v24 = 0;
                BOOL v9 = v45;
                goto LABEL_54;
              }
            }
            else if (((1 << v17) & 0xC38) != 0)
            {
              v19 = v46;
              if (v46)
              {
                v29 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v62 = *MEMORY[0x1E4F28588];
                v63 = @"update type is not valid for PRSPosterUpdater.";
                [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
                v27 = BOOL v9 = v45;
                v28 = [v29 errorWithDomain:@"com.apple.PosterBoardServices" code:-1 userInfo:v27];
                goto LABEL_43;
              }
              goto LABEL_45;
            }
          }
          ++v16;
        }
        while (v12 != v16);
        uint64_t v18 = [v11 countByEnumeratingWithState:&v49 objects:v64 count:16];
        uint64_t v12 = v18;
      }
      while (v18);
    }

    v19 = v46;
    BOOL v9 = v45;
    id v48 = 0;
    v20 = [getPRPosterPathUtilitiesClass() loadConfiguredPropertiesForPath:WeakRetained error:&v48];
    id v44 = v48;
    v21 = (void *)[v20 mutableCopy];
    v22 = v21;
    if (v21)
    {
      id v23 = v21;
    }
    else
    {
      uint64_t v54 = 0;
      v55 = &v54;
      uint64_t v56 = 0x2050000000;
      v30 = (void *)getPRPosterMutableConfiguredPropertiesClass_softClass;
      uint64_t v57 = getPRPosterMutableConfiguredPropertiesClass_softClass;
      if (!getPRPosterMutableConfiguredPropertiesClass_softClass)
      {
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __getPRPosterMutableConfiguredPropertiesClass_block_invoke;
        v53[3] = &unk_1E5D007B0;
        v53[4] = &v54;
        __getPRPosterMutableConfiguredPropertiesClass_block_invoke((uint64_t)v53);
        v30 = (void *)v55[3];
      }
      id v31 = v30;
      _Block_object_dispose(&v54, 8);
      id v23 = [v31 defaultConfiguredPropertiesForRole:v10];
    }
    v27 = v23;

    if (v44)
    {
      if (v46)
      {
        id v32 = v44;
        id v11 = v32;
LABEL_44:
        BOOL v24 = 0;
        id *v19 = v32;
LABEL_53:

LABEL_54:
        goto LABEL_55;
      }
      BOOL v24 = 0;
LABEL_52:
      id v11 = v44;
      goto LABEL_53;
    }
    id v47 = 0;
    int v33 = [v27 applyUpdates:v11 error:&v47];
    id v34 = v47;
    v35 = v34;
    if (v34)
    {
      if (v46)
      {
        BOOL v24 = 0;
        id *v46 = v34;
LABEL_51:

        goto LABEL_52;
      }
LABEL_50:
      BOOL v24 = 0;
      goto LABEL_51;
    }
    if (v33)
    {
      id PRPosterPathUtilitiesClass = getPRPosterPathUtilitiesClass();
      v38 = (void *)[v27 copy];
      int v39 = [PRPosterPathUtilitiesClass storeConfiguredPropertiesForPath:WeakRetained configuredProperties:v38 error:v46];

      if (!v39) {
        goto LABEL_50;
      }
      v40 = objc_alloc_init(PRSService);
      v41 = [WeakRetained identity];
      v42 = [v41 posterUUID];
      [(PRSService *)v40 notePosterConfigurationUnderlyingModelDidChange:v42];
    }
    BOOL v24 = 1;
    goto LABEL_51;
  }
  BOOL v24 = 1;
LABEL_58:

  return v24;
}

- (void).cxx_destruct
{
}

@end