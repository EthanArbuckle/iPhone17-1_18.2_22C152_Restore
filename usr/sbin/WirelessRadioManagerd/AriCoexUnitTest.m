@interface AriCoexUnitTest
- (AriCoexUnitTest)init;
- (BOOL)isAriDisabled;
- (BOOL)isUnitTestRequested;
- (id)createXpcMsg_AntBitmap;
- (id)createXpcMsg_AntennaTunerConfig:(unint64_t)a3 State:(unint64_t)a4 UseCase:(unint64_t)a5;
- (id)createXpcMsg_AntennaTunerConfig_BT;
- (id)createXpcMsg_AntennaTunerConfig_GNSS;
- (id)createXpcMsg_AntennaTunerConfig_UWB;
- (id)createXpcMsg_AntennaTunerConfig_WiFi;
- (id)createXpcMsg_CamAntBlockingConfig;
- (id)createXpcMsg_CameraStateConfig;
- (id)createXpcMsg_LAAConfig;
- (id)createXpcMsg_MiscConfig;
- (id)createXpcMsg_RC1Config;
- (id)createXpcMsg_ScanFreq;
- (id)createXpcMsg_SetAllCC;
- (id)createXpcMsg_SetCC1;
- (id)createXpcMsg_SetCC2;
- (id)createXpcMsg_SpmiFeature_TxBlanking_PwrLmt;
- (id)createXpcMsg_TimeShareConfig;
- (id)createXpcMsg_TxActivityConfig;
- (id)createXpcMsg_UwbAntBlockingConfig;
- (id)createXpcMsg_WiFiAntBlockingConfig;
- (id)sendMessage:(unint64_t)a3 withArgs:(id)a4 withExtraKey:(const char *)a5 andExtraValue:(id)a6;
- (void)reloadAriDriverSettingsFromPreferences;
- (void)setAriDriverSettingsToPreferences:(BOOL)a3;
@end

@implementation AriCoexUnitTest

- (void)reloadAriDriverSettingsFromPreferences
{
  CFDictionaryRef v3 = (const __CFDictionary *)CFPreferencesCopyAppValue(@"AriDebug", @"com.apple.WirelessRadioManager.debug");
  if (v3)
  {
    CFDictionaryRef v4 = v3;
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(v4))
    {
      value = 0;
      if (CFDictionaryGetValueIfPresent(v4, @"AriTestMode", (const void **)&value)
        && (CFTypeID v6 = CFStringGetTypeID(), v6 == CFGetTypeID(value)))
      {
        BOOL v7 = CFEqual(@"TRUE", (CFStringRef)value);
        BOOL v8 = v7;
        v9 = "FALSE";
        if (v7) {
          v9 = "TRUE";
        }
        +[WCM_Logging logLevel:3, @"ARI Test Mode read from preference %s", v9 message];
      }
      else
      {
        +[WCM_Logging logLevel:3 message:@"ARI Driver setting(UnitTest mode) not found"];
        BOOL v8 = 0;
      }
      if (CFDictionaryGetValueIfPresent(v4, @"DisableCoexAri", (const void **)&value))
      {
        CFTypeID v11 = CFStringGetTypeID();
        if (v11 == CFGetTypeID(value))
        {
          BOOL v7 = CFEqual(@"TRUE", (CFStringRef)value);
          BOOL v10 = v7;
          v12 = "FALSE";
          if (v7) {
            v12 = "TRUE";
          }
          +[WCM_Logging logLevel:3, @"Disable Coex ARI flag read from preference %s", v12 message];
          goto LABEL_18;
        }
      }
      +[WCM_Logging logLevel:3 message:@"ARI Driver setting(Disable Coex ARI) not found"];
    }
    else
    {
      +[WCM_Logging logLevel:3 message:@"AriDebug not Found"];
      BOOL v8 = 0;
    }
    BOOL v10 = 1;
LABEL_18:
    CFRelease(v4);
    goto LABEL_19;
  }
  +[WCM_Logging logLevel:3 message:@"AriDebug not Found"];
  BOOL v8 = 0;
  BOOL v10 = 1;
LABEL_19:
  self->mUnitTest = v8;
  self->mDisableCoexARI = v10;
  +[WCM_Logging logLevel:3, @"ARI Driver current preference setting: UnitTest=%d, DisableCoexARI=%d", v8, v10 message];
}

