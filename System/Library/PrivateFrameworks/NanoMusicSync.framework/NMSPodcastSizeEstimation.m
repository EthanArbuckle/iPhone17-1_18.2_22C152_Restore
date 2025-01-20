@interface NMSPodcastSizeEstimation
+ (double)_defaultSizeDurationRatio;
+ (unint64_t)_defaultEstimatedSize;
+ (unint64_t)_minimumSizeThreshold;
- (BOOL)incrementSize:(unint64_t)a3 duration:(double)a4 forFeedURL:(id)a5;
- (BOOL)isEmpty;
- (NMSPodcastSizeEstimation)init;
- (NSMutableDictionary)sizeInfoDict;
- (double)_adjustedSizeDurationRatio:(double)a3;
- (double)_totalSizeDurationRatio;
- (id)_cachedPodcastSizeInfoDict;
- (unint64_t)_totalAverageSize;
- (unint64_t)averageEpisodeSize;
- (unint64_t)sizeForFeedURL:(id)a3 duration:(double)a4 feedProvidedSize:(unint64_t)a5;
- (void)_cachedPodcastSizeInfoDict;
- (void)_setupFromCache;
- (void)setSizeInfoDict:(id)a3;
- (void)synchronize;
@end

@implementation NMSPodcastSizeEstimation

- (NMSPodcastSizeEstimation)init
{
  v5.receiver = self;
  v5.super_class = (Class)NMSPodcastSizeEstimation;
  v2 = [(NMSPodcastSizeEstimation *)&v5 init];
  v3 = v2;
  if (v2) {
    [(NMSPodcastSizeEstimation *)v2 _setupFromCache];
  }
  return v3;
}

- (BOOL)isEmpty
{
  return self->_empty;
}

- (BOOL)incrementSize:(unint64_t)a3 duration:(double)a4 forFeedURL:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a5;
  v9 = v8;
  if (a3 && fabs(a4) >= 2.22044605e-16 && [v8 length])
  {
    v10 = [(NMSPodcastSizeEstimation *)self sizeInfoDict];
    v11 = [v10 objectForKeyedSubscript:v9];
    v12 = v11;
    if (v11) {
      v13 = v11;
    }
    else {
      v13 = objc_opt_new();
    }
    v14 = v13;

    v16 = NMLogForCategory(5);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      unint64_t v22 = (unint64_t)v14;
      _os_log_impl(&dword_2228FD000, v16, OS_LOG_TYPE_DEFAULT, "[PodcastSize] Updating podcastSizeInfo. Before: %@", (uint8_t *)&v21, 0xCu);
    }

    [v14 setTotalSize:[v14 totalSize] + a3];
    [v14 totalDuration];
    [v14 setTotalDuration:v17 + a4];
    [v14 setCount:[v14 count] + 1];
    v18 = [(NMSPodcastSizeEstimation *)self sizeInfoDict];
    [v18 setObject:v14 forKeyedSubscript:v9];

    v19 = NMLogForCategory(5);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      unint64_t v22 = (unint64_t)v14;
      _os_log_impl(&dword_2228FD000, v19, OS_LOG_TYPE_DEFAULT, "[PodcastSize] Updating podcastSizeInfo. After: %@", (uint8_t *)&v21, 0xCu);
    }

    BOOL v15 = 1;
  }
  else
  {
    v14 = NMLogForCategory(5);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v21 = 134218498;
      unint64_t v22 = a3;
      __int16 v23 = 2048;
      double v24 = a4;
      __int16 v25 = 2112;
      v26 = v9;
      _os_log_error_impl(&dword_2228FD000, v14, OS_LOG_TYPE_ERROR, "[PodcastSize] Failed to update podcast size estimation cache with size: %llu, duration: %f, feedURL: %@", (uint8_t *)&v21, 0x20u);
    }
    BOOL v15 = 0;
  }

  return v15;
}

- (void)synchronize
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2228FD000, a2, OS_LOG_TYPE_ERROR, "[PodcastSize] Failed to archive podcasts size info due to: %@", (uint8_t *)&v2, 0xCu);
}

