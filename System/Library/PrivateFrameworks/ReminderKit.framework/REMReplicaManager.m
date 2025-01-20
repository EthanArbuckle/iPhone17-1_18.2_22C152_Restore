@interface REMReplicaManager
+ (BOOL)disablesInMemoryOnlyCheck;
+ (BOOL)shouldUseNewInMemoryOnlyReplicaManager;
+ (BOOL)supportsSecureCoding;
+ (id)replicaManagerForAccountID:(id)a3 store:(id)a4;
+ (id)replicaManagerIfLoadedForAccountID:(id)a3;
+ (id)replicaManagerWithSerializedData:(id)a3 error:(id *)a4;
+ (id)unsavedReplicaManagersForAccountIDs:(id)a3;
+ (void)setDisablesInMemoryOnlyCheck:(BOOL)a3;
+ (void)setReplicaManager:(id)a3 forAccountID:(id)a4;
- (BOOL)exceededMaxSerializedSize;
- (BOOL)hasEqualPersistedEntriesAs:(id)a3;
- (BOOL)hasUnsavedChanges;
- (BOOL)isPersistable;
- (BOOL)l_updateVersionOfEntry:(id)a3 forClient:(id)a4;
- (NSMutableDictionary)replicaEntries;
- (NSMutableOrderedSet)replicaUUIDs;
- (REMReplicaManager)init;
- (REMReplicaManager)initWithArchive:(const void *)a3 error:(id *)a4;
- (id)availabilityOfFirstReplicaForCRDTID:(id)a3;
- (id)checkoutReplicaUUIDForClient:(id)a3;
- (id)clockOfFirstReplicaForCRDTID:(id)a3;
- (id)description;
- (id)l_checkoutReplicaUUIDForClient:(id)a3;
- (id)l_replicaEntriesDescriptionForPersistence:(BOOL)a3;
- (id)l_replicaUUIDsDescription;
- (id)l_serializedDataWithError:(id *)a3;
- (id)persistenceDescription;
- (id)serializedDataCappedAtMaxSize:(BOOL)a3 error:(id *)a4;
- (os_unfair_lock_s)ivarLock;
- (unint64_t)currentVersion;
- (unint64_t)maxLastSavedVersion;
- (unint64_t)replicaEntryCount;
- (void)addRandomReplicaEntriesWithCount:(int64_t)a3;
- (void)commonInit;
- (void)didSaveVersion:(unint64_t)a3;
- (void)encodeIntoArchive:(void *)a3;
- (void)modifyReplicaEntryForClient:(id)a3 block:(id)a4;
- (void)performLocked:(id)a3;
- (void)returnReplicaForClient:(id)a3;
- (void)setCurrentVersion:(unint64_t)a3;
- (void)setExceededMaxSerializedSize:(BOOL)a3;
- (void)setIsPersistable:(BOOL)a3;
- (void)setIvarLock:(os_unfair_lock_s)a3;
- (void)setMaxLastSavedVersion:(unint64_t)a3;
- (void)setReplicaEntries:(id)a3;
- (void)setReplicaUUIDs:(id)a3;
- (void)updateVersionForClient:(id)a3;
@end

@implementation REMReplicaManager

+ (id)replicaManagerForAccountID:(id)a3 store:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__REMReplicaManager_replicaManagerForAccountID_store___block_invoke;
  v13[3] = &unk_1E61DBE68;
  v16 = &v18;
  id v17 = a1;
  id v14 = v6;
  id v15 = v7;
  id v8 = v7;
  id v9 = v6;
  v10 = (void (**)(void))MEMORY[0x1BA9DBBC0](v13);
  os_unfair_lock_lock((os_unfair_lock_t)&managerByAccountIDLock);
  v10[2](v10);
  os_unfair_lock_unlock((os_unfair_lock_t)&managerByAccountIDLock);
  id v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);

  return v11;
}

void __54__REMReplicaManager_replicaManagerForAccountID_store___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) uuid];
  uint64_t v3 = [(id)managerByAccountID objectForKeyedSubscript:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    if (([*(id *)(a1 + 56) disablesInMemoryOnlyCheck] & 1) != 0
      || ![*(id *)(a1 + 56) shouldUseNewInMemoryOnlyReplicaManager])
    {
      v10 = *(void **)(a1 + 40);
      if (v10) {
        id v11 = v10;
      }
      else {
        id v11 = objc_alloc_init(REMStore);
      }
      v12 = v11;
      uint64_t v13 = *(void *)(a1 + 32);
      id v31 = 0;
      id v14 = [(REMStore *)v11 fetchReplicaManagerForAccountID:v13 error:&v31];
      id v15 = v31;
      if (v14)
      {
        v16 = +[REMLog crdt];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          id v17 = [v14 managerData];
          uint64_t v18 = [v17 length];
          *(_DWORD *)buf = 138412546;
          v33 = v2;
          __int16 v34 = 2048;
          uint64_t v35 = v18;
          _os_log_impl(&dword_1B9AA2000, v16, OS_LOG_TYPE_INFO, "Deserializing existing replica manager {account = %@, size = %lu}", buf, 0x16u);
        }
        id v30 = v15;
        uint64_t v19 = +[REMReplicaManager replicaManagerWithSerializedData:v14 error:&v30];
        id v20 = v30;

        uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
        v22 = *(void **)(v21 + 40);
        *(void *)(v21 + 40) = v19;

        id v15 = v20;
      }
      if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
      {
        id v23 = +[REMLog crdt];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v33 = v2;
          _os_log_impl(&dword_1B9AA2000, v23, OS_LOG_TYPE_INFO, "Creating a new replica manager {account = %@}", buf, 0xCu);
        }

        v24 = objc_alloc_init(REMReplicaManager);
        uint64_t v25 = *(void *)(*(void *)(a1 + 48) + 8);
        v26 = *(void **)(v25 + 40);
        *(void *)(v25 + 40) = v24;
      }
    }
    else
    {
      id v6 = +[REMLog crdt];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v2;
        _os_log_impl(&dword_1B9AA2000, v6, OS_LOG_TYPE_INFO, "Creating a new, in-memory only replica manager {account = %@}", buf, 0xCu);
      }

      id v7 = objc_alloc_init(REMReplicaManager);
      uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setIsPersistable:0];
    }
    v27 = (void *)managerByAccountID;
    if (!managerByAccountID)
    {
      uint64_t v28 = [MEMORY[0x1E4F1CA60] dictionary];
      v29 = (void *)managerByAccountID;
      managerByAccountID = v28;

      v27 = (void *)managerByAccountID;
    }
    [v27 setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKeyedSubscript:v2];
  }
}

