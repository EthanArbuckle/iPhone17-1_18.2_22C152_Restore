@interface PLResourceChooser
+ (id)_chooseFileReservationForLargeDisplayableImageFileForAsset:(id)a3 format:(id)a4 forceLarge:(BOOL)a5 allowMetadataSnapshot:(BOOL)a6 outFilePath:(id *)a7 outImageType:(int64_t *)a8;
+ (id)_filteredArrayUsingPredicate:(id)a3 originalItems:(id)a4 nonMatchingItems:(id *)a5;
+ (id)_itemMatchingFormat:(id)a3 allItems:(id)a4 acceptableSortedAlternatives:(id *)a5;
+ (id)_originalItemFromAllItems:(id)a3;
+ (id)_penultimateItemFromAllItems:(id)a3;
+ (id)fileReservationForImageFileForAsset:(id)a3 format:(id)a4 outFilePath:(id *)a5 outImageType:(int64_t *)a6;
+ (id)fileReservationForLargeDisplayableImageFileForAsset:(id)a3 format:(id)a4 allowMetadataSnapshot:(BOOL)a5 forceLarge:(BOOL)a6 outFilePath:(id *)a7 outImageType:(int64_t *)a8;
+ (int64_t)_fileResourceTypeForCloudResourceType:(unint64_t)a3 hasAdjustments:(BOOL)a4 requiresUnadjustedVersion:(BOOL)a5;
+ (unint64_t)cloudResourceTypeForAsset:(id)a3 format:(id)a4 filePath:(id *)a5 imageType:(int64_t *)a6;
+ (void)_chooseCloudResourceTypeForFormat:(id)a3 asset:(id)a4 optimalCPLResourceType:(unint64_t *)a5 localCPLResourceType:(unint64_t *)a6 localCPLResourceFilePath:(id *)a7 fileReservation:(id *)a8;
- (PLResourceChooser)init;
@end

@implementation PLResourceChooser

- (PLResourceChooser)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLResourceChooser;
  return [(PLResourceChooser *)&v3 init];
}

+ (unint64_t)cloudResourceTypeForAsset:(id)a3 format:(id)a4 filePath:(id *)a5 imageType:(int64_t *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  id v18 = 0;
  v12 = (unint64_t *)&v20;
  [a1 _chooseCloudResourceTypeForFormat:v11 asset:v10 optimalCPLResourceType:&v20 localCPLResourceType:&v19 localCPLResourceFilePath:&v18 fileReservation:0];
  id v13 = v18;
  if (v19)
  {
    uint64_t v14 = [v10 hasAdjustments];
    int64_t v15 = objc_msgSend(a1, "_fileResourceTypeForCloudResourceType:hasAdjustments:requiresUnadjustedVersion:", v19, v14, objc_msgSend(v11, "refersToUnadjustedVersion"));
    v12 = (unint64_t *)&v19;
  }
  else
  {
    int64_t v15 = 0;
  }
  unint64_t v16 = *v12;
  if (a5) {
    *a5 = v13;
  }
  if (a6) {
    *a6 = v15;
  }

  return v16;
}

+ (int64_t)_fileResourceTypeForCloudResourceType:(unint64_t)a3 hasAdjustments:(BOOL)a4 requiresUnadjustedVersion:(BOOL)a5
{
  int64_t result = a3;
  if ((uint64_t)a3 > 14)
  {
    switch(a3)
    {
      case 0xFuLL:
        return 6;
      case 0x17uLL:
        return 4;
      case 0x11uLL:
        return 2;
      default:
        return 0;
    }
  }
  else
  {
    switch(a3)
    {
      case 1uLL:
        return result;
      case 2uLL:
        if (!a4 || a5) {
          int64_t result = 3;
        }
        else {
          int64_t result = 5;
        }
        break;
      case 3uLL:
        int64_t result = 8;
        break;
      case 4uLL:
        int64_t result = 9;
        break;
      default:
        return 0;
    }
  }
  return result;
}

