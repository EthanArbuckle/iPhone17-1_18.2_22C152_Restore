@interface PFStoryRecipeArchiver
+ (NSDictionary)stringByAssetKind;
+ (NSDictionary)stringByClipMotionStyle;
+ (NSDictionary)stringByClipPlaybackStyle;
+ (NSDictionary)stringByClipTransition;
+ (NSDictionary)stringByDisplayAssetCategory;
+ (NSDictionary)stringByLibraryKind;
+ (NSDictionary)stringByOverallDurationKind;
+ (NSDictionary)stringBySongCategory;
+ (NSDictionary)stringBySongSubcategory;
- (id)_archivedJSONObjectWithDurationInfo:(id *)a3;
- (id)_archivedJSONObjectWithOverallDurationInfo:(id *)a3;
- (id)archivedDataWithRecipe:(id)a3;
- (id)archivedJSONDataWithRecipe:(id)a3 options:(unint64_t)a4;
- (id)archivedJSONObjectWithAsset:(id)a3;
- (id)archivedJSONObjectWithAutoEditDecisionList:(id)a3;
- (id)archivedJSONObjectWithCMTime:(id *)a3;
- (id)archivedJSONObjectWithClip:(id)a3;
- (id)archivedJSONObjectWithLibrary:(id)a3;
- (id)archivedJSONObjectWithPresentation:(id)a3;
- (id)archivedJSONObjectWithRecipe:(id)a3;
- (id)archivedJSONObjectWithStyle:(id)a3;
@end

@implementation PFStoryRecipeArchiver

- (id)archivedJSONObjectWithPresentation:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14[0] = @"identifier";
  v5 = [v4 identifier];
  v14[1] = @"clips";
  v15[0] = v5;
  uint64_t v6 = [v4 clipCount];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v6];
  if (v6 >= 1)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      v9 = [v4 clipAtIndex:i];
      v10 = [(PFStoryRecipeArchiver *)self archivedJSONObjectWithClip:v9];
      [v7 addObject:v10];
    }
  }
  v11 = (void *)[v7 copy];

  v15[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v12;
}

- (id)_archivedJSONObjectWithDurationInfo:(id *)a3
{
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  CMTime time1 = (CMTime)a3->var0;
  CMTime v11 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  if (CMTimeCompare(&time1, &v11) >= 1)
  {
    CMTime time1 = (CMTime)a3->var0;
    uint64_t v6 = [(PFStoryRecipeArchiver *)self archivedJSONObjectWithCMTime:&time1];
    [v5 setObject:v6 forKeyedSubscript:@"minimum"];
  }
  CMTime time1 = (CMTime)a3->var1;
  v7 = [(PFStoryRecipeArchiver *)self archivedJSONObjectWithCMTime:&time1];
  [v5 setObject:v7 forKeyedSubscript:@"preferred"];

  if ((a3->var2.var2 & 0x1D) == 1)
  {
    CMTime time1 = (CMTime)a3->var2;
    v8 = [(PFStoryRecipeArchiver *)self archivedJSONObjectWithCMTime:&time1];
    [v5 setObject:v8 forKeyedSubscript:@"maximum"];
  }
  v9 = (void *)[v5 copy];

  return v9;
}

