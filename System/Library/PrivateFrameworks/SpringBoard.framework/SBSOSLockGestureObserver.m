@interface SBSOSLockGestureObserver
- (BOOL)isGestureLoggingEnabled;
- (BOOL)isSOSEnabled;
- (SBPressSequenceObserver)sosLockPressSequenceObserver;
- (SBSOSLockGestureObserver)init;
- (SBSOSLockGestureObserver)initWithConfiguration:(int64_t)a3;
- (SBSOSLockGestureObserverDelegate)delegate;
- (double)_intervalThatSucceeds;
- (double)_watchdogInterval;
- (id)_validator;
- (int64_t)configuration;
- (int64_t)triggerMechanism;
- (unint64_t)_numberOfPressesThatActivate;
- (unint64_t)_numberOfPressesThatTrigger;
- (void)_configure;
- (void)_configureSettings;
- (void)_noteTriggerActionRecievedResponse;
- (void)_noteTriggerDidBecomeActive;
- (void)_noteTriggerDidBecomeInactive;
- (void)_setRecognizer:(id)a3;
- (void)noteDidBeginSOSWithUUID:(id)a3;
- (void)pressSequenceRecognizer:(id)a3 didBeginPressDownAtIndex:(unint64_t)a4;
- (void)pressSequenceRecognizerDidCompleteSequence:(id)a3;
- (void)registerPressDownWithTimestamp:(double)a3;
- (void)registerPressUpWithTimestamp:(double)a3;
- (void)resetWithNewConfiguration:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setGestureLoggingEnabled:(BOOL)a3;
- (void)setSOSEnabled:(BOOL)a3;
- (void)setSosLockPressSequenceObserver:(id)a3;
@end

@implementation SBSOSLockGestureObserver

- (SBSOSLockGestureObserver)init
{
  return [(SBSOSLockGestureObserver *)self initWithConfiguration:1];
}

- (SBSOSLockGestureObserver)initWithConfiguration:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBSOSLockGestureObserver;
  v4 = [(SBSOSLockGestureObserver *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_configuration = a3;
    [(SBSOSLockGestureObserver *)v4 _configure];
    v6 = [[SBPressSequenceObserver alloc] initWithPressName:@"Lock"];
    sosLockPressSequenceObserver = v5->_sosLockPressSequenceObserver;
    v5->_sosLockPressSequenceObserver = v6;
  }
  return v5;
}

- (void)setSOSEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  self->_sosEnabled = a3;
  v4 = SBLogButtonsCombo();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    int v8 = 138543618;
    objc_super v9 = v6;
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - Set SOS Lock Gesture Enabled: %{BOOL}u", (uint8_t *)&v8, 0x12u);
  }
  if (v3)
  {
    v7 = +[SBSOSEventHandler sharedInstance];
    [v7 run];
  }
}

- (int64_t)triggerMechanism
{
  if (self->_configuration == 2) {
    return 1;
  }
  else {
    return 2;
  }
}

- (void)registerPressDownWithTimestamp:(double)a3
{
  if ([(SBSOSLockGestureObserver *)self isSOSEnabled])
  {
    [(SBPressSequenceRecognizer *)self->_recognizer registerPressDownWithTimestamp:a3];
    v5 = SBLogButtonsCombo();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[SBSOSLockGestureObserver registerPressDownWithTimestamp:]();
    }
  }
  if ([(SBSOSLockGestureObserver *)self isGestureLoggingEnabled])
  {
    v6 = [(SBPressSequenceObserver *)self->_sosLockPressSequenceObserver pressCollector];
    [v6 registerPressDownWithTimeStamp:a3];
  }
}

- (void)registerPressUpWithTimestamp:(double)a3
{
  if ([(SBSOSLockGestureObserver *)self isSOSEnabled])
  {
    [(SBPressSequenceRecognizer *)self->_recognizer registerPressUpWithTimestamp:a3];
    v5 = SBLogButtonsCombo();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[SBSOSLockGestureObserver registerPressUpWithTimestamp:]();
    }
  }
  if ([(SBSOSLockGestureObserver *)self isGestureLoggingEnabled])
  {
    v6 = [(SBPressSequenceObserver *)self->_sosLockPressSequenceObserver pressCollector];
    [v6 registerPressUpWithTimeStamp:a3];
  }
}

