@interface CKKSCurrentKeyPointer
+ (BOOL)deleteAll:(id)a3 error:(id *)a4;
+ (BOOL)intransactionRecordChanged:(id)a3 contextID:(id)a4 resync:(BOOL)a5 flagHandler:(id)a6 error:(id *)a7;
+ (BOOL)intransactionRecordDeleted:(id)a3 contextID:(id)a4 error:(id *)a5;
+ (id)all:(id)a3 error:(id *)a4;
+ (id)forKeyClass:(id)a3 contextID:(id)a4 withKeyUUID:(id)a5 zoneID:(id)a6 error:(id *)a7;
+ (id)fromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
+ (id)fromDatabaseRow:(id)a3;
+ (id)sqlColumns;
+ (id)sqlTable;
+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesCKRecord:(id)a3;
- (NSString)currentKeyUUID;
- (SecCKKSKeyClass)keyclass;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initForClass:(id)a3 contextID:(id)a4 currentKeyUUID:(id)a5 zoneID:(id)a6 encodedCKRecord:(id)a7;
- (id)sqlValues;
- (id)updateCKRecord:(id)a3 zoneID:(id)a4;
- (id)whereClauseToFindSelf;
- (void)setCurrentKeyUUID:(id)a3;
- (void)setFromCKRecord:(id)a3;
- (void)setKeyclass:(id)a3;
@end

@implementation CKKSCurrentKeyPointer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentKeyUUID, 0);

  objc_storeStrong((id *)&self->_keyclass, 0);
}

- (void)setCurrentKeyUUID:(id)a3
{
}

- (NSString)currentKeyUUID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setKeyclass:(id)a3
{
}

- (SecCKKSKeyClass)keyclass
{
  return (SecCKKSKeyClass *)objc_getProperty(self, a2, 56, 1);
}

- (id)sqlValues
{
  v19[0] = @"keyclass";
  v3 = [(CKKSCurrentKeyPointer *)self keyclass];
  v20[0] = v3;
  v19[1] = @"contextID";
  v4 = [(CKKSCKRecordHolder *)self contextID];
  v20[1] = v4;
  v19[2] = @"currentKeyUUID";
  v5 = [(CKKSCurrentKeyPointer *)self currentKeyUUID];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = +[NSNull null];
  }
  v8 = v7;

  v20[2] = v8;
  v19[3] = @"ckzone";
  v9 = [(CKKSCKRecordHolder *)self zoneID];
  v10 = [v9 zoneName];

  if (v10)
  {
    id v11 = v10;
  }
  else
  {
    id v11 = +[NSNull null];
  }
  v12 = v11;

  v20[3] = v12;
  v19[4] = @"ckrecord";
  v13 = [(CKKSCKRecordHolder *)self encodedCKRecord];
  v14 = [v13 base64EncodedStringWithOptions:0];

  if (v14)
  {
    id v15 = v14;
  }
  else
  {
    id v15 = +[NSNull null];
  }
  v16 = v15;

  v20[4] = v16;
  v17 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:5];

  return v17;
}

- (id)whereClauseToFindSelf
{
  v9[0] = @"contextID";
  v3 = [(CKKSCKRecordHolder *)self contextID];
  v10[0] = v3;
  v9[1] = @"keyclass";
  v4 = [(CKKSCurrentKeyPointer *)self keyclass];
  v10[1] = v4;
  v9[2] = @"ckzone";
  v5 = [(CKKSCKRecordHolder *)self zoneID];
  v6 = [v5 zoneName];
  v10[2] = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

- (void)setFromCKRecord:(id)a3
{
  id v4 = a3;
  v5 = [v4 recordType];
  unsigned __int8 v6 = [v5 isEqualToString:@"currentkey"];

  if ((v6 & 1) == 0)
  {
    v14 = [v4 recordType];
    id v15 = +[NSString stringWithFormat:@"CKRecordType (%@) was not %@", v14, @"currentkey"];
    id v16 = +[NSException exceptionWithName:@"WrongCKRecordTypeException" reason:v15 userInfo:0];

    objc_exception_throw(v16);
  }
  [(CKKSCKRecordHolder *)self setStoredCKRecord:v4];
  id v7 = [v4 recordID];
  v8 = [v7 recordName];
  [(CKKSCurrentKeyPointer *)self setKeyclass:v8];

  v9 = [v4 objectForKeyedSubscript:@"parentkeyref"];
  v10 = [v9 recordID];
  id v11 = [v10 recordName];
  [(CKKSCurrentKeyPointer *)self setCurrentKeyUUID:v11];

  v12 = [(CKKSCurrentKeyPointer *)self currentKeyUUID];

  if (!v12)
  {
    v13 = sub_1000CD884(@"currentkey", 0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "No current key UUID in record! How/why? %@", buf, 0xCu);
    }
  }
}

