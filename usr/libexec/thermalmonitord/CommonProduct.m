@interface CommonProduct
- (BOOL)canSystemSleep;
- (BOOL)fourCharCodeMatchesDieTempType:(char)a3 fourCharCode:(__CFString *)a4;
- (BOOL)fourCharCodeNeedsPMUtcal:(__CFString *)a3;
- (BOOL)getPotentialForcedThermalPressureLevel;
- (BOOL)isBackLightOn;
- (BOOL)isCPMSMitigationEnabled;
- (BOOL)isInternalInstall;
- (BOOL)isSendingMaxTempToDisplayDriverEnabled;
- (BOOL)mitigationsFullyReleased;
- (BOOL)shouldSuppressStandardBehaviors:(__CFDictionary *)a3;
- (BOOL)useTcalAdjust:(unsigned int)a3;
- (NSMutableArray)listOfSupervisorControl;
- (NSMutableArray)listofComponentControl;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)thermalQueue;
- (__CFArray)copyHotspotsArray:(id)a3;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (id)copyDieTempSensorIndexSetForFourthChar:(char)a3 sensors:(__CFArray *)a4 filteredOnly:(BOOL)a5;
- (id)findComponent:(int)a3;
- (id)getGridX;
- (id)getGridY;
- (id)initProduct:(id)a3;
- (id)newBacklightComponentController:(__CFDictionary *)a3;
- (iir_filter_t)getFilterValues;
- (int)arcModuleTemperature;
- (int)arcVirtualTemperature;
- (int)calibrationResistorSensor;
- (int)calibrationResistorTempDefault;
- (int)canaryTempSensorIndex;
- (int)canaryTempThreshold;
- (int)chargerState;
- (int)chargerToken;
- (int)compute2DGridTemps;
- (int)computeMaxCGTemp;
- (int)desiredLoopInterval;
- (int)dieTempFilteredMaxAverage;
- (int)dieTempMaxAverage;
- (int)dieTempMaxMax;
- (int)displayToken;
- (int)gasGaugeBatteryTemperature;
- (int)getChargerState;
- (int)getCurrentMaxLIForComponent:(unsigned int)a3;
- (int)getFrontDisplayCenterTemperature;
- (int)getHighestSkinTemp;
- (int)getModeratePressureVersion;
- (int)maxControlEffort;
- (int)numberOfFields;
- (int)powerSensors;
- (int)sensorIndexFromList:(__CFArray *)a3 fourCharCode:(__CFString *)a4;
- (int)thermalState;
- (int)totalSensors;
- (int64_t)thermalPressureLevel;
- (unint64_t)componentThermalStatusLevel;
- (unint64_t)getMaxSensorValue;
- (unint64_t)getPotentialForcedThermalLevel:(unint64_t)a3;
- (unsigned)requiredCalibrationResistorSamples;
- (void)applyAlternateHotSpotTargets:(BOOL)a3;
- (void)clearControlEffortOverrides;
- (void)clearLoadingIndexOverrides;
- (void)createConnectionToCT;
- (void)dealloc;
- (void)emitThermalMitigationNotifications;
- (void)emitThermalTrendNotifications;
- (void)enableSendingMaxTempToDisplayDriver;
- (void)evaluteMitigationMaxLoadingIndex;
- (void)getAllComponentID:(__SCPreferences *)a3;
- (void)handleMCSThermalPressure;
- (void)logTrapEntryForAC:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)overrideArcParam:(id)a3 value:(int)a4;
- (void)overrideLifetimeServoParam:(id)a3 value:(int)a4;
- (void)probeAllSupervisorControlLoadingIndex;
- (void)putDeviceInLowTempSimulationMode:(id)a3;
- (void)putDeviceInThermalSimulationMode:(id)a3;
- (void)registerChargerNotification;
- (void)registerDefaultsDomain;
- (void)registerDisplayNotification;
- (void)removeHotspotTargetOverrides;
- (void)removeLightPressureOverride;
- (void)replaceOrAppendHotspotEntry:(__CFDictionary *)a3 existingHotspots:(__CFArray *)a4;
- (void)send2DGridTempsToDisplayDriver:(int *)a3;
- (void)sendMaxTempToDisplayDriver:(int)a3;
- (void)setChargerState:(int)a3;
- (void)setChargerToken:(int)a3;
- (void)setComponentThermalStatusLevel:(unint64_t)a3;
- (void)setDefaults:(id)a3;
- (void)setDisplayToken:(int)a3;
- (void)setHiPFeatureEnabled:(BOOL)a3;
- (void)setIsBackLightOn:(BOOL)a3;
- (void)setIsCPMSMitigationEnabled:(BOOL)a3;
- (void)setThermalQueue:(id)a3;
- (void)setThermalState:(int)a3;
- (void)setup2DGridDisplayDriver;
- (void)simulateLightThermalPressure;
- (void)thermalUpdatesToWatchdogEnabled:(id)a3;
- (void)tryTakeAction;
- (void)updateAccessories:(BOOL)a3;
- (void)updateAllThermalLoad:(BOOL)a3;
- (void)updateContextualClamp;
- (void)updateControlEffortFor:(int)a3 :(unsigned int)a4;
- (void)updateDisplayDriver:(BOOL)a3;
- (void)updateHotSpotPIDTargetFor:(int)a3 :(unsigned int)a4;
- (void)updateLifetimeServo;
- (void)updateMaxLIFor:(int)a3 :(unsigned int)a4;
- (void)updatePowerzoneTelemetry;
- (void)updateSleepTargetFor:(int)a3 :(unsigned int)a4;
- (void)updateSystemPowerState:(BOOL)a3;
- (void)updateTrapTargetFor:(int)a3 :(unsigned int)a4;
- (void)writeAllCornerTemperatures:(int)a3;
@end

@implementation CommonProduct

- (void)tryTakeAction
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  listofComponentControl = self->listofComponentControl;
  id v4 = [(NSMutableArray *)listofComponentControl countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(listofComponentControl);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * i) testLoadingIndexLevel];
      }
      id v5 = [(NSMutableArray *)listofComponentControl countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [+[CPMSHelper sharedInstance] publishDetailedMitigationArrayToCPMS];
  [(ArcController *)self->_arcController update];
}

- (int)maxControlEffort
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  listOfSupervisorControl = self->listOfSupervisorControl;
  id v3 = [(NSMutableArray *)listOfSupervisorControl countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v3) {
    return 0x80000000;
  }
  id v4 = v3;
  uint64_t v5 = *(void *)v11;
  int v6 = 0x80000000;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v11 != v5) {
        objc_enumerationMutation(listOfSupervisorControl);
      }
      signed int v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) controlEffort];
      if (v6 <= v8) {
        int v6 = v8;
      }
    }
    id v4 = [(NSMutableArray *)listOfSupervisorControl countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v4);
  return v6;
}

- (void)emitThermalTrendNotifications
{
  unsigned int v2 = [+[SensorDispatcherHelper sharedInstance] getValueFromSMCForKey:@"mTTT"];
  unsigned int v3 = [+[SensorDispatcherHelper sharedInstance] getValueFromSMCForKey:@"mTRC"];
  int v4 = v3;
  if (v2 != dword_1000AA748)
  {
    if (v2 == -1) {
      return;
    }
    goto LABEL_9;
  }
  if (v3 != dword_1000AA74C && v2 != -1)
  {
LABEL_9:
    [(id)qword_1000AA7A8 updatetimeToMitigateNotification:v2 AndReasonCode:v3];
    dword_1000AA748 = v2;
    dword_1000AA74C = v4;
    int v6 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109376;
      v7[1] = v2;
      __int16 v8 = 1024;
      int v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<Notice> Time to Mitigate = %d, Mitigation reason code = %d", (uint8_t *)v7, 0xEu);
    }
  }
}

- (void)handleMCSThermalPressure
{
  signed int v2 = [+[SensorDispatcherHelper sharedInstance] getValueFromSMCForKey:@"mTPL"];
  if (v2 != dword_1000AA740 && v2 != -12700 && v2 != -1)
  {
    int v9 = v2;
    sub_1000316E4(v2);
    dword_1000AA740 = v9;
    long long v10 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 67109120;
      int v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> mTPL = %d", (uint8_t *)&v15, 8u);
    }
  }
  signed int v5 = [+[SensorDispatcherHelper sharedInstance] getValueFromSMCForKey:@"mTLL"];
  int v6 = dword_1000AA744;
  if (v5 != dword_1000AA744 && v5 != -12700 && v5 != -1)
  {
    int v12 = v5;
    sub_1000316F4(v5);
    dword_1000AA744 = v12;
    long long v13 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 67109120;
      int v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "<Notice> mTLL = %d", (uint8_t *)&v15, 8u);
      int v6 = dword_1000AA744;
    }
    else
    {
      int v6 = v12;
    }
  }
  qword_1000AA798 = v6;
  sub_10000A06C();
}

- (BOOL)useTcalAdjust:(unsigned int)a3
{
  return (self->_PMUtcalAdjustMask >> a3) & 1;
}

- (int)totalSensors
{
  return self->_totalSensorCount;
}

