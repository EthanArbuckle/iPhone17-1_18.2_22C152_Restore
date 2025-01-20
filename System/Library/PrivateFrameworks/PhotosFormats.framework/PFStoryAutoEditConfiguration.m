@interface PFStoryAutoEditConfiguration
+ (NSNumber)currentVersion;
+ (id)standardConfiguration;
- ($3DBB98C272AC9B04202267094881960A)_overallDurationInfoForDurationKind:(SEL)a3;
- ($3DBB98C272AC9B04202267094881960A)durationInfoForPlaybackStyle:(SEL)a3 songPace:(int64_t)a4;
- ($3DBB98C272AC9B04202267094881960A)longOverallDuration;
- ($3DBB98C272AC9B04202267094881960A)maximumDurations;
- ($3DBB98C272AC9B04202267094881960A)mediumOverallDuration;
- ($3DBB98C272AC9B04202267094881960A)minimumDurations;
- ($3DBB98C272AC9B04202267094881960A)shortOverallDuration;
- (NSURL)url;
- (PFStoryAutoEditConfiguration)init;
- (PFStoryAutoEditConfiguration)initWithConfigurationData:(id)a3;
- (PFStoryAutoEditConfiguration)initWithConfigurationDictionary:(id)a3;
- (PFStoryAutoEditConfiguration)initWithConfigurationFileAtURL:(id)a3;
- (PFStoryMotionStyleTable)diptychMotionStyleTable;
- (PFStoryMotionStyleTable)motionStyleTable;
- (PFStoryMotionStyleTable)triptychMotionStyleTable;
- (PFStoryTransitionTable)defaultTransitionTable;
- (PFStoryTransitionTable)interModuleTransitionTable;
- (PFStoryTransitionTable)interMomentTransitionTable;
- (PFStoryTransitionTable)nUpTransitionTable;
- (PFStoryTransitionTable)portraitTransitionTable;
- (double)chapterBeginDurationMultiplier;
- (double)composabilityScoreThreshold;
- (double)composabilityTargetDurationMultiplier;
- (double)diptychDurationMultiplier;
- (double)durationForTransitionKind:(int64_t)a3 songPace:(int64_t)a4;
- (double)fastVisualTempoTarget;
- (double)finalDurationMultiplier;
- (double)initialDurationMultiplier;
- (double)mediumVisualTempoTarget;
- (double)outroDurationForSongPace:(int64_t)a3;
- (double)slowVisualTempoTarget;
- (double)triptychDurationMultiplier;
- (id)_arrayFromTable:(id)a3 count:(unint64_t)a4 nameToValueMap:(id)a5;
- (id)_loadData:(id)a3;
- (id)clusteringPropertiesForMemoryCategoryName:(id)a3;
- (int64_t)composabilityMaximumNUpRunCount;
- (int64_t)composabilityMinimum1UpRunCount;
- (int64_t)composabilityMinimumNUpCount;
- (void)_loadClusteringPropertiesFromMemoryCategories:(id)a3;
@end

@implementation PFStoryAutoEditConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triptychMotionStyleTable, 0);
  objc_storeStrong((id *)&self->_diptychMotionStyleTable, 0);
  objc_storeStrong((id *)&self->_motionStyleTable, 0);
  objc_storeStrong((id *)&self->_interModuleTransitionTable, 0);
  objc_storeStrong((id *)&self->_nUpTransitionTable, 0);
  objc_storeStrong((id *)&self->_portraitTransitionTable, 0);
  objc_storeStrong((id *)&self->_interMomentTransitionTable, 0);
  objc_storeStrong((id *)&self->_defaultTransitionTable, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_outroDurations, 0);
  objc_storeStrong((id *)&self->_overallDurationTable, 0);
  objc_storeStrong((id *)&self->_clusteringPropertiesByCategory, 0);
  objc_storeStrong((id *)&self->_transitionDurationsByKind, 0);

  objc_storeStrong((id *)&self->_durationTablesByPlaybackStyle, 0);
}

- (double)composabilityScoreThreshold
{
  return self->_composabilityScoreThreshold;
}

- (int64_t)composabilityMaximumNUpRunCount
{
  return self->_composabilityMaximumNUpRunCount;
}

- (int64_t)composabilityMinimumNUpCount
{
  return self->_composabilityMinimumNUpCount;
}

- (int64_t)composabilityMinimum1UpRunCount
{
  return self->_composabilityMinimum1UpRunCount;
}

- (double)composabilityTargetDurationMultiplier
{
  return self->_composabilityTargetDurationMultiplier;
}

- (double)fastVisualTempoTarget
{
  return self->_fastVisualTempoTarget;
}

- (double)mediumVisualTempoTarget
{
  return self->_mediumVisualTempoTarget;
}

- (double)slowVisualTempoTarget
{
  return self->_slowVisualTempoTarget;
}

- (double)finalDurationMultiplier
{
  return self->_finalDurationMultiplier;
}

- (double)chapterBeginDurationMultiplier
{
  return self->_chapterBeginDurationMultiplier;
}

- (double)initialDurationMultiplier
{
  return self->_initialDurationMultiplier;
}

- (double)triptychDurationMultiplier
{
  return self->_triptychDurationMultiplier;
}

- (double)diptychDurationMultiplier
{
  return self->_diptychDurationMultiplier;
}

- (PFStoryMotionStyleTable)triptychMotionStyleTable
{
  return self->_triptychMotionStyleTable;
}

- (PFStoryMotionStyleTable)diptychMotionStyleTable
{
  return self->_diptychMotionStyleTable;
}

- (PFStoryMotionStyleTable)motionStyleTable
{
  return self->_motionStyleTable;
}

- (PFStoryTransitionTable)interModuleTransitionTable
{
  return self->_interModuleTransitionTable;
}

- (PFStoryTransitionTable)nUpTransitionTable
{
  return self->_nUpTransitionTable;
}

- (PFStoryTransitionTable)portraitTransitionTable
{
  return self->_portraitTransitionTable;
}

- (PFStoryTransitionTable)interMomentTransitionTable
{
  return self->_interMomentTransitionTable;
}

- (PFStoryTransitionTable)defaultTransitionTable
{
  return self->_defaultTransitionTable;
}

- (NSURL)url
{
  return self->_url;
}

- ($3DBB98C272AC9B04202267094881960A)longOverallDuration
{
  return [(PFStoryAutoEditConfiguration *)self _overallDurationInfoForDurationKind:5];
}

- ($3DBB98C272AC9B04202267094881960A)mediumOverallDuration
{
  return [(PFStoryAutoEditConfiguration *)self _overallDurationInfoForDurationKind:4];
}

