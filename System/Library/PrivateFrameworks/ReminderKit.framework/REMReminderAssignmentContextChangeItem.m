@interface REMReminderAssignmentContextChangeItem
- (NSMutableSet)mutableAssignments;
- (NSSet)assignments;
- (REMAssignment)currentAssignment;
- (REMReminderAssignmentContextChangeItem)initWithReminderChangeItem:(id)a3;
- (REMReminderChangeItem)reminderChangeItem;
- (id)addAssignmentWithAssignee:(id)a3 originator:(id)a4 status:(int64_t)a5;
- (id)addAssignmentWithAssigneeID:(id)a3 originatorID:(id)a4 status:(int64_t)a5;
- (void)addAssignment:(id)a3;
- (void)removeAllAssignments;
- (void)removeAssignment:(id)a3;
- (void)setMutableAssignments:(id)a3;
- (void)setReminderChangeItem:(id)a3;
@end

@implementation REMReminderAssignmentContextChangeItem

- (REMReminderAssignmentContextChangeItem)initWithReminderChangeItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMReminderAssignmentContextChangeItem;
  v6 = [(REMReminderAssignmentContextChangeItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_reminderChangeItem, a3);
  }

  return v7;
}

- (REMAssignment)currentAssignment
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  v2 = [(REMReminderAssignmentContextChangeItem *)self reminderChangeItem];
  v3 = [v2 assignments];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__REMReminderAssignmentContextChangeItem_currentAssignment__block_invoke;
  v6[3] = &unk_1E61DC168;
  v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (REMAssignment *)v4;
}

void __59__REMReminderAssignmentContextChangeItem_currentAssignment__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v5 + 40);
  v6 = (id *)(v5 + 40);
  uint64_t v7 = v8;
  id v12 = v4;
  if (v8)
  {
    [v7 orderValue];
    double v10 = v9;
    [v12 orderValue];
    if (v10 > v11) {
      goto LABEL_5;
    }
    v6 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  objc_storeStrong(v6, a2);
LABEL_5:
}

- (NSSet)assignments
{
  v2 = [(REMReminderAssignmentContextChangeItem *)self reminderChangeItem];
  v3 = [v2 assignments];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CAD0] set];
  }
  v6 = v5;

  return (NSSet *)v6;
}

- (void)addAssignment:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[REMLogStore write];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [(REMReminderAssignmentContextChangeItem *)self reminderChangeItem];
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1B9AA2000, v5, OS_LOG_TYPE_INFO, "Adding assignment {reminderChangeItem: %@, assignment: %@}", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v7 = [(REMReminderAssignmentContextChangeItem *)self reminderChangeItem];
  v8 = [v7 assignments];
  id v9 = (id)[v8 mutableCopy];

  if (!v9) {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  [v9 addObject:v4];
  double v10 = [(REMReminderAssignmentContextChangeItem *)self reminderChangeItem];
  [v10 setAssignments:v9];
}

- (id)addAssignmentWithAssignee:(id)a3 originator:(id)a4 status:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = +[REMAssignment newObjectID];
  double v10 = [REMAssignment alloc];
  int v11 = [(REMReminderAssignmentContextChangeItem *)self reminderChangeItem];
  id v12 = [v11 accountID];
  __int16 v13 = [(REMReminderAssignmentContextChangeItem *)self reminderChangeItem];
  id v14 = [v13 objectID];
  uint64_t v15 = [v8 objectID];

  v16 = [v7 objectID];

  v17 = [(REMAssignment *)v10 initWithObjectID:v9 accountID:v12 reminderID:v14 assigneeID:v15 originatorID:v16 status:a5];
  [(REMReminderAssignmentContextChangeItem *)self addAssignment:v17];

  return v17;
}

- (id)addAssignmentWithAssigneeID:(id)a3 originatorID:(id)a4 status:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = +[REMAssignment newObjectID];
  int v11 = [REMAssignment alloc];
  id v12 = [(REMReminderAssignmentContextChangeItem *)self reminderChangeItem];
  __int16 v13 = [v12 accountID];
  id v14 = [(REMReminderAssignmentContextChangeItem *)self reminderChangeItem];
  uint64_t v15 = [v14 objectID];
  v16 = [(REMAssignment *)v11 initWithObjectID:v10 accountID:v13 reminderID:v15 assigneeID:v9 originatorID:v8 status:a5];

  [(REMReminderAssignmentContextChangeItem *)self addAssignment:v16];

  return v16;
}

- (void)removeAssignment:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[REMLogStore write];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [(REMReminderAssignmentContextChangeItem *)self reminderChangeItem];
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1B9AA2000, v5, OS_LOG_TYPE_INFO, "Removing assignment {reminderChangeItem: %@, assignment: %@}", (uint8_t *)&v11, 0x16u);
  }
  id v7 = [(REMReminderAssignmentContextChangeItem *)self reminderChangeItem];
  id v8 = [v7 assignments];
  id v9 = (void *)[v8 mutableCopy];

  [v9 removeObject:v4];
  id v10 = [(REMReminderAssignmentContextChangeItem *)self reminderChangeItem];
  [v10 setAssignments:v9];
}

- (void)removeAllAssignments
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = [(REMReminderAssignmentContextChangeItem *)self reminderChangeItem];
  id v4 = [v3 assignments];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    v6 = +[REMLogStore write];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [(REMReminderAssignmentContextChangeItem *)self reminderChangeItem];
      int v10 = 138412290;
      int v11 = v7;
      _os_log_impl(&dword_1B9AA2000, v6, OS_LOG_TYPE_INFO, "Removing all assignment {reminderChangeItem: %@}", (uint8_t *)&v10, 0xCu);
    }
    id v8 = [MEMORY[0x1E4F1CAD0] set];
    id v9 = [(REMReminderAssignmentContextChangeItem *)self reminderChangeItem];
    [v9 setAssignments:v8];
  }
}

- (REMReminderChangeItem)reminderChangeItem
{
  return self->_reminderChangeItem;
}

- (void)setReminderChangeItem:(id)a3
{
}

- (NSMutableSet)mutableAssignments
{
  return self->_mutableAssignments;
}

- (void)setMutableAssignments:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableAssignments, 0);

  objc_storeStrong((id *)&self->_reminderChangeItem, 0);
}

@end