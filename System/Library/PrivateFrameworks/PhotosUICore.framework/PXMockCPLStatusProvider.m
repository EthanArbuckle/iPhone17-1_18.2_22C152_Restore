@interface PXMockCPLStatusProvider
+ (BOOL)shouldUseMockService;
+ (id)_currentMockedStatus;
+ (id)mockStatusProvider;
+ (id)userDefaultsMockStatusProvider;
- (PXCPLStatus)status;
- (PXMockCPLStatusProvider)init;
- (PXMockCPLStatusProvider)initWithUserDefaultsMocks:(BOOL)a3;
- (double)nextOverrideResumeTimeInterval;
- (void)_updateStatus;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setStatus:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation PXMockCPLStatusProvider

+ (BOOL)shouldUseMockService
{
  v2 = PXSharedUserDefaults();
  v3 = [v2 objectForKey:@"CPLStatusProviderMock"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void).cxx_destruct
{
}

- (PXCPLStatus)status
{
  return self->_status;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = +[PXCPLStatusSettings sharedInstance];
  if (v7 == v12)
  {
    v8 = NSStringFromSelector(sel_shouldHideMockStatusWarning);
    int v9 = [v6 isEqualToString:v8];

    if (v9)
    {
LABEL_7:
      [(PXMockCPLStatusProvider *)self _updateStatus];
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v10 = +[PXRootSettings sharedInstance];
  if (v10 != v12)
  {

    goto LABEL_8;
  }
  int v11 = [v6 isEqualToString:@"private_wantsInternalUI"];

  if (v11) {
    goto LABEL_7;
  }
LABEL_8:
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &PXMockCPLStatusProviderUserDefaultsContext)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__PXMockCPLStatusProvider_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E5DD36F8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PXMockCPLStatusProvider;
    -[PXMockCPLStatusProvider observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

uint64_t __74__PXMockCPLStatusProvider_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateStatus];
}

- (void)_updateStatus
{
  id v3 = +[PXMockCPLStatusProvider _currentMockedStatus];
  [(PXMockCPLStatusProvider *)self setStatus:v3];
}

- (void)setStatus:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (PXCPLStatus *)a3;
  v5 = self->_status;
  if (v5 == v4)
  {
  }
  else
  {
    objc_super v6 = v5;
    BOOL v7 = [(PXCPLStatus *)v5 isEqual:v4];

    if (!v7)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __37__PXMockCPLStatusProvider_setStatus___block_invoke;
      v9[3] = &unk_1E5DD0328;
      v9[4] = self;
      id v10 = v4;
      [(PXMockCPLStatusProvider *)self performChanges:v9];

      goto LABEL_8;
    }
  }
  v8 = PLUserStatusGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v12 = self;
    __int16 v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEBUG, "%@ Suppressing update that resulted in no change: %@", buf, 0x16u);
  }

LABEL_8:
}

uint64_t __37__PXMockCPLStatusProvider_setStatus___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), *(id *)(a1 + 40));
  v2 = PLUserStatusGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 104);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ >> %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return [*(id *)(a1 + 32) signalChange:1];
}

- (double)nextOverrideResumeTimeInterval
{
  v2 = +[PXCPLStatusSettings sharedInstance];
  uint64_t v3 = [v2 resumeOverrideHours];
  double v4 = (double)(3600 * [v3 integerValue]);

  return v4;
}

- (void)dealloc
{
  if (self->_userDefaultsMocks)
  {
    uint64_t v3 = PXSharedUserDefaults();
    [v3 removeObserver:self forKeyPath:@"CPLStatusProviderMock" context:&PXMockCPLStatusProviderUserDefaultsContext];
  }
  v4.receiver = self;
  v4.super_class = (Class)PXMockCPLStatusProvider;
  [(PXMockCPLStatusProvider *)&v4 dealloc];
}

- (PXMockCPLStatusProvider)initWithUserDefaultsMocks:(BOOL)a3
{
  BOOL v3 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXMockCPLStatusProvider;
  objc_super v4 = [(PXMockCPLStatusProvider *)&v14 init];
  v5 = v4;
  if (v4) {
    BOOL v6 = !v3;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    v4->_userDefaultsMocks = 1;
    uint64_t v7 = +[PXMockCPLStatusProvider _currentMockedStatus];
    status = v5->_status;
    v5->_status = v7;
    uint64_t v9 = v7;

    uint64_t v10 = PXSharedUserDefaults();
    [v10 addObserver:v5 forKeyPath:@"CPLStatusProviderMock" options:0 context:&PXMockCPLStatusProviderUserDefaultsContext];

    int v11 = +[PXCPLStatusSettings sharedInstance];
    [v11 addDeferredKeyObserver:v5];

    id v12 = +[PXRootSettings sharedInstance];

    [v12 addDeferredKeyObserver:v5];
  }
  return v5;
}

- (PXMockCPLStatusProvider)init
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXMockCPLStatusProvider.m", 39, @"%s is not available as initializer", "-[PXMockCPLStatusProvider init]");

  abort();
}

+ (id)_currentMockedStatus
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = PXSharedUserDefaults();
  objc_super v4 = [v3 objectForKey:@"CPLStatusProviderMock"];

  if (!v4)
  {
LABEL_13:
    v5 = 0;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_10;
  }
  v5 = +[PXCPLStatus statusWithStringRepresentation:v4];
  BOOL v6 = +[PXCPLStatusSettings sharedInstance];
  uint64_t v7 = [v6 shouldHideMockStatusWarning];
  char v8 = [v7 BOOLValue];

  uint64_t v9 = +[PXRootSettings sharedInstance];
  int v10 = [v9 canShowInternalUI];

  if ((v8 & 1) == 0 && v10)
  {
    [v5 setIsMockStatus:1];
    if (v5) {
      goto LABEL_14;
    }
    goto LABEL_10;
  }
  int v11 = PLUserStatusGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543362;
    id v15 = a1;
    _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Hiding the mock status warning", (uint8_t *)&v14, 0xCu);
  }

  if (!v5)
  {
LABEL_10:
    id v12 = PLUserStatusGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138543618;
      id v15 = a1;
      __int16 v16 = 2114;
      v17 = v4;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Unrecognized mock: \"%{public}@\")", (uint8_t *)&v14, 0x16u);
    }

    goto LABEL_13;
  }
LABEL_14:

  return v5;
}

+ (id)userDefaultsMockStatusProvider
{
  v2 = (void *)[objc_alloc((Class)a1) initWithUserDefaultsMocks:1];
  return v2;
}

+ (id)mockStatusProvider
{
  v2 = (void *)[objc_alloc((Class)a1) initWithUserDefaultsMocks:0];
  return v2;
}

@end