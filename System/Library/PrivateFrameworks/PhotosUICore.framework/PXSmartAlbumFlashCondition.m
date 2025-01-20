@interface PXSmartAlbumFlashCondition
+ (id)defaultSingleQueryForEditingContext:(id)a3;
- (NSArray)flashFiredValues;
- (PXLabeledValue)flashFiredValue;
- (void)setFlashFiredValue:(id)a3;
@end

@implementation PXSmartAlbumFlashCondition

+ (id)defaultSingleQueryForEditingContext:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F8B9E8]);
  [v3 setKey:302];
  [v3 setBoolValue:1];
  [v3 setComparator:1];
  return v3;
}

- (void).cxx_destruct
{
}

- (void)setFlashFiredValue:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXSmartAlbumFlashCondition.m", 46, @"Invalid parameter not satisfying: %@", @"flashFiredValue" object file lineNumber description];
  }
  v6 = [(PXSmartAlbumFlashCondition *)self flashFiredValues];
  char v7 = [v6 containsObject:v5];

  if ((v7 & 1) == 0)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PXSmartAlbumFlashCondition.m", 47, @"Invalid parameter not satisfying: %@", @"[self.flashFiredValues containsObject:flashFiredValue]" object file lineNumber description];
  }
  v8 = [v5 value];
  int v9 = [v8 BOOLValue];
  v10 = [(PXSmartAlbumCondition *)self singleQuery];
  [v10 setBoolValue:1];
  if (v9) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = 2;
  }
  [v10 setComparator:v11];
  v12 = PLUIGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = @"NO";
    if (v9) {
      v13 = @"YES";
    }
    v14 = v13;
    *(_DWORD *)buf = 138412290;
    v19 = v14;
    _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: flash fired value set to: \"%@\"", buf, 0xCu);
  }
  v15 = [(PXSmartAlbumCondition *)self delegate];
  [v15 conditionDidChange:self];
}

- (PXLabeledValue)flashFiredValue
{
  v2 = [(PXSmartAlbumCondition *)self singleQuery];
  int v3 = [v2 comparator];
  if ([v2 BOOLValue]) {
    int v4 = 1;
  }
  else {
    int v4 = 2;
  }
  BOOL v5 = v3 == v4;
  BOOL v6 = v3 == v4;
  if (v5) {
    char v7 = @"PXSmartAlbumFlashDidFire";
  }
  else {
    char v7 = @"PXSmartAlbumFlashDidNotFire";
  }
  v8 = PXLocalizedStringFromTable(v7, @"PXSmartAlbumStrings");
  int v9 = [PXLabeledValue alloc];
  v10 = [NSNumber numberWithBool:v6];
  uint64_t v11 = [(PXLabeledValue *)v9 initWithValue:v10 localizedLabel:v8];

  return v11;
}

- (NSArray)flashFiredValues
{
  flashFiredValues = self->_flashFiredValues;
  if (!flashFiredValues)
  {
    int v4 = PXSmartAlbumLocalizedStringsForFlashFiredValues(&unk_1F02D32E0);
    PXLabeledValuesWithValuesAndLocalizedLabels(&unk_1F02D32E0, v4);
    BOOL v5 = (NSArray *)objc_claimAutoreleasedReturnValue();

    BOOL v6 = self->_flashFiredValues;
    self->_flashFiredValues = v5;

    flashFiredValues = self->_flashFiredValues;
  }
  return flashFiredValues;
}

@end