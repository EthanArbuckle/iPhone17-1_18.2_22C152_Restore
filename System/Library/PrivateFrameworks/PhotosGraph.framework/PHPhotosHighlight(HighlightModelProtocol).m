@interface PHPhotosHighlight(HighlightModelProtocol)
+ (id)fetchParentDayGroupHighlightsForDayHighlights:()HighlightModelProtocol;
- (BOOL)isUpToDate;
- (double)nonDefaultCurationScorePercentageForPhotoLibrary:()HighlightModelProtocol;
- (uint64_t)changeRequest;
- (uint64_t)faceAnalysisProgressForPhotoLibrary:()HighlightModelProtocol;
- (uint64_t)sceneAnalysisProgressForPhotoLibrary:()HighlightModelProtocol;
@end

@implementation PHPhotosHighlight(HighlightModelProtocol)

- (uint64_t)changeRequest
{
  return [MEMORY[0x1E4F39240] changeRequestForPhotosHighlight:a1];
}

- (double)nonDefaultCurationScorePercentageForPhotoLibrary:()HighlightModelProtocol
{
  id v4 = a3;
  uint64_t v5 = [a1 estimatedAssetCount];
  if (v5)
  {
    unint64_t v6 = v5;
    v7 = [v4 librarySpecificFetchOptions];
    [v7 setShouldPrefetchCount:1];
    [v7 setIncludeGuestAssets:1];
    v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"curationScore != 0.5 && curationScore != 0.0"];
    [v7 setInternalPredicate:v8];

    v9 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:a1 options:v7];
    double v10 = (double)(unint64_t)[v9 count] / (double)v6;
  }
  else
  {
    double v10 = 0.0;
  }

  return v10;
}

- (uint64_t)sceneAnalysisProgressForPhotoLibrary:()HighlightModelProtocol
{
  return [a3 sceneAnalysisProgressForHighlight:a1];
}

- (uint64_t)faceAnalysisProgressForPhotoLibrary:()HighlightModelProtocol
{
  return [a3 faceAnalysisProgressForHighlight:a1];
}

- (BOOL)isUpToDate
{
  int v2 = [a1 enrichmentVersion];
  return v2 == [a1 highlightVersion];
}

+ (id)fetchParentDayGroupHighlightsForDayHighlights:()HighlightModelProtocol
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v3, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v6)
  {
    v16 = (void *)MEMORY[0x1E4F1CBF0];
    v8 = v5;
    goto LABEL_13;
  }
  uint64_t v7 = v6;
  v8 = 0;
  uint64_t v9 = *(void *)v19;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v19 != v9) {
        objc_enumerationMutation(v5);
      }
      v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      v12 = [v11 objectID];
      [v4 addObject:v12];

      if (!v8)
      {
        v8 = [v11 photoLibrary];
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v7);

  if (v8)
  {
    v13 = [v8 librarySpecificFetchOptions];
    v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY childDayGroupPhotosHighlights IN %@", v4];
    [v13 setInternalPredicate:v14];

    v15 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:6 subtype:1000000304 options:v13];
    v16 = [v15 fetchedObjects];

LABEL_13:
    goto LABEL_15;
  }
  v16 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_15:

  return v16;
}

@end