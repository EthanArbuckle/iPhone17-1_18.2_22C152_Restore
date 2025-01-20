@interface ContextualClampController
- (BOOL)isFrontCameraPowered;
- (BOOL)isRearCameraPowered;
- (ContextualClampController)init;
- (ContextualClampController)initWithParams:(id)a3 backlightController:(id)a4 product:(id)a5;
- (OS_dispatch_queue)clampQueue;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)frontCameraPowerStateToken;
- (int)numberOfFields;
- (int)oasisStateToken;
- (int)odeonStateToken;
- (int)rearCameraPowerStateToken;
- (int)rearSuperWideCameraPowerStateToken;
- (int)rearTeleCameraPowerStateToken;
- (void)handleFrontCameraPowerStateNotification:(unint64_t)a3;
- (void)handleOasisStateNotification:(unint64_t)a3;
- (void)handleOdeonStateNotification:(unint64_t)a3;
- (void)handleRearCameraPowerStateNotification:(unint64_t)a3;
- (void)setClampQueue:(id)a3;
- (void)setFrontCameraPowerStateToken:(int)a3;
- (void)setOasisStateToken:(int)a3;
- (void)setOdeonStateToken:(int)a3;
- (void)setRearCameraPowerStateToken:(int)a3;
- (void)setRearSuperWideCameraPowerStateToken:(int)a3;
- (void)setRearTeleCameraPowerStateToken:(int)a3;
- (void)update;
- (void)updateInternal;
- (void)updateMaxLIFloorsAndCeilings;
- (void)updatePackageFloorsAndCeilings:(BOOL)a3;
@end

@implementation ContextualClampController

