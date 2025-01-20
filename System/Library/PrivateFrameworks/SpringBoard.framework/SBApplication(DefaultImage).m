@interface SBApplication(DefaultImage)
@end

@implementation SBApplication(DefaultImage)

- (void)_snapshotsWithImageName:()DefaultImage sceneHandle:referenceSize:requireExactSize:launchingScale:contentTypeMask:statusBarStateMask:launchingOrientation:contentOverridesContext:userInterfaceStyle:displayEdgeInfo:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v3 = [a1 bundleIdentifier];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "A snapshot was requested for bundleID: <%{public}@> when the manifest for the app is nil.", v4, 0xCu);
}

@end