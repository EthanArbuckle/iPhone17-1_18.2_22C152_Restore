@interface SBScreenshotManager
- (SBSceneManagerCoordinator)_sceneManagerCoordinator;
- (SBScreenshotManager)initWithDataSource:(id)a3;
- (SBScreenshotManagerDataSource)dataSource;
- (_SBScreenshotPersistenceCoordinator)_persistenceCoordinator;
- (id)_fetchEligibleScreenshotProvidersForSnapshotting;
- (id)_initWithDataSource:(id)a3 persistenceCoordinator:(id)a4 sceneManagerCoordinator:(id)a5;
- (id)_providerForScreen:(id)a3;
- (void)_setPersistenceCoordinator:(id)a3;
- (void)_setSceneManagerCoordinator:(id)a3;
- (void)saveScreenshots;
- (void)saveScreenshotsWithCompletion:(id)a3;
@end

@implementation SBScreenshotManager

- (SBScreenshotManager)initWithDataSource:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(_SBScreenshotPersistenceCoordinator);
  v6 = +[SBSceneManagerCoordinator sharedInstance];
  v7 = [(SBScreenshotManager *)self _initWithDataSource:v4 persistenceCoordinator:v5 sceneManagerCoordinator:v6];

  return v7;
}

- (id)_initWithDataSource:(id)a3 persistenceCoordinator:(id)a4 sceneManagerCoordinator:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SBScreenshotManager;
  v12 = [(SBScreenshotManager *)&v15 init];
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dataSource, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 1, a5);
  }

  return p_isa;
}

- (void)saveScreenshots
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"-[SBScreenshotManager saveScreenshots]"];
    [v3 handleFailureInFunction:v4 file:@"SBScreenshotManager.m" lineNumber:62 description:@"this call must be made on the main thread"];
  }
  [(SBScreenshotManager *)self saveScreenshotsWithCompletion:0];
}

