@interface ICCRDocument
+ (id)documentWithReplica:(id)a3;
+ (id)documentWithRootObject:(id)a3 replica:(id)a4;
+ (id)unarchiveFromData:(id)a3 replica:(id)a4;
- (ICCRDocument)init;
- (ICCRDocument)initWithReplica:(id)a3;
- (ICCRDocument)initWithVersion:(id)a3 rootObject:(id)a4 replica:(id)a5;
- (ICCRDocument)initWithVersion:(id)a3 startVersion:(id)a4 rootObject:(id)a5 replica:(id)a6;
- (ICCRVectorTimestamp)startVersion;
- (ICCRVectorTimestamp)version;
- (NSMutableDictionary)objects;
- (NSUUID)replica;
- (id)archivedData;
- (id)copyForReplica:(id)a3;
- (id)deltaSince:(id)a3;
- (id)description;
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

@implementation ICCRDocument

- (id)rootObject
{
  return self->_rootObject;
}

- (void)setRootObject:(id)a3
{
  id v5 = a3;
  if (self->_rootObject != v5)
  {
    objc_storeStrong(&self->_rootObject, a3);
    [(ICCRDocument *)self setDocumentFor:v5];
  }
}

- (void)setDocumentFor:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __31__ICCRDocument_setDocumentFor___block_invoke;
  v3[3] = &unk_1E64A7248;
  v3[4] = self;
  [(ICCRDocument *)self walkGraph:v3 root:a3];
}

- (void)walkGraph:(id)a3 root:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F28D30] hashTableWithOptions:514];
  uint64_t v15 = 0;
  v16 = (id *)&v15;
  uint64_t v17 = 0x3042000000;
  v18 = __Block_byref_object_copy__33;
  v19 = __Block_byref_object_dispose__33;
  id v20 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __31__ICCRDocument_walkGraph_root___block_invoke;
  aBlock[3] = &unk_1E64A7220;
  id v8 = v7;
  id v12 = v8;
  id v9 = v5;
  id v13 = v9;
  v14 = &v15;
  v10 = _Block_copy(aBlock);
  objc_storeWeak(v16 + 5, v10);
  (*((void (**)(id, id))v9 + 2))(v9, v6);
  [v6 walkGraph:v10];

  _Block_object_dispose(&v15, 8);
  objc_destroyWeak(&v20);
}

void __31__ICCRDocument_walkGraph_root___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v6 = v3;
    char v4 = [*(id *)(a1 + 32) containsObject:v3];
    id v3 = v6;
    if ((v4 & 1) == 0)
    {
      [*(id *)(a1 + 32) addObject:v6];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
      [v6 walkGraph:WeakRetained];

      id v3 = v6;
    }
  }
}

uint64_t __31__ICCRDocument_setDocumentFor___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDocument:*(void *)(a1 + 32)];
}

- (id)localObject:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_1F1F75038])
  {
    id v5 = [(ICCRDocument *)self objects];
    id v6 = [v4 identity];
    v7 = [v5 objectForKeyedSubscript:v6];

    if (v7) {
      id v8 = v7;
    }
    else {
      id v8 = v4;
    }
    id v9 = v8;

    id v4 = v9;
  }
  return v4;
}

- (ICCRDocument)initWithReplica:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(ICCRVectorTimestamp);
  id v6 = [(ICCRDocument *)self initWithVersion:v5 startVersion:0 rootObject:0 replica:v4];

  return v6;
}

- (ICCRDocument)initWithVersion:(id)a3 startVersion:(id)a4 rootObject:(id)a5 replica:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)ICCRDocument;
  uint64_t v15 = [(ICCRDocument *)&v21 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_version, a3);
    uint64_t v17 = [(ICCRVectorTimestamp *)v16->_version clockForUUID:v14];
    v16->_replicaClock = v17;
    v16->_unserializedReplicaClock = v17;
    objc_storeStrong((id *)&v16->_startVersion, a4);
    objc_storeStrong(&v16->_rootObject, a5);
    objc_storeStrong((id *)&v16->_replica, a6);
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objects = v16->_objects;
    v16->_objects = v18;

    if (v13) {
      [(ICCRDocument *)v16 setDocumentFor:v13];
    }
  }

  return v16;
}