- (BOOL)matchesCKRecord:(id)a3
{
  id v4 = a3;
  v5 = [v4 recordType];
  unsigned int v6 = [v5 isEqualToString:@"currentkey"];

  if (!v6) {
    goto LABEL_4;
  }
  id v7 = [v4 recordID];
  v8 = [v7 recordName];
  v9 = [(CKKSCurrentKeyPointer *)self keyclass];
  unsigned int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    id v11 = [v4 objectForKeyedSubscript:@"parentkeyref"];
    v12 = [v11 recordID];
    v13 = [v12 recordName];
    v14 = [(CKKSCurrentKeyPointer *)self currentKeyUUID];
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
  unsigned __int8 v9 = [v8 isEqualToString:@"currentkey"];

  if ((v9 & 1) == 0)
  {
    v20 = [v6 recordType];
    v21 = +[NSString stringWithFormat:@"CKRecordType (%@) was not %@", v20, @"currentkey"];
    id v22 = +[NSException exceptionWithName:@"WrongCKRecordTypeException" reason:v21 userInfo:0];

    goto LABEL_8;
  }
  unsigned int v10 = [v6 recordID];
  id v11 = [v10 recordName];
  v12 = [(CKKSCurrentKeyPointer *)self keyclass];
  unsigned __int8 v13 = [v11 isEqualToString:v12];

  if ((v13 & 1) == 0)
  {
    v20 = [v6 recordID];
    v23 = [v20 recordName];
    v24 = [(CKKSCurrentKeyPointer *)self keyclass];
    v25 = +[NSString stringWithFormat:@"CKRecord name (%@) was not %@", v23, v24];
    id v22 = +[NSException exceptionWithName:@"WrongCKRecordNameException" reason:v25 userInfo:0];

LABEL_8:
    objc_exception_throw(v22);
  }
  id v14 = objc_alloc((Class)CKReference);
  id v15 = objc_alloc((Class)CKRecordID);
  id v16 = [(CKKSCurrentKeyPointer *)self currentKeyUUID];
  id v17 = [v15 initWithRecordName:v16 zoneID:v7];
  id v18 = [v14 initWithRecordID:v17 action:0];
  [v6 setObject:v18 forKeyedSubscript:@"parentkeyref"];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    id v7 = [(CKKSCKRecordHolder *)self zoneID];
    v8 = [v6 zoneID];
    if (![v7 isEqual:v8])
    {
      unsigned __int8 v12 = 0;
LABEL_23:

      goto LABEL_24;
    }
    unsigned __int8 v9 = [(CKKSCurrentKeyPointer *)self currentKeyUUID];
    if (v9 || ([v6 currentKeyUUID], (v21 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      unsigned int v10 = [(CKKSCurrentKeyPointer *)self currentKeyUUID];
      v3 = [v6 currentKeyUUID];
      if (![v10 isEqual:v3])
      {
        unsigned __int8 v12 = 0;
LABEL_19:

        goto LABEL_20;
      }
      v20 = v10;
      int v11 = 1;
    }
    else
    {
      v21 = 0;
      int v11 = 0;
    }
    unsigned __int8 v13 = [(CKKSCurrentKeyPointer *)self keyclass];
    if (v13 || ([v6 keyclass], (uint64_t v18 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      int v22 = v11;
      id v14 = [(CKKSCurrentKeyPointer *)self keyclass];
      id v15 = [v6 keyclass];
      unsigned __int8 v12 = [v14 isEqual:v15];

      if (v13)
      {

        if (v22)
        {
          unsigned int v10 = v20;
          goto LABEL_19;
        }
LABEL_20:
        if (!v9) {

        }
        goto LABEL_23;
      }
      LOBYTE(v11) = v22;
      id v16 = v19;
    }
    else
    {
      id v16 = 0;
      unsigned __int8 v12 = 1;
    }

    unsigned int v10 = v20;
    if (v11) {
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  unsigned __int8 v12 = 0;
LABEL_24:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CKKSCurrentKeyPointer;
  id v5 = -[CKKSCKRecordHolder copyWithZone:](&v11, "copyWithZone:");
  id v6 = [(CKKSCurrentKeyPointer *)self keyclass];
  id v7 = [v6 copyWithZone:a3];
  [v5 setKeyclass:v7];

  v8 = [(CKKSCurrentKeyPointer *)self currentKeyUUID];
  id v9 = [v8 copyWithZone:a3];
  [v5 setCurrentKeyUUID:v9];

  return v5;
}

- (id)description
{
  v3 = [(CKKSCKRecordHolder *)self zoneID];
  id v4 = [v3 zoneName];
  id v5 = [(CKKSCKRecordHolder *)self contextID];
  id v6 = [(CKKSCurrentKeyPointer *)self keyclass];
  id v7 = [(CKKSCurrentKeyPointer *)self currentKeyUUID];
  v8 = +[NSString stringWithFormat:@"<CKKSCurrentKeyPointer(%@, %@) %@: %@>", v4, v5, v6, v7];

  return v8;
}

- (id)initForClass:(id)a3 contextID:(id)a4 currentKeyUUID:(id)a5 zoneID:(id)a6 encodedCKRecord:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CKKSCurrentKeyPointer;
  id v15 = [(CKKSCKRecordHolder *)&v21 initWithCKRecordType:@"currentkey" encodedCKRecord:a7 contextID:a4 zoneID:a6];
  p_isa = (id *)&v15->super.super.super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_keyclass, a3);
    objc_storeStrong(p_isa + 8, a5);
    id v17 = [p_isa currentKeyUUID];

    if (!v17)
    {
      uint64_t v18 = sub_1000CD884(@"currentkey", 0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "created a CKKSCurrentKey with a nil currentKeyUUID. Why?", v20, 2u);
      }
    }
  }

  return p_isa;
}

+ (BOOL)intransactionRecordDeleted:(id)a3 contextID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 recordName];
  unsigned int v10 = [v7 zoneID];
  id v23 = 0;
  objc_super v11 = +[CKKSCurrentKeyPointer tryFromDatabase:v9 contextID:v8 zoneID:v10 error:&v23];

  id v12 = v23;
  if (v12)
  {
    id v13 = [v7 zoneID];
    id v14 = [v13 zoneName];
    id v15 = sub_1000CD884(@"ckkskey", v14);

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "error loading ckp: %@", buf, 0xCu);
    }

    BOOL v16 = 0;
    if (a5) {
      *a5 = v12;
    }
  }
  else if (v11)
  {
    id v22 = 0;
    [v11 deleteFromDatabase:&v22];
    id v17 = v22;
    BOOL v16 = v17 == 0;
    if (v17)
    {
      uint64_t v18 = [v7 zoneID];
      v19 = [v18 zoneName];
      v20 = sub_1000CD884(@"ckkskey", v19);

      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v17;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "error deleting ckp: %@", buf, 0xCu);
      }

      if (a5) {
        *a5 = v17;
      }
    }
  }
  else
  {
    BOOL v16 = 1;
  }

  return v16;
}