- (id)archivedJSONObjectWithCMTime:(id *)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"value";
  id v4 = [NSNumber numberWithLongLong:a3->var0];
  v8[1] = @"timescale";
  v9[0] = v4;
  v5 = [NSNumber numberWithInt:a3->var1];
  v9[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

- (id)archivedJSONObjectWithClip:(id)a3
{
  v28[8] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27[0] = @"assetIdentifier";
  v22 = [v4 assetIdentifier];
  v28[0] = v22;
  v27[1] = @"playbackStyle";
  v5 = +[PFStoryRecipeArchiver stringByClipPlaybackStyle];
  v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "playbackStyle"));
  v21 = v5;
  v19 = objc_msgSend(v5, "objectForKeyedSubscript:");
  v28[1] = v19;
  v27[2] = @"minimumDuration";
  if (v4) {
    [v4 minimumDuration];
  }
  else {
    memset(v26, 0, sizeof(v26));
  }
  v18 = [(PFStoryRecipeArchiver *)self archivedJSONObjectWithCMTime:v26];
  v28[2] = v18;
  v27[3] = @"idealDuration";
  if (v4) {
    [v4 idealDuration];
  }
  else {
    memset(v25, 0, sizeof(v25));
  }
  uint64_t v16 = [(PFStoryRecipeArchiver *)self archivedJSONObjectWithCMTime:v25];
  v28[3] = v16;
  v27[4] = @"maximumDuration";
  if (v4) {
    objc_msgSend(v4, "maximumDuration", v16, v18, v19);
  }
  else {
    memset(v24, 0, sizeof(v24));
  }
  uint64_t v6 = -[PFStoryRecipeArchiver archivedJSONObjectWithCMTime:](self, "archivedJSONObjectWithCMTime:", v24, v16);
  v28[4] = v6;
  v27[5] = @"videoCueOffset";
  if (v4) {
    [v4 videoCueOffset];
  }
  else {
    memset(v23, 0, sizeof(v23));
  }
  v7 = [(PFStoryRecipeArchiver *)self archivedJSONObjectWithCMTime:v23];
  v28[5] = v7;
  v27[6] = @"motionStyle";
  v8 = +[PFStoryRecipeArchiver stringByClipMotionStyle];
  v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "motionStyle"));
  v10 = [v8 objectForKeyedSubscript:v9];
  v28[6] = v10;
  v27[7] = @"transition";
  CMTime v11 = +[PFStoryRecipeArchiver stringByClipTransition];
  v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "transition"));
  v13 = [v11 objectForKeyedSubscript:v12];
  v28[7] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:8];

  return v14;
}

- (id)archivedJSONObjectWithAutoEditDecisionList:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v13 = @"clips";
  uint64_t v5 = [v4 numberOfClips];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v5];
  if (v5 >= 1)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      v8 = [v4 clipAtIndex:i];
      v9 = [(PFStoryRecipeArchiver *)self archivedJSONObjectWithClip:v8];
      [v6 addObject:v9];
    }
  }
  v10 = (void *)[v6 copy];

  v14[0] = v10;
  CMTime v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];

  return v11;
}

- (id)archivedJSONObjectWithStyle:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] initWithCapacity:3];
  uint64_t v6 = [v4 identifier];
  [v5 setObject:v6 forKeyedSubscript:@"id"];

  v7 = [v4 originalColorGradeCategory];
  [v5 setObject:v7 forKeyedSubscript:@"originalColorGradeCategory"];

  v8 = PFStoryColorGradeKindToString([v4 customColorGradeKind]);
  [v5 setObject:v8 forKeyedSubscript:@"customColorGradeKind"];

  v9 = [v4 songAssetIdentifier];
  [v5 setObject:v9 forKeyedSubscript:@"songAsset"];

  v10 = NSNumber;
  uint64_t v11 = [v4 isCustomized];

  v12 = [v10 numberWithBool:v11];
  [v5 setObject:v12 forKeyedSubscript:@"isCustomized"];

  v13 = (void *)[v5 copy];

  return v13;
}

- (id)_archivedJSONObjectWithOverallDurationInfo:(id *)a3
{
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
  uint64_t v6 = +[PFStoryRecipeArchiver stringByOverallDurationKind];
  v7 = [NSNumber numberWithInteger:a3->var0];
  v8 = [v6 objectForKeyedSubscript:v7];
  [v5 setObject:v8 forKeyedSubscript:@"kind"];

  if (a3->var0 == 2)
  {
    long long v9 = *(_OWORD *)&a3->var1.var0.var3;
    long long v10 = *(_OWORD *)&a3->var1.var2.var0;
    void v14[2] = *(_OWORD *)&a3->var1.var1.var1;
    v14[3] = v10;
    int64_t var3 = a3->var1.var2.var3;
    v14[0] = *(_OWORD *)&a3->var1.var0.var0;
    v14[1] = v9;
    uint64_t v11 = [(PFStoryRecipeArchiver *)self _archivedJSONObjectWithDurationInfo:v14];
    [v5 setObject:v11 forKeyedSubscript:@"specificDuration"];
  }
  v12 = (void *)[v5 copy];

  return v12;
}

