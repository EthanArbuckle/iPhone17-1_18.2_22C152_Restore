@interface PLPrefetchConfiguration
+ (id)descriptionForPrefetchOptimizeMode:(int64_t)a3;
+ (id)overridePrefetchOptimizeMode;
+ (int64_t)_defaultPrefetchOptimizeMode;
+ (int64_t)defaultPrefetchOptimizeMode;
- (PLPrefetchConfiguration)initWithPrefetchDictionary:(id)a3;
- (double)cloudResourceIncrementalMinimumFreeDiskSpaceForOptimizeRatio;
- (double)cloudResourceInitialMinimumFreeDiskSpaceForOptimizeRatio;
- (double)cloudResourceSmallLibraryThresholdRatio;
- (int64_t)memoryPrefetchAllowedIfLastViewedDateWithin;
- (int64_t)memoryPrefetchIfCreationDateWithin;
- (int64_t)optimizedNonThumbnailInitialPrefetchDateIntervalBeforeNow;
- (int64_t)prefetchOptimizeModeForTotalSizeOfOriginalResources:(int64_t)a3 totalSizeOfLocallyAvailableOriginalResources:(int64_t)a4 availableSpace:(int64_t)a5 overrideMaximumSmallLibraryThresholdGB:(int64_t)a6 nonThumbnailsBudget:(int64_t)a7;
- (unint64_t)cloudResourceATVNearLowDiskThreshold;
- (unint64_t)cloudResourceIntervalBetweenCheckCPLBGDownload;
- (unint64_t)cloudResourceMaximumSmallLibraryThreshold;
- (unint64_t)cloudResourcePrefetchMaxFileSize;
- (unint64_t)smallLibrarySizeThresholdForTotalSizeOfLocallyAvailableOriginalResources:(int64_t)a3 availableSpace:(int64_t)a4 overrideMaximumThresholdGB:(int64_t)a5;
- (unsigned)cloudResourceComputeSyncMaxResourcesPerFetch;
- (unsigned)cloudResourceMaxPrefetchRetry;
- (unsigned)cloudResourceMediaMetadataOverflowMaxResourcesPerFetch;
- (unsigned)cloudResourceMemoriesMaxResourcesPerFetch;
- (unsigned)cloudResourceNonThumbnailsMaxResourcesPerFetch;
- (unsigned)cloudResourceThumbnailsMaxResourcesPerFetch;
- (unsigned)cloudResourceWidgetMaxResourcesPerFetch;
- (unsigned)memoryMaxPrefetchPhotosCount;
- (unsigned)memoryMaxPrefetchVideosCount;
- (unsigned)memoryPrefetchLimit;
- (void)setCloudResourceComputeSyncMaxResourcesPerFetch:(unsigned __int16)a3;
- (void)setCloudResourceInitialMinimumFreeDiskSpaceForOptimizeRatio:(double)a3;
- (void)setCloudResourceMaximumSmallLibraryThreshold:(unint64_t)a3;
- (void)setCloudResourcePrefetchMaxFileSize:(unint64_t)a3;
- (void)setMemoryMaxPrefetchPhotosCount:(unsigned __int16)a3;
- (void)setMemoryMaxPrefetchVideosCount:(unsigned __int16)a3;
- (void)setMemoryPrefetchAllowedIfLastViewedDateWithin:(int64_t)a3;
- (void)setMemoryPrefetchIfCreationDateWithin:(int64_t)a3;
- (void)setMemoryPrefetchLimit:(unsigned __int16)a3;
- (void)updateValuesFromPrefetchDictionary:(id)a3;
- (void)updateValuesFromTrialIfNecessary;
@end

@implementation PLPrefetchConfiguration

- (int64_t)optimizedNonThumbnailInitialPrefetchDateIntervalBeforeNow
{
  return self->_optimizedNonThumbnailInitialPrefetchDateIntervalBeforeNow;
}

- (void)setMemoryPrefetchIfCreationDateWithin:(int64_t)a3
{
  self->_memoryPrefetchIfCreationDateWithin = a3;
}