- ($3DBB98C272AC9B04202267094881960A)shortOverallDuration
{
  return [(PFStoryAutoEditConfiguration *)self _overallDurationInfoForDurationKind:3];
}

- ($3DBB98C272AC9B04202267094881960A)_overallDurationInfoForDurationKind:(SEL)a3
{
  overallDurationTable = self->_overallDurationTable;
  v6 = [NSNumber numberWithInteger:a4];
  v7 = [(NSDictionary *)overallDurationTable objectForKeyedSubscript:v6];

  v8 = [v7 objectAtIndexedSubscript:0];
  [v8 doubleValue];
  Float64 v10 = v9;

  v11 = [v7 objectAtIndexedSubscript:1];
  [v11 doubleValue];
  Float64 v13 = v12;

  v14 = [v7 objectAtIndexedSubscript:2];
  [v14 doubleValue];
  Float64 v16 = v15;

  retstr->var2.var3 = 0;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var2.var0 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var3 = 0u;
  CMTimeMakeWithSeconds(&v20, v10, 600);
  CMTimeMakeWithSeconds(&v19, v13, 600);
  CMTimeMakeWithSeconds(&v18, v16, 600);
  retstr->var0 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v20;
  retstr->var1 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v19;
  retstr->var2 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v18;

  return result;
}

- (id)clusteringPropertiesForMemoryCategoryName:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(NSDictionary *)self->_clusteringPropertiesByCategory objectForKeyedSubscript:v4];
  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Falling back to default clustering for '%@'", (uint8_t *)&v7, 0xCu);
    }
    v5 = [(NSDictionary *)self->_clusteringPropertiesByCategory objectForKeyedSubscript:@"default"];
    if (!v5)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Configuration file missing default clustering properties", (uint8_t *)&v7, 2u);
      }
      v5 = [[PFStoryClusteringProperties alloc] initWithAlgorithmName:@"PLDBSCANClustering" algorithmProperties:&unk_1EF7CB0E0 distanceWeights:&unk_1EF7CB108];
    }
  }

  return v5;
}

- ($3DBB98C272AC9B04202267094881960A)maximumDurations
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  retstr->var2.var3 = 0;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var2.var0 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var3 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  result = ($3DBB98C272AC9B04202267094881960A *)[&unk_1EF7CACA0 countByEnumeratingWithState:&v26 objects:v31 count:16];
  v14 = result;
  if (result)
  {
    p_var1 = &retstr->var1;
    uint64_t v13 = *(void *)v27;
    p_var2 = &retstr->var2;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(&unk_1EF7CACA0);
        }
        uint64_t v15 = v7;
        v17 = *(void **)(*((void *)&v26 + 1) + 8 * v7);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v8 = [&unk_1EF7CACB8 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v23;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v23 != v10) {
                objc_enumerationMutation(&unk_1EF7CACB8);
              }
              double v12 = *(void **)(*((void *)&v22 + 1) + 8 * v11);
              long long v20 = 0u;
              memset(v21, 0, 56);
              -[PFStoryAutoEditConfiguration durationInfoForPlaybackStyle:songPace:](self, "durationInfoForPlaybackStyle:songPace:", [v17 integerValue], objc_msgSend(v12, "integerValue"));
              if ((retstr->var0.var2 & 1) == 0
                || (*(_OWORD *)&time1.value = v20,
                    time1.epoch = *(void *)v21,
                    CMTime time2 = (CMTime)retstr->var0,
                    CMTimeCompare(&time1, &time2) >= 1))
              {
                *(_OWORD *)&retstr->var0.var0 = v20;
                retstr->var0.var3 = *(void *)v21;
              }
              if ((retstr->var1.var2 & 1) == 0
                || (CMTime time1 = *(CMTime *)&v21[8],
                    *(_OWORD *)&time2.value = *(_OWORD *)&p_var1->var0,
                    time2.epoch = retstr->var1.var3,
                    CMTimeCompare(&time1, &time2) >= 1))
              {
                *(_OWORD *)&p_var1->var0 = *(_OWORD *)&v21[8];
                retstr->var1.var3 = *(void *)&v21[24];
              }
              if ((retstr->var2.var2 & 1) == 0
                || (CMTime time1 = *(CMTime *)&v21[32],
                    *(_OWORD *)&time2.value = *(_OWORD *)&p_var2->var0,
                    time2.epoch = retstr->var2.var3,
                    CMTimeCompare(&time1, &time2) >= 1))
              {
                *(_OWORD *)&p_var2->var0 = *(_OWORD *)&v21[32];
                retstr->var2.var3 = *(void *)&v21[48];
              }
              ++v11;
            }
            while (v9 != v11);
            uint64_t v9 = [&unk_1EF7CACB8 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v9);
        }
        uint64_t v7 = v15 + 1;
      }
      while (($3DBB98C272AC9B04202267094881960A *)(v15 + 1) != v14);
      result = ($3DBB98C272AC9B04202267094881960A *)[&unk_1EF7CACA0 countByEnumeratingWithState:&v26 objects:v31 count:16];
      v14 = result;
    }
    while (result);
  }
  return result;
}

- ($3DBB98C272AC9B04202267094881960A)minimumDurations
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  retstr->var2.var3 = 0;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var2.var0 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var3 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  result = ($3DBB98C272AC9B04202267094881960A *)[&unk_1EF7CAC70 countByEnumeratingWithState:&v26 objects:v31 count:16];
  v14 = result;
  if (result)
  {
    p_var1 = &retstr->var1;
    uint64_t v13 = *(void *)v27;
    p_var2 = &retstr->var2;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(&unk_1EF7CAC70);
        }
        uint64_t v15 = v7;
        v17 = *(void **)(*((void *)&v26 + 1) + 8 * v7);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v8 = [&unk_1EF7CAC88 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v23;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v23 != v10) {
                objc_enumerationMutation(&unk_1EF7CAC88);
              }
              double v12 = *(void **)(*((void *)&v22 + 1) + 8 * v11);
              long long v20 = 0u;
              memset(v21, 0, 56);
              -[PFStoryAutoEditConfiguration durationInfoForPlaybackStyle:songPace:](self, "durationInfoForPlaybackStyle:songPace:", [v17 integerValue], objc_msgSend(v12, "integerValue"));
              if ((retstr->var0.var2 & 1) == 0
                || (*(_OWORD *)&time1.value = v20,
                    time1.epoch = *(void *)v21,
                    CMTime time2 = (CMTime)retstr->var0,
                    CMTimeCompare(&time1, &time2) < 0))
              {
                *(_OWORD *)&retstr->var0.var0 = v20;
                retstr->var0.var3 = *(void *)v21;
              }
              if ((retstr->var1.var2 & 1) == 0
                || (CMTime time1 = *(CMTime *)&v21[8],
                    *(_OWORD *)&time2.value = *(_OWORD *)&p_var1->var0,
                    time2.epoch = retstr->var1.var3,
                    CMTimeCompare(&time1, &time2) < 0))
              {
                *(_OWORD *)&p_var1->var0 = *(_OWORD *)&v21[8];
                retstr->var1.var3 = *(void *)&v21[24];
              }
              if ((retstr->var2.var2 & 1) == 0
                || (CMTime time1 = *(CMTime *)&v21[32],
                    *(_OWORD *)&time2.value = *(_OWORD *)&p_var2->var0,
                    time2.epoch = retstr->var2.var3,
                    CMTimeCompare(&time1, &time2) < 0))
              {
                *(_OWORD *)&p_var2->var0 = *(_OWORD *)&v21[32];
                retstr->var2.var3 = *(void *)&v21[48];
              }
              ++v11;
            }
            while (v9 != v11);
            uint64_t v9 = [&unk_1EF7CAC88 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v9);
        }
        uint64_t v7 = v15 + 1;
      }
      while (($3DBB98C272AC9B04202267094881960A *)(v15 + 1) != v14);
      result = ($3DBB98C272AC9B04202267094881960A *)[&unk_1EF7CAC70 countByEnumeratingWithState:&v26 objects:v31 count:16];
      v14 = result;
    }
    while (result);
  }
  return result;
}

