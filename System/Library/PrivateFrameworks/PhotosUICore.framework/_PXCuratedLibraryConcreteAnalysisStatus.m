@interface _PXCuratedLibraryConcreteAnalysisStatus
- (BOOL)hasBattery;
- (BOOL)isDeviceUnplugged;
- (_PXCuratedLibraryConcreteAnalysisStatus)initWithDataSourceManager:(id)a3;
- (float)_enrichmentProgressForDataSource:(id)a3;
- (int64_t)_analyzingStateForDataSource:(id)a3;
- (void)_batteryStateDidChange:(id)a3;
- (void)_configureBatteryMonitoring;
- (void)_updateStatusProperties;
- (void)dataSourceManagerDidChange;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
@end

@implementation _PXCuratedLibraryConcreteAnalysisStatus

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)CuratedLibraryAssetsDataSourceManagerObserverContext != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryAnalysisStatus.m" lineNumber:478 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 0xC) != 0)
  {
    id v11 = v9;
    [(_PXCuratedLibraryConcreteAnalysisStatus *)self _updateStatusProperties];
    id v9 = v11;
  }
}

- (void)dataSourceManagerDidChange
{
  v3 = [(PXCuratedLibraryAnalysisStatus *)self dataSourceManager];

  if (v3)
  {
    v4 = [(PXCuratedLibraryAnalysisStatus *)self dataSourceManager];
    [v4 registerChangeObserver:self context:CuratedLibraryAssetsDataSourceManagerObserverContext];

    [(_PXCuratedLibraryConcreteAnalysisStatus *)self _configureBatteryMonitoring];
    [(_PXCuratedLibraryConcreteAnalysisStatus *)self _updateStatusProperties];
  }
}

- (void)_configureBatteryMonitoring
{
  v3 = +[PXPreloadScheduler sharedScheduler];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70___PXCuratedLibraryConcreteAnalysisStatus__configureBatteryMonitoring__block_invoke;
  v4[3] = &unk_1E5DD36F8;
  v4[4] = self;
  [v3 scheduleMainQueueTask:v4];
}

- (void)_updateStatusProperties
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v3 = [(PXCuratedLibraryAnalysisStatus *)self dataSourceManager];
  if (![v3 canLoadData])
  {
    unint64_t v7 = 0;
    LOBYTE(v8) = 1;
    float v9 = -1.0;
    goto LABEL_20;
  }
  v4 = [v3 dataSourceManagerForZoomLevel:3];
  v5 = [v4 dataSource];

  if ([v3 enableDays])
  {
    char v6 = [v5 firstAssetCollection];
    if (!v6) {
      goto LABEL_8;
    }
  }
  else
  {
    v10 = [v3 dataSourceManagerForZoomLevel:2];
    id v11 = [v10 dataSource];

    char v6 = [v11 firstAssetCollection];

    if (!v6) {
      goto LABEL_8;
    }
  }
  if (([v6 isRecent] & 1) == 0)
  {
    if ([v5 numberOfSections] < 1)
    {
      unint64_t v7 = 0;
      float v9 = -1.0;
    }
    else
    {
      [(_PXCuratedLibraryConcreteAnalysisStatus *)self _enrichmentProgressForDataSource:v5];
      float v9 = v12;
      unint64_t v7 = [(_PXCuratedLibraryConcreteAnalysisStatus *)self _analyzingStateForDataSource:v5];
    }
    int v8 = 1;
    if ([(PXCuratedLibraryAnalysisStatus *)self isDaysMonthsYearsStructureEnabled]) {
      goto LABEL_19;
    }
LABEL_14:
    v13 = PLCuratedLibraryGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = @"NO";
      if (v8) {
        v14 = @"YES";
      }
      v15 = v14;
      *(_DWORD *)buf = 138412546;
      v33 = v15;
      __int16 v34 = 2112;
      v35 = v6;
      _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_DEFAULT, "[CuratedLibraryAnalysisStatus] isDaysMonthsYearsStructureEnabled %@ with firstAssetCollection: %@", buf, 0x16u);
    }
    goto LABEL_19;
  }
LABEL_8:
  unint64_t v7 = 0;
  int v8 = 0;
  float v9 = -1.0;
  if ([(PXCuratedLibraryAnalysisStatus *)self isDaysMonthsYearsStructureEnabled]) {
    goto LABEL_14;
  }
LABEL_19:

