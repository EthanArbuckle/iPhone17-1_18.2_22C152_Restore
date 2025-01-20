@interface SiriLongPressButtonSource
+ (id)longPressButtonForIdentifier:(int64_t)a3;
+ (id)new;
- (BOOL)_shouldReplaceSpeechInteractionActivityTimestampWithPrewarmTimestamp;
- (BOOL)_sourceSupportsAutomaticConfigurationUpdates;
- (NSMutableArray)lock_activityAssertions;
- (SiriLongPressButtonConfiguration)configuration;
- (SiriLongPressButtonConfigurationUpdateManager)updateManager;
- (SiriLongPressButtonContext)context;
- (SiriLongPressButtonSource)init;
- (SiriLongPressButtonSourceDelegate)delegate;
- (double)_timestampForSpeechInteractionActivityWithTimestamp:(double)a3;
- (double)hintGlowTimeIntervalInMs;
- (double)longPressInterval;
- (id)_deviceIdentifier;
- (id)_initWithButtonIdentifier:(int64_t)a3;
- (id)currentTimeGenerator;
- (id)prepareForActivation;
- (id)prepareForActivationWithTimestamp:(double)a3;
- (id)speechInteractionActivityWithTimestamp:(double)a3;
- (int64_t)buttonIdentifier;
- (int64_t)longPressBehavior;
- (void)configurationUpdateManager:(id)a3 configurationDidUpdateForLongPressSource:(id)a4;
- (void)configureConnection;
- (void)didRecognizeButtonSinglePressUp;
- (void)didRecognizeLongPress;
- (void)didRecognizeLongPressInteraction:(id)a3;
- (void)invalidateHintGlowTimer;
- (void)requestConfigurationUpdatesBasedOnDeviceSettings;
- (void)setButtonIdentifier:(int64_t)a3;
- (void)setConfiguration:(id)a3;
- (void)setContext:(id)a3;
- (void)setCurrentTimeGenerator:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLock_activityAssertions:(id)a3;
- (void)setUpdateManager:(id)a3;
- (void)setupHintGlowTimerIfNeededWithButtonIdentifier:(id)a3 buttonContext:(id)a4;
- (void)signalForHintGlow:(id)a3;
- (void)stopConfigurationUpdates;
@end

@implementation SiriLongPressButtonSource

+ (id)longPressButtonForIdentifier:(int64_t)a3
{
  id v3 = [[SiriLongPressButtonSource alloc] _initWithButtonIdentifier:a3];
  v4 = objc_alloc_init(SiriLongPressButtonContext);
  [v3 setContext:v4];

  v5 = [v3 context];
  [v5 setButtonDownTimestamp:0.0];

  v6 = [v3 context];
  [v6 setLongPressBehavior:-1];

  return v3;
}

- (SiriLongPressButtonSource)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (id)_initWithButtonIdentifier:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SiriLongPressButtonSource;
  v4 = [(SiriActivationSource *)&v10 init];
  v5 = v4;
  if (v4)
  {
    [(SiriLongPressButtonSource *)v4 setButtonIdentifier:a3];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(SiriLongPressButtonSource *)v5 setLock_activityAssertions:v6];

    [(SiriLongPressButtonSource *)v5 configureConnection];
    v7 = objc_alloc_init(SiriLongPressButtonContext);
    [(SiriLongPressButtonSource *)v5 setContext:v7];

    v8 = [[SiriLongPressButtonConfiguration alloc] initWithButtonIdentifier:a3];
    [(SiriLongPressButtonSource *)v5 setConfiguration:v8];

    [(SiriLongPressButtonSource *)v5 setCurrentTimeGenerator:&__block_literal_global_13];
  }
  return v5;
}

- (double)hintGlowTimeIntervalInMs
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.siri.internal"];
  id v3 = [v2 valueForKey:@"HintGlowIntervalInMs"];

  if (v3)
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 250.0;
  }

  return v5;
}

- (double)longPressInterval
{
  [(SiriLongPressButtonConfiguration *)self->_configuration longPressInterval];
  return result;
}

- (int64_t)longPressBehavior
{
  return [(SiriLongPressButtonConfiguration *)self->_configuration longPressBehavior];
}

