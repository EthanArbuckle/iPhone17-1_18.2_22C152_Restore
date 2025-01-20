@interface CKKSCurrentItemPointer
+ (BOOL)deleteAll:(id)a3 contextID:(id)a4 error:(id *)a5;
+ (BOOL)intransactionRecordChanged:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6;
+ (BOOL)intransactionRecordDeleted:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6;
+ (id)allInZone:(id)a3 contextID:(id)a4 error:(id *)a5;
+ (id)fromDatabase:(id)a3 contextID:(id)a4 state:(id)a5 zoneID:(id)a6 error:(id *)a7;
+ (id)fromDatabaseRow:(id)a3;
+ (id)remoteItemPointers:(id)a3 contextID:(id)a4 error:(id *)a5;
+ (id)sqlColumns;
+ (id)sqlTable;
+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 state:(id)a5 zoneID:(id)a6 error:(id *)a7;
+ (int64_t)countByState:(id)a3 contextID:(id)a4 zone:(id)a5 error:(id *)a6;
- (BOOL)matchesCKRecord:(id)a3;
- (NSString)currentItemUUID;
- (NSString)identifier;
- (SecCKKSProcessedState)state;
- (id)description;
- (id)initForIdentifier:(id)a3 contextID:(id)a4 currentItemUUID:(id)a5 state:(id)a6 zoneID:(id)a7 encodedCKRecord:(id)a8;
- (id)sqlValues;
- (id)updateCKRecord:(id)a3 zoneID:(id)a4;
- (id)whereClauseToFindSelf;
- (void)setCurrentItemUUID:(id)a3;
- (void)setFromCKRecord:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setState:(id)a3;
@end

@implementation CKKSCurrentItemPointer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentItemUUID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_state, 0);
}

- (void)setCurrentItemUUID:(id)a3
{
}

- (NSString)currentItemUUID
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setState:(id)a3
{
}

- (SecCKKSProcessedState)state
{
  return (SecCKKSProcessedState *)objc_getProperty(self, a2, 56, 1);
}

- (id)sqlValues
{
  v26[0] = @"contextID";
  v3 = [(CKKSCKRecordHolder *)self contextID];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[NSNull null];
  }
  v6 = v5;

  v27[0] = v6;
  v26[1] = @"identifier";
  v7 = [(CKKSCurrentItemPointer *)self identifier];
  v27[1] = v7;
  v26[2] = @"currentItemUUID";
  v8 = [(CKKSCurrentItemPointer *)self currentItemUUID];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = +[NSNull null];
  }
  v11 = v10;

  v27[2] = v11;
  v26[3] = @"state";
  v12 = [(CKKSCurrentItemPointer *)self state];
  v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = +[NSNull null];
  }
  v15 = v14;

  v27[3] = v15;
  v26[4] = @"ckzone";
  v16 = [(CKKSCKRecordHolder *)self zoneID];
  v17 = [v16 zoneName];

  if (v17)
  {
    id v18 = v17;
  }
  else
  {
    id v18 = +[NSNull null];
  }
  v19 = v18;

  v27[4] = v19;
  v26[5] = @"ckrecord";
  v20 = [(CKKSCKRecordHolder *)self encodedCKRecord];
  v21 = [v20 base64EncodedStringWithOptions:0];

  if (v21)
  {
    id v22 = v21;
  }
  else
  {
    id v22 = +[NSNull null];
  }
  v23 = v22;

  v27[5] = v23;
  v24 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:6];

  return v24;
}

- (id)whereClauseToFindSelf
{
  v13[0] = @"contextID";
  v3 = [(CKKSCKRecordHolder *)self contextID];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[NSNull null];
  }
  v6 = v5;

  v14[0] = v6;
  v13[1] = @"identifier";
  v7 = [(CKKSCurrentItemPointer *)self identifier];
  v14[1] = v7;
  v13[2] = @"ckzone";
  v8 = [(CKKSCKRecordHolder *)self zoneID];
  v9 = [v8 zoneName];
  v14[2] = v9;
  v13[3] = @"state";
  id v10 = [(CKKSCurrentItemPointer *)self state];
  v14[3] = v10;
  v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];

  return v11;
}

