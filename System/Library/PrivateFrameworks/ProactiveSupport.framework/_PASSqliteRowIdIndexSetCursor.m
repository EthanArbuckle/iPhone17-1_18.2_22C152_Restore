@interface _PASSqliteRowIdIndexSetCursor
+ (BOOL)canOrderByRowId:(BOOL)a3;
+ (double)costFactorForRandomAccess;
+ (id)planningInfoForRowIdConstraint:(int)a3;
- (NSMutableIndexSet)mutableIndexSet;
- (_PASSqliteRowIdIndexSetCursor)init;
- (unint64_t)currentIndexedRowId;
- (void)applyRowIdConstraint:(int)a3 withArgument:(id)a4;
- (void)applyRowIdSort:(BOOL)a3;
- (void)finalizeConstraints;
- (void)matchNoRows;
- (void)matchOneRow:(unint64_t)a3;
- (void)setIndexSet:(id)a3;
- (void)stepIndexedRow;
@end

@implementation _PASSqliteRowIdIndexSetCursor

- (_PASSqliteRowIdIndexSetCursor)init
{
  v7.receiver = self;
  v7.super_class = (Class)_PASSqliteRowIdIndexSetCursor;
  v2 = [(_PASSqliteCollectionsCursor *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_currentIndex = 0;
    uint64_t v4 = [MEMORY[0x1E4F28D60] indexSet];
    indexSet = v3->_indexSet;
    v3->_indexSet = (NSIndexSet *)v4;

    v3->_isDescending = 0;
  }
  return v3;
}

- (void)finalizeConstraints
{
  v5.receiver = self;
  v5.super_class = (Class)_PASSqliteRowIdIndexSetCursor;
  [(_PASSqliteCollectionsCursor *)&v5 finalizeConstraints];
  indexSet = self->_indexSet;
  if (self->_isDescending) {
    unint64_t v4 = [(NSIndexSet *)indexSet lastIndex];
  }
  else {
    unint64_t v4 = [(NSIndexSet *)indexSet firstIndex];
  }
  self->_currentIndex = v4;
}

- (void)setIndexSet:(id)a3
{
  objc_storeStrong((id *)&self->_indexSet, a3);
  id v6 = a3;
  mutableIndexSet = self->_mutableIndexSet;
  self->_mutableIndexSet = 0;
}

- (unint64_t)currentIndexedRowId
{
  return self->_currentIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableIndexSet, 0);

  objc_storeStrong((id *)&self->_indexSet, 0);
}

- (void)applyRowIdSort:(BOOL)a3
{
  self->_isDescending = a3;
}

- (void)applyRowIdConstraint:(int)a3 withArgument:(id)a4
{
  id v13 = a4;
  if (a3 > 0x20)
  {
LABEL_10:
    if (a3 != 72)
    {
      if (a3 != 71) {
        goto LABEL_23;
      }
LABEL_22:
      [(_PASSqliteRowIdIndexSetCursor *)self matchNoRows];
      goto LABEL_23;
    }
LABEL_13:
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      -[_PASSqliteRowIdIndexSetCursor matchOneRow:](self, "matchOneRow:", [v13 unsignedIntegerValue]);
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  if (((1 << a3) & 0x100010110) == 0)
  {
    if (a3 == 2) {
      goto LABEL_13;
    }
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_22;
  }
  if ([(NSIndexSet *)self->_indexSet count])
  {
    unint64_t v6 = [v13 unsignedIntegerValue];
    HIDWORD(v7) = a3;
    LODWORD(v7) = a3 - 4;
    unint64_t v8 = v6;
    switch((v7 >> 2))
    {
      case 0u:
        if ([(NSIndexSet *)self->_indexSet lastIndex] <= v6) {
          goto LABEL_22;
        }
        if ([(NSIndexSet *)self->_indexSet firstIndex] <= v8)
        {
          v9 = [(_PASSqliteRowIdIndexSetCursor *)self mutableIndexSet];
          v10 = v9;
          unint64_t v11 = v8 + 1;
          unint64_t v12 = 0;
          goto LABEL_28;
        }
        break;
      case 1u:
        if ([(NSIndexSet *)self->_indexSet firstIndex] > v6) {
          goto LABEL_22;
        }
        if ([(NSIndexSet *)self->_indexSet lastIndex] > v8)
        {
          v9 = [(_PASSqliteRowIdIndexSetCursor *)self mutableIndexSet];
          v10 = v9;
          unint64_t v12 = v8 + 1;
          unint64_t v11 = 0x7FFFFFFFFFFFFFFDLL - v8;
          goto LABEL_28;
        }
        break;
      case 3u:
        if ([(NSIndexSet *)self->_indexSet firstIndex] >= v6) {
          goto LABEL_22;
        }
        if ([(NSIndexSet *)self->_indexSet lastIndex] >= v8)
        {
          v9 = [(_PASSqliteRowIdIndexSetCursor *)self mutableIndexSet];
          v10 = v9;
          unint64_t v11 = 0x7FFFFFFFFFFFFFFELL - v8;
          unint64_t v12 = v8;
          goto LABEL_28;
        }
        break;
      case 7u:
        if ([(NSIndexSet *)self->_indexSet lastIndex] < v6) {
          goto LABEL_22;
        }
        if ([(NSIndexSet *)self->_indexSet firstIndex] < v8)
        {
          v9 = [(_PASSqliteRowIdIndexSetCursor *)self mutableIndexSet];
          v10 = v9;
          unint64_t v12 = 0;
          unint64_t v11 = v8;
LABEL_28:
          objc_msgSend(v9, "removeIndexesInRange:", v12, v11);
        }
        break;
      default:
        break;
    }
  }
LABEL_23:
}

- (void)stepIndexedRow
{
  BOOL isDescending = self->_isDescending;
  indexSet = self->_indexSet;
  unint64_t v5 = [(_PASSqliteRowIdIndexSetCursor *)self currentIndexedRowId];
  if (isDescending) {
    unint64_t v6 = [(NSIndexSet *)indexSet indexLessThanIndex:v5];
  }
  else {
    unint64_t v6 = [(NSIndexSet *)indexSet indexGreaterThanIndex:v5];
  }
  self->_currentIndex = v6;
}

- (void)matchOneRow:(unint64_t)a3
{
  if (-[NSIndexSet containsIndex:](self->_indexSet, "containsIndex:"))
  {
    if ([(NSIndexSet *)self->_indexSet count] >= 2)
    {
      self->_indexSet = (NSIndexSet *)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:a3];
      MEMORY[0x1F41817F8]();
    }
  }
  else
  {
    [(_PASSqliteRowIdIndexSetCursor *)self matchNoRows];
  }
}