- (int)numberOfFields
{
  return 7;
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  switch(a3)
  {
    case 0:
      CFAllocatorRef v3 = kCFAllocatorDefault;
      uint64_t v4 = qword_1000AA798;
      return (__CFString *)CFStringCreateWithFormat(v3, 0, @"%d", v4);
    case 1:
      CFAllocatorRef v3 = kCFAllocatorDefault;
      uint64_t v4 = 100;
      if (!byte_1000A2510) {
        uint64_t v4 = 0;
      }
      return (__CFString *)CFStringCreateWithFormat(v3, 0, @"%d", v4);
    case 2:
      CFAllocatorRef v6 = kCFAllocatorDefault;
      int64_t thermalPressureLevel = self->thermalPressureLevel;
      return (__CFString *)CFStringCreateWithFormat(v6, 0, @"%d", thermalPressureLevel);
    case 3:
      CFAllocatorRef v6 = kCFAllocatorDefault;
      int64_t thermalPressureLevel = self->_chargerState;
      return (__CFString *)CFStringCreateWithFormat(v6, 0, @"%d", thermalPressureLevel);
    case 4:
      CFAllocatorRef v8 = kCFAllocatorDefault;
      uint64_t v9 = [(CommonProduct *)self dieTempMaxAverage];
      goto LABEL_13;
    case 5:
      CFAllocatorRef v8 = kCFAllocatorDefault;
      uint64_t v9 = [(CommonProduct *)self dieTempFilteredMaxAverage];
      goto LABEL_13;
    case 6:
      CFAllocatorRef v8 = kCFAllocatorDefault;
      uint64_t v9 = [(CommonProduct *)self dieTempMaxMax];
LABEL_13:
      result = (__CFString *)CFStringCreateWithFormat(v8, 0, @"%d", v9);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (void)updatePowerzoneTelemetry
{
  signed int v2 = +[PowerZoneTelemetry sharedInstance];

  [(PowerZoneTelemetry *)v2 queryData];
}

- (void)updateLifetimeServo
{
  lifetimeServoController = self->lifetimeServoController;
  if (lifetimeServoController)
  {
    uint64_t v4 = [(CommonProduct *)self dieTempMaxMax];
    uint64_t v5 = [(CommonProduct *)self dieTempMaxAverage];
    [(LifetimeServoController *)lifetimeServoController updateForTempMax:v4 tempAverage:v5];
  }
}

- (void)updateDisplayDriver:(BOOL)a3
{
  if (!qword_1000AB150) {
    return;
  }
  uint64_t v4 = *((unsigned int *)&qword_1000AACCC + self->tsfdIndex);
  if (a3)
  {
    p_BOOL haveUsedDeferral = &self->_haveUsedDeferral;
    BOOL haveUsedDeferral = self->_haveUsedDeferral;
    self->_blendStillNeeded = 1;
    if (haveUsedDeferral)
    {
      IOPMAssertionID AssertionID = 0;
      uint64_t v7 = IOPMAssertionCreateWithDescription(@"PreventUserIdleSystemSleep", @"com.apple.thermalmonitord", @"Keeping system awake while performing display temperature ramp", 0, 0, 5.0, @"TimeoutActionTurnOff", &AssertionID);
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
          sub_10005C5F0(v8, v9);
        }
      }
      self->_blendStillNeeded = 0;
      CFNumberRef v10 = (const __CFNumber *)IOMobileFramebufferCopyProperty();
      CFNumberRef v11 = v10;
      if (v10 && (CFTypeID v12 = CFGetTypeID(v10), v12 == CFNumberGetTypeID()))
      {
        int valuePtr = 0;
        CFNumberGetValue(v11, kCFNumberSInt32Type, &valuePtr);
        int v13 = (int)((float)valuePtr * 0.0000152587891 * 100.0);
        if (byte_1000AA7A0)
        {
          v14 = qword_1000AABC0;
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            int v29 = v13;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "<Notice> TSFD seed %d", buf, 8u);
          }
        }
        int64_t v15 = 0;
        uint64_t v16 = 0;
        int v17 = v4 - v13;
        if ((int)v4 < v13) {
          int v17 = v4 - v13 + 7;
        }
        int v18 = v17 >> 3;
        do
        {
          dispatch_time_t v19 = dispatch_time(0, v15);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10004F768;
          block[3] = &unk_100085200;
          int v23 = v13;
          int v24 = v16;
          int v25 = v18;
          block[4] = self;
          dispatch_after(v19, (dispatch_queue_t)&_dispatch_main_q, block);
          ++v16;
          v15 += 250000000;
        }
        while (v16 != 8);
        if (!v11) {
          goto LABEL_29;
        }
      }
      else
      {
        v21 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
        {
          sub_10005C578((uint64_t)v11, v21);
          if (!v11)
          {
LABEL_29:
            if (AssertionID) {
              IOPMAssertionRelease(AssertionID);
            }
            return;
          }
        }
        else if (!v11)
        {
          goto LABEL_29;
        }
      }
      CFRelease(v11);
      goto LABEL_29;
    }
    goto LABEL_23;
  }
  if (self->_blendStillNeeded)
  {
    p_BOOL haveUsedDeferral = &self->_haveUsedDeferral;
    if (!self->_haveUsedDeferral)
    {
LABEL_23:
      v20 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "<Notice> defer TSFD seed once", buf, 2u);
      }
      *p_BOOL haveUsedDeferral = 1;
      return;
    }
  }

  [(CommonProduct *)self writeAllCornerTemperatures:v4];
}

- (void)updateContextualClamp
{
  contextualClampController = self->contextualClampController;
  if (contextualClampController) {
    [(ContextualClampController *)contextualClampController update];
  }
}

- (void)updateAccessories:(BOOL)a3
{
}

- (int)thermalState
{
  return self->thermalState;
}

- (void)probeAllSupervisorControlLoadingIndex
{
  [(TableDrivenDecisionTree *)self->decisionTree evaluateDecisionTree];

  [(CommonProduct *)self evaluteMitigationMaxLoadingIndex];
}

- (int)powerSensors
{
  return self->_powerSensorCount;
}

- (BOOL)isSendingMaxTempToDisplayDriverEnabled
{
  return self->sendMaxTemp;
}

- (int)gasGaugeBatteryTemperature
{
  return 3000;
}

- (void)evaluteMitigationMaxLoadingIndex
{
  if (byte_1000AA7A1)
  {
    [(CommonProduct *)self handleMCSThermalPressure];
    [(CommonProduct *)self emitThermalTrendNotifications];
    return;
  }
  int v3 = [(CommonProduct *)self getHighestSkinTemp];
  self->thermalState = v3;
  if (v3 == 1)
  {
    self->thermalTrap = 1;
    uint64_t v4 = 12;
    goto LABEL_9;
  }
  if (v3 == 2)
  {
    self->thermalTrap = 1;
    uint64_t v4 = 16;
LABEL_9:
    qword_1000AA798 = v4;
    goto LABEL_14;
  }
  if ((unint64_t)qword_1000AA798 <= 0xB) {
    unint64_t componentThermalStatusLevel = self->componentThermalStatusLevel;
  }
  else {
    unint64_t componentThermalStatusLevel = 11;
  }
  qword_1000AA798 = componentThermalStatusLevel;
  uint64_t v4 = -[CommonProduct getPotentialForcedThermalLevel:](self, "getPotentialForcedThermalLevel:");
  qword_1000AA798 = v4;
  self->thermalTrap = 0;
LABEL_14:
  id v6 = sub_100031694(v4);
  self->int64_t thermalPressureLevel = (int64_t)v6;
  if (v6 != self->previousThermalPressureLevel)
  {
    uint64_t v7 = +[TGraphSampler sharedInstance];
    [(TGraphSampler *)v7 updatePowerlogLiteMode:qword_1000AA798 pressureLevel:self->thermalPressureLevel];
    [+[TGraphSampler sharedInstance] updateAppleCareState:1 value:LODWORD(self->thermalPressureLevel)];
    self->previousThermalPressureLevel = self->thermalPressureLevel;
  }
  if (qword_1000AA798 != self->previousOSThermalNotificationLevel)
  {
    if (byte_1000A2510) {
      sub_100031638(qword_1000AA798);
    }
    if (!self->needsAppleConnectThermalTrapLogging) {
      goto LABEL_27;
    }
    unint64_t previousOSThermalNotificationLevel = self->previousOSThermalNotificationLevel;
    if (previousOSThermalNotificationLevel > 0xB || (unint64_t)qword_1000AA798 <= 0xB)
    {
      if (previousOSThermalNotificationLevel < 0xC || (unint64_t)qword_1000AA798 > 0xB) {
        goto LABEL_27;
      }
      CFStringRef v9 = @"ThermalUIAlertExit";
    }
    else
    {
      CFStringRef v9 = @"ThermalUIAlertEnter";
    }
    [(CommonProduct *)self logTrapEntryForAC:v9];
LABEL_27:
    self->unint64_t previousOSThermalNotificationLevel = qword_1000AA798;
    CFNumberRef v10 = +[TGraphSampler sharedInstance];
    uint64_t v11 = qword_1000AA798;
    [(TGraphSampler *)v10 updatePowerlogMiscState:0 value:v11];
  }
}

- (int)dieTempMaxMax
{
  return sub_100009188(self->_maximumDieTempSensorIndexSet, (int *)&qword_1000AACCC, 0);
}

- (int)dieTempMaxAverage
{
  return sub_100009188(self->_averageDieTempSensorIndexSet, (int *)&qword_1000AACCC, 0);
}

- (int)dieTempFilteredMaxAverage
{
  filteredAverageDieTempSensorIndexSet = self->_filteredAverageDieTempSensorIndexSet;
  if (filteredAverageDieTempSensorIndexSet) {
    LODWORD(filteredAverageDieTempSensorIndexSet) = sub_100009188(filteredAverageDieTempSensorIndexSet, (int *)&qword_1000AACCC, byte_1000AABC8);
  }
  return (int)filteredAverageDieTempSensorIndexSet;
}

- (int)desiredLoopInterval
{
  self->_reducedRateModeActive = 0;
  return -1;
}

