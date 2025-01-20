@interface CKKSOutgoingQueueEntry
+ (id)allInState:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
+ (id)allWithUUID:(id)a3 states:(id)a4 contextID:(id)a5 zoneID:(id)a6 error:(id *)a7;
+ (id)countsByStateWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5;
+ (id)fetch:(int64_t)a3 state:(id)a4 contextID:(id)a5 zoneID:(id)a6 error:(id *)a7;
+ (id)fromDatabase:(id)a3 state:(id)a4 contextID:(id)a5 zoneID:(id)a6 error:(id *)a7;
+ (id)fromDatabaseRow:(id)a3;
+ (id)keyForItem:(SecDbItem *)a3 contextID:(id)a4 zoneID:(id)a5 keyCache:(id)a6 error:(id *)a7;
+ (id)sqlColumns;
+ (id)sqlTable;
+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
+ (id)tryFromDatabase:(id)a3 state:(id)a4 contextID:(id)a5 zoneID:(id)a6 error:(id *)a7;
+ (id)withItem:(SecDbItem *)a3 action:(id)a4 contextID:(id)a5 zoneID:(id)a6 keyCache:(id)a7 error:(id *)a8;
+ (int64_t)countByState:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
- (BOOL)intransactionMarkAsError:(id)a3 viewState:(id)a4 error:(id *)a5;
- (BOOL)intransactionMoveToState:(id)a3 viewState:(id)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (CKKSItem)item;
- (CKKSOutgoingQueueEntry)initWithCKKSItem:(id)a3 action:(id)a4 state:(id)a5 waitUntil:(id)a6 accessGroup:(id)a7;
- (NSDate)waitUntil;
- (NSString)accessgroup;
- (NSString)action;
- (NSString)contextID;
- (NSString)state;
- (NSString)uuid;
- (id)description;
- (id)sqlValues;
- (id)whereClauseToFindSelf;
- (void)setAccessgroup:(id)a3;
- (void)setAction:(id)a3;
- (void)setItem:(id)a3;
- (void)setState:(id)a3;
- (void)setUuid:(id)a3;
- (void)setWaitUntil:(id)a3;
@end

@implementation CKKSOutgoingQueueEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitUntil, 0);
  objc_storeStrong((id *)&self->_accessgroup, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_action, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

- (void)setWaitUntil:(id)a3
{
}

- (NSDate)waitUntil
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAccessgroup:(id)a3
{
}

- (NSString)accessgroup
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
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

- (BOOL)intransactionMarkAsError:(id)a3 viewState:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = +[CKKSViewManager manager];
  v11 = [(CKKSOutgoingQueueEntry *)self uuid];
  v12 = [v10 claimCallbackForUUID:v11];

  if (v12) {
    ((void (**)(void, void, id))v12)[2](v12, 0, v8);
  }
  id v17 = 0;
  [(CKKSSQLDatabaseObject *)self deleteFromDatabase:&v17];
  id v13 = v17;
  if (v13)
  {
    v14 = [v9 zoneName];
    v15 = sub_1000CD884(@"ckks", v14);

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v19 = self;
      __int16 v20 = 2112;
      id v21 = v8;
      __int16 v22 = 2112;
      id v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Couldn't delete %@ (due to error %@): %@", buf, 0x20u);
    }

    if (a5) {
      *a5 = v13;
    }
  }

  return v13 == 0;
}