+ (BOOL)shouldUseNewInMemoryOnlyReplicaManager
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v3 = [v2 bundleIdentifier];

  if (!v3
    || ([@"com.apple.remindd" isEqualToString:v3] & 1) != 0
    || ([@"com.apple.dt.xctest.tool" isEqualToString:v3] & 1) != 0
    || ([@"com.apple.TestReminderKit.xctrunner" isEqualToString:v3] & 1) != 0
    || ([@"com.apple.iOSTestReminders.xctrunner" isEqualToString:v3] & 1) != 0
    || ([@"com.apple.macOSTestReminders.xctrunner" isEqualToString:v3] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [@"com.apple.watchOSTestReminders.xctrunner" isEqualToString:v3];
  }

  return v4;
}

- (void)commonInit
{
  self->_ivarLock._os_unfair_lock_opaque = 0;
  self->_isPersistable = 1;
}

- (REMReplicaManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)REMReplicaManager;
  v2 = [(REMReplicaManager *)&v9 init];
  uint64_t v3 = v2;
  if (v2)
  {
    [(REMReplicaManager *)v2 commonInit];
    uint64_t v4 = [MEMORY[0x1E4F1CA70] orderedSet];
    replicaUUIDs = v3->_replicaUUIDs;
    v3->_replicaUUIDs = (NSMutableOrderedSet *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    replicaEntries = v3->_replicaEntries;
    v3->_replicaEntries = (NSMutableDictionary *)v6;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMReplicaManager)initWithArchive:(const void *)a3 error:(id *)a4
{
  v43.receiver = self;
  v43.super_class = (Class)REMReplicaManager;
  v5 = [(REMReplicaManager *)&v43 init];
  uint64_t v6 = v5;
  if (v5)
  {
    [(REMReplicaManager *)v5 commonInit];
    v39 = v6;
    unsigned int v7 = *((_DWORD *)a3 + 12);
    uint64_t v8 = [MEMORY[0x1E4F1CA70] orderedSetWithCapacity:v7];
    if (v7)
    {
      for (int i = 0; i != v7; ++i)
      {
        id v10 = objc_alloc(MEMORY[0x1E4F29128]);
        uint64_t v11 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>((uint64_t)a3 + 40, i);
        if (*(char *)(v11 + 23) >= 0) {
          uint64_t v12 = v11;
        }
        else {
          uint64_t v12 = *(void *)v11;
        }
        uint64_t v13 = (void *)[v10 initWithUUIDBytes:v12];
        [(NSMutableOrderedSet *)v8 addObject:v13];
      }
    }
    uint64_t v14 = *((unsigned int *)a3 + 18);
    v42 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v14];
    v40 = a3;
    id v15 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v14];
    if (v14)
    {
      uint64_t v16 = 0;
      id v17 = (char *)a3 + 64;
      while (1)
      {
        uint64_t v18 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>((uint64_t)v17, v16);
        id v19 = [NSString alloc];
        int v20 = *(char *)(v18 + 23);
        uint64_t v21 = v20 >= 0 ? v18 : *(void *)v18;
        uint64_t v22 = v20 >= 0 ? *(unsigned __int8 *)(v18 + 23) : *(void *)(v18 + 8);
        id v23 = (REMReplicaEntry *)[v19 initWithBytes:v21 length:v22 encoding:4];
        if (![(REMReplicaEntry *)v23 length]) {
          break;
        }
        v24 = [MEMORY[0x1E4F1CA48] array];
        [(NSMutableDictionary *)v42 setObject:v24 forKeyedSubscript:v23];

        uint64_t v25 = [NSNumber numberWithUnsignedInt:v16];
        [v15 setObject:v23 forKeyedSubscript:v25];

        uint64_t v16 = (v16 + 1);
        if (v14 == v16) {
          goto LABEL_18;
        }
      }
      if (a4)
      {
        *a4 = +[REMError internalErrorWithDebugDescription:@"Invalid crdtID"];
      }
      goto LABEL_34;
    }
LABEL_18:
    int v26 = v40[24];
    if (v26)
    {
      int v27 = 0;
      while (1)
      {
        uint64_t v28 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<replica_manager::ReplicaEntry>::TypeHandler>((uint64_t)(v40 + 22), v27);
        id v23 = [[REMReplicaEntry alloc] initWithEntryArchive:v28];
        v29 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v28 + 40)];
        id v30 = [v15 objectForKeyedSubscript:v29];

        if ([(REMReplicaEntry *)v23 replicaUUIDIndex] >= v7)
        {
          if (!a4) {
            goto LABEL_33;
          }
          v37 = +[REMError internalErrorWithDebugDescription:@"Invalid replicaUUIDIndex"];
          goto LABEL_31;
        }
        if (!v30) {
          break;
        }
        id v31 = [(NSMutableDictionary *)v42 objectForKeyedSubscript:v30];
        [v31 addObject:v23];

        if (v26 == ++v27) {
          goto LABEL_23;
        }
      }
      if (a4)
      {
        id v30 = 0;
        v37 = +[REMError internalErrorWithDebugDescription:@"Invalid crdtIDIndex"];
LABEL_31:
        *a4 = v37;
        goto LABEL_33;
      }
      id v30 = 0;
LABEL_33:

LABEL_34:
      uint64_t v36 = 0;
      uint64_t v6 = v39;
      goto LABEL_35;
    }
LABEL_23:
    replicaUUIDs = v39->_replicaUUIDs;
    v39->_replicaUUIDs = v8;
    v33 = v8;
    uint64_t v6 = v39;
    __int16 v34 = v33;

    replicaEntries = v39->_replicaEntries;
    v39->_replicaEntries = v42;
  }
  uint64_t v36 = v6;