- (void)setAriDriverSettingsToPreferences:(BOOL)a3
{
  CFDictionaryRef v3 = "FALSE";
  if (a3) {
    CFDictionaryRef v3 = "TRUE";
  }
  values = +[NSString stringWithFormat:@"%s", v3];
  keys = @"AriTestMode";
  CFDictionaryRef v4 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (v4)
  {
    CFDictionaryRef v5 = v4;
    CFPreferencesSetAppValue(@"AriDebug", v4, @"com.apple.WirelessRadioManager.debug");
    CFRelease(v5);
  }
  if (!CFPreferencesAppSynchronize(@"com.apple.WirelessRadioManager.debug")) {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, @"%s: Failed to sync the preferences.", "-[AriCoexUnitTest setAriDriverSettingsToPreferences:]");
  }
}

- (AriCoexUnitTest)init
{
  v4.receiver = self;
  v4.super_class = (Class)AriCoexUnitTest;
  v2 = [(AriCoexUnitTest *)&v4 init];
  v2->mAntBlockPolicy = 0;
  [(AriCoexUnitTest *)v2 reloadAriDriverSettingsFromPreferences];
  return v2;
}

- (BOOL)isUnitTestRequested
{
  return self->mUnitTest;
}

- (BOOL)isAriDisabled
{
  return self->mDisableCoexARI;
}

- (id)sendMessage:(unint64_t)a3 withArgs:(id)a4 withExtraKey:(const char *)a5 andExtraValue:(id)a6
{
  keys[0] = "kMessageId";
  keys[1] = "kMessageArgs";
  keys[2] = (char *)a5;
  values[0] = xpc_uint64_create(a3);
  values[1] = a4;
  values[2] = a6;
  xpc_object_t v9 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
  +[WCM_Logging logLevel:3, @"ARI Driver UnitTest: Create messageId(%lld): %@", a3, v9 message];
  return v9;
}

- (id)createXpcMsg_LAAConfig
{
  id result = xpc_dictionary_create(0, 0, 0);
  if (result)
  {
    id v4 = result;
    xpc_dictionary_set_BOOL(result, "WCMCellularSetLAAConfig_CoexEnable", 1);
    xpc_dictionary_set_uint64(v4, "WCMCellularSetLAAConfig_ProtectCQIPeriod", 0x64uLL);
    xpc_dictionary_set_uint64(v4, "WCMCellularSetLAAConfig_ThresholdIn", 0x14uLL);
    xpc_dictionary_set_uint64(v4, "WCMCellularSetLAAConfig_ThresholdOut", 0xAuLL);
    xpc_dictionary_set_uint64(v4, "WCMCellularSetLAAConfig_DeactTimer", 0x1F4uLL);
    xpc_dictionary_set_uint64(v4, "WCMCellularSetLAAConfig_DeactStopTimer", 0x1F4uLL);
    xpc_object_t v5 = xpc_uint64_create(0);
    return [(AriCoexUnitTest *)self sendMessage:1211 withArgs:v4 withExtraKey:"kSubId" andExtraValue:v5];
  }
  return result;
}

- (id)createXpcMsg_RC1Config
{
  xpc_object_t v3 = xpc_uint64_create(0);
  id result = xpc_dictionary_create(0, 0, 0);
  if (result)
  {
    id v5 = result;
    xpc_dictionary_set_uint64(result, "WCMCellularSetLAAConfig_UwbRangingDuration", 0x9C40uLL);
    xpc_dictionary_set_uint64(v5, "WCMCellularSetLAAConfig_UwbNarrowBandDuration", 0xC350uLL);
    xpc_dictionary_set_uint64(v5, "kWCMCellularSetLaaGpioThrottleReq_Enabled", 1uLL);
    xpc_dictionary_set_uint64(v5, "kWCMCellularSetLaaGpioThrottleReq_Periodicity", 0x64uLL);
    return [(AriCoexUnitTest *)self sendMessage:1213 withArgs:v5 withExtraKey:"kSubId" andExtraValue:v3];
  }
  return result;
}

- (id)createXpcMsg_ScanFreq
{
  xpc_object_t v3 = xpc_array_create(0, 0);
  *(_OWORD *)keys = *(_OWORD *)off_10020F398;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [&off_10024DFC0 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(&off_10024DFC0);
        }
        BOOL v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v8 count] == (id)2)
        {
          xpc_object_t v9 = [[v8 objectAtIndex:1] integerValue];
          unint64_t v10 = v9 - (unsigned char *)[v8 objectAtIndex:0];
          values[0] = xpc_int64_create((int64_t)[v8 objectAtIndex:0] integerValue + (v10 >> 1));
          values[1] = xpc_int64_create(v10);
          xpc_object_t v11 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
          xpc_array_append_value(v3, v11);
        }
      }
      id v5 = [&off_10024DFC0 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v5);
  }
  return [(AriCoexUnitTest *)self sendMessage:1208 withArgs:v3 withExtraKey:"kSubId" andExtraValue:xpc_uint64_create(0)];
}

