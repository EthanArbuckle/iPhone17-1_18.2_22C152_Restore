@interface PLSMetadataUtilities
+ (BOOL)_writeDetails:(id)a3 forEntityNamed:(id)a4 toFilepath:(id)a5 withDefaultFilename:(id)a6;
+ (BOOL)initializeJSONFileAtPath:(id)a3;
+ (id)_allAlbumsInPhotoLibrary:(id)a3;
+ (id)_detailsForAlbum:(id)a3;
+ (id)_detailsForAsset:(id)a3 includingLocal:(BOOL)a4 includingFingerprints:(BOOL)a5;
+ (id)_normalizeObjectForJSON:(id)a3;
+ (id)allAlbumsDetailsWriteToPath:(id)a3 inLibrary:(id)a4;
+ (id)allAssetsDetailsWriteToPath:(id)a3 includingLocal:(BOOL)a4 includingFingerprints:(BOOL)a5 forAlbumTitled:(id)a6 library:(id)a7;
+ (id)dictionaryFromManagedObject:(id)a3 excludeAttributes:(id)a4 includingRelationships:(id)a5 excludeRelationshipAttributes:(id)a6 andSubRelationships:(id)a7;
+ (void)_writeJSONForObjectDetails:(id)a3 toFile:(id)a4;
+ (void)serializeJSONFromObjectDetails:(id)a3 ToPath:(id)a4;
+ (void)writeJSONData:(id)a3 toFile:(id)a4;
@end

@implementation PLSMetadataUtilities

+ (id)allAlbumsDetailsWriteToPath:(id)a3 inLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__6434;
  v23 = __Block_byref_object_dispose__6435;
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __62__PLSMetadataUtilities_allAlbumsDetailsWriteToPath_inLibrary___block_invoke;
  v15 = &unk_1E5873ED8;
  id v18 = a1;
  id v8 = v7;
  id v16 = v8;
  v17 = &v19;
  [v8 performBlockAndWait:&v12];
  if (v6)
  {
    if (([a1 _writeDetails:v20[5] forEntityNamed:@"albums" toFilepath:v6 withDefaultFilename:@"allAlbumsMetadataDump.plist"] & 1) == 0)NSLog(&cfstr_ThereWasAnErro_0.isa, v6, v12, v13, v14, v15); {
    v9 = (void *)v20[5];
    }
    v20[5] = 0;
  }
  id v10 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __62__PLSMetadataUtilities_allAlbumsDetailsWriteToPath_inLibrary___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 48) _allAlbumsInPhotoLibrary:*(void *)(a1 + 32)];
  v3 = v2;
  if (v2)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __62__PLSMetadataUtilities_allAlbumsDetailsWriteToPath_inLibrary___block_invoke_2;
    v4[3] = &unk_1E58639D8;
    long long v5 = *(_OWORD *)(a1 + 40);
    [v2 enumerateObjectsUsingBlock:v4];
  }
}

void __62__PLSMetadataUtilities_allAlbumsDetailsWriteToPath_inLibrary___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = (void *)MEMORY[0x19F38D3B0]();
  v4 = [*(id *)(a1 + 40) _detailsForAlbum:v5];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v4];
}

