@interface WFMobileWiFiStateMonitor
- (WFLinkQuality)linkQuality;
- (WFMobileWiFiStateMonitor)initWithHandler:(id)a3;
- (__WiFiDeviceClient)device;
- (__WiFiManagerClient)manager;
- (id)handler;
- (int64_t)state;
- (void)_updateState;
- (void)_updateWithDeviceAttachment:(__WiFiDeviceClient *)a3;
- (void)dealloc;
- (void)setDevice:(__WiFiDeviceClient *)a3;
- (void)setHandler:(id)a3;
- (void)setLinkQuality:(id)a3;
- (void)setManager:(__WiFiManagerClient *)a3;
- (void)setState:(int64_t)a3;
@end

@implementation WFMobileWiFiStateMonitor

- (WFMobileWiFiStateMonitor)initWithHandler:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WFMobileWiFiStateMonitor;
  v5 = [(WFMobileWiFiStateMonitor *)&v21 init];
  if (!v5)
  {
LABEL_24:

    v10 = 0;
    v5 = 0;
    goto LABEL_18;
  }
  v6 = _Block_copy(v4);
  id handler = v5->_handler;
  v5->_id handler = v6;

  v5->_state = 0;
  uint64_t v8 = WiFiManagerClientCreate();
  v5->_manager = (__WiFiManagerClient *)v8;
  if (!v8)
  {
    v19 = WFLogForCategory(0);
    os_log_type_t v20 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v19 && os_log_type_enabled(v19, v20))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226071000, v19, v20, "failed to create WiFiManagerClientRef", buf, 2u);
    }

    goto LABEL_24;
  }
  v9 = [MEMORY[0x263EFF9F0] currentRunLoop];
  [v9 getCFRunLoop];
  WiFiManagerClientScheduleWithRunLoop();

  WiFiManagerClientRegisterServerRestartCallback();
  WiFiManagerClientRegisterDeviceAttachmentCallback();
  v10 = (void *)WiFiManagerClientCopyDevices();
  v11 = WFLogForCategory(0);
  os_log_type_t v12 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v11 && os_log_type_enabled(v11, v12))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[WFMobileWiFiStateMonitor initWithHandler:]";
    __int16 v24 = 2112;
    uint64_t v25 = (uint64_t)v10;
    _os_log_impl(&dword_226071000, v11, v12, "%s: devices %@", buf, 0x16u);
  }

  if (v10)
  {
    uint64_t v13 = [v10 objectAtIndex:0];
    v14 = WFLogForCategory(0);
    os_log_type_t v15 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v14 && os_log_type_enabled(v14, v15))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[WFMobileWiFiStateMonitor initWithHandler:]";
      __int16 v24 = 2112;
      uint64_t v25 = v13;
      _os_log_impl(&dword_226071000, v14, v15, "%s: device %@", buf, 0x16u);
    }

    [(WFMobileWiFiStateMonitor *)v5 _updateWithDeviceAttachment:v13];
    [(WFMobileWiFiStateMonitor *)v5 _updateState];
  }
  else
  {
    v16 = WFLogForCategory(0);
    os_log_type_t v17 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v16 && os_log_type_enabled(v16, v17))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[WFMobileWiFiStateMonitor initWithHandler:]";
      _os_log_impl(&dword_226071000, v16, v17, "%s: failed to acquire WiFiDeviceClientRef", buf, 0xCu);
    }

    v10 = 0;
  }
LABEL_18:

  return v5;
}

- (void)dealloc
{
  manager = self->_manager;
  if (manager)
  {
    CFRelease(manager);
    self->_manager = 0;
  }
  device = self->_device;
  if (device)
  {
    CFRelease(device);
    self->_device = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)WFMobileWiFiStateMonitor;
  [(WFMobileWiFiStateMonitor *)&v5 dealloc];
}

- (void)_updateState
{
  v3 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__WFMobileWiFiStateMonitor__updateState__block_invoke;
  block[3] = &unk_26478E528;
  block[4] = self;
  dispatch_async(v3, block);
}

