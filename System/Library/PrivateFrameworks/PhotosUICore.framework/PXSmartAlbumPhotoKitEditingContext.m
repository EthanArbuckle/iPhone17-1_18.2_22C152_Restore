@interface PXSmartAlbumPhotoKitEditingContext
- (NSArray)albumValues;
- (NSArray)cameraModels;
- (NSArray)conditionTypeValues;
- (NSArray)keywordValues;
- (NSArray)lensModels;
- (NSArray)personNames;
- (PHPhotoLibrary)photoLibrary;
- (PXSmartAlbumPhotoKitEditingContext)init;
- (PXSmartAlbumPhotoKitEditingContext)initWithPhotoLibrary:(id)a3;
- (id)ISOValuesWithFormatter:(id)a3;
- (id)apertureValuesWithFormatter:(id)a3;
- (id)focalLengthValuesWithFormatter:(id)a3;
- (id)shutterSpeedValuesWithFormatter:(id)a3;
@end

@implementation PXSmartAlbumPhotoKitEditingContext

- (void).cxx_destruct
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (NSArray)personNames
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  [v4 setPersonContext:1];
  v5 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
  [v4 setIncludedDetectionTypes:v5];

  v6 = [MEMORY[0x1E4F391F0] fetchPersonsWithOptions:v4];
  if ([v6 count])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __49__PXSmartAlbumPhotoKitEditingContext_personNames__block_invoke;
    v12[3] = &unk_1E5DC1B48;
    v7 = v3;
    v13 = v7;
    [v6 enumerateObjectsUsingBlock:v12];
    if ([v7 count])
    {
      [v7 sortUsingComparator:&__block_literal_global_122];
    }
    else
    {
      v9 = PLUIGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v11 = 0;
        _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "PXSmartAlbums: found no named persons", (uint8_t *)&v11, 2u);
      }
    }
    v8 = v13;
  }
  else
  {
    v8 = PLUIGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = 0;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "PXSmartAlbums: found no persons", (uint8_t *)&v11, 2u);
    }
  }

  return (NSArray *)v3;
}

void __49__PXSmartAlbumPhotoKitEditingContext_personNames__block_invoke(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "px_localizedName");
  if ([v3 length])
  {
    v4 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __49__PXSmartAlbumPhotoKitEditingContext_personNames__block_invoke_2;
    v6[3] = &unk_1E5DB5718;
    id v5 = v3;
    id v7 = v5;
    if ([v4 indexOfObjectPassingTest:v6] == 0x7FFFFFFFFFFFFFFFLL) {
      [*(id *)(a1 + 32) addObject:v5];
    }
  }
}

uint64_t __49__PXSmartAlbumPhotoKitEditingContext_personNames__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedCaseInsensitiveCompare:");
}

BOOL __49__PXSmartAlbumPhotoKitEditingContext_personNames__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 caseInsensitiveCompare:*(void *)(a1 + 32)] == 0;
}

- (NSArray)keywordValues
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(PHPhotoLibrary *)self->_photoLibrary photoLibrary];
  id v5 = [v4 managedObjectContext];
  v6 = (void *)MEMORY[0x1E4F1C0D0];
  id v7 = [MEMORY[0x1E4F8A970] entityName];
  v8 = [v6 fetchRequestWithEntityName:v7];

  v21[0] = @"assetAttributes";
  v9 = [NSString stringWithFormat:@"%@.%@", @"assetAttributes", @"asset"];
  v21[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  [v8 setRelationshipKeyPathsForPrefetching:v10];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__PXSmartAlbumPhotoKitEditingContext_keywordValues__block_invoke;
  v17[3] = &unk_1E5DD0F30;
  id v18 = v5;
  id v19 = v8;
  id v11 = v3;
  id v20 = v11;
  id v12 = v8;
  id v13 = v5;
  [v13 performBlockAndWait:v17];
  v14 = v20;
  v15 = (NSArray *)v11;

  return v15;
}

void __51__PXSmartAlbumPhotoKitEditingContext_keywordValues__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v10 = 0;
  v4 = [v2 executeFetchRequest:v3 error:&v10];
  id v5 = v10;
  if (v4)
  {
    if ([v4 count])
    {
      v6 = [v4 sortedArrayUsingComparator:&__block_literal_global_69050];

      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __51__PXSmartAlbumPhotoKitEditingContext_keywordValues__block_invoke_3;
      v8[3] = &unk_1E5DB56F0;
      id v9 = *(id *)(a1 + 48);
      [v6 enumerateObjectsUsingBlock:v8];

      v4 = v6;
    }
    else
    {
      id v7 = PLUIGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "PXSmartAlbums: found no keywords", buf, 2u);
      }
    }
  }
  else
  {
    v4 = PLUIGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_ERROR, "PXSmartAlbums: failed to fetch keywords: %@", buf, 0xCu);
    }
  }
}

