@interface PHPersonSuggestion(PXPerson)
- (id)name;
- (id)px_keyPhotoDate;
- (id)px_localIdentifier;
- (id)px_localizedName;
- (id)px_longStyleLocalizedName;
- (uint64_t)detectionType;
- (uint64_t)isPersonModel;
- (uint64_t)isVerified;
- (uint64_t)numberOfAssets;
- (uint64_t)px_isHuman;
- (uint64_t)px_isPet;
- (uint64_t)requestFaceCropImageWithTargetSize:()PXPerson displayScale:cropFactor:style:cacheResult:synchronous:resultHandler:;
@end

@implementation PHPersonSuggestion(PXPerson)

- (id)px_keyPhotoDate
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v1 = [a1 keyFace];
  v2 = [v1 photoLibrary];
  v3 = objc_msgSend(v2, "px_standardLibrarySpecificFetchOptions");

  [v3 setIncludeHiddenAssets:0];
  [v3 setFetchLimit:1];
  [v3 setSortDescriptors:MEMORY[0x1E4F1CBF0]];
  v12[0] = *MEMORY[0x1E4F394E8];
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v3 addFetchPropertySets:v4];

  v5 = (void *)MEMORY[0x1E4F38EB8];
  v11 = v1;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  v7 = [v5 fetchAssetsForFaces:v6 options:v3];

  v8 = [v7 firstObject];
  v9 = [v8 creationDate];

  return v9;
}

- (uint64_t)px_isPet
{
  v1 = [a1 person];
  uint64_t v2 = objc_msgSend(v1, "px_isPet");

  return v2;
}

- (uint64_t)px_isHuman
{
  v1 = [a1 person];
  uint64_t v2 = objc_msgSend(v1, "px_isHuman");

  return v2;
}

- (uint64_t)detectionType
{
  v1 = [a1 person];
  uint64_t v2 = [v1 detectionType];

  return v2;
}

- (uint64_t)isPersonModel
{
  return 0;
}

- (uint64_t)isVerified
{
  return 0;
}

- (id)px_localIdentifier
{
  v1 = [a1 keyFace];
  uint64_t v2 = [v1 localIdentifier];

  return v2;
}

- (id)px_longStyleLocalizedName
{
  v1 = [a1 person];
  uint64_t v2 = objc_msgSend(v1, "px_longStyleLocalizedName");

  return v2;
}

- (id)px_localizedName
{
  v1 = [a1 person];
  uint64_t v2 = objc_msgSend(v1, "px_localizedName");

  return v2;
}

- (id)name
{
  v1 = [a1 person];
  uint64_t v2 = [v1 name];

  return v2;
}

- (uint64_t)numberOfAssets
{
  uint64_t v2 = [a1 person];
  v3 = [v2 photoLibrary];
  v4 = [v3 librarySpecificFetchOptions];

  [v4 setShouldPrefetchCount:1];
  v5 = (void *)MEMORY[0x1E4F38EB8];
  v6 = [a1 person];
  v7 = [v5 fetchAssetsForPerson:v6 options:v4];

  uint64_t v8 = [v7 count];
  return v8;
}

- (uint64_t)requestFaceCropImageWithTargetSize:()PXPerson displayScale:cropFactor:style:cacheResult:synchronous:resultHandler:
{
  id v18 = a10;
  v19 = [PXPeopleFaceCropFetchOptions alloc];
  v20 = [a1 keyFace];
  v21 = -[PXPeopleFaceCropFetchOptions initWithFace:targetSize:displayScale:](v19, "initWithFace:targetSize:displayScale:", v20, a2, a3, a4);

  [(PXPeopleFaceCropFetchOptions *)v21 setCropFactor:a6];
  [(PXPeopleFaceCropFetchOptions *)v21 setCornerStyle:a7];
  [(PXPeopleFaceCropFetchOptions *)v21 setShouldCacheResult:a8];
  [(PXPeopleFaceCropFetchOptions *)v21 setIsSynchronous:a9];
  v22 = +[PXPeopleFaceCropManager sharedManager];
  uint64_t v23 = [v22 requestFaceCropForOptions:v21 resultHandler:v18];

  return v23;
}

@end