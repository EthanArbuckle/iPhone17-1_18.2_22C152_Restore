@interface ThermalManager
- (BOOL)getPotentialForcedThermalPressureLevel;
- (BOOL)useTcalAdjust:(unsigned int)a3;
- (ThermalManager)initWithConfig:(__CFDictionary *)a3;
- (__CFRunLoop)localMainRunloop;
- (__CFString)getTGraphData:(int)a3;
- (iir_filter_t)getProductFilterValues;
- (int)canSystemSleep;
- (int)canaryTempSensorIndex;
- (int)canaryTempThreshold;
- (int)desiredLoopInterval;
- (int)getModeratePressureVersion;
- (int)getProductCalibrationDefault;
- (int)getProductCalibrationSensorID;
- (int)getProductTotalPowerSensors;
- (int)getProductTotalSensors;
- (unint64_t)getMaxSensorValue;
- (unsigned)getRequiredCalibrationResistorSamples;
- (void)SaveProductString:(int)a3;
- (void)canaryModeExitEarly:(int)a3;
- (void)checkForArcOverride:(__SCPreferences *)a3 key:(__CFString *)a4;
- (void)checkForLifetimeServoOverride:(__SCPreferences *)a3 key:(__CFString *)a4;
- (void)createConnectionToCT;
- (void)createNewProduct:(__CFRunLoop *)a3;
- (void)dealloc;
- (void)getConfigurationFor:(__CFString *)a3;
- (void)hintComponentControlTakeAction;
- (void)initDataCollection;
- (void)initializeReadPrefs:(__SCPreferences *)a3;
- (void)probeAllSupervisorControlLoadingIndex;
- (void)updatePrefs:(__SCPreferences *)a3 :(BOOL)a4;
- (void)updateSystemLoad:(BOOL)a3;
- (void)updateSystemPowerState:(BOOL)a3;
@end

@implementation ThermalManager

- (BOOL)useTcalAdjust:(unsigned int)a3
{
  return [(CommonProduct *)self->product useTcalAdjust:*(void *)&a3];
}

- (void)updateSystemLoad:(BOOL)a3
{
  BOOL v3 = a3;
  -[CommonProduct updateAllThermalLoad:](self->product, "updateAllThermalLoad:");
  if (byte_1000A2510) {
    [(CommonProduct *)self->product updateDisplayDriver:v3];
  }
  if ([+[HidSensors sharedInstance] isSending2DTempGridToDisplayDriverEnabled])
  {
    BOOL v5 = byte_1000A2510 == 0;
  }
  else
  {
    BOOL v5 = 1;
  }
  if (!v5) {
    [(CommonProduct *)self->product send2DGridTempsToDisplayDriver:[(CommonProduct *)self->product compute2DGridTemps]];
  }
  if ([(CommonProduct *)self->product isSendingMaxTempToDisplayDriverEnabled]
    && byte_1000A2510)
  {
    uint64_t v6 = [(CommonProduct *)self->product computeMaxCGTemp];
    unsigned int v7 = dword_1000A26C0 - v6;
    if (dword_1000A26C0 - (int)v6 < 0) {
      unsigned int v7 = v6 - dword_1000A26C0;
    }
    if (v7 >= 0x33)
    {
      dword_1000A26C0 = v6;
      [(CommonProduct *)self->product sendMaxTempToDisplayDriver:v6];
    }
  }
  if (sub_100005BA0()) {
    [(CommonProduct *)self->product predictSignal];
  }
  [(CommonProduct *)self->product updateAccessories:v3];
  if (dword_1000A26BC == 1)
  {
    [(CommonProduct *)self->product updateLifetimeServo];
    dword_1000A26BC = 0;
  }
  [(CommonProduct *)self->product updateContextualClamp];
  [(CommonProduct *)self->product updatePowerzoneTelemetry];
  int v8 = dword_1000A26B8;
  if (dword_1000A26B8 == 120)
  {
    [(CommonProduct *)self->product updateCoreAnalyticsInfo];
    int v8 = 0;
  }
  dword_1000A26B8 = v8 + 1;
  ++dword_1000A26BC;
}

- (void)probeAllSupervisorControlLoadingIndex
{
}

- (void)hintComponentControlTakeAction
{
}

- (__CFString)getTGraphData:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = +[TGraphSampler sharedInstance];

  return [(TGraphSampler *)v4 getTGraphData:v3];
}

- (int)desiredLoopInterval
{
  return [(CommonProduct *)self->product desiredLoopInterval];
}

