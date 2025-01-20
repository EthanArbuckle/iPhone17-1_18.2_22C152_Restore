@interface PLAggregateLogger
- (BOOL)getCurrentDisplayState;
- (BOOL)getCurrentLPMState;
- (BOOL)isCharging;
- (BOOL)isLPMOn;
- (BOOL)isPlugged;
- (BOOL)lastLPMStatus;
- (NSMutableArray)baseStates;
- (NSMutableDictionary)compositeStates;
- (PLAggregateLogger)init;
- (double)backlightLevel;
- (double)lastChargeAccum;
- (double)lastCurrentCapacity;
- (double)lastCurrentCapacityAbsolute;
- (double)lastCurrentCapacityRaw;
- (double)lastDOD0;
- (double)lastPassedCharge;
- (double)lastTime;
- (double)lastVoltage;
- (int)binSessionLength:(int64_t)a3;
- (unsigned)currentBatteryLevel;
- (unsigned)currentState;
- (void)dealloc;
- (void)handleAODMode:(id)a3;
- (void)handleBatteryStatus:(id)a3;
- (void)handleDayChange;
- (void)handleEvent:(unsigned int)a3 withStatus:(BOOL)a4;
- (void)handleLPMEvent:(id)a3 withAggdKeys:(id)a4 withAggregateState:(id)a5;
- (void)handleLPMStatus:(id)a3;
- (void)handleScreenOff:(id)a3;
- (void)handleScreenOn:(id)a3;
- (void)handleSleep:(id)a3;
- (void)handleWake:(id)a3;
- (void)queryBatteryStatsAtBoot;
- (void)setBaseStates:(id)a3;
- (void)setCompositeStates:(id)a3;
- (void)setCurrentBatteryLevel:(unsigned int)a3;
- (void)setCurrentState:(unsigned int)a3;
- (void)setLastChargeAccum:(double)a3;
- (void)setLastCurrentCapacity:(double)a3;
- (void)setLastCurrentCapacityAbsolute:(double)a3;
- (void)setLastCurrentCapacityRaw:(double)a3;
- (void)setLastDOD0:(double)a3;
- (void)setLastLPMStatus:(BOOL)a3;
- (void)setLastPassedCharge:(double)a3;
- (void)setLastTime:(double)a3;
- (void)setLastVoltage:(double)a3;
@end

@implementation PLAggregateLogger

- (double)backlightLevel
{
  BKSDisplayBrightnessGetCurrent();
  return v2;
}

