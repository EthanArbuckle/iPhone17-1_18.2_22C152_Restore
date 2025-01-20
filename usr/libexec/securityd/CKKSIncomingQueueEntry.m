@interface CKKSIncomingQueueEntry
+ (BOOL)allIQEsHaveValidUnwrappingKeysInContextID:(id)a3 zoneID:(id)a4 error:(id *)a5;
+ (id)countNewEntriesByKeyWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5;
+ (id)countsByStateWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5;
+ (id)fetch:(int64_t)a3 startingAtUUID:(id)a4 state:(id)a5 action:(id)a6 contextID:(id)a7 zoneID:(id)a8 error:(id *)a9;
+ (id)fromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
+ (id)fromDatabaseRow:(id)a3;
+ (id)sqlColumns;
+ (id)sqlTable;
+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
+ (int64_t)countByState:(id)a3 contextID:(id)a4 zone:(id)a5 error:(id *)a6;
- (CKKSIncomingQueueEntry)initWithCKKSItem:(id)a3 action:(id)a4 state:(id)a5;
- (CKKSItem)item;
- (NSString)action;
- (NSString)contextID;
- (NSString)state;
- (NSString)uuid;
- (id)description;
- (id)sqlValues;
- (id)whereClauseToFindSelf;
- (void)setAction:(id)a3;
- (void)setItem:(id)a3;
- (void)setState:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation CKKSIncomingQueueEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_action, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

- (void)setState:(id)a3
{
}

- (NSString)state
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAction:(id)a3
{
}

- (NSString)action
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setItem:(id)a3
{
}

- (CKKSItem)item
{
  return (CKKSItem *)objc_getProperty(self, a2, 16, 1);
}

- (id)sqlValues
{
  v3 = [(CKKSIncomingQueueEntry *)self item];
  v4 = [v3 sqlValues];
  id v5 = [v4 mutableCopy];

  v6 = [(CKKSIncomingQueueEntry *)self action];
  [v5 setObject:v6 forKeyedSubscript:@"action"];

  v7 = [(CKKSIncomingQueueEntry *)self state];
  [v5 setObject:v7 forKeyedSubscript:@"state"];

  return v5;
}

- (id)whereClauseToFindSelf
{
  v11[0] = @"contextID";
  v3 = [(CKKSIncomingQueueEntry *)self contextID];
  v12[0] = v3;
  v11[1] = @"UUID";
  v4 = [(CKKSIncomingQueueEntry *)self uuid];
  v12[1] = v4;
  v11[2] = @"state";
  id v5 = [(CKKSIncomingQueueEntry *)self state];
  v12[2] = v5;
  v11[3] = @"ckzone";
  v6 = [(CKKSIncomingQueueEntry *)self item];
  v7 = [v6 zoneID];
  v8 = [v7 zoneName];
  v12[3] = v8;
  v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];

  return v9;
}

- (void)setUuid:(id)a3
{
  id v4 = a3;
  id v5 = [(CKKSIncomingQueueEntry *)self item];
  [v5 setUuid:v4];
}

- (NSString)uuid
{
  v2 = [(CKKSIncomingQueueEntry *)self item];
  v3 = [v2 uuid];

  return (NSString *)v3;
}

- (NSString)contextID
{
  v2 = [(CKKSIncomingQueueEntry *)self item];
  v3 = [v2 contextID];

  return (NSString *)v3;
}

- (CKKSIncomingQueueEntry)initWithCKKSItem:(id)a3 action:(id)a4 state:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CKKSIncomingQueueEntry;
  v12 = [(CKKSIncomingQueueEntry *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_item, a3);
    objc_storeStrong((id *)&v13->_action, a4);
    objc_storeStrong((id *)&v13->_state, a5);
  }

  return v13;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  objc_super v15 = [(CKKSIncomingQueueEntry *)self item];
  id v5 = [v15 contextID];
  v6 = [(CKKSIncomingQueueEntry *)self item];
  v7 = [v6 zoneID];
  v8 = [v7 zoneName];
  id v9 = [(CKKSIncomingQueueEntry *)self action];
  id v10 = [(CKKSIncomingQueueEntry *)self item];
  id v11 = [v10 uuid];
  v12 = [(CKKSIncomingQueueEntry *)self state];
  v13 = +[NSString stringWithFormat:@"<%@[%@](%@): %@ %@ (%@)>", v4, v5, v8, v9, v11, v12];

  return v13;
}

