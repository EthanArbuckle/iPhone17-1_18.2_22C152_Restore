@interface SBApplication(Classic)
@end

@implementation SBApplication(Classic)

+ (void)restrictedClassicModeDisplayConfigurationForDisplayConfiguration:()Classic classicMode:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 localizedDescription];
  int v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Error building custom display mode: %{public}@", (uint8_t *)&v4, 0xCu);
}

@end