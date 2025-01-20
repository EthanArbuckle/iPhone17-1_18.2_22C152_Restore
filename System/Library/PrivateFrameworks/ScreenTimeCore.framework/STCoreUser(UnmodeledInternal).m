@interface STCoreUser(UnmodeledInternal)
- (void)unmodeledManagingOrganizationSettings;
@end

@implementation STCoreUser(UnmodeledInternal)

- (void)setScreenTimeEnabled:()UnmodeledInternal .cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Could not set screenTimeEnabled: %@", v2, v3, v4, v5, v6);
}

- (void)setScreenTimeEnabled:()UnmodeledInternal .cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_1DA519000, v0, v1, "Failed to fetch screen time settings: %{public}@", v2, v3, v4, v5, v6);
}

- (void)setScreenTimeEnabled:()UnmodeledInternal .cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed to delete managed user blueprint: %{public}@", v2, v3, v4, v5, v6);
}

- (void)setEffectiveRecoveryAltDSID:()UnmodeledInternal .cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_1DA519000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Attempted to set a recoveryAltDSID on family organization settings.", v0, 2u);
}

- (void)setContactsEditable:()UnmodeledInternal .cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed to fetch contacts container to set managed state: %{public}@", v2, v3, v4, v5, v6);
}

- (void)setContactsEditable:()UnmodeledInternal .cold.2(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = @"YES";
  if ((a1 & 1) == 0) {
    uint64_t v3 = @"NO";
  }
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1DA519000, log, OS_LOG_TYPE_ERROR, "Failed to set contacts editable to %@: %{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)unmodeledManagingOrganizationSettings
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_1DA519000, v0, v1, "failed to fetch local settings: %{public}@", v2, v3, v4, v5, v6);
}

@end