@interface CKKSSQLDatabaseObject
+ (BOOL)_deleteAll:(id *)a3;
+ (BOOL)deleteAll:(id *)a3;
+ (BOOL)deleteAllWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5;
+ (BOOL)deleteFromTable:(id)a3 where:(id)a4 connection:(__OpaqueSecDbConnection *)a5 error:(id *)a6;
+ (BOOL)performCKKSTransaction:(id)a3;
+ (BOOL)queryDatabaseTable:(id)a3 where:(id)a4 columns:(id)a5 groupBy:(id)a6 orderBy:(id)a7 limit:(int64_t)a8 processRow:(id)a9 error:(id *)a10;
+ (BOOL)queryMaxValueForField:(id)a3 inTable:(id)a4 where:(id)a5 columns:(id)a6 processRow:(id)a7;
+ (BOOL)saveToDatabaseTable:(id)a3 row:(id)a4 connection:(__OpaqueSecDbConnection *)a5 error:(id *)a6;
+ (id)all:(id *)a3;
+ (id)allParentKeyUUIDsInContextID:(id)a3 zoneID:(id)a4 error:(id *)a5;
+ (id)allUUIDsWithContextID:(id)a3 inZones:(id)a4 error:(id *)a5;
+ (id)allUUIDsWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5;
+ (id)allWhere:(id)a3 error:(id *)a4;
+ (id)allWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5;
+ (id)fetch:(unint64_t)a3 error:(id *)a4;
+ (id)fetch:(unint64_t)a3 where:(id)a4 error:(id *)a5;
+ (id)fetch:(unint64_t)a3 where:(id)a4 orderBy:(id)a5 error:(id *)a6;
+ (id)fromDatabaseRow:(id)a3;
+ (id)fromDatabaseWhere:(id)a3 error:(id *)a4;
+ (id)groupByClause:(id)a3;
+ (id)makeWhereClause:(id)a3;
+ (id)orderByClause:(id)a3;
+ (id)quotedString:(id)a3;
+ (id)sqlColumns;
+ (id)sqlTable;
+ (id)tryFromDatabaseWhere:(id)a3 error:(id *)a4;
+ (void)bindWhereClause:(sqlite3_stmt *)a3 whereDict:(id)a4 cferror:(__CFError *)a5;
- (BOOL)_deleteFromDatabase:(id *)a3;
- (BOOL)_saveToDatabaseWithConnection:(__OpaqueSecDbConnection *)a3 error:(id *)a4;
- (BOOL)deleteFromDatabase:(id *)a3;
- (BOOL)saveToDatabase:(id *)a3;
- (BOOL)saveToDatabaseWithConnection:(__OpaqueSecDbConnection *)a3 error:(id *)a4;
- (NSDictionary)originalSelfWhereClause;
- (id)copyWithZone:(_NSZone *)a3;
- (id)memoizeOriginalSelfWhereClause;
- (id)sqlValues;
- (id)whereClauseToFindSelf;
- (void)setOriginalSelfWhereClause:(id)a3;
@end

@implementation CKKSSQLDatabaseObject

- (void).cxx_destruct
{
}

- (void)setOriginalSelfWhereClause:(id)a3
{
}

- (NSDictionary)originalSelfWhereClause
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (id *)[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  objc_storeStrong(v4 + 1, self->_originalSelfWhereClause);
  return v4;
}