- (void)setFromCKRecord:(id)a3
{
  id v14 = a3;
  v4 = [v14 recordType];
  unsigned __int8 v5 = [v4 isEqualToString:@"currentitem"];

  if ((v5 & 1) == 0)
  {
    v11 = [v14 recordType];
    v12 = +[NSString stringWithFormat:@"CKRecordType (%@) was not %@", v11, @"currentitem"];
    id v13 = +[NSException exceptionWithName:@"WrongCKRecordTypeException" reason:v12 userInfo:0];

    objc_exception_throw(v13);
  }
  [(CKKSCKRecordHolder *)self setStoredCKRecord:v14];
  v6 = [v14 recordID];
  v7 = [v6 recordName];
  [(CKKSCurrentItemPointer *)self setIdentifier:v7];

  v8 = [v14 objectForKeyedSubscript:@"item"];
  v9 = [v8 recordID];
  id v10 = [v9 recordName];
  [(CKKSCurrentItemPointer *)self setCurrentItemUUID:v10];
}

- (BOOL)matchesCKRecord:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 recordType];
  unsigned int v6 = [v5 isEqualToString:@"currentitem"];

  if (!v6) {
    goto LABEL_4;
  }
  v7 = [v4 recordID];
  v8 = [v7 recordName];
  v9 = [(CKKSCurrentItemPointer *)self identifier];
  unsigned int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    v11 = [v4 objectForKeyedSubscript:@"item"];
    v12 = [v11 recordID];
    id v13 = [v12 recordName];
    id v14 = [(CKKSCurrentItemPointer *)self currentItemUUID];
    unsigned __int8 v15 = [v13 isEqualToString:v14];
  }
  else
  {
LABEL_4:
    unsigned __int8 v15 = 0;
  }

  return v15;
}

- (id)updateCKRecord:(id)a3 zoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 recordType];
  unsigned __int8 v9 = [v8 isEqualToString:@"currentitem"];

  if ((v9 & 1) == 0)
  {
    v20 = [v6 recordType];
    v21 = +[NSString stringWithFormat:@"CKRecordType (%@) was not %@", v20, @"currentitem"];
    id v22 = +[NSException exceptionWithName:@"WrongCKRecordTypeException" reason:v21 userInfo:0];

    goto LABEL_8;
  }
  unsigned int v10 = [v6 recordID];
  v11 = [v10 recordName];
  v12 = [(CKKSCurrentItemPointer *)self identifier];
  unsigned __int8 v13 = [v11 isEqualToString:v12];

  if ((v13 & 1) == 0)
  {
    v20 = [v6 recordID];
    v23 = [v20 recordName];
    v24 = [(CKKSCurrentItemPointer *)self identifier];
    v25 = +[NSString stringWithFormat:@"CKRecord name (%@) was not %@", v23, v24];
    id v22 = +[NSException exceptionWithName:@"WrongCKRecordNameException" reason:v25 userInfo:0];

LABEL_8:
    objc_exception_throw(v22);
  }
  id v14 = objc_alloc((Class)CKReference);
  id v15 = objc_alloc((Class)CKRecordID);
  v16 = [(CKKSCurrentItemPointer *)self currentItemUUID];
  id v17 = [v15 initWithRecordName:v16 zoneID:v7];
  id v18 = [v14 initWithRecordID:v17 action:0];
  [v6 setObject:v18 forKeyedSubscript:@"item"];

  return v6;
}

- (id)description
{
  v3 = [(CKKSCKRecordHolder *)self contextID];
  id v4 = [(CKKSCKRecordHolder *)self zoneID];
  unsigned __int8 v5 = [v4 zoneName];
  id v6 = [(CKKSCurrentItemPointer *)self identifier];
  id v7 = [(CKKSCurrentItemPointer *)self currentItemUUID];
  v8 = +[NSString stringWithFormat:@"<CKKSCurrentItemPointer[%@](%@) %@: %@>", v3, v5, v6, v7];

  return v8;
}

