@interface WCM_CellularController
- ($4F6D63EF3A0924A93BB4743A6BF1AEF7)getActiveULCAConfig;
- ($98FD36134D1A88AC5AB3433CBDAD69ED)activeConfig;
- ($F24F406B2B787EFB06265DBA3D28CBD5)getCombinedUplinkFreqRange;
- (BOOL)btClkAlgnFlag;
- (BOOL)clkAlgnTDDFreqCheck;
- (BOOL)enableFastCharging;
- (BOOL)isInCoexBand7LowerEdge;
- (BOOL)lowBandInABSReportFastCharging;
- (BOOL)lteCDRXWiFiTDD;
- (BOOL)tddBand;
- (NSString)description;
- (NSTimer)baseBandEnabledProtectionTimer;
- (NSTimer)fastChargingHystersisTimer;
- (WCM_CellularController)init;
- (WCM_CellularController)initWithConnection:(id)a3 processId:(int)a4;
- (double)cachedULBandwidth;
- (double)cachedULCenterFreq;
- (double)dlBandwidth;
- (double)dlBandwidth2;
- (double)dlBandwidthCellVictim;
- (double)dlBandwidthWiFiVictim;
- (double)dlCenterFreq;
- (double)dlCenterFreq2;
- (double)dlCenterFreqCellVictim;
- (double)dlCenterFreqWiFiVictim;
- (double)ulBandwidth;
- (double)ulBandwidth2;
- (double)ulBandwidthCellVictim;
- (double)ulBandwidthWiFiVictim;
- (double)ulCenterFreq;
- (double)ulCenterFreq2;
- (double)ulCenterFreqCellVictim;
- (double)ulCenterFreqWiFiVictim;
- (int)bandInfoType;
- (int)rc1priority;
- (int)watchAntPref;
- (int)watchAntPrefBand;
- (int64_t)controllerTxPowerLimit;
- (int64_t)rbThreshold;
- (int64_t)wci2TxPowerLimit;
- (unint64_t)CC1CarrierId;
- (unint64_t)CC1Tech;
- (unint64_t)CC2CarrierId;
- (unint64_t)CC2Tech;
- (unint64_t)activeSubId;
- (unint64_t)carrierId;
- (unint64_t)dlCPConfig;
- (unint64_t)frameOffset;
- (unint64_t)getCoexTechForPolicy:(unint64_t)a3;
- (unint64_t)rc1duration;
- (unint64_t)subSelector;
- (unint64_t)subframeFormat;
- (unint64_t)tddULDLConfig;
- (unint64_t)ulCPConfig;
- (unint64_t)updateFrameSyncBit:(unint64_t)a3;
- (unint64_t)updateGPSStateBit:(unint64_t)a3;
- (unint64_t)updatePolicyForBB20:(unint64_t)a3;
- (unint64_t)wci2CoexPolicyBitmap;
- (unint64_t)wifiBandwidthMHz;
- (unint64_t)wifiCenterFreqMHz;
- (unint64_t)wifiTxPowerdBm;
- (void)ConstructAntennaMapXpcMsg:(id)a3 AntPhyIdxDict:(id)a4 AntSpmiIdxDict:(id)a5;
- (void)baseBandProtectionTimerHandler:(id)a3;
- (void)configureCellularTimeShareConfigReqParamsWithCenterFreq:(unint64_t)a3 CoexTech:(unsigned int)a4 bandwidth:(unint64_t)a5 subId:(unint64_t)a6;
- (void)configureCellularTimeShareConfigReqParamsWithCenterFreq:(unint64_t)a3 bandwidth:(unint64_t)a4;
- (void)configureCellularTimeShareConfigReqParamsWithCenterFreq:(unint64_t)a3 instance:(unsigned int)a4 bandwidth:(unint64_t)a5;
- (void)dealloc;
- (void)disableCellularTimeShareConfigReqSubId:(unint64_t)a3;
- (void)fastChargingHandler:(BOOL)a3;
- (void)fastChargingHystersisTimerHandler:(id)a3;
- (void)handleDesenseNetworkConfig:(id)a3;
- (void)handleMessage:(id)a3;
- (void)handleNetworkConfig:(id)a3;
- (void)handleNetworkConfig_bb20:(id)a3;
- (void)handleNetworkConfig_legacy:(id)a3;
- (void)handlePowerState:(BOOL)a3;
- (void)handleThresholdEvent:(id)a3;
- (void)handleTxPower:(id)a3;
- (void)sacExtractDesenseFreq:(id)a3 message:(id)a4;
- (void)sacHandleDesenseNetworkConfig:(id)a3;
- (void)sendBBCameraState:(int)a3 state:(unsigned __int8)a4;
- (void)sendBBCoexSensorMessage:(int)a3 band:(unsigned __int8)a4 usecase:(unsigned __int8)a5;
- (void)sendMessage:(unint64_t)a3 withArgs:(id)a4;
- (void)sendMessage:(unint64_t)a3 withArgs:(id)a4 withExtraKey:(const char *)a5 andExtraValue:(id)a6;
- (void)sendMessageToAriDriver:(unint64_t)a3 withArgs:(id)a4 withExtraKey:(const char *)a5 andExtraValue:(id)a6;
- (void)setActiveConfig:(id *)a3;
- (void)setActiveSubId:(unint64_t)a3;
- (void)setAllCriticalCarriers;
- (void)setAllPolicies;
- (void)setAntBlockingParams;
- (void)setBaseBandEnabledProtectionTimer:(id)a3;
- (void)setCC1CarrierId:(unint64_t)a3;
- (void)setCC1Tech:(unint64_t)a3;
- (void)setCC2CarrierId:(unint64_t)a3;
- (void)setCC2Tech:(unint64_t)a3;
- (void)setClientAntBlockingParams;
- (void)setClientAntBlockingParams22;
- (void)setControllerTxPowerLimit:(int64_t)a3;
- (void)setCriticalCarrier:(unint64_t)a3 forCarrierId:(unint64_t)a4 forTech:(unint64_t)a5;
- (void)setEnableFastCharging:(BOOL)a3;
- (void)setFastChargingHystersisTimer:(id)a3;
- (void)setGpsBandInfoToBB:(BOOL)a3 l5Enabled:(BOOL)a4 btA2DPEnabled:(BOOL)a5 l5Level:(unint64_t)a6;
- (void)setLAACoexConfig:(int)a3;
- (void)setLowBandInABSReportFastCharging:(BOOL)a3;
- (void)setLteCDRXWiFiTDD:(BOOL)a3;
- (void)setNetworkConfigOfInterest;
- (void)setRC1Duration:(unint64_t)a3;
- (void)setRbThreshold:(int64_t)a3;
- (void)setRc1duration:(unint64_t)a3;
- (void)setRc1priority:(int)a3;
- (void)setScanFrequencyBandFilter:(id)a3;
- (void)setWatchAntPref:(int)a3;
- (void)setWatchAntPrefBand:(int)a3;
- (void)setWci2CoexPolicyBitmap:(unint64_t)a3;
- (void)setWci2TxAntMap;
- (void)setWci2TxAntMapBB21;
- (void)setWci2TxAntMapBB22;
- (void)setWci2TxPowerLimit:(int64_t)a3;
- (void)setWifiBandwidthMHz:(unint64_t)a3;
- (void)setWifiCenterFreqMHz:(unint64_t)a3;
- (void)setWifiTxPowerdBm:(unint64_t)a3;
- (void)submitAWDMetricsforNetworkConfiguration;
- (void)updateBBRC1Params:(BOOL)a3 channel:(unint64_t)a4 duration:(unint64_t)a5 priority:(unsigned int)a6;
- (void)updateControllerTxPower:(int64_t)a3;
- (void)updateWCI2CoexPolicy:(unint64_t)a3;
- (void)updateWCI2TxPower:(int64_t)a3;
- (void)updateWatchAntennaPref:(int)a3 watchAntPref:(int)a4;
- (void)updateWiFiStatusCenterFreq:(unint64_t)a3 bandwidth:(unint64_t)a4 txPower:(unint64_t)a5;
@end

@implementation WCM_CellularController

- (unint64_t)subSelector
{
  id v3 = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton];
  if (v3)
  {
    uint64_t v4 = (uint64_t)[v3 getUserDataPreferredSlot];
    +[WCM_Logging logLevel:2, @"BB20 subSelector  active sub %d ", v4 message];
  }
  else
  {
    uint64_t v4 = 1;
  }
  double v5 = *(double *)((char *)&self->_cellularInstance0.frameOffset + 4);
  double v6 = *(double *)((char *)&self->_cellularInstance1.frameOffset + 4);
  uint64_t v10 = 0x100010000000101;
  if (v4 == 1)
  {
    v7 = (uint64_t *)((char *)&v10 + 4);
  }
  else
  {
    if (v4 != 2)
    {
      unint64_t v8 = 0;
      goto LABEL_10;
    }
    v7 = &v10;
  }
  unint64_t v8 = *((unsigned __int8 *)v7 + 2 * (v5 != 0.0) + (v6 != 0.0));
LABEL_10:
  +[WCM_Logging logLevel:2, @"BB20 subSelector rrc states %d %d, selected sub %llu", v5 != 0.0, v6 != 0.0, v8, v10 message];
  return v8;
}

- (unint64_t)updateFrameSyncBit:(unint64_t)a3
{
  id v5 = +[WCM_PolicyManager singleton];
  +[WCM_Logging logLevel:4, @"clkAlgnTDDFreqCheck: before clkAlgnTDDFreqCheck, wci2CoexPolicyBitmap=%lld", a3 message];
  if (objc_msgSend(objc_msgSend(v5, "activeCoexFeatures"), "containsObject:", @"ClkAlgnTDDFix"))
  {
    unsigned int v6 = [(WCM_CellularController *)self btClkAlgnFlag];
    a3 = a3 & 0xFFFFFFFFFFFFFFFELL | v6;
    +[WCM_Logging logLevel:4, @"clkAlgnTDDFreqCheck: clkAlgnEnableFlag is %d.", v6 message];
  }
  +[WCM_Logging logLevel:4, @"clkAlgnTDDFreqCheck: after clkAlgnTDDFreqCheck, wci2CoexPolicyBitmap=%lld", a3 message];
  return a3;
}

- (void)updateWCI2CoexPolicy:(unint64_t)a3
{
  +[WCM_Logging logLevel:4, @"DLDebug_ updateGPSStateBit function called by updateWCI2CoexPolicy with input policy: %lld.", a3 message];
  unint64_t v5 = [(WCM_CellularController *)self updateGPSStateBit:a3];
  +[WCM_Logging logLevel:4, @"clkAlgnTDDFreqCheck: updateFrameSyncBit function called by updateWCI2CoexPolicy with input policy wci2CoexPolicyBitmapGPSUpdated: %lld.", v5 message];
  unsigned int v6 = [(WCM_CellularController *)self updateFrameSyncBit:v5];
  if ((void *)[(WCM_CellularController *)self wci2CoexPolicyBitmap] != v6)
  {
    +[WCM_Logging logLevel:3, @"Updating WCI2 Policy from %lld to %lld", [(WCM_CellularController *)self wci2CoexPolicyBitmap], v6 message];
    [(WCM_CellularController *)self setWci2CoexPolicyBitmap:v6];
    [(WCM_CellularController *)self setAllPolicies];
  }

  [(WCM_CellularController *)self setAllCriticalCarriers];
}

- (void)submitAWDMetricsforNetworkConfiguration
{
  int v3 = 20;
  if ([(WCM_CellularController *)self activeSubId]) {
    int v3 = 2756;
  }
  id v4 = +[WRM_MetricsService getSingleton];
  unint64_t v5 = v4;
  if (v4) {
    [v4 initLTECoexMetrics];
  }
  unsigned int v6 = (char *)[v5 getLTECoexMetrics];
  if (v6)
  {
    v7 = (float64x2_t *)((char *)self + v3);
    unint64_t v8 = (unsigned __int8 *)(v6 + 20);
    *(_OWORD *)(v6 + 24) = 0u;
    v6[20] = 0;
    *(_OWORD *)(v6 + 40) = 0u;
    if (LODWORD(v7[153].f64[0]) >= 2)
    {
      int v11 = BYTE4(v7[168].f64[0]);
      *unint64_t v8 = v11;
      v15.val[1] = (float32x2_t)vmovn_s64((int64x2_t)vcvtq_u64_f64(v7[10]));
      v15.val[0] = (float32x2_t)vmovn_s64((int64x2_t)vcvtq_u64_f64(v7[9]));
      v9 = (float *)(v6 + 24);
      vst2_f32(v9, v15);
      if (v11)
      {
        v12 = (float64x2_t *)((char *)v7 + 72 * SHIDWORD(v7[153].f64[0]) + 144);
        v16.val[1] = (float32x2_t)vmovn_s64((int64x2_t)vcvtq_u64_f64(v12[1]));
        v16.val[0] = (float32x2_t)vmovn_s64((int64x2_t)vcvtq_u64_f64(*v12));
        uint64_t v10 = (float *)(v6 + 40);
        vst2_f32(v10, v16);
      }
    }
    if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"ANTSELSTATSAWDSTATSCAMigration"))
    {
      id v13 = +[WCM_PolicyManager singleton];
      LODWORD(v14) = *((_DWORD *)v8 + 8);
      [v13 wRMCACoexSubmit_ULCACoexStates:ULCAPrimaryCarrierULFreq:ULCAPrimaryCarrierDLFreq:ULCAPrimaryCarrierULBW:ULCAPrimaryCarrierDLBW:ULCACriticalCarrierULFreq:ULCACriticalCarrierDLFreq:ULCACriticalCarrierULBW:ULCACriticalCarrierDLBW:*v8, *((unsigned int *)v8 + 1), *((unsigned int *)v8 + 2), *((unsigned int *)v8 + 3), *((unsigned int *)v8 + 4), *((unsigned int *)v8 + 5), *((void *)v8 + 3), v14];
    }
  }
}

- (void)handleMessage:(id)a3
{
  int64_t uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  if (uint64 > 387)
  {
    switch(uint64)
    {
      case 388:
        +[WCM_Logging logLevel:3 message:@"FCharging Handle config message WCMCellularBBStateIndication"];
        [(WCM_CellularController *)self handleDesenseBBStateIndication:a3];
        break;
      case 399:
        +[WCM_Logging logLevel:3 message:@"FCharging Handle config message WCMCellular_DesenseNetworkConfiguration"];
        [(WCM_CellularController *)self handleDesenseNetworkConfig:a3];
        break;
      case 2600:
LABEL_9:
        [(WCM_CellularController *)self handleNetworkConfig:a3];
        break;
      default:
LABEL_29:
        +[WCM_Logging logLevel:0, @"Cellular Controller dropping message %llu", uint64 message];
        break;
    }
  }
  else
  {
    switch(uint64)
    {
      case 300:
        goto LABEL_9;
      case 301:
        [(WCM_CellularController *)self handleTxPower:a3];
        return;
      case 302:
        CFStringRef v6 = @"Just ignore WCMCellularLinkQuality for now";
        goto LABEL_20;
      case 303:
        [(WCM_CellularController *)self handleThresholdEvent:a3];
        return;
      case 304:
        +[WCM_Logging logLevel:0 message:@"BB Reset & Now Ready - Reset Coex Policies"];
        [(WCM_CellularController *)self handlePowerState:1];
        return;
      case 305:
        CFStringRef v6 = @"Just ignore WCMCellularScanFreqBandFilter for now";
LABEL_20:
        +[WCM_Logging logLevel:3 message:v6];
        break;
      default:
        goto LABEL_29;
    }
  }
}

- ($4F6D63EF3A0924A93BB4743A6BF1AEF7)getActiveULCAConfig
{
  return ($4F6D63EF3A0924A93BB4743A6BF1AEF7 *)((char *)[(WCM_CellularController *)self activeConfig] + 144);
}

- ($98FD36134D1A88AC5AB3433CBDAD69ED)activeConfig
{
  return *($98FD36134D1A88AC5AB3433CBDAD69ED **)((char *)&self->_wifiTxPowerdBm + 4);
}

- (unint64_t)updateGPSStateBit:(unint64_t)a3
{
  +[WCM_Logging logLevel:3 message:@"DLDebug_ GPS State Always Set Feature --- updateGPSStateBit function called."];
  id v5 = +[WCM_PolicyManager singleton];
  if (objc_msgSend(objc_msgSend(v5, "activeCoexFeatures"), "containsObject:", @"AntennaTunningForGps")&& objc_msgSend(objc_msgSend(v5, "activeCoexFeatures"), "containsObject:", @"AlwaysSetGPSState"))
  {
    unsigned int v6 = [v5 gpsRadioActive];
    unint64_t v7 = [(WCM_CellularController *)self wci2CoexPolicyBitmap];
    if (v6)
    {
      a3 |= 0x8000uLL;
      +[WCM_Logging logLevel:3, @"DLDebug_ GPS State Always Set Feature --- GPS Active with old bitmap %lld, new bitmap %lld", v7, a3 message];
    }
    else
    {
      a3 &= ~0x8000uLL;
      +[WCM_Logging logLevel:3, @"DLDebug_ GPS State Always Set Feature --- GPS inactive with old bitmap %lld, new bitmap %lld", v7, a3 message];
    }
  }
  else if (objc_msgSend(objc_msgSend(v5, "activeCoexFeatures"), "containsObject:", @"AntennaTunningForGps")&& objc_msgSend(v5, "gpsRadioActive"))
  {
    a3 |= 0x8000uLL;
  }
  return a3;
}

- (void)handleNetworkConfig:(id)a3
{
  +[WCM_Logging logLevel:3, @"WCM_CellularController handleNetworkConfig message %@", a3 message];
  if ([+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton").activeCoexFeatures containsObject:@"Bb20EndcSupport"])[-[WCM_CellularController handleNetworkConfig_bb20:](self, "handleNetworkConfig_bb20:", a3);
  else
  }
    [(WCM_CellularController *)self handleNetworkConfig_legacy:a3];
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"charging_desense"))
  {
    +[WCM_Logging logLevel:3, @" FCharging handleNetworkConfig Message recieved. low band in report %d", self->_sensorInfo.usecase[2] message];
    uint64_t v5 = self->_sensorInfo.usecase[2];
    [(WCM_CellularController *)self fastChargingHandler:v5];
  }
}

- (BOOL)btClkAlgnFlag
{
  return *(unsigned char *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 105);
}

- (void)updateBBRC1Params:(BOOL)a3 channel:(unint64_t)a4 duration:(unint64_t)a5 priority:(unsigned int)a6
{
  BOOL v7 = a4 == 5;
  if (!v7 || !a3) {
    a5 = 0;
  }
  if (v7 && a3) {
    uint64_t v9 = a6;
  }
  else {
    uint64_t v9 = 8;
  }
  if ([(WCM_CellularController *)self rc1duration] == a5)
  {
    +[WCM_Logging logLevel:3, @"Already set rc1 duration to (%ld)", a5 message];
  }
  else
  {
    unint64_t v10 = (unsigned __int16)a5 | 0x10000;
    if (v9 != 8) {
      unint64_t v10 = a5;
    }
    if ((v9 & 2) != 0) {
      uint64_t v11 = (unsigned __int16)a5 | 0x3200000;
    }
    else {
      uint64_t v11 = v10;
    }
    [(WCM_CellularController *)self setRC1Duration:v11];
  }
  if ([(WCM_CellularController *)self rc1priority] == v9)
  {
    +[WCM_Logging logLevel:3, @"Already set LAA Params to rc1priority to  (%ld)", v9 message];
  }
  else
  {
    [(WCM_CellularController *)self setLAACoexConfig:v9];
  }
}

