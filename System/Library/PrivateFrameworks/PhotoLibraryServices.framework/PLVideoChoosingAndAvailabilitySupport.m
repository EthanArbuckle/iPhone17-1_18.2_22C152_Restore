@interface PLVideoChoosingAndAvailabilitySupport
- (BOOL)_checkIsReallyLocallyAvailableAndAddToRepairListIfNeeded:(id)a3;
- (CGSize)size;
- (NSArray)resourcesNeedingRepair;
- (PLVideoChoosingAndAvailabilitySupport)initWithContext:(id)a3 assetInformation:(id)a4 options:(id)a5 size:(CGSize)a6;
- (PLVideoChoosingAssetInformation)assetInformation;
- (PLVideoChoosingOptions)options;
- (PLVideoResourceContext)context;
- (id)_acceptableResourceVersions;
- (id)_ensureOriginalsAreHighestQuality:(id)a3;
- (id)chooseResourceWithLoadingMode:(int64_t *)a3 needsAdjustmentData:(BOOL *)a4 error:(id *)a5;
- (int64_t)_optimalLoadingModeForResource:(id)a3;
- (unsigned)_videoQualityLevelForRequestFallbackToMediumPolicy:(int64_t *)a3;
@end

@implementation PLVideoChoosingAndAvailabilitySupport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_assetInformation, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_resourcesNeedingRepair, 0);
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PLVideoChoosingOptions)options
{
  return self->_options;
}

- (PLVideoChoosingAssetInformation)assetInformation
{
  return self->_assetInformation;
}

- (PLVideoResourceContext)context
{
  return self->_context;
}