- (PLAggregateLogger)init
{
  v28.receiver = self;
  v28.super_class = (Class)PLAggregateLogger;
  float v2 = [(PLAggregateLogger *)&v28 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)NSMutableArray);
    if (+[PLPowerEventListener hasBaseband]) {
      uint64_t v4 = 32;
    }
    else {
      uint64_t v4 = 16;
    }
    v2->baseStates = (NSMutableArray *)[v3 initWithCapacity:v4];
    +[PLPowerEventListener hasBaseband];
    unint64_t v5 = 0;
    do
    {
      [(NSMutableArray *)v2->baseStates setObject:objc_alloc_init(PLAggregateState) atIndexedSubscript:v5++];
      if (+[PLPowerEventListener hasBaseband]) {
        unint64_t v6 = 32;
      }
      else {
        unint64_t v6 = 16;
      }
    }
    while (v5 < v6);
    v2->compositeStates = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:11];
    v49 = &off_13C28;
    v50 = &off_13C28;
    [(NSMutableDictionary *)v2->compositeStates setObject:+[PLAggregateState stateWithSubstateIndices:](PLAggregateState, "stateWithSubstateIndices:", sub_2CAC(+[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1])) forKeyedSubscript:@"unplugged"];
    v47[0] = &off_13C28;
    v47[1] = &off_13C40;
    v48[0] = &off_13C28;
    v48[1] = &off_13C28;
    [(NSMutableDictionary *)v2->compositeStates setObject:+[PLAggregateState stateWithSubstateIndices:](PLAggregateState, "stateWithSubstateIndices:", sub_2CAC(+[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2])) forKeyedSubscript:@"unplugged_asleep"];
    v45[0] = &off_13C28;
    v45[1] = &off_13C40;
    v46[0] = &off_13C28;
    v46[1] = &off_13C40;
    [(NSMutableDictionary *)v2->compositeStates setObject:+[PLAggregateState stateWithSubstateIndices:](PLAggregateState, "stateWithSubstateIndices:", sub_2CAC(+[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2])) forKeyedSubscript:@"unplugged_awake"];
    v43[0] = &off_13C28;
    v43[1] = &off_13C40;
    v44[0] = &off_13C28;
    v44[1] = &off_13C40;
    v43[2] = &off_13C58;
    v44[2] = &off_13C40;
    [(NSMutableDictionary *)v2->compositeStates setObject:+[PLAggregateState stateWithSubstateIndices:](PLAggregateState, "stateWithSubstateIndices:", sub_2CAC(+[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:3])) forKeyedSubscript:@"unplugged_screen_on"];
    v41[0] = &off_13C28;
    v41[1] = &off_13C40;
    v42[0] = &off_13C28;
    v42[1] = &off_13C40;
    v41[2] = &off_13C58;
    v42[2] = &off_13C28;
    [(NSMutableDictionary *)v2->compositeStates setObject:+[PLAggregateState stateWithSubstateIndices:](PLAggregateState, "stateWithSubstateIndices:", sub_2CAC(+[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:3])) forKeyedSubscript:@"unplugged_screen_off"];
    if (+[PLPowerEventListener supportsLPM])
    {
      v39[0] = &off_13C28;
      v39[1] = &off_13C70;
      v40[0] = &off_13C28;
      v40[1] = &off_13C40;
      [(NSMutableDictionary *)v2->compositeStates setObject:+[PLAggregateState stateWithSubstateIndices:](PLAggregateState, "stateWithSubstateIndices:", sub_2CAC(+[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2])) forKeyedSubscript:@"unplugged_lpm_on"];
      v37[0] = &off_13C28;
      v37[1] = &off_13C70;
      v38[0] = &off_13C28;
      v38[1] = &off_13C28;
      [(NSMutableDictionary *)v2->compositeStates setObject:+[PLAggregateState stateWithSubstateIndices:](PLAggregateState, "stateWithSubstateIndices:", sub_2CAC(+[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2])) forKeyedSubscript:@"unplugged_lpm_off"];
    }
    v35 = &off_13C28;
    v36 = &off_13C40;
    [(NSMutableDictionary *)v2->compositeStates setObject:+[PLAggregateState stateWithSubstateIndices:](PLAggregateState, "stateWithSubstateIndices:", sub_2CAC(+[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1])) forKeyedSubscript:@"pluggedin"];
    v33[0] = &off_13C28;
    v33[1] = &off_13C88;
    v34[0] = &off_13C40;
    v34[1] = &off_13C40;
    [(NSMutableDictionary *)v2->compositeStates setObject:+[PLAggregateState stateWithSubstateIndices:](PLAggregateState, "stateWithSubstateIndices:", sub_2CAC(+[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2])) forKeyedSubscript:@"pluggedin_charging"];
    v31[0] = &off_13C28;
    v31[1] = &off_13C40;
    v32[0] = &off_13C40;
    v32[1] = &off_13C40;
    v31[2] = &off_13C58;
    v32[2] = &off_13C40;
    [(NSMutableDictionary *)v2->compositeStates setObject:+[PLAggregateState stateWithSubstateIndices:](PLAggregateState, "stateWithSubstateIndices:", sub_2CAC(+[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3])) forKeyedSubscript:@"pluggedin_screen_on"];
    v29[0] = &off_13C28;
    v29[1] = &off_13C40;
    v30[0] = &off_13C40;
    v30[1] = &off_13C40;
    v29[2] = &off_13C58;
    v30[2] = &off_13C28;
    [(NSMutableDictionary *)v2->compositeStates setObject:+[PLAggregateState stateWithSubstateIndices:](PLAggregateState, "stateWithSubstateIndices:", sub_2CAC(+[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:3])) forKeyedSubscript:@"pluggedin_screen_off"];
    id v7 = (id)objc_opt_new();
    [+[NSDate date] timeIntervalSince1970];
    v2->lastTime = v8;
    v2->lastVoltage = (double)(uint64_t)[v7 voltage] / 1000.0;
    if ([v7 gasGaugeEnabled]) {
      [v7 currentCapacity];
    }
    else {
      [v7 rawCapacity];
    }
    v2->lastCurrentCapacity = v9;
    if ([v7 gasGaugeEnabled]) {
      [v7 currentAbsoluteCapacity];
    }
    else {
      [v7 rawCapacity];
    }
    v2->lastCurrentCapacityAbsolute = v10;
    [v7 passedCharge];
    v2->lastPassedCharge = v11;
    [v7 chargeAccum];
    v2->lastChargeAccum = v12;
    [v7 dod0];
    v2->lastDOD0 = v13;
    if ([v7 gasGaugeEnabled]) {
      [v7 rawCurrentCapacity];
    }
    else {
      [v7 rawCapacity];
    }
    v2->lastCurrentCapacityRaw = v14;
    if (+[PLPowerEventListener supportsLPM]) {
      v2->lastLPMStatus = [(PLAggregateLogger *)v2 getCurrentLPMState];
    }
    [v7 currentCapacity];
    double v16 = v15;
    [v7 maxCapacity];
    v2->currentBatteryLevel = (ceil(v16 / v17 * 10.0) * 10.0);
    [(PLAggregateLogger *)v2 setCurrentState:0];
    v18 = objc_alloc_init(PLBatteryProperties);
    [(PLAggregateLogger *)v2 handleEvent:3 withStatus:[(PLBatteryProperties *)v18 isCharging]];
    [(PLAggregateLogger *)v2 handleEvent:0 withStatus:[(PLBatteryProperties *)v18 isPluggedIn]];
    [(PLAggregateLogger *)v2 handleEvent:1 withStatus:1];
    [(PLAggregateLogger *)v2 handleEvent:2 withStatus:[(PLAggregateLogger *)v2 getCurrentDisplayState]];
    if (+[PLPowerEventListener supportsLPM]) {
      [(PLAggregateLogger *)v2 handleEvent:4 withStatus:[(PLAggregateLogger *)v2 lastLPMStatus]];
    }
    v19 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v19 addObserver:v2 selector:"handleWake:" name:PLDeviceDidWakeNotification object:0];
    v20 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v20 addObserver:v2 selector:"handleSleep:" name:PLDeviceWillSleepNotification object:0];
    v21 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v21 addObserver:v2 selector:"handleScreenOn:" name:PLDeviceBacklightOnNotification object:0];
    v22 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v22 addObserver:v2 selector:"handleScreenOff:" name:PLDeviceBacklightOffNotification object:0];
    if (+[PLPowerEventListener hasAOD])
    {
      v23 = +[NSNotificationCenter defaultCenter];
      [(NSNotificationCenter *)v23 addObserver:v2 selector:"handleAODMode:" name:PLAODModeNotification object:0];
    }
    v24 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v24 addObserver:v2 selector:"handleBatteryStatus:" name:PLBatteryStatusDidChangeNotification object:0];
    if (+[PLPowerEventListener supportsLPM])
    {
      v25 = +[NSNotificationCenter defaultCenter];
      [(NSNotificationCenter *)v25 addObserver:v2 selector:"handleLPMStatus:" name:PLLPMStatusDidChangeNotification object:0];
    }
    [(PLAggregateLogger *)v2 queryBatteryStatsAtBoot];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_2E70;
    v27[3] = &unk_103A0;
    v27[4] = v2;
    [+[NSNotificationCenter defaultCenter] addObserverForName:NSCalendarDayChangedNotification object:0 queue:0 usingBlock:v27];
  }
  return v2;
}

