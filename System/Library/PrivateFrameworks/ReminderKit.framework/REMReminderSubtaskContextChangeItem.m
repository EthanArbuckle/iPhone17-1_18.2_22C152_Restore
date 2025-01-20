@interface REMReminderSubtaskContextChangeItem
- (REMReminderChangeItem)reminderChangeItem;
- (REMReminderSubtaskContextChangeItem)initWithReminderChangeItem:(id)a3;
- (id)_listChangeItem;
- (void)addReminderChangeItem:(id)a3;
- (void)insertReminderChangeItem:(id)a3 afterReminderChangeItem:(id)a4;
- (void)insertReminderChangeItem:(id)a3 beforeReminderChangeItem:(id)a4;
- (void)setReminderChangeItem:(id)a3;
- (void)undeleteSubtaskWithID:(id)a3 usingUndo:(id)a4;
@end

@implementation REMReminderSubtaskContextChangeItem

- (REMReminderSubtaskContextChangeItem)initWithReminderChangeItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMReminderSubtaskContextChangeItem;
  v6 = [(REMReminderSubtaskContextChangeItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_reminderChangeItem, a3);
  }

  return v7;
}

- (void)addReminderChangeItem:(id)a3
{
  id v4 = a3;
  id v6 = [(REMReminderSubtaskContextChangeItem *)self _listChangeItem];
  id v5 = [(REMReminderSubtaskContextChangeItem *)self reminderChangeItem];
  [v6 insertReminderChangeItem:v4 adjacentToReminderChangeItem:0 isAfter:0 withParentReminderChangeItem:v5];
}

- (void)insertReminderChangeItem:(id)a3 beforeReminderChangeItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(REMReminderSubtaskContextChangeItem *)self _listChangeItem];
  v8 = [(REMReminderSubtaskContextChangeItem *)self reminderChangeItem];
  [v9 insertReminderChangeItem:v7 adjacentToReminderChangeItem:v6 isAfter:0 withParentReminderChangeItem:v8];
}

- (void)insertReminderChangeItem:(id)a3 afterReminderChangeItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(REMReminderSubtaskContextChangeItem *)self _listChangeItem];
  v8 = [(REMReminderSubtaskContextChangeItem *)self reminderChangeItem];
  [v9 insertReminderChangeItem:v7 adjacentToReminderChangeItem:v6 isAfter:1 withParentReminderChangeItem:v8];
}

- (void)undeleteSubtaskWithID:(id)a3 usingUndo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(REMReminderSubtaskContextChangeItem *)self _listChangeItem];
  [v8 undeleteReminderWithID:v7 usingUndo:v6];

  id v12 = [(REMReminderSubtaskContextChangeItem *)self reminderChangeItem];
  id v9 = [v12 subtaskIDsToUndelete];
  v10 = [v9 setByAddingObject:v7];

  v11 = [(REMReminderSubtaskContextChangeItem *)self reminderChangeItem];
  [v11 setSubtaskIDsToUndelete:v10];
}

- (id)_listChangeItem
{
  v3 = [(REMReminderSubtaskContextChangeItem *)self reminderChangeItem];
  id v4 = [v3 saveRequest];
  id v5 = [(REMReminderSubtaskContextChangeItem *)self reminderChangeItem];
  id v6 = [v4 _updateListWithReminderChangeItem:v5];

  return v6;
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