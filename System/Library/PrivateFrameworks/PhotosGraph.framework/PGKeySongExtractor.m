@interface PGKeySongExtractor
+ (id)_keySongIDFromMemory:(id)a3 forSongCatalog:(id)a4;
+ (id)appleMusicKeySongIDFromMemory:(id)a3;
+ (id)flexMusicKeySongIDFromMemory:(id)a3;
@end

@implementation PGKeySongExtractor

+ (id)_keySongIDFromMemory:(id)a3 forSongCatalog:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [a3 photosGraphProperties];
  v7 = v6;
  if (v6)
  {
    v8 = [v6 objectForKeyedSubscript:@"storyRecipeData"];
    if (v8)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F8CDE8]);
      id v16 = 0;
      v10 = [v9 unarchivedRecipeWithData:v8 error:&v16];
      id v11 = v16;
      if (v10)
      {
        v12 = [v10 seedSongIdentifiersByCatalog];
        v13 = [v12 objectForKeyedSubscript:v5];
      }
      else
      {
        v14 = +[PGLogging sharedLogging];
        v12 = [v14 loggingConnection];

        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v18 = v11;
          _os_log_error_impl(&dword_1D1805000, v12, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Failed to unarchive recipe from recipe data, error: %@", buf, 0xCu);
        }
        v13 = 0;
      }
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)flexMusicKeySongIDFromMemory:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() _keySongIDFromMemory:v3 forSongCatalog:*MEMORY[0x1E4F8D2A0]];

  return v4;
}

+ (id)appleMusicKeySongIDFromMemory:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() _keySongIDFromMemory:v3 forSongCatalog:*MEMORY[0x1E4F8D298]];

  return v4;
}

@end