- (void)configureConnection
{
  id v3 = (void *)MEMORY[0x1E4F50BB8];
  double v4 = +[SASBoardServicesConfiguration configuration];
  double v5 = [v4 machServiceIdentifier];
  id v6 = +[SASBoardServicesConfiguration configuration];
  v7 = [v6 identifierForService:1];
  v8 = [v3 endpointForMachName:v5 service:v7 instance:0];

  v9 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v8];
  connection = self->super._connection;
  self->super._connection = v9;

  objc_initWeak(&location, self);
  v11 = self->super._connection;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __48__SiriLongPressButtonSource_configureConnection__block_invoke;
  v15 = &unk_1E6B67588;
  objc_copyWeak(&v16, &location);
  [(BSServiceConnection *)v11 configureConnection:&v12];
  [(BSServiceConnection *)self->super._connection activate];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __48__SiriLongPressButtonSource_configureConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = (void *)[WeakRetained buttonIdentifier];
    v8 = [v6 identifier];
    v9 = +[SASSignalServer serviceQuality];
    [v3 setServiceQuality:v9];

    objc_super v10 = +[SASSignalServer interface];
    [v3 setInterface:v10];

    [v3 setInterfaceTarget:v6];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __48__SiriLongPressButtonSource_configureConnection__block_invoke_2;
    v16[3] = &unk_1E6B67820;
    v18 = v7;
    id v11 = v8;
    id v17 = v11;
    [v3 setInvalidationHandler:v16];
    [v3 setInterruptionHandler:&__block_literal_global_50];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __48__SiriLongPressButtonSource_configureConnection__block_invoke_51;
    v13[3] = &unk_1E6B67DE0;
    objc_copyWeak(v15, v4);
    v15[1] = v7;
    id v12 = v11;
    id v14 = v12;
    [v3 setActivationHandler:v13];

    objc_destroyWeak(v15);
  }
}

void __48__SiriLongPressButtonSource_configureConnection__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    v8 = "-[SiriLongPressButtonSource configureConnection]_block_invoke_2";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1D9588000, v4, OS_LOG_TYPE_DEFAULT, "%s #activation BSServiceConnection Invalidated %@", (uint8_t *)&v7, 0x16u);
  }
  double v5 = [v3 remoteTarget];
  id v6 = [[SASButtonIdentifierTransport alloc] initWithSiriButtonIdentifier:*(void *)(a1 + 40)];
  [v5 unregisterButtonIdentifier:v6 withUUID:*(void *)(a1 + 32)];
}

void __48__SiriLongPressButtonSource_configureConnection__block_invoke_48(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
    __48__SiriLongPressButtonSource_configureConnection__block_invoke_48_cold_1((uint64_t)v2, v3);
  }
  [v2 activate];
}

void __48__SiriLongPressButtonSource_configureConnection__block_invoke_51(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  double v5 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v40 = "-[SiriLongPressButtonSource configureConnection]_block_invoke";
    __int16 v41 = 2048;
    v42 = WeakRetained;
    __int16 v43 = 2112;
    id v44 = v3;
    _os_log_impl(&dword_1D9588000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation BSServiceConnection Activated strongSelf=%p connection=%@", buf, 0x20u);
  }
  if (WeakRetained)
  {
    lock = WeakRetained + 4;
    os_unfair_lock_lock(WeakRetained + 4);
    id v6 = [v3 remoteTarget];
    int v7 = [[SASButtonIdentifierTransport alloc] initWithSiriButtonIdentifier:*(void *)(a1 + 48)];
    [v6 registerButtonIdentifier:v7 withUUID:*(void *)(a1 + 32)];

    v8 = &off_1E6B67000;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    __int16 v9 = [(os_unfair_lock_s *)WeakRetained lock_activityAssertions];
    uint64_t v33 = [v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (!v33) {
      goto LABEL_16;
    }
    uint64_t v10 = *(void *)v35;
    uint64_t v32 = *(void *)v35;
    while (1)
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(v9);
        }
        id v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v13 = [v12 reason];
        int v14 = [v13 isEqualToString:@"prepare"];

        if (v14)
        {
          v15 = [v3 remoteTarget];
          id v16 = objc_alloc((Class)v8[56]);
          id v17 = [v12 reference];
          v18 = (void *)[v16 initWithString:v17];
          v19 = [SASTimeIntervalTransport alloc];
          [(os_unfair_lock_s *)WeakRetained longPressInterval];
          v20 = -[SASTimeIntervalTransport initWithTimeInterval:](v19, "initWithTimeInterval:");
          [v15 prewarmFromButtonIdentifier:v18 longPressInterval:v20];
        }
        else
        {
          v21 = [v12 reason];
          int v22 = [v21 isEqualToString:@"speechInteraction"];

          if (!v22) {
            continue;
          }
          id v23 = objc_alloc((Class)v8[56]);
          v24 = [v12 reference];
          v15 = (void *)[v23 initWithString:v24];

          id v17 = [(os_unfair_lock_s *)WeakRetained context];
          [(os_unfair_lock_s *)WeakRetained setupHintGlowTimerIfNeededWithButtonIdentifier:v15 buttonContext:v17];
          v18 = [v3 remoteTarget];
          v25 = v9;
          v26 = WeakRetained;
          v27 = v8;
          id v28 = v3;
          v29 = [SASTimeIntervalTransport alloc];
          [v12 timestamp];
          v30 = v29;
          id v3 = v28;
          v8 = v27;
          id WeakRetained = v26;
          __int16 v9 = v25;
          uint64_t v10 = v32;
          v20 = -[SASTimeIntervalTransport initWithTimeInterval:](v30, "initWithTimeInterval:");
          [v18 buttonDownFromButtonIdentifier:v15 timestamp:v20 context:v17];
        }
      }
      uint64_t v33 = [v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (!v33)
      {
LABEL_16:

        os_unfair_lock_unlock(lock);
        break;
      }
    }
  }
}

