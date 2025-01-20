@interface SupervisorControl
- (BOOL)didWeCrossTargetTemp;
- (BOOL)hotspotIsEngaged;
- (BOOL)isHotspotFirstEngaged;
- (BOOL)shouldEnforceLightThermalPressure;
- (BOOL)shouldForceThermalLevelForThreshold:(int)a3;
- (SupervisorControl)initWithMitigationType:(int)a3 paramInfo:(__CFDictionary *)a4;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (__CFString)getPowerlogKey;
- (float)THERMAL_TRAP_LOAD;
- (float)THERMAL_TRAP_SLEEP;
- (float)calculateTargetDifference;
- (float)hotspotTemperature;
- (int)computePackageCEforSeedingSource:(unsigned __int8)a3;
- (int)computePackageCurrentSeedPower;
- (int)getPowerlogFieldCurrentValue;
- (int)getThermalStateofHotspot;
- (int)numberOfFields;
- (unsigned)chooseEffectiveSeedingSource;
- (unsigned)maxLIForComponent:(int)a3;
- (unsigned)releaseMaxLIForComponent:(int)a3 releaseRate:(int)a4;
- (unsigned)seedControlEffort;
- (void)applyAlternateTarget:(BOOL)a3;
- (void)calculateControlEffort:(float)a3;
- (void)calculateControlEffort:(float)a3 trigger:(float)a4;
- (void)dealloc;
- (void)overrideTargetTemperature:(float)a3;
- (void)resetTargetTemperature;
- (void)setDecisionTableSection:(id)a3;
- (void)setTHERMAL_TRAP_LOAD:(float)a3;
- (void)setTHERMAL_TRAP_SLEEP:(float)a3;
- (void)updateHotSpotTemperatureAndStatus:(float)a3;
@end

@implementation SupervisorControl

- (int)numberOfFields
{
  return 2;
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  if (a3 == 1)
  {
    CFAllocatorRef v3 = kCFAllocatorDefault;
    uint64_t integrator = (int)self->super.integrator;
    return (__CFString *)CFStringCreateWithFormat(v3, 0, @"%d", integrator);
  }
  if (!a3)
  {
    CFAllocatorRef v3 = kCFAllocatorDefault;
    uint64_t integrator = self->super.controlEffort;
    return (__CFString *)CFStringCreateWithFormat(v3, 0, @"%d", integrator);
  }
  return 0;
}

