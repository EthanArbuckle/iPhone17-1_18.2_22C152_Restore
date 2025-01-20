@interface BKFontCache
+ (id)sharedInstance;
- (BKFontCache)init;
- (BOOL)disableAutoFontDownload;
- (NSMutableDictionary)fontFaceLookupByFileName;
- (NSMutableDictionary)fontLookupByFileName;
- (NSMutableDictionary)fontsByFileName;
- (NSMutableDictionary)presetsByFileName;
- (NSMutableOrderedSet)fileNames;
- (id)_presetsFileNameForLanguage:(id)a3;
- (id)_presetsForFileName:(id)a3;
- (id)defaultFontNameForLanguage:(id)a3;
- (id)fontFromFamilyName:(id)a3 language:(id)a4;
- (id)fontsForLanguage:(id)a3;
- (id)fontsForLanguage:(id)a3 completion:(id)a4;
- (id)presetPostscriptsLookupForLanguage:(id)a3;
- (id)presetSettingsForFontFamily:(id)a3 language:(id)a4;
- (id)presetsForLanguage:(id)a3;
- (void)_didReceiveMemoryWarning:(id)a3;
- (void)prewarmFontsForLanguage:(id)a3 completion:(id)a4;
- (void)setDisableAutoFontDownload:(BOOL)a3;
- (void)setFileNames:(id)a3;
- (void)setFontFaceLookupByFileName:(id)a3;
- (void)setFontLookupByFileName:(id)a3;
- (void)setFontsByFileName:(id)a3;
- (void)setPresetsByFileName:(id)a3;
@end

@implementation BKFontCache

+ (id)sharedInstance
{
  if (qword_22B518 != -1) {
    dispatch_once(&qword_22B518, &stru_1DAEE0);
  }
  v2 = (void *)qword_22B510;

  return v2;
}

- (BKFontCache)init
{
  v11.receiver = self;
  v11.super_class = (Class)BKFontCache;
  v2 = [(BKFontCache *)&v11 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(BKFontCache *)v2 setFontsByFileName:v3];

    v4 = objc_opt_new();
    [(BKFontCache *)v2 setFontLookupByFileName:v4];

    v5 = objc_opt_new();
    [(BKFontCache *)v2 setPresetsByFileName:v5];

    v6 = objc_opt_new();
    [(BKFontCache *)v2 setFontFaceLookupByFileName:v6];

    v7 = objc_opt_new();
    [(BKFontCache *)v2 setFileNames:v7];

    v8 = +[NSUserDefaults standardUserDefaults];
    -[BKFontCache setDisableAutoFontDownload:](v2, "setDisableAutoFontDownload:", [v8 BOOLForKey:@"REI.DisableAutoFontDownload"]);

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v2 selector:"_didReceiveMemoryWarning:" name:UIApplicationDidReceiveMemoryWarningNotification object:0];
  }
  return v2;
}

- (id)fontsForLanguage:(id)a3
{
  return [(BKFontCache *)self fontsForLanguage:a3 completion:0];
}

