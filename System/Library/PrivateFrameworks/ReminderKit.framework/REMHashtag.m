@interface REMHashtag
+ (BOOL)isChangeTrackableFetchableModel;
+ (BOOL)isChangeTrackableModel;
+ (BOOL)rem_DA_supportsConcealedObjects;
+ (BOOL)rem_DA_supportsFetching;
+ (BOOL)supportsSecureCoding;
+ (NSString)cdEntityName;
+ (id)newObjectID;
+ (id)objectIDWithUUID:(id)a3;
+ (id)rem_DA_deletedKeyFromConcealedModelObjectBlock;
+ (id)rem_DA_deletedKeyFromTombstoneBlock;
+ (id)rem_DA_fetchByObjectIDBlock;
+ (id)rem_DA_fetchByObjectIDsBlock;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToHashtag:(id)a3;
- (NSDate)creationDate;
- (NSString)description;
- (NSString)name;
- (REMHashtag)initWithCoder:(id)a3;
- (REMHashtag)initWithObjectID:(id)a3 accountID:(id)a4 reminderID:(id)a5 type:(int64_t)a6 name:(id)a7;
- (REMHashtag)initWithObjectID:(id)a3 accountID:(id)a4 reminderID:(id)a5 type:(int64_t)a6 name:(id)a7 creationDate:(id)a8;
- (REMObjectID)accountID;
- (REMObjectID)objectID;
- (REMObjectID)reminderID;
- (id)objectIdentifier;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMHashtag

+ (BOOL)isChangeTrackableModel
{
  return 1;
}

+ (BOOL)isChangeTrackableFetchableModel
{
  return 1;
}

+ (BOOL)rem_DA_supportsFetching
{
  return (objc_opt_respondsToSelector() & 1) != 0
      && [a1 performSelector:sel_isChangeTrackableFetchableModel] != 0;
}

+ (BOOL)rem_DA_supportsConcealedObjects
{
  return 1;
}

+ (id)rem_DA_fetchByObjectIDBlock
{
  return &__block_literal_global_397;
}

id __85__REMHashtag_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDBlock__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  v30[0] = v8;
  v9 = (void *)MEMORY[0x1E4F1C978];
  id v10 = a4;
  v11 = [v9 arrayWithObjects:v30 count:1];
  id v23 = 0;
  v12 = [v10 fetchHashtagsWithObjectIDs:v11 includeConcealedObjects:a3 error:&v23];

  id v13 = v23;
  if ((unint64_t)[v12 count] >= 2)
  {
    v22 = +[REMLog changeTracking];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      __85__REMHashtag_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDBlock__block_invoke_cold_1();
    }
  }
  v14 = [v12 anyObject];
  if (v13 && [v13 code] == -3000 || !objc_msgSend(v12, "count"))
  {
    v15 = +[REMLog changeTracking];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v18 = [NSNumber numberWithBool:a3];
      v19 = [v13 localizedDescription];
      *(_DWORD *)buf = 138543874;
      id v25 = v8;
      __int16 v26 = 2114;
      v27 = v18;
      __int16 v28 = 2112;
      v29 = v19;
      _os_log_error_impl(&dword_1B9AA2000, v15, OS_LOG_TYPE_ERROR, "REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: ERROR: LOOKATME Requested REMHashtag not found {objectID: %{public}@, includeConcealedObjects: %{public}@, error: %@}.", buf, 0x20u);
    }
  }
  if (v13 && [v13 code] != -3000)
  {
    v16 = +[REMLog changeTracking];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v20 = [NSNumber numberWithBool:a3];
      v21 = [v13 localizedDescription];
      *(_DWORD *)buf = 138543874;
      id v25 = v8;
      __int16 v26 = 2114;
      v27 = v20;
      __int16 v28 = 2112;
      v29 = v21;
      _os_log_error_impl(&dword_1B9AA2000, v16, OS_LOG_TYPE_ERROR, "REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: ERROR: LOOKATME Failed to fetch REMHashtag {objectID: %{public}@, includeConcealedObjects: %{public}@, error: %@}.", buf, 0x20u);
    }
  }
  if (a5) {
    *a5 = v13;
  }

  return v14;
}

+ (id)rem_DA_fetchByObjectIDsBlock
{
  return &__block_literal_global_399;
}

id __86__REMHashtag_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDsBlock__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  v7 = (void *)MEMORY[0x1E4F1CA60];
  id v8 = a3;
  v9 = [v7 dictionary];
  id v17 = 0;
  id v10 = [v8 fetchHashtagsWithObjectIDs:v6 includeConcealedObjects:0 error:&v17];

  id v11 = v17;
  if (v11)
  {
    v12 = +[REMLog changeTracking];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __86__REMHashtag_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDsBlock__block_invoke_cold_1();
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__REMHashtag_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDsBlock__block_invoke_400;
  v15[3] = &unk_1E61DD648;
  id v13 = v9;
  id v16 = v13;
  [v10 enumerateObjectsUsingBlock:v15];
  if (a4) {
    *a4 = v11;
  }

  return v13;
}

