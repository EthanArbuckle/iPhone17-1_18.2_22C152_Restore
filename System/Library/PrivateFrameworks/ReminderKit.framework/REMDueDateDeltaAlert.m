@interface REMDueDateDeltaAlert
+ (BOOL)supportsSecureCoding;
+ (NSString)cdEntityName;
+ (id)newObjectID;
+ (id)objectIDWithUUID:(id)a3;
+ (void)newObjectID;
- (BOOL)isContentEqual:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)acknowledgedDate;
- (NSDate)creationDate;
- (NSUUID)identifier;
- (REMDueDateDeltaAlert)initWithCoder:(id)a3;
- (REMDueDateDeltaAlert)initWithIdentifier:(id)a3 reminderID:(id)a4 accountID:(id)a5 dueDateDelta:(id)a6 creationDate:(id)a7 acknowledgedDate:(id)a8 minimumSupportedAppVersion:(int64_t)a9;
- (REMDueDateDeltaInterval)dueDateDelta;
- (REMObjectID)accountID;
- (REMObjectID)remObjectID;
- (REMObjectID)reminderID;
- (id)description;
- (int64_t)minimumSupportedAppVersion;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMDueDateDeltaAlert

- (REMDueDateDeltaAlert)initWithIdentifier:(id)a3 reminderID:(id)a4 accountID:(id)a5 dueDateDelta:(id)a6 creationDate:(id)a7 acknowledgedDate:(id)a8 minimumSupportedAppVersion:(int64_t)a9
{
  id v16 = a3;
  id v17 = a4;
  id v24 = a5;
  id v23 = a6;
  id v22 = a7;
  id v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)REMDueDateDeltaAlert;
  v19 = [(REMDueDateDeltaAlert *)&v25 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_identifier, a3);
    objc_storeStrong((id *)&v20->_reminderID, a4);
    objc_storeStrong((id *)&v20->_accountID, a5);
    objc_storeStrong((id *)&v20->_dueDateDelta, a6);
    objc_storeStrong((id *)&v20->_creationDate, a7);
    objc_storeStrong((id *)&v20->_acknowledgedDate, a8);
    v20->_minimumSupportedAppVersion = a9;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMDueDateDeltaAlert)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)REMDueDateDeltaAlert;
  v5 = [(REMDueDateDeltaAlert *)&v28 init];
  if (!v5) {
    goto LABEL_8;
  }
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reminderID"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountID"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dueDateDelta"];
  v11 = (REMDueDateDeltaInterval *)v10;
  if (!v6)
  {
    objc_super v25 = +[REMLogStore read];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      -[REMDueDateDeltaAlert initWithCoder:]();
    }
    v26 = "identifier";
    goto LABEL_24;
  }
  if (!v7)
  {
    objc_super v25 = +[REMLogStore read];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      -[REMDueDateDeltaAlert initWithCoder:]();
    }
    v26 = "reminderID";
    goto LABEL_24;
  }
  if (!v8)
  {
    objc_super v25 = +[REMLogStore read];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      -[REMDueDateDeltaAlert initWithCoder:]();
    }
    v26 = "accountID";
    goto LABEL_24;
  }
  if (!v9)
  {
    objc_super v25 = +[REMLogStore read];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      -[REMDueDateDeltaAlert initWithCoder:].cold.4();
    }
    v26 = "creationDate";
    goto LABEL_24;
  }
  if (!v10)
  {
    objc_super v25 = +[REMLogStore read];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      -[REMDueDateDeltaAlert initWithCoder:].cold.5();
    }
    v26 = "dueDateDelta";
LABEL_24:

    NSLog(&cfstr_SIsUnexpectedl.isa, v26);
    id v24 = 0;
    goto LABEL_25;
  }
  identifier = v5->_identifier;
  v5->_identifier = v6;
  v13 = v6;

  reminderID = v5->_reminderID;
  v5->_reminderID = v7;
  v15 = v7;

  accountID = v5->_accountID;
  v5->_accountID = v8;
  id v17 = v8;

  creationDate = v5->_creationDate;
  v5->_creationDate = v9;
  v19 = v9;

  dueDateDelta = v5->_dueDateDelta;
  v5->_dueDateDelta = v11;
  v21 = v11;

  uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"acknowledgedDate"];
  acknowledgedDate = v5->_acknowledgedDate;
  v5->_acknowledgedDate = (NSDate *)v22;

  v5->_minimumSupportedAppVersion = [v4 decodeIntegerForKey:@"minimumSupportedAppVersion"];
LABEL_8:
  id v24 = v5;
