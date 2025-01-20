@interface SolarDetectorSemantic
- (BOOL)isContextTriggered;
- (BOOL)synchContext;
- (SolarDetectorSemantic)init;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)getContextState;
- (int)numberOfFields;
- (void)handleBrightnessClientNotification:(id)a3 value:(id)a4;
- (void)initializeSemanticBrightnessHandling;
- (void)processPotentialSolarStateChange:(BOOL)a3;
- (void)setInfoOnlySensorsActive:(BOOL)a3;
- (void)updateCurrentSemanticAmbientLightLevel:(int)a3;
@end

@implementation SolarDetectorSemantic

- (int)numberOfFields
{
  return 3;
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  switch(a3)
  {
    case 2:
      return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%d", self->_currentSemanticLux);
    case 1:
      CFAllocatorRef v3 = kCFAllocatorDefault;
      unsigned int v5 = [(SolarDetectorSemantic *)self isContextTriggered];
      uint64_t v6 = 100;
      if (!v5) {
        uint64_t v6 = 0;
      }
      uint64_t v7 = v6;
      return (__CFString *)CFStringCreateWithFormat(v3, 0, @"%d", v7);
    case 0:
      CFAllocatorRef v3 = kCFAllocatorDefault;
      uint64_t v7 = [(SolarDetectorSemantic *)self getContextState];
      return (__CFString *)CFStringCreateWithFormat(v3, 0, @"%d", v7);
  }
  return 0;
}

- (BOOL)isContextTriggered
{
  return [(SolarDetectorSemantic *)self getContextState] == 5;
}

- (int)getContextState
{
  int sunlightOverrideState = self->_sunlightOverrideState;
  if (sunlightOverrideState < 0) {
    return 1;
  }
  if (sunlightOverrideState) {
    return 5;
  }
  return self->_currentSemanticAmbientLightLevel;
}

- (BOOL)synchContext
{
  if (self->super._infoOnlySensorsActive)
  {
    id v3 = [(BrightnessSystemClient *)self->_brightnessSystemClient copyPropertyForKey:@"TrustedLux"];
    if (v3)
    {
      v4 = v3;
      self->_currentSemanticLux = [v3 intValue];
    }
    else
    {
      self->_currentSemanticLux = -127;
    }
  }
  int v5 = dword_1000AA7BC;
  self->_int sunlightOverrideState = dword_1000AA7BC;
  if (self->_sunlightOverrideStatePrevious != v5)
  {
    self->_sunlightOverrideStatePrevious = v5;
    update_queue = self->_update_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002BBCC;
    block[3] = &unk_100085248;
    block[4] = self;
    dispatch_async((dispatch_queue_t)update_queue, block);
  }
  return 1;
}

- (SolarDetectorSemantic)init
{
  v8.receiver = self;
  v8.super_class = (Class)SolarDetectorSemantic;
  v2 = [(SolarDetectorSemantic *)&v8 init];
  id v3 = v2;
  if (v2)
  {
    v2->super.ctxType = 0;
    v2->super._infoOnlySensorsActive = 0;
    v2->_currentSemanticLux = -127;
    v2->_sunlightState = -1;
    v2->_sunlightStatePrevious = -1;
    v2->_int sunlightOverrideState = 0;
    v2->_sunlightOverrideStatePrevious = 0;
    v2->_update_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.thermalmonitor.solar", 0);
    if (notify_register_check("com.apple.system.thermalsunlightstate", &v3->_thermalSunlightStateToken))
    {
      v4 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_100056EA8(v4);
      }
    }
    [(SolarDetectorSemantic *)v3 updateCurrentSemanticAmbientLightLevel:0];
    int v5 = (BrightnessSystemClient *)objc_alloc_init((Class)BrightnessSystemClient);
    v3->_brightnessSystemClient = v5;
    if (v5)
    {
      [(SolarDetectorSemantic *)v3 initializeSemanticBrightnessHandling];
    }
    else
    {
      uint64_t v6 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_100056E24(v6);
      }
    }
    if (byte_1000AB0E0)
    {
      [+[SensorExchangeHelper sharedInstance] registerCLTMSensorIndex:14 forSMCKey:@"zETM" atSMCIndex:14];
      [+[SensorExchangeHelper sharedInstance] registerCLTMSensorIndex:13 forSMCKey:@"zETM" atSMCIndex:13];
      [+[SensorExchangeHelper sharedInstance] registerCLTMSensorIndex:12 forSMCKey:@"zETM" atSMCIndex:12];
      *(float *)&dword_1000AAE10 = (float)v3->_currentSemanticAmbientLightLevel;
      *(float *)&dword_1000AAE18 = (float)v3->_currentSemanticLux;
      dword_1000AAE14 = 0;
    }
    [+[TGraphSampler sharedInstance] addtGraphDataSource:v3];
  }
  return v3;
}

