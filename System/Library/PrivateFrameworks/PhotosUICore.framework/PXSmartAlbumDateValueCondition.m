@interface PXSmartAlbumDateValueCondition
- (BOOL)hasNumberOfUnitValue;
- (NSArray)unitValues;
- (NSDate)dateValue;
- (NSDate)secondDateValue;
- (NSNumber)numberOfUnitValue;
- (PXLabeledValue)unitValue;
- (int64_t)comparatorMode;
- (void)setComparatorValue:(id)a3;
- (void)setDateValue:(id)a3;
- (void)setNumberOfUnitValue:(id)a3;
- (void)setSecondDateValue:(id)a3;
- (void)setUnitValue:(id)a3;
@end

@implementation PXSmartAlbumDateValueCondition

- (void).cxx_destruct
{
}

- (int64_t)comparatorMode
{
  return 2;
}

- (void)setUnitValue:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXSmartAlbumDateValueCondition.m", 145, @"Invalid parameter not satisfying: %@", @"unitValue" object file lineNumber description];
  }
  v6 = [(PXSmartAlbumDateValueCondition *)self unitValues];
  char v7 = [v6 containsObject:v5];

  if ((v7 & 1) == 0)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXSmartAlbumDateValueCondition.m", 146, @"Invalid parameter not satisfying: %@", @"[self.unitValues containsObject:unitValue]" object file lineNumber description];
  }
  v8 = [v5 value];
  uint64_t v9 = [v8 integerValue];
  v10 = [(PXSmartAlbumCondition *)self singleQuery];
  [v10 setUnit:v9];
  v11 = PLUIGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = PLStringFromPLQueryUnit();
    *(_DWORD *)buf = 138412290;
    v17 = v12;
    _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: unit value set to: \"%@\"", buf, 0xCu);
  }
  v13 = [(PXSmartAlbumCondition *)self delegate];
  [v13 conditionDidChange:self];
}

- (PXLabeledValue)unitValue
{
  v4 = [(PXSmartAlbumCondition *)self singleQuery];
  if ([v4 hasUnit])
  {
    uint64_t v5 = [v4 unit];
    if (!v5)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2, self, @"PXSmartAlbumDateValueCondition.m", 138, @"Invalid parameter not satisfying: %@", @"unit != kPLQueryUnit_unused" object file lineNumber description];

      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 1;
  }
  char v7 = PXSmartAlbumLocalizedStringForUnit(v5);
  v8 = [PXLabeledValue alloc];
  uint64_t v9 = [NSNumber numberWithInt:v5];
  v10 = [(PXLabeledValue *)v8 initWithValue:v9 localizedLabel:v7];

  return v10;
}

- (NSArray)unitValues
{
  unitValues = self->_unitValues;
  if (!unitValues)
  {
    uint64_t v5 = [(PXSmartAlbumCondition *)self singleQuery];
    uint64_t v6 = [v5 key];
    char v7 = [MEMORY[0x1E4F8B9A8] validUnitValuesForQueryKey:v6];
    v8 = PXSmartAlbumLocalizedStringsForUnitValues(v7);
    PXLabeledValuesWithValuesAndLocalizedLabels(v7, v8);
    uint64_t v9 = (NSArray *)objc_claimAutoreleasedReturnValue();

    v10 = self->_unitValues;
    self->_unitValues = v9;

    if (![(NSArray *)self->_unitValues count])
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, self, @"PXSmartAlbumDateValueCondition.m", 129, @"Invalid parameter not satisfying: %@", @"_unitValues.count" object file lineNumber description];
    }
    unitValues = self->_unitValues;
  }
  return unitValues;
}

- (void)setNumberOfUnitValue:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXSmartAlbumDateValueCondition.m", 115, @"Invalid parameter not satisfying: %@", @"numberOfUnitValue" object file lineNumber description];
  }
  uint64_t v6 = [(PXSmartAlbumCondition *)self singleQuery];
  objc_msgSend(v6, "setIntegerValue:", objc_msgSend(v5, "integerValue"));
  char v7 = PLUIGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: number of units set to: \"%@\"", buf, 0xCu);
  }

  v8 = [(PXSmartAlbumCondition *)self delegate];
  [v8 conditionDidChange:self];
}

- (NSNumber)numberOfUnitValue
{
  v2 = [(PXSmartAlbumCondition *)self singleQuery];
  if ([v2 hasFirstValue])
  {
    uint64_t v3 = [v2 integerValue];
    v4 = [NSNumber numberWithInteger:v3];
  }
  else
  {
    v4 = &unk_1F02D8788;
  }

  return (NSNumber *)v4;
}

- (BOOL)hasNumberOfUnitValue
{
  v2 = [(PXSmartAlbumCondition *)self comparatorValue];
  uint64_t v3 = [v2 value];

  LOBYTE(v2) = ([v3 integerValue] & 0xFFFFFFFELL) == 40;
  return (char)v2;
}

- (void)setSecondDateValue:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXSmartAlbumDateValueCondition.m", 77, @"Invalid parameter not satisfying: %@", @"dateValue" object file lineNumber description];
  }
  uint64_t v6 = [(PXSmartAlbumCondition *)self singleQuery];
  [v6 setSecondDateValue:v5];
  char v7 = PLUIGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: second date value set to: \"%@\"", buf, 0xCu);
  }

  v8 = [(PXSmartAlbumCondition *)self delegate];
  [v8 conditionDidChange:self];
}

- (NSDate)secondDateValue
{
  v2 = [(PXSmartAlbumCondition *)self singleQuery];
  uint64_t v3 = [v2 secondDateValue];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1C9C8] date];
  }
  uint64_t v6 = v5;

  return (NSDate *)v6;
}

- (void)setDateValue:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXSmartAlbumDateValueCondition.m", 61, @"Invalid parameter not satisfying: %@", @"dateValue" object file lineNumber description];
  }
  uint64_t v6 = [(PXSmartAlbumCondition *)self singleQuery];
  [v6 setDateValue:v5];
  char v7 = PLUIGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: date value set to: \"%@\"", buf, 0xCu);
  }

  v8 = [(PXSmartAlbumCondition *)self delegate];
  [v8 conditionDidChange:self];
}

- (NSDate)dateValue
{
  v2 = [(PXSmartAlbumCondition *)self singleQuery];
  uint64_t v3 = [v2 dateValue];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1C9C8] date];
  }
  uint64_t v6 = v5;

  return (NSDate *)v6;
}

- (void)setComparatorValue:(id)a3
{
  id v4 = a3;
  id v5 = [(PXSmartAlbumCondition *)self comparatorValue];
  uint64_t v6 = [v5 value];

  int v7 = [v6 integerValue];
  v8 = [v4 value];
  int v9 = [v8 integerValue];
  v14.receiver = self;
  v14.super_class = (Class)PXSmartAlbumDateValueCondition;
  [(PXSmartAlbumCondition *)&v14 setComparatorValue:v4];

  if (v7 != v9)
  {
    v10 = [(PXSmartAlbumCondition *)self singleQuery];
    id v11 = v10;
    if ((v9 & 0xFFFFFFFE) == 0x28)
    {
      [v10 setSecondDateValue:0];
      [v11 setIntegerValue:30];
      [v11 setUnit:1];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
      [v11 setDateValue:v12];

      if (v9 == 30)
      {
        v13 = [MEMORY[0x1E4F1C9C8] date];
        [v11 setSecondDateValue:v13];
      }
      else
      {
        [v11 setSecondDateValue:0];
      }
    }
  }
}

@end