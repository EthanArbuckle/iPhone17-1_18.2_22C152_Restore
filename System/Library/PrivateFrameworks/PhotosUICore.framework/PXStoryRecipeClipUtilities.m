@interface PXStoryRecipeClipUtilities
+ (BOOL)asset:(id)a3 isClassifiedAs:(id)a4;
+ (BOOL)assetHasHighCurationScore:(id)a3;
+ (BOOL)assetHasSignificantFaceArea:(id)a3;
+ (BOOL)assetIsPet:(id)a3;
+ (BOOL)assetIsPortrait:(id)a3;
+ (BOOL)assetIsPortraitAspectWithLargeVerticalFaceArea:(id)a3;
+ (BOOL)canRotate1UpClipsInRange:(_NSRange)a3 clipCatalog:(id)a4 maxAdjacent1Ups:(int64_t)a5;
+ (BOOL)canRotateAsset:(id)a3;
+ (id)doNotRotateSceneIdentifiers;
+ (id)doNotRotateWithSkySceneIdentifiers;
+ (id)peopleSceneIdentifiers;
+ (id)petSceneIdentifiers;
+ (id)skySceneIdentifiers;
@end

@implementation PXStoryRecipeClipUtilities

+ (BOOL)canRotate1UpClipsInRange:(_NSRange)a3 clipCatalog:(id)a4 maxAdjacent1Ups:(int64_t)a5
{
  int64_t v5 = 0x7FFFFFFFLL;
  if (a5) {
    int64_t v5 = a5;
  }
  int64_t v19 = v5;
  NSUInteger v6 = a3.location + a3.length;
  if (a3.location < a3.location + a3.length)
  {
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    BOOL v10 = 0;
    int64_t v11 = 0;
    do
    {
      v12 = [a4 clipAtIndex:location];
      v13 = [v12 displayAssets];
      uint64_t v14 = [v13 count];

      if (v14 == 1)
      {
        if (v11 >= v19
          || ([v12 displayAssets],
              v15 = objc_claimAutoreleasedReturnValue(),
              [v15 firstObject],
              v16 = objc_claimAutoreleasedReturnValue(),
              BOOL v17 = +[PXStoryRecipeClipUtilities canRotateAsset:v16], v16, v15, !v17))
        {

          return v10;
        }
        ++v11;
      }
      else
      {
        int64_t v11 = 0;
      }

      BOOL v10 = ++location >= v6;
      --length;
    }
    while (length);
  }
  return 1;
}

+ (BOOL)assetHasHighCurationScore:(id)a3
{
  id v3 = a3;
  v4 = +[PXStorySettings sharedInstance];
  [v4 autoEditHighCurationScoreThreshold];
  double v6 = v5;

  objc_msgSend(v3, "px_storyResourceFetchCurationScore");
  LOBYTE(v4) = v7 >= v6;

  return (char)v4;
}

+ (BOOL)canRotateAsset:(id)a3
{
  id v4 = a3;
  double v5 = [a1 doNotRotateSceneIdentifiers];
  char v6 = [a1 asset:v4 isClassifiedAs:v5];

  if (v6) {
    goto LABEL_4;
  }
  double v7 = [a1 skySceneIdentifiers];
  int v8 = [a1 asset:v4 isClassifiedAs:v7];

  if (!v8) {
    goto LABEL_5;
  }
  v9 = [a1 doNotRotateWithSkySceneIdentifiers];
  char v10 = [a1 asset:v4 isClassifiedAs:v9];

  if (v10) {
LABEL_4:
  }
    BOOL v11 = 0;
  else {
LABEL_5:
  }
    BOOL v11 = objc_msgSend(v4, "px_storyResourceFetchFaceCount") < 2;

  return v11;
}

+ (id)doNotRotateWithSkySceneIdentifiers
{
  if (doNotRotateWithSkySceneIdentifiers_onceToken != -1) {
    dispatch_once(&doNotRotateWithSkySceneIdentifiers_onceToken, &__block_literal_global_222_38256);
  }
  v2 = (void *)doNotRotateWithSkySceneIdentifiers_skyPlusSceneIdentifiers;
  return v2;
}