- (id)initForIdentifier:(id)a3 contextID:(id)a4 currentItemUUID:(id)a5 state:(id)a6 zoneID:(id)a7 encodedCKRecord:(id)a8
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CKKSCurrentItemPointer;
  id v18 = [(CKKSCKRecordHolder *)&v21 initWithCKRecordType:@"currentitem" encodedCKRecord:a8 contextID:a4 zoneID:a7];
  p_isa = (id *)&v18->super.super.super.isa;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_state, a6);
    objc_storeStrong(p_isa + 8, a3);
    objc_storeStrong(p_isa + 9, a5);
  }

  return p_isa;
}

+ (BOOL)intransactionRecordDeleted:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6
{
  v8 = (__CFString *)a3;
  id v9 = a4;
  unsigned int v10 = [(__CFString *)v8 zoneID];
  v11 = [v10 zoneName];
  v12 = sub_1000CD884(@"currentitem", v11);

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    CFStringRef v42 = @"currentitem";
    __int16 v43 = 2112;
    v44 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "CloudKit notification: deleted current item pointer(%@): %@", buf, 0x16u);
  }

  unsigned __int8 v13 = [(__CFString *)v8 recordName];
  id v14 = [(__CFString *)v8 zoneID];
  id v40 = 0;
  id v15 = +[CKKSCurrentItemPointer tryFromDatabase:v13 contextID:v9 state:@"remote" zoneID:v14 error:&v40];
  id v16 = (__CFString *)v40;

  if (!v16)
  {
    id v39 = 0;
    [v15 deleteFromDatabase:&v39];
    objc_super v21 = (__CFString *)v39;
    if (v21)
    {
      id v16 = v21;
      if (a6) {
        *a6 = v21;
      }
      id v22 = [(__CFString *)v8 zoneID];
      v23 = [v22 zoneName];
      v19 = sub_1000CD884(@"currentitem", v23);

      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      *(_DWORD *)buf = 138412546;
      CFStringRef v42 = v8;
      __int16 v43 = 2112;
      v44 = v16;
      v20 = "Failed to delete remote CKKSCurrentItemPointer %@: %@";
      goto LABEL_13;
    }
    v26 = [(__CFString *)v8 recordName];
    v27 = [(__CFString *)v8 zoneID];
    id v38 = 0;
    v19 = +[CKKSCurrentItemPointer tryFromDatabase:v26 contextID:v9 state:@"local" zoneID:v27 error:&v38];
    id v16 = (__CFString *)v38;

    if (v16)
    {
      if (a6) {
        *a6 = v16;
      }
      v28 = [(__CFString *)v8 zoneID];
      v29 = [v28 zoneName];
      v30 = sub_1000CD884(@"currentitem", v29);

      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        goto LABEL_27;
      }
      *(_DWORD *)buf = 138412546;
      CFStringRef v42 = v8;
      __int16 v43 = 2112;
      v44 = v16;
      v31 = "Failed to find local CKKSCurrentItemPointer %@: %@";
    }
    else
    {
      id v37 = 0;
      [v19 deleteFromDatabase:&v37];
      v32 = (__CFString *)v37;
      if (!v32)
      {
        v35 = [(__CFString *)v8 zoneID];
        v36 = [v35 zoneName];
        v30 = sub_1000CD884(@"currentitem", v36);

        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          CFStringRef v42 = v8;
          __int16 v43 = 2112;
          v44 = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "CKKSCurrentItemPointer was deleted: %@ error: %@", buf, 0x16u);
        }
        id v16 = 0;
        BOOL v24 = 1;
        goto LABEL_28;
      }
      id v16 = v32;
      if (a6) {
        *a6 = v32;
      }
      v33 = [(__CFString *)v8 zoneID];
      v34 = [v33 zoneName];
      v30 = sub_1000CD884(@"currentitem", v34);

      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
LABEL_27:
        BOOL v24 = 0;
LABEL_28:

        goto LABEL_15;
      }
      *(_DWORD *)buf = 138412546;
      CFStringRef v42 = v8;
      __int16 v43 = 2112;
      v44 = v16;
      v31 = "Failed to delete local CKKSCurrentItemPointer %@: %@";
    }
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, v31, buf, 0x16u);
    goto LABEL_27;
  }
  if (a6) {
    *a6 = v16;
  }
  id v17 = [(__CFString *)v8 zoneID];
  id v18 = [v17 zoneName];
  v19 = sub_1000CD884(@"currentitem", v18);

  if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    goto LABEL_14;
  }
  *(_DWORD *)buf = 138412546;
  CFStringRef v42 = v8;
  __int16 v43 = 2112;
  v44 = v16;
  v20 = "Failed to find remote CKKSCurrentItemPointer to delete %@: %@";