+ (BOOL)allIQEsHaveValidUnwrappingKeysInContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v35 = 0;
  id v9 = +[CKKSSQLDatabaseObject allParentKeyUUIDsInContextID:v7 zoneID:v8 error:&v35];
  id v10 = v35;
  if (v10)
  {
    id v11 = [v8 zoneName];
    v12 = sub_1000CD884(@"ckkskey", v11);

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unable to find IQE parent keys: %@", buf, 0xCu);
    }

    BOOL v13 = 0;
    if (a5) {
      *a5 = v10;
    }
    goto LABEL_27;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v14 = v9;
  id v15 = [v14 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (!v15)
  {
    BOOL v13 = 1;
    goto LABEL_26;
  }
  id v16 = v15;
  v28 = a5;
  v29 = v9;
  uint64_t v17 = *(void *)v32;
  while (2)
  {
    for (i = 0; i != v16; i = (char *)i + 1)
    {
      if (*(void *)v32 != v17) {
        objc_enumerationMutation(v14);
      }
      v19 = *(void **)(*((void *)&v31 + 1) + 8 * i);
      id v30 = 0;
      v20 = +[CKKSKey tryFromDatabase:contextID:zoneID:error:](CKKSKey, "tryFromDatabase:contextID:zoneID:error:", v19, v7, v8, &v30, v28);
      id v21 = v30;
      if (v21)
      {
        id v22 = v21;
        v23 = [v8 zoneName];
        v24 = sub_1000CD884(@"ckksheal", v23);

        id v9 = v29;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v37 = v22;
          __int16 v38 = 2112;
          v39 = v19;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Unable to find key %@: %@", buf, 0x16u);
        }

        if (v28)
        {
          id v22 = v22;
          id *v28 = v22;
        }
        goto LABEL_25;
      }
      if (!v20)
      {
        v25 = [v8 zoneName];
        v26 = sub_1000CD884(@"ckkskey", v25);

        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v37 = v19;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Some item is encrypted under a non-existent key(%@).", buf, 0xCu);
        }

        id v22 = 0;
        v20 = 0;
        id v9 = v29;
LABEL_25:

        BOOL v13 = 0;
        id v10 = 0;
        goto LABEL_26;
      }
    }
    id v16 = [v14 countByEnumeratingWithState:&v31 objects:v40 count:16];
    BOOL v13 = 1;
    id v9 = v29;
    id v10 = 0;
    if (v16) {
      continue;
    }
    break;
  }
LABEL_26:

LABEL_27:
  return v13;
}

+ (id)countNewEntriesByKeyWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  id v10 = [(id)objc_opt_class() sqlTable];
  v23[0] = @"contextID";
  id v11 = v7;
  v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = +[NSNull null];
  }
  id v14 = v13;

  v24[0] = v14;
  v23[1] = @"ckzone";
  id v15 = [v8 zoneName];

  if (v15)
  {
    id v16 = v15;
  }
  else
  {
    id v16 = +[NSNull null];
  }
  uint64_t v17 = v16;

  v23[2] = @"state";
  v24[1] = v17;
  v24[2] = @"new";
  v18 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000733EC;
  v21[3] = &unk_1002FA668;
  id v19 = v9;
  id v22 = v19;
  +[CKKSSQLDatabaseObject queryDatabaseTable:v10 where:v18 columns:&off_100326E00 groupBy:&off_100326E18 orderBy:0 limit:-1 processRow:v21 error:a5];

  return v19;
}

+ (int64_t)countByState:(id)a3 contextID:(id)a4 zone:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = -1;
  v12 = [(id)objc_opt_class() sqlTable];
  v29[0] = @"contextID";
  id v13 = v10;
  id v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = +[NSNull null];
  }
  id v16 = v15;

  v30[0] = v16;
  v29[1] = @"ckzone";
  uint64_t v17 = [v11 zoneName];
  v18 = v17;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    id v19 = +[NSNull null];
  }
  v20 = v19;

  v29[2] = @"state";
  v30[1] = v20;
  v30[2] = v9;
  id v21 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:3];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000736F0;
  void v24[3] = &unk_100306000;
  v24[4] = &v25;
  +[CKKSSQLDatabaseObject queryDatabaseTable:v12 where:v21 columns:&off_100326DE8 groupBy:0 orderBy:0 limit:-1 processRow:v24 error:a6];

  int64_t v22 = v26[3];
  _Block_object_dispose(&v25, 8);

  return v22;
}

