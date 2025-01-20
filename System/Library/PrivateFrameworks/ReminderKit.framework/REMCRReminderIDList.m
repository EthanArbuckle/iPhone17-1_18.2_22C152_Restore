@interface REMCRReminderIDList
+ (NSString)cdEntityName;
+ (id)listFromSerializedData:(id)a3 replica:(id)a4;
+ (id)newObjectID;
+ (id)objectIDWithUUID:(id)a3;
- (BOOL)wantsUndoCommands;
- (CRDocument)document;
- (NSMutableOrderedSet)reminderIDsProxy;
- (NSUUID)replica;
- (REMCRReminderIDList)init;
- (REMCRReminderIDList)initWithDocument:(id)a3 objectID:(id)a4;
- (REMCRReminderIDListDelegate)delegate;
- (REMObjectID)remObjectID;
- (id)_orderedSet;
- (id)copyForReplica:(id)a3;
- (id)objectInReminderIDsAtIndex:(unint64_t)a3;
- (unint64_t)countOfReminderIDs;
- (unint64_t)indexInReminderIDsOfObject:(id)a3;
- (void)addReminder:(id)a3;
- (void)addUndoCommandsForObject:(id)a3 block:(id)a4;
- (void)insertObject:(id)a3 inReminderIDsAtIndex:(unint64_t)a4;
- (void)mergeWith:(id)a3;
- (void)removeObjectFromReminderIDsAtIndex:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDocument:(id)a3;
- (void)setRemObjectID:(id)a3;
@end

@implementation REMCRReminderIDList

- (REMCRReminderIDList)init
{
  v3 = [CRTTCompatibleDocument alloc];
  v4 = [MEMORY[0x1E4F29128] UUID];
  v5 = [(CRDocument *)v3 initWithReplica:v4];

  v6 = [[CRTombstoneOrderedSet alloc] initWithDocument:v5];
  [(CRDocument *)v5 setRootObject:v6];

  id v7 = +[REMList newObjectID];
  v8 = [(REMCRReminderIDList *)self initWithDocument:v5 objectID:v7];

  return v8;
}

- (REMCRReminderIDList)initWithDocument:(id)a3 objectID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)REMCRReminderIDList;
  v9 = [(REMCRReminderIDList *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_remObjectID, a4);
    objc_storeStrong((id *)&v10->_document, a3);
    uint64_t v11 = [v7 rootObject];
    reminderIDsStorage = v10->_reminderIDsStorage;
    v10->_reminderIDsStorage = (CRTombstoneOrderedSet *)v11;

    [(CRTombstoneOrderedSet *)v10->_reminderIDsStorage setDelegate:v10];
    uint64_t v13 = [v7 replica];
    replica = v10->_replica;
    v10->_replica = (NSUUID *)v13;
  }
  return v10;
}

+ (id)listFromSerializedData:(id)a3 replica:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  +[REMObjectID rem_registerClassAtCRCoderIfNeeded];
  id v7 = +[CRDocument unarchiveFromData:v6 replica:v5];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = +[REMLog crdt];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      +[REMCRReminderIDList listFromSerializedData:replica:]((uint64_t)v7, v12);
    }
  }
  id v8 = [REMCRReminderIDList alloc];
  id v9 = +[REMList newObjectID];
  v10 = [(REMCRReminderIDList *)v8 initWithDocument:v7 objectID:v9];

  return v10;
}

- (id)copyForReplica:(id)a3
{
  id v4 = a3;
  id v5 = [(REMCRReminderIDList *)self document];
  id v6 = (void *)[v5 copyForReplica:v4];

  id v7 = [REMCRReminderIDList alloc];
  id v8 = [(REMCRReminderIDList *)self remObjectID];
  id v9 = [(REMCRReminderIDList *)v7 initWithDocument:v6 objectID:v8];

  return v9;
}

- (void)addReminder:(id)a3
{
  id v4 = a3;
  id v6 = [(REMCRReminderIDList *)self reminderIDsProxy];
  id v5 = [v4 objectID];

  [v6 addObject:v5];
}

- (void)mergeWith:(id)a3
{
  id v4 = a3;
  id v6 = [(REMCRReminderIDList *)self document];
  id v5 = [v4 document];

  [v6 mergeWithDocument:v5];
}

- (NSMutableOrderedSet)reminderIDsProxy
{
  return (NSMutableOrderedSet *)[(REMCRReminderIDList *)self mutableOrderedSetValueForKey:@"reminderIDs"];
}

- (unint64_t)countOfReminderIDs
{
  return [(CRTombstoneOrderedSet *)self->_reminderIDsStorage count];
}

- (id)objectInReminderIDsAtIndex:(unint64_t)a3
{
  return [(CRTombstoneOrderedSet *)self->_reminderIDsStorage objectAtIndex:a3];
}

- (unint64_t)indexInReminderIDsOfObject:(id)a3
{
  return [(CRTombstoneOrderedSet *)self->_reminderIDsStorage indexOfEqualObject:a3];
}

- (void)insertObject:(id)a3 inReminderIDsAtIndex:(unint64_t)a4
{
}

- (void)removeObjectFromReminderIDsAtIndex:(unint64_t)a3
{
}

- (id)_orderedSet
{
  return self->_reminderIDsStorage;
}

- (void)addUndoCommandsForObject:(id)a3 block:(id)a4
{
  id v5 = a4;
  id v6 = [(REMCRReminderIDList *)self delegate];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__REMCRReminderIDList_addUndoCommandsForObject_block___block_invoke;
  v8[3] = &unk_1E61DDC20;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 addUndoCommandsForList:self block:v8];
}

void __54__REMCRReminderIDList_addUndoCommandsForObject_block___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 remObjectID];
  id v5 = [*(id *)(a1 + 32) remObjectID];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = [v3 _orderedSet];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    id v9 = +[REMLog crdt];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      __54__REMCRReminderIDList_addUndoCommandsForObject_block___block_invoke_cold_1((uint64_t)v3, v9);
    }
  }
}

- (BOOL)wantsUndoCommands
{
  v2 = [(REMCRReminderIDList *)self delegate];
  char v3 = [v2 wantsUndoCommands];

  return v3;
}

+ (id)newObjectID
{
  char v3 = [MEMORY[0x1E4F29128] UUID];
  id v4 = [a1 objectIDWithUUID:v3];

  return v4;
}

+ (id)objectIDWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [a1 cdEntityName];
  int v6 = +[REMObjectID objectIDWithUUID:v4 entityName:v5];

  return v6;
}

+ (NSString)cdEntityName
{
  return (NSString *)&stru_1F1339A18;
}

- (REMCRReminderIDListDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (REMCRReminderIDListDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSUUID)replica
{
  return self->_replica;
}

- (CRDocument)document
{
  return self->_document;
}

- (void)setDocument:(id)a3
{
}

- (REMObjectID)remObjectID
{
  return self->_remObjectID;
}

- (void)setRemObjectID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remObjectID, 0);
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_replica, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_reminderIDsStorage, 0);
}

+ (void)listFromSerializedData:(uint64_t)a1 replica:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_FAULT, "rem_log_fault_if (![document isKindOfClass:[CRTTCompatibleDocument class]]) -- Unexpected class for deserialized document for REMCRReminderIDList {document: %@}", (uint8_t *)&v2, 0xCu);
}

void __54__REMCRReminderIDList_addUndoCommandsForObject_block___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_FAULT, "An unexpected list is passed to the undo block which does not match the originating list. Passed in: %@", (uint8_t *)&v2, 0xCu);
}

@end