LABEL_13:
  _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v20, buf, 0x16u);
LABEL_14:
  BOOL v24 = 0;
LABEL_15:

  return v24;
}

+ (BOOL)intransactionRecordChanged:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  if (!v7) {
    goto LABEL_18;
  }
  v50 = a6;
  v11 = [v9 recordID];
  v12 = [v11 recordName];
  unsigned __int8 v13 = [v9 recordID];
  id v14 = [v13 zoneID];
  id v53 = 0;
  uint64_t v15 = +[CKKSCurrentItemPointer tryFromDatabase:v12 contextID:v10 state:@"local" zoneID:v14 error:&v53];
  id v16 = v53;

  id v17 = [v9 recordID];
  id v18 = [v17 recordName];
  v19 = [v9 recordID];
  v20 = [v19 zoneID];
  id v52 = v16;
  uint64_t v21 = +[CKKSCurrentItemPointer tryFromDatabase:v18 contextID:v10 state:@"remote" zoneID:v20 error:&v52];
  id v22 = v52;

  if (v22)
  {
    v23 = [v9 recordID];
    BOOL v24 = [v23 zoneID];
    v25 = [v24 zoneName];
    v26 = sub_1000CD884(@"ckksresync", v25);

    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v55 = (uint64_t)v22;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "error loading cip: %@", buf, 0xCu);
    }
  }
  if (v15 | v21)
  {
    if (([(id)v15 matchesCKRecord:v9] & 1) != 0
      || ([(id)v21 matchesCKRecord:v9] & 1) != 0)
    {
      v27 = [v9 recordID];
      v28 = [v27 zoneID];
      v29 = [v28 zoneName];
      v30 = sub_1000CD884(@"ckksresync", v29);

      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v55 = (uint64_t)v9;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Already know about this current item pointer, skipping update: %@", buf, 0xCu);
      }

      goto LABEL_27;
    }
    id v38 = [v9 recordID];
    id v39 = [v38 zoneID];
    id v40 = [v39 zoneName];
    v34 = sub_1000CD884(@"ckksresync", v40);

    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 138412802;
    uint64_t v55 = v15;
    __int16 v56 = 2112;
    uint64_t v57 = v21;
    __int16 v58 = 2112;
    id v59 = v9;
    v35 = "BUG: Local current item pointer doesn't match resynced CloudKit record(s): %@ %@ %@";
    v36 = v34;
    uint32_t v37 = 32;
    goto LABEL_16;
  }
  v31 = [v9 recordID];
  v32 = [v31 zoneID];
  v33 = [v32 zoneName];
  v34 = sub_1000CD884(@"ckksresync", v33);

  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v55 = (uint64_t)v9;
    v35 = "BUG: No current item pointer matching resynced CloudKit record: %@";
    v36 = v34;
    uint32_t v37 = 12;
LABEL_16:
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, v35, buf, v37);
  }
LABEL_17:
  a6 = v50;

LABEL_18:
  uint64_t v15 = [(CKKSCKRecordHolder *)[CKKSCurrentItemPointer alloc] initWithCKRecord:v9 contextID:v10];
  [(id)v15 setState:@"remote"];
  id v51 = 0;
  unsigned int v41 = [(id)v15 saveToDatabase:&v51];
  id v42 = v51;
  if (v41) {
    BOOL v43 = v42 == 0;
  }
  else {
    BOOL v43 = 0;
  }
  if (v43)
  {
    id v22 = 0;
LABEL_27:
    BOOL v48 = 1;
    goto LABEL_29;
  }
  id v22 = v42;
  v44 = [v9 recordID];
  v45 = [v44 zoneID];
  v46 = [v45 zoneName];
  v47 = sub_1000CD884(@"currentitem", v46);

  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v55 = v15;
    __int16 v56 = 2112;
    uint64_t v57 = (uint64_t)v22;
    __int16 v58 = 2112;
    id v59 = v9;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Couldn't save current item pointer to database: %@: %@ %@", buf, 0x20u);
  }

  if (a6)
  {
    id v22 = v22;
    BOOL v48 = 0;
    *a6 = v22;
  }
  else
  {
    BOOL v48 = 0;
  }