- (id)prepareForActivationWithTimestamp:(double)a3
{
  double v4 = SiriSystemUpTimeFromCFAbsoluteCurrentTime(a3);
  objc_initWeak(&location, self);
  double v5 = [SiriActivityAssertion alloc];
  id v6 = [MEMORY[0x1E4F29128] UUID];
  int v7 = [v6 UUIDString];
  v8 = objc_msgSend(NSString, "stringWithSiriButtonIdentifier:", -[SiriLongPressButtonSource buttonIdentifier](self, "buttonIdentifier"));
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __63__SiriLongPressButtonSource_prepareForActivationWithTimestamp___block_invoke;
  v21 = &unk_1E6B67660;
  objc_copyWeak(&v22, &location);
  __int16 v9 = [(SiriActivityAssertion *)v5 initWithIdentifier:v7 reference:v8 reason:@"prepare" timestamp:&v18 invalidationBlock:v4];

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  -[NSMutableArray addObject:](self->_lock_activityAssertions, "addObject:", v9, v18, v19, v20, v21);
  uint64_t v11 = [(BSServiceConnection *)self->super._connection remoteTarget];
  id v12 = [SASButtonIdentifierTransport alloc];
  uint64_t v13 = [(SiriActivityAssertion *)v9 reference];
  int v14 = [(SASButtonIdentifierTransport *)v12 initWithString:v13];
  v15 = [SASTimeIntervalTransport alloc];
  [(SiriLongPressButtonSource *)self longPressInterval];
  id v16 = -[SASTimeIntervalTransport initWithTimeInterval:](v15, "initWithTimeInterval:");
  [v11 prewarmFromButtonIdentifier:v14 longPressInterval:v16];

  os_unfair_lock_unlock(p_lock);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
  return v9;
}

void __63__SiriLongPressButtonSource_prepareForActivationWithTimestamp___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  double v4 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 4);
    double v5 = [*(id *)&v4[2]._os_unfair_lock_opaque remoteTarget];
    id v6 = [SASButtonIdentifierTransport alloc];
    int v7 = [v10 reference];
    v8 = [(SASButtonIdentifierTransport *)v6 initWithString:v7];
    [v5 cancelPrewarmFromButtonIdentifier:v8];

    __int16 v9 = [(os_unfair_lock_s *)v4 lock_activityAssertions];
    [v9 removeObject:v10];

    os_unfair_lock_unlock(v4 + 4);
  }
}

