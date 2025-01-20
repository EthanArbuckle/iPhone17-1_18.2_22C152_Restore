@interface SearchUICreateReminderHandler
- (unint64_t)destination;
- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5;
@end

@implementation SearchUICreateReminderHandler

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  v5 = [a3 reminder];
  if (v5)
  {
    v6 = objc_opt_new();
    v7 = [MEMORY[0x1E4F25600] reminderWithEventStore:v6];
    v8 = [v5 title];
    [v7 setTitle:v8];

    v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v10 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
    v11 = [v5 dueDate];
    v12 = [v9 componentsInTimeZone:v10 fromDate:v11];
    [v7 setDueDateComponents:v12];

    v13 = [v5 notes];
    [v7 setNotes:v13];

    v14 = [v6 defaultCalendarForNewReminders];
    [v7 setCalendar:v14];

    v15 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
    [v7 setTimeZone:v15];

    id v23 = 0;
    [v6 saveReminder:v7 commit:1 error:&v23];
    id v16 = v23;
    if (v16)
    {
      v17 = SearchUITapLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[SearchUICreateReminderHandler performCommand:triggerEvent:environment:](v16, v17);
      }
    }
    else
    {
      id v18 = objc_alloc(MEMORY[0x1E4F1CB10]);
      v19 = NSString;
      v20 = [v7 calendarItemIdentifier];
      v21 = [v19 stringWithFormat:@"x-apple-reminderkit://REMCDReminder/%@", v20];
      v17 = [v18 initWithString:v21];

      v22 = [MEMORY[0x1E4F9A2F8] punchoutWithURL:v17];
      +[SearchUIUtilities openPunchout:v22];
    }
  }
  else
  {
    v6 = SearchUITapLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SearchUICreateReminderHandler performCommand:triggerEvent:environment:](v6);
    }
  }
}

- (unint64_t)destination
{
  return 2;
}

- (void)performCommand:(os_log_t)log triggerEvent:environment:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E45B5000, log, OS_LOG_TYPE_ERROR, "Error performing SFCreateReminderCommand: No reminder details provided.", v1, 2u);
}

- (void)performCommand:(void *)a1 triggerEvent:(NSObject *)a2 environment:.cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 localizedDescription];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1E45B5000, a2, OS_LOG_TYPE_ERROR, "Error while creating new calendar event: %@", (uint8_t *)&v4, 0xCu);
}

@end