- (id)chooseResourceWithLoadingMode:(int64_t *)a3 needsAdjustmentData:(BOOL *)a4 error:(id *)a5
{
  v89[1] = *MEMORY[0x1E4F143B8];
  v6 = [(PLVideoChoosingAndAvailabilitySupport *)self _acceptableResourceVersions];
  v7 = [(PLVideoResourceContext *)self->_context videoResourcesMatchingVersions:v6];
  if ([v7 count])
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F8C500];
    uint64_t v88 = *MEMORY[0x1E4F28228];
    v11 = [NSString stringWithFormat:@"zero videos found matching resource versions: %@", v6];
    v89[0] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:&v88 count:1];
    uint64_t v13 = [v9 errorWithDomain:v10 code:47017 userInfo:v12];

    v8 = (void *)v13;
  }
  if ([v7 count]
    && [(PLVideoChoosingOptions *)self->_options restrictToPlayableOnCurrentDevice])
  {
    v14 = [[PLVideoPlaybackResourceChoiceOptimizer alloc] initWithVideoResources:v7];
    v15 = [(PLVideoPlaybackResourceChoiceOptimizer *)v14 preferredVideoResources];

    if (![v15 count])
    {
      v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F8C500];
      v86[0] = *MEMORY[0x1E4F28228];
      [NSString stringWithFormat:@"zero playable videos found"];
      v19 = v18 = v8;
      v86[1] = @"PLZeroPlayableVideosErrorKey";
      v87[0] = v19;
      v87[1] = MEMORY[0x1E4F1CC38];
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:v86 count:2];
      uint64_t v21 = [v16 errorWithDomain:v17 code:47017 userInfo:v20];

      v8 = (void *)v21;
    }

    v7 = v15;
  }
  if ([v7 count]
    && [(PLVideoChoosingOptions *)self->_options restrictToStreamable])
  {
    v22 = [[PLVideoStreamingResourceChoiceOptimizer alloc] initWithVideoResources:v7];
    v23 = [(PLVideoStreamingResourceChoiceOptimizer *)v22 preferredVideoResources];

    if (![v23 count])
    {
      v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = *MEMORY[0x1E4F8C500];
      v84[0] = *MEMORY[0x1E4F28228];
      [NSString stringWithFormat:@"zero streamable videos found"];
      v27 = v26 = v8;
      v84[1] = @"PLZeroStreamableVideosErrorKey";
      v85[0] = v27;
      v85[1] = MEMORY[0x1E4F1CC38];
      v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:2];
      uint64_t v29 = [v24 errorWithDomain:v25 code:47017 userInfo:v28];

      v8 = (void *)v29;
    }

    v7 = v23;
  }
  if ([v7 count])
  {
    uint64_t v71 = 0;
    unsigned int v30 = [(PLVideoChoosingAndAvailabilitySupport *)self _videoQualityLevelForRequestFallbackToMediumPolicy:&v71];
    v31 = [(PLVideoChoosingAndAvailabilitySupport *)self _ensureOriginalsAreHighestQuality:v7];

    v70 = [v31 lastObject];
    unsigned int v65 = v30;
    if (v30 <= 1
      && ([(PLVideoChoosingOptions *)self->_options isStreamingAllowed] & 1) == 0
      && [(PLVideoChoosingOptions *)self->_options hasValidTimeRange]
      && _resourceIsOriginalSlomo(v70, self->_assetInformation))
    {
      uint64_t v71 = 1;
    }
    v32 = [v31 reverseObjectEnumerator];
    uint64_t v33 = [v32 nextObject];
    if (v33)
    {
      uint64_t v34 = v33;
      v35 = 0;
      int64_t v36 = 0;
      v66 = v6;
      while (1)
      {
        v37 = (void *)v34;
        while ([v37 storeClassID] == 3
             && (([v37 isOriginalVideo] & 1) != 0
              || [v37 isOriginalVideoComplement])
             && ([(PLVideoChoosingOptions *)self->_options isExplicitUserAction] & 1) == 0)
        {
          v38 = PLImageManagerGetLog();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_DEFAULT, "Skipping syndication original video, because the request intent is not a user click", buf, 2u);
          }

          uint64_t v39 = [v32 nextObject];

          v37 = (void *)v39;
          if (!v39) {
            goto LABEL_58;
          }
        }
        if (v71 && [v37 matchesOrExceedsQualityLevel:2])
        {
          int v40 = v71 == 1 ? [v35 isLargeQuality] : 0;
          int v41 = 1;
        }
        else
        {
          int v41 = 0;
          int v40 = 0;
        }
        if (v37 != v70 && (v41 | [v37 matchesOrExceedsQualityLevel:v65]) != 1) {
          break;
        }
        uint64_t v42 = [(PLVideoChoosingAndAvailabilitySupport *)self _optimalLoadingModeForResource:v37];
        BOOL v43 = v42 > v36;
        if (!v40) {
          BOOL v43 = v42 >= v36;
        }
        if (v43)
        {
          int64_t v44 = v42;
          if (v42 < 1)
          {
            int64_t v36 = v42;
          }
          else
          {
            id v45 = v37;

            int64_t v36 = v44;
            v35 = v45;
          }
        }
        v6 = v66;
        if (([v37 isLocallyAvailable] & 1) == 0
          && ([v37 isStreamable] & 1) == 0
          && ([v37 isDownloadable] & 1) == 0
          && ([v37 isLocallyGeneratable] & 1) == 0)
        {
          v46 = PLImageManagerGetLog();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            v62 = [(PLVideoChoosingAssetInformation *)self->_assetInformation uuid];
            int v63 = [v37 isLocallyAvailable];
            log = v46;
            int v47 = [v37 isStreamable];
            int v61 = [v37 isDownloadable];
            int v48 = [v37 isLocallyGeneratable];
            *(_DWORD *)buf = 138544386;
            v75 = v62;
            __int16 v76 = 1024;
            int v77 = v63;
            __int16 v78 = 1024;
            int v79 = v47;
            v46 = log;
            __int16 v80 = 1024;
            int v81 = v61;
            v6 = v66;
            __int16 v82 = 1024;
            int v83 = v48;
            _os_log_impl(&dword_19B3C7000, log, OS_LOG_TYPE_ERROR, "Asset %{public}@ video resource is inaccessible (available=%d, streamable=%d, downloadable=%d, generatable=%d", buf, 0x24u);
          }
          [(NSMutableArray *)self->_resourcesNeedingRepair addObject:v37];
        }
        uint64_t v34 = [v32 nextObject];

        if (!v34)
        {
          v37 = 0;
          goto LABEL_58;
        }
      }
      v6 = v66;
LABEL_58:
      if (v35) {
        goto LABEL_64;
      }
    }
    else
    {
      v37 = 0;
      int64_t v36 = 0;
    }
    if (![(PLVideoChoosingOptions *)self->_options videoVersion]
      && [(PLVideoChoosingAssetInformation *)self->_assetInformation hasAdjustments]
      && [(PLVideoChoosingAssetInformation *)self->_assetInformation isPhotoIris])
    {
      v35 = [(PLVideoResourceContext *)self->_context onDemandInstallAdjustedFullSizeVideoComplementResourceIfPresent];
    }
    else
    {
      v35 = 0;
    }
LABEL_64:

    goto LABEL_65;
  }
  int64_t v36 = 0;
  v35 = 0;
  v31 = v7;
