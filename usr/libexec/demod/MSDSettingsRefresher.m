@interface MSDSettingsRefresher
+ (id)sharedInstance;
- (BOOL)initializeSettingsFileWithDeviceValues;
- (BOOL)initialized;
- (BrightnessSystemClient)brightnessClient;
- (MSDSettingsRefresher)init;
- (NSNumber)volume;
- (NSString)airDrop;
- (NSString)airplaneMode;
- (NSString)settingsFilePath;
- (NSString)trueTone;
- (SFAirDropDiscoveryController)sfAirDropController;
- (id)airDropMode;
- (id)getSavedValues;
- (void)initializeCacheWithValues:(id)a3;
- (void)initializeWithOverwrite:(BOOL)a3;
- (void)restoreSavedDeviceSettings;
- (void)setAirDrop:(id)a3;
- (void)setAirDropMode:(id)a3;
- (void)setAirplaneMode:(id)a3;
- (void)setBrightnessClient:(id)a3;
- (void)setInitialized:(BOOL)a3;
- (void)setSettingsFilePath:(id)a3;
- (void)setSfAirDropController:(id)a3;
- (void)setTrueTone:(id)a3;
- (void)setVolume:(id)a3;
@end

@implementation MSDSettingsRefresher

+ (id)sharedInstance
{
  if (qword_100189C20 != -1) {
    dispatch_once(&qword_100189C20, &stru_100153898);
  }
  v2 = (void *)qword_100189C28;

  return v2;
}

- (MSDSettingsRefresher)init
{
  v7.receiver = self;
  v7.super_class = (Class)MSDSettingsRefresher;
  v2 = [(MSDSettingsRefresher *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_initialized = 0;
    id v4 = objc_alloc_init((Class)BrightnessSystemClient);
    [(MSDSettingsRefresher *)v3 setBrightnessClient:v4];

    id v5 = objc_alloc_init((Class)SFAirDropDiscoveryController);
    [(MSDSettingsRefresher *)v3 setSfAirDropController:v5];

    [(MSDSettingsRefresher *)v3 setSettingsFilePath:@"/var/mobile/Library/Application Support/ScreenSaverManager/DeviceSettings.plist"];
  }
  return v3;
}

- (void)initializeWithOverwrite:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSFileManager defaultManager];
  if (self->_initialized)
  {
    v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315138;
      v16 = "-[MSDSettingsRefresher initializeWithOverwrite:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s - MSDSettingsRefresher object already initialized", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    objc_super v7 = [(MSDSettingsRefresher *)self settingsFilePath];
    unsigned int v8 = [v5 fileExistsAtPath:v7];

    v9 = sub_100068600();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8) {
      BOOL v11 = !v3;
    }
    else {
      BOOL v11 = 0;
    }
    if (v11)
    {
      if (v10)
      {
        v13 = [(MSDSettingsRefresher *)self settingsFilePath];
        int v15 = 136315394;
        v16 = "-[MSDSettingsRefresher initializeWithOverwrite:]";
        __int16 v17 = 2114;
        v18 = v13;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s - Settings file already exists at %{public}@", (uint8_t *)&v15, 0x16u);
      }
      v14 = [(MSDSettingsRefresher *)self getSavedValues];
      [(MSDSettingsRefresher *)self initializeCacheWithValues:v14];

      self->_initialized = 1;
    }
    else
    {
      if (v10)
      {
        v12 = [(MSDSettingsRefresher *)self settingsFilePath];
        int v15 = 136315394;
        v16 = "-[MSDSettingsRefresher initializeWithOverwrite:]";
        __int16 v17 = 2114;
        v18 = v12;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s - Settings file doesn't exist at %{public}@: creating a new file...", (uint8_t *)&v15, 0x16u);
      }
      self->_initialized = [(MSDSettingsRefresher *)self initializeSettingsFileWithDeviceValues];
    }
  }
}

