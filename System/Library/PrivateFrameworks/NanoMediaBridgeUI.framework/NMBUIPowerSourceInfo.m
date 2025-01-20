@interface NMBUIPowerSourceInfo
- (BOOL)_hasExternalPowerSourceConnected;
- (NMBUIPowerSourceInfoDelegate)delegate;
- (void)_handlePowerSourceNotification;
- (void)setDelegate:(id)a3;
@end

@implementation NMBUIPowerSourceInfo

- (void)setDelegate:(id)a3
{
  location[3] = *(id *)MEMORY[0x263EF8340];
  id v4 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != v4)
  {
    if (v4)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_delegate);

      if (!v7)
      {
        objc_initWeak(location, self);
        v8 = [NMBUINotificationObserver alloc];
        id v9 = MEMORY[0x263EF83A0];
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __36__NMBUIPowerSourceInfo_setDelegate___block_invoke;
        v20[3] = &unk_264DA3CA8;
        objc_copyWeak(&v21, location);
        v10 = [(NMBUINotificationObserver *)v8 initWithNotificationName:@"com.apple.system.accpowersources.attach" queue:MEMORY[0x263EF83A0] block:v20];
        accessoryNotificationObserver = self->_accessoryNotificationObserver;
        self->_accessoryNotificationObserver = v10;

        v12 = [NMBUINotificationObserver alloc];
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __36__NMBUIPowerSourceInfo_setDelegate___block_invoke_5;
        v18[3] = &unk_264DA3CA8;
        objc_copyWeak(&v19, location);
        v13 = [(NMBUINotificationObserver *)v12 initWithNotificationName:@"com.apple.system.accpowersources.source" queue:MEMORY[0x263EF83A0] block:v18];
        powerSourceNotificationObserver = self->_powerSourceNotificationObserver;
        self->_powerSourceNotificationObserver = v13;

        objc_destroyWeak(&v19);
        objc_destroyWeak(&v21);
        objc_destroyWeak(location);
      }
    }
    else
    {
      v15 = self->_accessoryNotificationObserver;
      self->_accessoryNotificationObserver = 0;

      v16 = self->_powerSourceNotificationObserver;
      self->_powerSourceNotificationObserver = 0;
    }
    v17 = NMLogForCategory(7);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v4;
      _os_log_impl(&dword_2397B1000, v17, OS_LOG_TYPE_DEFAULT, "NMBUIPowerSourceInfo set new delegate %@", (uint8_t *)location, 0xCu);
    }

    objc_storeWeak((id *)p_delegate, v4);
  }
}

void __36__NMBUIPowerSourceInfo_setDelegate___block_invoke(uint64_t a1)
{
  v2 = NMLogForCategory(7);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2397B1000, v2, OS_LOG_TYPE_DEFAULT, "NMBUIPowerSourceInfo got new accessory notification", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handlePowerSourceNotification];
}

void __36__NMBUIPowerSourceInfo_setDelegate___block_invoke_5(uint64_t a1)
{
  v2 = NMLogForCategory(7);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2397B1000, v2, OS_LOG_TYPE_DEFAULT, "NMBUIPowerSourceInfo got power source change notification", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handlePowerSourceNotification];
}

- (BOOL)_hasExternalPowerSourceConnected
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = (const void *)IOPSCopyPowerSourcesByType();
  if (v2)
  {
    CFTypeRef cf = v2;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    CFArrayRef v3 = IOPSCopyPowerSourcesList(v2);
    uint64_t v4 = [(__CFArray *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      char v14 = 0;
      uint64_t v6 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v16 != v6) {
            objc_enumerationMutation(v3);
          }
          v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v9 = objc_msgSend(v8, "objectForKeyedSubscript:", @"Accessory Category", cf);
            int v10 = [v9 isEqualToString:@"Watch"];

            if (v10)
            {
              v11 = [v8 objectForKeyedSubscript:@"Is Charging"];
              char v14 = [v11 BOOLValue];
            }
          }
        }
        uint64_t v5 = [(__CFArray *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v5);
    }
    else
    {
      char v14 = 0;
    }

    CFRelease(cf);
    LOBYTE(v2) = v14 & 1;
  }
  return (char)v2;
}

- (void)_handlePowerSourceNotification
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    BOOL v6 = [(NMBUIPowerSourceInfo *)self _hasExternalPowerSourceConnected];
    lastNotifiedExternalPowerSourceConnected = self->_lastNotifiedExternalPowerSourceConnected;
    if (!lastNotifiedExternalPowerSourceConnected
      || v6 != [(NSNumber *)lastNotifiedExternalPowerSourceConnected BOOLValue])
    {
      v8 = [NSNumber numberWithBool:v6];
      id v9 = self->_lastNotifiedExternalPowerSourceConnected;
      self->_lastNotifiedExternalPowerSourceConnected = v8;

      id v10 = objc_loadWeakRetained((id *)p_delegate);
      [v10 powerSourceInfoHasExternalPowerSourceConnectedDidChange:self];
    }
  }
}

- (NMBUIPowerSourceInfoDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NMBUIPowerSourceInfoDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_powerSourceNotificationObserver, 0);
  objc_storeStrong((id *)&self->_accessoryNotificationObserver, 0);
  objc_storeStrong((id *)&self->_lastNotifiedExternalPowerSourceConnected, 0);
}

@end