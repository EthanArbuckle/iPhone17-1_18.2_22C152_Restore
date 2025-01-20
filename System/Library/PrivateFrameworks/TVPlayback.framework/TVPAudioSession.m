@interface TVPAudioSession
+ (id)sharedInstance;
- (TVPAudioSession)init;
- (id)configurationBlock;
- (void)_mediaServicesReset:(id)a3;
- (void)_updateIfNecessary;
- (void)dealloc;
- (void)setConfigurationBlock:(id)a3;
@end

@implementation TVPAudioSession

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__TVPAudioSession_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, block);
  }
  v2 = (void *)sharedInstance_sSharedInstance;
  return v2;
}

uint64_t __33__TVPAudioSession_sharedInstance__block_invoke(uint64_t a1)
{
  os_log_t v2 = os_log_create("com.apple.AppleTV.playback", "TVPAudioSession");
  v3 = (void *)sLogObject_6;
  sLogObject_6 = (uint64_t)v2;

  sharedInstance_sSharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (TVPAudioSession)init
{
  v5.receiver = self;
  v5.super_class = (Class)TVPAudioSession;
  os_log_t v2 = [(TVPAudioSession *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel__mediaServicesReset_ name:*MEMORY[0x263EF90F8] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TVPAudioSession;
  [(TVPAudioSession *)&v4 dealloc];
}

- (void)setConfigurationBlock:(id)a3
{
  objc_super v4 = (void *)[a3 copy];
  id configurationBlock = self->_configurationBlock;
  self->_id configurationBlock = v4;

  [(TVPAudioSession *)self _updateIfNecessary];
}

- (void)_mediaServicesReset:(id)a3
{
  objc_super v4 = sLogObject_6;
  if (os_log_type_enabled((os_log_t)sLogObject_6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl(&dword_236FC5000, v4, OS_LOG_TYPE_DEFAULT, "Received AVAudioSessionMediaServicesWereResetNotification", v5, 2u);
  }
  [(TVPAudioSession *)self _updateIfNecessary];
}

- (void)_updateIfNecessary
{
  id configurationBlock = (void (**)(id, id))self->_configurationBlock;
  if (configurationBlock)
  {
    id v3 = [MEMORY[0x263EF93E0] sharedInstance];
    configurationBlock[2](configurationBlock, v3);
  }
}

- (id)configurationBlock
{
  return self->_configurationBlock;
}

- (void).cxx_destruct
{
}

@end