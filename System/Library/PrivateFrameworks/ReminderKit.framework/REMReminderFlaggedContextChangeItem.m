@interface REMReminderFlaggedContextChangeItem
- (REMReminderChangeItem)reminderChangeItem;
- (REMReminderFlaggedContextChangeItem)initWithReminderChangeItem:(id)a3;
- (int64_t)flagged;
- (void)setFlagged:(int64_t)a3;
- (void)setReminderChangeItem:(id)a3;
@end

@implementation REMReminderFlaggedContextChangeItem

- (REMReminderFlaggedContextChangeItem)initWithReminderChangeItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMReminderFlaggedContextChangeItem;
  v6 = [(REMReminderFlaggedContextChangeItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_reminderChangeItem, a3);
  }

  return v7;
}

- (int64_t)flagged
{
  v2 = [(REMReminderFlaggedContextChangeItem *)self reminderChangeItem];
  int64_t v3 = [v2 flagged];

  return v3;
}

- (void)setFlagged:(int64_t)a3
{
  id v4 = [(REMReminderFlaggedContextChangeItem *)self reminderChangeItem];
  [v4 setFlagged:a3];
}

- (REMReminderChangeItem)reminderChangeItem
{
  return self->_reminderChangeItem;
}

- (void)setReminderChangeItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end