- (void)resetWithNewConfiguration:(int64_t)a3
{
  self->_configuration = a3;
  [(SBSOSLockGestureObserver *)self _configure];
  recognizer = self->_recognizer;
  validator = self->_validator;
  unint64_t v6 = [(SBPressSequenceSettings *)self->_settings numberOfPresses];
  [(SBPressSequenceRecognizer *)recognizer resetWithNewValidator:validator numberOfPresses:v6];
}

- (void)noteDidBeginSOSWithUUID:(id)a3
{
}

- (void)pressSequenceRecognizerDidCompleteSequence:(id)a3
{
  id v4 = a3;
  if (!self->_triggerAction)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F4F668]);
    [(SBSOSLockGestureObserver *)self _watchdogInterval];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __71__SBSOSLockGestureObserver_pressSequenceRecognizerDidCompleteSequence___block_invoke;
    v12[3] = &unk_1E6B066F0;
    v12[4] = self;
    unint64_t v6 = (BSAction *)objc_msgSend(v5, "initWithInfo:timeout:forResponseOnQueue:withHandler:", 0, MEMORY[0x1E4F14428], v12);
    triggerAction = self->_triggerAction;
    self->_triggerAction = v6;

    objc_initWeak(&location, self->_triggerAction);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __71__SBSOSLockGestureObserver_pressSequenceRecognizerDidCompleteSequence___block_invoke_2;
    v9[3] = &unk_1E6AF80B8;
    objc_copyWeak(&v10, &location);
    [WeakRetained sosLockDidTriggerSOS:self completion:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

uint64_t __71__SBSOSLockGestureObserver_pressSequenceRecognizerDidCompleteSequence___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _noteTriggerActionRecievedResponse];
}

void __71__SBSOSLockGestureObserver_pressSequenceRecognizerDidCompleteSequence___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [MEMORY[0x1E4F4F678] response];
  [WeakRetained sendResponse:v1];
}

- (void)pressSequenceRecognizer:(id)a3 didBeginPressDownAtIndex:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    self->_lastKnownActiveState = 1;
    id v7 = v6;
    [(SBSOSLockGestureObserver *)self _noteTriggerDidBecomeActive];
LABEL_6:
    id v6 = v7;
    goto LABEL_7;
  }
  if (a4 <= 1 && self->_lastKnownActiveState)
  {
    self->_lastKnownActiveState = 0;
    id v7 = v6;
    [(SBSOSLockGestureObserver *)self _noteTriggerDidBecomeInactive];
    goto LABEL_6;
  }
LABEL_7:
}

- (void)_noteTriggerActionRecievedResponse
{
  triggerAction = self->_triggerAction;
  self->_triggerAction = 0;

  [(SBSOSLockGestureObserver *)self _noteTriggerDidBecomeInactive];
}

- (void)_noteTriggerDidBecomeActive
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained sosLockTriggerDidBecomeActive:self];
}

- (void)_noteTriggerDidBecomeInactive
{
  if (!self->_triggerAction)
  {
    self->_lastKnownActiveState = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained sosLockTriggerDidBecomeInactive:self];
  }
}

- (void)_configure
{
  BOOL v3 = objc_alloc_init(SBPressSequenceSettings);
  settings = self->_settings;
  self->_settings = v3;

  [(SBSOSLockGestureObserver *)self _configureSettings];
  id v5 = [[SBPressSequenceValidator alloc] initWithSettings:self->_settings];
  validator = self->_validator;
  self->_validator = v5;

  id v7 = [[SBPressSequenceRecognizer alloc] initWithValidator:self->_validator numberOfPresses:[(SBPressSequenceSettings *)self->_settings numberOfPresses]];
  recognizer = self->_recognizer;
  self->_recognizer = v7;

  objc_super v9 = self->_recognizer;
  [(SBPressSequenceRecognizer *)v9 setDelegate:self];
}

