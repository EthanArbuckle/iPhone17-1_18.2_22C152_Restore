@interface PXCuratedLibraryAnalysisStatus
+ (id)sharedStatusForLibrary:(id)a3;
- (BOOL)hasBattery;
- (BOOL)isDaysMonthsYearsStructureEnabled;
- (BOOL)isDevicePlugged;
- (NSString)description;
- (NSString)localizedDescription;
- (NSString)localizedTitle;
- (PXCuratedLibraryAnalysisStatus)init;
- (PXCuratedLibraryAnalysisStatus)initWithDataSourceManager:(id)a3;
- (PXCuratedLibraryAssetsDataSourceManager)dataSourceManager;
- (PXCuratedLibraryEventTracker)eventTracker;
- (float)displayProgress;
- (float)progress;
- (id)_initWithDataSourceManager:(id)a3;
- (int64_t)alternateTitleIndex;
- (int64_t)state;
- (void)_updateEventsTracking;
- (void)cycleToNextAlternateTitle;
- (void)dealloc;
- (void)didPerformChanges;
- (void)setDataSourceManager:(id)a3;
- (void)setDisplayProgress:(float)a3;
- (void)setEventTracker:(id)a3;
- (void)setIsDaysMonthsYearsStructureEnabled:(BOOL)a3;
- (void)setIsDevicePlugged:(BOOL)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setProgress:(float)a3;
- (void)setState:(int64_t)a3;
- (void)startCyclingThroughAlternateTitles;
- (void)stopCyclingThroughAlternateTitles;
@end

@implementation PXCuratedLibraryAnalysisStatus

- (BOOL)isDaysMonthsYearsStructureEnabled
{
  return self->_isDaysMonthsYearsStructureEnabled;
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    [(PXCuratedLibraryAnalysisStatus *)self signalChange:1];
  }
}

- (void)setProgress:(float)a3
{
}

- (void)setLocalizedTitle:(id)a3
{
  v8 = (NSString *)a3;
  v4 = self->_localizedTitle;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSString *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      v6 = (NSString *)[(NSString *)v8 copy];
      localizedTitle = self->_localizedTitle;
      self->_localizedTitle = v6;

      [(PXCuratedLibraryAnalysisStatus *)self signalChange:2];
    }
  }
}

- (void)setLocalizedDescription:(id)a3
{
  v8 = (NSString *)a3;
  v4 = self->_localizedDescription;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSString *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      v6 = (NSString *)[(NSString *)v8 copy];
      localizedDescription = self->_localizedDescription;
      self->_localizedDescription = v6;

      [(PXCuratedLibraryAnalysisStatus *)self signalChange:4];
    }
  }
}

- (void)setIsDevicePlugged:(BOOL)a3
{
  if (self->_isDevicePlugged != a3)
  {
    self->_isDevicePlugged = a3;
    [(PXCuratedLibraryAnalysisStatus *)self signalChange:64];
  }
}

- (void)setIsDaysMonthsYearsStructureEnabled:(BOOL)a3
{
  if (self->_isDaysMonthsYearsStructureEnabled != a3)
  {
    self->_isDaysMonthsYearsStructureEnabled = a3;
    [(PXCuratedLibraryAnalysisStatus *)self signalChange:32];
  }
}

- (void)setDisplayProgress:(float)a3
{
}

- (void)didPerformChanges
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryAnalysisStatus;
  [(PXCuratedLibraryAnalysisStatus *)&v4 didPerformChanges];
  if ([(PXCuratedLibraryAnalysisStatus *)self currentChanges])
  {
    v3 = PLCuratedLibraryGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v6 = self;
      _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "[CuratedLibraryAnalysisStatus] Did transition to %@", buf, 0xCu);
    }

    [(PXCuratedLibraryAnalysisStatus *)self _updateEventsTracking];
  }
}

- (void)_updateEventsTracking
{
  if ([(PXCuratedLibraryAnalysisStatus *)self state])
  {
    id v3 = [(PXCuratedLibraryAnalysisStatus *)self eventTracker];
    [(PXCuratedLibraryAnalysisStatus *)self progress];
    objc_msgSend(v3, "logAnalysisProgress:");
  }
}

- (int64_t)state
{
  return self->_state;
}

- (PXCuratedLibraryEventTracker)eventTracker
{
  return self->_eventTracker;
}

- (void)setDataSourceManager:(id)a3
{
  v8 = (PXCuratedLibraryAssetsDataSourceManager *)a3;
  char v5 = self->_dataSourceManager;
  if (v5 == v8)
  {
  }
  else
  {
    v6 = v5;
    char v7 = [(PXCuratedLibraryAssetsDataSourceManager *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_dataSourceManager, a3);
      [(PXCuratedLibraryAnalysisStatus *)self dataSourceManagerDidChange];
    }
  }
}

- (PXCuratedLibraryAssetsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (int64_t)alternateTitleIndex
{
  return self->_alternateTitleIndex;
}

- (float)progress
{
  return self->_progress;
}

+ (id)sharedStatusForLibrary:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"PXCuratedLibraryAnalysisStatus.m", 152, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  if (sharedStatusForLibrary__onceToken != -1) {
    dispatch_once(&sharedStatusForLibrary__onceToken, &__block_literal_global_226524);
  }
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__226525;
  v18 = __Block_byref_object_dispose__226526;
  id v19 = 0;
  v6 = sharedStatusForLibrary__fetchersQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PXCuratedLibraryAnalysisStatus_sharedStatusForLibrary___block_invoke_202;
  block[3] = &unk_1E5DD0588;
  id v12 = v5;
  v13 = &v14;
  id v7 = v5;
  dispatch_sync(v6, block);
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (void)setEventTracker:(id)a3
{
  id v5 = (PXCuratedLibraryEventTracker *)a3;
  if (self->_eventTracker != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_eventTracker, a3);
    [(PXCuratedLibraryAnalysisStatus *)self _updateEventsTracking];
    id v5 = v6;
  }
}

