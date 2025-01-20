@interface PLBatteryUIResponseTypeBatteryBreakdown(Utilities)
- (void)getBundleIDToDisplayNameMap;
@end

@implementation PLBatteryUIResponseTypeBatteryBreakdown(Utilities)

- (void)getDataRange:()Utilities .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1E4220000, log, OS_LOG_TYPE_DEBUG, "No first RNE entry!", v1, 2u);
}

- (void)getDataRange:()Utilities .cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1E4220000, log, OS_LOG_TYPE_DEBUG, "No first usage time entry!", v1, 2u);
}

- (void)getNodeEntriesForEntryKey:()Utilities withRange:andTimeInterval:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Querying for nodes with %{public}@", v2, v3, v4, v5, v6);
}

- (void)getBundleIDToDisplayNameMap
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "installedAppEntries=%@", v2, v3, v4, v5, v6);
}

@end