- (id)whereClauseToFindSelf
{
  v2 = NSStringFromSelector(a2);
  v3 = +[NSString stringWithFormat:@"A subclass must override %@", v2];
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (id)sqlValues
{
  v2 = NSStringFromSelector(a2);
  v3 = +[NSString stringWithFormat:@"A subclass must override %@", v2];
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (id)memoizeOriginalSelfWhereClause
{
  v3 = [(CKKSSQLDatabaseObject *)self whereClauseToFindSelf];
  originalSelfWhereClause = self->_originalSelfWhereClause;
  self->_originalSelfWhereClause = v3;

  return self;
}

- (BOOL)_deleteFromDatabase:(id *)a3
{
  v5 = [(id)objc_opt_class() sqlTable];
  v6 = [(CKKSSQLDatabaseObject *)self whereClauseToFindSelf];
  LOBYTE(a3) = +[CKKSSQLDatabaseObject deleteFromTable:v5 where:v6 connection:0 error:a3];

  return (char)a3;
}

- (BOOL)deleteFromDatabase:(id *)a3
{
  id v9 = 0;
  BOOL v6 = [(CKKSSQLDatabaseObject *)self _deleteFromDatabase:&v9];
  id v7 = v9;
  if (a3) {
    *a3 = v7;
  }

  return v6;
}

- (BOOL)_saveToDatabaseWithConnection:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  id v7 = [(CKKSSQLDatabaseObject *)self whereClauseToFindSelf];
  uint64_t v8 = [(CKKSSQLDatabaseObject *)self originalSelfWhereClause];
  if (!v8) {
    goto LABEL_4;
  }
  id v9 = (void *)v8;
  v10 = [(CKKSSQLDatabaseObject *)self originalSelfWhereClause];
  unsigned __int8 v11 = [v10 isEqualToDictionary:v7];

  if ((v11 & 1) != 0
    || ([(id)objc_opt_class() sqlTable],
        v12 = objc_claimAutoreleasedReturnValue(),
        [(CKKSSQLDatabaseObject *)self originalSelfWhereClause],
        v13 = objc_claimAutoreleasedReturnValue(),
        unsigned int v14 = +[CKKSSQLDatabaseObject deleteFromTable:v12 where:v13 connection:a3 error:a4], v13, v12, v14))
  {
LABEL_4:
    v15 = [(id)objc_opt_class() sqlTable];
    v16 = [(CKKSSQLDatabaseObject *)self sqlValues];
    BOOL v17 = +[CKKSSQLDatabaseObject saveToDatabaseTable:v15 row:v16 connection:a3 error:a4];
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)saveToDatabaseWithConnection:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  id v11 = 0;
  BOOL v8 = [(CKKSSQLDatabaseObject *)self _saveToDatabaseWithConnection:a3 error:&v11];
  id v9 = v11;
  if (a4) {
    *a4 = v9;
  }

  return v8;
}

- (BOOL)saveToDatabase:(id *)a3
{
  return [(CKKSSQLDatabaseObject *)self saveToDatabaseWithConnection:0 error:a3];
}

+ (id)sqlColumns
{
  v2 = NSStringFromSelector(a2);
  v3 = +[NSString stringWithFormat:@"A subclass must override %@", v2];
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

+ (id)sqlTable
{
  v2 = NSStringFromSelector(a2);
  v3 = +[NSString stringWithFormat:@"A subclass must override %@", v2];
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

+ (id)fromDatabaseRow:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(a2);
  BOOL v6 = +[NSString stringWithFormat:@"A subclass must override %@", v5];
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)fetch:(unint64_t)a3 where:(id)a4 orderBy:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_100042A3C;
  v21 = sub_100042A4C;
  id v22 = (id)0xAAAAAAAAAAAAAAAALL;
  id v22 = objc_alloc_init((Class)NSMutableArray);
  v12 = [a1 sqlTable];
  v13 = [a1 sqlColumns];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100042A54;
  v16[3] = &unk_1002F8160;
  v16[4] = &v17;
  v16[5] = a1;
  +[CKKSSQLDatabaseObject queryDatabaseTable:v12 where:v10 columns:v13 groupBy:0 orderBy:v11 limit:a3 processRow:v16 error:a6];

  id v14 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v14;
}

+ (id)fetch:(unint64_t)a3 where:(id)a4 error:(id *)a5
{
  return [a1 fetch:a3 where:a4 orderBy:0 error:a5];
}

+ (id)fetch:(unint64_t)a3 error:(id *)a4
{
  return [a1 fetch:a3 where:0 orderBy:0 error:a4];
}

+ (id)allWhere:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_100042A3C;
  v16 = sub_100042A4C;
  id v17 = (id)0xAAAAAAAAAAAAAAAALL;
  id v17 = objc_alloc_init((Class)NSMutableArray);
  id v7 = [a1 sqlTable];
  BOOL v8 = [a1 sqlColumns];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100042C68;
  v11[3] = &unk_1002F8160;
  v11[4] = &v12;
  v11[5] = a1;
  +[CKKSSQLDatabaseObject queryDatabaseTable:v7 where:v6 columns:v8 groupBy:0 orderBy:0 limit:-1 processRow:v11 error:a4];

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

+ (id)all:(id *)a3
{
  return [a1 allWhere:0 error:a3];
}

+ (id)tryFromDatabaseWhere:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_100042A3C;
  v16 = sub_100042A4C;
  id v17 = 0;
  id v7 = [a1 sqlTable];
  BOOL v8 = [a1 sqlColumns];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100042E58;
  v11[3] = &unk_1002F8160;
  v11[4] = &v12;
  v11[5] = a1;
  +[CKKSSQLDatabaseObject queryDatabaseTable:v7 where:v6 columns:v8 groupBy:0 orderBy:0 limit:-1 processRow:v11 error:a4];

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

+ (id)fromDatabaseWhere:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [a1 tryFromDatabaseWhere:v6 error:a4];
  BOOL v8 = (void *)v7;
  if (a4 && !v7)
  {
    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    id v9 = +[NSString stringWithFormat:@"%@ does not exist in database where %@", objc_opt_class(), v6];
    v13 = v9;
    id v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    *a4 = +[NSError errorWithDomain:@"securityd" code:-25300 userInfo:v10];
  }

  return v8;
}

