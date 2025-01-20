@interface REMReminderDueDateDeltaAlertContext
- (NSArray)dueDateDeltaAlerts;
- (REMDueDateDeltaAlert)fetchedCurrentDueDateDeltaAlert;
- (REMReminder)reminder;
- (REMReminderDueDateDeltaAlertContext)initWithReminder:(id)a3;
- (void)setReminder:(id)a3;
@end

@implementation REMReminderDueDateDeltaAlertContext

- (REMReminderDueDateDeltaAlertContext)initWithReminder:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMReminderDueDateDeltaAlertContext;
  v6 = [(REMReminderDueDateDeltaAlertContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_reminder, a3);
  }

  return v7;
}

- (NSArray)dueDateDeltaAlerts
{
  v2 = [(REMReminderDueDateDeltaAlertContext *)self reminder];
  v3 = [v2 storage];
  v4 = [v3 fetchedDueDateDeltaAlerts];

  return (NSArray *)v4;
}

- (REMDueDateDeltaAlert)fetchedCurrentDueDateDeltaAlert
{
  v2 = [(REMReminderDueDateDeltaAlertContext *)self dueDateDeltaAlerts];
  v3 = [v2 lastObject];

  return (REMDueDateDeltaAlert *)v3;
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