+ (void)_chooseCloudResourceTypeForFormat:(id)a3 asset:(id)a4 optimalCPLResourceType:(unint64_t *)a5 localCPLResourceType:(unint64_t *)a6 localCPLResourceFilePath:(id *)a7 fileReservation:(id *)a8
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v44 = a4;
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x2020000000;
  uint64_t v67 = 0;
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__51914;
  v62 = __Block_byref_object_dispose__51915;
  id v63 = 0;
  if (([v10 refersToUnadjustedVersion] & 1) != 0 || (objc_msgSend(v44, "hasAdjustments") & 1) == 0)
  {
    id v13 = [v44 availableUnadjustedCloudResourcesForPhotos];
    uint64_t v14 = [v13 mutableCopy];
  }
  else
  {
    id v11 = [MEMORY[0x1E4F8B938] formatWithID:9997];
    int v12 = [v10 isEqualToFormat:v11];

    if (v12) {
      [v44 availableAdjustedCloudResourcesForPhotos:1];
    }
    else {
    id v13 = [v44 availableAdjustedCloudResourcesForPhotos:0];
    }
    uint64_t v14 = [v13 mutableCopy];
  }
  int64_t v15 = (void *)v14;

  if ([v10 formatID] == 10000)
  {
    if ([v44 isRAWPlusJPEG]) {
      objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"cplType == %d", 17);
    }
    else {
      objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"cplType == %d", 1);
    }
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = [v15 filteredArrayUsingPredicate:v16];
    uint64_t v19 = (void *)[v17 mutableCopy];

LABEL_14:
    goto LABEL_31;
  }
  if ([v44 hasAdjustments]) {
    int v18 = [v44 isOriginalRAW];
  }
  else {
    int v18 = [v44 isRAW];
  }
  int v20 = v18;
  int v21 = [v44 isRAWPlusJPEG];
  if ((v20 | v21) == 1 && (unint64_t)[v15 count] >= 2)
  {
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v16 = v15;
    uint64_t v22 = [v16 countByEnumeratingWithState:&v54 objects:v69 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v55;
      while (2)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v55 != v23) {
            objc_enumerationMutation(v16);
          }
          v25 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          if (v20 && [*(id *)(*((void *)&v54 + 1) + 8 * i) cplType] == 1
            || v21 && [v25 cplType] == 17)
          {
            [v16 removeObject:v25];
            uint64_t v19 = v16;
            goto LABEL_14;
          }
        }
        uint64_t v22 = [v16 countByEnumeratingWithState:&v54 objects:v69 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }
    uint64_t v19 = v16;
    goto LABEL_14;
  }
  uint64_t v19 = v15;
LABEL_31:
  v26 = +[PLChoosableItem choosableItemsFromCloudResources:v19];
  id v53 = 0;
  v27 = [a1 _itemMatchingFormat:v10 allItems:v26 acceptableSortedAlternatives:&v53];
  id v28 = v53;
  if (v27)
  {
    int v29 = [v27 type];
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __146__PLResourceChooser__chooseCloudResourceTypeForFormat_asset_optimalCPLResourceType_localCPLResourceType_localCPLResourceFilePath_fileReservation___block_invoke;
    v49[3] = &unk_1E586B0C0;
    id v50 = v19;
    v51 = &v64;
    v52 = &v58;
    v30 = (void (**)(void, void))MEMORY[0x19F38D650](v49);
    v31 = v30[2](v30, (int)[v27 type]);
    if (!v31)
    {
      if ([v28 count])
      {
        int v39 = v29;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v32 = v28;
        uint64_t v33 = [v32 countByEnumeratingWithState:&v45 objects:v68 count:16];
        id v37 = v28;
        id v38 = v10;
        if (v33)
        {
          uint64_t v34 = *(void *)v46;
LABEL_36:
          uint64_t v35 = 0;
          while (1)
          {
            if (*(void *)v46 != v34) {
              objc_enumerationMutation(v32);
            }
            v31 = v30[2](v30, (int)[*(id *)(*((void *)&v45 + 1) + 8 * v35) type]);
            if (v31) {
              break;
            }
            if (v33 == ++v35)
            {
              uint64_t v33 = [v32 countByEnumeratingWithState:&v45 objects:v68 count:16];
              if (v33) {
                goto LABEL_36;
              }
              goto LABEL_42;
            }
          }
        }
        else
        {
LABEL_42:
          v31 = 0;
        }

        id v28 = v37;
        id v10 = v38;
        int v29 = v39;
      }
      else
      {
        v31 = 0;
      }
    }

    unint64_t v36 = v29;
  }
  else
  {
    v31 = 0;
    unint64_t v36 = 0;
  }
  if (a5) {
    *a5 = v36;
  }
  if (a6) {
    *a6 = v65[3];
  }
  if (a7) {
    *a7 = (id) v59[5];
  }
  if (a8) {
    *a8 = v31;
  }

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v64, 8);
}