void __51__PXSmartAlbumPhotoKitEditingContext_keywordValues__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 title];
  v4 = (void *)v3;
  id v5 = &stru_1F00B0030;
  if (v3) {
    id v5 = (__CFString *)v3;
  }
  v6 = v5;

  id v7 = [[PXLabeledValue alloc] initWithValue:v6 localizedLabel:v6];
  [*(id *)(a1 + 32) addObject:v7];
}

uint64_t __51__PXSmartAlbumPhotoKitEditingContext_keywordValues__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 title];
  v6 = [v4 title];

  uint64_t v7 = [v5 localizedStandardCompare:v6];
  return v7;
}

- (id)shutterSpeedValuesWithFormatter:(id)a3
{
  return _NumericalValuesForKeyPath(self->_photoLibrary, @"shutterSpeed", a3);
}

- (NSArray)lensModels
{
  return (NSArray *)_StringValuesForKeyPath(self->_photoLibrary, @"lensModel");
}

- (id)ISOValuesWithFormatter:(id)a3
{
  return _NumericalValuesForKeyPath(self->_photoLibrary, @"iso", a3);
}

- (id)focalLengthValuesWithFormatter:(id)a3
{
  return _NumericalValuesForKeyPath(self->_photoLibrary, @"focalLength", a3);
}

- (NSArray)cameraModels
{
  return (NSArray *)_StringValuesForKeyPath(self->_photoLibrary, @"cameraModel");
}

- (id)apertureValuesWithFormatter:(id)a3
{
  return _NumericalValuesForKeyPath(self->_photoLibrary, @"aperture", a3);
}

- (NSArray)albumValues
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  id v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"title" ascending:1];
  v13[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [v4 setSortDescriptors:v6];

  uint64_t v7 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:1 subtype:2 options:v4];
  if ([v7 count])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __49__PXSmartAlbumPhotoKitEditingContext_albumValues__block_invoke;
    v11[3] = &unk_1E5DCDB48;
    id v12 = v3;
    [v7 enumerateObjectsUsingBlock:v11];
    v8 = v12;
  }
  else
  {
    v8 = PLUIGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "PXSmartAlbums: found no albums", v10, 2u);
    }
  }

  return (NSArray *)v3;
}

void __49__PXSmartAlbumPhotoKitEditingContext_albumValues__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = [v3 uuid];
  id v4 = [v3 localizedTitle];

  id v5 = &stru_1F00B0030;
  if (v4) {
    id v5 = v4;
  }
  v6 = v5;

  uint64_t v7 = [[PXLabeledValue alloc] initWithValue:v8 localizedLabel:v6];
  [*(id *)(a1 + 32) addObject:v7];
}

- (NSArray)conditionTypeValues
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = PXSmartAlbumLocalizedStringsForConditionTypeValues(&unk_1F02D3D30);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__PXSmartAlbumPhotoKitEditingContext_conditionTypeValues__block_invoke;
  v8[3] = &unk_1E5DBC640;
  id v9 = &unk_1F02D3D30;
  id v4 = v2;
  id v10 = v4;
  [v3 enumerateObjectsUsingBlock:v8];
  id v5 = v10;
  v6 = (NSArray *)v4;

  return v6;
}

void __57__PXSmartAlbumPhotoKitEditingContext_conditionTypeValues__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v10 = [v5 objectAtIndexedSubscript:a3];
  uint64_t v7 = [[PXLabeledValue alloc] initWithValue:v10 localizedLabel:v6];

  [*(id *)(a1 + 40) addObject:v7];
  if ([v10 integerValue] == 17)
  {
    id v8 = *(void **)(a1 + 40);
    id v9 = +[PXLabeledValue separatorLabeledValue];
    [v8 addObject:v9];
  }
}

- (PXSmartAlbumPhotoKitEditingContext)initWithPhotoLibrary:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXSmartAlbumPhotoKitEditingContext.m", 41, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PXSmartAlbumPhotoKitEditingContext;
  uint64_t v7 = [(PXSmartAlbumPhotoKitEditingContext *)&v11 init];
  id v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_photoLibrary, a3);
  }

  return v8;
}

- (PXSmartAlbumPhotoKitEditingContext)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSmartAlbumPhotoKitEditingContext.m", 37, @"%s is not available as initializer", "-[PXSmartAlbumPhotoKitEditingContext init]");

  abort();
}

@end