- (BOOL)intransactionMoveToState:(id)a3 viewState:(id)a4 error:(id *)a5
{
  id v8 = (CKKSOutgoingQueueEntry *)a3;
  id v9 = a4;
  if ([(CKKSOutgoingQueueEntry *)v8 isEqualToString:@"deleted"])
  {
    v10 = +[CKKSViewManager manager];
    v11 = [(CKKSOutgoingQueueEntry *)self uuid];
    uint64_t v12 = [v10 claimCallbackForUUID:v11];

    if (v12) {
      (*(void (**)(uint64_t, uint64_t, void))(v12 + 16))(v12, 1, 0);
    }
    id v40 = 0;
    [(CKKSSQLDatabaseObject *)self deleteFromDatabase:&v40];
    id v13 = (CKKSOutgoingQueueEntry *)v40;
    if (v13)
    {
      v14 = v13;
      v15 = [v9 zoneName];
      v16 = sub_1000CD884(@"ckks", v15);

      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
LABEL_18:

        goto LABEL_23;
      }
      *(_DWORD *)buf = 138412546;
      v42 = self;
      __int16 v43 = 2112;
      v44 = v14;
      id v17 = "Couldn't delete %@: %@";
      v18 = v16;
      uint32_t v19 = 22;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
      goto LABEL_18;
    }
    goto LABEL_32;
  }
  __int16 v20 = [(CKKSOutgoingQueueEntry *)self state];
  if ([v20 isEqualToString:@"inflight"])
  {
    unsigned int v21 = [(CKKSOutgoingQueueEntry *)v8 isEqualToString:@"new"];

    if (v21)
    {
      __int16 v22 = [(CKKSOutgoingQueueEntry *)self uuid];
      id v23 = [(CKKSOutgoingQueueEntry *)self item];
      v24 = [v23 contextID];
      v25 = [v9 zoneID];
      id v39 = 0;
      uint64_t v12 = +[CKKSOutgoingQueueEntry tryFromDatabase:v22 state:@"new" contextID:v24 zoneID:v25 error:&v39];
      v26 = (CKKSOutgoingQueueEntry *)v39;

      if (v26)
      {
        v27 = [v9 zoneName];
        v28 = sub_1000CD884(@"ckksoutgoing", v27);

        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v26;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Couldn't fetch an overwriting OQE, assuming one doesn't exist: %@", buf, 0xCu);
        }
      }
      else if (v12)
      {
        v31 = [v9 zoneName];
        v32 = sub_1000CD884(@"ckksoutgoing", v31);

        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v42 = self;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "New modification has come in behind inflight %@; dropping failed change",
            buf,
            0xCu);
        }

        id v38 = 0;
        [(CKKSOutgoingQueueEntry *)self intransactionMoveToState:@"deleted" viewState:v9 error:&v38];
        v33 = (CKKSOutgoingQueueEntry *)v38;
        if (v33)
        {
          v14 = v33;
          v34 = [v9 zoneName];
          v16 = sub_1000CD884(@"ckksoutgoing", v34);

          if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            goto LABEL_18;
          }
          *(_DWORD *)buf = 138412290;
          v42 = v14;
          id v17 = "Couldn't delete in-flight OQE: %@";
          v18 = v16;
          uint32_t v19 = 12;
          goto LABEL_7;
        }
LABEL_32:

        v14 = 0;
        goto LABEL_33;
      }
      [(CKKSOutgoingQueueEntry *)self setState:v8];
      v37 = v26;
      [(CKKSSQLDatabaseObject *)self saveToDatabase:&v37];
      v14 = v37;

      if (v14)
      {
        v29 = [v9 zoneName];
        v16 = sub_1000CD884(@"ckks", v29);

        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v42 = self;
          __int16 v43 = 2112;
          v44 = v8;
          __int16 v45 = 2112;
          v46 = v14;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Couldn't save %@ as %@: %@", buf, 0x20u);
        }
        uint64_t v12 = 0;
        goto LABEL_18;
      }
      uint64_t v12 = 0;
      goto LABEL_32;
    }
  }
  else
  {
  }
  [(CKKSOutgoingQueueEntry *)self setState:v8];
  id v36 = 0;
  [(CKKSSQLDatabaseObject *)self saveToDatabase:&v36];
  v14 = (CKKSOutgoingQueueEntry *)v36;
  if (!v14) {
    goto LABEL_33;
  }
  v30 = [v9 zoneName];
  uint64_t v12 = sub_1000CD884(@"ckks", v30);

  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v42 = self;
    __int16 v43 = 2112;
    v44 = v8;
    __int16 v45 = 2112;
    v46 = v14;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_ERROR, "Couldn't save %@ as %@: %@", buf, 0x20u);
  }
LABEL_23:

  if (a5)
  {
    v14 = v14;
    *a5 = v14;
  }
LABEL_33:

  return v14 == 0;
}

- (id)sqlValues
{
  id v3 = objc_alloc_init((Class)NSISO8601DateFormatter);
  v4 = [(CKKSOutgoingQueueEntry *)self item];
  v5 = [v4 sqlValues];
  id v6 = [v5 mutableCopy];

  v7 = [(CKKSOutgoingQueueEntry *)self action];
  [v6 setObject:v7 forKeyedSubscript:@"action"];

  id v8 = [(CKKSOutgoingQueueEntry *)self state];
  [v6 setObject:v8 forKeyedSubscript:@"state"];

  uint64_t v9 = [(CKKSOutgoingQueueEntry *)self waitUntil];
  if (!v9
    || (v10 = (void *)v9,
        [(CKKSOutgoingQueueEntry *)self waitUntil],
        v11 = objc_claimAutoreleasedReturnValue(),
        [v3 stringFromDate:v11],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        !v12))
  {
    uint64_t v12 = +[NSNull null];
  }
  [v6 setObject:v12 forKeyedSubscript:@"waituntil"];

  id v13 = [(CKKSOutgoingQueueEntry *)self accessgroup];
  [v6 setObject:v13 forKeyedSubscript:@"accessgroup"];

  return v6;
}

