@interface BCLightLevelController
+ (BCLightLevelController)shared;
+ (id)sharedInstance;
+ (void)preWarm;
- (BCLightLevelController)init;
- (BOOL)_sensorAvailable;
- (BOOL)_sensorShouldBeAvailable;
- (BOOL)isLowLight;
- (BOOL)shouldMonitorLightLevel;
- (int64_t)_luxToLightLevel:(float)a3;
- (int64_t)currentLightLevel;
- (int64_t)emulatedLightLevel;
- (void)_notifyLightLevelChange;
- (void)_startMonitoring;
- (void)_stopMonitoring;
- (void)_updateCurrentLightLevel:(int64_t)a3 force:(BOOL)a4;
- (void)_updateStatsAndLightLevelNow;
- (void)addObserver:(id)a3 changeHandler:(id)a4;
- (void)dealloc;
- (void)emulateCurrentLightLevelChange:(int64_t)a3;
- (void)removeObserver:(id)a3;
- (void)setEmulatedLightLevel:(int64_t)a3;
@end

@implementation BCLightLevelController

+ (void)preWarm
{
  id v2 = +[BCLightLevelController sharedInstance];
  [v2 _startMonitoring];
}

+ (id)sharedInstance
{
  if (qword_345D50 != -1) {
    dispatch_once(&qword_345D50, &stru_2C91B8);
  }
  id v2 = (void *)qword_345D48;

  return v2;
}

+ (BCLightLevelController)shared
{
  return +[BCLightLevelController sharedInstance];
}

- (BCLightLevelController)init
{
  v6.receiver = self;
  v6.super_class = (Class)BCLightLevelController;
  id v2 = [(BCLightLevelController *)&v6 init];
  if (v2)
  {
    v3 = (BrightnessSystemClient *)objc_alloc_init((Class)BrightnessSystemClient);
    client = v2->_client;
    v2->_client = v3;

    v2->_emulatedLightLevel = 0;
    v2->_currentLightLevel = 0;
  }
  return v2;
}

- (void)dealloc
{
  [(BCLightLevelController *)self _stopMonitoring];
  v3.receiver = self;
  v3.super_class = (Class)BCLightLevelController;
  [(BCLightLevelController *)&v3 dealloc];
}

- (BOOL)_sensorAvailable
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_E9F10;
  block[3] = &unk_2C3EC8;
  block[4] = self;
  if (qword_345D60 != -1) {
    dispatch_once(&qword_345D60, block);
  }
  return byte_345D58;
}

- (BOOL)_sensorShouldBeAvailable
{
  if (qword_345D70 != -1) {
    dispatch_once(&qword_345D70, &stru_2C91F8);
  }
  return byte_345D68;
}

- (BOOL)shouldMonitorLightLevel
{
  BOOL v3 = [(BCLightLevelController *)self _sensorAvailable];
  if (v3)
  {
    LOBYTE(v3) = [(BCLightLevelController *)self _sensorShouldBeAvailable];
  }
  return v3;
}

- (void)addObserver:(id)a3 changeHandler:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  observers = self->_observers;
  if (!observers)
  {
    v8 = +[NSMapTable weakToStrongObjectsMapTable];
    v9 = self->_observers;
    self->_observers = v8;

    observers = self->_observers;
  }
  id v10 = [v6 copy];
  [(NSMapTable *)observers setObject:v10 forKey:v11];

  [(BCLightLevelController *)self _startMonitoring];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  -[NSMapTable removeObjectForKey:](self->_observers, "removeObjectForKey:");
  if (![(NSMapTable *)self->_observers count]) {
    [(BCLightLevelController *)self _stopMonitoring];
  }
}

- (BOOL)isLowLight
{
  return (char *)[(BCLightLevelController *)self currentLightLevel] == (char *)&def_7D91C + 2;
}

- (int64_t)currentLightLevel
{
  int64_t result = self->_emulatedLightLevel;
  if (!result) {
    return self->_currentLightLevel;
  }
  return result;
}

- (void)emulateCurrentLightLevelChange:(int64_t)a3
{
  v5 = [(BCLightLevelController *)self currentLightLevel];
  self->_emulatedLightLevel = a3;
  if (v5 != (void *)[(BCLightLevelController *)self currentLightLevel])
  {
    [(BCLightLevelController *)self _notifyLightLevelChange];
  }
}

