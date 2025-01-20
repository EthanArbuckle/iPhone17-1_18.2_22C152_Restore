@interface KTSDBStmt
- (BOOL)needReset;
- (BOOL)steps:(id)a3 error:(id *)a4;
- (KTSDBObjc)db;
- (KTSDBStmt)initWithStatement:(id)a3 db:(id)a4 error:(id *)a5;
- (NSDictionary)indexesByColumnName;
- (double)doubleAtColumn:(unint64_t)a3;
- (id)allObjects;
- (id)allObjectsByColumnName;
- (id)blobAtColumn:(unint64_t)a3;
- (id)columnNameAtColumn:(unint64_t)a3;
- (id)dateAtColumn:(unint64_t)a3;
- (id)generateDone;
- (id)generateError:(int)a3 method:(id)a4;
- (id)objectAtColumn:(unint64_t)a3;
- (id)stepWithError:(id *)a3;
- (id)textAtColumn:(unint64_t)a3;
- (int)columnTypeAtColumn:(unint64_t)a3;
- (int)intAtColumn:(unint64_t)a3;
- (int64_t)int64AtColumn:(unint64_t)a3;
- (sqlite3_stmt)stmt;
- (unint64_t)columnCount;
- (unint64_t)indexForColumnName:(id)a3;
- (void)bindData:(id)a3 column:(unint64_t)a4;
- (void)bindDate:(id)a3 column:(unint64_t)a4;
- (void)bindDouble:(double)a3 column:(unint64_t)a4;
- (void)bindInt64:(int64_t)a3 column:(unint64_t)a4;
- (void)bindInt:(int)a3 column:(unint64_t)a4;
- (void)bindNullAtColumn:(unint64_t)a3;
- (void)bindString:(id)a3 column:(unint64_t)a4;
- (void)clearBindings;
- (void)dealloc;
- (void)enumerateColumnsUsingBlock:(id)a3;
- (void)reset;
- (void)setDb:(id)a3;
- (void)setIndexesByColumnName:(id)a3;
- (void)setNeedReset:(BOOL)a3;
- (void)setStmt:(sqlite3_stmt *)a3;
@end

@implementation KTSDBStmt

- (KTSDBStmt)initWithStatement:(id)a3 db:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)KTSDBStmt;
  v10 = [(KTSDBStmt *)&v17 init];
  p_isa = &v10->super.isa;
  if (v10)
  {
    [(KTSDBStmt *)v10 setDb:v9];
    uint64_t v12 = sqlite3_prepare_v3((sqlite3 *)[v9 db], (const char *)[v8 UTF8String], -1, 0, p_isa + 3, 0);
    if (!v12)
    {
      v15 = p_isa;
      goto LABEL_10;
    }
    v13 = [p_isa generateError:v12 method:@"init"];
    v14 = [v9 log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "KTSDBStmt prepare: %@", buf, 0xCu);
    }

    if (a5) {
      *a5 = v13;
    }
  }
  v15 = 0;
LABEL_10:

  return v15;
}

- (void)dealloc
{
  if ([(KTSDBStmt *)self needReset]) {
    sqlite3_reset([(KTSDBStmt *)self stmt]);
  }
  sqlite3_finalize([(KTSDBStmt *)self stmt]);
  v3.receiver = self;
  v3.super_class = (Class)KTSDBStmt;
  [(KTSDBStmt *)&v3 dealloc];
}

- (void)bindString:(id)a3 column:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    int v7 = sqlite3_bind_text(-[KTSDBStmt stmt](self, "stmt"), a4 + 1, (const char *)[v6 UTF8String], -1, 0);
    if (v7)
    {
      int v8 = v7;
      id v9 = [(KTSDBStmt *)self db];
      v10 = [v9 log];

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11[0] = 67109120;
        v11[1] = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "sqlite3_bind_text: %d", (uint8_t *)v11, 8u);
      }
    }
  }
  else
  {
    [(KTSDBStmt *)self bindNullAtColumn:a4];
  }
}

