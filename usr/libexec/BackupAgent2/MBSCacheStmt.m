@interface MBSCacheStmt
- (BOOL)isReset;
- (BOOL)step;
- (MBSCacheStmt)initWithCache:(id)a3 SQL:(id)a4 stmt:(sqlite3_stmt *)a5;
- (double)doubleColumn:(int)a3;
- (id)blobColumn:(int)a3;
- (id)textColumn:(int)a3;
- (id)valueOfColumn:(int)a3;
- (int)columnCount;
- (int)intColumn:(int)a3;
- (int)typeOfColumn:(int)a3;
- (int64_t)int64Column:(int)a3;
- (void)bindBlob:(id)a3 atIndex:(int)a4;
- (void)bindInt64:(int64_t)a3 atIndex:(int)a4;
- (void)bindInt:(int)a3 atIndex:(int)a4;
- (void)bindInteger:(int64_t)a3 atIndex:(int)a4;
- (void)bindText:(id)a3 atIndex:(int)a4;
- (void)dealloc;
- (void)reset;
- (void)setReset:(BOOL)a3;
- (void)verifyEqualToStmt:(id)a3 exceptColumnNumbers:(id)a4;
@end

@implementation MBSCacheStmt

- (MBSCacheStmt)initWithCache:(id)a3 SQL:(id)a4 stmt:(sqlite3_stmt *)a5
{
  v9.receiver = self;
  v9.super_class = (Class)MBSCacheStmt;
  result = [(MBSCacheStmt *)&v9 init];
  if (result)
  {
    result->_cache = (MBSCacheLikeObject *)a3;
    result->_SQL = (NSString *)a4;
    result->_stmt = a5;
    result->_reset = 1;
  }
  return result;
}

- (void)dealloc
{
  if (!self->_reset) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"MBSCacheStmt.m", 33, @"Statement not reset after last use: \"%@\"", self->_SQL object file lineNumber description];
  }
  if (sqlite3_finalize(self->_stmt)) {
    [(MBSCacheLikeObject *)self->_cache _raise:@"Error finalizing prepared statement: \"%@\"", self->_SQL];
  }
  v3.receiver = self;
  v3.super_class = (Class)MBSCacheStmt;
  [(MBSCacheStmt *)&v3 dealloc];
}

- (BOOL)step
{
  if (self->_reset)
  {
    +[NSDate timeIntervalSinceReferenceDate];
    self->_startTime = v3;
    self->_reset = 0;
  }
  uint64_t v4 = sqlite3_step(self->_stmt);
  if ((v4 & 0xFFFFFFFE) != 0x64) {
    [(MBSCacheLikeObject *)self->_cache _raise:@"Failed to step (%d): \"%@\"", v4, self->_SQL];
  }
  return v4 == 100;
}

- (void)reset
{
  if (!self->_reset)
  {
    if (sqlite3_reset(self->_stmt)) {
      [(MBSCacheLikeObject *)self->_cache _raise:@"Error resetting prepared statement: \"%@\"", self->_SQL];
    }
    if (sqlite3_clear_bindings(self->_stmt)) {
      [(MBSCacheLikeObject *)self->_cache _raise:@"Error clearing prepared statement bindings: \"%@\"", self->_SQL];
    }
    cache = self->_cache;
    SQL = self->_SQL;
    +[NSDate timeIntervalSinceReferenceDate];
    [(MBSCacheLikeObject *)cache _profile:SQL time:v5 - self->_startTime];
    self->_startTime = 0.0;
    self->_reset = 1;
  }
}

- (void)bindInt:(int)a3 atIndex:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (!self->_reset) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"MBSCacheStmt.m", 77, @"Statement is not reset: \"%@\"", self->_SQL object file lineNumber description];
  }
  if (sqlite3_bind_int(self->_stmt, v4, a3)) {
    [(MBSCacheLikeObject *)self->_cache _raise:@"Error binding int at %d: \"%@\"", v4, self->_SQL];
  }
}

