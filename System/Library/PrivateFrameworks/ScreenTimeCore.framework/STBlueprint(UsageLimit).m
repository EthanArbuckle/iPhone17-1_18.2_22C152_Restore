@interface STBlueprint(UsageLimit)
@end

@implementation STBlueprint(UsageLimit)

+ (void)saveUsageLimitWithIdentifier:()UsageLimit user:bundleIdentifiers:webDomains:categoryIdentifiers:dailyBudgetLimit:budgetLimitByWeekday:enabled:behaviorType:error:.cold.2()
{
  OUTLINED_FUNCTION_1_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_4_0(&dword_1DA519000, v0, v1, "Failed to serialize declaration: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)saveUsageLimitWithIdentifier:()UsageLimit user:bundleIdentifiers:webDomains:categoryIdentifiers:dailyBudgetLimit:budgetLimitByWeekday:enabled:behaviorType:error:.cold.3()
{
  OUTLINED_FUNCTION_1_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed to save changes: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)saveUsageLimitWithIdentifier:()UsageLimit user:bundleIdentifiers:webDomains:categoryIdentifiers:dailyBudgetLimit:budgetLimitByWeekday:enabled:behaviorType:error:.cold.6()
{
  OUTLINED_FUNCTION_1_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_4_0(&dword_1DA519000, v0, v1, "Failed to deserialize declaration: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)saveUsageLimitWithIdentifier:()UsageLimit user:bundleIdentifiers:webDomains:categoryIdentifiers:dailyBudgetLimit:budgetLimitByWeekday:enabled:behaviorType:error:.cold.7()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_1DA519000, v0, v1, "There should never be more than one usage limit blueprint with the same identifier: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)saveUsageLimitWithIdentifier:()UsageLimit user:bundleIdentifiers:webDomains:categoryIdentifiers:dailyBudgetLimit:budgetLimitByWeekday:enabled:behaviorType:error:.cold.8()
{
  OUTLINED_FUNCTION_1_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed to fetch existing usage limit blueprints: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)deleteUsageLimitWithIdentifier:()UsageLimit user:managedObjectContext:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed to fetch existing usage limit blueprints: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)deleteUsageLimitWithIdentifier:()UsageLimit user:managedObjectContext:error:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed to save changes: %{public}@", v2, v3, v4, v5, v6);
}

@end