LABEL_35:

  return v36;
}

- (void)encodeIntoArchive:(void *)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obuint64_t j = [(REMReplicaManager *)self replicaUUIDs];
  uint64_t v4 = [obj countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v46 != v5) {
          objc_enumerationMutation(obj);
        }
        unsigned int v7 = (google::protobuf::internal::StringTypeHandlerBase *)[*(id *)(*((void *)&v45 + 1) + 8 * i) getUUIDBytes:v51];
        int v8 = *((_DWORD *)a3 + 13);
        uint64_t v9 = *((int *)a3 + 12);
        if ((int)v9 >= v8)
        {
          if (v8 == *((_DWORD *)a3 + 14)) {
            unsigned int v7 = (google::protobuf::internal::StringTypeHandlerBase *)google::protobuf::internal::RepeatedPtrFieldBase::Reserve((uint64_t)a3 + 40, v8 + 1);
          }
          google::protobuf::internal::StringTypeHandlerBase::New(v7);
        }
        uint64_t v10 = *((void *)a3 + 5);
        *((_DWORD *)a3 + 12) = v9 + 1;
        MEMORY[0x1BA9DB490](*(void *)(v10 + 8 * v9), v51, 16);
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v4);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obja = [(REMReplicaManager *)self replicaEntries];
  uint64_t v11 = [obja countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v11)
  {
    v32 = (google::protobuf::internal::RepeatedPtrFieldBase *)((char *)a3 + 64);
    uint64_t v33 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v42 != v33) {
          objc_enumerationMutation(obja);
        }
        int v13 = *((_DWORD *)a3 + 18);
        id v14 = *(id *)(*((void *)&v41 + 1) + 8 * j);
        uint64_t v15 = [v14 UTF8String];
        uint64_t v16 = (google::protobuf::internal::StringTypeHandlerBase *)[v14 lengthOfBytesUsingEncoding:4];
        int v17 = *((_DWORD *)a3 + 19);
        uint64_t v18 = *((int *)a3 + 18);
        if ((int)v18 >= v17)
        {
          if (v17 == *((_DWORD *)a3 + 20)) {
            uint64_t v16 = (google::protobuf::internal::StringTypeHandlerBase *)google::protobuf::internal::RepeatedPtrFieldBase::Reserve((uint64_t)v32, v17 + 1);
          }
          google::protobuf::internal::StringTypeHandlerBase::New(v16);
        }
        uint64_t v19 = *((void *)a3 + 8);
        *((_DWORD *)a3 + 18) = v18 + 1;
        MEMORY[0x1BA9DB490](*(void *)(v19 + 8 * v18), v15, v16);
        int v20 = [(REMReplicaManager *)self replicaEntries];
        uint64_t v21 = [v20 objectForKeyedSubscript:v14];

        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v22 = v21;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v49 count:16];
        uint64_t v24 = v23;
        if (v23)
        {
          uint64_t v25 = *(void *)v38;
          do
          {
            uint64_t v26 = 0;
            do
            {
              if (*(void *)v38 != v25) {
                objc_enumerationMutation(v22);
              }
              int v27 = *(void **)(*((void *)&v37 + 1) + 8 * v26);
              int v28 = *((_DWORD *)a3 + 25);
              uint64_t v29 = *((int *)a3 + 24);
              if ((int)v29 >= v28)
              {
                if (v28 == *((_DWORD *)a3 + 26)) {
                  google::protobuf::internal::RepeatedPtrFieldBase::Reserve((uint64_t)a3 + 88, v28 + 1);
                }
                google::protobuf::internal::GenericTypeHandler<replica_manager::ReplicaEntry>::New();
              }
              uint64_t v30 = *((void *)a3 + 11);
              *((_DWORD *)a3 + 24) = v29 + 1;
              uint64_t v31 = *(void *)(v30 + 8 * v29);
              *(_DWORD *)(v31 + 32) |= 1u;
              *(_DWORD *)(v31 + 40) = v13;
              objc_msgSend(v27, "encodeIntoEntryArchive:");
              ++v26;
            }
            while (v24 != v26);
            uint64_t v24 = [v22 countByEnumeratingWithState:&v37 objects:v49 count:16];
          }
          while (v24);
        }
      }
      uint64_t v11 = [obja countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v11);
  }
}

- (void)performLocked:(id)a3
{
  p_ivarLock = &self->_ivarLock;
  uint64_t v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_ivarLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_ivarLock);
}

- (id)checkoutReplicaUUIDForClient:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  uint64_t v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__REMReplicaManager_checkoutReplicaUUIDForClient___block_invoke;
  v8[3] = &unk_1E61DBE90;
  id v9 = v4;
  uint64_t v10 = &v11;
  v8[4] = self;
  id v5 = v4;
  [(REMReplicaManager *)self performLocked:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

uint64_t __50__REMReplicaManager_checkoutReplicaUUIDForClient___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "l_checkoutReplicaUUIDForClient:", *(void *)(a1 + 40));

  return MEMORY[0x1F41817F8]();
}