- (int)numberOfFields
{
  return 9;
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  switch(a3)
  {
    case 0:
      CFAllocatorRef v3 = kCFAllocatorDefault;
      unint64_t coldPressureState = self->_coldPressureState;
      goto LABEL_13;
    case 1:
      CFAllocatorRef v6 = kCFAllocatorDefault;
      uint64_t rearCameraPowered = self->_rearCameraPowered;
      goto LABEL_11;
    case 2:
      CFAllocatorRef v6 = kCFAllocatorDefault;
      uint64_t rearCameraPowered = self->_lowTempPerfCapCPU;
      goto LABEL_11;
    case 3:
      CFAllocatorRef v6 = kCFAllocatorDefault;
      uint64_t rearCameraPowered = self->_lowTempPerfCapGPU;
      goto LABEL_11;
    case 4:
      CFAllocatorRef v6 = kCFAllocatorDefault;
      uint64_t rearCameraPowered = self->_lowTempPerfCapBL;
      goto LABEL_11;
    case 5:
      CFAllocatorRef v6 = kCFAllocatorDefault;
      uint64_t rearCameraPowered = self->_lowTempSyntheticSOC;
      goto LABEL_11;
    case 6:
      CFAllocatorRef v6 = kCFAllocatorDefault;
      uint64_t rearCameraPowered = self->_batteryRaValueTrue;
      goto LABEL_11;
    case 7:
      CFAllocatorRef v6 = kCFAllocatorDefault;
      uint64_t rearCameraPowered = self->_frontCameraPowered;
LABEL_11:
      result = (__CFString *)CFStringCreateWithFormat(v6, 0, @"%d", rearCameraPowered);
      break;
    case 8:
      CFAllocatorRef v3 = kCFAllocatorDefault;
      unint64_t coldPressureState = self->_peakPowerPressureLevel;
LABEL_13:
      result = (__CFString *)CFStringCreateWithFormat(v3, 0, @"%lld", coldPressureState);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (void)update
{
  if (self->_product)
  {
    clampQueue = self->_clampQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000A888;
    block[3] = &unk_100085248;
    block[4] = self;
    dispatch_async((dispatch_queue_t)clampQueue, block);
  }
}

- (void)updateInternal
{
  uint64_t v3 = [(CommonProduct *)self->_product gasGaugeBatteryTemperature];
  uint64_t v4 = sub_10000A624();
  self->_lowTempSyntheticSOC = v4;
  if (self->_syntheticSOCType == 1)
  {
    int v5 = sub_1000384C0();
    int v6 = (int)((double)v5 * 0.4 + (double)(int)v4 * 0.6 + 0.5);
    self->_lowTempSyntheticSOC = v6;
    if (byte_1000AA7A0)
    {
      int v7 = v5;
      v8 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)cf = 67109632;
        *(_DWORD *)&cf[4] = v4;
        *(_WORD *)&cf[8] = 1024;
        *(_DWORD *)&cf[10] = v7;
        __int16 v54 = 1024;
        int v55 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<Notice> Clamp: UI SOC %d, GG SOC %d ==> synthetic SOC %d", cf, 0x14u);
      }
    }
  }
  agingController = self->_agingController;
  if (agingController)
  {
    uint64_t v10 = sub_1000390D8();
    [(AgingController *)agingController takeActionOnUPO:v10 forWRa:sub_100038BA4()];
  }
  if (self->_isAgeAware)
  {
    if (self->_deviceUsesWeightedRa)
    {
      if (byte_1000AA7A0)
      {
        v11 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)cf = 136315138;
          *(void *)&cf[4] = "-[ContextualClampController updateInternal]";
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "<Notice> %s Using weighted Ra\n", cf, 0xCu);
        }
      }
      uint64_t v12 = sub_100038BA4();
    }
    else
    {
      if (byte_1000AA7A0)
      {
        v14 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)cf = 136315138;
          *(void *)&cf[4] = "-[ContextualClampController updateInternal]";
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "<Notice> %s Using max Ra\n", cf, 0xCu);
        }
      }
      uint64_t v12 = sub_100038D74();
    }
    uint64_t v13 = v12;
    self->_int batteryRaValueTrue = v12;
    int v15 = sub_1000390D8();
    int v16 = v15;
    if (dword_1000A2618 < 0) {
      dword_1000A2618 = v15;
    }
    if (byte_1000AA7A0)
    {
      v17 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        int batteryRaValueTrue = self->_batteryRaValueTrue;
        *(_DWORD *)cf = 67109888;
        *(_DWORD *)&cf[4] = batteryRaValueTrue;
        *(_WORD *)&cf[8] = 1024;
        *(_DWORD *)&cf[10] = v13;
        __int16 v54 = 1024;
        int v55 = v13;
        __int16 v56 = 1024;
        int v57 = v16;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "<Notice> Clamp: Ra true %d, effective Ra %d, effective Max Ra %d, count %d", cf, 0x1Au);
      }
    }
    if (!v16) {
      goto LABEL_26;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  lowTempClampBL = self->_lowTempClampBL;
  if (!lowTempClampBL)
  {
LABEL_26:
    int v20 = 100;
    goto LABEL_27;
  }
  int v20 = [(TableDrivenLowTempController *)lowTempClampBL outputForBatteryTemperature:v3 stateOfCharge:v4 batteryRaValue:v13];
LABEL_27:
  if (self->_lowTempPerfCapCPU != 100
    || self->_lowTempPerfCapGPU != 100
    || v20 != self->_lowTempPerfCapBL
    || self->_lowTempPerfCapCPULegacy != 100)
  {
    self->_lowTempPerfCapGPU = 100;
    self->_lowTempPerfCapBL = v20;
    *(void *)&self->_lowTempPerfCapCPULegacy = 0x6400000064;
    [(ContextualClampController *)self updateMaxLIFloorsAndCeilings];
  }
  unint64_t coldPressureState = self->_coldPressureState;
  switch(coldPressureState)
  {
    case 0x1EuLL:
      int coldThresholdHysteresis = self->_coldThresholdHysteresis;
      if ((int)v3 <= coldThresholdHysteresis + self->_coldThresholdHeavy) {
        goto LABEL_45;
      }
      int coldThresholdModerate = self->_coldThresholdModerate;
LABEL_41:
      int v22 = coldThresholdModerate + coldThresholdHysteresis;
LABEL_42:
      if ((int)v3 <= v22) {
        unint64_t v25 = 20;
      }
      else {
        unint64_t v25 = 0;
      }
      goto LABEL_49;
    case 0x14uLL:
      if ((int)v3 <= self->_coldThresholdHeavy) {
        goto LABEL_45;
      }
      int coldThresholdHysteresis = self->_coldThresholdModerate;
      int coldThresholdModerate = self->_coldThresholdHysteresis;
      goto LABEL_41;
    case 0uLL:
      if ((int)v3 > self->_coldThresholdHeavy)
      {
        int v22 = self->_coldThresholdModerate;
        goto LABEL_42;
      }
LABEL_45:
      unint64_t v25 = 30;
      goto LABEL_49;
  }
  v26 = qword_1000AABC0;
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_100059CCC(coldPressureState, v26);
  }
  unint64_t v25 = 0;