LABEL_25:

  return v24;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(REMDueDateDeltaAlert *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(REMDueDateDeltaAlert *)self reminderID];
  [v4 encodeObject:v6 forKey:@"reminderID"];

  v7 = [(REMDueDateDeltaAlert *)self accountID];
  [v4 encodeObject:v7 forKey:@"accountID"];

  v8 = [(REMDueDateDeltaAlert *)self dueDateDelta];
  [v4 encodeObject:v8 forKey:@"dueDateDelta"];

  v9 = [(REMDueDateDeltaAlert *)self creationDate];
  [v4 encodeObject:v9 forKey:@"creationDate"];

  id v10 = [(REMDueDateDeltaAlert *)self acknowledgedDate];
  [v4 encodeObject:v10 forKey:@"acknowledgedDate"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = REMDynamicCast(v5, (uint64_t)v4);

  if (v6) {
    BOOL v7 = [(REMDueDateDeltaAlert *)self isContentEqual:v6];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isContentEqual:(id)a3
{
  id v4 = (REMDueDateDeltaAlert *)a3;
  uint64_t v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v7 = [(REMDueDateDeltaAlert *)self identifier];
      uint64_t v8 = [(REMDueDateDeltaAlert *)v6 identifier];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        v9 = (void *)v8;
        id v10 = [(REMDueDateDeltaAlert *)self identifier];
        v11 = [(REMDueDateDeltaAlert *)v6 identifier];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_22;
        }
      }
      v14 = [(REMDueDateDeltaAlert *)self reminderID];
      uint64_t v15 = [(REMDueDateDeltaAlert *)v6 reminderID];
      if (v14 == (void *)v15)
      {
      }
      else
      {
        id v16 = (void *)v15;
        id v17 = [(REMDueDateDeltaAlert *)self reminderID];
        id v18 = [(REMDueDateDeltaAlert *)v6 reminderID];
        int v19 = [v17 isEqual:v18];

        if (!v19) {
          goto LABEL_22;
        }
      }
      v20 = [(REMDueDateDeltaAlert *)self accountID];
      uint64_t v21 = [(REMDueDateDeltaAlert *)v6 accountID];
      if (v20 == (void *)v21)
      {
      }
      else
      {
        uint64_t v22 = (void *)v21;
        id v23 = [(REMDueDateDeltaAlert *)self accountID];
        id v24 = [(REMDueDateDeltaAlert *)v6 accountID];
        int v25 = [v23 isEqual:v24];

        if (!v25) {
          goto LABEL_22;
        }
      }
      v26 = [(REMDueDateDeltaAlert *)self dueDateDelta];
      uint64_t v27 = [(REMDueDateDeltaAlert *)v6 dueDateDelta];
      if (v26 == (void *)v27)
      {
      }
      else
      {
        objc_super v28 = (void *)v27;
        v29 = [(REMDueDateDeltaAlert *)self dueDateDelta];
        v30 = [(REMDueDateDeltaAlert *)v6 dueDateDelta];
        int v31 = [v29 isEqual:v30];

        if (!v31) {
          goto LABEL_22;
        }
      }
      v32 = [(REMDueDateDeltaAlert *)self creationDate];
      uint64_t v33 = [(REMDueDateDeltaAlert *)v6 creationDate];
      if (v32 == (void *)v33)
      {
      }
      else
      {
        v34 = (void *)v33;
        v35 = [(REMDueDateDeltaAlert *)self creationDate];
        v36 = [(REMDueDateDeltaAlert *)v6 creationDate];
        int v37 = [v35 isEqual:v36];

        if (!v37) {
          goto LABEL_22;
        }
      }
      v39 = [(REMDueDateDeltaAlert *)self acknowledgedDate];
      uint64_t v40 = [(REMDueDateDeltaAlert *)v6 acknowledgedDate];
      if (v39 == (void *)v40)
      {
        char v13 = 1;
        v41 = v39;
      }
      else
      {
        v41 = (void *)v40;
        v42 = [(REMDueDateDeltaAlert *)self acknowledgedDate];
        v43 = [(REMDueDateDeltaAlert *)v6 acknowledgedDate];
        char v13 = [v42 isEqual:v43];
      }
      goto LABEL_23;
    }
LABEL_22:
    char v13 = 0;
LABEL_23:

    goto LABEL_24;
  }
  char v13 = 1;
LABEL_24:

  return v13;
}

- (unint64_t)hash
{
  v2 = [(REMDueDateDeltaAlert *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(REMDueDateDeltaAlert *)self identifier];
  v6 = [(REMDueDateDeltaAlert *)self reminderID];
  BOOL v7 = [(REMDueDateDeltaAlert *)self dueDateDelta];
  uint64_t v8 = [(REMDueDateDeltaAlert *)self acknowledgedDate];
  v9 = [v3 stringWithFormat:@"<%@: %p identifier: %@, reminderID: %@, delta: %@, ackdate: %@>", v4, self, v5, v6, v7, v8];

  return v9;
}

- (REMObjectID)remObjectID
{
  v2 = [(REMDueDateDeltaAlert *)self identifier];
  unint64_t v3 = +[REMDueDateDeltaAlert cdEntityName];
  uint64_t v4 = +[REMObjectID objectIDWithUUID:v2 entityName:v3];

  return (REMObjectID *)v4;
}

+ (id)newObjectID
{
  unint64_t v3 = +[REMLogStore read];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    +[REMDueDateDeltaAlert newObjectID](v3);
  }

  uint64_t v4 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v5 = [a1 objectIDWithUUID:v4];

  return v5;
}

+ (id)objectIDWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 cdEntityName];
  v6 = +[REMObjectID objectIDWithUUID:v4 entityName:v5];

  return v6;
}

+ (NSString)cdEntityName
{
  return (NSString *)@"REMCDDueDateDeltaAlert";
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (REMObjectID)reminderID
{
  return self->_reminderID;
}

- (REMObjectID)accountID
{
  return self->_accountID;
}

- (REMDueDateDeltaInterval)dueDateDelta
{
  return self->_dueDateDelta;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)acknowledgedDate
{
  return self->_acknowledgedDate;
}

- (int64_t)minimumSupportedAppVersion
{
  return self->_minimumSupportedAppVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acknowledgedDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_dueDateDelta, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_reminderID, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_7();
  v2 = NSString;
  unint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  id v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)initWithCoder:.cold.2()
{
  OUTLINED_FUNCTION_7();
  v2 = NSString;
  unint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  id v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)initWithCoder:.cold.3()
{
  OUTLINED_FUNCTION_7();
  v2 = NSString;
  unint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  id v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)initWithCoder:.cold.4()
{
  OUTLINED_FUNCTION_7();
  v2 = NSString;
  unint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  id v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)initWithCoder:.cold.5()
{
  OUTLINED_FUNCTION_7();
  v2 = NSString;
  unint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  id v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

+ (void)newObjectID
{
  *(_WORD *)v1 = 0;
}

@end