@interface PXSmartAlbumShutterSpeedCondition
+ (id)defaultSingleQueryForEditingContext:(id)a3;
+ (id)formatter;
- (NSArray)shutterSpeedValues;
- (PXLabeledValue)secondShutterSpeedValue;
- (PXLabeledValue)shutterSpeedValue;
- (void)setSecondShutterSpeedValue:(id)a3;
- (void)setShutterSpeedValue:(id)a3;
@end

@implementation PXSmartAlbumShutterSpeedCondition

+ (id)formatter
{
  v2 = (void *)formatter__formatter_112;
  if (!formatter__formatter_112)
  {
    v3 = objc_alloc_init(PXShutterSpeedFormatter);
    v4 = (void *)formatter__formatter_112;
    formatter__formatter_112 = (uint64_t)v3;

    v2 = (void *)formatter__formatter_112;
  }
  return v2;
}

+ (id)defaultSingleQueryForEditingContext:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F8B9E8]);
  [v3 setKey:306];
  [v3 setDoubleValue:0.004];
  [v3 setComparator:5];
  return v3;
}

- (void).cxx_destruct
{
}

- (void)setSecondShutterSpeedValue:(id)a3
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
    [v10 handleFailureInMethod:a2, self, @"PXSmartAlbumEXIFCondition.m", 368, @"%@ should be an instance inheriting from %@, but it is %@", @"shutterSpeedValue.value", v12, v14 object file lineNumber description];
  }
  else
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [v10 handleFailureInMethod:a2, self, @"PXSmartAlbumEXIFCondition.m", 368, @"%@ should be an instance inheriting from %@, but it is nil", @"shutterSpeedValue.value", v12 object file lineNumber description];
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
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: second shutter speed value set to: %@", buf, 0xCu);
  }

  v9 = [(PXSmartAlbumCondition *)self delegate];
  [v9 conditionDidChange:self];
}

- (PXLabeledValue)secondShutterSpeedValue
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

- (void)setShutterSpeedValue:(id)a3
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
    [v10 handleFailureInMethod:a2, self, @"PXSmartAlbumEXIFCondition.m", 350, @"%@ should be an instance inheriting from %@, but it is %@", @"shutterSpeedValue.value", v12, v14 object file lineNumber description];
  }
  else
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [v10 handleFailureInMethod:a2, self, @"PXSmartAlbumEXIFCondition.m", 350, @"%@ should be an instance inheriting from %@, but it is nil", @"shutterSpeedValue.value", v12 object file lineNumber description];
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
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: shutter speed value set to: %@", buf, 0xCu);
  }

  v9 = [(PXSmartAlbumCondition *)self delegate];
  [v9 conditionDidChange:self];
}

- (PXLabeledValue)shutterSpeedValue
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

- (NSArray)shutterSpeedValues
{
  shutterSpeedValues = self->_shutterSpeedValues;
  if (!shutterSpeedValues)
  {
    v4 = [(id)objc_opt_class() formatter];
    id v5 = [(PXSmartAlbumCondition *)self editingContext];
    v6 = [v5 shutterSpeedValuesWithFormatter:v4];
    v7 = self->_shutterSpeedValues;
    self->_shutterSpeedValues = v6;

    shutterSpeedValues = self->_shutterSpeedValues;
  }
  return shutterSpeedValues;
}

@end