- (int64_t)memoryPrefetchIfCreationDateWithin
{
  return self->_memoryPrefetchIfCreationDateWithin;
}

- (void)setMemoryPrefetchAllowedIfLastViewedDateWithin:(int64_t)a3
{
  self->_memoryPrefetchAllowedIfLastViewedDateWithin = a3;
}

- (int64_t)memoryPrefetchAllowedIfLastViewedDateWithin
{
  return self->_memoryPrefetchAllowedIfLastViewedDateWithin;
}

- (void)setCloudResourceMaximumSmallLibraryThreshold:(unint64_t)a3
{
  self->_cloudResourceMaximumSmallLibraryThreshold = a3;
}

- (unint64_t)cloudResourceMaximumSmallLibraryThreshold
{
  return self->_cloudResourceMaximumSmallLibraryThreshold;
}

- (double)cloudResourceSmallLibraryThresholdRatio
{
  return self->_cloudResourceSmallLibraryThresholdRatio;
}

- (unint64_t)cloudResourceATVNearLowDiskThreshold
{
  return self->_cloudResourceATVNearLowDiskThreshold;
}

- (double)cloudResourceIncrementalMinimumFreeDiskSpaceForOptimizeRatio
{
  return self->_cloudResourceIncrementalMinimumFreeDiskSpaceForOptimizeRatio;
}

- (void)setCloudResourceInitialMinimumFreeDiskSpaceForOptimizeRatio:(double)a3
{
  self->_cloudResourceInitialMinimumFreeDiskSpaceForOptimizeRatio = a3;
}

- (double)cloudResourceInitialMinimumFreeDiskSpaceForOptimizeRatio
{
  return self->_cloudResourceInitialMinimumFreeDiskSpaceForOptimizeRatio;
}

- (unint64_t)cloudResourceIntervalBetweenCheckCPLBGDownload
{
  return self->_cloudResourceIntervalBetweenCheckCPLBGDownload;
}

- (unsigned)cloudResourceMediaMetadataOverflowMaxResourcesPerFetch
{
  return self->_cloudResourceMediaMetadataOverflowMaxResourcesPerFetch;
}

- (unsigned)cloudResourceNonThumbnailsMaxResourcesPerFetch
{
  return self->_cloudResourceNonThumbnailsMaxResourcesPerFetch;
}

- (void)setCloudResourceComputeSyncMaxResourcesPerFetch:(unsigned __int16)a3
{
  self->_cloudResourceComputeSyncMaxResourcesPerFetch = a3;
}

- (unsigned)cloudResourceComputeSyncMaxResourcesPerFetch
{
  return self->_cloudResourceComputeSyncMaxResourcesPerFetch;
}

- (unsigned)cloudResourceWidgetMaxResourcesPerFetch
{
  return self->_cloudResourceWidgetMaxResourcesPerFetch;
}

- (unsigned)cloudResourceMemoriesMaxResourcesPerFetch
{
  return self->_cloudResourceMemoriesMaxResourcesPerFetch;
}

- (unsigned)cloudResourceThumbnailsMaxResourcesPerFetch
{
  return self->_cloudResourceThumbnailsMaxResourcesPerFetch;
}

- (void)setMemoryPrefetchLimit:(unsigned __int16)a3
{
  self->_memoryPrefetchLimit = a3;
}

- (unsigned)memoryPrefetchLimit
{
  return self->_memoryPrefetchLimit;
}

- (unsigned)cloudResourceMaxPrefetchRetry
{
  return self->_cloudResourceMaxPrefetchRetry;
}

- (void)setCloudResourcePrefetchMaxFileSize:(unint64_t)a3
{
  self->_cloudResourcePrefetchMaxFileSize = a3;
}

- (unint64_t)cloudResourcePrefetchMaxFileSize
{
  return self->_cloudResourcePrefetchMaxFileSize;
}

- (void)setMemoryMaxPrefetchVideosCount:(unsigned __int16)a3
{
  self->_memoryMaxPrefetchVideosCount = a3;
}