- (id)initProduct:(id)a3
{
  v153.receiver = self;
  v153.super_class = (Class)CommonProduct;
  uint64_t v4 = [(CommonProduct *)&v153 init];
  if (!v4) {
    return v4;
  }
  *((void *)v4 + 2) = objc_alloc_init((Class)NSMutableArray);
  *((void *)v4 + 3) = objc_alloc_init((Class)NSMutableArray);
  *((void *)v4 + 4) = 0x143E00000000;
  *((_DWORD *)v4 + 10) = 0;
  uint64_t v5 = v4 + 40;
  *((_DWORD *)v4 + 14) = 0;
  v4[8] = 0;
  v4[312] = 0;
  *((void *)v4 + 9) = 0;
  *((void *)v4 + 10) = 0;
  *((void *)v4 + 8) = 0;
  id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  *((void *)v4 + 48) = dispatch_queue_create("com.apple.ThermalMonitor.mainQueue", v6);
  [+[TGraphSampler sharedInstance] addtGraphDataSource:v4];
  id v7 = [(id)qword_1000AB158 requestListID];
  CFDictionaryRef v8 = (const __CFDictionary *)[a3 getConfigurationFor:@"generalProductConfig"];
  BOOL v9 = sub_100037D70(v8, @"noDisplay");
  id v10 = [a3 getConfigurationFor:@"powerZoneParams"];
  BOOL v11 = sub_100037D70(v8, @"usesSMCSensorExchange");
  byte_1000AB0E0 = v11;
  if (v11)
  {
    [+[SensorExchangeHelper sharedInstance] registerCLTMSensorIndex:10 forSMCKey:@"zETM" atSMCIndex:10];
    CFTypeID v12 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "<Notice> Using SensorExchangeHelper", buf, 2u);
    }
  }
  BOOL v13 = sub_100037D70(v8, @"usesACSK");
  byte_1000AA7A1 = v13;
  if (v13)
  {
    v14 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "<Notice> Using ACSK", buf, 2u);
    }
  }
  BOOL v15 = sub_100037D70(v8, @"usesKeyboardHelper");
  byte_1000AA7A3 = v15;
  if (v15)
  {
    BOOL v16 = sub_100037D70(v8, @"needsCLPCClient");
    int v17 = qword_1000AABC0;
    if (v16)
    {
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "<Notice> Uses CLPC framework", buf, 2u);
        int v17 = qword_1000AABC0;
      }
      byte_1000AA7A4 = 1;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "<Notice> Using Keyboard Helper", buf, 2u);
    }
    int v18 = objc_alloc_init(KeyboardHelper);
    *((void *)v4 + 34) = v18;
    if (v18)
    {
      [(KeyboardHelper *)v18 registerForKeyboardEvents];
      if (sub_100037D70(v8, @"usesFolioHelper"))
      {
        dispatch_time_t v19 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "<Notice> Using Folio Helper", buf, 2u);
        }
        [*((id *)v4 + 34) registerForFolioEvents];
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_10005C3D4();
    }
  }
  if (!sub_100037D70(v8, @"skipMitigationController"))
  {
    v4[44] = sub_100037D70(v8, @"needsFastDieControl");
    v20 = [MitigationController alloc];
    uint64_t v21 = v4[44];
    id v22 = [a3 getConfigurationFor:@"powerSaveParams"];
    uint64_t v23 = v21;
    uint64_t v5 = v4 + 40;
    qword_1000AB158 = [(MitigationController *)v20 initForFastLoop:v23 noDisplay:v9 powerSaveParams:v22 powerZoneParams:v10];
  }
  id v24 = [a3 getConfigurationFor:@"packageComponentControl"];
  if (v24)
  {
    int v25 = [[PackagePowerCC alloc] initWithParams:v24];
  }
  else
  {
    CFDictionaryRef v26 = (const __CFDictionary *)[a3 getConfigurationFor:@"cpuComponentControl"];
    if (v26)
    {
      CFDictionaryRef v27 = v26;
      *(_DWORD *)buf = 0;
      sub_100008280(v26, @"controllerVersion", kCFNumberIntType, buf);
      if (*(_DWORD *)buf == 2)
      {
        v28 = [[CpuPiecewiseCC alloc] initWithParams:v27 listID:v7 needspowerZones:v10 != 0];
      }
      else
      {
        unsigned int valuePtr = 1065353216;
        CFNumberRef v29 = (const __CFNumber *)[a3 getConfigurationFor:@"Power_Scale"];
        if (v29) {
          CFNumberGetValue(v29, kCFNumberIntType, &valuePtr);
        }
        v30 = [CpuCC alloc];
        LODWORD(v31) = valuePtr;
        v28 = [(CpuCC *)v30 initWithParams:v27 powerScale:v7 listID:v10 != 0 needspowerZones:v31];
      }
      v32 = v28;
      [*((id *)v4 + 2) addObject:v28];
    }
    id v33 = [a3 getConfigurationFor:@"socComponentControl"];
    if (!v33) {
      goto LABEL_36;
    }
    int v25 = [[SocCC alloc] initWithParams:v33 listID:v7];
  }
  [*((id *)v4 + 2) addObject:v25];

LABEL_36:
  unsigned int valuePtr = 0;
  sub_100008280(v8, @"radioControllerType", kCFNumberIntType, &valuePtr);
  uint64_t v35 = valuePtr;
  v36 = off_100084B18;
  switch(valuePtr)
  {
    case 0u:
      goto LABEL_56;
    case 3u:
      goto LABEL_38;
    case 4u:
      v36 = off_100084B10;
LABEL_38:
      id v37 = [objc_alloc(*v36) initWithRunLoopAndParams:objc_msgSend(a3, "localMainRunloop") withParams:objc_msgSend(a3, "getConfigurationFor:", @"radioComponentControl")];
      if (v37)
      {
        v38 = v37;
        [*((id *)v4 + 2) addObject:v37];
      }
      goto LABEL_56;
    case 5u:
      uint64_t v148 = (uint64_t)&v148;
      v149 = v5;
      uint64_t v46 = 0;
      CFStringRef v144 = @"radioModemBandComponentControl";
      CFStringRef v145 = @"radioFR2RFCGComponentControl";
      CFStringRef v146 = @"radioFR2RFBCComponentControl";
      CFStringRef v147 = @"radioFR2RFBandComponentControl";
      *(void *)&long long v34 = 138412290;
      long long v150 = v34;
      break;
    default:
      v39 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_10005C368(v35, v39, v40, v41, v42, v43, v44, v45);
      }
      goto LABEL_56;
  }
  do
  {
    if (byte_1000AA7A0)
    {
      v47 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v48 = (uint64_t)*(&v144 + v46);
        *(_DWORD *)buf = v150;
        uint64_t v155 = v48;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "<Notice> Getting configuration and initializing RadioPowerCC type: %@", buf, 0xCu);
      }
    }
    uint64_t v49 = (uint64_t)*(&v144 + v46);
    id v50 = [a3 getConfigurationFor:v49, v144, v145, v146, v147, v148];
    if (!v50)
    {
      uint64_t v53 = qword_1000AABC0;
      if (!os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        goto LABEL_52;
      }
      *(_DWORD *)buf = v150;
      uint64_t v155 = v49;
      v54 = v53;
      v55 = "<Error> No configuration found for RadioPowerCC name: %@";
      goto LABEL_55;
    }
    v51 = -[RadioPowerCC initWithRunLoopAndParams:withMitigationType:withParams:]([RadioPowerCC alloc], "initWithRunLoopAndParams:withMitigationType:withParams:", [a3 localMainRunloop], dword_100069260[v46], v50);
    if (v51)
    {
      v52 = v51;
      [*((id *)v4 + 2) addObject:v51];

      goto LABEL_52;
    }
    uint64_t v56 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = v150;
      uint64_t v155 = v49;
      v54 = v56;
      v55 = "<Error> Failed to initialize RadioPowerCC name: %@";
LABEL_55:
      _os_log_error_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, v55, buf, 0xCu);
    }
LABEL_52:
    ++v46;
  }
  while (v46 != 4);
  uint64_t v5 = v149;