- (void)dealloc
{
  [+[NSNotificationCenter defaultCenter] removeObserver:self];
  [(NSMutableArray *)self->baseStates removeAllObjects];

  [(NSMutableDictionary *)self->compositeStates removeAllObjects];
  v3.receiver = self;
  v3.super_class = (Class)PLAggregateLogger;
  [(PLAggregateLogger *)&v3 dealloc];
}

- (BOOL)getCurrentDisplayState
{
  if (+[PLPowerEventListener hasAOD])
  {
    unint64_t v2 = (unint64_t)objc_msgSend(+[BLSBacklight sharedBacklight](BLSBacklight, "sharedBacklight"), "backlightState");
    if (v2 >= 4)
    {
      if (qword_13D08 != -1) {
        dispatch_once(&qword_13D08, &stru_10378);
      }
      double v9 = off_13B48;
      if (os_log_type_enabled((os_log_t)off_13B48, OS_LOG_TYPE_ERROR)) {
        sub_A8F8(v9);
      }
      LOBYTE(v3) = 0;
    }
    else
    {
      return (0xCu >> (v2 & 0xF)) & 1;
    }
  }
  else
  {
    LOBYTE(v3) = 1;
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, (CFDictionaryRef)+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", +[NSNumber numberWithBool:1], @"backlight-control"), @"IOPropertyMatch"));
    int valuePtr = 0;
    CFDictionaryRef CFProperty = (const __CFDictionary *)IORegistryEntryCreateCFProperty(MatchingService, @"IODisplayParameters", kCFAllocatorDefault, 0);
    if (CFProperty)
    {
      CFDictionaryRef v6 = CFProperty;
      CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(CFProperty, @"brightness");
      if (Value && (CFNumberRef v8 = (const __CFNumber *)CFDictionaryGetValue(Value, @"value")) != 0)
      {
        CFNumberGetValue(v8, kCFNumberSInt32Type, &valuePtr);
        CFRelease(v6);
        LOBYTE(v3) = valuePtr > 0;
      }
      else
      {
        CFRelease(v6);
      }
    }
  }
  return v3;
}

- (BOOL)getCurrentLPMState
{
  int out_token = 0;
  uint64_t v4 = 0;
  uint32_t v2 = notify_register_check("com.apple.system.lowpowermode", &out_token);
  BOOL result = 0;
  if (!v2)
  {
    notify_get_state(out_token, &v4);
    notify_cancel(out_token);
    return v4 == 1;
  }
  return result;
}