- (void)setupHintGlowTimerIfNeededWithButtonIdentifier:(id)a3 buttonContext:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!self->_saeHintGlowTimer)
  {
    v8 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v18 = "-[SiriLongPressButtonSource setupHintGlowTimerIfNeededWithButtonIdentifier:buttonContext:]";
      _os_log_impl(&dword_1D9588000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation setup hint glow activation timer", buf, 0xCu);
    }
    __int16 v9 = (void *)MEMORY[0x1E4F1CB00];
    [(SiriLongPressButtonSource *)self hintGlowTimeIntervalInMs];
    v15[0] = @"buttonIdentifier";
    v15[1] = @"buttonContext";
    v16[0] = v6;
    v16[1] = v7;
    double v11 = v10 / 1000.0;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
    uint64_t v13 = [v9 scheduledTimerWithTimeInterval:self target:sel_signalForHintGlow_ selector:v12 userInfo:0 repeats:v11];
    saeHintGlowTimer = self->_saeHintGlowTimer;
    self->_saeHintGlowTimer = v13;
  }
}

- (void)invalidateHintGlowTimer
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_saeHintGlowTimer)
  {
    id v3 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      id v6 = "-[SiriLongPressButtonSource invalidateHintGlowTimer]";
      _os_log_impl(&dword_1D9588000, v3, OS_LOG_TYPE_DEFAULT, "%s #activation invalidate hint glow activation timer", (uint8_t *)&v5, 0xCu);
    }
    [(NSTimer *)self->_saeHintGlowTimer invalidate];
    saeHintGlowTimer = self->_saeHintGlowTimer;
    self->_saeHintGlowTimer = 0;
  }
}

- (void)signalForHintGlow:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    id v12 = "-[SiriLongPressButtonSource signalForHintGlow:]";
    _os_log_impl(&dword_1D9588000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation hint glow activation timer fired", (uint8_t *)&v11, 0xCu);
  }
  id v6 = [v4 userInfo];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"buttonIdentifier"];

  v8 = [v4 userInfo];
  __int16 v9 = [v8 objectForKeyedSubscript:@"buttonContext"];

  double v10 = [(BSServiceConnection *)self->super._connection remoteTarget];
  [v10 setHintGlowAssertionFromButtonIdentifier:v7 context:v9];
}

- (id)prepareForActivation
{
  id v3 = [(SiriLongPressButtonSource *)self currentTimeGenerator];
  double v4 = v3[2]();

  return [(SiriLongPressButtonSource *)self prepareForActivationWithTimestamp:v4];
}

- (id)speechInteractionActivityWithTimestamp:(double)a3
{
  objc_initWeak(&location, self);
  [(SiriLongPressButtonSource *)self _timestampForSpeechInteractionActivityWithTimestamp:a3];
  double v6 = v5;
  uint64_t v7 = [(SiriLongPressButtonSource *)self context];
  [v7 setButtonDownTimestamp:v6];

  v8 = [(SiriLongPressButtonSource *)self context];
  objc_msgSend(v8, "setLongPressBehavior:", -[SiriLongPressButtonSource longPressBehavior](self, "longPressBehavior"));

  __int16 v9 = [(SiriLongPressButtonSource *)self context];
  double v10 = [SiriActivityAssertion alloc];
  int v11 = [MEMORY[0x1E4F29128] UUID];
  id v12 = [v11 UUIDString];
  uint64_t v13 = objc_msgSend(NSString, "stringWithSiriButtonIdentifier:", -[SiriLongPressButtonSource buttonIdentifier](self, "buttonIdentifier"));
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __68__SiriLongPressButtonSource_speechInteractionActivityWithTimestamp___block_invoke;
  v25[3] = &unk_1E6B67E08;
  objc_copyWeak(&v27, &location);
  id v14 = v9;
  id v26 = v14;
  v15 = [(SiriActivityAssertion *)v10 initWithIdentifier:v12 reference:v13 reason:@"speechInteraction" timestamp:v25 invalidationBlock:v6];

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  [(NSMutableArray *)self->_lock_activityAssertions addObject:v15];
  id v17 = [SASButtonIdentifierTransport alloc];
  uint64_t v18 = [(SiriActivityAssertion *)v15 reference];
  uint64_t v19 = [(SASButtonIdentifierTransport *)v17 initWithString:v18];

  [(SiriLongPressButtonSource *)self setupHintGlowTimerIfNeededWithButtonIdentifier:v19 buttonContext:v14];
  v20 = [(BSServiceConnection *)self->super._connection remoteTarget];
  v21 = [SASTimeIntervalTransport alloc];
  [(SiriActivityAssertion *)v15 timestamp];
  id v22 = -[SASTimeIntervalTransport initWithTimeInterval:](v21, "initWithTimeInterval:");
  id v23 = [(SiriLongPressButtonSource *)self context];
  [v20 buttonDownFromButtonIdentifier:v19 timestamp:v22 context:v23];

  os_unfair_lock_unlock(p_lock);
  objc_destroyWeak(&v27);

  objc_destroyWeak(&location);
  return v15;
}

