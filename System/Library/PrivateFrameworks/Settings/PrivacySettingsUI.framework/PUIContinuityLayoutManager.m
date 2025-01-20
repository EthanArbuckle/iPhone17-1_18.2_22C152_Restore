@interface PUIContinuityLayoutManager
+ (id)sharedInstance;
- (BOOL)isMirroring;
- (FBSDisplayLayoutMonitor)monitor;
- (PUIContinuityLayoutManager)init;
- (void)appDidLaunch;
- (void)createContinuityDisplayMonitor;
- (void)setIsMirroring:(BOOL)a3;
- (void)setMonitor:(id)a3;
@end

@implementation PUIContinuityLayoutManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__PUIContinuityLayoutManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

uint64_t __44__PUIContinuityLayoutManager_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_instance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (PUIContinuityLayoutManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)PUIContinuityLayoutManager;
  v2 = [(PUIContinuityLayoutManager *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_isMirroring = 0;
    [(PUIContinuityLayoutManager *)v2 createContinuityDisplayMonitor];
  }
  return v3;
}

- (void)appDidLaunch
{
  v2 = _PUILoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1E4AD5000, v2, OS_LOG_TYPE_DEFAULT, "App did launch for continuity layout monitor", v3, 2u);
  }
}

- (void)createContinuityDisplayMonitor
{
  v3 = [MEMORY[0x1E4F62958] configurationForContinuityDisplay];
  objc_initWeak(&location, self);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __60__PUIContinuityLayoutManager_createContinuityDisplayMonitor__block_invoke;
  v10 = &unk_1E6E9D4B8;
  objc_copyWeak(&v11, &location);
  [v3 setTransitionHandler:&v7];
  monitor = self->_monitor;
  if (monitor) {
    [(FBSDisplayLayoutMonitor *)monitor invalidate];
  }
  objc_msgSend(MEMORY[0x1E4F62940], "monitorWithConfiguration:", v3, v7, v8, v9, v10);
  objc_super v5 = (FBSDisplayLayoutMonitor *)objc_claimAutoreleasedReturnValue();
  v6 = self->_monitor;
  self->_monitor = v5;

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __60__PUIContinuityLayoutManager_createContinuityDisplayMonitor__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_super v5 = _PUILoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = @"No";
    if (a3) {
      v6 = @"Yes";
    }
    int v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1E4AD5000, v5, OS_LOG_TYPE_DEFAULT, "Received transition for continuity layout, is active: %@", (uint8_t *)&v8, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIsMirroring:a3 != 0];
}

- (FBSDisplayLayoutMonitor)monitor
{
  return self->_monitor;
}

- (void)setMonitor:(id)a3
{
}

- (BOOL)isMirroring
{
  return self->_isMirroring;
}

- (void)setIsMirroring:(BOOL)a3
{
  self->_isMirroring = a3;
}

- (void).cxx_destruct
{
}

@end