- (void)sendBBCoexSensorMessage:(int)a3 band:(unsigned __int8)a4 usecase:(unsigned __int8)a5
{
  unsigned int v5 = a5;
  unsigned int v6 = a4;
  uint64_t v7 = *(void *)&a3;
  [[[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") platformManager] wrmPlatformId];
  xpc_object_t v21 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t value = xpc_uint64_create(v7);
  xpc_object_t v9 = xpc_array_create(0, 0);
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t xarray = xpc_array_create(0, 0);
  v20 = self;
  uint64_t v11 = (char *)&self->_cellularInstance1.primarydlBandwidth + 4;
  v12 = &v11[v7];
  unsigned int v14 = v12[4];
  id v13 = v12 + 4;
  +[WCM_Logging logLevel:4, @"BB21: Requests to send sensor info st %d band %d uc %d to BB %d %d", v7, v6, v5, v11[v7], v14 message];
  if (v11[v7] != v6 || (*v13 != v5 ? (BOOL v15 = v6 == 0) : (BOOL v15 = 1), !v15))
  {
    v11[v7] = v6;
    *id v13 = v5;
    xpc_object_t v16 = xpc_uint64_create(v6);
    xpc_array_append_value(v9, v16);
    xpc_object_t v17 = xpc_uint64_create(v5);
    xpc_array_append_value(v9, v17);
    xpc_dictionary_set_value(v10, "kWCMCellularTransparentMessage_Type", value);
    xpc_dictionary_set_value(v10, "kWCMCellularTransparentMessage_ByteList", v9);
    xpc_array_append_value(xarray, v10);
    xpc_dictionary_set_value(v21, "kWCMCellularTransparentMessageInformationSet", xarray);
    [(WCM_CellularController *)v20 sendMessage:1223 withArgs:v21];
    if (xpc_array_get_count(v9))
    {
      size_t v18 = 0;
      do
      {
        xpc_object_t v19 = xpc_array_get_value(v9, v18);
        xpc_release(v19);
        ++v18;
      }
      while (xpc_array_get_count(v9) > v18);
    }
  }
  xpc_release(v10);
  xpc_release(value);
  xpc_release(v21);
  xpc_release(xarray);

  xpc_release(v9);
}

- (void)handleNetworkConfig_bb20:(id)a3
{
  xpc_object_t xdict = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (!xdict) {
    return;
  }
  id v5 = +[WCM_PolicyManager singleton];
  unsigned int v6 = &self->super.mProcessId + 1;
  if ([(WCM_CellularController *)self activeSubId]) {
    unsigned int v6 = (int *)&self->_cellularInstance0.primarydlBandwidth + 1;
  }
  double v7 = *((double *)v6 + 3);
  double v8 = *((double *)v6 + 5);
  double v9 = *((double *)v6 + 6);
  double v10 = *((double *)v6 + 7);
  double v89 = *((double *)v6 + 8);
  double v11 = *((double *)v6 + 9);
  double v90 = *((double *)v6 + 10);
  double v91 = *((double *)v6 + 4);
  unint64_t v12 = [(WCM_CellularController *)self activeSubId];
  uint64_t v87 = *((void *)v6 + 11);
  id v88 = (id)v12;
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kSubId");
  if (!xpc_dictionary_get_count(xdict)) {
    +[WCM_Logging logLevel:3, @"SUB%ld: goes out of interested frequency bands", uint64 message];
  }
  unsigned int v14 = &self->super.mProcessId + 1;
  uint64_t v96 = uint64;
  if (uint64) {
    unsigned int v14 = (int *)&self->_cellularInstance0.primarydlBandwidth + 1;
  }
  *((void *)v14 + 12) = 0;
  *((_OWORD *)v14 + 4) = 0u;
  *((_OWORD *)v14 + 5) = 0u;
  *((_OWORD *)v14 + 2) = 0u;
  *((_OWORD *)v14 + 3) = 0u;
  *((_OWORD *)v14 + 1) = 0u;
  *((double *)v14 + 3) = (double)xpc_dictionary_get_int64(xdict, "kWCMCellularNetworkConfiguration_ULBandInfo_CenterFreq");
  *((double *)v14 + 4) = xpc_dictionary_get_double(xdict, "kWCMCellularNetworkConfiguration_ULBandInfo_BandWidth");
  *((double *)v14 + 5) = (double)xpc_dictionary_get_int64(xdict, "kWCMCellularNetworkConfiguration_DLBandInfo_CenterFreq");
  *((double *)v14 + 6) = xpc_dictionary_get_double(xdict, "kWCMCellularNetworkConfiguration_DLBandInfo_BandWidth");
  *((void *)v14 + 11) = xpc_dictionary_get_int64(xdict, "kWCMCellularNetworkConfiguration_TTDUL_DL");
  *((void *)v14 + 12) = xpc_dictionary_get_int64(xdict, "kWCMCellularNetworkConfiguration_SubFrameFormat");
  *((void *)v14 + 2) = xpc_dictionary_get_int64(xdict, "kWCMCellularNetworkConfiguration_FrameOffset");
  *((_OWORD *)v14 + 9) = *(_OWORD *)(v14 + 6);
  BOOL v15 = v14 + 36;
  *((_WORD *)v14 + 52) = 0;
  *((void *)v14 + 306) = 1;
  *((_OWORD *)v14 + 10) = *(_OWORD *)(v14 + 10);
  v14[44] = *((void *)v14 + 17);
  [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") setWcmCellularWCI2Mode_Ext_Enable:1];
  [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") setWcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap:0];
  [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") setWcmCellularCCSetToBB:0];
  +[WCM_Logging logLevel:message:](WCM_Logging, @"ULCA handleNetworkConfig-1-ULCA critical bitmap %d", [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") wcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap]);
  if (*((double *)v14 + 5) != 0.0) {
    +[WCM_Logging logLevel:5, @"SUB%ld:  ULCA Logging -  case kWCMCellularNetworkConfiguration_ULBandInfo_CenterFreq UL-(freq=%lf bw=%lf)  DL(freq=%lf, bw=%lf) ", uint64, *((void *)v14 + 18), *((void *)v14 + 19), *((void *)v14 + 20), *((void *)v14 + 21) message];
  }
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472;
  applier[2] = sub_10000851C;
  applier[3] = &unk_100210EB8;
  applier[4] = uint64;
  applier[5] = v14;
  xpc_object_t v16 = xdict;
  xpc_dictionary_apply(xdict, applier);
  xpc_object_t value = xpc_dictionary_get_value(xdict, "kWCMCellularNetworkConfiguration_TDSCDMABandInformationSet");
  if (value)
  {
    xpc_object_t v99 = 0;
    xpc_object_t v100 = 0;
    unsigned int v108 = 0;
    int v17 = 2;
LABEL_20:
    v14[32] = v17;
    goto LABEL_21;
  }
  xpc_object_t value = xpc_dictionary_get_value(xdict, "kWCMCellularNetworkConfiguration_GSMBandInformationSet");
  if (value)
  {
    xpc_object_t v99 = 0;
    xpc_object_t v100 = 0;
    unsigned int v108 = 0;
    int v17 = 4;
    goto LABEL_20;
  }
  xpc_object_t value = xpc_dictionary_get_value(xdict, "kWCMCellularNetworkConfiguration_ONEXBandInformationSet");
  if (value)
  {
    xpc_object_t v99 = 0;
    xpc_object_t v100 = 0;
    unsigned int v108 = 0;
    int v17 = 8;
    goto LABEL_20;
  }
  xpc_object_t value = xpc_dictionary_get_value(xdict, "kWCMCellularNetworkConfiguration_HDRBandInformationSet");
  if (value)
  {
    xpc_object_t v99 = 0;
    xpc_object_t v100 = 0;
    unsigned int v108 = 0;
    int v17 = 16;
    goto LABEL_20;
  }
  xpc_object_t value = xpc_dictionary_get_value(xdict, "kWCMCellularNetworkConfiguration_WCDMABandInformationSet");
  if (value)
  {
    xpc_object_t v99 = 0;
    xpc_object_t v100 = 0;
    unsigned int v108 = 0;
    int v17 = 32;
    goto LABEL_20;
  }
  xpc_object_t v85 = xpc_dictionary_get_value(xdict, "kWCMCellularNetworkConfiguration_LTEBandInformationSet");
  if (v85) {
    xpc_object_t value = xpc_dictionary_get_value(xdict, "kWCMCellularNetworkConfiguration_LTEBandInformationSet");
  }
  else {
    xpc_object_t value = 0;
  }
  xpc_object_t v86 = xpc_dictionary_get_value(xdict, "kWCMCellularNetworkConfiguration_NGCBandInformationSet");
  if (v86) {
    xpc_object_t value = xpc_dictionary_get_value(xdict, "kWCMCellularNetworkConfiguration_NGCBandInformationSet");
  }
  +[WCM_Logging logLevel:4, @"BB20 NGC Bandinfo present lte %d NGC %d ", v85 != 0, v86 != 0 message];
  if (!v86 && v85)
  {
    v14[32] = 1;
    xpc_object_t v16 = xdict;
    xpc_object_t v99 = 0;
    xpc_object_t v100 = xpc_dictionary_get_value(xdict, "kWCMCellularNetworkConfiguration_LTEBandInformationSet");
LABEL_169:
    unsigned int v108 = 0;
    goto LABEL_21;
  }
  if (!v85 && v86)
  {
    v14[32] = 64;
    xpc_object_t v16 = xdict;
    xpc_object_t v99 = xpc_dictionary_get_value(xdict, "kWCMCellularNetworkConfiguration_NGCBandInformationSet");
    xpc_object_t v100 = 0;
    goto LABEL_169;
  }
  if (v85 == 0 || v86 == 0)
  {
    v14[32] = 127;
    +[WCM_Logging logLevel:4 message:@"SUB%ld: Band Info parsing second pass result -- unknown band info set"];
    xpc_object_t v99 = 0;
    xpc_object_t v100 = 0;
    unsigned int v108 = 0;
    xpc_object_t v16 = xdict;
  }
  else
  {
    xpc_object_t v16 = xdict;
    xpc_object_t v100 = xpc_dictionary_get_value(xdict, "kWCMCellularNetworkConfiguration_LTEBandInformationSet");
    xpc_object_t v99 = xpc_dictionary_get_value(xdict, "kWCMCellularNetworkConfiguration_NGCBandInformationSet");
    unsigned int v108 = 1;
  }
LABEL_21:
  int v18 = v14[32];
  v93 = self;
  v92 = &self->super.mProcessId + 1;
  if (v18 != 1 && v18 != 64)
  {
    if ((v108 & 1) == 0)
    {
      if (v18 == 127) {
        goto LABEL_119;
      }
      xpc_object_t v97 = 0;
      xpc_object_t v98 = 0;
      goto LABEL_67;
    }
LABEL_28:
    +[WCM_Logging logLevel:4 message:@"BB20 bandinfotype is ENDC"];
    if (xpc_dictionary_get_value(v16, "kWCMCellularNetworkConfiguration_LTECarrierInformationSet")) {
      xpc_object_t v98 = xpc_dictionary_get_value(v16, "kWCMCellularNetworkConfiguration_LTECarrierInformationSet");
    }
    else {
      xpc_object_t v98 = 0;
    }
    if (xpc_dictionary_get_value(v16, "kWCMCellularNetworkConfiguration_NGCCarrierInformationSet")) {
      xpc_object_t v97 = xpc_dictionary_get_value(v16, "kWCMCellularNetworkConfiguration_NGCCarrierInformationSet");
    }
    else {
      xpc_object_t v97 = 0;
    }
    unsigned int v22 = 0;
    size_t count = 0;
    if (v98 && v97 && v100)
    {
      size_t v24 = 0;
      size_t v25 = 0;
      size_t v26 = 0;
      if (v99)
      {
        +[WCM_Logging logLevel:4 message:@"BB20 carrierIdInformation for LTE and NR Present"];
        size_t count = xpc_array_get_count(v98);
        size_t v24 = xpc_array_get_count(v97);
        size_t v25 = xpc_array_get_count(v100);
        size_t v26 = xpc_array_get_count(v99);
        if (v25) {
          BOOL v27 = count == 0;
        }
        else {
          BOOL v27 = 1;
        }
        unsigned int v22 = !v27 && v25 == count && v26 == v24 && v26 != 0 && v24 != 0;
      }
    }
    else
    {
      size_t v24 = 0;
      size_t v25 = 0;
      size_t v26 = 0;
    }
    +[WCM_Logging logLevel:2, @"BB20 Band and Carrier Info counts for lte and NR, parseCondition, with valid xpc container %d %d %d %d %d", v25, count, v26, v24, v22 message];
    if (!v22) {
      goto LABEL_119;
    }
LABEL_67:
    xpc_object_t xarray = 0;
    goto LABEL_79;
  }
  if (v108) {
    goto LABEL_28;
  }
  if (v18 == 1 && xpc_dictionary_get_value(v16, "kWCMCellularNetworkConfiguration_LTECarrierInformationSet")) {
    xpc_object_t xarray = xpc_dictionary_get_value(v16, "kWCMCellularNetworkConfiguration_LTECarrierInformationSet");
  }
  else {
    xpc_object_t xarray = 0;
  }
  if (v14[32] == 64 && xpc_dictionary_get_value(v16, "kWCMCellularNetworkConfiguration_NGCCarrierInformationSet")) {
    xpc_object_t xarray = xpc_dictionary_get_value(v16, "kWCMCellularNetworkConfiguration_NGCCarrierInformationSet");
  }
  unsigned int v19 = 0;
  size_t v20 = 0;
  if (value)
  {
    size_t v21 = 0;
    if (xarray)
    {
      size_t v20 = xpc_array_get_count(xarray);
      size_t v21 = xpc_array_get_count(value);
      unsigned int v19 = 1;
    }
  }
  else
  {
    size_t v21 = 0;
  }
  if (v21) {
    BOOL v32 = v20 == 0;
  }
  else {
    BOOL v32 = 1;
  }
  if (v32) {
    unsigned int v19 = 0;
  }
  if (v21 == v20) {
    uint64_t v33 = v19;
  }
  else {
    uint64_t v33 = 0;
  }
  +[WCM_Logging logLevel:2, @"BB20 CarrierIdSet Bandinfotype %d Carrier count %d BandInfo Count %d parseCondition %d", v14[32], v20, v21, v33 message];
  if (v33)
  {
    xpc_object_t v97 = 0;
    xpc_object_t v98 = 0;
LABEL_79:
    size_t v34 = xpc_array_get_count(value);
    if ((v108 & objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"Bb20EndcSupport")) == 1)
    {
      size_t v35 = xpc_array_get_count(v100);
      size_t v36 = xpc_array_get_count(v99);
      size_t v37 = (v36 + v35);
      size_t v38 = v36;
      size_t v39 = v35;
    }
    else
    {
      size_t v38 = 0;
      size_t v39 = 0;
      size_t v37 = v34;
    }
    +[WCM_Logging logLevel:4, @"BB20 CarrierIdSet %d %d %d %d", v108, v37, v39, v38 message];
    if (v37)
    {
      size_t v40 = 0;
      char v104 = 0;
      int64_t v41 = 0;
      char v94 = 0;
      char v101 = 0;
      unsigned int v106 = 0;
      unsigned int v42 = 0;
      uint64_t v43 = v37;
      size_t v105 = v39;
      uint64_t v95 = -(uint64_t)v39;
      while (v108)
      {
        if (v40 >= v105)
        {
          int64_t int64 = xpc_array_get_int64(v97, v95 + v40);
          xpc_object_t v59 = xpc_array_get_value(v99, v95 + v40);
          xpc_object_t v45 = v59;
          v14[32] = 64;
          if ((v104 & 1) == 0) {
            unsigned int v42 = v106;
          }
          char v104 = 1;
          int64_t v41 = int64;
          if (!v59) {
            goto LABEL_117;
          }
          goto LABEL_96;
        }
        int64_t v44 = xpc_array_get_int64(v98, v40);
        xpc_object_t v45 = xpc_array_get_value(v100, v40);
        v14[32] = 1;
        int64_t v41 = v44;
        if (v45) {
          goto LABEL_96;
        }
LABEL_117:
        if (v43 == ++v40) {
          goto LABEL_120;
        }
      }
      xpc_object_t v45 = xpc_array_get_value(value, v40);
      int v46 = v14[32];
      if (v46 == 64 || v46 == 1) {
        int64_t v41 = xpc_array_get_int64(xarray, v40);
      }
      if (!v45) {
        goto LABEL_117;
      }
LABEL_96:
      uint64_t v48 = xpc_dictionary_get_uint64(v45, "kWCMCellularNetworkConfiguration_BandInfoSet_DirectionMask");
      int64_t v49 = xpc_dictionary_get_int64(v45, "kWCMCellularNetworkConfiguration_BandInfoSet_CenterFreq");
      double v50 = xpc_dictionary_get_double(v45, "kWCMCellularNetworkConfiguration_BandInfoSet_Bandwidth");
      double v51 = v50;
      v52 = "unknown";
      if (v48 == 2) {
        v52 = "downlink";
      }
      if (v48 == 1) {
        v52 = "uplink";
      }
      +[WCM_Logging logLevel:5, @"directionMask(%d:%s) centerFreq(%ld) bandwidth(%lf) carrierId(%d) index(%d)", v48, v52, v49, *(void *)&v50, v41, v40 message];
      if (v49 >= 1)
      {
        if (v48 == 1)
        {
          double v53 = (double)v49 / 1000.0;
          double v54 = v51 / 1000000.0;
          uint64_t v55 = 6;
          if (v101) {
            uint64_t v55 = 14;
          }
          uint64_t v56 = 16;
          if ((v101 & 1) == 0) {
            uint64_t v56 = 8;
          }
          *(double *)&v14[v55] = v53;
          *(double *)&v14[v56] = v54;
          v57 = &v15[18 * v42];
          *(double *)v57 = v53;
          *((double *)v57 + 1) = v54;
          v57[16] = v14[32];
          v57[8] = v41;
          ++v42;
          char v101 = 1;
        }
        else if (v48 == 2)
        {
          double v60 = (double)v49 / 1000.0;
          double v61 = v51 / 1000000.0;
          uint64_t v62 = 10;
          if (v94) {
            uint64_t v62 = 18;
          }
          uint64_t v63 = 12;
          if (v94) {
            uint64_t v63 = 20;
          }
          *(double *)&v14[v62] = v60;
          *(double *)&v14[v63] = v61;
          v64 = &v15[18 * v106];
          *((double *)v64 + 2) = v60;
          *((double *)v64 + 3) = v61;
          v64[16] = v14[32];
          ++v106;
          char v94 = 1;
        }
      }
      goto LABEL_117;
    }
  }
LABEL_119:
  unsigned int v106 = 0;
LABEL_120:
  if (*((unsigned char *)v14 + 104))
  {
    int64_t v65 = xpc_dictionary_get_int64(xdict, "kWCMCellularNetworkConfiguration_ULCPConfig");
    int64_t v66 = xpc_dictionary_get_int64(xdict, "kWCMCellularNetworkConfiguration_DLCPConfig");
    v68 = v5;
    v67 = v93;
    v69 = WRM_MotionController;
    v70 = v92;
    if (*((double *)v14 + 3) != 0.0)
    {
      int64_t v71 = v66;
      +[WCM_Logging logLevel:5, @"SUB%lld: RRC-connected cell notification ULCP(%lld -> %lld) DLCP(%lld -> %lld)", v96, *(void *)v14, v65, *((void *)v14 + 1), v66 message];
      if (v65 != 255) {
        *(void *)unsigned int v14 = v65;
      }
      if (v71 != 255) {
        *((void *)v14 + 1) = v71;
      }
    }
  }
  else
  {
    *(void *)unsigned int v14 = 0;
    *((void *)v14 + 1) = 0;
    v68 = v5;
    v67 = v93;
    v69 = WRM_MotionController;
    v70 = v92;
  }
  uint64_t v72 = *((void *)v14 + 3);
  uint64_t v73 = *((void *)v14 + 4);
  *((void *)v14 + 338) = v72;
  *((void *)v14 + 339) = v73;
  uint64_t v74 = *((void *)v14 + 5);
  uint64_t v75 = *((void *)v14 + 6);
  *((void *)v14 + 340) = v74;
  *((void *)v14 + 341) = v75;
  +[WCM_Logging logLevel:5, @"SUB%lld: Network Config UL(freq=%lf bw=%lf) UL2(freq=%lf bw=%lf) DL(freq=%lf, bw=%lf) DL2(freq=%lf bw=%lf) TDD ULDLConfig=%lld, SFF=%lld ULCP=%lld DLCP=%lld FrameOffset=%lld", v96, v72, v73, *((void *)v14 + 7), *((void *)v14 + 8), v74, v75, *((void *)v14 + 9), *((void *)v14 + 10), *((void *)v14 + 11), *((void *)v14 + 12), *(void *)v14, *((void *)v14 + 1), *((void *)v14 + 2) message];
  *((void *)v14 + 306) = v106;
  *((unsigned char *)v14 + 2692) = 0;
  +[WCM_Logging logLevel:4 message:@"-------- ULCA Logging   ----------"];
  +[WCM_Logging logLevel:4 message:@"-------- ULCA Config   ----------"];
  +[WCM_Logging logLevel:4, @"Total valid entries =%d", v14[612] message];
  if (v14[612])
  {
    unint64_t v76 = 0;
    do
    {
      +[WCM_Logging logLevel:5, @"Entry index %ld ..UL(freq=%lf bw=%lf) DL(freq=%lf, bw=%lf), carrierid(%d), bandInfoType(%d)", v76++, *(void *)v15, *((void *)v15 + 1), *((void *)v15 + 2), *((void *)v15 + 3), v15[8], v15[16] message];
      v15 += 18;
    }
    while (v76 < v14[612]);
  }
  [(WCM_CellularController *)v67 setActiveSubId:[(WCM_CellularController *)v67 subSelector]];
  if ([(WCM_CellularController *)v67 activeSubId]) {
    v70 = (int *)&v67->_cellularInstance0.primarydlBandwidth + 1;
  }
  [(WCM_CellularController *)v67 setActiveConfig:v70];
  [v68 evaluateULCARestrictions];
  uint64_t v77 = v70[613];
  v78 = &v70[18 * (int)v77 + 36];
  long long v79 = *(_OWORD *)v78;
  *(_OWORD *)(v70 + 10) = *((_OWORD *)v78 + 1);
  *(_OWORD *)(v70 + 6) = v79;
  +[WCM_Logging logLevel:4, @"DLDebug_ CC2UnitTest: After ULCA evaluation, CC1 (cellularConfig->activeULCAConfig.criticalCarrier) = %d, CC2 (cellularConfig->activeULCAConfig.criticalCarrieridxWiFiVictim)=%d, CCn79 (cellularConfig->activeULCAConfig.criticalCarrieridxNR79) = %d", v77, v70[614], v70[615] message];
  +[WCM_Logging logLevel:4 message:@"-------- ULCA After coex valuation   ----------"];
  +[WCM_Logging logLevel:5, @"Critical carrier found = %d, index = %d", *((unsigned __int8 *)v70 + 2692), v70[613] message];
  uint64_t v80 = (uint64_t)&v70[18 * v70[613] + 36];
  +[WCM_Logging logLevel:5, @"Critical Carrier UL(freq=%lf bw=%lf) DL(freq=%lf, bw=%lf), bandInfoType=%d", *(void *)v80, *(void *)(v80 + 8), *(void *)(v80 + 16), *(void *)(v80 + 24), *(unsigned int *)(v80 + 64) message];
  +[WCM_Logging logLevel:5, @"ULCA Final Frequencies for COEX consideration :- SUB%lld: Network Config UL(freq=%lf bw=%lf) DL(freq=%lf, bw=%lf)  TDD ULDLConfig=%lld, SFF=%lld ULCP=%lld DLCP=%lld FrameOffset=%lld", v96, *((void *)v70 + 3), *((void *)v70 + 4), *((void *)v70 + 5), *((void *)v70 + 6), *((void *)v70 + 11), *((void *)v70 + 12), *(void *)v70, *((void *)v70 + 1), *((void *)v70 + 2) message];
  +[WCM_Logging logLevel:4 message:@"-------- ULCA Logging END  ----------"];
  [objc_msgSend(&v69[83], "singleton") setWcmCellularWCI2Mode_Ext_Enable:1];
  [objc_msgSend(&v69[83], "singleton") setWcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap:v70[18 * v70[613] + 44]];
  [objc_msgSend(&v69[83], "singleton") setWcmCellularWCI2Mode_CC2:v70[18 * v70[614] + 44]];
  [objc_msgSend(&v69[83], "singleton") setWcmCellular_CC1_Tech:v70[18 * v70[613] + 52]];
  [objc_msgSend(&v69[83], "singleton") setWcmCellular_CC2_Tech:v70[18 * v70[614] + 52]];
  +[WCM_Logging logLevel:message:](WCM_Logging, 5, @"wcmCellular_CC1_Tech = %llu, wcmCellular_CC2_Tech = %llu", [objc_msgSend(&v69[83], "singleton") wcmCellular_CC1_Tech], [objc_msgSend(&v69[83], "singleton") wcmCellular_CC2_Tech]);
  +[WCM_Logging logLevel:message:](WCM_Logging, @"ULCA handleNetworkConfig-3-ULCA critical bitmap / carrierId %lld", objc_msgSend(objc_msgSend(&v69[83], "singleton"), "wcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap"));
  [objc_msgSend(&v69[83], "singleton") setWcmCellularCCSetToBB:0];
  [(WCM_CellularController *)v67 submitAWDMetricsforNetworkConfiguration];
  double v81 = *((double *)v70 + 5);
  if (v81 == 0.0 || v8 != 0.0 && v81 != v8)
  {
    *((void *)v70 + 14) = 0;
    *((void *)v70 + 15) = 0;
  }
  double v82 = *((double *)v70 + 3);
  if (v82 != 0.0)
  {
    uint64_t v83 = *((void *)v70 + 4);
    *((double *)v70 + 14) = v82;
    *((void *)v70 + 15) = v83;
  }
  if (objc_msgSend(objc_msgSend(objc_msgSend(&v69[83], "singleton"), "activeCoexFeatures"), "containsObject:", @"CellularNWCfgCmdFilter")&& (objc_msgSend(objc_msgSend(objc_msgSend(&v69[83], "singleton"), "activeCoexFeatures"), "containsObject:", @"EnableULCA") & 1) == 0)
  {
    if (v8 == *((double *)v70 + 5)
      && v7 == *((double *)v70 + 3)
      && v11 == *((double *)v70 + 9)
      && v10 == *((double *)v70 + 7)
      && v9 == *((double *)v70 + 6)
      && v91 == *((double *)v70 + 4)
      && v90 == *((double *)v70 + 10)
      && v89 == *((double *)v70 + 8)
      && v88 == (id)[(WCM_CellularController *)v67 activeSubId]
      && v87 == *((void *)v70 + 11))
    {
      +[WCM_Logging logLevel:2 message:@"NW Config Parameters are the same, hence ignoring the network config command"];
      return;
    }
    +[WCM_Logging logLevel:2 message:@"NW Config Parameters are NOT the same, hence handling the network config command"];
  }
  if (objc_msgSend(objc_msgSend(objc_msgSend(&v69[83], "singleton"), "activeCoexFeatures"), "containsObject:", @"ClkAlgnTDDFix"))
  {
    unsigned int v84 = [(WCM_CellularController *)v67 clkAlgnTDDFreqCheck];
    *((unsigned char *)v70 + 105) = v84;
    +[WCM_Logging logLevel:4, @"clkAlgnTDDFreqCheck: After sorting over all cells, setting cellularConfig->btClkAlgnFlag = %d", v84 message];
  }
  if (objc_msgSend(objc_msgSend(v68, "activeCoexFeatures"), "containsObject:", @"UseWCMAriDriver"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, @"Receive update of Cell Config, update critical caller, wcmCellularCCSetToBB = %d", objc_msgSend(objc_msgSend(&v69[83], "singleton"), "wcmCellularCCSetToBB"));
    [(WCM_CellularController *)v67 setAllCriticalCarriers];
  }
  [objc_msgSend(&v69[83], "singleton") updateControllerState:300];
}

- (unint64_t)getCoexTechForPolicy:(unint64_t)a3
{
  if ((uint64_t)a3 > 15)
  {
    switch(a3)
    {
      case 0x10uLL:
        return 4;
      case 0x20uLL:
        BOOL v6 = [(WCM_CellularController *)self activeSubId] == 0;
        unint64_t v3 = 8;
        unint64_t v7 = 5;
LABEL_16:
        if (v6) {
          return v7;
        }
        break;
      case 0x40uLL:
        unint64_t v5 = [(WCM_CellularController *)self activeSubId];
        unint64_t v3 = 10;
        if (v5) {
          return 11;
        }
        break;
      default:
        return 0;
    }
  }
  else
  {
    unint64_t v3 = 1;
    switch(a3)
    {
      case 1uLL:
        unint64_t v4 = [(WCM_CellularController *)self activeSubId];
        unint64_t v3 = 9;
        if (!v4) {
          unint64_t v3 = 0;
        }
        break;
      case 2uLL:
        return v3;
      case 4uLL:
        BOOL v6 = [(WCM_CellularController *)self activeSubId] == 0;
        unint64_t v3 = 6;
        unint64_t v7 = 2;
        goto LABEL_16;
      case 8uLL:
        unint64_t v3 = 3;
        break;
      default:
        return 0;
    }
  }
  return v3;
}

- (unint64_t)activeSubId
{
  return *(unint64_t *)((char *)&self->_activeConfig + 4);
}

- (void)setAllCriticalCarriers
{
  id v3 = +[WCM_PolicyManager singleton];
  unint64_t v4 = [[self getCoexTechForPolicy:objc_msgSend(v3, "wcmCellular_CC1_Tech")];
  unint64_t v5 = [[self getCoexTechForPolicy:objc_msgSend(v3, "wcmCellular_CC2_Tech")];
  BOOL v6 = [(WCM_CellularController *)self getActiveULCAConfig];
  if ([v3 wcmCellularCCSetToBB])
  {
    +[WCM_Logging logLevel:4 message:@"setAllCriticalCarriers: wcmCellularCCSetToBB = True, Critical carriers already set"];
    return;
  }
  +[WCM_Logging logLevel:4 message:@"setAllCriticalCarriers: wcmCellularCCSetToBB = False, Start to set critical carriers"];
  [WCM_Logging logLevel:4 message:@"setAllCriticalCarriers: previous CC1CarrierId = %llu, new CC1CarrierId = %llu" -[WCM_CellularController CC1CarrierId](self, "CC1CarrierId"), objc_msgSend(v3, "wcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap")];
  +[WCM_Logging logLevel:4, @"setAllCriticalCarriers: previous CC1Tech = %llu, new CC1Tech = %llu", [(WCM_CellularController *)self CC1Tech], v4 message];
  if (v6)
  {
    unint64_t v7 = &v6->var0[v6->var2];
    double var2 = v7->var2;
    double var3 = v7->var3;
    double v10 = &v6->var0[v6->var3];
    double v11 = v10->var2;
    double v12 = v10->var3;
  }
  else
  {
    double var2 = 0.0;
    double var3 = 0.0;
    double v11 = 0.0;
    double v12 = 0.0;
  }
  +[WCM_Logging logLevel:4, @"setAllCriticalCarriers: previous CC1Freq/BW = %f/%f, new CC1Freq/BW = %f/%f", qword_10027D150, qword_10027D158, *(void *)&var2, *(void *)&var3 message];
  id v13 = [(WCM_CellularController *)self CC1CarrierId];
  BOOL v14 = v13 != objc_msgSend(v3, "wcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap")
     || (void *)[(WCM_CellularController *)self CC1Tech] != v4;
  if (!objc_msgSend(objc_msgSend(v3, "activeCoexFeatures"), "containsObject:", @"UseWCMAriDriver"))
  {
    if (!v14) {
      goto LABEL_24;
    }
LABEL_23:
    -[WCM_CellularController setCriticalCarrier:forCarrierId:forTech:](self, "setCriticalCarrier:forCarrierId:forTech:", 1217, [v3 wcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap], v4);
    -[WCM_CellularController setCC1CarrierId:](self, "setCC1CarrierId:", [v3 wcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap]);
    [(WCM_CellularController *)self setCC1Tech:v4];
    int v15 = 1;
    goto LABEL_25;
  }
  if (*(double *)&qword_10027D150 != var2)
  {
    if (var2 == 0.0 || var3 == 0.0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (var3 != 0.0 && var2 != 0.0 && *(double *)&qword_10027D158 != var3)
  {
LABEL_21:
    qword_10027D150 = *(void *)&var2;
    qword_10027D158 = *(void *)&var3;
    goto LABEL_23;
  }
LABEL_22:
  qword_10027D150 = *(void *)&var2;
  qword_10027D158 = *(void *)&var3;
  if (v14) {
    goto LABEL_23;
  }
LABEL_24:
  +[WCM_Logging logLevel:4 message:@"setAllCriticalCarriers: not change in CC1, skip CC1"];
  int v15 = 0;
LABEL_25:
  [WCM_Logging logLevel:4 message:@"setAllCriticalCarriers: previous CC2CarrierId = %llu, new CC2CarrierId = %llu" -[WCM_CellularController CC2CarrierId](self, "CC2CarrierId"), objc_msgSend(v3, "wcmCellularWCI2Mode_CC2")];
  +[WCM_Logging logLevel:4, @"setAllCriticalCarriers: previous CC2Tech = %llu, new CC2Tech = %llu", [(WCM_CellularController *)self CC2Tech], v5 message];
  +[WCM_Logging logLevel:4, @"setAllCriticalCarriers: previous CC2Freq/BW = %f/%f, new CC2Freq/BW = %f/%f", qword_10027D160, qword_10027D168, *(void *)&v11, *(void *)&v12 message];
  id v16 = [(WCM_CellularController *)self CC2CarrierId];
  BOOL v17 = v16 != objc_msgSend(v3, "wcmCellularWCI2Mode_CC2")
     || (void *)[(WCM_CellularController *)self CC2Tech] != v5;
  if (!objc_msgSend(objc_msgSend(v3, "activeCoexFeatures"), "containsObject:", @"UseWCMAriDriver"))
  {
    if (!v17) {
      goto LABEL_41;
    }
LABEL_40:
    -[WCM_CellularController setCriticalCarrier:forCarrierId:forTech:](self, "setCriticalCarrier:forCarrierId:forTech:", 1218, [v3 wcmCellularWCI2Mode_CC2], v5);
    -[WCM_CellularController setCC2CarrierId:[v3 wcmCellularWCI2Mode_CC2]];
    [(WCM_CellularController *)self setCC2Tech:v5];
    int v18 = 1;
    goto LABEL_42;
  }
  if (*(double *)&qword_10027D160 != v11)
  {
    if (v11 == 0.0 || v12 == 0.0) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  if (v12 != 0.0 && *(double *)&qword_10027D168 != v12 && v11 != 0.0)
  {
LABEL_38:
    qword_10027D160 = *(void *)&v11;
    qword_10027D168 = *(void *)&v12;
    goto LABEL_40;
  }
LABEL_39:
  qword_10027D160 = *(void *)&v11;
  qword_10027D168 = *(void *)&v12;
  if (v17) {
    goto LABEL_40;
  }
LABEL_41:
  +[WCM_Logging logLevel:4 message:@"setAllCriticalCarriers: not change in CC2, skip CC2"];
  int v18 = 0;
LABEL_42:
  unsigned int v19 = [[objc_msgSend(v3, "activeCoexFeatures") containsObject:@"UseWCMAriDriver"];
  if ((v15 | v18) == 1 && v19)
  {
    xpc_object_t v20 = xpc_dictionary_create(0, 0, 0);
    [(WCM_CellularController *)self sendMessage:1234 withArgs:v20];
    xpc_release(v20);
  }

  [v3 setWcmCellularCCSetToBB:1];
}

- (unint64_t)CC2Tech
{
  return *(unint64_t *)((char *)&self->_CC1Tech + 4);
}

- (unint64_t)CC2CarrierId
{
  return *(unint64_t *)((char *)&self->_CC1CarrierId + 4);
}

- (unint64_t)CC1Tech
{
  return *(unint64_t *)((char *)&self->_CC2CarrierId + 4);
}

- (unint64_t)CC1CarrierId
{
  return *(unint64_t *)((char *)&self->_rc1duration + 4);
}

- (double)cachedULCenterFreq
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 112);
}

- (double)cachedULBandwidth
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 120);
}

- (double)dlCenterFreq
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 40);
}

- (double)dlBandwidth
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 48);
}

- (double)ulCenterFreq
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 24);
}

- (double)ulBandwidth
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 32);
}

- (BOOL)tddBand
{
  return *(unsigned char *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 104);
}

- (void)sacHandleDesenseNetworkConfig:(id)a3
{
  id v5 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") sacManager];
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kSubId");
  if ([+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") activeCoexFeatures].containsObject(@"SacPolicySupport"))BOOL v7 = v5 == 0; {
  else
  }
    BOOL v7 = 1;
  if (v7)
  {
    if (!v5) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  unsigned __int8 v8 = [v5 isTestMode];
  if (v8)
  {
LABEL_9:
    if ([v5 isTestMode])
    {
      CFStringRef v9 = @" SAC Manager is in FrequencyTool Test mode, ignoring desense network config message";
LABEL_12:
      +[WCM_Logging logLevel:3 message:v9];
      return;
    }
LABEL_11:
    CFStringRef v9 = @" SAC Manager is not enabled, ignoring desense network config message";
    goto LABEL_12;
  }
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (!value)
  {
    CFStringRef v9 = @"SAC - nwConfig is NULL return";
    goto LABEL_12;
  }
  double v11 = value;
  +[WCM_Logging logLevel:3, @"SAC - total count is %d", xpc_dictionary_get_count(value) message];
  xpc_object_t v12 = xpc_dictionary_get_value(v11, "kWCMCellular_DesenseFreqReport_UplinkFrequency");
  if (v12) {
    CFStringRef v13 = @"SAC kWCMCellular_DesenseFreqReport_UplinkFrequency found, set subId=%d to active";
  }
  else {
    CFStringRef v13 = @"SAC kWCMCellular_DesenseFreqReport_UplinkFrequency is NULL, set subId=%d to inactive";
  }
  [v5 sacSetCellularSubActiveState:v12 != 0 onSubId:uint64];
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, v13, uint64);
  xpc_object_t v14 = xpc_dictionary_get_value(v11, "kWCMCellular_DesenseFreqReport_DownlinkFrequency");
  if (v14)
  {
    xpc_object_t v15 = v14;
    +[WCM_Logging logLevel:3, @"SAC kWCMCellular_DesenseFreqReport_DownlinkFrequency - total count is %d", xpc_array_get_count(v14) message];
    id v16 = objc_alloc_init((Class)NSMutableArray);
    [(WCM_CellularController *)self sacExtractDesenseFreq:v16 message:v15];
    [v5 sacUpdateCellularDownlinkFreqInfo:v16 onSubId:uint64];
  }
  else
  {
    +[WCM_Logging logLevel:3 message:@"SAC kWCMCellular_DesenseFreqReport_DownlinkFrequency is NULL"];
  }
  xpc_object_t v17 = xpc_dictionary_get_value(v11, "kWCMCellular_DesenseFreqReport_SearchFrequency");
  if (v17)
  {
    xpc_object_t v18 = v17;
    +[WCM_Logging logLevel:3, @"SAC kWCMCellular_DesenseFreqReport_SearchFrequency - total count is %d", xpc_array_get_count(v17) message];
    id v19 = objc_alloc_init((Class)NSMutableArray);
    [(WCM_CellularController *)self sacExtractDesenseFreq:v19 message:v18];
    [v5 sacUpdateCellularSearchFreqInfo:v19 onSubId:uint64];
  }
  else
  {
    +[WCM_Logging logLevel:3 message:@"SAC kWCMCellular_DesenseFreqReport_SearchFrequency is NULL"];
  }
  xpc_object_t v20 = xpc_dictionary_get_value(v11, "kWCMCellular_DesenseFreqReport_HoppingFrequency");
  if (v20)
  {
    xpc_object_t v21 = v20;
    +[WCM_Logging logLevel:3, @"SAC kWCMCellular_DesenseFreqReport_HoppingFrequency - total count is %d", xpc_array_get_count(v20) message];
    id v22 = objc_alloc_init((Class)NSMutableArray);
    [(WCM_CellularController *)self sacExtractDesenseFreq:v22 message:v21];
    [v5 sacUpdateCellularHoppingFreqInfo:v22 onSubId:uint64];
  }
  else
  {
    +[WCM_Logging logLevel:3 message:@"SAC kWCMCellular_DesenseFreqReport_HoppingFrequency is NULL"];
  }
  xpc_object_t v23 = xpc_dictionary_get_value(v11, "kWCMCellular_DesenseFreqReport_NeighborFrequency");
  if (v23)
  {
    xpc_object_t v24 = v23;
    +[WCM_Logging logLevel:3, @"SAC kWCMCellular_DesenseFreqReport_NeighborFrequency - total count is %d", xpc_array_get_count(v23) message];
    id v25 = objc_alloc_init((Class)NSMutableArray);
    [(WCM_CellularController *)self sacExtractDesenseFreq:v25 message:v24];
    [v5 sacUpdateCellularNeighborFreqInfo:v25 onSubId:uint64];
  }
  else
  {
    +[WCM_Logging logLevel:3 message:@"SAC kWCMCellular_DesenseFreqReport_NeighborFrequency  is NULL"];
  }
  xpc_object_t v26 = xpc_dictionary_get_value(v11, "kWCMCellular_DesenseFreqReport_RplmnFrequency");
  if (v26)
  {
    xpc_object_t v27 = v26;
    +[WCM_Logging logLevel:3, @"SAC kWCMCellular_DesenseFreqReport_RplmnFrequency - total count is %d", xpc_array_get_count(v26) message];
    id v28 = objc_alloc_init((Class)NSMutableArray);
    [(WCM_CellularController *)self sacExtractDesenseFreq:v28 message:v27];
    [v5 sacUpdateCellularRPLMNFreqInfo:v28 onSubId:uint64];
  }
  else
  {
    +[WCM_Logging logLevel:3 message:@"SAC kWCMCellular_DesenseFreqReport_RplmnFrequency  is NULL"];
  }
  [v5 sacReportCellularVictimFreqListOnTargetSac:1 action:1];
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"SacPolicyJasperSupport"))
  {
    [v5 sacReportCellularVictimFreqListOnTargetSac:2 action:1];
  }
}

