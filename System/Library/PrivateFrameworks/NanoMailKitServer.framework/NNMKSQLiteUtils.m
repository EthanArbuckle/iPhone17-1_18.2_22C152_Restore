@interface NNMKSQLiteUtils
+ (BOOL)BOOLFromStatement:(sqlite3_stmt *)a3 columnIndex:(int)a4;
+ (BOOL)isResponseOkFromPreparedStatementExecution:(int)a3;
+ (double)doubleFromStatement:(sqlite3_stmt *)a3 columnIndex:(int)a4;
+ (id)dataFromStatement:(sqlite3_stmt *)a3 columnIndex:(int)a4;
+ (id)dateFromStatement:(sqlite3_stmt *)a3 columnIndex:(int)a4;
+ (id)stringFromStatement:(sqlite3_stmt *)a3 columnIndex:(int)a4;
+ (unint64_t)integerFromStatement:(sqlite3_stmt *)a3 columnIndex:(int)a4;
+ (unint64_t)unsignedIntegerFromStatement:(sqlite3_stmt *)a3 columnIndex:(int)a4;
+ (void)bindBool:(BOOL)a3 intoStatement:(sqlite3_stmt *)a4 paramIndex:(int)a5;
+ (void)bindData:(id)a3 intoStatement:(sqlite3_stmt *)a4 paramIndex:(int)a5;
+ (void)bindDate:(id)a3 intoStatement:(sqlite3_stmt *)a4 paramIndex:(int)a5;
+ (void)bindDouble:(double)a3 intoStatement:(sqlite3_stmt *)a4 paramIndex:(int)a5;
+ (void)bindInteger:(int64_t)a3 intoStatement:(sqlite3_stmt *)a4 paramIndex:(int)a5;
+ (void)bindString:(id)a3 intoStatement:(sqlite3_stmt *)a4 paramIndex:(int)a5;
+ (void)bindUnsignedInteger:(unint64_t)a3 intoStatement:(sqlite3_stmt *)a4 paramIndex:(int)a5;
+ (void)closeExecutedPreparedStatement:(sqlite3_stmt *)a3;
@end

@implementation NNMKSQLiteUtils

+ (void)closeExecutedPreparedStatement:(sqlite3_stmt *)a3
{
  sqlite3_clear_bindings(a3);
  sqlite3_reset(a3);
}

+ (BOOL)isResponseOkFromPreparedStatementExecution:(int)a3
{
  return (a3 & 0xFFFFFFFE) == 100;
}

+ (void)bindString:(id)a3 intoStatement:(sqlite3_stmt *)a4 paramIndex:(int)a5
{
  if (a3)
  {
    v7 = (const char *)[a3 UTF8String];
    sqlite3_bind_text(a4, a5, v7, -1, 0);
  }
  else
  {
    sqlite3_bind_null(a4, a5);
  }
}

+ (void)bindDate:(id)a3 intoStatement:(sqlite3_stmt *)a4 paramIndex:(int)a5
{
  if (a3)
  {
    [a3 timeIntervalSince1970];
    sqlite3_bind_double(a4, a5, v7);
  }
  else
  {
    sqlite3_bind_null(a4, a5);
  }
}

+ (void)bindData:(id)a3 intoStatement:(sqlite3_stmt *)a4 paramIndex:(int)a5
{
  id v7 = a3;
  id v11 = v7;
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = [v8 bytes];
    if (v9) {
      v10 = (const char *)v9;
    }
    else {
      v10 = "";
    }
    sqlite3_bind_blob(a4, a5, v10, [v8 length], 0);
  }
  else
  {
    sqlite3_bind_null(a4, a5);
  }
}

+ (void)bindInteger:(int64_t)a3 intoStatement:(sqlite3_stmt *)a4 paramIndex:(int)a5
{
}

+ (void)bindUnsignedInteger:(unint64_t)a3 intoStatement:(sqlite3_stmt *)a4 paramIndex:(int)a5
{
}

+ (void)bindDouble:(double)a3 intoStatement:(sqlite3_stmt *)a4 paramIndex:(int)a5
{
}

+ (void)bindBool:(BOOL)a3 intoStatement:(sqlite3_stmt *)a4 paramIndex:(int)a5
{
}

+ (id)stringFromStatement:(sqlite3_stmt *)a3 columnIndex:(int)a4
{
  if (sqlite3_column_type(a3, a4) == 5)
  {
    v6 = 0;
  }
  else
  {
    v6 = (void *)sqlite3_column_text(a3, a4);
    if (v6)
    {
      v6 = [NSString stringWithUTF8String:v6];
    }
  }
  return v6;
}

+ (id)dateFromStatement:(sqlite3_stmt *)a3 columnIndex:(int)a4
{
  if (sqlite3_column_type(a3, a4) == 5)
  {
    v6 = 0;
  }
  else
  {
    v6 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", sqlite3_column_double(a3, a4));
  }
  return v6;
}

+ (id)dataFromStatement:(sqlite3_stmt *)a3 columnIndex:(int)a4
{
  if (sqlite3_column_type(a3, a4) == 5)
  {
    id v6 = 0;
  }
  else
  {
    size_t v7 = sqlite3_column_bytes(a3, a4);
    id v6 = [MEMORY[0x263EFF990] dataWithLength:v7];
    id v8 = (void *)[v6 mutableBytes];
    uint64_t v9 = sqlite3_column_blob(a3, a4);
    memcpy(v8, v9, v7);
  }
  return v6;
}

+ (unint64_t)integerFromStatement:(sqlite3_stmt *)a3 columnIndex:(int)a4
{
  return sqlite3_column_int(a3, a4);
}

+ (unint64_t)unsignedIntegerFromStatement:(sqlite3_stmt *)a3 columnIndex:(int)a4
{
  return sqlite3_column_int(a3, a4);
}

+ (double)doubleFromStatement:(sqlite3_stmt *)a3 columnIndex:(int)a4
{
  return sqlite3_column_double(a3, a4);
}

+ (BOOL)BOOLFromStatement:(sqlite3_stmt *)a3 columnIndex:(int)a4
{
  return sqlite3_column_int(a3, a4) != 0;
}

@end