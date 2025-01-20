@interface REMNSPersistentHistoryChange
+ (BOOL)supportsSecureCoding;
+ (id)shortStringForChangeType:(int64_t)a3;
+ (id)stringForChangeType:(int64_t)a3;
- (BOOL)isCoalesced;
- (BOOL)isEqual:(id)a3;
- (NSArray)coalescedChanges;
- (NSPersistentHistoryChange)persistentHistoryChange;
- (REMChangeTransaction)internal_ChangeTransaction;
- (REMNSPersistentHistoryChange)initWithCoder:(id)a3;
- (REMNSPersistentHistoryChange)initWithPersistentHistoryChange:(id)a3;
- (REMNSPersistentHistoryChange)initWithStorage:(id)a3;
- (REMObjectID)cachedChangedREMObjectID;
- (_REMNSPersistentHistoryChangeStorage)storage;
- (id)changedManagedObjectID;
- (id)changedObjectID;
- (id)copyForCoalescing;
- (id)description;
- (id)tombstone;
- (id)updatedProperties;
- (int64_t)changeID;
- (int64_t)changeType;
- (void)changedObjectID;
- (void)encodeWithCoder:(id)a3;
- (void)resolveObjectIDWithUUID:(id)a3 entityName:(id)a4;
- (void)setCachedChangedREMObjectID:(id)a3;
- (void)setCoalescedChanges:(id)a3;
- (void)setInternal_ChangeTransaction:(id)a3;
- (void)setIsCoalesced:(BOOL)a3;
- (void)setStorage:(id)a3;
@end

@implementation REMNSPersistentHistoryChange

- (REMNSPersistentHistoryChange)initWithStorage:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)REMNSPersistentHistoryChange;
    v6 = [(REMNSPersistentHistoryChange *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_storage, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (REMNSPersistentHistoryChange)initWithPersistentHistoryChange:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(_REMNSPersistentHistoryChangeStorage);
    -[_REMNSPersistentHistoryChangeStorage setChangeID:](v5, "setChangeID:", [v4 changeID]);
    -[_REMNSPersistentHistoryChangeStorage setChangeType:](v5, "setChangeType:", [v4 changeType]);
    v6 = [v4 updatedProperties];
    v7 = [v6 valueForKey:@"name"];
    [(_REMNSPersistentHistoryChangeStorage *)v5 setUpdatedProperties:v7];

    v8 = [REMNSPersistentHistoryChangeTombstone alloc];
    v9 = [v4 tombstone];
    objc_super v10 = [(REMNSPersistentHistoryChangeTombstone *)v8 initWithDictionary:v9];
    [(_REMNSPersistentHistoryChangeStorage *)v5 setTombstone:v10];

    [(_REMNSPersistentHistoryChangeStorage *)v5 setChangedObjectIDStorage:0];
    v11 = [(REMNSPersistentHistoryChange *)self initWithStorage:v5];
    v12 = v11;
    if (v11) {
      objc_storeWeak((id *)&v11->_persistentHistoryChange, v4);
    }
    self = v12;

    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)changedManagedObjectID
{
  v2 = [(REMNSPersistentHistoryChange *)self persistentHistoryChange];
  v3 = [v2 changedObjectID];

  return v3;
}

- (void)resolveObjectIDWithUUID:(id)a3 entityName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v9 = [[_REMChangedObjectIDStorage alloc] initWithUUID:v7 entityName:v6];

  v8 = [(REMNSPersistentHistoryChange *)self storage];
  [v8 setChangedObjectIDStorage:v9];
}

- (id)description
{
  v3 = NSString;
  int64_t v4 = [(REMNSPersistentHistoryChange *)self changeID];
  id v5 = +[REMNSPersistentHistoryChange shortStringForChangeType:[(REMNSPersistentHistoryChange *)self changeType]];
  id v6 = [(REMNSPersistentHistoryChange *)self persistentHistoryChange];
  id v7 = [v6 changedObjectID];
  v8 = [(REMNSPersistentHistoryChange *)self storage];
  v9 = [v8 changedObjectIDStorage];
  objc_super v10 = [v3 stringWithFormat:@"<REMNSPersistentHistoryChange - changeID(%lld) changeType(%@) mocID(%@) remID(%@)>", v4, v5, v7, v9];

  return v10;
}

- (int64_t)changeID
{
  v2 = [(REMNSPersistentHistoryChange *)self storage];
  int64_t v3 = [v2 changeID];

  return v3;
}

- (id)changedObjectID
{
  int64_t v3 = [(REMNSPersistentHistoryChange *)self cachedChangedREMObjectID];

  if (v3)
  {
    int64_t v4 = [(REMNSPersistentHistoryChange *)self cachedChangedREMObjectID];
    goto LABEL_13;
  }
  id v5 = [(REMNSPersistentHistoryChange *)self storage];
  id v6 = [v5 changedObjectIDStorage];

  if (!v6)
  {
    id v7 = +[REMLog changeTracking];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[REMNSPersistentHistoryChange changedObjectID]();
    }
    goto LABEL_11;
  }
  id v7 = [v6 entityName];
  if (!v7)
  {
    objc_super v10 = +[REMLog changeTracking];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[REMNSPersistentHistoryChange changedObjectID]();
    }