- (unsigned)releaseMaxLIForComponent:(int)a3 releaseRate:(int)a4
{
  return [[-[NSArray objectAtIndex:](self->_maxLoadIndexTable, "objectAtIndex:", a3) getReleaseMaxLI:releaseRate:self->forcedThermalPressureLevelLight.isTriggered, *(void *)&a4];
}

- (unsigned)maxLIForComponent:(int)a3
{
  return [[-[NSArray objectAtIndex:](self->_maxLoadIndexTable, "objectAtIndex:", a3) getMaxLI:self->super.controlEffort];
}

- (SupervisorControl)initWithMitigationType:(int)a3 paramInfo:(__CFDictionary *)a4
{
  uint64_t v5 = *(void *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)SupervisorControl;
  v6 = [(PidComponent *)&v11 initPIDWith:a4];
  v7 = (SupervisorControl *)v6;
  if (v6)
  {
    *(void *)(v6 + 92) = 0x80000000;
    v6[100] = 0;
    *((void *)v6 + 13) = 0x80000000;
    v6[112] = 0;
    *(void *)(v6 + 116) = 0x80000000;
    v6[124] = 0;
    *((_DWORD *)v6 + 17) = 0;
    v6[128] = 0;
    *((_DWORD *)v6 + 11) = v5;
    *((_DWORD *)v6 + 22) = 0;
    *((_DWORD *)v6 + 21) = 1077936128;
    *((_DWORD *)v6 + 19) = -1082130432;
    *((_DWORD *)v6 + 20) = -1082130432;
    *((void *)v6 + 19) = 0;
    v6[160] = 0;
    *((_DWORD *)v6 + 37) = -1082130432;
    if (a4)
    {
      v10 = v6 + 120;
      Value = CFDictionaryGetValue(a4, @"description");
      v7->super.nameofComponent = (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%d %@ ", v5, Value);
      sub_100008280(a4, @"THERMAL_TRAP_LOAD", kCFNumberFloatType, &v7->previousHotSpotTemperature);
      sub_100008280(a4, @"THERMAL_TRAP_SLEEP", kCFNumberFloatType, &v7->THERMAL_TRAP_LOAD);
      sub_100008280(a4, @"ReleaseHysteresis", kCFNumberFloatType, &v7->THERMAL_TRAP_SLEEP);
      sub_100008280(a4, @"ForcedThermalLevelTarget0", kCFNumberFloatType, &v7->tState);
      sub_100008280(a4, @"ForcedThermalLevelTarget0Hysteresis", kCFNumberFloatType, v7->forcedThermalLevel);
      sub_100008280(a4, @"ForcedThermalLevelTarget1", kCFNumberFloatType, &v7->forcedThermalLevel[0].isTriggered);
      sub_100008280(a4, @"ForcedThermalLevelTarget1Hysteresis", kCFNumberFloatType, &v7->forcedThermalLevel[1]);
      sub_100008280(a4, @"ForcedThermalPressureLevelLightTarget", kCFNumberFloatType, &v7->forcedThermalLevel[1].isTriggered);
      sub_100008280(a4, @"ForcedThermalPressureLevelLightHysteresis", kCFNumberFloatType, v10);
      sub_100008280(a4, @"seedingSource", kCFNumberIntType, &v7->seedingSource);
      sub_100008280(a4, @"alternateTarget", kCFNumberFloatType, &v7->_alternateTarget);
    }
    v7->_powerlogKeyCE = (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"CE%d", v5);
    v7->_targetNominal = v7->super.TARGET;
  }
  return v7;
}

- (void)setDecisionTableSection:(id)a3
{
  id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:17];
  uint64_t v5 = 0;
  v6 = &off_100086388;
  p_cache = tm62a6a44d269463582cca62859fbfb389.cache;
  v8 = (os_log_t *)&qword_1000AABC0;
  CFStringRef v9 = @"dtFormatType";
  do
  {
    id v10 = [a3 valueForKey:v6[v5]];
    if (v10)
    {
      objc_super v11 = v10;
      CFTypeID v12 = CFGetTypeID(v10);
      if (v12 == CFArrayGetTypeID() && CFArrayGetCount((CFArrayRef)v11) == 256)
      {
        v13 = [[MaxLoadIndexTableSectionVariable alloc] initWithDecisionTreeSection:v11];
      }
      else
      {
        CFTypeID v14 = CFGetTypeID(v11);
        if (v14 != CFDictionaryGetTypeID())
        {
          if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
            sub_10005CF70(&v33, v34);
          }
          goto LABEL_22;
        }
        if (objc_msgSend(objc_msgSend(v11, "objectForKey:", v9), "unsignedIntegerValue") != (id)1)
        {
          if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
            sub_10005CF44(&v35, v36);
          }
          goto LABEL_22;
        }
        if (v5 == 5) {
          uint64_t v15 = 100;
        }
        else {
          uint64_t v15 = 101;
        }
        uint64_t v30 = v15;
        v16 = [MaxLoadIndexTableSectionPiecewiseLinear alloc];
        id v17 = a3;
        v18 = v6;
        v19 = v8;
        id v20 = v4;
        CFStringRef v21 = v9;
        v22 = p_cache;
        id v23 = [v11 objectForKey:@"controlEfforts"];
        id v24 = [v11 objectForKey:@"maxLIs"];
        id v25 = v23;
        p_cache = v22;
        CFStringRef v9 = v21;
        id v4 = v20;
        v8 = v19;
        v6 = v18;
        a3 = v17;
        v13 = [(MaxLoadIndexTableSectionPiecewiseLinear *)v16 initWithDecisionTreeSectionControlEfforts:v25 maxLIs:v24 unconstrainedMaxLI:v30];
      }
    }
    else
    {
      id v26 = objc_alloc((Class)(p_cache + 48));
      if (v5 == 5) {
        uint64_t v27 = 100;
      }
      else {
        uint64_t v27 = 101;
      }
      v13 = (MaxLoadIndexTableSectionVariable *)[v26 initWithConstantMaxLI:v27];
    }
    v28 = v13;
    if (v13)
    {
      [v4 addObject:v13];

      goto LABEL_24;
    }
LABEL_22:
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
      sub_10005CF18(&v31, v32);
    }
LABEL_24:
    ++v5;
  }
  while (v5 != 17);
  self->_maxLoadIndexTable = (NSArray *)[v4 copy];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)SupervisorControl;
  [(PidComponent *)&v2 dealloc];
}