- (id)l_checkoutReplicaUUIDForClient:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  long long v40 = self;
  id v4 = [(REMReplicaManager *)self replicaEntries];
  id v5 = [v39 crdtID];
  uint64_t v6 = [v4 objectForKey:v5];

  long long v41 = (void *)v6;
  if (!v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    int v8 = [(REMReplicaManager *)v40 replicaEntries];
    id v9 = [v39 crdtID];
    [v8 setObject:v7 forKey:v9];

    long long v41 = (void *)v7;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = [(REMReplicaManager *)v40 replicaUUIDs];
  uint64_t v10 = [obj countByEnumeratingWithState:&v43 objects:v57 count:16];
  if (v10)
  {
    uint64_t v12 = *(void *)v44;
    *(void *)&long long v11 = 138413058;
    long long v37 = v11;
LABEL_5:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v44 != v12) {
        objc_enumerationMutation(obj);
      }
      id v14 = *(void **)(*((void *)&v43 + 1) + 8 * v13);
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __52__REMReplicaManager_l_checkoutReplicaUUIDForClient___block_invoke;
      v42[3] = &unk_1E61DBEB8;
      v42[4] = v40;
      v42[5] = v14;
      uint64_t v15 = objc_msgSend(v41, "indexOfObjectPassingTest:", v42, v37);
      if (v15 == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v27 = v14;
        int v28 = [REMReplicaEntry alloc];
        uint64_t v29 = [(REMReplicaManager *)v40 replicaUUIDs];
        uint64_t v30 = -[REMReplicaEntry initWithReplicaUUIDIndex:clockElementList:inUse:forClient:](v28, "initWithReplicaUUIDIndex:clockElementList:inUse:forClient:", [v29 indexOfObject:v27], 0, 1, v39);

        [v41 addObject:v30];
        if (v27) {
          goto LABEL_25;
        }
        goto LABEL_24;
      }
      id v16 = [v41 objectAtIndexedSubscript:v15];
      if (([v16 inUse] & 1) == 0)
      {
        int v17 = [v39 clockElementListForReplicaUUID:v14];
        uint64_t v18 = [v16 clockElementList];
        BOOL v19 = +[REMClockElementList list:v17 isCompatibleToList:v18];

        if (!v19)
        {
          int v20 = +[REMLog crdt];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          {
            uint64_t v21 = clientDescription(v39);
            -[REMReplicaManager l_checkoutReplicaUUIDForClient:](v21, v55, &v56, v20);
          }
        }
        id v22 = [v16 clockElementList];
        int64_t v23 = +[REMClockElementList compareList:v17 toList:v22];

        if ((unint64_t)(v23 - 2) >= 2)
        {
          if (!v23)
          {
            [v16 setClient:v39];
            [v16 setInUse:1];
            id v27 = v14;

            if (v27) {
              goto LABEL_26;
            }
            goto LABEL_24;
          }
        }
        else
        {
          uint64_t v24 = +[REMLog crdt];
          if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
          {
            clientDescription(v39);
            id v25 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v26 = [v16 clockElementList];
            *(_DWORD *)buf = v37;
            id v48 = v25;
            __int16 v49 = 2112;
            v50 = v17;
            __int16 v51 = 2112;
            v52 = v26;
            __int16 v53 = 2112;
            v54 = v14;
            _os_log_fault_impl(&dword_1B9AA2000, v24, OS_LOG_TYPE_FAULT, "Client clock newer that replica manager clock {client: %@, clientClockElementList: %@, replicaEntry.clockElementList: %@, replicaUUID: %@}", buf, 0x2Au);
          }
        }
      }
      if (v10 == ++v13)
      {
        uint64_t v10 = [obj countByEnumeratingWithState:&v43 objects:v57 count:16];
        if (v10) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

LABEL_24:
  uint64_t v31 = [MEMORY[0x1E4F29128] UUID];
  v32 = [(REMReplicaManager *)v40 replicaUUIDs];
  [v32 addObject:v31];

  uint64_t v33 = [REMReplicaEntry alloc];
  __int16 v34 = [(REMReplicaManager *)v40 replicaUUIDs];
  uint64_t v35 = -[REMReplicaEntry initWithReplicaUUIDIndex:clockElementList:inUse:forClient:](v33, "initWithReplicaUUIDIndex:clockElementList:inUse:forClient:", [v34 indexOfObject:v31], 0, 1, v39);

  [v41 addObject:v35];
  id v27 = (id)v31;
LABEL_25:
  [(REMReplicaManager *)v40 setCurrentVersion:[(REMReplicaManager *)v40 currentVersion] + 1];
LABEL_26:

  return v27;
}

uint64_t __52__REMReplicaManager_l_checkoutReplicaUUIDForClient___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) replicaUUIDs];
  id v5 = objc_msgSend(v4, "objectAtIndex:", objc_msgSend(v3, "replicaUUIDIndex"));

  uint64_t v6 = [v5 isEqual:*(void *)(a1 + 40)];
  return v6;
}

- (void)modifyReplicaEntryForClient:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__REMReplicaManager_modifyReplicaEntryForClient_block___block_invoke;
  v10[3] = &unk_1E61DBEE0;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(REMReplicaManager *)self performLocked:v10];
}

void __55__REMReplicaManager_modifyReplicaEntryForClient_block___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) replicaEntries];
  id v3 = [*(id *)(a1 + 40) crdtID];
  id v4 = [v2 objectForKey:v3];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "replicaUUIDs", (void)v14);
        id v11 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v9, "replicaUUIDIndex"));

        id v12 = [*(id *)(a1 + 40) replicaUUID];
        int v13 = [v12 isEqual:v11];

        if (v13)
        {
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)updateVersionForClient:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__REMReplicaManager_updateVersionForClient___block_invoke;
  v6[3] = &unk_1E61DBF08;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(REMReplicaManager *)self modifyReplicaEntryForClient:v5 block:v6];
}

void __44__REMReplicaManager_updateVersionForClient___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) replicaUUID];
  if (([v3 inUse] & 1) == 0)
  {
    id v7 = +[REMLog crdt];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      id v8 = clientDescription(*(void **)(a1 + 32));
      __44__REMReplicaManager_updateVersionForClient___block_invoke_cold_1(v8, (uint64_t)v4, (uint64_t)v17);
    }
  }
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = [v3 client];
  LOBYTE(v5) = v5 == v6;

  if ((v5 & 1) == 0)
  {
    id v9 = +[REMLog crdt];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      clientDescription(*(void **)(a1 + 32));
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      id v11 = [v3 client];
      id v12 = clientDescription(v11);
      int v13 = 138412546;
      id v14 = v10;
      __int16 v15 = 2112;
      long long v16 = v12;
      _os_log_fault_impl(&dword_1B9AA2000, v9, OS_LOG_TYPE_FAULT, "rem_log_fault_if (client != entry.client) -- Client attempt to update a replica not checked out by it {client: %@, entry.client: %@}", (uint8_t *)&v13, 0x16u);
    }
  }
  if (objc_msgSend(*(id *)(a1 + 40), "l_updateVersionOfEntry:forClient:", v3, *(void *)(a1 + 32))) {
    objc_msgSend(*(id *)(a1 + 40), "setCurrentVersion:", objc_msgSend(*(id *)(a1 + 40), "currentVersion") + 1);
  }
}

