@interface CKKSMirrorEntry
+ (id)allWithUUID:(id)a3 contextID:(id)a4 error:(id *)a5;
+ (id)countsByParentKeyWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5;
+ (id)countsByZoneNameWithContextID:(id)a3 error:(id *)a4;
+ (id)countsWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5;
+ (id)fromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
+ (id)fromDatabaseRow:(id)a3;
+ (id)pcsMirrorKeysForService:(id)a3 matchingKeys:(id)a4 error:(id *)a5;
+ (id)sqlColumns;
+ (id)sqlTable;
+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
- (BOOL)matchesCKRecord:(id)a3;
- (BOOL)matchesCKRecord:(id)a3 checkServerFields:(BOOL)a4;
- (CKKSItem)item;
- (CKKSMirrorEntry)initWithCKKSItem:(id)a3;
- (CKKSMirrorEntry)initWithCKRecord:(id)a3 contextID:(id)a4;
- (NSString)uuid;
- (id)description;
- (id)sqlValues;
- (id)whereClauseToFindSelf;
- (unint64_t)wasCurrent;
- (void)setFromCKRecord:(id)a3;
- (void)setItem:(id)a3;
- (void)setUuid:(id)a3;
- (void)setWasCurrent:(unint64_t)a3;
@end

@implementation CKKSMirrorEntry

- (void).cxx_destruct
{
}

- (void)setWasCurrent:(unint64_t)a3
{
  self->_wasCurrent = a3;
}

- (unint64_t)wasCurrent
{
  return self->_wasCurrent;
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
  v3 = [(CKKSMirrorEntry *)self item];
  v4 = [v3 sqlValues];
  id v5 = [v4 mutableCopy];

  v6 = +[NSNumber numberWithUnsignedLongLong:[(CKKSMirrorEntry *)self wasCurrent]];
  v7 = [v6 stringValue];
  [v5 setObject:v7 forKeyedSubscript:@"wascurrent"];

  return v5;
}

- (id)whereClauseToFindSelf
{
  v2 = [(CKKSMirrorEntry *)self item];
  v3 = [v2 whereClauseToFindSelf];

  return v3;
}

- (void)setUuid:(id)a3
{
  id v4 = a3;
  id v5 = [(CKKSMirrorEntry *)self item];
  [v5 setUuid:v4];
}

- (NSString)uuid
{
  v2 = [(CKKSMirrorEntry *)self item];
  v3 = [v2 uuid];

  return (NSString *)v3;
}

- (BOOL)matchesCKRecord:(id)a3 checkServerFields:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(CKKSMirrorEntry *)self item];
  unsigned int v8 = [v7 matchesCKRecord:v6];

  if (v8 && v4)
  {
    v9 = [v6 objectForKeyedSubscript:@"server_wascurrent"];
    if (!v9 && ![(CKKSMirrorEntry *)self wasCurrent]) {
      goto LABEL_6;
    }
    v10 = [v6 objectForKeyedSubscript:@"server_wascurrent"];
    v11 = +[NSNumber numberWithUnsignedLongLong:[(CKKSMirrorEntry *)self wasCurrent]];
    unsigned __int8 v12 = [v10 isEqual:v11];

    if ((v12 & 1) == 0)
    {
      v13 = sub_1000CD884(@"ckksitem", 0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v15 = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "was_current does not match", v15, 2u);
      }

      LOBYTE(v8) = 0;
    }
    else
    {
LABEL_6:
      LOBYTE(v8) = 1;
    }
  }

  return v8;
}

- (BOOL)matchesCKRecord:(id)a3
{
  return [(CKKSMirrorEntry *)self matchesCKRecord:a3 checkServerFields:1];
}

- (void)setFromCKRecord:(id)a3
{
  id v4 = a3;
  id v5 = [(CKKSMirrorEntry *)self item];
  [v5 setFromCKRecord:v4];

  id v6 = [v4 objectForKeyedSubscript:@"server_wascurrent"];

  self->_wasCurrent = (unint64_t)[v6 unsignedLongLongValue];
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(CKKSMirrorEntry *)self item];
  id v6 = [v5 contextID];
  v7 = [(CKKSMirrorEntry *)self item];
  unsigned int v8 = [v7 zoneID];
  v9 = [v8 zoneName];
  v10 = [(CKKSMirrorEntry *)self item];
  v11 = [v10 uuid];
  unsigned __int8 v12 = +[NSString stringWithFormat:@"<%@[%@](%@): %@>", v4, v6, v9, v11];

  return v12;
}

- (CKKSMirrorEntry)initWithCKRecord:(id)a3 contextID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CKKSMirrorEntry;
  unsigned int v8 = [(CKKSMirrorEntry *)&v13 init];
  if (v8)
  {
    v9 = [[CKKSItem alloc] initWithCKRecord:v6 contextID:v7];
    item = v8->_item;
    v8->_item = v9;

    v11 = [v6 objectForKeyedSubscript:@"server_wascurrent"];
    v8->_wasCurrent = (unint64_t)[v11 unsignedLongLongValue];
  }
  return v8;
}

- (CKKSMirrorEntry)initWithCKKSItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKKSMirrorEntry;
  id v6 = [(CKKSMirrorEntry *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_item, a3);
    v7->_wasCurrent = 0;
  }

  return v7;
}

