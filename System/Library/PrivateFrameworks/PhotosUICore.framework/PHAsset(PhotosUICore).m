@interface PHAsset(PhotosUICore)
+ (id)addressWithoutUnitedStatesZipCode:()PhotosUICore;
+ (id)px_fetchAssetsInArray:()PhotosUICore photoLibrary:;
+ (id)px_fetchPlacesAssetsInAssetCollection:()PhotosUICore options:;
+ (id)px_orderedAssetsFromAssets:()PhotosUICore sortDescriptors:;
+ (void)px_generateResourceFilesForAssets:()PhotosUICore completionHandler:;
- (BOOL)px_isMomentSharedAsset;
- (BOOL)px_isSyndicationPhotoLibraryAsset;
- (__CFString)_deferredProcessingStringWithEnum:()PhotosUICore;
- (__CFString)_ocrStrings;
- (__CFString)_qrCodeStrings;
- (__CFString)_searchDebugStringWithPersons:()PhotosUICore;
- (__CFString)_searchDebugStringWithScenes:()PhotosUICore;
- (__CFString)_searchDebugStringWithValues:()PhotosUICore;
- (__CFString)_videoDeferredProcessingNeededString:()PhotosUICore;
- (__CFString)px_exportFilename;
- (id)_imageProcessingFlags;
- (id)_junkClassificationStringWithClassifications:()PhotosUICore;
- (id)_sceneClassificationStringWithClassifications:()PhotosUICore;
- (id)_sdClassificationStringWithClassifications:()PhotosUICore;
- (id)_userFeedbackScoreInfo;
- (id)px_adjustmentUuid;
- (id)px_coreDataBrowserURL;
- (id)px_curationDebugString;
- (id)px_curationDebugValues;
- (id)px_debugStringForValueList:()PhotosUICore;
- (id)px_detailedDebugDescriptionInLibrary:()PhotosUICore;
- (id)px_navigationURLQueryItemWithPrefix:()PhotosUICore;
- (id)px_navigationURLWithContainerCollection:()PhotosUICore;
- (id)px_searchDebugString;
- (id)px_searchDebugValues;
- (id)px_singleLineMailingAddress;
- (id)px_slHighlightWithError:()PhotosUICore;
- (id)stringMinutesTimeRangeFromTimeRange:()PhotosUICore;
- (uint64_t)px_canLoadSyndicationAttributionInfo;
- (uint64_t)px_currentVariationType;
- (uint64_t)px_displayType;
- (uint64_t)px_isSyndicatedAsset;
- (uint64_t)px_isUnsavedSyndicatedAsset;
- (uint64_t)px_shotWithNightMode;
- (uint64_t)px_wasSavedThroughExternalApp;
- (uint64_t)px_wasSavedThroughSyndication;
@end

@implementation PHAsset(PhotosUICore)

- (uint64_t)px_isUnsavedSyndicatedAsset
{
  v2 = +[PXContentSyndicationSettings sharedInstance];
  if ([v2 treatEveryAssetAsGuest])
  {
    uint64_t v5 = 1;
    goto LABEL_8;
  }
  if ([v2 dataSourceType] == 6)
  {
    uint64_t v6 = [a1 isMomentSharedAsset];
    goto LABEL_7;
  }
  if ([v2 dataSourceType] == 7)
  {
    uint64_t v5 = [a1 sourceType] == 2;
    goto LABEL_8;
  }
  v3 = [a1 photoLibrary];
  uint64_t v4 = [v3 wellKnownPhotoLibraryIdentifier];

  if (v4 != 3)
  {
    uint64_t v6 = [a1 isGuestAsset];
LABEL_7:
    uint64_t v5 = v6;
    goto LABEL_8;
  }
  [a1 fetchPropertySetsIfNeeded];
  uint64_t v5 = [a1 isSyndicatedAssetSavedToUserLibrary] ^ 1;
LABEL_8:

  return v5;
}

+ (id)px_fetchPlacesAssetsInAssetCollection:()PhotosUICore options:
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
LABEL_3:
      v8 = (void *)[v7 copy];
      goto LABEL_6;
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F390A0];
    v10 = [v6 photoLibrary];
    v11 = [v9 fetchOptionsWithPhotoLibrary:v10 orObject:0];

    [v11 setIncludePlacesSmartAlbum:1];
    v12 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:2 subtype:1000000203 options:v11];
    id v5 = [v12 firstObject];

    if (v7) {
      goto LABEL_3;
    }
  }
  v13 = [v5 photoLibrary];
  v8 = [v13 librarySpecificFetchOptions];

  objc_msgSend(v8, "setSharingFilter:", objc_msgSend(0, "sharingFilter"));
LABEL_6:
  v14 = objc_msgSend(MEMORY[0x1E4F390A0], "px_placesFetchOptionsWith:", v8);

  [v14 setChunkSizeForFetch:5000];
  v15 = [v14 sortDescriptors];

  if (!v15)
  {
    v16 = [MEMORY[0x1E4F38EB8] internalSortDescriptorForPropertyKey:@"creationDate" ascending:0];
    v23[0] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    [v14 setInternalSortDescriptors:v17];
  }
  uint64_t v18 = *MEMORY[0x1E4F39528];
  v22[0] = *MEMORY[0x1E4F394A8];
  v22[1] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  [v14 setFetchPropertySets:v19];

  v20 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v5 options:v14];

  return v20;
}

