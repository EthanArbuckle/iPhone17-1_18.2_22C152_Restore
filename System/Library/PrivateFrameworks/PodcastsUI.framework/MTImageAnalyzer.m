@interface MTImageAnalyzer
- (MTImageAnalyzer)init;
- (id)addImage:(id)a3 forKey:(id)a4;
- (id)colorThemeForArtwork:(id)a3;
- (id)colorThemeForPodcastUuid:(id)a3;
@end

@implementation MTImageAnalyzer

- (MTImageAnalyzer)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTImageAnalyzer;
  v2 = [(MTImageAnalyzer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    memoryCache = v2->_memoryCache;
    v2->_memoryCache = (NSCache *)v3;
  }
  return v2;
}

- (id)colorThemeForPodcastUuid:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v6 = [v5 BOOLForKey:*MEMORY[0x1E4F920D0]];

  if (v6)
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__4;
    v26 = __Block_byref_object_dispose__4;
    id v27 = [(NSCache *)self->_memoryCache objectForKey:v4];
    v7 = (void *)v23[5];
    if (v7)
    {
      id v8 = v7;
    }
    else
    {
      v9 = [MEMORY[0x1E4F91F60] sharedInstance];
      v10 = [v9 mainOrPrivateContext];

      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __44__MTImageAnalyzer_colorThemeForPodcastUuid___block_invoke;
      v18[3] = &unk_1E6E20248;
      v21 = &v22;
      id v11 = v10;
      id v19 = v11;
      id v12 = v4;
      id v20 = v12;
      [v11 performBlockAndWait:v18];
      uint64_t v13 = v23[5];
      if (v13)
      {
        [(NSCache *)self->_memoryCache setObject:v13 forKey:v12];
        id v8 = (id)v23[5];
      }
      else
      {
        v14 = _MTLogCategoryDefault();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v29 = v12;
          _os_log_impl(&dword_1E3BC5000, v14, OS_LOG_TYPE_DEFAULT, "Artwork has not yet been analyzed for podcast with uuid: %@", buf, 0xCu);
        }

        v15 = +[MTImageStore defaultStore];
        v16 = [v15 imageForKey:v12];

        id v8 = [(MTImageAnalyzer *)self addImage:v16 forKey:v12];
      }
    }
    _Block_object_dispose(&v22, 8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

uint64_t __44__MTImageAnalyzer_colorThemeForPodcastUuid___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) colorThemeForUuid:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)addImage:(id)a3 forKey:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    if ([v7 length])
    {
      v9 = [v6 squareImage];

      [v9 scale];
      double v11 = v10;
      [v9 size];
      double v13 = v12;
      double v15 = v14;
      double v16 = v11 * v14;
      if (v11 * v12 <= 3000.0 && v16 <= 3000.0)
      {
        v18 = [(MTImageAnalyzer *)self colorThemeForArtwork:v9];
        if (v18)
        {
          id v20 = [MEMORY[0x1E4F91F60] sharedInstance];
          v21 = [v20 privateQueueContext];

          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __35__MTImageAnalyzer_addImage_forKey___block_invoke;
          v26[3] = &unk_1E6E1FCA8;
          uint64_t v22 = v18;
          id v27 = v22;
          id v23 = v8;
          id v28 = v23;
          id v29 = v21;
          id v24 = v21;
          [v24 performBlock:v26];
          [(NSCache *)self->_memoryCache setObject:v22 forKey:v23];
          v18 = v22;
        }
        id v19 = v18;
      }
      else
      {
        v18 = _MTLogCategoryDefault();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413058;
          v31 = v8;
          __int16 v32 = 2048;
          double v33 = v13;
          __int16 v34 = 2048;
          double v35 = v15;
          __int16 v36 = 2048;
          uint64_t v37 = 0x40A7700000000000;
          _os_log_impl(&dword_1E3BC5000, v18, OS_LOG_TYPE_DEFAULT, "Skipping color analysis for %@ since its too big ({%f,%f} > max size (px) of %f)...", buf, 0x2Au);
        }
        id v19 = 0;
      }
    }
    else
    {
      id v19 = 0;
      v9 = v6;
    }
  }
  else
  {
    v9 = 0;
    id v19 = 0;
  }

  return v19;
}

uint64_t __35__MTImageAnalyzer_addImage_forKey___block_invoke(void *a1)
{
  uint64_t result = [MEMORY[0x1E4F91FB8] createOrUpdateTheme:a1[4] forUuid:a1[5] inMOC:a1[6]];
  if (result)
  {
    uint64_t v3 = (void *)a1[6];
    return [v3 saveInCurrentBlock];
  }
  return result;
}

- (id)colorThemeForArtwork:(id)a3
{
  if (a3)
  {
    uint64_t v3 = (objc_class *)MEMORY[0x1E4F31868];
    id v4 = a3;
    v5 = (void *)[[v3 alloc] initWithImage:v4 algorithm:1];

    id v6 = [v5 analyze];
    if (v6)
    {
      id v7 = objc_opt_new();
      id v8 = [v6 backgroundColor];
      [v7 setBackgroundColor:v8];

      v9 = [v6 primaryTextColor];
      [v7 setPrimaryTextColor:v9];

      double v10 = [v6 secondaryTextColor];
      [v7 setSecondaryTextColor:v10];

      objc_msgSend(v7, "setIsBackgroundLight:", objc_msgSend(v6, "isBackgroundColorLight"));
    }
    else
    {
      double v11 = _MTLogCategoryDefault();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v13 = 0;
        _os_log_impl(&dword_1E3BC5000, v11, OS_LOG_TYPE_DEFAULT, "Unable to analyze image colors.", v13, 2u);
      }

      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end