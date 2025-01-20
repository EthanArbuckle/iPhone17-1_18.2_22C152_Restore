@interface PGMemoryMusicQuestionUtils
+ (id)extractKeySongInfoForMemory:(id)a3 isAppleMusicSubscriber:(BOOL)a4;
+ (id)extractStoryRecipeForMemory:(id)a3;
+ (void)enumerateMemoryMusicSuggestionsInPhotoLibrary:(id)a3 block:(id)a4;
@end

@implementation PGMemoryMusicQuestionUtils

+ (id)extractKeySongInfoForMemory:(id)a3 isAppleMusicSubscriber:(BOOL)a4
{
  BOOL v4 = a4;
  v42[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [a1 extractStoryRecipeForMemory:v6];
  v8 = v7;
  if (!v7)
  {
    v11 = PLStoryGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = [v6 uuid];
      int v31 = 138412290;
      v32 = v12;
      v13 = "[MusicQualityQuestion] Unable to extractStoryRecipeForMemory for PHMemory %@";
      v14 = v11;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      goto LABEL_7;
    }
LABEL_8:
    v16 = (void *)MEMORY[0x1E4F1CC08];
    goto LABEL_21;
  }
  v9 = [v7 currentStyle];
  int v10 = [v9 isCustomized];

  if (v10)
  {
    v11 = PLStoryGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = [v6 uuid];
      int v31 = 138412290;
      v32 = v12;
      v13 = "[MusicQualityQuestion] PHMemory %@ has a customized recipie so don't use for PhotosChallenge.";
      v14 = v11;
      os_log_type_t v15 = OS_LOG_TYPE_DEBUG;
LABEL_7:
      _os_log_impl(&dword_1D1805000, v14, v15, v13, (uint8_t *)&v31, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  uint64_t v17 = *MEMORY[0x1E4F8D298];
  v11 = [v8 seedSongAssetForCatalog:*MEMORY[0x1E4F8D298]];
  uint64_t v18 = *MEMORY[0x1E4F8D2A0];
  v19 = [v8 seedSongAssetForCatalog:*MEMORY[0x1E4F8D2A0]];
  v20 = v19;
  if (v4 && v11)
  {
    v41[0] = *MEMORY[0x1E4F8EA08];
    v21 = [v11 identifier];
    v42[0] = v21;
    v41[1] = *MEMORY[0x1E4F8EA10];
    v22 = [v11 title];
    v42[1] = v22;
    v41[2] = *MEMORY[0x1E4F8E9F8];
    v23 = [v11 subtitle];
    v41[3] = *MEMORY[0x1E4F8EA00];
    v42[2] = v23;
    v42[3] = v17;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:4];

    v24 = PLStoryGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      int v31 = 138412290;
      v32 = v16;
      v25 = "[MusicQualityQuestion] Using Apple Music key song %@";
LABEL_16:
      _os_log_impl(&dword_1D1805000, v24, OS_LOG_TYPE_DEBUG, v25, (uint8_t *)&v31, 0xCu);
    }
  }
  else
  {
    if (!v19)
    {
      v24 = PLStoryGetLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v29 = [v6 uuid];
        int v31 = 138413058;
        v32 = v29;
        __int16 v33 = 2112;
        uint64_t v34 = 0;
        __int16 v35 = 2112;
        uint64_t v36 = 0;
        __int16 v37 = 1024;
        BOOL v38 = v4;
        _os_log_impl(&dword_1D1805000, v24, OS_LOG_TYPE_ERROR, "[MusicQualityQuestion] PHMemory %@: Unable to get songInfo. \n keySongFlexMusic=%@ keySongFlexMusic=%@ _isAppleMusicSubscriber=%d", (uint8_t *)&v31, 0x26u);
      }
      v16 = (void *)MEMORY[0x1E4F1CC08];
      goto LABEL_20;
    }
    v39[0] = *MEMORY[0x1E4F8EA08];
    v26 = [v19 identifier];
    v40[0] = v26;
    v39[1] = *MEMORY[0x1E4F8EA10];
    v27 = [v20 title];
    v40[1] = v27;
    v39[2] = *MEMORY[0x1E4F8E9F8];
    v28 = [v20 subtitle];
    v39[3] = *MEMORY[0x1E4F8EA00];
    v40[2] = v28;
    v40[3] = v18;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:4];

    v24 = PLStoryGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      int v31 = 138412290;
      v32 = v16;
      v25 = "[MusicQualityQuestion] Using BCE key song %@";
      goto LABEL_16;
    }
  }
LABEL_20:

LABEL_21:
  return v16;
}

+ (id)extractStoryRecipeForMemory:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = [v3 photosGraphProperties];
  v5 = [v4 objectForKeyedSubscript:@"storyRecipeData"];

  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F8CDE8]);
    id v13 = 0;
    v7 = [v6 unarchivedRecipeWithData:v5 error:&v13];
    id v8 = v13;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      v11 = PLStoryGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v15 = v3;
        __int16 v16 = 2112;
        id v17 = v8;
        _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_ERROR, "[MusicQualityQuestion] Failed to unarchive recipe for %@: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v6 = PLStoryGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v10 = [v3 uuid];
      *(_DWORD *)buf = 138412290;
      id v15 = v10;
      _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_ERROR, "[MusicQualityQuestion] Unable to extract the StoryRecipeData for memory uuid=%@", buf, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

+ (void)enumerateMemoryMusicSuggestionsInPhotoLibrary:(id)a3 block:(id)a4
{
  v26[3] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [a3 librarySpecificFetchOptions];
  v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"score" ascending:1];
  v26[0] = v7;
  id v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v26[1] = v8;
  id v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:0];
  v26[2] = v9;
  int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:3];
  [v6 setSortDescriptors:v10];

  v11 = [MEMORY[0x1E4F1C9C8] date];
  v12 = [v11 dateByAddingTimeInterval:-31557600.0];

  id v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"creationDate >= %@", v12];
  [v6 setPredicate:v13];

  v14 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v6];
  if ([v14 count])
  {
    char v24 = 0;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v21;
LABEL_4:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        if (v24) {
          break;
        }
        (*((void (**)(id, void, void, char *))v5 + 2))(v5, *(void *)(*((void *)&v20 + 1) + 8 * v19++), 0, &v24);
        if (v17 == v19)
        {
          uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v25 count:16];
          if (v17) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

@end