+ (BOOL)intransactionRecordChanged:(id)a3 contextID:(id)a4 resync:(BOOL)a5 flagHandler:(id)a6 error:(id *)a7
{
  BOOL v8 = a5;
  unsigned int v10 = (CKKSCurrentKeyPointer *)a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(CKKSCurrentKeyPointer *)v10 recordID];
  id v14 = [v13 recordName];
  id v15 = [(CKKSCurrentKeyPointer *)v10 recordID];
  BOOL v16 = [v15 zoneID];
  id v59 = 0;
  id v17 = +[CKKSCurrentKeyPointer tryFromDatabase:v14 contextID:v11 zoneID:v16 error:&v59];
  uint64_t v18 = (CKKSCurrentKeyPointer *)v59;

  v57 = v18;
  if (v18)
  {
    v19 = [(CKKSCurrentKeyPointer *)v10 recordID];
    v20 = [v19 zoneID];
    objc_super v21 = [v20 zoneName];
    id v22 = sub_1000CD884(@"ckkskey", v21);

    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v61 = v18;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "error loading ckp: %@", buf, 0xCu);
    }
  }
  if (v8)
  {
    if (v17)
    {
      unsigned __int8 v23 = [(CKKSCurrentKeyPointer *)v17 matchesCKRecord:v10];
      v24 = [(CKKSCurrentKeyPointer *)v10 recordID];
      id v25 = [v24 zoneID];
      v26 = [v25 zoneName];
      v27 = sub_1000CD884(@"ckksresync", v26);

      if (v23)
      {
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v61 = v10;
          v28 = "Current key pointer has 'changed', but it matches our local copy: %@";
          v29 = v27;
          os_log_type_t v30 = OS_LOG_TYPE_DEFAULT;
LABEL_12:
          uint32_t v34 = 12;
LABEL_15:
          _os_log_impl((void *)&_mh_execute_header, v29, v30, v28, buf, v34);
        }
      }
      else if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v61 = v17;
        __int16 v62 = 2112;
        v63 = v10;
        v28 = "BUG: Local current key pointer doesn't match resynced CloudKit record: %@ %@";
        v29 = v27;
        os_log_type_t v30 = OS_LOG_TYPE_ERROR;
        uint32_t v34 = 22;
        goto LABEL_15;
      }
    }
    else
    {
      v31 = [(CKKSCurrentKeyPointer *)v10 recordID];
      v32 = [v31 zoneID];
      v33 = [v32 zoneName];
      v27 = sub_1000CD884(@"ckksresync", v33);

      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v61 = v10;
        v28 = "BUG: No current key pointer matching resynced CloudKit record: %@";
        v29 = v27;
        os_log_type_t v30 = OS_LOG_TYPE_ERROR;
        goto LABEL_12;
      }
    }
  }
  v35 = [(CKKSCKRecordHolder *)[CKKSCurrentKeyPointer alloc] initWithCKRecord:v10 contextID:v11];
  id v58 = 0;
  unsigned __int8 v36 = [(CKKSSQLDatabaseObject *)v35 saveToDatabase:&v58];
  v37 = (CKKSCurrentKeyPointer *)v58;
  if (v37) {
    BOOL v38 = 0;
  }
  else {
    BOOL v38 = v36;
  }
  if (v38)
  {
    if ([(CKKSCurrentKeyPointer *)v17 matchesCKRecord:v10])
    {
      v55 = v17;
      id v39 = v12;
      v40 = [(CKKSCurrentKeyPointer *)v10 recordID];
      v41 = [v40 zoneID];
      v42 = [v41 zoneName];
      v43 = sub_1000CD884(@"ckkskey", v42);

      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v61 = v10;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Current key pointer modification doesn't change anything interesting; skipping reprocess: %@",
          buf,
          0xCu);
      }

      id v12 = v39;
      id v17 = v55;
    }
    else
    {
      [v12 _onqueueHandleFlag:@"key_process_requested"];
    }
  }
  else
  {
    v56 = v17;
    id v44 = v12;
    v45 = [(CKKSCurrentKeyPointer *)v10 recordID];
    v46 = [v45 zoneID];
    v47 = [v46 zoneName];
    v48 = sub_1000CD884(@"ckkskey", v47);

    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v61 = v35;
      __int16 v62 = 2112;
      v63 = v37;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Couldn't save current key pointer to database: %@: %@", buf, 0x16u);
    }

    v49 = [(CKKSCurrentKeyPointer *)v10 recordID];
    v50 = [v49 zoneID];
    v51 = [v50 zoneName];
    v52 = sub_1000CD884(@"ckkskey", v51);

    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v61 = v10;
      _os_log_debug_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEBUG, "CKRecord was %@", buf, 0xCu);
    }

    id v12 = v44;
    id v17 = v56;
    if (a7) {
      *a7 = v37;
    }
  }

  return v38;
}