+ (BOOL)_deleteAll:(id *)a3
{
  id v4 = [a1 sqlTable];
  LOBYTE(a3) = +[CKKSSQLDatabaseObject deleteFromTable:v4 where:0 connection:0 error:a3];

  return (char)a3;
}

+ (BOOL)deleteAll:(id *)a3
{
  id v9 = 0;
  unsigned __int8 v6 = [a1 _deleteAll:&v9];
  id v7 = v9;
  if (a3) {
    *a3 = v7;
  }

  return v6;
}

+ (BOOL)performCKKSTransaction:(id)a3
{
  CFTypeRef cf = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100043230;
  v8[3] = &unk_1002F8138;
  id v3 = a3;
  id v9 = v3;
  char v4 = sub_10000CBA4(1, 1, 0, (uint64_t)&cf, (uint64_t)v8);
  if (cf)
  {
    v5 = sub_1000CD884(@"ckkssql", 0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFTypeRef v12 = cf;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "error performing database operation, major problems ahead: %@", buf, 0xCu);
    }

    CFTypeRef v6 = cf;
    if (cf)
    {
      CFTypeRef cf = 0;
      CFRelease(v6);
    }
  }

  return v4;
}

+ (BOOL)queryMaxValueForField:(id)a3 inTable:(id)a4 where:(id)a5 columns:(id)a6 processRow:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000435A8;
  v24[3] = &unk_1002F80E8;
  id v31 = a1;
  id v17 = v12;
  id v25 = v17;
  id v18 = v13;
  id v26 = v18;
  id v19 = v15;
  id v27 = v19;
  id v20 = v14;
  id v28 = v20;
  v30 = &v32;
  id v21 = v16;
  id v29 = v21;
  sub_10000CBA4(0, 1, 0, (uint64_t)&v35, (uint64_t)v24);
  id v22 = (const void *)v33[3];
  if (v22)
  {
    v33[3] = 0;
    CFRelease(v22);
  }

  _Block_object_dispose(&v32, 8);
  return v22 == 0;
}

+ (id)quotedString:(id)a3
{
  id v3 = a3;
  char v4 = sqlite3_mprintf("%q", [v3 UTF8String]);
  if (!v4) {
    abort();
  }
  v5 = v4;
  CFTypeRef v6 = +[NSString stringWithUTF8String:v4];
  sqlite3_free(v5);

  return v6;
}

+ (BOOL)queryDatabaseTable:(id)a3 where:(id)a4 columns:(id)a5 groupBy:(id)a6 orderBy:(id)a7 limit:(int64_t)a8 processRow:(id)a9 error:(id *)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100043DA4;
  v31[3] = &unk_1002F80C0;
  id v21 = v17;
  id v32 = v21;
  id v22 = v16;
  id v33 = v22;
  id v23 = v18;
  id v34 = v23;
  id v24 = v19;
  id v35 = v24;
  int64_t v39 = a8;
  id v25 = v15;
  id v36 = v25;
  v38 = &v41;
  id v40 = a1;
  id v26 = v20;
  id v37 = v26;
  sub_10000CBA4(1, 1, 0, (uint64_t)&v44, (uint64_t)v31);
  id v27 = (void *)v42[3];

  _Block_object_dispose(&v41, 8);
  if (a10) {
    *a10 = v27;
  }

  return v27 == 0;
}

