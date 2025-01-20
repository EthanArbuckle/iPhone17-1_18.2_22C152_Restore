@interface CRDocument
+ (CRDocument)documentWithReplica:(id)a3;
+ (CRDocument)documentWithRootObject:(id)a3 replica:(id)a4;
+ (id)unarchiveFromData:(id)a3 replica:(id)a4;
- (CRDocument)init;
- (CRDocument)initWithReplica:(id)a3;
- (CRDocument)initWithVersion:(id)a3 rootObject:(id)a4 replica:(id)a5;
- (CRDocument)initWithVersion:(id)a3 startVersion:(id)a4 rootObject:(id)a5 replica:(id)a6;
- (CRVectorTimestamp)startVersion;
- (CRVectorTimestamp)version;
- (NSMutableDictionary)objects;
- (NSString)description;
- (NSUUID)replica;
- (id)archivedData;
- (id)clockElementListForReplicaUUID:(id)a3;
- (id)copyForReplica:(id)a3;
- (id)deltaSince:(id)a3;
- (id)localObject:(id)a3;
- (id)rootObject;
- (int64_t)replicaClock;
- (int64_t)unserializedReplicaClock;
- (unint64_t)mergeResultForMergingWithDocument:(id)a3;
- (unint64_t)mergeWithData:(id)a3;
- (unint64_t)mergeWithDocument:(id)a3;
- (void)mergeTimestampWithDocument:(id)a3;
- (void)realizeLocalChanges;
- (void)setDocumentFor:(id)a3;
- (void)setRootObject:(id)a3;
- (void)setUnserializedReplicaClock:(int64_t)a3;
- (void)updateGraphDocumentPointers;
- (void)updateObjectsSet;
- (void)walkGraph:(id)a3 root:(id)a4;
@end

@implementation CRDocument

- (id)clockElementListForReplicaUUID:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(CRDocument *)self realizeLocalChanges];
  v5 = [(CRDocument *)self version];
  v6 = [v5 clockElementForUUID:v4];

  if (v6)
  {
    v7 = [REMClockElementList alloc];
    v11[0] = v6;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    v9 = [(REMClockElementList *)v7 initWithCRVectorTimestampElements:v8];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (CRDocument)documentWithReplica:(id)a3
{
  id v3 = a3;
  id v4 = [CRDocument alloc];
  v5 = objc_alloc_init(CRVectorTimestamp);
  v6 = [(CRDocument *)v4 initWithVersion:v5 rootObject:0 replica:v3];

  return v6;
}

+ (CRDocument)documentWithRootObject:(id)a3 replica:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [CRDocument alloc];
  v8 = objc_alloc_init(CRVectorTimestamp);
  v9 = [(CRDocument *)v7 initWithVersion:v8 rootObject:v6 replica:v5];

  return v9;
}

- (CRDocument)init
{
  id v3 = [MEMORY[0x1E4F29128] UUID];
  id v4 = [(CRDocument *)self initWithReplica:v3];

  return v4;
}

- (CRDocument)initWithReplica:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(CRVectorTimestamp);
  id v6 = [(CRDocument *)self initWithVersion:v5 startVersion:0 rootObject:0 replica:v4];

  return v6;
}

- (CRDocument)initWithVersion:(id)a3 rootObject:(id)a4 replica:(id)a5
{
  return [(CRDocument *)self initWithVersion:a3 startVersion:0 rootObject:a4 replica:a5];
}

- (CRDocument)initWithVersion:(id)a3 startVersion:(id)a4 rootObject:(id)a5 replica:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CRDocument;
  v15 = [(CRDocument *)&v21 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_version, a3);
    uint64_t v17 = [(CRVectorTimestamp *)v16->_version clockForUUID:v14];
    v16->_replicaClock = v17;
    v16->_unserializedReplicaClock = v17;
    objc_storeStrong((id *)&v16->_startVersion, a4);
    if (v13) {
      objc_storeStrong(&v16->_rootObject, a5);
    }
    objc_storeStrong((id *)&v16->_replica, a6);
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objects = v16->_objects;
    v16->_objects = v18;
  }
  return v16;
}

- (void)setRootObject:(id)a3
{
  id v5 = a3;
  if (self->_rootObject != v5)
  {
    objc_storeStrong(&self->_rootObject, a3);
    [(CRDocument *)self setDocumentFor:v5];
  }
}

- (id)copyForReplica:(id)a3
{
  id v4 = a3;
  id v5 = [(CRDocument *)self archivedData];
  id v6 = +[CRDocument unarchiveFromData:v5 replica:v4];

  return v6;
}

