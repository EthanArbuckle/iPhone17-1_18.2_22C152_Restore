@interface IMDatabaseHandle
+ (id)questionMarkListForCollection:(id)a3;
- (BOOL)_aq_bindArguments:(id)a3 inStatement:(sqlite3_stmt *)a4;
- (BOOL)passesIntegrityCheck;
- (BOOL)runStatement:(id)a3 arguments:(id)a4;
- (IMDatabaseHandle)initWithPath:(id)a3;
- (id)_aq_cursorForQuery:(id)a3 withArguments:(id)a4;
- (id)_aq_errorInFunction:(const char *)a3 result:(int64_t)a4;
- (id)_stringRowsForQuery:(id)a3;
- (id)arrayForQuery:(id)a3 arguments:(id)a4;
- (id)arrayForQuery:(id)a3 arguments:(id)a4 rawRows:(BOOL)a5;
- (id)columnInfoForTable:(id)a3;
- (id)stringColumnDataForQuery:(id)a3 withArguments:(id)a4;
- (id)tableNames;
- (id)version;
- (sqlite3)_databaseHandle;
- (void)dealloc;
@end

@implementation IMDatabaseHandle

- (IMDatabaseHandle)initWithPath:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IMDatabaseHandle;
  v5 = [(IMDatabaseHandle *)&v12 init];
  if (v5)
  {
    v6 = 0;
    if (!sqlite3_open_v2((const char *)[v4 fileSystemRepresentation], &v5->_databaseHandle, 6, 0))
    {
      dispatch_queue_t v7 = dispatch_queue_create("com.apple.itunesmobile.imdatabasehandle", 0);
      accessQueue = v5->_accessQueue;
      v5->_accessQueue = (OS_dispatch_queue *)v7;

      uint64_t v9 = objc_opt_new();
      statementCache = v5->_statementCache;
      v5->_statementCache = (NSMutableDictionary *)v9;

      v6 = v5;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(NSMutableDictionary *)self->_statementCache allValues];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      dispatch_queue_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) close];
        dispatch_queue_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  sqlite3_close(self->_databaseHandle);
  v8.receiver = self;
  v8.super_class = (Class)IMDatabaseHandle;
  [(IMDatabaseHandle *)&v8 dealloc];
}

- (id)tableNames
{
  return [(IMDatabaseHandle *)self _stringRowsForQuery:@"SELECT name FROM sqlite_master where type = 'table'"];
}

- (id)columnInfoForTable:(id)a3
{
  id v4 = +[NSString stringWithFormat:@"pragma table_info(%@)", a3];
  id v5 = [(IMDatabaseHandle *)self _stringRowsForQuery:v4];

  return v5;
}

- (id)version
{
  v2 = +[NSString stringWithCString:sqlite3_libversion() encoding:4];
  v3 = [@"sqlite3 library version: " stringByAppendingString:v2];

  return v3;
}

- (BOOL)runStatement:(id)a3 arguments:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_11F34C;
  v24 = sub_11F35C;
  id v25 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_11F364;
  block[3] = &unk_2C9578;
  id v9 = v6;
  id v15 = v9;
  v16 = self;
  id v10 = v7;
  id v17 = v10;
  v18 = &v26;
  v19 = &v20;
  dispatch_sync(accessQueue, block);
  long long v11 = (void *)v21[5];
  if (v11) {
    objc_exception_throw(v11);
  }
  char v12 = *((unsigned char *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v12;
}

- (id)arrayForQuery:(id)a3 arguments:(id)a4
{
  return [(IMDatabaseHandle *)self arrayForQuery:a3 arguments:a4 rawRows:0];
}

- (id)arrayForQuery:(id)a3 arguments:(id)a4 rawRows:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_opt_new();
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  char v33 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  char v29 = sub_11F34C;
  v30 = sub_11F35C;
  id v31 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_11F784;
  block[3] = &unk_2C95A0;
  void block[4] = self;
  id v12 = v8;
  id v20 = v12;
  id v13 = v9;
  id v21 = v13;
  BOOL v25 = a5;
  id v14 = v10;
  id v22 = v14;
  v23 = v32;
  v24 = &v26;
  dispatch_sync(accessQueue, block);
  id v15 = (void *)v27[5];
  if (v15) {
    objc_exception_throw(v15);
  }
  v16 = v22;
  id v17 = v14;

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(v32, 8);

  return v17;
}

