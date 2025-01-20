@interface NSError(PBFSQLiteDatabaseConnectionAdditions)
+ (id)pbf_sqliteDatabaseErrorWithCode:()PBFSQLiteDatabaseConnectionAdditions errorMessage:;
@end

@implementation NSError(PBFSQLiteDatabaseConnectionAdditions)

+ (id)pbf_sqliteDatabaseErrorWithCode:()PBFSQLiteDatabaseConnectionAdditions errorMessage:
{
  id v5 = a4;
  v6 = [MEMORY[0x1E4F1CA60] dictionary];
  v7 = [NSString stringWithUTF8String:sqlite3_errstr(a3)];
  [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F28568]];

  if (v5) {
    [v6 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F28588]];
  }
  v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.posterboard.sqlite" code:a3 userInfo:v6];

  return v8;
}

@end