LABEL_65:
  if (![v31 count]
    && ![(PLVideoChoosingOptions *)self->_options videoVersion]
    && [(PLVideoChoosingAssetInformation *)self->_assetInformation hasAdjustments]
    && ([(PLVideoChoosingAssetInformation *)self->_assetInformation shouldUseNonAdjustedVersion] & 1) == 0&& [(PLVideoChoosingAssetInformation *)self->_assetInformation isOriginalSlomo])
  {
    v49 = [(PLVideoResourceContext *)self->_context videoResourcesMatchingVersions:&unk_1EEBF2480];
    uint64_t v50 = [v49 indexOfObjectPassingTest:&__block_literal_global_105_109694];
    if (v50 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v51 = v50;
      v52 = PLImageManagerGetLog();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        v53 = [(PLVideoChoosingAssetInformation *)self->_assetInformation uuid];
        *(_DWORD *)buf = 138543362;
        v75 = v53;
        _os_log_impl(&dword_19B3C7000, v52, OS_LOG_TYPE_ERROR, "Slomo asset (%{public}@) with non-standard adjustment format is missing renders, optimistically returning original video and adjustment data", buf, 0xCu);
      }
      uint64_t v54 = [v49 objectAtIndexedSubscript:v51];

      int64_t v36 = [(PLVideoChoosingAndAvailabilitySupport *)self _optimalLoadingModeForResource:v54];
      v35 = (void *)v54;
    }
  }
  if (v35)
  {
    if (_resourceIsOriginalSlomo(v35, self->_assetInformation))
    {
      BOOL v55 = [(PLVideoChoosingOptions *)self->_options videoVersion] == 0;
      goto LABEL_81;
    }
  }
  else if (!v8)
  {
    v56 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v57 = *MEMORY[0x1E4F8C500];
    v72[0] = *MEMORY[0x1E4F28228];
    v72[1] = @"PLZeroPlayableVideosErrorKey";
    v73[0] = @"chooser found zero valid videos";
    v73[1] = MEMORY[0x1E4F1CC38];
    v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:2];
    v8 = [v56 errorWithDomain:v57 code:47017 userInfo:v58];
  }
  BOOL v55 = 0;
LABEL_81:
  if (a3) {
    *a3 = v36;
  }
  if (a4) {
    *a4 = v55;
  }
  if (a5) {
    *a5 = v8;
  }
  id v59 = v35;

  return v59;
}

uint64_t __97__PLVideoChoosingAndAvailabilitySupport_chooseResourceWithLoadingMode_needsAdjustmentData_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isOriginalVideo];
}

- (int64_t)_optimalLoadingModeForResource:(id)a3
{
  id v4 = a3;
  if ([v4 isLocallyAvailable]
    && [(PLVideoChoosingAndAvailabilitySupport *)self _checkIsReallyLocallyAvailableAndAddToRepairListIfNeeded:v4]&& ![(PLVideoChoosingOptions *)self->_options restrictToStreamable])
  {
    int64_t v5 = 5;
  }
  else if ([v4 isLocallyGeneratable] {
         && ![(PLVideoChoosingOptions *)self->_options restrictToStreamable])
  }
  {
    int64_t v5 = 4;
  }
  else if ([(PLVideoChoosingOptions *)self->_options isStreamingAllowed] {
         && [v4 isStreamable]
  }
         && !_resourceIsOriginalSlomo(v4, self->_assetInformation))
  {
    int64_t v5 = 3;
  }
  else if ([v4 isDownloadable] {
         && ([(PLVideoChoosingOptions *)self->_options isNetworkAccessAllowed] & 1) != 0)
  }
  {
    int64_t v5 = 2;
  }
  else if ([v4 isDownloadable])
  {
    int64_t v5 = [(PLVideoChoosingOptions *)self->_options isNetworkAccessAllowed] ^ 1;
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (BOOL)_checkIsReallyLocallyAvailableAndAddToRepairListIfNeeded:(id)a3
{
  id v4 = a3;
  char v5 = [(PLVideoResourceContext *)self->_context validateResource:v4];
  if ((v5 & 1) == 0)
  {
    v6 = PLImageManagerGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Video resource local availability is incorrect", v8, 2u);
    }

    [(NSMutableArray *)self->_resourcesNeedingRepair addObject:v4];
  }

  return v5;
}

- (id)_ensureOriginalsAreHighestQuality:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isOriginalVideoComplement", (void)v14) & 1) != 0
          || [v11 isOriginalVideo])
        {
          id v12 = v11;

          v8 = v12;
        }
        else
        {
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);

    if (v8) {
      [v4 addObject:v8];
    }
  }
  else
  {

    v8 = 0;
  }

  return v4;
}