- (BOOL)initializeSettingsFileWithDeviceValues
{
  BOOL v3 = +[NSMutableDictionary dictionaryWithCapacity:0];
  id v4 = +[NSFileManager defaultManager];
  id v5 = [(MSDSettingsRefresher *)self trueTone];
  if (v5)
  {
    [v3 setObject:v5 forKey:@"TrueTone"];
  }
  else
  {
    v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000D9138();
    }
  }
  objc_super v7 = [(MSDSettingsRefresher *)self airDropMode];

  if (v7)
  {
    [v3 setObject:v7 forKey:@"AirDrop"];
  }
  else
  {
    unsigned int v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000D9104();
    }
  }
  v9 = [(MSDSettingsRefresher *)self volume];

  if (v9)
  {
    [v3 setObject:v9 forKey:@"Volume"];
  }
  else
  {
    BOOL v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000D90D0();
    }
  }
  BOOL v11 = [(MSDSettingsRefresher *)self airplaneMode];

  if (v11)
  {
    [v3 setObject:v11 forKey:@"AirplaneMode"];
  }
  else
  {
    v12 = sub_100068600();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000D909C();
    }
  }
  v13 = [(MSDSettingsRefresher *)self settingsFilePath];
  v14 = [v13 stringByDeletingLastPathComponent];

  if ([v4 fileExistsAtPath:v14])
  {
    id v15 = 0;
  }
  else
  {
    v16 = sub_100068600();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "-[MSDSettingsRefresher initializeSettingsFileWithDeviceValues]";
      __int16 v33 = 2114;
      v34 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s - creating directory at %{public}@", buf, 0x16u);
    }

    __int16 v17 = +[NSURL fileURLWithPath:v14];
    id v30 = 0;
    unsigned __int8 v18 = [v4 createDirectoryAtURL:v17 withIntermediateDirectories:1 attributes:0 error:&v30];
    id v15 = v30;

    if ((v18 & 1) == 0)
    {
      v28 = sub_100068600();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_1000D8FF0((uint64_t)v14, v15);
      }

      goto LABEL_30;
    }
  }
  v19 = v15;
  v20 = [(MSDSettingsRefresher *)self settingsFilePath];
  v21 = +[NSURL fileURLWithPath:v20];
  id v29 = v15;
  [v3 writeToURL:v21 error:&v29];
  id v15 = v29;

  v22 = sub_100068600();
  v23 = v22;
  if (v15)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1000D8F34(self, v15);
    }

LABEL_30:
    BOOL v24 = 0;
    goto LABEL_36;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v25 = [(MSDSettingsRefresher *)self settingsFilePath];
    *(_DWORD *)buf = 136315394;
    v32 = "-[MSDSettingsRefresher initializeSettingsFileWithDeviceValues]";
    __int16 v33 = 2114;
    v34 = v25;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s - Initialized the default system settings file '%{public}@' and cache with values", buf, 0x16u);
  }
  v26 = sub_100068600();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v32 = "-[MSDSettingsRefresher initializeSettingsFileWithDeviceValues]";
    __int16 v33 = 2114;
    v34 = v3;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s - System Settings Values: %{public}@", buf, 0x16u);
  }

  [(MSDSettingsRefresher *)self initializeCacheWithValues:v3];
  id v15 = 0;
  BOOL v24 = 1;
LABEL_36:

  return v24;
}

- (void)initializeCacheWithValues:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"TrueTone"];
  trueTone = self->_trueTone;
  self->_trueTone = v5;

  objc_super v7 = [v4 objectForKey:@"AirDrop"];
  airDrop = self->_airDrop;
  self->_airDrop = v7;

  v9 = [v4 objectForKey:@"Volume"];
  volume = self->_volume;
  self->_volume = v9;

  BOOL v11 = [v4 objectForKey:@"AirplaneMode"];

  airplaneMode = self->_airplaneMode;
  self->_airplaneMode = v11;

  v13 = sub_100068600();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_1000D916C(v13);
  }
}

- (void)restoreSavedDeviceSettings
{
  BOOL initialized = self->_initialized;
  id v4 = sub_100068600();
  id v5 = v4;
  if (initialized)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      BOOL v11 = "-[MSDSettingsRefresher restoreSavedDeviceSettings]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s - Reverting system settings to defaults", (uint8_t *)&v10, 0xCu);
    }

    if (self->_trueTone)
    {
      -[MSDSettingsRefresher setTrueTone:](self, "setTrueTone:");
    }
    else
    {
      v6 = sub_100068600();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1000D9310();
      }
    }
    if (self->_airDrop)
    {
      -[MSDSettingsRefresher setAirDropMode:](self, "setAirDropMode:");
    }
    else
    {
      objc_super v7 = sub_100068600();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1000D92DC();
      }
    }
    if (self->_volume)
    {
      -[MSDSettingsRefresher setVolume:](self, "setVolume:");
    }
    else
    {
      unsigned int v8 = sub_100068600();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000D92A8();
      }
    }
    if (self->_airplaneMode)
    {
      -[MSDSettingsRefresher setAirplaneMode:](self, "setAirplaneMode:");
    }
    else
    {
      v9 = sub_100068600();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000D9274();
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000D91F0(v5);
    }

    [(MSDSettingsRefresher *)self initializeWithOverwrite:0];
  }
}

- (NSNumber)volume
{
  v2 = +[MSDAudioController sharedInstance];
  [v2 getVolumeForCategory:3];
  int v4 = v3;
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000D9344(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  LODWORD(v13) = v4;
  v14 = +[NSNumber numberWithFloat:v13];

  return (NSNumber *)v14;
}

- (void)setVolume:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDSettingsRefresher *)self volume];
  unsigned __int8 v6 = [v4 isEqualToNumber:v5];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = +[MSDAudioController sharedInstance];
    [v4 floatValue];
    [v7 setVolumeTo:3 forCategory:];
    uint64_t v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      [v4 floatValue];
      int v10 = 136315394;
      uint64_t v11 = "-[MSDSettingsRefresher setVolume:]";
      __int16 v12 = 2050;
      double v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s - Set system volume to %{public}1.2f", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (NSString)trueTone
{
  v2 = [(MSDSettingsRefresher *)self brightnessClient];
  id v3 = [v2 copyPropertyForKey:@"ColorAdaptationEnabled"];

  unsigned int v4 = [v3 BOOLValue];
  id v5 = @"NO";
  if (v4) {
    id v5 = @"YES";
  }
  unsigned __int8 v6 = v5;
  uint64_t v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000D93CC();
  }

  return (NSString *)v6;
}