+ (id)documentWithReplica:(id)a3
{
  id v3 = a3;
  id v4 = [ICCRDocument alloc];
  id v5 = objc_alloc_init(ICCRVectorTimestamp);
  id v6 = [(ICCRDocument *)v4 initWithVersion:v5 rootObject:0 replica:v3];

  return v6;
}

+ (id)documentWithRootObject:(id)a3 replica:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [ICCRDocument alloc];
  id v8 = objc_alloc_init(ICCRVectorTimestamp);
  id v9 = [(ICCRDocument *)v7 initWithVersion:v8 rootObject:v6 replica:v5];

  return v9;
}

- (ICCRDocument)init
{
  id v3 = [MEMORY[0x1E4F29128] UUID];
  id v4 = [(ICCRDocument *)self initWithReplica:v3];

  return v4;
}

- (ICCRDocument)initWithVersion:(id)a3 rootObject:(id)a4 replica:(id)a5
{
  return [(ICCRDocument *)self initWithVersion:a3 startVersion:0 rootObject:a4 replica:a5];
}

- (id)copyForReplica:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCRDocument *)self archivedData];
  id v6 = +[ICCRDocument unarchiveFromData:v5 replica:v4];

  return v6;
}

- (id)archivedData
{
  [(ICCRDocument *)self realizeLocalChanges];
  return +[ICCRCoderArchiver encodedDataWithDocument:self];
}

+ (id)unarchiveFromData:(id)a3 replica:(id)a4
{
  return +[ICCRCoderUnarchiver decodedDocumentFromData:a3 replica:a4];
}

- (unint64_t)mergeResultForMergingWithDocument:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [(ICCRDocument *)self rootObject];
  id v6 = ICDynamicCast();

  objc_opt_class();
  v7 = [v4 rootObject];
  id v8 = ICDynamicCast();

  if (v6) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    v10 = [v6 identity];
    id v11 = [v8 identity];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_11;
    }
  }
  uint64_t v13 = [v4 startVersion];
  if (!v13) {
    goto LABEL_8;
  }
  id v14 = (void *)v13;
  uint64_t v15 = [v4 startVersion];
  v16 = [(ICCRDocument *)self version];
  char v17 = [v15 compare:v16];

  if ((v17 & 4) != 0)
  {
LABEL_11:
    unint64_t v21 = 0;
  }
  else
  {
LABEL_8:
    v18 = [(ICCRDocument *)self version];
    v19 = [v4 version];
    char v20 = [v18 compare:v19];

    if (v20) {
      unint64_t v21 = 2;
    }
    else {
      unint64_t v21 = 1;
    }
  }

  return v21;
}

- (void)mergeTimestampWithDocument:(id)a3
{
  id v4 = a3;
  id v6 = [(ICCRDocument *)self version];
  id v5 = [v4 version];

  [v6 mergeWith:v5];
}

- (unint64_t)mergeWithData:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ICCRDocument *)self replica];
  id v6 = +[ICCRDocument unarchiveFromData:v4 replica:v5];

  [(ICCRDocument *)self realizeLocalChanges];
  unint64_t v7 = [(ICCRDocument *)self mergeResultForMergingWithDocument:v6];
  if (v7 == 2)
  {
    id v27 = v4;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v8 = [(ICCRDocument *)self objects];
    BOOL v9 = (void *)[v8 copy];
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
          uint64_t v15 = *(void **)(*((void *)&v28 + 1) + 8 * v14);
          v16 = [v6 objects];
          char v17 = [v15 identity];
          v18 = [v16 objectForKeyedSubscript:v17];
          [v15 mergeWith:v18];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v12);
    }

    v19 = [(ICCRDocument *)self rootObject];
    char v20 = [v6 rootObject];
    [v19 mergeWith:v20];

    [(ICCRDocument *)self mergeTimestampWithDocument:v6];
    unint64_t v21 = [(ICCRDocument *)self version];
    v22 = [(ICCRDocument *)self replica];
    uint64_t v23 = [v21 clockForUUID:v22];
    int64_t v24 = [(ICCRDocument *)self replicaClock];

    id v4 = v27;
    if (v23 != v24)
    {
      v25 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[ICCRDocument mergeWithData:](self);
      }
    }
    [(ICCRDocument *)self updateGraphDocumentPointers];
    [(ICCRDocument *)self updateObjectsSet];
    unint64_t v7 = 2;
  }

  return v7;
}