- (__CFString)_searchDebugStringWithScenes:()PhotosUICore
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    if ([v3 count])
    {
      id v5 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"\n"];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      v20 = v4;
      id obj = v4;
      uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v23 != v8) {
              objc_enumerationMutation(obj);
            }
            v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            id v11 = objc_alloc_init(MEMORY[0x1E4F28E78]);
            v12 = [v10 objectForKeyedSubscript:@"sceneIdentifier"];
            [v11 appendFormat:@"sceneIdentifier: %@\n", v12];

            v13 = [v10 objectForKeyedSubscript:@"sceneType_humanReadable"];
            v14 = [v10 objectForKeyedSubscript:@"sceneType"];
            [v11 appendFormat:@"  sceneType: %@ (%@)\n", v13, v14];

            v15 = [v10 objectForKeyedSubscript:@"label"];
            [v11 appendFormat:@"  label: %@\n", v15];

            v16 = [v10 objectForKeyedSubscript:@"synonyms"];
            [v11 appendFormat:@"  synonyms: %@\n", v16];

            v17 = [v10 objectForKeyedSubscript:@"confidence"];
            [v11 appendFormat:@"  confidence: %@\n", v17];

            uint64_t v18 = [v10 objectForKeyedSubscript:@"boundingBox"];
            [v11 appendFormat:@"  boundingBox: %@\n", v18];

            [(__CFString *)v5 appendFormat:@"%@\n", v11];
          }
          uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v7);
      }

      uint64_t v4 = v20;
    }
    else
    {
      id v5 = &stru_1F00B0030;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (__CFString)_searchDebugStringWithPersons:()PhotosUICore
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    if ([v3 count])
    {
      id v5 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"\n"];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      v19 = v4;
      id obj = v4;
      uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v22 != v8) {
              objc_enumerationMutation(obj);
            }
            v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            id v11 = objc_alloc_init(MEMORY[0x1E4F28E78]);
            v12 = [v10 objectForKeyedSubscript:@"photosPersonIdentifier"];
            [v11 appendFormat:@"photosPersonIdentifier: %@\n", v12];

            v13 = [v10 objectForKeyedSubscript:@"displayName"];
            [v11 appendFormat:@"  displayName: %@\n", v13];

            v14 = [v10 objectForKeyedSubscript:@"nameAlternatives"];
            [v11 appendFormat:@"  nameAlternatives: %@\n", v14];

            v15 = [v10 objectForKeyedSubscript:@"faceAttributes"];
            [v11 appendFormat:@"  faceAttributes: %@\n", v15];

            v16 = [v10 objectForKeyedSubscript:@"personType"];
            [v11 appendFormat:@"  personType: %@\n", v16];

            v17 = [v10 objectForKeyedSubscript:@"contactIdentifier"];
            [v11 appendFormat:@"  contactIdentifier: %@\n", v17];

            [(__CFString *)v5 appendFormat:@"%@\n", v11];
          }
          uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v7);
      }

      uint64_t v4 = v19;
    }
    else
    {
      id v5 = &stru_1F00B0030;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (__CFString)_searchDebugStringWithValues:()PhotosUICore
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    if ([v3 count])
    {
      id v5 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"\n    "];
      uint64_t v6 = [v4 componentsJoinedByString:@",\n    "];
      [(__CFString *)v5 appendString:v6];
    }
    else
    {
      id v5 = &stru_1F00B0030;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)px_searchDebugValues
{
  v2 = objc_opt_new();
  id v3 = [a1 photoLibrary];
  uint64_t v4 = [a1 localIdentifier];
  id v243 = 0;
  id v5 = [v3 searchDebugInformationForAssetLocalIdentifier:v4 error:&v243];
  id v6 = v243;

  if (v5)
  {
    uint64_t v7 = [a1 uuid];
    [v2 addValueWithLabel:v7];

    [v2 addValueWithLabel:@"GENERAL"];
    uint64_t v8 = *MEMORY[0x1E4F8B588];
    uint64_t v9 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B588]];
    v10 = (void *)v9;
    if (v9) {
      id v11 = (__CFString *)v9;
    }
    else {
      id v11 = @"(null)";
    }
    [v2 addValueWithLabel:v8 stringValue:v11];

    uint64_t v12 = *MEMORY[0x1E4F8B668];
    uint64_t v13 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B668]];
    v14 = (void *)v13;
    if (v13) {
      v15 = (__CFString *)v13;
    }
    else {
      v15 = @"(null)";
    }
    [v2 addValueWithLabel:v12 stringValue:v15];

    uint64_t v16 = *MEMORY[0x1E4F8B508];
    v17 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B508]];
    objc_msgSend(v2, "addValueWithLabel:BOOLValue:", v16, objc_msgSend(v17, "BOOLValue"));

    uint64_t v18 = *MEMORY[0x1E4F8B6D8];
    v19 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B6D8]];
    objc_msgSend(v2, "addValueWithLabel:BOOLValue:", v18, objc_msgSend(v19, "BOOLValue"));

    uint64_t v20 = *MEMORY[0x1E4F8B6A0];
    long long v21 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B6A0]];
    long long v22 = v21;
    if (v21) {
      objc_msgSend(v2, "addValueWithLabel:BOOLValue:", v20, objc_msgSend(v21, "BOOLValue"));
    }
    else {
      [v2 addValueWithLabel:v20 stringValue:@"(null)"];
    }
    uint64_t v24 = *MEMORY[0x1E4F8B570];
    long long v25 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B570]];
    id v242 = v6;
    uint64_t v240 = v20;
    v241 = v25;
    if (v25)
    {
      [v25 doubleValue];
      objc_msgSend(v2, "addValueWithLabel:doubleValue:", v24);
    }
    else
    {
      [v2 addValueWithLabel:v24 stringValue:@"(null)"];
    }
    [v2 addValueWithLabel:@"EMBEDDINGS"];
    uint64_t v26 = *MEMORY[0x1E4F8B500];
    uint64_t v27 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B500]];
    objc_msgSend(v2, "addValueWithLabel:BOOLValue:", v26, objc_msgSend(v27, "BOOLValue"));

    uint64_t v28 = *MEMORY[0x1E4F8B598];
    v29 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B598]];
    objc_msgSend(v2, "addValueWithLabel:integerValue:", v28, objc_msgSend(v29, "integerValue"));

    [v2 addValueWithLabel:@"VERSIONS"];
    uint64_t v30 = *MEMORY[0x1E4F8B688];
    v31 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B688]];
    objc_msgSend(v2, "addValueWithLabel:integerValue:", v30, objc_msgSend(v31, "integerValue"));

    uint64_t v32 = *MEMORY[0x1E4F8B5B8];
    v33 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B5B8]];
    objc_msgSend(v2, "addValueWithLabel:integerValue:", v32, objc_msgSend(v33, "integerValue"));

    uint64_t v34 = *MEMORY[0x1E4F8B618];
    v35 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B618]];
    objc_msgSend(v2, "addValueWithLabel:integerValue:", v34, objc_msgSend(v35, "integerValue"));

    uint64_t v36 = *MEMORY[0x1E4F8B610];
    v37 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B610]];
    objc_msgSend(v2, "addValueWithLabel:integerValue:", v36, objc_msgSend(v37, "integerValue"));

    uint64_t v38 = *MEMORY[0x1E4F8B658];
    v39 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B658]];
    objc_msgSend(v2, "addValueWithLabel:integerValue:", v38, objc_msgSend(v39, "integerValue"));

    uint64_t v40 = *MEMORY[0x1E4F8B660];
    v41 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B660]];
    objc_msgSend(v2, "addValueWithLabel:integerValue:", v40, objc_msgSend(v41, "integerValue"));

    uint64_t v42 = *MEMORY[0x1E4F8B540];
    v43 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B540]];
    objc_msgSend(v2, "addValueWithLabel:integerValue:", v42, objc_msgSend(v43, "integerValue"));

    uint64_t v44 = *MEMORY[0x1E4F8B608];
    v45 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B608]];
    objc_msgSend(v2, "addValueWithLabel:integerValue:", v44, objc_msgSend(v45, "integerValue"));

    uint64_t v46 = *MEMORY[0x1E4F8B620];
    v47 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B620]];
    objc_msgSend(v2, "addValueWithLabel:integerValue:", v46, objc_msgSend(v47, "integerValue"));

    [v2 addValueWithLabel:@"OTHER"];
    uint64_t v48 = *MEMORY[0x1E4F8B5C0];
    v49 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B5C0]];
    objc_msgSend(v2, "addValueWithLabel:BOOLValue:", v48, objc_msgSend(v49, "BOOLValue"));

    uint64_t v50 = *MEMORY[0x1E4F8B578];
    uint64_t v51 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B578]];
    v52 = (void *)v51;
    if (v51) {
      v53 = (__CFString *)v51;
    }
    else {
      v53 = &stru_1F00B0030;
    }
    [v2 addValueWithLabel:v50 stringValue:v53];

    uint64_t v54 = *MEMORY[0x1E4F8B590];
    v55 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B590]];
    [v55 doubleValue];
    objc_msgSend(v2, "addValueWithLabel:doubleValue:", v54);

    uint64_t v56 = *MEMORY[0x1E4F8B510];
    uint64_t v57 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B510]];
    v58 = (void *)v57;
    if (v57) {
      v59 = (__CFString *)v57;
    }
    else {
      v59 = &stru_1F00B0030;
    }
    [v2 addValueWithLabel:v56 stringValue:v59];

    uint64_t v60 = *MEMORY[0x1E4F8B548];
    uint64_t v61 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B548]];
    v62 = (void *)v61;
    if (v61) {
      v63 = (__CFString *)v61;
    }
    else {
      v63 = &stru_1F00B0030;
    }
    [v2 addValueWithLabel:v60 stringValue:v63];

    [v2 addValueWithLabel:@"SCORES"];
    uint64_t v64 = *MEMORY[0x1E4F8B580];
    v65 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B580]];
    [v65 doubleValue];
    objc_msgSend(v2, "addValueWithLabel:doubleValue:", v64);

    uint64_t v66 = *MEMORY[0x1E4F8B518];
    v67 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B518]];
    [v67 doubleValue];
    objc_msgSend(v2, "addValueWithLabel:doubleValue:", v66);

    [v2 addValueWithLabel:@"DATES"];
    uint64_t v68 = *MEMORY[0x1E4F8B550];
    uint64_t v69 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B550]];
    v70 = (void *)v69;
    if (v69) {
      v71 = (__CFString *)v69;
    }
    else {
      v71 = @"(null)";
    }
    [v2 addValueWithLabel:v68 stringValue:v71];

    uint64_t v72 = *MEMORY[0x1E4F8B558];
    v73 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B558]];
    uint64_t v74 = [v73 componentsJoinedByString:@", "];
    v75 = (void *)v74;
    if (v74) {
      v76 = (__CFString *)v74;
    }
    else {
      v76 = @"(null)";
    }
    v77 = v76;

    uint64_t v78 = *MEMORY[0x1E4F8B560];
    v79 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B560]];
    uint64_t v80 = [v79 componentsJoinedByString:@", "];
    v81 = (void *)v80;
    if (v80) {
      v82 = (__CFString *)v80;
    }
    else {
      v82 = @"(null)";
    }
    v83 = v82;

    uint64_t v84 = v72;
    v85 = v77;
    [v2 addValueWithLabel:v84 stringValue:v77];
    [v2 addValueWithLabel:v78 stringValue:v83];
    uint64_t v86 = *MEMORY[0x1E4F8B698];
    v87 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B698]];
    uint64_t v88 = [a1 _searchDebugStringWithValues:v87];
    v89 = (void *)v88;
    if (v88) {
      v90 = (__CFString *)v88;
    }
    else {
      v90 = &stru_1F00B0030;
    }
    [v2 addValueWithLabel:v86 stringValue:v90];

    uint64_t v91 = *MEMORY[0x1E4F8B640];
    v92 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B640]];
    uint64_t v93 = [a1 _searchDebugStringWithValues:v92];
    v94 = (void *)v93;
    if (v93) {
      v95 = (__CFString *)v93;
    }
    else {
      v95 = &stru_1F00B0030;
    }
    [v2 addValueWithLabel:v91 stringValue:v95];

    uint64_t v96 = *MEMORY[0x1E4F8B648];
    v97 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B648]];
    uint64_t v98 = [a1 _searchDebugStringWithValues:v97];
    v99 = (void *)v98;
    if (v98) {
      v100 = (__CFString *)v98;
    }
    else {
      v100 = &stru_1F00B0030;
    }
    [v2 addValueWithLabel:v96 stringValue:v100];

    uint64_t v101 = *MEMORY[0x1E4F8B5E0];
    v102 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B5E0]];
    uint64_t v103 = [a1 _searchDebugStringWithValues:v102];
    v104 = (void *)v103;
    if (v103) {
      v105 = (__CFString *)v103;
    }
    else {
      v105 = &stru_1F00B0030;
    }
    [v2 addValueWithLabel:v101 stringValue:v105];

    uint64_t v106 = *MEMORY[0x1E4F8B6B8];
    uint64_t v107 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B6B8]];
    v108 = (void *)v107;
    if (v107) {
      v109 = (__CFString *)v107;
    }
    else {
      v109 = @"(null)";
    }
    [v2 addValueWithLabel:v106 stringValue:v109];

    uint64_t v110 = *MEMORY[0x1E4F8B6C0];
    v111 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B6C0]];
    [v111 doubleValue];
    objc_msgSend(v2, "addValueWithLabel:doubleValue:", v110);

    [v2 addValueWithLabel:@"USER TEXT"];
    uint64_t v112 = *MEMORY[0x1E4F8B6C8];
    uint64_t v113 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B6C8]];
    v114 = (void *)v113;
    if (v113) {
      v115 = (__CFString *)v113;
    }
    else {
      v115 = &stru_1F00B0030;
    }
    [v2 addValueWithLabel:v112 stringValue:v115];

    uint64_t v116 = *MEMORY[0x1E4F8B5C8];
    uint64_t v117 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B5C8]];
    v118 = (void *)v117;
    if (v117) {
      v119 = (__CFString *)v117;
    }
    else {
      v119 = &stru_1F00B0030;
    }
    [v2 addValueWithLabel:v116 stringValue:v119];

    uint64_t v120 = *MEMORY[0x1E4F8B568];
    uint64_t v121 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B568]];
    v122 = (void *)v121;
    if (v121) {
      v123 = (__CFString *)v121;
    }
    else {
      v123 = &stru_1F00B0030;
    }
    [v2 addValueWithLabel:v120 stringValue:v123];

    uint64_t v124 = *MEMORY[0x1E4F8B5E8];
    v125 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B5E8]];
    uint64_t v126 = [a1 _searchDebugStringWithValues:v125];
    v127 = (void *)v126;
    if (v126) {
      v128 = (__CFString *)v126;
    }
    else {
      v128 = &stru_1F00B0030;
    }
    [v2 addValueWithLabel:v124 stringValue:v128];

    [v2 addValueWithLabel:@"MEDIA TYPES"];
    uint64_t v129 = *MEMORY[0x1E4F8B628];
    v130 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B628]];
    uint64_t v131 = [a1 _searchDebugStringWithValues:v130];
    v132 = (void *)v131;
    if (v131) {
      v133 = (__CFString *)v131;
    }
    else {
      v133 = &stru_1F00B0030;
    }
    [v2 addValueWithLabel:v129 stringValue:v133];

    [v2 addValueWithLabel:@"LOCATIONS"];
    uint64_t v134 = *MEMORY[0x1E4F8B670];
    v135 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B670]];
    objc_msgSend(v2, "addValueWithLabel:BOOLValue:", v134, objc_msgSend(v135, "BOOLValue"));

    v136 = [v5 objectForKeyedSubscript:v134];
    if (v136)
    {
      long long v23 = v22;
      objc_msgSend(v2, "addValueWithLabel:BOOLValue:", v240, objc_msgSend(v22, "BOOLValue"));
    }
    else
    {
      [v2 addValueWithLabel:v240 stringValue:@"(null)"];
      long long v23 = v22;
    }
    uint64_t v137 = *MEMORY[0x1E4F8B5F8];
    v138 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B5F8]];
    uint64_t v139 = [a1 _searchDebugStringWithValues:v138];
    v140 = (void *)v139;
    if (v139) {
      v141 = (__CFString *)v139;
    }
    else {
      v141 = &stru_1F00B0030;
    }
    [v2 addValueWithLabel:v137 stringValue:v141];

    [v2 addValueWithLabel:@"BUSINESSES"];
    uint64_t v142 = *MEMORY[0x1E4F8B538];
    v143 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B538]];
    uint64_t v144 = [a1 _searchDebugStringWithValues:v143];
    v145 = (void *)v144;
    if (v144) {
      v146 = (__CFString *)v144;
    }
    else {
      v146 = &stru_1F00B0030;
    }
    [v2 addValueWithLabel:v142 stringValue:v146];

    uint64_t v147 = *MEMORY[0x1E4F8B530];
    v148 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B530]];
    uint64_t v149 = [a1 _searchDebugStringWithValues:v148];
    v150 = (void *)v149;
    if (v149) {
      v151 = (__CFString *)v149;
    }
    else {
      v151 = &stru_1F00B0030;
    }
    [v2 addValueWithLabel:v147 stringValue:v151];

    [v2 addValueWithLabel:@"PUBLIC EVENTS"];
    uint64_t v152 = *MEMORY[0x1E4F8B5A8];
    v153 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B5A8]];
    uint64_t v154 = [a1 _searchDebugStringWithValues:v153];
    v155 = (void *)v154;
    if (v154) {
      v156 = (__CFString *)v154;
    }
    else {
      v156 = &stru_1F00B0030;
    }
    [v2 addValueWithLabel:v152 stringValue:v156];

    uint64_t v157 = *MEMORY[0x1E4F8B5A0];
    v158 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B5A0]];
    uint64_t v159 = [a1 _searchDebugStringWithValues:v158];
    v160 = (void *)v159;
    if (v159) {
      v161 = (__CFString *)v159;
    }
    else {
      v161 = &stru_1F00B0030;
    }
    [v2 addValueWithLabel:v157 stringValue:v161];

    uint64_t v162 = *MEMORY[0x1E4F8B5B0];
    v163 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B5B0]];
    uint64_t v164 = [a1 _searchDebugStringWithValues:v163];
    v165 = (void *)v164;
    if (v164) {
      v166 = (__CFString *)v164;
    }
    else {
      v166 = &stru_1F00B0030;
    }
    [v2 addValueWithLabel:v162 stringValue:v166];

    [v2 addValueWithLabel:@"MEANINGS"];
    uint64_t v167 = *MEMORY[0x1E4F8B600];
    v168 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B600]];
    uint64_t v169 = [a1 _searchDebugStringWithValues:v168];
    v170 = (void *)v169;
    if (v169) {
      v171 = (__CFString *)v169;
    }
    else {
      v171 = &stru_1F00B0030;
    }
    [v2 addValueWithLabel:v167 stringValue:v171];

    [v2 addValueWithLabel:@"SHARED LIBRARY"];
    uint64_t v172 = *MEMORY[0x1E4F8B5F0];
    uint64_t v173 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B5F0]];
    v174 = (void *)v173;
    if (v173) {
      v175 = (__CFString *)v173;
    }
    else {
      v175 = &stru_1F00B0030;
    }
    [v2 addValueWithLabel:v172 stringValue:v175];

    uint64_t v176 = *MEMORY[0x1E4F8B6A8];
    v177 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B6A8]];
    uint64_t v178 = [a1 _searchDebugStringWithPersons:v177];
    v179 = (void *)v178;
    if (v178) {
      v180 = (__CFString *)v178;
    }
    else {
      v180 = &stru_1F00B0030;
    }
    [v2 addValueWithLabel:v176 stringValue:v180];

    [v2 addValueWithLabel:@"SAVED FROM APP"];
    uint64_t v181 = *MEMORY[0x1E4F8B680];
    uint64_t v182 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B680]];
    v183 = (void *)v182;
    if (v182) {
      v184 = (__CFString *)v182;
    }
    else {
      v184 = &stru_1F00B0030;
    }
    [v2 addValueWithLabel:v181 stringValue:v184];

    uint64_t v185 = *MEMORY[0x1E4F8B678];
    uint64_t v186 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B678]];
    v187 = (void *)v186;
    if (v186) {
      v188 = (__CFString *)v186;
    }
    else {
      v188 = &stru_1F00B0030;
    }
    [v2 addValueWithLabel:v185 stringValue:v188];

    [v2 addValueWithLabel:@"PEOPLE"];
    uint64_t v189 = *MEMORY[0x1E4F8B650];
    v190 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B650]];
    uint64_t v191 = [a1 _searchDebugStringWithPersons:v190];
    v192 = (void *)v191;
    if (v191) {
      v193 = (__CFString *)v191;
    }
    else {
      v193 = &stru_1F00B0030;
    }
    [v2 addValueWithLabel:v189 stringValue:v193];

    [v2 addValueWithLabel:@"OCR TEXT CONTENT"];
    uint64_t v194 = *MEMORY[0x1E4F8B6B0];
    v195 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B6B0]];
    uint64_t v196 = [a1 _searchDebugStringWithValues:v195];
    v197 = (void *)v196;
    if (v196) {
      v198 = (__CFString *)v196;
    }
    else {
      v198 = &stru_1F00B0030;
    }
    [v2 addValueWithLabel:v194 stringValue:v198];

    [v2 addValueWithLabel:@"UTILITIES"];
    uint64_t v199 = *MEMORY[0x1E4F8B6D0];
    v200 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B6D0]];
    uint64_t v201 = [a1 _searchDebugStringWithValues:v200];
    v202 = (void *)v201;
    if (v201) {
      v203 = (__CFString *)v201;
    }
    else {
      v203 = &stru_1F00B0030;
    }
    [v2 addValueWithLabel:v199 stringValue:v203];

    [v2 addValueWithLabel:@"SCENES"];
    uint64_t v204 = *MEMORY[0x1E4F8B690];
    v205 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B690]];
    uint64_t v206 = [a1 _searchDebugStringWithScenes:v205];
    v207 = (void *)v206;
    if (v206) {
      v208 = (__CFString *)v206;
    }
    else {
      v208 = &stru_1F00B0030;
    }
    [v2 addValueWithLabel:v204 stringValue:v208];

    [v2 addValueWithLabel:@"ALBUMS"];
    uint64_t v209 = *MEMORY[0x1E4F8B528];
    v210 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B528]];
    uint64_t v211 = [a1 _searchDebugStringWithValues:v210];
    v212 = (void *)v211;
    if (v211) {
      v213 = (__CFString *)v211;
    }
    else {
      v213 = &stru_1F00B0030;
    }
    [v2 addValueWithLabel:v209 stringValue:v213];

    uint64_t v214 = *MEMORY[0x1E4F8B520];
    v215 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B520]];
    uint64_t v216 = [a1 _searchDebugStringWithValues:v215];
    v217 = (void *)v216;
    if (v216) {
      v218 = (__CFString *)v216;
    }
    else {
      v218 = &stru_1F00B0030;
    }
    [v2 addValueWithLabel:v214 stringValue:v218];

    [v2 addValueWithLabel:@"MEMORIES"];
    uint64_t v219 = *MEMORY[0x1E4F8B638];
    v220 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B638]];
    uint64_t v221 = [a1 _searchDebugStringWithValues:v220];
    v222 = (void *)v221;
    if (v221) {
      v223 = (__CFString *)v221;
    }
    else {
      v223 = &stru_1F00B0030;
    }
    [v2 addValueWithLabel:v219 stringValue:v223];

    uint64_t v224 = *MEMORY[0x1E4F8B630];
    v225 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B630]];
    uint64_t v226 = [a1 _searchDebugStringWithValues:v225];
    v227 = (void *)v226;
    if (v226) {
      v228 = (__CFString *)v226;
    }
    else {
      v228 = &stru_1F00B0030;
    }
    [v2 addValueWithLabel:v224 stringValue:v228];

    [v2 addValueWithLabel:@"HIGHLIGHTS"];
    uint64_t v229 = *MEMORY[0x1E4F8B5D8];
    v230 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B5D8]];
    uint64_t v231 = [a1 _searchDebugStringWithValues:v230];
    v232 = (void *)v231;
    if (v231) {
      v233 = (__CFString *)v231;
    }
    else {
      v233 = &stru_1F00B0030;
    }
    [v2 addValueWithLabel:v229 stringValue:v233];

    uint64_t v234 = *MEMORY[0x1E4F8B5D0];
    v235 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8B5D0]];
    uint64_t v236 = [a1 _searchDebugStringWithValues:v235];
    v237 = (void *)v236;
    if (v236) {
      v238 = (__CFString *)v236;
    }
    else {
      v238 = &stru_1F00B0030;
    }
    [v2 addValueWithLabel:v234 stringValue:v238];

    id v6 = v242;
  }
  else
  {
    long long v23 = [v6 description];
    [v2 addValueWithLabel:@"Error" stringValue:v23 highlightStyle:3];
  }

  return v2;
}