LABEL_20:
  int v16 = [(_PXCuratedLibraryConcreteAnalysisStatus *)self isDeviceUnplugged];
  int v17 = [(_PXCuratedLibraryConcreteAnalysisStatus *)self hasBattery];
  v18 = _CuratedLibraryAnalysisStatusLocalizedTitleForState(v7, v16, [(PXCuratedLibraryAnalysisStatus *)self alternateTitleIndex]);
  v19 = _CuratedLibraryAnalysisStatusLocalizedDescriptionForState(v7, v16, v17);
  if (v7 == 2) {
    float v20 = -1.0;
  }
  else {
    float v20 = v9;
  }
  if (v7 == 2 && (v16 & 1) == 0)
  {
    double v21 = v9;
    if (v9 < 0.1) {
      double v21 = 0.1;
    }
    float v20 = fmin(v21, 0.9);
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __66___PXCuratedLibraryConcreteAnalysisStatus__updateStatusProperties__block_invoke;
  v24[3] = &unk_1E5DC7120;
  id v26 = v19;
  unint64_t v27 = v7;
  id v25 = v18;
  float v28 = v9;
  float v29 = v20;
  char v30 = v8;
  char v31 = v16;
  id v22 = v19;
  id v23 = v18;
  [(_PXCuratedLibraryConcreteAnalysisStatus *)self performChanges:v24];
}

- (BOOL)isDeviceUnplugged
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v3 = [v2 batteryState] == 1;

  return v3;
}

- (BOOL)hasBattery
{
  return 1;
}

- (int64_t)_analyzingStateForDataSource:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[PXCuratedLibrarySettings sharedInstance];
  uint64_t v6 = [v5 firstTimeExperienceMaxNonProcessedHighlights];

  unint64_t v7 = +[PXCuratedLibrarySettings sharedInstance];
  uint64_t v8 = [v7 firstTimeExperienceMaxNonProcessedAssets];

  unsigned __int16 v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  int64_t v12 = 1;
  while (1)
  {
    unsigned int v13 = v9;
    v11 += [v4 numberOfSectionsWithEnrichmentState:v9];
    v10 += [v4 estimatedAssetsCountWithEnrichmentState:v9];
    BOOL v14 = v11 <= v6 && v10 <= v8;
    BOOL v15 = v14;
    if (!v14) {
      break;
    }
    ++v9;
    if (v13 > 1) {
      goto LABEL_11;
    }
  }
  int64_t v12 = 2;
LABEL_11:
  if (v12 != [(PXCuratedLibraryAnalysisStatus *)self state])
  {
    int v16 = PLCuratedLibraryGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = @"analyzing";
      if (v15) {
        int v17 = @"ready";
      }
      v18 = v17;
      int v20 = 138412802;
      double v21 = v18;
      __int16 v22 = 2048;
      uint64_t v23 = v11;
      __int16 v24 = 2048;
      uint64_t v25 = v10;
      _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_DEFAULT, "[CuratedLibraryAnalysisStatus] State = <%@>; numberOfNonProcessedSections = <%li>; numberOfNonProcessedAssets = <%li>",
        (uint8_t *)&v20,
        0x20u);
    }
  }

  return v12;
}

- (float)_enrichmentProgressForDataSource:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = 0;
  int v6 = 3;
  do
  {
    unsigned int v7 = (unsigned __int16)v6;
    v5 += [v4 estimatedAssetsCountWithEnrichmentState:(unsigned __int16)v6++];
  }
  while (v7 < 4);
  uint64_t v8 = 0;
  char v9 = 1;
  unsigned __int16 v10 = 1;
  do
  {
    char v11 = v9;
    uint64_t v12 = [v4 estimatedAssetsCountWithEnrichmentState:v10];
    char v9 = 0;
    v8 += v12;
    unsigned __int16 v10 = 2;
  }
  while ((v11 & 1) != 0);
  uint64_t v13 = v8 + v5 + [v4 estimatedAssetsCountWithEnrichmentState:0];
  if (v13 < 1) {
    float v14 = 1.0;
  }
  else {
    float v14 = (float)((float)((float)v8 * 0.25) + (float)v5) / (float)v13;
  }
  [(PXCuratedLibraryAnalysisStatus *)self progress];
  if (v14 != v15)
  {
    int v16 = PLCuratedLibraryGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 134218496;
      double v19 = v14;
      __int16 v20 = 2048;
      uint64_t v21 = v5;
      __int16 v22 = 2048;
      uint64_t v23 = v13;
      _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_DEFAULT, "[CuratedLibraryAnalysisStatus] Progress = <%0.2f>; countOfProcessedAssets = <%li>; totalCountOfAssets = <%li>",
        (uint8_t *)&v18,
        0x20u);
    }
  }
  return v14;
}

- (void)_batteryStateDidChange:(id)a3
{
}

- (_PXCuratedLibraryConcreteAnalysisStatus)initWithDataSourceManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_PXCuratedLibraryConcreteAnalysisStatus;
  return (_PXCuratedLibraryConcreteAnalysisStatus *)[(PXCuratedLibraryAnalysisStatus *)&v4 _initWithDataSourceManager:a3];
}

@end