- (BOOL)l_updateVersionOfEntry:(id)a3 forClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 replicaUUID];
  id v8 = [v6 clockElementListForReplicaUUID:v7];

  id v9 = [v5 clockElementList];
  int64_t v10 = +[REMClockElementList compareList:v8 toList:v9];

  if (v10)
  {
    if (v10 != 2)
    {
      id v12 = +[REMLog crdt];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[REMReplicaManager l_updateVersionOfEntry:forClient:](v12);
      }
    }
    [v5 setClockElementList:v8];
  }

  return v10 != 0;
}

- (void)returnReplicaForClient:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__REMReplicaManager_returnReplicaForClient___block_invoke;
  v6[3] = &unk_1E61DBF08;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(REMReplicaManager *)self modifyReplicaEntryForClient:v5 block:v6];
}

void __44__REMReplicaManager_returnReplicaForClient___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) replicaUUID];
  if (([v3 inUse] & 1) == 0)
  {
    id v7 = +[REMLog crdt];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      id v8 = clientDescription(*(void **)(a1 + 32));
      __44__REMReplicaManager_returnReplicaForClient___block_invoke_cold_1(v8, (uint64_t)v4, (uint64_t)v19);
    }
  }
  id v5 = *(void **)(a1 + 32);
  id v6 = [v3 client];
  LOBYTE(v5) = v5 == v6;

  if ((v5 & 1) == 0)
  {
    id v9 = +[REMLog crdt];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      clientDescription(*(void **)(a1 + 32));
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      id v11 = [v3 client];
      id v12 = clientDescription(v11);
      int v13 = 138412802;
      id v14 = v10;
      __int16 v15 = 2112;
      long long v16 = v4;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      _os_log_fault_impl(&dword_1B9AA2000, v9, OS_LOG_TYPE_FAULT, "rem_log_fault_if (client != entry.client) -- Client attempts to return replicaUUID not checked out by it {client = %@, replicaUUID = %@, checked out by = %@}", (uint8_t *)&v13, 0x20u);
    }
  }
  [v3 setInUse:0];
  [v3 setClient:0];
  if (objc_msgSend(*(id *)(a1 + 40), "l_updateVersionOfEntry:forClient:", v3, *(void *)(a1 + 32))) {
    objc_msgSend(*(id *)(a1 + 40), "setCurrentVersion:", objc_msgSend(*(id *)(a1 + 40), "currentVersion") + 1);
  }
}

- (id)description
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy_;
  id v9 = __Block_byref_object_dispose_;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__REMReplicaManager_description__block_invoke;
  v4[3] = &unk_1E61DBF30;
  v4[4] = self;
  v4[5] = &v5;
  [(REMReplicaManager *)self performLocked:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __32__REMReplicaManager_description__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "l_replicaUUIDsDescription");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = objc_msgSend(*(id *)(a1 + 32), "l_replicaEntriesDescriptionForPersistence:", 0);
  uint64_t v3 = [NSString stringWithFormat:@"<%@: %p> {\n\tcurrentVersion: %llu\n\tmaxLastSavedVersion: %llu\n\tReplica UUIDs: %@\n\tReplica Entries: %@\n}", objc_opt_class(), *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "currentVersion"), objc_msgSend(*(id *)(a1 + 32), "maxLastSavedVersion"), v6, v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)l_replicaUUIDsDescription
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v4 = [(REMReplicaManager *)self replicaUUIDs];
  uint64_t v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  id v6 = [(REMReplicaManager *)self replicaUUIDs];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __46__REMReplicaManager_l_replicaUUIDsDescription__block_invoke;
  __int16 v15 = &unk_1E61DBF58;
  id v7 = v5;
  id v16 = v7;
  [v6 enumerateObjectsUsingBlock:&v12];

  id v8 = NSString;
  id v9 = [v7 componentsJoinedByString:@"\n"];
  id v10 = [v8 stringWithFormat:@"[\n%@\n\t]", v9, v12, v13, v14, v15];

  return v10;
}

void __46__REMReplicaManager_l_replicaUUIDsDescription__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [NSString stringWithFormat:@"\t\t%lu: %@", a3, a2];
  objc_msgSend(v3, "addObject:");
}

- (id)l_replicaEntriesDescriptionForPersistence:(BOOL)a3
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA48];
  id v6 = [(REMReplicaManager *)self replicaEntries];
  id v7 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));

  id v8 = [(REMReplicaManager *)self replicaEntries];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__REMReplicaManager_l_replicaEntriesDescriptionForPersistence___block_invoke;
  v14[3] = &unk_1E61DBF80;
  BOOL v16 = a3;
  id v9 = v7;
  id v15 = v9;
  [v8 enumerateKeysAndObjectsUsingBlock:v14];

  id v10 = NSString;
  id v11 = [v9 componentsJoinedByString:@"\n"];
  uint64_t v12 = [v10 stringWithFormat:@"[\n%@\n\t]", v11];

  return v12;
}