- (void)handleEvent:(unsigned int)a3 withStatus:(BOOL)a4
{
  int v4 = a4;
  objc_sync_enter(self);
  unsigned int v8 = [(PLAggregateLogger *)self currentState];
  context = v7;
  if (+[PLPowerEventListener hasBaseband]) {
    int v9 = 31;
  }
  else {
    int v9 = 15;
  }
  id v122 = [(NSMutableArray *)self->baseStates objectAtIndex:v9 & v8];
  double v10 = +[NSDate date];
  [(NSDate *)v10 timeIntervalSince1970];
  double v12 = 0.0;
  double v13 = 0.0;
  double v14 = 0.0;
  double v15 = 0.0;
  double v16 = 0.0;
  double v17 = 0.0;
  double v18 = 0.0;
  if ((int)v11 != (int)self->lastTime)
  {
    id v19 = (id)objc_opt_new();
    id v20 = [v19 voltage];
    if ([v19 gasGaugeEnabled]) {
      [v19 currentCapacity];
    }
    else {
      [v19 rawCapacity];
    }
    id obj = v21;
    if ([v19 gasGaugeEnabled]) {
      [v19 currentAbsoluteCapacity];
    }
    else {
      [v19 rawCapacity];
    }
    double v126 = v22;
    if ([v19 gasGaugeEnabled]) {
      [v19 rawCurrentCapacity];
    }
    else {
      [v19 rawCapacity];
    }
    double v123 = v23;
    double lastVoltage = self->lastVoltage;
    double lastCurrentCapacity = self->lastCurrentCapacity;
    double lastCurrentCapacityAbsolute = self->lastCurrentCapacityAbsolute;
    [v19 passedCharge];
    double v28 = v27;
    double lastPassedCharge = self->lastPassedCharge;
    [v19 chargeAccum];
    double v120 = v30;
    double lastChargeAccum = self->lastChargeAccum;
    [v19 dod0];
    double v31 = v28 - lastPassedCharge;
    double lastCurrentCapacityRaw = self->lastCurrentCapacityRaw;
    BOOL v34 = v33 - self->lastDOD0 == 0.0;
    double v35 = 0.0;
    if (v34) {
      double v35 = v31;
    }
    double v118 = v35;
    unsigned int v36 = [(PLAggregateLogger *)self isCharging];
    double v37 = (double)(uint64_t)v20 / 1000.0;
    double v38 = (v37 + lastVoltage) * 0.5;
    double v39 = v123 - lastCurrentCapacityRaw;
    double v40 = v38 * (*(double *)&obj - lastCurrentCapacity);
    double v14 = v38 * (v126 - lastCurrentCapacityAbsolute);
    double v41 = v38 * v39;
    if (v36 && [(PLAggregateLogger *)self isPlugged])
    {
      if (v40 < 0.0) {
        double v12 = 0.0;
      }
      else {
        double v12 = v38 * (*(double *)&obj - lastCurrentCapacity);
      }
      if (v14 < 0.0) {
        double v13 = 0.0;
      }
      else {
        double v13 = v38 * (v126 - lastCurrentCapacityAbsolute);
      }
      BOOL v42 = v41 >= 0.0;
    }
    else
    {
      if (v40 > 0.0) {
        double v12 = 0.0;
      }
      else {
        double v12 = v38 * (*(double *)&obj - lastCurrentCapacity);
      }
      if (v14 > 0.0) {
        double v13 = 0.0;
      }
      else {
        double v13 = v38 * (v126 - lastCurrentCapacityAbsolute);
      }
      BOOL v42 = v41 <= 0.0;
    }
    if (v42) {
      double v17 = v41;
    }
    else {
      double v17 = 0.0;
    }
    if (qword_13D08 != -1) {
      dispatch_once(&qword_13D08, &stru_10378);
    }
    v43 = off_13B48;
    if (os_log_type_enabled((os_log_t)off_13B48, OS_LOG_TYPE_DEBUG)) {
      sub_AAE0([(PLAggregateLogger *)self isCharging], [(PLAggregateLogger *)self isPlugged], buf, v43);
    }
    if (os_log_type_enabled((os_log_t)off_13B48, OS_LOG_TYPE_DEBUG)) {
      sub_AA44();
    }
    if (os_log_type_enabled((os_log_t)off_13B48, OS_LOG_TYPE_DEBUG)) {
      sub_A9A8();
    }
    if (os_log_type_enabled((os_log_t)off_13B48, OS_LOG_TYPE_DEBUG)) {
      sub_A93C();
    }
    [(NSDate *)v10 timeIntervalSinceDate:+[NSDate dateWithTimeIntervalSince1970:self->lastTime]];
    double v18 = v44;
    self->double lastVoltage = v37;
    self->double lastCurrentCapacity = *(double *)&obj;
    self->double lastCurrentCapacityAbsolute = v126;
    [v19 passedCharge];
    self->double lastPassedCharge = v45;
    [v19 chargeAccum];
    self->double lastChargeAccum = v46;
    [v19 dod0];
    self->lastDOD0 = v47;
    self->double lastCurrentCapacityRaw = v123;
    [(NSDate *)v10 timeIntervalSince1970];
    double v15 = v38 * v118;
    double v16 = v38 * (v120 - lastChargeAccum);
    self->lastTime = v48;
    if (a3 == 4)
    {
      [v19 currentCapacity];
      double v50 = v49;
      [v19 maxCapacity];
      self->currentBatteryLevel = (ceil(v50 / v51 * 10.0) * 10.0);
    }
  }
  BOOL v52 = v18 < 0.0;
  if (v18 > 86400.0) {
    BOOL v52 = 1;
  }
  BOOL v53 = 1;
  if (fabs(v12) >= 10000.0
    && fabs(v13) >= 10000.0
    && fabs(v14) >= 10000.0
    && fabs(v15) >= 10000.0
    && fabs(v16) >= 10000.0)
  {
    BOOL v53 = fabs(v17) < 10000.0;
  }
  if (!v52 && v53) {
    objc_msgSend(v122, "setTime:energy:energyAbsolute:energyAbsoluteNet:energyPassedChargeNet:energyChargeAccumNet:energyRaw:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v18), +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -v12), +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -v13), +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -v14), +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v15), +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v16), +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -v17));
  }
  unsigned int obja = [(PLAggregateLogger *)self currentState] & ~(1 << a3) | (v4 << a3);
  if (obja == [(PLAggregateLogger *)self currentState])
  {
    int v54 = 0;
    int v55 = 0;
  }
  else
  {
    [v122 incrementCount];
    long long v175 = 0u;
    long long v176 = 0u;
    long long v173 = 0u;
    long long v174 = 0u;
    compositeStates = self->compositeStates;
    id v57 = [(NSMutableDictionary *)compositeStates countByEnumeratingWithState:&v173 objects:v180 count:16];
    if (v57)
    {
      int v124 = 0;
      int v127 = 0;
      uint64_t v58 = *(void *)v174;
      do
      {
        for (i = 0; i != v57; i = (char *)i + 1)
        {
          if (*(void *)v174 != v58) {
            objc_enumerationMutation(compositeStates);
          }
          v60 = *(void **)(*((void *)&v173 + 1) + 8 * i);
          id v61 = [(NSMutableDictionary *)self->compositeStates objectForKeyedSubscript:v60];
          if (objc_msgSend(objc_msgSend(v61, "substateIndices"), "containsObject:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[PLAggregateLogger currentState](self, "currentState")))&& (objc_msgSend(objc_msgSend(v61, "substateIndices"), "containsObject:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", obja)) & 1) == 0)
          {
            [v61 incrementCount];
            unsigned int v62 = [v60 isEqualToString:@"pluggedin_screen_on"];
            unsigned int v63 = [v60 isEqualToString:@"unplugged_screen_on"];
            int v64 = v124;
            if (v62) {
              int v64 = 1;
            }
            int v124 = v64;
            if (v63) {
              int v65 = 1;
            }
            else {
              int v65 = v127;
            }
            int v127 = v65;
          }
        }
        id v57 = [(NSMutableDictionary *)compositeStates countByEnumeratingWithState:&v173 objects:v180 count:16];
      }
      while (v57);
    }
    else
    {
      LOBYTE(v124) = 0;
      LOBYTE(v127) = 0;
    }
    int v54 = v124 & 1;
    int v55 = v127 & 1;
  }
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(objc_msgSend(v122, "time"), "doubleValue");
    double v67 = v66;
    objc_msgSend(objc_msgSend(v122, "energy"), "doubleValue");
    double v69 = v68;
    objc_msgSend(objc_msgSend(v122, "energyAbsolute"), "doubleValue");
    double v71 = v70;
    objc_msgSend(objc_msgSend(v122, "energyAbsoluteNet"), "doubleValue");
    double v73 = v72;
    objc_msgSend(objc_msgSend(v122, "energyPassedChargeNet"), "doubleValue");
    double v75 = v74;
    objc_msgSend(objc_msgSend(v122, "energyChargeAccumNet"), "doubleValue");
    double v77 = v76;
    objc_msgSend(objc_msgSend(v122, "energyRaw"), "doubleValue");
    double v79 = v78;
    unsigned int v80 = [(PLAggregateLogger *)self currentState];
    unint64_t v81 = llround(v67);
    unint64_t v82 = llround(v69);
    unint64_t v83 = llround(v71);
    unint64_t v84 = llround(v73);
    unint64_t v85 = llround(v75);
    unint64_t v86 = llround(v77);
    unint64_t v87 = llround(v79);
    if (v81 || v82 || v83 || v84 || v85 || v86 || v87 || v80 != obja)
    {
      v159 = _NSConcreteStackBlock;
      uint64_t v160 = 3221225472;
      v161 = sub_40C4;
      v162 = &unk_103C8;
      unint64_t v165 = v82;
      unint64_t v166 = v83;
      unint64_t v167 = v84;
      unint64_t v168 = v85;
      unint64_t v169 = v86;
      unint64_t v170 = v87;
      BOOL v172 = v80 != obja;
      v163 = self;
      unint64_t v164 = v81;
      unsigned int v171 = obja;
      AnalyticsSendEventLazy();
    }
  }
  [(PLAggregateLogger *)self setCurrentState:obja];
  id v88 = +[NSMutableDictionary dictionary];
  int v128 = v54;
  int v125 = v55;
  long long v157 = 0u;
  long long v158 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  id v89 = [(NSMutableDictionary *)self->compositeStates allKeys];
  id v90 = [v89 countByEnumeratingWithState:&v155 objects:v179 count:16];
  if (v90)
  {
    uint64_t v91 = *(void *)v156;
    id objb = v89;
    do
    {
      for (j = 0; j != v90; j = (char *)j + 1)
      {
        if (*(void *)v156 != v91) {
          objc_enumerationMutation(objb);
        }
        uint64_t v93 = *(void *)(*((void *)&v155 + 1) + 8 * (void)j);
        id v94 = [(NSMutableDictionary *)self->compositeStates objectForKeyedSubscript:v93];
        objc_msgSend(v94, "updateCompositeStateWithBaseStates:", -[PLAggregateLogger baseStates](self, "baseStates"));
        objc_msgSend(objc_msgSend(v94, "time"), "doubleValue");
        [v88 setObject:+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", llround(v95)), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.state.%@.duration", v93) forKeyedSubscript];
        objc_msgSend(objc_msgSend(v94, "energy"), "doubleValue");
        [v88 setObject:+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", llround(v96)), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.state.%@.energy", v93) forKeyedSubscript];
        objc_msgSend(objc_msgSend(v94, "energyAbsolute"), "doubleValue");
        [v88 setObject:+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", llround(v97)), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.state.%@.energyAbsolute", v93) forKeyedSubscript];
        objc_msgSend(objc_msgSend(v94, "energyRaw"), "doubleValue");
        [v88 setObject:+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", llround(v98)), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.state.%@.energyRaw", v93) forKeyedSubscript];
        [v88 setObject:+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", objc_msgSend(objc_msgSend(v94, "count"), "longValue")), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.state.%@.count", v93) forKeyedSubscript];
        objc_msgSend(objc_msgSend(v94, "energyAbsoluteNet"), "doubleValue");
        [v88 setObject:+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", llround(v99)), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.state.%@.energyAbsoluteNet", v93) forKeyedSubscript];
        objc_msgSend(objc_msgSend(v94, "energyPassedChargeNet"), "doubleValue");
        [v88 setObject:+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", llround(v100)), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.state.%@.energyPassedChargeNet", v93) forKeyedSubscript];
        objc_msgSend(objc_msgSend(v94, "energyChargeAccumNet"), "doubleValue");
        [v88 setObject:+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", llround(v101)), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.state.%@.energyChargeAccumNet", v93) forKeyedSubscript];
        if (+[PLPowerEventListener supportsLPM]) {
          [(PLAggregateLogger *)self handleLPMEvent:v93 withAggdKeys:v88 withAggregateState:v94];
        }
      }
      id v90 = [objb countByEnumeratingWithState:&v155 objects:v179 count:16];
    }
    while (v90);
  }
  [(PLAggregateLogger *)self backlightLevel];
  unint64_t v103 = (unint64_t)(v102 * 100.0);
  objc_msgSend(v88, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v103), @"com.apple.power.backlight.usersetting");
  if (_os_feature_enabled_impl())
  {
    v150 = _NSConcreteStackBlock;
    uint64_t v151 = 3221225472;
    v152 = sub_4314;
    v153 = &unk_103E8;
    unint64_t v154 = v103;
    AnalyticsSendEventLazy();
  }
  if (v128)
  {
    id v104 = [(NSMutableDictionary *)self->compositeStates objectForKeyedSubscript:@"pluggedin_screen_on"];
    objc_msgSend(objc_msgSend(v104, "compositeTime"), "doubleValue");
    unint64_t v106 = llround(v105);
    [v88 setObject:&off_13C40, objc_msgSend(@"com.apple.power.state.pluggedin_screen.bin", "stringByAppendingString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%i", -[PLAggregateLogger binSessionLength:](self, "binSessionLength:", v106))) forKeyedSubscript];
    if (_os_feature_enabled_impl())
    {
      v145 = _NSConcreteStackBlock;
      uint64_t v146 = 3221225472;
      v147 = sub_4398;
      v148 = &unk_103E8;
      unint64_t v149 = v106;
      AnalyticsSendEventLazy();
    }
    [v104 setCompositeTime:&off_13C28];
  }
  if (v125)
  {
    id v107 = [(NSMutableDictionary *)self->compositeStates objectForKeyedSubscript:@"unplugged_screen_on"];
    objc_msgSend(objc_msgSend(v107, "compositeTime"), "doubleValue");
    unint64_t v109 = llround(v108);
    [v88 setObject:&off_13C40, objc_msgSend(@"com.apple.power.state.unpluggedin_screen.bin", "stringByAppendingString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%i", -[PLAggregateLogger binSessionLength:](self, "binSessionLength:", v109))) forKeyedSubscript];
    if (_os_feature_enabled_impl())
    {
      v140 = _NSConcreteStackBlock;
      uint64_t v141 = 3221225472;
      v142 = sub_4430;
      v143 = &unk_103E8;
      unint64_t v144 = v109;
      AnalyticsSendEventLazy();
    }
    [v107 setCompositeTime:&off_13C28];
  }
  ADClientBatchKeys();
  long long v138 = 0u;
  long long v139 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  baseStates = self->baseStates;
  id v111 = [(NSMutableArray *)baseStates countByEnumeratingWithState:&v136 objects:v178 count:16];
  if (v111)
  {
    uint64_t v112 = *(void *)v137;
    do
    {
      for (k = 0; k != v111; k = (char *)k + 1)
      {
        if (*(void *)v137 != v112) {
          objc_enumerationMutation(baseStates);
        }
        [*(id *)(*((void *)&v136 + 1) + 8 * (void)k) resetStats];
      }
      id v111 = [(NSMutableArray *)baseStates countByEnumeratingWithState:&v136 objects:v178 count:16];
    }
    while (v111);
  }
  long long v134 = 0u;
  long long v135 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  id v114 = [(NSMutableDictionary *)self->compositeStates allValues];
  id v115 = [v114 countByEnumeratingWithState:&v132 objects:v177 count:16];
  if (v115)
  {
    uint64_t v116 = *(void *)v133;
    do
    {
      for (m = 0; m != v115; m = (char *)m + 1)
      {
        if (*(void *)v133 != v116) {
          objc_enumerationMutation(v114);
        }
        [*(id *)(*((void *)&v132 + 1) + 8 * (void)m) resetStats];
      }
      id v115 = [v114 countByEnumeratingWithState:&v132 objects:v177 count:16];
    }
    while (v115);
  }
  objc_sync_exit(self);
}

