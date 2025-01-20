@interface NEKDeletionWrapper
+ (id)deletionWrapperForObjectID:(id)a3 deletedReminderAndListMapping:(id)a4;
+ (id)deletionWrapperForRecordID:(id)a3 eventStore:(id)a4;
+ (id)deletionWrapperForSourceID:(id)a3;
- (NEKDeletionWrapper)initWithIdentifier:(id)a3 calendarIdentifier:(id)a4 type:(int)a5;
- (NSString)description;
- (NSString)objectIdentifier;
- (NSString)sequencer;
- (id)calendarIdentifier;
- (id)identifier;
- (int)type;
- (int64_t)changeType;
@end

@implementation NEKDeletionWrapper

+ (id)deletionWrapperForRecordID:(id)a3 eventStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6 || !v7)
  {
    v17 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10006C670(v17);
    }
    goto LABEL_10;
  }
  unint64_t v9 = (unint64_t)[v6 entityType] - 1;
  if (v9 > 5 || ((0x27u >> v9) & 1) == 0)
  {
LABEL_10:
    id v13 = 0;
    goto LABEL_11;
  }
  uint64_t v10 = dword_10009B928[v9];
  v11 = [v8 identifierInRowMappingForRecordIDRef:v6];
  v12 = [v8 calendarIdentifierInRowMappingForRecordIDRef:v6];
  if (v11)
  {
    id v13 = [objc_alloc((Class)a1) initWithIdentifier:v11 calendarIdentifier:v12 type:v10];
    v14 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      v16 = [v6 stringRepresentation];
      int v19 = 138543618;
      v20 = v16;
      __int16 v21 = 2114;
      v22 = v11;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Event deletion wrapper: %{public}@ -> %{public}@", (uint8_t *)&v19, 0x16u);
    }
  }
  else
  {
    id v13 = 0;
  }

LABEL_11:

  return v13;
}

+ (id)deletionWrapperForSourceID:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithIdentifier:v4 calendarIdentifier:0 type:1];

  return v5;
}

- (NEKDeletionWrapper)initWithIdentifier:(id)a3 calendarIdentifier:(id)a4 type:(int)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = [(NEKDeletionWrapper *)self init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    objc_storeStrong((id *)&v12->_calendarIdentifier, a4);
    v12->_type = a5;
  }

  return v12;
}

- (id)identifier
{
  return self->_identifier;
}

- (id)calendarIdentifier
{
  return self->_calendarIdentifier;
}

- (int)type
{
  return self->_type;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  id v5 = (void *)v4;
  uint64_t type = self->_type;
  if (type > 4) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = (uint64_t)*(&off_1000A93C8 + type);
  }
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@ %p; type=%@; identifier=%@; calendarIdentifier=%@>",
    v4,
    self,
    v7,
    self->_identifier,
  v8 = self->_calendarIdentifier);

  return (NSString *)v8;
}

- (NSString)objectIdentifier
{
  identifier = self->_identifier;
  if (identifier)
  {
    v3 = identifier;
  }
  else
  {
    v3 = +[NSUUID eks_garbageUUID];
  }

  return v3;
}

- (NSString)sequencer
{
  return 0;
}

- (int64_t)changeType
{
  return 3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)deletionWrapperForObjectID:(id)a3 deletedReminderAndListMapping:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = [v6 entityName];
    id v9 = +[REMAccount cdEntityName];
    unsigned __int8 v10 = [v8 isEqualToString:v9];

    if (v10)
    {
      v11 = 0;
LABEL_20:
      id v19 = 0;
      goto LABEL_21;
    }
    v14 = +[REMList cdEntityName];
    unsigned __int8 v15 = [v8 isEqualToString:v14];

    if (v15)
    {
      v16 = [v6 uuid];
      v17 = [v16 UUIDString];

      v11 = 0;
      uint64_t v18 = 2;
      if (!v17) {
        goto LABEL_20;
      }
    }
    else
    {
      v20 = +[REMReminder cdEntityName];
      unsigned __int8 v21 = [v8 isEqualToString:v20];

      if ((v21 & 1) == 0)
      {
        id v19 = 0;
LABEL_22:
        id v13 = v19;

        goto LABEL_23;
      }
      v22 = +[REMStore eks_storeForSyncing];
      v23 = [v22 fetchReminderIncludingConcealedWithObjectID:v6 error:0];
      v24 = v23;
      if (v23)
      {
        v17 = [v23 daCalendarItemUniqueIdentifier];
        uint64_t v25 = [v7 objectForKeyedSubscript:v6];
        if (v25)
        {
          v11 = (void *)v25;
        }
        else
        {
          v26 = *(NSObject **)(qword_1000C6CA8 + 8);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            sub_10006E2D4(v26, v24);
          }
          v11 = 0;
        }
      }
      else
      {
        v11 = 0;
        v17 = 0;
      }

      uint64_t v18 = 3;
      if (!v17) {
        goto LABEL_20;
      }
    }
    id v19 = [objc_alloc((Class)a1) initWithIdentifier:v17 calendarIdentifier:v11 type:v18];

LABEL_21:
    goto LABEL_22;
  }
  v12 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_10006C670(v12);
  }
  id v13 = 0;
LABEL_23:

  return v13;
}

@end