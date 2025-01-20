@interface OSIAmbientLightMonitor
- (BrightnessSystemClient)brightnessClient;
- (OSIAmbientLightMonitor)init;
- (int)currentAmbientLightLevel;
- (void)setBrightnessClient:(id)a3;
@end

@implementation OSIAmbientLightMonitor

- (OSIAmbientLightMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)OSIAmbientLightMonitor;
  v2 = [(OSIAmbientLightMonitor *)&v6 init];
  if (v2)
  {
    v3 = (BrightnessSystemClient *)objc_alloc_init((Class)BrightnessSystemClient);
    brightnessClient = v2->_brightnessClient;
    v2->_brightnessClient = v3;
  }
  return v2;
}

- (int)currentAmbientLightLevel
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = -1;
  brightnessClient = self->_brightnessClient;
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_10001D104;
  v14 = &unk_100064EC0;
  v16 = &v17;
  v5 = v3;
  v15 = v5;
  [(BrightnessSystemClient *)brightnessClient registerNotificationBlock:&v11 forProperties:&off_100069928];
  id v6 = [(BrightnessSystemClient *)self->_brightnessClient copyPropertyForKey:@"TrustedLux", v11, v12, v13, v14];
  if (([v6 intValue] & 0x80000000) != 0)
  {
    if ((v18[3] & 0x80000000) == 0) {
      goto LABEL_3;
    }
LABEL_5:
    dispatch_time_t v8 = dispatch_walltime(0, 2000000000);
    goto LABEL_6;
  }
  unsigned int v7 = [v6 intValue];
  *((_DWORD *)v18 + 6) = v7;
  if ((v7 & 0x80000000) != 0) {
    goto LABEL_5;
  }
LABEL_3:
  dispatch_time_t v8 = 0;
LABEL_6:
  dispatch_semaphore_wait(v5, v8);
  [(BrightnessSystemClient *)self->_brightnessClient unregisterNotificationForKey:@"TrustedLux"];
  int v9 = *((_DWORD *)v18 + 6);

  _Block_object_dispose(&v17, 8);
  return v9;
}

- (BrightnessSystemClient)brightnessClient
{
  return self->_brightnessClient;
}

- (void)setBrightnessClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end