LABEL_11:
    int64_t v4 = 0;
    goto LABEL_12;
  }
  v8 = [v6 uuid];
  v9 = [v6 entityName];
  int64_t v4 = +[REMObjectID objectIDWithUUID:v8 entityName:v9];

  [(REMNSPersistentHistoryChange *)self setCachedChangedREMObjectID:v4];
LABEL_12:

LABEL_13:

  return v4;
}

- (int64_t)changeType
{
  v2 = [(REMNSPersistentHistoryChange *)self storage];
  int64_t v3 = [v2 changeType];

  return v3;
}

- (id)tombstone
{
  v2 = [(REMNSPersistentHistoryChange *)self storage];
  int64_t v3 = [v2 tombstone];

  return v3;
}

+ (id)shortStringForChangeType:(int64_t)a3
{
  int64_t v3 = [a1 stringForChangeType:a3];
  int64_t v4 = [v3 stringByReplacingOccurrencesOfString:@"REMChangeType" withString:&stru_1F1339A18];

  return v4;
}

+ (id)stringForChangeType:(int64_t)a3
{
  if ((unint64_t)a3 < 3) {
    return off_1E61DD0F8[a3];
  }
  int64_t v4 = +[REMLog changeTracking];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    +[REMNSPersistentHistoryChange stringForChangeType:]();
  }

  return 0;
}

- (id)updatedProperties
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(REMNSPersistentHistoryChange *)self storage];
  int64_t v4 = [v3 updatedProperties];

  if (v4) {
    [MEMORY[0x1E4F1CA80] setWithSet:v4];
  }
  else {
  id v5 = [MEMORY[0x1E4F1CA80] set];
  }
  if ([(REMNSPersistentHistoryChange *)self isCoalesced])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = [(REMNSPersistentHistoryChange *)self coalescedChanges];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) updatedProperties];
          if (v11) {
            [v5 unionSet:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }

  return v5;
}

- (id)copyForCoalescing
{
  int64_t v3 = [REMNSPersistentHistoryChange alloc];
  int64_t v4 = [(REMNSPersistentHistoryChange *)self storage];
  id v5 = [(REMNSPersistentHistoryChange *)v3 initWithStorage:v4];

  id v6 = [(REMNSPersistentHistoryChange *)self internal_ChangeTransaction];
  [(REMNSPersistentHistoryChange *)v5 setInternal_ChangeTransaction:v6];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMNSPersistentHistoryChange *)self storage];
  [v4 encodeObject:v5 forKey:@"storage"];
}

- (REMNSPersistentHistoryChange)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storage"];

  id v6 = [(REMNSPersistentHistoryChange *)self initWithStorage:v5];
  return v6;
}

- (REMChangeTransaction)internal_ChangeTransaction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internal_ChangeTransaction);

  return (REMChangeTransaction *)WeakRetained;
}

- (void)setInternal_ChangeTransaction:(id)a3
{
}

- (BOOL)isCoalesced
{
  return self->_isCoalesced;
}

- (void)setIsCoalesced:(BOOL)a3
{
  self->_isCoalesced = a3;
}

- (NSArray)coalescedChanges
{
  return self->_coalescedChanges;
}

- (void)setCoalescedChanges:(id)a3
{
}

- (_REMNSPersistentHistoryChangeStorage)storage
{
  return (_REMNSPersistentHistoryChangeStorage *)objc_getProperty(self, a2, 72, 1);
}

- (void)setStorage:(id)a3
{
}

- (NSPersistentHistoryChange)persistentHistoryChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_persistentHistoryChange);

  return (NSPersistentHistoryChange *)WeakRetained;
}

- (REMObjectID)cachedChangedREMObjectID
{
  return (REMObjectID *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCachedChangedREMObjectID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedChangedREMObjectID, 0);
  objc_destroyWeak((id *)&self->_persistentHistoryChange);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_coalescedChanges, 0);

  objc_destroyWeak((id *)&self->_internal_ChangeTransaction);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REMNSPersistentHistoryChange *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [(REMNSPersistentHistoryChange *)self storage];
      uint64_t v8 = [(REMNSPersistentHistoryChange *)v6 storage];
      if (v7 == (void *)v8)
      {
        char v12 = 1;
        uint64_t v9 = v7;
      }
      else
      {
        uint64_t v9 = (void *)v8;
        objc_super v10 = [(REMNSPersistentHistoryChange *)self storage];
        v11 = [(REMNSPersistentHistoryChange *)v6 storage];
        char v12 = [v10 isEqual:v11];
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12;
}

- (void)changedObjectID
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1B9AA2000, v0, OS_LOG_TYPE_ERROR, "Cannot convert changedObjectIDStorage to changedObjectID because entityName is nil in persistentHistoryChange {change: %@}", v1, 0xCu);
}

+ (void)stringForChangeType:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_1B9AA2000, v0, OS_LOG_TYPE_FAULT, "Unexpected REMChangeType {type: %lu}", v1, 0xCu);
}

@end