- (void)bindInt64:(int64_t)a3 atIndex:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (!self->_reset) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"MBSCacheStmt.m", 85, @"Statement is not reset: \"%@\"", self->_SQL object file lineNumber description];
  }
  if (sqlite3_bind_int64(self->_stmt, v4, a3)) {
    [(MBSCacheLikeObject *)self->_cache _raise:@"Error binding int64 at %d: \"%@\"", v4, self->_SQL];
  }
}

- (void)bindInteger:(int64_t)a3 atIndex:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (!self->_reset) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"MBSCacheStmt.m", 93, @"Statement is not reset: \"%@\"", self->_SQL object file lineNumber description];
  }
  if (sqlite3_bind_int64(self->_stmt, v4, a3)) {
    [(MBSCacheLikeObject *)self->_cache _raise:@"Error binding integer at %d: \"%@\"", v4, self->_SQL];
  }
}

- (void)bindBlob:(id)a3 atIndex:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (!self->_reset) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"MBSCacheStmt.m", 101, @"Statement is not reset: \"%@\"", self->_SQL object file lineNumber description];
  }
  if (sqlite3_bind_blob(self->_stmt, v4, [a3 bytes], (int)objc_msgSend(a3, "length"), 0)) {
    [(MBSCacheLikeObject *)self->_cache _raise:@"Error binding blob at %d: \"%@\"", v4, self->_SQL];
  }
}

- (void)bindText:(id)a3 atIndex:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (!self->_reset) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"MBSCacheStmt.m", 109, @"Statement is not reset: \"%@\"", self->_SQL object file lineNumber description];
  }
  if (sqlite3_bind_text(self->_stmt, v4, (const char *)[a3 UTF8String], -1, 0)) {
    [(MBSCacheLikeObject *)self->_cache _raise:@"Error binding text at %d: \"%@\"", v4, self->_SQL];
  }
}

- (int)columnCount
{
  if (self->_reset) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"MBSCacheStmt.m", 117, @"Statement is reset: \"%@\"", self->_SQL object file lineNumber description];
  }
  stmt = self->_stmt;

  return sqlite3_column_count(stmt);
}

- (int)typeOfColumn:(int)a3
{
  if (self->_reset) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"MBSCacheStmt.m", 123, @"Statement is reset: \"%@\"", self->_SQL object file lineNumber description];
  }
  stmt = self->_stmt;

  return sqlite3_column_type(stmt, a3);
}

- (id)valueOfColumn:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = -[MBSCacheStmt typeOfColumn:](self, "typeOfColumn:");
  switch((int)v5)
  {
    case 1:
      int64_t v6 = [(MBSCacheStmt *)self int64Column:v3];
      id result = +[NSNumber numberWithLongLong:v6];
      break;
    case 2:
      [(MBSCacheStmt *)self doubleColumn:v3];
      id result = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      break;
    case 3:
      id result = [(MBSCacheStmt *)self textColumn:v3];
      break;
    case 4:
      id result = [(MBSCacheStmt *)self blobColumn:v3];
      break;
    case 5:
      goto LABEL_6;
    default:
      +[NSException raise:NSGenericException, @"Unexpected column type: %d", v5 format];
LABEL_6:
      id result = 0;
      break;
  }
  return result;
}

- (int)intColumn:(int)a3
{
  if (self->_reset) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"MBSCacheStmt.m", 153, @"Statement is reset: \"%@\"", self->_SQL object file lineNumber description];
  }
  stmt = self->_stmt;

  return sqlite3_column_int(stmt, a3);
}

- (int64_t)int64Column:(int)a3
{
  if (self->_reset) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"MBSCacheStmt.m", 159, @"Statement is reset: \"%@\"", self->_SQL object file lineNumber description];
  }
  stmt = self->_stmt;

  return sqlite3_column_int64(stmt, a3);
}

