@interface PLJournalEntryPayloadUpdateAdapter
- (BOOL)isValidForJournalPersistence;
- (BOOL)validForPersistenceChangedForChangedKeys:(id)a3;
- (PLJournalEntryPayloadUpdateAdapter)initWithManagedObject:(id)a3;
- (id)managedObject;
- (id)payloadForChangedKeys:(id)a3;
- (id)payloadID;
- (id)payloadIDForTombstone:(id)a3;
- (id)payloadIDsByPayloadClassIDToDeleteOnInsert;
- (id)payloadsForChangedKeys:(id)a3;
- (id)sourceObject;
@end

@implementation PLJournalEntryPayloadUpdateAdapter

- (void).cxx_destruct
{
}

- (BOOL)validForPersistenceChangedForChangedKeys:(id)a3
{
  return 0;
}

- (id)payloadsForChangedKeys:(id)a3
{
  return 0;
}

- (id)payloadIDsByPayloadClassIDToDeleteOnInsert
{
  return 0;
}

- (id)payloadIDForTombstone:(id)a3
{
  return 0;
}

- (id)payloadForChangedKeys:(id)a3
{
  return 0;
}

- (id)payloadID
{
  return 0;
}

- (BOOL)isValidForJournalPersistence
{
  return 1;
}

- (id)sourceObject
{
  return self->_managedObject;
}

- (id)managedObject
{
  return self->_managedObject;
}

- (PLJournalEntryPayloadUpdateAdapter)initWithManagedObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLJournalEntryPayloadUpdateAdapter;
  v6 = [(PLJournalEntryPayloadUpdateAdapter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_managedObject, a3);
  }

  return v7;
}

@end