- (void)_updateCurrentLightLevel:(int64_t)a3 force:(BOOL)a4
{
  v7 = [(BCLightLevelController *)self currentLightLevel];
  if (a4 || a3 && self->_currentLightLevel != a3) {
    self->_currentLightLevel = a3;
  }
  if (v7 != (char *)[(BCLightLevelController *)self currentLightLevel])
  {
    v8 = _BCLightLevelLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (v7 == (unsigned char *)&def_7D91C + 1) {
        v9 = @"regular";
      }
      else {
        v9 = @"unknown";
      }
      if (v7 == (unsigned char *)&def_7D91C + 2) {
        v9 = @"low";
      }
      id v10 = v9;
      if (a3 == 1) {
        id v11 = @"regular";
      }
      else {
        id v11 = @"unknown";
      }
      if (a3 == 2) {
        id v11 = @"low";
      }
      v12 = v11;
      int v13 = 138412546;
      v14 = v10;
      __int16 v15 = 2112;
      v16 = v12;
      _os_log_impl(&def_7D91C, v8, OS_LOG_TYPE_DEFAULT, "_notifyLightLevelChange old:%@ new: %@", (uint8_t *)&v13, 0x16u);
    }
    [(BCLightLevelController *)self _notifyLightLevelChange];
  }
}

- (void)_notifyLightLevelChange
{
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"BCLightLevelChangedNotification" object:self];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(NSMapTable *)self->_observers keyEnumerator];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        v9 = [(NSMapTable *)self->_observers objectForKey:v8];
        ((void (**)(void, BCLightLevelController *, uint64_t))v9)[2](v9, self, v8);
      }
      id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (int64_t)_luxToLightLevel:(float)a3
{
  if (a3 < 0.0) {
    return 0;
  }
  if (a3 <= 2.5) {
    return 2;
  }
  return a3 >= 20.0;
}

- (void)_updateStatsAndLightLevelNow
{
  if ([(BCLightLevelController *)self shouldMonitorLightLevel])
  {
    id v3 = [(BrightnessSystemClient *)self->_client copyPropertyForKey:@"TrustedLux"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v5 = _BCLightLevelLog();
    uint64_t v6 = v5;
    if (isKindOfClass)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        id v12 = v3;
        _os_log_impl(&def_7D91C, v6, OS_LOG_TYPE_DEFAULT, "_updateStatsAndLightLevelNow: lux value: %@", (uint8_t *)&v11, 0xCu);
      }

      [v3 floatValue];
      unint64_t v7 = -[BCLightLevelController _luxToLightLevel:](self, "_luxToLightLevel:");
      if (v7 <= 1) {
        uint64_t v8 = 1;
      }
      else {
        uint64_t v8 = v7;
      }
      [(BCLightLevelController *)self _updateCurrentLightLevel:v8 force:1];
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v9 = (objc_class *)objc_opt_class();
        long long v10 = NSStringFromClass(v9);
        int v11 = 138412290;
        id v12 = v10;
        _os_log_impl(&def_7D91C, v6, OS_LOG_TYPE_ERROR, "Object for 'kCBTrustedLux' was '%@' and not NSNumber like expected", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

- (void)_startMonitoring
{
  if (!self->_monitoring && [(BCLightLevelController *)self shouldMonitorLightLevel])
  {
    id v3 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v4 = [v3 BOOLForKey:@"BCShouldOverrideNightMode"];

    client = self->_client;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_EA874;
    v8[3] = &unk_2C9248;
    unsigned __int8 v9 = v4;
    v8[4] = self;
    [(BrightnessSystemClient *)client registerNotificationBlock:v8 forProperties:&off_2E7930];
    self->_monitoring = 1;
    [(BCLightLevelController *)self _updateStatsAndLightLevelNow];
    uint64_t v6 = _BCLightLevelLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v7 = 0;
      _os_log_impl(&def_7D91C, v6, OS_LOG_TYPE_DEFAULT, "Light Level Monitoring Started", v7, 2u);
    }
  }
}

- (void)_stopMonitoring
{
  client = self->_client;
  if (client)
  {
    [(BrightnessSystemClient *)client registerNotificationBlock:0 forProperties:0];
    unsigned __int8 v4 = _BCLightLevelLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&def_7D91C, v4, OS_LOG_TYPE_DEFAULT, "Light Level Monitoring Stopped", v5, 2u);
    }
  }
  self->_monitoring = 0;
}

- (int64_t)emulatedLightLevel
{
  return self->_emulatedLightLevel;
}

- (void)setEmulatedLightLevel:(int64_t)a3
{
  self->_emulatedLightLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end