- (void)initializeSemanticBrightnessHandling
{
  id v3 = [objc_alloc((Class)NSString) initWithUTF8String:"SemanticAmbientLightLevel"];
  id v4 = [(BrightnessSystemClient *)self->_brightnessSystemClient copyPropertyForKey:v3];
  [(SolarDetectorSemantic *)self handleBrightnessClientNotification:v3 value:v4];

  id v5 = [objc_alloc((Class)NSArray) initWithObjects:v3, 0];
  brightnessSystemClient = self->_brightnessSystemClient;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002BA74;
  v7[3] = &unk_100085C58;
  v7[4] = self;
  [(BrightnessSystemClient *)brightnessSystemClient registerNotificationBlock:v7 forProperties:v5];
}

- (void)handleBrightnessClientNotification:(id)a3 value:(id)a4
{
  if (a3 && a4 && !strncmp((const char *)[a3 UTF8String], "SemanticAmbientLightLevel", 0x19uLL))
  {
    if (objc_opt_respondsToSelector())
    {
      id v6 = [a4 intValue];
      [(SolarDetectorSemantic *)self updateCurrentSemanticAmbientLightLevel:v6];
    }
    else
    {
      [(SolarDetectorSemantic *)self updateCurrentSemanticAmbientLightLevel:0];
      if (byte_1000AA7A0)
      {
        uint64_t v7 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
        {
          int v8 = 138412290;
          id v9 = a4;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> brightness callback %@", (uint8_t *)&v8, 0xCu);
        }
      }
    }
  }
}

- (void)updateCurrentSemanticAmbientLightLevel:(int)a3
{
  update_queue = self->_update_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002BC58;
  v4[3] = &unk_100085C80;
  v4[4] = self;
  int v5 = a3;
  dispatch_async((dispatch_queue_t)update_queue, v4);
}

- (void)processPotentialSolarStateChange:(BOOL)a3
{
  if (self->_currentSemanticAmbientLightLevel) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = !a3;
  }
  if (!v3)
  {
    int v5 = [(SolarDetectorSemantic *)self isContextTriggered];
    self->_sunlightState = v5;
    if (self->_sunlightStatePrevious != v5)
    {
      self->_sunlightStatePrevious = v5;
      id v6 = +[TGraphSampler sharedInstance];
      if (self->_sunlightState) {
        uint64_t v7 = 100;
      }
      else {
        uint64_t v7 = 0;
      }
      [(TGraphSampler *)v6 updatePowerlogMiscState:2 value:v7];
      if (self->_sunlightState) {
        uint64_t v8 = 100;
      }
      else {
        uint64_t v8 = 0;
      }
      if (notify_set_state(self->_thermalSunlightStateToken, v8))
      {
        id v9 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
          sub_100056EEC(v9);
        }
      }
      *(float *)&dword_1000AAE14 = (float)self->_sunlightState;
    }
  }
}

- (void)setInfoOnlySensorsActive:(BOOL)a3
{
  self->super._infoOnlySensorsActive = a3;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return off_100085CA0[a3];
  }
}

@end