- (double)outroDurationForSongPace:(int64_t)a3
{
  int64_t v3 = a3;
  if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v11 = 0;
      int64_t v3 = 2;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Unknown song pace, falling back to medium", v11, 2u);
    }
    else
    {
      int64_t v3 = 2;
    }
  }
  outroDurations = self->_outroDurations;
  v6 = [NSNumber numberWithInteger:v3];
  uint64_t v7 = [(NSDictionary *)outroDurations objectForKeyedSubscript:v6];

  [v7 doubleValue];
  double v9 = v8;

  return v9;
}

- (double)durationForTransitionKind:(int64_t)a3 songPace:(int64_t)a4
{
  transitionDurationsByKind = self->_transitionDurationsByKind;
  v6 = [NSNumber numberWithInteger:a3];
  uint64_t v7 = [(NSDictionary *)transitionDurationsByKind objectForKeyedSubscript:v6];

  if (v7)
  {
    double v8 = [NSNumber numberWithInteger:a4];
    double v9 = [v7 objectForKeyedSubscript:v8];

    if (v9)
    {
      [v9 doubleValue];
      double v11 = v10;
    }
    else
    {
      double v11 = 0.0;
    }
  }
  else
  {
    double v11 = 0.0;
  }

  return v11;
}

- ($3DBB98C272AC9B04202267094881960A)durationInfoForPlaybackStyle:(SEL)a3 songPace:(int64_t)a4
{
  uint64_t v8 = 0;
  if ((unint64_t)a4 > 6) {
    goto LABEL_7;
  }
  if (((1 << a4) & 0x2C) != 0)
  {
    uint64_t v8 = 2;
LABEL_7:
    durationTablesByPlaybackStyle = self->_durationTablesByPlaybackStyle;
    double v10 = [NSNumber numberWithInteger:v8];
    double v11 = [(NSDictionary *)durationTablesByPlaybackStyle objectForKeyedSubscript:v10];

    double v12 = [NSNumber numberWithInteger:a5];
    uint64_t v13 = [v11 objectForKeyedSubscript:v12];

    v14 = [v13 objectAtIndexedSubscript:0];
    [v14 doubleValue];
    Float64 v16 = v15;

    v17 = [v13 objectAtIndexedSubscript:1];
    [v17 doubleValue];
    Float64 v19 = v18;

    long long v20 = [v13 objectAtIndexedSubscript:2];
    [v20 doubleValue];
    Float64 v22 = v21;

    retstr->var2.var3 = 0;
    *(_OWORD *)&retstr->var1.var1 = 0u;
    *(_OWORD *)&retstr->var2.var0 = 0u;
    *(_OWORD *)&retstr->var0.var0 = 0u;
    *(_OWORD *)&retstr->var0.var3 = 0u;
    CMTimeMakeWithSeconds(&v30, v16, 600);
    CMTimeMakeWithSeconds(&v29, v19, 600);
    CMTimeMakeWithSeconds(&v28, v22, 600);
    retstr->var0 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v30;
    retstr->var1 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v29;
    retstr->var2 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v28;

    return result;
  }
  if (a4 == 4)
  {
    uint64_t v8 = 1;
    goto LABEL_7;
  }
  if (((1 << a4) & 0x41) == 0) {
    goto LABEL_7;
  }
  if ((unint64_t)(a4 - 1) > 5) {
    long long v24 = @"unsupported";
  }
  else {
    long long v24 = off_1E5B2D540[a4 - 1];
  }
  v24;
  long long v25 = (PFStoryAutoEditConfiguration *)_PFAssertFailHandler();
  [(PFStoryAutoEditConfiguration *)v25 _loadClusteringPropertiesFromMemoryCategories:v27];
  return result;
}

- (void)_loadClusteringPropertiesFromMemoryCategories:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__PFStoryAutoEditConfiguration__loadClusteringPropertiesFromMemoryCategories___block_invoke;
  v10[3] = &unk_1E5B2CFD8;
  id v11 = v6;
  id v7 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v10];

  uint64_t v8 = (NSDictionary *)[v7 copy];
  clusteringPropertiesByCategory = self->_clusteringPropertiesByCategory;
  self->_clusteringPropertiesByCategory = v8;
}

void __78__PFStoryAutoEditConfiguration__loadClusteringPropertiesFromMemoryCategories___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [a3 objectForKeyedSubscript:@"clustering"];
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:@"algorithm"];
    double v9 = [v7 objectForKeyedSubscript:@"algorithmProperties"];
    double v10 = [v7 objectForKeyedSubscript:@"distanceWeights"];
    id v11 = [[PFStoryClusteringProperties alloc] initWithAlgorithmName:v8 algorithmProperties:v9 distanceWeights:v10];
    [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v5];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v12 = 138412290;
    id v13 = v5;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Memory category '%@' does not contain clustering properties.", (uint8_t *)&v12, 0xCu);
  }
}

- (id)_arrayFromTable:(id)a3 count:(unint64_t)a4 nameToValueMap:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  for (i = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4]; a4; --a4)
    [i addObject:&unk_1EF7CA2B0];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  Float64 v16 = __69__PFStoryAutoEditConfiguration__arrayFromTable_count_nameToValueMap___block_invoke;
  v17 = &unk_1E5B2CFB0;
  id v18 = v7;
  id v19 = i;
  id v10 = i;
  id v11 = v7;
  [v8 enumerateKeysAndObjectsUsingBlock:&v14];
  int v12 = objc_msgSend(v10, "copy", v14, v15, v16, v17);

  return v12;
}