- (id)archivedJSONObjectWithAsset:(id)a3
{
  v31[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v30[0] = @"id";
  id v4 = [v3 identifier];
  v31[0] = v4;
  v30[1] = @"kind";
  uint64_t v5 = +[PFStoryRecipeArchiver stringByAssetKind];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "kind"));
  v7 = [v5 objectForKeyedSubscript:v6];
  v31[1] = v7;
  v30[2] = @"url";
  v8 = [v3 url];
  long long v9 = [v8 absoluteString];
  v31[2] = v9;
  long long v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];
  uint64_t v11 = (void *)[v10 mutableCopy];

  uint64_t v12 = [v3 kind];
  if (v12 != 2)
  {
    if (v12 != 1) {
      goto LABEL_8;
    }
    id v13 = v3;
    id v14 = +[PFStoryRecipeArchiver stringByDisplayAssetCategory];
    v15 = NSNumber;
    uint64_t v16 = [v13 category];

    v17 = [v15 numberWithInteger:v16];
    v18 = [v14 objectForKeyedSubscript:v17];
    [v11 setObject:v18 forKeyedSubscript:@"category"];

    goto LABEL_6;
  }
  id v14 = v3;
  v19 = +[PFStoryRecipeArchiver stringBySongCategory];
  v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "category"));
  v21 = [v19 objectForKeyedSubscript:v20];
  [v11 setObject:v21 forKeyedSubscript:@"category"];

  v22 = +[PFStoryRecipeArchiver stringBySongSubcategory];
  v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "subcategory"));
  v24 = [v22 objectForKeyedSubscript:v23];
  [v11 setObject:v24 forKeyedSubscript:@"subcategory"];

  v25 = [v14 title];
  [v11 setObject:v25 forKeyedSubscript:@"title"];

  v26 = [v14 subtitle];
  [v11 setObject:v26 forKeyedSubscript:@"subtitle"];

  v27 = [v14 colorGradeCategory];

  if (v27)
  {
    v17 = [v14 colorGradeCategory];
    [v11 setObject:v17 forKeyedSubscript:@"colorGradeCategory"];
LABEL_6:
  }
LABEL_8:
  v28 = (void *)[v11 copy];

  return v28;
}

