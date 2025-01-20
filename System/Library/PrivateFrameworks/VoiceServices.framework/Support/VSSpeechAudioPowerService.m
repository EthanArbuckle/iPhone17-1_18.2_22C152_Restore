@interface VSSpeechAudioPowerService
+ (id)sharedServices;
- (AFAudioPowerProviding)previousProvider;
- (BOOL)getAveragePower:(float *)a3 andPeakPower:(float *)a4;
- (id)getCurrentAudioPowerProvider;
- (void)didEndAccessPower;
- (void)setPreviousProvider:(id)a3;
@end

@implementation VSSpeechAudioPowerService

- (void).cxx_destruct
{
}

- (void)setPreviousProvider:(id)a3
{
}

- (AFAudioPowerProviding)previousProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previousProvider);
  return (AFAudioPowerProviding *)WeakRetained;
}

- (BOOL)getAveragePower:(float *)a3 andPeakPower:(float *)a4
{
  id v7 = [(VSSpeechAudioPowerService *)self getCurrentAudioPowerProvider];
  BOOL v8 = v7 == 0;
  if (!v7) {
    goto LABEL_6;
  }
  p_previousProvider = &self->_previousProvider;
  id WeakRetained = objc_loadWeakRetained((id *)p_previousProvider);

  if (v7 != WeakRetained)
  {
    id v11 = objc_loadWeakRetained((id *)p_previousProvider);
    [v11 didEndAccessPower];

    [v7 willBeginAccessPower];
    objc_storeWeak((id *)p_previousProvider, v7);
  }
  if ([v7 getAveragePower:a3 andPeakPower:a4])
  {
    BOOL v8 = 1;
  }
  else
  {
LABEL_6:
    *a3 = -120.0;
    *a4 = -120.0;
  }

  return v8;
}

- (void)didEndAccessPower
{
  p_previousProvider = &self->_previousProvider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previousProvider);
  [WeakRetained didEndAccessPower];

  objc_storeWeak((id *)p_previousProvider, 0);
}

- (id)getCurrentAudioPowerProvider
{
  v2 = +[VSSpeechTaskQueue mainDeviceQueue];
  v3 = [v2 currentTask];

  if ([v3 conformsToProtocol:&unk_26DADCB08])
  {
    id v4 = v3;
    if [v4 isSpeaking] && (objc_opt_respondsToSelector())
    {
      v5 = [v4 audioPowerProvider];
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)sharedServices
{
  if (sharedServices_onceToken != -1) {
    dispatch_once(&sharedServices_onceToken, &__block_literal_global_2736);
  }
  v2 = (void *)sharedServices___sharedService;
  return v2;
}

uint64_t __43__VSSpeechAudioPowerService_sharedServices__block_invoke()
{
  sharedServices___sharedService = objc_alloc_init(VSSpeechAudioPowerService);
  return MEMORY[0x270F9A758]();
}

@end