- (id)px_searchDebugString
{
  v2 = objc_msgSend(a1, "px_searchDebugValues");
  id v3 = objc_msgSend(a1, "px_debugStringForValueList:", v2);

  return v3;
}

- (id)px_coreDataBrowserURL
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v2 setScheme:@"coredatabrowser"];
  [v2 setPath:@"/entity/Asset/"];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"key" value:@"uuid"];
  id v4 = objc_alloc(MEMORY[0x1E4F290C8]);
  id v5 = objc_msgSend(a1, "uuid", v3);
  id v6 = (void *)[v4 initWithName:@"value" value:v5];
  v15[1] = v6;
  id v7 = objc_alloc(MEMORY[0x1E4F290C8]);
  uint64_t v8 = [a1 photoLibrary];
  uint64_t v9 = [v8 photoLibraryURL];
  v10 = [v9 absoluteString];
  id v11 = (void *)[v7 initWithName:@"storeURL" value:v10];
  v15[2] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
  [v2 setQueryItems:v12];

  uint64_t v13 = [v2 URL];

  return v13;
}

- (id)px_navigationURLWithContainerCollection:()PhotosUICore
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F29088] componentsWithString:@"photos://asset"];
  id v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  id v7 = objc_msgSend(a1, "px_navigationURLQueryItemWithPrefix:", 0);
  [v6 addObject:v7];

  if (v4)
  {
    uint64_t v8 = objc_msgSend(v4, "px_navigationURLQueryItemWithPrefix:", @"album");
    [v6 addObject:v8];
  }
  [v5 setQueryItems:v6];
  uint64_t v9 = [v5 URL];

  return v9;
}

- (id)px_navigationURLQueryItemWithPrefix:()PhotosUICore
{
  id v4 = &stru_1F00B0030;
  if (a3) {
    id v4 = a3;
  }
  id v5 = [NSString stringWithFormat:@"%@%@", v4, @"uuid"];
  id v6 = (void *)MEMORY[0x1E4F290C8];
  id v7 = [a1 uuid];
  uint64_t v8 = [v6 queryItemWithName:v5 value:v7];

  return v8;
}

- (id)_userFeedbackScoreInfo
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 photoLibrary];
  id v3 = [v2 librarySpecificFetchOptions];

  id v4 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
  [v3 setIncludedDetectionTypes:v4];

  id v5 = [MEMORY[0x1E4F391F0] fetchPersonsInAsset:a1 options:v3];
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [*(id *)(*((void *)&v25 + 1) + 8 * i) uuid];
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v32 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [a1 uuid];
  uint64_t v30 = v13;
  v31 = v6;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];

  id v15 = objc_alloc(MEMORY[0x1E4F39338]);
  uint64_t v16 = [a1 photoLibrary];
  v17 = (void *)[v15 initWithPhotoLibrary:v16];

  uint64_t v18 = [a1 uuid];
  v29 = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  [v17 scoreForAssetUUIDs:v19 personsUUIDsByAssetUUIDs:v14];
  double v21 = v20;

  long long v22 = [MEMORY[0x1E4F39338] descriptionForScore:v21];
  long long v23 = [NSString stringWithFormat:@"%@ (%.2f)", v22, *(void *)&v21, (void)v25];

  return v23;
}

- (id)_imageProcessingFlags
{
  v1 = [a1 originalImageProperties];
  id v2 = [MEMORY[0x1E4F1CA60] dictionary];
  [v2 setObject:&unk_1F02D7A38 forKeyedSubscript:@"ProcessingHighlight"];
  id v16 = 0;
  [MEMORY[0x1E4F8CC08] readMetadataType:7 fromCGImageProperties:v1 value:&v16 error:0];
  id v3 = v16;
  uint64_t v4 = [v3 integerValue];
  uint64_t v5 = v4;
  if ((v4 & 0x1000) == 0)
  {
    if ((v4 & 0x2000) != 0) {
      id v6 = @"DF Final Image";
    }
    else {
      id v6 = @"Non-Deferred";
    }
    if ((v4 & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  [v2 setObject:&unk_1F02D7A50 forKeyedSubscript:@"ProcessingHighlight"];
  id v6 = @"Proxy";
  if ((v5 & 0x8000) != 0) {
LABEL_8:
  }
    [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"SemDev"];
LABEL_9:
  id v7 = [NSString stringWithFormat:@"%@ (%d)", v6, v5];
  [v2 setObject:v7 forKeyedSubscript:@"Processing"];

  id v15 = 0;
  int v8 = [MEMORY[0x1E4F8CC08] readMetadataType:15 fromCGImageProperties:v1 value:&v15 error:0];
  id v9 = v15;
  uint64_t v10 = v9;
  if (v8 && (unsigned int v11 = [v9 intValue] - 1, v11 <= 0xB)) {
    uint64_t v12 = off_1E5DB9170[v11];
  }
  else {
    uint64_t v12 = @"Unknown";
  }
  uint64_t v13 = [NSString stringWithFormat:@"%@ (%@)", v12, v10];
  [v2 setObject:v13 forKeyedSubscript:@"Type"];

  return v2;
}

- (uint64_t)px_shotWithNightMode
{
  v1 = [a1 originalImageProperties];
  id v6 = 0;
  uint64_t v2 = [MEMORY[0x1E4F8CC08] readMetadataType:15 fromCGImageProperties:v1 value:&v6 error:0];
  id v3 = v6;
  uint64_t v4 = v3;
  if (v2) {
    uint64_t v2 = [v3 intValue] == 11;
  }

  return v2;
}

- (__CFString)_videoDeferredProcessingNeededString:()PhotosUICore
{
  id v3 = &stru_1F00B0030;
  if (a3 == 1) {
    id v3 = @"Frame Drop Recovery";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"None";
  }
}

- (__CFString)_deferredProcessingStringWithEnum:()PhotosUICore
{
  if ((a3 - 1) > 0xA) {
    return @"None";
  }
  else {
    return off_1E5DB9118[(unsigned __int16)(a3 - 1)];
  }
}

- (id)_junkClassificationStringWithClassifications:()PhotosUICore
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v5)
  {
    long long v25 = 0;
    id v7 = 0;
    long long v27 = 0;
    goto LABEL_31;
  }
  uint64_t v6 = v5;
  long long v25 = 0;
  id v7 = 0;
  long long v27 = 0;
  uint64_t v8 = *(void *)v29;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v29 != v8) {
        objc_enumerationMutation(v4);
      }
      uint64_t v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
      if (objc_msgSend(v10, "hasPrefix:", @"Junk - ", v19))
      {
        unsigned int v11 = [v10 substringFromIndex:7];
        if ([v11 hasPrefix:@"Negative"]
          && ([v11 hasPrefix:@"Negative Internal"] & 1) == 0)
        {
          id v15 = v10;

          long long v27 = v15;
        }
        else if ([v11 hasPrefix:@"Non Memorable"])
        {
          id v12 = v10;

          id v7 = v12;
        }
        else if ([v11 hasPrefix:@"Poor Quality"])
        {
          id v14 = v10;

          long long v25 = v14;
        }
        else
        {
          [v23 addObject:v10];
        }
      }
      else
      {
        if ([v10 hasPrefix:@"NSFW - "])
        {
          uint64_t v13 = v26;
        }
        else if ([v10 hasPrefix:@"TE - "])
        {
          uint64_t v13 = v24;
        }
        else if ([v10 hasPrefix:@"PL - "])
        {
          uint64_t v13 = v22;
        }
        else if ([v10 hasPrefix:@"IVS NSFW - "])
        {
          uint64_t v13 = v21;
        }
        else
        {
          if (![v10 hasPrefix:@"Meme - "]) {
            continue;
          }
          uint64_t v13 = v19;
        }
        [v13 addObject:v10];
      }
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
  }
  while (v6);
LABEL_31:

  [v23 sortUsingSelector:sel_compare_];
  [v23 insertObject:&stru_1F00B0030 atIndex:0];
  if (v25) {
    [v23 insertObject:v25 atIndex:1];
  }
  if (v7) {
    [v23 insertObject:v7 atIndex:1];
  }
  if (v27) {
    [v23 insertObject:v27 atIndex:1];
  }
  objc_msgSend(v26, "sortUsingSelector:", sel_compare_, v19);
  [v24 sortUsingSelector:sel_compare_];
  [v22 sortUsingSelector:sel_compare_];
  [v21 sortUsingSelector:sel_compare_];
  [v20 sortUsingSelector:sel_compare_];
  id v16 = (void *)[v23 mutableCopy];
  [v16 addObjectsFromArray:v26];
  [v16 addObjectsFromArray:v24];
  [v16 addObjectsFromArray:v22];
  [v16 addObjectsFromArray:v21];
  [v16 addObjectsFromArray:v20];
  v17 = [v16 componentsJoinedByString:@"\n    "];

  return v17;
}