- (void)handleLPMEvent:(id)a3 withAggdKeys:(id)a4 withAggregateState:(id)a5
{
  if ([a3 isEqualToString:@"unplugged_lpm_on"]
    && [(PLAggregateLogger *)self isLPMOn])
  {
    objc_msgSend(objc_msgSend(a5, "energy"), "doubleValue");
    [a4 setObject:+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", llround(v9)), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.state.%@.energy", @"unplugged_lpm_on_24hr" forKeyedSubscript];
    objc_msgSend(objc_msgSend(a5, "energyAbsolute"), "doubleValue");
    [a4 setObject:+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", llround(v10)), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.state.%@.energyAbsolute", @"unplugged_lpm_on_24hr" forKeyedSubscript];
    objc_msgSend(objc_msgSend(a5, "energyRaw"), "doubleValue");
    [a4 setObject:+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", llround(v11)), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.state.%@.energyRaw", @"unplugged_lpm_on_24hr" forKeyedSubscript];
    [a4 setObject:&off_13CA0, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.state.%@.energy", @"unplugged_lpm_off_24hr" forKeyedSubscript];
    [a4 setObject:&off_13CA0, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.state.%@.energyAbsolute", @"unplugged_lpm_off_24hr" forKeyedSubscript];
    [a4 setObject:&off_13CA0, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.state.%@.energyRaw", @"unplugged_lpm_off_24hr" forKeyedSubscript];
    [a4 setObject:+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", objc_msgSend(objc_msgSend(a5, "energyAbsoluteNet"), "longValue")), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.state.%@.energyAbsoluteNet", @"unplugged_lpm_on_24hr" forKeyedSubscript];
    [a4 setObject:+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", objc_msgSend(objc_msgSend(a5, "energyPassedChargeNet"), "longValue")), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.state.%@.energyPassedChargeNet", @"unplugged_lpm_on_24hr" forKeyedSubscript];
    [a4 setObject:+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", objc_msgSend(objc_msgSend(a5, "energyChargeAccumNet"), "longValue")), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.state.%@.energyChargeAccumNet", @"unplugged_lpm_on_24hr" forKeyedSubscript];
    [a4 setObject:&off_13CA0, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.state.%@.energyAbsoluteNet", @"unplugged_lpm_off_24hr" forKeyedSubscript];
    [a4 setObject:&off_13CA0, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.state.%@.energyPassedChargeNet", @"unplugged_lpm_off_24hr" forKeyedSubscript];
    [a4 setObject:&off_13CA0, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.state.%@.energyChargeAccumNet", @"unplugged_lpm_off_24hr" forKeyedSubscript];
    if ([(PLAggregateLogger *)self lastLPMStatus]) {
      return;
    }
    [a4 setObject:&off_13C40, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.state.%d.LPM.enable", self->currentBatteryLevel) forKeyedSubscript];
    if (!_os_feature_enabled_impl())
    {
      uint64_t v13 = 1;
      goto LABEL_13;
    }
    double v12 = v19;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    uint64_t v13 = 1;
    double v14 = sub_4BE8;
    goto LABEL_11;
  }
  if ([a3 isEqualToString:@"unplugged_lpm_off"])
  {
    if (![(PLAggregateLogger *)self isLPMOn])
    {
      objc_msgSend(objc_msgSend(a5, "energy"), "doubleValue");
      [a4 setObject:+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", llround(v15)), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.state.%@.energy", @"unplugged_lpm_off_24hr" forKeyedSubscript];
      objc_msgSend(objc_msgSend(a5, "energyAbsolute"), "doubleValue");
      [a4 setObject:+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", llround(v16)), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.state.%@.energyAbsolute", @"unplugged_lpm_off_24hr" forKeyedSubscript];
      objc_msgSend(objc_msgSend(a5, "energyRaw"), "doubleValue");
      [a4 setObject:+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", llround(v17)), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.state.%@.energyRaw", @"unplugged_lpm_off_24hr" forKeyedSubscript];
      [a4 setObject:&off_13CA0, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.state.%@.energy", @"unplugged_lpm_on_24hr" forKeyedSubscript];
      [a4 setObject:&off_13CA0, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.state.%@.energyAbsolute", @"unplugged_lpm_on_24hr" forKeyedSubscript];
      [a4 setObject:&off_13CA0, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.state.%@.energyRaw", @"unplugged_lpm_on_24hr" forKeyedSubscript];
      [a4 setObject:+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", objc_msgSend(objc_msgSend(a5, "energyAbsoluteNet"), "longValue")), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.state.%@.energyAbsoluteNet", @"unplugged_lpm_off_24hr" forKeyedSubscript];
      [a4 setObject:+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", objc_msgSend(objc_msgSend(a5, "energyPassedChargeNet"), "longValue")), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.state.%@.energyPassedChargeNet", @"unplugged_lpm_off_24hr" forKeyedSubscript];
      [a4 setObject:+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", objc_msgSend(objc_msgSend(a5, "energyChargeAccumNet"), "longValue")), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.state.%@.energyChargeAccumNet", @"unplugged_lpm_off_24hr" forKeyedSubscript];
      [a4 setObject:&off_13CA0, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.state.%@.energyAbsoluteNet", @"unplugged_lpm_on_24hr" forKeyedSubscript];
      [a4 setObject:&off_13CA0, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.state.%@.energyPassedChargeNet", @"unplugged_lpm_on_24hr" forKeyedSubscript];
      [a4 setObject:&off_13CA0, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.state.%@.energyChargeAccumNet", @"unplugged_lpm_on_24hr" forKeyedSubscript];
      if ([(PLAggregateLogger *)self lastLPMStatus])
      {
        [a4 setObject:&off_13C40, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.state.%d.LPM.disable", self->currentBatteryLevel) forKeyedSubscript];
        uint64_t v13 = 0;
        if (!_os_feature_enabled_impl())
        {
LABEL_13:
          [(PLAggregateLogger *)self setLastLPMStatus:v13];
          return;
        }
        double v12 = v18;
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        double v14 = sub_4C98;
LABEL_11:
        v12[2] = v14;
        v12[3] = &unk_10410;
        v12[4] = self;
        AnalyticsSendEventLazy();
        goto LABEL_13;
      }
    }
  }
}

- (void)handleScreenOn:(id)a3
{
}

- (void)handleScreenOff:(id)a3
{
}

- (void)handleSleep:(id)a3
{
}

- (void)handleWake:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:PLDeviceDidWakeSystemReasonKey];
  id v6 = +[NSMutableDictionary dictionary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = [v5 componentsSeparatedByString:@" "];
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(__CFString **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = v12;
        if (([(__CFString *)v12 isEqualToString:@"acc"] & 1) == 0)
        {
          uint64_t v13 = v12;
          if (([(__CFString *)v12 isEqualToString:@"baseband"] & 1) == 0)
          {
            uint64_t v13 = v12;
            if (([(__CFString *)v12 isEqualToString:@"bluetooth"] & 1) == 0)
            {
              uint64_t v13 = v12;
              if (([(__CFString *)v12 isEqualToString:@"ioxpander"] & 1) == 0)
              {
                uint64_t v13 = v12;
                if (([(__CFString *)v12 isEqualToString:@"radios"] & 1) == 0)
                {
                  uint64_t v13 = v12;
                  if (([(__CFString *)v12 isEqualToString:@"rtc"] & 1) == 0)
                  {
                    uint64_t v13 = v12;
                    if (([(__CFString *)v12 isEqualToString:@"spu_osmium"] & 1) == 0)
                    {
                      uint64_t v13 = v12;
                      if (([(__CFString *)v12 isEqualToString:@"spu_touch"] & 1) == 0)
                      {
                        uint64_t v13 = v12;
                        if (([(__CFString *)v12 isEqualToString:@"spu_gesture"] & 1) == 0)
                        {
                          uint64_t v13 = v12;
                          if (([(__CFString *)v12 isEqualToString:@"tbat"] & 1) == 0)
                          {
                            uint64_t v13 = v12;
                            if (([(__CFString *)v12 isEqualToString:@"usb"] & 1) == 0)
                            {
                              uint64_t v13 = v12;
                              if (([(__CFString *)v12 isEqualToString:@"wlan"] & 1) == 0)
                              {
                                if ([(__CFString *)v12 hasPrefix:@"spu"]) {
                                  uint64_t v13 = @"spu_other";
                                }
                                else {
                                  uint64_t v13 = 0;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        if (([(__CFString *)v12 isEqualToString:@"hold"] & 1) != 0
          || ([(__CFString *)v12 isEqualToString:@"menu"] & 1) != 0
          || ([(__CFString *)v12 isEqualToString:@"ringer"] & 1) != 0
          || ([(__CFString *)v12 isEqualToString:@"mikey"] & 1) != 0
          || ([(__CFString *)v12 isEqualToString:@"clamshell"] & 1) != 0
          || [(__CFString *)v12 hasPrefix:@"halleffect"])
        {
          uint64_t v13 = @"user";
        }
        double v14 = @"other";
        if (v13) {
          double v14 = v13;
        }
        [v6 setObject:&off_13C40, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.wake_reasons.%@", v14) forKeyedSubscript];
        if (_os_feature_enabled_impl()) {
          AnalyticsSendEventLazy();
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
  [v6 setObject:&off_13C40 forKeyedSubscript:@"com.apple.power.wakecount"];
  ADClientBatchKeys();
  if (_os_feature_enabled_impl()) {
    AnalyticsSendEventLazy();
  }
  [(PLAggregateLogger *)self handleEvent:1 withStatus:1];
}

- (void)handleBatteryStatus:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:PLBatteryStatusPropertiesKey];
  -[PLAggregateLogger handleEvent:withStatus:](self, "handleEvent:withStatus:", 0, [v5 isPluggedIn]);
  id v6 = [v5 isCharging];

  [(PLAggregateLogger *)self handleEvent:3 withStatus:v6];
}

- (void)handleLPMStatus:(id)a3
{
  id v4 = [a3 userInfo];
  BOOL v5 = objc_msgSend(objc_msgSend(objc_msgSend(v4, "objectForKeyedSubscript:", PLLPMStatusDidChangeNotification), "objectForKey:", @"value"), "intValue") == 1;

  [(PLAggregateLogger *)self handleEvent:4 withStatus:v5];
}

- (void)handleAODMode:(id)a3
{
  if (+[PLPowerEventListener hasAOD])
  {
    id v5 = [a3 userInfo];
    switch(objc_msgSend(objc_msgSend(objc_msgSend(v5, "objectForKeyedSubscript:", PLAODModeNotification), "objectForKey:", @"value"), "intValue"))
    {
      case 0u:
      case 1u:
        id v6 = self;
        uint64_t v7 = 0;
        goto LABEL_5;
      case 2u:
      case 3u:
        id v6 = self;
        uint64_t v7 = 1;
LABEL_5:
        [(PLAggregateLogger *)v6 handleEvent:2 withStatus:v7];
        break;
      default:
        if (qword_13D08 != -1) {
          dispatch_once(&qword_13D08, &stru_10378);
        }
        id v8 = off_13B48;
        if (os_log_type_enabled((os_log_t)off_13B48, OS_LOG_TYPE_ERROR)) {
          sub_A8F8(v8);
        }
        break;
    }
  }
}

- (BOOL)isPlugged
{
  return [(PLAggregateLogger *)self currentState] & 1;
}

- (BOOL)isCharging
{
  return ([(PLAggregateLogger *)self currentState] >> 3) & 1;
}

- (BOOL)isLPMOn
{
  return ([(PLAggregateLogger *)self currentState] >> 4) & 1;
}

- (void)handleDayChange
{
  uint32_t v2 = objc_alloc_init(PLBatteryProperties);
  [(PLBatteryProperties *)v2 rawMaxCapacity];
  ADClientSetValueForScalarKey();
  [(PLBatteryProperties *)v2 designCapacity];
  ADClientSetValueForScalarKey();
  [(PLBatteryProperties *)v2 fullAvailableCapacity];
  ADClientSetValueForScalarKey();
  [(PLBatteryProperties *)v2 nominalChargeCapacity];
  ADClientSetValueForScalarKey();
  [(PLBatteryProperties *)v2 cycleCount];
  ADClientSetValueForScalarKey();
  if (_os_feature_enabled_impl()) {
    AnalyticsSendEventLazy();
  }
}

- (void)queryBatteryStatsAtBoot
{
  dispatch_time_t v3 = dispatch_time(0, 600000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5754;
  block[3] = &unk_10478;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (int)binSessionLength:(int64_t)a3
{
  if (a3 < 1) {
    return 1;
  }
  if ((unint64_t)a3 < 5) {
    return 2;
  }
  if ((unint64_t)a3 < 0xA) {
    return 3;
  }
  if ((unint64_t)a3 < 0x1E) {
    return 4;
  }
  if ((unint64_t)a3 < 0x3C) {
    return 5;
  }
  if ((unint64_t)a3 < 0x78) {
    return 6;
  }
  if ((unint64_t)a3 < 0xB4) {
    return 7;
  }
  if ((unint64_t)a3 < 0xF0) {
    return 8;
  }
  if ((unint64_t)a3 < 0x12C) {
    return 9;
  }
  if ((unint64_t)a3 < 0x168) {
    return 10;
  }
  if ((unint64_t)a3 < 0x1A4) {
    return 11;
  }
  if ((unint64_t)a3 < 0x1E0) {
    return 12;
  }
  if ((unint64_t)a3 < 0x21C) {
    return 13;
  }
  if ((unint64_t)a3 < 0x258) {
    return 14;
  }
  if ((unint64_t)a3 < 0x384) {
    return 15;
  }
  if ((unint64_t)a3 < 0x4B0) {
    return 16;
  }
  if ((unint64_t)a3 < 0x708) {
    return 17;
  }
  if ((unint64_t)a3 < 0xA8C) {
    return 18;
  }
  if ((unint64_t)a3 < 0xE10) {
    return 19;
  }
  return 20;
}

- (unsigned)currentState
{
  return self->currentState;
}

- (void)setCurrentState:(unsigned int)a3
{
  self->currentState = a3;
}

- (NSMutableArray)baseStates
{
  return self->baseStates;
}

- (void)setBaseStates:(id)a3
{
}

- (NSMutableDictionary)compositeStates
{
  return self->compositeStates;
}

- (void)setCompositeStates:(id)a3
{
}

- (double)lastTime
{
  return self->lastTime;
}

- (void)setLastTime:(double)a3
{
  self->lastTime = a3;
}

- (double)lastVoltage
{
  return self->lastVoltage;
}

- (void)setLastVoltage:(double)a3
{
  self->double lastVoltage = a3;
}

- (double)lastCurrentCapacity
{
  return self->lastCurrentCapacity;
}

- (void)setLastCurrentCapacity:(double)a3
{
  self->double lastCurrentCapacity = a3;
}

- (double)lastCurrentCapacityAbsolute
{
  return self->lastCurrentCapacityAbsolute;
}

- (void)setLastCurrentCapacityAbsolute:(double)a3
{
  self->double lastCurrentCapacityAbsolute = a3;
}

- (double)lastPassedCharge
{
  return self->lastPassedCharge;
}

- (void)setLastPassedCharge:(double)a3
{
  self->double lastPassedCharge = a3;
}

- (double)lastChargeAccum
{
  return self->lastChargeAccum;
}

- (void)setLastChargeAccum:(double)a3
{
  self->double lastChargeAccum = a3;
}

- (double)lastDOD0
{
  return self->lastDOD0;
}

- (void)setLastDOD0:(double)a3
{
  self->lastDOD0 = a3;
}

- (double)lastCurrentCapacityRaw
{
  return self->lastCurrentCapacityRaw;
}

- (void)setLastCurrentCapacityRaw:(double)a3
{
  self->double lastCurrentCapacityRaw = a3;
}

- (BOOL)lastLPMStatus
{
  return self->lastLPMStatus;
}

- (void)setLastLPMStatus:(BOOL)a3
{
  self->lastLPMStatus = a3;
}

- (unsigned)currentBatteryLevel
{
  return self->currentBatteryLevel;
}

- (void)setCurrentBatteryLevel:(unsigned int)a3
{
  self->currentBatteryLevel = a3;
}

@end