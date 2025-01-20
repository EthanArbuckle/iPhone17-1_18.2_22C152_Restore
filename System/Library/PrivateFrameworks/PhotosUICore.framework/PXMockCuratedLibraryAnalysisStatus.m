@interface PXMockCuratedLibraryAnalysisStatus
+ (BOOL)shouldUseMock;
+ (id)_mockStatus;
- (PXMockCuratedLibraryAnalysisStatus)initWithDataSourceManager:(id)a3;
- (void)_updateStatusProperties;
- (void)dataSourceManagerDidChange;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation PXMockCuratedLibraryAnalysisStatus

- (void)_updateStatusProperties
{
  v3 = [(id)objc_opt_class() _mockStatus];
  v4 = [v3 objectForKeyedSubscript:@"Structure"];
  v26 = v4;
  if (v4) {
    char v25 = [v4 BOOLValue];
  }
  else {
    char v25 = 1;
  }
  v5 = [v3 objectForKeyedSubscript:@"State"];
  v6 = v5;
  if (v5 && ([v5 isEqualToString:@"unknown"] & 1) == 0)
  {
    if ([v6 isEqualToString:@"analyzing"]) {
      unint64_t v7 = 2;
    }
    else {
      unint64_t v7 = [v6 isEqualToString:@"ready"];
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  v8 = [v3 objectForKeyedSubscript:@"progress"];
  v9 = v8;
  if (v8)
  {
    [v8 floatValue];
    float v11 = v10;
  }
  else
  {
    float v11 = -1.0;
  }
  v12 = [v3 objectForKeyedSubscript:@"Unplugged"];
  v13 = v12;
  if (v12) {
    int v14 = [v12 BOOLValue];
  }
  else {
    int v14 = 0;
  }
  v15 = [v3 objectForKeyedSubscript:@"HasBattery"];
  v16 = v15;
  if (v15) {
    int v17 = [v15 BOOLValue];
  }
  else {
    int v17 = 1;
  }
  v18 = _CuratedLibraryAnalysisStatusLocalizedTitleForState(v7, v14, [(PXCuratedLibraryAnalysisStatus *)self alternateTitleIndex]);
  v19 = _CuratedLibraryAnalysisStatusLocalizedDescriptionForState(v7, v14, v17);
  if (v7 == 2) {
    char v20 = v14;
  }
  else {
    char v20 = 1;
  }
  float v21 = -1.0;
  if (v7 != 2) {
    float v21 = v11;
  }
  if ((v20 & 1) == 0)
  {
    double v22 = v11;
    if (v11 < 0.1) {
      double v22 = 0.1;
    }
    float v21 = fmin(v22, 0.9);
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __61__PXMockCuratedLibraryAnalysisStatus__updateStatusProperties__block_invoke;
  v27[3] = &unk_1E5DC7120;
  id v29 = v19;
  unint64_t v30 = v7;
  id v28 = v18;
  float v31 = v11;
  float v32 = v21;
  char v33 = v25;
  char v34 = v14;
  id v23 = v19;
  id v24 = v18;
  [(PXMockCuratedLibraryAnalysisStatus *)self performChanges:v27];
}

void __61__PXMockCuratedLibraryAnalysisStatus__updateStatusProperties__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 48);
  id v6 = a2;
  [v6 setState:v3];
  [v6 setLocalizedTitle:*(void *)(a1 + 32)];
  [v6 setLocalizedDescription:*(void *)(a1 + 40)];
  LODWORD(v4) = *(_DWORD *)(a1 + 56);
  [v6 setProgress:v4];
  LODWORD(v5) = *(_DWORD *)(a1 + 60);
  [v6 setDisplayProgress:v5];
  [v6 setIsDaysMonthsYearsStructureEnabled:*(unsigned __int8 *)(a1 + 64)];
  [v6 setIsDevicePlugged:*(unsigned char *)(a1 + 65) == 0];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &_PXMockCuratedLibraryAnalysisStatusUserDefaultsContext)
  {
    [(PXMockCuratedLibraryAnalysisStatus *)self _updateStatusProperties];
  }
  else
  {
    uint64_t v9 = v6;
    uint64_t v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)PXMockCuratedLibraryAnalysisStatus;
    -[PXMockCuratedLibraryAnalysisStatus observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)dealloc
{
  uint64_t v3 = PXSharedUserDefaults();
  [v3 removeObserver:self forKeyPath:@"LibraryAnalysisStatusMock" context:&_PXMockCuratedLibraryAnalysisStatusUserDefaultsContext];

  v4.receiver = self;
  v4.super_class = (Class)PXMockCuratedLibraryAnalysisStatus;
  [(PXCuratedLibraryAnalysisStatus *)&v4 dealloc];
}

- (void)dataSourceManagerDidChange
{
  PXSharedUserDefaults();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 addObserver:self forKeyPath:@"LibraryAnalysisStatusMock" options:4 context:&_PXMockCuratedLibraryAnalysisStatusUserDefaultsContext];
}

