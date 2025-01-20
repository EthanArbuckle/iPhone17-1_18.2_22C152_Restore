@interface PLSocialGroupPayloadAdapter
- (BOOL)isValidForJournalPersistence;
- (BOOL)validForPersistenceChangedForChangedKeys:(id)a3;
- (PLGraphNodeContainer)nodeContainer;
- (PLSocialGroupPayloadAdapter)initWithManagedObject:(id)a3;
- (id)payloadForChangedKeys:(id)a3;
- (id)payloadID;
- (id)payloadIDForTombstone:(id)a3;
- (id)sourceObject;
- (void)setNodeContainer:(id)a3;
@end

@implementation PLSocialGroupPayloadAdapter

- (void).cxx_destruct
{
}

- (void)setNodeContainer:(id)a3
{
}

- (PLGraphNodeContainer)nodeContainer
{
  return self->_nodeContainer;
}

- (BOOL)validForPersistenceChangedForChangedKeys:(id)a3
{
  return [a3 containsObject:@"changeFlag0"];
}

- (id)payloadIDForTombstone:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"uuid"];
  v4 = +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:v3];

  return v4;
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4 = a3;
  if ([(PLSocialGroupPayloadAdapter *)self isValidForJournalPersistence])
  {
    if (v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v6 = +[PLGraphNodeContainer nodeContainerKeysByChangeFlagKey];
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      v15 = __53__PLSocialGroupPayloadAdapter_payloadForChangedKeys___block_invoke;
      v16 = &unk_1E586A2D8;
      id v17 = v6;
      id v18 = v5;
      id v7 = v5;
      id v8 = v6;
      [v4 enumerateObjectsUsingBlock:&v13];
      v9 = [PLSocialGroupJournalEntryPayload alloc];
      if (objc_msgSend(v7, "count", v13, v14, v15, v16)) {
        id v10 = v7;
      }
      else {
        id v10 = 0;
      }
      v11 = [(PLManagedObjectJournalEntryPayload *)v9 initWithInsertAdapter:self changedKeys:v10];
    }
    else
    {
      v11 = [(PLManagedObjectJournalEntryPayload *)[PLSocialGroupJournalEntryPayload alloc] initWithInsertAdapter:self changedKeys:0];
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __53__PLSocialGroupPayloadAdapter_payloadForChangedKeys___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = +[PLSocialGroupJournalEntryPayload modelProperties];
  id v4 = [v3 objectForKeyedSubscript:v7];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
    if (v5) {
      [*(id *)(a1 + 40) unionSet:v5];
    }
  }
  return MEMORY[0x1F4181820]();
}

- (id)payloadID
{
  v2 = [(PLSocialGroupPayloadAdapter *)self nodeContainer];
  v3 = [v2 uuid];
  id v4 = +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:v3];

  return v4;
}

- (BOOL)isValidForJournalPersistence
{
  v3 = [(PLJournalEntryPayloadUpdateAdapter *)self managedObject];
  int v4 = [v3 primaryLabelCode];

  return v4 == 1000
      && (([(PLGraphNodeContainer *)self->_nodeContainer socialGroupVerifiedType]+ 1) & 0xFFFFFFFD) == 0;
}

- (id)sourceObject
{
  return self->_nodeContainer;
}

- (PLSocialGroupPayloadAdapter)initWithManagedObject:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLSocialGroupPayloadAdapter;
  id v5 = [(PLJournalEntryPayloadUpdateAdapter *)&v11 initWithManagedObject:v4];
  if (v5)
  {
    id v6 = v4;
    uint64_t v7 = [v6 nodeContainerClass];
    if (v7)
    {
      id v8 = +[PLGraphNodeContainer newNodeContainerWithNode:v6 containerClass:v7];
      nodeContainer = v5->_nodeContainer;
      v5->_nodeContainer = v8;
    }
  }

  return v5;
}

@end