@interface PGStoryRecipeBuilder
+ (id)_appleSongAssetFromAppleMusicCuration:(id)a3;
+ (id)_keyFlexSongAssetFromFlexMusicCuration:(id)a3;
+ (id)_storyRecipeWithKeyAppleMusicSongAsset:(id)a3 keyFlexSongAsset:(id)a4 isAppleMusicSubscriber:(BOOL)a5 shouldAvoidColorGrading:(BOOL)a6;
+ (id)storyRecipeForMemory:(id)a3 appleMusicCuration:(id)a4 flexMusicCuration:(id)a5 shouldAvoidColorGrading:(BOOL)a6 isAppleMusicSubscriber:(BOOL)a7 error:(id *)a8;
@end

@implementation PGStoryRecipeBuilder

+ (id)_appleSongAssetFromAppleMusicCuration:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 keySongAdamID];
  if ([v4 length])
  {
    v5 = [v3 keySongArousal];
    v6 = [v3 keySongValence];
    v7 = v6;
    if (v5 && v6)
    {
      [v6 doubleValue];
      [v5 doubleValue];
      v8 = PFStoryColorGradeCategoryFromValenceArousal();
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v4;
        _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[PGMemoryPhotosGraphProperties] Failed to assign color grade category for key apple music song (%@) because arousal and valence information was not available.", buf, 0xCu);
      }
      v8 = 0;
    }
    v10 = (void *)MEMORY[0x1E4F8CDD8];
    uint64_t v11 = *MEMORY[0x1E4F8D298];
    v12 = [v3 keySongTitle];
    v13 = [v3 keySongArtist];
    v9 = [v10 createAssetWithCategory:1 subcategory:1 catalog:v11 songID:v4 title:v12 subtitle:v13 colorGradeCategory:v8];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)_keyFlexSongAssetFromFlexMusicCuration:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 bestSongSuggestions];
  v4 = [v3 firstObject];

  v5 = [v4 uid];
  if ([v5 length])
  {
    v30 = v5;
    v31 = v4;
    id v6 = v4;
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v8 = [v6 tagIDs];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:buf count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v33 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v32 + 1) + 8 * i) componentsSeparatedByString:@"_"];
          if ([v13 count] == 2)
          {
            v14 = [v13 objectAtIndexedSubscript:0];
            v15 = [v13 objectAtIndexedSubscript:1];
            [v7 setObject:v15 forKeyedSubscript:v14];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:buf count:16];
      }
      while (v10);
    }

    v16 = [v7 objectForKeyedSubscript:@"Arousal"];
    uint64_t v17 = [v7 objectForKeyedSubscript:@"Valence"];
    v18 = v17;
    if (v16 && v17)
    {
      [v17 doubleValue];
      [v16 doubleValue];
      v19 = PFStoryColorGradeCategoryFromValenceArousal();
      v5 = v30;
      v4 = v31;
    }
    else
    {
      v21 = [v7 objectForKeyedSubscript:@"Mood"];
      if (PHMemoryMoodForString())
      {

        v5 = v30;
        v4 = v31;
      }
      else
      {
        v5 = v30;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v37 = v21;
          _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[PGMemoryPhotosGraphProperties] unsupported Flex Mood tag '%@'", buf, 0xCu);
        }

        v4 = v31;
      }
      v19 = PFStoryColorGradeCategoryNamed();
    }

    v22 = [v6 arousal];
    uint64_t v23 = [v6 valence];
    v24 = (void *)v23;
    if ((!v22 || !v23) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v5;
      _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[PGMemoryPhotosGraphProperties] Failed to assign proper color grade category for key flex song (%@) because arousal OR valence information was not available.", buf, 0xCu);
    }
    v25 = (void *)MEMORY[0x1E4F8CDD8];
    uint64_t v26 = *MEMORY[0x1E4F8D2A0];
    v27 = [v6 songName];
    v28 = [v6 artistName];
    v20 = [v25 createAssetWithCategory:1 subcategory:1 catalog:v26 songID:v5 title:v27 subtitle:v28 colorGradeCategory:v19];
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (id)_storyRecipeWithKeyAppleMusicSongAsset:(id)a3 keyFlexSongAsset:(id)a4 isAppleMusicSubscriber:(BOOL)a5 shouldAvoidColorGrading:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = (id)*MEMORY[0x1E4F8D2A0];
  v12 = (void **)MEMORY[0x1E4F8D298];
  id v13 = v11;
  if (v7)
  {
    id v13 = (id)*MEMORY[0x1E4F8D298];
  }
  v14 = [MEMORY[0x1E4F8CDD0] createRecipe];
  v15 = (void *)[v14 mutableCopyWithZone:0];

  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v9
    && ([v15 addAsset:v9],
        [v9 identifier],
        uint64_t v17 = objc_claimAutoreleasedReturnValue(),
        id v18 = *v12,
        [v16 setObject:v17 forKeyedSubscript:v18],
        v17,
        v13 == v18))
  {
    v19 = [v9 colorGradeCategory];
    if (!v10) {
      goto LABEL_14;
    }
  }
  else
  {
    v19 = 0;
    if (!v10) {
      goto LABEL_14;
    }
  }
  [v15 addAsset:v10];
  v20 = [v10 identifier];
  [v16 setObject:v20 forKeyedSubscript:v11];

  if (v13 == v11 || v19 == 0)
  {
    uint64_t v22 = [v10 colorGradeCategory];

    v19 = (void *)v22;
  }
LABEL_14:
  uint64_t v23 = (void *)[v16 copy];
  [v15 setSeedSongIdentifiersByCatalog:v23];

  v24 = [MEMORY[0x1E4F8CDE0] createStyleWithOriginalColorGradeCategory:v19 customColorGradeKind:v6 songAssetIdentifier:0 isCustomized:0];
  [v15 setCurrentStyle:v24];

  return v15;
}

+ (id)storyRecipeForMemory:(id)a3 appleMusicCuration:(id)a4 flexMusicCuration:(id)a5 shouldAvoidColorGrading:(BOOL)a6 isAppleMusicSubscriber:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v13 = a4;
  uint64_t v14 = [a1 _keyFlexSongAssetFromFlexMusicCuration:a5];
  uint64_t v15 = [a1 _appleSongAssetFromAppleMusicCuration:v13];

  if (v14 | v15)
  {
    id v16 = [a1 _storyRecipeWithKeyAppleMusicSongAsset:v15 keyFlexSongAsset:v14 isAppleMusicSubscriber:v9 shouldAvoidColorGrading:v10];
  }
  else if (a8)
  {
    +[PGError errorWithCode:-3 description:@"Neither curation has a valid key song"];
    id v16 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

@end