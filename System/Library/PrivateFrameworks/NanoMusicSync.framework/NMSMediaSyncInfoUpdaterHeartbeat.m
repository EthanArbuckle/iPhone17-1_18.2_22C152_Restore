@interface NMSMediaSyncInfoUpdaterHeartbeat
- (NMSMediaSyncInfoUpdaterHeartbeat)initWithBundleIdentifier:(id)a3;
- (void)dealloc;
- (void)start;
- (void)stop;
@end

@implementation NMSMediaSyncInfoUpdaterHeartbeat

- (NMSMediaSyncInfoUpdaterHeartbeat)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NMSMediaSyncInfoUpdaterHeartbeat;
  v6 = [(NMSMediaSyncInfoUpdaterHeartbeat *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
  }

  return v7;
}

- (void)dealloc
{
  currentSyncInfoRequestDateTimer = self->_currentSyncInfoRequestDateTimer;
  if (currentSyncInfoRequestDateTimer)
  {
    dispatch_source_cancel(currentSyncInfoRequestDateTimer);
    v4 = self->_currentSyncInfoRequestDateTimer;
    self->_currentSyncInfoRequestDateTimer = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)NMSMediaSyncInfoUpdaterHeartbeat;
  [(NMSMediaSyncInfoUpdaterHeartbeat *)&v5 dealloc];
}

- (void)start
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = NMLogForCategory(5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[NMSMediaSyncInfoUpdaterHeartbeat start]";
    _os_log_impl(&dword_2228FD000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v4 = self->_bundleIdentifier;
  if (!self->_currentSyncInfoRequestDateTimer)
  {
    objc_super v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
    currentSyncInfoRequestDateTimer = self->_currentSyncInfoRequestDateTimer;
    self->_currentSyncInfoRequestDateTimer = v5;

    dispatch_source_set_timer((dispatch_source_t)self->_currentSyncInfoRequestDateTimer, 0, 0x37E11D600uLL, 0x3B9ACA00uLL);
    v7 = self->_currentSyncInfoRequestDateTimer;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __41__NMSMediaSyncInfoUpdaterHeartbeat_start__block_invoke;
    handler[3] = &unk_264633B20;
    objc_super v9 = v4;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume((dispatch_object_t)self->_currentSyncInfoRequestDateTimer);
  }
}

void __41__NMSMediaSyncInfoUpdaterHeartbeat_start__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF910] date];
  v3 = NMLogForCategory(5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 136315650;
    v7 = "-[NMSMediaSyncInfoUpdaterHeartbeat start]_block_invoke";
    __int16 v8 = 2112;
    objc_super v9 = v2;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl(&dword_2228FD000, v3, OS_LOG_TYPE_DEFAULT, "%s updating last sync info request date: %@ for bundleID: %@", (uint8_t *)&v6, 0x20u);
  }

  objc_super v5 = +[NMSyncDefaults sharedDefaults];
  [v5 setLastSyncInfoRequestDate:v2 forBundleIdentifier:*(void *)(a1 + 32)];
}

- (void)stop
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = NMLogForCategory(5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "-[NMSMediaSyncInfoUpdaterHeartbeat stop]";
    _os_log_impl(&dword_2228FD000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  currentSyncInfoRequestDateTimer = self->_currentSyncInfoRequestDateTimer;
  if (currentSyncInfoRequestDateTimer)
  {
    dispatch_source_cancel(currentSyncInfoRequestDateTimer);
    objc_super v5 = self->_currentSyncInfoRequestDateTimer;
    self->_currentSyncInfoRequestDateTimer = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_currentSyncInfoRequestDateTimer, 0);
}

@end