- (id)whereClauseToFindSelf
{
  v14[0] = @"contextID";
  id v3 = [(CKKSOutgoingQueueEntry *)self item];
  v4 = [v3 contextID];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = +[NSNull null];
  }
  id v6 = v5;

  v15[0] = v6;
  v14[1] = @"UUID";
  v7 = [(CKKSOutgoingQueueEntry *)self uuid];
  v15[1] = v7;
  v14[2] = @"state";
  id v8 = [(CKKSOutgoingQueueEntry *)self state];
  v15[2] = v8;
  v14[3] = @"ckzone";
  uint64_t v9 = [(CKKSOutgoingQueueEntry *)self item];
  v10 = [v9 zoneID];
  v11 = [v10 zoneName];
  v15[3] = v11;
  uint64_t v12 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];

  return v12;
}

- (void)setUuid:(id)a3
{
  id v4 = a3;
  id v5 = [(CKKSOutgoingQueueEntry *)self item];
  [v5 setUuid:v4];
}

- (NSString)uuid
{
  v2 = [(CKKSOutgoingQueueEntry *)self item];
  id v3 = [v2 uuid];

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(CKKSOutgoingQueueEntry *)self item];
    v7 = [v5 item];
    if (![v6 isEqual:v7])
    {
      unsigned __int8 v15 = 0;
LABEL_22:

      goto LABEL_23;
    }
    id v8 = [(CKKSOutgoingQueueEntry *)self action];
    uint64_t v9 = [v5 action];
    if (![v8 isEqual:v9])
    {
      unsigned __int8 v15 = 0;
LABEL_21:

      goto LABEL_22;
    }
    v10 = [(CKKSOutgoingQueueEntry *)self state];
    v11 = [v5 state];
    if (![v10 isEqual:v11])
    {
      unsigned __int8 v15 = 0;
LABEL_20:

      goto LABEL_21;
    }
    uint64_t v12 = [(CKKSOutgoingQueueEntry *)self waitUntil];
    if (v12 || ([v5 waitUntil], (uint32_t v19 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v25 = v11;
      id v13 = [(CKKSOutgoingQueueEntry *)self waitUntil];
      id v23 = [v5 waitUntil];
      v24 = v13;
      [v13 timeIntervalSinceDate:];
      if (fabs(v14) >= 1.0)
      {
        unsigned __int8 v15 = 0;
        v11 = v25;
        goto LABEL_17;
      }
      unsigned int v21 = v12;
      __int16 v22 = v10;
      int v20 = 1;
      v11 = v25;
    }
    else
    {
      unsigned int v21 = 0;
      __int16 v22 = v10;
      uint32_t v19 = 0;
      int v20 = 0;
    }
    v16 = [(CKKSOutgoingQueueEntry *)self accessgroup];
    id v17 = [v5 accessgroup];
    unsigned __int8 v15 = [v16 isEqual:v17];

    if (!v20)
    {
      uint64_t v12 = v21;
      v10 = v22;
      if (v21) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
    uint64_t v12 = v21;
    v10 = v22;
LABEL_17:

    if (v12)
    {
LABEL_19:

      goto LABEL_20;
    }
LABEL_18:

    goto LABEL_19;
  }
  unsigned __int8 v15 = 0;
LABEL_23:

  return v15;
}

- (NSString)contextID
{
  v2 = [(CKKSOutgoingQueueEntry *)self item];
  id v3 = [v2 contextID];

  return (NSString *)v3;
}

- (CKKSOutgoingQueueEntry)initWithCKKSItem:(id)a3 action:(id)a4 state:(id)a5 waitUntil:(id)a6 accessGroup:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CKKSOutgoingQueueEntry;
  id v17 = [(CKKSOutgoingQueueEntry *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_item, a3);
    objc_storeStrong((id *)&v18->_action, a4);
    objc_storeStrong((id *)&v18->_state, a5);
    objc_storeStrong((id *)&v18->_accessgroup, a7);
    objc_storeStrong((id *)&v18->_waitUntil, a6);
  }

  return v18;
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(CKKSOutgoingQueueEntry *)self contextID];
  id v6 = [(CKKSOutgoingQueueEntry *)self item];
  v7 = [v6 zoneID];
  id v8 = [v7 zoneName];
  uint64_t v9 = [(CKKSOutgoingQueueEntry *)self action];
  v10 = [(CKKSOutgoingQueueEntry *)self item];
  v11 = [v10 uuid];
  uint64_t v12 = [(CKKSOutgoingQueueEntry *)self state];
  id v13 = +[NSString stringWithFormat:@"<%@[%@](%@): %@ %@ (%@)>", v4, v5, v8, v9, v11, v12];

  return v13;
}