- (id)archivedJSONObjectWithLibrary:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"kind";
  id v3 = a3;
  id v4 = +[PFStoryRecipeArchiver stringByLibraryKind];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "kind"));
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];
  v11[1] = @"url";
  v12[0] = v6;
  v7 = [v3 url];

  v8 = [v7 absoluteString];
  v12[1] = v8;
  long long v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (id)archivedJSONObjectWithRecipe:(id)a3
{
  v65[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v64[0] = @"header";
  v62[0] = @"content";
  id v4 = [v3 contentIdentifier];
  v62[1] = @"version";
  v63[0] = v4;
  uint64_t v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"%li.%li", objc_msgSend(v3, "majorVersion"), objc_msgSend(v3, "minorVersion"));
  v63[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:2];
  v64[1] = @"resources";
  v65[0] = v6;
  v60 = @"assets";
  uint64_t v7 = [v3 numberOfAssets];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v7];
  if (v7 >= 1)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      long long v10 = [v3 assetAtIndex:i];
      uint64_t v11 = [(PFStoryRecipeArchiver *)self archivedJSONObjectWithAsset:v10];
      [v8 addObject:v11];
    }
  }
  uint64_t v12 = (void *)[v8 copy];

  v61 = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
  v65[1] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:2];
  v37 = (void *)[v14 mutableCopy];

  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__9136;
  v57 = __Block_byref_object_dispose__9137;
  id v58 = 0;
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __54__PFStoryRecipeArchiver_archivedJSONObjectWithRecipe___block_invoke;
  v49[3] = &unk_1E5B2ED50;
  id v15 = v3;
  id v50 = v15;
  v51 = self;
  v52 = &v53;
  PFStoryRecipeLibraryKindEnumerateSupportedValuesUsingBlock(v49);
  uint64_t v16 = (void *)[(id)v54[5] copy];
  [v37 setObject:v16 forKeyedSubscript:@"libraries"];

  if (v15)
  {
    [v15 overallDurationInfo];
    if ((void)v44)
    {
      [v15 overallDurationInfo];
      v17 = [(PFStoryRecipeArchiver *)self _archivedJSONObjectWithOverallDurationInfo:v43];
      [v37 setObject:v17 forKeyedSubscript:@"overallDuration"];
    }
  }
  else
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v44 = 0u;
  }
  v36 = [v15 currentStyle];
  if (v36)
  {
    v18 = [(PFStoryRecipeArchiver *)self archivedJSONObjectWithStyle:v36];
    [v37 setObject:v18 forKeyedSubscript:@"currentStyle"];
  }
  v35 = [v15 seedSongIdentifiersByCatalog];
  if (v35) {
    [v37 setObject:v35 forKeyedSubscript:@"seedSongIdentifiers"];
  }
  v19 = [v15 autoEditDecisionLists];
  BOOL v20 = v19 == 0;

  if (!v20)
  {
    v21 = [v15 autoEditDecisionLists];
    uint64_t v22 = [v21 count];

    v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v22];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v24 = [v15 autoEditDecisionLists];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v39 objects:v59 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v40 != v26) {
            objc_enumerationMutation(v24);
          }
          uint64_t v28 = *(void *)(*((void *)&v39 + 1) + 8 * j);
          v29 = [v15 autoEditDecisionLists];
          v30 = [v29 objectForKeyedSubscript:v28];
          v31 = [(PFStoryRecipeArchiver *)self archivedJSONObjectWithAutoEditDecisionList:v30];
          [v23 setObject:v31 forKeyedSubscript:v28];
        }
        uint64_t v25 = [v24 countByEnumeratingWithState:&v39 objects:v59 count:16];
      }
      while (v25);
    }

    v32 = (void *)[v23 copy];
    [v37 setObject:v32 forKeyedSubscript:@"autoEditDecisionLists"];
  }
  v33 = (void *)[v37 copy];

  _Block_object_dispose(&v53, 8);

  return v33;
}

uint64_t __54__PFStoryRecipeArchiver_archivedJSONObjectWithRecipe___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) libraryWithKind:a2];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v11 = v3;
    if (!v5)
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
      uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
      v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    }
    long long v9 = [*(id *)(a1 + 40) archivedJSONObjectWithLibrary:v11];
    [v5 addObject:v9];

    uint64_t v4 = v11;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (id)archivedJSONDataWithRecipe:(id)a3 options:(unint64_t)a4
{
  uint64_t v5 = [(PFStoryRecipeArchiver *)self archivedJSONObjectWithRecipe:a3];
  uint64_t v8 = 0;
  uint64_t v6 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v5 options:a4 error:&v8];

  return v6;
}

- (id)archivedDataWithRecipe:(id)a3
{
  return [(PFStoryRecipeArchiver *)self archivedJSONDataWithRecipe:a3 options:0];
}

+ (NSDictionary)stringByClipTransition
{
  if (stringByClipTransition_onceToken != -1) {
    dispatch_once(&stringByClipTransition_onceToken, &__block_literal_global_176);
  }
  v2 = (void *)stringByClipTransition_result;

  return (NSDictionary *)v2;
}