- (id)createXpcMsg_SpmiFeature_TxBlanking_PwrLmt
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetWCI2Mode_Policy", 0x8FDAuLL);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetWCI2Mode_PowerThreshold", 0x12uLL);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetWCI2Mode_RB_Threshold", 0x25uLL);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetWCI2Mode_LTE_TxDenialThreshold", 7uLL);
  xpc_dictionary_set_int64(v3, "kWCMCellularSetWCI2Mode_MaxAllowedFrameDenials", 25);
  xpc_dictionary_set_int64(v3, "kWCMCellularSetWCI2Mode_FrameDenialWindow", 200);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetWCI2Mode_APTTable", 0);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetWCI2Mode_ControllerTxPowerLimit", 0x1EuLL);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetWCI2Mode_WCI2PowerLimit", 0x13uLL);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetWCI2Mode_LinkPathLossThreshold", 0x6BuLL);
  xpc_dictionary_set_double(v3, "kWCMCellularSetWCI2Mode_RBFilterAlpha", 0.05);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetWCI2Mode_FilterRBThreshold", 0x25uLL);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetWCI2Mode_ControllerTxPowerLimitTO", 0);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetWCI2Mode_WCI2PowerLimitTO", 0x96uLL);
  xpc_dictionary_set_int64(v3, "kWCMCellularSetWCI2Mode_TxPowerThresholdForAdvTxNotice", 19);
  xpc_dictionary_set_int64(v3, "kWCMCellularSetWCI2Mode_RbThresholdForAdvTxNotice", 37);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetWCI2Mode_Controller_RB_Threshold", 0);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetWCI2Mode_Harq_nack_ratio_Threshold", 0);
  xpc_dictionary_set_BOOL(v3, "kWCMCellularSetWCI2Mode_Controller_PowerLimiting_Enable", 0);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetWCI2Mode_CoexTech", 9uLL);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetWCI2Mode_NGC_TxDenialThresholdSlots", 7uLL);
  xpc_dictionary_set_int64(v3, "kWCMCellularSetWCI2Mode_NGC_MaxAllowedSlotDenials", 25);
  xpc_dictionary_set_int64(v3, "kWCMCellularSetWCI2Mode_NGC_SlotsDenialWindow", 200);
  xpc_object_t v4 = xpc_uint64_create(0);

  return [(AriCoexUnitTest *)self sendMessage:1205 withArgs:v3 withExtraKey:"kSubId" andExtraValue:v4];
}

- (id)createXpcMsg_SetAllCC
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v4 = xpc_uint64_create(0);

  return [(AriCoexUnitTest *)self sendMessage:1234 withArgs:v3 withExtraKey:"kSubId" andExtraValue:v4];
}

- (id)createXpcMsg_SetCC1
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, "kWCMCellularSetCC_Enable", 1);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetCC_CoexTech", 1uLL);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetCC_CarrierId", 0);
  xpc_dictionary_set_double(v3, "kWCMCellularSetCC_UplinkCenterFrequency", 2560.0);
  xpc_dictionary_set_double(v3, "kWCMCellularSetCC_UplinkBandwidth", 10.0);
  xpc_dictionary_set_double(v3, "kWCMCellularSetCC_DownlinkCenterFrequency", 2630.0);
  xpc_dictionary_set_double(v3, "kWCMCellularSetCC_DownlinkBandwidth", 10.0);
  xpc_object_t v4 = xpc_uint64_create(0);

  return [(AriCoexUnitTest *)self sendMessage:1217 withArgs:v3 withExtraKey:"kSubId" andExtraValue:v4];
}