+ (int64_t)countByState:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = -1;
  uint64_t v12 = [(id)objc_opt_class() sqlTable];
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
  id v17 = [v11 zoneName];
  v18 = v17;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    id v19 = +[NSNull null];
  }
  id v20 = v19;

  v29[2] = @"state";
  v30[1] = v20;
  v30[2] = v9;
  objc_super v21 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:3];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000701C0;
  v24[3] = &unk_100306000;
  v24[4] = &v25;
  +[CKKSSQLDatabaseObject queryDatabaseTable:v12 where:v21 columns:&off_100326D70 groupBy:0 orderBy:0 limit:-1 processRow:v24 error:a6];

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
  uint64_t v12 = v11;
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
  id v17 = v16;

  v24[1] = v17;
  v18 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10007042C;
  v21[3] = &unk_1002FA668;
  id v19 = v9;
  id v22 = v19;
  +[CKKSSQLDatabaseObject queryDatabaseTable:v10 where:v18 columns:&off_100326D40 groupBy:&off_100326D58 orderBy:0 limit:-1 processRow:v21 error:a5];

  return v19;
}

+ (id)fromDatabaseRow:(id)a3
{
  id v3 = a3;
  id v4 = [CKKSOutgoingQueueEntry alloc];
  id v5 = +[CKKSItem fromDatabaseRow:v3];
  id v6 = [v3 objectForKeyedSubscript:@"action"];
  id v7 = [v6 asString];
  id v8 = [v3 objectForKeyedSubscript:@"state"];
  id v9 = [v8 asString];
  id v10 = [v3 objectForKeyedSubscript:@"waituntil"];
  id v11 = [v10 asISO8601Date];
  uint64_t v12 = [v3 objectForKeyedSubscript:@"accessgroup"];

  id v13 = [v12 asString];
  id v14 = [(CKKSOutgoingQueueEntry *)v4 initWithCKKSItem:v5 action:v7 state:v9 waitUntil:v11 accessGroup:v13];

  return v14;
}

+ (id)sqlColumns
{
  v2 = +[CKKSItem sqlColumns];
  id v3 = [v2 arrayByAddingObjectsFromArray:&off_100326D28];

  return v3;
}

+ (id)sqlTable
{
  return @"outgoingqueue";
}

+ (id)allWithUUID:(id)a3 states:(id)a4 contextID:(id)a5 zoneID:(id)a6 error:(id *)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v32[0] = @"contextID";
  id v14 = v12;
  id v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = +[NSNull null];
  }
  id v17 = v16;

  v33[0] = v17;
  v32[1] = @"UUID";
  id v18 = v10;
  id v19 = v18;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    id v20 = +[NSNull null];
  }
  objc_super v21 = v20;

  v33[1] = v21;
  v32[2] = @"state";
  id v22 = [[CKKSSQLWhereIn alloc] initWithValues:v11];
  v33[2] = v22;
  v32[3] = @"ckzone";
  id v23 = [v13 zoneName];
  v24 = v23;
  if (v23)
  {
    id v25 = v23;
  }
  else
  {
    id v25 = +[NSNull null];
  }
  v26 = v25;

  v33[3] = v26;
  uint64_t v27 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:4];
  uint64_t v28 = [a1 allWhere:v27 error:a7];

  return v28;
}

+ (id)allInState:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
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
  v28[1] = @"state";
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
  objc_super v21 = [v12 zoneName];
  id v22 = v21;
  if (v21)
  {
    id v23 = v21;
  }
  else
  {
    id v23 = +[NSNull null];
  }
  v24 = v23;

  v29[2] = v24;
  id v25 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];
  v26 = [a1 allWhere:v25 error:a6];

  return v26;
}

+ (id)fetch:(int64_t)a3 state:(id)a4 contextID:(id)a5 zoneID:(id)a6 error:(id *)a7
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_alloc_init((Class)NSISO8601DateFormatter);
  v35[0] = @"contextID";
  id v14 = v11;
  id v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = +[NSNull null];
  }
  id v17 = v16;

  v36[0] = v17;
  v35[1] = @"state";
  id v18 = v10;
  id v19 = v18;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    id v20 = +[NSNull null];
  }
  objc_super v21 = v20;

  v36[1] = v21;
  v35[2] = @"ckzone";
  id v22 = [v12 zoneName];

  v32 = v17;
  if (v22)
  {
    id v23 = v22;
  }
  else
  {
    id v23 = +[NSNull null];
  }
  v24 = v23;

  v36[2] = v24;
  v35[3] = @"waituntil";
  id v25 = [CKKSSQLWhereNullOrValue alloc];
  v26 = +[NSDate date];
  uint64_t v27 = [v13 stringFromDate:v26];
  uint64_t v28 = [(CKKSSQLWhereValue *)v25 initWithOperation:4 value:v27];
  v36[3] = v28;
  v29 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:4];
  v30 = [a1 fetch:a3 where:v29 error:a7];

  return v30;
}

