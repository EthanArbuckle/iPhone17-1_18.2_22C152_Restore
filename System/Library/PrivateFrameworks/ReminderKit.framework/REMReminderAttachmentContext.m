@interface REMReminderAttachmentContext
- (NSArray)attachments;
- (NSArray)fileAttachments;
- (NSArray)imageAttachments;
- (NSArray)urlAttachments;
- (REMReminder)reminder;
- (REMReminderAttachmentContext)initWithReminder:(id)a3;
- (id)attachmentsOfClass:(Class)a3;
- (void)setReminder:(id)a3;
@end

@implementation REMReminderAttachmentContext

- (REMReminderAttachmentContext)initWithReminder:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMReminderAttachmentContext;
  v6 = [(REMReminderAttachmentContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_reminder, a3);
  }

  return v7;
}

- (id)attachmentsOfClass:(Class)a3
{
  v4 = [(REMReminderAttachmentContext *)self attachments];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__REMReminderAttachmentContext_attachmentsOfClass___block_invoke;
  v8[3] = &__block_descriptor_40_e26_B24__0__REMAttachment_8_16lu32l8;
  v8[4] = a3;
  id v5 = [MEMORY[0x1E4F28F60] predicateWithBlock:v8];
  v6 = [v4 filteredArrayUsingPredicate:v5];

  return v6;
}

uint64_t __51__REMReminderAttachmentContext_attachmentsOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (NSArray)fileAttachments
{
  uint64_t v3 = objc_opt_class();

  return (NSArray *)[(REMReminderAttachmentContext *)self attachmentsOfClass:v3];
}

- (NSArray)imageAttachments
{
  uint64_t v3 = objc_opt_class();

  return (NSArray *)[(REMReminderAttachmentContext *)self attachmentsOfClass:v3];
}

- (NSArray)urlAttachments
{
  uint64_t v3 = objc_opt_class();

  return (NSArray *)[(REMReminderAttachmentContext *)self attachmentsOfClass:v3];
}

- (NSArray)attachments
{
  uint64_t v3 = [(REMReminderAttachmentContext *)self reminder];
  v4 = [v3 attachments];

  if (v4)
  {
    id v5 = [(REMReminderAttachmentContext *)self reminder];
    v6 = [v5 attachments];
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v6;
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