+ (id)_detailsForAlbum:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [v4 localizedTitle];
  id v7 = [v4 title];
  id v8 = [v4 cloudGUID];
  if (v6) {
    v9 = v6;
  }
  else {
    v9 = @"None";
  }
  [v5 setValue:v9 forKey:@"AlbumLocalizedTitle"];
  if (v7) {
    id v10 = v7;
  }
  else {
    id v10 = @"None";
  }
  [v5 setValue:v10 forKey:@"AlbumTitle"];
  if (v8) {
    v11 = v8;
  }
  else {
    v11 = @"None";
  }
  [v5 setValue:v11 forKey:@"AlbumCloudGUID"];
  uint64_t v12 = [v4 uuid];
  [v5 setValue:v12 forKey:@"AlbumUUID"];

  uint64_t v13 = [v4 kind];
  [v5 setValue:v13 forKey:@"AlbumKind"];

  v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isCameraAlbum"));
  [v5 setValue:v14 forKey:@"AlbumIsCameraAlbum"];

  v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isCloudSharedAlbum"));
  [v5 setValue:v15 forKey:@"AlbumIsCloudSharedAlbum"];

  id v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isDeleted"));
  [v5 setValue:v16 forKey:@"AlbumIsDeleted"];

  v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isUpdated"));
  [v5 setValue:v17 forKey:@"AlbumIsUpdated"];

  id v18 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isEmpty"));
  [v5 setValue:v18 forKey:@"AlbumIsEmpty"];

  uint64_t v19 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isLibrary"));
  [v5 setValue:v19 forKey:@"AlbumIsLibrary"];

  v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isMultipleContributorCloudSharedAlbum"));
  [v5 setValue:v20 forKey:@"AlbumIsMultipleContributorCloudSharedAlbum"];

  uint64_t v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isOwnedCloudSharedAlbum"));
  [v5 setValue:v21 forKey:@"AlbumIsOwnedCloudSharedAlbum"];

  v22 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isOwnPhotoStreamAlbum"));
  [v5 setValue:v22 forKey:@"AlbumIsOwnPhotoStreamAlbum"];

  v23 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isPanoramasAlbum"));
  [v5 setValue:v23 forKey:@"AlbumIsPanoramasAlbum"];

  id v24 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isPendingPhotoStreamAlbum"));
  [v5 setValue:v24 forKey:@"AlbumIsPendingPhotoStreamAlbum"];

  v25 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isPhotoStreamAlbum"));
  [v5 setValue:v25 forKey:@"AlbumIsPhotoStreamAlbum"];

  v26 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isSmartAlbum"));
  [v5 setValue:v26 forKey:@"AlbumIsSmartAlbum"];

  v27 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isStandInAlbum"));
  [v5 setValue:v27 forKey:@"AlbumIsStandInAlbum"];

  v28 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isFolder"));
  [v5 setValue:v28 forKey:@"AlbumIsFolder"];

  v29 = NSNumber;
  uint64_t v30 = [v4 assetsCount];

  v31 = [v29 numberWithUnsignedInteger:v30];
  [v5 setValue:v31 forKey:@"AlbumAssetsCount"];

  return v5;
}

+ (id)allAssetsDetailsWriteToPath:(id)a3 includingLocal:(BOOL)a4 includingFingerprints:(BOOL)a5 forAlbumTitled:(id)a6 library:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  BOOL v49 = 0;
  if ([v12 length])
  {
    v15 = [v12 pathExtension];
    BOOL v16 = [v15 caseInsensitiveCompare:@"json"] == 0;
  }
  else
  {
    BOOL v16 = 0;
  }
  BOOL v49 = v16;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  char v45 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__6434;
  v42 = __Block_byref_object_dispose__6435;
  id v43 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:500];
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  v26 = __112__PLSMetadataUtilities_allAssetsDetailsWriteToPath_includingLocal_includingFingerprints_forAlbumTitled_library___block_invoke;
  v27 = &unk_1E58639B0;
  id v35 = a1;
  id v18 = v14;
  id v28 = v18;
  id v19 = v13;
  id v29 = v19;
  id v20 = v17;
  BOOL v36 = a4;
  BOOL v37 = a5;
  id v30 = v20;
  v32 = &v46;
  v33 = v44;
  id v21 = v12;
  id v31 = v21;
  v34 = &v38;
  [v18 performBlockAndWait:&v24];
  if (*((unsigned char *)v47 + 24))
  {
    v22 = 0;
  }
  else
  {
    v22 = [(id)v39[5] sortedArrayUsingComparator:&__block_literal_global_6497];
    if ([v21 length]
      && ([a1 _writeDetails:v22 forEntityNamed:@"assets" toFilepath:v21 withDefaultFilename:@"allAssetsMetadataDump.plist"] & 1) == 0)
    {
      NSLog(&cfstr_ThereWasAnErro_0.isa, v21, v24, v25, v26, v27, v28, v29, v30);
    }
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(v44, 8);
  _Block_object_dispose(&v46, 8);

  return v22;
}