+ (id)tryFromDatabase:(id)a3 state:(id)a4 contextID:(id)a5 zoneID:(id)a6 error:(id *)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v35[0] = @"contextID";
  id v14 = v12;
  id v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = +[NSNull null];
  }
  id v17 = v16;

  v36[0] = v17;
  v35[1] = @"UUID";
  id v18 = v10;
  id v19 = v18;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    id v20 = +[NSNull null];
  }
  objc_super v21 = v20;

  v36[1] = v21;
  v35[2] = @"state";
  id v22 = v11;
  id v23 = v22;
  if (v22)
  {
    id v24 = v22;
  }
  else
  {
    id v24 = +[NSNull null];
  }
  id v25 = v24;

  v36[2] = v25;
  v35[3] = @"ckzone";
  v26 = [v13 zoneName];
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

  v36[3] = v29;
  v30 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:4];
  v31 = [a1 tryFromDatabaseWhere:v30 error:a7];

  return v31;
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
  objc_super v21 = [v12 zoneName];
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
  id v25 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];
  v26 = [a1 tryFromDatabaseWhere:v25 error:a6];

  return v26;
}

+ (id)fromDatabase:(id)a3 state:(id)a4 contextID:(id)a5 zoneID:(id)a6 error:(id *)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v35[0] = @"contextID";
  id v14 = v12;
  id v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = +[NSNull null];
  }
  id v17 = v16;

  v36[0] = v17;
  v35[1] = @"UUID";
  id v18 = v10;
  id v19 = v18;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    id v20 = +[NSNull null];
  }
  objc_super v21 = v20;

  v36[1] = v21;
  v35[2] = @"state";
  id v22 = v11;
  id v23 = v22;
  if (v22)
  {
    id v24 = v22;
  }
  else
  {
    id v24 = +[NSNull null];
  }
  id v25 = v24;

  v36[2] = v25;
  v35[3] = @"ckzone";
  v26 = [v13 zoneName];
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

  v36[3] = v29;
  v30 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:4];
  v31 = [a1 fromDatabaseWhere:v30 error:a7];

  return v31;
}

+ (id)withItem:(SecDbItem *)a3 action:(id)a4 contextID:(id)a5 zoneID:(id)a6 keyCache:(id)a7 error:(id *)a8
{
  id v14 = (SecDbItem *)a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v127 = 0;
  id v18 = [v16 zoneName];
  id v19 = sub_1000CD884(@"ckksitem", v18);

  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412547;
    v129 = v14;
    __int16 v130 = 2113;
    v131 = a3;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Creating a (%@) outgoing queue entry for: %{private}@", buf, 0x16u);
  }

  id v126 = 0;
  id v20 = [a1 keyForItem:a3 contextID:v15 zoneID:v16 keyCache:v17 error:&v126];
  id v21 = v126;
  id v22 = v21;
  v121 = v14;
  if (!v20 || v21)
  {
    +[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", @"CKKSErrorDomain", [v21 code], @"No key for item", v21);
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v32 = [v16 zoneName];
    v33 = sub_1000CD884(@"ckksitem", v32);

    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412547;
      v129 = (SecDbItem *)v31;
      __int16 v130 = 2113;
      v131 = a3;
      v34 = "no key for item: %@ %{private}@";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, v34, buf, 0x16u);
    }
LABEL_16:

    if (a8)
    {
      v31 = v31;
      id v25 = 0;
      id v38 = 0;
      *a8 = v31;
      goto LABEL_27;
    }
    id v25 = 0;
    goto LABEL_19;
  }
  id v23 = sub_100118B3C(a3, 0x10000, 0, &v127);
  if (!v23)
  {
    CFIndex Code = CFErrorGetCode((CFErrorRef)v127);
    id v36 = v127;
    v31 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:Code description:@"Couldn't create object plist" underlying:v127];

    v37 = [v16 zoneName];
    v33 = sub_1000CD884(@"ckksitem", v37);

    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412547;
      v129 = (SecDbItem *)v31;
      __int16 v130 = 2113;
      v131 = a3;
      v34 = "no plist: %@ %{private}@";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  v120 = (__CFString *)v23;
  [(__CFDictionary *)v23 setObject:a3->var1->var0 forKey:kSecClass];
  id v24 = (SecDbItem *)sub_100118CF8(a3, (uint64_t)&off_100305790, &v127);
  id v25 = v24;
  id v119 = v15;
  if (v24)
  {
    CFRetain(v24);
    v26 = v127;
    if (!v127)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v27 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:15 description:@"UUID not found in object" underlying:0];
        id v28 = [v16 zoneName];
        v29 = sub_1000CD884(@"ckksitem", v28);

        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412547;
          v129 = v27;
          __int16 v130 = 2113;
          v131 = a3;
          v30 = "couldn't fetch UUID: %@ %{private}@";