+ (BOOL)deleteFromTable:(id)a3 where:(id)a4 connection:(__OpaqueSecDbConnection *)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000443DC;
  v17[3] = &unk_1002F8020;
  id v11 = a4;
  id v18 = v11;
  id v12 = v10;
  id v19 = v12;
  id v20 = &v22;
  id v21 = a1;
  id v13 = objc_retainBlock(v17);
  id v14 = v13;
  if (a5) {
    ((void (*)(void *, __OpaqueSecDbConnection *))v13[2])(v13, a5);
  }
  else {
    sub_10000CBA4(1, 1, 0, (uint64_t)(v23 + 3), (uint64_t)v13);
  }
  id v15 = (void *)v23[3];
  if (a6)
  {
    *a6 = v15;
  }
  else if (v15)
  {
    v23[3] = 0;
    CFRelease(v15);
  }

  _Block_object_dispose(&v22, 8);
  return v15 == 0;
}

+ (void)bindWhereClause:(sqlite3_stmt *)a3 whereDict:(id)a4 cferror:(__CFError *)a5
{
  id v7 = a4;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  int v16 = 1;
  BOOL v8 = [v7 allKeys];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100044654;
  v10[3] = &unk_1002F7FB0;
  id v9 = v7;
  id v11 = v9;
  id v12 = v15;
  id v13 = a3;
  id v14 = a5;
  [v8 enumerateObjectsUsingBlock:v10];

  _Block_object_dispose(v15, 8);
}

+ (id)orderByClause:(id)a3
{
  id v3 = a3;
  char v4 = v3;
  if (v3 && [v3 count])
  {
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    char v11 = 0;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100044A68;
    v7[3] = &unk_1002F7F88;
    id v9 = v10;
    v5 = (__CFString *)objc_alloc_init((Class)NSMutableString);
    BOOL v8 = v5;
    [v4 enumerateObjectsUsingBlock:v7];

    _Block_object_dispose(v10, 8);
  }
  else
  {
    v5 = &stru_10030AA90;
  }

  return v5;
}

+ (id)groupByClause:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    char v10 = 0;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100044BF8;
    v6[3] = &unk_1002F7F88;
    BOOL v8 = v9;
    char v4 = (__CFString *)objc_alloc_init((Class)NSMutableString);
    id v7 = v4;
    [v3 enumerateObjectsUsingBlock:v6];

    _Block_object_dispose(v9, 8);
  }
  else
  {
    char v4 = &stru_10030AA90;
  }

  return v4;
}

+ (id)makeWhereClause:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    char v10 = 0;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100044D88;
    v6[3] = &unk_1002F7F60;
    BOOL v8 = v9;
    char v4 = (__CFString *)objc_alloc_init((Class)NSMutableString);
    id v7 = v4;
    [v3 enumerateKeysAndObjectsUsingBlock:v6];

    _Block_object_dispose(v9, 8);
  }
  else
  {
    char v4 = &stru_10030AA90;
  }

  return v4;
}

+ (BOOL)saveToDatabaseTable:(id)a3 row:(id)a4 connection:(__OpaqueSecDbConnection *)a5 error:(id *)a6
{
  id v9 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10004528C;
  v16[3] = &unk_1002F7F38;
  id v10 = a4;
  id v17 = v10;
  id v11 = v9;
  id v18 = v11;
  id v19 = &v20;
  id v12 = objc_retainBlock(v16);
  id v13 = v12;
  if (a5) {
    ((void (*)(void *, __OpaqueSecDbConnection *))v12[2])(v12, a5);
  }
  else {
    sub_10000CBA4(1, 1, 0, (uint64_t)(v21 + 3), (uint64_t)v12);
  }
  id v14 = (void *)v21[3];
  if (a6)
  {
    *a6 = v14;
  }
  else if (v14)
  {
    v21[3] = 0;
    CFRelease(v14);
  }

  _Block_object_dispose(&v20, 8);
  return v14 == 0;
}

