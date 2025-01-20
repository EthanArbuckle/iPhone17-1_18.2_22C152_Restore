@interface SBSystemStatusStatusBarOverridesArchiver
+ (id)_archiveFileURL;
- (SBSystemStatusStatusBarOverridesArchiver)init;
- (id)_queue_readStatusBarOverridesArchiveRecord;
- (void)_queue_persistUpdatedArchiveRecord:(id)a3;
- (void)_queue_readStatusBarOverridesArchiveRecord;
- (void)_queue_setupObservingAndReconcileInitialState;
- (void)_queue_writeOutArchiveRecord:(id)a3;
- (void)dealloc;
@end

@implementation SBSystemStatusStatusBarOverridesArchiver

+ (id)_archiveFileURL
{
  if (_archiveFileURL___onceToken != -1) {
    dispatch_once(&_archiveFileURL___onceToken, &__block_literal_global_240);
  }
  v2 = (void *)_archiveFileURL_sArchiveURL;
  return v2;
}

void __59__SBSystemStatusStatusBarOverridesArchiver__archiveFileURL__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  SBHomeDirectory();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v1 = [v5 stringByAppendingPathComponent:@"StatusBarOverrides"];
  v2 = [v1 stringByAppendingPathExtension:@"archive"];
  uint64_t v3 = [v0 fileURLWithPath:v2];
  v4 = (void *)_archiveFileURL_sArchiveURL;
  _archiveFileURL_sArchiveURL = v3;
}

- (SBSystemStatusStatusBarOverridesArchiver)init
{
  v16.receiver = self;
  v16.super_class = (Class)SBSystemStatusStatusBarOverridesArchiver;
  uint64_t v3 = [(SBSystemStatusStatusBarOverridesArchiver *)&v16 init];
  if (v3)
  {
    v4 = [(id)SBApp systemStatusServer];
    if (!v4)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, v3, @"SBSystemStatusStatusBarOverridesArchiver.m", 61, @"don't initialize %@ before the server handle exists!", objc_opt_class() object file lineNumber description];
    }
    uint64_t Serial = BSDispatchQueueCreateSerial();
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)Serial;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4FA94F0]) initWithServerHandle:v4];
    overridesDomain = v3->_overridesDomain;
    v3->_overridesDomain = (STStatusBarOverridesStatusDomain *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4FA94F8]) initWithServerHandle:v4];
    overridesPublisher = v3->_overridesPublisher;
    v3->_overridesPublisher = (STStatusBarOverridesStatusDomainPublisher *)v9;

    v11 = v3->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__SBSystemStatusStatusBarOverridesArchiver_init__block_invoke;
    block[3] = &unk_1E6AF4AC0;
    v15 = v3;
    dispatch_async(v11, block);
  }
  return v3;
}

uint64_t __48__SBSystemStatusStatusBarOverridesArchiver_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setupObservingAndReconcileInitialState");
}

- (void)_queue_setupObservingAndReconcileInitialState
{
  BSDispatchQueueAssert();
  overridesDomain = self->_overridesDomain;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __89__SBSystemStatusStatusBarOverridesArchiver__queue_setupObservingAndReconcileInitialState__block_invoke;
  v14[3] = &unk_1E6B06B48;
  v14[4] = self;
  [(STStatusBarOverridesStatusDomain *)overridesDomain observeDataWithBlock:v14];
  v4 = [(STStatusBarOverridesStatusDomain *)self->_overridesDomain data];
  uint64_t v5 = [v4 _sbSystemStatusStatusBarOverridesArchiveRecord];

  uint64_t v6 = [(SBSystemStatusStatusBarOverridesArchiver *)self _queue_readStatusBarOverridesArchiveRecord];
  uint64_t v7 = (void *)v6;
  if (v5 | v6)
  {
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      if (v5)
      {
        [(SBSystemStatusStatusBarOverridesArchiver *)self _queue_writeOutArchiveRecord:v5];
        goto LABEL_14;
      }
      if (!v6) {
        goto LABEL_14;
      }
      objc_storeStrong((id *)&self->_queue_archiveRecord, (id)v6);
      id v9 = v7;
    }
    else
    {
      id v9 = [(id)v6 recordByApplyingRecord:v5];
      [(SBSystemStatusStatusBarOverridesArchiver *)self _queue_writeOutArchiveRecord:v9];
      if (!v9) {
        goto LABEL_14;
      }
    }
    overridesPublisher = self->_overridesPublisher;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __89__SBSystemStatusStatusBarOverridesArchiver__queue_setupObservingAndReconcileInitialState__block_invoke_3;
    v12[3] = &unk_1E6B06B70;
    id v13 = v9;
    id v11 = v9;
    [(STStatusBarOverridesStatusDomainPublisher *)overridesPublisher updateDataWithBlock:v12];
  }
