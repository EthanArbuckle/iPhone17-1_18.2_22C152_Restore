@interface PHPerson(PXPerson)
- (BOOL)px_isHuman;
- (BOOL)px_isPet;
- (id)px_keyPhotoDate;
- (uint64_t)isPersonModel;
- (uint64_t)numberOfAssets;
- (uint64_t)requestFaceCropImageWithTargetSize:()PXPerson displayScale:cropFactor:style:cacheResult:synchronous:resultHandler:;
@end

@implementation PHPerson(PXPerson)

- (BOOL)px_isPet
{
  return [a1 detectionType] > 2;
}

- (BOOL)px_isHuman
{
  uint64_t v1 = [a1 detectionType];
  return +[PXPeopleUtilities isDetectionTypeHuman:v1];
}

- (id)px_keyPhotoDate
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 photoLibrary];
  v3 = objc_msgSend(v2, "px_standardLibrarySpecificFetchOptions");

  [v3 setFetchLimit:1];
  [v3 setSortDescriptors:MEMORY[0x1E4F1CBF0]];
  [v3 setIncludeTorsoAndFaceDetectionData:1];
  v4 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
  [v3 setIncludedDetectionTypes:v4];

  v5 = objc_msgSend(MEMORY[0x1E4F39050], "px_fetchKeyFaceForPerson:options:", a1, v3);
  v6 = [v5 firstObject];

  [v3 setIncludeHiddenAssets:0];
  v15[0] = *MEMORY[0x1E4F394E8];
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [v3 addFetchPropertySets:v7];

  v8 = (void *)MEMORY[0x1E4F38EB8];
  v14 = v6;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  v10 = [v8 fetchAssetsForFaces:v9 options:v3];

  v11 = [v10 firstObject];
  v12 = [v11 creationDate];

  return v12;
}

- (uint64_t)isPersonModel
{
  return 1;
}

- (uint64_t)numberOfAssets
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 photoLibrary];
  v3 = [v2 librarySpecificFetchOptions];

  [v3 setShouldPrefetchCount:1];
  [v3 setIncludeTorsoAndFaceDetectionData:1];
  v4 = (void *)MEMORY[0x1E4F38EB8];
  v9[0] = a1;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v6 = [v4 fetchAssetsForPersons:v5 options:v3];

  uint64_t v7 = [v6 count];
  return v7;
}

- (uint64_t)requestFaceCropImageWithTargetSize:()PXPerson displayScale:cropFactor:style:cacheResult:synchronous:resultHandler:
{
  id v18 = a10;
  v19 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:]([PXPeopleFaceCropFetchOptions alloc], "initWithPerson:targetSize:displayScale:", a1, a2, a3, a4);
  [(PXPeopleFaceCropFetchOptions *)v19 setCropFactor:a6];
  [(PXPeopleFaceCropFetchOptions *)v19 setCornerStyle:a7];
  [(PXPeopleFaceCropFetchOptions *)v19 setShouldCacheResult:a8];
  [(PXPeopleFaceCropFetchOptions *)v19 setIsSynchronous:a9];
  v20 = +[PXPeopleFaceCropManager sharedManager];
  uint64_t v21 = [v20 requestFaceCropForOptions:v19 resultHandler:v18];

  return v21;
}

@end