void __69__PFStoryAutoEditConfiguration__arrayFromTable_count_nameToValueMap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
    objc_msgSend(*(id *)(a1 + 40), "setObject:atIndexedSubscript:", v7, objc_msgSend(v5, "integerValue"));
  }
}

- (id)_loadData:(id)a3
{
  uint64_t v192 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"version"];
  int v6 = [v5 intValue];

  if (v6 > 4)
  {
    uint64_t v8 = [v4 objectForKeyedSubscript:@"colorGradeCategories"];
    double v9 = (void *)v8;
    id v10 = (void *)MEMORY[0x1E4F1CC08];
    if (v8) {
      id v11 = (void *)v8;
    }
    else {
      id v11 = (void *)MEMORY[0x1E4F1CC08];
    }
    id v151 = v11;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"memoryCategories"];
    id v13 = (void *)v12;
    if (v12) {
      uint64_t v14 = (void *)v12;
    }
    else {
      uint64_t v14 = v10;
    }
    id v130 = v14;

    if (_loadData__onceToken[0] != -1) {
      dispatch_once(_loadData__onceToken, &__block_literal_global_123);
    }
    context = (void *)MEMORY[0x1A6259880]();
    uint64_t v15 = PFStoryColorGradeSupportedCategories();
    v147 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v15, "count"));
    v146 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v15, "count"));
    v145 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v15, "count"));
    v144 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v15, "count"));
    v143 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v15, "count"));
    v142 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v15, "count"));
    v141 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v15, "count"));
    v140 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v15, "count"));
    Float64 v16 = [v151 objectForKeyedSubscript:@"default"];
    v17 = [v16 objectForKeyedSubscript:@"transitions"];
    if (!v17)
    {
      id v18 = MEMORY[0x1E4F14500];
      id v19 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "AutoEdit configuration is missing default transition table", buf, 2u);
      }
    }
    v138 = [(PFStoryAutoEditConfiguration *)self _arrayFromTable:v17 count:9 nameToValueMap:_loadData__transitionsByName];
    long long v20 = [v16 objectForKeyedSubscript:@"interMomentTransitions"];
    if (!v20)
    {
      double v21 = MEMORY[0x1E4F14500];
      id v22 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "AutoEdit configuration is missing default inter-moment transition table", buf, 2u);
      }
    }
    v137 = [(PFStoryAutoEditConfiguration *)self _arrayFromTable:v20 count:9 nameToValueMap:_loadData__transitionsByName];
    long long v23 = [v16 objectForKeyedSubscript:@"portraitTransitions"];
    if (!v23)
    {
      long long v24 = MEMORY[0x1E4F14500];
      id v25 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "AutoEdit configuration is missing default portrait transition table", buf, 2u);
      }
    }
    v136 = [(PFStoryAutoEditConfiguration *)self _arrayFromTable:v23 count:9 nameToValueMap:_loadData__transitionsByName];
    SEL v26 = [v16 objectForKeyedSubscript:@"nUpTransitions"];
    if (!v26)
    {
      id v27 = MEMORY[0x1E4F14500];
      id v28 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "AutoEdit configuration is missing default N-up transition table", buf, 2u);
      }
    }
    v139 = v4;
    v135 = [(PFStoryAutoEditConfiguration *)self _arrayFromTable:v26 count:9 nameToValueMap:_loadData__transitionsByName];
    CMTime v29 = [v16 objectForKeyedSubscript:@"interModuleTransitions"];
    if (!v29)
    {
      CMTime v30 = MEMORY[0x1E4F14500];
      id v31 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "AutoEdit configuration is missing default inter-module transition table", buf, 2u);
      }
    }
    v134 = [(PFStoryAutoEditConfiguration *)self _arrayFromTable:v29 count:9 nameToValueMap:_loadData__transitionsByName];
    uint64_t v32 = [v16 objectForKeyedSubscript:@"motionStyles"];
    if (!v32)
    {
      v33 = MEMORY[0x1E4F14500];
      id v34 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "AutoEdit configuration is missing default motion style table", buf, 2u);
      }
    }
    v133 = [(PFStoryAutoEditConfiguration *)self _arrayFromTable:v32 count:4 nameToValueMap:_loadData__motionStylesByName];
    v35 = [v16 objectForKeyedSubscript:@"diptychMotionStyles"];
    v149 = self;
    if (!v35)
    {
      v36 = MEMORY[0x1E4F14500];
      id v37 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "AutoEdit configuration is missing default diptych motion style table", buf, 2u);
      }

      self = v149;
    }
    v132 = [(PFStoryAutoEditConfiguration *)self _arrayFromTable:v35 count:4 nameToValueMap:_loadData__motionStylesByName];
    uint64_t v38 = [v16 objectForKeyedSubscript:@"triptychMotionStyles"];
    v39 = self;
    v40 = (void *)v38;
    if (!v38)
    {
      v158 = v23;
      v41 = v20;
      v42 = v17;
      v43 = v15;
      v44 = MEMORY[0x1E4F14500];
      id v45 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "AutoEdit configuration is missing default triptych motion style table", buf, 2u);
      }

      v39 = v149;
      uint64_t v15 = v43;
      v17 = v42;
      long long v20 = v41;
      long long v23 = v158;
    }
    v131 = [(PFStoryAutoEditConfiguration *)v39 _arrayFromTable:v40 count:4 nameToValueMap:_loadData__motionStylesByName];

    long long v187 = 0u;
    long long v188 = 0u;
    long long v185 = 0u;
    long long v186 = 0u;
    id obj = v15;
    uint64_t v152 = [obj countByEnumeratingWithState:&v185 objects:v189 count:16];
    if (v152)
    {
      uint64_t v150 = *(void *)v186;
      do
      {
        for (uint64_t i = 0; i != v152; ++i)
        {
          if (*(void *)v186 != v150) {
            objc_enumerationMutation(obj);
          }
          uint64_t v47 = *(void *)(*((void *)&v185 + 1) + 8 * i);
          v48 = [v151 objectForKeyedSubscript:v47];
          if (v48)
          {
            v49 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
            v50 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
            v51 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
            v159 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
            v154 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
            v153 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
            v52 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
            v53 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
            v54 = (void *)_loadData__songPacesByName;
            v173[0] = MEMORY[0x1E4F143A8];
            v173[1] = 3221225472;
            v173[2] = __42__PFStoryAutoEditConfiguration__loadData___block_invoke_231;
            v173[3] = &unk_1E5B2CF60;
            v162 = v48;
            id v174 = v48;
            v175 = v149;
            v55 = v49;
            v176 = v55;
            uint64_t v177 = v47;
            id v56 = v50;
            id v178 = v56;
            id v156 = v51;
            id v179 = v156;
            id v160 = v159;
            id v180 = v160;
            id v57 = v154;
            id v181 = v57;
            id v58 = v153;
            id v182 = v58;
            id v59 = v52;
            id v183 = v59;
            id v60 = v53;
            id v184 = v60;
            [v54 enumerateKeysAndObjectsUsingBlock:v173];
            if ([v55 count]) {
              [v147 setObject:v55 forKeyedSubscript:v47];
            }
            if ([v56 count]) {
              [v146 setObject:v56 forKeyedSubscript:v47];
            }
            if ([v156 count]) {
              [v145 setObject:v156 forKeyedSubscript:v47];
            }
            if ([v160 count]) {
              [v144 setObject:v160 forKeyedSubscript:v47];
            }
            if ([v57 count]) {
              [v143 setObject:v57 forKeyedSubscript:v47];
            }
            if ([v58 count]) {
              [v142 setObject:v58 forKeyedSubscript:v47];
            }
            if ([v59 count]) {
              [v141 setObject:v59 forKeyedSubscript:v47];
            }
            if ([v60 count]) {
              [v140 setObject:v60 forKeyedSubscript:v47];
            }

            v48 = v162;
          }
          else
          {
            v55 = MEMORY[0x1E4F14500];
            id v61 = MEMORY[0x1E4F14500];
            if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v191 = v47;
              _os_log_impl(&dword_1A41FE000, v55, OS_LOG_TYPE_INFO, "AutoEdit configuration missing color grade (%@)", buf, 0xCu);
            }
          }
        }
        uint64_t v152 = [obj countByEnumeratingWithState:&v185 objects:v189 count:16];
      }
      while (v152);
    }

    v62 = [[PFStoryConcreteTransitionTable alloc] initWithTransitionsByColorGrade:v147 defaultFrequencies:v138];
    v63 = v149;
    defaultTransitionTable = v149->_defaultTransitionTable;
    v149->_defaultTransitionTable = (PFStoryTransitionTable *)v62;

    v65 = [[PFStoryConcreteTransitionTable alloc] initWithTransitionsByColorGrade:v146 defaultFrequencies:v137];
    interMomentTransitionTable = v149->_interMomentTransitionTable;
    v149->_interMomentTransitionTable = (PFStoryTransitionTable *)v65;

    v67 = [[PFStoryConcreteTransitionTable alloc] initWithTransitionsByColorGrade:v145 defaultFrequencies:v136];
    portraitTransitionTable = v149->_portraitTransitionTable;
    v149->_portraitTransitionTable = (PFStoryTransitionTable *)v67;

    v69 = [[PFStoryConcreteTransitionTable alloc] initWithTransitionsByColorGrade:v144 defaultFrequencies:v135];
    nUpTransitionTable = v149->_nUpTransitionTable;
    v149->_nUpTransitionTable = (PFStoryTransitionTable *)v69;

    v71 = [[PFStoryConcreteTransitionTable alloc] initWithTransitionsByColorGrade:v143 defaultFrequencies:v134];
    interModuleTransitionTable = v149->_interModuleTransitionTable;
    v149->_interModuleTransitionTable = (PFStoryTransitionTable *)v71;

    v73 = [[PFStoryConcreteMotionStyleTable alloc] initWithMotionStylesByColorGrade:v142 defaultFrequencies:v133];
    motionStyleTable = v149->_motionStyleTable;
    v149->_motionStyleTable = (PFStoryMotionStyleTable *)v73;

    v75 = [[PFStoryConcreteMotionStyleTable alloc] initWithMotionStylesByColorGrade:v141 defaultFrequencies:v132];
    diptychMotionStyleTable = v149->_diptychMotionStyleTable;
    v149->_diptychMotionStyleTable = (PFStoryMotionStyleTable *)v75;

    v77 = [[PFStoryConcreteMotionStyleTable alloc] initWithMotionStylesByColorGrade:v140 defaultFrequencies:v131];
    triptychMotionStyleTable = v149->_triptychMotionStyleTable;
    v149->_triptychMotionStyleTable = (PFStoryMotionStyleTable *)v77;

    id v4 = v139;
    v79 = [v139 objectForKeyedSubscript:@"durations"];
    v80 = (void *)_loadData__playbackStyleMap;
    v170[0] = MEMORY[0x1E4F143A8];
    v170[1] = 3221225472;
    v170[2] = __42__PFStoryAutoEditConfiguration__loadData___block_invoke_236;
    v170[3] = &unk_1E5B2CFB0;
    id v81 = v79;
    id v171 = v81;
    v172 = v149;
    [v80 enumerateKeysAndObjectsUsingBlock:v170];
    v82 = [v81 objectForKeyedSubscript:@"multipliers"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v83 = [v82 objectForKeyedSubscript:@"diptych"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v83 doubleValue];
        v149->_diptychDurationMultiplier = v84;
      }
      v85 = [v82 objectForKeyedSubscript:@"triptych"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v85 doubleValue];
        v149->_triptychDurationMultiplier = v86;
      }
      v87 = [v82 objectForKeyedSubscript:@"initial"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v87 doubleValue];
        v149->_initialDurationMultiplier = v88;
      }
      v89 = [v82 objectForKeyedSubscript:@"chapterBegin"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v89 doubleValue];
        v149->_chapterBeginDurationMultiplier = v90;
      }
      v91 = [v82 objectForKeyedSubscript:@"final"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v91 doubleValue];
        v149->_finalDurationMultiplier = v92;
      }

      id v4 = v139;
      v63 = v149;
    }
    v93 = (void *)_loadData__overallDurationKindMap;
    v167[0] = MEMORY[0x1E4F143A8];
    v167[1] = 3221225472;
    v167[2] = __42__PFStoryAutoEditConfiguration__loadData___block_invoke_3;
    v167[3] = &unk_1E5B2CFB0;
    id v94 = v81;
    id v168 = v94;
    v169 = v63;
    [v93 enumerateKeysAndObjectsUsingBlock:v167];
    id v95 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v96 = [v94 objectForKeyedSubscript:@"transitions"];
    v97 = (void *)_loadData__transitionsByName;
    v164[0] = MEMORY[0x1E4F143A8];
    v164[1] = 3221225472;
    v164[2] = __42__PFStoryAutoEditConfiguration__loadData___block_invoke_4;
    v164[3] = &unk_1E5B2CFB0;
    id v163 = v96;
    id v165 = v163;
    id v98 = v95;
    id v166 = v98;
    [v97 enumerateKeysAndObjectsUsingBlock:v164];
    v161 = v98;
    uint64_t v99 = [v98 copy];
    transitionDurationsByKind = v63->_transitionDurationsByKind;
    v63->_transitionDurationsByKind = (NSDictionary *)v99;

    v101 = [v4 objectForKeyedSubscript:@"songPaceTargets"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v102 = [v101 objectForKeyedSubscript:@"slowVisualTempo"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v102 doubleValue];
        v63->_slowVisualTempoTarget = v103;
      }
      v104 = [v101 objectForKeyedSubscript:@"mediumVisualTempo"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v104 doubleValue];
        v63->_mediumVisualTempoTarget = v105;
      }
      v106 = [v101 objectForKeyedSubscript:@"fastVisualTempo"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v106 doubleValue];
        v149->_fastVisualTempoTarget = v107;
      }

      v63 = v149;
    }
    v157 = v101;
    v108 = [v94 objectForKeyedSubscript:@"composability"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v109 = [v108 objectForKeyedSubscript:@"duration"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v109 doubleValue];
        v63->_composabilityTargetDurationMultiplier = v110;
      }
      v111 = [v108 objectForKeyedSubscript:@"minimumNUpCount"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v63->_composabilityMinimumNUpCount = [v111 integerValue];
      }
      v112 = [v108 objectForKeyedSubscript:@"minimum1UpRunCount"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v149->_composabilityMinimum1UpRunCount = [v112 integerValue];
      }
      v113 = [v108 objectForKeyedSubscript:@"maximumNUpRunCount"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v149->_composabilityMaximumNUpRunCount = [v113 integerValue];
      }
      v114 = [v108 objectForKeyedSubscript:@"threshold"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v114 doubleValue];
        v149->_composabilityScoreThreshold = v115;
      }

      id v4 = v139;
      v63 = v149;
    }
    v116 = [v94 objectForKeyedSubscript:@"outro"];
    v117 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v118 = [v116 objectForKeyedSubscript:@"slow"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v117 setObject:v118 forKeyedSubscript:&unk_1EF7CA298];
      }
      else
      {
        v119 = [(NSDictionary *)v149->_outroDurations objectForKeyedSubscript:&unk_1EF7CA298];
        [v117 setObject:v119 forKeyedSubscript:&unk_1EF7CA298];
      }
      v155 = v82;
      v120 = [v116 objectForKeyedSubscript:@"medium"];
      objc_opt_class();
      id v121 = v94;
      if (objc_opt_isKindOfClass())
      {
        [v117 setObject:v120 forKeyedSubscript:&unk_1EF7CA2C8];
      }
      else
      {
        v122 = [(NSDictionary *)v149->_outroDurations objectForKeyedSubscript:&unk_1EF7CA2C8];
        [v117 setObject:v122 forKeyedSubscript:&unk_1EF7CA2C8];
      }
      v123 = [v116 objectForKeyedSubscript:@"fast"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v117 setObject:v123 forKeyedSubscript:&unk_1EF7CA2E0];
        v124 = v149;
      }
      else
      {
        v124 = v149;
        v125 = [(NSDictionary *)v149->_outroDurations objectForKeyedSubscript:&unk_1EF7CA2E0];
        [v117 setObject:v125 forKeyedSubscript:&unk_1EF7CA2E0];
      }
      id v94 = v121;
      uint64_t v126 = [v117 copy];
      outroDurations = v124->_outroDurations;
      v124->_outroDurations = (NSDictionary *)v126;

      id v4 = v139;
      v63 = v124;
      v82 = v155;
    }
    [(PFStoryAutoEditConfiguration *)v63 _loadClusteringPropertiesFromMemoryCategories:v130];

    id v7 = v63;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v191 = v6;
      *(_WORD *)&v191[4] = 1024;
      *(_DWORD *)&v191[6] = 5;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Configuration data version (%d) is below the minimum version (%d)", buf, 0xEu);
    }
    id v7 = 0;
  }

  return v7;
}