LABEL_49:
  lowTempClampPeakPowerPressure = self->_lowTempClampPeakPowerPressure;
  if (lowTempClampPeakPowerPressure
    && (unsigned int v28 = [(TableDrivenLowTempController *)lowTempClampPeakPowerPressure outputForBatteryTemperature:v3 stateOfCharge:v4 batteryRaValue:v13]) != 0)
  {
    unsigned int v29 = v28;
    if (sub_1000392B8(self->_chargerService)) {
      unsigned int v30 = 0;
    }
    else {
      unsigned int v30 = v29;
    }
  }
  else
  {
    unsigned int v30 = 0;
  }
  if (self->_peakPowerPressureLevel != v30)
  {
    uint64_t v31 = v30;
    self->_peakPowerPressureLevel = v30;
    if (byte_1000A2510)
    {
      [+[TGraphSampler sharedInstance] updateAppleCareState:4 value:v30];
      if (notify_set_state(self->_peakPowerPressureNotificationToken, v31))
      {
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
          sub_100059C98();
        }
      }
      else if (notify_post("com.apple.system.peakpowerpressurelevel") {
             && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
      }
      {
        sub_100059C64();
      }
    }
  }
  if (v25 != self->_coldPressureState)
  {
    self->_unint64_t coldPressureState = v25;
    if (byte_1000A2510)
    {
      [+[TGraphSampler sharedInstance] updateAppleCareState:2 value:v25];
      if (notify_set_state(self->_coldPressureNotificationToken, v25))
      {
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
          sub_100059C98();
        }
      }
      else if (notify_post("com.apple.system.thermalpressurelevel.cold") {
             && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
      }
      {
        sub_100059C64();
      }
    }
  }
  lowTempClampStrobe = self->_lowTempClampStrobe;
  if (lowTempClampStrobe)
  {
    int v33 = [(TableDrivenLowTempController *)lowTempClampStrobe outputForBatteryTemperature:v3 stateOfCharge:self->_lowTempSyntheticSOC batteryRaValue:v13];
    if (v33 != self->_lowTempMaxStrobe)
    {
      if (byte_1000A2510)
      {
        int v34 = v33;
        self->_lowTempMaxStrobe = v33;
        if (byte_1000AA7A0)
        {
          v35 = qword_1000AABC0;
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)cf = 67109120;
            *(_DWORD *)&cf[4] = v34;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "<Notice> Clamp: max strobe now %d", cf, 8u);
          }
        }
        CFNumberRef v36 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &self->_lowTempMaxStrobe);
        if (v36)
        {
          CFNumberRef v37 = v36;
          if (IORegistryEntrySetCFProperty(self->_strobeService, @"CameraStrobeMaxLoad", v36)
            && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
          {
            sub_100059C30();
          }
          CFRelease(v37);
        }
      }
    }
  }
  lowTempClampPPMBaseline = self->_lowTempClampPPMBaseline;
  if (lowTempClampPPMBaseline)
  {
    int v39 = [(TableDrivenLowTempController *)lowTempClampPPMBaseline outputForBatteryTemperature:v3 stateOfCharge:self->_lowTempSyntheticSOC batteryRaValue:v13];
    if (v39 != self->_lowTempPPMBaseline)
    {
      if (byte_1000A2510)
      {
        int v40 = v39;
        self->_lowTempPPMBaseline = v39;
        if (byte_1000AA7A0)
        {
          v41 = qword_1000AABC0;
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)cf = 67109120;
            *(_DWORD *)&cf[4] = v40;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "<Notice> Clamp: PPM baseline now %d", cf, 8u);
          }
        }
        *(void *)cf = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &self->_lowTempPPMBaseline);
        if (*(void *)cf)
        {
          CFArrayRef v42 = CFArrayCreate(kCFAllocatorDefault, (const void **)cf, 1, &kCFTypeArrayCallBacks);
          if (v42)
          {
            CFArrayRef v43 = v42;
            uint64_t v44 = IORegistryEntrySetCFProperty(self->_ppmService, @"BaselineSystemCapability", v42);
            if (v44)
            {
              uint64_t v45 = v44;
              v46 = qword_1000AABC0;
              if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
                sub_100059BC4(v45, v46, v47, v48, v49, v50, v51, v52);
              }
            }
            CFRelease(v43);
          }
          CFRelease(*(CFTypeRef *)cf);
        }
      }
    }
  }
}

