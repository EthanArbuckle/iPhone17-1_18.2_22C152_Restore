@interface STBlueprint(Restrictions)
@end

@implementation STBlueprint(Restrictions)

+ (void)disableRestrictionsBlueprintForUser:()Restrictions error:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed to fetch existing restrictions blueprint: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)disableRestrictionsBlueprintForUser:()Restrictions error:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "failed to disable restrictions blueprint: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)disableRestrictionsBlueprintForUser:()Restrictions error:.cold.4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1DA519000, log, OS_LOG_TYPE_DEBUG, "Disabling restrictions blueprint.", v1, 2u);
}

- (void)permitWebFilterURL:()Restrictions pageTitle:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Unknown web filter state: %@", v2, v3, v4, v5, v6);
}

- (void)permitWebFilterURL:()Restrictions pageTitle:error:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "permitWebFilterURL: called but the web filter is not active: %@", v2, v3, v4, v5, v6);
}

+ (void)saveRestrictionsBlueprintWithValuesForPresetRestrictions:()Restrictions forUser:error:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "failed to save restrictions blueprint: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)saveRestrictionsBlueprintWithValuesForPresetRestrictions:()Restrictions forUser:error:.cold.4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1DA519000, log, OS_LOG_TYPE_DEBUG, "Saving restrictions blueprint with preset restrictions.", v1, 2u);
}

+ (void)saveRestrictionsBlueprintWithValuesForPresetRestrictions:()Restrictions forUser:error:.cold.5()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_1DA519000, v0, OS_LOG_TYPE_FAULT, "failed to serialize restrictions during save: %{public}@", v1, 0xCu);
}

+ (void)saveRestrictionsBlueprintWithValuesForPresetRestrictions:()Restrictions forUser:error:.cold.6(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1DA519000, a2, OS_LOG_TYPE_DEBUG, "Saving restrictions blueprint from presets to organization: %@", v3, 0xCu);
}

@end