+ (id)fromDatabaseRow:(id)a3
{
  id v3 = a3;
  id v4 = [CKKSCurrentKeyPointer alloc];
  v20 = [v3 objectForKeyedSubscript:@"keyclass"];
  uint64_t v5 = [v20 asString];
  v19 = [v3 objectForKeyedSubscript:@"contextID"];
  id v6 = [v19 asString];
  id v7 = [v3 objectForKeyedSubscript:@"currentKeyUUID"];
  BOOL v8 = [v7 asString];
  id v9 = objc_alloc((Class)CKRecordZoneID);
  unsigned int v10 = [v3 objectForKeyedSubscript:@"ckzone"];
  id v11 = [v10 asString];
  id v12 = [v9 initWithZoneName:v11 ownerName:CKCurrentUserDefaultName];
  id v13 = [v3 objectForKeyedSubscript:@"ckrecord"];

  id v14 = [v13 asBase64DecodedData];
  id v15 = v4;
  BOOL v16 = (void *)v5;
  id v17 = [(CKKSCurrentKeyPointer *)v15 initForClass:v5 contextID:v6 currentKeyUUID:v8 zoneID:v12 encodedCKRecord:v14];

  return v17;
}

+ (id)sqlColumns
{
  return &off_100326E78;
}

+ (id)sqlTable
{
  return @"currentkeys";
}