- (id)archivedData
{
  [(CRDocument *)self realizeLocalChanges];

  return +[CRCoderArchiver encodedDataWithDocument:self];
}

+ (id)unarchiveFromData:(id)a3 replica:(id)a4
{
  return +[CRCoderUnarchiver decodedDocumentFromData:a3 replica:a4];
}

- (id)localObject:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_1F138D8B0])
  {
    id v5 = [(CRDocument *)self objects];
    id v6 = [v4 identity];
    v7 = [v5 objectForKeyedSubscript:v6];

    if (v7) {
      v8 = v7;
    }
    else {
      v8 = v4;
    }
    id v9 = v8;

    id v4 = v9;
  }

  return v4;
}

- (unint64_t)mergeResultForMergingWithDocument:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 startVersion];
  if (!v5) {
    goto LABEL_3;
  }
  id v6 = (void *)v5;
  v7 = [v4 startVersion];
  v8 = [(CRDocument *)self version];
  char v9 = [v7 compare:v8];

  if ((v9 & 4) != 0)
  {
    unint64_t v13 = 0;
  }
  else
  {
LABEL_3:
    v10 = [(CRDocument *)self version];
    id v11 = [v4 version];
    char v12 = [v10 compare:v11];

    if (v12) {
      unint64_t v13 = 2;
    }
    else {
      unint64_t v13 = 1;
    }
  }

  return v13;
}

- (void)mergeTimestampWithDocument:(id)a3
{
  id v4 = a3;
  id v6 = [(CRDocument *)self version];
  uint64_t v5 = [v4 version];

  [v6 mergeWith:v5];
}

- (unint64_t)mergeWithData:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CRDocument *)self replica];
  id v6 = +[CRDocument unarchiveFromData:v4 replica:v5];

  [(CRDocument *)self realizeLocalChanges];
  unint64_t v7 = [(CRDocument *)self mergeResultForMergingWithDocument:v6];
  if (v7 == 2)
  {
    id v27 = v4;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v8 = [(CRDocument *)self objects];
    char v9 = (void *)[v8 copy];
    v10 = [v9 objectEnumerator];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v29;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v28 + 1) + 8 * v14);
          v16 = [v6 objects];
          uint64_t v17 = [v15 identity];
          v18 = [v16 objectForKeyedSubscript:v17];
          [v15 mergeWith:v18];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v12);
    }

    v19 = [(CRDocument *)self rootObject];
    v20 = [v6 rootObject];
    [v19 mergeWith:v20];

    [(CRDocument *)self mergeTimestampWithDocument:v6];
    objc_super v21 = [(CRDocument *)self version];
    v22 = [(CRDocument *)self replica];
    uint64_t v23 = [v21 clockForUUID:v22];
    int64_t v24 = [(CRDocument *)self replicaClock];

    id v4 = v27;
    if (v23 != v24)
    {
      v25 = +[REMLog crdt];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[CRDocument mergeWithData:](self);
      }
    }
    [(CRDocument *)self updateGraphDocumentPointers];
    [(CRDocument *)self updateObjectsSet];
    unint64_t v7 = 2;
  }

  return v7;
}

- (void)walkGraph:(id)a3 root:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [MEMORY[0x1E4F28D30] hashTableWithOptions:514];
  uint64_t v15 = 0;
  v16 = (id *)&v15;
  uint64_t v17 = 0x3042000000;
  v18 = __Block_byref_object_copy__18;
  v19 = __Block_byref_object_dispose__18;
  id v20 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __29__CRDocument_walkGraph_root___block_invoke;
  v11[3] = &unk_1E61DE550;
  id v8 = v7;
  id v12 = v8;
  id v9 = v5;
  id v13 = v9;
  uint64_t v14 = &v15;
  v10 = (void *)MEMORY[0x1BA9DBBC0](v11);
  objc_storeWeak(v16 + 5, v10);
  (*((void (**)(id, id))v9 + 2))(v9, v6);
  [v6 walkGraph:v10];

  _Block_object_dispose(&v15, 8);
  objc_destroyWeak(&v20);
}

uint64_t __29__CRDocument_walkGraph_root___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v6 = v3;
    if (([*(id *)(a1 + 32) containsObject:v3] & 1) == 0)
    {
      [*(id *)(a1 + 32) addObject:v6];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
      [v6 walkGraph:WeakRetained];
    }
  }

  return MEMORY[0x1F41817F8]();
}

