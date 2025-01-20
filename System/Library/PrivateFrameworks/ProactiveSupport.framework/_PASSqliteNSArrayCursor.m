@interface _PASSqliteNSArrayCursor
+ (const)sqliteMethodName;
+ (id)planningInfoForValueConstraint:(int)a3;
- (BOOL)currentIndexedRowSatisfiesConstraints;
- (_PASSqliteNSArrayCursor)init;
- (id)currentIndexedValue;
- (void)applyConstraint:(int)a3 withArgument:(id)a4;
- (void)setCollection:(id)a3;
@end

@implementation _PASSqliteNSArrayCursor

- (void).cxx_destruct
{
}

- (void)applyConstraint:(int)a3 withArgument:(id)a4
{
  id v7 = a4;
  if (a3 == 72 || a3 == 2)
  {
    id v9 = v7;
    if (!v7
      || ([MEMORY[0x1E4F1CA98] null],
          id v8 = (id)objc_claimAutoreleasedReturnValue(),
          v8,
          a3 == 2)
      && v8 == v9)
    {
LABEL_8:
      [(_PASSqliteRowIdIndexSetCursor *)self matchNoRows];
      goto LABEL_9;
    }
    if (self->_equalTo)
    {
      if ([self->_equalTo isEqual:v9]) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
    objc_storeStrong(&self->_equalTo, a4);
  }
LABEL_9:

  MEMORY[0x1F41817F8]();
}

- (void)setCollection:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_PASSqliteNSArrayCursor;
  id v4 = a3;
  [(_PASSqliteCollectionsCursor *)&v8 setCollection:v4];
  id v5 = objc_alloc(MEMORY[0x1E4F28D60]);
  uint64_t v6 = objc_msgSend(v4, "count", v8.receiver, v8.super_class);

  id v7 = objc_msgSend(v5, "initWithIndexesInRange:", 0, v6);
  [(_PASSqliteRowIdIndexSetCursor *)self setIndexSet:v7];
}

- (BOOL)currentIndexedRowSatisfiesConstraints
{
  v6.receiver = self;
  v6.super_class = (Class)_PASSqliteNSArrayCursor;
  if (![(_PASSqliteCollectionsCursor *)&v6 currentIndexedRowSatisfiesConstraints])return 0; {
  if (!self->_equalTo)
  }
    return 1;
  v3 = [(_PASSqliteNSArrayCursor *)self currentIndexedValue];
  char v4 = [v3 isEqual:self->_equalTo];

  return v4;
}

- (id)currentIndexedValue
{
  v3 = [(_PASSqliteCollectionsCursor *)self collection];
  char v4 = objc_msgSend(v3, "objectAtIndexedSubscript:", -[_PASSqliteRowIdIndexSetCursor currentIndexedRowId](self, "currentIndexedRowId"));

  return v4;
}

- (_PASSqliteNSArrayCursor)init
{
  v6.receiver = self;
  v6.super_class = (Class)_PASSqliteNSArrayCursor;
  v2 = [(_PASSqliteRowIdIndexSetCursor *)&v6 init];
  v3 = v2;
  if (v2)
  {
    id equalTo = v2->_equalTo;
    v2->_id equalTo = 0;
  }
  return v3;
}

+ (id)planningInfoForValueConstraint:(int)a3
{
  if (a3 == 72 || a3 == 2)
  {
    id v5 = -[_PASSqliteCollectionsConstraintPlanInfo initWithEstimatedRows:estimatedCost:unique:omit:]([_PASSqliteCollectionsConstraintPlanInfo alloc], "initWithEstimatedRows:estimatedCost:unique:omit:", 0, 1, 0.00001, 0.95, v3);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

+ (const)sqliteMethodName
{
  return "_pas_nsarray";
}

@end