void __68__SiriLongPressButtonSource_speechInteractionActivityWithTimestamp___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v14 = a2;
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  double v6 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 4);
    [(os_unfair_lock_s *)v6 invalidateHintGlowTimer];
    uint64_t v7 = [*(id *)&v6[2]._os_unfair_lock_opaque remoteTarget];
    v8 = [SASButtonIdentifierTransport alloc];
    __int16 v9 = [v14 reference];
    double v10 = [(SASButtonIdentifierTransport *)v8 initWithString:v9];
    int v11 = [(os_unfair_lock_s *)v6 _deviceIdentifier];
    id v12 = [[SASTimeIntervalTransport alloc] initWithTimeInterval:a3];
    [v7 buttonUpFromButtonIdentifier:v10 deviceIdentifier:v11 timestamp:v12 context:*(void *)(a1 + 32)];

    uint64_t v13 = [(os_unfair_lock_s *)v6 lock_activityAssertions];
    [v13 removeObject:v14];

    os_unfair_lock_unlock(v6 + 4);
  }
}

- (void)didRecognizeButtonSinglePressUp
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  double v4 = [(BSServiceConnection *)self->super._connection remoteTarget];
  double v5 = [[SASButtonIdentifierTransport alloc] initWithSiriButtonIdentifier:[(SiriLongPressButtonSource *)self buttonIdentifier]];
  double v6 = [[SASTimeIntervalTransport alloc] initWithTimeInterval:CFAbsoluteTimeGetCurrent()];
  uint64_t v7 = [(SiriLongPressButtonSource *)self context];
  [v4 buttonTapFromButtonIdentifier:v5 timestamp:v6 context:v7];

  os_unfair_lock_unlock(p_lock);
}

- (void)didRecognizeLongPress
{
  id v3 = objc_alloc_init(SiriLongPressButtonInteraction);
  [(SiriLongPressButtonSource *)self didRecognizeLongPressInteraction:v3];
}

- (void)didRecognizeLongPressInteraction:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  double v4 = [(SiriLongPressButtonSource *)self context];
  objc_msgSend(v4, "setLongPressBehavior:", -[SiriLongPressButtonSource longPressBehavior](self, "longPressBehavior"));

  double v5 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    double v6 = NSString;
    uint64_t v7 = v5;
    v8 = objc_msgSend(v6, "stringWithSiriButtonIdentifier:", -[SiriLongPressButtonSource buttonIdentifier](self, "buttonIdentifier"));
    *(_DWORD *)buf = 136315394;
    v46 = "-[SiriLongPressButtonSource didRecognizeLongPressInteraction:]";
    __int16 v47 = 2112;
    v48 = v8;
    _os_log_impl(&dword_1D9588000, v7, OS_LOG_TYPE_DEFAULT, "%s #activation %@ didRecognizeLongPress", buf, 0x16u);
  }
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  if ([(SiriLongPressButtonSource *)self buttonIdentifier] == 4)
  {
    double v10 = [(SiriLongPressButtonSource *)self context];
    [v10 buttonDownTimestamp];
    double v12 = v11;

    if (v12 == 0.0)
    {
      uint64_t v13 = [(NSMutableArray *)self->_lock_activityAssertions lastObject];
      id v14 = [v13 reason];
      int v15 = [v14 isEqualToString:@"prepare"];

      if (v15)
      {
        id v16 = [(NSMutableArray *)self->_lock_activityAssertions lastObject];
        [v16 timestamp];
        double v18 = v17;
      }
      else
      {
        uint64_t v19 = [(SiriLongPressButtonSource *)self currentTimeGenerator];
        double v20 = v19[2]();

        double v18 = SiriSystemUpTimeFromCFAbsoluteCurrentTime(v20);
      }
      v21 = [(SiriLongPressButtonSource *)self context];
      [v21 setButtonDownTimestamp:v18];
    }
  }
  id v22 = [(BSServiceConnection *)self->super._connection remoteTarget];
  id v23 = [[SASButtonIdentifierTransport alloc] initWithSiriButtonIdentifier:[(SiriLongPressButtonSource *)self buttonIdentifier]];
  v24 = [(SiriLongPressButtonSource *)self context];
  [v22 buttonLongPressFromButtonIdentifier:v23 context:v24];

  if ([(SiriLongPressButtonSource *)self buttonIdentifier] == 2
    || [(SiriLongPressButtonSource *)self buttonIdentifier] == 1)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v25 = self->_lock_activityAssertions;
    uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v41;