- (void)bindInt:(int)a3 column:(unint64_t)a4
{
  int v5 = sqlite3_bind_int([(KTSDBStmt *)self stmt], a4 + 1, a3);
  if (v5)
  {
    int v6 = v5;
    int v7 = [(KTSDBStmt *)self db];
    int v8 = [v7 log];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "sqlite3_bind_int: %d", (uint8_t *)v9, 8u);
    }
  }
}

- (void)bindInt64:(int64_t)a3 column:(unint64_t)a4
{
  int v5 = sqlite3_bind_int64([(KTSDBStmt *)self stmt], a4 + 1, a3);
  if (v5)
  {
    int v6 = v5;
    int v7 = [(KTSDBStmt *)self db];
    int v8 = [v7 log];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "sqlite3_bind_int64: %d", (uint8_t *)v9, 8u);
    }
  }
}

- (void)bindDouble:(double)a3 column:(unint64_t)a4
{
  int v5 = sqlite3_bind_double([(KTSDBStmt *)self stmt], a4 + 1, a3);
  if (v5)
  {
    int v6 = v5;
    int v7 = [(KTSDBStmt *)self db];
    int v8 = [v7 log];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "sqlite3_bind_double: %d", (uint8_t *)v9, 8u);
    }
  }
}

- (void)bindDate:(id)a3 column:(unint64_t)a4
{
  [a3 timeIntervalSinceReferenceDate];

  -[KTSDBStmt bindDouble:column:](self, "bindDouble:column:", a4);
}

- (void)bindData:(id)a3 column:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    int v7 = [(KTSDBStmt *)self stmt];
    id v8 = v6;
    int v9 = sqlite3_bind_blob(v7, a4 + 1, [v8 bytes], (int)[v8 length], 0);
    if (v9)
    {
      int v10 = v9;
      v11 = [(KTSDBStmt *)self db];
      uint64_t v12 = [v11 log];

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13[0] = 67109120;
        v13[1] = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "sqlite3_bind_blob: %d", (uint8_t *)v13, 8u);
      }
    }
  }
  else
  {
    [(KTSDBStmt *)self bindNullAtColumn:a4];
  }
}

- (void)bindNullAtColumn:(unint64_t)a3
{
  int v3 = a3;
  v4 = [(KTSDBStmt *)self stmt];

  sqlite3_bind_null(v4, v3 + 1);
}

- (id)generateError:(int)a3 method:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  int v7 = [(KTSDBStmt *)self db];
  id v8 = sqlite3_errmsg((sqlite3 *)[v7 db]);

  v14[0] = NSLocalizedDescriptionKey;
  int v9 = +[NSString stringWithFormat:@"%@: %s", v6, v8];

  v14[1] = @"sqliteCode";
  v15[0] = v9;
  int v10 = +[NSNumber numberWithInt:v4];
  v15[1] = v10;
  v11 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

  uint64_t v12 = +[NSError errorWithDomain:@"KTSDBObjcError" code:1 userInfo:v11];

  return v12;
}

- (id)generateDone
{
  return +[NSError errorWithDomain:@"KTSDBObjcError" code:2 userInfo:0];
}

- (BOOL)steps:(id)a3 error:(id *)a4
{
  id v6 = (uint64_t (**)(id, KTSDBStmt *))a3;
  [(KTSDBStmt *)self setNeedReset:1];
  while (1)
  {
    uint64_t v7 = sqlite3_step([(KTSDBStmt *)self stmt]);
    if (v7 != 100) {
      break;
    }
    if ((v6[2](v6, self) & 1) == 0) {
      goto LABEL_7;
    }
  }
  if (v7 == 101)
  {
    [(KTSDBStmt *)self setNeedReset:0];
    sqlite3_reset([(KTSDBStmt *)self stmt]);
LABEL_7:
    BOOL v8 = 1;
    goto LABEL_13;
  }
  int v9 = [(KTSDBStmt *)self generateError:v7 method:@"steps"];
  int v10 = [(KTSDBStmt *)self db];
  v11 = [v10 log];

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "steps: %@", (uint8_t *)&v13, 0xCu);
  }

  if (a4) {
    *a4 = v9;
  }
  [(KTSDBStmt *)self setNeedReset:0];
  sqlite3_reset([(KTSDBStmt *)self stmt]);
  sqlite3_clear_bindings([(KTSDBStmt *)self stmt]);

  BOOL v8 = 0;