LABEL_56:
  v57 = [[ThermalLevelCC alloc] initWithProduct:v4];
  [*((id *)v4 + 2) addObject:v57];

  id v58 = [a3 getConfigurationFor:@"backlightComponentControl"];
  if (v58)
  {
    id v59 = [v4 newBacklightComponentController:v58];
    [*((id *)v4 + 2) addObject:v59];
  }
  CFDictionaryRef v60 = (const __CFDictionary *)[a3 getConfigurationFor:@"refreshRateComponentControl"];
  if (v60)
  {
    CFDictionaryRef v61 = v60;
    Value = CFDictionaryGetValue(v60, @"RefreshRate");
    if (Value)
    {
      v63 = Value;
      v64 = [[RefreshRateCC alloc] initWithParams:v61];
      [(RefreshRateCC *)v64 initRefreshRateTable:v63];
      [*((id *)v4 + 2) addObject:v64];
    }
  }
  id v65 = [a3 getConfigurationFor:@"fanComponentControl"];
  if (v65)
  {
    v66 = [[FanCC alloc] initWithParams:v65];
    [*((id *)v4 + 2) addObject:v66];
  }
  id v67 = [a3 getConfigurationFor:@"wifiComponentControl"];
  if (v67)
  {
    v68 = [[WiFiCC alloc] initWithParams:v67];
    [*((id *)v4 + 2) addObject:v68];
  }
  id v69 = [a3 getConfigurationFor:@"audioAmpComponentControl"];
  if (v69)
  {
    v70 = [[AudioAmpCC alloc] initWithParams:v69];
    [*((id *)v4 + 2) addObject:v70];
  }
  CFDictionaryRef v71 = (const __CFDictionary *)[a3 getConfigurationFor:@"arcComponentControl"];
  if (v71)
  {
    CFDictionaryRef v72 = v71;
    BOOL v73 = sub_100037D70(v71, @"usesArcPowerCC");
    v74 = off_100084A68;
    if (v73) {
      v74 = &off_100084A70;
    }
    id v75 = [objc_alloc(*v74) initWithParams:v72 product:v4];
    [*((id *)v4 + 2) addObject:v75];
  }
  id v76 = [a3 getConfigurationFor:@"speakerComponentControl"];
  if (v76)
  {
    v77 = [[SpeakerCC alloc] initWithParams:v76];
    [*((id *)v4 + 2) addObject:v77];
  }
  [v4 registerDisplayNotification];
  [v4 registerChargerNotification];
  if (!sub_100037D70(v8, @"noChargingControl"))
  {
    if (sub_100037D70(v8, @"usesLinkCharger"))
    {
      id v78 = [a3 getConfigurationFor:@"linkChargerComponentControl"];
      v79 = LinkChargerCC;
      goto LABEL_78;
    }
    id v80 = [a3 getConfigurationFor:@"powerSourceComponentControl"];
    if (v80)
    {
      id v78 = v80;
      v79 = PowerSourceCC;
LABEL_78:
      id v81 = [[v79 alloc] initWithParams:v78];
      [*((id *)v4 + 2) addObject:v81];
    }
  }
  CFArrayRef v82 = (const __CFArray *)[a3 getConfigurationFor:@"Sensors"];
  *((_DWORD *)v4 + 74) = CFArrayGetCount(v82);
  [+[HidSensors sharedInstance] loadProductTemperatureParameters:v82];
  CFArrayRef v83 = (const __CFArray *)[a3 getConfigurationFor:@"powerSensors"];
  if (v83)
  {
    CFArrayRef v84 = v83;
    if (CFArrayGetCount(v83) >= 1)
    {
      *((_DWORD *)v4 + 75) = CFArrayGetCount(v84);
      [+[HidSensors sharedInstance] loadProductPowerParameters:v84];
    }
  }
  unsigned int v85 = [v4 sensorIndexFromList:v82 fourCharCode:@"TP0Z"];
  *((_DWORD *)v4 + 8) = v85;
  if (v85 == -1 && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_10005C334();
  }
  if (sub_100008280(v8, @"requiredCalibrationResistorSamples", kCFNumberIntType, v5))
  {
    if (byte_1000AA7A0)
    {
      v86 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        int v87 = *v5;
        *(_DWORD *)buf = 67109120;
        LODWORD(v155) = v87;
        _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "<Notice> Required Tcal samples: %d", buf, 8u);
      }
    }
  }
  byte_1000AABC8 = sub_100037D70(v8, @"hasInternalSensorFiltering");
  v88 = qword_1000AABC0;
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "<Notice> Has internally filtered sensors", buf, 2u);
  }
  *((void *)v4 + 42) = [v4 copyDieTempSensorIndexSetForFourthChar:97 sensors:v82 filteredOnly:0];
  *((void *)v4 + 41) = [v4 copyDieTempSensorIndexSetForFourthChar:120 sensors:v82 filteredOnly:0];
  if (byte_1000AABC8)
  {
    uint64_t v89 = 97;
    CFArrayRef v90 = v82;
    uint64_t v91 = 1;
  }
  else
  {
    uint64_t v89 = 102;
    CFArrayRef v90 = v82;
    uint64_t v91 = 0;
  }
  *((void *)v4 + 43) = [v4 copyDieTempSensorIndexSetForFourthChar:v89 sensors:v90 filteredOnly:v91];
  if (byte_1000AA7A0)
  {
    v92 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v93 = *((void *)v4 + 42);
      *(_DWORD *)buf = 138412290;
      uint64_t v155 = v93;
      _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "<Notice> avg die: %@", buf, 0xCu);
      if (byte_1000AA7A0)
      {
        v92 = qword_1000AABC0;
        goto LABEL_98;
      }
    }
    else
    {
LABEL_98:
      if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v94 = *((void *)v4 + 41);
        *(_DWORD *)buf = 138412290;
        uint64_t v155 = v94;
        _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "<Notice> max die: %@", buf, 0xCu);
        int v95 = byte_1000AA7A0;
      }
      else
      {
        int v95 = 1;
      }
      uint64_t v96 = *((void *)v4 + 43);
      if (v96)
      {
        if (v95)
        {
          v97 = qword_1000AABC0;
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v155 = v96;
            _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEFAULT, "<Notice> filtered average die: %@", buf, 0xCu);
          }
        }
      }
    }
  }
  *((void *)v4 + 38) = 0;
  if (CFArrayGetCount(v82) >= 1)
  {
    CFIndex v98 = 0;
    do
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v82, v98);
      v100 = CFDictionaryGetValue(ValueAtIndex, @"4CharCode");
      if (v98 != *((_DWORD *)v4 + 8) && [v4 fourCharCodeNeedsPMUtcal:v100]) {
        *((void *)v4 + 38) |= 1 << v98;
      }
      ++v98;
    }
    while (CFArrayGetCount(v82) > v98);
  }
  CFArrayRef v101 = (const __CFArray *)[v4 copyHotspotsArray:a3];
  if (v101)
  {
    CFArrayRef v102 = v101;
    CFIndex Count = CFArrayGetCount(v101);
    if (Count >= 1)
    {
      CFIndex v104 = Count;
      for (CFIndex i = 0; i != v104; ++i)
      {
        v106 = [[SupervisorControl alloc] initWithMitigationType:(i + 18) paramInfo:CFArrayGetValueAtIndex(v102, i)];
        [*((id *)v4 + 3) addObject:v106];
      }
    }
    CFRelease(v102);
  }
  int v151 = 0;
  sub_100008280(v8, @"solarContextType", kCFNumberIntType, &v151);
  if ((v151 - 1) < 2)
  {
    [+[ContextAwareThermalManager sharedInstance] createNewSolarContext:0];
    if (v151 != 2)
    {
      uint64_t v107 = 1;
      goto LABEL_125;
    }
    goto LABEL_121;
  }
  if ((v151 - 3) < 2)
  {
    uint64_t v107 = 1;
    [+[ContextAwareThermalManager sharedInstance] createNewSolarContext:1];
    if (v151 != 4)
    {
LABEL_125:
      [objc_msgSend(v4, "findComponent:", 0) setSolarDetectorPresent:v107];
      goto LABEL_126;
    }
LABEL_121:
    uint64_t v107 = 1;
    [objc_msgSend(v4, "findComponent:", 0) setSolarBehaviorSuppressed:1];
    goto LABEL_125;
  }
  uint64_t v107 = 0;
  if (!v151) {
    goto LABEL_125;
  }
LABEL_126:
  v4[105] = v151 == 0;
  if (sub_100037D70(v8, @"usesInPocketContext"))
  {
    if (_os_feature_enabled_impl())
    {
      v108 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "<Notice> In-pocket context disabled due to restricted perf mode", buf, 2u);
      }
    }
    else
    {
      -[ContextAwareThermalManager createNewInPocketContext:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "createNewInPocketContext:", [a3 getConfigurationFor:@"inPocketContextParams"]);
    }
  }
  if (sub_100037D70(v8, @"shouldDispatchVirtualTemp"))
  {
    [+[HidSensors sharedInstance] enableDispatchVirtualTemp];
    [+[HidSensors sharedInstance] initLocationStrings];
  }
  if (sub_100037D70(v8, @"enableSending2DTempGridToDisplayDriver")) {
    [+[HidSensors sharedInstance] enableSending2DTempGridToDisplayDriver];
  }
  if (sub_100037D70(v8, @"enableSendingMaxTempToDisplayDriver")) {
    [v4 enableSendingMaxTempToDisplayDriver];
  }
  v4[104] = sub_100037D70(v8, @"canForceThermalLevels");
  *((void *)v4 + 6) = -[TableDrivenDecisionTree initWithComponentControllers:hotspotControllers:decisionTreeTable:]([TableDrivenDecisionTree alloc], "initWithComponentControllers:hotspotControllers:decisionTreeTable:", *((void *)v4 + 2), *((void *)v4 + 3), [a3 getConfigurationFor:@"DecisionTreeTable"]);
  if (sub_100037D70(v8, @"monitorsCameraSensors"))
  {
    id v109 = [v4 sensorIndexFromList:v82 fourCharCode:@"SS0F"];
    id v110 = [v4 sensorIndexFromList:v82 fourCharCode:@"SS0C"];
    if (v109 == -1) {
      id v109 = [v4 sensorIndexFromList:v82 fourCharCode:@"TK0F"];
    }
    if (v110 == -1)
    {
      id v110 = [v4 sensorIndexFromList:v82 fourCharCode:@"TK0C"];
      if ((v109 & 0x80000000) == 0) {
        goto LABEL_144;
      }
    }
    else
    {
      if ((v109 & 0x80000000) != 0) {
        goto LABEL_157;
      }
LABEL_144:
      if ((v110 & 0x80000000) == 0)
      {
        *((void *)v4 + 12) = [[CameraTS alloc] initWithFrontCameraSensorIdx:v109 rearCameraSensorIdx:v110];
        id v111 = [v4 sensorIndexFromList:v82 fourCharCode:@"TK1F"];
        if ((v111 & 0x80000000) == 0) {
          [*((id *)v4 + 12) enableFrontIRCameraNotifications:v111];
        }
        id v112 = [v4 sensorIndexFromList:v82 fourCharCode:@"TK2F"];
        if ((v112 & 0x80000000) == 0) {
          [*((id *)v4 + 12) enableFrontRomeoNTCNotifications:v112];
        }
        id v113 = [v4 sensorIndexFromList:v82 fourCharCode:@"TK3F"];
        if ((v113 & 0x80000000) == 0) {
          [*((id *)v4 + 12) enableFrontRigelDieNotifications:v113];
        }
        id v114 = [v4 sensorIndexFromList:v82 fourCharCode:@"TK1C"];
        if ((v114 & 0x80000000) == 0) {
          [*((id *)v4 + 12) enableRearCameraTeleNotifications:v114];
        }
        id v115 = [v4 sensorIndexFromList:v82 fourCharCode:@"TK2C"];
        if ((v115 & 0x80000000) == 0) {
          [*((id *)v4 + 12) enableRearCameraSuperWideNotifications:v115];
        }
        id v116 = [v4 sensorIndexFromList:v82 fourCharCode:@"TK3C"];
        if ((v116 & 0x80000000) == 0) {
          [*((id *)v4 + 12) enableRearCameraJasperNotifications:v116];
        }
        goto LABEL_159;
      }
    }
LABEL_157:
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_10005C300();
    }
  }