+ (BOOL)deleteAll:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [a1 sqlTable];
  CFStringRef v11 = @"ckzone";
  BOOL v8 = [v6 zoneName];

  id v12 = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  LOBYTE(a4) = +[CKKSSQLDatabaseObject deleteFromTable:v7 where:v9 connection:0 error:a4];

  return (char)a4;
}

+ (id)all:(id)a3 error:(id *)a4
{
  CFStringRef v10 = @"ckzone";
  id v6 = [a3 zoneName];
  CFStringRef v11 = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  BOOL v8 = [a1 allWhere:v7 error:a4];

  return v8;
}

+ (id)forKeyClass:(id)a3 contextID:(id)a4 withKeyUUID:(id)a5 zoneID:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v22 = 0;
  BOOL v16 = [a1 tryFromDatabase:v12 contextID:v13 zoneID:v15 error:&v22];
  id v17 = v22;
  uint64_t v18 = v17;
  if (v17)
  {
    v19 = 0;
    if (a7) {
      *a7 = v17;
    }
  }
  else
  {
    if (v16)
    {
      [v16 setCurrentKeyUUID:v14];
      id v20 = v16;
    }
    else
    {
      id v20 = [[CKKSCurrentKeyPointer alloc] initForClass:v12 contextID:v13 currentKeyUUID:v14 zoneID:v15 encodedCKRecord:0];
    }
    v19 = v20;
  }

  return v19;
}

+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  v16[0] = @"keyclass";
  v16[1] = @"contextID";
  v17[0] = a3;
  v17[1] = a4;
  v16[2] = @"ckzone";
  id v10 = a4;
  id v11 = a3;
  id v12 = [a5 zoneName];
  v17[2] = v12;
  id v13 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];

  id v14 = [a1 tryFromDatabaseWhere:v13 error:a6];

  return v14;
}

+ (id)fromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  v16[0] = @"keyclass";
  v16[1] = @"contextID";
  v17[0] = a3;
  v17[1] = a4;
  v16[2] = @"ckzone";
  id v10 = a4;
  id v11 = a3;
  id v12 = [a5 zoneName];
  v17[2] = v12;
  id v13 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];

  id v14 = [a1 fromDatabaseWhere:v13 error:a6];

  return v14;
}

@end