- (ThermalManager)initWithConfig:(__CFDictionary *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ThermalManager;
  result = [(ThermalManager *)&v5 init];
  if (result)
  {
    result->product = 0;
    result->_plistConfig = a3;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ThermalManager;
  [(ThermalManager *)&v3 dealloc];
}

- (void)createConnectionToCT
{
}

- (void)createNewProduct:(__CFRunLoop *)a3
{
  self->localMainRunloop = a3;
  int productName = self->productName;
  if (productName > 14733199)
  {
    if (productName > 17147599)
    {
      if (productName <= 18122319)
      {
        if (productName > 17486399)
        {
          if (productName <= 17803199)
          {
            if (productName <= 17795279)
            {
              if (productName == 17486400)
              {
                v4 = off_100084DC8;
              }
              else
              {
                if (productName != 17790800) {
                  return;
                }
                v4 = off_100084CE8;
              }
              goto LABEL_273;
            }
            if (productName != 17795280)
            {
              if (productName != 17798800) {
                return;
              }
              v4 = off_100084BC0;
              goto LABEL_273;
            }
            goto LABEL_226;
          }
          if (productName > 17811999)
          {
            if (productName == 17812000)
            {
              v4 = off_100084C68;
            }
            else
            {
              if (productName != 17938000) {
                return;
              }
              v4 = off_100084C98;
            }
            goto LABEL_273;
          }
          if (productName != 17803200)
          {
            if (productName != 17804240) {
              return;
            }
            v4 = off_100084C40;
            goto LABEL_273;
          }
LABEL_210:
          v4 = off_100084D98;
          goto LABEL_273;
        }
        if (productName <= 17459279)
        {
          switch(productName)
          {
            case 17147600:
              v4 = &off_100084E10;
              break;
            case 17152000:
              v4 = off_100084D20;
              break;
            case 17331600:
              v4 = off_100084B60;
              break;
            default:
              return;
          }
          goto LABEL_273;
        }
        if (productName <= 17473199)
        {
          if (productName == 17459280)
          {
            v4 = off_100084D78;
          }
          else
          {
            if (productName != 17463760) {
              return;
            }
            v4 = off_100084BA0;
          }
          goto LABEL_273;
        }
        if (productName == 17473200)
        {
          v4 = off_100084C28;
          goto LABEL_273;
        }
        int v11 = 17477600;
LABEL_181:
        if (productName != v11) {
          return;
        }
        v4 = off_100084C00;
        goto LABEL_273;
      }
      if (productName > 30122399)
      {
        if (productName <= 32305999)
        {
          if (productName <= 32144719)
          {
            if (productName != 30122400)
            {
              int v5 = 32135760;
              goto LABEL_205;
            }
            goto LABEL_199;
          }
          if (productName != 32144720)
          {
            if (productName != 32298160) {
              return;
            }
            v4 = off_100084DB8;
            goto LABEL_273;
          }
          goto LABEL_171;
        }
        if (productName <= 32762959)
        {
          if (productName == 32306000)
          {
            v4 = off_100084C18;
            goto LABEL_273;
          }
          if (productName != 32754000) {
            return;
          }
LABEL_199:
          v4 = off_100084D18;
          goto LABEL_273;
        }
        if (productName != 32762960)
        {
          int v13 = 1803554640;
          goto LABEL_223;
        }
LABEL_230:
        v4 = off_100084DD0;
        goto LABEL_273;
      }
      if (productName > 18135759)
      {
        if (productName <= 18458319)
        {
          if (productName == 18135760)
          {
            v4 = off_100084DF8;
            goto LABEL_273;
          }
          int v6 = 18450400;
          goto LABEL_77;
        }
        if (productName == 18458320)
        {
          v4 = off_100084DA8;
          goto LABEL_273;
        }
        int v8 = 30114160;
LABEL_194:
        if (productName != v8) {
          return;
        }
        v4 = off_100084D00;
        goto LABEL_273;
      }
      if (productName == 18122320)
      {
        v4 = off_100084CA8;
        goto LABEL_273;
      }
      if (productName != 18126800)
      {
        if (productName != 18128800) {
          return;
        }
        v4 = off_100084DA0;
        goto LABEL_273;
      }
LABEL_220:
      v4 = off_100084DC0;
      goto LABEL_273;
    }
    if (productName > 15825999)
    {
      if (productName > 16496399)
      {
        if (productName <= 16821999)
        {
          if (productName > 16796239)
          {
            if (productName == 16796240)
            {
              v4 = off_100084B80;
            }
            else
            {
              if (productName != 16800720) {
                return;
              }
              v4 = off_100084CB0;
            }
          }
          else if (productName == 16496400)
          {
            v4 = off_100084B68;
          }
          else
          {
            if (productName != 16500800) {
              return;
            }
            v4 = off_100084D30;
          }
          goto LABEL_273;
        }
        if (productName <= 17127759)
        {
          if (productName == 16822000)
          {
            v4 = off_100084C38;
            goto LABEL_273;
          }
          int v10 = 16826400;
LABEL_154:
          if (productName != v10) {
            return;
          }
          v4 = off_100084BD8;
          goto LABEL_273;
        }
        if (productName == 17127760)
        {
          v4 = off_100084D10;
          goto LABEL_273;
        }
        if (productName != 17132240) {
          return;
        }
LABEL_217:
        v4 = off_100084B90;
        goto LABEL_273;
      }
      if (productName > 16104399)
      {
        if (productName <= 16189199)
        {
          if (productName != 16104400)
          {
            if (productName != 16155600) {
              return;
            }
            v4 = off_100084D48;
            goto LABEL_273;
          }
          goto LABEL_224;
        }
        if (productName != 16189200)
        {
          if (productName != 16210960) {
            return;
          }
          goto LABEL_188;
        }
        goto LABEL_228;
      }
      if (productName == 15826000)
      {
        v4 = off_100084BE8;
        goto LABEL_273;
      }
      if (productName != 15865520)
      {
        int v7 = 15893200;
        goto LABEL_134;
      }
      goto LABEL_225;
    }
    if (productName <= 15025199)
    {
      if (productName < 14991360)
      {
        switch(productName)
        {
          case 14733200:
            v4 = off_100084DD8;
            break;
          case 14969680:
            v4 = off_100084C58;
            break;
          case 14973520:
            v4 = off_100084C10;
            break;
          default:
            return;
        }
        goto LABEL_273;
      }
      if (productName <= 14995279)
      {
        if (productName == 14991360)
        {
          v4 = off_100084BF8;
          goto LABEL_273;
        }
        int v6 = 14994605;
LABEL_77:
        if (productName != v6) {
          return;
        }
        v4 = off_100084DE0;
        goto LABEL_273;
      }
      if (productName != 14995280)
      {
        if (productName != 15018800) {
          return;
        }
        v4 = off_100084D68;
        goto LABEL_273;
      }
      goto LABEL_227;
    }
    if (productName <= 15308879)
    {
      switch(productName)
      {
        case 15025200:
          v4 = off_100084E08;
          break;
        case 15281440:
          v4 = off_100084DE8;
          break;
        case 15285360:
          v4 = off_100084CD0;
          break;
        default:
          return;
      }
      goto LABEL_273;
    }
    if (productName <= 15541839)
    {
      if (productName == 15308880)
      {
        v4 = off_100084C30;
      }
      else
      {
        if (productName != 15325200) {
          return;
        }
        v4 = off_100084BB8;
      }
      goto LABEL_273;
    }
    if (productName != 15541840)
    {
      if (productName != 15621200) {
        return;
      }
      v4 = off_100084BC8;
      goto LABEL_273;
    }
    goto LABEL_229;
  }
  if (productName > 11969634)
  {
    if (productName <= 14066239)
    {
      if (productName <= 13157379)
      {
        if (productName > 12894389)
        {
          if (productName > 13083864)
          {
            if (productName == 13083865)
            {
LABEL_224:
              v4 = off_100084C78;
              goto LABEL_273;
            }
            int v13 = 13087960;
LABEL_223:
            if (productName != v13) {
              return;
            }
            goto LABEL_224;
          }
          if (productName != 12894390)
          {
            int v7 = 12916880;
LABEL_134:
            if (productName != v7) {
              return;
            }
            v4 = off_100084BD0;
            goto LABEL_273;
          }
LABEL_225:
          v4 = off_100084B50;
          goto LABEL_273;
        }
        if (productName == 11969635)
        {
          v4 = off_100084B78;
          goto LABEL_273;
        }
        if (productName == 12187320)
        {
LABEL_227:
          v4 = off_100084CF0;
          goto LABEL_273;
        }
        if (productName != 12631400) {
          return;
        }
LABEL_229:
        v4 = off_100084B58;
        goto LABEL_273;
      }
      if (productName <= 13795759)
      {
        if (productName != 13157380)
        {
          if (productName != 13175060)
          {
            int v10 = 13675105;
            goto LABEL_154;
          }
LABEL_188:
          v4 = off_100084CE0;
          goto LABEL_273;
        }
LABEL_228:
        v4 = off_100084D90;
        goto LABEL_273;
      }
      if (productName > 13923599)
      {
        if (productName != 13923600)
        {
          int v5 = 14062320;
LABEL_205:
          if (productName != v5) {
            return;
          }
          goto LABEL_206;
        }
        goto LABEL_217;
      }
      if (productName == 13795760)
      {
        v4 = off_100084CF8;
        goto LABEL_273;
      }
      int v9 = 13799680;
LABEL_161:
      if (productName != v9) {
        return;
      }
      v4 = off_100084C70;
      goto LABEL_273;
    }
    if (productName > 14462319)
    {
      if (productName > 14701279)
      {
        if (productName <= 14729199)
        {
          if (productName == 14701280)
          {
            v4 = off_100084D60;
          }
          else
          {
            if (productName != 14724800) {
              return;
            }
            v4 = off_100084C88;
          }
          goto LABEL_273;
        }
        if (productName == 14729200)
        {
          v4 = off_100084CC8;
          goto LABEL_273;
        }
        if (productName != 14731680) {
          return;
        }
        goto LABEL_220;
      }
      if (productName <= 14685519)
      {
        if (productName == 14462320)
        {
LABEL_226:
          v4 = off_100084C90;
          goto LABEL_273;
        }
        if (productName == 14468755) {
          goto LABEL_210;
        }
        return;
      }
      if (productName == 14685520)
      {
        v4 = off_100084CD8;
        goto LABEL_273;
      }
      int v12 = 14689360;
LABEL_213:
      if (productName != v12) {
        return;
      }
      v4 = off_100084CC0;
      goto LABEL_273;
    }
    if (productName > 14401359)
    {
      if (productName > 14434719)
      {
        if (productName == 14434720)
        {
          v4 = off_100084B88;
        }
        else
        {
          if (productName != 14438640) {
            return;
          }
          v4 = off_100084E00;
        }
      }
      else if (productName == 14401360)
      {
        v4 = off_100084D70;
      }
      else
      {
        if (productName != 14415120) {
          return;
        }
        v4 = off_100084D80;
      }
      goto LABEL_273;
    }
    if (productName != 14066240)
    {
      if (productName == 14121040)
      {
        v4 = off_100084BB0;
        goto LABEL_273;
      }
      int v11 = 14204205;
      goto LABEL_181;
    }
LABEL_171:
    v4 = off_100084BF0;
LABEL_273:
    self->product = (CommonProduct *)[objc_alloc(*v4) initProduct:self];
    return;
  }
  if (productName <= 242074)
  {
    if (productName <= 233234)
    {
      if (productName <= 224719)
      {
        switch(productName)
        {
          case 220170:
            v4 = off_100084C60;
            break;
          case 220235:
            v4 = off_100084BA8;
            break;
          case 224655:
            v4 = off_100084C80;
            break;
          default:
            return;
        }
        goto LABEL_273;
      }
      if (productName <= 229139)
      {
        if (productName == 224720)
        {
          v4 = off_100084D58;
        }
        else
        {
          if (productName != 229075) {
            return;
          }
          v4 = off_100084D40;
        }
        goto LABEL_273;
      }
      if (productName == 229140)
      {
        v4 = off_100084C08;
        goto LABEL_273;
      }
      int v5 = 233170;
      goto LABEL_205;
    }
    if (productName > 233624)
    {
      if (productName > 237654)
      {
        if (productName == 237655) {
          goto LABEL_199;
        }
        if (productName != 237720) {
          return;
        }
        goto LABEL_230;
      }
      if (productName == 233625)
      {
        v4 = off_100084BE0;
        goto LABEL_273;
      }
      int v8 = 237590;
      goto LABEL_194;
    }
    if (productName != 233235)
    {
      if (productName == 233495)
      {
        v4 = off_100084CB8;
      }
      else
      {
        if (productName != 233560) {
          return;
        }
        v4 = off_100084DB0;
      }
      goto LABEL_273;
    }
    goto LABEL_171;
  }
  if (productName <= 255334)
  {
    if (productName <= 246559)
    {
      switch(productName)
      {
        case 242075:
          v4 = off_100084D38;
          break;
        case 242140:
          v4 = off_100084C48;
          break;
        case 246495:
          v4 = off_100084D28;
          break;
        default:
          return;
      }
    }
    else if (productName > 250914)
    {
      if (productName == 250915)
      {
        v4 = off_100084B98;
      }
      else
      {
        if (productName != 250980) {
          return;
        }
        v4 = off_100084D08;
      }
    }
    else if (productName == 246560)
    {
      v4 = off_100084C50;
    }
    else
    {
      if (productName != 246885) {
        return;
      }
      v4 = off_100084D50;
    }
    goto LABEL_273;
  }
  if (productName <= 11428769)
  {
    if (productName <= 300054)
    {
      if (productName == 255335)
      {
        v4 = off_100084CA0;
      }
      else
      {
        if (productName != 255400) {
          return;
        }
        v4 = off_100084C20;
      }
      goto LABEL_273;
    }
    if (productName == 300055)
    {
      v4 = off_100084DF0;
      goto LABEL_273;
    }
    int v9 = 11215375;
    goto LABEL_161;
  }
  if (productName > 11730369)
  {
    if (productName == 11730370)
    {
      v4 = off_100084D88;
      goto LABEL_273;
    }
    int v12 = 11938760;
    goto LABEL_213;
  }
  if (productName == 11428770)
  {
LABEL_206:
    v4 = off_100084B70;
    goto LABEL_273;
  }
  if (productName == 11431955) {
    goto LABEL_171;
  }
}

- (void)getConfigurationFor:(__CFString *)a3
{
  return (void *)CFDictionaryGetValue(self->_plistConfig, a3);
}

- (int)getProductCalibrationDefault
{
  return [(CommonProduct *)self->product calibrationResistorTempDefault];
}

- (int)getProductCalibrationSensorID
{
  return [(CommonProduct *)self->product calibrationResistorSensor];
}

- (unsigned)getRequiredCalibrationResistorSamples
{
  return [(CommonProduct *)self->product requiredCalibrationResistorSamples];
}

- (unint64_t)getMaxSensorValue
{
  return [(CommonProduct *)self->product getMaxSensorValue];
}

- (iir_filter_t)getProductFilterValues
{
  return [(CommonProduct *)self->product getFilterValues];
}

- (int)getProductTotalSensors
{
  return [(CommonProduct *)self->product totalSensors];
}

- (int)getProductTotalPowerSensors
{
  return [(CommonProduct *)self->product powerSensors];
}

- (void)initializeReadPrefs:(__SCPreferences *)a3
{
}

- (void)SaveProductString:(int)a3
{
  self->int productName = a3;
}

- (int)getModeratePressureVersion
{
  return [(CommonProduct *)self->product getModeratePressureVersion];
}

- (void)updatePrefs:(__SCPreferences *)a3 :(BOOL)a4
{
  kern_return_t v71;
  int v72;
  kern_return_t v73;
  NSObject *v74;
  NSObject *v75;
  NSObject *v76;
  CFNumberRef v77;
  CFNumberRef v78;
  CFTypeID v79;
  CFNumberRef v80;
  CFNumberRef v81;
  CFTypeID v82;
  CFNumberRef v83;
  CFNumberRef v84;
  CFTypeID v85;
  CFNumberRef v86;
  CFNumberRef v87;
  CFTypeID v88;
  CFNumberRef v89;
  CFNumberRef v90;
  CFTypeID v91;
  CFNumberRef v92;
  CFNumberRef v93;
  CFTypeID v94;
  CFNumberRef v95;
  CFNumberRef v96;
  CFTypeID v97;
  uint64_t v98;
  unsigned int valuePtr;
  uint8_t buf[4];
  void v101[2];

  sub_100031FB0(a3, (uint64_t)self, a4);
  CFBooleanRef Value = (CFBooleanRef)SCPreferencesGetValue(a3, @"overrideSensorLI");
  int v7 = Value == kCFBooleanTrue;
  byte_1000AB0E1 = Value == kCFBooleanTrue;
  if (byte_1000AA7A0)
  {
    CFBooleanRef v8 = Value;
    int v9 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = "dis";
      if (v8 == kCFBooleanTrue) {
        int v10 = "en";
      }
      *(_DWORD *)buf = 136315138;
      v101[0] = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "<Notice> sensor status thermalOverrideLoadingIndex %sabled", buf, 0xCu);
      int v7 = byte_1000AB0E1;
    }
  }
  if (v7)
  {
    CFArrayRef v11 = (const __CFArray *)SCPreferencesGetValue(a3, @"setSensorLI");
    if (v11)
    {
      CFArrayRef v12 = v11;
      CFTypeID v13 = CFGetTypeID(v11);
      if (v13 == CFArrayGetTypeID() && CFArrayGetCount(v12) == 2)
      {
        LODWORD(v98) = 0;
        valuePtr = 0;
        CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v12, 0);
        CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &v98);
        CFNumberRef v15 = (const __CFNumber *)CFArrayGetValueAtIndex(v12, 1);
        CFNumberGetValue(v15, kCFNumberIntType, &valuePtr);
        if (byte_1000AA7A0)
        {
          v16 = qword_1000AABC0;
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            LODWORD(v101[0]) = v98;
            WORD2(v101[0]) = 1024;
            *(_DWORD *)((char *)v101 + 6) = valuePtr;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "<Notice> Updating Component ID: %d with loading index of %d", buf, 0xEu);
          }
        }
        -[CommonProduct updateMaxLIFor::](self->product, "updateMaxLIFor::", v98, valuePtr, v98);
        SCPreferencesRemoveValue(a3, @"setSensorLI");
      }
    }
    byte_1000AB0E1 = 0;
  }
  if (SCPreferencesGetValue(a3, @"removeOverrideSensorLI") == kCFBooleanTrue)
  {
    [(CommonProduct *)self->product clearLoadingIndexOverrides];
    SCPreferencesRemoveValue(a3, @"removeOverrideSensorLI");
    SCPreferencesRemoveValue(a3, @"overrideSensorLI");
    SCPreferencesCommitChanges(a3);
  }
  CFNumberRef v17 = (const __CFNumber *)SCPreferencesGetValue(a3, @"currentComponent");
  if (v17)
  {
    *(_DWORD *)buf = 0;
    CFNumberGetValue(v17, kCFNumberIntType, buf);
    SCPreferencesRemoveValue(a3, @"currentComponent");
    LODWORD(v98) = 0;
    LODWORD(v98) = -[CommonProduct getCurrentMaxLIForComponent:](self->product, "getCurrentMaxLIForComponent:", *(unsigned int *)buf, v98);
    CFNumberRef v18 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v98);
    SCPreferencesSetValue(a3, @"getCurrentLI", v18);
    SCPreferencesCommitChanges(a3);
    CFRelease(v18);
  }
  CFBooleanRef v19 = (CFBooleanRef)SCPreferencesGetValue(a3, @"overrideControlEffort");
  int v20 = v19 == kCFBooleanTrue;
  byte_1000AB0E2 = v19 == kCFBooleanTrue;
  if (byte_1000AA7A0)
  {
    CFBooleanRef v21 = v19;
    v22 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      v23 = "dis";
      if (v21 == kCFBooleanTrue) {
        v23 = "en";
      }
      *(_DWORD *)buf = 136315138;
      v101[0] = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "<Notice> sensor status thermalOverrideControlEffort %sabled", buf, 0xCu);
      int v20 = byte_1000AB0E2;
    }
  }
  if (v20)
  {
    CFArrayRef v24 = (const __CFArray *)SCPreferencesGetValue(a3, @"setSensorControlEffort");
    if (v24)
    {
      CFArrayRef v25 = v24;
      CFTypeID v26 = CFGetTypeID(v24);
      if (v26 == CFArrayGetTypeID() && CFArrayGetCount(v25) == 2)
      {
        LODWORD(v98) = 0;
        valuePtr = 0;
        CFNumberRef v27 = (const __CFNumber *)CFArrayGetValueAtIndex(v25, 0);
        CFNumberGetValue(v27, kCFNumberIntType, &v98);
        CFNumberRef v28 = (const __CFNumber *)CFArrayGetValueAtIndex(v25, 1);
        CFNumberGetValue(v28, kCFNumberIntType, &valuePtr);
        if (byte_1000AA7A0)
        {
          v29 = qword_1000AABC0;
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            LODWORD(v101[0]) = v98;
            WORD2(v101[0]) = 1024;
            *(_DWORD *)((char *)v101 + 6) = valuePtr;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "<Notice> Updating Component ID: %d with control effort of %d", buf, 0xEu);
          }
        }
        [(CommonProduct *)self->product updateControlEffortFor:v98 :valuePtr];
      }
    }
  }
  else
  {
    [(CommonProduct *)self->product clearControlEffortOverrides];
  }
  CFArrayRef v30 = (const __CFArray *)SCPreferencesGetValue(a3, @"hotSpotPIDTargetKey");
  if (v30)
  {
    CFArrayRef v31 = v30;
    CFTypeID v32 = CFGetTypeID(v30);
    if (v32 == CFArrayGetTypeID() && CFArrayGetCount(v31) == 2)
    {
      LODWORD(v98) = 0;
      valuePtr = 0;
      CFNumberRef v33 = (const __CFNumber *)CFArrayGetValueAtIndex(v31, 0);
      CFNumberGetValue(v33, kCFNumberIntType, &v98);
      CFNumberRef v34 = (const __CFNumber *)CFArrayGetValueAtIndex(v31, 1);
      CFNumberGetValue(v34, kCFNumberIntType, &valuePtr);
      if (byte_1000AA7A0)
      {
        v35 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          LODWORD(v101[0]) = v98;
          WORD2(v101[0]) = 1024;
          *(_DWORD *)((char *)v101 + 6) = valuePtr;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "<Notice> Updating Hotspot PID Target ID: %d with Target of %d", buf, 0xEu);
        }
      }
      [(CommonProduct *)self->product updateHotSpotPIDTargetFor:v98 :valuePtr];
      if (SCPreferencesGetValue(a3, @"hotSpotPIDTargetKeyPersistentlyEnabled") != kCFBooleanTrue)
      {
        SCPreferencesRemoveValue(a3, @"hotSpotPIDTargetKey");
        SCPreferencesCommitChanges(a3);
      }
    }
  }
  if (SCPreferencesGetValue(a3, @"removeHotspotTargetOverrides") == kCFBooleanTrue)
  {
    [(CommonProduct *)self->product removeHotspotTargetOverrides];
    SCPreferencesRemoveValue(a3, @"removeHotspotTargetOverrides");
    SCPreferencesCommitChanges(a3);
  }
  CFArrayRef v36 = (const __CFArray *)SCPreferencesGetValue(a3, @"trapTarget");
  if (v36)
  {
    CFArrayRef v37 = v36;
    CFTypeID v38 = CFGetTypeID(v36);
    if (v38 == CFArrayGetTypeID() && CFArrayGetCount(v37) == 2)
    {
      LODWORD(v98) = 0;
      valuePtr = 0;
      CFNumberRef v39 = (const __CFNumber *)CFArrayGetValueAtIndex(v37, 0);
      CFNumberGetValue(v39, kCFNumberIntType, &v98);
      CFNumberRef v40 = (const __CFNumber *)CFArrayGetValueAtIndex(v37, 1);
      CFNumberGetValue(v40, kCFNumberIntType, &valuePtr);
      if (byte_1000AA7A0)
      {
        v41 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          LODWORD(v101[0]) = v98;
          WORD2(v101[0]) = 1024;
          *(_DWORD *)((char *)v101 + 6) = valuePtr;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "<Notice> Updating Trap Hotspot ID: %d with Target of %d", buf, 0xEu);
        }
      }
      [(CommonProduct *)self->product updateTrapTargetFor:v98 :valuePtr];
      if (SCPreferencesGetValue(a3, @"trapTargetPersistentlyEnabled") != kCFBooleanTrue)
      {
        SCPreferencesRemoveValue(a3, @"trapTarget");
        SCPreferencesCommitChanges(a3);
      }
    }
  }
  CFArrayRef v42 = (const __CFArray *)SCPreferencesGetValue(a3, @"sleepTarget");
  if (v42)
  {
    CFArrayRef v43 = v42;
    CFTypeID v44 = CFGetTypeID(v42);
    if (v44 == CFArrayGetTypeID() && CFArrayGetCount(v43) == 2)
    {
      LODWORD(v98) = 0;
      valuePtr = 0;
      CFNumberRef v45 = (const __CFNumber *)CFArrayGetValueAtIndex(v43, 0);
      CFNumberGetValue(v45, kCFNumberIntType, &v98);
      CFNumberRef v46 = (const __CFNumber *)CFArrayGetValueAtIndex(v43, 1);
      CFNumberGetValue(v46, kCFNumberIntType, &valuePtr);
      if (byte_1000AA7A0)
      {
        v47 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          LODWORD(v101[0]) = v98;
          WORD2(v101[0]) = 1024;
          *(_DWORD *)((char *)v101 + 6) = valuePtr;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "<Notice> Updating Sleep Hotspot ID: %d with Target of %d", buf, 0xEu);
        }
      }
      [(CommonProduct *)self->product updateSleepTargetFor:v98 :valuePtr];
      if (SCPreferencesGetValue(a3, @"sleepTargetPersistentlyEnabled") != kCFBooleanTrue)
      {
        SCPreferencesRemoveValue(a3, @"sleepTarget");
        SCPreferencesCommitChanges(a3);
      }
    }
  }
  [(ThermalManager *)self checkForLifetimeServoOverride:a3 key:@"LifetimeServoStateSaveIntervalMinutes"];
  [(ThermalManager *)self checkForLifetimeServoOverride:a3 key:@"LifetimeServoDieTempMaxMax"];
  [(ThermalManager *)self checkForLifetimeServoOverride:a3 key:@"LifetimeServoDieTempMaxAverage"];
  [(ThermalManager *)self checkForLifetimeServoOverride:a3 key:@"LifetimeServoIntegratorState_E"];
  [(ThermalManager *)self checkForLifetimeServoOverride:a3 key:@"LifetimeServoInstantaneousAF_E"];
  [(ThermalManager *)self checkForLifetimeServoOverride:a3 key:@"LifetimeServoIntegratorState_P"];
  [(ThermalManager *)self checkForLifetimeServoOverride:a3 key:@"LifetimeServoInstantaneousAF_P"];
  [(ThermalManager *)self checkForLifetimeServoOverride:a3 key:@"LifetimeServoIntegratorState_G"];
  [(ThermalManager *)self checkForLifetimeServoOverride:a3 key:@"LifetimeServoInstantaneousAF_G"];
  [(ThermalManager *)self checkForLifetimeServoOverride:a3 key:@"LifetimeServoDieTempTarget"];
  CFNumberRef v48 = (const __CFNumber *)SCPreferencesGetValue(a3, @"kBatteryPercentRemainingKey");
  if (v48)
  {
    CFNumberRef v49 = v48;
    CFTypeID v50 = CFGetTypeID(v48);
    if (v50 == CFNumberGetTypeID())
    {
      LODWORD(v98) = 0;
      CFNumberGetValue(v49, kCFNumberIntType, &v98);
      sub_1000384A4(v98);
      if (byte_1000AA7A0)
      {
        v51 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v101[0]) = v98;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "<Notice> Battery percent overriden to %d%%", buf, 8u);
        }
      }
    }
    if (SCPreferencesGetValue(a3, @"kBatteryPercentRemainingKeyPersistentlyEnabled") != kCFBooleanTrue)
    {
      SCPreferencesRemoveValue(a3, @"kBatteryPercentRemainingKey");
      if (!SCPreferencesCommitChanges(a3) && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_100054C90();
      }
    }
  }
  CFNumberRef v52 = (const __CFNumber *)SCPreferencesGetValue(a3, @"kBatteryRawGasGaugeSOCKey");
  if (v52)
  {
    CFNumberRef v53 = v52;
    CFTypeID v54 = CFGetTypeID(v52);
    if (v54 == CFNumberGetTypeID())
    {
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v53, kCFNumberIntType, buf);
      sub_1000387A4(*(unsigned int *)buf);
    }
    if (SCPreferencesGetValue(a3, @"kBatteryRawGasGaugeSOCKeyPersistentlyEnabled") != kCFBooleanTrue)
    {
      SCPreferencesRemoveValue(a3, @"kBatteryRawGasGaugeSOCKey");
      if (!SCPreferencesCommitChanges(a3) && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_100054C90();
      }
    }
  }
  CFNumberRef v55 = (const __CFNumber *)SCPreferencesGetValue(a3, @"kBatteryChemSOCKey");
  if (v55)
  {
    CFNumberRef v56 = v55;
    CFTypeID v57 = CFGetTypeID(v55);
    if (v57 == CFNumberGetTypeID())
    {
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v56, kCFNumberIntType, buf);
      sub_1000386FC(*(int *)buf);
    }
    if (SCPreferencesGetValue(a3, @"kBatteryChemSOCKeyPersistentlyEnabled") != kCFBooleanTrue)
    {
      SCPreferencesRemoveValue(a3, @"kBatteryChemSOCKey");
      if (!SCPreferencesCommitChanges(a3) && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_100054C90();
      }
    }
  }
  [(ThermalManager *)self checkForArcOverride:a3 key:@"ArcModuleThresholdKey"];
  [(ThermalManager *)self checkForArcOverride:a3 key:@"ArcVirtualThresholdKey"];
  CFBooleanRef v58 = (CFBooleanRef)SCPreferencesGetValue(a3, @"overrideCameraStrobeMaxLoad");
  int v59 = v58 == kCFBooleanTrue;
  byte_1000AB0E3 = v58 == kCFBooleanTrue;
  if (byte_1000AA7A0)
  {
    CFBooleanRef v60 = v58;
    v61 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      v62 = "dis";
      if (v60 == kCFBooleanTrue) {
        v62 = "en";
      }
      *(_DWORD *)buf = 136315138;
      v101[0] = v62;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "<Notice> Camera strobe override %sabled", buf, 0xCu);
      int v59 = byte_1000AB0E3;
    }
  }
  if (v59)
  {
    CFDictionaryRef v63 = IOServiceMatching("AppleDieTempController");
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v63);
    if (!MatchingService)
    {
      if (byte_1000AA7A0)
      {
        v76 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "<Notice> dieTempCtlService is NULL\n", buf, 2u);
        }
      }
      goto LABEL_104;
    }
    io_registry_entry_t v65 = MatchingService;
    v98 = 0;
    CFNumberRef v66 = (const __CFNumber *)SCPreferencesGetValue(a3, @"setCameraStrobeMaxLoad");
    if (v66)
    {
      CFNumberRef v67 = v66;
      CFTypeID v68 = CFGetTypeID(v66);
      if (v68 == CFNumberGetTypeID()) {
        CFNumberGetValue(v67, kCFNumberSInt64Type, &v98);
      }
    }
    CFNumberRef v69 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &v98);
    if (!v69)
    {
LABEL_104:
      if (SCPreferencesGetValue(a3, @"overrideCameraStrobeMaxLoadPersistentlyEnabled") != kCFBooleanTrue)
      {
        SCPreferencesRemoveValue(a3, @"overrideCameraStrobeMaxLoad");
        if (!SCPreferencesCommitChanges(a3) && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
          sub_100054C90();
        }
      }
      goto LABEL_108;
    }
    CFNumberRef v70 = v69;
    v71 = IORegistryEntrySetCFProperty(v65, @"CameraStrobeMaxLoad", v69);
    v72 = byte_1000AA7A0;
    if (v71 && byte_1000AA7A0)
    {
      v73 = v71;
      v74 = qword_1000AABC0;
      if (!os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_98;
      }
      *(_DWORD *)buf = 67109120;
      LODWORD(v101[0]) = v73;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "<Notice> IORegistryEntrySetCFProperty returned %d\n", buf, 8u);
      v72 = byte_1000AA7A0;
    }
    if (!v72)
    {
LABEL_100:
      CFRelease(v70);
      goto LABEL_104;
    }
