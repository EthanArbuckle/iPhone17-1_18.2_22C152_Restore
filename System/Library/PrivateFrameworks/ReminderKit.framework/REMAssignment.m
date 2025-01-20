@interface REMAssignment
+ (BOOL)isChangeTrackableFetchableModel;
+ (BOOL)isChangeTrackableModel;
+ (BOOL)rem_DA_supportsConcealedObjects;
+ (BOOL)rem_DA_supportsFetching;
+ (BOOL)supportsSecureCoding;
+ (NSArray)rem_DA_propertiesAffectingIsConcealed;
+ (NSString)cdEntityName;
+ (double)orderValueWithAssignedDate:(id)a3 objectIdentifier:(id)a4;
+ (id)newObjectID;
+ (id)nullifiedOriginatorAssignmentWithObjectID:(id)a3 accountID:(id)a4 reminderID:(id)a5 assigneeID:(id)a6 status:(int64_t)a7 assignedDate:(id)a8;
+ (id)objectIDWithUUID:(id)a3;
+ (id)rem_DA_deletedKeyFromConcealedModelObjectBlock;
+ (id)rem_DA_deletedKeyFromTombstoneBlock;
+ (id)rem_DA_fetchByObjectIDBlock;
+ (id)rem_DA_fetchByObjectIDsBlock;
- (BOOL)_debug_cdAssigneeLinked;
- (BOOL)_debug_cdOriginatorLinked;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAssignment:(id)a3;
- (BOOL)isOriginatorNullified;
- (NSDate)assignedDate;
- (NSString)description;
- (REMAssignment)initWithCoder:(id)a3;
- (REMAssignment)initWithObjectID:(id)a3 accountID:(id)a4 reminderID:(id)a5 assigneeID:(id)a6 originatorID:(id)a7 status:(int64_t)a8;
- (REMAssignment)initWithObjectID:(id)a3 accountID:(id)a4 reminderID:(id)a5 assigneeID:(id)a6 originatorID:(id)a7 status:(int64_t)a8 assignedDate:(id)a9;
- (REMObjectID)accountID;
- (REMObjectID)assigneeID;
- (REMObjectID)objectID;
- (REMObjectID)originatorID;
- (REMObjectID)reminderID;
- (double)orderValue;
- (int64_t)status;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAssignedDate:(id)a3;
- (void)set_debug_cdAssigneeLinked:(BOOL)a3;
- (void)set_debug_cdOriginatorLinked:(BOOL)a3;
@end

@implementation REMAssignment

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

+ (NSArray)rem_DA_propertiesAffectingIsConcealed
{
  v2 = _defaultPropertiesAffectingIsConcealed();
  v3 = [v2 arrayByAddingObject:@"assignee"];

  return (NSArray *)v3;
}

+ (id)rem_DA_fetchByObjectIDBlock
{
  return &__block_literal_global_366;
}

id __88__REMAssignment_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDBlock__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  v30[0] = v8;
  v9 = (void *)MEMORY[0x1E4F1C978];
  id v10 = a4;
  v11 = [v9 arrayWithObjects:v30 count:1];
  id v23 = 0;
  v12 = [v10 fetchAssignmentsWithObjectIDs:v11 includeConcealedObjects:a3 error:&v23];

  id v13 = v23;
  if ((unint64_t)[v12 count] >= 2)
  {
    v22 = +[REMLog changeTracking];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      __88__REMAssignment_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDBlock__block_invoke_cold_1();
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
      _os_log_error_impl(&dword_1B9AA2000, v15, OS_LOG_TYPE_ERROR, "REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: ERROR: LOOKATME Requested REMAssignment not found {objectID: %{public}@, includeConcealedObjects: %{public}@, error: %@}.", buf, 0x20u);
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
      _os_log_error_impl(&dword_1B9AA2000, v16, OS_LOG_TYPE_ERROR, "REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: ERROR: LOOKATME Failed to fetch REMAssignment {objectID: %{public}@, includeConcealedObjects: %{public}@, error: %@}.", buf, 0x20u);
    }
  }
  if (a5) {
    *a5 = v13;
  }

  return v14;
}

+ (id)rem_DA_fetchByObjectIDsBlock
{
  return &__block_literal_global_369;
}

id __89__REMAssignment_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDsBlock__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  v7 = (void *)MEMORY[0x1E4F1CA60];
  id v8 = a3;
  v9 = [v7 dictionary];
  id v17 = 0;
  id v10 = [v8 fetchAssignmentsWithObjectIDs:v6 includeConcealedObjects:0 error:&v17];

  id v11 = v17;
  if (v11)
  {
    v12 = +[REMLog changeTracking];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __89__REMAssignment_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDsBlock__block_invoke_cold_1();
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __89__REMAssignment_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDsBlock__block_invoke_370;
  v15[3] = &unk_1E61DD620;
  id v13 = v9;
  id v16 = v13;
  [v10 enumerateObjectsUsingBlock:v15];
  if (a4) {
    *a4 = v11;
  }

  return v13;
}