id __146__PLResourceChooser__chooseCloudResourceTypeForFormat_asset_optimalCPLResourceType_localCPLResourceType_localCPLResourceFilePath_fileReservation___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __146__PLResourceChooser__chooseCloudResourceTypeForFormat_asset_optimalCPLResourceType_localCPLResourceType_localCPLResourceFilePath_fileReservation___block_invoke_2;
  v9[3] = &__block_descriptor_40_e35_B32__0__PLInternalResource_8Q16_B24l;
  v9[4] = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(v3, "indexOfObjectPassingTest:", v9));
  v5 = [v4 cplFileURL];
  v6 = [v5 path];

  v7 = +[PLPhotoLibrary fileReservationForFileAtPath:v6 exclusive:0];
  if (v7)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 cplType];
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v6);
  }

  return v7;
}

BOOL __146__PLResourceChooser__chooseCloudResourceTypeForFormat_asset_optimalCPLResourceType_localCPLResourceType_localCPLResourceFilePath_fileReservation___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 cplType] == *(void *)(a1 + 32);
}

+ (id)_itemMatchingFormat:(id)a3 allItems:(id)a4 acceptableSortedAlternatives:(id *)a5
{
  v37[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v8 refersToOriginalVersion])
  {
    uint64_t v10 = [a1 _originalItemFromAllItems:v9];
    goto LABEL_5;
  }
  if ([v8 refersToPenultimateVersion])
  {
    uint64_t v10 = [a1 _penultimateItemFromAllItems:v9];
LABEL_5:
    id v11 = (void *)v10;
    id v12 = 0;
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (_itemMatchingFormat_allItems_acceptableSortedAlternatives__onceToken1 != -1) {
    dispatch_once(&_itemMatchingFormat_allItems_acceptableSortedAlternatives__onceToken1, &__block_literal_global_86_51924);
  }
  uint64_t v14 = [a1 _filteredArrayUsingPredicate:_itemMatchingFormat_allItems_acceptableSortedAlternatives__displayablePredicate originalItems:v9 nonMatchingItems:0];
  int64_t v15 = [v14 sortedArrayUsingComparator:&__block_literal_global_97];
  id v16 = [v15 lastObject];
  [v8 size];
  double v18 = v17;
  double v20 = v19;
  if ((PLImageFormatSizeIsMaxSize() & 1) != 0
    || v18 > (double)[v16 width]
    || v20 > (double)[v16 height])
  {
    double v18 = (double)[v16 width];
    double v20 = (double)[v16 height];
  }
  uint64_t v33 = v16;
  if ([v8 isThumbnail]) {
    int v21 = [v8 isTable] ^ 1;
  }
  else {
    int v21 = 0;
  }
  uint64_t v22 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"width >= %f AND height >= %f", *(void *)&v18, *(void *)&v20);
  uint64_t v23 = v22;
  id v32 = v22;
  if (v21)
  {
    v24 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"type == %d", 5);
    v25 = (void *)MEMORY[0x1E4F28BA0];
    v37[0] = v23;
    v37[1] = v24;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
    id v27 = [v25 orPredicateWithSubpredicates:v26];
  }
  else
  {
    id v27 = v22;
  }
  uint64_t v34 = v15;
  id v28 = [a1 _filteredArrayUsingPredicate:v27 originalItems:v15 nonMatchingItems:0];
  uint64_t v35 = v14;
  if (_itemMatchingFormat_allItems_acceptableSortedAlternatives__onceToken2 != -1) {
    dispatch_once(&_itemMatchingFormat_allItems_acceptableSortedAlternatives__onceToken2, &__block_literal_global_102);
  }
  id v36 = 0;
  int v29 = [a1 _filteredArrayUsingPredicate:_itemMatchingFormat_allItems_acceptableSortedAlternatives__jpegPredicate originalItems:v28 nonMatchingItems:&v36];
  id v30 = v36;
  v31 = [MEMORY[0x1E4F1CA48] array];
  [v31 addObjectsFromArray:v29];
  [v31 addObjectsFromArray:v30];
  id v11 = [v31 firstObject];
  id v12 = 0;
  if ((unint64_t)[v31 count] >= 2)
  {
    [v31 removeObjectAtIndex:0];
    id v12 = v31;
  }

  if (a5) {
LABEL_6:
  }
    *a5 = v12;
