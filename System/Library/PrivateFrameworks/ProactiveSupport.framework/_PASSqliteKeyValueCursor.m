@interface _PASSqliteKeyValueCursor
+ (BOOL)hasKey;
+ (const)sqliteCreateTableStatement;
- (BOOL)currentIndexEof;
- (id)outputKey;
@end

@implementation _PASSqliteKeyValueCursor

+ (BOOL)hasKey
{
  return 1;
}

+ (const)sqliteCreateTableStatement
{
  return "CREATE TABLE x(key PRIMARY KEY NOT NULL, value, pointer HIDDEN NOT NULL) WITHOUT ROWID";
}

- (id)outputKey
{
  v4 = (void *)MEMORY[0x1A62450A0]();
  v5 = [(_PASSqliteKeyValueCursor *)self currentIndexedKey];
  if (!v5)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"_PASSqliteCollections.m", 1152, @"Invalid parameter not satisfying: %@", @"outputKey != nil" object file lineNumber description];
  }

  return v5;
}

- (BOOL)currentIndexEof
{
  v2 = [(_PASSqliteKeyValueCursor *)self currentIndexedKey];
  BOOL v3 = v2 == 0;

  return v3;
}

@end