void __57__PXCuratedLibraryAnalysisStatus_sharedStatusForLibrary___block_invoke_202(uint64_t a1)
{
  uint64_t v2 = [(id)sharedStatusForLibrary__sharedStatusByPhotoLibrary objectForKey:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  objc_super v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v5 = objc_alloc_init(_PXCuratedLibraryConcreteAnalysisStatus);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v8 = (void *)sharedStatusForLibrary__sharedStatusByPhotoLibrary;
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [v8 setObject:v10 forKey:v9];
  }
}

- (PXCuratedLibraryAnalysisStatus)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibraryAnalysisStatus;
  return [(PXCuratedLibraryAnalysisStatus *)&v3 init];
}

void __57__PXCuratedLibraryAnalysisStatus_sharedStatusForLibrary___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
  v1 = (void *)sharedStatusForLibrary__sharedStatusByPhotoLibrary;
  sharedStatusForLibrary__sharedStatusByPhotoLibrary = v0;

  objc_super v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.photos.PXCuratedLibraryAnalysisStatus-isolation-queue", v4);
  objc_super v3 = (void *)sharedStatusForLibrary__fetchersQueue;
  sharedStatusForLibrary__fetchersQueue = (uint64_t)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_eventTracker, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_alternateTitleTimer, 0);
}

- (BOOL)hasBattery
{
  return self->_hasBattery;
}

- (BOOL)isDevicePlugged
{
  return self->_isDevicePlugged;
}

- (float)displayProgress
{
  return self->_displayProgress;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)cycleToNextAlternateTitle
{
}

- (void)stopCyclingThroughAlternateTitles
{
  int64_t v2 = self->_numberOfRequestsToCycleThroughAlternateTitles - 1;
  self->_numberOfRequestsToCycleThroughAlternateTitles = v2;
  if (!v2)
  {
    [(NSTimer *)self->_alternateTitleTimer invalidate];
    alternateTitleTimer = self->_alternateTitleTimer;
    self->_alternateTitleTimer = 0;
  }
}

- (void)startCyclingThroughAlternateTitles
{
  int64_t numberOfRequestsToCycleThroughAlternateTitles = self->_numberOfRequestsToCycleThroughAlternateTitles;
  self->_int64_t numberOfRequestsToCycleThroughAlternateTitles = numberOfRequestsToCycleThroughAlternateTitles + 1;
  if (!numberOfRequestsToCycleThroughAlternateTitles)
  {
    objc_super v4 = +[PXFooterSettings sharedInstance];
    [v4 alternateTitleCyclingInterval];
    double v6 = v5;

    [(NSTimer *)self->_alternateTitleTimer invalidate];
    objc_msgSend(MEMORY[0x1E4F1CB00], "px_timerWithTimeInterval:weakTarget:selector:userInfo:repeats:", self, sel__handleAlternateTitleTimer_, 0, 1, v6);
    id v7 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    alternateTitleTimer = self->_alternateTitleTimer;
    self->_alternateTitleTimer = v7;

    id v9 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [v9 addTimer:self->_alternateTitleTimer forMode:*MEMORY[0x1E4F1C4B0]];
  }
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(PXCuratedLibraryAnalysisStatus *)self state];
  if (v5 > 2) {
    double v6 = 0;
  }
  else {
    double v6 = off_1E5DC7148[v5];
  }
  id v7 = [(PXCuratedLibraryAnalysisStatus *)self localizedTitle];
  id v8 = [(PXCuratedLibraryAnalysisStatus *)self localizedDescription];
  [(PXCuratedLibraryAnalysisStatus *)self progress];
  double v10 = v9;
  [(PXCuratedLibraryAnalysisStatus *)self displayProgress];
  double v12 = v11;
  BOOL v13 = [(PXCuratedLibraryAnalysisStatus *)self isDaysMonthsYearsStructureEnabled];
  uint64_t v14 = @"NO";
  if (v13) {
    uint64_t v14 = @"YES";
  }
  v15 = v14;
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; state: %@; localizedTitle: %@; localizedDescription: %@; progress: %0.2f; displayProgress: %0.2f; isDaysMonthsYearsStructureEnabled: %@>",
    v4,
    self,
    v6,
    v7,
    v8,
    *(void *)&v10,
    *(void *)&v12,
  uint64_t v16 = v15);

  return (NSString *)v16;
}

- (void)dealloc
{
  [(NSTimer *)self->_alternateTitleTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibraryAnalysisStatus;
  [(PXCuratedLibraryAnalysisStatus *)&v3 dealloc];
}

- (id)_initWithDataSourceManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXCuratedLibraryAnalysisStatus;
  double v6 = [(PXCuratedLibraryAnalysisStatus *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSourceManager, a3);
    [(PXCuratedLibraryAnalysisStatus *)v7 dataSourceManagerDidChange];
  }

  return v7;
}

- (PXCuratedLibraryAnalysisStatus)initWithDataSourceManager:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[PXMockCuratedLibraryAnalysisStatus shouldUseMock];
  double v6 = off_1E5DAA050;
  if (v5) {
    double v6 = off_1E5DA7350;
  }
  id v7 = (PXCuratedLibraryAnalysisStatus *)[objc_alloc(*v6) initWithDataSourceManager:v4];

  return v7;
}

@end