void __42__PFStoryAutoEditConfiguration__loadData___block_invoke_231(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"transitions"];
  id v34 = (void *)v8;
  if (v8)
  {
    double v9 = [*(id *)(a1 + 40) _arrayFromTable:v8 count:9 nameToValueMap:_loadData__transitionsByName];
    if ([v9 count]) {
      [*(id *)(a1 + 48) setObject:v9 forKeyedSubscript:v6];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138412546;
    uint64_t v36 = v10;
    __int16 v37 = 2112;
    id v38 = v5;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "AutoEdit transitions missing for color grade (%@) song pace (%@)", buf, 0x16u);
  }
  uint64_t v11 = [v7 objectForKeyedSubscript:@"interMomentTransitions"];
  v33 = (void *)v11;
  if (v11)
  {
    uint64_t v12 = [*(id *)(a1 + 40) _arrayFromTable:v11 count:9 nameToValueMap:_loadData__transitionsByName];
    if ([v12 count]) {
      [*(id *)(a1 + 64) setObject:v12 forKeyedSubscript:v6];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138412546;
    uint64_t v36 = v13;
    __int16 v37 = 2112;
    id v38 = v5;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "AutoEdit inter-moment transitions missing for color grade (%@) song pace (%@)", buf, 0x16u);
  }
  uint64_t v14 = [v7 objectForKeyedSubscript:@"portraitTransitions"];
  uint64_t v32 = (void *)v14;
  if (v14)
  {
    uint64_t v15 = [*(id *)(a1 + 40) _arrayFromTable:v14 count:9 nameToValueMap:_loadData__transitionsByName];
    if ([v15 count]) {
      [*(id *)(a1 + 72) setObject:v15 forKeyedSubscript:v6];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138412546;
    uint64_t v36 = v16;
    __int16 v37 = 2112;
    id v38 = v5;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "AutoEdit portrait transitions missing for color grade (%@) song pace (%@)", buf, 0x16u);
  }
  v17 = [v7 objectForKeyedSubscript:@"nUpTransitions"];
  if (v17)
  {
    id v18 = [*(id *)(a1 + 40) _arrayFromTable:v17 count:9 nameToValueMap:_loadData__transitionsByName];
    if ([v18 count]) {
      [*(id *)(a1 + 80) setObject:v18 forKeyedSubscript:v6];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138412546;
    uint64_t v36 = v19;
    __int16 v37 = 2112;
    id v38 = v5;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "AutoEdit N-up transitions missing for color grade (%@) song pace (%@)", buf, 0x16u);
  }
  long long v20 = [v7 objectForKeyedSubscript:@"interModuleTransitions"];
  if (v20)
  {
    double v21 = [*(id *)(a1 + 40) _arrayFromTable:v20 count:9 nameToValueMap:_loadData__transitionsByName];
    if ([v21 count]) {
      [*(id *)(a1 + 88) setObject:v21 forKeyedSubscript:v6];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v22 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138412546;
    uint64_t v36 = v22;
    __int16 v37 = 2112;
    id v38 = v5;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "AutoEdit inter-module transitions missing for color grade (%@) song pace (%@)", buf, 0x16u);
  }
  long long v23 = [v7 objectForKeyedSubscript:@"motionStyles"];
  if (v23)
  {
    long long v24 = [*(id *)(a1 + 40) _arrayFromTable:v23 count:4 nameToValueMap:_loadData__motionStylesByName];
    if ([v24 count]) {
      [*(id *)(a1 + 96) setObject:v24 forKeyedSubscript:v6];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v25 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138412546;
    uint64_t v36 = v25;
    __int16 v37 = 2112;
    id v38 = v5;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "AutoEdit motionStyles missing for color grade (%@) song pace (%@)", buf, 0x16u);
  }
  SEL v26 = [v7 objectForKeyedSubscript:@"diptychMotionStyles"];
  if (v26)
  {
    id v27 = [*(id *)(a1 + 40) _arrayFromTable:v26 count:4 nameToValueMap:_loadData__motionStylesByName];
    if ([v27 count]) {
      [*(id *)(a1 + 104) setObject:v27 forKeyedSubscript:v6];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v28 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138412546;
    uint64_t v36 = v28;
    __int16 v37 = 2112;
    id v38 = v5;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "AutoEdit diptych motionStyles missing for color grade (%@) song pace (%@)", buf, 0x16u);
  }
  CMTime v29 = [v7 objectForKeyedSubscript:@"triptychMotionStyles"];
  if (v29)
  {
    CMTime v30 = [*(id *)(a1 + 40) _arrayFromTable:v29 count:4 nameToValueMap:_loadData__motionStylesByName];
    if ([v30 count]) {
      [*(id *)(a1 + 112) setObject:v30 forKeyedSubscript:v6];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v31 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138412546;
    uint64_t v36 = v31;
    __int16 v37 = 2112;
    id v38 = v5;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "AutoEdit triptych motionStyles missing for color grade (%@) song pace (%@)", buf, 0x16u);
  }
}