- (void)sacExtractDesenseFreq:(id)a3 message:(id)a4
{
  if (a3)
  {
    if (a4)
    {
      int64_t count = xpc_array_get_count(a4);
      if (count >= 1)
      {
        int64_t v7 = count;
        for (size_t i = 0; i != v7; ++i)
        {
          xpc_object_t value = xpc_array_get_value(a4, i);
          uint64_t uint64 = xpc_dictionary_get_uint64(value, "kWCMCellular_DesenseNetworkConfiguration_CenterFreq");
          int64_t int64 = xpc_dictionary_get_int64(value, "kWCMCellular_DesenseNetworkConfiguration_Bandwidth");
          +[WCM_Logging logLevel:3, @"   SAC Index %d - frequency %lld - bandwidth %lld ", i, uint64, int64 message];
          xpc_object_t v12 = [[FreqRangeInfo alloc] initWithFreq:uint64 Bw:int64];
          [a3 addObject:v12];
        }
      }
    }
  }
}

- (void)handleDesenseNetworkConfig:(id)a3
{
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"SacPolicySupport"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100024650;
    block[3] = &unk_10020DAB0;
    block[4] = self;
    block[5] = a3;
    dispatch_async([[WCM_PolicyManager singleton] sacManager].getQueue, block);
  }
  if (!objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"charging_desense"))
  {
    CFStringRef v13 = @" FCharging controller not enabled ignoring config message";
LABEL_12:
    +[WCM_Logging logLevel:3 message:v13];
    return;
  }
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (!value)
  {
    CFStringRef v13 = @"FCharging - nwConfig is NULL return";
    goto LABEL_12;
  }
  BOOL v6 = value;
  +[WCM_Logging logLevel:3, @"FCharging - total count is %d", xpc_dictionary_get_count(value) message];
  xpc_object_t v7 = xpc_dictionary_get_value(v6, "kWCMCellular_DesenseFreqReport_UplinkFrequency");
  if (v7)
  {
    unsigned __int8 v8 = v7;
    int64_t count = xpc_array_get_count(v7);
    +[WCM_Logging logLevel:3, @"FCharging kWCMCellular_DesenseFreqReport_UplinkFrequency - total count is %d", count message];
    if (count >= 1)
    {
      unint64_t v10 = count + 1;
      do
      {
        xpc_object_t v11 = xpc_array_get_value(v8, v10 - 2);
        uint64_t uint64 = xpc_dictionary_get_uint64(v11, "kWCMCellular_DesenseNetworkConfiguration_CenterFreq");
        +[WCM_Logging logLevel:3, @"FCharging Index %d - frequency %lld - bandwidth %lld ", v10 - 2, uint64, xpc_dictionary_get_int64(v11, "kWCMCellular_DesenseNetworkConfiguration_Bandwidth") message];
        --v10;
      }
      while (v10 > 1);
    }
  }
  else
  {
    +[WCM_Logging logLevel:3 message:@"FCharging kWCMCellular_DesenseFreqReport_UplinkFrequency - nwConfig is NULL"];
  }
  xpc_object_t v14 = xpc_dictionary_get_value(v6, "kWCMCellular_DesenseFreqReport_SearchFrequency");
  if (v14)
  {
    xpc_object_t v15 = v14;
    int64_t v16 = xpc_array_get_count(v14);
    +[WCM_Logging logLevel:3, @"FCharging kWCMCellular_DesenseFreqReport_SearchFrequency - total count is %d", v16 message];
    if (v16 < 1)
    {
      char v17 = 0;
    }
    else
    {
      char v17 = 0;
      unint64_t v18 = v16 + 1;
      do
      {
        xpc_object_t v19 = xpc_array_get_value(v15, v18 - 2);
        uint64_t v20 = xpc_dictionary_get_uint64(v19, "kWCMCellular_DesenseNetworkConfiguration_CenterFreq");
        int64_t int64 = xpc_dictionary_get_int64(v19, "kWCMCellular_DesenseNetworkConfiguration_Bandwidth");
        +[WCM_Logging logLevel:3, @"FCharging Index %d - frequency %lld - bandwidth %lld ", v18 - 2, v20, int64 message];
        if ((double)v20 / 1000000.0 + (double)int64 / 1000000.0 * 0.5 <= 960.0)
        {
          +[WCM_Logging logLevel:0, @"FCharging Low band Index %d - frequency %lld - bandwidth %lld ", v18 - 2, v20, int64 message];
          +[WCM_Logging logLevel:0 message:@"FCharging Low band detected"];
          char v17 = 1;
        }
        --v18;
      }
      while (v18 > 1);
    }
    char v22 = v17;
  }
  else
  {
    +[WCM_Logging logLevel:3 message:@"FCharging kWCMCellular_DesenseFreqReport_SearchFrequency - nwConfig is NULL"];
    char v22 = 0;
  }
  xpc_object_t v23 = xpc_dictionary_get_value(v6, "kWCMCellular_DesenseFreqReport_HoppingFrequency");
  if (v23)
  {
    xpc_object_t v24 = v23;
    int64_t v25 = xpc_array_get_count(v23);
    +[WCM_Logging logLevel:3, @"FCharging kWCMCellular_DesenseFreqReport_HoppingFrequency - total count is %d", v25 message];
    if (v25 >= 1)
    {
      unint64_t v26 = v25 + 1;
      do
      {
        xpc_object_t v27 = xpc_array_get_value(v24, v26 - 2);
        uint64_t v28 = xpc_dictionary_get_uint64(v27, "kWCMCellular_DesenseNetworkConfiguration_CenterFreq");
        int64_t v29 = xpc_dictionary_get_int64(v27, "kWCMCellular_DesenseNetworkConfiguration_Bandwidth");
        +[WCM_Logging logLevel:3, @"FCharging %d - frequency %lld - bandwidth %lld ", v26 - 2, v28, v29 message];
        if ((double)v28 / 1000000.0 + (double)v29 / 1000000.0 * 0.5 <= 960.0)
        {
          +[WCM_Logging logLevel:0, @"FCharging Low band Index %d - frequency %lld - bandwidth %lld ", v26 - 2, v28, v29 message];
          +[WCM_Logging logLevel:0 message:@"FCharging Low band detected"];
          char v22 = 1;
        }
        --v26;
      }
      while (v26 > 1);
    }
  }
  else
  {
    +[WCM_Logging logLevel:3 message:@"FCharging kWCMCellular_DesenseFreqReport_HoppingFrequency - nwConfig is NULL"];
  }
  xpc_object_t v30 = xpc_dictionary_get_value(v6, "kWCMCellular_DesenseFreqReport_NeighborFrequency");
  if (v30)
  {
    v31 = v30;
    int64_t v32 = xpc_array_get_count(v30);
    +[WCM_Logging logLevel:3, @"FCharging kWCMCellular_DesenseFreqReport_NeighborFrequency - total count is %d", v32 message];
    if (v32 >= 1)
    {
      unint64_t v33 = v32 + 1;
      do
      {
        xpc_object_t v34 = xpc_array_get_value(v31, v33 - 2);
        uint64_t v35 = xpc_dictionary_get_uint64(v34, "kWCMCellular_DesenseNetworkConfiguration_CenterFreq");
        int64_t v36 = xpc_dictionary_get_int64(v34, "kWCMCellular_DesenseNetworkConfiguration_Bandwidth");
        +[WCM_Logging logLevel:3, @"FCharging Index %d - frequency %lld - bandwidth %lld ", v33 - 2, v35, v36 message];
        if ((double)v35 / 1000000.0 + (double)v36 / 1000000.0 * 0.5 <= 960.0)
        {
          +[WCM_Logging logLevel:0, @"FCharging Low band Index %d - frequency %lld - bandwidth %lld ", v33 - 2, v35, v36 message];
          +[WCM_Logging logLevel:0 message:@"FCharging Low band detected"];
          char v22 = 1;
        }
        --v33;
      }
      while (v33 > 1);
    }
  }
  else
  {
    +[WCM_Logging logLevel:3 message:@"FCharging kWCMCellular_DesenseFreqReport_NeighborFrequency - nwConfig is NULL"];
  }
  xpc_object_t v37 = xpc_dictionary_get_value(v6, "kWCMCellular_DesenseFreqReport_RplmnFrequency");
  if (v37)
  {
    size_t v38 = v37;
    int64_t v39 = xpc_array_get_count(v37);
    +[WCM_Logging logLevel:3, @"FCharging kWCMCellular_DesenseFreqReport_RplmnFrequency - total count is %d", v39 message];
    if (v39 >= 1)
    {
      unint64_t v40 = v39 + 1;
      do
      {
        xpc_object_t v41 = xpc_array_get_value(v38, v40 - 2);
        uint64_t v42 = xpc_dictionary_get_uint64(v41, "kWCMCellular_DesenseNetworkConfiguration_CenterFreq");
        int64_t v43 = xpc_dictionary_get_int64(v41, "kWCMCellular_DesenseNetworkConfiguration_Bandwidth");
        +[WCM_Logging logLevel:3, @"FCharging Index %d - frequency %lld - bandwidth %lld ", v40 - 2, v42, v43 message];
        if ((double)v42 / 1000000.0 + (double)v43 / 1000000.0 * 0.5 <= 960.0)
        {
          +[WCM_Logging logLevel:0, @"FCharging Low band Index %d - frequency %lld - bandwidth %lld ", v40 - 2, v42, v43 message];
          +[WCM_Logging logLevel:0 message:@"FCharging Low band detected"];
          char v22 = 1;
        }
        --v40;
      }
      while (v40 > 1);
    }
  }
  else
  {
    +[WCM_Logging logLevel:3 message:@"FCharging kWCMCellular_DesenseFreqReport_RplmnFrequency - nwConfig is NULL"];
  }
  xpc_object_t v44 = xpc_dictionary_get_value(v6, "kWCMCellular_DesenseFreqReport_DownlinkFrequency");
  if (v44)
  {
    xpc_object_t v45 = v44;
    int64_t v46 = xpc_array_get_count(v44);
    +[WCM_Logging logLevel:3, @"FCharging kWCMCellular_DesenseFreqReport_DownlinkFrequency - total count is %d", v46 message];
    if (v46 >= 1)
    {
      unint64_t v47 = v46 + 1;
      do
      {
        xpc_object_t v48 = xpc_array_get_value(v45, v47 - 2);
        uint64_t v49 = xpc_dictionary_get_uint64(v48, "kWCMCellular_DesenseNetworkConfiguration_CenterFreq");
        int64_t v50 = xpc_dictionary_get_int64(v48, "kWCMCellular_DesenseNetworkConfiguration_Bandwidth");
        +[WCM_Logging logLevel:3, @"FCharging Index %d - frequency %lld - bandwidth %lld ", v47 - 2, v49, v50 message];
        +[WCM_Logging logLevel:3, @"FCharging Frequency Upper bound  %lf ", (double)v49 / 1000000.0 + (double)v50 / 1000000.0 * 0.5 message];
        if ((double)v49 / 1000000.0 + (double)v50 / 1000000.0 * 0.5 <= 960.0)
        {
          +[WCM_Logging logLevel:0, @"FCharging Low band Index %d - frequency %lld - bandwidth %lld ", v47 - 2, v49, v50 message];
          +[WCM_Logging logLevel:0 message:@"FCharging Low band detected"];
          char v22 = 1;
        }
        --v47;
      }
      while (v47 > 1);
    }
  }
  else
  {
    +[WCM_Logging logLevel:3 message:@"FCharging kWCMCellular_DesenseFreqReport_DownlinkFrequency - nwConfig is NULL"];
  }
  self->_sensorInfo.usecase[2] = v22 & 1;
  -[WCM_CellularController fastChargingHandler:](self, "fastChargingHandler:");
}

- (unint64_t)wci2CoexPolicyBitmap
{
  return *(int64_t *)((char *)&self->_rbThreshold + 4);
}

- (void)setRbThreshold:(int64_t)a3
{
  *(int64_t *)((char *)&self->_controllerTxPowerLimit + 4) = a3;
}

- (void)setActiveSubId:(unint64_t)a3
{
  *($98FD36134D1A88AC5AB3433CBDAD69ED **)((char *)&self->_activeConfig + 4) = ($98FD36134D1A88AC5AB3433CBDAD69ED *)a3;
}

- (void)setActiveConfig:(id *)a3
{
  *(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) = (unint64_t)a3;
}

- (int)rc1priority
{
  return self->_watchAntPrefBand;
}

- (unint64_t)rc1duration
{
  return *(unint64_t *)((char *)&self->_activeSubId + 4);
}

- (BOOL)clkAlgnTDDFreqCheck
{
  BOOL v3 = [(WCM_CellularController *)self tddBand];
  if (v3)
  {
    [(WCM_CellularController *)self ulCenterFreqWiFiVictim];
    uint64_t v5 = v4;
    [(WCM_CellularController *)self ulBandwidthWiFiVictim];
    uint64_t v7 = v6;
    [(WCM_CellularController *)self ulCenterFreqCellVictim];
    uint64_t v9 = v8;
    [(WCM_CellularController *)self ulBandwidthCellVictim];
    uint64_t v11 = v10;
    [(WCM_CellularController *)self ulCenterFreq];
    uint64_t v13 = v12;
    [(WCM_CellularController *)self ulBandwidth];
    +[WCM_Logging logLevel:4, @"clkAlgnTDDFreqCheck: ulCenterFreqWiFiVictim=%f, ulBandwidthWiFiVictim=%f, ulCenterFreqCellVictim=%f, ulBandwidthCellVictim=%f, ulCenterFreq=%f, ulBandwidth=%f.", v5, v7, v9, v11, v13, v14 message];
    [(WCM_CellularController *)self ulCenterFreqWiFiVictim];
    double v16 = v15;
    [(WCM_CellularController *)self ulBandwidthWiFiVictim];
    if (v16 + v17 * 0.5 <= 2370.0
      || ([(WCM_CellularController *)self ulCenterFreqWiFiVictim],
          double v19 = v18,
          [(WCM_CellularController *)self ulBandwidthWiFiVictim],
          v19 + v20 * -0.5 >= 2400.0))
    {
      [(WCM_CellularController *)self ulCenterFreqWiFiVictim];
      double v33 = v32;
      [(WCM_CellularController *)self ulBandwidthWiFiVictim];
      if (v33 + v34 * 0.5 <= 2496.0
        || ([(WCM_CellularController *)self ulCenterFreqWiFiVictim],
            double v36 = v35,
            [(WCM_CellularController *)self ulBandwidthWiFiVictim],
            v36 + v37 * -0.5 >= 2506.0))
      {
        +[WCM_Logging logLevel:4 message:@"clkAlgnTDDFreqCheck: Neither B40b nor B41A1. Return False."];
        LOBYTE(v3) = 0;
        return v3;
      }
      [(WCM_CellularController *)self ulCenterFreqWiFiVictim];
      uint64_t v39 = v38;
      [(WCM_CellularController *)self ulBandwidthWiFiVictim];
      uint64_t v41 = v40;
      [(WCM_CellularController *)self ulCenterFreqCellVictim];
      uint64_t v43 = v42;
      [(WCM_CellularController *)self ulBandwidthCellVictim];
      uint64_t v45 = v44;
      [(WCM_CellularController *)self ulCenterFreq];
      uint64_t v47 = v46;
      [(WCM_CellularController *)self ulBandwidth];
      +[WCM_Logging logLevel:4, @"clkAlgnTDDFreqCheck: ulCenterFreqWiFiVictim=%f, ulBandwidthWiFiVictim=%f, ulCenterFreqCellVictim=%f, ulBandwidthCellVictim=%f, ulCenterFreq=%f, ulBandwidth=%f, Band41a1 (2496 - 2506)MHz identified.", v39, v41, v43, v45, v47, v48 message];
    }
    else
    {
      [(WCM_CellularController *)self ulCenterFreqWiFiVictim];
      uint64_t v22 = v21;
      [(WCM_CellularController *)self ulBandwidthWiFiVictim];
      uint64_t v24 = v23;
      [(WCM_CellularController *)self ulCenterFreqCellVictim];
      uint64_t v26 = v25;
      [(WCM_CellularController *)self ulBandwidthCellVictim];
      uint64_t v28 = v27;
      [(WCM_CellularController *)self ulCenterFreq];
      uint64_t v30 = v29;
      [(WCM_CellularController *)self ulBandwidth];
      +[WCM_Logging logLevel:4, @"clkAlgnTDDFreqCheck: ulCenterFreqWiFiVictim=%f, ulBandwidthWiFiVictim=%f, ulCenterFreqCellVictim=%f, ulBandwidthCellVictim=%f, ulCenterFreq=%f, ulBandwidth=%f, Band40b (2370 - 2400)MHz identified.", v22, v24, v26, v28, v30, v31 message];
    }
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (int)bandInfoType
{
  return *(_DWORD *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 128);
}

- (WCM_CellularController)init
{
  v5.receiver = self;
  v5.super_class = (Class)WCM_CellularController;
  v2 = [(WCM_Controller *)&v5 init];
  BOOL v3 = v2;
  if (v2)
  {
    bzero(&v2->super.mProcessId + 1, 0xAB0uLL);
    bzero((char *)&v3->_cellularInstance0.primarydlBandwidth + 4, 0xAB0uLL);
    HIDWORD(v3->_cellularInstance0.cachedULBandwidth) = 127;
    HIDWORD(v3->_cellularInstance1.cachedULBandwidth) = 127;
    *(unint64_t *)((char *)&v3->_wifiTxPowerdBm + 4) = (unint64_t)(&v3->super.mProcessId + 1);
    HIDWORD(v3->_cellularInstance1.primarydlBandwidth) = -1;
  }
  v3->_sensorInfo.usecase[1] = 1;
  v3->_sensorInfo.usecase[2] = 0;
  [(WCM_CellularController *)v3 setFastChargingHystersisTimer:0];
  [(WCM_CellularController *)v3 setBaseBandEnabledProtectionTimer:0];
  return v3;
}

- (void)dealloc
{
  if ([(WCM_CellularController *)self fastChargingHystersisTimer])
  {
    [(NSTimer *)[(WCM_CellularController *)self fastChargingHystersisTimer] invalidate];
    [(WCM_CellularController *)self setFastChargingHystersisTimer:0];
  }
  if ([(WCM_CellularController *)self baseBandEnabledProtectionTimer])
  {
    [(NSTimer *)[(WCM_CellularController *)self baseBandEnabledProtectionTimer] invalidate];
    [(WCM_CellularController *)self setBaseBandEnabledProtectionTimer:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)WCM_CellularController;
  [(WCM_Controller *)&v3 dealloc];
}

- (NSString)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"WCM_CellularController cellularConfig0<UL(freq=%lf bw=%lf) UL2(freq=%lf bw=%lf) DL(freq=%lf, bw=%lf) DL2(freq=%lf bw=%lf) TDD ULDLConfig=%lld, SFF=%lld ULCP=%lld DLCP=%lld FrameOffset=%lld> cellularConfig1<UL(freq=%lf bw=%lf) UL2(freq=%lf bw=%lf) DL(freq=%lf, bw=%lf) DL2(freq=%lf bw=%lf) TDD ULDLConfig=%lld, SFF=%lld ULCP=%lld DLCP=%lld FrameOffset=%lld> activeSubid(%lld)", *(unint64_t *)((char *)&self->_cellularInstance0.frameOffset + 4), *(void *)((char *)&self->_cellularInstance0.ulCenterFreq + 4), *(void *)((char *)&self->_cellularInstance0.dlBandwidth + 4), *(void *)((char *)&self->_cellularInstance0.ulCenterFreq2 + 4), *(void *)((char *)&self->_cellularInstance0.ulBandwidth + 4), *(void *)((char *)&self->_cellularInstance0.dlCenterFreq + 4), *(void *)((char *)&self->_cellularInstance0.ulBandwidth2 + 4), *(void *)((char *)&self->_cellularInstance0.dlCenterFreq2 + 4), *(void *)((char *)&self->_cellularInstance0.dlBandwidth2 + 4), *(unint64_t *)((char *)&self->_cellularInstance0.tddULDLConfig + 4), *(void *)(&self->super.mProcessId + 1), *(unint64_t *)((char *)&self->_cellularInstance0.ulCPConfig + 4), *(unint64_t *)((char *)&self->_cellularInstance0.dlCPConfig + 4), *(unint64_t *)((char *)&self->_cellularInstance1.frameOffset + 4), *(void *)((char *)&self->_cellularInstance1.ulCenterFreq + 4), *(void *)((char *)&self->_cellularInstance1.dlBandwidth + 4),
           *(void *)((char *)&self->_cellularInstance1.ulCenterFreq2 + 4),
           *(void *)((char *)&self->_cellularInstance1.ulBandwidth + 4),
           *(void *)((char *)&self->_cellularInstance1.dlCenterFreq + 4),
           *(void *)((char *)&self->_cellularInstance1.ulBandwidth2 + 4),
           *(void *)((char *)&self->_cellularInstance1.dlCenterFreq2 + 4),
           *(void *)((char *)&self->_cellularInstance1.dlBandwidth2 + 4),
           *(unint64_t *)((char *)&self->_cellularInstance1.tddULDLConfig + 4),
           *(void *)((char *)&self->_cellularInstance0.primarydlBandwidth + 4),
           *(unint64_t *)((char *)&self->_cellularInstance1.ulCPConfig + 4),
           *(unint64_t *)((char *)&self->_cellularInstance1.dlCPConfig + 4),
           *($98FD36134D1A88AC5AB3433CBDAD69ED **)((char *)&self->_activeConfig + 4));
}

- (unint64_t)ulCPConfig
{
  return **(void **)((char *)&self->_wifiTxPowerdBm + 4);
}

- (unint64_t)dlCPConfig
{
  return *(void *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 8);
}

- (unint64_t)frameOffset
{
  return *(void *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 16);
}

- (double)ulCenterFreq2
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 56);
}

- (double)ulBandwidth2
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 64);
}

- (double)dlCenterFreq2
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 72);
}

- (double)dlBandwidth2
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 80);
}

- (double)dlCenterFreqWiFiVictim
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4)
                   + 72 * *(int *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 2456)
                   + 160);
}

- (double)dlBandwidthWiFiVictim
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4)
                   + 72 * *(int *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 2456)
                   + 168);
}

- (double)ulCenterFreqWiFiVictim
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4)
                   + 72 * *(int *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 2456)
                   + 144);
}

- (double)ulBandwidthWiFiVictim
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4)
                   + 72 * *(int *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 2456)
                   + 152);
}

- (double)dlCenterFreqCellVictim
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4)
                   + 72 * *(int *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 2452)
                   + 160);
}

- (double)dlBandwidthCellVictim
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4)
                   + 72 * *(int *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 2452)
                   + 168);
}

- (double)ulCenterFreqCellVictim
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4)
                   + 72 * *(int *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 2452)
                   + 144);
}

- (double)ulBandwidthCellVictim
{
  return *(double *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4)
                   + 72 * *(int *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 2452)
                   + 152);
}

- (unint64_t)tddULDLConfig
{
  return *(void *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 88);
}

- (unint64_t)subframeFormat
{
  return *(void *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 96);
}

- (unint64_t)carrierId
{
  return *(void *)(*(unint64_t *)((char *)&self->_wifiTxPowerdBm + 4) + 136);
}

- (void)sendMessageToAriDriver:(unint64_t)a3 withArgs:(id)a4 withExtraKey:(const char *)a5 andExtraValue:(id)a6
{
  *(_OWORD *)keys = *(_OWORD *)off_100210E90;
  uint64_t v13 = "kSubId";
  values[0] = xpc_uint64_create(a3);
  values[1] = a4;
  values[2] = a6;
  xpc_object_t v9 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
  +[WCM_Logging logLevel:3, @"Sending messageId(%lld) to WCM_AriCoexCommandDriver %@", a3, v9 message];
  id v10 = +[WCM_AriCoexCommandDriver singleton];
  if (v10) {
    [v10 handleEvent:v9];
  }
  else {
    +[WCM_Logging logLevel:3 message:@"Sending messageId to WCM_AriCoexCommandDriver failed. ARI Coex Driver does not exist"];
  }
  xpc_release(values[0]);
  xpc_release(v9);
}

- (void)sendMessage:(unint64_t)a3 withArgs:(id)a4
{
  unsigned int v7 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") activeCoexFeatures] containsObject:@"UseWCMAriDriver"];
  xpc_object_t v8 = xpc_uint64_create([(WCM_CellularController *)self activeSubId]);
  if (v7) {
    [(WCM_CellularController *)self sendMessageToAriDriver:a3 withArgs:a4 withExtraKey:"kSubId" andExtraValue:v8];
  }
  else {
    [(WCM_CellularController *)self sendMessage:a3 withArgs:a4 withExtraKey:"kSubId" andExtraValue:v8];
  }

  xpc_release(v8);
}

- (void)sendMessage:(unint64_t)a3 withArgs:(id)a4 withExtraKey:(const char *)a5 andExtraValue:(id)a6
{
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"UseWCMAriDriver"))
  {
    [(WCM_CellularController *)self sendMessageToAriDriver:a3 withArgs:a4 withExtraKey:"kSubId" andExtraValue:a6];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WCM_CellularController;
    [(WCM_Controller *)&v11 sendMessage:a3 withArgs:a4 withExtraKey:a5 andExtraValue:a6];
  }
}

- (WCM_CellularController)initWithConnection:(id)a3 processId:(int)a4
{
  v6.receiver = self;
  v6.super_class = (Class)WCM_CellularController;
  [(WCM_Controller *)&v6 initWithConnection:a3 processId:*(void *)&a4];
  return (WCM_CellularController *)[(WCM_CellularController *)self handlePowerState:1];
}