LABEL_13:
      uint64_t v29 = 0;
      while (1)
      {
        if (*(void *)v41 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * v29), "reason", (void)v40);
        char v31 = [v30 isEqualToString:@"speechInteraction"];

        if (v31) {
          break;
        }
        if (v27 == ++v29)
        {
          uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v40 objects:v44 count:16];
          if (v27) {
            goto LABEL_13;
          }
          goto LABEL_19;
        }
      }
    }
    else
    {
LABEL_19:

      uint64_t v32 = *MEMORY[0x1E4F4E360];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
        -[SiriLongPressButtonSource didRecognizeLongPressInteraction:](v32);
      }
      objc_msgSend(NSString, "stringWithSiriButtonIdentifier:", -[SiriLongPressButtonSource buttonIdentifier](self, "buttonIdentifier", (void)v40));
      v25 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      [(SiriLongPressButtonSource *)self _timestampForSpeechInteractionActivityWithTimestamp:CFAbsoluteTimeGetCurrent()];
      double v34 = v33;
      [(SiriLongPressButtonSource *)self invalidateHintGlowTimer];
      long long v35 = [(BSServiceConnection *)self->super._connection remoteTarget];
      long long v36 = [[SASButtonIdentifierTransport alloc] initWithString:v25];
      long long v37 = [(SiriLongPressButtonSource *)self _deviceIdentifier];
      v38 = [[SASTimeIntervalTransport alloc] initWithTimeInterval:v34];
      v39 = [(SiriLongPressButtonSource *)self context];
      [v35 buttonUpFromButtonIdentifier:v36 deviceIdentifier:v37 timestamp:v38 context:v39];
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)_deviceIdentifier
{
  return 0;
}

- (BOOL)_shouldReplaceSpeechInteractionActivityTimestampWithPrewarmTimestamp
{
  return [(SiriLongPressButtonSource *)self buttonIdentifier] == 6;
}

- (double)_timestampForSpeechInteractionActivityWithTimestamp:(double)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(SiriLongPressButtonSource *)self _shouldReplaceSpeechInteractionActivityTimestampWithPrewarmTimestamp])
  {
    p_lock = &self->super._lock;
    os_unfair_lock_lock(&self->super._lock);
    double v6 = [(NSMutableArray *)self->_lock_activityAssertions lastObject];
    uint64_t v7 = [v6 reason];
    int v8 = [v7 isEqualToString:@"prepare"];

    if (v8)
    {
      __int16 v9 = [(NSMutableArray *)self->_lock_activityAssertions lastObject];
      [v9 timestamp];
      double v11 = v10;

      double v12 = (void *)*MEMORY[0x1E4F4E360];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = (void *)MEMORY[0x1E4F28ED0];
        id v14 = v12;
        int v15 = [v13 numberWithDouble:v11];
        int v22 = 136315394;
        id v23 = "-[SiriLongPressButtonSource _timestampForSpeechInteractionActivityWithTimestamp:]";
        __int16 v24 = 2112;
        v25 = v15;
        _os_log_impl(&dword_1D9588000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation #zll carplay steering wheel button with previous prepare assertion, replaced timestamp with %@", (uint8_t *)&v22, 0x16u);
      }
    }
    else
    {
      double v20 = *MEMORY[0x1E4F4E360];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
        -[SiriLongPressButtonSource _timestampForSpeechInteractionActivityWithTimestamp:](v20);
      }
      double v11 = SiriSystemUpTimeFromCFAbsoluteCurrentTime(a3);
    }
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    double v11 = SiriSystemUpTimeFromCFAbsoluteCurrentTime(a3);
    id v16 = (void *)*MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      double v17 = (void *)MEMORY[0x1E4F28ED0];
      double v18 = v16;
      uint64_t v19 = [v17 numberWithDouble:v11];
      int v22 = 136315394;
      id v23 = "-[SiriLongPressButtonSource _timestampForSpeechInteractionActivityWithTimestamp:]";
      __int16 v24 = 2112;
      v25 = v19;
      _os_log_impl(&dword_1D9588000, v18, OS_LOG_TYPE_DEFAULT, "%s #activation #zll not a carplay steering wheel button, converted passed in timestamp: %@", (uint8_t *)&v22, 0x16u);
    }
  }
  return v11;
}