- (unsigned)memoryMaxPrefetchVideosCount
{
  return self->_memoryMaxPrefetchVideosCount;
}

- (void)setMemoryMaxPrefetchPhotosCount:(unsigned __int16)a3
{
  self->_memoryMaxPrefetchPhotosCount = a3;
}

- (unsigned)memoryMaxPrefetchPhotosCount
{
  return self->_memoryMaxPrefetchPhotosCount;
}

- (int64_t)prefetchOptimizeModeForTotalSizeOfOriginalResources:(int64_t)a3 totalSizeOfLocallyAvailableOriginalResources:(int64_t)a4 availableSpace:(int64_t)a5 overrideMaximumSmallLibraryThresholdGB:(int64_t)a6 nonThumbnailsBudget:(int64_t)a7
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v10 = [(PLPrefetchConfiguration *)self smallLibrarySizeThresholdForTotalSizeOfLocallyAvailableOriginalResources:a4 availableSpace:a5 overrideMaximumThresholdGB:a6];
  if ((a4 | a3) < 0 || (unint64_t v11 = v10, v10 < a3) || a3 - a4 > a7)
  {
    v15 = objc_opt_class();
    return [v15 _defaultPrefetchOptimizeMode];
  }
  else
  {
    v12 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = +[PLPrefetchConfiguration descriptionForPrefetchOptimizeMode:2];
      int v16 = 134218498;
      int64_t v17 = a3;
      __int16 v18 = 2048;
      unint64_t v19 = v11;
      __int16 v20 = 2112;
      v21 = v13;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Library size %lld smaller than small-size threshold %lld, setting prefetch optimize mode to %@", (uint8_t *)&v16, 0x20u);
    }
    return 2;
  }
}

- (unint64_t)smallLibrarySizeThresholdForTotalSizeOfLocallyAvailableOriginalResources:(int64_t)a3 availableSpace:(int64_t)a4 overrideMaximumThresholdGB:(int64_t)a5
{
  if (a5 < 1) {
    int64_t cloudResourceMaximumSmallLibraryThreshold = self->_cloudResourceMaximumSmallLibraryThreshold;
  }
  else {
    int64_t cloudResourceMaximumSmallLibraryThreshold = a5 << 30;
  }
  double v6 = self->_cloudResourceSmallLibraryThresholdRatio * (double)(a4 + a3);
  if (v6 >= (double)cloudResourceMaximumSmallLibraryThreshold) {
    return (unint64_t)(double)cloudResourceMaximumSmallLibraryThreshold;
  }
  return (unint64_t)v6;
}

