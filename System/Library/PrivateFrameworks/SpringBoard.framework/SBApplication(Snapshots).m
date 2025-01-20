@interface SBApplication(Snapshots)
@end

@implementation SBApplication(Snapshots)

- (void)deleteSnapshotForContext:()Snapshots .cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Unable to delete snapshot due to incomplete context: %@", v2, v3, v4, v5, v6);
}

- (void)_xbactivity_saveSnapshotForSceneHandle:()Snapshots context:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Unable to take scene snapshot due to missing information: %@", v2, v3, v4, v5, v6);
}

- (void)_xbactivity_saveSnapshotForSceneHandle:()Snapshots context:completion:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Unable to take scene snapshot due to missing snapshotContext for sceneID: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_xbactivity_saveSnapshotForSceneHandle:()Snapshots context:completion:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Unable to find scene presentation manager for context: %@", v2, v3, v4, v5, v6);
}

- (void)_xbactivity_saveSnapshotForSceneHandle:()Snapshots context:completion:.cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 bundleIdentifier];
  OUTLINED_FUNCTION_1_0();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_ERROR, "[%{public}@] unable to snapshot scene with context: %@", v6, 0x16u);
}

- (void)_xbactivity_saveSnapshotForSceneHandle:()Snapshots context:completion:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Invalid scale specified for taking a scene snapshot: %@", v2, v3, v4, v5, v6);
}

- (void)_xbactivity_saveSnapshotForSceneHandle:()Snapshots context:completion:.cold.6(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint8_t v6 = [a2 sceneID];
  int v7 = 138543874;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  v10 = v6;
  __int16 v11 = 2114;
  v12 = a2;
  _os_log_error_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_ERROR, "Unable to take scene snapshot due to sceneHandle sceneID: %{public}@: mismatch with snapshotContext sceneID: %{public}@ for snapshotContext: %{public}@", (uint8_t *)&v7, 0x20u);
}

@end