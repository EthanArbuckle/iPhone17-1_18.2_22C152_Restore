@interface _PASSqliteNSIndexSetCursor
+ (const)sqliteCreateTableStatement;
+ (const)sqliteMethodName;
+ (double)baseEstimatedCost;
+ (double)baseEstimatedRows;
- (id)currentIndexedValue;
- (void)setCollection:(id)a3;
@end

@implementation _PASSqliteNSIndexSetCursor

- (void)setCollection:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1A62450A0]();
  v6.receiver = self;
  v6.super_class = (Class)_PASSqliteNSIndexSetCursor;
  [(_PASSqliteCollectionsCursor *)&v6 setCollection:v4];
  [(_PASSqliteRowIdIndexSetCursor *)self setIndexSet:v4];
}

+ (const)sqliteMethodName
{
  return "_pas_nsindexset";
}

+ (double)baseEstimatedRows
{
  return 200.0;
}

+ (double)baseEstimatedCost
{
  return 10.0;
}

- (id)currentIndexedValue
{
  v2 = NSNumber;
  unint64_t v3 = [(_PASSqliteRowIdIndexSetCursor *)self currentIndexedRowId];

  return (id)[v2 numberWithUnsignedInteger:v3];
}

+ (const)sqliteCreateTableStatement
{
  return "CREATE TABLE x(value INTEGER PRIMARY KEY ASC NOT NULL, pointer HIDDEN NOT NULL)";
}

@end