void __42__PFStoryAutoEditConfiguration__loadData___block_invoke_236(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)_loadData__paceMap;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__PFStoryAutoEditConfiguration__loadData___block_invoke_2;
  v10[3] = &unk_1E5B2CF88;
  id v11 = *(id *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = *(void *)(a1 + 40);
  id v14 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 enumerateKeysAndObjectsUsingBlock:v10];
}

void __42__PFStoryAutoEditConfiguration__loadData___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v6 = [&unk_1EF7CAC58 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      int v8 = 0;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(&unk_1EF7CAC58);
          }
          uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          id v12 = [v5 objectForKeyedSubscript:v11];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            id v14 = [v5 objectForKeyedSubscript:v11];
            uint64_t v15 = [*(id *)(*(void *)(a1 + 40) + 32) objectForKeyedSubscript:v16];
            [v15 setObject:v14 atIndexedSubscript:v8 + i];
          }
        }
        v8 += i;
        uint64_t v7 = [&unk_1EF7CAC58 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }
  }
}

void __42__PFStoryAutoEditConfiguration__loadData___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    int v8 = (void *)_loadData__paceMap;
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __42__PFStoryAutoEditConfiguration__loadData___block_invoke_5;
    id v14 = &unk_1E5B2CFB0;
    id v15 = v6;
    id v9 = v7;
    id v16 = v9;
    [v8 enumerateKeysAndObjectsUsingBlock:&v11];
    if (objc_msgSend(v9, "count", v11, v12, v13, v14))
    {
      uint64_t v10 = (void *)[v9 copy];
      [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v5];
    }
  }
}

