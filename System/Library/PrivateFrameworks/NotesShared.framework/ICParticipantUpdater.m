@interface ICParticipantUpdater
- (ICParticipantUpdater)initWithManagedObjectContext:(id)a3;
- (NSManagedObjectContext)managedObjectContext;
- (OS_dispatch_queue)serialQueue;
- (id)missingNoteObjectsIDs;
- (void)deleteOrphanedParticipantsWithCompletion:(id)a3;
- (void)insertMissingParticipantsWithCompletion:(id)a3;
- (void)insertParticipantsForNoteObjectID:(id)a3;
- (void)missingNoteObjectsIDs;
- (void)setSerialQueue:(id)a3;
- (void)updateWithCompletion:(id)a3;
@end

@implementation ICParticipantUpdater

- (ICParticipantUpdater)initWithManagedObjectContext:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICParticipantUpdater;
  v6 = [(ICParticipantUpdater *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_managedObjectContext, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_DEFAULT, -1);

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.notes.participant-updater-background", v9);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v10;
  }
  return v7;
}

- (void)updateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __45__ICParticipantUpdater_updateWithCompletion___block_invoke;
  v14[3] = &unk_1E64A4240;
  v6 = v5;
  v15 = v6;
  [(ICParticipantUpdater *)self deleteOrphanedParticipantsWithCompletion:v14];
  dispatch_group_enter(v6);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __45__ICParticipantUpdater_updateWithCompletion___block_invoke_2;
  v12[3] = &unk_1E64A4240;
  objc_super v13 = v6;
  v7 = v6;
  [(ICParticipantUpdater *)self insertMissingParticipantsWithCompletion:v12];
  v8 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__ICParticipantUpdater_updateWithCompletion___block_invoke_3;
  block[3] = &unk_1E64A56A0;
  id v11 = v4;
  id v9 = v4;
  dispatch_group_notify(v7, v8, block);
}

void __45__ICParticipantUpdater_updateWithCompletion___block_invoke(uint64_t a1)
{
}

void __45__ICParticipantUpdater_updateWithCompletion___block_invoke_2(uint64_t a1)
{
}

uint64_t __45__ICParticipantUpdater_updateWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)insertMissingParticipantsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(ICParticipantUpdater *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__ICParticipantUpdater_insertMissingParticipantsWithCompletion___block_invoke;
  v7[3] = &unk_1E64A4F70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __64__ICParticipantUpdater_insertMissingParticipantsWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__ICParticipantUpdater_insertMissingParticipantsWithCompletion___block_invoke_2;
  v4[3] = &unk_1E64A4240;
  v4[4] = *(void *)(a1 + 32);
  [v2 performBlockAndWait:v4];

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __64__ICParticipantUpdater_insertMissingParticipantsWithCompletion___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) missingNoteObjectsIDs];
  v3 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __64__ICParticipantUpdater_insertMissingParticipantsWithCompletion___block_invoke_2_cold_1(v2);
  }

  id v4 = [v2 allObjects];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__ICParticipantUpdater_insertMissingParticipantsWithCompletion___block_invoke_4;
  v6[3] = &unk_1E64A74B0;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v2;
  id v5 = v2;
  [v4 enumerateObjectsUsingBlock:v6];
}

void __64__ICParticipantUpdater_insertMissingParticipantsWithCompletion___block_invoke_4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  [*(id *)(a1 + 32) insertParticipantsForNoteObjectID:a2];
  if (a3 && !(a3 % 5) || [*(id *)(a1 + 40) count] - 1 == a3)
  {
    id v5 = [*(id *)(a1 + 32) managedObjectContext];
    objc_msgSend(v5, "ic_save");

    id v6 = [*(id *)(a1 + 32) managedObjectContext];
    [v6 reset];

    id v7 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __64__ICParticipantUpdater_insertMissingParticipantsWithCompletion___block_invoke_4_cold_1(a3, v7);
    }
  }
}

- (void)deleteOrphanedParticipantsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(ICParticipantUpdater *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__ICParticipantUpdater_deleteOrphanedParticipantsWithCompletion___block_invoke;
  v7[3] = &unk_1E64A4F70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __65__ICParticipantUpdater_deleteOrphanedParticipantsWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__ICParticipantUpdater_deleteOrphanedParticipantsWithCompletion___block_invoke_2;
  v4[3] = &unk_1E64A4240;
  v4[4] = *(void *)(a1 + 32);
  [v2 performBlockAndWait:v4];

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __65__ICParticipantUpdater_deleteOrphanedParticipantsWithCompletion___block_invoke_2(uint64_t a1)
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"note.serverShareData == nil"];
  v16[0] = v2;
  v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"note.folder.serverShareData == nil"];
  v16[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];

  id v5 = +[ICFolder ancestorFolderPredicatesWithBlock:&__block_literal_global_43];
  id v6 = [v4 arrayByAddingObjectsFromArray:v5];

  id v7 = +[ICNoteParticipant fetchRequest];
  id v8 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v6];
  [v7 setPredicate:v8];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v7];
  [v9 setResultType:2];
  dispatch_queue_t v10 = [*(id *)(a1 + 32) managedObjectContext];
  id v15 = 0;
  id v11 = [v10 executeRequest:v9 error:&v15];
  id v12 = v15;

  if (v12)
  {
    objc_super v13 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __65__ICParticipantUpdater_deleteOrphanedParticipantsWithCompletion___block_invoke_2_cold_2();
    }
  }
  v14 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    __65__ICParticipantUpdater_deleteOrphanedParticipantsWithCompletion___block_invoke_2_cold_1(v11);
  }
}