- (void)updateHotSpotTemperatureAndStatus:(float)a3
{
  self->hotspotTemperature = *((float *)&self->super.controlEffort + 1);
  *((float *)&self->super.controlEffort + 1) = a3;
  float TARGET = self->super.TARGET;
  if (self->forcedThermalPressureLevelLight.isTriggered) {
    float TARGET = TARGET - self->THERMAL_TRAP_SLEEP;
  }
  self->forcedThermalPressureLevelLight.isTriggered = TARGET < a3;
}

- (void)calculateControlEffort:(float)a3
{
  *(float *)&double v3 = a3;
  [(SupervisorControl *)self calculateControlEffort:*(double *)&a3 trigger:v3];
}

- (void)calculateControlEffort:(float)a3 trigger:(float)a4
{
  *(float *)&double v7 = a4;
  [(SupervisorControl *)self updateHotSpotTemperatureAndStatus:v7];
  if ([(SupervisorControl *)self isHotspotFirstEngaged] && self->seedingSource)
  {
    uint64_t v8 = [(SupervisorControl *)self seedControlEffort];
    *(float *)&double v9 = a4;
    [(PidComponent *)self applySeedToIntegratorFromControlEffort:v8 currentTemperature:v9];
    self->super.controlEffort = v8;
    return;
  }
  double v10 = vabds_f32(a3, a4);
  if (v10 < 0.01)
  {
    CFTypeID v14 = self;
    uint64_t v15 = SupervisorControl;
    objc_super v11 = &v14;
LABEL_9:
    *(float *)&double v10 = a3;
    [super calculateControlEffort:v10, v12, v13, v14, v15];
    return;
  }
  if (self->forcedThermalPressureLevelLight.isTriggered
    || ![(PidComponent *)self isIntegratorAtMin])
  {
    CFTypeID v12 = self;
    v13 = SupervisorControl;
    objc_super v11 = &v12;
    goto LABEL_9;
  }
}

- (unsigned)seedControlEffort
{
  objc_super v2 = self;
  uint64_t v3 = [(SupervisorControl *)self chooseEffectiveSeedingSource];
  if ((v3 - 3) <= 3u)
  {
    LOBYTE(v2) = [(SupervisorControl *)v2 computePackageCEforSeedingSource:v3];
    return v2;
  }
  if (v3 == 2)
  {
    id v4 = [(id)qword_1000AB158 getCPUTargetPower];
    id v5 = [(id)qword_1000AB158 getGPUTargetPower];
  }
  else
  {
    if (v3 != 1)
    {
      id v4 = 0;
      goto LABEL_12;
    }
    id v4 = [(id)qword_1000AB158 getCurrentCPUPower];
    id v5 = [(id)qword_1000AB158 getCurrentGPUPower];
  }
  int v6 = (int)v5;
  if ((int)v4 < (int)v5)
  {
    signed int v7 = [(id)qword_1000AB158 getCurrentGPULoadingIndex:v5];
    LODWORD(v2) = [[-[NSArray objectAtIndex:](v2->_maxLoadIndexTable, "objectAtIndex:", 1) getControlEffortForMaxLI:v7];
    if (byte_1000AA7A0)
    {
      uint64_t v8 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 67109632;
        int v13 = v6;
        __int16 v14 = 1024;
        signed int v15 = v7;
        __int16 v16 = 1024;
        int v17 = (int)v2;
        double v9 = "<Notice> Seeding from GPU power %d, seed maxLI %d, CE %d";
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, 0x14u);
        return v2;
      }
    }
    return v2;
  }
