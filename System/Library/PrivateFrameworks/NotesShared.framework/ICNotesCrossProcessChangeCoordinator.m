@interface ICNotesCrossProcessChangeCoordinator
- (ICNotesCrossProcessChangeCoordinator)initWithSourceCoordinator:(id)a3 destinationContext:(id)a4;
- (NSManagedObjectContext)destinationContext;
- (NSObject)accountsNotificationsObserver;
- (NSPersistentStoreCoordinator)sourceCoordinator;
- (id)registerForAccountNotifications;
- (id)registerForCrossProcessNotificationName:(id)a3 block:(id)a4;
- (id)registerForEditorExtensionDidSaveNotificationWithBlock:(id)a3;
- (void)dealloc;
- (void)postAccountDidChangeNotification;
- (void)postCrossProcessNotificationName:(id)a3;
- (void)postEditorExtensionDidSaveNotification;
- (void)removeCrossProcessNotificationObserver:(id)a3;
- (void)setAccountsNotificationsObserver:(id)a3;
- (void)setDestinationContext:(id)a3;
- (void)setSourceCoordinator:(id)a3;
@end

@implementation ICNotesCrossProcessChangeCoordinator

- (ICNotesCrossProcessChangeCoordinator)initWithSourceCoordinator:(id)a3 destinationContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICNotesCrossProcessChangeCoordinator;
  v9 = [(ICNotesCrossProcessChangeCoordinator *)&v14 init];
  v10 = v9;
  if (v9)
  {
    if (v7) {
      objc_storeStrong((id *)&v9->_sourceCoordinator, a3);
    }
    if (v8)
    {
      objc_storeStrong((id *)&v10->_destinationContext, a4);
      uint64_t v11 = [(ICNotesCrossProcessChangeCoordinator *)v10 registerForAccountNotifications];
      accountsNotificationsObserver = v10->_accountsNotificationsObserver;
      v10->_accountsNotificationsObserver = v11;
    }
  }

  return v10;
}

- (id)registerForAccountNotifications
{
  return [(ICNotesCrossProcessChangeCoordinator *)self registerForCrossProcessNotificationName:@"ICNotesCrossProcessAccountsDidChangeNotification" block:&__block_literal_global_4];
}

- (id)registerForCrossProcessNotificationName:(id)a3 block:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ICNotesCrossProcessChangeCoordinator registerForCrossProcessNotificationName:block:]((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
  }

  objc_super v14 = [MEMORY[0x1E4F28C40] defaultCenter];
  v15 = [MEMORY[0x1E4F28F08] mainQueue];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __86__ICNotesCrossProcessChangeCoordinator_registerForCrossProcessNotificationName_block___block_invoke;
  v20[3] = &unk_1E64A47F0;
  id v21 = v5;
  id v22 = v6;
  id v16 = v6;
  id v17 = v5;
  v18 = [v14 addObserverForName:v17 object:0 suspensionBehavior:4 queue:v15 usingBlock:v20];

  return v18;
}

- (void)registerForCrossProcessNotificationName:(uint64_t)a3 block:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (id)registerForEditorExtensionDidSaveNotificationWithBlock:(id)a3
{
  return [(ICNotesCrossProcessChangeCoordinator *)self registerForCrossProcessNotificationName:@"ICEditorExtensionDidSaveNotification" block:a3];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)ICNotesCrossProcessChangeCoordinator;
  [(ICNotesCrossProcessChangeCoordinator *)&v5 dealloc];
}

- (void)postCrossProcessNotificationName:(id)a3
{
  id v3 = a3;
  v4 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[ICNotesCrossProcessChangeCoordinator postCrossProcessNotificationName:]((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }

  uint64_t v11 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v12 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v13 = objc_msgSend(v11, "numberWithInt:", objc_msgSend(v12, "processIdentifier"));

  objc_super v14 = [MEMORY[0x1E4F28C40] defaultCenter];
  v15 = [v13 stringValue];
  [v14 postNotificationName:v3 object:v15 userInfo:0 deliverImmediately:1];
}

void __86__ICNotesCrossProcessChangeCoordinator_registerForCrossProcessNotificationName_block___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 object];
  uint64_t v4 = [v3 integerValue];

  uint64_t v5 = [MEMORY[0x1E4F28F80] processInfo];
  int v6 = [v5 processIdentifier];

  if (v4 != v6)
  {
    uint64_t v7 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __86__ICNotesCrossProcessChangeCoordinator_registerForCrossProcessNotificationName_block___block_invoke_cold_1(a1, v7, v8, v9, v10, v11, v12, v13);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)removeCrossProcessNotificationObserver:(id)a3
{
  if (a3)
  {
    id v3 = (void *)MEMORY[0x1E4F28C40];
    id v4 = a3;
    id v5 = [v3 defaultCenter];
    [v5 removeObserver:v4];
  }
}

void __71__ICNotesCrossProcessChangeCoordinator_registerForAccountNotifications__block_invoke()
{
  if (+[ICAccount clearAccountForAppleCloudKitTable])
  {
    v0 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
      __71__ICNotesCrossProcessChangeCoordinator_registerForAccountNotifications__block_invoke_cold_1(v0);
    }
  }
  v1 = +[ICNoteContext sharedContext];
  [v1 cleanupAdditionalPersistentStores];

  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"ICAccountsDidChangeNotification" object:0];

  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:*MEMORY[0x1E4F836A0] object:0];
}

- (void)postAccountDidChangeNotification
{
}

- (void)postEditorExtensionDidSaveNotification
{
}

- (NSPersistentStoreCoordinator)sourceCoordinator
{
  return self->_sourceCoordinator;
}

- (void)setSourceCoordinator:(id)a3
{
}

- (NSManagedObjectContext)destinationContext
{
  return self->_destinationContext;
}

- (void)setDestinationContext:(id)a3
{
}

- (NSObject)accountsNotificationsObserver
{
  return self->_accountsNotificationsObserver;
}

- (void)setAccountsNotificationsObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountsNotificationsObserver, 0);
  objc_storeStrong((id *)&self->_destinationContext, 0);
  objc_storeStrong((id *)&self->_sourceCoordinator, 0);
}

- (void)postCrossProcessNotificationName:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __86__ICNotesCrossProcessChangeCoordinator_registerForCrossProcessNotificationName_block___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __71__ICNotesCrossProcessChangeCoordinator_registerForAccountNotifications__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C3A61000, log, OS_LOG_TYPE_DEBUG, "Released the cached CloudKit account", v1, 2u);
}

@end