- (id)_sdClassificationStringWithClassifications:()PhotosUICore
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned int v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        char v12 = objc_msgSend(v11, "hasPrefix:", @"SD - ", (void)v18);
        uint64_t v13 = v4;
        if ((v12 & 1) == 0)
        {
          int v14 = [v11 hasPrefix:@"City Nature - "];
          uint64_t v13 = v5;
          if (!v14) {
            continue;
          }
        }
        [v13 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  [v4 sortUsingSelector:sel_compare_];
  [v5 sortUsingSelector:sel_compare_];
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v15 addObject:&stru_1F00B0030];
  [v15 addObjectsFromArray:v4];
  [v15 addObjectsFromArray:v5];
  id v16 = [v15 componentsJoinedByString:@"\n    "];

  return v16;
}

- (id)_sceneClassificationStringWithClassifications:()PhotosUICore
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v35;
    uint64_t v23 = *(void *)v35;
    do
    {
      uint64_t v7 = 0;
      uint64_t v25 = v5;
      do
      {
        if (*(void *)v35 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v34 + 1) + 8 * v7);
        if ([v8 rangeOfString:@" - "] == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v27 = v7;
          id v9 = v24;
          uint64_t v10 = [v8 componentsSeparatedByString:@"->"];
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v38 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v31;
            do
            {
              uint64_t v14 = 0;
              id v15 = v9;
              do
              {
                if (*(void *)v31 != v13) {
                  objc_enumerationMutation(v10);
                }
                id v16 = *(id *)(*((void *)&v30 + 1) + 8 * v14);
                double v29 = 0.0;
                id v17 = v16;
                if ([v16 hasSuffix:@""]))
                {
                  long long v18 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v16];
                  id v28 = v16;
                  objc_msgSend(v18, "scanUpToString:intoString:", @" ("), &v28;
                  id v17 = v28;

                  objc_msgSend(v18, "scanString:intoString:", @"("), 0;
                  [v18 scanDouble:&v29];
                }
                id v19 = [v15 objectForKeyedSubscript:v17];
                if (!v19)
                {
                  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                  [v15 setObject:v19 forKeyedSubscript:v17];
                }
                id v9 = v19;

                if (v17 != v16)
                {
                  [v9 setObject:v16 forKeyedSubscript:@"_name"];
                  long long v20 = [NSNumber numberWithDouble:v29];
                  [v9 setObject:v20 forKeyedSubscript:@"_confidence"];
                }
                ++v14;
                id v15 = v9;
              }
              while (v12 != v14);
              uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v38 count:16];
            }
            while (v12);
          }

          uint64_t v6 = v23;
          uint64_t v5 = v25;
          uint64_t v7 = v27;
        }
        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v5);
  }

  long long v21 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"\n"];
  ProcessLevel(v21, v24, 1);

  return v21;
}

- (__CFString)_qrCodeStrings
{
  v38[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  v38[0] = objc_opt_class();
  v38[1] = objc_opt_class();
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
  uint64_t v4 = [v2 setWithArray:v3];

  if (v4)
  {
    uint64_t v5 = [a1 characterRecognitionProperties];
    uint64_t v6 = [v5 machineReadableCodeData];

    if (v6)
    {
      uint64_t v25 = a1;
      id v32 = 0;
      uint64_t v27 = v6;
      uint64_t v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v4 fromData:v6 error:&v32];
      id v26 = v32;
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v9 = v7;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v37 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v29;
        uint64_t v13 = *MEMORY[0x1E4F45BA0];
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v29 != v12) {
              objc_enumerationMutation(v9);
            }
            id v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            id v16 = [v15 symbology];
            int v17 = [v16 isEqualToString:v13];

            if (v17)
            {
              long long v18 = [v15 payloadStringValue];
              [v8 addObject:v18];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v37 count:16];
        }
        while (v11);
      }

      id v19 = [v8 componentsJoinedByString:@" "];
      if (!v19)
      {
        long long v20 = PLUIGetLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          long long v21 = [v25 uuid];
          *(_DWORD *)buf = 138543618;
          long long v34 = v21;
          __int16 v35 = 2112;
          id v36 = v26;
          _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_ERROR, "Failed to unarchive VNDocumentObservation data for asset:%{public}@ with error: %@", buf, 0x16u);
        }
        id v19 = [v26 localizedDescription];
      }

      uint64_t v6 = v27;
    }
    else
    {
      id v19 = 0;
    }
    uint64_t v23 = &stru_1F00B0030;
    if (v19) {
      uint64_t v23 = v19;
    }
    id v22 = v23;
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

- (__CFString)_ocrStrings
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (_ocrStrings_onceToken != -1) {
    dispatch_once(&_ocrStrings_onceToken, &__block_literal_global_1013);
  }
  if (_ocrStrings_observationClass)
  {
    uint64_t v2 = [a1 characterRecognitionProperties];
    id v3 = [v2 characterRecognitionData];

    if (v3)
    {
      id v13 = 0;
      uint64_t v4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:_ocrStrings_observationClass fromData:v3 error:&v13];
      id v5 = v13;
      if (v4)
      {
        uint64_t v6 = [v4 getTranscript];
      }
      else
      {
        id v9 = PLUIGetLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          uint64_t v10 = [a1 uuid];
          *(_DWORD *)buf = 138543618;
          id v15 = v10;
          __int16 v16 = 2112;
          id v17 = v5;
          _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_ERROR, "Failed to unarchive VNDocumentObservation data for asset:%{public}@ with error: %@", buf, 0x16u);
        }
        uint64_t v6 = [v5 localizedDescription];
      }
      id v8 = (__CFString *)v6;
    }
    else
    {
      id v8 = 0;
    }
    uint64_t v11 = &stru_1F00B0030;
    if (v8) {
      uint64_t v11 = v8;
    }
    uint64_t v7 = v11;
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (id)stringMinutesTimeRangeFromTimeRange:()PhotosUICore
{
  *(_OWORD *)&time.start.value = *(_OWORD *)a3;
  time.start.epoch = *(void *)(a3 + 16);
  uint64_t Seconds = (uint64_t)CMTimeGetSeconds(&time.start);
  long long v5 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)&time.start.value = *(_OWORD *)a3;
  *(_OWORD *)&time.start.epoch = v5;
  *(_OWORD *)&time.duration.timescale = *(_OWORD *)(a3 + 32);
  CMTimeRangeGetEnd(&v10, &time);
  Float64 v6 = CMTimeGetSeconds(&v10);
  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%02ld:%02ld-%02ld:%02ld", Seconds / 60, Seconds % 60, (uint64_t)v6 / 60, (uint64_t)v6 % 60);
  return v7;
}

