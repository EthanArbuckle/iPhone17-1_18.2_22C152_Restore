@interface SBContinuityScreenshotManager
- (SBContinuityScreenshotManagerSceneManagerProvider)sceneManagerProvider;
- (void)noteCapturedScreenshot;
- (void)setSceneManagerProvider:(id)a3;
@end

@implementation SBContinuityScreenshotManager

- (void)noteCapturedScreenshot
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = [NSString stringWithUTF8String:"-[SBContinuityScreenshotManager noteCapturedScreenshot]"];
    [v15 handleFailureInFunction:v16 file:@"SBContinuityScreenshotManager.m" lineNumber:17 description:@"this call must be made on the main thread"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneManagerProvider);
  v4 = [WeakRetained sceneManagerforContinuityScreenshotManager:self];

  if (v4)
  {
    v5 = [v4 externalForegroundApplicationSceneHandles];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      v17 = v4;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v11 = [v10 sceneIfExists];
          if (v11)
          {
            id v12 = objc_alloc_init(MEMORY[0x1E4F42960]);
            v13 = [MEMORY[0x1E4F1CAD0] setWithObject:v12];
            v14 = SBLogContinuitySession();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v23 = v10;
              _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "SBContinuityScreenshotManager - sending continuity screenshot action to scene: %{public}@", buf, 0xCu);
            }

            [v11 sendActions:v13];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v7);
      v4 = v17;
    }
  }
  else
  {
    v5 = SBLogContinuitySession();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "SBContinuityScreenshotManager - no scene manager provided so we aren't notifying anyone about the screenshot", buf, 2u);
    }
  }
}

- (SBContinuityScreenshotManagerSceneManagerProvider)sceneManagerProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneManagerProvider);
  return (SBContinuityScreenshotManagerSceneManagerProvider *)WeakRetained;
}

- (void)setSceneManagerProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end