+ (BOOL)deleteAllWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [a1 sqlTable];
  v21[0] = @"contextID";
  id v11 = v8;
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

  v21[1] = @"ckzone";
  v22[0] = v14;
  id v15 = [v9 zoneName];

  if (v15)
  {
    id v16 = v15;
  }
  else
  {
    id v16 = +[NSNull null];
  }
  id v17 = v16;

  v22[1] = v17;
  id v18 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
  BOOL v19 = +[CKKSSQLDatabaseObject deleteFromTable:v10 where:v18 connection:0 error:a5];

  return v19;
}

+ (id)allWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v21[0] = @"contextID";
  id v10 = v8;
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = +[NSNull null];
  }
  id v13 = v12;

  v21[1] = @"ckzone";
  v22[0] = v13;
  id v14 = [v9 zoneName];
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

  v22[1] = v17;
  id v18 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
  BOOL v19 = [a1 allWhere:v18 error:a5];

  return v19;
}

+ (id)allParentKeyUUIDsInContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = sub_10006AFA4;
  id v27 = sub_10006AFB4;
  id v28 = (id)0xAAAAAAAAAAAAAAAALL;
  id v28 = +[NSMutableSet set];
  id v10 = [a1 sqlTable];
  v29[0] = @"contextID";
  id v11 = v8;
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

  v30[0] = v14;
  v29[1] = @"ckzone";
  id v15 = [v9 zoneName];
  id v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    id v17 = +[NSNull null];
  }
  id v18 = v17;

  v30[1] = v18;
  BOOL v19 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  void v22[2] = sub_10006AFBC;
  v22[3] = &unk_100306000;
  v22[4] = &v23;
  +[CKKSSQLDatabaseObject queryDatabaseTable:v10 where:v19 columns:&off_100326D10 groupBy:0 orderBy:0 limit:-1 processRow:v22 error:a5];

  id v20 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v20;
}

+ (id)allUUIDsWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = sub_10006AFA4;
  id v27 = sub_10006AFB4;
  id v28 = (id)0xAAAAAAAAAAAAAAAALL;
  id v28 = objc_alloc_init((Class)NSMutableArray);
  id v10 = [a1 sqlTable];
  v29[0] = @"contextID";
  id v11 = v8;
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

  v30[0] = v14;
  v29[1] = @"ckzone";
  id v15 = [v9 zoneName];
  id v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    id v17 = +[NSNull null];
  }
  id v18 = v17;

  v30[1] = v18;
  BOOL v19 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  void v22[2] = sub_10006B2B0;
  v22[3] = &unk_100306000;
  v22[4] = &v23;
  +[CKKSSQLDatabaseObject queryDatabaseTable:v10 where:v19 columns:&off_100326CF8 groupBy:0 orderBy:0 limit:-1 processRow:v22 error:a5];

  id v20 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v20;
}

+ (id)allUUIDsWithContextID:(id)a3 inZones:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = sub_10006AFA4;
  id v34 = sub_10006AFB4;
  id v35 = (id)0xAAAAAAAAAAAAAAAALL;
  id v35 = +[NSMutableSet set];
  id v10 = +[NSMutableArray array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v27;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = [*(id *)(*((void *)&v26 + 1) + 8 * i) zoneName];
        [v10 addObject:v15];
      }
      id v12 = [v11 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v12);
  }

  id v16 = [a1 sqlTable];
  v36[0] = @"contextID";
  id v17 = v8;
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

  v36[1] = @"ckzone";
  v37[0] = v20;
  id v21 = [[CKKSSQLWhereIn alloc] initWithValues:v10];
  v37[1] = v21;
  uint64_t v22 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10006B650;
  v25[3] = &unk_100306000;
  v25[4] = &v30;
  +[CKKSSQLDatabaseObject queryDatabaseTable:v16 where:v22 columns:&off_100326CE0 groupBy:0 orderBy:0 limit:-1 processRow:v25 error:a5];

  id v23 = (id)v31[5];
  _Block_object_dispose(&v30, 8);

  return v23;
}

@end