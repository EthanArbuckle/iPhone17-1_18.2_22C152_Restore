@interface PHAsset(PhotosUICoreAccessibility)
- (id)_faceNamesStringForAsset;
- (id)px_accessibilityLabelForStyles:()PhotosUICoreAccessibility;
@end

@implementation PHAsset(PhotosUICoreAccessibility)

- (id)_faceNamesStringForAsset
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F390A0] fetchOptionsWithPhotoLibrary:0 orObject:a1];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__194073;
  v27 = __Block_byref_object_dispose__194074;
  id v28 = (id)MEMORY[0x1E4F1CBF0];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __62__PHAsset_PhotosUICoreAccessibility___faceNamesStringForAsset__block_invoke;
  v22[3] = &unk_1E5DC38F0;
  v22[4] = &v23;
  +[PXPeopleUtilities peopleFaceTilesForAsset:a1 options:v2 completion:v22];
  v3 = (void *)[(id)v24[5] count];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F1CA70] orderedSet];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = (id)v24[5];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v19;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = [*(id *)(*((void *)&v18 + 1) + 8 * v9) person];
        if (v10)
        {
          [v5 addObject:v10];
          v11 = objc_msgSend(v10, "px_localizedName");
          if ([v11 length]) {
            [v4 addObject:v11];
          }
        }
        BOOL v12 = (unint64_t)[v4 count] < 2;

        if (!v12) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v29 count:16];
          if (v7) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    uint64_t v13 = [v4 count];
    if (v13)
    {
      if (v13 == 1)
      {
        v14 = PXLocalizedStringFromTable(@"PXFace1NamedPerson", @"PhotosUICore");
        v15 = [v4 objectAtIndexedSubscript:0];
        v3 = PXLocalizedStringWithValidatedFormat(v14, @"%ld %@");
      }
      else
      {
        v14 = PXLocalizedStringFromTable(@"PXFace2NamedPeople", @"PhotosUICore");
        v15 = [v4 objectAtIndexedSubscript:0];
        v17 = [v4 objectAtIndexedSubscript:1];
        v3 = PXLocalizedStringWithValidatedFormat(v14, @"%ld %@ %@");
      }
    }
    else
    {
      v14 = PXLocalizedStringForPeople(v5, @"PXFace0NamedPeople");
      v3 = PXLocalizedStringWithValidatedFormat(v14, @"%ld");
    }
  }
  _Block_object_dispose(&v23, 8);

  return v3;
}

- (id)px_accessibilityLabelForStyles:()PhotosUICoreAccessibility
{
  id v5 = [MEMORY[0x1E4F1CA48] array];
  if (a3)
  {
    id v6 = [a1 title];

    if (v6)
    {
      uint64_t v7 = [a1 title];
      [v5 addObject:v7];
    }
  }
  if ((a3 & 8) != 0)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F28C10];
    uint64_t v9 = [a1 creationDate];
    v10 = [v8 localizedStringFromDate:v9 dateStyle:2 timeStyle:1];

    if (v10) {
      [v5 addObject:v10];
    }

    if ((a3 & 4) == 0)
    {
LABEL_6:
      if ((a3 & 0x10) == 0) {
        goto LABEL_21;
      }
      goto LABEL_14;
    }
  }
  else if ((a3 & 4) == 0)
  {
    goto LABEL_6;
  }
  v11 = [a1 _faceNamesStringForAsset];
  if (v11) {
    [v5 addObject:v11];
  }

  if ((a3 & 0x10) != 0)
  {
LABEL_14:
    if ([a1 mediaType] == 2)
    {
      [a1 duration];
      unint64_t v13 = (unint64_t)(v12 / 3600.0);
      double v14 = v12 - (double)(3600 * v13);
      unint64_t v15 = (unint64_t)(v14 / 60.0);
      unint64_t v16 = vcvtad_u64_f64(v14 - (double)(60 * v15));
      v17 = PXLocalizedStringFromTable(@"PXCameraSettingsMediaDurationAXDescription", @"PhotosUICore");
      if (v13) {
        [NSString stringWithFormat:@"%@ %lu:%02lu:%02lu", v17, v13, v15, v16];
      }
      else {
      long long v18 = [NSString stringWithFormat:@"%@ %lu:%02lu", v17, v15, v16, v28];
      }
      if ([v18 length]) {
        [v5 addObject:v18];
      }
    }
  }
LABEL_21:
  int v19 = [a1 isFavorite];
  if ((a3 & 2) != 0 && v19)
  {
    long long v20 = PXLocalizedStringFromTable(@"PXFavoritedBadgeAXLabel", @"PhotosUICore");
    [v5 addObject:v20];
  }
  if ((a3 & 0x40) != 0)
  {
    unint64_t v21 = [a1 pixelWidth];
    if (v21 >= [a1 pixelHeight]) {
      v22 = @"PXAXStringOrientationNormal";
    }
    else {
      v22 = @"PXAXStringOrientationRotate90";
    }
    uint64_t v23 = PXLocalizedStringFromTable(v22, @"PhotosUICore");
    [v5 addObject:v23];
  }
  if ((a3 & 0x20) != 0)
  {
    [a1 fetchPropertySetsIfNeeded];
    v24 = [a1 photosOneUpProperties];
    uint64_t v25 = [v24 localizedGeoDescriptionIsHome:0];

    if (v25) {
      [v5 addObject:v25];
    }
  }
  v26 = [v5 componentsJoinedByString:@", "];

  return v26;
}

@end