- (PXMockCuratedLibraryAnalysisStatus)initWithDataSourceManager:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = PLUIGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = objc_opt_class();
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEBUG, "%@ Using mock analysis status", buf, 0xCu);
  }

  v8.receiver = self;
  v8.super_class = (Class)PXMockCuratedLibraryAnalysisStatus;
  uint64_t v6 = [(PXCuratedLibraryAnalysisStatus *)&v8 _initWithDataSourceManager:v4];

  return v6;
}

+ (id)_mockStatus
{
  v2 = PXSharedUserDefaults();
  id v3 = [v2 objectForKey:@"LibraryAnalysisStatusMock"];

  if (!v3)
  {
    id v4 = 0;
    goto LABEL_24;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  double v5 = [v3 componentsSeparatedByString:@"/"];
  if ([v5 count])
  {
    uint64_t v6 = [v5 objectAtIndexedSubscript:0];
    if (([v6 isEqualToString:@"unknown"] & 1) == 0
      && ([v6 isEqualToString:@"analyzing"] & 1) == 0
      && ![v6 isEqualToString:@"ready"])
    {
      if ([v6 isEqualToString:@"unvavailable"]) {
        [v4 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"Structure"];
      }
      goto LABEL_22;
    }
    [v4 setObject:v6 forKeyedSubscript:@"State"];
    if ([v5 containsObject:@"hasbattery"])
    {
      uint64_t v7 = MEMORY[0x1E4F1CC38];
    }
    else
    {
      if (![v5 containsObject:@"hasnobattery"]) {
        goto LABEL_12;
      }
      uint64_t v7 = MEMORY[0x1E4F1CC28];
    }
    [v4 setObject:v7 forKeyedSubscript:@"HasBattery"];
LABEL_12:
    if ([v5 containsObject:@"plugged"])
    {
      uint64_t v8 = MEMORY[0x1E4F1CC28];
    }
    else
    {
      if (![v5 containsObject:@"unplugged"])
      {
LABEL_17:
        uint64_t v9 = [v5 indexOfObject:@"progress"];
        if (v9 != 0x7FFFFFFFFFFFFFFFLL && [v5 count] > (unint64_t)(v9 + 1))
        {
          uint64_t v10 = NSNumber;
          uint64_t v11 = objc_msgSend(v5, "objectAtIndexedSubscript:");
          [v11 floatValue];
          v12 = objc_msgSend(v10, "numberWithFloat:");
          [v4 setObject:v12 forKeyedSubscript:@"progress"];
        }
LABEL_22:

        goto LABEL_23;
      }
      uint64_t v8 = MEMORY[0x1E4F1CC38];
    }
    [v4 setObject:v8 forKeyedSubscript:@"Unplugged"];
    goto LABEL_17;
  }
LABEL_23:

LABEL_24:
  return v4;
}

+ (BOOL)shouldUseMock
{
  if (!PFOSVariantHasInternalUI()) {
    return 0;
  }
  id v3 = [a1 _mockStatus];
  BOOL v4 = v3 != 0;

  return v4;
}

@end