- (id)px_curationDebugValues
{
  if (px_curationDebugValues_onceToken != -1) {
    dispatch_once(&px_curationDebugValues_onceToken, &__block_literal_global_284_95714);
  }
  uint64_t v2 = [a1 photoLibrary];
  id v3 = [a1 localIdentifier];
  v300[0] = 0;
  uint64_t v4 = [v2 curationDebugInformationForAssetLocalIdentifier:v3 error:v300];
  id v5 = v300[0];

  Float64 v6 = [v4 objectForKeyedSubscript:@"isUtility"];
  unsigned int v291 = [v6 BOOLValue];

  uint64_t v7 = [v4 objectForKeyedSubscript:@"isUtilityForMemories"];
  unsigned int v289 = [v7 BOOLValue];

  id v8 = [v4 objectForKeyedSubscript:@"isTragicFailure"];
  unsigned int v287 = [v8 BOOLValue];

  id v9 = [v4 objectForKeyedSubscript:@"avoidForKeyAsset"];
  unsigned int v283 = [v9 BOOLValue];

  uint64_t v10 = [v4 objectForKeyedSubscript:@"avoidForKeyAssetReason"];
  uint64_t v11 = [v4 objectForKeyedSubscript:@"avoidForMemoryKeyAsset"];
  unsigned int v285 = [v11 BOOLValue];

  uint64_t v12 = [v4 objectForKeyedSubscript:@"isSafeForWidgetDisplay"];
  unsigned int v281 = [v12 BOOLValue];

  id v13 = [v4 objectForKeyedSubscript:@"isBlurryMedia"];
  int v14 = [v13 BOOLValue];

  id v15 = [a1 mediaAnalysisProperties];
  [v15 blurrinessScore];
  double v17 = v16;
  uint64_t v18 = [v4 objectForKeyedSubscript:@"sharpnessThreshold"];
  [v18 doubleValue];
  uint64_t v20 = v19;

  long long v21 = @"NO";
  if (v14) {
    long long v21 = @"YES";
  }
  id v22 = @">";
  if (v14) {
    id v22 = @"<";
  }
  v269 = v21;
  uint64_t v23 = 3;
  if (!v14) {
    uint64_t v23 = 0;
  }
  uint64_t v293 = v23;
  v296 = [NSString stringWithFormat:@"%@ (%.2f %@ %.2f)", v269, *(void *)&v17, v22, v20];
  id v24 = objc_opt_new();
  uint64_t v25 = [a1 uuid];
  [v24 addValueWithLabel:v25];

  [v24 addValueWithLabel:@"General"];
  [a1 mediaType];
  id v26 = PHAssetMediaTypeDebugDescription();
  uint64_t v27 = [v26 capitalizedString];
  [v24 addValueWithLabel:@"Type" stringValue:v27];

  [a1 mediaSubtypes];
  long long v28 = PHAssetMediaSubtypesDebugDescription();
  long long v29 = [v28 capitalizedString];

  uint64_t v30 = [(__CFString *)v29 length];
  long long v31 = @"None";
  if (v30) {
    long long v31 = v29;
  }
  id v32 = v31;

  [v24 addValueWithLabel:@"Subtype" stringValue:v32];
  [v24 addValueWithLabel:@"Creation Date" stringValue:&stru_1F00B0030];
  long long v33 = (void *)px_curationDebugValues_dateFormatter;
  long long v34 = [a1 creationDate];
  __int16 v35 = [v33 stringFromDate:v34];
  [v24 addValueWithLabel:@"    UTC" stringValue:v35];

  id v36 = (void *)px_curationDebugValues_dateFormatter;
  long long v37 = [a1 localCreationDate];
  uint64_t v38 = [v36 stringFromDate:v37];

  [v24 addValueWithLabel:@"    Local" stringValue:v38];
  v39 = objc_msgSend(NSString, "stringWithFormat:", @"%dx%d", objc_msgSend(a1, "pixelWidth"), objc_msgSend(a1, "pixelHeight"));
  [v24 addValueWithLabel:@"Resolution" stringValue:v39];

  objc_msgSend(v24, "addValueWithLabel:BOOLValue:positiveValue:positiveHighlighted:negativeHighlighted:", @"Favorite", objc_msgSend(a1, "isFavorite"), 1, 1, 0);
  objc_msgSend(v24, "addValueWithLabel:BOOLValue:", @"Has Adjustments", objc_msgSend(a1, "hasAdjustments"));
  uint64_t v40 = objc_msgSend(a1, "_deferredProcessingStringWithEnum:", objc_msgSend(a1, "deferredProcessingNeeded"));
  [v24 addValueWithLabel:@"Deferred Processing Needed" stringValue:v40];

  if (![a1 deferredProcessingNeeded] && objc_msgSend(a1, "isPhoto"))
  {
    v41 = [a1 _imageProcessingFlags];
    uint64_t v42 = v41;
    if (v41)
    {
      v43 = [v41 objectForKeyedSubscript:@"Processing"];
      uint64_t v44 = [v42 objectForKeyedSubscript:@"ProcessingHighlight"];
      objc_msgSend(v24, "addValueWithLabel:stringValue:highlightStyle:", @"Final Image", v43, objc_msgSend(v44, "unsignedIntegerValue"));

      v45 = [v42 objectForKeyedSubscript:@"Type"];
      [v24 addValueWithLabel:@"Capture Type" stringValue:v45];

      uint64_t v46 = [v42 objectForKeyedSubscript:@"SemDev"];
      objc_msgSend(v24, "addValueWithLabel:BOOLValue:positiveValue:positiveHighlighted:negativeHighlighted:", @"Semantic Enhance", objc_msgSend(v46, "BOOLValue"), 1, 1, 0);
    }
  }
  v295 = (void *)v10;
  if ([a1 isPhotoIris])
  {
    v47 = objc_msgSend(a1, "_videoDeferredProcessingNeededString:", objc_msgSend(a1, "videoDeferredProcessingNeeded"));
    [v24 addValueWithLabel:@"Video Deferred Processing Needed" stringValue:v47];

    id v48 = objc_alloc(MEMORY[0x1E4F8CE20]);
    v49 = [a1 fileURLForVideoComplementFile];
    uint64_t v50 = [v49 path];
    uint64_t v51 = [a1 mainFileURL];
    v52 = [v51 path];
    v53 = (void *)[v48 initWithPathToVideo:v50 pathToImage:v52];

    uint64_t v10 = (uint64_t)v295;
    objc_msgSend(v24, "addValueWithLabel:integerValue:", @"   Frames Interpolated", (int)objc_msgSend(v53, "numberOfFramesRecoveredWithError:", 0));
  }
  objc_msgSend(v24, "addValueWithLabel:BOOLValue:", @"Spatial", objc_msgSend(a1, "isSpatialMedia"));
  objc_msgSend(v24, "addValueWithLabel:BOOLValue:", @"Included in Cloud Feeds", objc_msgSend(a1, "isIncludedInCloudFeeds"));
  [v24 addValueWithLabel:@"Utility" BOOLValue:v291 positiveValue:0 positiveHighlighted:0 negativeHighlighted:1];
  [v24 addValueWithLabel:@"Utility for Memories" BOOLValue:v289 positiveValue:0 positiveHighlighted:0 negativeHighlighted:1];
  [v24 addValueWithLabel:@"Is Tragic Failure" BOOLValue:v287 positiveValue:0 positiveHighlighted:0 negativeHighlighted:1];
  [v24 addValueWithLabel:@"Avoid For Key Asset" BOOLValue:v283 positiveValue:0 positiveHighlighted:0 negativeHighlighted:1];
  if (v10) {
    [v24 addValueWithLabel:@"\tReason" stringValue:v10 highlightStyle:3];
  }
  [v24 addValueWithLabel:@"Avoid For Memory Key Asset" BOOLValue:v285 positiveValue:0 positiveHighlighted:0 negativeHighlighted:1];
  [v24 addValueWithLabel:@"Safe For Widget Display" BOOLValue:v281 positiveValue:1 positiveHighlighted:0 negativeHighlighted:1];
  [a1 curationScore];
  objc_msgSend(v24, "addValueWithLabel:doubleValue:", @"Persisted Curation Score");
  uint64_t v54 = [v4 objectForKeyedSubscript:@"curationScoreWithContext"];
  [v54 doubleValue];
  objc_msgSend(v24, "addValueWithLabel:doubleValue:", @"    live with context");

  v55 = [v4 objectForKeyedSubscript:@"curationScoreWithoutContext"];
  [v55 doubleValue];
  objc_msgSend(v24, "addValueWithLabel:doubleValue:", @"    live without context");

  uint64_t v56 = [v4 objectForKeyedSubscript:@"curationScoreForMemories"];
  [v56 doubleValue];
  objc_msgSend(v24, "addValueWithLabel:doubleValue:", @"    for memories");

  [a1 highlightVisibilityScore];
  objc_msgSend(v24, "addValueWithLabel:doubleValue:", @"Persisted Highlight Visibility Score");
  [a1 overallAestheticScore];
  [v24 addValueWithLabel:@"Aesthetic Score" doubleValue:v57];
  v58 = [v4 objectForKeyedSubscript:@"libraryTopTierAestheticScore"];
  [v58 doubleValue];
  objc_msgSend(v24, "addValueWithLabel:doubleValue:", @"    Library Top-tier score");

  v59 = (void *)MEMORY[0x1E4F38F48];
  uint64_t v60 = *MEMORY[0x1E4F8E908];
  [a1 locationCoordinate];
  double v62 = v61;
  [a1 locationCoordinate];
  uint64_t v63 = objc_msgSend(v59, "poiGeoHashWithGeoHashSize:latitude:longitude:", v60, v62);
  uint64_t v64 = NSString;
  v65 = [a1 iconicScoreProperties];
  [v65 iconicScore];
  v292 = (void *)v63;
  v67 = [v64 stringWithFormat:@"%f (%@)", v66, v63];
  [v24 addValueWithLabel:@"Iconic Score" stringValue:v67];

  [v24 addValueWithLabel:@"Blurry" stringValue:v296 highlightStyle:v293];
  uint64_t v68 = [v4 objectForKeyedSubscript:@"squareCropScore"];
  [v68 doubleValue];
  double v70 = v69;

  [v24 addValueWithLabel:@"Square Crop Score" doubleValue:v70];
  v71 = [v4 objectForKeyedSubscript:@"3x4CropScore"];
  [v71 doubleValue];
  double v73 = v72;

  [v24 addValueWithLabel:@"3x4 Crop Score" doubleValue:v73];
  uint64_t v74 = [v4 objectForKeyedSubscript:@"3x2CropScore"];
  [v74 doubleValue];
  double v76 = v75;

  [v24 addValueWithLabel:@"3x2 Crop Score" doubleValue:v76];
  v77 = [a1 curationProperties];
  if (objc_msgSend(a1, "px_isSyndicatedAsset"))
  {
    [v24 addValueWithLabel:@"Guest Asset"];
    [v15 syndicationProcessingValue];
    uint64_t v78 = PHAssetMediaAnalysisSyndicationProcessingValueDescription();
    [v24 addValueWithLabel:@"Processing Value" stringValue:v78];

    [v15 syndicationProcessingVersion];
    v79 = PHAssetSyndicationProcessingVersionDescription();
    [v24 addValueWithLabel:@"Processing Version" stringValue:v79];

    uint64_t v80 = [v77 syndicationIdentifier];
    [v24 addValueWithLabel:@"Syndication Identifier" stringValue:v80];
  }
  v81 = [v77 importedByBundleIdentifier];
  if (v81)
  {
    [v24 addValueWithLabel:@"Imported Asset"];
    objc_msgSend(v24, "addValueWithLabel:BOOLValue:", @"Relevant", (objc_msgSend(v15, "syndicationProcessingValue") & 0x3CF1) != 0);
    [v15 syndicationProcessingValue];
    v82 = PHAssetMediaAnalysisSyndicationProcessingValueDescription();
    [v24 addValueWithLabel:@"Processing Value" stringValue:v82];

    [v15 syndicationProcessingVersion];
    v83 = PNExternalAssetRelevanceProcessingVersionDescription();
    [v24 addValueWithLabel:@"Processing Version" stringValue:v83];

    uint64_t v84 = [v77 importedByDisplayName];
    v85 = (void *)v84;
    uint64_t v86 = @"nil";
    if (v84) {
      uint64_t v86 = (__CFString *)v84;
    }
    v87 = v86;

    [v24 addValueWithLabel:@"Imported Display Name" stringValue:v87];
    [v24 addValueWithLabel:@"Imported Bundle Identifier" stringValue:v81];
  }
  v294 = v81;
  [v24 addValueWithLabel:@"User Activity"];
  uint64_t v88 = [a1 assetUserActivityProperties];
  objc_msgSend(v24, "addValueWithLabel:integerValue:", @"View Count", objc_msgSend(v88, "viewCount"));
  objc_msgSend(v24, "addValueWithLabel:integerValue:", @"Play Count", objc_msgSend(v88, "playCount"));
  v288 = v88;
  objc_msgSend(v24, "addValueWithLabel:integerValue:", @"Share Count", objc_msgSend(v88, "shareCount"));
  [v24 addValueWithLabel:@"User Behavior"];
  [v77 behavioralScore];
  double v90 = v89;
  long double v91 = fmod(v89, 0.1) * 100.0;
  v290 = v77;
  [v77 interactionScore];
  [v24 addValueWithLabel:@"Interaction Score" doubleValue:v92];
  [v24 addValueWithLabel:@"Behavioral Score" doubleValue:v90];
  [v24 addValueWithLabel:@"Semantic Score" doubleValue:(double)v91];
  [v24 addValueWithLabel:@"People"];
  uint64_t v93 = [v4 objectForKeyedSubscript:@"faceAnalysisVersions"];
  v94 = [v93 objectForKeyedSubscript:@"current"];
  uint64_t v95 = [v94 integerValue];

  v286 = v93;
  uint64_t v96 = [v93 objectForKeyedSubscript:@"latest"];
  uint64_t v97 = [v96 integerValue];

  v284 = objc_msgSend(NSString, "stringWithFormat:", @"%lu (%lu)", v95, v97);
  objc_msgSend(v24, "addValueWithLabel:stringValue:highlightStyle:", @"Face Analysis Version");
  uint64_t v98 = [v4 objectForKeyedSubscript:@"peopleNames"];
  v282 = v98;
  if ([v98 count])
  {
    v99 = NSString;
    v100 = [v98 componentsJoinedByString:@"\n    "];
    uint64_t v101 = [v99 stringWithFormat:@"\n    %@", v100];
  }
  else
  {
    uint64_t v101 = @"-";
  }
  v280 = v101;
  [v24 addValueWithLabel:@"People" stringValue:v101];
  [v24 addValueWithLabel:@"Scenes"];
  v102 = [v4 objectForKeyedSubscript:@"sceneAnalysisVersions"];
  uint64_t v103 = [v4 objectForKeyedSubscript:@"sceneTaxonomyDigest"];
  v104 = [v102 objectForKeyedSubscript:@"current"];
  uint64_t v105 = [v104 integerValue];

  v279 = v102;
  uint64_t v106 = [v102 objectForKeyedSubscript:@"latest"];
  uint64_t v107 = [v106 integerValue];

  v278 = objc_msgSend(NSString, "stringWithFormat:", @"%lu (%lu)", v105, v107);
  objc_msgSend(v24, "addValueWithLabel:stringValue:highlightStyle:", @"Scene Analysis Version");
  if ((unint64_t)[(__CFString *)v103 length] >= 8)
  {
    uint64_t v108 = [(__CFString *)v103 substringToIndex:8];

    uint64_t v103 = (__CFString *)v108;
  }
  uint64_t v109 = [(__CFString *)v103 length];
  uint64_t v110 = @"unavailable";
  if (v109) {
    uint64_t v110 = v103;
  }
  v111 = v110;

  [v24 addValueWithLabel:@"Taxonomy Digest Prefix" stringValue:v111];
  [v24 addValueWithLabel:@"Sceneprint distances" stringValue:&stru_1F00B0030];
  uint64_t v112 = [v4 objectForKeyedSubscript:@"sceneprintDistanceToPreviousAsset"];
  uint64_t v113 = (void *)v112;
  if (v112) {
    v114 = (__CFString *)v112;
  }
  else {
    v114 = @"-";
  }
  [v24 addValueWithLabel:@"    to previous" stringValue:v114];

  uint64_t v115 = [v4 objectForKeyedSubscript:@"sceneprintDistanceToNextAsset"];
  uint64_t v116 = (void *)v115;
  if (v115) {
    uint64_t v117 = (__CFString *)v115;
  }
  else {
    uint64_t v117 = @"-";
  }
  [v24 addValueWithLabel:@"    to next:" stringValue:v117];

  uint64_t v118 = [v4 objectForKeyedSubscript:@"classification"];
  v276 = [a1 _sceneClassificationStringWithClassifications:v118];
  objc_msgSend(v24, "addValueWithLabel:stringValue:", @"Scene Classifications");
  v275 = [a1 _junkClassificationStringWithClassifications:v118];
  objc_msgSend(v24, "addValueWithLabel:stringValue:", @"Junk Classifications");
  v277 = (void *)v118;
  v274 = [a1 _sdClassificationStringWithClassifications:v118];
  objc_msgSend(v24, "addValueWithLabel:stringValue:", @"\nSD City Nature Classifications");
  [v24 addValueWithLabel:@"Media Analysis"];
  uint64_t v119 = [v15 mediaAnalysisTimeStamp];
  objc_msgSend(v24, "addValueWithLabel:integerValue:", @"ImageVersion", (int)objc_msgSend(v15, "mediaAnalysisImageVersion"));
  objc_msgSend(v24, "addValueWithLabel:integerValue:", @"Version", objc_msgSend(v15, "mediaAnalysisVersion"));
  if (v119)
  {
    uint64_t v120 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v119 dateStyle:1 timeStyle:1];
    [v24 addValueWithLabel:@"Timestamp" stringValue:v120];
  }
  else
  {
    [v24 addValueWithLabel:@"Timestamp" stringValue:@"(null)" highlightStyle:2];
  }
  [v15 autoplaySuggestionScore];
  [v24 addValueWithLabel:@"Autoplay Suggestion" doubleValue:v121];
  [v15 videoStickerSuggestionScore];
  [v24 addValueWithLabel:@"Live Sticker Suggestion" doubleValue:v122];
  if (v15) {
    [v15 bestKeyFrameTime];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  [v24 addValueWithLabel:@"Best Key Frame Time" doubleValue:CMTimeGetSeconds(&time)];
  if (v15) {
    [v15 bestVideoTimeRange];
  }
  else {
    memset(v298, 0, sizeof(v298));
  }
  v123 = [a1 stringMinutesTimeRangeFromTimeRange:v298];
  [v24 addValueWithLabel:@"Best Video Time Range" stringValue:v123];

  v273 = (void *)v119;
  if (v15) {
    [v15 animatedStickerTimeRange];
  }
  else {
    memset(v297, 0, sizeof(v297));
  }
  uint64_t v124 = [a1 stringMinutesTimeRangeFromTimeRange:v297];
  [v24 addValueWithLabel:@"Best Animated Sticker Time Range" stringValue:v124];

  [v15 bestPlaybackRect];
  uint64_t v129 = [NSString stringWithFormat:@"{{%.*f, %.*f}, {%.*f, %.*f}}", 3, v125, 3, v126, 3, v127, 3, v128];
  [v24 addValueWithLabel:@"Best Playback Rect" stringValue:v129];

  [v15 videoScore];
  [v24 addValueWithLabel:@"Video Score" doubleValue:v130];
  [v15 audioScore];
  [v24 addValueWithLabel:@"Audio Score" doubleValue:v131];
  [v15 activityScore];
  [v24 addValueWithLabel:@"Activity Score" doubleValue:v132];
  objc_msgSend(v24, "addValueWithLabel:doubleValue:", @"Video Face Count", (double)(unint64_t)objc_msgSend(v15, "faceCount"));
  [v15 audioClassification];
  v272 = PHAssetMediaAnalysisStringsWithMultipleAudioClassifications();
  v133 = [v272 componentsJoinedByString:@" | "];
  [v24 addValueWithLabel:@"Audio Classification" stringValue:v133];

  [v15 blurrinessScore];
  [v24 addValueWithLabel:@"Sharpness" doubleValue:v134];
  [v15 exposureScore];
  [v24 addValueWithLabel:@"Exposure" doubleValue:v135];
  [v15 wallpaperScore];
  [v24 addValueWithLabel:@"Wallpaper" doubleValue:v136];
  [v15 settlingEffectScore];
  [v24 addValueWithLabel:@"SettlingEffectScore" doubleValue:v137];
  objc_msgSend(v24, "addValueWithLabel:doubleValue:", @"ProbableRotationDirection", (double)(int)objc_msgSend(v15, "probableRotationDirection"));
  [v15 probableRotationDirectionConfidence];
  [v24 addValueWithLabel:@"\tConfidence" doubleValue:v138];
  [v24 addValueWithLabel:@"Aesthetic Scores"];
  uint64_t v139 = [a1 aestheticProperties];
  [v139 wellFramedSubjectScore];
  [v24 addValueWithLabel:@"Well framed subject" highlightedScore:v140];
  [v139 wellChosenSubjectScore];
  [v24 addValueWithLabel:@"Well chosen background" highlightedScore:v141];
  [v139 tastefullyBlurredScore];
  [v24 addValueWithLabel:@"Tastefully blurred" highlightedScore:v142];
  [v139 sharplyFocusedSubjectScore];
  [v24 addValueWithLabel:@"Sharply focused subject" highlightedScore:v143];
  [v139 wellTimedShotScore];
  [v24 addValueWithLabel:@"Well timed shot" highlightedScore:v144];
  [v139 pleasantLightingScore];
  [v24 addValueWithLabel:@"Pleasant lighting" highlightedScore:v145];
  [v139 pleasantReflectionsScore];
  [v24 addValueWithLabel:@"Pleasant reflection" highlightedScore:v146];
  [v139 harmoniousColorScore];
  [v24 addValueWithLabel:@"Harmonious color" highlightedScore:v147];
  [v139 livelyColorScore];
  [v24 addValueWithLabel:@"Lively color" highlightedScore:v148];
  [v139 pleasantSymmetryScore];
  [v24 addValueWithLabel:@"Pleasant symmetry" highlightedScore:v149];
  [v139 pleasantPatternScore];
  [v24 addValueWithLabel:@"Pleasant pattern" highlightedScore:v150];
  [v139 immersivenessScore];
  [v24 addValueWithLabel:@"Immersiveness" highlightedScore:v151];
  [v139 pleasantPerspectiveScore];
  [v24 addValueWithLabel:@"Pleasant perspective" highlightedScore:v152];
  [v139 pleasantPostProcessingScore];
  [v24 addValueWithLabel:@"Pleasant postprocessing" highlightedScore:v153];
  [v139 noiseScore];
  [v24 addValueWithLabel:@"Noise" highlightedScore:v154];
  [v139 failureScore];
  [v24 addValueWithLabel:@"Failure" highlightedScore:v155];
  [v139 pleasantCompositionScore];
  [v24 addValueWithLabel:@"Pleasant composition" highlightedScore:v156];
  [v139 interestingSubjectScore];
  [v24 addValueWithLabel:@"Interesting subject" highlightedScore:v157];
  [v139 intrusiveObjectPresenceScore];
  [v24 addValueWithLabel:@"Intrusive object presence" highlightedScore:v158];
  [v139 pleasantCameraTiltScore];
  [v24 addValueWithLabel:@"Pleasant camera tilt" highlightedScore:v159];
  [v139 lowLight];
  [v24 addValueWithLabel:@"Low light" highlightedScore:v160];
  [v24 addValueWithLabel:@"Miscellaneous"];
  [a1 preferredCropRect];
  v165 = [NSString stringWithFormat:@"{{%.*f, %.*f}, {%.*f, %.*f}}", 3, v161, 3, v162, 3, v163, 3, v164];
  [v24 addValueWithLabel:@"Preferred Crop Rect" stringValue:v165];

  [a1 acceptableCropRect];
  v170 = [NSString stringWithFormat:@"{{%.*f, %.*f}, {%.*f, %.*f}}", 3, v166, 3, v167, 3, v168, 3, v169];
  [v24 addValueWithLabel:@"Acceptable Crop Rect" stringValue:v170];

  if ([a1 isPhotoIris])
  {
    v171 = NSString;
    uint64_t v172 = [a1 variationSuggestionStatesDetails];
    uint64_t v173 = [v171 stringWithFormat:@"%@", v172];

    if (v173)
    {
      [v24 addValueWithLabel:@"Variation Suggestions" stringValue:v173];
    }
  }
  v174 = [a1 croppingDebugDescription];
  [v24 addValueWithLabel:@"Crop Scores" stringValue:v174];

  v175 = [a1 _userFeedbackScoreInfo];
  [v24 addValueWithLabel:@"User Feedback Score" stringValue:v175];

  [v24 addValueWithLabel:@"OCR"];
  uint64_t v176 = NSString;
  v177 = [a1 characterRecognitionProperties];
  uint64_t v178 = objc_msgSend(v176, "stringWithFormat:", @"%ld", objc_msgSend(v177, "algorithmVersion"));
  [v24 addValueWithLabel:@"algorithmVersion" stringValue:v178];

  v179 = [a1 characterRecognitionProperties];
  v180 = [v179 adjustmentVersion];

  if (v180)
  {
    uint64_t v181 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v180 dateStyle:1 timeStyle:1];
    [v24 addValueWithLabel:@"adjustmentVersion" stringValue:v181];
  }
  uint64_t v182 = [a1 _ocrStrings];
  [v24 addValueWithLabel:@"Text" stringValue:v182];

  v183 = [a1 _qrCodeStrings];
  [v24 addValueWithLabel:@"Codes" stringValue:v183];

  [v24 addValueWithLabel:@"Visual Search"];
  v184 = NSString;
  uint64_t v185 = [a1 visualSearchProperties];
  uint64_t v186 = objc_msgSend(v184, "stringWithFormat:", @"%ld", objc_msgSend(v185, "algorithmVersion"));
  [v24 addValueWithLabel:@"algorithmVersion" stringValue:v186];

  v187 = [a1 visualSearchProperties];
  v188 = [v187 adjustmentVersion];

  if (v188)
  {
    uint64_t v189 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v188 dateStyle:1 timeStyle:1];
    [v24 addValueWithLabel:@"adjustmentVersion" stringValue:v189];
  }
  v190 = [a1 visualSearchProperties];
  [v190 stickerConfidenceScore];
  [v24 addValueWithLabel:@"Sticker Confidence Score" doubleValue:v191];

  if (v4)
  {
    [v24 addValueWithLabel:@"Wallpaper Suggestions"];
    v192 = [v4 objectForKeyedSubscript:@"WSTopPeoplePortraitReason"];
    v193 = [v4 objectForKeyedSubscript:@"WSTopPeoplePortraitPass"];
    if ([v193 BOOLValue]) {
      uint64_t v194 = 1;
    }
    else {
      uint64_t v194 = 2;
    }
    [v24 addValueWithLabel:@"Top People Portrait" stringValue:v192 highlightStyle:v194];

    v195 = [v4 objectForKeyedSubscript:@"WSTopPeopleLandscapeReason"];
    uint64_t v196 = [v4 objectForKeyedSubscript:@"WSTopPeopleLandscapePass"];
    if ([v196 BOOLValue]) {
      uint64_t v197 = 1;
    }
    else {
      uint64_t v197 = 2;
    }
    [v24 addValueWithLabel:@"Top People Landscape" stringValue:v195 highlightStyle:v197];

    v198 = [v4 objectForKeyedSubscript:@"WSTopPetPortraitReason"];
    uint64_t v199 = [v4 objectForKeyedSubscript:@"WSTopPetPortraitPass"];
    if ([v199 BOOLValue]) {
      uint64_t v200 = 1;
    }
    else {
      uint64_t v200 = 2;
    }
    [v24 addValueWithLabel:@"Top Pet Portrait" stringValue:v198 highlightStyle:v200];

    uint64_t v201 = [v4 objectForKeyedSubscript:@"WSTopPetLandscapeReason"];
    v202 = [v4 objectForKeyedSubscript:@"WSTopPetLandscapePass"];
    if ([v202 BOOLValue]) {
      uint64_t v203 = 1;
    }
    else {
      uint64_t v203 = 2;
    }
    [v24 addValueWithLabel:@"Top Pet Landscape" stringValue:v201 highlightStyle:v203];

    uint64_t v204 = [v4 objectForKeyedSubscript:@"WSTopNaturePortraitReason"];
    v205 = [v4 objectForKeyedSubscript:@"WSTopNaturePortraitPass"];
    if ([v205 BOOLValue]) {
      uint64_t v206 = 1;
    }
    else {
      uint64_t v206 = 2;
    }
    [v24 addValueWithLabel:@"Top Nature Portrait" stringValue:v204 highlightStyle:v206];

    v207 = [v4 objectForKeyedSubscript:@"WSTopNatureLandscapeReason"];
    v208 = [v4 objectForKeyedSubscript:@"WSTopNatureLandscapePass"];
    if ([v208 BOOLValue]) {
      uint64_t v209 = 1;
    }
    else {
      uint64_t v209 = 2;
    }
    [v24 addValueWithLabel:@"Top Nature Landscape" stringValue:v207 highlightStyle:v209];

    v210 = [v4 objectForKeyedSubscript:@"WSTopCityscapePortraitReason"];
    uint64_t v211 = [v4 objectForKeyedSubscript:@"WSTopCityscapePortraitPass"];
    if ([v211 BOOLValue]) {
      uint64_t v212 = 1;
    }
    else {
      uint64_t v212 = 2;
    }
    [v24 addValueWithLabel:@"Top City Portrait" stringValue:v210 highlightStyle:v212];

    v213 = [v4 objectForKeyedSubscript:@"WSTopCityscapeLandscapeReason"];
    uint64_t v214 = [v4 objectForKeyedSubscript:@"WSTopCityscapeLandscapePass"];
    if ([v214 BOOLValue]) {
      uint64_t v215 = 1;
    }
    else {
      uint64_t v215 = 2;
    }
    [v24 addValueWithLabel:@"Top City Landscape" stringValue:v213 highlightStyle:v215];

    uint64_t v216 = [v4 objectForKeyedSubscript:@"WSPeoplePortraitReason"];
    v217 = [v4 objectForKeyedSubscript:@"WSPeoplePortraitPass"];
    if ([v217 BOOLValue]) {
      uint64_t v218 = 1;
    }
    else {
      uint64_t v218 = 2;
    }
    [v24 addValueWithLabel:@"People Portrait" stringValue:v216 highlightStyle:v218];

    uint64_t v219 = [v4 objectForKeyedSubscript:@"WSPeopleLandscapeReason"];
    v220 = [v4 objectForKeyedSubscript:@"WSPeopleLandscapePass"];
    if ([v220 BOOLValue]) {
      uint64_t v221 = 1;
    }
    else {
      uint64_t v221 = 2;
    }
    [v24 addValueWithLabel:@"People Landscape" stringValue:v219 highlightStyle:v221];

    v222 = [v4 objectForKeyedSubscript:@"WSPetPortraitReason"];
    v223 = [v4 objectForKeyedSubscript:@"WSPetPortraitPass"];
    if ([v223 BOOLValue]) {
      uint64_t v224 = 1;
    }
    else {
      uint64_t v224 = 2;
    }
    [v24 addValueWithLabel:@"Pet Portrait" stringValue:v222 highlightStyle:v224];

    v225 = [v4 objectForKeyedSubscript:@"WSPetLandscapeReason"];
    uint64_t v226 = [v4 objectForKeyedSubscript:@"WSPetLandscapePass"];
    if ([v226 BOOLValue]) {
      uint64_t v227 = 1;
    }
    else {
      uint64_t v227 = 2;
    }
    [v24 addValueWithLabel:@"Pet Landscape" stringValue:v225 highlightStyle:v227];

    v228 = [v4 objectForKeyedSubscript:@"WSNaturePortraitReason"];
    uint64_t v229 = [v4 objectForKeyedSubscript:@"WSNaturePortraitPass"];
    if ([v229 BOOLValue]) {
      uint64_t v230 = 1;
    }
    else {
      uint64_t v230 = 2;
    }
    [v24 addValueWithLabel:@"Nature Portrait" stringValue:v228 highlightStyle:v230];

    uint64_t v231 = [v4 objectForKeyedSubscript:@"WSNatureLandscapeReason"];
    v232 = [v4 objectForKeyedSubscript:@"WSNatureLandscapePass"];
    if ([v232 BOOLValue]) {
      uint64_t v233 = 1;
    }
    else {
      uint64_t v233 = 2;
    }
    [v24 addValueWithLabel:@"Nature Landscape" stringValue:v231 highlightStyle:v233];

    uint64_t v234 = [v4 objectForKeyedSubscript:@"WSCityscapePortraitReason"];
    v235 = [v4 objectForKeyedSubscript:@"WSCityscapePortraitPass"];
    if ([v235 BOOLValue]) {
      uint64_t v236 = 1;
    }
    else {
      uint64_t v236 = 2;
    }
    [v24 addValueWithLabel:@"City Portrait" stringValue:v234 highlightStyle:v236];

    v237 = [v4 objectForKeyedSubscript:@"WSCityscapeLandscapeReason"];
    v238 = [v4 objectForKeyedSubscript:@"WSCityscapeLandscapePass"];
    if ([v238 BOOLValue]) {
      uint64_t v239 = 1;
    }
    else {
      uint64_t v239 = 2;
    }
    [v24 addValueWithLabel:@"City Landscape" stringValue:v237 highlightStyle:v239];

    uint64_t v240 = [v4 objectForKeyedSubscript:@"WSSettlingEffectPortraitReason"];
    v241 = [v4 objectForKeyedSubscript:@"WSSettlingEffectPortraitPass"];
    if ([v241 BOOLValue]) {
      uint64_t v242 = 1;
    }
    else {
      uint64_t v242 = 2;
    }
    [v24 addValueWithLabel:@"Settling Effect Portrait" stringValue:v240 highlightStyle:v242];

    id v243 = [v4 objectForKeyedSubscript:@"WSSettlingEffectLandscapeReason"];
    v244 = [v4 objectForKeyedSubscript:@"WSSettlingEffectLandscapePass"];
    if ([v244 BOOLValue]) {
      uint64_t v245 = 1;
    }
    else {
      uint64_t v245 = 2;
    }
    [v24 addValueWithLabel:@"Settling Effect Landscape" stringValue:v243 highlightStyle:v245];

    v246 = [v4 objectForKeyedSubscript:@"WSMePortraitReason"];
    v247 = [v4 objectForKeyedSubscript:@"WSMePortraitPass"];
    if ([v247 BOOLValue]) {
      uint64_t v248 = 1;
    }
    else {
      uint64_t v248 = 2;
    }
    [v24 addValueWithLabel:@"Me Portrait" stringValue:v246 highlightStyle:v248];

    v249 = [v4 objectForKeyedSubscript:@"WSMeLandscapeReason"];
    v250 = [v4 objectForKeyedSubscript:@"WSMeLandscapePass"];
    if ([v250 BOOLValue]) {
      uint64_t v251 = 1;
    }
    else {
      uint64_t v251 = 2;
    }
    [v24 addValueWithLabel:@"Me Landscape" stringValue:v249 highlightStyle:v251];

    v252 = [v4 objectForKeyedSubscript:@"NSWallpaperPropertiesVersions"];
    v253 = v252;
    if (v252)
    {
      v254 = [v252 objectForKeyedSubscript:@"current"];
      uint64_t v255 = [v254 integerValue];

      v256 = [v253 objectForKeyedSubscript:@"persisted"];
      v271 = v139;
      v257 = v4;
      v258 = v15;
      v259 = v188;
      v260 = v180;
      uint64_t v261 = [v256 integerValue];

      uint64_t v262 = 1;
      if (v261 != v255) {
        uint64_t v262 = 2;
      }
      if (v261) {
        uint64_t v263 = v262;
      }
      else {
        uint64_t v263 = 3;
      }
      uint64_t v270 = v261;
      v180 = v260;
      v188 = v259;
      id v15 = v258;
      uint64_t v4 = v257;
      uint64_t v139 = v271;
      v264 = objc_msgSend(NSString, "stringWithFormat:", @"%lu (%lu)", v270, v255);
      [v24 addValueWithLabel:@"\nWallpaper Properties Version" stringValue:v264 highlightStyle:v263];
      v265 = [v4 objectForKeyedSubscript:@"NSWallpaperPropertiesTimestamp"];
      [v24 addValueWithLabel:@"Time stamp" stringValue:v265];

      v266 = [v4 objectForKeyedSubscript:@"NSWallpaperProperties"];
      v267 = [v266 description];
      [v24 addValueWithLabel:@"Properties" stringValue:v267];

      v81 = v294;
    }
  }
  return v24;
}