LABEL_98:
    v75 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v101[0] = v98;
      _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "<Notice> Camera strobe max load overriden to %lld", buf, 0xCu);
    }
    goto LABEL_100;
  }
LABEL_108:
  v77 = (const __CFNumber *)SCPreferencesGetValue(a3, @"kBatteryRaKey");
  if (v77)
  {
    v78 = v77;
    v79 = CFGetTypeID(v77);
    if (v79 == CFNumberGetTypeID())
    {
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v78, kCFNumberIntType, buf);
      sub_100038F60(*(int *)buf);
    }
    if (SCPreferencesGetValue(a3, @"kBatteryRaKeyPersistentlyEnabled") != kCFBooleanTrue)
    {
      SCPreferencesRemoveValue(a3, @"kBatteryRaKey");
      if (!SCPreferencesCommitChanges(a3) && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_100054C90();
      }
    }
  }
  v80 = (const __CFNumber *)SCPreferencesGetValue(a3, @"kBatteryWRaKey");
  if (v80)
  {
    v81 = v80;
    v82 = CFGetTypeID(v80);
    if (v82 == CFNumberGetTypeID())
    {
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v81, kCFNumberIntType, buf);
      sub_10003901C(*(int *)buf);
    }
    if (SCPreferencesGetValue(a3, @"kBatteryWRaKeyPersistentlyEnabled") != kCFBooleanTrue)
    {
      SCPreferencesRemoveValue(a3, @"kBatteryWRaKey");
      if (!SCPreferencesCommitChanges(a3) && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_100054C90();
      }
    }
  }
  v83 = (const __CFNumber *)SCPreferencesGetValue(a3, @"kBatteryUPOCountKey");
  if (v83)
  {
    v84 = v83;
    v85 = CFGetTypeID(v83);
    if (v85 == CFNumberGetTypeID())
    {
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v84, kCFNumberIntType, buf);
      sub_100039264(*(unsigned int *)buf);
    }
    if (SCPreferencesGetValue(a3, @"kBatteryUPOCountKeyPersistentlyEnabled") != kCFBooleanTrue)
    {
      SCPreferencesRemoveValue(a3, @"kBatteryUPOCountKey");
      if (!SCPreferencesCommitChanges(a3) && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_100054C90();
      }
    }
  }
  v86 = (const __CFNumber *)SCPreferencesGetValue(a3, @"kStepperDisabledKey");
  if (v86)
  {
    v87 = v86;
    v88 = CFGetTypeID(v86);
    if (v88 == CFNumberGetTypeID())
    {
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v87, kCFNumberIntType, buf);
      sub_10003927C(*(_DWORD *)buf != 0);
    }
    SCPreferencesRemoveValue(a3, @"kStepperDisabledKey");
    if (!SCPreferencesCommitChanges(a3) && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100054C90();
    }
  }
  v89 = (const __CFNumber *)SCPreferencesGetValue(a3, @"kUseNewMitigationsKey");
  if (v89)
  {
    v90 = v89;
    v91 = CFGetTypeID(v89);
    if (v91 == CFNumberGetTypeID())
    {
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v90, kCFNumberIntType, buf);
      sub_100039288(*(_DWORD *)buf == 1);
    }
    if (SCPreferencesGetValue(a3, @"kUseNewMitigationsPersistentlyEnabled") != kCFBooleanTrue)
    {
      SCPreferencesRemoveValue(a3, @"kUseNewMitigationsKey");
      if (!SCPreferencesCommitChanges(a3) && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_100054C90();
      }
    }
  }
  v92 = (const __CFNumber *)SCPreferencesGetValue(a3, @"kAgingControllerDisabledKey");
  if (v92)
  {
    v93 = v92;
    v94 = CFGetTypeID(v92);
    if (v94 == CFNumberGetTypeID())
    {
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v93, kCFNumberIntType, buf);
      sub_1000392AC(*(_DWORD *)buf != 0);
    }
    if (SCPreferencesGetValue(a3, @"kAgingControllerDisabledPersistentKey") != kCFBooleanTrue)
    {
      SCPreferencesRemoveValue(a3, @"kAgingControllerDisabledKey");
      if (!SCPreferencesCommitChanges(a3) && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_100054C90();
      }
    }
  }
  v95 = (const __CFNumber *)SCPreferencesGetValue(a3, @"kOnChargerStatusKey");
  if (v95)
  {
    v96 = v95;
    v97 = CFGetTypeID(v95);
    if (v97 == CFNumberGetTypeID())
    {
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v96, kCFNumberIntType, buf);
      sub_1000392EC(*(unsigned int *)buf);
    }
    if (SCPreferencesGetValue(a3, @"kOnChargerStatusKeyPersistentlyEnabled") != kCFBooleanTrue)
    {
      SCPreferencesRemoveValue(a3, @"kOnChargerStatusKey");
      if (!SCPreferencesCommitChanges(a3) && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_100054C90();
      }
    }
  }
}

