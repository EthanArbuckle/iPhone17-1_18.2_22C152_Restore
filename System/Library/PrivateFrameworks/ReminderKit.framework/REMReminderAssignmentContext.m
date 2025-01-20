@interface REMReminderAssignmentContext
- (NSSet)assignments;
- (REMAssignment)currentAssignment;
- (REMReminder)reminder;
- (REMReminderAssignmentContext)initWithReminder:(id)a3;
- (void)setReminder:(id)a3;
@end

@implementation REMReminderAssignmentContext

- (REMReminderAssignmentContext)initWithReminder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)REMReminderAssignmentContext;
  v5 = [(REMReminderAssignmentContext *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_reminder, v4);
  }

  return v6;
}

- (REMAssignment)currentAssignment
{
  v2 = [(REMReminderAssignmentContext *)self reminder];
  v3 = [v2 storage];
  id v4 = [v3 currentAssignment];

  return (REMAssignment *)v4;
}

- (NSSet)assignments
{
  v3 = [(REMReminderAssignmentContext *)self reminder];
  id v4 = [v3 assignments];

  if (v4)
  {
    v5 = [(REMReminderAssignmentContext *)self reminder];
    v6 = [v5 assignments];
  }
  else
  {
    v6 = [MEMORY[0x1E4F1CAD0] set];
  }

  return (NSSet *)v6;
}

- (REMReminder)reminder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_reminder);

  return (REMReminder *)WeakRetained;
}

- (void)setReminder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end