- (id)px_curationDebugString
{
  uint64_t v2 = objc_msgSend(a1, "px_curationDebugValues");
  id v3 = objc_msgSend(a1, "px_debugStringForValueList:", v2);

  return v3;
}

- (id)px_detailedDebugDescriptionInLibrary:()PhotosUICore
{
  id v5 = a3;
  if (!v5)
  {
    int v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"PHAsset+PhotosUICore.m", 424, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  Float64 v6 = objc_opt_new();
  uint64_t v7 = objc_msgSend(a1, "_deferredProcessingStringWithEnum:", objc_msgSend(a1, "deferredProcessingNeeded"));
  [v6 appendFormat:@"Deferred Processing Details: %@", v7];

  if (![a1 deferredProcessingNeeded] && objc_msgSend(a1, "isPhoto"))
  {
    id v8 = [a1 _imageProcessingFlags];
    id v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 objectForKeyedSubscript:@"Processing"];
      [v6 appendFormat:@"\nFinal Image: %@", v10];

      uint64_t v11 = [v9 objectForKeyedSubscript:@"Type"];
      [v6 appendFormat:@"\nCapture Type: %@", v11];
    }
  }
  [v6 appendString:@"\n\n"];
  uint64_t v12 = [a1 detailedDebugDescriptionInLibrary:v5];
  [v6 appendString:v12];

  return v6;
}