LABEL_23:
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, v30, buf, 0x16u);
          goto LABEL_24;
        }
        goto LABEL_24;
      }
      v41 = (__CFString *)sub_100118CF8(a3, (uint64_t)&off_100305740, &v127);
      v31 = v41;
      if (v41)
      {
        CFRetain(v41);
        v42 = (__CFError *)v127;
        if (!v127)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            __int16 v43 = [v16 zoneName];
            v44 = sub_1000CD884(@"ckksitem", v43);

            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138477827;
              v129 = a3;
              _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "couldn't fetch accessgroup: %{private}@", buf, 0xCu);
            }

            v31 = @"no-group";
            id v15 = v119;
          }
          v117 = +[CKKSMirrorEntry tryFromDatabase:v25 contextID:v15 zoneID:v16 error:a8];
          v116 = v121;
          id v125 = 0;
          __int16 v45 = +[CKKSOutgoingQueueEntry tryFromDatabase:v25 state:@"new" contextID:v15 zoneID:v16 error:&v125];
          v46 = v125;
          v115 = v45;
          if (v45)
          {
            os_log_t v106 = v46;
            v47 = [v45 action];
            unsigned int v48 = [v47 isEqual:@"add"];

            v49 = v116;
            CFStringRef v50 = v116;
            if (v48)
            {
              if ([(__CFString *)v116 isEqual:@"modify"])
              {
                v51 = @"add";

                CFStringRef v50 = @"add";
              }
              else
              {
                unsigned int v59 = [(__CFString *)v116 isEqual:@"delete"];
                CFStringRef v50 = v116;
                if (v59)
                {
                  CFStringRef v50 = v116;
                  if (!v117)
                  {
                    [v115 deleteFromDatabase:a8];
                    goto LABEL_78;
                  }
                }
              }
            }
            v116 = (__CFString *)v50;
            v60 = v49;
            v58 = [v115 action];
            if ([v58 isEqual:@"delete"])
            {
              unsigned int v61 = [(__CFString *)v60 isEqual:@"add"];

              if (!v61)
              {
                v62 = v116;
LABEL_58:
                if (!v117)
                {
                  v116 = v62;
                  id v104 = 0;
                  goto LABEL_82;
                }
                goto LABEL_59;
              }
              v62 = @"modify";
              v63 = @"modify";
              v58 = v116;
LABEL_57:

              goto LABEL_58;
            }
          }
          else
          {
            if (!v46)
            {
              if (!v117)
              {
                if ([(__CFString *)v116 isEqualToString:@"delete"])
                {
                  id v124 = 0;
                  v111 = +[CKKSOutgoingQueueEntry tryFromDatabase:v25 contextID:v15 zoneID:v16 error:&v124];
                  os_log_t v106 = (os_log_t)v124;
                  if (v106)
                  {
                    v70 = [v16 zoneName];
                    v71 = sub_1000CD884(@"ckksitem", v70);

                    os_log_t log = v71;
                    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      v129 = (SecDbItem *)v106;
                      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "Unable to fetch an existing OQE (any state) due to error: %@", buf, 0xCu);
                    }
                    id v69 = 0;
                    goto LABEL_80;
                  }
                  if (v111)
                  {
                    os_log_t v106 = 0;
                    id v69 = 0;
                    goto LABEL_81;
                  }
                  v94 = [v16 zoneName];
                  v95 = sub_1000CD884(@"ckksitem", v94);

                  os_log_t v106 = v95;
                  if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v129 = v25;
                    _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_ERROR, "Asked to delete a record for which we don't have a CKME or any OQE, ignoring: %@", buf, 0xCu);
                  }
                  goto LABEL_78;
                }
                id v104 = 0;
                os_log_t v106 = 0;