LABEL_12:
  signed int v10 = [(id)qword_1000AB158 getCurrentCPULoadingIndex:v4];
  LODWORD(v2) = [[-[NSArray objectAtIndex:](v2->_maxLoadIndexTable, "objectAtIndex:", 0) getControlEffortForMaxLI:v10];
  if (byte_1000AA7A0)
  {
    uint64_t v8 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 67109632;
      int v13 = (int)v4;
      __int16 v14 = 1024;
      signed int v15 = v10;
      __int16 v16 = 1024;
      int v17 = (int)v2;
      double v9 = "<Notice> Seeding from CPU power %d, seed maxLI %d, CE %d";
      goto LABEL_15;
    }
  }
  return v2;
}

- (unsigned)chooseEffectiveSeedingSource
{
  int v2 = self->seedingSource - 1;
  LOBYTE(self) = 1;
  switch(v2)
  {
    case 0:
      return self;
    case 1:
      [+[PowerZoneTelemetry sharedInstance] getCpuPowerZoneLimited];
      if (v3 <= 0.0
        && ([+[PowerZoneTelemetry sharedInstance](PowerZoneTelemetry, "sharedInstance") getGpuPowerZoneLimited], v4 <= 0.0)&& ([+[PowerZoneTelemetry sharedInstance] getPackagePowerZoneLimited], v5 <= 0.0))
      {
        LOBYTE(self) = 2;
      }
      else
      {
        LOBYTE(self) = 1;
      }
      break;
    case 2:
      LOBYTE(self) = 3;
      break;
    case 3:
      [+[PowerZoneTelemetry sharedInstance] getPackagePowerZoneLimited];
      BOOL v7 = v6 <= 0.0;
      char v8 = 3;
      goto LABEL_12;
    case 4:
      LOBYTE(self) = 5;
      break;
    case 5:
      [+[PowerZoneTelemetry sharedInstance] getPackagePowerZoneLimited];
      BOOL v7 = v9 <= 0.0;
      char v8 = 5;
LABEL_12:
      if (v7) {
        LOBYTE(self) = 4;
      }
      else {
        LOBYTE(self) = v8;
      }
      break;
    default:
      LODWORD(self) = os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR);
      if (self)
      {
        sub_10005CF9C();
        LOBYTE(self) = 0;
      }
      break;
  }
  return self;
}

- (int)computePackageCEforSeedingSource:(unsigned __int8)a3
{
  switch(a3)
  {
    case 5u:
      id v4 = [(id)qword_1000AB158 getCurrentPackagePower];
      break;
    case 4u:
      id v4 = [(id)qword_1000AB158 getPackageTargetPower];
      break;
    case 3u:
      id v4 = (id)[(SupervisorControl *)self computePackageCurrentSeedPower];
      break;
    default:
      id v5 = 0;
      goto LABEL_9;
  }
  id v5 = v4;
LABEL_9:
  signed int v6 = [(id)qword_1000AB158 getCurrentPackageLoadingIndex:v5];
  int v7 = [[-[NSArray objectAtIndex:](self->_maxLoadIndexTable, "objectAtIndex:", 12) getControlEffortForMaxLI:v6];
  if (byte_1000AA7A0)
  {
    char v8 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109632;
      v10[1] = v5;
      __int16 v11 = 1024;
      signed int v12 = v6;
      __int16 v13 = 1024;
      int v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<Notice> Seeding from Package power %d, seed maxLI %d, CE %d", (uint8_t *)v10, 0x14u);
    }
  }
  return v7;
}

