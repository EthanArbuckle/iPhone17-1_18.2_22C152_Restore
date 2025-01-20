@interface TVRXDeviceAuthenticationChallenge
+ (id)_challengeWithCodeToEnterLocally:(id)a3;
+ (id)_challengeWithCodeToEnterOnDevice:(id)a3 cancellationHandler:(id)a4;
- (NSString)codeToEnterOnDevice;
- (id)_init;
- (int64_t)challengeAttributes;
- (int64_t)challengeType;
- (int64_t)throttleSeconds;
- (void)cancel;
- (void)setChallengeAttributes:(int64_t)a3;
- (void)setThrottleSeconds:(int64_t)a3;
- (void)userEnteredCodeLocally:(id)a3;
@end

@implementation TVRXDeviceAuthenticationChallenge

+ (id)_challengeWithCodeToEnterOnDevice:(id)a3 cancellationHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[TVRXDeviceAuthenticationChallenge alloc] _init];
  v7[3] = 1;
  uint64_t v8 = [v5 copy];

  v9 = (void *)v7[2];
  v7[2] = v8;

  uint64_t v10 = [v6 copy];
  v11 = (void *)v7[6];
  v7[6] = v10;

  v7[5] = -1;

  return v7;
}

+ (id)_challengeWithCodeToEnterLocally:(id)a3
{
  id v3 = a3;
  v4 = [[TVRXDeviceAuthenticationChallenge alloc] _init];
  v4[3] = 0;
  uint64_t v5 = [v3 copy];

  id v6 = (void *)v4[1];
  v4[1] = v5;

  *((_OWORD *)v4 + 2) = xmmword_226798C40;

  return v4;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)TVRXDeviceAuthenticationChallenge;
  return [(TVRXDeviceAuthenticationChallenge *)&v3 init];
}

- (void)userEnteredCodeLocally:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (self->_challengeType)
  {
    id v6 = _TVRCGeneralLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = NSStringFromSelector(a2);
      int v9 = 138543362;
      uint64_t v10 = v7;
      _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "Calling %{public}@ is invalid for this challenge type.", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    continuation = (void (**)(id, id, void))self->_continuation;
    if (continuation) {
      continuation[2](continuation, v5, 0);
    }
  }
}

- (void)cancel
{
  int64_t challengeType = self->_challengeType;
  if (challengeType == 1)
  {
    cancellationHandler = (void (**)(void))self->_cancellationHandler;
    if (cancellationHandler) {
      cancellationHandler[2]();
    }
  }
  else if (!challengeType)
  {
    continuation = (void (**)(id, void, uint64_t))self->_continuation;
    if (continuation) {
      continuation[2](continuation, 0, 1);
    }
  }
}

- (int64_t)challengeType
{
  return self->_challengeType;
}

- (int64_t)challengeAttributes
{
  return self->_challengeAttributes;
}

- (void)setChallengeAttributes:(int64_t)a3
{
  self->_challengeAttributes = a3;
}

- (int64_t)throttleSeconds
{
  return self->_throttleSeconds;
}

- (void)setThrottleSeconds:(int64_t)a3
{
  self->_throttleSeconds = a3;
}

- (NSString)codeToEnterOnDevice
{
  return self->_codeToEnterOnDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codeToEnterOnDevice, 0);
  objc_storeStrong(&self->_cancellationHandler, 0);

  objc_storeStrong(&self->_continuation, 0);
}

@end