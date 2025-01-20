@interface SFMediaCaptureStatusBarManager
- (BOOL)_hasStatusBarOverride;
- (BOOL)isRecording;
- (BOOL)statusBarCoordinator:(id)a3 receivedTapWithContext:(id)a4 completionBlock:(id)a5;
- (NSString)simplifiedURLString;
- (NSString)statusString;
- (SFMediaRecordingDocument)_recordingDocument;
- (unint64_t)overrideStyleForAudioOnly:(BOOL)a3;
- (void)_acquireStatusBarOverride;
- (void)_acquireStatusBarOverrideWithAudioOnly:(BOOL)a3;
- (void)_cleanUpStatusBarOverride;
- (void)_didAcquireStatusBarOverrideSuccessfully:(BOOL)a3;
- (void)_didInvalidateStatusBarOverride;
- (void)_releaseStatusBarOverride;
- (void)cancelStatusBarOverride;
- (void)recordingDocumentDidBeginMediaCapture:(id)a3 audioOnly:(BOOL)a4;
- (void)recordingDocumentDidEndMediaCapture:(id)a3;
- (void)setRecordingDocument:(id)a3;
- (void)statusBarCoordinator:(id)a3 invalidatedRegistrationWithError:(id)a4;
@end

@implementation SFMediaCaptureStatusBarManager

- (SFMediaRecordingDocument)_recordingDocument
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recordingDocument);

  return (SFMediaRecordingDocument *)WeakRetained;
}

- (void)setRecordingDocument:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recordingDocument);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_recordingDocument, obj);
    v5 = obj;
    if (!obj)
    {
      statusBarStyleOverride = self->_statusBarStyleOverride;
      self->_statusBarStyleOverride = 0;

      coordinator = self->_coordinator;
      self->_coordinator = 0;

      v5 = 0;
    }
  }
}

- (BOOL)isRecording
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recordingDocument);
  BOOL v3 = WeakRetained != 0;

  return v3;
}

- (void)recordingDocumentDidBeginMediaCapture:(id)a3 audioOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(SFMediaCaptureStatusBarManager *)self setRecordingDocument:v6];
  int v7 = [v6 canOverrideStatusBar];

  if (v7)
  {
    [(SFMediaCaptureStatusBarManager *)self _acquireStatusBarOverrideWithAudioOnly:v4];
  }
}

- (void)recordingDocumentDidEndMediaCapture:(id)a3
{
  if (self->_hasStatusBarOverride) {
    [(SFMediaCaptureStatusBarManager *)self _releaseStatusBarOverride];
  }

  [(SFMediaCaptureStatusBarManager *)self setRecordingDocument:0];
}

- (void)cancelStatusBarOverride
{
  if (self->_hasStatusBarOverride) {
    [(SFMediaCaptureStatusBarManager *)self _releaseStatusBarOverride];
  }

  [(SFMediaCaptureStatusBarManager *)self _cleanUpStatusBarOverride];
}

- (unint64_t)overrideStyleForAudioOnly:(BOOL)a3
{
  if (a3) {
    return 0x1000000;
  }
  else {
    return 0x20000;
  }
}

- (void)_acquireStatusBarOverride
{
}

- (void)_acquireStatusBarOverrideWithAudioOnly:(BOOL)a3
{
  if (!self->_statusBarStyleOverride)
  {
    BOOL v4 = a3;
    objc_initWeak(&location, self);
    unint64_t v5 = [(SFMediaCaptureStatusBarManager *)self overrideStyleForAudioOnly:v4];
    id v6 = (void *)MEMORY[0x1E4FA6C10];
    int v7 = [MEMORY[0x1E4F28F80] processInfo];
    objc_msgSend(v6, "assertionWithStatusBarStyleOverrides:forPID:exclusive:showsWhenForeground:", v5, objc_msgSend(v7, "processIdentifier"), 1, 1);
    v8 = (SBSStatusBarStyleOverridesAssertion *)objc_claimAutoreleasedReturnValue();
    statusBarStyleOverride = self->_statusBarStyleOverride;
    self->_statusBarStyleOverride = v8;

    v10 = (SBSStatusBarStyleOverridesCoordinator *)objc_alloc_init(MEMORY[0x1E4FA6C18]);
    coordinator = self->_coordinator;
    self->_coordinator = v10;

    [(SBSStatusBarStyleOverridesCoordinator *)self->_coordinator setDelegate:self];
    v12 = self->_coordinator;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __73__SFMediaCaptureStatusBarManager__acquireStatusBarOverrideWithAudioOnly___block_invoke;
    v17[3] = &unk_1E54EDC48;
    objc_copyWeak(&v18, &location);
    [(SBSStatusBarStyleOverridesCoordinator *)v12 setRegisteredStyleOverrides:v5 reply:v17];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  v13 = [(SFMediaCaptureStatusBarManager *)self statusString];
  [(SBSStatusBarStyleOverridesAssertion *)self->_statusBarStyleOverride setStatusString:v13];

  v14 = self->_statusBarStyleOverride;
  v15[4] = self;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __73__SFMediaCaptureStatusBarManager__acquireStatusBarOverrideWithAudioOnly___block_invoke_3;
  v16[3] = &unk_1E54E9998;
  v16[4] = self;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__SFMediaCaptureStatusBarManager__acquireStatusBarOverrideWithAudioOnly___block_invoke_2;
  v15[3] = &unk_1E54E9858;
  [(SBSStatusBarStyleOverridesAssertion *)v14 acquireWithHandler:v16 invalidationHandler:v15];
}

void __73__SFMediaCaptureStatusBarManager__acquireStatusBarOverrideWithAudioOnly___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = WBS_LOG_CHANNEL_PREFIXMediaCapture();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __73__SFMediaCaptureStatusBarManager__acquireStatusBarOverrideWithAudioOnly___block_invoke_cold_1(v4, v3);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v6 = WeakRetained;
    if (WeakRetained)
    {
      if (WeakRetained[24]) {
        [WeakRetained _releaseStatusBarOverride];
      }
      [v6 _didInvalidateStatusBarOverride];
    }
  }
}