LABEL_159:
  if (sub_100037D70(v8, @"monitorsRadioSensors")
    && ([v4 sensorIndexFromList:v82 fourCharCode:@"TB0R"] & 0x80000000) == 0
    && ([v4 sensorIndexFromList:v82 fourCharCode:@"TB1R"] & 0x80000000) == 0)
  {
    +[RadioTS sharedInstance];
  }
  v117 = qword_1000AABC0;
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEFAULT, "<Notice> Checking for needsAccessoryHelper", buf, 2u);
  }
  if (sub_100037D70(v8, @"needsAccessoryHelper"))
  {
    v118 = [[AccessoryHelper alloc] initWithProduct:v4];
    *((void *)v4 + 33) = v118;
    v119 = qword_1000AABC0;
    BOOL v120 = os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT);
    if (v118)
    {
      if (v120)
      {
        *(_WORD *)buf = 0;
        v121 = "<Notice> Created AccessoryHelper";
        goto LABEL_171;
      }
    }
    else if (v120)
    {
      *(_WORD *)buf = 0;
      v121 = "<Notice> Failed to create AccessoryHelper";
LABEL_171:
      _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_DEFAULT, v121, buf, 2u);
    }
  }
  if (sub_100037D70(v8, @"needsLifetimeServo"))
  {
    id v122 = [a3 getConfigurationFor:@"lifetimeServoParams"];
    if (v122 && (id v123 = v122, v124 = CFGetTypeID(v122), v124 == CFDictionaryGetTypeID()))
    {
      *((void *)v4 + 44) = [[LifetimeServoController alloc] initWithParams:v123 sensorList:v82];
    }
    else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_10005C2CC();
    }
  }
  else
  {
    *((void *)v4 + 44) = 0;
    if (sub_100037D70(v8, @"needsLTSStatePersistence")) {
      *((void *)v4 + 45) = -[LifetimeServoStatePersistence initWithParams:]([LifetimeServoStatePersistence alloc], "initWithParams:", [a3 getConfigurationFor:@"LTSStatePersistencePerIpRevision"]);
    }
    else {
      *((void *)v4 + 45) = 0;
    }
  }
  v4[106] = sub_100037D70(v8, @"needsAppleConnectThermalTrapLogging");
  qword_1000AB150 = 0;
  *((_WORD *)v4 + 56) = 0;
  if (sub_100037D70(v8, @"needsPushingTSFDtoDisplayDriver"))
  {
    unsigned int v125 = [v4 sensorIndexFromList:v82 fourCharCode:@"TSFD"];
    *((_DWORD *)v4 + 27) = v125;
    if (v125 == -1)
    {
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_10005C22C();
      }
    }
    else
    {
      uint64_t MainDisplay = IOMobileFramebufferGetMainDisplay();
      if (MainDisplay || !qword_1000AB150)
      {
        v127 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
          sub_10005C260(MainDisplay, v127, v128, v129, v130, v131, v132, v133);
        }
        qword_1000AB150 = 0;
      }
    }
    if (byte_1000AA7A0)
    {
      v134 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v155 = qword_1000AB150;
        _os_log_impl((void *)&_mh_execute_header, v134, OS_LOG_TYPE_DEFAULT, "<Notice> IOMFB: %@", buf, 0xCu);
      }
    }
  }
  if ([+[HidSensors sharedInstance] isSending2DTempGridToDisplayDriverEnabled])
  {
    [v4 setup2DGridDisplayDriver];
  }
  if (sub_100037D70(v8, @"needsContextualClamp"))
  {
    id v135 = [a3 getConfigurationFor:@"contextualClampParams"];
    if (v135 && (id v136 = v135, v137 = CFGetTypeID(v135), v137 == CFDictionaryGetTypeID()))
    {
      *((void *)v4 + 31) = -[ContextualClampController initWithParams:backlightController:product:]([ContextualClampController alloc], "initWithParams:backlightController:product:", v136, [v4 findComponent:0], v4);
    }
    else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_10005C1F8();
    }
  }
  else
  {
    *((void *)v4 + 31) = 0;
  }
  if (sub_100037D70(v8, @"needsArcControl"))
  {
    id v138 = [a3 getConfigurationFor:@"arcControlParams"];
    if (v138 && (id v139 = v138, v140 = CFGetTypeID(v138), v140 == CFDictionaryGetTypeID()))
    {
      *((void *)v4 + 32) = [[ArcController alloc] initWithParams:v139 product:v4];
    }
    else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_10005C1C4();
    }
  }
  else
  {
    *((void *)v4 + 32) = 0;
  }
  *(void *)(v4 + 236) = 0xB0000000ALL;
  sub_100008280(v8, @"forcedThermalLevelLower", kCFNumberIntType, v4 + 236);
  sub_100008280(v8, @"forcedThermalLevelUpper", kCFNumberIntType, v4 + 240);
  if ([v4 shouldSuppressStandardBehaviors:v8]) {
    [v4 suppressStandardBehaviors];
  }
  id v141 = [a3 getConfigurationFor:@"lowTempMitigationLimits"];
  *((void *)v4 + 36) = v141;
  if (v141)
  {
    [v4 registerDefaultsDomain];
    [*((id *)v4 + 49) addObserver:v4 forKeyPath:@"ppmSimulationMode" options:1 context:v4];
  }
  id v142 = [a3 getConfigurationFor:@"thermalMitigationLimits"];
  *((void *)v4 + 35) = v142;
  if (v142 || byte_1000AA7A1)
  {
    [v4 registerDefaultsDomain];
    [*((id *)v4 + 49) setObject:0 forKey:@"thermalSimulationMode"];
    [*((id *)v4 + 49) synchronize];
    [*((id *)v4 + 49) addObserver:v4 forKeyPath:@"thermalSimulationMode" options:1 context:v4];
  }
  byte_1000AB149 = 0;
  [v4 registerDefaultsDomain];
  [*((id *)v4 + 49) addObserver:v4 forKeyPath:@"watchdogUpdates" options:1 context:v4];
  byte_1000AB14A = sub_100037D70(v8, @"needsPowerZoneTelemetry");
  +[PowerZoneTelemetry sharedInstance];
  *((_DWORD *)v4 + 22) = 1;
  sub_100008280(v8, @"moderatePressureVersion", kCFNumberIntType, v4 + 88);
  [+[CPMSHelper sharedInstance] setProduct:v4];
  return v4;
}

- (void)registerDefaultsDomain
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004DB18;
  block[3] = &unk_100085248;
  block[4] = self;
  if (qword_1000AA738 != -1) {
    dispatch_once(&qword_1000AA738, block);
  }
}

- (void)simulateLightThermalPressure
{
  [(id)qword_1000AA7A8 setLightPressureOverride:1];
  signed int v2 = (void *)qword_1000AA7A8;

  [v2 updateThermalPressureLevelNotification:0 shouldForceThermalPressure:1];
}

- (void)removeLightPressureOverride
{
}

