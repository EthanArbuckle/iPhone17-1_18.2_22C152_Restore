@interface REMExporting(ICSExport)
@end

@implementation REMExporting(ICSExport)

+ (void)_icsCalendarItemsFromReminders:()ICSExport exportingOption:.cold.1(uint64_t a1, uint64_t a2)
{
  v2 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(a1, a2), "description");
  OUTLINED_FUNCTION_4_4((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_1_4(&dword_1B9AA2000, v3, v4, "Couldn't create ICSComponents for reminder %@");
}

+ (void)icsTodoFromReminder:()ICSExport exportingOption:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_ERROR, "Couldn't update the calendar item components of reminder.", v1, 2u);
}

+ (void)icsTodoFromReminder:()ICSExport exportingOption:.cold.2(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 timeZone];
  v5 = [a1 objectID];
  int v6 = 138412546;
  v7 = v4;
  __int16 v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_ERROR, "Failed to obtain an NSTimeZone from reminder.timeZone when exporting due date components to ICS {timeZoneString: %@, reminderID: %@}.", (uint8_t *)&v6, 0x16u);
}

+ (void)icsTodoFromReminder:()ICSExport exportingOption:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_ERROR, "Failed to parse reminder.importedICSData to an ICS document {error: %@}.", (uint8_t *)&v2, 0xCu);
}

+ (void)_updateICSComponentWithReminder:()ICSExport icsCalendarItem:.cold.1(uint64_t a1, uint64_t a2)
{
  int v2 = [NSNumber numberWithInteger:a2];
  OUTLINED_FUNCTION_4_4((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_1_4(&dword_1B9AA2000, v3, v4, "Encountered an unknown REMWeekday: %@");
}

+ (void)_updateICSComponentWithReminder:()ICSExport icsCalendarItem:.cold.2(uint64_t a1, uint64_t a2)
{
  int v2 = [NSNumber numberWithInteger:a2];
  OUTLINED_FUNCTION_4_4((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_1_4(&dword_1B9AA2000, v3, v4, "Encountered an unknown calendar frequency: %@");
}

+ (void)_updateICSComponentWithReminder:()ICSExport icsCalendarItem:.cold.3(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_ERROR, "UpdateICSStructuredLocationFromREMStructuredLocation dropping mapkit handle because it exceeds the max length restriction on many servers.", buf, 2u);
}

+ (void)_updateICSComponentWithReminder:()ICSExport icsCalendarItem:.cold.4(uint64_t a1, uint64_t a2)
{
  int v2 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(a1, a2), "objectID");
  OUTLINED_FUNCTION_4_4((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_1_4(&dword_1B9AA2000, v3, v4, "AlarmUID was not set, generating one when exporting to ICS {remObjectID: %@}.");
}

+ (void)_updateICSComponentWithReminder:()ICSExport icsCalendarItem:.cold.5(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_FAULT, "rem_log_fault_if (REMIsInvalidICSAlarmDateComponents(remAlarmDateTrigger.dateComponents)) -- ReminderKit does not create nor import invalid alarm trigger date in alarms.", buf, 2u);
}

+ (void)_updateICSComponentWithReminder:()ICSExport icsCalendarItem:.cold.6(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_2_2(a1, a2);
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  OUTLINED_FUNCTION_4_4((uint64_t)v5, 5.7779e-34);
  _os_log_fault_impl(&dword_1B9AA2000, v2, OS_LOG_TYPE_FAULT, "Unexpected type of REMAlarmTrigger (%@), unable to export to ICSAlarm.", v3, 0xCu);
}

@end