- (void)realizeLocalChanges
{
  [a1 replicaClock];
  v2 = [a1 version];
  id v3 = [a1 replica];
  [v2 clockForUUID:v3];
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v4, v5, "Version clock should equal cached replica clock: %ld => %ld", v6, v7, v8, v9, 0);
}

uint64_t __35__ICCRDocument_realizeLocalChanges__block_invoke(uint64_t a1, void *a2)
{
  return [a2 realizeLocalChangesIn:*(void *)(a1 + 32)];
}

- (void)updateGraphDocumentPointers
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__ICCRDocument_updateGraphDocumentPointers__block_invoke;
  v4[3] = &unk_1E64A7248;
  v4[4] = self;
  id v3 = [(ICCRDocument *)self rootObject];
  [(ICCRDocument *)self walkGraph:v4 root:v3];
}

uint64_t __43__ICCRDocument_updateGraphDocumentPointers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDocument:*(void *)(a1 + 32)];
}

- (void)updateObjectsSet
{
  id v3 = [(ICCRDocument *)self objects];
  [v3 removeAllObjects];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__ICCRDocument_updateObjectsSet__block_invoke;
  v5[3] = &unk_1E64A7248;
  v5[4] = self;
  uint64_t v4 = [(ICCRDocument *)self rootObject];
  [(ICCRDocument *)self walkGraph:v5 root:v4];
}

void __32__ICCRDocument_updateObjectsSet__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 conformsToProtocol:&unk_1F1F75038])
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v7;
    uint64_t v5 = [v3 objects];
    uint64_t v6 = [v4 identity];
    [v5 setObject:v4 forKeyedSubscript:v6];
  }
}

- (unint64_t)mergeWithDocument:(id)a3
{
  id v4 = [a3 archivedData];
  unint64_t v5 = [(ICCRDocument *)self mergeWithData:v4];

  return v5;
}

- (id)deltaSince:(id)a3
{
  id v4 = a3;
  [(ICCRDocument *)self realizeLocalChanges];
  unint64_t v5 = [(ICCRDocument *)self version];
  char v6 = [v4 compare:v5];

  if (v6)
  {
    uint64_t v8 = [(ICCRDocument *)self rootObject];
    uint64_t v9 = [v8 deltaSince:v4 in:self];

    v10 = [ICCRDocument alloc];
    uint64_t v11 = [(ICCRDocument *)self version];
    uint64_t v12 = [(ICCRDocument *)self replica];
    uint64_t v13 = [(ICCRDocument *)v10 initWithVersion:v11 startVersion:v4 rootObject:v9 replica:v12];

    id v7 = [(ICCRDocument *)v13 archivedData];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  char v6 = [(ICCRDocument *)self version];
  id v7 = [v6 shortDescription];
  uint64_t v8 = [(ICCRDocument *)self rootObject];
  uint64_t v9 = [v3 stringWithFormat:@"<%@ %p version=%@ root=%@>", v5, self, v7, v8];

  return v9;
}

- (ICCRVectorTimestamp)version
{
  return self->_version;
}

- (ICCRVectorTimestamp)startVersion
{
  return self->_startVersion;
}

- (NSUUID)replica
{
  return self->_replica;
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
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v4, v5, "Merging should not modify local replica clock: %ld => %ld", v6, v7, v8, v9, 0);
}

@end