- (void)setHiPFeatureEnabled:(BOOL)a3
{
  byte_1000A2511 = a3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ([a3 isEqualToString:@"thermalSimulationMode"])
  {
    id v11 = [a5 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    [(CommonProduct *)self putDeviceInThermalSimulationMode:v11];
  }
  else if ([a3 isEqualToString:@"ppmSimulationMode"])
  {
    id v12 = [a5 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    [(CommonProduct *)self putDeviceInLowTempSimulationMode:v12];
  }
  else if ([a3 isEqualToString:@"watchdogUpdates"])
  {
    id v13 = [a5 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    [(CommonProduct *)self thermalUpdatesToWatchdogEnabled:v13];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_10005C408();
    }
    v14.receiver = self;
    v14.super_class = (Class)CommonProduct;
    [(CommonProduct *)&v14 observeValueForKeyPath:a3 ofObject:a4 change:a5 context:a6];
  }
}

- (void)thermalUpdatesToWatchdogEnabled:(id)a3
{
  uint64_t v4 = qword_1000AABC0;
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> Asked to change watchdog updates mode to %@", (uint8_t *)&v9, 0xCu);
  }
  unsigned int v5 = [a3 isEqualToString:@"false"];
  byte_1000A2512 = v5 ^ 1;
  if (byte_1000AA7A0)
  {
    unsigned int v6 = v5;
    id v7 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      CFDictionaryRef v8 = "en";
      if (v6) {
        CFDictionaryRef v8 = "dis";
      }
      int v9 = 136315138;
      id v10 = (id)v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> Watchdog Thermal Updates %sabled", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)putDeviceInThermalSimulationMode:(id)a3
{
  unsigned int v5 = qword_1000AABC0;
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> Asked to change thermal mode to %@", (uint8_t *)&v13, 0xCu);
  }
  if (a3)
  {
    if ([a3 isEqualToString:@"off"])
    {
      [(CommonProduct *)self clearLoadingIndexOverrides];
      [(CommonProduct *)self removeLightPressureOverride];
      [(CommonProduct *)self setHiPFeatureEnabled:1];
      byte_1000AB149 = 0;
      dword_1000AAE08 = 0;
      return;
    }
    if ([a3 isEqualToString:@"nominal"])
    {
      memset(&qword_1000AB138, 100, 17);
      [(CommonProduct *)self removeLightPressureOverride];
      [(CommonProduct *)self setHiPFeatureEnabled:0];
      byte_1000AB149 = 1;
      int v6 = 1065353216;
LABEL_15:
      dword_1000AAE08 = v6;
      return;
    }
  }
  [(CommonProduct *)self setHiPFeatureEnabled:0];
  byte_1000AB149 = 1;
  id v7 = [(NSDictionary *)self->simulatedThermalMitigationLimits valueForKeyPath:a3];
  for (uint64_t i = 0; i != 17; ++i)
  {
    id v9 = [v7 valueForKey:*(&off_100086388 + i)];
    if (v9) {
      *((unsigned char *)&qword_1000AB138 + i) = [v9 integerValue];
    }
  }
  if (a3)
  {
    if ([a3 isEqualToString:@"light"])
    {
      [(CommonProduct *)self simulateLightThermalPressure];
      int v6 = 0x40000000;
      goto LABEL_15;
    }
    unsigned __int8 v11 = [a3 isEqualToString:@"moderate"];
    LODWORD(v10) = 3.0;
    if ((v11 & 1) != 0
      || (unsigned int v12 = objc_msgSend(a3, "isEqualToString:", @"heavy", v10), LODWORD(v10) = 4.0, v12))
    {
      dword_1000AAE08 = LODWORD(v10);
    }
  }
  [(CommonProduct *)self removeLightPressureOverride];
}

- (void)putDeviceInLowTempSimulationMode:(id)a3
{
  unsigned int v5 = qword_1000AABC0;
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> Asked to change low temp mode to %@", (uint8_t *)&v13, 0xCu);
  }
  if ([a3 isEqualToString:@"off"])
  {
    sub_100039B0C(0);
    sub_10003927C(0);
    sub_10003900C();
    sub_1000390C8();
    sub_1000387B0();
    nullsub_1();
    sub_1000384B0();
    sub_1000388DC();
  }
  else
  {
    sub_100039B0C(1);
    sub_10003927C(1);
    id v6 = [(NSDictionary *)self->simulatedLowTempMitigationLimits valueForKeyPath:a3];
    if (v6)
    {
      id v7 = v6;
      id v8 = [v6 valueForKey:@"Ra"];
      if (v8)
      {
        sub_100038F60((int)[v8 integerValue]);
      }
      else
      {
        id v9 = [v7 valueForKey:@"wRa"];
        if (v9) {
          sub_10003901C((int)[v9 integerValue]);
        }
      }
      id v10 = [v7 valueForKey:@"soc"];
      if (v10)
      {
        unsigned __int8 v11 = v10;
        sub_1000387A4((uint64_t)[v10 integerValue]);
        sub_1000384A4((uint64_t)[v11 integerValue]);
        sub_1000386FC((int)[v11 integerValue]);
      }
      id v12 = [v7 valueForKey:@"TG0B"];
      if (v12) {
        sub_1000387C0(@"TG0B", (int)[v12 integerValue]);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_10005C43C();
    }
  }
}

- (void)dealloc
{
  filteredAverageDieTempSensorIndexSet = self->_filteredAverageDieTempSensorIndexSet;
  if (filteredAverageDieTempSensorIndexSet) {

  }
  notify_cancel(self->_displayToken);
  notify_cancel(self->_chargerToken);

  v4.receiver = self;
  v4.super_class = (Class)CommonProduct;
  [(CommonProduct *)&v4 dealloc];
}

- (id)copyDieTempSensorIndexSetForFourthChar:(char)a3 sensors:(__CFArray *)a4 filteredOnly:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = a3;
  id v9 = [objc_alloc((Class)NSMutableArray) initWithCapacity:0];
  if (CFArrayGetCount(a4) >= 1)
  {
    CFIndex v10 = 0;
    do
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a4, v10);
      if ([(CommonProduct *)self fourCharCodeMatchesDieTempType:v7 fourCharCode:CFDictionaryGetValue(ValueAtIndex, @"4CharCode")]&& (!v5|| [+[HidSensors sharedInstance] getFilterTimeConstantForSensor:v10] >= 1))
      {
        [v9 addObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v10)];
      }
      ++v10;
    }
    while (CFArrayGetCount(a4) > v10);
  }
  if ([v9 count]) {
    id v12 = [v9 copy];
  }
  else {
    id v12 = 0;
  }

  return v12;
}

- (BOOL)fourCharCodeMatchesDieTempType:(char)a3 fourCharCode:(__CFString *)a4
{
  if (!a4) {
    return 0;
  }
  int CString = CFStringGetCString(a4, buffer, 16, 0x8000100u);
  BOOL result = 0;
  if (CString && buffer[0] == 84)
  {
    unsigned int v7 = buffer[1] - 80;
    BOOL v8 = v7 > 0x23;
    uint64_t v9 = (1 << v7) & 0x901AA0001;
    BOOL v10 = v8 || v9 == 0;
    if (v10 || v13 != 99 && v13 - 48 > 9) {
      return 0;
    }
    return v14 == a3 && v15 == 0;
  }
  return result;
}

- (BOOL)fourCharCodeNeedsPMUtcal:(__CFString *)a3
{
  if (!a3) {
    goto LABEL_7;
  }
  int CString = CFStringGetCString(a3, buffer, 16, 0x8000100u);
  if (CString)
  {
    LOBYTE(CString) = 0;
    if (buffer[0] == 84 && buffer[1] == 80)
    {
      if (v6 != 100 && v6 - 65 > 0x19)
      {
LABEL_7:
        LOBYTE(CString) = 0;
        return CString;
      }
      LOBYTE(CString) = v7 == 0;
    }
  }
  return CString;
}

- (BOOL)mitigationsFullyReleased
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  listofComponentControl = self->listofComponentControl;
  id v3 = [(NSMutableArray *)listofComponentControl countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(listofComponentControl);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) releaseMaxLI] < 0x64) {
          return 0;
        }
      }
      id v4 = [(NSMutableArray *)listofComponentControl countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  return 1;
}

- (int)getChargerState
{
  return self->_chargerState;
}

- (void)registerDisplayNotification
{
  objc_initWeak(&location, self);
  thermalQueue = self->_thermalQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004E7EC;
  v4[3] = &unk_1000850E8;
  objc_copyWeak(&v5, &location);
  sub_1000395F0("com.apple.iokit.hid.displayStatus", &self->_displayToken, thermalQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)registerChargerNotification
{
  objc_initWeak(&location, self);
  thermalQueue = self->_thermalQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004E920;
  v4[3] = &unk_1000850E8;
  objc_copyWeak(&v5, &location);
  sub_1000395F0("com.apple.system.powermanagement.poweradapter", &self->_chargerToken, thermalQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)clearControlEffortOverrides
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  listOfSupervisorControl = self->listOfSupervisorControl;
  id v4 = [(NSMutableArray *)listOfSupervisorControl countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(listOfSupervisorControl);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * i) setAllowCEOverride:0];
      }
      id v5 = [(NSMutableArray *)listOfSupervisorControl countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v5);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  listofComponentControl = self->listofComponentControl;
  id v9 = [(NSMutableArray *)listofComponentControl countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (j = 0; j != v10; j = (char *)j + 1)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(listofComponentControl);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)j) setAllowCEOverride:0];
      }
      id v10 = [(NSMutableArray *)listofComponentControl countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v10);
  }
}

- (void)clearLoadingIndexOverrides
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  listofComponentControl = self->listofComponentControl;
  id v3 = [(NSMutableArray *)listofComponentControl countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(listofComponentControl);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * i) setAllowLIOverride:0];
      }
      id v4 = [(NSMutableArray *)listofComponentControl countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)createConnectionToCT
{
  id v2 = [(CommonProduct *)self findComponent:4];

  [v2 createConnectionToCT];
}

- (void)emitThermalMitigationNotifications
{
  [+[SensorDispatcherHelper sharedInstance] getFloatValueFromSMCForKey:@"mxTM"];
  int v3 = (int)v2;
  if (dword_1000AA750 != (int)v2 && v3 != -1)
  {
    [(id)qword_1000AA7A8 updateThermalMitigationNotification:(int)v2];
    dword_1000AA750 = v3;
    uint64_t v5 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> Thermal Mitigation = %d", (uint8_t *)v6, 8u);
    }
    kdebug_trace();
  }
}

- (void)logTrapEntryForAC:(id)a3
{
  id v3 = [objc_alloc((Class)NSMutableArray) initWithObjects:a3, 0];
  [v3 addObjectsFromArray:GetThermalState()];
  logEventForAppleCare();
}