- (id)fontsForLanguage:(id)a3 completion:(id)a4
{
  id v46 = a3;
  id v43 = a4;
  v6 = _AEBookPluginsFontCacheLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v66 = v46;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Prewarming AEBookPlugin for language %@", buf, 0xCu);
  }

  v49 = self;
  objc_sync_enter(v49);
  if ([v46 length])
  {
    v45 = [(BKFontCache *)v49 _presetsFileNameForLanguage:v46];
    v7 = [(BKFontCache *)v49 fontsByFileName];
    id v44 = [v7 objectForKeyedSubscript:v45];

    if (![v44 count])
    {
      v8 = [(BKFontCache *)v49 _presetsForFileName:v45];
      v9 = objc_opt_new();
      v48 = objc_opt_new();
      v10 = dispatch_group_create();
      objc_super v11 = +[BKReachability sharedReachabilityForInternetConnection];
      BOOL v47 = [v11 currentReachabilityStatus] == 1;

      long long v63 = 0u;
      long long v64 = 0u;
      long long v62 = 0u;
      long long v61 = 0u;
      id obj = v8;
      id v12 = [obj countByEnumeratingWithState:&v61 objects:v69 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v62;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v62 != v13) {
              objc_enumerationMutation(obj);
            }
            v15 = *(void **)(*((void *)&v61 + 1) + 8 * i);
            dispatch_group_enter(v10);
            uint64_t v16 = [v15 valueForKey:@"fontFamily" v43];
            v17 = (void *)v16;
            v18 = &stru_1DF0D8;
            if (v16) {
              v18 = (__CFString *)v16;
            }
            v19 = v18;

            v20 = [v9 objectForKeyedSubscript:v19];
            BOOL v21 = v20 == 0;

            if (v21)
            {
              v22 = [v15 valueForKey:@"system"];
              v23 = [v15 valueForKey:@"isPreinstalled"];
              unsigned int v24 = [v23 BOOLValue];

              v25 = objc_opt_new();
              if ([(__CFString *)v19 length])
              {
                if ([v22 isEqualToString:@"serif"])
                {
                  uint64_t v26 = 4;
                }
                else
                {
                  unsigned int v27 = [v22 isEqualToString:@"default"];
                  uint64_t v28 = 2;
                  if (!v24) {
                    uint64_t v28 = 0;
                  }
                  if (v27) {
                    uint64_t v26 = 3;
                  }
                  else {
                    uint64_t v26 = v28;
                  }
                }
              }
              else
              {
                uint64_t v26 = 1;
              }
              [v25 setKind:v26];
              [v25 setSystemName:v22];
              [v25 setFamilyName:v19];
              v29 = [v15 valueForKey:@"displayName"];
              [v25 setDisplayName:v29];

              v30 = [v15 valueForKey:@"postscriptName"];
              [v25 setPostscriptName:v30];

              v31 = [v15 valueForKey:@"postscriptBoldName"];
              [v25 setPostscriptBoldName:v31];

              [v48 addObject:v25];
              [v9 setObject:v25 forKey:v19];
              v32 = [v15 valueForKey:@"shouldAutoDownload"];
              LOBYTE(v31) = [v32 BOOLValue];

              v55[0] = _NSConcreteStackBlock;
              v55[1] = 3221225472;
              v55[2] = sub_1C160;
              v55[3] = &unk_1DAF08;
              id v33 = v25;
              char v59 = (char)v31;
              BOOL v60 = v47;
              id v56 = v33;
              v57 = v49;
              v58 = v10;
              [v33 checkStateSynchronously:0 completion:v55];
            }
            else
            {
              dispatch_group_leave(v10);
            }
          }
          id v12 = [obj countByEnumeratingWithState:&v61 objects:v69 count:16];
        }
        while (v12);
      }

      id v34 = [v48 copy];
      v35 = [(BKFontCache *)v49 fontsByFileName];
      [v35 setObject:v34 forKeyedSubscript:v45];

      id v36 = [v9 copy];
      v37 = [(BKFontCache *)v49 fontLookupByFileName];
      [v37 setObject:v36 forKeyedSubscript:v45];

      v38 = [(BKFontCache *)v49 fileNames];
      [v38 addObject:v45];

      v39 = _AEBookPluginsFontCacheLog();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        id v40 = [v34 count];
        *(_DWORD *)buf = 134218242;
        id v66 = v40;
        __int16 v67 = 2114;
        id v68 = v46;
        _os_log_impl(&dword_0, v39, OS_LOG_TYPE_DEFAULT, "Cached %lu fonts for language: %{public}@", buf, 0x16u);
      }

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1C25C;
      block[3] = &unk_1DAF30;
      id v54 = v43;
      id v44 = v34;
      id v52 = v44;
      id v53 = v46;
      dispatch_group_notify(v10, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else
  {
    v41 = _AEBookPluginsFontCacheLog();
    v45 = v41;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v41, OS_LOG_TYPE_ERROR, "Nil language parameter, returning 0 fonts", buf, 2u);
    }
    id v44 = &__NSArray0__struct;
  }

  objc_sync_exit(v49);

  return v44;
}

- (id)fontFromFamilyName:(id)a3 language:(id)a4
{
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  if ([v7 length])
  {
    v9 = [(BKFontCache *)v8 _presetsFileNameForLanguage:v7];
    if ([v9 length])
    {
      v10 = [(BKFontCache *)v8 fontLookupByFileName];
      objc_super v11 = [v10 objectForKeyedSubscript:v9];

      if (v11)
      {
        id v12 = [v11 objectForKeyedSubscript:v6];
LABEL_14:

        goto LABEL_15;
      }
      uint64_t v13 = _AEBookPluginsFontCacheLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v15 = 138543362;
        uint64_t v16 = v9;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "Font lookup for %{public}@ not found, no font found", (uint8_t *)&v15, 0xCu);
      }
    }
    else
    {
      objc_super v11 = _AEBookPluginsFontCacheLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v15 = 138543362;
        uint64_t v16 = v7;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "Filename for %{public}@ not found, no font found", (uint8_t *)&v15, 0xCu);
      }
    }
    id v12 = 0;
    goto LABEL_14;
  }
  v9 = _AEBookPluginsFontCacheLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v15 = 138543362;
    uint64_t v16 = v6;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "Empty language parameter, no font found for %{public}@", (uint8_t *)&v15, 0xCu);
  }
  id v12 = 0;
