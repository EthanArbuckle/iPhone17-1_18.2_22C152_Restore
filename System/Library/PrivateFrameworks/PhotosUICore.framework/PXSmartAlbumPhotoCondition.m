@interface PXSmartAlbumPhotoCondition
+ (id)defaultSingleQueryForEditingContext:(id)a3;
- (NSArray)photoTypeValues;
- (PXLabeledValue)photoTypeValue;
- (void)setPhotoTypeValue:(id)a3;
@end

@implementation PXSmartAlbumPhotoCondition

+ (id)defaultSingleQueryForEditingContext:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F8B9E8]);
  [v3 setKey:1];
  [v3 setBoolValue:1];
  [v3 setComparator:1];
  return v3;
}

- (void).cxx_destruct
{
}

- (void)setPhotoTypeValue:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PXSmartAlbumPhotoCondition.m", 44, @"Invalid parameter not satisfying: %@", @"photoTypeValue" object file lineNumber description];
  }
  v6 = [(PXSmartAlbumPhotoCondition *)self photoTypeValues];
  char v7 = [v6 containsObject:v5];

  if ((v7 & 1) == 0)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PXSmartAlbumPhotoCondition.m", 45, @"Invalid parameter not satisfying: %@", @"[self.photoTypeValues containsObject:photoTypeValue]" object file lineNumber description];
  }
  v8 = [v5 value];
  uint64_t v9 = [v8 integerValue];
  switch(v9)
  {
    case 0:
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      v20 = [NSString stringWithUTF8String:"-[PXSmartAlbumPhotoCondition setPhotoTypeValue:]"];
      [v19 handleFailureInFunction:v20 file:@"PXSmartAlbumPhotoCondition.m" lineNumber:54 description:@"Code which should be unreachable has been reached"];

      abort();
    case 1:
      uint64_t v10 = 3;
      goto LABEL_27;
    case 2:
      uint64_t v10 = 5;
      uint64_t v11 = 10;
      break;
    case 3:
      uint64_t v10 = 5;
      uint64_t v11 = 12;
      break;
    case 4:
      uint64_t v11 = 1;
      uint64_t v10 = 1;
      break;
    case 5:
      uint64_t v10 = 5;
      uint64_t v11 = 9;
      break;
    case 6:
      uint64_t v10 = 2;
      goto LABEL_27;
    case 7:
      uint64_t v10 = 5;
      uint64_t v11 = 3;
      break;
    case 8:
      uint64_t v10 = 5;
      uint64_t v11 = 2;
      break;
    case 9:
      uint64_t v10 = 5;
      uint64_t v11 = 4;
      break;
    case 10:
      uint64_t v10 = 4;
      goto LABEL_27;
    case 11:
      uint64_t v10 = 6;
      goto LABEL_27;
    case 12:
      uint64_t v10 = 5;
      uint64_t v11 = 8;
      break;
    case 13:
      uint64_t v10 = 5;
      uint64_t v11 = 7;
      break;
    case 14:
      uint64_t v10 = 5;
      uint64_t v11 = 11;
      break;
    case 15:
      uint64_t v10 = 5;
      uint64_t v11 = 6;
      break;
    case 16:
      uint64_t v10 = 319;
      goto LABEL_27;
    case 17:
      uint64_t v11 = 5;
      uint64_t v10 = 5;
      break;
    case 18:
      uint64_t v10 = 1000;
      goto LABEL_27;
    case 19:
      uint64_t v10 = 9;
LABEL_27:
      uint64_t v11 = 1;
      break;
    case 20:
      uint64_t v10 = 5;
      uint64_t v11 = 14;
      break;
    case 21:
      uint64_t v10 = 5;
      uint64_t v11 = 15;
      break;
    case 22:
      uint64_t v10 = 5;
      uint64_t v11 = 16;
      break;
    case 23:
      uint64_t v10 = 5;
      uint64_t v11 = 17;
      break;
    default:
      uint64_t v11 = 0;
      uint64_t v10 = 0;
      break;
  }
  v12 = [(PXSmartAlbumCondition *)self singleQuery];
  [v12 setKey:v10];
  [v12 setIntegerValue:v11];
  v13 = PLUIGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = PXSmartAlbumPhotoTypeDebugDescription(v9);
    v15 = PLStringFromPLQueryKey();
    *(_DWORD *)buf = 138412802;
    v22 = v14;
    __int16 v23 = 2112;
    v24 = v15;
    __int16 v25 = 2048;
    uint64_t v26 = v11;
    _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: photo type value set to: %@ (%@:%ld)", buf, 0x20u);
  }
  v16 = [(PXSmartAlbumCondition *)self delegate];
  [v16 conditionDidChange:self];
}

- (PXLabeledValue)photoTypeValue
{
  v4 = [(PXSmartAlbumCondition *)self singleQuery];
  uint64_t v5 = PXSmartAlbumPhotoTypeForSingleQuery(v4);
  uint64_t v6 = v5;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXSmartAlbumPhotoCondition.m", 37, @"Invalid parameter not satisfying: %@", @"photoType != PXSmartAlbumPhotoTypeInvalid" object file lineNumber description];

    uint64_t v5 = 0;
  }
  char v7 = PXSmartAlbumLocalizedStringForPhotoType(v5);
  v8 = [PXLabeledValue alloc];
  uint64_t v9 = [NSNumber numberWithInteger:v6];
  uint64_t v10 = [(PXLabeledValue *)v8 initWithValue:v9 localizedLabel:v7];

  return v10;
}

- (NSArray)photoTypeValues
{
  photoTypeValues = self->_photoTypeValues;
  if (!photoTypeValues)
  {
    v4 = PXSmartAlbumLocalizedStringsForPhotoTypeValues(&unk_1F02D3838);
    uint64_t v5 = PXLabeledValuesWithValuesAndLocalizedLabels(&unk_1F02D3838, v4);
    uint64_t v6 = (NSArray *)[v5 mutableCopy];

    uint64_t v7 = PXSmartAlbumIndexOfValueInLabeledValues(v6, &unk_1F02D6580);
    v8 = +[PXLabeledValue separatorLabeledValue];
    [(NSArray *)v6 insertObject:v8 atIndex:v7];

    uint64_t v9 = PXSmartAlbumIndexOfValueInLabeledValues(v6, &unk_1F02D66D0);
    uint64_t v10 = +[PXLabeledValue separatorLabeledValue];
    [(NSArray *)v6 insertObject:v10 atIndex:v9];

    uint64_t v11 = self->_photoTypeValues;
    self->_photoTypeValues = v6;

    photoTypeValues = self->_photoTypeValues;
  }
  return photoTypeValues;
}

@end