- (int)computePackageCurrentSeedPower
{
  [(id)qword_1000AB158 getCLPCPackagePowerCPUSplitFraction];
  float v3 = v2;
  signed int v4 = [(id)qword_1000AB158 getCurrentCPUPower];
  signed int v5 = [(id)qword_1000AB158 getCurrentGPUPower];
  if (v4 > v5)
  {
    int v6 = v4;
  }
  else
  {
    float v3 = 1.0 - v3;
    int v6 = v5;
  }
  int v7 = (int)(float)((float)v6 / v3);
  if (byte_1000AA7A0)
  {
    signed int v8 = v5;
    float v9 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109888;
      v11[1] = v4;
      __int16 v12 = 1024;
      signed int v13 = v8;
      __int16 v14 = 2048;
      double v15 = v3;
      __int16 v16 = 1024;
      int v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "<Notice> cpuPower: %d, gpuPower: %d, splitFraction: %f, computedPackagePower: %d", (uint8_t *)v11, 0x1Eu);
    }
  }
  return v7;
}

- (float)calculateTargetDifference
{
  return self->super.TARGET - *((float *)&self->super.controlEffort + 1);
}

- (int)getThermalStateofHotspot
{
  float previousHotSpotTemperature = self->previousHotSpotTemperature;
  if (previousHotSpotTemperature >= 0.0)
  {
    float v4 = *((float *)&self->super.controlEffort + 1);
    float THERMAL_TRAP_LOAD = self->THERMAL_TRAP_LOAD;
    if (v4 >= THERMAL_TRAP_LOAD)
    {
      int v3 = 2;
    }
    else
    {
      float releaseHysteresis = self->releaseHysteresis;
      if (v4 < previousHotSpotTemperature)
      {
        if (LODWORD(releaseHysteresis) != 1)
        {
          if (LODWORD(releaseHysteresis) != 2)
          {
LABEL_9:
            int v3 = 0;
            self->float releaseHysteresis = 0.0;
            return v3;
          }
          LODWORD(self->releaseHysteresis) = 1;
          float v4 = *((float *)&self->super.controlEffort + 1);
          float previousHotSpotTemperature = self->previousHotSpotTemperature;
        }
        if ((float)(v4 + self->THERMAL_TRAP_SLEEP) >= previousHotSpotTemperature) {
          return 1;
        }
        goto LABEL_9;
      }
      if (LODWORD(releaseHysteresis) == 2 && (float)(v4 + self->THERMAL_TRAP_SLEEP) >= THERMAL_TRAP_LOAD) {
        return 2;
      }
      int v3 = 1;
    }
    LODWORD(self->releaseHysteresis) = v3;
    return v3;
  }
  return 0;
}

- (BOOL)hotspotIsEngaged
{
  return self->forcedThermalPressureLevelLight.isTriggered;
}

- (BOOL)isHotspotFirstEngaged
{
  BOOL result = 0;
  if ([(SupervisorControl *)self didWeCrossTargetTemp])
  {
    v4.receiver = self;
    v4.super_class = (Class)SupervisorControl;
    if ([(PidComponent *)&v4 isIntegratorAtMin]) {
      return 1;
    }
  }
  return result;
}

- (BOOL)didWeCrossTargetTemp
{
  float TARGET = self->super.TARGET;
  return self->hotspotTemperature <= TARGET && *((float *)&self->super.controlEffort + 1) > TARGET;
}