LABEL_7:

  return v11;
}

void __79__PLResourceChooser__itemMatchingFormat_allItems_acceptableSortedAlternatives___block_invoke_3()
{
  v0 = (void *)MEMORY[0x1E4F28F60];
  id v3 = [(id)*MEMORY[0x1E4F44410] identifier];
  uint64_t v1 = [v0 predicateWithFormat:@"uniformTypeIdentifier UTI-EQUALS %@", v3];
  v2 = (void *)_itemMatchingFormat_allItems_acceptableSortedAlternatives__jpegPredicate;
  _itemMatchingFormat_allItems_acceptableSortedAlternatives__jpegPredicate = v1;
}

uint64_t __79__PLResourceChooser__itemMatchingFormat_allItems_acceptableSortedAlternatives___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareUsingWidth:");
}

void __79__PLResourceChooser__itemMatchingFormat_allItems_acceptableSortedAlternatives___block_invoke()
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v1 = [(id)*MEMORY[0x1E4F44498] identifier];
  v2 = [v0 predicateWithFormat:@"NOT uniformTypeIdentifier UTI-EQUALS %@", v1];

  id v3 = (void *)MEMORY[0x1E4F28F60];
  v4 = [(id)*MEMORY[0x1E4F44400] identifier];
  v5 = [v3 predicateWithFormat:@"uniformTypeIdentifier UTI-CONFORMS-TO %@", v4];

  v6 = (void *)MEMORY[0x1E4F28BA0];
  v10[0] = v2;
  v10[1] = v5;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  uint64_t v8 = [v6 andPredicateWithSubpredicates:v7];
  id v9 = (void *)_itemMatchingFormat_allItems_acceptableSortedAlternatives__displayablePredicate;
  _itemMatchingFormat_allItems_acceptableSortedAlternatives__displayablePredicate = v8;
}

+ (id)_filteredArrayUsingPredicate:(id)a3 originalItems:(id)a4 nonMatchingItems:(id *)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v7, "evaluateWithObject:", v16, (void)v19)) {
          double v17 = v9;
        }
        else {
          double v17 = v10;
        }
        [v17 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  if (a5) {
    *a5 = v10;
  }

  return v9;
}

+ (id)_penultimateItemFromAllItems:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a3;
  v5 = objc_msgSend(v3, "predicateWithFormat:", @"type == %d", 15);
  v6 = [v4 filteredArrayUsingPredicate:v5];

  if ([v6 count])
  {
    id v7 = [v6 objectAtIndexedSubscript:0];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)_originalItemFromAllItems:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a3;
  v5 = objc_msgSend(v3, "predicateWithFormat:", @"type == %d OR type == %d", 17, 1);
  v6 = [v4 filteredArrayUsingPredicate:v5];

  if ((unint64_t)[v6 count] < 2)
  {
    uint64_t v9 = [v6 count];
    uint64_t v7 = 0;
    id v8 = 0;
    if (v9 != 1) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v7 = [v6 indexOfObjectPassingTest:&__block_literal_global_81];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v8 = 0;
      goto LABEL_6;
    }
  }
  id v8 = [v6 objectAtIndexedSubscript:v7];