LABEL_15:

  objc_sync_exit(v8);

  return v12;
}

- (id)defaultFontNameForLanguage:(id)a3
{
  id v4 = a3;
  v25 = self;
  objc_sync_enter(v25);
  v23 = v4;
  if (![v4 length])
  {
    BOOL v21 = 0;
    goto LABEL_28;
  }
  [(BKFontCache *)v25 prewarmFontsForLanguage:v4 completion:0];
  unsigned int v24 = [(BKFontCache *)v25 _presetsFileNameForLanguage:v4];
  -[BKFontCache _presetsForFileName:](v25, "_presetsForFileName:");
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v5)
  {
    id v6 = 0;
    v7 = 0;
    uint64_t v8 = *(void *)v28;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        objc_super v11 = [v10 valueForKey:@"default"];
        id v12 = [v11 integerValue];

        if ((uint64_t)v12 > (uint64_t)v6)
        {
          uint64_t v13 = [v10 valueForKey:@"fontFamily"];
          v14 = (void *)v13;
          int v15 = &stru_1DF0D8;
          if (v13) {
            int v15 = (__CFString *)v13;
          }
          uint64_t v16 = v15;

          v17 = [(BKFontCache *)v25 fontLookupByFileName];
          v18 = [v17 objectForKeyedSubscript:v24];

          v19 = [v18 objectForKeyedSubscript:v16];
          if (([v19 isInstalled] & 1) == 0) {
            [v19 checkStateSynchronously:1];
          }
          if (([v19 isInstalled] & 1) != 0
            || [v19 state] == 1)
          {
            id v20 = v10;

            id v6 = v12;
            v7 = v20;
          }
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v5);

    if (v7) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  if ((unint64_t)objc_msgSend(obj, "count", v23) < 2
    || ([obj objectAtIndex:1], (v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ([obj count])
    {
      v7 = [obj objectAtIndex:0];
    }
    else
    {
      v7 = 0;
    }
  }
LABEL_27:
  BOOL v21 = [v7 valueForKey:@"fontFamily"];

LABEL_28:
  objc_sync_exit(v25);

  return v21;
}

- (id)presetsForLanguage:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(BKFontCache *)v5 _presetsFileNameForLanguage:v4];
  v7 = [(BKFontCache *)v5 _presetsForFileName:v6];

  objc_sync_exit(v5);

  return v7;
}

- (id)presetSettingsForFontFamily:(id)a3 language:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_1CBA8;
  v23 = sub_1CBB8;
  id v24 = 0;
  if ([v7 length])
  {
    v9 = [(BKFontCache *)v8 _presetsFileNameForLanguage:v7];
    v10 = [(BKFontCache *)v8 _presetsForFileName:v9];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1CBC0;
    v16[3] = &unk_1DAF58;
    id v11 = v6;
    id v17 = v11;
    v18 = &v19;
    [v10 enumerateObjectsUsingBlock:v16];
    if (!v20[5])
    {
      id v12 = _AEBookPluginsFontCacheLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1372C8((uint64_t)v11, (uint64_t)v7, v12);
      }

      uint64_t v13 = (void *)v20[5];
      v20[5] = (uint64_t)&off_1E95B0;
    }
  }
  id v14 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  objc_sync_exit(v8);

  return v14;
}

- (id)presetPostscriptsLookupForLanguage:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  [(BKFontCache *)v5 prewarmFontsForLanguage:v4 completion:0];
  id v6 = [(BKFontCache *)v5 _presetsFileNameForLanguage:v4];
  id v7 = [(BKFontCache *)v5 fontFaceLookupByFileName];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];

  objc_sync_exit(v5);

  return v8;
}

- (void)prewarmFontsForLanguage:(id)a3 completion:(id)a4
{
  id v4 = [(BKFontCache *)self fontsForLanguage:a3 completion:a4];
}

