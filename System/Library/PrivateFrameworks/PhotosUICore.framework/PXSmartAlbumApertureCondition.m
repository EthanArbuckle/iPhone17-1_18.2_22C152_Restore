@interface PXSmartAlbumApertureCondition
+ (id)defaultSingleQueryForEditingContext:(id)a3;
+ (id)formatter;
- (NSArray)apertureValues;
- (PXLabeledValue)apertureValue;
- (PXLabeledValue)secondApertureValue;
- (void)setApertureValue:(id)a3;
- (void)setSecondApertureValue:(id)a3;
@end

@implementation PXSmartAlbumApertureCondition

+ (id)formatter
{
  v2 = (void *)formatter__formatter;
  if (!formatter__formatter)
  {
    v3 = objc_alloc_init(PXApertureFormatter);
    v4 = (void *)formatter__formatter;
    formatter__formatter = (uint64_t)v3;

    v2 = (void *)formatter__formatter;
  }
  return v2;
}

+ (id)defaultSingleQueryForEditingContext:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F8B9E8]);
  [v3 setKey:300];
  [v3 setDoubleValue:2.8];
  [v3 setComparator:5];
  return v3;
}

- (void).cxx_destruct
{
}

- (void)setSecondApertureValue:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 value];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v13);
    v14 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v10 handleFailureInMethod:a2, self, @"PXSmartAlbumEXIFCondition.m", 70, @"%@ should be an instance inheriting from %@, but it is %@", @"apertureValue.value", v12, v14 object file lineNumber description];
  }
  else
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [v10 handleFailureInMethod:a2, self, @"PXSmartAlbumEXIFCondition.m", 70, @"%@ should be an instance inheriting from %@, but it is nil", @"apertureValue.value", v12 object file lineNumber description];
  }

LABEL_3:
  v7 = [(PXSmartAlbumCondition *)self singleQuery];
  [v6 doubleValue];
  objc_msgSend(v7, "setSecondDoubleValue:");
  v8 = PLUIGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v5;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: second aperture value set to: %@", buf, 0xCu);
  }

  v9 = [(PXSmartAlbumCondition *)self delegate];
  [v9 conditionDidChange:self];
}

- (PXLabeledValue)secondApertureValue
{
  v2 = [(PXSmartAlbumCondition *)self singleQuery];
  id v3 = NSNumber;
  [v2 secondDoubleValue];
  v4 = objc_msgSend(v3, "numberWithDouble:");
  id v5 = [(id)objc_opt_class() formatter];
  v6 = [v5 stringFromNumber:v4];

  v7 = [[PXLabeledValue alloc] initWithValue:v4 localizedLabel:v6];
  return v7;
}

- (void)setApertureValue:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 value];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v13);
    v14 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v10 handleFailureInMethod:a2, self, @"PXSmartAlbumEXIFCondition.m", 52, @"%@ should be an instance inheriting from %@, but it is %@", @"apertureValue.value", v12, v14 object file lineNumber description];
  }
  else
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [v10 handleFailureInMethod:a2, self, @"PXSmartAlbumEXIFCondition.m", 52, @"%@ should be an instance inheriting from %@, but it is nil", @"apertureValue.value", v12 object file lineNumber description];
  }

LABEL_3:
  v7 = [(PXSmartAlbumCondition *)self singleQuery];
  [v6 doubleValue];
  objc_msgSend(v7, "setDoubleValue:");
  v8 = PLUIGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v5;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: aperture value set to: %@", buf, 0xCu);
  }

  v9 = [(PXSmartAlbumCondition *)self delegate];
  [v9 conditionDidChange:self];
}

- (PXLabeledValue)apertureValue
{
  v2 = [(PXSmartAlbumCondition *)self singleQuery];
  id v3 = NSNumber;
  [v2 doubleValue];
  v4 = objc_msgSend(v3, "numberWithDouble:");
  id v5 = [(id)objc_opt_class() formatter];
  v6 = [v5 stringFromNumber:v4];

  v7 = [[PXLabeledValue alloc] initWithValue:v4 localizedLabel:v6];
  return v7;
}

- (NSArray)apertureValues
{
  apertureValues = self->_apertureValues;
  if (!apertureValues)
  {
    v4 = [(id)objc_opt_class() formatter];
    id v5 = [(PXSmartAlbumCondition *)self editingContext];
    v6 = [v5 apertureValuesWithFormatter:v4];
    v7 = self->_apertureValues;
    self->_apertureValues = v6;

    apertureValues = self->_apertureValues;
  }
  return apertureValues;
}

@end