LABEL_6:

  return v8;
}

BOOL __47__PLResourceChooser__originalItemFromAllItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 17;
}

+ (id)fileReservationForImageFileForAsset:(id)a3 format:(id)a4 outFilePath:(id *)a5 outImageType:(int64_t *)a6
{
  id v9 = a3;
  id v10 = a4;
  int v11 = [v10 formatID];
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = __Block_byref_object_copy__51914;
  uint64_t v33 = __Block_byref_object_dispose__51915;
  id v34 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__51914;
  id v27 = __Block_byref_object_dispose__51915;
  id v28 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __89__PLResourceChooser_fileReservationForImageFileForAsset_format_outFilePath_outImageType___block_invoke;
  v22[3] = &unk_1E586B010;
  v22[4] = &v23;
  v22[5] = &v29;
  v22[6] = &v35;
  uint64_t v12 = (void (**)(void, void, void))MEMORY[0x19F38D650](v22);
  if (v11 == 9997)
  {
    uint64_t v13 = [v9 pathForPenultimateFullsizeRenderImageFile];
    ((void (**)(void, void *, uint64_t))v12)[2](v12, v13, 6);
LABEL_10:

    goto LABEL_11;
  }
  if (v11 == 10000)
  {
    uint64_t v14 = [v9 urlForSideCarImageFile];
    int64_t v15 = [v14 path];
    ((void (**)(void, void *, uint64_t))v12)[2](v12, v15, 2);

    if (v24[5]) {
      goto LABEL_11;
    }
    goto LABEL_19;
  }
  if (v11 != 9999)
  {
    uint64_t v16 = (id *)(v30 + 5);
    id obj = (id)v30[5];
    uint64_t v17 = +[PLResourceChooser fileReservationForLargeDisplayableImageFileForAsset:v9 format:v10 allowMetadataSnapshot:0 forceLarge:1 outFilePath:&obj outImageType:v36 + 3];
    objc_storeStrong(v16, obj);
    uint64_t v13 = (void *)v24[5];
    v24[5] = v17;
    goto LABEL_10;
  }
  if ([v9 isPrimaryImageFormat]
    || ([v9 pathForNonAdjustedFullsizeImageFile],
        long long v20 = objc_claimAutoreleasedReturnValue(),
        ((void (**)(void, void *, uint64_t))v12)[2](v12, v20, 3),
        v20,
        !v24[5]))
  {
LABEL_19:
    uint64_t v13 = [v9 pathForOriginalFile];
    ((void (**)(void, void *, uint64_t))v12)[2](v12, v13, 1);
    goto LABEL_10;
  }
LABEL_11:
  if (a5) {
    *a5 = (id) v30[5];
  }
  if (a6) {
    *a6 = v36[3];
  }
  id v18 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  return v18;
}

void __89__PLResourceChooser_fileReservationForImageFileForAsset_format_outFilePath_outImageType___block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (v6)
  {
    id v10 = v6;
    uint64_t v7 = +[PLPhotoLibrary fileReservationForFileAtPath:v6 exclusive:0];
    uint64_t v8 = *(void *)(a1[4] + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    id v6 = v10;
    if (*(void *)(*(void *)(a1[4] + 8) + 40))
    {
      objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
      id v6 = v10;
      *(void *)(*(void *)(a1[6] + 8) + 24) = a3;
    }
  }
}