- (void)setTrueTone:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDSettingsRefresher *)self trueTone];
  unsigned __int8 v6 = [v4 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    id v7 = [v4 isEqual:@"YES"];
    uint64_t v8 = [(MSDSettingsRefresher *)self brightnessClient];
    float v9 = +[NSNumber numberWithBool:v7];
    [v8 setProperty:v9 forKey:@"ColorAdaptationEnabled"];

    int v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      __int16 v12 = "-[MSDSettingsRefresher setTrueTone:]";
      __int16 v13 = 2114;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s - Set system true tone setting to %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (NSString)airplaneMode
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100098830;
  v13[3] = &unk_1001538C0;
  v13[4] = &v14;
  v2 = objc_retainBlock(v13);
  if (+[NSThread isMainThread]) {
    ((void (*)(void *))v2[2])(v2);
  }
  else {
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v2);
  }
  if (*((unsigned char *)v15 + 24)) {
    CFStringRef v3 = @"YES";
  }
  else {
    CFStringRef v3 = @"NO";
  }
  id v4 = +[NSString stringWithFormat:@"%@", v3];
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000D9440((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }

  _Block_object_dispose(&v14, 8);

  return (NSString *)v4;
}

- (void)setAirplaneMode:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDSettingsRefresher *)self airplaneMode];
  unsigned __int8 v6 = [v4 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    uint64_t v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472;
    uint64_t v10 = sub_10009899C;
    uint64_t v11 = &unk_100152E00;
    unsigned __int8 v13 = [v4 isEqual:@"YES"];
    id v12 = v4;
    uint64_t v7 = objc_retainBlock(&v8);
    if (+[NSThread isMainThread]) {
      ((void (*)(void ***))v7[2])(v7);
    }
    else {
      dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v7);
    }
  }
}

- (id)airDropMode
{
  v2 = [(MSDSettingsRefresher *)self sfAirDropController];
  unint64_t v3 = (unint64_t)[v2 discoverableMode];

  if (v3 >= 3)
  {
    id v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000D9534();
    }

    CFStringRef v4 = @"Off";
  }
  else
  {
    CFStringRef v4 = off_1001538E0[v3];
  }
  unsigned __int8 v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000D94C0();
  }

  return (id)v4;
}

- (void)setAirDropMode:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDSettingsRefresher *)self airDropMode];
  unsigned __int8 v6 = [v5 isEqualToString:v4];

  if ((v6 & 1) == 0)
  {
    if ([v4 isEqualToString:@"Off"])
    {
      uint64_t v7 = 0;
    }
    else if ([v4 isEqualToString:@"Contacts Only"])
    {
      uint64_t v7 = 1;
    }
    else if ([v4 isEqualToString:@"Everyone"])
    {
      uint64_t v7 = 2;
    }
    else
    {
      uint64_t v7 = 0;
    }
    uint64_t v8 = [(MSDSettingsRefresher *)self sfAirDropController];
    [v8 setDiscoverableMode:v7];

    uint64_t v9 = sub_100068600();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315394;
      uint64_t v11 = "-[MSDSettingsRefresher setAirDropMode:]";
      __int16 v12 = 2114;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s - Set system AirDrop mode setting to %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (id)getSavedValues
{
  unint64_t v3 = +[NSFileManager defaultManager];
  id v4 = [(MSDSettingsRefresher *)self settingsFilePath];
  unsigned int v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    unsigned __int8 v6 = [(MSDSettingsRefresher *)self settingsFilePath];
    uint64_t v7 = +[NSURL fileURLWithPath:v6];
    uint64_t v8 = +[NSDictionary dictionaryWithContentsOfURL:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (NSString)airDrop
{
  return self->_airDrop;
}

- (void)setAirDrop:(id)a3
{
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_BOOL initialized = a3;
}

- (NSString)settingsFilePath
{
  return self->_settingsFilePath;
}

- (void)setSettingsFilePath:(id)a3
{
}

- (BrightnessSystemClient)brightnessClient
{
  return self->_brightnessClient;
}

- (void)setBrightnessClient:(id)a3
{
}

- (SFAirDropDiscoveryController)sfAirDropController
{
  return self->_sfAirDropController;
}

- (void)setSfAirDropController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sfAirDropController, 0);
  objc_storeStrong((id *)&self->_brightnessClient, 0);
  objc_storeStrong((id *)&self->_settingsFilePath, 0);
  objc_storeStrong((id *)&self->_airplaneMode, 0);
  objc_storeStrong((id *)&self->_airDrop, 0);
  objc_storeStrong((id *)&self->_trueTone, 0);

  objc_storeStrong((id *)&self->_volume, 0);
}

@end