LABEL_82:
                uint64_t v75 = kSecAttrPCSPlaintextServiceIdentifier;
                v109 = [(__CFString *)v120 objectForKeyedSubscript:kSecAttrPCSPlaintextServiceIdentifier];
                [(__CFString *)v120 setObject:0 forKeyedSubscript:v75];
                uint64_t v76 = kSecAttrPCSPlaintextPublicKey;
                os_log_t loga = [(__CFString *)v120 objectForKeyedSubscript:kSecAttrPCSPlaintextPublicKey];
                [(__CFString *)v120 setObject:0 forKeyedSubscript:v76];
                uint64_t v77 = kSecAttrPCSPlaintextPublicIdentity;
                v112 = [(__CFString *)v120 objectForKeyedSubscript:kSecAttrPCSPlaintextPublicIdentity];
                [(__CFString *)v120 setObject:0 forKeyedSubscript:v77];
                v78 = [CKKSItem alloc];
                v79 = [v20 uuid];
                v80 = [(CKKSItem *)v78 initWithUUID:v25 parentKeyUUID:v79 contextID:v119 zoneID:v16 encodedCKRecord:0 encItem:0 wrappedkey:0 generationCount:v104 encver:2 plaintextPCSServiceIdentifier:v109 plaintextPCSPublicKey:loga plaintextPCSPublicIdentity:v112];

                v103 = v80;
                if (!v80)
                {
                  v105 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:16 description:@"Couldn't create an item" underlying:0];
                  v87 = [v16 zoneName];
                  v88 = sub_1000CD884(@"ckksitem", v87);

                  if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412547;
                    v129 = v105;
                    __int16 v130 = 2113;
                    v131 = a3;
                    _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_ERROR, "couldn't create an item: %@ %{private}@", buf, 0x16u);
                  }

                  id v15 = v119;
                  id v38 = 0;
                  if (a8)
                  {
                    v105 = v105;
                    *a8 = v105;
                  }
                  v74 = v120;
                  goto LABEL_104;
                }
                v101 = [v117 item];
                id v122 = 0;
                v81 = +[CKKSItemEncrypter encryptCKKSItem:v80 dataDictionary:v120 updatingCKKSItem:v101 parentkey:v20 keyCache:v17 error:&v122];
                v82 = (SecDbItem *)v122;

                v102 = v81;
                v105 = v82;
                if (!v81 || v82)
                {
                  v99 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:[(SecDbItem *)v82 code] description:@"Couldn't encrypt item" underlying:v82];
                  v89 = [v16 zoneName];
                  v90 = sub_1000CD884(@"ckksitem", v89);

                  v91 = v90;
                  BOOL v92 = os_log_type_enabled(v90, OS_LOG_TYPE_ERROR);
                  id v15 = v119;
                  if (v92)
                  {
                    *(_DWORD *)buf = 138412547;
                    v129 = v99;
                    __int16 v130 = 2113;
                    v131 = a3;
                    _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_ERROR, "couldn't encrypt item: %@ %{private}@", buf, 0x16u);
                  }

                  if (a8) {
                    *a8 = v99;
                  }

                  id v38 = 0;
                  v74 = v120;
                }
                else
                {
                  v83 = [v81 encitem];
                  v84 = (SecDbItem *)[v83 length];

                  v97 = v84;
                  BOOL v85 = (unint64_t)v84 >= 0x100000;
                  id v15 = v119;
                  if (!v85)
                  {
                    v93 = v102;
                    id v38 = [[CKKSOutgoingQueueEntry alloc] initWithCKKSItem:v102 action:v116 state:@"new" waitUntil:0 accessGroup:v31];
                    v74 = v120;
LABEL_102:

LABEL_104:
                    goto LABEL_105;
                  }
                  v98 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:65 description:@"Object size too large"];
                  v86 = [v16 zoneName];
                  osos_log_t log = sub_1000CD884(@"ckksitem", v86);

                  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218499;
                    v129 = v97;
                    __int16 v130 = 2112;
                    v131 = v98;
                    __int16 v132 = 2113;
                    v133 = a3;
                    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Object Size (%lu bytes) too large: %@ %{private}@", buf, 0x20u);
                  }

                  v74 = v120;
                  if (a8) {
                    *a8 = v98;
                  }

                  id v38 = 0;
                }
                v93 = v102;
                goto LABEL_102;
              }
              os_log_t v106 = 0;
              v62 = v116;
LABEL_59:
              v64 = [v117 item];
              id v104 = [v64 generationCount];

              v116 = v62;
              if (!v115 && [(__CFString *)v62 isEqualToString:@"modify"])
              {
                v110 = [v117 item];
                id v123 = 0;
                v65 = +[CKKSItemEncrypter decryptItemToDictionary:v110 keyCache:v17 error:&v123];
                v66 = (SecDbItem *)v123;
                os_log_t log = (os_log_t)[v65 mutableCopy];

                id v108 = [(__CFString *)v120 mutableCopy];
                v111 = v66;
                if (v66)
                {
                  v67 = [v16 zoneName];
                  v68 = sub_1000CD884(@"ckksitem", v67);

                  if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v129 = v111;
                    _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "Unable to decrypt current CKME: %@", buf, 0xCu);
                  }

                  id v69 = v104;
                  goto LABEL_79;
                }
                -[NSObject setObject:forKeyedSubscript:](log, "setObject:forKeyedSubscript:", 0);
                uint64_t v100 = kSecAttrSHA1;
                -[NSObject setObject:forKeyedSubscript:](log, "setObject:forKeyedSubscript:", 0);
                [v108 setObject:0 forKeyedSubscript:kSecAttrModificationDate];
                [v108 setObject:0 forKeyedSubscript:v100];
                id v69 = v104;
                if (![log isEqualToDictionary:v108])
                {
LABEL_79:

LABEL_80:
LABEL_81:
                  id v104 = v69;

                  goto LABEL_82;
                }
                v72 = [v16 zoneName];
                v73 = sub_1000CD884(@"ckksitem", v72);

                if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v129 = v25;
                  _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "Update to item only changes mdat; skipping %@",
                    buf,
                    0xCu);
                }

LABEL_78:
                id v38 = 0;
                id v15 = v119;
                v74 = v120;
