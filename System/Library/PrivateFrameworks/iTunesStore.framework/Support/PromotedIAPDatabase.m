@interface PromotedIAPDatabase
+ (BOOL)_setupDatabase:(id)a3;
+ (void)_createDatabaseDirectory;
- (PromotedIAPDatabase)init;
- (PromotedIAPDatabase)initWithDatabaseURL:(id)a3 readOnly:(BOOL)a4;
- (void)getOrderForIAPsInApp:(id)a3 completionHandler:(id)a4;
- (void)getVisibilityForAllIAPsInApp:(id)a3 completionHandler:(id)a4;
- (void)getVisibilityForIAPs:(id)a3 app:(id)a4 completionHandler:(id)a5;
- (void)modifyUsingTransactionBlock:(id)a3;
- (void)readAsyncUsingTransactionBlock:(id)a3;
- (void)readUsingTransactionBlock:(id)a3;
- (void)removeOverridesForApp:(id)a3 completionHandler:(id)a4;
- (void)setOrderForIAPs:(id)a3 app:(id)a4 completionHandler:(id)a5;
- (void)setVisibility:(int64_t)a3 forIAP:(id)a4 app:(id)a5 completionHandler:(id)a6;
@end

@implementation PromotedIAPDatabase

- (PromotedIAPDatabase)init
{
  v3 = +[PromotedIAPDatabaseSchema databasePath];
  v4 = +[NSURL fileURLWithPath:v3 isDirectory:0];

  v5 = [(PromotedIAPDatabase *)self initWithDatabaseURL:v4 readOnly:0];
  return v5;
}

- (PromotedIAPDatabase)initWithDatabaseURL:(id)a3 readOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PromotedIAPDatabase;
  v7 = [(PromotedIAPDatabase *)&v11 init];
  if (v7)
  {
    +[PromotedIAPDatabase _createDatabaseDirectory];
    v8 = (SSSQLiteDatabase *)[objc_alloc((Class)SSSQLiteDatabase) initWithDatabaseURL:v6 readOnly:v4 protectionType:NSFileProtectionCompleteUntilFirstUserAuthentication];
    database = v7->_database;
    v7->_database = v8;

    if (!v4) {
      [(SSSQLiteDatabase *)v7->_database setSetupBlock:&stru_1003A8770];
    }
  }

  return v7;
}

- (void)modifyUsingTransactionBlock:(id)a3
{
  id v4 = a3;
  database = self->_database;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100190250;
  v7[3] = &unk_1003A3240;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(SSSQLiteDatabase *)database performTransactionWithBlock:v7];
}

- (void)readAsyncUsingTransactionBlock:(id)a3
{
  id v4 = a3;
  database = self->_database;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10019035C;
  v7[3] = &unk_1003A31F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(SSSQLiteDatabase *)database dispatchBlockAsync:v7];
}

- (void)readUsingTransactionBlock:(id)a3
{
  id v4 = a3;
  database = self->_database;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100190400;
  v7[3] = &unk_1003A3240;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(SSSQLiteDatabase *)database performTransactionWithBlock:v7];
}

- (void)getVisibilityForIAPs:(id)a3 app:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 count];
  if (v9 && v11)
  {
    v12 = objc_opt_new();
    if ([v8 count])
    {
      unint64_t v13 = 0;
      do
      {
        [v12 appendFormat:@"?, "];
        ++v13;
      }
      while (v13 < (unint64_t)[v8 count]);
    }
    objc_msgSend(v12, "deleteCharactersInRange:", (char *)objc_msgSend(v12, "length") - 2, 2);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100190678;
    v16[3] = &unk_1003A8798;
    id v17 = v12;
    id v18 = v8;
    id v19 = v9;
    id v20 = v10;
    id v14 = v12;
    [(PromotedIAPDatabase *)self readAsyncUsingTransactionBlock:v16];

    goto LABEL_9;
  }
  if (v10)
  {
    v15 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100190660;
    block[3] = &unk_1003A31C8;
    id v22 = v10;
    dispatch_async(v15, block);

    id v14 = v22;
LABEL_9:
  }
}

- (void)getVisibilityForAllIAPsInApp:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100190BF8;
    v11[3] = &unk_1003A87C0;
    id v9 = &v12;
    id v12 = v6;
    unint64_t v13 = v8;
    [(PromotedIAPDatabase *)self readAsyncUsingTransactionBlock:v11];
    id v10 = v13;
LABEL_5:

    goto LABEL_6;
  }
  if (v7)
  {
    id v10 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100190BE0;
    block[3] = &unk_1003A31C8;
    id v9 = &v15;
    id v15 = v8;
    dispatch_async(v10, block);
    goto LABEL_5;
  }
LABEL_6:
}

- (void)setVisibility:(int64_t)a3 forIAP:(id)a4 app:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  unint64_t v13 = v12;
  if (v11)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100191068;
    v16[3] = &unk_1003A8810;
    id v14 = &v17;
    id v17 = v10;
    id v18 = v11;
    int64_t v20 = a3;
    id v19 = v13;
    [(PromotedIAPDatabase *)self modifyUsingTransactionBlock:v16];

    id v15 = v18;
LABEL_5:

    goto LABEL_6;
  }
  if (v12)
  {
    id v15 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100191054;
    block[3] = &unk_1003A31C8;
    id v14 = &v22;
    id v22 = v13;
    dispatch_async(v15, block);
    goto LABEL_5;
  }
LABEL_6:
}

- (void)getOrderForIAPsInApp:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100191810;
    v11[3] = &unk_1003A87C0;
    id v9 = &v12;
    id v12 = v6;
    unint64_t v13 = v8;
    [(PromotedIAPDatabase *)self readAsyncUsingTransactionBlock:v11];
    id v10 = v13;
LABEL_5:

    goto LABEL_6;
  }
  if (v7)
  {
    id v10 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001917F8;
    block[3] = &unk_1003A31C8;
    id v9 = &v15;
    id v15 = v8;
    dispatch_async(v10, block);
    goto LABEL_5;
  }
LABEL_6:
}

- (void)setOrderForIAPs:(id)a3 app:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v9)
  {
    id v12 = +[NSOrderedSet orderedSetWithArray:v8];
    unint64_t v13 = [v12 array];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100191C6C;
    v16[3] = &unk_1003A8838;
    id v17 = v9;
    id v18 = v13;
    id v19 = v11;
    id v14 = v13;
    [(PromotedIAPDatabase *)self modifyUsingTransactionBlock:v16];

LABEL_5:
    goto LABEL_6;
  }
  if (v10)
  {
    id v15 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100191C58;
    block[3] = &unk_1003A31C8;
    id v21 = v11;
    dispatch_async(v15, block);

    id v14 = v21;
    goto LABEL_5;
  }
LABEL_6:
}

- (void)removeOverridesForApp:(id)a3 completionHandler:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10019236C;
  v8[3] = &unk_1003A87C0;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(PromotedIAPDatabase *)self modifyUsingTransactionBlock:v8];
}

+ (void)_createDatabaseDirectory
{
  v2 = +[PromotedIAPDatabaseSchema databasePath];
  v3 = v2;
  if (v2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10019283C;
    block[3] = &unk_1003A3140;
    id v5 = v2;
    if (qword_100401FD0 != -1) {
      dispatch_once(&qword_100401FD0, block);
    }
  }
}

+ (BOOL)_setupDatabase:(id)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100192998;
  v6[3] = &unk_1003A5B28;
  id v8 = &v9;
  id v3 = a3;
  id v7 = v3;
  [v3 performTransactionWithBlock:v6];
  char v4 = *((unsigned char *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (void).cxx_destruct
{
}

@end