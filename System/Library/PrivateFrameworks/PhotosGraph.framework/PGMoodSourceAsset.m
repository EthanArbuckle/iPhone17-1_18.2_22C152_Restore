@interface PGMoodSourceAsset
+ (id)_plistName;
- (double)weight;
- (id)_plistMoodIdentifiersWithGraph:(id)a3;
@end

@implementation PGMoodSourceAsset

+ (id)_plistName
{
  return @"MoodSourceAsset";
}

- (id)_plistMoodIdentifiersWithGraph:(id)a3
{
  v42[2] = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3);
  v5 = [(PGMoodSource *)self options];
  v6 = [v5 prefetchedAssets];

  if (!v6)
  {
    v7 = [(PGMoodSource *)self photoLibrary];
    v8 = [v7 librarySpecificFetchOptions];

    uint64_t v9 = *MEMORY[0x1E4F394E0];
    v42[0] = *MEMORY[0x1E4F39538];
    v42[1] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
    [v8 setFetchPropertySets:v10];

    v11 = +[PGCurationManager defaultAssetSortDescriptors];
    [v8 setSortDescriptors:v11];

    v12 = (void *)MEMORY[0x1E4F38EB8];
    v13 = [(PGMoodSource *)self assetCollection];
    v14 = [v12 fetchAssetsInAssetCollection:v13 options:v8];

    id v15 = objc_alloc(MEMORY[0x1E4F8E768]);
    v16 = [(PGMoodSource *)self photoLibrary];
    v17 = (void *)[v15 initWithPhotoLibrary:v16];

    v6 = [MEMORY[0x1E4F38EB8] clsAllAssetsFromFetchResult:v14 prefetchOptions:25 curationContext:v17];
    v18 = [(PGMoodSource *)self options];
    [v18 setPrefetchedAssets:v6];
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v19 = v6;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (!v20)
  {

    id v32 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_25;
  }
  uint64_t v21 = v20;
  v36 = v4;
  unint64_t v22 = 0;
  unint64_t v23 = 0;
  unint64_t v24 = 0;
  unint64_t v25 = 0;
  uint64_t v26 = *(void *)v38;
  do
  {
    for (uint64_t i = 0; i != v21; ++i)
    {
      if (*(void *)v38 != v26) {
        objc_enumerationMutation(v19);
      }
      v28 = *(void **)(*((void *)&v37 + 1) + 8 * i);
      uint64_t v29 = [v28 clsPeopleCount];
      if (v29)
      {
        ++v25;
        v22 += v29;
        v30 = [v28 clsFaceInformationSummary];
        unsigned int v31 = [v30 numberOfGoodFaces];

        v23 += v31;
        if (v31) {
          ++v24;
        }
      }
    }
    uint64_t v21 = [v19 countByEnumeratingWithState:&v37 objects:v41 count:16];
  }
  while (v21);

  if (v25 < 3)
  {
    id v32 = (id)MEMORY[0x1E4F1CBF0];
    v4 = v36;
    goto LABEL_25;
  }
  if ((double)v25 * 0.3 < (double)v24)
  {
    if ((double)v22 * 0.5 >= (double)v23) {
      v33 = @"SomeSmiles";
    }
    else {
      v33 = @"ManySmiles";
    }
    v4 = v36;
    goto LABEL_23;
  }
  double v34 = (double)v25 * 0.1;
  v4 = v36;
  if (v34 > (double)v24)
  {
    v33 = @"NoSmile";
LABEL_23:
    [v4 addObject:v33];
  }
  id v32 = v4;
LABEL_25:

  return v32;
}

- (double)weight
{
  return 0.5;
}

@end