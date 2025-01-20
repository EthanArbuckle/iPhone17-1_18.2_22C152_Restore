@interface REMReminderHashtagContext
- (NSSet)hashtags;
- (REMReminder)reminder;
- (REMReminderHashtagContext)initWithReminder:(id)a3;
- (void)setReminder:(id)a3;
@end

@implementation REMReminderHashtagContext

- (REMReminderHashtagContext)initWithReminder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)REMReminderHashtagContext;
  v5 = [(REMReminderHashtagContext *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_reminder, v4);
  }

  return v6;
}

- (NSSet)hashtags
{
  v3 = [(REMReminderHashtagContext *)self reminder];
  id v4 = [v3 hashtags];

  if (v4)
  {
    v5 = [(REMReminderHashtagContext *)self reminder];
    v6 = [v5 hashtags];
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