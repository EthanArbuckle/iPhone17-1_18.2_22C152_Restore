@interface _REMNSPersistentHistoryChangeStorage
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSSet)updatedProperties;
- (REMNSPersistentHistoryChangeTombstone)tombstone;
- (_REMChangedObjectIDStorage)changedObjectIDStorage;
- (_REMNSPersistentHistoryChangeStorage)initWithCoder:(id)a3;
- (int64_t)changeID;
- (int64_t)changeType;
- (void)encodeWithCoder:(id)a3;
- (void)setChangeID:(int64_t)a3;
- (void)setChangeType:(int64_t)a3;
- (void)setChangedObjectIDStorage:(id)a3;
- (void)setTombstone:(id)a3;
- (void)setUpdatedProperties:(id)a3;
@end

@implementation _REMNSPersistentHistoryChangeStorage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[_REMNSPersistentHistoryChangeStorage changeID](self, "changeID"), @"changeID");
  v5 = [(_REMNSPersistentHistoryChangeStorage *)self changedObjectIDStorage];
  [v4 encodeObject:v5 forKey:@"changedObjectID"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[_REMNSPersistentHistoryChangeStorage changeType](self, "changeType"), @"changeType");
  v6 = [(_REMNSPersistentHistoryChangeStorage *)self tombstone];
  [v4 encodeObject:v6 forKey:@"tombstone"];

  id v7 = [(_REMNSPersistentHistoryChangeStorage *)self updatedProperties];
  [v4 encodeObject:v7 forKey:@"updatedProperties"];
}

- (_REMNSPersistentHistoryChangeStorage)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_REMNSPersistentHistoryChangeStorage;
  v5 = [(_REMNSPersistentHistoryChangeStorage *)&v19 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"changedObjectID"];
    changedObjectIDStorage = v5->_changedObjectIDStorage;
    v5->_changedObjectIDStorage = v6;
    v8 = v6;

    v5->_changeID = [v4 decodeInt64ForKey:@"changeID"];
    unint64_t v9 = [v4 decodeIntegerForKey:@"changeType"];
    if (v9 >= 3)
    {
      v10 = os_log_create("com.apple.reminderkit", "default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[_REMNSPersistentHistoryChangeStorage initWithCoder:]();
      }

      unint64_t v9 = 1;
    }
    v5->_changeType = v9;
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tombstone"];
    tombstone = v5->_tombstone;
    v5->_tombstone = (REMNSPersistentHistoryChangeTombstone *)v11;

    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"updatedProperties"];
    updatedProperties = v5->_updatedProperties;
    v5->_updatedProperties = (NSSet *)v16;
  }
  return v5;
}

- (int64_t)changeID
{
  return self->_changeID;
}

- (void)setChangeID:(int64_t)a3
{
  self->_changeID = a3;
}

- (_REMChangedObjectIDStorage)changedObjectIDStorage
{
  return self->_changedObjectIDStorage;
}

- (void)setChangedObjectIDStorage:(id)a3
{
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(int64_t)a3
{
  self->_changeType = a3;
}

- (REMNSPersistentHistoryChangeTombstone)tombstone
{
  return self->_tombstone;
}

- (void)setTombstone:(id)a3
{
}

- (NSSet)updatedProperties
{
  return self->_updatedProperties;
}

- (void)setUpdatedProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedProperties, 0);
  objc_storeStrong((id *)&self->_tombstone, 0);

  objc_storeStrong((id *)&self->_changedObjectIDStorage, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_REMNSPersistentHistoryChangeStorage *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_12;
    }
    int64_t v7 = [(_REMNSPersistentHistoryChangeStorage *)self changeID];
    if (v7 != [(_REMNSPersistentHistoryChangeStorage *)v6 changeID]) {
      goto LABEL_12;
    }
    v8 = [(_REMNSPersistentHistoryChangeStorage *)self changedObjectIDStorage];
    uint64_t v9 = [(_REMNSPersistentHistoryChangeStorage *)v6 changedObjectIDStorage];
    if (v8 == (void *)v9)
    {
    }
    else
    {
      v10 = (void *)v9;
      uint64_t v11 = [(_REMNSPersistentHistoryChangeStorage *)self changedObjectIDStorage];
      v12 = [(_REMNSPersistentHistoryChangeStorage *)v6 changedObjectIDStorage];
      int v13 = [v11 isEqual:v12];

      if (!v13) {
        goto LABEL_12;
      }
    }
    int64_t v15 = [(_REMNSPersistentHistoryChangeStorage *)self changeType];
    if (v15 == [(_REMNSPersistentHistoryChangeStorage *)v6 changeType])
    {
      uint64_t v16 = [(_REMNSPersistentHistoryChangeStorage *)self tombstone];
      uint64_t v17 = [(_REMNSPersistentHistoryChangeStorage *)v6 tombstone];
      if (v16 == (void *)v17)
      {
      }
      else
      {
        v18 = (void *)v17;
        objc_super v19 = [(_REMNSPersistentHistoryChangeStorage *)self tombstone];
        v20 = [(_REMNSPersistentHistoryChangeStorage *)v6 tombstone];
        int v21 = [v19 isEqual:v20];

        if (!v21) {
          goto LABEL_12;
        }
      }
      v23 = [(_REMNSPersistentHistoryChangeStorage *)self updatedProperties];
      uint64_t v24 = [(_REMNSPersistentHistoryChangeStorage *)v6 updatedProperties];
      if (v23 == (void *)v24)
      {
        char v14 = 1;
        v25 = v23;
      }
      else
      {
        v25 = (void *)v24;
        v26 = [(_REMNSPersistentHistoryChangeStorage *)self updatedProperties];
        v27 = [(_REMNSPersistentHistoryChangeStorage *)v6 updatedProperties];
        char v14 = [v26 isEqual:v27];
      }
      goto LABEL_13;
    }
LABEL_12:
    char v14 = 0;
LABEL_13:

    goto LABEL_14;
  }
  char v14 = 1;
LABEL_14:

  return v14;
}

- (void)initWithCoder:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_1B9AA2000, v0, OS_LOG_TYPE_FAULT, "Unknown REMChangeType %ld", v1, 0xCu);
}

@end