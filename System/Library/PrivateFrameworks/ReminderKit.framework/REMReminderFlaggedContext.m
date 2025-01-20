@interface REMReminderFlaggedContext
- (REMReminder)reminder;
- (REMReminderFlaggedContext)initWithReminder:(id)a3;
- (int64_t)flagged;
- (void)setReminder:(id)a3;
@end

@implementation REMReminderFlaggedContext

- (REMReminderFlaggedContext)initWithReminder:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMReminderFlaggedContext;
  v6 = [(REMReminderFlaggedContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_reminder, a3);
  }

  return v7;
}

- (int64_t)flagged
{
  v3 = [(REMReminderFlaggedContext *)self reminder];
  uint64_t v4 = [v3 flagged];

  if (!v4) {
    return 0;
  }
  id v5 = [(REMReminderFlaggedContext *)self reminder];
  int64_t v6 = [v5 flagged];

  return v6;
}

- (REMReminder)reminder
{
  return self->_reminder;
}

- (void)setReminder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end