- (ContextualClampController)init
{
  return [(ContextualClampController *)self initWithParams:0 backlightController:0 product:0];
}

- (ContextualClampController)initWithParams:(id)a3 backlightController:(id)a4 product:(id)a5
{
  v65.receiver = self;
  v65.super_class = (Class)ContextualClampController;
  v8 = [(ContextualClampController *)&v65 init];
  v9 = v8;
  if (!v8) {
    return v9;
  }
  v8->_product = (CommonProduct *)a5;
  v8->_backlightController = (BackLightCC *)a4;
  dispatch_queue_t v10 = dispatch_queue_create("com.apple.ThermalMonitor.context.clamp", 0);
  v9->_odeonFloorCPUPower = 0;
  v9->_clampQueue = (OS_dispatch_queue *)v10;
  v9->_frontCameraPowered = 0;
  v9->_odeonEnabled = 0;
  v9->_oasisEnabled = 0;
  v9->_oasisFloorCPUPower = 0;
  unsigned int v11 = [(id)qword_1000AB158 requestListID];
  v9->_cameraFloorCPU = 0;
  v9->_mitigationControllerListID = v11;
  v9->_cameraFloorPackagePower = 0;
  v9->_cameraFloorGPU = 0;
  v9->_usesPackagePowerControl = 0;
  v9->_unint64_t coldPressureState = 0;
  v9->_peakPowerPressureLevel = 0;
  *(void *)&v9->_lowTempPerfCapCPU = 0x6400000064;
  v9->_lowTempPerfCapBL = 100;
  v9->_lowTempPPMBaseline = 100;
  *(void *)&v9->_int syntheticSOCType = 0;
  v9->_ppmService = 0;
  v9->_cameraFloorDetails = 0;
  v9->_hasCameraFloorDetails = 0;
  *(void *)((char *)&v9->_lowTempSyntheticSOC + 1) = 0;
  if (!a3)
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100059818();
    }
    BOOL v13 = 0;
    goto LABEL_82;
  }
  sub_100008280((CFDictionaryRef)a3, @"cameraFloorCPU", kCFNumberIntType, &v9->_cameraFloorCPU);
  sub_100008280((CFDictionaryRef)a3, @"cameraFloorGPU", kCFNumberIntType, &v9->_cameraFloorGPU);
  sub_100008280((CFDictionaryRef)a3, @"cameraFloorPackagePower", kCFNumberIntType, &v9->_cameraFloorPackagePower);
  if (v9->_cameraFloorPackagePower >= 1) {
    v9->_usesPackagePowerControl = 1;
  }
  sub_100008280((CFDictionaryRef)a3, @"odFloorCPU", kCFNumberIntType, &v9->_odeonFloorCPUPower);
  sub_100008280((CFDictionaryRef)a3, @"oasisFloorCPU", kCFNumberIntType, &v9->_oasisFloorCPUPower);
  if (sub_100037D8C((const __CFDictionary *)a3, @"usesCameraFloorPackageDetails", 0))
  {
    uint64_t v12 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "<Notice> Clamp: using detailed budgets for package power camera floor", buf, 2u);
    }
    v9->_cameraFloorDetails = 0x63616D666C6F6F72;
    v9->_hasCameraFloorDetails = 1;
  }
  BOOL v13 = sub_100037D8C((const __CFDictionary *)a3, @"usesFrontCameraFloors", 0);
  v9->_BOOL isAgeAware = [a3 objectForKey:@"isAgeAware"] != 0;
  id v14 = [a3 valueForKey:@"useWeightedRa"];
  v9->_deviceUsesWeightedRa = v14 != 0;
  int v15 = qword_1000AABC0;
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isAgeAware = v9->_isAgeAware;
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v67 = isAgeAware;
    *(_WORD *)&v67[4] = 1024;
    *(_DWORD *)&v67[6] = v14 != 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "<Notice> Clamp: isAgeAware %d useWeightedRa %d\n", buf, 0xEu);
  }
  v9->_backlightCapIsSoft = v9->_isAgeAware;
  id v17 = [a3 objectForKey:@"lowParamsBL"];
  if (v17) {
    v9->_lowTempClampBL = [[TableDrivenLowTempController alloc] initWithParams:v17];
  }
  id v18 = [a3 objectForKey:@"batteryParams"];
  LODWORD(out_token) = 0;
  int token = 0;
  if (!v18)
  {
    if (byte_1000AA7A0)
    {
      v21 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "<Notice> No Battery parameters set for platform", buf, 2u);
      }
    }
    goto LABEL_32;
  }
  if (byte_1000AA7A0)
  {
    v19 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)v67 = "-[ContextualClampController initWithParams:backlightController:product:]";
      *(_WORD *)&v67[8] = 2112;
      id v68 = v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "<Notice> %s Aging Controller params: %@", buf, 0x16u);
    }
  }
  if ([v18 objectForKey:@"usesAgingController"]
    && objc_msgSend(objc_msgSend(v18, "objectForKeyedSubscript:", @"usesAgingController"), "BOOLValue")&& (sub_1000392A0() & 1) == 0)
  {
    int v22 = [AgingController alloc];
    uint64_t v23 = sub_100038BA4();
    v9->_agingController = [(AgingController *)v22 initWithParams:v18 currentWRa:v23 currentUPOCount:sub_1000390D8()];
  }
  else
  {
    int v20 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "<Notice> Aging controller disabled for platform", buf, 2u);
    }
  }
  id v24 = [v18 objectForKey:@"wRaP0LimitsPerChemId"];
  if (!v24)
  {
LABEL_32:
    uint64_t v28 = 500;
    goto LABEL_38;
  }
  uint64_t v25 = sub_100038B60();
  id v26 = [v24 objectForKey:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v25), "stringValue"]];
  if (v26)
  {
    signed int v27 = [v26 intValue];
  }
  else
  {
    id v29 = [v24 objectForKeyedSubscript:@"-1"];
    unsigned int v30 = qword_1000AABC0;
    BOOL v31 = os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR);
    if (!v29)
    {
      if (v31) {
        sub_100059AEC(v25, v30, v32, v33, v34, v35, v36, v37);
      }
      uint64_t v28 = -1;
      goto LABEL_38;
    }
    if (v31) {
      sub_100059B58(v25, v30, v32, v33, v34, v35, v36, v37);
    }
    signed int v27 = [v29 intValue];
  }
  uint64_t v28 = v27;