+ (id)pcsMirrorKeysForService:(id)a3 matchingKeys:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v8 count]];
  v11 = [a1 sqlTable];
  CFStringRef v21 = @"pcss";
  id v22 = v9;
  unsigned __int8 v12 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000A77FC;
  v18[3] = &unk_1002F8DC0;
  id v19 = v8;
  id v13 = v10;
  id v20 = v13;
  id v14 = v8;
  +[CKKSSQLDatabaseObject queryDatabaseTable:v11 where:v12 columns:&off_100326F20 groupBy:0 orderBy:&off_100326F38 limit:0 processRow:v18 error:a5];

  v15 = v20;
  id v16 = v13;

  return v16;
}

+ (id)countsWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_1000A7AE4;
  v26 = sub_1000A7AF4;
  id v27 = 0;
  id v9 = [(id)objc_opt_class() sqlTable];
  v28[0] = @"contextID";
  id v10 = v7;
  v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = +[NSNull null];
  }
  id v13 = v12;

  v29[0] = v13;
  v28[1] = @"ckzone";
  id v14 = [v8 zoneName];
  v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = +[NSNull null];
  }
  v17 = v16;

  v29[1] = v17;
  v18 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000A7AFC;
  v21[3] = &unk_100306000;
  v21[4] = &v22;
  +[CKKSSQLDatabaseObject queryDatabaseTable:v9 where:v18 columns:&off_100326F08 groupBy:0 orderBy:0 limit:-1 processRow:v21 error:a5];

  id v19 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v19;
}

+ (id)countsByZoneNameWithContextID:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  id v7 = [(id)objc_opt_class() sqlTable];
  CFStringRef v17 = @"contextID";
  id v8 = v5;
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = +[NSNull null];
  }
  v11 = v10;

  v18 = v11;
  id v12 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000A7D14;
  v15[3] = &unk_1002FA668;
  id v13 = v6;
  id v16 = v13;
  +[CKKSSQLDatabaseObject queryDatabaseTable:v7 where:v12 columns:&off_100326ED8 groupBy:&off_100326EF0 orderBy:0 limit:-1 processRow:v15 error:a4];

  return v13;
}

+ (id)countsByParentKeyWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  id v10 = [(id)objc_opt_class() sqlTable];
  v23[0] = @"contextID";
  id v11 = v7;
  id v12 = v11;
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
  v15 = [v8 zoneName];

  if (v15)
  {
    id v16 = v15;
  }
  else
  {
    id v16 = +[NSNull null];
  }
  CFStringRef v17 = v16;

  v24[1] = v17;
  v18 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000A7FD4;
  v21[3] = &unk_1002FA668;
  id v19 = v9;
  id v22 = v19;
  +[CKKSSQLDatabaseObject queryDatabaseTable:v10 where:v18 columns:&off_100326EA8 groupBy:&off_100326EC0 orderBy:0 limit:-1 processRow:v21 error:a5];

  return v19;
}

+ (id)fromDatabaseRow:(id)a3
{
  id v3 = a3;
  id v4 = [CKKSMirrorEntry alloc];
  id v5 = +[CKKSItem fromDatabaseRow:v3];
  id v6 = [(CKKSMirrorEntry *)v4 initWithCKKSItem:v5];

  id v7 = objc_alloc_init((Class)NSNumberFormatter);
  id v8 = [v3 objectForKeyedSubscript:@"wascurrent"];

  id v9 = [v8 asString];
  id v10 = [v7 numberFromString:v9];
  -[CKKSMirrorEntry setWasCurrent:](v6, "setWasCurrent:", [v10 unsignedLongLongValue]);

  return v6;
}

+ (id)sqlColumns
{
  v2 = +[CKKSItem sqlColumns];
  id v3 = [v2 arrayByAddingObjectsFromArray:&off_100326E90];

  return v3;
}

+ (id)sqlTable
{
  return @"ckmirror";
}

+ (id)allWithUUID:(id)a3 contextID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v20[0] = @"contextID";
  id v9 = a4;
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = +[NSNull null];
  }
  id v12 = v11;

  v20[1] = @"UUID";
  v21[0] = v12;
  id v13 = v8;
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

  v21[1] = v16;
  CFStringRef v17 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  v18 = [a1 allWhere:v17 error:a5];

  return v18;
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

  v29[1] = v20;
  void v28[2] = @"ckzone";
  CFStringRef v21 = [v12 zoneName];
  id v22 = v21;
  if (v21)
  {
    id v23 = v21;
  }
  else
  {
    id v23 = +[NSNull null];
  }
  uint64_t v24 = v23;

  void v29[2] = v24;
  v25 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];
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

  v29[1] = v20;
  void v28[2] = @"ckzone";
  CFStringRef v21 = [v12 zoneName];
  id v22 = v21;
  if (v21)
  {
    id v23 = v21;
  }
  else
  {
    id v23 = +[NSNull null];
  }
  uint64_t v24 = v23;

  void v29[2] = v24;
  v25 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];
  v26 = [a1 fromDatabaseWhere:v25 error:a6];

  return v26;
}

@end