- (void)_didReceiveMemoryWarning:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(BKFontCache *)v5 fileNames];
  id v7 = [v6 array];
  id v8 = [v7 copy];

  if ((unint64_t)[v8 count] < 2)
  {
    uint64_t v13 = _AEBookPluginsFontCacheLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [(BKFontCache *)v5 fileNames];
      *(_DWORD *)buf = 138543362;
      v22 = v14;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Received memory warning - files did not exceed minimum. Remaining files cached: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    int v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    id v17 = sub_1CFE8;
    v18 = &unk_1DAF80;
    v9 = v8;
    uint64_t v19 = v9;
    id v20 = v5;
    [v9 enumerateObjectsUsingBlock:&v15];
    v10 = _AEBookPluginsFontCacheLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (char *)[v9 count];
      id v12 = [(BKFontCache *)v5 fileNames];
      *(_DWORD *)buf = 134218242;
      v22 = v11 - 1;
      __int16 v23 = 2114;
      id v24 = v12;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Received memory warning - cleared %lu files. Remaining files cached: %{public}@", buf, 0x16u);
    }
    uint64_t v13 = v19;
  }

  objc_sync_exit(v5);
}

- (id)_presetsForFileName:(id)a3
{
  id v4 = a3;
  id v5 = [(BKFontCache *)self presetsByFileName];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if ([v6 count])
  {
    id v7 = v6;
  }
  else
  {
    id v8 = AEBundle();
    v9 = [v8 pathForResource:v4 ofType:@"plist"];

    id v10 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:v9];
    id v11 = [v10 valueForKey:@"fonts"];
    id v12 = [v11 mutableCopy];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1D3C8;
    v26[3] = &unk_1DAFA8;
    id v13 = (id)objc_opt_new();
    id v27 = v13;
    id v14 = objc_retainBlock(v26);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1D4AC;
    v23[3] = &unk_1DAFD0;
    id v15 = v12;
    id v24 = v15;
    id v25 = v14;
    uint64_t v16 = v14;
    [v11 enumerateObjectsUsingBlock:v23];
    id v7 = [v15 copy];

    id v17 = [(BKFontCache *)self presetsByFileName];
    [v17 setObject:v7 forKeyedSubscript:v4];

    id v18 = [v13 copy];
    uint64_t v19 = [(BKFontCache *)self fontFaceLookupByFileName];
    [v19 setObject:v18 forKeyedSubscript:v4];

    id v20 = _AEBookPluginsFontCacheLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [v7 count];
      *(_DWORD *)buf = 134218242;
      id v29 = v21;
      __int16 v30 = 2114;
      id v31 = v4;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Cached %lu presets from file: %{public}@", buf, 0x16u);
    }
  }

  return v7;
}

- (id)_presetsFileNameForLanguage:(id)a3
{
  v3 = +[BKStyleManager suffixForLanguage:a3];
  if ([v3 length])
  {
    id v4 = +[NSString stringWithFormat:@"-%@", v3];
  }
  else
  {
    id v4 = &stru_1DF0D8;
  }
  if (v4) {
    CFStringRef v5 = v4;
  }
  else {
    CFStringRef v5 = &stru_1DF0D8;
  }
  id v6 = +[NSString stringWithFormat:@"%@%@", @"FontPresets", v5];

  return v6;
}

- (NSMutableDictionary)fontsByFileName
{
  return self->_fontsByFileName;
}

- (void)setFontsByFileName:(id)a3
{
}

- (NSMutableDictionary)fontLookupByFileName
{
  return self->_fontLookupByFileName;
}

- (void)setFontLookupByFileName:(id)a3
{
}

- (NSMutableDictionary)presetsByFileName
{
  return self->_presetsByFileName;
}

- (void)setPresetsByFileName:(id)a3
{
}

- (NSMutableDictionary)fontFaceLookupByFileName
{
  return self->_fontFaceLookupByFileName;
}

- (void)setFontFaceLookupByFileName:(id)a3
{
}

- (NSMutableOrderedSet)fileNames
{
  return self->_fileNames;
}

- (void)setFileNames:(id)a3
{
}

- (BOOL)disableAutoFontDownload
{
  return self->_disableAutoFontDownload;
}

- (void)setDisableAutoFontDownload:(BOOL)a3
{
  self->_disableAutoFontDownload = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileNames, 0);
  objc_storeStrong((id *)&self->_fontFaceLookupByFileName, 0);
  objc_storeStrong((id *)&self->_presetsByFileName, 0);
  objc_storeStrong((id *)&self->_fontLookupByFileName, 0);

  objc_storeStrong((id *)&self->_fontsByFileName, 0);
}

@end