- (unsigned)_videoQualityLevelForRequestFallbackToMediumPolicy:(int64_t *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (_videoQualityLevelForRequestFallbackToMediumPolicy__onceToken != -1) {
    dispatch_once(&_videoQualityLevelForRequestFallbackToMediumPolicy__onceToken, &__block_literal_global_109711);
  }
  if (_videoQualityLevelForRequestFallbackToMediumPolicy__forceVideoQualityLevelNum)
  {
    unsigned int v5 = [(id)_videoQualityLevelForRequestFallbackToMediumPolicy__forceVideoQualityLevelNum unsignedIntValue];
    uint64_t v6 = PLImageManagerGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (v5 > 3) {
        uint64_t v7 = @"large";
      }
      else {
        uint64_t v7 = off_1E58641C0[v5];
      }
      long long v14 = v7;
      int v16 = 138412290;
      long long v17 = v14;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Forcing video quality level to %@", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    if ([(PLVideoChoosingOptions *)self->_options videoDeliveryMode] != 3
      || ((double width = self->_size.width, v9 = self->_size.height, width == *MEMORY[0x1E4F1DB30])
        ? (BOOL v10 = v9 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
        : (BOOL v10 = 0),
          v10))
    {
      int64_t v13 = [(PLVideoChoosingOptions *)self->_options videoDeliveryMode];
      unsigned int v5 = 0;
      switch(v13)
      {
        case 0:
          break;
        case 2:
          int64_t v13 = 0;
          unsigned int v5 = 3;
          break;
        case 3:
          if ((unint64_t)(+[PLPrefetchConfiguration defaultPrefetchOptimizeMode]- 1) >= 2)goto LABEL_24; {
          goto LABEL_23;
          }
        case 4:
LABEL_23:
          int64_t v13 = 0;
          unsigned int v5 = 1;
          break;
        default:
          goto LABEL_24;
      }
    }
    else
    {
      if (width >= v9) {
        double height = self->_size.height;
      }
      else {
        double height = self->_size.width;
      }
      [(PLVideoResourceContext *)self->_context sizeThresholdForHighQuality];
      if (height <= v12)
      {
LABEL_24:
        int64_t v13 = [(PLVideoChoosingOptions *)self->_options isMediumHighQualityAllowed];
        if (v13) {
          unsigned int v5 = 1;
        }
        else {
          unsigned int v5 = 2;
        }
      }
      else
      {
        int64_t v13 = 0;
        unsigned int v5 = 0;
      }
    }
    if (a3) {
      *a3 = v13;
    }
  }
  return v5;
}

void __92__PLVideoChoosingAndAvailabilitySupport__videoQualityLevelForRequestFallbackToMediumPolicy___block_invoke()
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v0 = [v2 objectForKey:@"PLForceVideoQualityLevel"];
  v1 = (void *)_videoQualityLevelForRequestFallbackToMediumPolicy__forceVideoQualityLevelNum;
  _videoQualityLevelForRequestFallbackToMediumPolicy__forceVideoQualityLevelNum = v0;
}

- (id)_acceptableResourceVersions
{
  int v3 = [(PLVideoChoosingAssetInformation *)self->_assetInformation hasAdjustments];
  uint64_t v4 = [(PLVideoChoosingOptions *)self->_options videoVersion];
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    if ([(PLVideoChoosingAssetInformation *)self->_assetInformation shouldUseNonAdjustedVersion])
    {
      id v8 = &unk_1EEBF23F0;
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  if (!v4)
  {
LABEL_10:
    uint64_t v6 = &unk_1EEBF2450;
    uint64_t v7 = &unk_1EEBF2438;
    goto LABEL_11;
  }
  if (v4 != 1)
  {
    id v8 = &unk_1EEBF2468;
    goto LABEL_15;
  }
  uint64_t v6 = &unk_1EEBF2420;
  uint64_t v7 = &unk_1EEBF2408;
LABEL_11:
  if (v3) {
    uint64_t v6 = v7;
  }
  id v8 = v6;
LABEL_15:
  return v8;
}

- (NSArray)resourcesNeedingRepair
{
  id v2 = (void *)[(NSMutableArray *)self->_resourcesNeedingRepair copy];
  return (NSArray *)v2;
}

- (PLVideoChoosingAndAvailabilitySupport)initWithContext:(id)a3 assetInformation:(id)a4 options:(id)a5 size:(CGSize)a6
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PLVideoChoosingAndAvailabilitySupport;
  long long v15 = [(PLVideoChoosingAndAvailabilitySupport *)&v20 init];
  int v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_context, a3);
    objc_storeStrong((id *)&v16->_assetInformation, a4);
    objc_storeStrong((id *)&v16->_options, a5);
    v16->_size.CGFloat width = width;
    v16->_size.CGFloat height = height;
    long long v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    resourcesNeedingRepair = v16->_resourcesNeedingRepair;
    v16->_resourcesNeedingRepair = v17;
  }
  return v16;
}

@end