- (void)handlePowerState:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[WCM_PolicyManager singleton];
  objc_super v6 = v5;
  if (v3)
  {
    id v7 = [v5 platformManager];
    -[WCM_CellularController setWci2TxPowerLimit:](self, "setWci2TxPowerLimit:", (int)[objc_msgSend(objc_msgSend(v7, "wcmCellularWCI2ModeLTEMaxTxPowerLow"), "intValue")]);
    -[WCM_CellularController setControllerTxPowerLimit:](self, "setControllerTxPowerLimit:", (int)[objc_msgSend(objc_msgSend(v7, "wcmCellularWCI2ModeLTEMaxTxPowerHigh"), "intValue")]);
    -[WCM_CellularController setRbThreshold:](self, "setRbThreshold:", (int)[objc_msgSend(objc_msgSend(v7, "wcmCellularWCI2ModeRBThresholdHigh"), "intValue")]);
    +[WCM_Logging logLevel:4 message:@"DLDebug_ updateGPSStateBit function called by handlePowerState with input policy as zero."];
    [(WCM_CellularController *)self setWci2CoexPolicyBitmap:[(WCM_CellularController *)self updateGPSStateBit:0]];
    [(WCM_CellularController *)self setLteCDRXWiFiTDD:0];
    [(WCM_CellularController *)self setWifiCenterFreqMHz:0];
    [(WCM_CellularController *)self setWifiBandwidthMHz:0];
    [(WCM_CellularController *)self setWifiTxPowerdBm:0];
    [(WCM_CellularController *)self setWatchAntPrefBand:7];
    [(WCM_CellularController *)self setWatchAntPref:0];
    [(WCM_CellularController *)self setRc1priority:8];
    [(WCM_CellularController *)self setRc1duration:0];
    [(WCM_CellularController *)self setCC1CarrierId:0];
    [(WCM_CellularController *)self setCC2CarrierId:0];
    [(WCM_CellularController *)self setCC1Tech:0];
    [(WCM_CellularController *)self setCC2Tech:0];
    [(WCM_CellularController *)self setAllPolicies];
    [(WCM_CellularController *)self setNetworkConfigOfInterest];
    if ([objc_msgSend(objc_msgSend(v6, "activeCoexFeatures"), "containsObject:", @"LTEScanProtection") -[WCM_CellularController setScanFrequencyBandFilter:](self, "setScanFrequencyBandFilter:", objc_msgSend(v7, "wcmCellularScanProtectionCellFrequencies")) {
    if (objc_msgSend(objc_msgSend(v6, "activeCoexFeatures"), "containsObject:", @"LTELAACoexSupport"))
    }
    {
      if (objc_msgSend(objc_msgSend(v6, "activeCoexFeatures"), "containsObject:", @"RCU1Support")
        && (id v8 = [v6 rcu1Controller]) != 0)
      {
        -[WCM_CellularController updateBBRC1Params:channel:duration:priority:](self, "updateBBRC1Params:channel:duration:priority:", [v8 mRCU1PowerOn], (int)[v8 mRCU1ChannelNum], [v8 mRCU1OnDuration], [v8 mRCU1UseCaseNum]);
      }
      else
      {
        [(WCM_CellularController *)self setLAACoexConfig:4];
      }
    }
    if (objc_msgSend(objc_msgSend(v6, "activeCoexFeatures"), "containsObject:", @"CellularNeedWiFiStatus"))
    {
      id v9 = [v6 wifiController];
      if (v9)
      {
        id v10 = v9;
        if ([v6 audioBuiltInReceiver]) {
          unsigned int v11 = [v10 headTxPowerCapdBm];
        }
        else {
          unsigned int v11 = [v10 bodyTxPowerCapdBm];
        }
        -[WCM_CellularController updateWiFiStatusCenterFreq:bandwidth:txPower:](self, "updateWiFiStatusCenterFreq:bandwidth:txPower:", [v10 channelCenterFreqMHz], [v10 channelBandwidthMHz], v11);
      }
    }
    [(WCM_CellularController *)self sendMessage:1200 withArgs:0];
    [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") updateControllerState:1800];
    if (objc_msgSend(objc_msgSend(v6, "activeCoexFeatures"), "containsObject:", @"Bb20PolicyConversion"))
    {
      if (objc_msgSend(objc_msgSend(v6, "activeCoexFeatures"), "containsObject:", @"BB22BusAntMapping"))
      {
        [(WCM_CellularController *)self setWci2TxAntMapBB22];
      }
      else if (objc_msgSend(objc_msgSend(v6, "activeCoexFeatures"), "containsObject:", @"BB21BusAntMapping"))
      {
        [(WCM_CellularController *)self setWci2TxAntMapBB21];
      }
      else if (objc_msgSend(objc_msgSend(v6, "activeCoexFeatures"), "containsObject:", @"BB25A_Bus_Ant_Mapping"))
      {
        [(WCM_CellularController *)self setTxAntMapInHouseBB25A];
      }
      else
      {
        [(WCM_CellularController *)self setWci2TxAntMap];
      }
      if (objc_msgSend(objc_msgSend(v6, "activeCoexFeatures"), "containsObject:", @"BB21ClientAntennaBlocking"))
      {
        [(WCM_CellularController *)self setClientAntBlockingParams];
      }
      else if (objc_msgSend(objc_msgSend(v6, "activeCoexFeatures"), "containsObject:", @"BB22ClientAntennaBlocking"))
      {
        [(WCM_CellularController *)self setClientAntBlockingParams22];
      }
      else if (objc_msgSend(objc_msgSend(v6, "activeCoexFeatures"), "containsObject:", @"MavAntPolicyFramework"))
      {
        +[WCM_Logging logLevel:4 message:@"Handle cellular Power State: Calling mavAntPolicy sendMavConfigItems"]);
        [objc_msgSend(v6, "mavAntPolicy") sendMavConfigitems];
      }
      else
      {
        [(WCM_CellularController *)self setAntBlockingParams];
      }
    }
    if (objc_msgSend(objc_msgSend(v6, "activeCoexFeatures"), "containsObject:", @"CoexBBUnifiedSensorInfoSupport"))
    {
      uint64_t v12 = 0;
      uint64_t v13 = (char *)&self->_cellularInstance1.primarydlBandwidth + 4;
      do
      {
        uint64_t v14 = v13[v12];
        if (v13[v12] && v14 != 255)
        {
          uint64_t v15 = v13[v12 + 4];
          v13[v12] = -1;
          [(WCM_CellularController *)self sendBBCoexSensorMessage:v12 band:v14 usecase:v15];
        }
        ++v12;
      }
      while (v12 != 4);
    }
    if (objc_msgSend(objc_msgSend(v6, "activeCoexFeatures"), "containsObject:", @"UseWCMAriDriver"))
    {
      id v16 = +[WCM_AriCoexCommandDriver singleton];
      if (v16)
      {
        double v17 = v16;
        uint64_t v18 = [v7 wrmPlatformId];
        +[WCM_Logging logLevel:3, @"Handle Power State: Configure antenna blocking policy for platformId(%llu)", v18 message];
        [v17 setAntennaBlockingPolicyForPlatformId:v18 activeSubId:-[WCM_CellularController activeSubId](self, "activeSubId")];
      }
      else
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, @"Handle Power State: Configure antenna blocking policy for platformId(%u) failed, ARI Driver is NULL", [v7 wrmPlatformId]);
      }
    }
    if ([v6 cellularRc1PolicyManager])
    {
      id v19 = [v6 cellularRc1PolicyManager];
      [v19 handleCellularPowerState:1];
    }
  }
  else if (objc_msgSend(objc_msgSend(v5, "activeCoexFeatures"), "containsObject:", @"UseWCMAriDriver"))
  {
    bzero(&self->super.mProcessId + 1, 0xAB0uLL);
    bzero((char *)&self->_cellularInstance0.primarydlBandwidth + 4, 0xAB0uLL);
  }
}

- (void)setCriticalCarrier:(unint64_t)a3 forCarrierId:(unint64_t)a4 forTech:(unint64_t)a5
{
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  id v10 = +[WCM_PolicyManager singleton];
  xpc_dictionary_set_BOOL(v9, "kWCMCellularSetCC_Enable", (BOOL)[v10 wcmCellularWCI2Mode_Ext_Enable]);
  xpc_dictionary_set_uint64(v9, "kWCMCellularSetCC_CoexTech", a5);
  xpc_dictionary_set_uint64(v9, "kWCMCellularSetCC_CarrierId", a4);
  if (objc_msgSend(objc_msgSend(v10, "activeCoexFeatures"), "containsObject:", @"UseWCMAriDriver"))
  {
    unint64_t v11 = [(WCM_CellularController *)self activeSubId];
    uint64_t v12 = &OBJC_IVAR___WCM_CellularController__cellularInstance1;
    if (!v11) {
      uint64_t v12 = &OBJC_IVAR___WCM_CellularController__cellularInstance0;
    }
    uint64_t v13 = (char *)self + *v12;
    uint64_t v14 = -2304;
    while (1)
    {
      uint64_t v15 = &v13[v14];
      if (*(_DWORD *)&v13[v14 + 2480] == a4) {
        break;
      }
      v14 += 72;
      if (!v14)
      {
        double v16 = 0.0;
        double v17 = 0.0;
        double v18 = 0.0;
        double v19 = 0.0;
        goto LABEL_16;
      }
    }
    if (![v10 activeCoexFeatures].containsObject:@"CriticalCarrierIssueFreqRange")goto LABEL_15; {
    id v20 = [[v10 wifiController] channelCenterFreqMHz];
    }
    id v21 = [objc_msgSend(v10, "wifiController") channelBandwidthMHz];
    if (a3 == 1217)
    {
      uint64_t v22 = (void **)&v13[v14 + 2488];
    }
    else
    {
      if (a3 != 1218) {
        goto LABEL_15;
      }
      uint64_t v22 = (void **)&v13[v14 + 2496];
    }
    uint64_t v23 = *v22;
    double v27 = 0.0;
    double v28 = 0.0;
    double v25 = 0.0;
    double v26 = 0.0;
    if (v23)
    {
      uint64_t v24 = (double *)&v13[v14];
      [v23 cellFreqRangeWithIssueForCellDlLowFreq:&v27 cellDlHighFreq:&v25 cellUlLowFreq:v24[308] - v24[309] * 0.5 cellUlHighFreq:v24[308] + v24[309] * 0.5 wifiLowFreq:*((double *)v15 + 306) - v24[307] * 0.5 wifiHighFreq:*((double *)v15 + 306) + v24[307] * 0.5 cellTxIssueRange:(double)(v20 - (v21 >> 1)) cellRxIssueRange:(double)(v20 + (v21 >> 1))];
      double v17 = v28;
      double v16 = v27 + v28 * 0.5;
      double v19 = v26;
      double v18 = v25 + v26 * 0.5;
      +[WCM_Logging logLevel:3, @"Critical carrier with partial frequency range: input critical carrier DL[%f, %f]MHz, UL[%f, %f]MHz", *((void *)v24 + 308), *((void *)v24 + 309), *((void *)v15 + 306), *((void *)v24 + 307) message];
      +[WCM_Logging logLevel:3, @"Critical carrier with partial frequency range: input WiFi frequency [%u, %u]MHz", v20, v21 message];
      +[WCM_Logging logLevel:3, @"Critical carrier with partial frequency range: output critical carrier DL[%f, %f]MHz, UL[%f, %f]MHz", *(void *)&v18, *(void *)&v19, *(void *)&v16, *(void *)&v17 message];
LABEL_16:
      xpc_dictionary_set_double(v9, "kWCMCellularSetCC_UplinkCenterFrequency", v16);
      xpc_dictionary_set_double(v9, "kWCMCellularSetCC_UplinkBandwidth", v17);
      xpc_dictionary_set_double(v9, "kWCMCellularSetCC_DownlinkCenterFrequency", v18);
      xpc_dictionary_set_double(v9, "kWCMCellularSetCC_DownlinkBandwidth", v19);
      goto LABEL_17;
    }
LABEL_15:
    double v16 = *((double *)v15 + 306);
    double v17 = *(double *)&v13[v14 + 2456];
    double v18 = *(double *)&v13[v14 + 2464];
    double v19 = *(double *)&v13[v14 + 2472];
    goto LABEL_16;
  }
LABEL_17:
  [(WCM_CellularController *)self sendMessage:a3 withArgs:v9];
  xpc_release(v9);
}

