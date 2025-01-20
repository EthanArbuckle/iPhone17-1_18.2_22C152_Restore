@interface PXSmartAlbumAlbumCondition
+ (PXLabeledValue)anyAlbumValue;
+ (id)defaultSingleQueryForEditingContext:(id)a3;
- (BOOL)albumValueIsOrphaned;
- (PXLabeledValue)albumValue;
- (id)_albumValues;
- (void)setAlbumValue:(id)a3;
@end

@implementation PXSmartAlbumAlbumCondition

- (void).cxx_destruct
{
}

- (id)_albumValues
{
  albumValues = self->_albumValues;
  if (!albumValues)
  {
    v4 = [(PXSmartAlbumCondition *)self editingContext];
    v5 = [v4 albumValues];
    v6 = self->_albumValues;
    self->_albumValues = v5;

    albumValues = self->_albumValues;
  }
  return albumValues;
}

- (void)setAlbumValue:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 value];
  v6 = [v4 localizedLabel];

  v7 = [(PXSmartAlbumCondition *)self singleQuery];
  v8 = v7;
  if (v5)
  {
    [v7 setStringValue:v5];
    [v8 setSecondStringValue:v6];
    v9 = PLUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 138412546;
      v15 = v5;
      __int16 v16 = 2112;
      v17 = v6;
      v10 = "PXSmartAlbums: album value set to: %@:\"%@\"";
      v11 = v9;
      uint32_t v12 = 22;
LABEL_6:
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v14, v12);
    }
  }
  else
  {
    [v7 setSecondStringValue:0];
    [v8 setStringValue:0];
    v9 = PLUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v14) = 0;
      v10 = "PXSmartAlbums: album value set to: \"Any\"";
      v11 = v9;
      uint32_t v12 = 2;
      goto LABEL_6;
    }
  }

  v13 = [(PXSmartAlbumCondition *)self delegate];
  [v13 conditionDidChange:self];
}

- (BOOL)albumValueIsOrphaned
{
  v3 = [(PXSmartAlbumCondition *)self singleQuery];
  id v4 = [v3 stringValue];
  v5 = [(PXSmartAlbumAlbumCondition *)self _albumValues];
  v6 = v5;
  if (v4)
  {
    v7 = PXLabeledValueForValueInLabeledValues(v5, v4);
    BOOL v8 = v7 == 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (PXLabeledValue)albumValue
{
  v3 = [(PXSmartAlbumCondition *)self singleQuery];
  id v4 = [v3 stringValue];
  if (v4)
  {
    v5 = [(PXSmartAlbumAlbumCondition *)self _albumValues];
    PXLabeledValueForValueInLabeledValues(v5, v4);
    v6 = (PXLabeledValue *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      uint64_t v7 = [v3 secondStringValue];
      BOOL v8 = (void *)v7;
      v9 = @"<missing>";
      if (v7) {
        v9 = (__CFString *)v7;
      }
      v10 = v9;

      v6 = [[PXLabeledValue alloc] initWithValue:v4 localizedLabel:v10];
    }
  }
  else
  {
    v6 = +[PXSmartAlbumAlbumCondition anyAlbumValue];
  }

  return v6;
}

+ (id)defaultSingleQueryForEditingContext:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F8B9E8]);
  [v3 setKey:100];
  [v3 setComparator:22];
  return v3;
}

+ (PXLabeledValue)anyAlbumValue
{
  if (anyAlbumValue_predicate != -1) {
    dispatch_once(&anyAlbumValue_predicate, &__block_literal_global_50848);
  }
  v2 = (void *)anyAlbumValue__anyAlbumValue;
  return (PXLabeledValue *)v2;
}

void __43__PXSmartAlbumAlbumCondition_anyAlbumValue__block_invoke()
{
  PXLocalizedStringFromTable(@"PXSmartAlbumAnyAlbum", @"PXSmartAlbumStrings");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [[PXLabeledValue alloc] initWithValue:0 localizedLabel:v2];
  v1 = (void *)anyAlbumValue__anyAlbumValue;
  anyAlbumValue__anyAlbumValue = (uint64_t)v0;
}

@end