LABEL_38:
  if (notify_register_check("com.apple.system.batteryHealth.p0Threshold", (int *)&out_token))
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100059A78();
    }
  }
  else
  {
    if (notify_set_state((int)out_token, v28))
    {
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_100059A04();
      }
    }
    else
    {
      notify_post("com.apple.system.batteryHealth.p0Threshold");
    }
    if (byte_1000AA7A0)
    {
      v38 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)v67 = v28;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "<Notice> p0Threshold set to %llu\n", buf, 0xCu);
      }
    }
  }
  if (notify_register_check("com.apple.system.batteryHealth.UPOAware", &token))
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100059990();
    }
  }
  else
  {
    if (notify_set_state(token, 0x4E4FuLL))
    {
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_10005991C();
      }
    }
    else
    {
      notify_post("com.apple.system.batteryHealth.UPOAware");
    }
    if (byte_1000AA7A0)
    {
      int v39 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "<Notice> Battery Health is influenced by UPO mitigation count", buf, 2u);
      }
    }
  }
  sub_100008280((CFDictionaryRef)a3, @"syntheticSOCType", kCFNumberIntType, &v9->_syntheticSOCType);
  if (byte_1000AA7A0)
  {
    int v40 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      int syntheticSOCType = v9->_syntheticSOCType;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v67 = syntheticSOCType;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "<Notice> Clamp: syntheticSOCType %d", buf, 8u);
    }
  }
  id v42 = [a3 objectForKey:@"lowParamsStrobe"];
  if (v42)
  {
    CFArrayRef v43 = [[TableDrivenLowTempController alloc] initWithParams:v42];
    v9->_lowTempClampStrobe = v43;
    if (v43)
    {
      CFDictionaryRef v44 = IOServiceMatching("AppleDieTempController");
      io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v44);
      v9->_strobeService = MatchingService;
      if (!MatchingService)
      {
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
          sub_1000598E8();
        }

        v9->_lowTempClampStrobe = 0;
      }
    }
  }
  id v46 = [a3 objectForKey:@"lowParamsPPMBaseline"];
  if (v46)
  {
    uint64_t v47 = [[TableDrivenLowTempController alloc] initWithParams:v46];
    v9->_lowTempClampPPMBaseline = v47;
    if (v47)
    {
      CFDictionaryRef v48 = IOServiceMatching("ApplePPM");
      io_service_t v49 = IOServiceGetMatchingService(kIOMainPortDefault, v48);
      v9->_ppmService = v49;
      if (!v49)
      {
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
          sub_1000598B4();
        }

        v9->_lowTempClampPPMBaseline = 0;
      }
    }
  }
  unsigned int v50 = sub_100037CD4("IOPMPowerSource", @"BatteryInstalled", kCFBooleanTrue);
  v9->_chargerService = v50;
  if (!v50 && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_100059880();
  }
  CFDictionaryRef v51 = (const __CFDictionary *)[a3 objectForKey:@"lowNotificationLimits"];
  CFDictionaryRef v52 = v51;
  if (v51)
  {
    sub_100008280(v51, @"tempLimit1", kCFNumberIntType, &v9->_coldThresholdModerate);
    sub_100008280(v52, @"tempLimit2", kCFNumberIntType, &v9->_coldThresholdHeavy);
    sub_100008280(v52, @"tempLimitHysteresis", kCFNumberIntType, &v9->_coldThresholdHysteresis);
  }
  else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
  {
    sub_10005984C();
  }
  id v53 = [a3 objectForKey:@"lowParamsPeakPower"];
  if (v53) {
    v9->_lowTempClampPeakPowerPressure = [[TableDrivenLowTempController alloc] initWithParams:v53];
  }
