@interface MCUEAPlugin
- (CoreTelephonyClient)coreTelephonyClient;
- (MCUEAPlugin)init;
- (id)_descriptionForContext:(id)a3;
- (id)_positionLabelForContext:(id)a3;
- (void)carrierBundleChange:(id)a3;
- (void)install;
- (void)preferredDataSimChanged:(id)a3;
- (void)setCoreTelephonyClient:(id)a3;
- (void)simStatusDidChange:(id)a3 status:(id)a4;
@end

@implementation MCUEAPlugin

- (id)_descriptionForContext:(id)a3
{
  id v4 = a3;
  v5 = [(MCUEAPlugin *)self coreTelephonyClient];

  if (v5)
  {
    v6 = [(MCUEAPlugin *)self coreTelephonyClient];
    id v18 = 0;
    v7 = [v6 getPhoneNumber:v4 error:&v18];
    id v8 = v18;

    v9 = [(MCUEAPlugin *)self coreTelephonyClient];
    id v17 = 0;
    v10 = [v9 getSimLabel:v4 error:&v17];
    id v11 = v17;

    if (v8) {
      [v8 MCVerboseDescription];
    }
    else {
    v13 = +[NSString stringWithFormat:@"%@", v7];
    }
    if (v11) {
      [v11 MCVerboseDescription];
    }
    else {
    v12 = +[NSString stringWithFormat:@"%@", v10];
    }
  }
  else
  {
    v12 = @"CoreTelephony client not initialized";
    v13 = @"CoreTelephony client not initialized";
  }
  v19[0] = @"Position";
  v14 = [(MCUEAPlugin *)self _positionLabelForContext:v4];
  v20[0] = v14;
  v20[1] = v13;
  v19[1] = @"Phone Number";
  v19[2] = @"Sim Label";
  v20[2] = v12;
  v15 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];

  return v15;
}

- (id)_positionLabelForContext:(id)a3
{
  v3 = (char *)[a3 slotID];
  id v4 = @"unknown";
  if (v3 == (unsigned char *)&dword_0 + 2) {
    id v4 = @"2";
  }
  if (v3 == (unsigned char *)&dword_0 + 1) {
    return @"1";
  }
  else {
    return v4;
  }
}

- (MCUEAPlugin)init
{
  v6.receiver = self;
  v6.super_class = (Class)MCUEAPlugin;
  v2 = [(MCUEAPlugin *)&v6 init];
  if (v2)
  {
    MCLoggingInitialize();
    v3 = _MCLogObjects[3];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "MCUEAPlugin initialized.", v5, 2u);
    }
  }
  return v2;
}

- (void)install
{
  v3 = _MCLogObjects[3];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "MCUEAinstall: starting", buf, 2u);
  }
  id v4 = [objc_alloc((Class)CoreTelephonyClient) initWithQueue:&_dispatch_main_q];
  [(MCUEAPlugin *)self setCoreTelephonyClient:v4];

  v5 = [(MCUEAPlugin *)self coreTelephonyClient];
  [v5 setDelegate:self];

  objc_super v6 = _MCLogObjects[3];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "MCUEAinstall: created CoreTelephonyClient", v12, 2u);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_20FC, @"com.apple.mobile.keybagd.lock_status", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  id v8 = _MCLogObjects[3];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "MCUEAinstall: registered for lock status change notification", v11, 2u);
  }
  v9 = _MCLogObjects[3];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "MCUEAinstall: done", v10, 2u);
  }
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _MCLogObjects[3];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = [(MCUEAPlugin *)self _positionLabelForContext:v6];
    *(_DWORD *)v15 = 138543618;
    *(void *)&v15[4] = v10;
    __int16 v16 = 2114;
    id v17 = v7;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "MCUEA-CT: simStatusDidChange, %{public}@, status=%{public}@", v15, 0x16u);
  }
  if ([v7 isEqualToString:kCTSIMSupportSIMStatusReady])
  {
    id v11 = _MCLogObjects[3];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      v12 = "MCUEA-CT: SIM is now ready.";
LABEL_9:
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, v12, v15, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  unsigned int v13 = [v7 isEqualToString:kCTSIMSupportSIMStatusNotInserted];
  id v11 = _MCLogObjects[3];
  if (v13)
  {
    if (os_log_type_enabled((os_log_t)_MCLogObjects[3], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      v12 = "MCUEA-CT: SIM has been removed.";
      goto LABEL_9;
    }
LABEL_10:
    v14 = +[MCProfileConnection sharedConnection];
    [v14 checkCarrierProfile];

    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)_MCLogObjects[3], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v15 = 138543362;
    *(void *)&v15[4] = v7;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEBUG, "MCUEA-CT: Ignoring SIM notification with status: %{public}@", v15, 0xCu);
  }
LABEL_11:
}

- (void)carrierBundleChange:(id)a3
{
  v3 = _MCLogObjects[3];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "MCUEA-CT: New carrier bundle detected.", v5, 2u);
  }
  id v4 = +[MCProfileConnection sharedConnection];
  [v4 checkCarrierProfile];
}

- (void)preferredDataSimChanged:(id)a3
{
  v5 = _MCLogObjects[3];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [(MCUEAPlugin *)self _descriptionForContext:a3];
    int v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "MCUEA-CT: User data preference changed to: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  id v8 = +[MCProfileConnection sharedConnection];
  [v8 checkCarrierProfile];
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end