LABEL_29:

  return v48;
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
  id v17 = [v11 zoneName];
  id v18 = v17;
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
  uint64_t v21 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:3];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100097858;
  v24[3] = &unk_100306000;
  v24[4] = &v25;
  +[CKKSSQLDatabaseObject queryDatabaseTable:v12 where:v21 columns:&off_100326E60 groupBy:0 orderBy:0 limit:-1 processRow:v24 error:a6];

  int64_t v22 = v26[3];
  _Block_object_dispose(&v25, 8);

  return v22;
}

+ (id)fromDatabaseRow:(id)a3
{
  id v3 = a3;
  id v4 = [CKKSCurrentItemPointer alloc];
  v20 = [v3 objectForKeyedSubscript:@"identifier"];
  id v16 = [v20 asString];
  id v19 = [v3 objectForKeyedSubscript:@"contextID"];
  unsigned __int8 v5 = [v19 asString];
  id v18 = [v3 objectForKeyedSubscript:@"currentItemUUID"];
  id v17 = [v18 asString];
  id v6 = [v3 objectForKeyedSubscript:@"state"];
  BOOL v7 = [v6 asString];
  id v8 = objc_alloc((Class)CKRecordZoneID);
  id v9 = [v3 objectForKeyedSubscript:@"ckzone"];
  id v10 = [v9 asString];
  id v11 = [v8 initWithZoneName:v10 ownerName:CKCurrentUserDefaultName];
  v12 = [v3 objectForKeyedSubscript:@"ckrecord"];

  id v13 = [v12 asBase64DecodedData];
  id v14 = [(CKKSCurrentItemPointer *)v4 initForIdentifier:v16 contextID:v5 currentItemUUID:v17 state:v7 zoneID:v11 encodedCKRecord:v13];

  return v14;
}

+ (id)sqlColumns
{
  return &off_100326E48;
}

+ (id)sqlTable
{
  return @"currentitems";
}

+ (BOOL)deleteAll:(id)a3 contextID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = [a1 sqlTable];
  CFStringRef v12 = @"ckzone";
  id v9 = [v7 zoneName];

  id v13 = v9;
  id v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  LOBYTE(a5) = +[CKKSSQLDatabaseObject deleteFromTable:v8 where:v10 connection:0 error:a5];

  return (char)a5;
}

+ (id)allInZone:(id)a3 contextID:(id)a4 error:(id *)a5
{
  CFStringRef v11 = @"ckzone";
  id v7 = [a3 zoneName];
  CFStringRef v12 = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  id v9 = [a1 allWhere:v8 error:a5];

  return v9;
}

+ (id)remoteItemPointers:(id)a3 contextID:(id)a4 error:(id *)a5
{
  v11[0] = @"state";
  v11[1] = @"ckzone";
  v12[0] = @"remote";
  id v7 = [a3 zoneName];
  v12[1] = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  id v9 = [a1 allWhere:v8 error:a5];

  return v9;
}

+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 state:(id)a5 zoneID:(id)a6 error:(id *)a7
{
  v19[0] = @"contextID";
  v19[1] = @"identifier";
  v20[0] = a4;
  v20[1] = a3;
  v20[2] = a5;
  v19[2] = @"state";
  v19[3] = @"ckzone";
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [a6 zoneName];
  v20[3] = v15;
  id v16 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];

  id v17 = [a1 tryFromDatabaseWhere:v16 error:a7];

  return v17;
}

+ (id)fromDatabase:(id)a3 contextID:(id)a4 state:(id)a5 zoneID:(id)a6 error:(id *)a7
{
  v19[0] = @"contextID";
  v19[1] = @"identifier";
  v20[0] = a4;
  v20[1] = a3;
  v20[2] = a5;
  v19[2] = @"state";
  v19[3] = @"ckzone";
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [a6 zoneName];
  v20[3] = v15;
  id v16 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];

  id v17 = [a1 fromDatabaseWhere:v16 error:a7];

  return v17;
}

@end