void __63__REMReplicaManager_l_replicaEntriesDescriptionForPersistence___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  uint64_t v29 = v9;
  uint64_t v30 = v8;
  unint64_t v10 = 0x1E4F29000uLL;
  if ([v9 count] == 1)
  {
    id v11 = NSString;
    int v12 = *(unsigned __int8 *)(a1 + 40);
    if (*(unsigned char *)(a1 + 40))
    {
      id v4 = [v9 firstObject];
      [v4 persistenceDescription];
    }
    else
    {
      uint64_t v5 = [v9 firstObject];
      [v5 description];
    uint64_t v13 = };
    uint64_t v26 = [v11 stringWithFormat:@"%@", v13];

    if (v12) {
    else
    }
  }
  else
  {
    id v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    obuint64_t j = v9;
    uint64_t v15 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v33;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v33 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void **)(*((void *)&v32 + 1) + 8 * v17);
          uint64_t v19 = NSString;
          int v20 = *(unsigned __int8 *)(a1 + 40);
          if (*(unsigned char *)(a1 + 40))
          {
            uint64_t v21 = [v18 persistenceDescription];
            unint64_t v10 = v21;
          }
          else
          {
            uint64_t v21 = [v18 description];
            uint64_t v3 = (void *)v21;
          }
          id v22 = [v19 stringWithFormat:@"\t\t\t%@", v21];
          [v14 addObject:v22];

          if (v20) {
            int64_t v23 = (void *)v10;
          }
          else {
            int64_t v23 = v3;
          }

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v15);
    }

    uint64_t v24 = NSString;
    id v25 = [v14 componentsJoinedByString:@"\n"];
    uint64_t v26 = [v24 stringWithFormat:@"[\n%@\n\t\t]", v25];

    id v8 = v30;
    unint64_t v10 = 0x1E4F29000;
  }
  id v27 = *(void **)(a1 + 32);
  int v28 = [*(id *)(v10 + 24) stringWithFormat:@"\t\t%@: %@", v8, v26];
  [v27 addObject:v28];
}

- (id)persistenceDescription
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy_;
  id v9 = __Block_byref_object_dispose_;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__REMReplicaManager_persistenceDescription__block_invoke;
  v4[3] = &unk_1E61DBF30;
  v4[4] = self;
  v4[5] = &v5;
  [(REMReplicaManager *)self performLocked:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __43__REMReplicaManager_persistenceDescription__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "l_replicaUUIDsDescription");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = objc_msgSend(*(id *)(a1 + 32), "l_replicaEntriesDescriptionForPersistence:", 1);
  uint64_t v3 = [NSString stringWithFormat:@"{\n\tversion: %llu\n\tReplica UUIDs: %@\n\tReplica Entries: %@\n}", objc_msgSend(*(id *)(a1 + 32), "currentVersion"), v6, v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (BOOL)hasUnsavedChanges
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__REMReplicaManager_hasUnsavedChanges__block_invoke;
  v4[3] = &unk_1E61DBFA8;
  v4[4] = self;
  v4[5] = &v5;
  [(REMReplicaManager *)self performLocked:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

unint64_t __38__REMReplicaManager_hasUnsavedChanges__block_invoke(uint64_t a1)
{
  unint64_t result = [*(id *)(a1 + 32) isPersistable];
  if (result)
  {
    unint64_t v3 = [*(id *)(a1 + 32) maxLastSavedVersion];
    unint64_t result = [*(id *)(a1 + 32) currentVersion];
    BOOL v4 = v3 < result;
  }
  else
  {
    BOOL v4 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

+ (id)unsavedReplicaManagersForAccountIDs:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy_;
  id v14 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&managerByAccountIDLock);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__REMReplicaManager_unsavedReplicaManagersForAccountIDs___block_invoke;
  v7[3] = &unk_1E61DBF30;
  id v4 = v3;
  id v8 = v4;
  id v9 = &v10;
  __57__REMReplicaManager_unsavedReplicaManagersForAccountIDs___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock((os_unfair_lock_t)&managerByAccountIDLock);

  id v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __57__REMReplicaManager_unsavedReplicaManagersForAccountIDs___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v7 = (void *)managerByAccountID;
        id v8 = objc_msgSend(v6, "uuid", (void)v10);
        id v9 = [v7 objectForKeyedSubscript:v8];

        if ([v9 hasUnsavedChanges]) {
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v9 forKeyedSubscript:v6];
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }
}

+ (id)replicaManagerWithSerializedData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 isRepresentingDiscardedReplicaManager])
  {
    id v6 = objc_alloc_init(REMReplicaManager);
  }
  else
  {
    replica_manager::ReplicaManager::ReplicaManager((replica_manager::ReplicaManager *)v13);
    id v7 = [v5 managerData];
    id v8 = (char *)[v7 bytes];
    id v9 = [v5 managerData];
    LOBYTE(v8) = google::protobuf::MessageLite::ParseFromArray((google::protobuf::MessageLite *)v13, v8, [v9 length]);

    if (v8)
    {
      id v6 = [[REMReplicaManager alloc] initWithArchive:v13 error:a4];
      if (v6)
      {
        uint64_t v10 = [v5 version];
        [(REMReplicaManager *)v6 setMaxLastSavedVersion:v10];
        [(REMReplicaManager *)v6 setCurrentVersion:v10];
        long long v11 = v6;
      }
    }
    else if (a4)
    {
      +[REMError internalErrorWithDebugDescription:@"Cannot deserialize replica manager from input data"];
      id v6 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v6 = 0;
    }
    replica_manager::ReplicaManager::~ReplicaManager((replica_manager::ReplicaManager *)v13);
  }

  return v6;
}

- (id)l_serializedDataWithError:(id *)a3
{
  replica_manager::ReplicaManager::ReplicaManager((replica_manager::ReplicaManager *)v8);
  [(REMReplicaManager *)self encodeIntoArchive:v8];
  id v5 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:(int)replica_manager::ReplicaManager::ByteSize((replica_manager::ReplicaManager *)v8)];
  if (google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)v8, (void *)[v5 mutableBytes], objc_msgSend(v5, "length")))
  {
    id v6 = [[REMReplicaManagerSerializedData alloc] initWithManagerData:v5 version:[(REMReplicaManager *)self currentVersion]];
  }
  else if (a3)
  {
    +[REMError internalErrorWithDebugDescription:@"Cannot serialize replica manager to data"];
    id v6 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = 0;
  }

  replica_manager::ReplicaManager::~ReplicaManager((replica_manager::ReplicaManager *)v8);

  return v6;
}