void __86__REMHashtag_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDsBlock__block_invoke_400(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 objectID];
  [v2 setObject:v3 forKey:v4];
}

+ (id)rem_DA_deletedKeyFromTombstoneBlock
{
  return &__block_literal_global_403;
}

REMDAHashtagTombstone *__93__REMHashtag_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromTombstoneBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init(REMDAHashtagTombstone);
  id v4 = [v2 objectIdentifier];
  [(REMDAHashtagTombstone *)v3 setObjectIdentifier:v4];

  v5 = [v2 hashtagName];
  [(REMDAHashtagTombstone *)v3 setName:v5];

  id v6 = [v2 hashtagReminderIdentifier];

  [(REMDAHashtagTombstone *)v3 setReminderIdentifier:v6];

  return v3;
}

+ (id)rem_DA_deletedKeyFromConcealedModelObjectBlock
{
  return &__block_literal_global_406;
}

REMDAHashtagTombstone *__104__REMHashtag_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromConcealedModelObjectBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v4 = REMCheckedDynamicCast(v3, (uint64_t)v2);
  if (v4)
  {
    v5 = objc_alloc_init(REMDAHashtagTombstone);
    id v6 = [v4 objectID];
    v7 = [v6 uuid];
    [(REMDAHashtagTombstone *)v5 setObjectIdentifier:v7];

    id v8 = [v4 name];
    [(REMDAHashtagTombstone *)v5 setName:v8];

    v9 = [v4 reminderID];
    id v10 = [v9 uuid];
    [(REMDAHashtagTombstone *)v5 setReminderIdentifier:v10];
  }
  else
  {
    id v11 = +[REMLog changeTracking];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __104__REMHashtag_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromConcealedModelObjectBlock__block_invoke_cold_1();
    }

    v5 = 0;
  }

  return v5;
}

- (REMHashtag)initWithObjectID:(id)a3 accountID:(id)a4 reminderID:(id)a5 type:(int64_t)a6 name:(id)a7
{
  v12 = (void *)MEMORY[0x1E4F1C9C8];
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [v12 now];
  v18 = [(REMHashtag *)self initWithObjectID:v16 accountID:v15 reminderID:v14 type:a6 name:v13 creationDate:v17];

  return v18;
}

