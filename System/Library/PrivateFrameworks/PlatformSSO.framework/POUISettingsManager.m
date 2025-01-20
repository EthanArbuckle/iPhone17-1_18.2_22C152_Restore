@interface POUISettingsManager
- (POUISettingsManager)init;
- (id)deviceStatus;
- (id)statusForUserName:(id)a3;
- (void)init;
- (void)startDeviceAction:(int64_t)a3;
- (void)startUserAction:(int64_t)a3 forUserName:(id)a4;
@end

@implementation POUISettingsManager

- (POUISettingsManager)init
{
  v3 = PO_LOG_POUISettingsManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(POUISettingsManager *)(uint64_t)self init];
  }

  v8.receiver = self;
  v8.super_class = (Class)POUISettingsManager;
  v4 = [(POUISettingsManager *)&v8 init];
  if (v4)
  {
    v5 = objc_alloc_init(POUIServiceConnection);
    serviceConnection = v4->_serviceConnection;
    v4->_serviceConnection = v5;
  }
  return v4;
}

- (id)deviceStatus
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = PO_LOG_POUISettingsManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[POUISettingsManager deviceStatus]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    _os_log_impl(&dword_230E51000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  serviceConnection = self->_serviceConnection;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__POUISettingsManager_deviceStatus__block_invoke;
  v7[3] = &unk_264BBEC28;
  v7[4] = buf;
  [(POUIServiceConnection *)serviceConnection deviceStatusWithCompletion:v7];
  id v5 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v5;
}

void __35__POUISettingsManager_deviceStatus__block_invoke(uint64_t a1, void *a2)
{
}

- (id)statusForUserName:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = PO_LOG_POUISettingsManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[POUISettingsManager statusForUserName:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    _os_log_impl(&dword_230E51000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v11 = __Block_byref_object_copy_;
  uint64_t v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  serviceConnection = self->_serviceConnection;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __41__POUISettingsManager_statusForUserName___block_invoke;
  v9[3] = &unk_264BBEC50;
  v9[4] = buf;
  [(POUIServiceConnection *)serviceConnection statusForUser:v4 completion:v9];
  id v7 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v7;
}

void __41__POUISettingsManager_statusForUserName___block_invoke(uint64_t a1, void *a2)
{
}

- (void)startDeviceAction:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = PO_LOG_POUISettingsManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[POUISettingsManager startDeviceAction:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    _os_log_impl(&dword_230E51000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v9 = 0;
  serviceConnection = self->_serviceConnection;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__POUISettingsManager_startDeviceAction___block_invoke;
  v7[3] = &unk_264BBEC78;
  v7[4] = buf;
  [(POUIServiceConnection *)serviceConnection startDeviceAction:a3 completion:v7];
  _Block_object_dispose(buf, 8);
}

uint64_t __41__POUISettingsManager_startDeviceAction___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)startUserAction:(int64_t)a3 forUserName:(id)a4
{
  id v6 = a4;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  char v10 = 0;
  serviceConnection = self->_serviceConnection;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__POUISettingsManager_startUserAction_forUserName___block_invoke;
  v8[3] = &unk_264BBEC78;
  v8[4] = v9;
  [(POUIServiceConnection *)serviceConnection startAction:a3 forUserName:v6 completion:v8];
  _Block_object_dispose(v9, 8);
}

uint64_t __51__POUISettingsManager_startUserAction_forUserName___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void).cxx_destruct
{
}

- (void)init
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  v3 = "-[POUISettingsManager init]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_230E51000, a2, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)&v2, 0x16u);
}

@end