- (unint64_t)sizeForFeedURL:(id)a3 duration:(double)a4 feedProvidedSize:(unint64_t)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if ([v8 length])
  {
    v9 = [(NMSPodcastSizeEstimation *)self sizeInfoDict];
    v10 = [v9 objectForKeyedSubscript:v8];
  }
  else
  {
    v10 = 0;
  }
  if ([(id)objc_opt_class() _minimumSizeThreshold] < a5)
  {
    v11 = NMLogForCategory(5);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[NMSPodcastSizeEstimation sizeForFeedURL:duration:feedProvidedSize:]((uint64_t)v8, a5, v11);
    }
    unint64_t totalAverageSize = a5;
    goto LABEL_23;
  }
  double v13 = fabs(a4);
  if (v10)
  {
    if (v13 <= 2.22044605e-16)
    {
      unint64_t totalAverageSize = [v10 averageSize];
      v11 = NMLogForCategory(5);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_23;
      }
      int v25 = 138413058;
      id v26 = v8;
      __int16 v27 = 2048;
      unint64_t v28 = a5;
      __int16 v29 = 2048;
      double v30 = a4;
      __int16 v31 = 2048;
      unint64_t v32 = totalAverageSize;
      v16 = "[PodcastSize] Podcast %@ provided size is %llu, duration is %f, estimated size %llu based on podcast average.";
      v19 = v11;
      uint32_t v20 = 42;
      goto LABEL_22;
    }
    [v10 sizeDurationRatio];
    -[NMSPodcastSizeEstimation _adjustedSizeDurationRatio:](self, "_adjustedSizeDurationRatio:");
    double v15 = v14;
    unint64_t totalAverageSize = (unint64_t)(v14 * a4);
    v11 = NMLogForCategory(5);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_23;
    }
    int v25 = 138413314;
    id v26 = v8;
    __int16 v27 = 2048;
    unint64_t v28 = a5;
    __int16 v29 = 2048;
    double v30 = a4;
    __int16 v31 = 2048;
    unint64_t v32 = totalAverageSize;
    __int16 v33 = 2048;
    unint64_t v34 = *(void *)&v15;
    v16 = "[PodcastSize] Podcast %@ provided size is %llu, duration is %f, estimated size %llu based on podcast ratio %f.";
LABEL_21:
    v19 = v11;
    uint32_t v20 = 52;
LABEL_22:
    _os_log_debug_impl(&dword_2228FD000, v19, OS_LOG_TYPE_DEBUG, v16, (uint8_t *)&v25, v20);
    goto LABEL_23;
  }
  if (v13 > 2.22044605e-16)
  {
    [(NMSPodcastSizeEstimation *)self _adjustedSizeDurationRatio:self->_totalSizeDurationRatio];
    double v18 = v17;
    unint64_t totalAverageSize = (unint64_t)(v17 * a4);
    v11 = NMLogForCategory(5);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_23;
    }
    int v25 = 138413314;
    id v26 = v8;
    __int16 v27 = 2048;
    unint64_t v28 = a5;
    __int16 v29 = 2048;
    double v30 = a4;
    __int16 v31 = 2048;
    unint64_t v32 = totalAverageSize;
    __int16 v33 = 2048;
    unint64_t v34 = *(void *)&v18;
    v16 = "[PodcastSize] Podcast %@ provided size is %llu, duration is %f, estimated size %llu based on total average ratio %f.";
    goto LABEL_21;
  }
  unint64_t totalAverageSize = self->_totalAverageSize;
  unint64_t v21 = [(id)objc_opt_class() _defaultEstimatedSize];
  if (totalAverageSize <= v21) {
    unint64_t totalAverageSize = v21;
  }
  v11 = NMLogForCategory(5);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v22 = self->_totalAverageSize;
    int v25 = 138413314;
    id v26 = v8;
    __int16 v27 = 2048;
    unint64_t v28 = a5;
    __int16 v29 = 2048;
    double v30 = a4;
    __int16 v31 = 2048;
    unint64_t v32 = v22;
    __int16 v33 = 2048;
    unint64_t v34 = totalAverageSize;
    v16 = "[PodcastSize] Podcast %@ provided size is %llu, duration is %f, total average is %llu, estimated size %llu bas"
          "ed on total average.";
    goto LABEL_21;
  }
LABEL_23:

  if (totalAverageSize < [(id)objc_opt_class() _minimumSizeThreshold])
  {
    __int16 v23 = NMLogForCategory(5);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 138413058;
      id v26 = v8;
      __int16 v27 = 2048;
      unint64_t v28 = a5;
      __int16 v29 = 2048;
      double v30 = a4;
      __int16 v31 = 2048;
      unint64_t v32 = totalAverageSize;
      _os_log_impl(&dword_2228FD000, v23, OS_LOG_TYPE_DEFAULT, "[PodcastSize] Podcast %@ provided size is %llu, duration is %f, estimated size is %llu. Using static estimate instead.", (uint8_t *)&v25, 0x2Au);
    }

    unint64_t totalAverageSize = [(id)objc_opt_class() _defaultEstimatedSize];
  }

  return totalAverageSize;
}