- (void)_configureSettings
{
  _AXSLockClickDownPressDurationScaleFactor();
  float v4 = v3;
  _AXSLockClickVarianceScaleFactor();
  float v6 = v5;
  int64_t configuration = self->_configuration;
  if (configuration == 2)
  {
    settings = self->_settings;
    p_settings = &self->_settings;
    [(SBPressSequenceSettings *)settings setNumberOfPresses:3];
    double v14 = v4 * 0.35;
    [(SBPressSequenceSettings *)*p_settings setMaxDefaultPressDownDuration:v14];
    [(SBPressSequenceSettings *)*p_settings setMaxDefaultPressUpDuration:v14];
    [(SBPressSequenceSettings *)*p_settings setMaxDownToDownDuration:v14];
    [(SBPressSequenceSettings *)*p_settings setIndexOfPressDownToUseForVarianceAndGrowth:1];
    [(SBPressSequenceSettings *)*p_settings setNumberOfPressDownGrowthTerms:1];
    [(SBPressSequenceSettings *)*p_settings setIndexOfPressUpToUseForVarianceAndGrowth:0];
    BOOL v11 = *p_settings;
    uint64_t v12 = 0;
  }
  else
  {
    if (configuration != 1) {
      return;
    }
    objc_super v9 = self->_settings;
    p_settings = &self->_settings;
    [(SBPressSequenceSettings *)v9 setNumberOfPresses:5];
    double v10 = v4;
    [(SBPressSequenceSettings *)*p_settings setMaxDefaultPressDownDuration:v10 * 0.5];
    [(SBPressSequenceSettings *)*p_settings setMaxDefaultPressUpDuration:v10 * 0.35];
    [(SBPressSequenceSettings *)*p_settings setMaxDownToDownDuration:-1.0];
    [(SBPressSequenceSettings *)*p_settings setIndexOfPressDownToUseForVarianceAndGrowth:1];
    [(SBPressSequenceSettings *)*p_settings setNumberOfPressDownGrowthTerms:1];
    [(SBPressSequenceSettings *)*p_settings setIndexOfPressUpToUseForVarianceAndGrowth:0];
    BOOL v11 = *p_settings;
    uint64_t v12 = 1;
  }
  [(SBPressSequenceSettings *)v11 setNumberOfPressUpGrowthTerms:v12];
  double v15 = v6 * 0.1;
  [(SBPressSequenceSettings *)*p_settings setPressDownVariance:v15];
  v16 = *p_settings;
  [(SBPressSequenceSettings *)v16 setPressUpVariance:v15];
}

- (void)_setRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_recognizer, a3);
  id v5 = a3;
  [(SBPressSequenceRecognizer *)self->_recognizer setDelegate:self];
}

- (id)_validator
{
  return self->_validator;
}

- (unint64_t)_numberOfPressesThatTrigger
{
  return [(SBPressSequenceSettings *)self->_settings numberOfPresses];
}

- (unint64_t)_numberOfPressesThatActivate
{
  return 3;
}

- (double)_intervalThatSucceeds
{
  [(SBPressSequenceValidator *)self->_validator _intervalThatSucceeds];
  return result;
}

- (double)_watchdogInterval
{
  return 4.5;
}

- (SBPressSequenceObserver)sosLockPressSequenceObserver
{
  return self->_sosLockPressSequenceObserver;
}

- (void)setSosLockPressSequenceObserver:(id)a3
{
}

- (SBSOSLockGestureObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSOSLockGestureObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)configuration
{
  return self->_configuration;
}

- (BOOL)isGestureLoggingEnabled
{
  return self->_gestureLoggingEnabled;
}

- (void)setGestureLoggingEnabled:(BOOL)a3
{
  self->_gestureLoggingEnabled = a3;
}

- (BOOL)isSOSEnabled
{
  return self->_sosEnabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sosLockPressSequenceObserver, 0);
  objc_storeStrong((id *)&self->_triggerAction, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_validator, 0);
  objc_storeStrong((id *)&self->_recognizer, 0);
}

- (void)registerPressDownWithTimestamp:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v2, v3, "%{public}@ - Registered SOS Lock Press Down.", v4, v5, v6, v7, 2u);
}

- (void)registerPressUpWithTimestamp:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v2, v3, "%{public}@ - Registered SOS Lock Press Up.", v4, v5, v6, v7, 2u);
}

@end