LABEL_105:

                goto LABEL_27;
              }
              goto LABEL_82;
            }
            os_log_t v107 = v46;
            v56 = [v16 zoneName];
            v57 = sub_1000CD884(@"ckksitem", v56);

            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v129 = (SecDbItem *)v107;
              _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "Unable to fetch an existing OQE due to error: %@", buf, 0xCu);
            }

            v58 = v107;
            os_log_t v106 = 0;
          }
          v62 = v116;
          goto LABEL_57;
        }
      }
      else
      {
        v42 = (__CFError *)v127;
      }
      CFIndex v52 = CFErrorGetCode(v42);
      v53 = v127;
      v118 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:v52 description:@"accessgroup not found in object" underlying:v127];

      v54 = [v16 zoneName];
      v55 = sub_1000CD884(@"ckksitem", v54);

      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412547;
        v129 = v118;
        __int16 v130 = 2113;
        v131 = a3;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "couldn't fetch access group from item: %@ %{private}@", buf, 0x16u);
      }

      id v15 = v119;
      if (a8) {
        *a8 = v118;
      }

LABEL_19:
      id v38 = 0;
      goto LABEL_27;
    }
  }
  else
  {
    v26 = v127;
  }
  uint64_t v27 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:15 description:@"No UUID for item" underlying:v26];

  id v39 = [v16 zoneName];
  v29 = sub_1000CD884(@"ckksitem", v39);

  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412547;
    v129 = v27;
    __int16 v130 = 2113;
    v131 = a3;
    v30 = "No UUID for item: %@ %{private}@";
    goto LABEL_23;
  }
LABEL_24:

  id v15 = v119;
  if (a8) {
    *a8 = v27;
  }

  id v38 = 0;
  v31 = v120;
LABEL_27:

  return v38;
}

+ (id)keyForItem:(SecDbItem *)a3 contextID:(id)a4 zoneID:(id)a5 keyCache:(id)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = (__objc2_class *)a6;
  if (a3)
  {
    id v14 = sub_100119CB8(a3, kSecAttrAccessible);
    if ([v14 isEqualToString:kSecAttrAccessibleWhenUnlocked])
    {
      id v15 = &off_100306B18;
    }
    else
    {
      if (([v14 isEqualToString:kSecAttrAccessibleAlwaysPrivate] & 1) == 0
        && ([v14 isEqualToString:kSecAttrAccessibleAfterFirstUnlock] & 1) == 0)
      {
        v32 = +[NSString stringWithFormat:@"can't pick key class for protection %@", v14];
        id v19 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:17 description:v32];

        v33 = [v12 zoneName];
        v34 = sub_1000CD884(@"ckks-key", v33);

        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412547;
          v41 = v19;
          __int16 v42 = 2113;
          __int16 v43 = a3;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "can't pick key class: %@ %{private}@", buf, 0x16u);
        }

        if (a7)
        {
          id v19 = v19;
          id v18 = 0;
          *a7 = v19;
        }
        else
        {
          id v18 = 0;
        }
        goto LABEL_34;
      }
      id v15 = &off_100306D00;
    }
    id v36 = a7;
    id v19 = *v15;
    if (v13)
    {
      uint64_t v39 = 0;
      id v20 = (id *)&v39;
      id v21 = &v39;
      id v22 = v13;
    }
    else
    {
      id v22 = CKKSKey;
      uint64_t v38 = 0;
      id v20 = (id *)&v38;
      id v21 = &v38;
    }
    id v23 = [(__objc2_class *)v22 currentKeyForClass:v19 contextID:v11 zoneID:v12 error:v21];
    id v24 = (SecDbItem *)*v20;
    id v25 = v24;
    if (!v23 || v24)
    {
      id v28 = [v12 zoneName];
      v29 = sub_1000CD884(@"ckks-key", v28);

      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v41 = v19;
        __int16 v42 = 2112;
        __int16 v43 = v25;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Couldn't find current key for %@: %@", buf, 0x16u);
      }

      id v18 = 0;
      if (v36) {
        *id v36 = v25;
      }
    }
    else
    {
      id v37 = 0;
      v26 = [(__CFString *)v23 ensureKeyLoadedForContextID:v11 cache:v13 error:&v37];
      uint64_t v27 = (SecDbItem *)v37;

      if (v26)
      {
        id v18 = v23;
      }
      else
      {
        v30 = [v12 zoneName];
        v31 = sub_1000CD884(@"ckks-key", v30);

        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v41 = v23;
          __int16 v42 = 2112;
          __int16 v43 = v27;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Couldn't load key(%@): %@", buf, 0x16u);
        }

        id v18 = 0;
        if (v36) {
          *id v36 = v27;
        }
      }
    }
LABEL_34:

    goto LABEL_35;
  }
  id v16 = [v12 zoneName];
  id v17 = sub_1000CD884(@"ckks-key", v16);

  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Cannot select a key for no item!", buf, 2u);
  }

  if (a7)
  {
    +[NSError errorWithDomain:@"CKKSErrorDomain" code:57 description:@"can't pick a key class for an empty item"];
    id v18 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v18 = 0;
  }
LABEL_35:

  return v18;
}

@end