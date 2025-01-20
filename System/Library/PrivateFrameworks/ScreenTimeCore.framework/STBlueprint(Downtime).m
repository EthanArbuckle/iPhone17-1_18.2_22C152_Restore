@interface STBlueprint(Downtime)
- (void)_updateActiveOverrideAfterScheduleChange;
@end

@implementation STBlueprint(Downtime)

- (void)_updateActiveOverrideAfterScheduleChange
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed to modify active override on downtime blueprint: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)_downtimeForUser:()Downtime inContext:error:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed to fetch existing downtime blueprint: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)_downtimeForUser:()Downtime inContext:error:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_1DA519000, v0, v1, "There should never be more than one downtime blueprint: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)_userForUserID:()Downtime inContext:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_1DA519000, v0, v1, "Could not find user for ID: %@", v2, v3, v4, v5, v6);
}

+ (void)saveDowntimeForUser:()Downtime startTime:endTime:scheduleByWeekdayIndex:enabled:behaviorType:error:.cold.1(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = @"Enable";
  if ((a1 & 1) == 0) {
    uint64_t v3 = @"Disable";
  }
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_fault_impl(&dword_1DA519000, log, OS_LOG_TYPE_FAULT, "Failed to apply schedule state change: %@ - %@", (uint8_t *)&v4, 0x16u);
}

+ (void)saveDowntimeForUser:()Downtime startTime:endTime:scheduleByWeekdayIndex:enabled:behaviorType:error:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed to save downtime blueprint: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)_updatedDowntimeForUser:()Downtime startTime:endTime:scheduleByWeekdayIndex:enabled:behaviorType:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_1DA519000, v0, v1, "User has no managing organization: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)_updatedDowntimeForUser:()Downtime startTime:endTime:scheduleByWeekdayIndex:enabled:behaviorType:error:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_declarationForDowntime:()Downtime user:configuration:behaviorType:context:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_1DA519000, MEMORY[0x1E4F14500], v0, "failed to deserialize downtime configuration: %{public}@", v1, v2, v3, v4, v5);
}

+ (void)_updateConfiguration:()Downtime withDeclaration:context:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_1DA519000, v0, v1, "Failed to serialize downtime configuration: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_applyScheduleStateChange:()Downtime atDate:inCalendar:error:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_applyScheduleStateChange:()Downtime atDate:inCalendar:error:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed to save downtime schedule state change: %@", v2, v3, v4, v5, v6);
}

@end