void __40__WFMobileWiFiStateMonitor__updateState__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (WiFiManagerClientGetPower())
  {
    v2 = (const void *)WiFiDeviceClientCopyCurrentNetwork();
    v3 = WFLogForCategory(0);
    os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
    BOOL v6 = (unint64_t)WFCurrentLogLevel() > 2 && v3 != 0;
    if (v2)
    {
      if (v6 && os_log_type_enabled(v3, v4))
      {
        *(_DWORD *)buf = 136315138;
        os_log_type_t v12 = "-[WFMobileWiFiStateMonitor _updateState]_block_invoke";
        _os_log_impl(&dword_226071000, v3, v4, "%s: associated", buf, 0xCu);
      }

      CFRelease(v2);
      uint64_t v7 = 4;
    }
    else
    {
      if (v6 && os_log_type_enabled(v3, v4))
      {
        *(_DWORD *)buf = 136315138;
        os_log_type_t v12 = "-[WFMobileWiFiStateMonitor _updateState]_block_invoke";
        _os_log_impl(&dword_226071000, v3, v4, "%s: powered on", buf, 0xCu);
      }

      uint64_t v7 = 3;
    }
  }
  else
  {
    uint64_t v8 = WFLogForCategory(0);
    os_log_type_t v9 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v8 && os_log_type_enabled(v8, v9))
    {
      *(_DWORD *)buf = 136315138;
      os_log_type_t v12 = "-[WFMobileWiFiStateMonitor _updateState]_block_invoke";
      _os_log_impl(&dword_226071000, v8, v9, "%s: powered off", buf, 0xCu);
    }

    uint64_t v7 = 1;
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __40__WFMobileWiFiStateMonitor__updateState__block_invoke_3;
  v10[3] = &unk_26478E500;
  v10[4] = *(void *)(a1 + 32);
  v10[5] = v7;
  dispatch_async(MEMORY[0x263EF83A0], v10);
}

void __40__WFMobileWiFiStateMonitor__updateState__block_invoke_3(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  unint64_t v2 = [*(id *)(a1 + 32) state];
  [*(id *)(a1 + 32) setState:*(void *)(a1 + 40)];
  v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3)
  {
    objc_super v5 = v3;
    if (os_log_type_enabled(v5, v4))
    {
      BOOL v6 = WFWiFiStateMonitorStringForState(v2);
      uint64_t v7 = WFWiFiStateMonitorStringForState(*(void *)(a1 + 40));
      int v10 = 136315650;
      v11 = "-[WFMobileWiFiStateMonitor _updateState]_block_invoke";
      __int16 v12 = 2112;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      os_log_type_t v15 = v7;
      _os_log_impl(&dword_226071000, v5, v4, "%s: state changed from %@ to %@", (uint8_t *)&v10, 0x20u);
    }
  }

  uint64_t v8 = [*(id *)(a1 + 32) handler];

  if (v8)
  {
    os_log_type_t v9 = [*(id *)(a1 + 32) handler];
    v9[2](v9, v2, *(void *)(a1 + 40));
  }
}

- (void)_updateWithDeviceAttachment:(__WiFiDeviceClient *)a3
{
  device = self->_device;
  if (device) {
    CFRelease(device);
  }
  self->_device = a3;
  if (a3) {
    CFRetain(a3);
  }
  WiFiDeviceClientRegisterPowerCallback();
  MEMORY[0x270F4B480](a3, _WiFiDeviceLinkExtendedCallback, self);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (id)handler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setHandler:(id)a3
{
}

- (__WiFiManagerClient)manager
{
  return self->_manager;
}

- (void)setManager:(__WiFiManagerClient *)a3
{
  self->_manager = a3;
}

- (__WiFiDeviceClient)device
{
  return self->_device;
}

- (void)setDevice:(__WiFiDeviceClient *)a3
{
  self->_device = a3;
}

- (WFLinkQuality)linkQuality
{
  return self->_linkQuality;
}

- (void)setLinkQuality:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkQuality, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end