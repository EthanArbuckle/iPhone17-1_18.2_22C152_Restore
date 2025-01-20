@interface SBScreenshotManagerDataSource
- (id)screenshotManagerScreensToScreenshot:(id)a3;
@end

@implementation SBScreenshotManagerDataSource

- (id)screenshotManagerScreensToScreenshot:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  v4 = [v3 policyAggregator];
  id v10 = 0;
  int v5 = [v4 allowsCapability:18 explanation:&v10];
  id v6 = v10;

  if (v5)
  {
    v7 = [MEMORY[0x1E4F42D90] mainScreen];
    v11[0] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  }
  else
  {
    v7 = SBLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SBScreenshotManagerDataSource screenshotManagerScreensToScreenshot:]((uint64_t)v6, v7);
    }
    v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (void)screenshotManagerScreensToScreenshot:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Unable to snapshot screens for reason: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end