LABEL_13:

  return v8;
}

- (id)stepWithError:(id *)a3
{
  uint64_t v5 = sqlite3_step([(KTSDBStmt *)self stmt]);
  if (v5 == 101)
  {
    [(KTSDBStmt *)self setNeedReset:0];
    sqlite3_reset([(KTSDBStmt *)self stmt]);
    uint64_t v7 = [(KTSDBStmt *)self generateDone];
    if (!a3) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (v5 == 100)
  {
    [(KTSDBStmt *)self setNeedReset:1];
    id v6 = self;
    goto LABEL_11;
  }
  int v8 = v5;
  uint64_t v7 = [(KTSDBStmt *)self generateError:v5 method:@"step"];
  int v9 = [(KTSDBStmt *)self db];
  int v10 = [v9 log];

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109378;
    v12[1] = v8;
    __int16 v13 = 2112;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "stepWithError %d error: %@", (uint8_t *)v12, 0x12u);
  }

  if (a3) {
LABEL_9:
  }
    *a3 = v7;
LABEL_10:

  id v6 = 0;
LABEL_11:

  return v6;
}

- (void)reset
{
  if ([(KTSDBStmt *)self needReset])
  {
    [(KTSDBStmt *)self setNeedReset:0];
    int v3 = [(KTSDBStmt *)self stmt];
    sqlite3_reset(v3);
  }
}

- (void)clearBindings
{
  [(KTSDBStmt *)self reset];
  int v3 = [(KTSDBStmt *)self stmt];

  sqlite3_clear_bindings(v3);
}

- (unint64_t)columnCount
{
  return sqlite3_column_count([(KTSDBStmt *)self stmt]);
}

- (int)columnTypeAtColumn:(unint64_t)a3
{
  int v3 = a3;
  uint64_t v4 = [(KTSDBStmt *)self stmt];

  return sqlite3_column_type(v4, v3);
}

- (id)columnNameAtColumn:(unint64_t)a3
{
  int v3 = sqlite3_column_name([(KTSDBStmt *)self stmt], a3);

  return +[NSString stringWithUTF8String:v3];
}

