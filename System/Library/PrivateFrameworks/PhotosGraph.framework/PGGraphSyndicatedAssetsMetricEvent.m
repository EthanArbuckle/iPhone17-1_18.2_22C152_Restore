@interface PGGraphSyndicatedAssetsMetricEvent
- (BOOL)shouldReportMetrics;
- (PGGraphSyndicatedAssetsMetricEvent)initWithWorkingContext:(id)a3;
- (PGManagerWorkingContext)workingContext;
- (id)identifier;
- (id)payload;
- (void)gatherMetricsWithProgressBlock:(id)a3;
- (void)setWorkingContext:(id)a3;
@end

@implementation PGGraphSyndicatedAssetsMetricEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_workingContext, 0);
}

- (id)payload
{
  return self->_payload;
}

- (void)setWorkingContext:(id)a3
{
}

- (PGManagerWorkingContext)workingContext
{
  return self->_workingContext;
}

- (void)gatherMetricsWithProgressBlock:(id)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void (**)(void *, unsigned char *, double))_Block_copy(v4);
  double v6 = 0.0;
  if (!v5 || (double v7 = CFAbsoluteTimeGetCurrent(), v7 < 0.01))
  {
LABEL_7:
    v8 = [(PGManagerWorkingContext *)self->_workingContext loggingConnection];
    v9 = [(PGManagerWorkingContext *)self->_workingContext photoLibrary];
    if (([v9 isSystemPhotoLibrary] & 1) == 0)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1805000, v8, OS_LOG_TYPE_INFO, "PGGraphSyndicatedAssetsMetricEvent: Only reporting for system photo library.", buf, 2u);
      }
      if (v5)
      {
        if (CFAbsoluteTimeGetCurrent() - v6 >= 0.01)
        {
          char v80 = 0;
          v5[2](v5, &v80, 1.0);
          if (v80)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v85 = 55;
              *(_WORD *)&v85[4] = 2080;
              *(void *)&v85[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Metrics/MetricEvents/PGGraphSyndicatedAssetsMetricEvent.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }
      goto LABEL_78;
    }
    id v79 = 0;
    v10 = [MEMORY[0x1E4F39228] openPhotoLibraryWithWellKnownIdentifier:3 error:&v79];
    id v11 = v79;
    v12 = v11;
    if (!v10 || v11)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v85 = v12;
        _os_log_error_impl(&dword_1D1805000, v8, OS_LOG_TYPE_ERROR, "PGGraphSyndicatedAssetsMetricEvent: Failed to open syndicated library: %@", buf, 0xCu);
        if (!v5) {
          goto LABEL_77;
        }
      }
      else if (!v5)
      {
LABEL_77:

LABEL_78:
        goto LABEL_79;
      }
      if (CFAbsoluteTimeGetCurrent() - v6 >= 0.01)
      {
        char v80 = 0;
        v5[2](v5, &v80, 1.0);
        if (v80)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v85 = 63;
            *(_WORD *)&v85[4] = 2080;
            *(void *)&v85[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Metrics/MetricEvents/PGGraphSyndicatedAssetsMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
      goto LABEL_77;
    }
    v71 = v9;
    v13 = [v10 librarySpecificFetchOptions];
    [v13 setIncludeGuestAssets:1];
    uint64_t v14 = *MEMORY[0x1E4F394E0];
    v83[0] = *MEMORY[0x1E4F39538];
    v83[1] = v14;
    v83[2] = *MEMORY[0x1E4F39458];
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:3];
    [v13 setFetchPropertySets:v15];

    v70 = v13;
    v16 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v13];
    uint64_t v17 = [v16 count];
    if (!v17)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1805000, v8, OS_LOG_TYPE_DEFAULT, "PGGraphSyndicatedAssetsMetricEvent: No assets to report.", buf, 2u);
      }
      v40 = v13;
      v9 = v71;
      if (v5)
      {
        if (CFAbsoluteTimeGetCurrent() - v6 >= 0.01)
        {
          char v80 = 0;
          v5[2](v5, &v80, 1.0);
          if (v80)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v85 = 76;
              *(_WORD *)&v85[4] = 2080;
              *(void *)&v85[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Metrics/MetricEvents/PGGraphSyndicatedAssetsMetricEvent.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }
      goto LABEL_76;
    }
    uint64_t v18 = v17;
    v67 = v10;
    v68 = v8;
    id v69 = v4;
    uint64_t v19 = 0;
    uint64_t v77 = 0;
    uint64_t v78 = 0;
    uint64_t v74 = 0;
    uint64_t v76 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    uint64_t v72 = 0;
    while (2)
    {
      uint64_t v22 = v19;
      while (1)
      {
        v23 = (void *)MEMORY[0x1D25FED50]();
        v24 = [v16 objectAtIndexedSubscript:v22];
        switch([v24 syndicationEligibility])
        {
          case -6:
            ++v72;
            break;
          case -5:
            ++v74;
            break;
          case -4:
          case -3:
            ++v21;
            break;
          case -2:
          case -1:
            ++v20;
            break;
          case 0:
            ++v76;
            break;
          case 1:
            ++v77;
            break;
          case 2:
            ++v78;
            break;
          default:
            break;
        }
        if (v5) {
          break;
        }

        if (v18 == ++v22)
        {
          v9 = v71;
          goto LABEL_46;
        }
      }
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v6 >= 0.01)
      {
        char v80 = 0;
        v5[2](v5, &v80, 0.2);
        if (v80)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v85 = 122;
            *(_WORD *)&v85[4] = 2080;
            *(void *)&v85[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Metrics/MetricEvents/PGGraphSyndicatedAssetsMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          v8 = v68;
          id v4 = v69;
          v9 = v71;
          v10 = v67;
          goto LABEL_83;
        }
        double v6 = Current;
      }

      if (++v19 != v18) {
        continue;
      }
      break;
    }
    double v26 = CFAbsoluteTimeGetCurrent();
    v9 = v71;
    if (v26 - v6 >= 0.01)
    {
      char v80 = 0;
      v5[2](v5, &v80, 0.4);
      if (v80)
      {
        v10 = v67;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v85 = 125;
          *(_WORD *)&v85[4] = 2080;
          *(void *)&v85[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Metrics/MetricEvents/PGGraphSyndicatedAssetsMetricEvent.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v8 = v68;
        id v4 = v69;
LABEL_83:
        v12 = 0;
        v40 = v70;
LABEL_76:

        goto LABEL_77;
      }
      double v6 = v26;
    }
LABEL_46:
    v27 = (void *)MEMORY[0x1D25FED50]();
    v28 = [v9 librarySpecificFetchOptions];
    v29 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForGuestAsset"), 1);
    [v28 setIncludeGuestAssets:1];
    [v28 setInternalPredicate:v29];
    uint64_t v30 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v28];

    v31 = (void *)MEMORY[0x1D25FED50]();
    v32 = (void *)MEMORY[0x1E4F391A0];
    v33 = [v9 librarySpecificFetchOptions];
    v34 = [v32 fetchMomentUUIDByAssetUUIDForAssets:v30 options:v33];

    v35 = (void *)MEMORY[0x1E4F1CAD0];
    v36 = [v34 allValues];
    v37 = [v35 setWithArray:v36];

    uint64_t v65 = [v37 count];
    v66 = (void *)v30;
    if (v5)
    {
      double v38 = CFAbsoluteTimeGetCurrent();
      v9 = v71;
      if (v38 - v6 >= 0.01)
      {
        char v80 = 0;
        v5[2](v5, &v80, 0.6);
        if (v80)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v85 = 144;
            *(_WORD *)&v85[4] = 2080;
            *(void *)&v85[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Metrics/MetricEvents/PGGraphSyndicatedAssetsMetricEvent.m";
            v39 = MEMORY[0x1E4F14500];
LABEL_65:
            _os_log_impl(&dword_1D1805000, v39, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            goto LABEL_66;
          }
          goto LABEL_66;
        }
        double v6 = v38;
      }
    }
    else
    {
      v9 = v71;
    }
    v41 = (void *)MEMORY[0x1D25FED50]();
    v42 = (void *)MEMORY[0x1E4F38EE8];
    v43 = [v9 librarySpecificFetchOptions];
    v44 = [v42 fetchAssetCollectionsContainingAssets:v30 withType:4 options:v43];

    uint64_t v45 = [v44 count];
    if (v5)
    {
      double v46 = CFAbsoluteTimeGetCurrent();
      if (v46 - v6 >= 0.01)
      {
        char v80 = 0;
        v5[2](v5, &v80, 0.8);
        if (v80)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v85 = 152;
            *(_WORD *)&v85[4] = 2080;
            *(void *)&v85[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Metrics/MetricEvents/PGGraphSyndicatedAssetsMetricEvent.m";
            v39 = MEMORY[0x1E4F14500];
            goto LABEL_65;
          }
LABEL_66:
          v8 = v68;
          id v4 = v69;
          v12 = 0;
          v10 = v67;
          v40 = v70;
LABEL_75:

          goto LABEL_76;
        }
        double v6 = v46;
      }
    }
    v47 = (void *)MEMORY[0x1D25FED50]();
    v48 = [v9 librarySpecificFetchOptions];
    objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"type == %d", 18);
    v49 = uint64_t v64 = v45;
    [v48 setPredicate:v49];

    v50 = [MEMORY[0x1E4F39250] fetchAnsweredYesOrNoQuestionsWithOptions:v48 validQuestionsOnly:0];
    v51 = [MEMORY[0x1E4F39250] questionsWithValidEntitiesFromQuestions:v50 photoLibrary:v9];
    uint64_t v52 = [v50 count];
    uint64_t v62 = v52 - [v51 count];

    v81[0] = @"numberOfAssetsWithoutResource";
    v73 = [NSNumber numberWithUnsignedInteger:v72];
    v82[0] = v73;
    v81[1] = @"numberOfAssetsWithSyndicationStateIncompatible";
    v75 = [NSNumber numberWithUnsignedInteger:v74];
    v82[1] = v75;
    v81[2] = @"numberOfAssetsNotProcessed";
    v63 = [NSNumber numberWithUnsignedInteger:v21];
    v82[2] = v63;
    v81[3] = @"numberOfAssetsNotComputed";
    v61 = [NSNumber numberWithUnsignedInteger:v20];
    v82[3] = v61;
    v81[4] = @"numberOfAssetsNotEligible";
    v53 = [NSNumber numberWithUnsignedInteger:v76];
    v82[4] = v53;
    v81[5] = @"numberOfAssetsEligible";
    v54 = [NSNumber numberWithUnsignedInteger:v77];
    v82[5] = v54;
    v81[6] = @"numberOfAssetsInferredAsGuest";
    v55 = [NSNumber numberWithUnsignedInteger:v78];
    v82[6] = v55;
    v81[7] = @"numberOfMomentsFeaturingGuestAssets";
    v56 = [NSNumber numberWithUnsignedInteger:v65];
    v82[7] = v56;
    v81[8] = @"numberOfMemoriesFeaturingGuestAssets";
    v57 = [NSNumber numberWithUnsignedInteger:v64];
    v82[8] = v57;
    v81[9] = @"numberOfInvalidQuestions";
    v58 = [NSNumber numberWithUnsignedInteger:v62];
    v82[9] = v58;
    v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v81 count:10];
    payload = self->_payload;
    self->_payload = v59;

    v9 = v71;
    v8 = v68;
    id v4 = v69;
    v12 = 0;
    v10 = v67;
    v40 = v70;
    if (v5)
    {
      if (CFAbsoluteTimeGetCurrent() - v6 >= 0.01)
      {
        char v80 = 0;
        v5[2](v5, &v80, 1.0);
        if (v80)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v85 = 176;
            *(_WORD *)&v85[4] = 2080;
            *(void *)&v85[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Metrics/MetricEvents/PGGraphSyndicatedAssetsMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
    goto LABEL_75;
  }
  char v80 = 0;
  v5[2](v5, &v80, 0.0);
  if (!v80)
  {
    double v6 = v7;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v85 = 48;
    *(_WORD *)&v85[4] = 2080;
    *(void *)&v85[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Metrics/MetricEvents/PGGraphSyndicatedAssetsMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_79:
}

- (BOOL)shouldReportMetrics
{
  return 1;
}

- (id)identifier
{
  return @"com.apple.Photos.Intelligence.Graph.SyndicatedAssets";
}

- (PGGraphSyndicatedAssetsMetricEvent)initWithWorkingContext:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PGGraphSyndicatedAssetsMetricEvent;
  double v6 = [(PGGraphSyndicatedAssetsMetricEvent *)&v10 init];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workingContext, a3);
    payload = v7->_payload;
    v7->_payload = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
  return v7;
}

@end