@interface REMSaveRequest(Importing)
@end

@implementation REMSaveRequest(Importing)

- (void)importRemindersFromICSData:()Importing insertIntoListChangeItem:error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_ERROR, "Failed to parse data to ICS document {error: %@}.", (uint8_t *)&v2, 0xCu);
}

- (void)_populateReminderChangeItem:()Importing withICSTodoItem:icsCalendar:isNew:withOptions:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 url];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_ERROR, "The imported ICS reminder doesn't have display order and creation time. {icsTodoItem.url: %@}", (uint8_t *)&v4, 0xCu);
}

- (void)_addAlarmsToReminderChangeItem:()Importing withICSAlarm:icsCalendar:.cold.1(uint64_t a1, void *a2)
{
  int v2 = [a2 objectID];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1B9AA2000, v3, v4, "Trying to import setting location without a proximity value. {alarmUID: %@, reminderID: %@}", v5, v6, v7, v8, v9);
}

- (void)_addAlarmsToReminderChangeItem:()Importing withICSAlarm:icsCalendar:.cold.2(uint64_t a1, void *a2)
{
  int v2 = [a2 objectID];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1B9AA2000, v3, v4, "Trying to import setting proximity without a location. {alarmUID: %@, reminderID: %@}", v5, v6, v7, v8, v9);
}

- (void)_addAlarmsToReminderChangeItem:()Importing withICSAlarm:icsCalendar:.cold.3(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a2 objectID];
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_1B9AA2000, a3, OS_LOG_TYPE_DEBUG, "Import ICS alarm and triggers to reminder {alarmUID: %@, reminderID: %@}.", v5, 0x16u);
}

@end