void __42__PFStoryAutoEditConfiguration__loadData___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (v5) {
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v6];
  }
}

void __42__PFStoryAutoEditConfiguration__loadData___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v19 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  long long v18 = v5;
  id v7 = [v6 objectForKeyedSubscript:v5];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = [&unk_1EF7CAC40 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    int v10 = 0;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(&unk_1EF7CAC40);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v14 = [v7 objectForKeyedSubscript:v13];

        if (v14)
        {
          id v15 = [v7 objectForKeyedSubscript:v13];
          id v16 = [*(id *)(*(void *)(a1 + 48) + 8) objectForKeyedSubscript:*(void *)(a1 + 56)];
          long long v17 = [v16 objectForKeyedSubscript:v19];
          [v17 setObject:v15 atIndexedSubscript:v10 + i];
        }
      }
      v10 += i;
      uint64_t v9 = [&unk_1EF7CAC40 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }
}

void __42__PFStoryAutoEditConfiguration__loadData___block_invoke()
{
  v0 = (void *)_loadData__songPacesByName;
  _loadData__songPacesByName = (uint64_t)&unk_1EF7CAFF0;

  v1 = (void *)_loadData__transitionsByName;
  _loadData__transitionsByName = (uint64_t)&unk_1EF7CB018;

  v2 = (void *)_loadData__motionStylesByName;
  _loadData__motionStylesByName = (uint64_t)&unk_1EF7CB040;

  int64_t v3 = (void *)_loadData__playbackStyleMap;
  _loadData__playbackStyleMap = (uint64_t)&unk_1EF7CB068;

  id v4 = (void *)_loadData__paceMap;
  _loadData__paceMap = (uint64_t)&unk_1EF7CB090;

  id v5 = (void *)_loadData__overallDurationKindMap;
  _loadData__overallDurationKindMap = (uint64_t)&unk_1EF7CB0B8;
}

- (PFStoryAutoEditConfiguration)initWithConfigurationDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(PFStoryAutoEditConfiguration *)self init];
  id v6 = [(PFStoryAutoEditConfiguration *)v5 _loadData:v4];

  return v6;
}

- (PFStoryAutoEditConfiguration)initWithConfigurationData:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v9 = 0;
    id v5 = [MEMORY[0x1E4F28F98] propertyListWithData:v4 options:0 format:0 error:&v9];
    id v6 = v9;
    if (v5)
    {
      self = [(PFStoryAutoEditConfiguration *)self initWithConfigurationDictionary:v5];
      id v7 = self;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v6;
        _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "PFStoryAutoEditConfiguration failed to load property list from data: %@", buf, 0xCu);
      }
      id v7 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "PFStoryAutoEditConfiguration cannot load nil data.", buf, 2u);
    }
    id v7 = 0;
  }

  return v7;
}

- (PFStoryAutoEditConfiguration)initWithConfigurationFileAtURL:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v5];
  id v7 = [(PFStoryAutoEditConfiguration *)self initWithConfigurationData:v6];
  uint64_t v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_url, a3);
  }

  return v8;
}