- (id)createXpcMsg_SetCC2
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, "kWCMCellularSetCC_Enable", 1);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetCC_CoexTech", 0x40uLL);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetCC_CarrierId", 0);
  xpc_dictionary_set_double(v3, "kWCMCellularSetCC_UplinkCenterFrequency", 2570.0);
  xpc_dictionary_set_double(v3, "kWCMCellularSetCC_UplinkBandwidth", 10.0);
  xpc_dictionary_set_double(v3, "kWCMCellularSetCC_DownlinkCenterFrequency", 2640.0);
  xpc_dictionary_set_double(v3, "kWCMCellularSetCC_DownlinkBandwidth", 10.0);
  xpc_object_t v4 = xpc_uint64_create(0);

  return [(AriCoexUnitTest *)self sendMessage:1218 withArgs:v3 withExtraKey:"kSubId" andExtraValue:v4];
}

- (id)createXpcMsg_TimeShareConfig
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetTimeShareConfig_Enable", 1uLL);
  xpc_dictionary_set_uint64(v3, "kWCMCellularTimeShareConfig_CoexTech", 1uLL);
  xpc_dictionary_set_uint64(v3, "kWCMCellularTimeShareConfig_CallType", 2uLL);
  xpc_dictionary_set_uint64(v3, "kWCMCellularTimeShareConfig_LongDrxCycle", 0x28uLL);
  xpc_dictionary_set_uint64(v3, "kWCMCellularTimeShareConfig_ShortDrxCycle", 0);
  xpc_dictionary_set_uint64(v3, "kWCMCellularTImeShareConfig_SleepWakeDurScale", 5uLL);
  xpc_object_t v4 = xpc_array_create(0, 0);
  values[0] = xpc_int64_create(7);
  values[1] = xpc_int64_create(10);
  long long v7 = *(_OWORD *)off_10020F3A8;
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)&v7, values, 2uLL);
  xpc_array_append_value(v4, v5);
  xpc_dictionary_set_value(v3, "kWCMCellularTImeShareConfig_BandInformationSet", v4);
  return [(AriCoexUnitTest *)self sendMessage:1214 withArgs:v3 withExtraKey:"kSubId" andExtraValue:xpc_uint64_create(0)];
}

- (id)createXpcMsg_WiFiAntBlockingConfig
{
  mAntBlockPolicy = self->mAntBlockPolicy;
  if (!mAntBlockPolicy) {
    return 0;
  }
  id v4 = [(WCM_AntBlockPowerLimitPolicy *)mAntBlockPolicy getAntBlockConfigXpcMsgOnClient:0];
  if (!v4) {
    return 0;
  }
  id v5 = v4;
  xpc_object_t v6 = xpc_uint64_create(0);

  return [(AriCoexUnitTest *)self sendMessage:1225 withArgs:v5 withExtraKey:"kSubId" andExtraValue:v6];
}

- (id)createXpcMsg_UwbAntBlockingConfig
{
  mAntBlockPolicy = self->mAntBlockPolicy;
  if (!mAntBlockPolicy) {
    return 0;
  }
  id v4 = [(WCM_AntBlockPowerLimitPolicy *)mAntBlockPolicy getAntBlockConfigXpcMsgOnClient:1];
  if (!v4) {
    return 0;
  }
  id v5 = v4;
  xpc_object_t v6 = xpc_uint64_create(0);

  return [(AriCoexUnitTest *)self sendMessage:1226 withArgs:v5 withExtraKey:"kSubId" andExtraValue:v6];
}

- (id)createXpcMsg_CamAntBlockingConfig
{
  mAntBlockPolicy = self->mAntBlockPolicy;
  if (!mAntBlockPolicy) {
    return 0;
  }
  unint64_t v4 = [(WCM_AntBlockPowerLimitPolicy *)mAntBlockPolicy getAntBlockConfigXpcMsgOnClient:2];
  unint64_t v5 = [(WCM_AntBlockPowerLimitPolicy *)self->mAntBlockPolicy getAntBlockConfigXpcMsgOnClient:3];
  if (!(v4 | v5)) {
    return 0;
  }
  xpc_object_t v6 = (void *)v5;
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  BOOL v8 = v7;
  if (v4) {
    xpc_dictionary_set_value(v7, "kWCMCellularSetAntBlocking_FrontCameraPolicy", (xpc_object_t)v4);
  }
  if (v6) {
    xpc_dictionary_set_value(v8, "kWCMCellularSetAntBlocking_FaceIdCameraPolicy", v6);
  }
  if (!v8) {
    return 0;
  }
  xpc_object_t v9 = xpc_uint64_create(0);

  return [(AriCoexUnitTest *)self sendMessage:1227 withArgs:v8 withExtraKey:"kSubId" andExtraValue:v9];
}