- (unint64_t)averageEpisodeSize
{
  return [(NMSPodcastSizeEstimation *)self sizeForFeedURL:0 duration:0 feedProvidedSize:0.0];
}

+ (unint64_t)_minimumSizeThreshold
{
  return 1000000;
}

+ (unint64_t)_defaultEstimatedSize
{
  return 50000000;
}

+ (double)_defaultSizeDurationRatio
{
  return 16000.0;
}

- (double)_adjustedSizeDurationRatio:(double)a3
{
  if (fabs(a3) <= 2.22044605e-16) {
    return 16000.0;
  }
  double v3 = 8000.0;
  if (a3 >= 8000.0)
  {
    double v3 = a3;
    if (a3 > 40000.0) {
      return 40000.0;
    }
  }
  return v3;
}

- (void)_setupFromCache
{
  id v6 = [(NMSPodcastSizeEstimation *)self _cachedPodcastSizeInfoDict];
  double v3 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v6];
  sizeInfoDict = self->_sizeInfoDict;
  self->_sizeInfoDict = v3;

  self->_empty = v6 == 0;
  [(NMSPodcastSizeEstimation *)self _totalSizeDurationRatio];
  self->_totalSizeDurationRatio = v5;
  self->_unint64_t totalAverageSize = [(NMSPodcastSizeEstimation *)self _totalAverageSize];
}

- (id)_cachedPodcastSizeInfoDict
{
  int v2 = +[NMSyncDefaults sharedDefaults];
  double v3 = [v2 podcastSizeEstimationData];

  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x263F08928];
    double v5 = (void *)MEMORY[0x263EFFA08];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
    id v13 = 0;
    v9 = [v4 unarchivedObjectOfClasses:v8 fromData:v3 error:&v13];
    id v10 = v13;

    if (v10)
    {
      v11 = NMLogForCategory(5);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        [(NMSPodcastSizeEstimation *)(uint64_t)v10 _cachedPodcastSizeInfoDict];
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (double)_totalSizeDurationRatio
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v8 = 0;
  v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  int v2 = [(NMSPodcastSizeEstimation *)self sizeInfoDict];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__NMSPodcastSizeEstimation__totalSizeDurationRatio__block_invoke;
  v7[3] = &unk_264633958;
  v7[4] = &v12;
  v7[5] = &v8;
  [v2 enumerateKeysAndObjectsUsingBlock:v7];

  double v3 = v9[3];
  if (fabs(v3) <= 2.22044605e-16)
  {
    +[NMSPodcastSizeEstimation _defaultSizeDurationRatio];
    double v4 = v5;
  }
  else
  {
    double v4 = (double)(unint64_t)v13[3] / v3;
  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v4;
}

double __51__NMSPodcastSizeEstimation__totalSizeDurationRatio__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [v4 totalSize];
  [v4 totalDuration];
  double v6 = v5;

  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = v6 + *(double *)(v7 + 24);
  *(double *)(v7 + 24) = result;
  return result;
}

- (unint64_t)_totalAverageSize
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  int v2 = [(NMSPodcastSizeEstimation *)self sizeInfoDict];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__NMSPodcastSizeEstimation__totalAverageSize__block_invoke;
  v6[3] = &unk_264633958;
  v6[4] = &v11;
  v6[5] = &v7;
  [v2 enumerateKeysAndObjectsUsingBlock:v6];

  unint64_t v3 = v12[3];
  unint64_t v4 = v8[3];
  if (v3) {
    v4 /= v3;
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  return v4;
}

void __45__NMSPodcastSizeEstimation__totalAverageSize__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [v4 count];
  uint64_t v5 = [v4 totalSize];

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v5;
}

- (NSMutableDictionary)sizeInfoDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSizeInfoDict:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)sizeForFeedURL:(uint64_t)a1 duration:(uint64_t)a2 feedProvidedSize:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_2228FD000, log, OS_LOG_TYPE_DEBUG, "[PodcastSize] Podcast %@ provided size %llu is larger than threshold.", (uint8_t *)&v3, 0x16u);
}

- (void)_cachedPodcastSizeInfoDict
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2228FD000, a2, OS_LOG_TYPE_ERROR, "[PodcastSize] Failed to uarchive podcasts size info due to: %@", (uint8_t *)&v2, 0xCu);
}

@end