- (void)checkForLifetimeServoOverride:(__SCPreferences *)a3 key:(__CFString *)a4
{
  CFNumberRef Value = (const __CFNumber *)SCPreferencesGetValue(a3, a4);
  uint64_t v7 = 0xFFFFFFFFLL;
  unsigned int valuePtr = -1;
  if (Value)
  {
    CFNumberRef v8 = Value;
    CFTypeID v9 = CFGetTypeID(Value);
    if (v9 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v8, kCFNumberIntType, &valuePtr);
      uint64_t v7 = valuePtr;
    }
  }
  [(CommonProduct *)self->product overrideLifetimeServoParam:a4 value:v7];
}

- (void)checkForArcOverride:(__SCPreferences *)a3 key:(__CFString *)a4
{
  CFNumberRef Value = (const __CFNumber *)SCPreferencesGetValue(a3, a4);
  if (Value)
  {
    CFNumberRef v7 = Value;
    CFTypeID v8 = CFGetTypeID(Value);
    if (v8 == CFNumberGetTypeID())
    {
      unsigned int valuePtr = 0;
      CFNumberGetValue(v7, kCFNumberIntType, &valuePtr);
      [(CommonProduct *)self->product overrideArcParam:a4 value:valuePtr];
    }
  }
}

- (void)updateSystemPowerState:(BOOL)a3
{
}

- (int)canSystemSleep
{
  return [(CommonProduct *)self->product canSystemSleep];
}

- (void)initDataCollection
{
  if (self->product)
  {
    objc_super v3 = +[TGraphSampler sharedInstance];
    product = self->product;
    int v5 = [(CommonProduct *)product listofComponentControl];
    int v6 = [(CommonProduct *)self->product listOfSupervisorControl];
    [(TGraphSampler *)v3 setProduct:product withComponents:v5 andHotspotSupervisors:v6];
  }
}

- (int)canaryTempSensorIndex
{
  return [(CommonProduct *)self->product canaryTempSensorIndex];
}

- (int)canaryTempThreshold
{
  return [(CommonProduct *)self->product canaryTempThreshold];
}

- (void)canaryModeExitEarly:(int)a3
{
}

- (BOOL)getPotentialForcedThermalPressureLevel
{
  return [(CommonProduct *)self->product getPotentialForcedThermalPressureLevel];
}

- (__CFRunLoop)localMainRunloop
{
  return self->localMainRunloop;
}

@end