void __112__PLSMetadataUtilities_allAssetsDetailsWriteToPath_includingLocal_includingFingerprints_forAlbumTitled_library___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 88) _allAlbumsInPhotoLibrary:*(void *)(a1 + 32)];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v39;
    uint64_t v25 = v27;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v39 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        id v7 = [v6 localizedTitle];
        int v8 = [v6 kindValue];
        if (([v6 isEmpty] & 1) == 0
          && ((uint64_t v9 = *(void *)(a1 + 40)) == 0 && v8 == 1600 || v9 && objc_msgSend(v7, "isEqual:")))
        {
          id v10 = [*(id *)(a1 + 48) valueForKey:v7];
          v11 = v10;
          if (v10)
          {
            uint64_t v12 = [v10 intValue] + 1;
            uint64_t v13 = [NSString stringWithFormat:@"%@(%d)", v7, v12, v25];

            id v14 = *(void **)(a1 + 48);
            v15 = [NSNumber numberWithInt:v12];
            [v14 setValue:v15 forKey:v13];
            id v7 = (void *)v13;
          }
          else
          {
            BOOL v16 = *(void **)(a1 + 48);
            v15 = [NSNumber numberWithInt:0];
            [v16 setValue:v15 forKey:v7];
          }

          id v17 = [v6 assets];
          id v18 = [v17 array];

          if (v18)
          {
            v36[0] = 0;
            v36[1] = v36;
            v36[2] = 0x2020000000;
            int v37 = 0;
            v26[0] = MEMORY[0x1E4F143A8];
            v26[1] = 3221225472;
            v27[0] = __112__PLSMetadataUtilities_allAssetsDetailsWriteToPath_includingLocal_includingFingerprints_forAlbumTitled_library___block_invoke_2;
            v27[1] = &unk_1E5863988;
            uint64_t v34 = *(void *)(a1 + 88);
            __int16 v35 = *(_WORD *)(a1 + 96);
            long long v31 = *(_OWORD *)(a1 + 64);
            id v19 = *(id *)(a1 + 56);
            uint64_t v20 = *(void *)(a1 + 80);
            id v28 = v19;
            uint64_t v32 = v20;
            v33 = v36;
            id v21 = v18;
            id v29 = v21;
            id v30 = v7;
            [v21 enumerateObjectsUsingBlock:v26];
            if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
            {
              if ([*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) count]) {
                [*(id *)(a1 + 88) _writeJSONForObjectDetails:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) toFile:*(void *)(a1 + 56)];
              }
              v22 = [@"  ]\n}\n" dataUsingEncoding:4];
              [*(id *)(a1 + 88) writeJSONData:v22 toFile:*(void *)(a1 + 56)];
              uint64_t v23 = *(void *)(*(void *)(a1 + 80) + 8);
              uint64_t v24 = *(void **)(v23 + 40);
              *(void *)(v23 + 40) = 0;
            }
            _Block_object_dispose(v36, 8);
          }
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v3);
  }
}

uint64_t __112__PLSMetadataUtilities_allAssetsDetailsWriteToPath_includingLocal_includingFingerprints_forAlbumTitled_library___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 valueForKey:@"cloudOrObjectID"];
  id v6 = [v4 valueForKey:@"cloudOrObjectID"];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

