@interface PUPhotoEditDiagnosticsManager
+ (PUPhotoEditDiagnosticsManager)diagnosticsManagerWithActionType:(int64_t)a3 delegate:(id)a4;
- (BOOL)diagnosticsInProgress;
- (NSTimer)diagnosticsTimer;
- (PETailspin)tailspinManager;
- (PUPhotoEditDiagnosticsDelegate)delegate;
- (PUPhotoEditDiagnosticsManager)initWithActionType:(int64_t)a3 delegate:(id)a4;
- (int64_t)actionType;
- (void)_diagnosticsTimerFired:(id)a3;
- (void)_fileRadarWithTailspinFile:(id)a3;
- (void)beginMonitoringForTimeInterval:(double)a3;
- (void)dealloc;
- (void)endMonitoring;
- (void)setActionType:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDiagnosticsInProgress:(BOOL)a3;
- (void)setDiagnosticsTimer:(id)a3;
- (void)setTailspinManager:(id)a3;
@end

@implementation PUPhotoEditDiagnosticsManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tailspinManager, 0);
  objc_storeStrong((id *)&self->_diagnosticsTimer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setDiagnosticsInProgress:(BOOL)a3
{
  self->_diagnosticsInProgress = a3;
}

- (BOOL)diagnosticsInProgress
{
  return self->_diagnosticsInProgress;
}

- (void)setTailspinManager:(id)a3
{
}

- (PETailspin)tailspinManager
{
  return self->_tailspinManager;
}

- (void)setDiagnosticsTimer:(id)a3
{
}

- (NSTimer)diagnosticsTimer
{
  return self->_diagnosticsTimer;
}

- (void)setActionType:(int64_t)a3
{
  self->_actionType = a3;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (void)setDelegate:(id)a3
{
}

- (PUPhotoEditDiagnosticsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUPhotoEditDiagnosticsDelegate *)WeakRetained;
}

- (void)endMonitoring
{
  v3 = [(PUPhotoEditDiagnosticsManager *)self diagnosticsTimer];
  [v3 invalidate];

  [(PUPhotoEditDiagnosticsManager *)self setDiagnosticsTimer:0];
  [(PUPhotoEditDiagnosticsManager *)self setTailspinManager:0];
}

- (void)_fileRadarWithTailspinFile:(id)a3
{
  id v4 = a3;
  id v5 = [(PUPhotoEditDiagnosticsManager *)self delegate];
  [v5 fileRadarAndAttachFile:v4];
}

- (void)_diagnosticsTimerFired:(id)a3
{
  id v4 = [(PUPhotoEditDiagnosticsManager *)self tailspinManager];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__PUPhotoEditDiagnosticsManager__diagnosticsTimerFired___block_invoke;
  v5[3] = &unk_1E5F2BFC0;
  v5[4] = self;
  [v4 dumpTailspinOutputWithCompletion:v5];
}

void __56__PUPhotoEditDiagnosticsManager__diagnosticsTimerFired___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    v7 = __56__PUPhotoEditDiagnosticsManager__diagnosticsTimerFired___block_invoke_2;
    v8 = &unk_1E5F2ECC8;
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = v3;
    dispatch_async(MEMORY[0x1E4F14428], &v5);
  }
  objc_msgSend(*(id *)(a1 + 32), "endMonitoring", v5, v6, v7, v8, v9);
}

void __56__PUPhotoEditDiagnosticsManager__diagnosticsTimerFired___block_invoke_2(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) actionType];
  if (v2 > 2) {
    id v3 = 0;
  }
  else {
    id v3 = *(&off_1E5F2BFE0 + v2);
  }
  id v4 = [v3 stringByAppendingString:@"\nWould you like to file a radar with diagnostic information?"];
  uint64_t v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Slow Action" message:v4 preferredStyle:1];
  uint64_t v6 = (void *)MEMORY[0x1E4FB1410];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__PUPhotoEditDiagnosticsManager__diagnosticsTimerFired___block_invoke_3;
  v12[3] = &unk_1E5F2BF70;
  v7 = *(void **)(a1 + 40);
  v12[4] = *(void *)(a1 + 32);
  id v13 = v7;
  v8 = [v6 actionWithTitle:@"File Radar" style:0 handler:v12];
  [v5 addAction:v8];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__PUPhotoEditDiagnosticsManager__diagnosticsTimerFired___block_invoke_4;
  v11[3] = &unk_1E5F2BF98;
  v11[4] = *(void *)(a1 + 32);
  uint64_t v9 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Continue Waiting" style:0 handler:v11];
  [v5 addAction:v9];

  id v10 = [*(id *)(a1 + 32) delegate];
  [v10 presentDiagnosticAlert:v5];
}

uint64_t __56__PUPhotoEditDiagnosticsManager__diagnosticsTimerFired___block_invoke_3(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) delegate];
  [v2 diagnosticsAlertDismissed];

  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  return [v3 _fileRadarWithTailspinFile:v4];
}

void __56__PUPhotoEditDiagnosticsManager__diagnosticsTimerFired___block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 diagnosticsAlertDismissed];
}

- (void)beginMonitoringForTimeInterval:(double)a3
{
  if (MEMORY[0x1B3E7A510](self, a2))
  {
    if ([(PUPhotoEditDiagnosticsManager *)self diagnosticsInProgress]) {
      [(PUPhotoEditDiagnosticsManager *)self endMonitoring];
    }
    id v5 = objc_alloc_init(MEMORY[0x1E4F911C8]);
    [(PUPhotoEditDiagnosticsManager *)self setTailspinManager:v5];

    id v7 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__diagnosticsTimerFired_ selector:0 userInfo:0 repeats:a3];
    [(PUPhotoEditDiagnosticsManager *)self setDiagnosticsTimer:v7];
  }
  else
  {
    uint64_t v6 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEFAULT, "PUPhotoEditDiagnosticsManager: Not an internal build; this class is disabled.",
        buf,
        2u);
    }
  }
}

- (void)dealloc
{
  [(PUPhotoEditDiagnosticsManager *)self endMonitoring];
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditDiagnosticsManager;
  [(PUPhotoEditDiagnosticsManager *)&v3 dealloc];
}

- (PUPhotoEditDiagnosticsManager)initWithActionType:(int64_t)a3 delegate:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PUPhotoEditDiagnosticsManager;
  id v5 = a4;
  uint64_t v6 = [(PUPhotoEditDiagnosticsManager *)&v8 init];
  -[PUPhotoEditDiagnosticsManager setActionType:](v6, "setActionType:", a3, v8.receiver, v8.super_class);
  [(PUPhotoEditDiagnosticsManager *)v6 setDelegate:v5];

  return v6;
}

+ (PUPhotoEditDiagnosticsManager)diagnosticsManagerWithActionType:(int64_t)a3 delegate:(id)a4
{
  id v6 = a4;
  id v7 = (void *)[objc_alloc((Class)a1) initWithActionType:a3 delegate:v6];

  return (PUPhotoEditDiagnosticsManager *)v7;
}

@end