- (id)findComponent:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  listOfSupervisorControl = self->listOfSupervisorControl;
  id v6 = [(NSMutableArray *)listOfSupervisorControl countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v22;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v22 != v8) {
        objc_enumerationMutation(listOfSupervisorControl);
      }
      long long v10 = *(void **)(*((void *)&v21 + 1) + 8 * v9);
      if ([v10 isEqualMType:v3]) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [(NSMutableArray *)listOfSupervisorControl countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    listofComponentControl = self->listofComponentControl;
    id v12 = [(NSMutableArray *)listofComponentControl countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v18;
LABEL_11:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(listofComponentControl);
        }
        long long v10 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
        if ([v10 isEqualMType:v3]) {
          break;
        }
        if (v13 == (id)++v15)
        {
          id v13 = [(NSMutableArray *)listofComponentControl countByEnumeratingWithState:&v17 objects:v25 count:16];
          long long v10 = 0;
          if (v13) {
            goto LABEL_11;
          }
          return v10;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return v10;
}

- (void)getAllComponentID:(__SCPreferences *)a3
{
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  listofComponentControl = self->listofComponentControl;
  id v7 = [(NSMutableArray *)listofComponentControl countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(listofComponentControl);
        }
        CFArrayAppendValue(Mutable, [*(id *)(*((void *)&v20 + 1) + 8 * i) nameofComponent]);
      }
      id v8 = [(NSMutableArray *)listofComponentControl countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  listOfSupervisorControl = self->listOfSupervisorControl;
  id v12 = [(NSMutableArray *)listOfSupervisorControl countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(listOfSupervisorControl);
        }
        CFArrayAppendValue(Mutable, [*(id *)(*((void *)&v16 + 1) + 8 * (void)j) nameofComponent]);
      }
      id v13 = [(NSMutableArray *)listOfSupervisorControl countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
  SCPreferencesSetValue(a3, @"listComponentID_CLTMV2", Mutable);
  SCPreferencesCommitChanges(a3);
  CFRelease(Mutable);
}

- (int)getCurrentMaxLIForComponent:(unsigned int)a3
{
  id v3 = [(CommonProduct *)self findComponent:*(void *)&a3];

  return [v3 getReleaseMaxLI];
}

- (id)newBacklightComponentController:(__CFDictionary *)a3
{
  id v4 = [BackLightCCSingle alloc];

  return [(BackLightCCSingle *)v4 initWithParams:a3];
}

- (void)enableSendingMaxTempToDisplayDriver
{
  self->sendMaxTemp = 1;
}

- (iir_filter_t)getFilterValues
{
  float v2 = +[HidSensors sharedInstance];

  return [(HidSensors *)v2 getFilterTable];
}

- (int)getHighestSkinTemp
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  listOfSupervisorControl = self->listOfSupervisorControl;
  id v3 = [(NSMutableArray *)listOfSupervisorControl countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  unsigned int v5 = 0;
  uint64_t v6 = *(void *)v11;
  do
  {
    for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(listOfSupervisorControl);
      }
      unsigned int v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) getThermalStateofHotspot];
      if (v8 > v5) {
        unsigned int v5 = v8;
      }
    }
    id v4 = [(NSMutableArray *)listOfSupervisorControl countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v4);
  return v5;
}

- (unint64_t)getMaxSensorValue
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  listOfSupervisorControl = self->listOfSupervisorControl;
  id v3 = [(NSMutableArray *)listOfSupervisorControl countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    id v4 = v3;
    unsigned int v5 = 0;
    uint64_t v6 = *(void *)v14;
    float v7 = 100.0;
    do
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(listOfSupervisorControl);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v9 calculateTargetDifference];
        if (v10 < v7)
        {
          float v7 = v10;
          unsigned int v5 = v9;
        }
      }
      id v4 = [(NSMutableArray *)listOfSupervisorControl countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
  else
  {
    unsigned int v5 = 0;
  }
  [v5 hotspotTemperature];
  return (unint64_t)(float)(v11 * 100.0);
}

- (BOOL)isInternalInstall
{
  if (qword_1000AA758 != -1) {
    dispatch_once(&qword_1000AA758, &stru_100086310);
  }
  return byte_1000AA754;
}

- (void)updateAllThermalLoad:(BOOL)a3
{
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_10005C470();
  }
}

- (int)compute2DGridTemps
{
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_10005C4A4();
  }
  return 0;
}

- (int)computeMaxCGTemp
{
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_10005C4D8();
  }
  return -1;
}

- (int)getFrontDisplayCenterTemperature
{
  return 3500;
}

- (void)writeAllCornerTemperatures:(int)a3
{
  double v3 = (double)a3 / 100.0;
  signed int v4 = vcvtd_n_s64_f64(v3, 0x10uLL);
  uint64_t v17 = v4;
  uint64_t v18 = v4;
  uint64_t v19 = v4;
  uint64_t v20 = v4;
  uint64_t v5 = IOMobileFramebufferSetParameter();
  if (v5)
  {
    uint64_t v6 = v5;
    float v7 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_10005C50C(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else if (byte_1000AA7A0)
  {
    long long v14 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 134217984;
      double v16 = v3 * 65536.0 * 0.0000152587891;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "<Notice> Pushed TSFD=%0.2f", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)sendMaxTempToDisplayDriver:(int)a3
{
  if (qword_1000AB150)
  {
    double v3 = (double)a3 / 100.0;
    double v4 = (double)*((int *)&qword_1000AACCC + self->tsfdIndex) / 100.0;
    if (IOMobileFramebufferSetBlock())
    {
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_10005C688();
      }
    }
    else if (byte_1000AA7A0)
    {
      uint64_t v5 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        double v7 = v3;
        __int16 v8 = 2048;
        double v9 = v4;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> Sent max temp = %0.2f and center temp TSFD = %0.2f to the display driver", buf, 0x16u);
      }
    }
  }
}

- (void)send2DGridTempsToDisplayDriver:(int *)a3
{
  if (qword_1000AB150)
  {
    bzero(v16, 0x708uLL);
    int v15 = 1;
    v16[0] = 2;
    unsigned int v5 = [[-[CommonProduct getGridX](self, "getGridX") count];
    unsigned int v6 = [[-[CommonProduct getGridY](self) count];
    if ((v6 & 0x80000000) == 0)
    {
      uint64_t v7 = 0;
      __int16 v8 = (int *)&v17;
      do
      {
        uint64_t v9 = v5 + 1;
        uint64_t v10 = v8;
        uint64_t v11 = a3;
        if ((v5 & 0x80000000) == 0)
        {
          do
          {
            int v12 = *v11++;
            *v10++ = (v12 << 16) / 100;
            --v9;
          }
          while (v9);
        }
        ++v7;
        a3 += (int)(v5 + 1);
        v8 += 18;
      }
      while (v7 != v6 + 1);
    }
    if (IOMobileFramebufferSetBlock())
    {
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_10005C6BC();
      }
    }
    else if (byte_1000AA7A0)
    {
      uint64_t v13 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        v14[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "<Notice> Sent the 2D gridVT to the display driver", (uint8_t *)v14, 2u);
      }
    }
  }
}

- (void)setup2DGridDisplayDriver
{
  if (qword_1000AB150)
  {
    id v3 = [(CommonProduct *)self getGridX];
    id v4 = [(CommonProduct *)self getGridY];
    signed int v5 = [v3 count];
    signed int v6 = [v4 count];
    bzero(v14, 0x708uLL);
    uint64_t v7 = 0;
    int v13 = 1;
    v14[0] = 4;
    do
    {
      if (v7 >= v5) {
        unsigned int v8 = 0;
      }
      else {
        unsigned int v8 = [[v3 objectAtIndex:v7] intValue];
      }
      *(_DWORD *)&v14[4 * v7++ + 1648] = v8;
    }
    while (v7 != 17);
    for (uint64_t i = 0; i != 17; ++i)
    {
      if (i >= v6) {
        unsigned int v10 = 0;
      }
      else {
        unsigned int v10 = [[v4 objectAtIndex:i] intValue];
      }
      *(_DWORD *)&v14[4 * i + 1716] = v10;
    }
    if (IOMobileFramebufferSetBlock())
    {
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_10005C724();
      }
    }
    else if (byte_1000AA7A0)
    {
      uint64_t v11 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "<Notice> Sent the  grid to the display driver", v12, 2u);
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
  {
    sub_10005C6F0();
  }
}

- (id)getGridX
{
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_10005C758();
  }
  return 0;
}

- (id)getGridY
{
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_10005C78C();
  }
  return 0;
}

- (void)overrideLifetimeServoParam:(id)a3 value:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  lifetimeServoController = self->lifetimeServoController;
  if (lifetimeServoController) {
    [(LifetimeServoController *)lifetimeServoController overrideParam:a3 value:*(void *)&a4];
  }
  lifetimeServoStatePersistence = self->lifetimeServoStatePersistence;
  if (lifetimeServoStatePersistence)
  {
    [(LifetimeServoStatePersistence *)lifetimeServoStatePersistence overrideParam:a3 value:v4];
  }
}

- (int)arcModuleTemperature
{
  return 3000;
}

- (int)arcVirtualTemperature
{
  return 3000;
}

- (void)overrideArcParam:(id)a3 value:(int)a4
{
}

- (void)updateControlEffortFor:(int)a3 :(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = -[CommonProduct findComponent:](self, "findComponent:");
  if (v7)
  {
    unsigned int v8 = v7;
    [v7 setControlEffort:v4];
    [v8 setAllowCEOverride:1];
  }
  id v9 = [(CommonProduct *)self findComponent:v5];
  if (v9)
  {
    unsigned int v10 = v9;
    [v9 setControlEffort:v4];
    [v10 setAllowCEOverride:1];
  }
}

- (void)updateHotSpotPIDTargetFor:(int)a3 :(unsigned int)a4
{
  id v5 = [(CommonProduct *)self findComponent:*(void *)&a3];

  *(float *)&double v6 = (float)a4 / 100.0;
  [v5 overrideTargetTemperature:v6];
}

- (void)removeHotspotTargetOverrides
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  listOfSupervisorControl = self->listOfSupervisorControl;
  id v3 = [(NSMutableArray *)listOfSupervisorControl countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(listOfSupervisorControl);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * i) resetTargetTemperature];
      }
      id v4 = [(NSMutableArray *)listOfSupervisorControl countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)applyAlternateHotSpotTargets:(BOOL)a3
{
  BOOL v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  listOfSupervisorControl = self->listOfSupervisorControl;
  id v5 = [(NSMutableArray *)listOfSupervisorControl countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(listOfSupervisorControl);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) applyAlternateTarget:v3];
      }
      id v6 = [(NSMutableArray *)listOfSupervisorControl countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)updateMaxLIFor:(int)a3 :(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = [(CommonProduct *)self findComponent:*(void *)&a3];
  if (v5)
  {
    id v6 = v5;
    [v5 setAllowLIOverride:0];
    [v6 setMaxLoadingIndex:v4 releaseIndex:v4];
    [v6 setAllowLIOverride:1];
  }
}