- (void)setAllPolicies
{
  id v3 = +[WCM_PolicyManager singleton];
  id v4 = [v3 platformManager];
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  unint64_t v6 = [(WCM_CellularController *)self wci2CoexPolicyBitmap];
  unint64_t v7 = (unint64_t)[v4 wcmCellularWCI2PlatformPolicyBitmap];
  if (((v7 | v6) & 0x1000) != 0) {
    uint64_t v8 = (v7 | v6) & 0xFFFFFFFFFFFFFFEFLL;
  }
  else {
    uint64_t v8 = v7 | v6;
  }
  if (objc_msgSend(objc_msgSend(v3, "activeCoexFeatures"), "containsObject:", @"Bb20PolicyConversion"))
  {
    uint64_t v8 = [(WCM_CellularController *)self updatePolicyForBB20:v8];
    if (objc_msgSend(objc_msgSend(v3, "activeCoexFeatures"), "containsObject:", @"BB21PolicyTuneup"))
    {
      +[WCM_Logging logLevel:2 message:@"BB21: Turning off TX ACTIVE policy in BB21 platforms"];
      v8 &= ~2uLL;
    }
  }
  +[WCM_Logging logLevel:1, @"clkAlgnTDDFreqCheck: The final wci2CoexPolicyBitmap from WRM to CommCentr is wci2CoexPolicyBitmap= %lld.", v8 message];
  xpc_dictionary_set_uint64(v5, "kWCMCellularSetWCI2Mode_Policy", v8);
  xpc_dictionary_set_uint64(v5, "kWCMCellularSetWCI2Mode_PowerThreshold", (uint64_t)[objc_msgSend(objc_msgSend(v4, "wcmCellularWCI2ModePowerThreshold"), "integerValue") integerValue]);
  xpc_dictionary_set_uint64(v5, "kWCMCellularSetWCI2Mode_RB_Threshold", [(WCM_CellularController *)self rbThreshold]);
  xpc_dictionary_set_uint64(v5, "kWCMCellularSetWCI2Mode_LTE_TxDenialThreshold", (uint64_t)[[objc_msgSend(objc_msgSend(v4, "wcmCellularWCI2ModeLTETxDenial"), "integerValue");
  xpc_dictionary_set_int64(v5, "kWCMCellularSetWCI2Mode_MaxAllowedFrameDenials", (int64_t)[[[v4 wcmCellularWCI2ModeMaxAllowedFrameDenials] integerValue];
  xpc_dictionary_set_int64(v5, "kWCMCellularSetWCI2Mode_FrameDenialWindow", (int64_t)[[objc_msgSend(objc_msgSend(v4, "wcmCellularWCI2ModeFrameDenialWindow"), "integerValue");
  xpc_dictionary_set_uint64(v5, "kWCMCellularSetWCI2Mode_APTTable", (uint64_t)[[objc_msgSend(objc_msgSend(v4, "wcmCellularWCI2ModeAPTTable"), "integerValue");
  xpc_dictionary_set_uint64(v5, "kWCMCellularSetWCI2Mode_ControllerTxPowerLimit", [(WCM_CellularController *)self controllerTxPowerLimit]);
  xpc_dictionary_set_uint64(v5, "kWCMCellularSetWCI2Mode_WCI2PowerLimit", [(WCM_CellularController *)self wci2TxPowerLimit]);
  xpc_dictionary_set_uint64(v5, "kWCMCellularSetWCI2Mode_LinkPathLossThreshold", (uint64_t)[[[v4 wcmCellularWCI2ModeLinkPathLossThreshold] integerValue]);
  [objc_msgSend(v4, "wcmCellularWCI2ModeRBFilerAlpha") floatValue];
  xpc_dictionary_set_double(v5, "kWCMCellularSetWCI2Mode_RBFilterAlpha", v9);
  xpc_dictionary_set_uint64(v5, "kWCMCellularSetWCI2Mode_FilterRBThreshold", [(WCM_CellularController *)self rbThreshold]);
  xpc_dictionary_set_uint64(v5, "kWCMCellularSetWCI2Mode_ControllerTxPowerLimitTO", (uint64_t)[[[v4 wcmCellularWCI2ModeControllerTxPowerLimitTO] integerValue];
  xpc_dictionary_set_uint64(v5, "kWCMCellularSetWCI2Mode_WCI2PowerLimitTO", (uint64_t)[[objc_msgSend(objc_msgSend(v4, "wcmCellularWCI2ModeWCI2PowerLimitTO"), "integerValue");
  xpc_dictionary_set_int64(v5, "kWCMCellularSetWCI2Mode_TxPowerThresholdForAdvTxNotice", (int64_t)[[objc_msgSend(objc_msgSend(v4, "wcmCellularWCI2ModeTxPowerThresholdAdvTx"), "integerValue");
  xpc_dictionary_set_int64(v5, "kWCMCellularSetWCI2Mode_RbThresholdForAdvTxNotice", [(WCM_CellularController *)self rbThreshold]);
  xpc_dictionary_set_uint64(v5, "kWCMCellularSetWCI2Mode_Controller_RB_Threshold", (uint64_t)[[[v4 wcmCellularWCI2ModeControllerLTERBThreshold] integerValue];
  xpc_dictionary_set_uint64(v5, "kWCMCellularSetWCI2Mode_Harq_nack_ratio_Threshold", (uint64_t)[[objc_msgSend(objc_msgSend(v4, "wcmCellularWCI2ModeLTEHarqnackratioThreshold"), "integerValue");
  xpc_dictionary_set_BOOL(v5, "kWCMCellularSetWCI2Mode_Controller_PowerLimiting_Enable", (BOOL)[v4 wcmCellularWCI2ModeControllerLTEPowerLimitingEnable]);
  +[WCM_Logging logLevel:message:](WCM_Logging, @"ULCA setAllPolicies-1-ULCA critical bitmap %d", objc_msgSend(v3, "wcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap"));
  if (objc_msgSend(objc_msgSend(v3, "activeCoexFeatures"), "containsObject:", @"Bb20PolicyConversion"))
  {
    [(WCM_CellularController *)self setAllCriticalCarriers];
    xpc_dictionary_set_uint64(v5, "kWCMCellularSetWCI2Mode_CoexTech", -[WCM_CellularController getCoexTechForPolicy:](self, "getCoexTechForPolicy:", [v3 wcmCellular_CC1_Tech]));
    xpc_dictionary_set_uint64(v5, "kWCMCellularSetWCI2Mode_NGC_TxDenialThresholdSlots", (uint64_t)[[objc_msgSend(objc_msgSend(v4, "wcmCellularWCI2ModeLTETxDenial"), "integerValue");
    xpc_dictionary_set_int64(v5, "kWCMCellularSetWCI2Mode_NGC_MaxAllowedSlotDenials", (int64_t)[objc_msgSend(objc_msgSend(v4, "wcmCellularWCI2ModeMaxAllowedFrameDenials"), "integerValue")]);
    xpc_dictionary_set_int64(v5, "kWCMCellularSetWCI2Mode_NGC_SlotsDenialWindow", (int64_t)[objc_msgSend(objc_msgSend(v4, "wcmCellularWCI2ModeFrameDenialWindow"), "integerValue"]);
  }
  else
  {
    xpc_dictionary_set_BOOL(v5, "kWCMCellularSetWCI2Mode_Ext_enabled", (BOOL)[v3 wcmCellularWCI2Mode_Ext_Enable]);
    xpc_dictionary_set_uint64(v5, "kWCMCellularSetWCI2Mode_Ext_critical_ul_ca_bitmap", (uint64_t)[v3 wcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap]);
  }
  [(WCM_CellularController *)self sendMessage:1205 withArgs:v5];

  xpc_release(v5);
}

- (unint64_t)updatePolicyForBB20:(unint64_t)a3
{
  unint64_t v3 = a3 & 0xFFFFFFFFFFFFEFCFLL | 0x30;
  if ((a3 & 0x1000) == 0) {
    unint64_t v3 = a3;
  }
  if ((a3 & 0x200) != 0) {
    v3 &= ~0x200uLL;
  }
  if ((a3 & 0x4000) != 0) {
    v3 &= ~0x4000uLL;
  }
  if ((a3 & 0x10000) != 0) {
    v3 &= ~0x10000uLL;
  }
  if ((a3 & 0x4000) != 0) {
    v3 &= ~0x4000uLL;
  }
  if ((a3 & 0x8000) != 0) {
    unint64_t v4 = v3 & 0xFFFFFFFFFFFF7FFFLL;
  }
  else {
    unint64_t v4 = v3;
  }
  +[WCM_Logging logLevel:2, @"BB20 Policy updated for bb20 0x%lux", v4 message];
  return v4;
}

- (void)updateWCI2TxPower:(int64_t)a3
{
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  if ([(WCM_CellularController *)self wci2TxPowerLimit] != a3)
  {
    +[WCM_Logging logLevel:3, @"Updating WCI2 Power limit to %lld", a3 message];
    [(WCM_CellularController *)self setWci2TxPowerLimit:a3];
    [(WCM_CellularController *)self setAllPolicies];
  }

  xpc_release(v5);
}

- (void)updateControllerTxPower:(int64_t)a3
{
  if ([(WCM_CellularController *)self controllerTxPowerLimit] != a3)
  {
    +[WCM_Logging logLevel:3, @"Updating Controller Power limit to %lld", a3 message];
    [(WCM_CellularController *)self setControllerTxPowerLimit:a3];
    [(WCM_CellularController *)self setAllPolicies];
  }
}

- (void)updateWiFiStatusCenterFreq:(unint64_t)a3 bandwidth:(unint64_t)a4 txPower:(unint64_t)a5
{
  if ([(WCM_CellularController *)self wifiCenterFreqMHz] == a3
    && [(WCM_CellularController *)self wifiBandwidthMHz] == a4
    && [(WCM_CellularController *)self wifiTxPowerdBm] == a5)
  {
    +[WCM_Logging logLevel:3, @"Already set to centerFreqMhz(%ld) bandwidthMHz(%ld) txPowerdBm(%ld)", a3, a4, a5 message];
  }
  else
  {
    +[WCM_Logging logLevel:5, @"Updating WiFi Status centerFreqMHz(%ld -> %ld) bandwidthMHz(%ld -> %ld) txPowerdBm(%ld -> %ld)", [(WCM_CellularController *)self wifiCenterFreqMHz], a3, [(WCM_CellularController *)self wifiBandwidthMHz], a4, [(WCM_CellularController *)self wifiTxPowerdBm], a5 message];
    [(WCM_CellularController *)self setWifiCenterFreqMHz:a3];
    [(WCM_CellularController *)self setWifiBandwidthMHz:a4];
    [(WCM_CellularController *)self setWifiTxPowerdBm:a5];
    if (!(a4 | a3 | a5)) {
      +[WCM_Logging logLevel:3 message:@"DLDebug_ CellularController is getting all 0s for WiFi Freq info."];
    }
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v9, "WCMCellularSetWiFiStatus_CenterFrequency", a3);
    xpc_dictionary_set_uint64(v9, "WCMCellularSetWiFiStatus_ChannelBandwidth", a4);
    xpc_dictionary_set_uint64(v9, "WCMCellularSetWiFiStatus_TxPower", a5);
    [(WCM_CellularController *)self sendMessage:1210 withArgs:v9];
    xpc_release(v9);
  }
}

- (void)updateWatchAntennaPref:(int)a3 watchAntPref:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  +[WCM_Logging logLevel:3, @"Updating watch antenna pref to cellular modem, coexBand %d, antenna %d", *(void *)&a3, *(void *)&a4 message];
  if (v4)
  {
    if (v5)
    {
      if (v5 >= 3)
      {
        if ((v5 - 3) > 1) {
          return;
        }
        uint64_t v7 = 2;
        int64_t v8 = 41;
      }
      else
      {
        uint64_t v7 = 1;
        int64_t v8 = 40;
      }
    }
    else
    {
      uint64_t v7 = 2;
      int64_t v8 = 7;
    }
    if ([(WCM_CellularController *)self watchAntPrefBand] == v5
      && [(WCM_CellularController *)self watchAntPref] == v4)
    {
      +[WCM_Logging logLevel:3, @"Already set watch antenna pref band(%ld) to antenna (%ld)", v5, v4 message];
    }
    else
    {
      [(WCM_CellularController *)self setWatchAntPrefBand:v5];
      [(WCM_CellularController *)self setWatchAntPref:v4];
      +[WCM_Logging logLevel:3, @"Updating watch antenna pref to cellular modem, with antenna %d defaultAntPref %d", v4, v7 message];
      xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
      xpc_object_t v10 = xpc_array_create(0, 0);
      xpc_object_t values = xpc_int64_create(v8);
      xpc_object_t object = xpc_int64_create(v4);
      *(_OWORD *)keys = *(_OWORD *)off_100210EA8;
      xpc_object_t v11 = xpc_dictionary_create((const char *const *)keys, &values, 2uLL);
      xpc_dictionary_set_uint64(v9, "WCMCellularSetFCM_BCM_Antenna_Switching_RAT", 3uLL);
      xpc_array_append_value(v10, v11);
      xpc_dictionary_set_value(v9, "WCMCellularSetFCM_BCM_Antenna_Switching_PortMapInformationSet", v10);
      [(WCM_CellularController *)self sendMessage:1212 withArgs:v9];
      xpc_release(v11);
      xpc_release(values);
      xpc_release(object);
      xpc_release(v10);
      xpc_release(v9);
    }
  }
}

- (void)fastChargingHandler:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = &self->super.mProcessId + 1;
  double v6 = *(double *)((char *)&self->_cellularInstance0.ulBandwidth + 4);
  if (v6 > 0.0
    && (+[WCM_Logging logLevel:5, @"FCharging :- SUB%ld: Network Config UL(freq=%lf bw=%lf) DL(freq=%lf, bw=%lf)  TDD ULDLConfig=%lld, SFF=%lld ULCP=%lld DLCP=%lld FrameOffset=%lld", 0, *((void *)v5 + 3), *((void *)v5 + 4), *(void *)&v6, *((void *)v5 + 6), *((void *)v5 + 11), *((void *)v5 + 12), *(void *)v5, *((void *)v5 + 1), *((void *)v5 + 2) message], double v7 = *((double *)v5 + 6) * 0.5, *((double *)v5 + 5) + v7 <= 960.0))
  {
    +[WCM_Logging logLevel:0, @"FCharging RRC state connected subid:%d -  [%d - frequency %lf , bandwidth %lf] ", 0, *((void *)v5 + 5), *(void *)&v7 message];
    +[WCM_Logging logLevel:0 message:@"FCharging Low band detected"];
    char v8 = 1;
  }
  else
  {
    char v8 = 0;
  }
  double v9 = *(double *)((char *)&self->_cellularInstance1.ulBandwidth + 4);
  if (v9 > 0.0
    && (+[WCM_Logging logLevel:5, @"FCharging :- SUB%ld: Network Config UL(freq=%lf bw=%lf) DL(freq=%lf, bw=%lf)  TDD ULDLConfig=%lld, SFF=%lld ULCP=%lld DLCP=%lld FrameOffset=%lld", 1, *(unint64_t *)((char *)&self->_cellularInstance1.frameOffset + 4), *(void *)((char *)&self->_cellularInstance1.ulCenterFreq + 4), *(void *)&v9, *(void *)((char *)&self->_cellularInstance1.dlCenterFreq + 4), *(void *)((char *)&self->_cellularInstance1.dlBandwidth2 + 4), *(unint64_t *)((char *)&self->_cellularInstance1.tddULDLConfig + 4), *(void *)((char *)&self->_cellularInstance0.primarydlBandwidth + 4), *(unint64_t *)((char *)&self->_cellularInstance1.ulCPConfig + 4), *(unint64_t *)((char *)&self->_cellularInstance1.dlCPConfig + 4) message], double v10 = *(double *)((char *)&self->_cellularInstance1.dlCenterFreq + 4) * 0.5, *(double *)((char *)&self->_cellularInstance1.ulBandwidth + 4) + v10 <= 960.0))
  {
    +[WCM_Logging logLevel:0, @"FCharging RRC state connected subid:%d -  [%lf - frequency %lf , bandwidth %lf] ", &index, *(void *)((char *)&self->_cellularInstance1.ulBandwidth + 4), *(void *)&v10 message];
    +[WCM_Logging logLevel:0 message:@"FCharging Low band detected"];
    xpc_object_t v11 = &self->_sensorInfo.usecase[1];
    self->_sensorInfo.usecase[1] = 1;
  }
  else
  {
    xpc_object_t v11 = &self->_sensorInfo.usecase[1];
    self->_sensorInfo.usecase[1] = 1;
    if ((v8 & 1) == 0)
    {
      uint64_t v12 = 1;
      BOOL v13 = v6 > 0.0 || !v3;
      if (v13 || v9 > 0.0) {
        goto LABEL_16;
      }
      +[WCM_Logging logLevel:0 message:@"FCharging Not attached but Low band detected in frequenies"];
    }
  }
  uint64_t v12 = 0;
  *xpc_object_t v11 = 0;
LABEL_16:
  +[WCM_Logging logLevel:0, @"FCharging Call API to decide to start timer and set the charger value %d", v12 message];

  [(WCM_CellularController *)self fastChargingStateChangeHandler];
}

- (void)fastChargingHystersisTimerHandler:(id)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, @"FCharging:fastChargingHystersisTimerHandler - Expired %@", +[NSThread currentThread]);
  [(WCM_CellularController *)self setFastChargingHystersisTimer:0];
  uint64_t v4 = self->_sensorInfo.usecase[1];

  [(WCM_CellularController *)self IOKIT_FastCharging_Iface_call:v4];
}

- (void)baseBandProtectionTimerHandler:(id)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, @"FCharging - baseBandProtectionTimerHandler - Expired Thread Id %@", +[NSThread currentThread]);
  [(WCM_CellularController *)self setBaseBandEnabledProtectionTimer:0];

  [(WCM_CellularController *)self fastChargingStateChangeHandler];
}

- (void)handleNetworkConfig_legacy:(id)a3
{
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (!value) {
    return;
  }
  double v6 = value;
  id v103 = +[WCM_PolicyManager singleton];
  double v7 = &self->super.mProcessId + 1;
  char v8 = &self->super.mProcessId + 1;
  if ([(WCM_CellularController *)self activeSubId]) {
    char v8 = (int *)&self->_cellularInstance0.primarydlBandwidth + 1;
  }
  double v9 = *((double *)v8 + 3);
  double v10 = *((double *)v8 + 5);
  double v99 = *((double *)v8 + 4);
  double v100 = *((double *)v8 + 6);
  double v11 = *((double *)v8 + 7);
  double v12 = *((double *)v8 + 9);
  double v97 = *((double *)v8 + 8);
  double v98 = *((double *)v8 + 10);
  unint64_t v13 = [(WCM_CellularController *)self activeSubId];
  uint64_t v14 = *((void *)v8 + 11);
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kSubId");
  if (!xpc_dictionary_get_count(v6)) {
    +[WCM_Logging logLevel:3, @"SUB%ld: goes out of interested frequency bands", uint64 message];
  }
  if (uint64) {
    double v7 = (int *)&self->_cellularInstance0.primarydlBandwidth + 1;
  }
  *((void *)v7 + 12) = 0;
  *((_OWORD *)v7 + 1) = 0u;
  *((_OWORD *)v7 + 5) = 0u;
  *((_OWORD *)v7 + 4) = 0u;
  v111 = (double *)(v7 + 16);
  *((_OWORD *)v7 + 3) = 0u;
  *((_OWORD *)v7 + 2) = 0u;
  *((double *)v7 + 3) = (double)xpc_dictionary_get_int64(v6, "kWCMCellularNetworkConfiguration_ULBandInfo_CenterFreq");
  v112 = (double *)(v7 + 6);
  *((double *)v7 + 4) = xpc_dictionary_get_double(v6, "kWCMCellularNetworkConfiguration_ULBandInfo_BandWidth");
  *((double *)v7 + 5) = (double)xpc_dictionary_get_int64(v6, "kWCMCellularNetworkConfiguration_DLBandInfo_CenterFreq");
  *((double *)v7 + 6) = xpc_dictionary_get_double(v6, "kWCMCellularNetworkConfiguration_DLBandInfo_BandWidth");
  *((void *)v7 + 11) = xpc_dictionary_get_int64(v6, "kWCMCellularNetworkConfiguration_TTDUL_DL");
  *((void *)v7 + 12) = xpc_dictionary_get_int64(v6, "kWCMCellularNetworkConfiguration_SubFrameFormat");
  *((void *)v7 + 2) = xpc_dictionary_get_int64(v6, "kWCMCellularNetworkConfiguration_FrameOffset");
  v110 = (double *)(v7 + 10);
  *((_WORD *)v7 + 52) = 0;
  id v16 = +[WRM_MetricsService getSingleton];
  double v17 = v16;
  if (v16) {
    [v16 initLTECoexMetrics];
  }
  double v18 = (char *)[v17 getLTECoexMetrics];
  double v19 = v18;
  if (v18)
  {
    v18[20] = 0;
    *(_OWORD *)(v18 + 24) = 0u;
    *(_OWORD *)(v18 + 40) = 0u;
  }
  id v96 = (id)v13;
  char v101 = (unsigned __int8 *)(v18 + 20);
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"EnableULCA"))
  {
    *((void *)v7 + 306) = 1;
    long long v20 = *(_OWORD *)(v7 + 10);
    *((_OWORD *)v7 + 9) = *(_OWORD *)(v7 + 6);
    *((_OWORD *)v7 + 10) = v20;
    [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") setWcmCellularWCI2Mode_Ext_Enable:1];
    [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") setWcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap:1];
    [WCM_Logging logLevel:3 message:@"ULCA handleNetworkConfig-1-ULCA critical bitmap %d" [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") wcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap]];
    if (*((double *)v7 + 5) != 0.0) {
      +[WCM_Logging logLevel:2, @"SUB%ld:  ULCA Logging -  case kWCMCellularNetworkConfiguration_ULBandInfo_CenterFreq UL-(freq=%lf bw=%lf)  DL(freq=%lf, bw=%lf) ", uint64, *((void *)v7 + 18), *((void *)v7 + 19), *((void *)v7 + 20), *((void *)v7 + 21) message];
    }
  }
  else
  {
    [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") setWcmCellularWCI2Mode_Ext_Enable:0];
    [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") setWcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap:1];
    [WCM_Logging logLevel:3 message:@"ULCA handleNetworkConfig-2-ULCA critical bitmap %d" arguments:objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "wcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap"), v83, v86, v88, v90];
  }
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472;
  applier[2] = sub_1000BC590;
  applier[3] = &unk_100210EB8;
  applier[4] = uint64;
  applier[5] = v7;
  xpc_dictionary_apply(v6, applier);
  xpc_object_t v21 = xpc_dictionary_get_value(v6, "kWCMCellularNetworkConfiguration_LTEBandInformationSet");
  uint64_t v105 = uint64;
  unsigned int v106 = self;
  uint64_t v95 = v14;
  v102 = v19;
  xpc_object_t xdict = v6;
  if (v21)
  {
    uint64_t v22 = v21;
    int v23 = 1;
  }
  else
  {
    xpc_object_t v24 = xpc_dictionary_get_value(v6, "kWCMCellularNetworkConfiguration_TDSCDMABandInformationSet");
    if (v24)
    {
      uint64_t v22 = v24;
      int v23 = 2;
    }
    else
    {
      xpc_object_t v25 = xpc_dictionary_get_value(v6, "kWCMCellularNetworkConfiguration_GSMBandInformationSet");
      if (v25)
      {
        uint64_t v22 = v25;
        int v23 = 4;
      }
      else
      {
        xpc_object_t v26 = xpc_dictionary_get_value(v6, "kWCMCellularNetworkConfiguration_ONEXBandInformationSet");
        if (v26)
        {
          uint64_t v22 = v26;
          int v23 = 8;
        }
        else
        {
          xpc_object_t v27 = xpc_dictionary_get_value(v6, "kWCMCellularNetworkConfiguration_HDRBandInformationSet");
          if (v27)
          {
            uint64_t v22 = v27;
            int v23 = 16;
          }
          else
          {
            xpc_object_t v28 = xpc_dictionary_get_value(v6, "kWCMCellularNetworkConfiguration_WCDMABandInformationSet");
            if (!v28)
            {
              v7[32] = 127;
              +[WCM_Logging logLevel:4, @"SUB%ld: unknown band info set", uint64 message];
              goto LABEL_55;
            }
            uint64_t v22 = v28;
            int v23 = 32;
          }
        }
      }
    }
  }
  v7[32] = v23;
  int64_t count = xpc_array_get_count(v22);
  if (count >= 1)
  {
    char v109 = 0;
    char v30 = 0;
    unsigned int v107 = 0;
    unsigned int v31 = 0;
    unsigned int v108 = v7 + 36;
    unint64_t v32 = count + 1;
    do
    {
      xpc_object_t v33 = xpc_array_get_value(v22, v32 - 2);
      if (v33)
      {
        double v34 = v33;
        uint64_t v35 = xpc_dictionary_get_uint64(v33, "kWCMCellularNetworkConfiguration_BandInfoSet_DirectionMask");
        int64_t int64 = xpc_dictionary_get_int64(v34, "kWCMCellularNetworkConfiguration_BandInfoSet_CenterFreq");
        double v37 = xpc_dictionary_get_double(v34, "kWCMCellularNetworkConfiguration_BandInfoSet_Bandwidth");
        double v38 = v37;
        uint64_t v39 = "unknown";
        if (v35 == 2) {
          uint64_t v39 = "downlink";
        }
        if (v35 == 1) {
          uint64_t v39 = "uplink";
        }
        +[WCM_Logging logLevel:5, @"directionMask(%lld:%s) centerFreq(%lld) bandwidth(%lf)", v35, v39, int64, *(void *)&v37 message];
        if (int64 >= 1)
        {
          if (v35 == 1)
          {
            double v40 = (double)int64 / 1000.0;
            double v41 = v38 / 1000000.0;
            uint64_t v42 = (double *)(v7 + 6);
            if (v30) {
              uint64_t v42 = (double *)(v7 + 14);
            }
            uint64_t v43 = (double *)(v7 + 16);
            if ((v30 & 1) == 0) {
              uint64_t v43 = (double *)(v7 + 8);
            }
            *uint64_t v42 = v40;
            *uint64_t v43 = v41;
            if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"EnableULCA"))
            {
              uint64_t v44 = (double *)&v108[18 * v31];
              *uint64_t v44 = v40;
              v44[1] = v41;
              ++v31;
            }
            char v30 = 1;
          }
          else if (v35 == 2)
          {
            double v45 = (double)int64 / 1000.0;
            double v46 = v38 / 1000000.0;
            uint64_t v47 = (double *)(v7 + 10);
            if (v109) {
              uint64_t v47 = (double *)(v7 + 18);
            }
            uint64_t v48 = (double *)(v7 + 20);
            if ((v109 & 1) == 0) {
              uint64_t v48 = (double *)(v7 + 12);
            }
            *uint64_t v47 = v45;
            *uint64_t v48 = v46;
            if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"EnableULCA"))
            {
              uint64_t v49 = &v108[18 * v107];
              *((double *)v49 + 2) = v45;
              *((double *)v49 + 3) = v46;
              int64_t v50 = &v108[18 * v31];
              unsigned int v31 = v107;
              *(void *)int64_t v50 = 0;
              *((void *)v50 + 1) = 0;
              char v109 = 1;
              ++v107;
            }
            else
            {
              char v109 = 1;
            }
          }
        }
      }
      --v32;
    }
    while (v32 > 1);
    goto LABEL_56;
  }
LABEL_55:
  unsigned int v107 = 0;
LABEL_56:
  if (*((unsigned char *)v7 + 104))
  {
    int64_t v51 = xpc_dictionary_get_int64(xdict, "kWCMCellularNetworkConfiguration_ULCPConfig");
    int64_t v52 = xpc_dictionary_get_int64(xdict, "kWCMCellularNetworkConfiguration_DLCPConfig");
    double v53 = WRM_MotionController;
    uint64_t v55 = v105;
    double v54 = v106;
    if (*v112 != 0.0)
    {
      int64_t v56 = v52;
      +[WCM_Logging logLevel:5, @"SUB%ld: RRC-connected cell notification ULCP(%lld -> %lld) DLCP(%lld -> %lld)", *v112, v105, *(void *)v7, v51, *((void *)v7 + 1), v52 message];
      if (v51 != 255) {
        *(void *)double v7 = v51;
      }
      if (v56 != 255) {
        *((void *)v7 + 1) = v56;
      }
    }
  }
  else
  {
    *(void *)double v7 = 0;
    *((void *)v7 + 1) = 0;
    double v53 = WRM_MotionController;
    uint64_t v55 = v105;
    double v54 = v106;
  }
  uint64_t v57 = *((void *)v7 + 3);
  uint64_t v58 = *((void *)v7 + 4);
  *((void *)v7 + 338) = v57;
  *((void *)v7 + 339) = v58;
  uint64_t v59 = *((void *)v7 + 5);
  uint64_t v60 = *((void *)v7 + 6);
  *((void *)v7 + 340) = v59;
  *((void *)v7 + 341) = v60;
  +[WCM_Logging logLevel:5, @"SUB%ld: Network Config UL(freq=%lf bw=%lf) UL2(freq=%lf bw=%lf) DL(freq=%lf, bw=%lf) DL2(freq=%lf bw=%lf) TDD ULDLConfig=%lld, SFF=%lld ULCP=%lld DLCP=%lld FrameOffset=%lld", v55, v57, v58, *((void *)v7 + 7), *((void *)v7 + 8), v59, v60, *((void *)v7 + 9), *((void *)v7 + 10), *((void *)v7 + 11), *((void *)v7 + 12), *(void *)v7, *((void *)v7 + 1), *((void *)v7 + 2) message];
  if (objc_msgSend(objc_msgSend(objc_msgSend(&v53[83], "singleton"), "activeCoexFeatures"), "containsObject:", @"EnableULCA"))
  {
    *((_OWORD *)v7 + 9) = *(_OWORD *)(v7 + 6);
    double v61 = v7 + 36;
    *((void *)v7 + 306) = v107;
    *((unsigned char *)v7 + 2692) = 0;
    *((_OWORD *)v7 + 10) = *(_OWORD *)(v7 + 10);
    double v62 = *((double *)v7 + 7);
    if (v62 != 0.0)
    {
      double v63 = *v111;
      if (*v111 != 0.0)
      {
        *(_OWORD *)(v7 + 58) = *(_OWORD *)(v7 + 18);
        *((double *)v7 + 27) = v62;
        *((double *)v7 + 28) = v63;
      }
    }
    +[WCM_Logging logLevel:4 message:@"-------- ULCA Logging   ----------"];
    +[WCM_Logging logLevel:4 message:@"-------- ULCA Config   ----------"];
    +[WCM_Logging logLevel:4, @"Total valid entries =%d", v7[612] message];
    if (v7[612])
    {
      unint64_t v64 = 0;
      int64_t v65 = v7 + 42;
      do
      {
        +[WCM_Logging logLevel:4, @"Entry index %d ..UL(freq=%lf bw=%lf) DL(freq=%lf, bw=%lf)", v64++, *(v65 - 3), *(v65 - 2), *(v65 - 1), *v65 message];
        v65 += 9;
      }
      while (v64 < v7[612]);
    }
    [v103 evaluateULCARestrictions];
    int64_t v66 = (double *)&v61[18 * v7[613]];
    double v68 = v66[2];
    double v67 = v66[3];
    *((double *)v7 + 5) = v68;
    *((double *)v7 + 6) = v67;
    double v70 = *v66;
    double v69 = v66[1];
    *((double *)v7 + 3) = *v66;
    *((double *)v7 + 4) = v69;
    if (v102)
    {
      if (v7[612] >= 2)
      {
        int v71 = *((unsigned __int8 *)v7 + 2692);
        *char v101 = v71;
        uint64_t v72 = (float *)(v101 + 4);
        v114.val[1] = (float32x2_t)vmovn_s64((int64x2_t)vcvtq_u64_f64(*((float64x2_t *)v7 + 10)));
        v114.val[0] = (float32x2_t)vmovn_s64((int64x2_t)vcvtq_u64_f64(*((float64x2_t *)v7 + 9)));
        vst2_f32(v72, v114);
        if (v71)
        {
          *((_DWORD *)v101 + 5) = v70;
          *((_DWORD *)v101 + 6) = v68;
          *((_DWORD *)v101 + 7) = v69;
          *((_DWORD *)v101 + 8) = v67;
        }
      }
      if (objc_msgSend(objc_msgSend(objc_msgSend(&v53[83], "singleton"), "activeCoexFeatures"), "containsObject:", @"ANTSELSTATSAWDSTATSCAMigration"))
      {
        LODWORD(v84) = *((_DWORD *)v101 + 8);
        [v103 wRMCACoexSubmit_ULCACoexStates:*v101 ULCAPrimaryCarrierULFreq:*((unsigned int *)v101 + 1) ULCAPrimaryCarrierDLFreq:*((unsigned int *)v101 + 2) ULCAPrimaryCarrierULBW:*((unsigned int *)v101 + 3) ULCAPrimaryCarrierDLBW:*((unsigned int *)v101 + 4) ULCACriticalCarrierULFreq:*((unsigned int *)v101 + 5) ULCACriticalCarrierDLFreq:*((void *)v101 + 3) ULCACriticalCarrierULBW:v84];
      }
    }
    +[WCM_Logging logLevel:4 message:@"-------- ULCA After coex valuation   ----------"];
    +[WCM_Logging logLevel:4 message:@"-------- ULCA After coex valuation   ----------"];
    +[WCM_Logging logLevel:4, @"Critical carrier =%d", v7[613] message];
    uint64_t v73 = &v61[18 * v7[613]];
    +[WCM_Logging logLevel:4, @"Critical Carrier UL(freq=%lf bw=%lf) DL(freq=%lf, bw=%lf)", *(void *)v73, *((void *)v73 + 1), *((void *)v73 + 2), *((void *)v73 + 3) message];
    +[WCM_Logging logLevel:5, @"ULCA Final Frequencies for COEX consideration :- SUB%ld: Network Config UL(freq=%lf bw=%lf) DL(freq=%lf, bw=%lf)  TDD ULDLConfig=%lld, SFF=%lld ULCP=%lld DLCP=%lld FrameOffset=%lld", v55, *((void *)v7 + 3), *((void *)v7 + 4), *((void *)v7 + 5), *((void *)v7 + 6), *((void *)v7 + 11), *((void *)v7 + 12), *(void *)v7, *((void *)v7 + 1), *((void *)v7 + 2) message];
    +[WCM_Logging logLevel:4 message:@"-------- ULCA Logging END  ----------"];
    [objc_msgSend(&v53[83], "singleton") setWcmCellularWCI2Mode_Ext_Enable:1];
    [objc_msgSend(&v53[83], "singleton") setWcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap:1 << v7[613]];
    +[WCM_Logging logLevel:message:](WCM_Logging, @"ULCA handleNetworkConfig-3-ULCA critical bitmap %d", objc_msgSend(objc_msgSend(&v53[83], "singleton"), "wcmCellularWCI2Mode_Ext_critical_ul_ca_bitmap"), v85, v87, v89, v91, v92, v93, v94);
  }
  else
  {
    uint64_t v74 = &v7[18 * v7[613] + 36];
    uint64_t v76 = *((void *)v7 + 5);
    uint64_t v75 = *((void *)v7 + 6);
    *((void *)v74 + 2) = v76;
    *((void *)v74 + 3) = v75;
    uint64_t v78 = *((void *)v7 + 3);
    uint64_t v77 = *((void *)v7 + 4);
    *(void *)uint64_t v74 = v78;
    *((void *)v74 + 1) = v77;
    long long v79 = &v7[18 * v7[614] + 36];
    *((void *)v79 + 2) = v76;
    *((void *)v79 + 3) = v75;
    *(void *)long long v79 = v78;
    *((void *)v79 + 1) = v77;
    +[WCM_Logging logLevel:4, @"Non-ULCA devices: Expected all to be PCC: Cell Victim Critical Carrier UL(freq=%lf bw=%lf) DL(freq=%lf, bw=%lf), WiFi Victim Critical Carrier UL(freq=%lf bw=%lf) DL(freq=%lf, bw=%lf)", *(void *)v74, *((void *)v74 + 1), *((void *)v74 + 2), *((void *)v74 + 3), v78, v77, v76, v75 message];
  }
  if (*v110 == 0.0 || v10 != 0.0 && *v110 != v10)
  {
    *((void *)v7 + 14) = 0;
    *((void *)v7 + 15) = 0;
  }
  double v80 = *v112;
  if (*v112 != 0.0)
  {
    uint64_t v81 = *((void *)v7 + 4);
    *((double *)v7 + 14) = v80;
    *((void *)v7 + 15) = v81;
    [(WCM_CellularController *)v54 setActiveConfig:v7];
    [(WCM_CellularController *)v54 setActiveSubId:v55];
  }
  if (objc_msgSend(objc_msgSend(objc_msgSend(&v53[83], "singleton", v80), "activeCoexFeatures"), "containsObject:", @"CellularNWCfgCmdFilter")&& (objc_msgSend(objc_msgSend(objc_msgSend(&v53[83], "singleton"), "activeCoexFeatures"), "containsObject:", @"EnableULCA") & 1) == 0)
  {
    if (v10 == *v110
      && v9 == *v112
      && v12 == *((double *)v7 + 9)
      && v11 == *((double *)v7 + 7)
      && v100 == *((double *)v7 + 6)
      && v99 == *((double *)v7 + 4)
      && v98 == *((double *)v7 + 10)
      && v97 == *v111
      && v96 == (id)[(WCM_CellularController *)v54 activeSubId]
      && v95 == *((void *)v7 + 11))
    {
      +[WCM_Logging logLevel:2 message:@"NW Config Parameters are the same, hence ignoring the network config command"];
      return;
    }
    +[WCM_Logging logLevel:2 message:@"NW Config Parameters are NOT the same, hence handling the network config command"];
  }
  if (objc_msgSend(objc_msgSend(objc_msgSend(&v53[83], "singleton"), "activeCoexFeatures"), "containsObject:", @"ClkAlgnTDDFix"))
  {
    unsigned int v82 = [(WCM_CellularController *)v54 clkAlgnTDDFreqCheck];
    *((unsigned char *)v7 + 105) = v82;
    +[WCM_Logging logLevel:4, @"clkAlgnTDDFreqCheck: After sorting over all cells, setting cellularConfig->btClkAlgnFlag = %d", v82 message];
  }
  [objc_msgSend(&v53[83], "singleton") updateControllerState:300];
}

- (void)handleTxPower:(id)a3
{
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value)
  {
    uint64_t v4 = value;
    int64_t int64 = xpc_dictionary_get_int64(value, "kWCMCellularTxPower_Level");
    int64_t v6 = xpc_dictionary_get_int64(v4, "kWCMCellularTxPower_Response");
    +[WCM_Logging logLevel:4, @"Tx Power level(%lld) response(%lld)", int64, v6 message];
    if (v6)
    {
      id v7 = +[WCM_PolicyManager singleton];
      [v7 handleErrorReport:4];
    }
  }
}

- (void)handleThresholdEvent:(id)a3
{
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value)
  {
    uint64_t v5 = value;
    int64_t int64 = xpc_dictionary_get_int64(value, "kWCMCellularThresholdReached_EventType");
    +[WCM_Logging logLevel:4, @"Threshold Event type(%lld) data(%lld)", int64, xpc_dictionary_get_int64(v5, "kWCMCellularThresholdReached_EventData") message];
    if (int64 == 1)
    {
      +[WCM_Logging logLevel:3 message:@"Reset frame denial related parameters"];
      [(WCM_CellularController *)self setAllPolicies];
    }
  }
  id v7 = +[WCM_PolicyManager singleton];

  [v7 handleErrorReport:4];
}

- (BOOL)isInCoexBand7LowerEdge
{
  id v3 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") platformManager];
  [(WCM_CellularController *)self ulCenterFreq];
  if (v4 == 0.0 || ([(WCM_CellularController *)self ulBandwidth], v5 == 0.0))
  {
    LOBYTE(v13) = 0;
  }
  else
  {
    [(WCM_CellularController *)self ulCenterFreq];
    double v7 = v6;
    [(WCM_CellularController *)self ulBandwidth];
    double v9 = v8;
    [(WCM_CellularController *)self dlCenterFreq];
    double v11 = v10;
    [(WCM_CellularController *)self dlBandwidth];
    unsigned int v13 = [v3 isBand7CoexActiveForULFreq:v7 ulBW:v9 dlFreq:v11 dlBW:v12];
    if (v13)
    {
      +[WCM_Logging logLevel:4 message:@"In CoexBand7LowerEdge"];
      LOBYTE(v13) = 1;
    }
  }
  return v13;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)getCombinedUplinkFreqRange
{
  [(WCM_CellularController *)self ulCenterFreq2];
  if (v3 == 0.0 || ([(WCM_CellularController *)self ulBandwidth2], v4 == 0.0))
  {
    [(WCM_CellularController *)self cachedULCenterFreq];
    double v24 = v23;
    [(WCM_CellularController *)self cachedULBandwidth];
    double v11 = v24 - v25 * 0.5;
    [(WCM_CellularController *)self cachedULCenterFreq];
    double v27 = v26;
    [(WCM_CellularController *)self cachedULBandwidth];
    double v29 = v27 + v28 * 0.5;
  }
  else
  {
    [(WCM_CellularController *)self cachedULCenterFreq];
    double v6 = v5;
    [(WCM_CellularController *)self ulCenterFreq2];
    if (v6 >= v7)
    {
      [(WCM_CellularController *)self ulCenterFreq2];
      double v31 = v30;
      [(WCM_CellularController *)self ulBandwidth2];
      double v11 = v31 - v32 * 0.5;
      [(WCM_CellularController *)self ulCenterFreq2];
      double v34 = v33;
      [(WCM_CellularController *)self ulBandwidth2];
      double v15 = v34 + v35 * 0.5;
      [(WCM_CellularController *)self cachedULCenterFreq];
      double v37 = v36;
      [(WCM_CellularController *)self cachedULBandwidth];
      double v19 = v37 - v38 * 0.5;
      [(WCM_CellularController *)self cachedULCenterFreq];
      double v21 = v39;
      [(WCM_CellularController *)self cachedULBandwidth];
    }
    else
    {
      [(WCM_CellularController *)self cachedULCenterFreq];
      double v9 = v8;
      [(WCM_CellularController *)self cachedULBandwidth];
      double v11 = v9 - v10 * 0.5;
      [(WCM_CellularController *)self cachedULCenterFreq];
      double v13 = v12;
      [(WCM_CellularController *)self cachedULBandwidth];
      double v15 = v13 + v14 * 0.5;
      [(WCM_CellularController *)self ulCenterFreq2];
      double v17 = v16;
      [(WCM_CellularController *)self ulBandwidth2];
      double v19 = v17 - v18 * 0.5;
      [(WCM_CellularController *)self ulCenterFreq2];
      double v21 = v20;
      [(WCM_CellularController *)self ulBandwidth2];
    }
    double v29 = v21 + v22 * 0.5;
    double v40 = v19 - v15;
    if (v19 - v15 < 0.0) {
      double v40 = -(v19 - v15);
    }
    if (v40 > 0.01)
    {
      +[WCM_Logging logLevel:0 message:@"***********************************************************************************************"];
      +[WCM_Logging logLevel:0 message:@"* PCC UL and SCC UL are not contiguous!!! However, go ahead by making a envelop frequency range"];
      [(WCM_CellularController *)self cachedULCenterFreq];
      uint64_t v42 = v41;
      [(WCM_CellularController *)self cachedULBandwidth];
      +[WCM_Logging logLevel:0, @"*   PCC: cachedULCenterFreq(%lf) cachedULBandwidth(%lf)", v42, v43 message];
      [(WCM_CellularController *)self ulCenterFreq2];
      uint64_t v45 = v44;
      [(WCM_CellularController *)self ulBandwidth2];
      +[WCM_Logging logLevel:0, @"*   SCC: ulCenterFreq2(%lf) ulBandwidth2(%lf)", v45, v46 message];
      +[WCM_Logging logLevel:0 message:@"***********************************************************************************************"];
    }
  }
  double v47 = v29 - v11;
  double v48 = v11;
  result.var1 = v47;
  result.var0 = v48;
  return result;
}

- (void)setNetworkConfigOfInterest
{
  *(_OWORD *)keys = *(_OWORD *)&off_100210ED8;
  long long v60 = *(_OWORD *)&off_100210EE8;
  long long v61 = off_100210EF8;
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"ProtectWiFiRanging"))
  {
    +[WCM_Logging logLevel:3 message:@"Setting network config of interest to whole band"];
    xpc_object_t values = xpc_int64_create((uint64_t)((452.5 + 3800.0) * 0.5));
    xpc_object_t v54 = xpc_int64_create((uint64_t)(3800.0 - 452.5));
    xpc_object_t v55 = xpc_int64_create((uint64_t)((462.5 + 3800.0) * 0.5));
    xpc_object_t v56 = xpc_int64_create((uint64_t)(3800.0 - 462.5));
    xpc_object_t v57 = xpc_int64_create(3);
    xpc_object_t objects = xpc_dictionary_create((const char *const *)keys, &values, 5uLL);
    xpc_object_t v3 = xpc_array_create(&objects, 1uLL);
    [(WCM_CellularController *)self sendMessage:1202 withArgs:v3];
    for (uint64_t i = 0; i != 40; i += 8)
      xpc_release(*(xpc_object_t *)((char *)&values + i));
    xpc_release(objects);
    double v5 = v3;
  }
  else if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"Bb20PolicyConversion"))
  {
    xpc_object_t v6 = xpc_array_create(0, 0);
    xpc_object_t values = xpc_int64_create(857);
    xpc_object_t v54 = xpc_int64_create(115);
    xpc_object_t v55 = xpc_int64_create(875);
    xpc_object_t v56 = xpc_int64_create(169);
    xpc_object_t v57 = xpc_int64_create(3);
    uint64_t v58 = 0;
    xpc_object_t v7 = xpc_dictionary_create((const char *const *)keys, &values, 5uLL);
    xpc_array_append_value(v6, v7);
    for (uint64_t j = 0; j != 21; ++j)
    {
      uint64_t v9 = byte_1001EAF68[j];
      +[WCM_Logging logLevel:3, @"Setting network config of interest to band-a %d", v9 message];
      double v10 = (double *)((char *)&unk_1001E8E10 + 32 * v9);
      double v11 = v10[2];
      double v12 = v10[3] - v11;
      xpc_object_t objects = xpc_int64_create((uint64_t)(v11 + v12 * 0.5));
      xpc_object_t v48 = xpc_int64_create((uint64_t)v12);
      double v13 = v10[1] - *v10;
      xpc_object_t v49 = xpc_int64_create((uint64_t)(*v10 + v13 * 0.5));
      xpc_object_t v50 = xpc_int64_create((uint64_t)v13);
      xpc_object_t v51 = xpc_int64_create(3);
      uint64_t v52 = 0;
      xpc_object_t v14 = xpc_dictionary_create((const char *const *)keys, &objects, 5uLL);
      xpc_array_append_value(v6, v14);
    }
    for (uint64_t k = 0; k != 4; ++k)
    {
      uint64_t v16 = aMno[k];
      +[WCM_Logging logLevel:3, @"Setting network config of interest to band-b %d", v16 message];
      double v17 = (double *)((char *)&unk_1001E8410 + 32 * v16);
      double v18 = v17[2];
      double v19 = v17[3] - v18;
      xpc_object_t objects = xpc_int64_create((uint64_t)(v18 + v19 * 0.5));
      xpc_object_t v48 = xpc_int64_create((uint64_t)v19);
      double v20 = v17[1] - *v17;
      xpc_object_t v49 = xpc_int64_create((uint64_t)(*v17 + v20 * 0.5));
      xpc_object_t v50 = xpc_int64_create((uint64_t)v20);
      xpc_object_t v51 = xpc_int64_create(3);
      uint64_t v52 = 0;
      xpc_object_t v21 = xpc_dictionary_create((const char *const *)keys, &objects, 5uLL);
      xpc_array_append_value(v6, v21);
    }
    xpc_object_t v22 = xpc_uint64_create(0);
    xpc_object_t v23 = xpc_uint64_create(1uLL);
    [(WCM_CellularController *)self sendMessage:1202 withArgs:v6 withExtraKey:"kSubId" andExtraValue:v22];
    [(WCM_CellularController *)self sendMessage:1202 withArgs:v6 withExtraKey:"kSubId" andExtraValue:v23];
    +[WCM_Logging logLevel:3, @"Setting network config of interest to band2 %d", xpc_array_get_count(v6) message];
    if (xpc_array_get_count(v6))
    {
      size_t v24 = 0;
      do
      {
        xpc_object_t value = xpc_array_get_value(v6, v24);
        xpc_release(value);
        ++v24;
      }
      while (xpc_array_get_count(v6) > v24);
    }
    xpc_release(v6);
    xpc_release(v22);
    double v5 = v23;
  }
  else
  {
    +[WCM_Logging logLevel:3 message:@"Setting network config of interest to band 7"];
    v46[0] = xpc_int64_create((uint64_t)((2570.0 - 2500.0) * 0.5 + 2500.0));
    v46[1] = xpc_int64_create((uint64_t)(2570.0 - 2500.0));
    v46[2] = xpc_int64_create((uint64_t)((2690.0 - 2620.0) * 0.5 + 2620.0));
    v46[3] = xpc_int64_create((uint64_t)(2690.0 - 2620.0));
    v46[4] = xpc_int64_create(3);
    xpc_object_t object = xpc_dictionary_create((const char *const *)keys, v46, 5uLL);
    xpc_object_t v26 = xpc_array_create(&object, 1uLL);
    +[WCM_Logging logLevel:3 message:@"Setting network config of interest to band 40"];
    xpc_object_t values = xpc_int64_create((uint64_t)((2400.0 - 2300.0) * 0.5 + 2300.0));
    xpc_object_t v54 = xpc_int64_create((uint64_t)(2400.0 - 2300.0));
    xpc_object_t v55 = xpc_int64_create((uint64_t)((2400.0 - 2300.0) * 0.5 + 2300.0));
    xpc_object_t v56 = xpc_int64_create((uint64_t)(2400.0 - 2300.0));
    xpc_object_t v57 = xpc_int64_create(3);
    uint64_t v58 = 0;
    xpc_object_t v37 = xpc_dictionary_create((const char *const *)keys, &values, 5uLL);
    xpc_array_append_value(v26, v37);
    +[WCM_Logging logLevel:3 message:@"Setting network config of interest to band 41A"];
    xpc_object_t objects = xpc_int64_create(2522);
    xpc_object_t v48 = xpc_int64_create(55);
    xpc_object_t v49 = xpc_int64_create(2522);
    xpc_object_t v50 = xpc_int64_create(55);
    xpc_object_t v51 = xpc_int64_create(3);
    uint64_t v52 = 0;
    xpc_object_t v36 = xpc_dictionary_create((const char *const *)keys, &objects, 5uLL);
    xpc_array_append_value(v26, v36);
    v45[0] = xpc_int64_create(857);
    v45[1] = xpc_int64_create(115);
    v45[2] = xpc_int64_create(875);
    v45[3] = xpc_int64_create(169);
    v45[4] = xpc_int64_create(3);
    v45[5] = 0;
    xpc_object_t v27 = xpc_dictionary_create((const char *const *)keys, v45, 5uLL);
    if ((objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"AntennaSelectionCoex") & 1) != 0|| objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"AntennaSelectionV2Coex"))
    {
      +[WCM_Logging logLevel:3 message:@"Setting network config of interest to combined range for band 5, 8, 18, 19, 20, 26, 27 and bc10"];
      xpc_array_append_value(v26, v27);
    }
    xpc_object_t v35 = v27;
    v44[0] = xpc_int64_create((uint64_t)((1980.0 - 1920.0) * 0.5 + 1920.0));
    v44[1] = xpc_int64_create((uint64_t)(1980.0 - 1920.0));
    v44[2] = xpc_int64_create((uint64_t)((2170.0 - 2110.0) * 0.5 + 2110.0));
    v44[3] = xpc_int64_create((uint64_t)(2170.0 - 2110.0));
    v44[4] = xpc_int64_create(3);
    v44[5] = 0;
    xpc_object_t v28 = xpc_dictionary_create((const char *const *)keys, v44, 5uLL);
    v43[0] = xpc_int64_create((uint64_t)((1785.0 - 1710.0) * 0.5 + 1710.0));
    v43[1] = xpc_int64_create((uint64_t)(1785.0 - 1710.0));
    v43[2] = xpc_int64_create((uint64_t)((1880.0 - 1805.0) * 0.5 + 1805.0));
    v43[3] = xpc_int64_create((uint64_t)(1880.0 - 1805.0));
    v43[4] = xpc_int64_create(3);
    v43[5] = 0;
    xpc_object_t v29 = xpc_dictionary_create((const char *const *)keys, v43, 5uLL);
    v42[0] = xpc_int64_create((uint64_t)((1755.0 - 1710.0) * 0.5 + 1710.0));
    v42[1] = xpc_int64_create((uint64_t)(1755.0 - 1710.0));
    v42[2] = xpc_int64_create((uint64_t)((2155.0 - 2110.0) * 0.5 + 2110.0));
    v42[3] = xpc_int64_create((uint64_t)(2155.0 - 2110.0));
    v42[4] = xpc_int64_create(3);
    v42[5] = 0;
    xpc_object_t v30 = xpc_dictionary_create((const char *const *)keys, v42, 5uLL);
    v41[0] = xpc_int64_create((uint64_t)((1915.0 - 1850.0) * 0.5 + 1850.0));
    v41[1] = xpc_int64_create((uint64_t)(1915.0 - 1850.0));
    v41[2] = xpc_int64_create((uint64_t)((1995.0 - 1930.0) * 0.5 + 1930.0));
    v41[3] = xpc_int64_create((uint64_t)(1995.0 - 1930.0));
    v41[4] = xpc_int64_create(3);
    v41[5] = 0;
    xpc_object_t v31 = xpc_dictionary_create((const char *const *)keys, v41, 5uLL);
    v40[0] = xpc_int64_create((uint64_t)((2025.0 - 2010.0) * 0.5 + 2010.0));
    v40[1] = xpc_int64_create((uint64_t)(2025.0 - 2010.0));
    v40[2] = xpc_int64_create((uint64_t)((2025.0 - 2010.0) * 0.5 + 2010.0));
    v40[3] = xpc_int64_create((uint64_t)(2025.0 - 2010.0));
    v40[4] = xpc_int64_create(3);
    v40[5] = 0;
    xpc_object_t v32 = xpc_dictionary_create((const char *const *)keys, v40, 5uLL);
    v39[0] = xpc_int64_create((uint64_t)((1920.0 - 1880.0) * 0.5 + 1880.0));
    v39[1] = xpc_int64_create((uint64_t)(1920.0 - 1880.0));
    v39[2] = xpc_int64_create((uint64_t)((1920.0 - 1880.0) * 0.5 + 1880.0));
    v39[3] = xpc_int64_create((uint64_t)(1920.0 - 1880.0));
    v39[4] = xpc_int64_create(3);
    v39[5] = 0;
    xpc_object_t v33 = xpc_dictionary_create((const char *const *)keys, v39, 5uLL);
    if ((objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"AntennaSelectionCoex") & 1) != 0|| (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"AntennaSelectionV2Coex") & 1) != 0|| objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"WiFiOCLSupport"))
    {
      +[WCM_Logging logLevel:3 message:@"Setting network config of interest to band 1, 3, 4, 25, 34"];
      xpc_array_append_value(v26, v28);
      xpc_array_append_value(v26, v29);
      xpc_array_append_value(v26, v30);
      xpc_array_append_value(v26, v31);
      xpc_array_append_value(v26, v32);
      xpc_array_append_value(v26, v33);
    }
    [(WCM_CellularController *)self sendMessage:1202 withArgs:v26];
    for (uint64_t m = 0; m != 5; ++m)
    {
      xpc_release(v46[m]);
      xpc_release(*(xpc_object_t *)((char *)&values + m * 8));
      xpc_release(*(xpc_object_t *)((char *)&objects + m * 8));
      xpc_release(v45[m]);
      xpc_release(v44[m]);
      xpc_release(v43[m]);
      xpc_release(v42[m]);
      xpc_release(v41[m]);
      xpc_release(v40[m]);
      xpc_release(v39[m]);
    }
    xpc_release(object);
    xpc_release(v37);
    xpc_release(v36);
    xpc_release(v35);
    xpc_release(v28);
    xpc_release(v29);
    xpc_release(v30);
    xpc_release(v31);
    xpc_release(v32);
    xpc_release(v33);
    double v5 = v26;
  }
  xpc_release(v5);
}

- (void)setScanFrequencyBandFilter:(id)a3
{
  xpc_object_t v5 = xpc_array_create(0, 0);
  *(_OWORD *)keys = *(_OWORD *)&off_100210F08;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(a3);
        }
        double v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v10 count] != (id)2)
        {
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, @"Invalid scan Freq len: %d", [v10 count]);
          goto LABEL_11;
        }
        double v11 = [[v10 objectAtIndex:1] integerValue];
        unint64_t v12 = v11 - (unsigned char *)[v10 objectAtIndex:0].integerValue;
        xpc_object_t values = xpc_int64_create((int64_t)[v10 objectAtIndex:0] + (v12 >> 1));
        xpc_object_t object = xpc_int64_create(v12);
        xpc_object_t v13 = xpc_dictionary_create((const char *const *)keys, &values, 2uLL);
        xpc_array_append_value(v5, v13);
        xpc_release(values);
        xpc_release(object);
        xpc_release(v13);
      }
      id v7 = [a3 countByEnumeratingWithState:&v16 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:
  xpc_object_t v14 = xpc_uint64_create(0);
  [(WCM_CellularController *)self sendMessage:1208 withArgs:v5 withExtraKey:"kSubId" andExtraValue:v14];
  xpc_release(v14);
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"LTEDualSubCoexSupport"))
  {
    xpc_object_t v15 = xpc_uint64_create(1uLL);
    [(WCM_CellularController *)self sendMessage:1208 withArgs:v5 withExtraKey:"kSubId" andExtraValue:v15];
    xpc_release(v15);
  }
  xpc_release(v5);
}

- (void)setLAACoexConfig:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") platformManager];
  [v5 wcmCellularLAACoexProtectCQIPeriod];
  [v5 wcmCellularLAACoexThresholdIn];
  [v5 wcmCellularLAACoexThresholdOut];
  [v5 wcmCellularLAACoexDeactTimer];
  [v5 wcmCellularLAACoexDeactStopTimer];
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v6, "WCMCellularSetLAAConfig_CoexEnable", 1);
  +[WCM_Logging logLevel:3, @"Setting LAA Coex Config for Cellular with RCU priority: %d", v3 message];
  id v7 = [v5 wcmCellularLAACoexProtectCQIPeriod];
  id v8 = [v5 wcmCellularLAACoexThresholdIn];
  id v9 = [v5 wcmCellularLAACoexThresholdOut];
  if (v3)
  {
    uint64_t v10 = 200;
    uint64_t v11 = 200;
  }
  else
  {
    uint64_t v10 = (uint64_t)[v5 wcmCellularLAACoexDeactTimer];
    uint64_t v11 = (uint64_t)[v5 wcmCellularLAACoexDeactStopTimer];
  }
  if ((v3 & 7) != 0) {
    uint64_t v12 = 255;
  }
  else {
    uint64_t v12 = (uint64_t)v7;
  }
  xpc_dictionary_set_uint64(v6, "WCMCellularSetLAAConfig_ProtectCQIPeriod", v12);
  xpc_dictionary_set_uint64(v6, "WCMCellularSetLAAConfig_ThresholdIn", (uint64_t)v8);
  xpc_dictionary_set_uint64(v6, "WCMCellularSetLAAConfig_ThresholdOut", (uint64_t)v9);
  xpc_dictionary_set_uint64(v6, "WCMCellularSetLAAConfig_DeactTimer", v10);
  xpc_dictionary_set_uint64(v6, "WCMCellularSetLAAConfig_DeactStopTimer", v11);
  xpc_object_t v13 = xpc_uint64_create(0);
  [(WCM_CellularController *)self sendMessage:1211 withArgs:v6 withExtraKey:"kSubId" andExtraValue:v13];
  [(WCM_CellularController *)self setRc1priority:v3];
  xpc_release(v13);

  xpc_release(v6);
}

- (void)setRC1Duration:(unint64_t)a3
{
  id v5 = +[WCM_PolicyManager singleton];
  +[WCM_Logging logLevel:3, @"Setting RC1 duration in BB %d", a3 message];
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v7 = xpc_uint64_create(0);
  if (!objc_msgSend(objc_msgSend(v5, "activeCoexFeatures"), "containsObject:", @"Bb20PolicyConversion"))
  {
    id v8 = "kWCMCellularRC1Duration";
    id v9 = v6;
    uint64_t v10 = a3;
    goto LABEL_9;
  }
  if (objc_msgSend(objc_msgSend(v5, "activeCoexFeatures"), "containsObject:", @"LaaRcu1ThrottlingDisabled"))
  {
    +[WCM_Logging logLevel:3 message:@"LAA to RCU1 Throttling disabled"];
  }
  else
  {
    unsigned int v11 = WORD1(a3);
    if (WORD1(a3) != 1)
    {
      uint64_t v12 = 1;
      goto LABEL_8;
    }
  }
  uint64_t v12 = 0;
  unsigned int v11 = 1;
LABEL_8:
  xpc_dictionary_set_uint64(v6, "kWCMCellularSetLaaGpioThrottleReq_Enabled", v12);
  uint64_t v10 = v11;
  id v8 = "kWCMCellularSetLaaGpioThrottleReq_Periodicity";
  id v9 = v6;
LABEL_9:
  xpc_dictionary_set_uint64(v9, v8, v10);
  if (objc_msgSend(objc_msgSend(v5, "activeCoexFeatures"), "containsObject:", @"UseWCMAriDriver"))
  {
    xpc_dictionary_set_uint64(v6, "WCMCellularSetLAAConfig_UwbRangingDuration", a3);
    xpc_dictionary_set_uint64(v6, "WCMCellularSetLAAConfig_UwbNarrowBandDuration", 0);
  }
  [(WCM_CellularController *)self sendMessage:1213 withArgs:v6 withExtraKey:"kSubId" andExtraValue:v7];
  [(WCM_CellularController *)self setRc1duration:a3];
  xpc_release(v7);

  xpc_release(v6);
}

- (void)configureCellularTimeShareConfigReqParamsWithCenterFreq:(unint64_t)a3 bandwidth:(unint64_t)a4
{
  [(WCM_CellularController *)self configureCellularTimeShareConfigReqParamsWithCenterFreq:a3 instance:0 bandwidth:a4];

  [(WCM_CellularController *)self configureCellularTimeShareConfigReqParamsWithCenterFreq:a3 instance:9 bandwidth:a4];
}

- (void)configureCellularTimeShareConfigReqParamsWithCenterFreq:(unint64_t)a3 instance:(unsigned int)a4 bandwidth:(unint64_t)a5
{
  +[WCM_Logging logLevel:4, @"configureCellularTimeShareConfigReqParamsWithInstance is called. BB side timesharing will be configured. (centerFreq = %d, instance = %d, bandwidth = %d)", a3, *(void *)&a4, a5 message];
  +[WCM_Logging logLevel:4 message:@"BB20:Updating time share config req params to cellular modem"];
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v9, "kWCMCellularSetTimeShareConfig_Enable", 1uLL);
  xpc_dictionary_set_uint64(v9, "kWCMCellularTimeShareConfig_CoexTech", a4);
  xpc_dictionary_set_uint64(v9, "kWCMCellularTimeShareConfig_CallType", 2uLL);
  xpc_dictionary_set_uint64(v9, "kWCMCellularTimeShareConfig_LongDrxCycle", 0x28uLL);
  xpc_dictionary_set_uint64(v9, "kWCMCellularTimeShareConfig_ShortDrxCycle", 0);
  xpc_dictionary_set_uint64(v9, "kWCMCellularTImeShareConfig_SleepWakeDurScale", 5uLL);
  xpc_object_t v10 = xpc_array_create(0, 0);
  xpc_object_t values = xpc_int64_create(a3);
  xpc_object_t object = xpc_int64_create(a5);
  *(_OWORD *)keys = *(_OWORD *)&off_100210F18;
  xpc_object_t v11 = xpc_dictionary_create((const char *const *)keys, &values, 2uLL);
  xpc_array_append_value(v10, v11);
  xpc_dictionary_set_value(v9, "kWCMCellularTImeShareConfig_BandInformationSet", v10);
  xpc_object_t v12 = xpc_uint64_create(0);
  [(WCM_CellularController *)self sendMessage:1214 withArgs:v9 withExtraKey:"kSubId" andExtraValue:v12];
  xpc_release(values);
  xpc_release(object);
  xpc_release(v11);
  xpc_release(v10);
  xpc_release(v12);
  xpc_release(v9);
}

- (void)configureCellularTimeShareConfigReqParamsWithCenterFreq:(unint64_t)a3 CoexTech:(unsigned int)a4 bandwidth:(unint64_t)a5 subId:(unint64_t)a6
{
  +[WCM_Logging logLevel:4, @"Cellular/WiFi TimeSharing: Configured to BB (subId = %llu, CoexTech = 0x%X, centerFreq = %llu,  bandwidth = %llu,)", a6, *(void *)&a4, a3, a5 message];
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v11, "kWCMCellularSetTimeShareConfig_Enable", 1uLL);
  xpc_dictionary_set_uint64(v11, "kWCMCellularTimeShareConfig_CoexTech", a4);
  xpc_dictionary_set_uint64(v11, "kWCMCellularTimeShareConfig_CallType", 2uLL);
  xpc_dictionary_set_uint64(v11, "kWCMCellularTimeShareConfig_LongDrxCycle", 0x28uLL);
  xpc_dictionary_set_uint64(v11, "kWCMCellularTimeShareConfig_ShortDrxCycle", 0);
  xpc_dictionary_set_uint64(v11, "kWCMCellularTImeShareConfig_SleepWakeDurScale", 5uLL);
  xpc_object_t v12 = xpc_array_create(0, 0);
  xpc_object_t values = xpc_int64_create(a3);
  xpc_object_t object = xpc_int64_create(a5);
  *(_OWORD *)keys = *(_OWORD *)&off_100210F18;
  xpc_object_t v13 = xpc_dictionary_create((const char *const *)keys, &values, 2uLL);
  xpc_array_append_value(v12, v13);
  xpc_dictionary_set_value(v11, "kWCMCellularTImeShareConfig_BandInformationSet", v12);
  xpc_object_t v14 = xpc_uint64_create(a6);
  [(WCM_CellularController *)self sendMessage:1214 withArgs:v11 withExtraKey:"kSubId" andExtraValue:v14];
  xpc_release(values);
  xpc_release(object);
  xpc_release(v13);
  xpc_release(v12);
  xpc_release(v14);
  xpc_release(v11);
}