void __112__PLSMetadataUtilities_allAssetsDetailsWriteToPath_includingLocal_includingFingerprints_forAlbumTitled_library___block_invoke_2(uint64_t a1, void *a2)
{
  id v16 = a2;
  uint64_t v3 = (void *)MEMORY[0x19F38D3B0]();
  id v4 = [*(id *)(a1 + 88) _detailsForAsset:v16 includingLocal:*(unsigned __int8 *)(a1 + 96) includingFingerprints:*(unsigned __int8 *)(a1 + 97)];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
    && !*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    id v5 = [@"{\n\"assets\" : [\n" dataUsingEncoding:4];
    int v6 = [v5 writeToFile:*(void *)(a1 + 32) options:1073741825 error:0];
    uint64_t v7 = 56;
    if (v6) {
      uint64_t v7 = 64;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + v7) + 8) + 24) = v6;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addObject:v4];
  uint64_t v8 = *(void *)(*(void *)(a1 + 80) + 8);
  int v9 = *(_DWORD *)(v8 + 24);
  if (v9) {
    BOOL v10 = v9 % 500 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      [*(id *)(a1 + 88) _writeJSONForObjectDetails:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) toFile:*(void *)(a1 + 32)];
      uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:500];
      uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
      uint64_t v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;

      int v9 = *(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    }
    if ([*(id *)(a1 + 40) count] - 1 > (unint64_t)v9)
    {
      id v14 = *(void **)(a1 + 88);
      v15 = [@",\n" dataUsingEncoding:4];
      [v14 writeJSONData:v15 toFile:*(void *)(a1 + 32)];
    }
    NSLog(&cfstr_ProcessingNext.isa, *(void *)(a1 + 48), *(unsigned int *)(*(void *)(*(void *)(a1 + 80) + 8) + 24), [*(id *)(a1 + 40) count]);
    uint64_t v8 = *(void *)(*(void *)(a1 + 80) + 8);
    int v9 = *(_DWORD *)(v8 + 24);
  }
  *(_DWORD *)(v8 + 24) = v9 + 1;
}

+ (void)serializeJSONFromObjectDetails:(id)a3 ToPath:(id)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [a1 _normalizeObjectForJSON:a3];
  v9[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [a1 _writeJSONForObjectDetails:v8 toFile:v6];
}

+ (BOOL)initializeJSONFileAtPath:(id)a3
{
  id v3 = a3;
  id v4 = [@"{\n" dataUsingEncoding:4];
  id v10 = 0;
  char v5 = [v4 writeToFile:v3 options:1073741825 error:&v10];

  id v6 = v10;
  uint64_t v7 = v6;
  if ((v5 & 1) == 0)
  {
    uint64_t v8 = [v6 localizedDescription];
    NSLog(&cfstr_ThereWasAnErro.isa, v8);
  }
  return v5;
}

+ (void)_writeJSONForObjectDetails:(id)a3 toFile:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v18 = a4;
  id v6 = [MEMORY[0x1E4F1CA58] dataWithCapacity:0];
  uint64_t v7 = [v5 lastObject];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
        id v14 = (void *)MEMORY[0x19F38D3B0]();
        v15 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v13 options:1 error:0];
        [v6 appendData:v15];

        if (v13 != v7)
        {
          id v16 = [@",\n" dataUsingEncoding:4];
          [v6 appendData:v16];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  [a1 writeJSONData:v6 toFile:v18];
}

+ (void)writeJSONData:(id)a3 toFile:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F28CB0];
  id v6 = a3;
  id v7 = [v5 fileHandleForUpdatingAtPath:a4];
  [v7 seekToEndOfFile];
  [v7 writeData:v6];

  [v7 closeFile];
}