- (void)updateSleepTargetFor:(int)a3 :(unsigned int)a4
{
  id v5 = [(CommonProduct *)self findComponent:*(void *)&a3];
  if (v5)
  {
    *(float *)&double v6 = (float)a4 / 100.0;
    [v5 setTHERMAL_TRAP_SLEEP:v6];
  }
}

- (void)updateTrapTargetFor:(int)a3 :(unsigned int)a4
{
  id v5 = [(CommonProduct *)self findComponent:*(void *)&a3];
  if (v5)
  {
    *(float *)&double v6 = (float)a4 / 100.0;
    [v5 setTHERMAL_TRAP_LOAD:v6];
  }
}

- (unint64_t)getPotentialForcedThermalLevel:(unint64_t)a3
{
  if (byte_1000A2510)
  {
    if (self->canForceThermalLevels)
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      listOfSupervisorControl = self->listOfSupervisorControl;
      id v6 = [(NSMutableArray *)listOfSupervisorControl countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6)
      {
        id v7 = v6;
        int v8 = 0;
        int v9 = 0;
        uint64_t v10 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(listOfSupervisorControl);
            }
            long long v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
            v8 |= [v12 shouldForceThermalLevelForThreshold:0];
            v9 |= [v12 shouldForceThermalLevelForThreshold:1];
          }
          id v7 = [(NSMutableArray *)listOfSupervisorControl countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v7);
        if ((v9 | v8))
        {
          uint64_t v13 = 236;
          if (v9) {
            uint64_t v13 = 240;
          }
          return *(int *)((char *)&self->super.isa + v13);
        }
      }
    }
  }
  return a3;
}

- (BOOL)getPotentialForcedThermalPressureLevel
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  listOfSupervisorControl = self->listOfSupervisorControl;
  id v3 = [(NSMutableArray *)listOfSupervisorControl countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(listOfSupervisorControl);
        }
        v5 |= [*(id *)(*((void *)&v9 + 1) + 8 * i) shouldEnforceLightThermalPressure];
      }
      id v4 = [(NSMutableArray *)listOfSupervisorControl countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5 & 1;
}

- (int)getModeratePressureVersion
{
  return self->moderatePressureToLevelVersion;
}

- (int)sensorIndexFromList:(__CFArray *)a3 fourCharCode:(__CFString *)a4
{
  LODWORD(v4) = -1;
  if (a3 && a4)
  {
    if (CFArrayGetCount(a3) < 1)
    {
LABEL_9:
      LODWORD(v4) = -1;
    }
    else
    {
      CFIndex v4 = 0;
      while (1)
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a3, v4);
        if (ValueAtIndex)
        {
          CFStringRef Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"4CharCode");
          if (Value)
          {
            if (CFEqual(Value, a4)) {
              break;
            }
          }
        }
        if (CFArrayGetCount(a3) <= ++v4) {
          goto LABEL_9;
        }
      }
    }
  }
  return v4;
}

- (__CFArray)copyHotspotsArray:(id)a3
{
  id v3 = (__CFArray *)[a3 getConfigurationFor:@"hotspots"];
  CFIndex v4 = v3;
  if (v3) {
    CFRetain(v3);
  }
  return v4;
}

- (void)replaceOrAppendHotspotEntry:(__CFDictionary *)a3 existingHotspots:(__CFArray *)a4
{
  newValues = a3;
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a3, @"description");
  if (Value)
  {
    CFStringRef v7 = Value;
    CFIndex Count = CFArrayGetCount(a4);
    if (Count < 1)
    {
LABEL_7:
      CFArrayAppendValue(a4, a3);
    }
    else
    {
      CFIndex v9 = Count;
      CFIndex v10 = 0;
      while (1)
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a4, v10);
        if (ValueAtIndex)
        {
          CFStringRef v12 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"description");
          if (CFEqual(v12, v7)) {
            break;
          }
        }
        if (v9 == ++v10) {
          goto LABEL_7;
        }
      }
      v15.id location = v10;
      v15.length = 1;
      CFArrayReplaceValues(a4, v15, (const void **)&newValues, 1);
    }
  }
}

- (void)updateSystemPowerState:(BOOL)a3
{
  BOOL v3 = a3;
  [+[ContextAwareThermalManager sharedInstance] updateSystemPowerState:a3];
  lifetimeServoController = self->lifetimeServoController;
  if (lifetimeServoController)
  {
    [(LifetimeServoController *)lifetimeServoController updateSystemPowerState:v3];
  }
}

- (BOOL)canSystemSleep
{
  return 1;
}

- (BOOL)shouldSuppressStandardBehaviors:(__CFDictionary *)a3
{
  CFPropertyListRef v4 = CFPreferencesCopyValue(@"FProgramNumber", @"com.apple.demo-settings", @"mobile", kCFPreferencesCurrentHost);
  if (byte_1000AA7A0)
  {
    int v5 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFPropertyListRef v25 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> FContext %@", buf, 0xCu);
    }
  }
  int valuePtr = 0;
  if (v4)
  {
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 == CFNumberGetTypeID())
    {
      if (CFNumberGetValue((CFNumberRef)v4, kCFNumberIntType, &valuePtr))
      {
        CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(a3, @"suppressionFContexts");
        if (Value)
        {
          CFArrayRef v8 = Value;
          if (CFArrayGetCount(Value) >= 1)
          {
            CFIndex v9 = 0;
            while (1)
            {
              CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v8, v9);
              if (ValueAtIndex)
              {
                *(_DWORD *)buf = 0;
                if (CFNumberGetValue(ValueAtIndex, kCFNumberIntType, buf))
                {
                  if (*(_DWORD *)buf == -1 || *(_DWORD *)buf == valuePtr)
                  {
                    BOOL v18 = 1;
                    goto LABEL_29;
                  }
                }
                else
                {
                  uint64_t v13 = qword_1000AABC0;
                  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
                    sub_10005C800(&v21, v22, v13);
                  }
                }
              }
              else
              {
                CFStringRef v12 = qword_1000AABC0;
                if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
                  sub_10005C7C0(&v19, v20, v12);
                }
              }
              if (++v9 >= CFArrayGetCount(v8)) {
                goto LABEL_27;
              }
            }
          }
          goto LABEL_37;
        }
        if (!byte_1000AA7A0)
        {
LABEL_37:
          BOOL v18 = 0;
          goto LABEL_29;
        }
        long long v17 = qword_1000AABC0;
        BOOL v18 = 0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "<Notice> no FContext array", buf, 2u);
          goto LABEL_37;
        }
LABEL_29:
        CFRelease(v4);
        goto LABEL_30;
      }
    }
  }
  if (byte_1000AA7A0)
  {
    long long v14 = qword_1000AABC0;
    BOOL v18 = 0;
    if (!os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "<Notice> no FContext key", buf, 2u);
  }
LABEL_27:
  BOOL v18 = 0;
LABEL_28:
  if (v4) {
    goto LABEL_29;
  }
LABEL_30:
  if (byte_1000AA7A0)
  {
    CFRange v15 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = v18;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "<Notice> suppressStandardBehaviors %d", buf, 8u);
    }
  }
  return v18;
}

- (int)canaryTempSensorIndex
{
  return -1;
}

- (int)canaryTempThreshold
{
  return -32768;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  if (a3 > 6) {
    return 0;
  }
  else {
    return *(&off_100086330 + a3);
  }
}

- (int)calibrationResistorSensor
{
  return self->calibrationResistorSensor;
}

- (int)calibrationResistorTempDefault
{
  return self->calibrationResistorTempDefault;
}

- (unsigned)requiredCalibrationResistorSamples
{
  return self->requiredCalibrationResistorSamples;
}

- (unint64_t)componentThermalStatusLevel
{
  return self->componentThermalStatusLevel;
}

- (void)setComponentThermalStatusLevel:(unint64_t)a3
{
  self->unint64_t componentThermalStatusLevel = a3;
}

- (NSMutableArray)listofComponentControl
{
  return self->listofComponentControl;
}

- (NSMutableArray)listOfSupervisorControl
{
  return self->listOfSupervisorControl;
}

- (void)setThermalState:(int)a3
{
  self->thermalState = a3;
}

- (BOOL)isBackLightOn
{
  return self->_isBackLightOn;
}

- (void)setIsBackLightOn:(BOOL)a3
{
  self->_isBackLightOn = a3;
}

- (int)displayToken
{
  return self->_displayToken;
}

- (void)setDisplayToken:(int)a3
{
  self->_displayToken = a3;
}

- (int)chargerToken
{
  return self->_chargerToken;
}

- (void)setChargerToken:(int)a3
{
  self->_chargerToken = a3;
}

- (int)chargerState
{
  return self->_chargerState;
}

- (void)setChargerState:(int)a3
{
  self->_chargerState = a3;
}

- (OS_dispatch_queue)thermalQueue
{
  return self->_thermalQueue;
}

- (void)setThermalQueue:(id)a3
{
}

- (int64_t)thermalPressureLevel
{
  return self->thermalPressureLevel;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (BOOL)isCPMSMitigationEnabled
{
  return self->_isCPMSMitigationEnabled;
}

- (void)setIsCPMSMitigationEnabled:(BOOL)a3
{
  self->_isCPMSMitigationEnabled = a3;
}

@end