- (unint64_t)indexForColumnName:(id)a3
{
  id v4 = a3;
  indexesByColumnName = self->_indexesByColumnName;
  if (!indexesByColumnName)
  {
    [(KTSDBStmt *)self enumerateColumnsUsingBlock:0];
    indexesByColumnName = self->_indexesByColumnName;
  }
  id v6 = [(NSDictionary *)indexesByColumnName objectForKeyedSubscript:v4];
  uint64_t v7 = v6;
  if (v6) {
    unint64_t v8 = (unint64_t)[v6 unsignedIntegerValue];
  }
  else {
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (int)intAtColumn:(unint64_t)a3
{
  int v3 = a3;
  id v4 = [(KTSDBStmt *)self stmt];

  return sqlite3_column_int(v4, v3);
}

- (int64_t)int64AtColumn:(unint64_t)a3
{
  int v3 = a3;
  id v4 = [(KTSDBStmt *)self stmt];

  return sqlite3_column_int64(v4, v3);
}

- (double)doubleAtColumn:(unint64_t)a3
{
  int v3 = a3;
  id v4 = [(KTSDBStmt *)self stmt];

  return sqlite3_column_double(v4, v3);
}

- (id)blobAtColumn:(unint64_t)a3
{
  int v3 = a3;
  uint64_t v5 = (void *)sqlite3_column_blob([(KTSDBStmt *)self stmt], a3);
  if (v5)
  {
    id v6 = v5;
    unsigned int v7 = sqlite3_column_bytes([(KTSDBStmt *)self stmt], v3);
    if ((v7 & 0x80000000) != 0)
    {
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v5 = +[NSData dataWithBytes:v6 length:v7];
    }
  }

  return v5;
}

- (id)dateAtColumn:(unint64_t)a3
{
  [(KTSDBStmt *)self doubleAtColumn:a3];

  return +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
}

- (id)textAtColumn:(unint64_t)a3
{
  int v3 = (void *)sqlite3_column_text([(KTSDBStmt *)self stmt], a3);
  if (v3)
  {
    int v3 = +[NSString stringWithUTF8String:v3];
  }

  return v3;
}

- (id)objectAtColumn:(unint64_t)a3
{
  unsigned int v5 = -[KTSDBStmt columnTypeAtColumn:](self, "columnTypeAtColumn:") - 1;
  id v6 = 0;
  switch(v5)
  {
    case 0u:
      id v6 = +[NSNumber numberWithLongLong:[(KTSDBStmt *)self int64AtColumn:a3]];
      break;
    case 1u:
      [(KTSDBStmt *)self doubleAtColumn:a3];
      id v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      break;
    case 2u:
      id v6 = [(KTSDBStmt *)self textAtColumn:a3];
      break;
    case 3u:
      id v6 = [(KTSDBStmt *)self blobAtColumn:a3];
      break;
    case 4u:
      break;
    default:
      unsigned int v7 = [(KTSDBStmt *)self db];
      unint64_t v8 = [v7 log];

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10[0] = 67109120;
        v10[1] = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unexpected column type: %d", (uint8_t *)v10, 8u);
      }

      id v6 = 0;
      break;
  }

  return v6;
}

- (id)allObjects
{
  +[NSMutableArray arrayWithCapacity:[(KTSDBStmt *)self columnCount]];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001E728;
  v6[3] = &unk_1001371D0;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v3;
  unint64_t v8 = self;
  [(KTSDBStmt *)self enumerateColumnsUsingBlock:v6];
  id v4 = v3;

  return v4;
}

- (id)allObjectsByColumnName
{
  +[NSMutableDictionary dictionaryWithCapacity:[(KTSDBStmt *)self columnCount]];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001E88C;
  v7[3] = &unk_1001371D0;
  v7[4] = self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v3;
  [(KTSDBStmt *)self enumerateColumnsUsingBlock:v7];
  id v4 = v8;
  id v5 = v3;

  return v5;
}

- (void)enumerateColumnsUsingBlock:(id)a3
{
  uint64_t v12 = (void (**)(void))a3;
  unint64_t v4 = [(KTSDBStmt *)self columnCount];
  unint64_t v5 = v4;
  if (self->_indexesByColumnName)
  {
    id v6 = 0;
    if (!v4) {
      goto LABEL_11;
    }
  }
  else
  {
    id v6 = +[NSMutableDictionary dictionaryWithCapacity:v4];
    if (!v5) {
      goto LABEL_11;
    }
  }
  uint64_t v7 = 0;
  do
  {
    id v8 = [(KTSDBStmt *)self columnNameAtColumn:v7];
    if (v6)
    {
      int v9 = +[NSNumber numberWithUnsignedInteger:v7];
      [v6 setObject:v9 forKeyedSubscript:v8];
    }
    if (v12) {
      v12[2]();
    }

    ++v7;
  }
  while (v5 != v7);
LABEL_11:
  if (v6)
  {
    int v10 = (NSDictionary *)[v6 copy];
    indexesByColumnName = self->_indexesByColumnName;
    self->_indexesByColumnName = v10;
  }
}

- (KTSDBObjc)db
{
  return (KTSDBObjc *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDb:(id)a3
{
}

- (sqlite3_stmt)stmt
{
  return self->_stmt;
}

- (void)setStmt:(sqlite3_stmt *)a3
{
  self->_stmt = a3;
}

- (BOOL)needReset
{
  return self->_needReset;
}

- (void)setNeedReset:(BOOL)a3
{
  self->_needReset = a3;
}

- (NSDictionary)indexesByColumnName
{
  return self->_indexesByColumnName;
}

- (void)setIndexesByColumnName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexesByColumnName, 0);

  objc_storeStrong((id *)&self->_db, 0);
}

@end