@interface PGWallpaperSuggestionUtilities
+ (BOOL)foundDominantPeopleSceneInAsset:(id)a3 withConfidenceThresholdHelper:(id)a4;
+ (id)assetFetchPropertySetsIncludingGating:(BOOL)a3;
+ (id)peopleSceneConfidenceThresholdHelper;
+ (id)peopleShuffleDescriptorTitleWithCount:(unint64_t)a3;
@end

@implementation PGWallpaperSuggestionUtilities

+ (id)peopleShuffleDescriptorTitleWithCount:(unint64_t)a3
{
  v4 = NSString;
  v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"PGWallpaperPeopleShuffleWithCount %lu" value:@"PGWallpaperPeopleShuffleWithCount %lu" table:@"Localizable"];
  v7 = objc_msgSend(v4, "localizedStringWithFormat:", v6, a3);

  return v7;
}

+ (BOOL)foundDominantPeopleSceneInAsset:(id)a3 withConfidenceThresholdHelper:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 curationModel];
  v8 = [v6 confidenceThresholdBySceneIdentifierWithCurationModel:v7];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v9 = [v5 clsSceneClassifications];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v20 = v6;
    uint64_t v11 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v14 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v13, "extendedSceneIdentifier"));
        v15 = [v8 objectForKeyedSubscript:v14];

        if (v15)
        {
          [v13 confidence];
          double v17 = v16;
          [v15 doubleValue];
          if (v17 >= v18)
          {
            [v13 boundingBox];
            if (!NSIsEmptyRect(v27))
            {

              LOBYTE(v10) = 1;
              goto LABEL_13;
            }
          }
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v10) {
        continue;
      }
      break;
    }
LABEL_13:
    id v6 = v20;
  }

  return v10;
}

+ (id)peopleSceneConfidenceThresholdHelper
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F8E788]) initWithSceneNames:&unk_1F28D39C0 thresholdType:4];
  return v2;
}

+ (id)assetFetchPropertySetsIncludingGating:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = +[PGCurationManager assetPropertySetsForCuration];
  if (v3)
  {
    id v5 = +[PGWallpaperSuggestionAssetGater assetFetchPropertySetsForGating];
    id v6 = [v4 arrayByAddingObjectsFromArray:v5];

    v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
    v4 = [v7 allObjects];
  }
  return v4;
}

@end