- (id)stringColumnDataForQuery:(id)a3 withArguments:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  uint64_t v47 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 1;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = sub_11F34C;
  v38 = sub_11F35C;
  id v39 = 0;
  uint64_t v28 = 0;
  char v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = sub_11F34C;
  v32 = sub_11F35C;
  id v33 = (id)objc_opt_new();
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = self->_databaseHandle;
  accessQueue = self->_accessQueue;
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = sub_11FC58;
  v18 = &unk_2C95C8;
  id v9 = v6;
  id v19 = v9;
  id v22 = &v44;
  v23 = v27;
  id v10 = v7;
  id v20 = v10;
  id v21 = self;
  v24 = &v40;
  BOOL v25 = &v28;
  uint64_t v26 = &v34;
  dispatch_sync(accessQueue, &v15);
  long long v11 = (void *)v35[5];
  if (v11) {
    objc_exception_throw(v11);
  }
  if (!v45[3] && *((unsigned char *)v41 + 24) && objc_msgSend((id)v29[5], "count", v15, v16, v17, v18, v19)) {
    id v12 = (void *)v29[5];
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

  return v13;
}

+ (id)questionMarkListForCollection:(id)a3
{
  v3 = (char *)[a3 count];
  if (v3)
  {
    id v4 = v3;
    if (v3 == (unsigned char *)&def_7D91C + 1)
    {
      id v5 = [objc_alloc((Class)NSMutableString) initWithString:@"(?)"];
    }
    else
    {
      id v5 = [objc_alloc((Class)NSMutableString) initWithString:@"(?,"];
      id v6 = v4 - 2;
      if (v4 != (unsigned char *)&def_7D91C + 2)
      {
        do
        {
          [v5 appendString:@"?,"];
          --v6;
        }
        while (v6);
      }
      [v5 appendString:@"?"]);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)passesIntegrityCheck
{
  v2 = [(IMDatabaseHandle *)self arrayForQuery:@"pragma quick_check(1)" arguments:0 rawRows:1];
  v3 = [v2 firstObject];
  id v4 = [v3 firstObject];
  unsigned __int8 v5 = [v4 isEqualToString:@"ok"];

  return v5;
}

- (id)_aq_cursorForQuery:(id)a3 withArguments:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  id v8 = [(NSMutableDictionary *)self->_statementCache objectForKey:v6];
  if (v8)
  {
    id v9 = v8;
    [(IMDatabaseCursor *)v8 reset];
    [(IMDatabaseHandle *)self _aq_bindArguments:v7 inStatement:[(IMDatabaseCursor *)v9 statement]];
  }
  else
  {
    id v10 = v6;
    id v15 = 0;
    pzTail = (char *)[v10 UTF8String];
    int v11 = sqlite3_prepare_v2([(IMDatabaseHandle *)self _databaseHandle], pzTail, -1, &v15, (const char **)&pzTail);
    if (v11)
    {
      -[IMDatabaseHandle _aq_errorInFunction:result:](self, "_aq_errorInFunction:result:", "-[IMDatabaseHandle _aq_cursorForQuery:withArguments:]", v11);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v14);
    }
    [(IMDatabaseHandle *)self _aq_bindArguments:v7 inStatement:v15];
    id v12 = [IMDatabaseCursor alloc];
    id v9 = [(IMDatabaseCursor *)v12 initWithStatement:v15];
    [(NSMutableDictionary *)self->_statementCache setObject:v9 forKey:v10];
  }

  return v9;
}