+ (id)fileReservationForLargeDisplayableImageFileForAsset:(id)a3 format:(id)a4 allowMetadataSnapshot:(BOOL)a5 forceLarge:(BOOL)a6 outFilePath:(id *)a7 outImageType:(int64_t *)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  uint64_t v53 = 0;
  long long v54 = &v53;
  uint64_t v55 = 0x3032000000;
  long long v56 = __Block_byref_object_copy__51914;
  long long v57 = __Block_byref_object_dispose__51915;
  id v58 = 0;
  uint64_t v47 = 0;
  long long v48 = &v47;
  uint64_t v49 = 0x3032000000;
  id v50 = __Block_byref_object_copy__51914;
  v51 = __Block_byref_object_dispose__51915;
  id v52 = 0;
  uint64_t v43 = 0;
  id v44 = &v43;
  uint64_t v45 = 0x2020000000;
  uint64_t v46 = 0;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __138__PLResourceChooser_fileReservationForLargeDisplayableImageFileForAsset_format_allowMetadataSnapshot_forceLarge_outFilePath_outImageType___block_invoke;
  v42[3] = &unk_1E586B010;
  v42[4] = &v53;
  v42[5] = &v47;
  v42[6] = &v43;
  uint64_t v16 = (void (**)(void, void, void))MEMORY[0x19F38D650](v42);
  if (([v14 isCloudSharedAsset] & 1) != 0 || objc_msgSend(v14, "isStreamedVideo"))
  {
    uint64_t v17 = [v14 pathForOriginalFile];
    id v18 = (void *)v48[5];
    v48[5] = v17;

    v44[3] = 1;
  }
  else
  {
    int v26 = [v14 kind];
    if (v26)
    {
      if (v26 == 1)
      {
        id v27 = [v14 pathForVideoPreviewFile];
        ((void (**)(void, void *, void))v16)[2](v16, v27, 0);

        if (v54[5])
        {
          id v28 = PLImageManagerGetLog();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v29 = [v14 uuid];
            uint64_t v30 = v48[5];
            *(_DWORD *)buf = 138412546;
            uint64_t v60 = v29;
            __int16 v61 = 2112;
            uint64_t v62 = v30;
            uint64_t v38 = (void *)v29;
            _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEBUG, "Found video preview for asset: %@, path: %@", buf, 0x16u);
          }
        }
        else
        {
          id v28 = PLImageManagerGetLog();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v34 = [v14 uuid];
            *(_DWORD *)buf = 138412290;
            uint64_t v60 = v34;
            int v39 = (void *)v34;
            _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEBUG, "No video preview for asset: %@", buf, 0xCu);
          }
        }

        if (!v54[5])
        {
          uint64_t v35 = (id *)(v48 + 5);
          id v41 = (id)v48[5];
          uint64_t v36 = [a1 _chooseFileReservationForLargeDisplayableImageFileForAsset:v14 format:v15 forceLarge:v10 allowMetadataSnapshot:v11 outFilePath:&v41 outImageType:v44 + 3];
          objc_storeStrong(v35, v41);
          uint64_t v37 = (void *)v54[5];
          v54[5] = v36;
        }
      }
    }
    else
    {
      uint64_t v31 = (id *)(v48 + 5);
      id obj = (id)v48[5];
      uint64_t v32 = [a1 _chooseFileReservationForLargeDisplayableImageFileForAsset:v14 format:v15 forceLarge:v10 allowMetadataSnapshot:v11 outFilePath:&obj outImageType:v44 + 3];
      objc_storeStrong(v31, obj);
      uint64_t v33 = (void *)v54[5];
      v54[5] = v32;
    }
  }
  if (a7) {
    *a7 = (id) v48[5];
  }
  if (a8) {
    *a8 = v44[3];
  }
  if (v48[5])
  {
    long long v19 = PLImageManagerGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      long long v20 = [v14 uuid];
      uint64_t v21 = v44[3];
      uint64_t v22 = v48[5];
      *(_DWORD *)buf = 138412802;
      uint64_t v60 = (uint64_t)v20;
      __int16 v61 = 2048;
      uint64_t v62 = v21;
      __int16 v63 = 2112;
      uint64_t v64 = v22;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEBUG, "Finding large displayable image on disk for asset: %@, image type: %ld, path: %@", buf, 0x20u);
    }
  }
  else
  {
    long long v19 = PLImageManagerGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = [v14 uuid];
      *(_DWORD *)buf = 138412290;
      uint64_t v60 = (uint64_t)v23;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Did not find large displayable image on disk for asset: %@", buf, 0xCu);
    }
  }

  id v24 = (id)v54[5];
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v53, 8);
  return v24;
}