- (BOOL)_sourceSupportsAutomaticConfigurationUpdates
{
  return (unint64_t)(self->_buttonIdentifier - 1) < 2;
}

- (void)requestConfigurationUpdatesBasedOnDeviceSettings
{
  if ([(SiriLongPressButtonSource *)self _sourceSupportsAutomaticConfigurationUpdates]&& !self->_updateManager)
  {
    id v3 = objc_alloc_init(SiriLongPressButtonConfigurationUpdateManager);
    updateManager = self->_updateManager;
    self->_updateManager = v3;

    double v5 = self->_updateManager;
    [(SiriLongPressButtonConfigurationUpdateManager *)v5 startManagingConfigurationFromSource:self withDelegate:self];
  }
}

- (void)stopConfigurationUpdates
{
  updateManager = self->_updateManager;
  if (updateManager)
  {
    [(SiriLongPressButtonConfigurationUpdateManager *)updateManager stopManagingAllConfigurations];
    double v4 = self->_updateManager;
    self->_updateManager = 0;
  }
}

- (void)configurationUpdateManager:(id)a3 configurationDidUpdateForLongPressSource:(id)a4
{
  uint64_t v5 = [(SiriLongPressButtonSource *)self delegate];
  if (v5)
  {
    double v6 = (void *)v5;
    uint64_t v7 = [(SiriLongPressButtonSource *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(SiriLongPressButtonSource *)self delegate];
      [v9 configurationDidUpdateOnLongPressSource:self];
    }
  }
}

- (SiriLongPressButtonConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (SiriLongPressButtonSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SiriLongPressButtonSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)buttonIdentifier
{
  return self->_buttonIdentifier;
}

- (void)setButtonIdentifier:(int64_t)a3
{
  self->_buttonIdentifier = a3;
}

- (NSMutableArray)lock_activityAssertions
{
  return self->_lock_activityAssertions;
}

- (void)setLock_activityAssertions:(id)a3
{
}

- (SiriLongPressButtonContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (id)currentTimeGenerator
{
  return self->_currentTimeGenerator;
}

- (void)setCurrentTimeGenerator:(id)a3
{
}

- (SiriLongPressButtonConfigurationUpdateManager)updateManager
{
  return self->_updateManager;
}

- (void)setUpdateManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateManager, 0);
  objc_storeStrong(&self->_currentTimeGenerator, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_lock_activityAssertions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_saeHintGlowTimer, 0);
}

void __48__SiriLongPressButtonSource_configureConnection__block_invoke_48_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  id v3 = "-[SiriLongPressButtonSource configureConnection]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1D9588000, a2, OS_LOG_TYPE_ERROR, "%s #activation BSServiceConnection Interrupted, re-activating %@", (uint8_t *)&v2, 0x16u);
}

- (void)didRecognizeLongPressInteraction:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  int v2 = "-[SiriLongPressButtonSource didRecognizeLongPressInteraction:]";
  _os_log_error_impl(&dword_1D9588000, log, OS_LOG_TYPE_ERROR, "%s #activation Board sent a long press without a Speech interaction", (uint8_t *)&v1, 0xCu);
}

- (void)_timestampForSpeechInteractionActivityWithTimestamp:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  int v2 = "-[SiriLongPressButtonSource _timestampForSpeechInteractionActivityWithTimestamp:]";
  _os_log_error_impl(&dword_1D9588000, log, OS_LOG_TYPE_ERROR, "%s #activation #zll carplay steering wheel button with no previous prepare assertion", (uint8_t *)&v1, 0xCu);
}

@end