LABEL_14:
}

void __89__SBSystemStatusStatusBarOverridesArchiver__queue_setupObservingAndReconcileInitialState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 _sbSystemStatusStatusBarOverridesArchiveRecord];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 24);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__SBSystemStatusStatusBarOverridesArchiver__queue_setupObservingAndReconcileInitialState__block_invoke_2;
  v7[3] = &unk_1E6AF5290;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __89__SBSystemStatusStatusBarOverridesArchiver__queue_setupObservingAndReconcileInitialState__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_persistUpdatedArchiveRecord:", *(void *)(a1 + 40));
}

uint64_t __89__SBSystemStatusStatusBarOverridesArchiver__queue_setupObservingAndReconcileInitialState__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 _sbApplySystemStatusStatusBarOverridesArchiveRecord:*(void *)(a1 + 32)];
}

- (void)_queue_persistUpdatedArchiveRecord:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssert();
  if (!BSEqualObjects())
  {
    id v6 = SBLogStatusBarish();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v7)
      {
        __int16 v11 = 0;
        id v8 = "Received status bar overrides to persist…";
        id v9 = (uint8_t *)&v11;
LABEL_10:
        _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
      }
    }
    else if (v7)
    {
      __int16 v10 = 0;
      id v8 = "Clearing status bar overrides…";
      id v9 = (uint8_t *)&v10;
      goto LABEL_10;
    }

    [(SBSystemStatusStatusBarOverridesArchiver *)self _queue_writeOutArchiveRecord:v4];
    goto LABEL_12;
  }
  uint64_t v5 = SBLogStatusBarish();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Received duplicate data…", buf, 2u);
  }

LABEL_12:
}

- (void)_queue_writeOutArchiveRecord:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssert();
  if ((BSEqualObjects() & 1) == 0)
  {
    uint64_t v5 = [(id)objc_opt_class() _archiveFileURL];
    if (v4 && ([v4 isEmpty] & 1) == 0)
    {
      id v21 = 0;
      __int16 v10 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v21];
      id v11 = v21;
      v12 = v11;
      if (v10)
      {
        id v20 = v11;
        int v13 = [v10 writeToURL:v5 options:1 error:&v20];
        id v8 = v20;

        v14 = SBLogStatusBarish();
        p_super = v14;
        if (v13)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D85BA000, p_super, OS_LOG_TYPE_DEFAULT, "Saved the status bar overrides archive.", buf, 2u);
          }

          objc_super v16 = (_SBSystemStatusStatusBarOverridesArchiveRecord *)v4;
          p_super = &self->_queue_archiveRecord->super;
          self->_queue_archiveRecord = v16;
        }
        else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = [v10 length];
          v18 = [v8 localizedDescription];
          *(_DWORD *)buf = 134218498;
          uint64_t v23 = v17;
          __int16 v24 = 2112;
          v25 = v5;
          __int16 v26 = 2112;
          v27 = v18;
          _os_log_error_impl(&dword_1D85BA000, p_super, OS_LOG_TYPE_ERROR, "Error writing status bar overrides archive (len=%lu) to %@: %@", buf, 0x20u);
        }
      }
      else
      {
        p_super = SBLogStatusBarish();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
          -[SBSystemStatusStatusBarOverridesArchiver _queue_writeOutArchiveRecord:](v12);
        }
        id v8 = v12;
      }
    }
    else
    {
      id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v19 = 0;
      int v7 = [v6 removeItemAtURL:v5 error:&v19];
      id v8 = v19;

      id v9 = SBLogStatusBarish();
      __int16 v10 = v9;
      if (v7)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Cleared the status bar overrides archive.", buf, 2u);
        }

        __int16 v10 = &self->_queue_archiveRecord->super;
        self->_queue_archiveRecord = 0;
      }
      else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        -[SBSystemStatusStatusBarOverridesArchiver _queue_writeOutArchiveRecord:]((uint64_t)v5, v8);
      }
    }
  }
}

