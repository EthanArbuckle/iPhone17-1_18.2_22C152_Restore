@interface SBUISecureLockView
- (BOOL)transitionToState:(int64_t)a3;
- (SBUISecureLockView)initWithType:(int64_t)a3;
- (void)_tick:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
@end

@implementation SBUISecureLockView

- (SBUISecureLockView)initWithType:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)SBUISecureLockView;
  v4 = -[SBUISecureLockView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v4)
  {
    if (a3) {
      v5 = @"lock-2x";
    }
    else {
      v5 = @"lock-3x";
    }
    uint64_t v6 = [MEMORY[0x1E4F39C78] secureFlipBookWithType:v5];
    secureFlipBookLayer = v4->_secureFlipBookLayer;
    v4->_secureFlipBookLayer = (CASecureFlipBookLayer *)v6;

    v8 = [(SBUISecureLockView *)v4 layer];
    [v8 addSublayer:v4->_secureFlipBookLayer];

    uint64_t v9 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:v4 selector:sel__tick_];
    displayLink = v4->_displayLink;
    v4->_displayLink = (CADisplayLink *)v9;

    v11 = v4->_displayLink;
    v12 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [(CADisplayLink *)v11 addToRunLoop:v12 forMode:*MEMORY[0x1E4F1C4B0]];
  }
  return v4;
}

- (void)dealloc
{
  [(CADisplayLink *)self->_displayLink invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBUISecureLockView;
  [(SBUISecureLockView *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBUISecureLockView;
  [(SBUISecureLockView *)&v3 layoutSubviews];
  [(SBUISecureLockView *)self bounds];
  -[CASecureFlipBookLayer setFrame:](self->_secureFlipBookLayer, "setFrame:");
}

- (BOOL)transitionToState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    if ((unint64_t)(a3 - 1) > 2) {
      v5 = @"Locked State";
    }
    else {
      v5 = off_1E5CCE170[a3 - 1];
    }
    uint64_t v6 = [(CASecureFlipBookLayer *)self->_secureFlipBookLayer currentState];
    if ([(CASecureFlipBookLayer *)self->_secureFlipBookLayer canTransitionToState:v5])
    {
      if ([(CASecureFlipBookLayer *)self->_secureFlipBookLayer transitionToState:v5])
      {
        BOOL v3 = 1;
LABEL_14:

        return v3;
      }
      v7 = SBLogLockScreenBiometricFaceIDCoaching();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[SBUISecureLockView transitionToState:]((uint64_t)v5, v7);
      }
    }
    else
    {
      v7 = SBLogLockScreenBiometricFaceIDCoaching();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        [(SBUISecureLockView *)(uint64_t)v6 transitionToState:v7];
      }
    }

    BOOL v3 = 0;
    goto LABEL_14;
  }
  return 0;
}

- (void)_tick:(id)a3
{
  secureFlipBookLayer = self->_secureFlipBookLayer;
  [(CADisplayLink *)self->_displayLink targetTimestamp];
  double v6 = v5;
  [(CADisplayLink *)self->_displayLink timestamp];
  double v8 = v6 - v7;
  [(CASecureFlipBookLayer *)secureFlipBookLayer tick:v8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_secureFlipBookLayer, 0);
}

- (void)transitionToState:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A7607000, a2, OS_LOG_TYPE_ERROR, "[Secure Lock Indicator] Couldn't transition to state: %@", (uint8_t *)&v2, 0xCu);
}

- (void)transitionToState:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1A7607000, log, OS_LOG_TYPE_ERROR, "[Secure Lock Indicator] Cannot transition from state: %@ to state: %@", (uint8_t *)&v3, 0x16u);
}

@end