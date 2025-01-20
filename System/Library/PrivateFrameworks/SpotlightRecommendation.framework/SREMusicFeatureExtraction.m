@interface SREMusicFeatureExtraction
- (BOOL)_handleSongEvent:(id)a3 context:(id)a4 numMusic:(unint64_t)a5 outputSequence:(id)a6;
- (SREMusicFeatureExtraction)init;
- (id)retrieveNowPlayingHistoryWithLength:(unint64_t)a3 error:(id *)a4;
@end

@implementation SREMusicFeatureExtraction

- (SREMusicFeatureExtraction)init
{
  v3.receiver = self;
  v3.super_class = (Class)SREMusicFeatureExtraction;
  return [(SREMusicFeatureExtraction *)&v3 init];
}

- (id)retrieveNowPlayingHistoryWithLength:(unint64_t)a3 error:(id *)a4
{
  v7 = (void *)[objc_alloc(MEMORY[0x263F4E878]) initAndReturnError:a4];
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x263F08798]);
    v9 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-2419200.0];
    v10 = [MEMORY[0x263EFF910] now];
    v11 = [v8 initWithStartDate:v9 endDate:v10];

    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy_;
    v25 = __Block_byref_object_dispose_;
    id v26 = 0;
    id v26 = [MEMORY[0x263EFF980] arrayWithCapacity:a3];
    id location = 0;
    objc_initWeak(&location, self);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __71__SREMusicFeatureExtraction_retrieveNowPlayingHistoryWithLength_error___block_invoke;
    v16[3] = &unk_265522B98;
    objc_copyWeak(v19, &location);
    id v12 = v7;
    v19[1] = (id)a3;
    id v17 = v12;
    v18 = &v21;
    if ([v12 enumerateSongEventsThatOverlapWithDateInterval:v11 ascending:0 error:a4 usingBlock:v16])
    {
      id v13 = (id)v22[5];
    }
    else
    {
      v14 = logForCSLogCategoryRecs();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[SREMusicFeatureExtraction retrieveNowPlayingHistoryWithLength:error:]((uint64_t *)a4, v14);
      }

      id v13 = 0;
    }

    objc_destroyWeak(v19);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v11 = logForCSLogCategoryRecs();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SREMusicFeatureExtraction retrieveNowPlayingHistoryWithLength:error:]((uint64_t *)a4, v11);
    }
    id v13 = 0;
  }

  return v13;
}

void __71__SREMusicFeatureExtraction_retrieveNowPlayingHistoryWithLength_error___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  v4 = (void *)a1;
  v5 = (id *)(a1 + 48);
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  LOBYTE(v4) = [WeakRetained _handleSongEvent:v6 context:v4[4] numMusic:v4[7] outputSequence:*(void *)(*(void *)(v4[5] + 8) + 40)];

  *a3 = v4 ^ 1;
}

- (BOOL)_handleSongEvent:(id)a3 context:(id)a4 numMusic:(unint64_t)a5 outputSequence:(id)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if ([v11 count] >= a5)
  {
    BOOL v25 = 0;
  }
  else
  {
    id v12 = [v9 playbackState];
    int v13 = [v12 isEqualToString:@"Playing"];

    if (v13)
    {
      v14 = [v9 song];
      v15 = [v14 songId];
      v16 = [v15 graphSongFromContext:v10 error:0];

      if (v16)
      {
        id v17 = logForCSLogCategoryRecs();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = [v16 name];
          v19 = [v9 date];
          v20 = [v19 startDate];
          uint64_t v21 = [v16 songAdamId];
          int v28 = 138412802;
          v29 = v18;
          __int16 v30 = 2112;
          v31 = v20;
          __int16 v32 = 2112;
          v33 = v21;
          _os_log_impl(&dword_25E363000, v17, OS_LOG_TYPE_DEFAULT, "Now playing sequence: Song name: %@ Song event start date: %@ Adam ID: %@", (uint8_t *)&v28, 0x20u);
        }
        v22 = objc_alloc_init(SREMusicMetadata);
        uint64_t v23 = [v16 songAdamId];
        -[SREMusicMetadata setAdamID:](v22, "setAdamID:", [v23 integerValue]);

        if ([(SREMusicMetadata *)v22 adamID] <= 0)
        {
          id v26 = logForCSLogCategoryRecs();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            -[SREMusicFeatureExtraction _handleSongEvent:context:numMusic:outputSequence:](v16, v26);
          }

          BOOL v25 = 1;
        }
        else
        {
          v24 = [v16 genre];
          [(SREMusicMetadata *)v22 setGenreID:v24];

          [v11 addObject:v22];
          BOOL v25 = [v11 count] < a5;
        }
      }
      else
      {
        BOOL v25 = 1;
      }
    }
    else
    {
      BOOL v25 = 1;
    }
  }

  return v25;
}

- (void)retrieveNowPlayingHistoryWithLength:(uint64_t *)a1 error:(NSObject *)a2 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_25E363000, a2, OS_LOG_TYPE_ERROR, "GDGraphAppleMusicEventContext creation failed. error=%@", (uint8_t *)&v3, 0xCu);
}

- (void)retrieveNowPlayingHistoryWithLength:(uint64_t *)a1 error:(NSObject *)a2 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_25E363000, a2, OS_LOG_TYPE_ERROR, "Enumerate apple music events failed. Error: %@", (uint8_t *)&v3, 0xCu);
}

- (void)_handleSongEvent:(void *)a1 context:(NSObject *)a2 numMusic:outputSequence:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v3 = [a1 songAdamId];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_25E363000, a2, OS_LOG_TYPE_ERROR, "Invalid adamID from now playing stream: %@", (uint8_t *)&v4, 0xCu);
}

@end