- (id)serializedDataCappedAtMaxSize:(BOOL)a3 error:(id *)a4
{
  uint64_t v19 = 0;
  int v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy_;
  int64_t v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  if ([(REMReplicaManager *)self isPersistable])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__REMReplicaManager_serializedDataCappedAtMaxSize_error___block_invoke;
    v11[3] = &unk_1E61DBFD0;
    BOOL v12 = a3;
    v11[4] = self;
    v11[5] = &v19;
    v11[6] = &v13;
    [(REMReplicaManager *)self performLocked:v11];
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v9 = +[REMError internalErrorWithDebugDescription:@"Attempting to serialize a REMReplicaManager that is marked non-persistable"];
  uint64_t v10 = (void *)v14[5];
  v14[5] = v9;

  if (a4) {
LABEL_3:
  }
    *a4 = (id) v14[5];
LABEL_4:
  id v7 = (id)v20[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v7;
}

void __57__REMReplicaManager_serializedDataCappedAtMaxSize_error___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    if ([v3 exceededMaxSerializedSize])
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = +[REMReplicaManagerSerializedData serializedDataRepresentingDiscardedReplicaManager];
      MEMORY[0x1F41817F8]();
    }
    else
    {
      id v8 = *(void **)(a1 + 32);
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      id v20 = *(id *)(v9 + 40);
      uint64_t v10 = objc_msgSend(v8, "l_serializedDataWithError:", &v20);
      objc_storeStrong((id *)(v9 + 40), v20);
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      BOOL v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      uint64_t v13 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      if (v13)
      {
        id v14 = [v13 managerData];
        unint64_t v15 = [v14 length];

        if (v15 > 0x19000)
        {
          uint64_t v16 = +[REMReplicaManagerSerializedData serializedDataRepresentingDiscardedReplicaManager];
          uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
          id v18 = *(void **)(v17 + 40);
          *(void *)(v17 + 40) = v16;

          [*(id *)(a1 + 32) setExceededMaxSerializedSize:1];
        }
      }
    }
  }
  else
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    obuint64_t j = *(id *)(v4 + 40);
    uint64_t v5 = objc_msgSend(v3, "l_serializedDataWithError:", &obj);
    objc_storeStrong((id *)(v4 + 40), obj);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

- (void)didSaveVersion:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__REMReplicaManager_didSaveVersion___block_invoke;
  v3[3] = &unk_1E61DBFF8;
  v3[4] = self;
  v3[5] = a3;
  [(REMReplicaManager *)self performLocked:v3];
}

unint64_t __36__REMReplicaManager_didSaveVersion___block_invoke(uint64_t a1)
{
  unint64_t result = [*(id *)(a1 + 32) maxLastSavedVersion];
  if (result < *(void *)(a1 + 40))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "setMaxLastSavedVersion:");
  }
  return result;
}

+ (BOOL)disablesInMemoryOnlyCheck
{
  return disablesInMemoryOnlyCheck;
}

+ (void)setDisablesInMemoryOnlyCheck:(BOOL)a3
{
  disablesInMemoryOnlyCheck = a3;
}

+ (id)replicaManagerIfLoadedForAccountID:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy_;
  id v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  os_unfair_lock_lock((os_unfair_lock_t)&managerByAccountIDLock);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__REMReplicaManager_replicaManagerIfLoadedForAccountID___block_invoke;
  v7[3] = &unk_1E61DBFA8;
  id v8 = v3;
  uint64_t v9 = &v10;
  id v4 = v3;
  __56__REMReplicaManager_replicaManagerIfLoadedForAccountID___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock((os_unfair_lock_t)&managerByAccountIDLock);

  id v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __56__REMReplicaManager_replicaManagerIfLoadedForAccountID___block_invoke(uint64_t a1)
{
  int v2 = (void *)managerByAccountID;
  id v6 = [*(id *)(a1 + 32) uuid];
  uint64_t v3 = objc_msgSend(v2, "objectForKeyedSubscript:");
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

+ (void)setReplicaManager:(id)a3 forAccountID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&managerByAccountIDLock);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__REMReplicaManager_setReplicaManager_forAccountID___block_invoke;
  v9[3] = &unk_1E61DC020;
  id v10 = v6;
  id v11 = v5;
  id v7 = v5;
  id v8 = v6;
  __52__REMReplicaManager_setReplicaManager_forAccountID___block_invoke((uint64_t)v9);
  os_unfair_lock_unlock((os_unfair_lock_t)&managerByAccountIDLock);
}

void __52__REMReplicaManager_setReplicaManager_forAccountID___block_invoke(uint64_t a1)
{
  int v2 = (void *)managerByAccountID;
  if (!managerByAccountID)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v4 = (void *)managerByAccountID;
    managerByAccountID = v3;

    int v2 = (void *)managerByAccountID;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) uuid];
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5);
}

- (unint64_t)replicaEntryCount
{
  int v2 = [(REMReplicaManager *)self replicaEntries];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)availabilityOfFirstReplicaForCRDTID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__REMReplicaManager_availabilityOfFirstReplicaForCRDTID___block_invoke;
  v8[3] = &unk_1E61DC048;
  v8[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v5 = v4;
  [(REMReplicaManager *)self performLocked:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

void __57__REMReplicaManager_availabilityOfFirstReplicaForCRDTID___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) replicaEntries];
  id v8 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  unint64_t v3 = [v8 firstObject];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "inUse") ^ 1);
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

- (id)clockOfFirstReplicaForCRDTID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__REMReplicaManager_clockOfFirstReplicaForCRDTID___block_invoke;
  v8[3] = &unk_1E61DC048;
  v8[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v5 = v4;
  [(REMReplicaManager *)self performLocked:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

void __50__REMReplicaManager_clockOfFirstReplicaForCRDTID___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) replicaEntries];
  id v11 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];

  id v6 = [v11 firstObject];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 clockElementList];
    if (v8)
    {
      id v9 = NSNumber;
      v1 = [v7 clockElementList];
      int v2 = [v1 elements];
      unint64_t v3 = [v2 objectAtIndexedSubscript:0];
      id v10 = objc_msgSend(v9, "numberWithUnsignedLongLong:", objc_msgSend(v3, "clock"));
    }
    else
    {
      id v10 = 0;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v10);
    if (v8)
    {
    }
  }
}