- (void)matchNoRows
{
  self->_indexSet = [MEMORY[0x1E4F28D60] indexSet];

  MEMORY[0x1F41817F8]();
}

- (NSMutableIndexSet)mutableIndexSet
{
  mutableIndexSet = self->_mutableIndexSet;
  if (!mutableIndexSet)
  {
    unint64_t v4 = (NSMutableIndexSet *)[(NSIndexSet *)self->_indexSet mutableCopy];
    unint64_t v5 = self->_mutableIndexSet;
    self->_mutableIndexSet = v4;

    objc_storeStrong((id *)&self->_indexSet, self->_mutableIndexSet);
    mutableIndexSet = self->_mutableIndexSet;
  }

  return mutableIndexSet;
}

+ (double)costFactorForRandomAccess
{
  return 0.0;
}

+ (BOOL)canOrderByRowId:(BOOL)a3
{
  return 1;
}

+ (id)planningInfoForRowIdConstraint:(int)a3
{
  unint64_t v4 = 0;
  if (a3 > 69)
  {
    if (a3 != 72)
    {
      if (a3 != 71)
      {
        if (a3 != 70) {
          goto LABEL_15;
        }
        unint64_t v5 = [_PASSqliteCollectionsConstraintPlanInfo alloc];
        double v6 = 1.0;
        double v7 = 1.0;
        goto LABEL_9;
      }
      unint64_t v5 = [_PASSqliteCollectionsConstraintPlanInfo alloc];
      double v6 = 0.0;
      double v7 = 0.0;
LABEL_13:
      uint64_t v8 = 1;
      goto LABEL_14;
    }
LABEL_11:
    v9 = [_PASSqliteCollectionsConstraintPlanInfo alloc];
    [a1 costFactorForRandomAccess];
    double v7 = v10;
    double v6 = 0.00001;
    unint64_t v5 = v9;
    goto LABEL_13;
  }
  if (a3 > 0x20) {
    goto LABEL_15;
  }
  if (((1 << a3) & 0x100010110) == 0)
  {
    if (a3 != 2) {
      goto LABEL_15;
    }
    goto LABEL_11;
  }
  unint64_t v5 = [_PASSqliteCollectionsConstraintPlanInfo alloc];
  double v6 = 0.5;
  double v7 = 0.5;
LABEL_9:
  uint64_t v8 = 0;
LABEL_14:
  unint64_t v4 = [(_PASSqliteCollectionsConstraintPlanInfo *)v5 initWithEstimatedRows:v8 estimatedCost:1 unique:v6 omit:v7];
LABEL_15:

  return v4;
}

@end