LABEL_82:
  objc_initWeak((id *)buf, v9);
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_10003E314;
  v62[3] = &unk_1000850E8;
  objc_copyWeak(&v63, (id *)buf);
  sub_1000395F0("com.apple.isp.backcamerapower", &v9->_rearCameraPowerStateToken, v9->_clampQueue, v62);
  sub_1000395F0("com.apple.isp.backtelecamerapower", &v9->_rearTeleCameraPowerStateToken, v9->_clampQueue, v62);
  sub_1000395F0("com.apple.isp.backsuperwidecamerapower", &v9->_rearSuperWideCameraPowerStateToken, v9->_clampQueue, v62);
  if (v13)
  {
    objc_initWeak(&out_token, v9);
    clampQueue = v9->_clampQueue;
    __int16 v56 = _NSConcreteStackBlock;
    uint64_t v57 = 3221225472;
    v58 = sub_10003E368;
    v59 = &unk_1000850E8;
    objc_copyWeak(&v60, &out_token);
    sub_1000395F0("com.apple.isp.frontcamerapower", &v9->_frontCameraPowerStateToken, clampQueue, &v56);
    objc_destroyWeak(&v60);
    objc_destroyWeak(&out_token);
  }
  if (notify_register_check("com.apple.system.thermalpressurelevel.cold", &v9->_coldPressureNotificationToken)
    && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
  {
    sub_1000597E4();
  }
  if (notify_register_check("com.apple.system.peakpowerpressurelevel", &v9->_peakPowerPressureNotificationToken)
    && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
  {
    sub_1000597B0();
  }
  [+[TGraphSampler sharedInstance] addtGraphDataSource:v9];
  objc_destroyWeak(&v63);
  objc_destroyWeak((id *)buf);
  return v9;
}

- (void)updateMaxLIFloorsAndCeilings
{
  if (byte_1000A2510)
  {
    if (self->_rearCameraPowered || self->_frontCameraPowered)
    {
      uint64_t cameraFloorCPU = self->_cameraFloorCPU;
      uint64_t cameraFloorGPU = self->_cameraFloorGPU;
      uint64_t v5 = 1;
    }
    else
    {
      uint64_t cameraFloorCPU = 0;
      uint64_t v5 = 0;
      uint64_t cameraFloorGPU = 0;
    }
    if (self->_usesPackagePowerControl)
    {
      [(ContextualClampController *)self updatePackageFloorsAndCeilings:v5];
    }
    else
    {
      if (byte_1000AA7A0)
      {
        int v6 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
        {
          int v7 = self->_cameraFloorCPU;
          int v17 = 136315394;
          *(void *)id v18 = "-[ContextualClampController updateMaxLIFloorsAndCeilings]";
          *(_WORD *)&v18[8] = 1024;
          *(_DWORD *)v19 = v7;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<Notice> Clamp: [%s] Setting CPU kDVD1 to floor value%d\n", (uint8_t *)&v17, 0x12u);
        }
      }
      [(id)qword_1000AB158 setCPUPowerFloor:cameraFloorCPU fromDecisionSource:self->_mitigationControllerListID];
      [(id)qword_1000AB158 setCPUPowerCeiling:self->_lowTempPerfCapCPU forDVD1Contributor:2];
      [(id)qword_1000AB158 setCPUPowerCeiling:self->_lowTempPerfCapCPU fromDecisionSource:self->_mitigationControllerListID];
      [(id)qword_1000AB158 updateCPU];
      [(id)qword_1000AB158 setGPUPowerFloor:cameraFloorGPU fromDecisionSource:self->_mitigationControllerListID];
      [(id)qword_1000AB158 setGPUPowerCeiling:self->_lowTempPerfCapGPU fromDecisionSource:self->_mitigationControllerListID];
      [(id)qword_1000AB158 updateGPU];
    }
    backlightController = self->_backlightController;
    uint64_t lowTempPerfCapBL = self->_lowTempPerfCapBL;
    if (self->_backlightCapIsSoft) {
      [(BackLightCC *)backlightController setMaxLICeilingSoft:lowTempPerfCapBL];
    }
    else {
      [(BackLightCC *)backlightController setMaxLICeiling:lowTempPerfCapBL];
    }
    if (byte_1000AA7A0)
    {
      dispatch_queue_t v10 = qword_1000AABC0;
      if (!os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      int lowTempPerfCapCPU = self->_lowTempPerfCapCPU;
      int lowTempPerfCapGPU = self->_lowTempPerfCapGPU;
      int v13 = self->_lowTempPerfCapBL;
      BOOL v14 = self->_rearCameraPowered || self->_frontCameraPowered;
      int v17 = 67110400;
      *(_DWORD *)id v18 = cameraFloorCPU;
      *(_WORD *)&v18[4] = 1024;
      *(_DWORD *)&v18[6] = lowTempPerfCapCPU;
      *(_WORD *)v19 = 1024;
      *(_DWORD *)&v19[2] = cameraFloorGPU;
      __int16 v20 = 1024;
      int v21 = lowTempPerfCapGPU;
      __int16 v22 = 1024;
      int v23 = v13;
      __int16 v24 = 1024;
      BOOL v25 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> Clamp: CPU [%d, %d], GPU [%d, %d], BL [%d] (camera %d)", (uint8_t *)&v17, 0x26u);
      if (byte_1000AA7A0)
      {
        dispatch_queue_t v10 = qword_1000AABC0;
LABEL_22:
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          BOOL odeonEnabled = self->_odeonEnabled;
          BOOL oasisEnabled = self->_oasisEnabled;
          int v17 = 67109376;
          *(_DWORD *)id v18 = odeonEnabled;
          *(_WORD *)&v18[4] = 1024;
          *(_DWORD *)&v18[6] = oasisEnabled;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> Clamp: Odeon %d Oasis %d", (uint8_t *)&v17, 0xEu);
        }
      }
    }
  }
}

- (void)updatePackageFloorsAndCeilings:(BOOL)a3
{
  if (a3) {
    uint64_t cameraFloorPackagePower = self->_cameraFloorPackagePower;
  }
  else {
    uint64_t cameraFloorPackagePower = 0;
  }
  if (self->_hasCameraFloorDetails)
  {
    [(id)qword_1000AB158 setPackagePowerBudgetDirect:cameraFloorPackagePower withDetails:self->_cameraFloorDetails];
  }
  else
  {
    [(id)qword_1000AB158 setPackagePowerFloor:cameraFloorPackagePower fromDecisionSource:self->_mitigationControllerListID];
    [(id)qword_1000AB158 updatePackage];
  }
  if (byte_1000AA7A0)
  {
    uint64_t v4 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = cameraFloorPackagePower;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> Clamp: PackagePowerFloor [%d]", (uint8_t *)v5, 8u);
    }
  }
}