- (void)realizeLocalChanges
{
  [a1 replicaClock];
  v2 = [a1 version];
  id v3 = [a1 replica];
  [v2 clockForUUID:v3];
  OUTLINED_FUNCTION_1_0(&dword_1B9AA2000, v4, v5, "Version clock should equal cached replica clock: %ld => %ld", v6, v7, v8, v9, 0);
}

uint64_t __33__CRDocument_realizeLocalChanges__block_invoke(uint64_t a1, void *a2)
{
  return [a2 realizeLocalChangesIn:*(void *)(a1 + 32)];
}

- (void)updateGraphDocumentPointers
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__CRDocument_updateGraphDocumentPointers__block_invoke;
  v4[3] = &unk_1E61DE578;
  v4[4] = self;
  id v3 = [(CRDocument *)self rootObject];
  [(CRDocument *)self walkGraph:v4 root:v3];
}

uint64_t __41__CRDocument_updateGraphDocumentPointers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDocument:*(void *)(a1 + 32)];
}

- (void)updateObjectsSet
{
  id v3 = [(CRDocument *)self objects];
  [v3 removeAllObjects];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__CRDocument_updateObjectsSet__block_invoke;
  v5[3] = &unk_1E61DE578;
  v5[4] = self;
  uint64_t v4 = [(CRDocument *)self rootObject];
  [(CRDocument *)self walkGraph:v5 root:v4];
}

void __30__CRDocument_updateObjectsSet__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 conformsToProtocol:&unk_1F138D8B0])
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v7;
    uint64_t v5 = [v3 objects];
    uint64_t v6 = [v4 identity];
    [v5 setObject:v4 forKeyedSubscript:v6];
  }
}

- (void)setDocumentFor:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __29__CRDocument_setDocumentFor___block_invoke;
  v3[3] = &unk_1E61DE578;
  v3[4] = self;
  [(CRDocument *)self walkGraph:v3 root:a3];
}

uint64_t __29__CRDocument_setDocumentFor___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDocument:*(void *)(a1 + 32)];
}

- (unint64_t)mergeWithDocument:(id)a3
{
  id v4 = [a3 archivedData];
  unint64_t v5 = [(CRDocument *)self mergeWithData:v4];

  return v5;
}

- (id)deltaSince:(id)a3
{
  id v4 = a3;
  [(CRDocument *)self realizeLocalChanges];
  unint64_t v5 = [(CRDocument *)self version];
  char v6 = [v4 compare:v5];

  if (v6)
  {
    uint64_t v8 = [(CRDocument *)self rootObject];
    uint64_t v9 = [v8 deltaSince:v4 in:self];

    v10 = [CRDocument alloc];
    uint64_t v11 = [(CRDocument *)self version];
    id v12 = [(CRDocument *)self replica];
    id v13 = [(CRDocument *)v10 initWithVersion:v11 startVersion:v4 rootObject:v9 replica:v12];

    id v7 = [(CRDocument *)v13 archivedData];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  char v6 = [(CRDocument *)self version];
  id v7 = [v6 shortDescription];
  uint64_t v8 = [(CRDocument *)self rootObject];
  uint64_t v9 = [v3 stringWithFormat:@"<%@ %p version=%@ root=%@>", v5, self, v7, v8];

  return (NSString *)v9;
}

- (CRVectorTimestamp)version
{
  return self->_version;
}

- (CRVectorTimestamp)startVersion
{
  return self->_startVersion;
}

- (NSUUID)replica
{
  return self->_replica;
}

- (id)rootObject
{
  return self->_rootObject;
}

- (NSMutableDictionary)objects
{
  return self->_objects;
}

- (int64_t)replicaClock
{
  return self->_replicaClock;
}

- (int64_t)unserializedReplicaClock
{
  return self->_unserializedReplicaClock;
}

- (void)setUnserializedReplicaClock:(int64_t)a3
{
  self->_unserializedReplicaClock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong(&self->_rootObject, 0);
  objc_storeStrong((id *)&self->_replica, 0);
  objc_storeStrong((id *)&self->_startVersion, 0);

  objc_storeStrong((id *)&self->_version, 0);
}

- (void)mergeWithData:(void *)a1 .cold.1(void *a1)
{
  v2 = [a1 version];
  id v3 = [a1 replica];
  [v2 clockForUUID:v3];
  [a1 replicaClock];
  OUTLINED_FUNCTION_1_0(&dword_1B9AA2000, v4, v5, "Merging should not modify local replica clock: %ld => %ld", v6, v7, v8, v9, 0);
}

@end