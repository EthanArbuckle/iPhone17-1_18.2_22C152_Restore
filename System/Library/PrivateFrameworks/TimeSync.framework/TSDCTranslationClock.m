@interface TSDCTranslationClock
- (TSDCTranslationClock)initWithClockIdentifier:(unint64_t)a3;
- (TSXTranslationClock)translationClock;
- (_TSF_TSDKernelClock)translationKernelClock;
- (void)dealloc;
- (void)didChangeClockMasterForClock:(id)a3;
- (void)didChangeLockStateTo:(int)a3 forClock:(id)a4;
- (void)getInitialSyncInfo;
- (void)updateTimeSyncTime:(unint64_t)a3 timeSyncInterval:(unint64_t)a4 domainTime:(unint64_t)a5 domainInterval:(unint64_t)a6;
@end

@implementation TSDCTranslationClock

- (TSDCTranslationClock)initWithClockIdentifier:(unint64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v15 = (const char *)a3;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSDCTranslationClock (0x%016llx) initWithClockIdentifier", buf, 0xCu);
  }
  v13.receiver = self;
  v13.super_class = (Class)TSDCTranslationClock;
  v5 = [(TSDCTranslationClock *)&v13 init];
  if (v5)
  {
    v6 = [[_TSF_TSDKernelClock alloc] initWithClockIdentifier:a3];
    if (v6)
    {
      v7 = [[TSXTranslationClock alloc] initWithClockIdentifier:a3];
      translationClock = v5->_translationClock;
      v5->_translationClock = v7;

      objc_storeStrong((id *)&v5->_translationKernelClock, v6);
      [(_TSF_TSDKernelClock *)v5->_translationKernelClock addClient:v5];
      v9 = +[_TSF_TSDClockSyncManager sharedClockSyncManager];
      uint64_t v10 = [v9 clockSyncForClockIdentifier:a3 pid:0];
      clockSync = v5->_clockSync;
      v5->_clockSync = (_TSF_TSDClockSync *)v10;

      [(_TSF_TSDClockSync *)v5->_clockSync addUpdateClient:v5];
      [(TSDCTranslationClock *)v5 getInitialSyncInfo];
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v15 = "kernelClock";
        __int16 v16 = 2048;
        uint64_t v17 = 0;
        __int16 v18 = 2048;
        uint64_t v19 = 0;
        __int16 v20 = 2080;
        v21 = "";
        __int16 v22 = 2080;
        v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSClockManager.mm";
        __int16 v24 = 1024;
        int v25 = 84;
        _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
      }

      v5 = 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  [(_TSF_TSDClockSync *)self->_clockSync removeUpdateClient:self];
  v3 = +[_TSF_TSDClockSyncManager sharedClockSyncManager];
  objc_msgSend(v3, "releaseClockSyncForClockIdentifier:", -[_TSF_TSDKernelClock clockIdentifier](self->_translationKernelClock, "clockIdentifier"));

  [(_TSF_TSDKernelClock *)self->_translationKernelClock removeClient:self];
  v4.receiver = self;
  v4.super_class = (Class)TSDCTranslationClock;
  [(TSDCTranslationClock *)&v4 dealloc];
}

- (void)getInitialSyncInfo
{
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error getting initial sync info \"%s\"", buf, 0xCu);
}

- (void)didChangeClockMasterForClock:(id)a3
{
  id v3 = [(TSDCTranslationClock *)self translationClock];
  [v3 _changedClockMaster];
}

- (void)didChangeLockStateTo:(int)a3 forClock:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = [(TSDCTranslationClock *)self translationClock];
  [v5 _updateLockState:v4];
}

- (void)updateTimeSyncTime:(unint64_t)a3 timeSyncInterval:(unint64_t)a4 domainTime:(unint64_t)a5 domainInterval:(unint64_t)a6
{
}

- (_TSF_TSDKernelClock)translationKernelClock
{
  return self->_translationKernelClock;
}

- (TSXTranslationClock)translationClock
{
  return self->_translationClock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translationClock, 0);
  objc_storeStrong((id *)&self->_translationKernelClock, 0);
  objc_storeStrong((id *)&self->_clockSync, 0);
}

@end