+ (id)countsByStateWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  id v10 = [(id)objc_opt_class() sqlTable];
  v23[0] = @"contextID";
  id v11 = v7;
  v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = +[NSNull null];
  }
  id v14 = v13;

  v23[1] = @"ckzone";
  v24[0] = v14;
  id v15 = [v8 zoneName];

  if (v15)
  {
    id v16 = v15;
  }
  else
  {
    id v16 = +[NSNull null];
  }
  uint64_t v17 = v16;

  v24[1] = v17;
  v18 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10007395C;
  v21[3] = &unk_1002FA668;
  id v19 = v9;
  id v22 = v19;
  +[CKKSSQLDatabaseObject queryDatabaseTable:v10 where:v18 columns:&off_100326DB8 groupBy:&off_100326DD0 orderBy:0 limit:-1 processRow:v21 error:a5];

  return v19;
}

+ (id)fromDatabaseRow:(id)a3
{
  id v3 = a3;
  id v4 = [CKKSIncomingQueueEntry alloc];
  id v5 = +[CKKSItem fromDatabaseRow:v3];
  v6 = [v3 objectForKeyedSubscript:@"action"];
  id v7 = [v6 asString];
  id v8 = [v3 objectForKeyedSubscript:@"state"];

  id v9 = [v8 asString];
  id v10 = [(CKKSIncomingQueueEntry *)v4 initWithCKKSItem:v5 action:v7 state:v9];

  return v10;
}

+ (id)sqlColumns
{
  v2 = +[CKKSItem sqlColumns];
  id v3 = [v2 arrayByAddingObjectsFromArray:&off_100326DA0];

  return v3;
}

+ (id)sqlTable
{
  return @"incomingqueue";
}

+ (id)fetch:(int64_t)a3 startingAtUUID:(id)a4 state:(id)a5 action:(id)a6 contextID:(id)a7 zoneID:(id)a8 error:(id *)a9
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  CFStringRef v37 = @"contextID";
  id v18 = v16;
  id v19 = v18;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    id v20 = +[NSNull null];
  }
  id v21 = v20;

  v40[0] = v21;
  CFStringRef v38 = @"state";
  id v22 = v14;
  v23 = v22;
  if (v22)
  {
    id v24 = v22;
  }
  else
  {
    id v24 = +[NSNull null];
  }
  uint64_t v25 = v24;

  v40[1] = v25;
  CFStringRef v39 = @"ckzone";
  v26 = [v17 zoneName];
  uint64_t v27 = v26;
  if (v26)
  {
    id v28 = v26;
  }
  else
  {
    id v28 = +[NSNull null];
  }
  v29 = v28;

  v40[2] = v29;
  id v30 = +[NSDictionary dictionaryWithObjects:v40 forKeys:&v37 count:3];
  id v31 = [v30 mutableCopy];

  [v31 setObject:v15 forKeyedSubscript:@"action"];
  if (v13)
  {
    long long v32 = +[CKKSSQLWhereValue op:3 value:v13];
    [v31 setObject:v32 forKeyedSubscript:@"UUID"];
  }
  long long v33 = [a1 fetch:a3 where:v31 orderBy:&off_100326D88 error:a9, a3, a9, v37, v38];

  return v33;
}

+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v28[0] = @"contextID";
  id v13 = v11;
  id v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = +[NSNull null];
  }
  id v16 = v15;

  v29[0] = v16;
  v28[1] = @"UUID";
  id v17 = v10;
  id v18 = v17;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    id v19 = +[NSNull null];
  }
  id v20 = v19;

  v29[1] = v20;
  v28[2] = @"ckzone";
  id v21 = [v12 zoneName];
  id v22 = v21;
  if (v21)
  {
    id v23 = v21;
  }
  else
  {
    id v23 = +[NSNull null];
  }
  id v24 = v23;

  v29[2] = v24;
  uint64_t v25 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];
  v26 = [a1 tryFromDatabaseWhere:v25 error:a6];

  return v26;
}

+ (id)fromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v28[0] = @"contextID";
  id v13 = v11;
  id v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = +[NSNull null];
  }
  id v16 = v15;

  v29[0] = v16;
  v28[1] = @"UUID";
  id v17 = v10;
  id v18 = v17;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    id v19 = +[NSNull null];
  }
  id v20 = v19;

  v29[1] = v20;
  v28[2] = @"ckzone";
  id v21 = [v12 zoneName];
  id v22 = v21;
  if (v21)
  {
    id v23 = v21;
  }
  else
  {
    id v23 = +[NSNull null];
  }
  id v24 = v23;

  v29[2] = v24;
  uint64_t v25 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];
  v26 = [a1 fromDatabaseWhere:v25 error:a6];

  return v26;
}

@end