void __64__PXStoryRecipeClipUtilities_doNotRotateWithSkySceneIdentifiers__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F02D3790];
  v1 = (void *)doNotRotateWithSkySceneIdentifiers_skyPlusSceneIdentifiers;
  doNotRotateWithSkySceneIdentifiers_skyPlusSceneIdentifiers = v0;
}

+ (id)skySceneIdentifiers
{
  if (skySceneIdentifiers_onceToken != -1) {
    dispatch_once(&skySceneIdentifiers_onceToken, &__block_literal_global_215);
  }
  v2 = (void *)skySceneIdentifiers_skySceneIdentifiers;
  return v2;
}

void __49__PXStoryRecipeClipUtilities_skySceneIdentifiers__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F02D3778];
  v1 = (void *)skySceneIdentifiers_skySceneIdentifiers;
  skySceneIdentifiers_skySceneIdentifiers = v0;
}

+ (id)doNotRotateSceneIdentifiers
{
  if (doNotRotateSceneIdentifiers_onceToken != -1) {
    dispatch_once(&doNotRotateSceneIdentifiers_onceToken, &__block_literal_global_204);
  }
  v2 = (void *)doNotRotateSceneIdentifiers_doNotRotateSceneIdentifiers;
  return v2;
}

void __57__PXStoryRecipeClipUtilities_doNotRotateSceneIdentifiers__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F02D3760];
  v1 = (void *)doNotRotateSceneIdentifiers_doNotRotateSceneIdentifiers;
  doNotRotateSceneIdentifiers_doNotRotateSceneIdentifiers = v0;
}

+ (BOOL)assetIsPet:(id)a3
{
  id v4 = a3;
  double v5 = [a1 petSceneIdentifiers];
  int v6 = [a1 asset:v4 isClassifiedAs:v5];

  BOOL v7 = v6 && ([a1 assetHasSignificantFaceArea:v4] & 1) != 0;
  return v7;
}

+ (id)petSceneIdentifiers
{
  if (petSceneIdentifiers_onceToken != -1) {
    dispatch_once(&petSceneIdentifiers_onceToken, &__block_literal_global_195);
  }
  v2 = (void *)petSceneIdentifiers_petSceneIdentifiers;
  return v2;
}

void __49__PXStoryRecipeClipUtilities_petSceneIdentifiers__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F02D3748];
  v1 = (void *)petSceneIdentifiers_petSceneIdentifiers;
  petSceneIdentifiers_petSceneIdentifiers = v0;
}

+ (BOOL)asset:(id)a3 isClassifiedAs:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = objc_msgSend(a3, "px_storyResourceFetchSceneClassifications");
  BOOL v7 = +[PXStorySettings sharedInstance];
  [v7 autoEditSceneConfidenceThreshold];
  double v9 = v8;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_msgSend(v14, "confidence", (void)v19);
        if (v15 >= v9)
        {
          v16 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v14, "extendedSceneIdentifier"));
          char v17 = [v5 containsObject:v16];

          if (v17)
          {
            LOBYTE(v11) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v11;
}

+ (BOOL)assetIsPortraitAspectWithLargeVerticalFaceArea:(id)a3
{
}

+ (BOOL)assetHasSignificantFaceArea:(id)a3
{
  [a3 faceAreaRect];
  double width = v9.size.width;
  double height = v9.size.height;
  if (CGRectIsEmpty(v9)) {
    return 0;
  }
  int v6 = +[PXStorySettings sharedInstance];
  [v6 autoEditPortraitAreaMin];
  double v8 = v7;

  return width * height >= v8;
}

+ (BOOL)assetIsPortrait:(id)a3
{
  return [a3 hasPeopleSceneMidOrGreaterConfidence];
}

+ (id)peopleSceneIdentifiers
{
  if (peopleSceneIdentifiers_onceToken != -1) {
    dispatch_once(&peopleSceneIdentifiers_onceToken, &__block_literal_global_38265);
  }
  v2 = (void *)peopleSceneIdentifiers_peopleSceneIdentifiers;
  return v2;
}

void __52__PXStoryRecipeClipUtilities_peopleSceneIdentifiers__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F02D3730];
  v1 = (void *)peopleSceneIdentifiers_peopleSceneIdentifiers;
  peopleSceneIdentifiers_peopleSceneIdentifiers = v0;
}

@end