- (void)disableCellularTimeShareConfigReqSubId:(unint64_t)a3
{
  +[WCM_Logging logLevel:4, @"Disable time share config req params to cellular modem SubId %llu", a3 message];
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v5, "kWCMCellularSetTimeShareConfig_Enable", 0);
  xpc_dictionary_set_uint64(v5, "kWCMCellularTimeShareConfig_CoexTech", 0);
  xpc_dictionary_set_uint64(v5, "kWCMCellularTimeShareConfig_CallType", 2uLL);
  xpc_dictionary_set_uint64(v5, "kWCMCellularTimeShareConfig_LongDrxCycle", 0);
  xpc_dictionary_set_uint64(v5, "kWCMCellularTimeShareConfig_ShortDrxCycle", 0);
  xpc_dictionary_set_uint64(v5, "kWCMCellularTImeShareConfig_SleepWakeDurScale", 0);
  xpc_object_t v6 = xpc_array_create(0, 0);
  xpc_object_t values = xpc_int64_create(0);
  xpc_object_t object = xpc_int64_create(0);
  *(_OWORD *)keys = *(_OWORD *)&off_100210F18;
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)keys, &values, 2uLL);
  xpc_array_append_value(v6, v7);
  xpc_dictionary_set_value(v5, "kWCMCellularTImeShareConfig_BandInformationSet", v6);
  xpc_object_t v8 = xpc_uint64_create(a3);
  [(WCM_CellularController *)self sendMessage:1214 withArgs:v5 withExtraKey:"kSubId" andExtraValue:v8];
  xpc_release(values);
  xpc_release(object);
  xpc_release(v7);
  xpc_release(v6);
  xpc_release(v8);
  xpc_release(v5);
}

- (void)setAntBlockingParams
{
  unsigned int v2 = [[[WCM_PolicyManager singleton] platformManager] wrmPlatformId];
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  +[WCM_Logging logLevel:4 message:@"BB20:Updating antenna blocking params to cellular modem"];
  xpc_object_t v4 = xpc_array_create(0, 0);
  xpc_object_t v5 = xpc_array_create(0, 0);
  xpc_object_t v6 = xpc_uint64_create(0xCAuLL);
  if (v2 <= 0xE && ((1 << v2) & 0x6800) != 0) {
    xpc_array_append_value(v5, v6);
  }
  xpc_object_t v54 = xpc_uint64_create(0xC8uLL);
  xpc_array_append_value(v5, v54);
  xpc_object_t v8 = xpc_uint64_create(0xC9uLL);
  if ((v2 | 4) == 0xF) {
    xpc_array_append_value(v5, v8);
  }
  xpc_object_t v9 = xpc_uint64_create(0xA1uLL);
  if (v2 == 15) {
    xpc_array_append_value(v5, v9);
  }
  xpc_object_t v51 = v9;
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v46 = v5;
  xpc_dictionary_set_value(v10, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v5);
  xpc_dictionary_set_uint64(v10, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 8uLL);
  xpc_object_t object = v10;
  xpc_array_append_value(v4, v10);
  xpc_object_t v11 = xpc_array_create(0, 0);
  xpc_object_t v12 = v11;
  long long v60 = v4;
  xpc_object_t v61 = v3;
  if (v2 == 14)
  {
    xpc_array_append_value(v11, v8);
    xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v13, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v12);
    xpc_dictionary_set_uint64(v13, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 9uLL);
    xpc_object_t v49 = v13;
    xpc_array_append_value(v4, v13);
  }
  else
  {
    xpc_object_t v49 = xpc_dictionary_create(0, 0, 0);
  }
  xpc_object_t v14 = xpc_array_create(0, 0);
  xpc_object_t v15 = xpc_uint64_create(0xA0uLL);
  xpc_object_t v16 = xpc_uint64_create(0xBFuLL);
  xpc_object_t v52 = v12;
  xpc_object_t v47 = v16;
  xpc_object_t v48 = v15;
  if (v2 == 14)
  {
    long long v17 = v16;
    xpc_array_append_value(v14, v15);
    xpc_array_append_value(v14, v17);
    xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v18, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v14);
    xpc_dictionary_set_uint64(v18, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 2uLL);
    xpc_object_t v45 = v18;
    xpc_array_append_value(v60, v18);
  }
  else
  {
    xpc_object_t v45 = xpc_dictionary_create(0, 0, 0);
  }
  xpc_object_t v53 = v8;
  xpc_object_t v55 = v6;
  xpc_object_t v19 = xpc_array_create(0, 0);
  xpc_object_t v20 = xpc_uint64_create(0xB6uLL);
  xpc_object_t v21 = xpc_uint64_create(0x79uLL);
  xpc_object_t v22 = xpc_uint64_create(0x90uLL);
  xpc_object_t v23 = xpc_uint64_create(0x7AuLL);
  xpc_object_t v24 = xpc_uint64_create(0x7BuLL);
  xpc_object_t v25 = xpc_uint64_create(0x9EuLL);
  xpc_object_t v26 = v61;
  xpc_object_t v50 = v14;
  uint64_t v58 = v21;
  uint64_t v59 = v20;
  xpc_object_t v57 = v22;
  if (v2 == 11)
  {
    xpc_array_append_value(v19, v20);
    xpc_array_append_value(v19, v21);
    xpc_array_append_value(v19, v22);
    xpc_array_append_value(v19, v23);
    xpc_array_append_value(v19, v24);
    xpc_array_append_value(v19, v25);
    xpc_object_t v27 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v27, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v19);
    xpc_dictionary_set_uint64(v27, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 1uLL);
    xpc_object_t v28 = v60;
    xpc_array_append_value(v60, v27);
    xpc_object_t v43 = xpc_array_create(0, 0);
    xpc_object_t v29 = xpc_dictionary_create(0, 0, 0);
    xpc_object_t v42 = xpc_array_create(0, 0);
    xpc_uint64_create(0x7EuLL);
    xpc_object_t v30 = xpc_dictionary_create(0, 0, 0);
    xpc_object_t v31 = v46;
  }
  else
  {
    xpc_object_t v41 = xpc_dictionary_create(0, 0, 0);
    xpc_object_t v32 = xpc_array_create(0, 0);
    xpc_object_t v28 = v60;
    xpc_object_t v31 = v46;
    xpc_object_t v43 = v32;
    if (v2 - 13 >= 2)
    {
      xpc_object_t v40 = xpc_dictionary_create(0, 0, 0);
      xpc_object_t v34 = v25;
    }
    else
    {
      xpc_object_t v33 = v32;
      xpc_array_append_value(v32, v20);
      xpc_array_append_value(v33, v58);
      xpc_array_append_value(v33, v57);
      xpc_object_t v34 = v25;
      xpc_array_append_value(v33, v25);
      xpc_object_t v35 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_value(v35, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v33);
      xpc_dictionary_set_uint64(v35, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 3uLL);
      xpc_object_t v40 = v35;
      xpc_array_append_value(v60, v35);
    }
    xpc_object_t v36 = xpc_array_create(0, 0);
    xpc_object_t v37 = xpc_uint64_create(0x7EuLL);
    unsigned int v38 = v2 - 148;
    if (v2 - 148 <= 4 && v2 != 150) {
      xpc_array_append_value(v36, v37);
    }
    xpc_object_t v39 = xpc_dictionary_create(0, 0, 0);
    xpc_object_t v30 = v39;
    xpc_object_t v42 = v36;
    if (v38 > 4)
    {
      xpc_object_t v26 = v61;
      xpc_object_t v25 = v34;
    }
    else
    {
      if (v38 != 2)
      {
        xpc_dictionary_set_value(v39, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v36);
        xpc_dictionary_set_uint64(v30, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 3uLL);
        xpc_array_append_value(v60, v30);
      }
      xpc_object_t v26 = v61;
    }
    xpc_object_t v29 = v40;
    xpc_object_t v27 = v41;
  }
  xpc_dictionary_set_value(v26, "kWCMCellularSetAntBlocking_BandInformationSet", v28);
  [(WCM_CellularController *)self sendMessage:1216 withArgs:v26];
  xpc_release(object);
  xpc_release(v27);
  xpc_release(v29);
  xpc_release(v49);
  xpc_release(v45);
  xpc_release(v30);
  xpc_release(v55);
  xpc_release(v53);
  xpc_release(v54);
  xpc_release(v51);
  xpc_release(v48);
  xpc_release(v47);
  xpc_release(v59);
  xpc_release(v58);
  xpc_release(v57);
  xpc_release(v23);
  xpc_release(v24);
  xpc_release(v25);
  xpc_release(v31);
  xpc_release(v19);
  xpc_release(v43);
  xpc_release(v52);
  xpc_release(v50);
  xpc_release(v42);
  xpc_release(v28);

  xpc_release(v26);
}