+ (id)_detailsForAsset:(id)a3 includingLocal:(BOOL)a4 includingFingerprints:(BOOL)a5
{
  BOOL v76 = a5;
  BOOL v5 = a4;
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v8 = [v6 entity];
  uint64_t v9 = [v8 relationshipsByName];
  v87[0] = MEMORY[0x1E4F143A8];
  v87[1] = 3221225472;
  v87[2] = __78__PLSMetadataUtilities__detailsForAsset_includingLocal_includingFingerprints___block_invoke;
  v87[3] = &unk_1E5871D68;
  id v10 = v6;
  id v88 = v10;
  [v9 enumerateKeysAndObjectsUsingBlock:v87];

  uint64_t v11 = [v10 cloudAssetGUID];
  uint64_t v12 = [v10 uuid];
  v78 = (void *)v11;
  v79 = (void *)v12;
  if (v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  [v7 setValue:v13 forKey:@"AssetCloudOrLocalID"];
  id v14 = NSString;
  v15 = [v10 dateCreated];
  id v16 = [v14 stringWithFormat:@"%@", v15];
  [v7 setValue:v16 forKey:@"AssetDateCreated"];

  id v17 = NSString;
  id v18 = [v10 modificationDate];
  long long v19 = [v17 stringWithFormat:@"%@", v18];
  [v7 setValue:v19 forKey:@"AssetModificationDate"];

  long long v20 = NSNumber;
  [v10 duration];
  long long v21 = objc_msgSend(v20, "numberWithDouble:");
  [v7 setValue:v21 forKey:@"AssetDuration"];

  long long v22 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10, "favorite"));
  [v7 setValue:v22 forKey:@"AssetIsFavorite"];

  uint64_t v23 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v10, "kind"));
  [v7 setValue:v23 forKey:@"AssetKind"];

  uint64_t v24 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v10, "kindSubtype"));
  [v7 setValue:v24 forKey:@"AssetKindSubtype"];

  uint64_t v25 = objc_msgSend(NSNumber, "numberWithShort:", (__int16)objc_msgSend(v10, "height"));
  [v7 setValue:v25 forKey:@"AssetHeight"];

  v26 = objc_msgSend(NSNumber, "numberWithShort:", (__int16)objc_msgSend(v10, "width"));
  [v7 setValue:v26 forKey:@"AssetWidth"];

  v27 = [v10 directory];
  id v28 = [v10 filename];
  uint64_t v29 = [v27 stringByAppendingPathComponent:v28];

  id v30 = [v10 managedObjectContext];
  long long v31 = [v30 pathManager];
  uint64_t v32 = [v31 photoDirectoryWithType:1];
  v74 = (void *)v29;
  uint64_t v33 = [v32 stringByAppendingPathComponent:v29];

  uint64_t v34 = [MEMORY[0x1E4F28CB8] defaultManager];
  v73 = (void *)v33;
  uint64_t v35 = [v34 fileExistsAtPath:v33];

  BOOL v36 = [NSNumber numberWithBool:v35];
  [v7 setValue:v36 forKey:@"AssetExistsOnDisk"];

  BOOL v75 = v5;
  if (v5)
  {
    int v37 = [v10 filename];
    [v7 setValue:v37 forKey:@"AssetFilename"];

    long long v38 = [v10 directory];
    [v7 setValue:v38 forKey:@"AssetDirectory"];
  }
  long long v39 = [v10 location];
  long long v40 = v39;
  if (v39)
  {
    [v39 coordinate];
    double v42 = v41;
    uint64_t v43 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v7 setValue:v43 forKey:@"AssetLocationLatitude"];

    v44 = [NSNumber numberWithDouble:v42];
    [v7 setValue:v44 forKey:@"AssetLocationLongitude"];
  }
  v72 = v40;
  char v45 = [v10 albums];
  uint64_t v46 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v45, "count"));
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v47 = v45;
  uint64_t v48 = [v47 countByEnumeratingWithState:&v83 objects:v89 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v84;
    do
    {
      for (uint64_t i = 0; i != v49; ++i)
      {
        if (*(void *)v84 != v50) {
          objc_enumerationMutation(v47);
        }
        v52 = [*(id *)(*((void *)&v83 + 1) + 8 * i) localizedTitle];
        [v46 addObject:v52];
      }
      uint64_t v49 = [v47 countByEnumeratingWithState:&v83 objects:v89 count:16];
    }
    while (v49);
  }

  [v7 setValue:v46 forKey:@"AssetAlbums"];
  v53 = [v10 additionalAttributes];
  v54 = [v53 entity];

  v55 = [v54 relationshipsByName];
  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = __78__PLSMetadataUtilities__detailsForAsset_includingLocal_includingFingerprints___block_invoke_2;
  v81[3] = &unk_1E5871D68;
  id v56 = v53;
  id v82 = v56;
  [v55 enumerateKeysAndObjectsUsingBlock:v81];

  v57 = [v10 master];
  v58 = v57;
  if (v57)
  {
    v59 = [v57 scopedIdentifier];
    [v7 setValue:v59 forKey:@"AssetCloudMasterGUID"];
  }
  else
  {
    [v7 setValue:@"None" forKey:@"AssetCloudMasterGUID"];
  }
  v60 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v10, "originalHeight"));
  [v7 setValue:v60 forKey:@"AssetOriginalHeight"];

  v61 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v10, "originalWidth"));
  [v7 setValue:v61 forKey:@"AssetOriginalWidth"];

  v62 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v10, "originalOrientation"));
  [v7 setValue:v62 forKey:@"AssetOriginalOrientation"];

  if (v75)
  {
    [v7 setValue:v79 forKey:@"AssetID"];
    v63 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v10, "cloudLocalState"));
    [v7 setValue:v63 forKey:@"AssetCloudLocalState"];
  }
  if (v76)
  {
    v64 = [v10 mainFileURL];
    if (v64)
    {
      v65 = [MEMORY[0x1E4F59898] defaultFingerprintSchemeForUnknownRecord];
      id v80 = 0;
      v66 = [v65 fingerPrintForFileAtURL:v64 error:&v80];
      v77 = v58;
      id v67 = v56;
      v68 = v54;
      id v69 = v80;

      v54 = v68;
      id v56 = v67;
      v58 = v77;
    }
    else
    {
      v66 = 0;
    }
    if (v66) {
      v70 = v66;
    }
    else {
      v70 = @"None";
    }
    [v7 setValue:v70 forKey:@"masterFileFingerPrint"];
  }
  return v7;
}