uint64_t __65__ICParticipantUpdater_deleteOrphanedParticipantsWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"note.folder.%K.serverShareData == nil", a2);
}

- (void)insertParticipantsForNoteObjectID:(id)a3
{
  id v4 = a3;
  id v5 = [(ICParticipantUpdater *)self managedObjectContext];
  id v6 = objc_msgSend(v5, "ic_existingObjectWithID:", v4);

  id v7 = [v6 serverShareCheckingParent];
  id v8 = objc_msgSend(v7, "ic_acceptedParticipants");

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__ICParticipantUpdater_insertParticipantsForNoteObjectID___block_invoke;
  v11[3] = &unk_1E64A74F8;
  v11[4] = self;
  id v9 = objc_msgSend(v8, "ic_map:", v11);
  dispatch_queue_t v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
  [v6 setParticipants:v10];
}

ICNoteParticipant *__58__ICParticipantUpdater_insertParticipantsForNoteObjectID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [ICNoteParticipant alloc];
  id v5 = [*(id *)(a1 + 32) managedObjectContext];
  id v6 = [(ICNoteParticipant *)v4 initWithContext:v5];

  id v7 = [v3 userIdentity];
  id v8 = [v7 userRecordID];
  id v9 = [v8 recordName];
  [(ICNoteParticipant *)v6 setUserID:v9];

  dispatch_queue_t v10 = [v3 participantID];

  [(ICNoteParticipant *)v6 setParticipantID:v10];
  return v6;
}

- (id)missingNoteObjectsIDs
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(ICParticipantUpdater *)self managedObjectContext];
  id v4 = +[ICNote predicateForVisibleNotesInContext:v3];

  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"serverShareData != nil"];
  v24[0] = v5;
  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"folder.serverShareData != nil"];
  v24[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];

  id v8 = +[ICFolder ancestorFolderPredicatesWithBlock:&__block_literal_global_30];
  id v9 = [v7 arrayByAddingObjectsFromArray:v8];

  dispatch_queue_t v10 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v9];
  id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"participants.@count == 0"];
  id v12 = +[ICNote fetchRequest];
  objc_super v13 = (void *)MEMORY[0x1E4F28BA0];
  v23[0] = v4;
  v23[1] = v10;
  v23[2] = v11;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
  id v15 = [v13 andPredicateWithSubpredicates:v14];
  [v12 setPredicate:v15];

  [v12 setResultType:1];
  v16 = [(ICParticipantUpdater *)self managedObjectContext];
  id v22 = 0;
  v17 = [v16 executeFetchRequest:v12 error:&v22];
  id v18 = v22;

  if (v18)
  {
    v19 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[ICParticipantUpdater missingNoteObjectsIDs]();
    }
  }
  v20 = [MEMORY[0x1E4F1CAD0] setWithArray:v17];

  return v20;
}

uint64_t __45__ICParticipantUpdater_missingNoteObjectsIDs__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"folder.%K.serverShareData != nil", a2);
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

void __64__ICParticipantUpdater_insertMissingParticipantsWithCompletion___block_invoke_2_cold_1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v1, v2, "found %lu shared notes with missing participants", v3, v4, v5, v6, v7);
}

void __64__ICParticipantUpdater_insertMissingParticipantsWithCompletion___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1 + 1;
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "updated participant associations for %lu shared note(s)", (uint8_t *)&v2, 0xCu);
}

void __65__ICParticipantUpdater_deleteOrphanedParticipantsWithCompletion___block_invoke_2_cold_1(void *a1)
{
  uint64_t v1 = [a1 result];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "%@ orphaned participant records deleted", v4, v5, v6, v7, v8);
}

void __65__ICParticipantUpdater_deleteOrphanedParticipantsWithCompletion___block_invoke_2_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_ERROR, "Error deleting orphaned participants: %@", v1, 0xCu);
}

- (void)missingNoteObjectsIDs
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_ERROR, "Error fetching shared note object IDs: %@", v1, 0xCu);
}

@end