- (BOOL)hasEqualPersistedEntriesAs:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = (REMReplicaManager *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    id v5 = [(REMReplicaManager *)self replicaUUIDs];
    id v6 = [(REMReplicaManager *)v4 replicaUUIDs];
    if (v5 == v6)
    {
    }
    else
    {
      id v7 = [(REMReplicaManager *)self replicaUUIDs];
      id v8 = [(REMReplicaManager *)v4 replicaUUIDs];
      char v9 = [v7 isEqual:v8];

      if ((v9 & 1) == 0) {
        goto LABEL_21;
      }
    }
    id v11 = [(REMReplicaManager *)self replicaEntries];
    uint64_t v12 = [v11 count];
    uint64_t v13 = [(REMReplicaManager *)v4 replicaEntries];
    uint64_t v14 = [v13 count];

    if (v12 != v14)
    {
LABEL_21:
      BOOL v10 = 0;
      goto LABEL_25;
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v15 = [(REMReplicaManager *)self replicaEntries];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v16)
    {
      uint64_t v29 = *(void *)v32;
      obuint64_t j = v15;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v32 != v29) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v19 = [(REMReplicaManager *)self replicaEntries];
          id v20 = [v19 objectForKeyedSubscript:v18];

          uint64_t v21 = [(REMReplicaManager *)v4 replicaEntries];
          id v22 = [v21 objectForKeyedSubscript:v18];

          uint64_t v23 = [v20 count];
          if (v23 != [v22 count])
          {
LABEL_22:

            BOOL v10 = 0;
            id v15 = obj;
            goto LABEL_24;
          }
          unint64_t v24 = 0;
          while (v24 < [v20 count])
          {
            id v25 = [v20 objectAtIndexedSubscript:v24];
            uint64_t v26 = [v22 objectAtIndexedSubscript:v24];
            char v27 = [v25 hasEqualPersistedPropertiesAs:v26];

            ++v24;
            if ((v27 & 1) == 0) {
              goto LABEL_22;
            }
          }
        }
        id v15 = obj;
        uint64_t v16 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
        BOOL v10 = 1;
        if (v16) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v10 = 1;
    }
LABEL_24:
  }
LABEL_25:

  return v10;
}

- (void)addRandomReplicaEntriesWithCount:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__REMReplicaManager_addRandomReplicaEntriesWithCount___block_invoke;
  v3[3] = &unk_1E61DBFF8;
  v3[4] = self;
  v3[5] = a3;
  [(REMReplicaManager *)self performLocked:v3];
}

uint64_t __54__REMReplicaManager_addRandomReplicaEntriesWithCount___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) replicaUUIDs];
  uint64_t v3 = [v2 count];

  if (!v3)
  {
    id v4 = [*(id *)(a1 + 32) replicaUUIDs];
    id v5 = [MEMORY[0x1E4F29128] UUID];
    [v4 addObject:v5];
  }
  if (*(uint64_t *)(a1 + 40) >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      id v7 = [MEMORY[0x1E4F29128] UUID];
      id v8 = [v7 UUIDString];

      char v9 = [[REMReplicaEntry alloc] initWithReplicaUUIDIndex:0 clockElementList:0 inUse:0 forClient:0];
      BOOL v10 = [MEMORY[0x1E4F1CA48] arrayWithObject:v9];
      id v11 = [*(id *)(a1 + 32) replicaEntries];
      [v11 setObject:v10 forKeyedSubscript:v8];

      ++v6;
    }
    while (v6 < *(void *)(a1 + 40));
  }
  uint64_t v12 = *(void **)(a1 + 32);
  uint64_t v13 = [v12 currentVersion] + 1;

  return [v12 setCurrentVersion:v13];
}

- (os_unfair_lock_s)ivarLock
{
  return self->_ivarLock;
}

- (void)setIvarLock:(os_unfair_lock_s)a3
{
  self->_ivarLock = a3;
}

- (BOOL)isPersistable
{
  return self->_isPersistable;
}

- (void)setIsPersistable:(BOOL)a3
{
  self->_isPersistable = a3;
}

- (NSMutableOrderedSet)replicaUUIDs
{
  return self->_replicaUUIDs;
}

- (void)setReplicaUUIDs:(id)a3
{
}

- (NSMutableDictionary)replicaEntries
{
  return self->_replicaEntries;
}

- (void)setReplicaEntries:(id)a3
{
}

- (unint64_t)currentVersion
{
  return self->_currentVersion;
}

- (void)setCurrentVersion:(unint64_t)a3
{
  self->_currentVersion = a3;
}

- (unint64_t)maxLastSavedVersion
{
  return self->_maxLastSavedVersion;
}

- (void)setMaxLastSavedVersion:(unint64_t)a3
{
  self->_maxLastSavedVersion = a3;
}

- (BOOL)exceededMaxSerializedSize
{
  return self->_exceededMaxSerializedSize;
}

- (void)setExceededMaxSerializedSize:(BOOL)a3
{
  self->_exceededMaxSerializedSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replicaEntries, 0);

  objc_storeStrong((id *)&self->_replicaUUIDs, 0);
}

- (void)l_checkoutReplicaUUIDForClient:(void *)a3 .cold.1(void *a1, uint8_t *buf, void *a3, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a1;
  _os_log_fault_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_FAULT, "Clock element list is incompatible with existing list {cliet: %@}", buf, 0xCu);
}

void __44__REMReplicaManager_updateVersionForClient___block_invoke_cold_1(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_0((uint64_t)a1, a2, a3, 5.778e-34);
  _os_log_fault_impl(&dword_1B9AA2000, v5, OS_LOG_TYPE_FAULT, "rem_log_fault_if (!entry.inUse) -- Client attempt to update replica while it is not in use {client: %@, replicaUUID: %@}", v4, 0x16u);
}

- (void)l_updateVersionOfEntry:(os_log_t)log forClient:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_FAULT, "rem_log_fault_if (comparisonResult != REMClockElementsComparisonResultDescending) -- Can only update with a newer version.", v1, 2u);
}

void __44__REMReplicaManager_returnReplicaForClient___block_invoke_cold_1(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_0((uint64_t)a1, a2, a3, 5.778e-34);
  _os_log_fault_impl(&dword_1B9AA2000, v5, OS_LOG_TYPE_FAULT, "rem_log_fault_if (!entry.inUse) -- Client attempts to return replicaUUID while it is not in use {client = %@, replicaUUID = %@}", v4, 0x16u);
}

@end