void __89__REMAssignment_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDsBlock__block_invoke_370(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 objectID];
  [v2 setObject:v3 forKey:v4];
}

+ (id)rem_DA_deletedKeyFromTombstoneBlock
{
  return &__block_literal_global_373;
}

REMDAAssignmentTombstone *__96__REMAssignment_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromTombstoneBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init(REMDAAssignmentTombstone);
  id v4 = [v2 objectIdentifier];
  [(REMDAAssignmentTombstone *)v3 setObjectIdentifier:v4];

  v5 = [v2 assignmentOwningReminderIdentifier];

  [(REMDAAssignmentTombstone *)v3 setOwningReminderIdentifier:v5];

  return v3;
}

+ (id)rem_DA_deletedKeyFromConcealedModelObjectBlock
{
  return &__block_literal_global_376;
}

REMDAAssignmentTombstone *__107__REMAssignment_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromConcealedModelObjectBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v4 = REMCheckedDynamicCast(v3, (uint64_t)v2);
  if (v4)
  {
    v5 = objc_alloc_init(REMDAAssignmentTombstone);
    id v6 = [v4 objectID];
    v7 = [v6 uuid];
    [(REMDAAssignmentTombstone *)v5 setObjectIdentifier:v7];

    id v8 = [v4 reminderID];
    v9 = [v8 uuid];
    [(REMDAAssignmentTombstone *)v5 setOwningReminderIdentifier:v9];
  }
  else
  {
    id v10 = +[REMLog changeTracking];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __107__REMAssignment_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromConcealedModelObjectBlock__block_invoke_cold_1();
    }

    v5 = 0;
  }

  return v5;
}

- (REMAssignment)initWithObjectID:(id)a3 accountID:(id)a4 reminderID:(id)a5 assigneeID:(id)a6 originatorID:(id)a7 status:(int64_t)a8
{
  v14 = (void *)MEMORY[0x1E4F1C9C8];
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = [v14 now];
  v21 = [(REMAssignment *)self initWithObjectID:v19 accountID:v18 reminderID:v17 assigneeID:v16 originatorID:v15 status:a8 assignedDate:v20];

  return v21;
}

