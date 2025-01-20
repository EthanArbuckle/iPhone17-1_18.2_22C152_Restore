@interface _PASSqliteRowIdCursor
+ (BOOL)hasRowId;
+ (const)sqliteCreateTableStatement;
- (BOOL)currentIndexEof;
- (unint64_t)outputRowId;
@end

@implementation _PASSqliteRowIdCursor

- (BOOL)currentIndexEof
{
  return [(_PASSqliteRowIdCursor *)self currentIndexedRowId] == 0x7FFFFFFFFFFFFFFFLL;
}

+ (BOOL)hasRowId
{
  return 1;
}

+ (const)sqliteCreateTableStatement
{
  return "CREATE TABLE x(value, pointer HIDDEN NOT NULL)";
}

- (unint64_t)outputRowId
{
  -[_PASSqliteCollectionsCursor stayOnOrStepToOutputRow](self);
  if ([(_PASSqliteRowIdCursor *)self currentIndexEof]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v4 = (void *)MEMORY[0x1A62450A0]();
  unint64_t v5 = [(_PASSqliteRowIdCursor *)self currentIndexedRowId];
  return v5;
}

@end