void __138__PLResourceChooser_fileReservationForLargeDisplayableImageFileForAsset_format_allowMetadataSnapshot_forceLarge_outFilePath_outImageType___block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (v6)
  {
    id v10 = v6;
    uint64_t v7 = +[PLPhotoLibrary fileReservationForFileAtPath:v6 exclusive:0];
    uint64_t v8 = *(void *)(a1[4] + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    id v6 = v10;
    if (*(void *)(*(void *)(a1[4] + 8) + 40))
    {
      objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
      id v6 = v10;
      *(void *)(*(void *)(a1[6] + 8) + 24) = a3;
    }
  }
}

+ (id)_chooseFileReservationForLargeDisplayableImageFileForAsset:(id)a3 format:(id)a4 forceLarge:(BOOL)a5 allowMetadataSnapshot:(BOOL)a6 outFilePath:(id *)a7 outImageType:(int64_t *)a8
{
  id v12 = a3;
  id v13 = a4;
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x3032000000;
  uint64_t v49 = __Block_byref_object_copy__51914;
  id v50 = __Block_byref_object_dispose__51915;
  id v51 = 0;
  uint64_t v40 = 0;
  id v41 = &v40;
  uint64_t v42 = 0x3032000000;
  uint64_t v43 = __Block_byref_object_copy__51914;
  id v44 = __Block_byref_object_dispose__51915;
  id v45 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v39 = 0;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __145__PLResourceChooser__chooseFileReservationForLargeDisplayableImageFileForAsset_format_forceLarge_allowMetadataSnapshot_outFilePath_outImageType___block_invoke;
  v35[3] = &unk_1E586B010;
  v35[4] = &v46;
  v35[5] = &v40;
  v35[6] = &v36;
  id v14 = (void *)MEMORY[0x19F38D650](v35);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __145__PLResourceChooser__chooseFileReservationForLargeDisplayableImageFileForAsset_format_forceLarge_allowMetadataSnapshot_outFilePath_outImageType___block_invoke_2;
  v28[3] = &unk_1E586B038;
  uint64_t v31 = &v46;
  id v15 = v12;
  id v29 = v15;
  id v16 = v14;
  BOOL v34 = a5;
  id v30 = v16;
  uint64_t v32 = &v40;
  uint64_t v33 = &v36;
  uint64_t v17 = (void (**)(void))MEMORY[0x19F38D650](v28);
  if (![v15 isOriginalSRGB] || objc_msgSend(v15, "isRAW")) {
    v17[2](v17);
  }
  id v18 = v47;
  if (!v47[5])
  {
    if (v13)
    {
      char v19 = [v13 isAlwaysFullScreen];
      id v18 = v47;
      if ((v19 & 1) == 0 && !v47[5])
      {
        long long v20 = [v15 pathForLargeThumbnailFile];
        (*((void (**)(id, void *, uint64_t))v16 + 2))(v16, v20, 9);

        id v18 = v47;
      }
    }
    if (!v18[5])
    {
      uint64_t v21 = [v15 pathForFullsizeRenderImageFile];
      (*((void (**)(id, void *, uint64_t))v16 + 2))(v16, v21, 5);

      if (!v47[5])
      {
        uint64_t v22 = [v15 pathForSubstandardFullsizeRenderImageFile];
        (*((void (**)(id, void *, uint64_t))v16 + 2))(v16, v22, 7);

        if (!v47[5] && ([v15 hasAdjustments] & 1) == 0)
        {
          uint64_t v23 = [v15 pathForNonAdjustedFullsizeImageFile];
          (*((void (**)(id, void *, uint64_t))v16 + 2))(v16, v23, 3);

          if (!v47[5]
            && ([v15 isVideo] & 1) == 0
            && __145__PLResourceChooser__chooseFileReservationForLargeDisplayableImageFileForAsset_format_forceLarge_allowMetadataSnapshot_outFilePath_outImageType___block_invoke_71(v15, 0))
          {
            id v24 = [v15 pathForOriginalFile];
            (*((void (**)(id, void *, uint64_t))v16 + 2))(v16, v24, 1);
          }
        }
      }
    }
  }
  if (!v47[5])
  {
    v17[2](v17);
    if (!v47[5]
      && ([v15 isVideo] & 1) == 0
      && __145__PLResourceChooser__chooseFileReservationForLargeDisplayableImageFileForAsset_format_forceLarge_allowMetadataSnapshot_outFilePath_outImageType___block_invoke_71(v15, 1)&& ([v15 hasAdjustments] & 1) == 0)
    {
      uint64_t v25 = [v15 pathForOriginalFile];
      (*((void (**)(id, void *, uint64_t))v16 + 2))(v16, v25, 1);
    }
  }
  if (a7) {
    *a7 = (id) v41[5];
  }
  if (a8) {
    *a8 = v37[3];
  }
  id v26 = (id)v47[5];

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
  return v26;
}