- (void)updateValuesFromPrefetchDictionary:(id)a3
{
  id v25 = [a3 objectForKeyedSubscript:@"iOS"];
  if (v25)
  {
    v4 = [v25 objectForKeyedSubscript:@"memoryMaxPrefetchPhotosCount"];

    if (v4)
    {
      v5 = [v25 objectForKeyedSubscript:@"memoryMaxPrefetchPhotosCount"];
      self->_memoryMaxPrefetchPhotosCount = [v5 integerValue];
    }
    double v6 = [v25 objectForKeyedSubscript:@"memoryMaxPrefetchVideosCount"];

    if (v6)
    {
      v7 = [v25 objectForKeyedSubscript:@"memoryMaxPrefetchVideosCount"];
      self->_memoryMaxPrefetchVideosCount = [v7 integerValue];
    }
    v8 = [v25 objectForKeyedSubscript:@"memoryPrefetchLimit"];

    if (v8)
    {
      v9 = [v25 objectForKeyedSubscript:@"memoryPrefetchLimit"];
      self->_memoryPrefetchLimit = [v9 integerValue];
    }
    unint64_t v10 = [v25 objectForKeyedSubscript:@"maxFileSize"];

    if (v10)
    {
      unint64_t v11 = [v25 objectForKeyedSubscript:@"maxFileSize"];
      self->_cloudResourcePrefetchMaxFileSize = [v11 integerValue];
    }
    v12 = [v25 objectForKeyedSubscript:@"initialMinimumFreeDiskSpaceForOptimizeRatio"];

    if (v12)
    {
      v13 = [v25 objectForKeyedSubscript:@"initialMinimumFreeDiskSpaceForOptimizeRatio"];
      [v13 doubleValue];
      self->_cloudResourceInitialMinimumFreeDiskSpaceForOptimizeRatio = v14;
    }
    v15 = [v25 objectForKeyedSubscript:@"maximumSmallLibraryThreshold"];

    if (v15)
    {
      int v16 = [v25 objectForKeyedSubscript:@"maximumSmallLibraryThreshold"];
      self->_int64_t cloudResourceMaximumSmallLibraryThreshold = [v16 integerValue];
    }
    int64_t v17 = [v25 objectForKeyedSubscript:@"memoryPrefetchAllowedIfLastViewedDateWithin"];

    if (v17)
    {
      __int16 v18 = [v25 objectForKeyedSubscript:@"memoryPrefetchAllowedIfLastViewedDateWithin"];
      self->_memoryPrefetchAllowedIfLastViewedDateWithin = [v18 integerValue];
    }
    unint64_t v19 = [v25 objectForKeyedSubscript:@"memoryPrefetchIfCreationDateWithin"];

    if (v19)
    {
      __int16 v20 = [v25 objectForKeyedSubscript:@"memoryPrefetchIfCreationDateWithin"];
      self->_memoryPrefetchIfCreationDateWithin = [v20 integerValue];
    }
    v21 = [v25 objectForKeyedSubscript:@"computeSyncMaxPrefetch"];

    if (v21)
    {
      uint64_t v22 = [v25 objectForKeyedSubscript:@"computeSyncMaxPrefetch"];
      self->_cloudResourceComputeSyncMaxResourcesPerFetch = [v22 integerValue];
    }
    v23 = [v25 objectForKeyedSubscript:@"optimizedNonThumbnailInitialPrefetchDateIntervalBeforeNow"];

    if (v23)
    {
      v24 = [v25 objectForKeyedSubscript:@"optimizedNonThumbnailInitialPrefetchDateIntervalBeforeNow"];
      self->_optimizedNonThumbnailInitialPrefetchDateIntervalBeforeNow = [v24 integerValue];
    }
  }
}

- (PLPrefetchConfiguration)initWithPrefetchDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PLPrefetchConfiguration;
  v5 = [(PLPrefetchConfiguration *)&v8 init];
  double v6 = (PLPrefetchConfiguration *)v5;
  if (v5)
  {
    *(_OWORD *)(v5 + 8) = xmmword_19BA99FF0;
    *((_DWORD *)v5 + 6) = 655560;
    *((_OWORD *)v5 + 2) = xmmword_19BA9A000;
    *((_OWORD *)v5 + 3) = xmmword_19BA9A010;
    *((void *)v5 + 9) = 0x3FB999999999999ALL;
    *((_OWORD *)v5 + 5) = xmmword_19BA9A020;
    *((_OWORD *)v5 + 6) = xmmword_19BA9A030;
    if (v4) {
      [v5 updateValuesFromPrefetchDictionary:v4];
    }
    [(PLPrefetchConfiguration *)v6 updateValuesFromTrialIfNecessary];
  }

  return v6;
}

+ (id)overridePrefetchOptimizeMode
{
  if (MEMORY[0x19F38BDA0](a1, a2))
  {
    v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v3 = [v2 objectForKey:@"PLPrefetchOptimizeMode"];
    id v4 = [v3 lowercaseString];

    if (v4)
    {
      if ([v4 isEqualToString:@"medium"])
      {
        v5 = &unk_1EEBEE1F0;
LABEL_9:
        double v6 = (void *)overridePrefetchOptimizeMode_overridePrefetchOptimizeMode;
        overridePrefetchOptimizeMode_overridePrefetchOptimizeMode = (uint64_t)v5;

        goto LABEL_10;
      }
      if ([v4 isEqualToString:@"fullsize"])
      {
        v5 = &unk_1EEBEE208;
        goto LABEL_9;
      }
      if ([v4 isEqualToString:@"original"])
      {
        v5 = &unk_1EEBEE220;
        goto LABEL_9;
      }
    }
LABEL_10:
  }
  v7 = (void *)overridePrefetchOptimizeMode_overridePrefetchOptimizeMode;
  return v7;
}