- (void)handleRearCameraPowerStateNotification:(unint64_t)a3
{
  if (byte_1000AA7A0)
  {
    uint64_t v5 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      unint64_t v8 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> Clamp: rear camera state %lld", (uint8_t *)&v7, 0xCu);
    }
  }
  BOOL v6 = a3 != 0;
  if (self->_rearCameraPowered != v6)
  {
    self->_uint64_t rearCameraPowered = v6;
    [(ContextualClampController *)self updateMaxLIFloorsAndCeilings];
  }
}

- (void)handleFrontCameraPowerStateNotification:(unint64_t)a3
{
  if (byte_1000AA7A0)
  {
    uint64_t v5 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      unint64_t v8 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> Clamp: front camera state %lld", (uint8_t *)&v7, 0xCu);
    }
  }
  BOOL v6 = a3 != 0;
  if (self->_frontCameraPowered != v6)
  {
    self->_frontCameraPowered = v6;
    [(ContextualClampController *)self updateMaxLIFloorsAndCeilings];
  }
}

- (void)handleOdeonStateNotification:(unint64_t)a3
{
  if (byte_1000AA7A0)
  {
    uint64_t v5 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      unint64_t v8 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> Clamp: Odeon state %lld", (uint8_t *)&v7, 0xCu);
    }
  }
  BOOL v6 = a3 != 0;
  if (self->_odeonEnabled != v6)
  {
    self->_BOOL odeonEnabled = v6;
    [(ContextualClampController *)self updateMaxLIFloorsAndCeilings];
  }
}