- (REMAssignment)initWithObjectID:(id)a3 accountID:(id)a4 reminderID:(id)a5 assigneeID:(id)a6 originatorID:(id)a7 status:(int64_t)a8 assignedDate:(id)a9
{
  id v24 = a3;
  id v23 = a4;
  id v22 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)REMAssignment;
  id v18 = [(REMAssignment *)&v25 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_objectID, a3);
    objc_storeStrong((id *)&v19->_accountID, a4);
    objc_storeStrong((id *)&v19->_reminderID, a5);
    objc_storeStrong((id *)&v19->_assigneeID, a6);
    objc_storeStrong((id *)&v19->_originatorID, a7);
    v19->_status = a8;
    objc_storeStrong((id *)&v19->_assignedDate, a9);
    *(_WORD *)&v19->__debug_cdAssigneeLinked = 257;
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMAssignment)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)REMAssignment;
  v5 = [(REMAssignment *)&v21 init];
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

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assigneeID"];
    assigneeID = v5->_assigneeID;
    v5->_assigneeID = (REMObjectID *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originatorID"];
    originatorID = v5->_originatorID;
    v5->_originatorID = (REMObjectID *)v14;

    unint64_t v16 = [v4 decodeIntegerForKey:@"status"];
    if (v16 >= 2)
    {
      id v17 = os_log_create("com.apple.reminderkit", "default");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        -[REMAssignment initWithCoder:](v16, v17);
      }

      unint64_t v16 = 0;
    }
    v5->_status = v16;
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assignedDate"];
    assignedDate = v5->_assignedDate;
    v5->_assignedDate = (NSDate *)v18;

    v5->__debug_cdAssigneeLinked = [v4 decodeBoolForKey:@"_debug_cdAssigneeLinked"];
    v5->__debug_cdOriginatorLinked = [v4 decodeBoolForKey:@"_debug_cdOriginatorLinked"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  id v4 = [(REMAssignment *)self objectID];
  [v10 encodeObject:v4 forKey:@"objectID"];

  v5 = [(REMAssignment *)self accountID];
  [v10 encodeObject:v5 forKey:@"accountID"];

  uint64_t v6 = [(REMAssignment *)self reminderID];
  [v10 encodeObject:v6 forKey:@"reminderID"];

  v7 = [(REMAssignment *)self assigneeID];
  [v10 encodeObject:v7 forKey:@"assigneeID"];

  uint64_t v8 = [(REMAssignment *)self originatorID];
  [v10 encodeObject:v8 forKey:@"originatorID"];

  objc_msgSend(v10, "encodeInteger:forKey:", -[REMAssignment status](self, "status"), @"status");
  v9 = [(REMAssignment *)self assignedDate];
  [v10 encodeObject:v9 forKey:@"assignedDate"];

  objc_msgSend(v10, "encodeBool:forKey:", -[REMAssignment _debug_cdAssigneeLinked](self, "_debug_cdAssigneeLinked"), @"_debug_cdAssigneeLinked");
  objc_msgSend(v10, "encodeBool:forKey:", -[REMAssignment _debug_cdOriginatorLinked](self, "_debug_cdOriginatorLinked"), @"_debug_cdOriginatorLinked");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = REMDynamicCast(v5, (uint64_t)v4);

  if (v6) {
    BOOL v7 = [(REMAssignment *)self isEqualToAssignment:v6];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isEqualToAssignment:(id)a3
{
  id v4 = (REMAssignment *)a3;
  uint64_t v5 = v4;
  if (v4 != self)
  {
    uint64_t v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_23;
    }
    int64_t v7 = [(REMAssignment *)self status];
    if (v7 != [(REMAssignment *)v6 status]) {
      goto LABEL_23;
    }
    uint64_t v8 = [(REMAssignment *)self objectID];
    uint64_t v9 = [(REMAssignment *)v6 objectID];
    if (v8 == (void *)v9)
    {
    }
    else
    {
      id v10 = (void *)v9;
      id v11 = [(REMAssignment *)self objectID];
      uint64_t v12 = [(REMAssignment *)v6 objectID];
      int v13 = [v11 isEqual:v12];

      if (!v13) {
        goto LABEL_23;
      }
    }
    id v15 = [(REMAssignment *)self accountID];
    uint64_t v16 = [(REMAssignment *)v6 accountID];
    if (v15 == (void *)v16)
    {
    }
    else
    {
      id v17 = (void *)v16;
      uint64_t v18 = [(REMAssignment *)self accountID];
      id v19 = [(REMAssignment *)v6 accountID];
      int v20 = [v18 isEqual:v19];

      if (!v20) {
        goto LABEL_23;
      }
    }
    objc_super v21 = [(REMAssignment *)self reminderID];
    uint64_t v22 = [(REMAssignment *)v6 reminderID];
    if (v21 == (void *)v22)
    {
    }
    else
    {
      id v23 = (void *)v22;
      id v24 = [(REMAssignment *)self reminderID];
      objc_super v25 = [(REMAssignment *)v6 reminderID];
      int v26 = [v24 isEqual:v25];

      if (!v26) {
        goto LABEL_23;
      }
    }
    v27 = [(REMAssignment *)self assigneeID];
    uint64_t v28 = [(REMAssignment *)v6 assigneeID];
    if (v27 == (void *)v28)
    {
    }
    else
    {
      v29 = (void *)v28;
      v30 = [(REMAssignment *)self assigneeID];
      v31 = [(REMAssignment *)v6 assigneeID];
      int v32 = [v30 isEqual:v31];

      if (!v32) {
        goto LABEL_23;
      }
    }
    v33 = [(REMAssignment *)self originatorID];
    uint64_t v34 = [(REMAssignment *)v6 originatorID];
    if (v33 == (void *)v34)
    {
    }
    else
    {
      v35 = (void *)v34;
      v36 = [(REMAssignment *)self originatorID];
      v37 = [(REMAssignment *)v6 originatorID];
      int v38 = [v36 isEqual:v37];

      if (!v38)
      {
LABEL_23:
        char v14 = 0;
LABEL_24:

        goto LABEL_25;
      }
    }
    v40 = [(REMAssignment *)self assignedDate];
    uint64_t v41 = [(REMAssignment *)v6 assignedDate];
    if (v40 == (void *)v41)
    {
      char v14 = 1;
      v42 = v40;
    }
    else
    {
      v42 = (void *)v41;
      v43 = [(REMAssignment *)self assignedDate];
      v44 = [(REMAssignment *)v6 assignedDate];
      char v14 = [v43 isEqual:v44];
    }
    goto LABEL_24;
  }
  char v14 = 1;
LABEL_25:

  return v14;
}

- (unint64_t)hash
{
  id v2 = [(REMAssignment *)self objectID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)description
{
  char v14 = NSString;
  uint64_t v3 = objc_opt_class();
  id v4 = [(REMAssignment *)self objectID];
  uint64_t v5 = [(REMAssignment *)self reminderID];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[REMAssignment status](self, "status"));
  int64_t v7 = [(REMAssignment *)self assignedDate];
  uint64_t v8 = [(REMAssignment *)self originatorID];
  uint64_t v9 = [(REMAssignment *)self assigneeID];
  id v10 = objc_msgSend(NSNumber, "numberWithBool:", -[REMAssignment _debug_cdOriginatorLinked](self, "_debug_cdOriginatorLinked"));
  id v11 = objc_msgSend(NSNumber, "numberWithBool:", -[REMAssignment _debug_cdAssigneeLinked](self, "_debug_cdAssigneeLinked"));
  uint64_t v12 = [v14 stringWithFormat:@"<%@: %p objectID: %@, reminderID: %@, status: %@, date: %@, originatorID: %@, assigneeID: %@, originatorLinked: %@, assigneeLinked: %@>", v3, self, v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (BOOL)isOriginatorNullified
{
  id v2 = [(REMAssignment *)self originatorID];
  uint64_t v3 = +[REMSharee nullifiedAssignmentOriginatorID];
  char v4 = [v2 isEqual:v3];

  return v4;
}

- (double)orderValue
{
  uint64_t v3 = [(REMAssignment *)self assignedDate];
  char v4 = [(REMAssignment *)self objectID];
  uint64_t v5 = [v4 uuid];
  uint64_t v6 = [v5 UUIDString];
  +[REMAssignment orderValueWithAssignedDate:v3 objectIdentifier:v6];
  double v8 = v7;

  return v8;
}

+ (double)orderValueWithAssignedDate:(id)a3 objectIdentifier:(id)a4
{
  if (!a3) {
    return (double)(unint64_t)objc_msgSend(a4, "hash", v4, v5);
  }
  [a3 timeIntervalSinceReferenceDate];
  return result;
}

+ (id)newObjectID
{
  uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
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
  return (NSString *)@"REMCDAssignment";
}

- (int64_t)status
{
  return self->_status;
}

- (REMObjectID)assigneeID
{
  return self->_assigneeID;
}

- (REMObjectID)originatorID
{
  return self->_originatorID;
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

- (NSDate)assignedDate
{
  return self->_assignedDate;
}

- (void)setAssignedDate:(id)a3
{
}

- (BOOL)_debug_cdAssigneeLinked
{
  return self->__debug_cdAssigneeLinked;
}

- (void)set_debug_cdAssigneeLinked:(BOOL)a3
{
  self->__debug_cdAssigneeLinked = a3;
}

- (BOOL)_debug_cdOriginatorLinked
{
  return self->__debug_cdOriginatorLinked;
}

- (void)set_debug_cdOriginatorLinked:(BOOL)a3
{
  self->__debug_cdOriginatorLinked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assignedDate, 0);
  objc_storeStrong((id *)&self->_reminderID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_originatorID, 0);

  objc_storeStrong((id *)&self->_assigneeID, 0);
}

+ (id)nullifiedOriginatorAssignmentWithObjectID:(id)a3 accountID:(id)a4 reminderID:(id)a5 assigneeID:(id)a6 status:(int64_t)a7 assignedDate:(id)a8
{
  id v13 = a8;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  uint64_t v18 = [REMAssignment alloc];
  id v19 = +[REMSharee nullifiedAssignmentOriginatorID];
  int v20 = [(REMAssignment *)v18 initWithObjectID:v17 accountID:v16 reminderID:v15 assigneeID:v14 originatorID:v19 status:a7 assignedDate:v13];

  return v20;
}

void __88__REMAssignment_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDBlock__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_1B9AA2000, v0, v1, "rem_log_fault_if (assignments.count > 1) -- REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: FAULT: Fetch returned more than 1 assignment with 1 object ID.", v2, v3, v4, v5, v6);
}

void __89__REMAssignment_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDsBlock__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6_1();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_1(v0, v1), "localizedDescription");
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1B9AA2000, v3, v4, "REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: ERROR: Failed to fetch REMAssignment {objectIDs: %{public}@, error: %@}.", v5, v6, v7, v8, v9);
}

void __107__REMAssignment_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromConcealedModelObjectBlock__block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_2(&dword_1B9AA2000, v0, v1, "REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: LOOKATME: Can't cast concealed object to REMAssignment {concealedObject: %@}.", v2);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_FAULT, "Unknown REMAssignmentStatus %ld", (uint8_t *)&v2, 0xCu);
}

@end