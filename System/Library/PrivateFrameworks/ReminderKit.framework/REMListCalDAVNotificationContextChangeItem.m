@interface REMListCalDAVNotificationContextChangeItem
- (NSArray)calDAVNotifications;
- (REMListCalDAVNotificationContextChangeItem)initWithListChangeItem:(id)a3;
- (REMListChangeItem)listChangeItem;
- (id)addCalDAVNotificationWithUUIDString:(id)a3 hostURL:(id)a4 externalIdentifier:(id)a5 externalModificationTag:(id)a6;
- (void)_addCalDAVNotification:(id)a3;
- (void)clearCalDAVNotifications;
- (void)removeCalDAVNotication:(id)a3;
- (void)setListChangeItem:(id)a3;
- (void)updateCalDAVNotification:(id)a3 withBlock:(id)a4;
@end

@implementation REMListCalDAVNotificationContextChangeItem

- (REMListCalDAVNotificationContextChangeItem)initWithListChangeItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMListCalDAVNotificationContextChangeItem;
  v6 = [(REMListCalDAVNotificationContextChangeItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_listChangeItem, a3);
  }

  return v7;
}

- (NSArray)calDAVNotifications
{
  v2 = [(REMListCalDAVNotificationContextChangeItem *)self listChangeItem];
  v3 = [v2 calDAVNotifications];
  v4 = v3;
  if (!v3) {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

- (id)addCalDAVNotificationWithUUIDString:(id)a3 hostURL:(id)a4 externalIdentifier:(id)a5 externalModificationTag:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = +[REMCalDAVNotification newObjectID];
  v15 = [REMCalDAVNotification alloc];
  v16 = self;
  v23 = self;
  v17 = [(REMListCalDAVNotificationContextChangeItem *)self listChangeItem];
  v18 = [v17 accountID];
  v19 = [(REMListCalDAVNotificationContextChangeItem *)v16 listChangeItem];
  v20 = [v19 objectID];
  id v21 = [(REMCalDAVNotification *)v15 initCalDAVNotificationWithObjectID:v14 accountID:v18 listID:v20 uuidString:v13 hostURL:v12 externalIdentifier:v11 externalModificationTag:v10];

  [(REMListCalDAVNotificationContextChangeItem *)v23 _addCalDAVNotification:v21];

  return v21;
}

- (void)_addCalDAVNotification:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[REMLogStore write];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [(REMListCalDAVNotificationContextChangeItem *)self listChangeItem];
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1B9AA2000, v5, OS_LOG_TYPE_INFO, "Adding calDAVNotification {listChangeItem: %@, calDAVNotification: %@}", (uint8_t *)&v11, 0x16u);
  }
  v7 = [(REMListCalDAVNotificationContextChangeItem *)self listChangeItem];
  v8 = [v7 calDAVNotifications];
  id v9 = (id)[v8 mutableCopy];

  if (!v9) {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  [v9 addObject:v4];
  id v10 = [(REMListCalDAVNotificationContextChangeItem *)self listChangeItem];
  [v10 setCalDAVNotifications:v9];
}

- (void)removeCalDAVNotication:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(REMListCalDAVNotificationContextChangeItem *)self listChangeItem];
  v6 = [v5 calDAVNotifications];
  v7 = (void *)[v6 mutableCopy];

  LODWORD(v6) = [v7 containsObject:v4];
  v8 = +[REMLogStore write];
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v10 = [(REMListCalDAVNotificationContextChangeItem *)self listChangeItem];
      int v11 = 138412546;
      id v12 = v10;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_1B9AA2000, v9, OS_LOG_TYPE_INFO, "Removing calDAVNotification {listChangeItem: %@, calDAVNotification: %@}", (uint8_t *)&v11, 0x16u);
    }
    [v7 removeObject:v4];
    id v9 = [(REMListCalDAVNotificationContextChangeItem *)self listChangeItem];
    [v9 setCalDAVNotifications:v7];
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[REMListCalDAVNotificationContextChangeItem removeCalDAVNotication:]();
  }
}

- (void)clearCalDAVNotifications
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = +[REMLogStore write];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(REMListCalDAVNotificationContextChangeItem *)self listChangeItem];
    int v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1B9AA2000, v3, OS_LOG_TYPE_INFO, "Removing all calDAVNotifications {listChangeItem: %@}", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [(REMListCalDAVNotificationContextChangeItem *)self listChangeItem];
  [v5 setCalDAVNotifications:MEMORY[0x1E4F1CBF0]];
}

- (void)updateCalDAVNotification:(id)a3 withBlock:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, NSObject *))a4;
  uint64_t v8 = [(REMListCalDAVNotificationContextChangeItem *)self listChangeItem];
  id v9 = [v8 calDAVNotifications];

  uint64_t v10 = [v9 indexOfObject:v6];
  if (!v9 || (uint64_t v11 = v10, v10 == 0x7FFFFFFFFFFFFFFFLL))
  {
    id v12 = +[REMLogStore write];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[REMListCalDAVNotificationContextChangeItem updateCalDAVNotification:withBlock:]();
    }
  }
  else
  {
    id v12 = [v9 objectAtIndexedSubscript:v10];
    __int16 v13 = +[REMLogStore write];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = [(REMListCalDAVNotificationContextChangeItem *)self listChangeItem];
      int v17 = 138412546;
      v18 = v14;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl(&dword_1B9AA2000, v13, OS_LOG_TYPE_INFO, "Updating calDAVNotification {listChangeItem: %@, calDAVNotification: %@}", (uint8_t *)&v17, 0x16u);
    }
    v7[2](v7, v12);
    uint64_t v15 = [(REMListCalDAVNotificationContextChangeItem *)self listChangeItem];
    v16 = [v15 changedKeysObserver];
    [v16 keyDidChange:@"calDAVNotifications"];
  }
}

- (REMListChangeItem)listChangeItem
{
  return self->_listChangeItem;
}

- (void)setListChangeItem:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)removeCalDAVNotication:.cold.1()
{
  OUTLINED_FUNCTION_7();
  v1 = [v0 listChangeItem];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_1_0(&dword_1B9AA2000, v2, v3, "Attempted to remove a calDAVNotification object that does not belong to this list {listChangeItem: %@, calDAVNotification: %@}", v4, v5, v6, v7, v8);
}

- (void)updateCalDAVNotification:withBlock:.cold.1()
{
  OUTLINED_FUNCTION_7();
  v1 = [v0 listChangeItem];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_1_0(&dword_1B9AA2000, v2, v3, "Attempted to update a calDAVNotification object that does not belong to this list {listChangeItem: %@, calDAVNotification: %@}", v4, v5, v6, v7, v8);
}

@end