+ (id)descriptionForPrefetchOptimizeMode:(int64_t)a3
{
  v3 = @"medium";
  if (a3 == 1) {
    v3 = @"fullsize";
  }
  if (a3 == 2) {
    return @"original";
  }
  else {
    return v3;
  }
}

+ (int64_t)_defaultPrefetchOptimizeMode
{
  v2 = [MEMORY[0x1E4F8B8D0] defaultDeviceConfiguration];
  int64_t v3 = (unint64_t)[v2 logicalScreenPixelSize] > 0x3A147A;

  return v3;
}

+ (int64_t)defaultPrefetchOptimizeMode
{
  int64_t v2 = [(id)objc_opt_class() _defaultPrefetchOptimizeMode];
  int64_t v3 = [(id)objc_opt_class() overridePrefetchOptimizeMode];
  id v4 = v3;
  if (v3) {
    int64_t v2 = [v3 integerValue];
  }

  return v2;
}

- (void)updateValuesFromTrialIfNecessary
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [MEMORY[0x1E4FB0098] clientWithIdentifier:235];
  id v4 = [v3 levelForFactor:@"com.apple.photos.photolibraryservices.prefetch.trialOverride" withNamespaceName:@"PHOTOS_GENERAL"];
  int v5 = [v4 BOOLeanValue];

  if (v5)
  {
    double v6 = [v3 levelForFactor:@"com.apple.photos.photolibraryservices.prefetch.memoryMaxPrefetchPhotosCount" withNamespaceName:@"PHOTOS_GENERAL"];
    v7 = v6;
    if (v6) {
      -[PLPrefetchConfiguration setMemoryMaxPrefetchPhotosCount:](self, "setMemoryMaxPrefetchPhotosCount:", (unsigned __int16)[v6 longValue]);
    }
    objc_super v8 = [v3 levelForFactor:@"com.apple.photos.photolibraryservices.prefetch.memoryMaxPrefetchVideosCount" withNamespaceName:@"PHOTOS_GENERAL"];

    if (v8) {
      -[PLPrefetchConfiguration setMemoryMaxPrefetchVideosCount:](self, "setMemoryMaxPrefetchVideosCount:", (unsigned __int16)[v8 longValue]);
    }
    v9 = [v3 levelForFactor:@"com.apple.photos.photolibraryservices.prefetch.memoryPrefetchLimit" withNamespaceName:@"PHOTOS_GENERAL"];

    if (v9) {
      -[PLPrefetchConfiguration setMemoryPrefetchLimit:](self, "setMemoryPrefetchLimit:", (unsigned __int16)[v9 longValue]);
    }
    unint64_t v10 = [v3 levelForFactor:@"com.apple.photos.photolibraryservices.prefetch.maxFileSize" withNamespaceName:@"PHOTOS_GENERAL"];

    if (v10) {
      -[PLPrefetchConfiguration setCloudResourcePrefetchMaxFileSize:](self, "setCloudResourcePrefetchMaxFileSize:", [v10 longValue]);
    }
    unint64_t v11 = [v3 levelForFactor:@"com.apple.photos.photolibraryservices.prefetch.initialMinimumFreeDiskSpaceForOptimizeRatio" withNamespaceName:@"PHOTOS_GENERAL"];

    if (v11)
    {
      [v11 doubleValue];
      -[PLPrefetchConfiguration setCloudResourceInitialMinimumFreeDiskSpaceForOptimizeRatio:](self, "setCloudResourceInitialMinimumFreeDiskSpaceForOptimizeRatio:");
    }
    v12 = [v3 levelForFactor:@"com.apple.photos.photolibraryservices.prefetch.maximumSmallLibraryThreshold" withNamespaceName:@"PHOTOS_GENERAL"];

    if (v12) {
      -[PLPrefetchConfiguration setCloudResourceMaximumSmallLibraryThreshold:](self, "setCloudResourceMaximumSmallLibraryThreshold:", [v12 longValue]);
    }
    v13 = [v3 levelForFactor:@"com.apple.photos.photolibraryservices.prefetch.memoryPrefetchAllowedIfLastViewedDateWithin" withNamespaceName:@"PHOTOS_GENERAL"];

    if (v13) {
      -[PLPrefetchConfiguration setMemoryPrefetchAllowedIfLastViewedDateWithin:](self, "setMemoryPrefetchAllowedIfLastViewedDateWithin:", [v13 longValue]);
    }
    double v14 = [v3 levelForFactor:@"com.apple.photos.photolibraryservices.prefetch.memoryPrefetchIfCreationDateWithin" withNamespaceName:@"PHOTOS_GENERAL"];

    if (v14) {
      -[PLPrefetchConfiguration setMemoryPrefetchIfCreationDateWithin:](self, "setMemoryPrefetchIfCreationDateWithin:", [v14 longValue]);
    }
    v15 = [v3 levelForFactor:@"com.apple.photos.photolibraryservices.prefetch.computeSyncMaxPrefetch" withNamespaceName:@"PHOTOS_GENERAL"];

    if (v15) {
      -[PLPrefetchConfiguration setCloudResourceComputeSyncMaxResourcesPerFetch:](self, "setCloudResourceComputeSyncMaxResourcesPerFetch:", (unsigned __int16)[v15 longValue]);
    }
    int v16 = PLResourceCachingGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v21 = [(PLPrefetchConfiguration *)self memoryMaxPrefetchPhotosCount];
      int v17 = [(PLPrefetchConfiguration *)self memoryMaxPrefetchVideosCount];
      int v18 = [(PLPrefetchConfiguration *)self memoryPrefetchLimit];
      unint64_t v19 = [(PLPrefetchConfiguration *)self cloudResourcePrefetchMaxFileSize];
      [(PLPrefetchConfiguration *)self cloudResourceInitialMinimumFreeDiskSpaceForOptimizeRatio];
      *(_DWORD *)buf = 67111168;
      int v23 = v21;
      __int16 v24 = 1024;
      int v25 = v17;
      __int16 v26 = 1024;
      int v27 = v18;
      __int16 v28 = 2048;
      unint64_t v29 = v19;
      __int16 v30 = 2048;
      uint64_t v31 = v20;
      __int16 v32 = 2048;
      unint64_t v33 = [(PLPrefetchConfiguration *)self cloudResourceMaximumSmallLibraryThreshold];
      __int16 v34 = 2048;
      int64_t v35 = [(PLPrefetchConfiguration *)self memoryPrefetchAllowedIfLastViewedDateWithin];
      __int16 v36 = 2048;
      int64_t v37 = [(PLPrefetchConfiguration *)self memoryPrefetchIfCreationDateWithin];
      __int16 v38 = 1024;
      int v39 = [(PLPrefetchConfiguration *)self cloudResourceComputeSyncMaxResourcesPerFetch];
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEBUG, "Trial Override is TRUE. Using values from Trial Experiment\n\t memoryMaxPrefetchPhotosCount:%hu\n\tmemoryMaxPrefetchVideosCount:%hu\n\tmemoryPrefetchLimit:%hu\n\tcloudResourcePrefetchMaxFileSize:%llu\n\t\n\tcloudResourceInitialMinimumFreeDiskSpaceForOptimizeRatio:%f\n\tcloudResourceMaximumSmallLibraryThreshold:%llu\n\tmemoryPrefetchAllowedIfLastViewedDateWithin:%lld\n\tmemoryPrefetchIfCreationDateWithin:%lld\n\tcloudResourceComputeSyncMaxResourcesPerFetch:%hu\n", buf, 0x4Cu);
    }
  }
}

@end