@interface SVXAudioSessionAssertion
- (NSString)reason;
- (SVXAudioSessionAssertion)initWithReason:(id)a3 audioSessionID:(unsigned int)a4 taskTracker:(id)a5 relinquishHandler:(id)a6;
- (SVXTaskTracking)taskTracker;
- (id)description;
- (unsigned)audioSessionID;
- (void)dealloc;
- (void)relinquish;
@end

@implementation SVXAudioSessionAssertion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskTracker, 0);
  objc_storeStrong((id *)&self->_reason, 0);

  objc_storeStrong((id *)&self->_relinquishHandler, 0);
}

- (SVXTaskTracking)taskTracker
{
  return self->_taskTracker;
}

- (NSString)reason
{
  return self->_reason;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (void)relinquish
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    v6 = "-[SVXAudioSessionAssertion relinquish]";
    __int16 v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_220062000, v3, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v5, 0x16u);
  }
  taskTracker = self->_taskTracker;
  self->_taskTracker = 0;

  [(AFSafetyBlock *)self->_relinquishHandler invokeWithSignal:0];
}

- (SVXAudioSessionAssertion)initWithReason:(id)a3 audioSessionID:(unsigned int)a4 taskTracker:(id)a5 relinquishHandler:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)SVXAudioSessionAssertion;
  v13 = [(SVXAudioSessionAssertion *)&v23 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    reason = v13->_reason;
    v13->_reason = (NSString *)v14;

    v13->_audioSessionID = a4;
    objc_storeStrong((id *)&v13->_taskTracker, a5);
    id v16 = objc_alloc(MEMORY[0x263F285B8]);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __88__SVXAudioSessionAssertion_initWithReason_audioSessionID_taskTracker_relinquishHandler___block_invoke;
    v21[3] = &unk_264554480;
    id v22 = v12;
    uint64_t v17 = [v16 initWithBlock:v21];
    relinquishHandler = v13->_relinquishHandler;
    v13->_relinquishHandler = (AFSafetyBlock *)v17;

    v19 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[SVXAudioSessionAssertion initWithReason:audioSessionID:taskTracker:relinquishHandler:]";
      __int16 v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_220062000, v19, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
    }
  }
  return v13;
}

uint64_t __88__SVXAudioSessionAssertion_initWithReason_audioSessionID_taskTracker_relinquishHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (self->_taskTracker)
  {
    v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v6 = "-[SVXAudioSessionAssertion dealloc]";
      __int16 v7 = 2112;
      v8 = self;
      _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s %@ is released without explicitly calling -relinquish.", buf, 0x16u);
    }
  }
  [(AFSafetyBlock *)self->_relinquishHandler invokeWithSignal:-1];
  v4.receiver = self;
  v4.super_class = (Class)SVXAudioSessionAssertion;
  [(SVXAudioSessionAssertion *)&v4 dealloc];
}

- (id)description
{
  id v3 = [NSString alloc];
  v7.receiver = self;
  v7.super_class = (Class)SVXAudioSessionAssertion;
  objc_super v4 = [(SVXAudioSessionAssertion *)&v7 description];
  int v5 = (void *)[v3 initWithFormat:@"%@ {reason = %@, audioSessionID = %lu, taskTracker = %@}", v4, self->_reason, self->_audioSessionID, self->_taskTracker];

  return v5;
}

@end