- (REMHashtag)initWithObjectID:(id)a3 accountID:(id)a4 reminderID:(id)a5 type:(int64_t)a6 name:(id)a7 creationDate:(id)a8
{
  id v22 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)REMHashtag;
  v18 = [(REMHashtag *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_objectID, a3);
    objc_storeStrong((id *)&v19->_accountID, a4);
    objc_storeStrong((id *)&v19->_reminderID, a5);
    v19->_type = a6;
    objc_storeStrong((id *)&v19->_name, a7);
    objc_storeStrong((id *)&v19->_creationDate, a8);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMHashtag)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)REMHashtag;
  v5 = [(REMHashtag *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"objectID"];
    objectID = v5->_objectID;
    v5->_objectID = (REMObjectID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountID"];
    accountID = v5->_accountID;
    v5->_accountID = (REMObjectID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reminderID"];
    reminderID = v5->_reminderID;
    v5->_reminderID = (REMObjectID *)v10;

    unint64_t v12 = [v4 decodeIntegerForKey:@"type"];
    if (v12 >= 2)
    {
      id v13 = os_log_create("com.apple.reminderkit", "default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        -[REMHashtag initWithCoder:](v12, v13);
      }

      unint64_t v12 = 0;
    }
    v5->_type = v12;
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(REMHashtag *)self objectID];
  [v4 encodeObject:v5 forKey:@"objectID"];

  uint64_t v6 = [(REMHashtag *)self accountID];
  [v4 encodeObject:v6 forKey:@"accountID"];

  v7 = [(REMHashtag *)self reminderID];
  [v4 encodeObject:v7 forKey:@"reminderID"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[REMHashtag type](self, "type"), @"type");
  uint64_t v8 = [(REMHashtag *)self name];
  [v4 encodeObject:v8 forKey:@"name"];

  id v9 = [(REMHashtag *)self creationDate];
  [v4 encodeObject:v9 forKey:@"creationDate"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = REMDynamicCast(v5, (uint64_t)v4);

  if (v6) {
    BOOL v7 = [(REMHashtag *)self isEqualToHashtag:v6];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isEqualToHashtag:(id)a3
{
  id v4 = (REMHashtag *)a3;
  uint64_t v5 = v4;
  if (v4 != self)
  {
    uint64_t v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_19;
    }
    int64_t v7 = [(REMHashtag *)self type];
    if (v7 != [(REMHashtag *)v6 type]) {
      goto LABEL_19;
    }
    uint64_t v8 = [(REMHashtag *)self objectID];
    uint64_t v9 = [(REMHashtag *)v6 objectID];
    if (v8 == (void *)v9)
    {
    }
    else
    {
      uint64_t v10 = (void *)v9;
      id v11 = [(REMHashtag *)self objectID];
      unint64_t v12 = [(REMHashtag *)v6 objectID];
      int v13 = [v11 isEqual:v12];

      if (!v13) {
        goto LABEL_19;
      }
    }
    id v15 = [(REMHashtag *)self accountID];
    uint64_t v16 = [(REMHashtag *)v6 accountID];
    if (v15 == (void *)v16)
    {
    }
    else
    {
      id v17 = (void *)v16;
      v18 = [(REMHashtag *)self accountID];
      objc_super v19 = [(REMHashtag *)v6 accountID];
      int v20 = [v18 isEqual:v19];

      if (!v20) {
        goto LABEL_19;
      }
    }
    v21 = [(REMHashtag *)self reminderID];
    uint64_t v22 = [(REMHashtag *)v6 reminderID];
    if (v21 == (void *)v22)
    {
    }
    else
    {
      objc_super v23 = (void *)v22;
      v24 = [(REMHashtag *)self reminderID];
      id v25 = [(REMHashtag *)v6 reminderID];
      int v26 = [v24 isEqual:v25];

      if (!v26) {
        goto LABEL_19;
      }
    }
    v27 = [(REMHashtag *)self name];
    uint64_t v28 = [(REMHashtag *)v6 name];
    if (v27 == (void *)v28)
    {
    }
    else
    {
      v29 = (void *)v28;
      v30 = [(REMHashtag *)self name];
      v31 = [(REMHashtag *)v6 name];
      int v32 = [v30 isEqual:v31];

      if (!v32)
      {
LABEL_19:
        char v14 = 0;
LABEL_20:

        goto LABEL_21;
      }
    }
    v34 = [(REMHashtag *)self creationDate];
    uint64_t v35 = [(REMHashtag *)v6 creationDate];
    if (v34 == (void *)v35)
    {
      char v14 = 1;
      v36 = v34;
    }
    else
    {
      v36 = (void *)v35;
      v37 = [(REMHashtag *)self creationDate];
      v38 = [(REMHashtag *)v6 creationDate];
      char v14 = [v37 isEqual:v38];
    }
    goto LABEL_20;
  }
  char v14 = 1;
LABEL_21:

  return v14;
}

- (unint64_t)hash
{
  id v2 = [(REMHashtag *)self objectID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(REMHashtag *)self objectID];
  uint64_t v6 = [(REMHashtag *)self reminderID];
  int64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[REMHashtag type](self, "type"));
  uint64_t v8 = [(REMHashtag *)self name];
  uint64_t v9 = [(REMHashtag *)self creationDate];
  uint64_t v10 = [v3 stringWithFormat:@"<%@: %p objectID: %@, reminderID: %@, type: %@, name: %@, creation date: %@>", v4, self, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (id)objectIdentifier
{
  id v2 = [(REMHashtag *)self objectID];
  unint64_t v3 = [v2 uuid];
  uint64_t v4 = [v3 UUIDString];

  return v4;
}

+ (id)newObjectID
{
  unint64_t v3 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v4 = [a1 objectIDWithUUID:v3];

  return v4;
}

+ (id)objectIDWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 cdEntityName];
  uint64_t v6 = +[REMObjectID objectIDWithUUID:v4 entityName:v5];

  return v6;
}

+ (NSString)cdEntityName
{
  return (NSString *)@"REMCDHashtag";
}

- (int64_t)type
{
  return self->_type;
}

- (REMObjectID)objectID
{
  return self->_objectID;
}

- (REMObjectID)accountID
{
  return self->_accountID;
}

- (REMObjectID)reminderID
{
  return self->_reminderID;
}

- (NSString)name
{
  return self->_name;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_reminderID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);

  objc_storeStrong((id *)&self->_objectID, 0);
}

void __85__REMHashtag_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDBlock__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_1B9AA2000, v0, v1, "rem_log_fault_if (hashtags.count > 1) -- REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: FAULT: Fetch returned more than 1 hashtag with 1 object ID.", v2, v3, v4, v5, v6);
}

void __86__REMHashtag_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDsBlock__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6_1();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_1(v0, v1), "localizedDescription");
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1B9AA2000, v3, v4, "REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: ERROR: Failed to fetch REMHashtag {objectIDs: %{public}@, error: %@}.", v5, v6, v7, v8, v9);
}

void __104__REMHashtag_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromConcealedModelObjectBlock__block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_2(&dword_1B9AA2000, v0, v1, "REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: LOOKATME: Can't cast concealed object to REMHashtag {concealedObject: %@}.", v2);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_FAULT, "Unknown REMHashtagType %ld", (uint8_t *)&v2, 0xCu);
}

@end