void __78__PLSMetadataUtilities__detailsForAsset_includingLocal_includingFingerprints___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  BOOL v5 = [*(id *)(a1 + 32) valueForKey:a2];
  if ([v8 isToMany])
  {
    if ([v8 isOrdered]) {
      id v6 = (id)[v5 firstObject];
    }
    else {
      id v7 = (id)[v5 anyObject];
    }
  }
}

void __78__PLSMetadataUtilities__detailsForAsset_includingLocal_includingFingerprints___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  BOOL v5 = [*(id *)(a1 + 32) valueForKey:a2];
  if ([v8 isToMany])
  {
    if ([v8 isOrdered]) {
      id v6 = (id)[v5 firstObject];
    }
    else {
      id v7 = (id)[v5 anyObject];
    }
  }
}

+ (id)_normalizeObjectForJSON:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [v4 base64EncodedStringWithOptions:1];
LABEL_3:
    id v6 = v5;
    goto LABEL_24;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v7 setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    id v8 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
    [v7 setTimeZone:v8];
    id v6 = [v7 stringFromDate:v4];

    goto LABEL_24;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v9 = [v4 allKeys];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          v15 = [v4 objectForKeyedSubscript:v14];
          id v16 = [a1 _normalizeObjectForJSON:v15];
          [(__CFString *)v6 setObject:v16 forKeyedSubscript:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v11);
    }
LABEL_23:

    goto LABEL_24;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v9 = v4;
    uint64_t v17 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v9);
          }
          long long v21 = objc_msgSend(a1, "_normalizeObjectForJSON:", *(void *)(*((void *)&v25 + 1) + 8 * j), (void)v25);
          [(__CFString *)v6 addObject:v21];
        }
        uint64_t v18 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v18);
    }
    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_28;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || ([MEMORY[0x1E4F1CA98] null],
        uint64_t v23 = objc_claimAutoreleasedReturnValue(),
        int v24 = [v4 isEqual:v23],
        v23,
        v24))
  {
    BOOL v5 = (__CFString *)v4;
    goto LABEL_3;
  }
  if (objc_opt_respondsToSelector())
  {
LABEL_28:
    BOOL v5 = [v4 description];
    goto LABEL_3;
  }
  id v6 = @"non-normalized value";
