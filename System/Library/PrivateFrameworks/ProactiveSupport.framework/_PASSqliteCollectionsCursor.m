@interface _PASSqliteCollectionsCursor
+ (BOOL)canOrderByKey:(BOOL)a3;
+ (BOOL)canOrderByRowId:(BOOL)a3;
+ (BOOL)canOrderByValue:(BOOL)a3;
+ (BOOL)hasKey;
+ (BOOL)hasRowId;
+ (double)baseEstimatedCost;
+ (double)baseEstimatedRows;
+ (id)planningInfoForKeyConstraint:(int)a3;
+ (id)planningInfoForRowIdConstraint:(int)a3;
+ (id)planningInfoForValueConstraint:(int)a3;
- (BOOL)currentIndexedRowSatisfiesConstraints;
- (_BYTE)outputValue;
- (_PASSqliteCollectionsCursor)init;
- (id)collection;
- (id)outputKey;
- (unint64_t)outputRowId;
- (void)setCollection:(id)a3;
- (void)stayOnOrStepToOutputRow;
@end

@implementation _PASSqliteCollectionsCursor

+ (BOOL)hasKey
{
  return 0;
}

+ (double)baseEstimatedRows
{
  return 20.0;
}

+ (double)baseEstimatedCost
{
  return 1.0;
}

- (_PASSqliteCollectionsCursor)init
{
  v3.receiver = self;
  v3.super_class = (Class)_PASSqliteCollectionsCursor;
  result = [(_PASSqliteCollectionsCursor *)&v3 init];
  if (result) {
    *(_WORD *)&result->_foundOutputRow = 0;
  }
  return result;
}

- (void)setCollection:(id)a3
{
}

- (void).cxx_destruct
{
}

- (_BYTE)outputValue
{
  v1 = a1;
  if (a1)
  {
    -[_PASSqliteCollectionsCursor stayOnOrStepToOutputRow](a1);
    if (v1[9])
    {
      v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [v4 handleFailureInMethod:sel_outputValue, v1, @"_PASSqliteCollections.m", 389, @"Invalid parameter not satisfying: %@", @"!_eof" object file lineNumber description];
    }
    v2 = (void *)MEMORY[0x1A62450A0]();
    v1 = [v1 currentIndexedValue];
  }

  return v1;
}

- (void)stayOnOrStepToOutputRow
{
  if (a1)
  {
    while (!a1[9] && !a1[8])
    {
      a1[8] = 0;
      v2 = (void *)MEMORY[0x1A62450A0]();
      if ([a1 currentIndexEof])
      {
        a1[9] = 1;
        return;
      }
      char v3 = [a1 currentIndexedRowSatisfiesConstraints];
      if (v3) {
        return;
      }
      v4 = (void *)MEMORY[0x1A62450A0]();
      [a1 stepIndexedRow];
    }
  }
}

- (BOOL)currentIndexedRowSatisfiesConstraints
{
  return 1;
}

- (id)collection
{
  return self->_collection;
}

- (id)outputKey
{
  return 0;
}

- (unint64_t)outputRowId
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

+ (BOOL)canOrderByKey:(BOOL)a3
{
  return 0;
}

+ (BOOL)canOrderByRowId:(BOOL)a3
{
  return 0;
}

+ (BOOL)canOrderByValue:(BOOL)a3
{
  return 0;
}

+ (id)planningInfoForKeyConstraint:(int)a3
{
  return 0;
}

+ (id)planningInfoForRowIdConstraint:(int)a3
{
  return 0;
}

+ (id)planningInfoForValueConstraint:(int)a3
{
  return 0;
}

+ (BOOL)hasRowId
{
  return 0;
}

@end