- (id)createXpcMsg_AntBitmap
{
  xpc_object_t v3 = xpc_array_create(0, 0);
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  +[WCM_Logging logLevel:4 message:@"BB22AntMapping_:Updating antenna map params to cellular modem"];
  xpc_dictionary_set_uint64(v4, "kWCMCellularSetWCI2TxAntMap_Enable", 1uLL);
  xpc_dictionary_set_uint64(v4, "kWCMCellularSetWCI2TxAntMap_DefaultIdx", 0);
  xpc_dictionary_set_uint64(v4, "kWCMCellularSetWCI2Type7FRTwoTxEnable", 1uLL);
  for (uint64_t i = 0; i != 10; ++i)
  {
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kWCMCellularSetWCI2TxAntMap_Infoet_AntIdx", i);
    xpc_dictionary_set_uint64(v6, "kWCMCellularSetWCI2TxAntMap_InfoSet_WCI2Idx", (int)[objc_msgSend(&off_10024DFD8, "objectAtIndex:", i) intValue]);
    xpc_array_append_value(v3, v6);
  }
  xpc_dictionary_set_value(v4, "kWCMCellularSetWCI2TxAntMap_InformationSet", v3);
  xpc_object_t v7 = xpc_uint64_create(0);

  return [(AriCoexUnitTest *)self sendMessage:1215 withArgs:v4 withExtraKey:"kSubId" andExtraValue:v7];
}

- (id)createXpcMsg_MiscConfig
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetMiscConfig_UwbInactivityDurationThreshold", 0x96uLL);
  xpc_object_t v4 = xpc_uint64_create(0);

  return [(AriCoexUnitTest *)self sendMessage:1230 withArgs:v3 withExtraKey:"kSubId" andExtraValue:v4];
}

- (id)createXpcMsg_TxActivityConfig
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "kWCMCellularSetTxActivityConfig_TxEnvPowerThreshold", 320);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetTxActivityConfig_TxEnvMinDuration", 0x14uLL);
  xpc_dictionary_set_BOOL(v3, "kWCMCellularSetTxActivityConfig_TxStatsEnable", 1);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetTxActivityConfig_TxStatsCadence", 0x12CuLL);
  xpc_object_t v4 = xpc_uint64_create(0);

  return [(AriCoexUnitTest *)self sendMessage:1231 withArgs:v3 withExtraKey:"kSubId" andExtraValue:v4];
}

- (id)createXpcMsg_CameraStateConfig
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetCameraState", 9uLL);
  xpc_object_t v4 = xpc_uint64_create(0);

  return [(AriCoexUnitTest *)self sendMessage:1233 withArgs:v3 withExtraKey:"kSubId" andExtraValue:v4];
}

- (id)createXpcMsg_AntennaTunerConfig:(unint64_t)a3 State:(unint64_t)a4 UseCase:(unint64_t)a5
{
  xpc_object_t v8 = xpc_uint64_create(a4);
  xpc_object_t v9 = xpc_uint64_create(a5);
  xpc_object_t v10 = xpc_array_create(0, 0);
  xpc_array_append_value(v10, v8);
  xpc_array_append_value(v10, v9);
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v11, "kWCMCellularTransparentMessage_ByteList", v10);
  xpc_dictionary_set_uint64(v11, "kWCMCellularTransparentMessage_Type", a3);
  xpc_object_t v12 = xpc_array_create(0, 0);
  xpc_array_append_value(v12, v11);
  xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v13, "kWCMCellularTransparentMessageInformationSet", v12);
  xpc_object_t v14 = xpc_uint64_create(0);

  return [(AriCoexUnitTest *)self sendMessage:1223 withArgs:v13 withExtraKey:"kSubId" andExtraValue:v14];
}

- (id)createXpcMsg_AntennaTunerConfig_WiFi
{
  return [(AriCoexUnitTest *)self createXpcMsg_AntennaTunerConfig:1 State:3 UseCase:0];
}

- (id)createXpcMsg_AntennaTunerConfig_BT
{
  return [(AriCoexUnitTest *)self createXpcMsg_AntennaTunerConfig:2 State:2 UseCase:2];
}

- (id)createXpcMsg_AntennaTunerConfig_UWB
{
  return [(AriCoexUnitTest *)self createXpcMsg_AntennaTunerConfig:3 State:9 UseCase:1];
}

- (id)createXpcMsg_AntennaTunerConfig_GNSS
{
  return [(AriCoexUnitTest *)self createXpcMsg_AntennaTunerConfig:0 State:1 UseCase:2];
}

@end