- (sqlite3)_databaseHandle
{
  return self->_databaseHandle;
}

- (id)_aq_errorInFunction:(const char *)a3 result:(int64_t)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  id v7 = +[NSString stringWithFormat:@"%s: Could not run statement %s\n", a3, sqlite3_errmsg(self->_databaseHandle)];
  id v8 = __stdoutp;
  id v9 = v7;
  fputs((const char *)[v9 cStringUsingEncoding:1], v8);
  id v10 = (objc_class *)objc_opt_class();
  int v11 = NSStringFromClass(v10);
  id v12 = +[NSString stringWithFormat:@"%@StatementException", v11];
  id v13 = +[NSString stringWithFormat:@"%s result:%ld", sqlite3_errmsg(self->_databaseHandle), a4];
  id v14 = +[NSException exceptionWithName:v12 reason:v13 userInfo:0];

  return v14;
}

- (id)_stringRowsForQuery:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[NSMutableArray array];
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_11F34C;
  id v22 = sub_11F35C;
  id v23 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_120504;
  block[3] = &unk_2C95F0;
  uint64_t v16 = v24;
  void block[4] = self;
  id v7 = v4;
  id v14 = v7;
  id v8 = v5;
  id v15 = v8;
  id v17 = &v18;
  dispatch_sync(accessQueue, block);
  id v9 = (void *)v19[5];
  if (v9) {
    objc_exception_throw(v9);
  }
  id v10 = v15;
  id v11 = v8;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(v24, 8);

  return v11;
}

- (BOOL)_aq_bindArguments:(id)a3 inStatement:(sqlite3_stmt *)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  id v7 = [v6 objectEnumerator];
  id v8 = 0;
  int v9 = 1;
  do
  {
    id v10 = v8;
    id v8 = [v7 nextObject];

    if (!v8) {
      break;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = sqlite3_bind_text(a4, v9, (const char *)[v8 cStringUsingEncoding:4], -1, 0);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v8 timeIntervalSinceReferenceDate];
        int v11 = sqlite3_bind_double(a4, v9, v12);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v8;
          if (!strcmp((const char *)[v13 objCType], "B"))
          {
            int v22 = sqlite3_bind_int(a4, v9, (int)[v13 BOOLValue]);
          }
          else
          {
            id v14 = v13;
            if (!strcmp((const char *)[v14 objCType], "i")
              || (id v15 = v14, !strcmp((const char *)[v15 objCType], "q")))
            {
              int v22 = sqlite3_bind_int64(a4, v9, (sqlite3_int64)[v14 longLongValue]);
            }
            else
            {
              id v16 = v15;
              if (!strcmp((const char *)[v16 objCType], "f"))
              {
                [v16 floatValue];
                double v24 = v23;
              }
              else
              {
                id v17 = v16;
                if (strcmp((const char *)[v17 objCType], "d"))
                {
                  uint64_t v18 = 0;
LABEL_28:

                  goto LABEL_19;
                }
                [v17 doubleValue];
              }
              int v22 = sqlite3_bind_double(a4, v9, v24);
            }
          }
          uint64_t v18 = v22;
          goto LABEL_28;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v19 = v8;
          int v11 = sqlite3_bind_blob(a4, v9, [v19 bytes], (int)[v19 length], 0);
        }
        else
        {
          uint64_t v20 = +[NSNull null];
          unsigned int v21 = [v8 isEqual:v20];

          if (!v21)
          {
            uint64_t v18 = 0;
            goto LABEL_19;
          }
          int v11 = sqlite3_bind_null(a4, v9);
        }
      }
    }
    uint64_t v18 = v11;
LABEL_19:
    ++v9;
  }
  while (!v18);

  return v8 == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);

  objc_storeStrong((id *)&self->_statementCache, 0);
}

@end