- (BOOL)shouldForceThermalLevelForThreshold:(int)a3
{
  p_tState = &self->tState;
  float v4 = *((float *)&self->tState + 3 * a3);
  if (v4 <= 0.0) {
    return 0;
  }
  signed int v5 = &p_tState[3 * a3];
  int v7 = *((unsigned __int8 *)v5 + 8);
  int v6 = (BOOL *)(v5 + 2);
  if (v7) {
    float v4 = v4 - *(float *)&p_tState[3 * a3 + 1];
  }
  BOOL result = *((float *)&self->super.controlEffort + 1) >= v4;
  BOOL *v6 = result;
  return result;
}

- (BOOL)shouldEnforceLightThermalPressure
{
  p_isTriggered = &self->forcedThermalLevel[1].isTriggered;
  float v3 = *(float *)&self->forcedThermalLevel[1].isTriggered;
  if (v3 <= 0.0) {
    return 0;
  }
  if (LOBYTE(self->forcedThermalPressureLevelLight.triggerHysteresis)) {
    float v3 = v3 - self->forcedThermalPressureLevelLight.triggerTarget;
  }
  BOOL result = *((float *)&self->super.controlEffort + 1) >= v3;
  p_isTriggered[8] = result;
  return result;
}

- (void)overrideTargetTemperature:(float)a3
{
  self->super.float TARGET = a3;
  if (byte_1000AA7A0)
  {
    signed int v5 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      int mitigationType = self->super.mitigationType;
      int v7 = 136315650;
      signed int v8 = "-[SupervisorControl overrideTargetTemperature:]";
      __int16 v9 = 1024;
      int v10 = mitigationType;
      __int16 v11 = 2048;
      double v12 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> %s: hotspot %d, target %0.2f", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

- (void)resetTargetTemperature
{
  float targetNominal = self->_targetNominal;
  self->super.float TARGET = targetNominal;
  if (byte_1000AA7A0)
  {
    float v4 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      int mitigationType = self->super.mitigationType;
      int v6 = 136315650;
      int v7 = "-[SupervisorControl resetTargetTemperature]";
      __int16 v8 = 1024;
      int v9 = mitigationType;
      __int16 v10 = 2048;
      double v11 = targetNominal;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> %s: hotspot %d, target %0.2f", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

- (void)applyAlternateTarget:(BOOL)a3
{
  float alternateTarget = self->_alternateTarget;
  if (alternateTarget >= 0.0)
  {
    if (!a3) {
      float alternateTarget = self->_targetNominal;
    }
    self->super.float TARGET = alternateTarget;
    signed int v5 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      int mitigationType = self->super.mitigationType;
      int v7 = 136315650;
      __int16 v8 = "-[SupervisorControl applyAlternateTarget:]";
      __int16 v9 = 1024;
      int v10 = mitigationType;
      __int16 v11 = 2048;
      double v12 = alternateTarget;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> %s: Updated hotspot %d, target %0.2f", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  if (!a3)
  {
    CFStringRef v3 = @"Control Effort%@";
    return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, v3, self->super.nameofComponent);
  }
  if (a3 == 1)
  {
    CFStringRef v3 = @"Integrator%@";
    return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, v3, self->super.nameofComponent);
  }
  return 0;
}

- (__CFString)getPowerlogKey
{
  return self->_powerlogKeyCE;
}

- (int)getPowerlogFieldCurrentValue
{
  return self->super.controlEffort;
}

- (float)hotspotTemperature
{
  return *((float *)&self->super.controlEffort + 1);
}

- (float)THERMAL_TRAP_LOAD
{
  return self->previousHotSpotTemperature;
}

- (void)setTHERMAL_TRAP_LOAD:(float)a3
{
  self->float previousHotSpotTemperature = a3;
}

- (float)THERMAL_TRAP_SLEEP
{
  return self->THERMAL_TRAP_LOAD;
}

- (void)setTHERMAL_TRAP_SLEEP:(float)a3
{
  self->float THERMAL_TRAP_LOAD = a3;
}

@end