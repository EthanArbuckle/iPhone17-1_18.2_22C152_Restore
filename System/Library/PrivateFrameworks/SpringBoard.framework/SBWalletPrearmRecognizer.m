@interface SBWalletPrearmRecognizer
- (SBWalletPrearmRecognizer)initWithDelegate:(id)a3;
- (double)_computeDoubleTapTimeout;
- (void)_invalidate;
- (void)_invalidateForFailureReason:(unint64_t)a3;
- (void)_invalidateForSuccess;
- (void)dealloc;
- (void)invalidate;
- (void)menuButtonDoublePress;
- (void)menuButtonSinglePress;
- (void)startRecognizing;
@end

@implementation SBWalletPrearmRecognizer

- (SBWalletPrearmRecognizer)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBWalletPrearmRecognizer;
  v5 = [(SBWalletPrearmRecognizer *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(SBWalletPrearmRecognizer *)v5 _computeDoubleTapTimeout];
    v6->_timeout = v7;
    objc_storeWeak((id *)&v6->_delegate, v4);
  }

  return v6;
}

- (void)dealloc
{
  if (!self->_invalidated && self->_timer)
  {
    PKLegacyStockholmLog();
    v3 = SBLogLockScreenMesaWalletPreArm();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "Deallocated while active", buf, 2u);
    }

    [(SBWalletPrearmRecognizer *)self _invalidateForFailureReason:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)SBWalletPrearmRecognizer;
  [(SBWalletPrearmRecognizer *)&v4 dealloc];
}

- (void)startRecognizing
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_invalidated)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"SBWalletPrearmRecognizer.m" lineNumber:59 description:@"Cannot start recognizing an invalidated recognizer."];
  }
  double timeout = self->_timeout;
  PKLegacyStockholmLog();
  v3 = SBLogLockScreenMesaWalletPreArm();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    double v4 = self->_timeout;
    *(_DWORD *)buf = 134217984;
    double v16 = v4;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "Beginning recognition with timeout: %f", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v5 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E4F4F660]), "initWithIdentifier:", @"SBWalletPrearmRecognizer.timer", *(void *)&timeout);
  timer = self->_timer;
  self->_timer = v5;

  double v7 = self->_timer;
  double v8 = self->_timeout;
  id v9 = MEMORY[0x1E4F14428];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__SBWalletPrearmRecognizer_startRecognizing__block_invoke;
  v13[3] = &unk_1E6AF5838;
  objc_copyWeak(&v14, (id *)buf);
  [(BSAbsoluteMachTimer *)v7 scheduleWithFireInterval:MEMORY[0x1E4F14428] leewayInterval:v13 queue:v8 handler:0.0];

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __44__SBWalletPrearmRecognizer_startRecognizing__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateForFailureReason:0];
}

- (void)invalidate
{
  PKLegacyStockholmLog();
  v3 = SBLogLockScreenMesaWalletPreArm();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "Invalidated by caller", v4, 2u);
  }

  [(SBWalletPrearmRecognizer *)self _invalidate];
}

- (void)menuButtonSinglePress
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v5 = self->_timer != 0;
  PKLegacyStockholmLog();
  v3 = SBLogLockScreenMesaWalletPreArm();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    BOOL v4 = self->_timer != 0;
    *(_DWORD *)buf = 67109120;
    BOOL v7 = v4;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "SinglePressReceived (timer active? %d)", buf, 8u);
  }

  if (self->_timer) {
    -[SBWalletPrearmRecognizer _invalidateForFailureReason:](self, "_invalidateForFailureReason:", 1, v5);
  }
}

- (void)menuButtonDoublePress
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v7 = self->_timer != 0;
  PKLegacyStockholmLog();
  v3 = SBLogLockScreenMesaWalletPreArm();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    BOOL v4 = self->_timer != 0;
    *(_DWORD *)buf = 67109120;
    BOOL v9 = v4;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "DoublePressReceived (timer active? %d)", buf, 8u);
  }

  if (self->_timer)
  {
    PKLegacyStockholmLog();
    BOOL v5 = SBLogLockScreenMesaWalletPreArm();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "Recognized", buf, 2u);
    }

    v6 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v7);
    [v6 postNotificationName:@"SBBiometricEventTimestampNotificationPrearmMatch" object:0 userInfo:0];

    [(SBWalletPrearmRecognizer *)self _invalidateForSuccess];
  }
}

- (void)_invalidateForFailureReason:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3) {
    BOOL v5 = @"SinglePress";
  }
  else {
    BOOL v5 = @"Timeout";
  }
  BOOL v9 = v5;
  PKLegacyStockholmLog();
  v6 = SBLogLockScreenMesaWalletPreArm();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    BOOL v7 = v5;
    *(_DWORD *)buf = 138412290;
    v11 = v7;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "Failed for %@", buf, 0xCu);
  }
  [(SBWalletPrearmRecognizer *)self _invalidate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained walletPrearmRecognizer:self didFailToRecognizeForReason:a3];
}

- (void)_invalidateForSuccess
{
  [(SBWalletPrearmRecognizer *)self _invalidate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained walletPrearmRecognizerDidRecognize:self];
}

- (void)_invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    [(BSAbsoluteMachTimer *)self->_timer invalidate];
    timer = self->_timer;
    self->_timer = 0;
  }
}

- (double)_computeDoubleTapTimeout
{
  v2 = (void *)_AXSTripleClickCopyOptions();
  uint64_t v3 = [v2 count];

  if (v3) {
    double v4 = 2.0;
  }
  else {
    double v4 = 1.0;
  }
  _AXSHomeClickSpeed();
  double result = v4 * v5;
  if (result < 0.349999994) {
    return 0.349999994;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end