- (void)saveScreenshotsWithCompletion:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    v32 = [NSString stringWithUTF8String:"-[SBScreenshotManager saveScreenshotsWithCompletion:]"];
    [v31 handleFailureInFunction:v32 file:@"SBScreenshotManager.m" lineNumber:68 description:@"this call must be made on the main thread"];
  }
  if (![(_SBScreenshotPersistenceCoordinator *)self->_persistenceCoordinator isSaving])
  {
    [(SBScreenshotManager *)self _fetchEligibleScreenshotProvidersForSnapshotting];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      v38 = 0;
      int v9 = 0;
      uint64_t v10 = *(void *)v50;
      v34 = self;
      v35 = v4;
      uint64_t v33 = *(void *)v50;
      do
      {
        uint64_t v11 = 0;
        uint64_t v36 = v8;
        do
        {
          if (*(void *)v50 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v49 + 1) + 8 * v11);
          v13 = objc_msgSend(v12, "captureScreenshot", v33, v34, v35);
          v14 = [v12 screen];
          objc_super v15 = [v14 displayIdentity];
          if (v13) {
            BOOL v16 = v15 == 0;
          }
          else {
            BOOL v16 = 1;
          }
          if (!v16)
          {
            id v44 = v15;
            v17 = [v12 flasher];
            [v17 flashWhiteWithCompletion:0];

            if ((v9 & 1) == 0) {
              int v9 = 1;
            }
            int v43 = v9;
            uint64_t v42 = v11;
            v40 = v14;
            if (v4)
            {
              v18 = v38;
              if (!v38)
              {
                v18 = [MEMORY[0x1E4F1CA60] dictionary];
              }
              v38 = v18;
              id v19 = v44;
              [v18 setObject:v13 forKey:v44];
            }
            else
            {
              id v19 = v44;
            }
            v41 = v13;
            [(_SBScreenshotPersistenceCoordinator *)self->_persistenceCoordinator saveScreenshot:v13 withCompletion:0];
            v39 = [(SBSceneManagerCoordinator *)self->_sceneManagerCoordinator sceneManagerForDisplayIdentity:v19];
            v20 = [v39 externalForegroundApplicationSceneHandles];
            long long v45 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            uint64_t v21 = [v20 countByEnumeratingWithState:&v45 objects:v55 count:16];
            if (v21)
            {
              uint64_t v22 = v21;
              uint64_t v23 = *(void *)v46;
              do
              {
                for (uint64_t i = 0; i != v22; ++i)
                {
                  if (*(void *)v46 != v23) {
                    objc_enumerationMutation(v20);
                  }
                  v25 = *(void **)(*((void *)&v45 + 1) + 8 * i);
                  v26 = [v25 sceneIfExists];
                  if (v26)
                  {
                    id v27 = objc_alloc_init(MEMORY[0x1E4F42960]);
                    v28 = [MEMORY[0x1E4F1CAD0] setWithObject:v27];
                    v29 = SBLogCommon();
                    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138543362;
                      v54 = v25;
                      _os_log_error_impl(&dword_1D85BA000, v29, OS_LOG_TYPE_ERROR, "sending screenshot action to scene: %{public}@", buf, 0xCu);
                    }

                    [v26 sendActions:v28];
                  }
                }
                uint64_t v22 = [v20 countByEnumeratingWithState:&v45 objects:v55 count:16];
              }
              while (v22);
            }

            self = v34;
            id v4 = v35;
            int v9 = v43;
            uint64_t v10 = v33;
            uint64_t v8 = v36;
            v13 = v41;
            uint64_t v11 = v42;
            v14 = v40;
            objc_super v15 = v44;
          }

          ++v11;
        }
        while (v11 != v8);
        uint64_t v8 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
      }
      while (v8);
      if (v9) {
        AudioServicesPlaySystemSoundWithCompletion(0x454u, 0);
      }
      if (!v4) {
        goto LABEL_46;
      }
      if (v38)
      {
        ((void (**)(id, void *))v4)[2](v4, v38);
LABEL_46:

        v6 = v38;
        goto LABEL_47;
      }
    }
    else if (!v4)
    {
LABEL_45:
      v38 = 0;
      goto LABEL_46;
    }
    v30 = [MEMORY[0x1E4F1CA60] dictionary];
    ((void (**)(id, void *))v4)[2](v4, v30);

    goto LABEL_45;
  }
  v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[SBScreenshotManager saveScreenshotsWithCompletion:](v5);
  }

  if (v4)
  {
    v6 = [MEMORY[0x1E4F1CA60] dictionary];
    ((void (**)(id, void *))v4)[2](v4, v6);
LABEL_47:
  }
}

- (id)_fetchEligibleScreenshotProvidersForSnapshotting
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = -[SBScreenshotManagerDataSource screenshotManagerScreensToScreenshot:](self->_dataSource, "screenshotManagerScreensToScreenshot:", self, 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        int v9 = [(SBScreenshotManager *)self _providerForScreen:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        if (v9)
        {
          if (!v6)
          {
            v6 = [MEMORY[0x1E4F1CA48] array];
          }
          [v6 addObject:v9];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_providerForScreen:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F42D90] mainScreen];

  uint64_t v5 = off_1E6AF22A8;
  if (v4 != v3) {
    uint64_t v5 = off_1E6AF20E0;
  }
  v6 = (void *)[objc_alloc(*v5) initWithScreen:v3];

  return v6;
}

- (SBScreenshotManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (SBSceneManagerCoordinator)_sceneManagerCoordinator
{
  return self->_sceneManagerCoordinator;
}

- (void)_setSceneManagerCoordinator:(id)a3
{
}

- (_SBScreenshotPersistenceCoordinator)_persistenceCoordinator
{
  return self->_persistenceCoordinator;
}

- (void)_setPersistenceCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_persistenceCoordinator, 0);
  objc_storeStrong((id *)&self->_sceneManagerCoordinator, 0);
}

- (void)saveScreenshotsWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Previous screenshot(s) are still being written", v1, 2u);
}

@end