void __47__PFStoryRecipeArchiver_stringByClipTransition__block_invoke()
{
  v3[9] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1EF7CA928;
  v2[1] = &unk_1EF7CA940;
  v3[0] = @"none";
  v3[1] = @"cut";
  v2[2] = &unk_1EF7CA958;
  v2[3] = &unk_1EF7CA970;
  v3[2] = @"crossfade";
  v3[3] = @"fadetoblack";
  v2[4] = &unk_1EF7CA988;
  v2[5] = &unk_1EF7CA9A0;
  v3[4] = @"exposurebleed";
  v3[5] = @"pan";
  v2[6] = &unk_1EF7CA9B8;
  v2[7] = &unk_1EF7CA9D0;
  v3[6] = @"scale";
  v3[7] = @"rotate";
  v2[8] = &unk_1EF7CA9E8;
  v3[8] = @"wipe";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:9];
  v1 = (void *)stringByClipTransition_result;
  stringByClipTransition_result = v0;
}

+ (NSDictionary)stringByClipMotionStyle
{
  if (stringByClipMotionStyle_onceToken != -1) {
    dispatch_once(&stringByClipMotionStyle_onceToken, &__block_literal_global_165);
  }
  v2 = (void *)stringByClipMotionStyle_result;

  return (NSDictionary *)v2;
}

void __48__PFStoryRecipeArchiver_stringByClipMotionStyle__block_invoke()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1EF7CA928;
  v2[1] = &unk_1EF7CA940;
  v3[0] = @"none";
  v3[1] = @"pan";
  v2[2] = &unk_1EF7CA958;
  v2[3] = &unk_1EF7CA970;
  v3[2] = @"scale";
  v3[3] = @"rotate";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:4];
  v1 = (void *)stringByClipMotionStyle_result;
  stringByClipMotionStyle_result = v0;
}

+ (NSDictionary)stringByClipPlaybackStyle
{
  if (stringByClipPlaybackStyle_onceToken != -1) {
    dispatch_once(&stringByClipPlaybackStyle_onceToken, &__block_literal_global_145);
  }
  v2 = (void *)stringByClipPlaybackStyle_result;

  return (NSDictionary *)v2;
}

void __50__PFStoryRecipeArchiver_stringByClipPlaybackStyle__block_invoke()
{
  v3[6] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1EF7CA928;
  v2[1] = &unk_1EF7CA940;
  v3[0] = @"unsupported";
  v3[1] = @"image";
  v2[2] = &unk_1EF7CA958;
  v2[3] = &unk_1EF7CA970;
  v3[2] = @"animatedImage";
  v3[3] = @"livePhoto";
  void v2[4] = &unk_1EF7CA988;
  v2[5] = &unk_1EF7CA9A0;
  v3[4] = @"video";
  void v3[5] = @"loopingVideo";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:6];
  v1 = (void *)stringByClipPlaybackStyle_result;
  stringByClipPlaybackStyle_result = v0;
}

+ (NSDictionary)stringByOverallDurationKind
{
  if (stringByOverallDurationKind_onceToken != -1) {
    dispatch_once(&stringByOverallDurationKind_onceToken, &__block_literal_global_128_9232);
  }
  v2 = (void *)stringByOverallDurationKind_result;

  return (NSDictionary *)v2;
}

void __52__PFStoryRecipeArchiver_stringByOverallDurationKind__block_invoke()
{
  v3[6] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1EF7CA928;
  v2[1] = &unk_1EF7CA940;
  v3[0] = @"undefined";
  v3[1] = @"default";
  v2[2] = &unk_1EF7CA958;
  v2[3] = &unk_1EF7CA970;
  v3[2] = @"custom";
  v3[3] = @"short";
  void v2[4] = &unk_1EF7CA988;
  v2[5] = &unk_1EF7CA9A0;
  v3[4] = @"medium";
  void v3[5] = @"long";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:6];
  v1 = (void *)stringByOverallDurationKind_result;
  stringByOverallDurationKind_result = v0;
}

+ (NSDictionary)stringBySongSubcategory
{
  if (stringBySongSubcategory_onceToken[0] != -1) {
    dispatch_once(stringBySongSubcategory_onceToken, &__block_literal_global_109);
  }
  v2 = (void *)stringBySongSubcategory_result;

  return (NSDictionary *)v2;
}

