@interface NSError(PQLAdditions)
+ (id)errorForDB:()PQLAdditions SQL:;
+ (id)errorForDB:()PQLAdditions stmt:;
+ (id)errorWithSqliteCode:()PQLAdditions andMessage:;
+ (uint64_t)errorForDB:()PQLAdditions;
- (BOOL)isSqliteErrorCode:()PQLAdditions;
- (id)sqliteStatement;
- (uint64_t)extendedSqliteCode;
@end

@implementation NSError(PQLAdditions)

+ (uint64_t)errorForDB:()PQLAdditions
{
  return [MEMORY[0x1E4F28C58] errorForDB:a3 SQL:0];
}

+ (id)errorForDB:()PQLAdditions stmt:
{
  v5 = (void *)MEMORY[0x1E4F28C58];
  v6 = [NSString stringWithUTF8String:sqlite3_sql(pStmt)];
  v7 = [v5 errorForDB:a3 SQL:v6];

  return v7;
}

+ (id)errorForDB:()PQLAdditions SQL:
{
  id v5 = a4;
  unsigned __int8 v6 = sqlite3_errcode(a3);
  uint64_t v7 = sqlite3_extended_errcode(a3);
  int v15 = 0;
  if (v5) {
    uint64_t v8 = 4;
  }
  else {
    uint64_t v8 = 3;
  }
  v9 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v8];
  v10 = [NSString stringWithUTF8String:sqlite3_errmsg(a3)];
  [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F1D140]];

  v11 = [NSNumber numberWithInteger:v7];
  [v9 setObject:v11 forKeyedSubscript:@"SqliteExtendedCode"];

  if (a3 && !sqlite3_file_control(a3, 0, 4, &v15) && v15)
  {
    v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:v15 userInfo:0];
    [v9 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  if (v5) {
    [v9 setObject:v5 forKeyedSubscript:@"SqliteSQL"];
  }
  v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SqliteErrorDomain" code:v6 userInfo:v9];

  return v13;
}

+ (id)errorWithSqliteCode:()PQLAdditions andMessage:
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = *MEMORY[0x1E4F1D140];
  v11[1] = @"SqliteExtendedCode";
  v12[0] = a4;
  id v5 = NSNumber;
  id v6 = a4;
  uint64_t v7 = [v5 numberWithInt:a3];
  v12[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SqliteErrorDomain" code:a3 userInfo:v8];

  return v9;
}

- (uint64_t)extendedSqliteCode
{
  v2 = [a1 userInfo];
  v3 = [v2 objectForKeyedSubscript:@"SqliteExtendedCode"];

  if (v3) {
    uint64_t v4 = [v3 unsignedIntegerValue];
  }
  else {
    uint64_t v4 = [a1 code];
  }
  uint64_t v5 = v4;

  return v5;
}

- (id)sqliteStatement
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"SqliteSQL"];

  return v2;
}

- (BOOL)isSqliteErrorCode:()PQLAdditions
{
  uint64_t v5 = [a1 domain];
  if ([v5 isEqualToString:@"SqliteErrorDomain"]) {
    BOOL v6 = [a1 code] == a3;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

@end