- (void)setClientAntBlockingParams22
{
  unsigned int v2 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") platformManager] wrmPlatformId];
  xpc_object_t v67 = xpc_dictionary_create(0, 0, 0);
  +[WCM_Logging logLevel:4 message:@"BB21:Updating WIFI antenna blocking params to cellular modem"];
  xpc_object_t v3 = xpc_array_create(0, 0);
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v65 = xpc_uint64_create(0);
  xpc_dictionary_set_value(v4, "kWCMCellularSetAntBlocking_ClientId", v65);
  xpc_object_t v63 = xpc_BOOL_create(0);
  xpc_dictionary_set_value(v4, "kWCMCellularSetAntBlocking_BlockVoice", v63);
  xpc_object_t v62 = xpc_uint64_create(0xFAuLL);
  xpc_dictionary_set_value(v4, "kWCMCellularSetAntBlocking_TimeMultiplier", v62);
  xpc_object_t v5 = xpc_array_create(0, 0);
  xpc_object_t v6 = xpc_array_create(0, 0);
  xpc_object_t v7 = xpc_uint64_create(0xCAuLL);
  uint64_t v72 = v7;
  if (v2 - 22 >= 4)
  {
    xpc_object_t object = xpc_dictionary_create(0, 0, 0);
  }
  else
  {
    xpc_array_append_value(v6, v7);
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v8, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v6);
    xpc_dictionary_set_uint64(v8, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 8uLL);
    xpc_object_t object = v8;
    xpc_array_append_value(v5, v8);
  }
  xpc_object_t v9 = xpc_array_create(0, 0);
  xpc_object_t v57 = v9;
  xpc_object_t v10 = v3;
  if ((v2 & 0xFFFFFFFE) == 0x18)
  {
    xpc_object_t v11 = v9;
    xpc_array_append_value(v9, v72);
    xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v12, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v11);
    xpc_dictionary_set_uint64(v12, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 9uLL);
    xpc_object_t v56 = v12;
    xpc_array_append_value(v5, v12);
  }
  else
  {
    xpc_object_t v56 = xpc_dictionary_create(0, 0, 0);
  }
  xpc_object_t v13 = xpc_array_create(0, 0);
  xpc_object_t v14 = xpc_uint64_create(0xBFuLL);
  xpc_object_t v15 = xpc_uint64_create(0xA0uLL);
  xpc_object_t v53 = v15;
  xpc_object_t v54 = v14;
  if (v2 - 22 >= 4)
  {
    xpc_object_t v52 = xpc_dictionary_create(0, 0, 0);
  }
  else
  {
    xpc_object_t v16 = v15;
    xpc_array_append_value(v13, v14);
    xpc_array_append_value(v13, v16);
    xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v17, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v13);
    xpc_dictionary_set_uint64(v17, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 4uLL);
    xpc_object_t v52 = v17;
    xpc_array_append_value(v5, v17);
  }
  xpc_object_t v73 = xpc_array_create(0, 0);
  xpc_object_t v18 = v10;
  if (v2 - 154 <= 4 && v2 != 156) {
    xpc_array_append_value(v73, v72);
  }
  xpc_object_t v19 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v20 = v19;
  if (v2 - 154 <= 4 && v2 != 156)
  {
    xpc_dictionary_set_value(v19, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v73);
    xpc_dictionary_set_uint64(v20, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 3uLL);
    xpc_array_append_value(v5, v20);
  }
  xpc_object_t v61 = v5;
  xpc_dictionary_set_value(v4, "kWCMCellularSetAntBlocking_BandInformationSet", v5);
  xpc_array_append_value(v10, v4);
  +[WCM_Logging logLevel:4 message:@"BB21:Updating RC1 antenna blocking params to cellular modem"];
  xpc_object_t v21 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v50 = xpc_uint64_create(1uLL);
  xpc_dictionary_set_value(v21, "kWCMCellularSetAntBlocking_ClientId", v50);
  xpc_object_t v49 = xpc_BOOL_create(1);
  xpc_dictionary_set_value(v21, "kWCMCellularSetAntBlocking_BlockVoice", v49);
  xpc_object_t v48 = xpc_uint64_create(0xFAuLL);
  xpc_dictionary_set_value(v21, "kWCMCellularSetAntBlocking_TimeMultiplier", v48);
  xpc_object_t v22 = xpc_array_create(0, 0);
  xpc_object_t v23 = xpc_array_create(0, 0);
  xpc_object_t v71 = xpc_uint64_create(0xBFuLL);
  xpc_object_t v70 = xpc_uint64_create(0xA0uLL);
  xpc_object_t v69 = xpc_dictionary_create(0, 0, 0);
  if (v2 - 23 <= 2)
  {
    xpc_array_append_value(v23, v70);
    xpc_array_append_value(v23, v71);
    xpc_dictionary_set_value(v69, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v23);
    xpc_dictionary_set_uint64(v69, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 2uLL);
    xpc_array_append_value(v22, v69);
  }
  xpc_object_t v46 = v23;
  xpc_object_t v51 = v20;
  xpc_object_t v55 = v13;
  xpc_object_t v59 = v6;
  int64_t v66 = v4;
  xpc_object_t v24 = xpc_array_create(0, 0);
  xpc_object_t v25 = xpc_uint64_create(0xC9uLL);
  xpc_object_t v26 = xpc_dictionary_create(0, 0, 0);
  unsigned int v60 = v2;
  if (v2 == 25)
  {
    xpc_array_append_value(v24, v25);
    xpc_dictionary_set_value(v26, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v24);
    xpc_dictionary_set_uint64(v26, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 4uLL);
    xpc_array_append_value(v22, v26);
  }
  xpc_object_t v43 = v26;
  xpc_object_t v44 = v25;
  xpc_object_t v45 = v24;
  xpc_object_t v47 = v22;
  xpc_dictionary_set_value(v21, "kWCMCellularSetAntBlocking_BandInformationSet", v22);
  xpc_array_append_value(v18, v21);
  +[WCM_Logging logLevel:4 message:@"BB21:Updating FC1 antenna blocking params to cellular modem"];
  xpc_object_t v27 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v42 = xpc_uint64_create(2uLL);
  xpc_dictionary_set_value(v27, "kWCMCellularSetAntBlocking_ClientId", v42);
  xpc_object_t v41 = xpc_BOOL_create(1);
  xpc_dictionary_set_value(v27, "kWCMCellularSetAntBlocking_BlockVoice", v41);
  xpc_object_t v40 = xpc_uint64_create(0xFAuLL);
  xpc_dictionary_set_value(v27, "kWCMCellularSetAntBlocking_TimeMultiplier", v40);
  xpc_object_t v28 = v18;
  xpc_array_append_value(v18, v27);
  +[WCM_Logging logLevel:4 message:@"BB22:Updating FC2 antenna blocking params to cellular modem"];
  xpc_object_t v29 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v39 = xpc_uint64_create(3uLL);
  xpc_dictionary_set_value(v29, "kWCMCellularSetAntBlocking_ClientId", v39);
  xpc_object_t v38 = xpc_BOOL_create(1);
  xpc_dictionary_set_value(v29, "kWCMCellularSetAntBlocking_BlockVoice", v38);
  xpc_object_t v37 = xpc_uint64_create(0xFAuLL);
  xpc_dictionary_set_value(v29, "kWCMCellularSetAntBlocking_TimeMultiplier", v37);
  xpc_object_t v30 = xpc_array_create(0, 0);
  xpc_object_t v31 = xpc_array_create(0, 0);
  xpc_object_t v32 = xpc_uint64_create(0xA0uLL);
  xpc_object_t v33 = xpc_uint64_create(0xBFuLL);
  xpc_object_t v68 = xpc_uint64_create(0x9DuLL);
  xpc_object_t v34 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v35 = v32;
  xpc_object_t v36 = v33;
  if (v60 != 22)
  {
    if (v60 != 25) {
      goto LABEL_24;
    }
    xpc_array_append_value(v31, v32);
    xpc_object_t v35 = v33;
    xpc_object_t v36 = v68;
  }
  xpc_array_append_value(v31, v35);
  xpc_array_append_value(v31, v36);
  xpc_dictionary_set_value(v34, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v31);
  xpc_dictionary_set_uint64(v34, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 2uLL);
  xpc_array_append_value(v30, v34);
LABEL_24:
  xpc_dictionary_set_value(v29, "kWCMCellularSetAntBlocking_BandInformationSet", v30);
  xpc_array_append_value(v28, v29);
  xpc_dictionary_set_value(v67, "kWCMCellularSetAntBlocking_ClientInformationSet", v28);
  [(WCM_CellularController *)self sendMessage:1221 withArgs:v67];
  xpc_release(object);
  xpc_release(v72);
  xpc_release(v59);
  xpc_release(v56);
  xpc_release(v57);
  xpc_release(v52);
  xpc_release(v54);
  xpc_release(v53);
  xpc_release(v55);
  xpc_release(v51);
  xpc_release(v73);
  xpc_release(v61);
  xpc_release(v66);
  xpc_release(v65);
  xpc_release(v63);
  xpc_release(v62);
  xpc_release(v43);
  xpc_release(v69);
  xpc_release(v44);
  xpc_release(v71);
  xpc_release(v70);
  xpc_release(v45);
  xpc_release(v46);
  xpc_release(v47);
  xpc_release(v21);
  xpc_release(v50);
  xpc_release(v49);
  xpc_release(v48);
  xpc_release(v27);
  xpc_release(v42);
  xpc_release(v41);
  xpc_release(v40);
  xpc_release(v34);
  xpc_release(v32);
  xpc_release(v33);
  xpc_release(v68);
  xpc_release(v31);
  xpc_release(v30);
  xpc_release(v29);
  xpc_release(v39);
  xpc_release(v38);
  xpc_release(v37);
  xpc_release(v67);

  xpc_release(v28);
}

- (void)setClientAntBlockingParams
{
  unsigned int v2 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") platformManager] wrmPlatformId];
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  +[WCM_Logging logLevel:4 message:@"BB21:Updating WIFI antenna blocking params to cellular modem"];
  xpc_object_t v110 = xpc_array_create(0, 0);
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v86 = xpc_uint64_create(0);
  xpc_dictionary_set_value(v3, "kWCMCellularSetAntBlocking_ClientId", v86);
  xpc_object_t v85 = xpc_BOOL_create(0);
  xpc_dictionary_set_value(v3, "kWCMCellularSetAntBlocking_BlockVoice", v85);
  xpc_object_t v84 = xpc_uint64_create(0xFAuLL);
  xpc_dictionary_set_value(v3, "kWCMCellularSetAntBlocking_TimeMultiplier", v84);
  xpc_object_t v4 = xpc_array_create(0, 0);
  xpc_object_t v5 = xpc_array_create(0, 0);
  xpc_object_t v6 = xpc_uint64_create(0xCAuLL);
  unsigned int v7 = v2 - 16;
  double v99 = v6;
  if (v2 - 16 >= 4)
  {
    xpc_object_t object = xpc_dictionary_create(0, 0, 0);
  }
  else
  {
    xpc_array_append_value(v5, v6);
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v8, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v5);
    xpc_dictionary_set_uint64(v8, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 8uLL);
    xpc_object_t object = v8;
    xpc_array_append_value(v4, v8);
  }
  xpc_object_t v9 = xpc_array_create(0, 0);
  xpc_object_t v10 = xpc_uint64_create(0x78uLL);
  xpc_object_t v11 = xpc_uint64_create(0x79uLL);
  xpc_object_t v12 = xpc_uint64_create(0x7AuLL);
  xpc_object_t v78 = xpc_uint64_create(0x90uLL);
  xpc_object_t v13 = xpc_uint64_create(0x9EuLL);
  char v109 = v4;
  xpc_object_t v79 = v11;
  xpc_object_t v77 = v13;
  uint64_t v72 = v10;
  id v96 = v12;
  if (v2 == 17)
  {
    xpc_object_t v14 = v13;
    xpc_array_append_value(v9, v10);
    xpc_array_append_value(v9, v11);
    xpc_object_t v15 = v14;
LABEL_7:
    xpc_array_append_value(v9, v15);
    xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
LABEL_8:
    xpc_dictionary_set_value(v16, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v9);
    xpc_dictionary_set_uint64(v16, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 3uLL);
    xpc_array_append_value(v109, v16);
    goto LABEL_9;
  }
  xpc_object_t v15 = v12;
  if ((v2 | 2) == 0x12) {
    goto LABEL_7;
  }
  xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
  if (v7 <= 3) {
    goto LABEL_8;
  }
LABEL_9:
  xpc_object_t v81 = v9;
  xpc_object_t v17 = xpc_array_create(0, 0);
  xpc_object_t v18 = xpc_uint64_create(0x9FuLL);
  xpc_object_t v82 = v5;
  xpc_object_t v74 = v18;
  if (v2 == 144)
  {
    int v19 = 0;
    xpc_object_t v20 = v18;
    goto LABEL_13;
  }
  if (v2 == 131)
  {
    int v19 = 1;
    xpc_object_t v20 = v99;
LABEL_13:
    xpc_array_append_value(v17, v20);
    xpc_object_t v21 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v21, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v17);
    xpc_dictionary_set_uint64(v21, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 6uLL);
    xpc_object_t v73 = v21;
    xpc_array_append_value(v109, v21);
    xpc_object_t v105 = xpc_array_create(0, 0);
    int v67 = 0;
    goto LABEL_19;
  }
  xpc_object_t v73 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v105 = xpc_array_create(0, 0);
  if (v2 == 146)
  {
    xpc_array_append_value(v105, v99);
    int v19 = 0;
    int v67 = 1;
  }
  else
  {
    int v67 = 0;
    int v19 = 0;
  }
LABEL_19:
  xpc_object_t v98 = xpc_uint64_create(0xA8uLL);
  xpc_object_t v97 = xpc_uint64_create(0xB8uLL);
  xpc_object_t v22 = xpc_uint64_create(0xC2uLL);
  if (v19)
  {
    xpc_array_append_value(v105, v96);
    xpc_array_append_value(v105, v98);
    xpc_array_append_value(v105, v97);
    xpc_array_append_value(v105, v22);
  }
  xpc_object_t v71 = v22;
  xpc_object_t v23 = v17;
  xpc_object_t v101 = xpc_dictionary_create(0, 0, 0);
  if (v2 == 146 || v2 == 131)
  {
    xpc_dictionary_set_value(v101, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v105);
    xpc_dictionary_set_uint64(v101, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 4uLL);
    xpc_array_append_value(v109, v101);
  }
  xpc_object_t v24 = xpc_array_create(0, 0);
  xpc_object_t v25 = xpc_uint64_create(0xA0uLL);
  xpc_object_t v26 = xpc_uint64_create(0xBFuLL);
  xpc_object_t v69 = v25;
  xpc_object_t v70 = v24;
  xpc_object_t v68 = v26;
  if (v19)
  {
    xpc_object_t v27 = v26;
    xpc_array_append_value(v24, v25);
    xpc_array_append_value(v24, v27);
    xpc_object_t v28 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v28, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v24);
    xpc_dictionary_set_uint64(v28, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 3uLL);
    xpc_object_t v63 = v28;
    xpc_array_append_value(v109, v28);
  }
  else
  {
    xpc_object_t v63 = xpc_dictionary_create(0, 0, 0);
  }
  xpc_object_t v75 = v23;
  if (v7 < 4 || v2 - 131 <= 0xF && ((1 << (v2 + 125)) & 0xA001) != 0) {
    xpc_dictionary_set_value(v3, "kWCMCellularSetAntBlocking_BandInformationSet", v109);
  }
  xpc_array_append_value(v110, v3);
  +[WCM_Logging logLevel:4 message:@"BB21:Updating RC1 antenna blocking params to cellular modem"];
  xpc_object_t v29 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v65 = xpc_uint64_create(1uLL);
  xpc_dictionary_set_value(v29, "kWCMCellularSetAntBlocking_ClientId", v65);
  xpc_object_t v64 = xpc_BOOL_create(1);
  xpc_dictionary_set_value(v29, "kWCMCellularSetAntBlocking_BlockVoice", v64);
  xpc_object_t v62 = xpc_uint64_create(0xFAuLL);
  xpc_dictionary_set_value(v29, "kWCMCellularSetAntBlocking_TimeMultiplier", v62);
  xpc_object_t v108 = xpc_array_create(0, 0);
  xpc_object_t v95 = xpc_array_create(0, 0);
  xpc_object_t v94 = xpc_uint64_create(0xCAuLL);
  xpc_object_t v93 = xpc_dictionary_create(0, 0, 0);
  if (v7 <= 3)
  {
    xpc_array_append_value(v95, v94);
    xpc_dictionary_set_value(v93, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v95);
    xpc_dictionary_set_uint64(v93, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 8uLL);
    xpc_array_append_value(v108, v93);
  }
  xpc_object_t v30 = xpc_array_create(0, 0);
  xpc_object_t v31 = xpc_uint64_create(0xBFuLL);
  xpc_object_t v90 = xpc_uint64_create(0xA0uLL);
  xpc_object_t v92 = xpc_dictionary_create(0, 0, 0);
  if (v7 <= 2)
  {
    xpc_array_append_value(v30, v31);
    if (v2 == 16) {
      xpc_array_append_value(v30, v90);
    }
    xpc_dictionary_set_value(v92, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v30);
    xpc_dictionary_set_uint64(v92, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 2uLL);
    xpc_array_append_value(v108, v92);
  }
  xpc_object_t v32 = xpc_array_create(0, 0);
  xpc_object_t v33 = xpc_uint64_create(0xC9uLL);
  xpc_object_t v34 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v76 = v16;
  xpc_object_t v56 = v34;
  if (v2 == 17)
  {
    xpc_object_t v35 = v34;
    xpc_array_append_value(v32, v33);
    xpc_dictionary_set_value(v35, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v32);
    xpc_dictionary_set_uint64(v35, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 4uLL);
    xpc_array_append_value(v108, v35);
LABEL_40:
    xpc_dictionary_set_value(v29, "kWCMCellularSetAntBlocking_BandInformationSet", v108);
    goto LABEL_41;
  }
  if (v7 <= 3) {
    goto LABEL_40;
  }
LABEL_41:
  xpc_array_append_value(v110, v29);
  +[WCM_Logging logLevel:4 message:@"BB21:Updating FC1 antenna blocking params to cellular modem"];
  xpc_object_t v36 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v57 = xpc_uint64_create(2uLL);
  xpc_dictionary_set_value(v36, "kWCMCellularSetAntBlocking_ClientId", v57);
  xpc_object_t v55 = xpc_BOOL_create(1);
  xpc_dictionary_set_value(v36, "kWCMCellularSetAntBlocking_BlockVoice", v55);
  xpc_object_t v54 = xpc_uint64_create(0xFAuLL);
  xpc_dictionary_set_value(v36, "kWCMCellularSetAntBlocking_TimeMultiplier", v54);
  xpc_object_t v104 = xpc_array_create(0, 0);
  xpc_object_t v107 = xpc_array_create(0, 0);
  xpc_object_t v106 = xpc_uint64_create(0xCAuLL);
  xpc_object_t v102 = xpc_uint64_create(0xC8uLL);
  xpc_object_t value = xpc_uint64_create(0xC9uLL);
  xpc_object_t v103 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v87 = v3;
  if (v7 < 2) {
    goto LABEL_44;
  }
  if (v2 == 18)
  {
LABEL_45:
    xpc_array_append_value(v107, v106);
LABEL_50:
    xpc_dictionary_set_value(v103, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v107);
    xpc_dictionary_set_uint64(v103, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 8uLL);
    xpc_array_append_value(v104, v103);
    xpc_dictionary_set_value(v36, "kWCMCellularSetAntBlocking_BandInformationSet", v104);
    xpc_array_append_value(v110, v36);
    goto LABEL_51;
  }
  if (v2 == 19)
  {
LABEL_44:
    xpc_array_append_value(v107, v106);
    xpc_array_append_value(v107, v102);
    if (v2 == 18) {
      goto LABEL_45;
    }
  }
  if ((v2 & 0xFFFFFFFE) == 0x16)
  {
    xpc_array_append_value(v107, v106);
    xpc_array_append_value(v107, v102);
    xpc_array_append_value(v107, value);
  }
  if (v2 <= 0x17 && ((1 << v2) & 0xCF0000) != 0) {
    goto LABEL_50;
  }
LABEL_51:
  xpc_object_t v58 = v33;
  xpc_object_t v60 = v31;
  xpc_object_t v61 = v30;
  +[WCM_Logging logLevel:4 message:@"BB21:Updating FC2 antenna blocking params to cellular modem"];
  xpc_object_t v37 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v53 = xpc_uint64_create(3uLL);
  xpc_dictionary_set_value(v37, "kWCMCellularSetAntBlocking_ClientId", v53);
  xpc_object_t v52 = xpc_BOOL_create(1);
  xpc_dictionary_set_value(v37, "kWCMCellularSetAntBlocking_BlockVoice", v52);
  xpc_object_t v51 = xpc_uint64_create(0xFAuLL);
  xpc_dictionary_set_value(v37, "kWCMCellularSetAntBlocking_TimeMultiplier", v51);
  xpc_object_t v38 = xpc_array_create(0, 0);
  xpc_object_t v39 = xpc_array_create(0, 0);
  xpc_object_t v40 = xpc_uint64_create(0xA0uLL);
  xpc_object_t v100 = xpc_uint64_create(0xBFuLL);
  xpc_object_t v41 = xpc_dictionary_create(0, 0, 0);
  if (v2 == 23 || v2 == 16)
  {
    xpc_array_append_value(v39, v40);
    xpc_array_append_value(v39, v100);
    xpc_dictionary_set_value(v41, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v39);
    xpc_dictionary_set_uint64(v41, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 2uLL);
    xpc_array_append_value(v38, v41);
    xpc_dictionary_set_value(v37, "kWCMCellularSetAntBlocking_BandInformationSet", v38);
    xpc_array_append_value(v110, v37);
  }
  xpc_object_t v50 = v40;
  xpc_object_t v59 = v32;
  xpc_object_t v66 = v29;
  +[WCM_Logging logLevel:4 message:@"BB21:Updating JPN REG CLIENT antenna blocking params to cellular modem"];
  xpc_object_t v42 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v49 = xpc_uint64_create(2uLL);
  xpc_dictionary_set_value(v42, "kWCMCellularSetAntBlocking_ClientId", v49);
  xpc_object_t v48 = xpc_BOOL_create(0);
  xpc_dictionary_set_value(v42, "kWCMCellularSetAntBlocking_BlockVoice", v48);
  xpc_object_t v47 = xpc_uint64_create(0xFAuLL);
  xpc_dictionary_set_value(v42, "kWCMCellularSetAntBlocking_TimeMultiplier", v47);
  xpc_object_t v43 = xpc_array_create(0, 0);
  xpc_object_t v44 = xpc_array_create(0, 0);
  xpc_object_t v45 = xpc_uint64_create(0xC8uLL);
  xpc_object_t v91 = xpc_uint64_create(0xC9uLL);
  xpc_object_t v46 = xpc_dictionary_create(0, 0, 0);
  if (v67)
  {
    xpc_array_append_value(v44, v45);
    xpc_array_append_value(v44, v91);
    xpc_dictionary_set_value(v46, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v44);
    xpc_dictionary_set_uint64(v46, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", 6uLL);
    xpc_array_append_value(v43, v46);
    xpc_dictionary_set_value(v42, "kWCMCellularSetAntBlocking_BandInformationSet", v43);
    xpc_array_append_value(v110, v42);
  }
  xpc_dictionary_set_value(xdict, "kWCMCellularSetAntBlocking_ClientInformationSet", v110);
  [(WCM_CellularController *)self sendMessage:1221 withArgs:xdict];
  xpc_release(object);
  xpc_release(v99);
  xpc_release(v82);
  xpc_release(v109);
  xpc_release(v76);
  xpc_release(v72);
  xpc_release(v79);
  xpc_release(v96);
  xpc_release(v78);
  xpc_release(v77);
  xpc_release(v81);
  xpc_release(v73);
  xpc_release(v74);
  xpc_release(v75);
  xpc_release(v101);
  xpc_release(v105);
  xpc_release(v63);
  xpc_release(v69);
  xpc_release(v68);
  xpc_release(v70);
  xpc_release(v98);
  xpc_release(v97);
  xpc_release(v71);
  xpc_release(v87);
  xpc_release(v86);
  xpc_release(v85);
  xpc_release(v84);
  xpc_release(v93);
  xpc_release(v92);
  xpc_release(v56);
  xpc_release(v94);
  xpc_release(v60);
  xpc_release(v58);
  xpc_release(v90);
  xpc_release(v95);
  xpc_release(v61);
  xpc_release(v59);
  xpc_release(v108);
  xpc_release(v66);
  xpc_release(v65);
  xpc_release(v64);
  xpc_release(v62);
  xpc_release(v103);
  xpc_release(v106);
  xpc_release(v102);
  xpc_release(value);
  xpc_release(v107);
  xpc_release(v104);
  xpc_release(v36);
  xpc_release(v57);
  xpc_release(v55);
  xpc_release(v54);
  xpc_release(v41);
  xpc_release(v100);
  xpc_release(v50);
  xpc_release(v39);
  xpc_release(v38);
  xpc_release(v37);
  xpc_release(v53);
  xpc_release(v52);
  xpc_release(v51);
  xpc_release(v46);
  xpc_release(v45);
  xpc_release(v91);
  xpc_release(v44);
  xpc_release(v43);
  xpc_release(v42);
  xpc_release(v49);
  xpc_release(v48);
  xpc_release(v47);
  xpc_release(xdict);

  xpc_release(v110);
}

- (void)setWci2TxAntMap
{
  xpc_object_t v3 = xpc_array_create(0, 0);
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  id v5 = +[WCM_PolicyManager singleton];
  +[WCM_Logging logLevel:4 message:@"BB20:Updating antenna map params to cellular modem"];
  xpc_dictionary_set_uint64(v4, "kWCMCellularSetWCI2TxAntMap_Enable", 1uLL);
  xpc_dictionary_set_uint64(v4, "kWCMCellularSetWCI2TxAntMap_DefaultIdx", 0);
  if (objc_msgSend(objc_msgSend(v5, "activeCoexFeatures"), "containsObject:", @"BBWCI2Type7mmWaveTxOn"))
  {
    +[WCM_Logging logLevel:4 message:@"Enable type7 mmWave TX on bit"];
    xpc_dictionary_set_uint64(v4, "kWCMCellularSetWCI2Type7FRTwoTxEnable", 1uLL);
    for (uint64_t i = 0; i != 10; ++i)
    {
      xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v7, "kWCMCellularSetWCI2TxAntMap_Infoet_AntIdx", i);
      BOOL v8 = i - 5 < 2;
      if (i == 4) {
        BOOL v8 = 0;
      }
      if ((i & 0x7E) == 2) {
        uint64_t v9 = 3;
      }
      else {
        uint64_t v9 = v8;
      }
      if (i == 1) {
        uint64_t v10 = 2;
      }
      else {
        uint64_t v10 = v9;
      }
      xpc_dictionary_set_uint64(v7, "kWCMCellularSetWCI2TxAntMap_InfoSet_WCI2Idx", v10);
      xpc_array_append_value(v3, v7);
    }
  }
  else
  {
    for (uint64_t j = -3; j != 7; ++j)
    {
      xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v12, "kWCMCellularSetWCI2TxAntMap_Infoet_AntIdx", j + 3);
      int v13 = (j + 3);
      if ((unint64_t)(j + 3) <= 6) {
        uint64_t v14 = 0;
      }
      else {
        uint64_t v14 = j;
      }
      if (v13 == 6) {
        uint64_t v14 = 1;
      }
      if (v13 == 5) {
        uint64_t v15 = 2;
      }
      else {
        uint64_t v15 = v14;
      }
      if ((((_BYTE)j + 2) & 0xFC) != 0) {
        uint64_t v16 = v15;
      }
      else {
        uint64_t v16 = j + 2;
      }
      xpc_dictionary_set_uint64(v12, "kWCMCellularSetWCI2TxAntMap_InfoSet_WCI2Idx", v16);
      xpc_array_append_value(v3, v12);
    }
  }
  xpc_dictionary_set_value(v4, "kWCMCellularSetWCI2TxAntMap_InformationSet", v3);
  [(WCM_CellularController *)self sendMessage:1215 withArgs:v4];
  if (xpc_array_get_count(v3))
  {
    size_t v17 = 0;
    do
    {
      xpc_object_t value = xpc_array_get_value(v3, v17);
      xpc_release(value);
      ++v17;
    }
    while (v17 < xpc_array_get_count(v3));
  }
  xpc_release(v3);

  xpc_release(v4);
}

- (void)setWci2TxAntMapBB21
{
  int v2 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") platformManager] wrmPlatformId];
  xpc_object_t v3 = xpc_array_create(0, 0);
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  +[WCM_Logging logLevel:4 message:@"BB21WCI2AntDebug_:Updating antenna map params to cellular modem"];
  xpc_dictionary_set_uint64(v4, "kWCMCellularSetWCI2TxAntMap_Enable", 1uLL);
  xpc_dictionary_set_uint64(v4, "kWCMCellularSetWCI2TxAntMap_DefaultIdx", 0);
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"BBWCI2Type7mmWaveTxOn"))
  {
    +[WCM_Logging logLevel:4 message:@"BB21WCI2AntDebug_: Enable ARBuffer mmW TX on bit"];
    xpc_dictionary_set_uint64(v4, "kWCMCellularSetWCI2Type7FRTwoTxEnable", 1uLL);
  }
  xpc_object_t xdict = v4;
  if (v2 <= 20)
  {
    if ((v2 - 16) < 4)
    {
      v49[0] = @"Ant-1";
      v50[0] = +[NSNumber numberWithInt:1];
      v49[1] = @"Ant-2";
      v50[1] = +[NSNumber numberWithInt:2];
      v49[2] = @"Ant-3";
      v50[2] = +[NSNumber numberWithInt:3];
      v49[3] = @"Ant-4";
      v50[3] = +[NSNumber numberWithInt:4];
      v49[4] = @"Ant-7";
      v50[4] = +[NSNumber numberWithInt:7];
      v49[5] = @"Ant-8";
      v50[5] = +[NSNumber numberWithInt:8];
      v49[6] = @"Ant-9";
      v50[6] = +[NSNumber numberWithInt:9];
      id v5 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:7];
      v47[0] = @"Ant-1";
      v48[0] = +[NSNumber numberWithInt:0];
      v47[1] = @"Ant-2";
      v48[1] = +[NSNumber numberWithInt:2];
      v47[2] = @"Ant-3";
      v48[2] = +[NSNumber numberWithInt:4];
      v47[3] = @"Ant-4";
      v48[3] = +[NSNumber numberWithInt:6];
      v47[4] = @"Ant-7";
      v48[4] = +[NSNumber numberWithInt:0];
      v47[5] = @"Ant-8";
      v48[5] = +[NSNumber numberWithInt:2];
      v47[6] = @"Ant-9";
      v48[6] = +[NSNumber numberWithInt:4];
      xpc_object_t v6 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:7];
      for (uint64_t i = 0; i != 10; ++i)
      {
        xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_uint64(v8, "kWCMCellularSetWCI2TxAntMap_Infoet_AntIdx", i);
        uint64_t v9 = [(NSDictionary *)v5 allKeysForObject:+[NSNumber numberWithInt:i]];
        if ([(NSArray *)v9 count]) {
          uint64_t v10 = (int)[v6 objectForKey:[v9 objectAtIndexedSubscript:0]].intValue;
        }
        else {
          uint64_t v10 = 0;
        }
        xpc_dictionary_set_uint64(v8, "kWCMCellularSetWCI2TxAntMap_InfoSet_WCI2Idx", v10);
        xpc_array_append_value(v3, v8);
      }
      goto LABEL_10;
    }