LABEL_24:

  return v6;
}

+ (id)dictionaryFromManagedObject:(id)a3 excludeAttributes:(id)a4 includingRelationships:(id)a5 excludeRelationshipAttributes:(id)a6 andSubRelationships:(id)a7
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v12)
  {
    v64 = v15;
    uint64_t v17 = [v12 entity];
    id v56 = [v17 relationshipsByName];

    uint64_t v18 = [v12 entity];
    uint64_t v19 = [v18 attributesByName];

    v55 = v19;
    long long v20 = [v19 allKeys];
    long long v21 = (void *)[v20 mutableCopy];

    id v57 = v13;
    if (v13)
    {
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      id v22 = v13;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v80 objects:v86 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v81;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v81 != v25) {
              objc_enumerationMutation(v22);
            }
            [v21 removeObject:*(void *)(*((void *)&v80 + 1) + 8 * i)];
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v80 objects:v86 count:16];
        }
        while (v24);
      }
    }
    long long v27 = [v12 dictionaryWithValuesForKeys:v21];
    id v60 = (id)[v27 mutableCopy];

    if (v14)
    {
      v53 = [v12 entity];
      long long v28 = [v53 relationshipsByName];
      v78[0] = MEMORY[0x1E4F143A8];
      v78[1] = 3221225472;
      v78[2] = __143__PLSMetadataUtilities_dictionaryFromManagedObject_excludeAttributes_includingRelationships_excludeRelationshipAttributes_andSubRelationships___block_invoke;
      v78[3] = &unk_1E5871D68;
      id v54 = v12;
      id v29 = v12;
      id v79 = v29;
      [v28 enumerateKeysAndObjectsUsingBlock:v78];

      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      obuint64_t j = [v56 allKeys];
      uint64_t v30 = [obj countByEnumeratingWithState:&v74 objects:v85 count:16];
      if (!v30) {
        goto LABEL_39;
      }
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v75;
      uint64_t v61 = *(void *)v75;
      v62 = v21;
      id v63 = v14;
      id v58 = v29;
      id v59 = v16;
      while (1)
      {
        uint64_t v33 = 0;
        uint64_t v65 = v31;
        do
        {
          if (*(void *)v75 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v34 = *(void *)(*((void *)&v74 + 1) + 8 * v33);
          if ([v14 containsObject:v34])
          {
            if (v16)
            {
              uint64_t v35 = [v16 objectForKey:v34];
            }
            else
            {
              uint64_t v35 = 0;
            }
            id v36 = v16;
            if (v64)
            {
              int v37 = [v64 objectForKey:v34];
            }
            else
            {
              int v37 = 0;
            }
            uint64_t v38 = [v29 entity];
            long long v39 = [(id)v38 relationshipsByName];
            long long v40 = [v39 objectForKey:v34];

            id v69 = v40;
            LOBYTE(v38) = [v40 isToMany];
            uint64_t v68 = v34;
            uint64_t v41 = [v29 valueForKey:v34];
            double v42 = (void *)v41;
            if (v38)
            {
              uint64_t v43 = (void *)v41;
              id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              long long v70 = 0u;
              long long v71 = 0u;
              long long v72 = 0u;
              long long v73 = 0u;
              id v67 = v43;
              id v45 = v43;
              uint64_t v46 = [v45 countByEnumeratingWithState:&v70 objects:v84 count:16];
              if (v46)
              {
                uint64_t v47 = v46;
                uint64_t v48 = *(void *)v71;
                do
                {
                  for (uint64_t j = 0; j != v47; ++j)
                  {
                    if (*(void *)v71 != v48) {
                      objc_enumerationMutation(v45);
                    }
                    uint64_t v50 = [a1 dictionaryFromManagedObject:*(void *)(*((void *)&v70 + 1) + 8 * j) excludeAttributes:v37 includingRelationships:v35 excludeRelationshipAttributes:0 andSubRelationships:0];
                    [v44 addObject:v50];
                  }
                  uint64_t v47 = [v45 countByEnumeratingWithState:&v70 objects:v84 count:16];
                }
                while (v47);
              }

              long long v21 = v62;
              id v14 = v63;
              id v29 = v58;
              id v16 = v59;
              v51 = v69;
LABEL_35:
              [v60 setObject:v44 forKey:v68];

              double v42 = v67;
            }
            else
            {
              v51 = v40;
              id v16 = v36;
              long long v21 = v62;
              id v14 = v63;
              if (v41)
              {
                id v67 = (void *)v41;
                id v44 = [a1 dictionaryFromManagedObject:v41 excludeAttributes:v37 includingRelationships:v35 excludeRelationshipAttributes:0 andSubRelationships:0];
                goto LABEL_35;
              }
            }

            uint64_t v32 = v61;
            uint64_t v31 = v65;
          }
          ++v33;
        }
        while (v33 != v31);
        uint64_t v31 = [obj countByEnumeratingWithState:&v74 objects:v85 count:16];
        if (!v31)
        {
LABEL_39:

          id v12 = v54;
          break;
        }
      }
    }

    id v13 = v57;
    id v15 = v64;
  }
  else
  {
    id v60 = 0;
  }

  return v60;
}

