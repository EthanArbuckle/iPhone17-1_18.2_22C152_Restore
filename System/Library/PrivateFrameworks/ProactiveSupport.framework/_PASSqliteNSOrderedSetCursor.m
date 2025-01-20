@interface _PASSqliteNSOrderedSetCursor
+ (const)sqliteCreateTableStatement;
+ (const)sqliteMethodName;
+ (id)planningInfoForValueConstraint:(int)a3;
- (id)currentIndexedValue;
- (void)applyConstraint:(int)a3 withArgument:(id)a4;
- (void)setCollection:(id)a3;
@end

@implementation _PASSqliteNSOrderedSetCursor

- (void)applyConstraint:(int)a3 withArgument:(id)a4
{
  id v6 = a4;
  if (a3 == 71)
  {
    id v13 = v6;
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];

    BOOL v8 = 1;
    id v6 = (id)v7;
  }
  else
  {
    BOOL v8 = a3 == 2;
    if (a3 != 72 && a3 != 2) {
      goto LABEL_12;
    }
  }
  id v14 = v6;
  if (!v6) {
    goto LABEL_10;
  }
  id v9 = [MEMORY[0x1E4F1CA98] null];

  char v10 = !v8;
  if (v14 != v9) {
    char v10 = 1;
  }
  if ((v10 & 1) != 0
    && ([(_PASSqliteCollectionsCursor *)self collection],
        v11 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = [v11 indexOfObject:v14],
        v11,
        v12 != 0x7FFFFFFFFFFFFFFFLL))
  {
    [(_PASSqliteRowIdIndexSetCursor *)self matchOneRow:v12];
  }
  else
  {
LABEL_10:
    [(_PASSqliteRowIdIndexSetCursor *)self matchNoRows];
  }
  id v6 = v14;
LABEL_12:
}

- (void)setCollection:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_PASSqliteNSOrderedSetCursor;
  id v4 = a3;
  [(_PASSqliteCollectionsCursor *)&v8 setCollection:v4];
  id v5 = objc_alloc(MEMORY[0x1E4F28D60]);
  uint64_t v6 = objc_msgSend(v4, "count", v8.receiver, v8.super_class);

  uint64_t v7 = objc_msgSend(v5, "initWithIndexesInRange:", 0, v6);
  [(_PASSqliteRowIdIndexSetCursor *)self setIndexSet:v7];
}

- (id)currentIndexedValue
{
  v3 = [(_PASSqliteCollectionsCursor *)self collection];
  id v4 = objc_msgSend(v3, "objectAtIndexedSubscript:", -[_PASSqliteRowIdIndexSetCursor currentIndexedRowId](self, "currentIndexedRowId"));

  return v4;
}

+ (id)planningInfoForValueConstraint:(int)a3
{
  if ((a3 - 71) < 2 || a3 == 2)
  {
    uint64_t v6 = -[_PASSqliteCollectionsConstraintPlanInfo initWithEstimatedRows:estimatedCost:unique:omit:]([_PASSqliteCollectionsConstraintPlanInfo alloc], "initWithEstimatedRows:estimatedCost:unique:omit:", 1, 1, 0.00001, 0.00001, v3);
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

+ (const)sqliteMethodName
{
  return "_pas_nsorderedset";
}

+ (const)sqliteCreateTableStatement
{
  return "CREATE TABLE x(value UNIQUE, pointer HIDDEN NOT NULL)";
}

@end