LABEL_43:
    +[WCM_Logging logLevel:1 message:@"BB21: platformID not defined to configure CellTxAntIdx over the bus"];
    goto LABEL_10;
  }
  if (v2 > 143)
  {
    if (v2 == 146)
    {
      v53[0] = @"Ant-1a";
      v54[0] = +[NSNumber numberWithInt:1];
      v53[1] = @"Ant-1b";
      v54[1] = +[NSNumber numberWithInt:2];
      v53[2] = @"Ant-2a";
      v54[2] = +[NSNumber numberWithInt:3];
      v53[3] = @"Ant-2b";
      v54[3] = +[NSNumber numberWithInt:4];
      v53[4] = @"Ant-3a";
      v54[4] = +[NSNumber numberWithInt:5];
      v53[5] = @"Ant-3b";
      v54[5] = +[NSNumber numberWithInt:6];
      v53[6] = @"Ant-4";
      v54[6] = +[NSNumber numberWithInt:7];
      xpc_object_t v31 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:7];
      v51[0] = @"Ant-1a";
      v52[0] = +[NSNumber numberWithInt:0];
      v51[1] = @"Ant-1b";
      v52[1] = +[NSNumber numberWithInt:1];
      v51[2] = @"Ant-2a";
      v52[2] = +[NSNumber numberWithInt:2];
      v51[3] = @"Ant-2b";
      v52[3] = +[NSNumber numberWithInt:3];
      v51[4] = @"Ant-3a";
      v52[4] = +[NSNumber numberWithInt:4];
      v51[5] = @"Ant-3b";
      v52[5] = +[NSNumber numberWithInt:5];
      v51[6] = @"Ant-4";
      v52[6] = +[NSNumber numberWithInt:6];
      xpc_object_t v32 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:7];
      for (uint64_t j = 0; j != 10; ++j)
      {
        xpc_object_t v34 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_uint64(v34, "kWCMCellularSetWCI2TxAntMap_Infoet_AntIdx", j);
        xpc_object_t v35 = [(NSDictionary *)v31 allKeysForObject:+[NSNumber numberWithInt:j]];
        if ([(NSArray *)v35 count]) {
          uint64_t v36 = (int)[v32 objectForKey:[v35 objectAtIndexedSubscript:0]];
        }
        else {
          uint64_t v36 = 0;
        }
        xpc_dictionary_set_uint64(v34, "kWCMCellularSetWCI2TxAntMap_InfoSet_WCI2Idx", v36);
        xpc_array_append_value(v3, v34);
      }
    }
    else
    {
      if (v2 != 144) {
        goto LABEL_43;
      }
      v57[0] = @"Ant-1a";
      v58[0] = +[NSNumber numberWithInt:1];
      v57[1] = @"Ant-1b";
      v58[1] = +[NSNumber numberWithInt:2];
      v57[2] = @"Ant-2";
      v58[2] = +[NSNumber numberWithInt:3];
      v57[3] = @"Ant-3a";
      v58[3] = +[NSNumber numberWithInt:4];
      v57[4] = @"Ant-3b";
      v58[4] = +[NSNumber numberWithInt:5];
      v57[5] = @"Ant-4";
      v58[5] = +[NSNumber numberWithInt:6];
      v57[6] = @"Ant-5T";
      v58[6] = +[NSNumber numberWithInt:7];
      int v19 = +[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:7];
      v55[0] = @"Ant-1a";
      v56[0] = +[NSNumber numberWithInt:0];
      v55[1] = @"Ant-1b";
      v56[1] = +[NSNumber numberWithInt:1];
      v55[2] = @"Ant-2";
      v56[2] = +[NSNumber numberWithInt:2];
      v55[3] = @"Ant-3a";
      v56[3] = +[NSNumber numberWithInt:3];
      v55[4] = @"Ant-3b";
      v56[4] = +[NSNumber numberWithInt:4];
      v55[5] = @"Ant-4";
      v56[5] = +[NSNumber numberWithInt:5];
      v55[6] = @"Ant-5T";
      v56[6] = +[NSNumber numberWithInt:6];
      xpc_object_t v20 = +[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:7];
      for (uint64_t k = 0; k != 10; ++k)
      {
        xpc_object_t v22 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_uint64(v22, "kWCMCellularSetWCI2TxAntMap_Infoet_AntIdx", k);
        xpc_object_t v23 = [(NSDictionary *)v19 allKeysForObject:+[NSNumber numberWithInt:k]];
        if ([(NSArray *)v23 count]) {
          uint64_t v24 = (int)[v20 objectForKey:[v23 objectAtIndexedSubscript:0]];
        }
        else {
          uint64_t v24 = 0;
        }
        xpc_dictionary_set_uint64(v22, "kWCMCellularSetWCI2TxAntMap_InfoSet_WCI2Idx", v24);
        xpc_array_append_value(v3, v22);
      }
    }
  }
  else if (v2 == 21)
  {
    v45[0] = @"Ant-1";
    v46[0] = +[NSNumber numberWithInt:1];
    v45[1] = @"Ant-2";
    v46[1] = +[NSNumber numberWithInt:2];
    v45[2] = @"Ant-3";
    v46[2] = +[NSNumber numberWithInt:3];
    v45[3] = @"Ant-4";
    v46[3] = +[NSNumber numberWithInt:4];
    v45[4] = @"Ant-6";
    v46[4] = +[NSNumber numberWithInt:6];
    xpc_object_t v25 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:5];
    v43[0] = @"Ant-1";
    v44[0] = +[NSNumber numberWithInt:0];
    v43[1] = @"Ant-2";
    v44[1] = +[NSNumber numberWithInt:1];
    v43[2] = @"Ant-3";
    v44[2] = +[NSNumber numberWithInt:2];
    v43[3] = @"Ant-4";
    v44[3] = +[NSNumber numberWithInt:3];
    v43[4] = @"Ant-6";
    v44[4] = +[NSNumber numberWithInt:4];
    xpc_object_t v26 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:5];
    for (uint64_t m = 0; m != 10; ++m)
    {
      xpc_object_t v28 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v28, "kWCMCellularSetWCI2TxAntMap_Infoet_AntIdx", m);
      xpc_object_t v29 = [(NSDictionary *)v25 allKeysForObject:+[NSNumber numberWithInt:m]];
      if ([(NSArray *)v29 count]) {
        uint64_t v30 = [[-[NSDictionary objectForKey:](v26, "objectForKey:", -[NSArray objectAtIndexedSubscript:](v29, "objectAtIndexedSubscript:", 0)) intValue];
      }
      else {
        uint64_t v30 = 0;
      }
      xpc_dictionary_set_uint64(v28, "kWCMCellularSetWCI2TxAntMap_InfoSet_WCI2Idx", v30);
      xpc_array_append_value(v3, v28);
    }
  }
  else
  {
    if (v2 != 131) {
      goto LABEL_43;
    }
    v41[0] = @"Ant-1a";
    v42[0] = +[NSNumber numberWithInt:7];
    v41[1] = @"Ant-1b";
    v42[1] = +[NSNumber numberWithInt:4];
    v41[2] = @"Ant-2a";
    v42[2] = +[NSNumber numberWithInt:8];
    v41[3] = @"Ant-2b";
    v42[3] = +[NSNumber numberWithInt:2];
    v41[4] = @"Ant-3a";
    v42[4] = +[NSNumber numberWithInt:3];
    v41[5] = @"Ant-3b";
    v42[5] = +[NSNumber numberWithInt:6];
    xpc_object_t v41[6] = @"Ant-4";
    xpc_object_t v42[6] = +[NSNumber numberWithInt:1];
    int v13 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:7];
    v39[0] = @"Ant-1a";
    v40[0] = +[NSNumber numberWithInt:0];
    v39[1] = @"Ant-1b";
    v40[1] = +[NSNumber numberWithInt:1];
    v39[2] = @"Ant-2a";
    v40[2] = +[NSNumber numberWithInt:2];
    v39[3] = @"Ant-2b";
    v40[3] = +[NSNumber numberWithInt:3];
    v39[4] = @"Ant-3a";
    v40[4] = +[NSNumber numberWithInt:4];
    v39[5] = @"Ant-3b";
    v40[5] = +[NSNumber numberWithInt:5];
    xpc_object_t v39[6] = @"Ant-4";
    xpc_object_t v40[6] = +[NSNumber numberWithInt:6];
    uint64_t v14 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:7];
    for (uint64_t n = 0; n != 10; ++n)
    {
      xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v16, "kWCMCellularSetWCI2TxAntMap_Infoet_AntIdx", n);
      size_t v17 = [(NSDictionary *)v13 allKeysForObject:+[NSNumber numberWithInt:n]];
      if ([(NSArray *)v17 count]) {
        uint64_t v18 = (int)[v14 objectForKey:[v17 objectAtIndexedSubscript:0]];
      }
      else {
        uint64_t v18 = 0;
      }
      xpc_dictionary_set_uint64(v16, "kWCMCellularSetWCI2TxAntMap_InfoSet_WCI2Idx", v18);
      xpc_array_append_value(v3, v16);
    }
  }
LABEL_10:
  xpc_dictionary_set_value(xdict, "kWCMCellularSetWCI2TxAntMap_InformationSet", v3);
  [(WCM_CellularController *)self sendMessage:1215 withArgs:xdict];
  if (xpc_array_get_count(v3))
  {
    size_t v11 = 0;
    do
    {
      xpc_object_t value = xpc_array_get_value(v3, v11);
      xpc_release(value);
      ++v11;
    }
    while (v11 < xpc_array_get_count(v3));
  }
  xpc_release(v3);
  xpc_release(xdict);
}

- (void)ConstructAntennaMapXpcMsg:(id)a3 AntPhyIdxDict:(id)a4 AntSpmiIdxDict:(id)a5
{
  if (a3 && a4 && a5)
  {
    for (uint64_t i = 0; i != 10; ++i)
    {
      xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v9, "kWCMCellularSetWCI2TxAntMap_Infoet_AntIdx", i);
      id v10 = [a4 allKeysForObject:[NSNumber numberWithInt:i]];
      if ([v10 count]) {
        uint64_t v11 = [(int)[objc_msgSend(a5, "objectForKey:", objc_msgSend(v10, "objectAtIndexedSubscript:", 0)) intValue]];
      }
      else {
        uint64_t v11 = 0;
      }
      xpc_dictionary_set_uint64(v9, "kWCMCellularSetWCI2TxAntMap_InfoSet_WCI2Idx", v11);
      xpc_array_append_value(a3, v9);
    }
  }
}

- (void)setWci2TxAntMapBB22
{
  unsigned int v2 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") platformManager] wrmPlatformId];
  xpc_object_t v3 = xpc_array_create(0, 0);
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  +[WCM_Logging logLevel:4 message:@"BB22AntMapping_:Updating antenna map params to cellular modem"];
  xpc_dictionary_set_uint64(v4, "kWCMCellularSetWCI2TxAntMap_Enable", 1uLL);
  xpc_dictionary_set_uint64(v4, "kWCMCellularSetWCI2TxAntMap_DefaultIdx", 0);
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"BBWCI2Type7mmWaveTxOn"))
  {
    +[WCM_Logging logLevel:4 message:@"BB22WCI2AntDebug_: Enable ARBuffer mmW TX on bit"];
    xpc_dictionary_set_uint64(v4, "kWCMCellularSetWCI2Type7FRTwoTxEnable", 1uLL);
  }
  BOOL v5 = v2 > 0x39 || ((1 << v2) & 0x3FC000003C00000) == 0;
  xpc_object_t xdict = v4;
  if (v5)
  {
    switch(v2)
    {
      case 0x9Au:
      case 0x9Bu:
      case 0x9Du:
      case 0x9Eu:
        v48[0] = @"Ant-1";
        v49[0] = +[NSNumber numberWithInt:2];
        v48[1] = @"Ant-2a";
        v49[1] = +[NSNumber numberWithInt:7];
        v48[2] = @"Ant-2b";
        v49[2] = +[NSNumber numberWithInt:4];
        v48[3] = @"Ant-3";
        v49[3] = +[NSNumber numberWithInt:1];
        v48[4] = @"Ant-4a";
        v49[4] = +[NSNumber numberWithInt:5];
        v48[5] = @"Ant-4b";
        v49[5] = +[NSNumber numberWithInt:3];
        xpc_object_t v12 = +[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:6];
        v46[0] = @"Ant-1";
        v47[0] = +[NSNumber numberWithInt:4];
        v46[1] = @"Ant-2a";
        v47[1] = +[NSNumber numberWithInt:6];
        v46[2] = @"Ant-2b";
        v47[2] = +[NSNumber numberWithInt:6];
        v46[3] = @"Ant-3";
        v47[3] = +[NSNumber numberWithInt:0];
        v46[4] = @"Ant-4a";
        v47[4] = +[NSNumber numberWithInt:2];
        void v46[5] = @"Ant-4b";
        v47[5] = +[NSNumber numberWithInt:2];
        int v13 = +[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:6];
        for (uint64_t i = 0; i != 10; ++i)
        {
          xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_uint64(v15, "kWCMCellularSetWCI2TxAntMap_Infoet_AntIdx", i);
          xpc_object_t v16 = [(NSDictionary *)v12 allKeysForObject:+[NSNumber numberWithInt:i]];
          if ([(NSArray *)v16 count]) {
            uint64_t v17 = (int)[v13 objectForKey:[v16 objectAtIndexedSubscript:0]];
          }
          else {
            uint64_t v17 = 0;
          }
          xpc_dictionary_set_uint64(v15, "kWCMCellularSetWCI2TxAntMap_InfoSet_WCI2Idx", v17);
          xpc_array_append_value(v3, v15);
        }
        break;
      case 0xA2u:
        v40[0] = @"Ant-1a";
        v41[0] = +[NSNumber numberWithInt:7];
        v40[1] = @"Ant-1b";
        v41[1] = +[NSNumber numberWithInt:4];
        v40[2] = @"Ant-2a";
        v41[2] = +[NSNumber numberWithInt:6];
        v40[3] = @"Ant-2b";
        v41[3] = +[NSNumber numberWithInt:2];
        v40[4] = @"Ant-3a";
        v41[4] = +[NSNumber numberWithInt:3];
        v40[5] = @"Ant-3b";
        v41[5] = +[NSNumber numberWithInt:5];
        xpc_object_t v40[6] = @"Ant-4";
        xpc_object_t v41[6] = +[NSNumber numberWithInt:1];
        uint64_t v18 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:7];
        v38[0] = @"Ant-1a";
        v39[0] = +[NSNumber numberWithInt:0];
        v38[1] = @"Ant-1b";
        v39[1] = +[NSNumber numberWithInt:1];
        v38[2] = @"Ant-2a";
        v39[2] = +[NSNumber numberWithInt:2];
        v38[3] = @"Ant-2b";
        v39[3] = +[NSNumber numberWithInt:3];
        v38[4] = @"Ant-3a";
        v39[4] = +[NSNumber numberWithInt:4];
        v38[5] = @"Ant-3b";
        v39[5] = +[NSNumber numberWithInt:5];
        v38[6] = @"Ant-4";
        xpc_object_t v39[6] = +[NSNumber numberWithInt:6];
        int v19 = v39;
        xpc_object_t v20 = v38;
        uint64_t v21 = 7;
        goto LABEL_24;
      case 0xA4u:
        v36[0] = @"Ant-1a";
        v37[0] = +[NSNumber numberWithInt:7];
        v36[1] = @"Ant-1b";
        v37[1] = +[NSNumber numberWithInt:4];
        v36[2] = @"Ant-2";
        v37[2] = +[NSNumber numberWithInt:2];
        v36[3] = @"Ant-3a";
        v37[3] = +[NSNumber numberWithInt:6];
        v36[4] = @"Ant-3b";
        v37[4] = +[NSNumber numberWithInt:3];
        v36[5] = @"Ant-4";
        v37[5] = +[NSNumber numberWithInt:1];
        uint64_t v18 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:6];
        v34[0] = @"Ant-1a";
        v35[0] = +[NSNumber numberWithInt:0];
        v34[1] = @"Ant-1b";
        v35[1] = +[NSNumber numberWithInt:1];
        v34[2] = @"Ant-2";
        v35[2] = +[NSNumber numberWithInt:2];
        v34[3] = @"Ant-3a";
        v35[3] = +[NSNumber numberWithInt:3];
        v34[4] = @"Ant-3b";
        v35[4] = +[NSNumber numberWithInt:4];
        v34[5] = @"Ant-4";
        v35[5] = +[NSNumber numberWithInt:5];
        int v19 = v35;
        xpc_object_t v20 = v34;
        goto LABEL_23;
      case 0xA6u:
        v32[0] = @"Ant-1a";
        v33[0] = +[NSNumber numberWithInt:6];
        v32[1] = @"Ant-1b";
        v33[1] = +[NSNumber numberWithInt:4];
        v32[2] = @"Ant-2";
        v33[2] = +[NSNumber numberWithInt:2];
        v32[3] = @"Ant-3a";
        v33[3] = +[NSNumber numberWithInt:5];
        v32[4] = @"Ant-3b";
        v33[4] = +[NSNumber numberWithInt:3];
        v32[5] = @"Ant-4";
        v33[5] = +[NSNumber numberWithInt:1];
        v32[6] = @"Ant-5T";
        v33[6] = +[NSNumber numberWithInt:7];
        uint64_t v18 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:7];
        v30[0] = @"Ant-1a";
        v31[0] = +[NSNumber numberWithInt:0];
        v30[1] = @"Ant-1b";
        v31[1] = +[NSNumber numberWithInt:1];
        v30[2] = @"Ant-2";
        v31[2] = +[NSNumber numberWithInt:2];
        v30[3] = @"Ant-3a";
        v31[3] = +[NSNumber numberWithInt:3];
        v30[4] = @"Ant-3b";
        v31[4] = +[NSNumber numberWithInt:4];
        v30[5] = @"Ant-4";
        v31[5] = +[NSNumber numberWithInt:5];
        int v19 = v31;
        xpc_object_t v20 = v30;
LABEL_23:
        uint64_t v21 = 6;
        goto LABEL_24;
      default:
        if ((v2 & 0xFFFFFFFD) == 0xA8)
        {
          v28[0] = @"Ant-1";
          v29[0] = +[NSNumber numberWithInt:2];
          v28[1] = @"Ant-2b";
          v29[1] = +[NSNumber numberWithInt:4];
          v28[2] = @"Ant-3";
          v29[2] = +[NSNumber numberWithInt:1];
          v28[3] = @"Ant-4b";
          v29[3] = +[NSNumber numberWithInt:3];
          uint64_t v18 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:4];
          v26[0] = @"Ant-1";
          v27[0] = +[NSNumber numberWithInt:4];
          v26[1] = @"Ant-2b";
          v27[1] = +[NSNumber numberWithInt:6];
          v26[2] = @"Ant-3";
          v27[2] = +[NSNumber numberWithInt:0];
          v26[3] = @"Ant-4b";
          v27[3] = +[NSNumber numberWithInt:2];
          int v19 = v27;
          xpc_object_t v20 = v26;
          uint64_t v21 = 4;
LABEL_24:
          [(WCM_CellularController *)self ConstructAntennaMapXpcMsg:v3 AntPhyIdxDict:v18 AntSpmiIdxDict:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v20, v21, v4)];
        }
        else
        {
          +[WCM_Logging logLevel:1 message:@"BB22: platformID not defined to configure CellTxAntIdx over the bus"];
        }
        break;
    }
  }
  else
  {
    v44[0] = @"Ant-1";
    v45[0] = +[NSNumber numberWithInt:1];
    v44[1] = @"Ant-2";
    v45[1] = +[NSNumber numberWithInt:2];
    v44[2] = @"Ant-3";
    v45[2] = +[NSNumber numberWithInt:3];
    v44[3] = @"Ant-4";
    v45[3] = +[NSNumber numberWithInt:4];
    v44[4] = @"Ant-7";
    v45[4] = +[NSNumber numberWithInt:7];
    void v44[5] = @"Ant-8";
    void v45[5] = +[NSNumber numberWithInt:8];
    xpc_object_t v44[6] = @"Ant-9";
    xpc_object_t v45[6] = +[NSNumber numberWithInt:9];
    xpc_object_t v6 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:7];
    v42[0] = @"Ant-1";
    v43[0] = +[NSNumber numberWithInt:0];
    v42[1] = @"Ant-2";
    v43[1] = +[NSNumber numberWithInt:2];
    v42[2] = @"Ant-3";
    v43[2] = +[NSNumber numberWithInt:4];
    v42[3] = @"Ant-4";
    v43[3] = +[NSNumber numberWithInt:6];
    v42[4] = @"Ant-7";
    v43[4] = +[NSNumber numberWithInt:0];
    v42[5] = @"Ant-8";
    void v43[5] = +[NSNumber numberWithInt:2];
    xpc_object_t v42[6] = @"Ant-9";
    xpc_object_t v43[6] = +[NSNumber numberWithInt:4];
    xpc_object_t v7 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:7];
    for (uint64_t j = 0; j != 10; ++j)
    {
      xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v9, "kWCMCellularSetWCI2TxAntMap_Infoet_AntIdx", j);
      id v10 = [(NSDictionary *)v6 allKeysForObject:+[NSNumber numberWithInt:j]];
      if ([(NSArray *)v10 count]) {
        uint64_t v11 = (int)[v7 objectForKey:[v10 objectAtIndexedSubscript:0]].intValue;
      }
      else {
        uint64_t v11 = 0;
      }
      xpc_dictionary_set_uint64(v9, "kWCMCellularSetWCI2TxAntMap_InfoSet_WCI2Idx", v11);
      xpc_array_append_value(v3, v9);
    }
  }
  xpc_dictionary_set_value(xdict, "kWCMCellularSetWCI2TxAntMap_InformationSet", v3);
  [(WCM_CellularController *)self sendMessage:1215 withArgs:xdict];
  if (xpc_array_get_count(v3))
  {
    size_t v22 = 0;
    do
    {
      xpc_object_t value = xpc_array_get_value(v3, v22);
      xpc_release(value);
      ++v22;
    }
    while (v22 < xpc_array_get_count(v3));
  }
  xpc_release(v3);
  xpc_release(xdict);
}

- (void)setGpsBandInfoToBB:(BOOL)a3 l5Enabled:(BOOL)a4 btA2DPEnabled:(BOOL)a5 l5Level:(unint64_t)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"DisableBBLegacyGnssMessage"))
  {
    +[WCM_Logging logLevel:4 message:@"Legacy GNSS messaging to BB is disabled in this platform"];
    return;
  }
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  +[WCM_Logging logLevel:4, @"BB20:Updating GPS band info params to cellular modem, L1=%d, L5=%d, a2dp=%d", v9, v8, v7 message];
  if (!v7)
  {
    if (v8) {
      uint64_t v12 = 6;
    }
    else {
      uint64_t v12 = 1;
    }
    uint64_t v13 = 1;
    if (v8 || v9) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (!v8)
  {
LABEL_13:
    uint64_t v13 = 0;
    uint64_t v12 = 7;
    goto LABEL_14;
  }
  uint64_t v12 = 5;
  uint64_t v13 = 1;
LABEL_14:
  xpc_dictionary_set_uint64(v11, "kWCMCellularSetGnssParamsReq_Enabled", v13);
  xpc_dictionary_set_uint64(v11, "kWCMCellularSetGnssParamsReq_Band", v12);
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"AntennaTuningForGpsBB21"))
  {
    +[WCM_Logging logLevel:4, @"BB20:Updating GPS L5 band level info params to cellular modem, l5Level=%d", a6 message];
    xpc_dictionary_set_uint64(v11, "kWCMCellularSetGnssParamsReq_L5Level", a6);
  }
  +[WCM_Logging logLevel:4, @"BB20:Set GNSS param bitmask=%d", v12 message];
  [(WCM_CellularController *)self sendMessage:1220 withArgs:v11];

  xpc_release(v11);
}

- (void)sendBBCameraState:(int)a3 state:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  uint64_t v5 = *(void *)&a3;
  [[[WCM_PolicyManager singleton] platformManager] wrmPlatformId];
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v8 = xpc_uint64_create(v5);
  xpc_object_t v9 = xpc_array_create(0, 0);
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v11 = xpc_array_create(0, 0);
  +[WCM_Logging logLevel:4, @"BB23: Requests to send camera info type %d enabled? %d", v5, v4 message];
  xpc_object_t v12 = xpc_uint64_create(v4);
  xpc_array_append_value(v9, v12);
  xpc_dictionary_set_value(v10, "kWCMCellularTransparentMessage_Type", v8);
  xpc_dictionary_set_value(v10, "kWCMCellularTransparentMessage_ByteList", v9);
  xpc_array_append_value(v11, v10);
  xpc_dictionary_set_value(v7, "kWCMCellularTransparentMessageInformationSet", v11);
  [(WCM_CellularController *)self sendMessage:1223 withArgs:v7];
  if (xpc_array_get_count(v9))
  {
    size_t v13 = 0;
    do
    {
      xpc_object_t value = xpc_array_get_value(v9, v13);
      xpc_release(value);
      ++v13;
    }
    while (xpc_array_get_count(v9) > v13);
  }
  xpc_release(v10);
  xpc_release(v8);
  xpc_release(v7);
  xpc_release(v11);

  xpc_release(v9);
}

- (int64_t)wci2TxPowerLimit
{
  return *(void *)&self->_rc1priority;
}

- (void)setWci2TxPowerLimit:(int64_t)a3
{
  *(void *)&self->_rc1priority = a3;
}

- (int64_t)controllerTxPowerLimit
{
  return *(int64_t *)((char *)&self->_wci2TxPowerLimit + 4);
}

- (void)setControllerTxPowerLimit:(int64_t)a3
{
  *(int64_t *)((char *)&self->_wci2TxPowerLimit + 4) = a3;
}

- (int64_t)rbThreshold
{
  return *(int64_t *)((char *)&self->_controllerTxPowerLimit + 4);
}

- (void)setWci2CoexPolicyBitmap:(unint64_t)a3
{
  *(int64_t *)((char *)&self->_rbThreshold + 4) = a3;
}

- (BOOL)lteCDRXWiFiTDD
{
  return self->_sensorInfo.usecase[0];
}

- (void)setLteCDRXWiFiTDD:(BOOL)a3
{
  self->_sensorInfo.usecase[0] = a3;
}

- (BOOL)enableFastCharging
{
  return self->_sensorInfo.usecase[1];
}

- (void)setEnableFastCharging:(BOOL)a3
{
  self->_sensorInfo.usecase[1] = a3;
}

- (BOOL)lowBandInABSReportFastCharging
{
  return self->_sensorInfo.usecase[2];
}

- (void)setLowBandInABSReportFastCharging:(BOOL)a3
{
  self->_sensorInfo.usecase[2] = a3;
}

- (NSTimer)baseBandEnabledProtectionTimer
{
  return *(NSTimer **)((char *)&self->_wci2CoexPolicyBitmap + 4);
}

- (void)setBaseBandEnabledProtectionTimer:(id)a3
{
}

- (NSTimer)fastChargingHystersisTimer
{
  return *(NSTimer **)((char *)&self->_baseBandEnabledProtectionTimer + 4);
}

- (void)setFastChargingHystersisTimer:(id)a3
{
}

- (unint64_t)wifiCenterFreqMHz
{
  return *(unint64_t *)((char *)&self->_fastChargingHystersisTimer + 4);
}

- (void)setWifiCenterFreqMHz:(unint64_t)a3
{
  *(NSTimer **)((char *)&self->_fastChargingHystersisTimer + 4) = (NSTimer *)a3;
}

- (unint64_t)wifiBandwidthMHz
{
  return *(unint64_t *)((char *)&self->_wifiCenterFreqMHz + 4);
}

- (void)setWifiBandwidthMHz:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_wifiCenterFreqMHz + 4) = a3;
}

- (unint64_t)wifiTxPowerdBm
{
  return *(unint64_t *)((char *)&self->_wifiBandwidthMHz + 4);
}

- (void)setWifiTxPowerdBm:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_wifiBandwidthMHz + 4) = a3;
}

- (int)watchAntPref
{
  return *(_DWORD *)&self->_lteCDRXWiFiTDD;
}

- (void)setWatchAntPref:(int)a3
{
  *(_DWORD *)&self->_lteCDRXWiFiTDD = a3;
}

- (int)watchAntPrefBand
{
  return self->_watchAntPref;
}

- (void)setWatchAntPrefBand:(int)a3
{
  self->_watchAntPref = a3;
}

- (void)setRc1duration:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_activeSubId + 4) = a3;
}

- (void)setRc1priority:(int)a3
{
  self->_watchAntPrefBand = a3;
}

- (void)setCC1CarrierId:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_rc1duration + 4) = a3;
}

- (void)setCC2CarrierId:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_CC1CarrierId + 4) = a3;
}

- (void)setCC1Tech:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_CC2CarrierId + 4) = a3;
}

- (void)setCC2Tech:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_CC1Tech + 4) = a3;
}

@end