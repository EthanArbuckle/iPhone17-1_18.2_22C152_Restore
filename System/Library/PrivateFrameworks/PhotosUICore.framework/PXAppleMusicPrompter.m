@interface PXAppleMusicPrompter
+ (void)showPromptsIfNeededWithCompletion:(id)a3;
- (PXAppleMusicPrompter)initWithCompletion:(id)a3;
- (PXAppleMusicStatusProvider)appleMusicStatusProvider;
- (id)completion;
- (void)_handleAppleMusicPlaybackStatus:(int64_t)a3 error:(id)a4;
- (void)_handleTCCAccessResult:(unsigned __int8)a3;
- (void)_promptingFinished;
- (void)_requestAppleMusicPlaybackStatus;
- (void)_requestAppleMusicTCCAccessIfNeeded;
- (void)_start;
@end

@implementation PXAppleMusicPrompter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleMusicStatusProvider, 0);
  objc_storeStrong(&self->_completion, 0);
}

- (PXAppleMusicStatusProvider)appleMusicStatusProvider
{
  return self->_appleMusicStatusProvider;
}

- (id)completion
{
  return self->_completion;
}

- (void)_promptingFinished
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAppleMusicPrompter.m", 97, @"%s must be called on the main thread", "-[PXAppleMusicPrompter _promptingFinished]");
  }
  v6 = [(PXAppleMusicPrompter *)self completion];
  if (v6) {
    v6[2]();
  }
  v4 = (void *)_prompter;
  _prompter = 0;
}

- (void)_handleAppleMusicPlaybackStatus:(int64_t)a3 error:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v7 = (__CFString *)a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAppleMusicPrompter.m", 87, @"%s must be called on the main thread", "-[PXAppleMusicPrompter _handleAppleMusicPlaybackStatus:error:]");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(a3 - 1) > 2) {
      v8 = @"Unknown";
    }
    else {
      v8 = off_1E5DAEAE8[a3 - 1];
    }
    v9 = v8;
    *(_DWORD *)buf = 138412290;
    v12 = v9;
    _os_log_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PXAppleMusicPrompter] Got Apple Music Playback Status: %@", buf, 0xCu);
  }
  if (v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v7;
    _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[PXAppleMusicPrompter] Got Apple Music Playback Status Error: %@", buf, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PXAppleMusicPrompter] Because Apple Music playback status is not enabled, no further prompting is needed.", buf, 2u);
  }
  [(PXAppleMusicPrompter *)self _promptingFinished];
}

- (void)_requestAppleMusicPlaybackStatus
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PXAppleMusicPrompter] Checking Apple Music subscription status…", buf, 2u);
  }
  appleMusicStatusProvider = self->_appleMusicStatusProvider;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__PXAppleMusicPrompter__requestAppleMusicPlaybackStatus__block_invoke;
  v4[3] = &unk_1E5DAEB30;
  v4[4] = self;
  [(PXAppleMusicStatusProvider *)appleMusicStatusProvider requestStatusForCapability:1 handler:v4];
}

void __56__PXAppleMusicPrompter__requestAppleMusicPlaybackStatus__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  px_dispatch_on_main_queue();
}

uint64_t __56__PXAppleMusicPrompter__requestAppleMusicPlaybackStatus__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleAppleMusicPlaybackStatus:*(void *)(a1 + 48) error:*(void *)(a1 + 40)];
}

- (void)_handleTCCAccessResult:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAppleMusicPrompter.m", 67, @"%s must be called on the main thread", "-[PXAppleMusicPrompter _handleTCCAccessResult:]");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    v6 = @"YES";
    if (!v3) {
      v6 = @"NO";
    }
    v7 = v6;
    *(_DWORD *)buf = 138412290;
    v10 = v7;
    _os_log_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PXAppleMusicPrompter] Received Media Library TCC access request result: %@", buf, 0xCu);
  }
  if (v3)
  {
    [(PXAppleMusicPrompter *)self _requestAppleMusicPlaybackStatus];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PXAppleMusicPrompter] Because TCC access is not granted, no further prompting is needed.", buf, 2u);
    }
    [(PXAppleMusicPrompter *)self _promptingFinished];
  }
}

- (void)_requestAppleMusicTCCAccessIfNeeded
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAppleMusicPrompter.m", 57, @"%s must be called on the main thread", "-[PXAppleMusicPrompter _requestAppleMusicTCCAccessIfNeeded]");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PXAppleMusicPrompter] Checking Media Library TCC Access…", buf, 2u);
  }
  TCCAccessRequest();
}

void __59__PXAppleMusicPrompter__requestAppleMusicTCCAccessIfNeeded__block_invoke()
{
}

uint64_t __59__PXAppleMusicPrompter__requestAppleMusicTCCAccessIfNeeded__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleTCCAccessResult:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_start
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAppleMusicPrompter.m", 52, @"%s must be called on the main thread", "-[PXAppleMusicPrompter _start]");
  }
  [(PXAppleMusicPrompter *)self _requestAppleMusicTCCAccessIfNeeded];
}

- (PXAppleMusicPrompter)initWithCompletion:(id)a3
{
  if ((objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3) & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAppleMusicPrompter.m", 43, @"%s must be called on the main thread", "-[PXAppleMusicPrompter initWithCompletion:]");
  }
  v10.receiver = self;
  v10.super_class = (Class)PXAppleMusicPrompter;
  v5 = [(PXAppleMusicPrompter *)&v10 init];
  if (v5)
  {
    v6 = objc_alloc_init(PXDefaultAppleMusicStatusProvider);
    appleMusicStatusProvider = v5->_appleMusicStatusProvider;
    v5->_appleMusicStatusProvider = (PXAppleMusicStatusProvider *)v6;
  }
  return v5;
}

+ (void)showPromptsIfNeededWithCompletion:(id)a3
{
  id v9 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXAppleMusicPrompter.m", 31, @"%s must be called on the main thread", "+[PXAppleMusicPrompter showPromptsIfNeededWithCompletion:]");
  }
  if (_prompter)
  {
    v5 = v9;
    if (!v9) {
      goto LABEL_8;
    }
    (*((void (**)(id))v9 + 2))(v9);
  }
  else
  {
    v6 = [[PXAppleMusicPrompter alloc] initWithCompletion:v9];
    v7 = (void *)_prompter;
    _prompter = (uint64_t)v6;

    [(id)_prompter _start];
  }
  v5 = v9;
LABEL_8:
}

@end