- (__CFString)px_exportFilename
{
  uint64_t v2 = [a1 originalFilename];
  if (![(__CFString *)v2 length])
  {
    uint64_t v3 = [a1 filename];

    uint64_t v2 = (__CFString *)v3;
  }
  if (![(__CFString *)v2 length])
  {

    uint64_t v2 = @"unknown";
  }
  return v2;
}

- (id)px_debugStringForValueList:()PhotosUICore
{
  v96[3] = *MEMORY[0x1E4F143B8];
  id obja = a3;
  id v65 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  uint64_t v3 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  uint64_t v4 = (void *)[v3 mutableCopy];

  [v4 setAlignment:1];
  id v5 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  Float64 v6 = (void *)[v5 mutableCopy];

  [v6 setAlignment:1];
  [v6 setParagraphSpacing:3.0];
  uint64_t v7 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  id v8 = (void *)[v7 mutableCopy];

  [v8 setAlignment:0];
  [v8 setFirstLineHeadIndent:0.0];
  [v8 setHeadIndent:10.0];
  id v9 = (void *)MEMORY[0x1E4FB08E0];
  [MEMORY[0x1E4FB08E0] systemFontSize];
  uint64_t v10 = objc_msgSend(v9, "boldSystemFontOfSize:");
  v58 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.7 blue:0.0 alpha:1.0];
  float v57 = [MEMORY[0x1E4FB1618] colorWithRed:0.8 green:0.0 blue:0.0 alpha:1.0];
  uint64_t v56 = [MEMORY[0x1E4FB1618] colorWithRed:0.8 green:0.5 blue:0.0 alpha:1.0];
  uint64_t v12 = *MEMORY[0x1E4FB0738];
  v94[0] = *MEMORY[0x1E4FB06F8];
  uint64_t v11 = v94[0];
  v94[1] = v12;
  v96[0] = v10;
  v96[1] = v4;
  v55 = v4;
  uint64_t v95 = *MEMORY[0x1E4FB0700];
  uint64_t v13 = v95;
  int v14 = [MEMORY[0x1E4FB1618] lightGrayColor];
  v96[2] = v14;
  uint64_t v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v96 forKeys:v94 count:3];

  v92[0] = v11;
  v92[1] = v12;
  v93[0] = v10;
  v93[1] = v6;
  uint64_t v54 = v6;
  v92[2] = v13;
  id v15 = [MEMORY[0x1E4FB1618] labelColor];
  v93[2] = v15;
  uint64_t v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:v92 count:3];

  v90[0] = v11;
  float v16 = (void *)MEMORY[0x1E4FB08E0];
  [MEMORY[0x1E4FB08E0] systemFontSize];
  double v17 = objc_msgSend(v16, "systemFontOfSize:");
  v91[0] = v17;
  v91[1] = v8;
  v90[1] = v12;
  v90[2] = v13;
  uint64_t v18 = [MEMORY[0x1E4FB1618] labelColor];
  v91[2] = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:3];

  v88[0] = v11;
  v88[1] = v12;
  v52 = (void *)v10;
  v53 = v8;
  v89[0] = v10;
  v89[1] = v8;
  v88[2] = v13;
  uint64_t v20 = [MEMORY[0x1E4FB1618] labelColor];
  v89[2] = v20;
  long long v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:v88 count:3];

  id v22 = (void *)[v21 mutableCopy];
  uint64_t v86 = v13;
  v87 = v58;
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
  double v61 = v22;
  [v22 addEntriesFromDictionary:v23];

  id v24 = (void *)[v21 mutableCopy];
  uint64_t v84 = v13;
  v85 = v57;
  uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
  uint64_t v60 = v24;
  [v24 addEntriesFromDictionary:v25];

  id v26 = (void *)[v21 mutableCopy];
  uint64_t v82 = v13;
  v83 = v56;
  uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
  v59 = v26;
  [v26 addEntriesFromDictionary:v27];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PHAsset_PhotosUICore__px_debugStringForValueList___block_invoke;
  aBlock[3] = &unk_1E5DB90D0;
  id v51 = v64;
  id v78 = v51;
  id v28 = v65;
  id v79 = v28;
  id v50 = v63;
  id v80 = v50;
  long long v29 = (void (**)(void *, id))_Block_copy(aBlock);
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __52__PHAsset_PhotosUICore__px_debugStringForValueList___block_invoke_2;
  v73[3] = &unk_1E5DB90D0;
  id v49 = v19;
  id v74 = v49;
  id v66 = v28;
  id v75 = v66;
  id v62 = v21;
  id v76 = v62;
  uint64_t v30 = (void (**)(void *, id))_Block_copy(v73);
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id obj = obja;
  uint64_t v31 = [obj countByEnumeratingWithState:&v69 objects:v81 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v70;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v70 != v33) {
          objc_enumerationMutation(obj);
        }
        __int16 v35 = *(void **)(*((void *)&v69 + 1) + 8 * v34);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        objc_msgSend(v35, "label", v49, v50, v51);
        id v37 = (id)objc_claimAutoreleasedReturnValue();
        if (isKindOfClass)
        {
          v30[2](v30, v37);

          id v37 = v35;
          uint64_t v38 = [v37 highlightStyle];
          v39 = v62;
          switch(v38)
          {
            case 0:
              goto LABEL_12;
            case 1:
              v39 = v61;
              goto LABEL_12;
            case 2:
              v39 = v59;
              goto LABEL_12;
            case 3:
              v39 = v60;
LABEL_12:
              id v40 = v39;
              break;
            default:
              id v40 = 0;
              break;
          }
          id v41 = objc_alloc(MEMORY[0x1E4F28B18]);
          uint64_t v42 = [v37 string];
          v43 = v42;
          if (!v42) {
            uint64_t v42 = @"??";
          }
          uint64_t v44 = [(__CFString *)v42 stringByAppendingString:@"\n"];
          v45 = (void *)[v41 initWithString:v44 attributes:v40];

          [v66 appendAttributedString:v45];
        }
        else
        {
          v29[2](v29, v37);
        }

        ++v34;
      }
      while (v32 != v34);
      uint64_t v46 = [obj countByEnumeratingWithState:&v69 objects:v81 count:16];
      uint64_t v32 = v46;
    }
    while (v46);
  }

  id v47 = v66;
  return v47;
}