void __143__PLSMetadataUtilities_dictionaryFromManagedObject_excludeAttributes_includingRelationships_excludeRelationshipAttributes_andSubRelationships___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  BOOL v5 = [*(id *)(a1 + 32) valueForKey:a2];
  if ([v8 isToMany])
  {
    if ([v8 isOrdered]) {
      id v6 = (id)[v5 firstObject];
    }
    else {
      id v7 = (id)[v5 anyObject];
    }
  }
}

+ (id)_allAlbumsInPhotoLibrary:(id)a3
{
  id v3 = [a3 managedObjectContext];
  id v4 = (void *)MEMORY[0x1E4F1C0D0];
  BOOL v5 = +[PLGenericAlbum entityName];
  id v6 = [v4 fetchRequestWithEntityName:v5];

  id v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"kind" ascending:1];
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObject:v7];
  [v6 setSortDescriptors:v8];

  id v13 = 0;
  id v9 = [v3 executeFetchRequest:v6 error:&v13];
  id v10 = v13;
  uint64_t v11 = v10;
  if (!v9) {
    NSLog(&cfstr_FailedToGetAlb.isa, v10);
  }

  return v9;
}

+ (BOOL)_writeDetails:(id)a3 forEntityNamed:(id)a4 toFilepath:(id)a5 withDefaultFilename:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (![v11 length])
  {
    char v19 = 0;
    goto LABEL_13;
  }
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v9 forKey:v10];
  id v14 = [v11 pathExtension];
  char v15 = [v14 isEqualToString:@"json"];
  if ([v14 isEqual:&stru_1EEB2EB80])
  {
    char v25 = 0;
    id v16 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v17 = [v16 fileExistsAtPath:v11 isDirectory:&v25];

    if (!v17)
    {
      uint64_t v18 = [v11 stringByAppendingPathExtension:@"plist"];
      goto LABEL_8;
    }
    if (v25)
    {
      uint64_t v18 = [v11 stringByAppendingPathComponent:v12];
LABEL_8:
      long long v20 = (void *)v18;

      id v11 = v20;
    }
  }
  if (v15)
  {
    uint64_t v24 = 0;
    long long v21 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v13 options:1 error:&v24];
  }
  else
  {
    long long v21 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v13 format:100 options:0 error:0];
  }
  id v22 = v21;
  char v19 = [v21 writeToFile:v11 options:1073741825 error:0];

LABEL_13:
  return v19;
}

@end