uint64_t __73__SFMediaCaptureStatusBarManager__acquireStatusBarOverrideWithAudioOnly___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _didAcquireStatusBarOverrideSuccessfully:a2];
}

uint64_t __73__SFMediaCaptureStatusBarManager__acquireStatusBarOverrideWithAudioOnly___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didInvalidateStatusBarOverride];
}

- (NSString)simplifiedURLString
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recordingDocument);
  id v3 = [WeakRetained URLString];
  BOOL v4 = objc_msgSend(v3, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 511, 1, 0);

  return (NSString *)v4;
}

- (void)_releaseStatusBarOverride
{
  self->_hasStatusBarOverride = 0;
}

- (void)_didAcquireStatusBarOverrideSuccessfully:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = WBS_LOG_CHANNEL_PREFIXMediaCapture();
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_18C354000, v6, OS_LOG_TYPE_DEFAULT, "Successfully acquired status bar override", v8, 2u);
    }
    self->_hasStatusBarOverride = 1;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SFMediaCaptureStatusBarManager _didAcquireStatusBarOverrideSuccessfully:](v6);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_recordingDocument);
    [WeakRetained muteMediaCapture];

    [(SFMediaCaptureStatusBarManager *)self setRecordingDocument:0];
  }
}

- (void)_didInvalidateStatusBarOverride
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18C354000, log, OS_LOG_TYPE_ERROR, "Status bar override was invalidated", v1, 2u);
}

- (void)_cleanUpStatusBarOverride
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recordingDocument);
  [WeakRetained muteMediaCapture];

  [(SFMediaCaptureStatusBarManager *)self setRecordingDocument:0];
  self->_hasStatusBarOverride = 0;
}

- (BOOL)statusBarCoordinator:(id)a3 receivedTapWithContext:(id)a4 completionBlock:(id)a5
{
  id v6 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recordingDocument);
  [(SFMediaCaptureStatusBarManager *)self activateApp];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __94__SFMediaCaptureStatusBarManager_statusBarCoordinator_receivedTapWithContext_completionBlock___block_invoke;
  v11[3] = &unk_1E54E9D50;
  id v12 = WeakRetained;
  id v13 = v6;
  id v8 = v6;
  id v9 = WeakRetained;
  dispatch_async(MEMORY[0x1E4F14428], v11);

  return 1;
}

uint64_t __94__SFMediaCaptureStatusBarManager_statusBarCoordinator_receivedTapWithContext_completionBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) statusBarIndicatorTappedWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)statusBarCoordinator:(id)a3 invalidatedRegistrationWithError:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recordingDocument);
  int v7 = WBS_LOG_CHANNEL_PREFIXMediaCapture();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = objc_msgSend(v5, "safari_privacyPreservingDescription");
    int v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_18C354000, v8, OS_LOG_TYPE_DEFAULT, "Status bar coordinator invalidated: %{public}@", (uint8_t *)&v10, 0xCu);
  }
  if (WeakRetained)
  {
    if (self->_hasStatusBarOverride) {
      [(SFMediaCaptureStatusBarManager *)self _releaseStatusBarOverride];
    }
    [(SFMediaCaptureStatusBarManager *)self _didInvalidateStatusBarOverride];
  }
}

- (NSString)statusString
{
  return self->_statusString;
}

- (BOOL)_hasStatusBarOverride
{
  return self->_hasStatusBarOverride;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_recordingDocument);
  objc_storeStrong((id *)&self->_statusString, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_statusBarStyleOverride, 0);
}

void __73__SFMediaCaptureStatusBarManager__acquireStatusBarOverrideWithAudioOnly___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a1;
  BOOL v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_18C354000, v3, OS_LOG_TYPE_ERROR, "Could not register tap handler for status bar override: %{public}@", (uint8_t *)&v5, 0xCu);
}

- (void)_didAcquireStatusBarOverrideSuccessfully:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18C354000, log, OS_LOG_TYPE_ERROR, "Unable to acquire status bar override", v1, 2u);
}

@end