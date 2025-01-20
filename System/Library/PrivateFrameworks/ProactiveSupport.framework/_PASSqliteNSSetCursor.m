@interface _PASSqliteNSSetCursor
+ (const)sqliteCreateTableStatement;
+ (const)sqliteMethodName;
+ (id)planningInfoForValueConstraint:(int)a3;
- (BOOL)currentIndexEof;
- (BOOL)currentIndexedRowSatisfiesConstraints;
- (id)currentIndexedValue;
- (void)applyConstraint:(int)a3 withArgument:(id)a4;
- (void)finalizeConstraints;
- (void)setCollection:(id)a3;
- (void)stepIndexedRow;
@end

@implementation _PASSqliteNSSetCursor

- (void)setCollection:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    if ([v5 count] == 1)
    {
      v6 = (void *)MEMORY[0x1A62450A0]();
      v7 = [v5 anyObject];
      id currentValue = self->_currentValue;
      self->_id currentValue = v7;
    }
    else
    {
      objc_storeStrong((id *)&self->_set, a3);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)_PASSqliteNSSetCursor;
  [(_PASSqliteCollectionsCursor *)&v9 setCollection:v5];
}

- (void)finalizeConstraints
{
  set = self->_set;
  if (set)
  {
    v4 = [(NSSet *)set objectEnumerator];
    valuesEnumerator = self->_valuesEnumerator;
    self->_valuesEnumerator = v4;

    [(_PASSqliteNSSetCursor *)self stepIndexedRow];
  }
}

+ (const)sqliteMethodName
{
  return "_pas_nsset";
}

- (void)stepIndexedRow
{
  self->_id currentValue = [(NSEnumerator *)self->_valuesEnumerator nextObject];

  MEMORY[0x1F41817F8]();
}

- (BOOL)currentIndexEof
{
  return self->_currentValue == 0;
}

- (BOOL)currentIndexedRowSatisfiesConstraints
{
  id currentValue = self->_currentValue;
  id v5 = [MEMORY[0x1E4F1CA98] null];

  if (currentValue == v5)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"_PASSqliteCollections.m", 1095, @"Invalid parameter not satisfying: %@", @"_currentValue != [NSNull null]" object file lineNumber description];
  }
  v8.receiver = self;
  v8.super_class = (Class)_PASSqliteNSSetCursor;
  return [(_PASSqliteCollectionsCursor *)&v8 currentIndexedRowSatisfiesConstraints];
}

- (id)currentIndexedValue
{
  return self->_currentValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valuesEnumerator, 0);
  objc_storeStrong(&self->_currentValue, 0);

  objc_storeStrong((id *)&self->_set, 0);
}

- (void)applyConstraint:(int)a3 withArgument:(id)a4
{
  id v6 = a4;
  if (a3 != 72)
  {
    if (a3 == 71)
    {
      set = self->_set;
      self->_set = 0;

      id currentValue = self->_currentValue;
      self->_id currentValue = 0;
      goto LABEL_10;
    }
    if (a3 != 2) {
      goto LABEL_11;
    }
  }
  id v7 = self->_currentValue;
  v13 = v6;
  if (v7)
  {
    if ([v7 isEqual:v6]) {
      goto LABEL_11;
    }
    id currentValue = self->_currentValue;
    self->_id currentValue = 0;
  }
  else
  {
    BOOL v10 = [(NSSet *)self->_set containsObject:v6];
    v11 = self->_set;
    self->_set = 0;

    if (!v10) {
      goto LABEL_11;
    }
    id v12 = v13;
    id currentValue = self->_currentValue;
    self->_id currentValue = v12;
  }
LABEL_10:

LABEL_11:

  MEMORY[0x1F41817F8]();
}

+ (id)planningInfoForValueConstraint:(int)a3
{
  v3 = 0;
  if (a3 > 70)
  {
    if (a3 == 71)
    {
      v4 = [_PASSqliteCollectionsConstraintPlanInfo alloc];
      double v5 = 0.0;
      double v6 = 0.0;
      goto LABEL_9;
    }
    if (a3 != 72) {
      goto LABEL_11;
    }
  }
  else if (a3 != 2)
  {
    if (a3 != 70) {
      goto LABEL_11;
    }
    v4 = [_PASSqliteCollectionsConstraintPlanInfo alloc];
    double v5 = 1.0;
    double v6 = 1.0;
    uint64_t v7 = 0;
    goto LABEL_10;
  }
  v4 = [_PASSqliteCollectionsConstraintPlanInfo alloc];
  double v5 = 0.00001;
  double v6 = 0.00001;
LABEL_9:
  uint64_t v7 = 1;
LABEL_10:
  v3 = [(_PASSqliteCollectionsConstraintPlanInfo *)v4 initWithEstimatedRows:v7 estimatedCost:1 unique:v5 omit:v6];
LABEL_11:

  return v3;
}

+ (const)sqliteCreateTableStatement
{
  return "CREATE TABLE x(value PRIMARY KEY NOT NULL, pointer HIDDEN NOT NULL) WITHOUT ROWID";
}

@end