- (void)handleOasisStateNotification:(unint64_t)a3
{
  if (byte_1000AA7A0)
  {
    uint64_t v5 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      unint64_t v8 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> Clamp: Oasis state %lld", (uint8_t *)&v7, 0xCu);
    }
  }
  BOOL v6 = a3 != 0;
  if (self->_oasisEnabled != v6)
  {
    self->_BOOL oasisEnabled = v6;
    [(ContextualClampController *)self updateMaxLIFloorsAndCeilings];
  }
}

- (BOOL)isRearCameraPowered
{
  return self->_rearCameraPowered;
}

- (BOOL)isFrontCameraPowered
{
  return self->_frontCameraPowered;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  if (a3 > 8) {
    return 0;
  }
  else {
    return off_100086188[a3];
  }
}

- (int)rearCameraPowerStateToken
{
  return self->_rearCameraPowerStateToken;
}

- (void)setRearCameraPowerStateToken:(int)a3
{
  self->_rearCameraPowerStateToken = a3;
}

- (int)rearTeleCameraPowerStateToken
{
  return self->_rearTeleCameraPowerStateToken;
}

- (void)setRearTeleCameraPowerStateToken:(int)a3
{
  self->_rearTeleCameraPowerStateToken = a3;
}

- (int)rearSuperWideCameraPowerStateToken
{
  return self->_rearSuperWideCameraPowerStateToken;
}

- (void)setRearSuperWideCameraPowerStateToken:(int)a3
{
  self->_rearSuperWideCameraPowerStateToken = a3;
}

- (int)frontCameraPowerStateToken
{
  return self->_frontCameraPowerStateToken;
}

- (void)setFrontCameraPowerStateToken:(int)a3
{
  self->_frontCameraPowerStateToken = a3;
}

- (int)odeonStateToken
{
  return self->_odeonStateToken;
}

- (void)setOdeonStateToken:(int)a3
{
  self->_odeonStateToken = a3;
}

- (int)oasisStateToken
{
  return self->_oasisStateToken;
}

- (void)setOasisStateToken:(int)a3
{
  self->_oasisStateToken = a3;
}

- (OS_dispatch_queue)clampQueue
{
  return self->_clampQueue;
}

- (void)setClampQueue:(id)a3
{
  self->_clampQueue = (OS_dispatch_queue *)a3;
}

@end