- (PFStoryAutoEditConfiguration)init
{
  v61[3] = *MEMORY[0x1E4F143B8];
  v49.receiver = self;
  v49.super_class = (Class)PFStoryAutoEditConfiguration;
  v2 = [(PFStoryAutoEditConfiguration *)&v49 init];
  if (v2)
  {
    int64_t v3 = [PFStoryConcreteTransitionTable alloc];
    uint64_t v4 = MEMORY[0x1E4F1CC08];
    uint64_t v5 = [(PFStoryConcreteTransitionTable *)v3 initWithTransitionsByColorGrade:MEMORY[0x1E4F1CC08] defaultFrequencies:0];
    id v6 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v5;

    id v7 = [[PFStoryConcreteTransitionTable alloc] initWithTransitionsByColorGrade:v4 defaultFrequencies:0];
    uint64_t v8 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v7;

    id v9 = [[PFStoryConcreteTransitionTable alloc] initWithTransitionsByColorGrade:v4 defaultFrequencies:0];
    int v10 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v9;

    id v11 = [[PFStoryConcreteTransitionTable alloc] initWithTransitionsByColorGrade:v4 defaultFrequencies:0];
    uint64_t v12 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v11;

    uint64_t v13 = [[PFStoryConcreteTransitionTable alloc] initWithTransitionsByColorGrade:v4 defaultFrequencies:0];
    id v14 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v13;

    id v15 = [[PFStoryConcreteMotionStyleTable alloc] initWithMotionStylesByColorGrade:v4 defaultFrequencies:0];
    id v16 = (void *)*((void *)v2 + 12);
    *((void *)v2 + 12) = v15;

    long long v17 = [[PFStoryConcreteMotionStyleTable alloc] initWithMotionStylesByColorGrade:v4 defaultFrequencies:0];
    long long v18 = (void *)*((void *)v2 + 13);
    *((void *)v2 + 13) = v17;

    id v19 = [[PFStoryConcreteMotionStyleTable alloc] initWithMotionStylesByColorGrade:v4 defaultFrequencies:0];
    long long v20 = (void *)*((void *)v2 + 14);
    *((void *)v2 + 14) = v19;

    v60[0] = &unk_1EF7CA280;
    v58[0] = &unk_1EF7CA298;
    v48 = (void *)[&unk_1EF7CAB20 mutableCopy];
    v59[0] = v48;
    v58[1] = &unk_1EF7CA2C8;
    uint64_t v47 = (void *)[&unk_1EF7CAB38 mutableCopy];
    v59[1] = v47;
    v58[2] = &unk_1EF7CA2E0;
    v46 = (void *)[&unk_1EF7CAB50 mutableCopy];
    v59[2] = v46;
    id v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:3];
    v61[0] = v45;
    v60[1] = &unk_1EF7CA2C8;
    v56[0] = &unk_1EF7CA298;
    long long v21 = (void *)[&unk_1EF7CAB68 mutableCopy];
    v57[0] = v21;
    v56[1] = &unk_1EF7CA2C8;
    long long v22 = (void *)[&unk_1EF7CAB80 mutableCopy];
    v57[1] = v22;
    v56[2] = &unk_1EF7CA2E0;
    long long v23 = (void *)[&unk_1EF7CAB98 mutableCopy];
    v57[2] = v23;
    long long v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:3];
    v61[1] = v24;
    v60[2] = &unk_1EF7CA298;
    v54[0] = &unk_1EF7CA298;
    uint64_t v25 = (void *)[&unk_1EF7CABB0 mutableCopy];
    v55[0] = v25;
    v54[1] = &unk_1EF7CA2C8;
    SEL v26 = (void *)[&unk_1EF7CABC8 mutableCopy];
    v55[1] = v26;
    v54[2] = &unk_1EF7CA2E0;
    id v27 = (void *)[&unk_1EF7CABE0 mutableCopy];
    v55[2] = v27;
    uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:3];
    v61[2] = v28;
    uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:3];
    CMTime v30 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v29;

    uint64_t v31 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = MEMORY[0x1E4F1CC08];

    *(_OWORD *)(v2 + 120) = xmmword_1A42D34B0;
    __asm { FMOV            V0.2D, #1.5 }
    *(_OWORD *)(v2 + 136) = _Q0;
    *((void *)v2 + 19) = 0x4000000000000000;
    v52[0] = &unk_1EF7CA2E0;
    __int16 v37 = (void *)[&unk_1EF7CABF8 mutableCopy];
    v53[0] = v37;
    v52[1] = &unk_1EF7CA2F8;
    id v38 = (void *)[&unk_1EF7CAC10 mutableCopy];
    v53[1] = v38;
    v52[2] = &unk_1EF7CA310;
    uint64_t v39 = (void *)[&unk_1EF7CAC28 mutableCopy];
    v53[2] = v39;
    uint64_t v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:3];
    v41 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v40;

    v50[0] = &unk_1EF7CA298;
    v50[1] = &unk_1EF7CA2C8;
    v51[0] = &unk_1EF7CAEC0;
    v51[1] = &unk_1EF7CAED0;
    v50[2] = &unk_1EF7CA2E0;
    v51[2] = &unk_1EF7CAEE0;
    uint64_t v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:3];
    v43 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v42;

    *((_OWORD *)v2 + 10) = xmmword_1A42D34C0;
    *((_OWORD *)v2 + 11) = xmmword_1A42D34D0;
    *((int64x2_t *)v2 + 12) = vdupq_n_s64(2uLL);
    *((void *)v2 + 26) = 2;
    *((void *)v2 + 27) = 0;
  }
  return (PFStoryAutoEditConfiguration *)v2;
}

+ (id)standardConfiguration
{
  if (standardConfiguration_onceToken != -1) {
    dispatch_once(&standardConfiguration_onceToken, &__block_literal_global_80);
  }
  v2 = (void *)standardConfiguration_instance;

  return v2;
}

void __53__PFStoryAutoEditConfiguration_standardConfiguration__block_invoke()
{
  id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v0 = [v5 URLForResource:@"PFStoryAutoEditDefaultConfig" withExtension:@"plist"];
  v1 = [[PFStoryAutoEditConfiguration alloc] initWithConfigurationFileAtURL:v0];
  v2 = (void *)standardConfiguration_instance;
  standardConfiguration_instance = (uint64_t)v1;

  if (standardConfiguration_instance)
  {
  }
  else
  {
    int64_t v3 = (void *)_PFAssertFailHandler();
    +[PFStoryAutoEditConfiguration currentVersion];
  }
}

+ (NSNumber)currentVersion
{
  return (NSNumber *)&unk_1EF7CA328;
}

@end