- (double)doubleColumn:(int)a3
{
  if (self->_reset) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"MBSCacheStmt.m", 165, @"Statement is reset: \"%@\"", self->_SQL object file lineNumber description];
  }
  stmt = self->_stmt;

  return sqlite3_column_double(stmt, a3);
}

- (id)blobColumn:(int)a3
{
  if (self->_reset) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"MBSCacheStmt.m", 171, @"Statement is reset: \"%@\"", self->_SQL object file lineNumber description];
  }
  id result = (id)sqlite3_column_blob(self->_stmt, a3);
  if (result)
  {
    id v6 = result;
    uint64_t v7 = sqlite3_column_bytes(self->_stmt, a3);
    return +[NSData dataWithBytes:v6 length:v7];
  }
  return result;
}

- (id)textColumn:(int)a3
{
  if (self->_reset) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"MBSCacheStmt.m", 183, @"Statement is reset: \"%@\"", self->_SQL object file lineNumber description];
  }
  id result = (id)sqlite3_column_text(self->_stmt, a3);
  if (result)
  {
    return +[NSString stringWithUTF8String:result];
  }
  return result;
}

- (void)verifyEqualToStmt:(id)a3 exceptColumnNumbers:(id)a4
{
  do
  {
    if (![(MBSCacheStmt *)self step])
    {
      if (![a3 step])
      {
LABEL_20:
        char v17 = 0;
        goto LABEL_22;
      }
      v14 = +[NSAssertionHandler currentHandler];
      uint64_t v15 = 219;
      CFStringRef v16 = @"Fewer results on left-hand side";
LABEL_19:
      [(NSAssertionHandler *)v14 handleFailureInMethod:a2 object:self file:@"MBSCacheStmt.m" lineNumber:v15 description:v16];
      goto LABEL_20;
    }
    if (![a3 step])
    {
      v14 = +[NSAssertionHandler currentHandler];
      uint64_t v15 = 215;
      CFStringRef v16 = @"Fewer results on right-hand side";
      goto LABEL_19;
    }
    unsigned int v7 = [(MBSCacheStmt *)self columnCount];
    if (v7 != [a3 columnCount]) {
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MBSCacheStmt.m", 199, @"Column count doesn't match (%d != %d)", -[MBSCacheStmt columnCount](self, "columnCount"), [a3 columnCount]);
    }
    int v8 = [(MBSCacheStmt *)self columnCount];
    if (v8 >= 1)
    {
      objc_super v9 = 0;
      do
      {
        if ((objc_msgSend(a4, "containsObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9)) & 1) == 0)
        {
          unint64_t v10 = (unint64_t)[a3 valueOfColumn:v9];
          unint64_t v11 = [(MBSCacheStmt *)self valueOfColumn:v9];
          if (v10 | v11)
          {
            if (([(id)v10 isEqual:v11] & 1) == 0)
            {
              v12 = sqlite3_column_name(self->_stmt, (int)v9);
              v13 = MBGetDefaultLog();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v24 = v12;
                __int16 v25 = 2112;
                unint64_t v26 = v10;
                __int16 v27 = 2112;
                unint64_t v28 = v11;
                _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Column %s values don't match (%@ != %@)", buf, 0x20u);
                unint64_t v19 = v10;
                unint64_t v20 = v11;
                v18 = v12;
                _MBLog();
              }
            }
            if ((objc_msgSend((id)v10, "isEqual:", v11, v18, v19, v20) & 1) == 0)
            {
              unint64_t v19 = v10;
              unint64_t v20 = v11;
              v18 = v9;
              [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBSCacheStmt.m" lineNumber:211 description:@"Column %d values don't match (%@ != %@)"];
            }
          }
        }
        objc_super v9 = (const char *)(v9 + 1);
      }
      while (v8 != v9);
    }
    char v17 = 1;
LABEL_22:
  }
  while ((v17 & 1) != 0);
  [(MBSCacheStmt *)self reset];
  [a3 reset];
}

- (BOOL)isReset
{
  return self->_reset;
}

- (void)setReset:(BOOL)a3
{
  self->_reset = a3;
}

@end