void __145__PLResourceChooser__chooseFileReservationForLargeDisplayableImageFileForAsset_format_forceLarge_allowMetadataSnapshot_outFilePath_outImageType___block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (v6)
  {
    id v10 = v6;
    uint64_t v7 = +[PLPhotoLibrary fileReservationForFileAtPath:v6 exclusive:0];
    uint64_t v8 = *(void *)(a1[4] + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    id v6 = v10;
    if (*(void *)(*(void *)(a1[4] + 8) + 40))
    {
      objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
      id v6 = v10;
      *(void *)(*(void *)(a1[6] + 8) + 24) = a3;
    }
  }
}

void __145__PLResourceChooser__chooseFileReservationForLargeDisplayableImageFileForAsset_format_forceLarge_allowMetadataSnapshot_outFilePath_outImageType___block_invoke_2(uint64_t a1)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    v2 = [*(id *)(a1 + 32) pathForLargeThumbnailFile];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      id v4 = [*(id *)(a1 + 32) pathForMediumThumbnailFile];
      (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, v4, 10);

      if (PLIsAssetsd())
      {
        v5 = objc_msgSend(*(id *)(a1 + 32), "pl_photoLibrary");
        char v6 = [v5 isCloudPhotoLibraryEnabled];

        if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
        {
          if ((v6 & 1) == 0 && *(unsigned char *)(a1 + 72) && ([*(id *)(a1 + 32) hasAdjustments] & 1) == 0)
          {
            uint64_t v7 = PLImageManagerGetLog();
            if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEBUG, "Generating \"large thumbnail file\" while servicing an image request", buf, 2u);
            }

            [*(id *)(a1 + 32) generateLargeThumbnailFileIfNecessary];
            uint64_t v8 = +[PLPhotoLibrary fileReservationForFileAtPath:v2 exclusive:0];
            id v9 = PLImageManagerGetLog();
            BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
            if (v8)
            {
              if (v10)
              {
                *(_WORD *)char v19 = 0;
                _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "Found \"large thumbnail file\" after generation", v19, 2u);
              }

              objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v8);
              uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
              id v12 = v2;
              id v13 = *(void **)(v11 + 40);
              *(void *)(v11 + 40) = v12;
              uint64_t v14 = 9;
            }
            else
            {
              if (v10)
              {
                *(_WORD *)id v18 = 0;
                _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "Did not find \"large thumbnail file\" after generation", v18, 2u);
              }

              uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
              id v16 = *(void **)(v15 + 40);
              *(void *)(v15 + 40) = 0;

              uint64_t v14 = 0;
              uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
              id v13 = *(void **)(v17 + 40);
              *(void *)(v17 + 40) = 0;
            }

            *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v14;
          }
        }
      }
    }
  }
}

uint64_t __145__PLResourceChooser__chooseFileReservationForLargeDisplayableImageFileForAsset_format_forceLarge_allowMetadataSnapshot_outFilePath_outImageType___block_invoke_71(void *a1, char a2)
{
  id v3 = a1;
  id v4 = [v3 uniformTypeIdentifier];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v4];
    uint64_t v6 = [v5 conformsToType:*MEMORY[0x1E4F44400]];

    if (a2) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if (a2) {
      goto LABEL_7;
    }
  }
  if ([v3 isRAW]) {
    uint64_t v6 = 0;
  }
LABEL_7:

  return v6;
}

@end