@interface BKAudiobookPersistenceController
+ (void)registerAEPersistencePlugins;
- (double)audiobookTimeForLocation:(id)a3 audiobook:(id)a4;
- (void)registerAEPersistencePlugins;
@end

@implementation BKAudiobookPersistenceController

+ (void)registerAEPersistencePlugins
{
  id v2 = [a1 sharedInstance];
  [v2 registerAEPersistencePlugins];
}

- (void)registerAEPersistencePlugins
{
  v3 = [(BKAudiobookPersistenceController *)self stores];
  id v4 = [v3 count];

  if (!v4)
  {
    v5 = objc_opt_new();
    [(BKAudiobookPersistenceController *)self addStore:v5];

    id v6 = objc_alloc((Class)BKAudiobookPersistenceCloudKit);
    v7 = +[BCCloudAssetManager sharedManager];
    v8 = [v7 assetDetailManager];
    id v11 = [v6 initWithAssetDetailManager:v8];

    if (v11) {
      [(BKAudiobookPersistenceController *)self addStore:v11];
    }
    v9 = objc_opt_new();
    [(BKAudiobookPersistenceController *)self addStore:v9];

    v10 = objc_opt_new();
    [(BKAudiobookPersistenceController *)self addStore:v10];
  }
}

- (double)audiobookTimeForLocation:(id)a3 audiobook:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = (unint64_t)[v5 ordinal];
  if ((v7 & 0x8000000000000000) != 0)
  {
    v8 = _AEBookPluginsAudiobookLog();
    double v14 = 0.0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v26 = v7;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "Ordinal %ld < 0, can't convert to audiobook time.", buf, 0xCu);
    }
    goto LABEL_24;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [v6 tracks];
    if (v7 < (unint64_t)[v8 count])
    {
      v9 = [v8 objectAtIndexedSubscript:v7];
      v10 = [v9 chapters];
      id v11 = [v10 firstObject];

      if (v11)
      {
        [v11 timeRangeInAudiobook];
        CMTime time = v23;
        double Seconds = CMTimeGetSeconds(&time);
        [v5 offset];
        double v14 = Seconds + v13;
      }
      else
      {
        v17 = _AEBookPluginsAudiobookLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v26 = v7;
          _os_log_impl(&dword_0, v17, OS_LOG_TYPE_ERROR, "Track with ordinal %ld has no chapters, can't convert to audiobook time", buf, 0xCu);
        }

        double v14 = 0.0;
      }

      goto LABEL_23;
    }
    v9 = _AEBookPluginsAudiobookLog();
    double v14 = 0.0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v26 = v7;
      __int16 v27 = 2048;
      id v28 = [v8 count];
      v16 = "Ordinal %ld >= %lu (track count), can't convert to audiobook time.";
LABEL_16:
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, v16, buf, 0x16u);
      goto LABEL_23;
    }
    goto LABEL_23;
  }
  objc_opt_class();
  double v14 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    v8 = [v6 chapters];
    if (v7 < (unint64_t)[v8 count])
    {
      v15 = [v8 objectAtIndexedSubscript:v7];
      v9 = v15;
      if (v15) {
        [v15 timeRangeInAudiobook];
      }
      else {
        memset(&v21, 0, sizeof(v21));
      }
      CMTime v22 = v21;
      double v18 = CMTimeGetSeconds(&v22);
      [v5 offset];
      double v14 = v18 + v19;
      goto LABEL_23;
    }
    v9 = _AEBookPluginsAudiobookLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v26 = v7;
      __int16 v27 = 2048;
      id v28 = [v8 count];
      v16 = "Ordinal %ld >= %lu (chapter count), can't convert to audiobook time.";
      goto LABEL_16;
    }
LABEL_23:

LABEL_24:
  }

  return v14;
}

@end