void __48__PFStoryRecipeArchiver_stringBySongSubcategory__block_invoke()
{
  v3[6] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1EF7CA928;
  v2[1] = &unk_1EF7CA940;
  v3[0] = @"none";
  v3[1] = @"bestSuggestions";
  v2[2] = &unk_1EF7CA958;
  v2[3] = &unk_1EF7CA970;
  v3[2] = @"userBasedSuggestions";
  v3[3] = @"locationBasedSuggestions";
  void v2[4] = &unk_1EF7CA988;
  v2[5] = &unk_1EF7CA9A0;
  v3[4] = @"timeBasedSuggestions";
  void v3[5] = @"performerBasedSuggestions";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:6];
  v1 = (void *)stringBySongSubcategory_result;
  stringBySongSubcategory_result = v0;
}

+ (NSDictionary)stringBySongCategory
{
  if (stringBySongCategory_onceToken[0] != -1) {
    dispatch_once(stringBySongCategory_onceToken, &__block_literal_global_104);
  }
  v2 = (void *)stringBySongCategory_result;

  return (NSDictionary *)v2;
}

void __45__PFStoryRecipeArchiver_stringBySongCategory__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1EF7CA928;
  v2[1] = &unk_1EF7CA940;
  v3[0] = @"none";
  v3[1] = @"autoSuggested";
  v2[2] = &unk_1EF7CA958;
  v3[2] = @"userPicked";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)stringBySongCategory_result;
  stringBySongCategory_result = v0;
}

+ (NSDictionary)stringByDisplayAssetCategory
{
  if (stringByDisplayAssetCategory_onceToken != -1) {
    dispatch_once(&stringByDisplayAssetCategory_onceToken, &__block_literal_global_83);
  }
  v2 = (void *)stringByDisplayAssetCategory_result;

  return (NSDictionary *)v2;
}

void __53__PFStoryRecipeArchiver_stringByDisplayAssetCategory__block_invoke()
{
  void v3[5] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1EF7CA928;
  v2[1] = &unk_1EF7CA940;
  v3[0] = @"none";
  v3[1] = @"autoPicked";
  v2[2] = &unk_1EF7CA958;
  void v2[3] = &unk_1EF7CA970;
  v3[2] = @"autoRejected";
  v3[3] = @"userPicked";
  void v2[4] = &unk_1EF7CA988;
  void v3[4] = @"userRejected";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:5];
  v1 = (void *)stringByDisplayAssetCategory_result;
  stringByDisplayAssetCategory_result = v0;
}

+ (NSDictionary)stringByAssetKind
{
  if (stringByAssetKind_onceToken[0] != -1) {
    dispatch_once(stringByAssetKind_onceToken, &__block_literal_global_73);
  }
  v2 = (void *)stringByAssetKind_result;

  return (NSDictionary *)v2;
}

void __42__PFStoryRecipeArchiver_stringByAssetKind__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1EF7CA928;
  v2[1] = &unk_1EF7CA940;
  v3[0] = @"undefined";
  v3[1] = @"displayAsset";
  v2[2] = &unk_1EF7CA958;
  v3[2] = @"song";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)stringByAssetKind_result;
  stringByAssetKind_result = v0;
}

+ (NSDictionary)stringByLibraryKind
{
  if (stringByLibraryKind_onceToken[0] != -1) {
    dispatch_once(stringByLibraryKind_onceToken, &__block_literal_global_9288);
  }
  v2 = (void *)stringByLibraryKind_result;

  return (NSDictionary *)v2;
}

void __44__PFStoryRecipeArchiver_stringByLibraryKind__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1EF7CA928;
  v2[1] = &unk_1EF7CA940;
  v3[0] = @"undefined";
  v3[1] = @"photoLibrary";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)stringByLibraryKind_result;
  stringByLibraryKind_result = v0;
}

@end