- (id)_queue_readStatusBarOverridesArchiveRecord
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssert();
  v2 = [(id)objc_opt_class() _archiveFileURL];
  id v18 = 0;
  uint64_t v3 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v2 options:1 error:&v18];
  id v4 = v18;
  if (!v3)
  {
    id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    __int16 v10 = [v2 path];
    char v11 = [v9 fileExistsAtPath:v10];

    v12 = SBLogStatusBarish();
    id v8 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        [(SBSystemStatusStatusBarOverridesArchiver *)(uint64_t)v2 _queue_readStatusBarOverridesArchiveRecord];
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = (uint64_t)v2;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Couldn't read archived status bar overrides because none exist at: %@", buf, 0xCu);
    }
    goto LABEL_14;
  }
  id v17 = v4;
  uint64_t v5 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v17];
  id v6 = v17;

  if (v5) {
    goto LABEL_16;
  }
  int v7 = SBLogStatusBarish();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = (uint64_t)v2;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Unable to read status bar overrides archive, Falling back to the legacy format: %@", buf, 0xCu);
  }

  id v16 = v6;
  id v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v16];
  id v4 = v16;

  if (!v8)
  {
    id v8 = SBLogStatusBarish();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = [v3 length];
      v15 = [v4 localizedDescription];
      *(_DWORD *)buf = 134218498;
      uint64_t v20 = v14;
      __int16 v21 = 2112;
      v22 = v2;
      __int16 v23 = 2112;
      __int16 v24 = v15;
      _os_log_error_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_ERROR, "Error unarchiving status bar overrides from data (len=%lu) at %@: %@", buf, 0x20u);
    }
LABEL_14:
    uint64_t v5 = 0;
    goto LABEL_15;
  }
  uint64_t v5 = [[_SBSystemStatusStatusBarOverridesArchiveRecord alloc] initWithStatusBarData:v8 andSuppressedBackgroundActivityIdentifiers:0];
LABEL_15:

  id v6 = v4;
LABEL_16:

  return v5;
}

- (void)dealloc
{
  [(STStatusBarOverridesStatusDomain *)self->_overridesDomain invalidate];
  [(STStatusBarOverridesStatusDomainPublisher *)self->_overridesPublisher invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSystemStatusStatusBarOverridesArchiver;
  [(SBSystemStatusStatusBarOverridesArchiver *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_archiveRecord, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_overridesPublisher, 0);
  objc_storeStrong((id *)&self->_overridesDomain, 0);
}

- (void)_queue_writeOutArchiveRecord:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  v2 = [a2 localizedDescription];
  OUTLINED_FUNCTION_1_22();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v3, v4, "Error clearing status bar overrides archive at %@: %@", v5, v6, v7, v8, v9);
}

- (void)_queue_writeOutArchiveRecord:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "Error archiving status bar overrides archive: %@'\ndata: %@", v4, v5, v6, v7, 2u);
}

- (void)_queue_readStatusBarOverridesArchiveRecord
{
  uint64_t v2 = [a2 localizedDescription];
  OUTLINED_FUNCTION_1_22();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v3, v4, "Error reading status bar overrides data at %@: %@", v5, v6, v7, v8, v9);
}

@end