- (id)px_slHighlightWithError:()PhotosUICore
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  PLSyndicationGetLog();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v7 = v5;
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SLHighlightFetching", "", buf, 2u);
  }

  uint64_t v9 = mach_absolute_time();
  uint64_t v10 = [a1 curationProperties];
  uint64_t v11 = [v10 syndicationIdentifier];

  id v23 = 0;
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4FA5650]) initWithCSSearchableItemUniqueIdentifier:v11 error:&v23];
  id v13 = v23;
  int v14 = v13;
  if (!v12)
  {
    if (v13) {
      *a3 = v13;
    }
    id v15 = PLUIGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      float v16 = [a1 uuid];
      *(_DWORD *)buf = 138543874;
      id v26 = v16;
      __int16 v27 = 2114;
      double v28 = *(double *)&v11;
      __int16 v29 = 2112;
      uint64_t v30 = v14;
      _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_ERROR, "SLHighlight was nil for syndicated asset: %{public}@ with syndication identifier: %{public}@ with error: %@", buf, 0x20u);
    }
  }
  uint64_t v17 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  uint64_t v20 = v8;
  long long v21 = v20;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v21, OS_SIGNPOST_INTERVAL_END, v6, "SLHighlightFetching", "", buf, 2u);
  }

  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v26 = "SLHighlightFetching";
    __int16 v27 = 2048;
    double v28 = (float)((float)((float)((float)(v17 - v9) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1A9AE7000, v21, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v12;
}

- (uint64_t)px_canLoadSyndicationAttributionInfo
{
  [a1 fetchPropertySetsIfNeeded];
  if ((objc_msgSend(a1, "px_isSyndicatedAsset") & 1) != 0
    || (uint64_t result = objc_msgSend(a1, "px_wasSavedThroughSyndication"), result))
  {
    uint64_t v3 = [a1 curationProperties];
    uint64_t v4 = [v3 importedByBundleIdentifier];

    uint64_t v5 = [v4 isEqualToString:*MEMORY[0x1E4F8AE28]];
    return v5;
  }
  return result;
}

- (uint64_t)px_wasSavedThroughExternalApp
{
  [a1 fetchPropertySetsIfNeeded];
  uint64_t v2 = [a1 curationProperties];
  uint64_t v3 = [v2 syndicationIdentifier];
  uint64_t v4 = [v2 importedByBundleIdentifier];
  uint64_t v5 = [v2 importedByDisplayName];
  uint64_t v6 = 0;
  if (PLShouldConstructDisplayNameForAppBundle() && !v3)
  {
    if (objc_msgSend(a1, "px_isSyndicatedAsset")) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = objc_msgSend(a1, "px_wasSavedThroughSyndication") ^ 1;
    }
  }

  return v6;
}

- (uint64_t)px_wasSavedThroughSyndication
{
  uint64_t v2 = +[PXContentSyndicationSettings sharedInstance];
  if ([v2 dataSourceType] == 6 || objc_msgSend(v2, "dataSourceType") == 7)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v3 = [a1 photoLibrary];
    uint64_t v4 = [v3 wellKnownPhotoLibraryIdentifier];

    [a1 fetchPropertySetsIfNeeded];
    if (v4 == 3)
    {
      uint64_t v5 = [a1 isSyndicatedAssetSavedToUserLibrary];
    }
    else
    {
      uint64_t v6 = [a1 curationProperties];
      uint64_t v7 = [v6 syndicationIdentifier];

      unsigned int v8 = [a1 isGuestAsset] ^ 1;
      if (v7) {
        uint64_t v5 = v8;
      }
      else {
        uint64_t v5 = 0;
      }
    }
  }

  return v5;
}

- (uint64_t)px_isSyndicatedAsset
{
  if (objc_msgSend(a1, "px_isSyndicationPhotoLibraryAsset")) {
    return 1;
  }
  return objc_msgSend(a1, "px_isUnsavedSyndicatedAsset");
}

- (BOOL)px_isSyndicationPhotoLibraryAsset
{
  v1 = [a1 photoLibrary];
  BOOL v2 = [v1 wellKnownPhotoLibraryIdentifier] == 3;

  return v2;
}

- (BOOL)px_isMomentSharedAsset
{
  return [a1 sourceType] == 8;
}

- (uint64_t)px_currentVariationType
{
  int v1 = [a1 playbackVariation];
  if ((v1 - 1) < 3) {
    return (unsigned __int16)(v1 - 1) + 1;
  }
  else {
    return 0;
  }
}

- (uint64_t)px_displayType
{
  switch([a1 playbackStyle])
  {
    case 0:
      uint64_t result = 1;
      break;
    case 1:
    case 3:
      if ([a1 playbackVariation] == 3) {
        uint64_t result = 5;
      }
      else {
        uint64_t result = 1;
      }
      break;
    case 2:
      uint64_t result = 6;
      break;
    case 4:
      uint64_t result = 2;
      break;
    case 5:
      int v3 = [a1 playbackVariation];
      uint64_t v4 = 2;
      if (v3 == 2) {
        uint64_t v4 = 3;
      }
      if (v3 == 1) {
        uint64_t result = 4;
      }
      else {
        uint64_t result = v4;
      }
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

- (id)px_singleLineMailingAddress
{
  [a1 fetchPropertySetsIfNeeded];
  BOOL v2 = [a1 photosOneUpProperties];
  int v3 = [v2 addressString];

  uint64_t v4 = [(id)objc_opt_class() addressWithoutUnitedStatesZipCode:v3];

  return v4;
}

- (id)px_adjustmentUuid
{
  BOOL v2 = [a1 uuid];
  if ([a1 hasAdjustments])
  {
    int v3 = [a1 uuid];
    uint64_t v4 = [a1 adjustmentVersion];
    uint64_t v5 = [v4 description];
    uint64_t v6 = [v3 stringByAppendingString:v5];

    BOOL v2 = (void *)v6;
  }
  return v2;
}

+ (void)px_generateResourceFilesForAssets:()PhotosUICore completionHandler:
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v47 = a4;
  group = dispatch_group_create();
  id v61 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v59 = objc_alloc_init(MEMORY[0x1E4F38F98]);
  [v59 setNetworkAccessAllowed:1];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id obj = v5;
  uint64_t v49 = [obj countByEnumeratingWithState:&v82 objects:v88 count:16];
  if (v49)
  {
    uint64_t v48 = *(void *)v83;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v83 != v48) {
          objc_enumerationMutation(obj);
        }
        uint64_t v56 = v6;
        uint64_t v7 = *(void **)(*((void *)&v82 + 1) + 8 * v6);
        unsigned int v8 = [v7 uuid];
        uint64_t v9 = NSTemporaryDirectory();
        uint64_t v10 = [v9 stringByAppendingPathComponent:v8];

        uint64_t v11 = [v7 photoLibrary];
        uint64_t v12 = [v11 photoLibrary];

        uint64_t v54 = (void *)v12;
        id v13 = objc_msgSend(v7, "px_detailedDebugDescriptionInLibrary:", v12);
        v55 = v8;
        int v14 = [v8 stringByAppendingString:@".detailedDebugDescription.txt"];
        uint64_t v64 = v10;
        id v15 = [v10 stringByAppendingPathComponent:v14];

        float v16 = [MEMORY[0x1E4F38F60] assetResourcesForAsset:v7];
        if ([v16 count])
        {
          long long v80 = 0u;
          long long v81 = 0u;
          long long v78 = 0u;
          long long v79 = 0u;
          id v17 = v16;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v78 objects:v87 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v79;
            while (2)
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v79 != v20) {
                  objc_enumerationMutation(v17);
                }
                id v22 = [*(id *)(*((void *)&v78 + 1) + 8 * i) originalFilename];
                if ([v22 hasPrefix:@"IMG"])
                {
                  float v57 = [v22 stringByDeletingPathExtension];
                  id v23 = objc_msgSend(v64, "stringByAppendingPathComponent:");
                  uint64_t v24 = [v23 stringByAppendingString:@".detailedDebugDescription.txt"];

                  id v15 = (void *)v24;
                  goto LABEL_17;
                }
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v78 objects:v87 count:16];
              if (v19) {
                continue;
              }
              break;
            }
          }
          float v57 = &stru_1F00B0030;
LABEL_17:
        }
        else
        {
          float v57 = &stru_1F00B0030;
        }
        uint64_t v25 = [MEMORY[0x1E4F28CB8] defaultManager];
        char v26 = [v25 createDirectoryAtPath:v64 withIntermediateDirectories:1 attributes:0 error:0];

        if ((v26 & 1) == 0) {
          NSLog(&cfstr_FailedToCreate_6.isa);
        }
        v52 = v15;
        uint64_t v27 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v15];
        id v77 = 0;
        v53 = v13;
        [v13 writeToURL:v27 atomically:1 encoding:4 error:&v77];
        id v50 = v77;
        if (!v50) {
          [v61 addObject:v27];
        }
        id v51 = (void *)v27;
        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        id v58 = v16;
        uint64_t v65 = [v58 countByEnumeratingWithState:&v73 objects:v86 count:16];
        if (v65)
        {
          uint64_t v63 = *(void *)v74;
          do
          {
            for (uint64_t j = 0; j != v65; ++j)
            {
              if (*(void *)v74 != v63) {
                objc_enumerationMutation(v58);
              }
              __int16 v29 = *(void **)(*((void *)&v73 + 1) + 8 * j);
              uint64_t v30 = [v29 originalFilename];
              uint64_t v31 = [v29 privateFileURL];
              uint64_t v32 = [v31 pathExtension];

              if (v32)
              {
                uint64_t v33 = [v30 stringByDeletingPathExtension];
                uint64_t v34 = [v33 stringByAppendingPathExtension:v32];

                uint64_t v30 = (void *)v34;
              }
              __int16 v35 = [v30 stringByDeletingPathExtension];
              if ((unint64_t)[obj count] >= 2
                && (([v30 hasPrefix:@"Adjustments"] & 1) != 0
                 || ([v30 hasPrefix:@"FullSize"] & 1) != 0
                 || [v30 hasPrefix:@"Penultimate"]))
              {
                uint64_t v36 = [NSString stringWithFormat:@"%@_%@", v57, v30];

                uint64_t v30 = (void *)v36;
              }
              id v37 = [v64 stringByAppendingPathComponent:v35];
              uint64_t v38 = [v37 stringByAppendingPathComponent:v30];
              v39 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v38];
              id v40 = [MEMORY[0x1E4F28CB8] defaultManager];
              char v41 = [v40 createDirectoryAtPath:v37 withIntermediateDirectories:1 attributes:0 error:0];

              if ((v41 & 1) == 0) {
                NSLog(&cfstr_FailedToCreate_6.isa);
              }
              dispatch_group_enter(group);
              uint64_t v42 = [MEMORY[0x1E4F38F78] defaultManager];
              v69[0] = MEMORY[0x1E4F143A8];
              v69[1] = 3221225472;
              v69[2] = __77__PHAsset_PhotosUICore__px_generateResourceFilesForAssets_completionHandler___block_invoke;
              v69[3] = &unk_1E5DB90F8;
              id v70 = v39;
              id v71 = v61;
              long long v72 = group;
              id v43 = v39;
              [v42 writeDataForAssetResource:v29 toFile:v43 options:v59 completionHandler:v69];
            }
            uint64_t v65 = [v58 countByEnumeratingWithState:&v73 objects:v86 count:16];
          }
          while (v65);
        }

        uint64_t v6 = v56 + 1;
      }
      while (v56 + 1 != v49);
      uint64_t v49 = [obj countByEnumeratingWithState:&v82 objects:v88 count:16];
    }
    while (v49);
  }

  uint64_t v44 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__PHAsset_PhotosUICore__px_generateResourceFilesForAssets_completionHandler___block_invoke_2;
  block[3] = &unk_1E5DD3280;
  id v67 = v61;
  id v68 = v47;
  id v45 = v61;
  id v46 = v47;
  dispatch_group_notify(group, v44, block);
}

+ (id)addressWithoutUnitedStatesZipCode:()PhotosUICore
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v10 = 0;
  uint64_t v4 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"  \\d{5}(-\\d{4})?, United States$", 0, &v10 options error];
  id v5 = v10;
  if (![v3 length] || v5)
  {
    if (v5)
    {
      uint64_t v7 = PLUIGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v5;
        _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "Can't remove United States zip code with error: %@", buf, 0xCu);
      }
    }
    id v6 = v3;
  }
  else
  {
    id v6 = [v4 stringByReplacingMatchesInString:v3, 0, 0, objc_msgSend(v3, "length"), @", United States" options range withTemplate];
  }
  unsigned int v8 = v6;

  return v8;
}

+ (id)px_orderedAssetsFromAssets:()PhotosUICore sortDescriptors:
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  memset(v14, 0, sizeof(v14));
  if ([v5 countByEnumeratingWithState:v14 objects:v15 count:16]
    && ([**((id **)&v14[0] + 1) photoLibrary], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    unsigned int v8 = v7;
    uint64_t v9 = objc_msgSend(v7, "px_standardLibrarySpecificFetchOptions");
    [v9 setSortDescriptors:v6];
    [v9 setIncludeHiddenAssets:1];
    [v9 setIncludeGuestAssets:1];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      PXMap();
    }
    id v10 = [v5 fetchedObjectIDs];
    id v12 = [MEMORY[0x1E4F38EB8] fetchAssetsWithObjectIDs:v10 options:v9];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F38EB8];
    unsigned int v8 = objc_msgSend(MEMORY[0x1E4F390A0], "px_standardFetchOptions");
    id v12 = [v11 fetchAssetsWithLocalIdentifiers:MEMORY[0x1E4F1CBF0] options:v8];
  }

  return v12;
}

+ (id)px_fetchAssetsInArray:()PhotosUICore photoLibrary:
{
  id v5 = (objc_class *)MEMORY[0x1E4F39150];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  uint64_t v9 = [MEMORY[0x1E4F38EB8] fetchType];
  id v10 = (void *)[v8 initWithObjects:v7 photoLibrary:v6 fetchType:v9 fetchPropertySets:0 identifier:0 registerIfNeeded:0];

  return v10;
}

@end