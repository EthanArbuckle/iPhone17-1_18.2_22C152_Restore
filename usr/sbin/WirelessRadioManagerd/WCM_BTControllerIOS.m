@interface WCM_BTControllerIOS
- (BOOL)isBTMetricsValid;
- (BOOL)mActivePhyValid;
- (OS_dispatch_queue)queue;
- (WCM_BTControllerIOS)init;
- (double)getBtRxPer;
- (double)getBtTxPer;
- (double)mMovingAvgRSSI;
- (double)mNonMagnetUtilization;
- (id)createBTHCIExternalFrameConfigParams:(id)a3;
- (id)createChannelParameters:(id)a3;
- (int)getBTRole;
- (int)getBTState;
- (int64_t)getLeDiscoveryScanState;
- (int64_t)getLeDiscoveryScanUseCase;
- (unint64_t)getLeConnBand;
- (unint64_t)getLeConnDuration;
- (unint64_t)getLeConnDutyCycle;
- (unint64_t)getLeConnReason;
- (unint64_t)getMovingAvgBTRssi;
- (unint64_t)mActivePhy;
- (unint64_t)mBtPhyRate;
- (unint64_t)mClassicCoexDenialCount;
- (unint64_t)mClassicReTxCount;
- (unint64_t)mClassicRssi;
- (unint64_t)mClassicRxErrorCount;
- (unint64_t)mClassicSuccessfulRxCount;
- (unint64_t)mClassicSuccessfulTxCount;
- (unint64_t)mFlushCount;
- (unint64_t)mLQMLinkEvalCounter;
- (unint64_t)mLeCoexDenialCount;
- (unint64_t)mLeReTxCount;
- (unint64_t)mLeRssi;
- (unint64_t)mLeRxErrorCount;
- (unint64_t)mLeSuccessfulRxCount;
- (unint64_t)mLeSuccessfulTxCount;
- (unint64_t)mMetricsReportReason;
- (unint64_t)mMovingAvgReTxCount;
- (unint64_t)mMovingAvgRxErrorCount;
- (unint64_t)mMovingAvgSuccessfulRxCount;
- (unint64_t)mMovingAvgSuccessfulTxCount;
- (unint64_t)mNumberofSamples;
- (unint64_t)mPrevActivePhy;
- (void)bspBandSwitchReject:(int)a3 targetBand:(int)a4;
- (void)bspNotifyChannelQuality:(int)a3 quality:(unint64_t)a4;
- (void)bspRegulatoryInfoRequest:(id)a3 timeStamp:(int64_t)a4;
- (void)bspSetFrequencyBandToUse:(int)a3 allowedBands:(int)a4;
- (void)bspStatusRequest;
- (void)bspUpdateWiFiStatus:(BOOL)a3;
- (void)dealloc;
- (void)handelAFHMap:(id)a3;
- (void)handleAntennaPreferenceBResponse:(id)a3;
- (void)handleAntennaSwitchNotification:(id)a3;
- (void)handleBSPEvent:(id)a3;
- (void)handleBTBandwidthLoad:(id)a3;
- (void)handleBTMetricsRpt:(id)a3;
- (void)handleBTPhyRpt:(id)a3;
- (void)handleDisconnection:(id)a3;
- (void)handleHFBTChannelMap:(id)a3;
- (void)handleLTELinkQuality:(id)a3;
- (void)handleLeConn:(id)a3;
- (void)handleLeDiscoveryScanStateChange:(id)a3;
- (void)handleLinkQaulity:(id)a3;
- (void)handleMessage:(id)a3;
- (void)handlePowerState:(BOOL)a3;
- (void)handleRawRSSI:(id)a3;
- (void)handleScanStart:(id)a3;
- (void)handleScanStop:(id)a3;
- (void)printAFHMap:(char *)a3;
- (void)printBLEAFHMap:(char *)a3;
- (void)printHFBTChannelMap:(char *)a3;
- (void)resetBtMetrics;
- (void)setMActivePhy:(unint64_t)a3;
- (void)setMActivePhyValid:(BOOL)a3;
- (void)setMBtPhyRate:(unint64_t)a3;
- (void)setMClassicCoexDenialCount:(unint64_t)a3;
- (void)setMClassicReTxCount:(unint64_t)a3;
- (void)setMClassicRssi:(unint64_t)a3;
- (void)setMClassicRxErrorCount:(unint64_t)a3;
- (void)setMClassicSuccessfulRxCount:(unint64_t)a3;
- (void)setMClassicSuccessfulTxCount:(unint64_t)a3;
- (void)setMFlushCount:(unint64_t)a3;
- (void)setMLQMLinkEvalCounter:(unint64_t)a3;
- (void)setMLeCoexDenialCount:(unint64_t)a3;
- (void)setMLeReTxCount:(unint64_t)a3;
- (void)setMLeRssi:(unint64_t)a3;
- (void)setMLeRxErrorCount:(unint64_t)a3;
- (void)setMLeSuccessfulRxCount:(unint64_t)a3;
- (void)setMLeSuccessfulTxCount:(unint64_t)a3;
- (void)setMMetricsReportReason:(unint64_t)a3;
- (void)setMMovingAvgRSSI:(double)a3;
- (void)setMMovingAvgReTxCount:(unint64_t)a3;
- (void)setMMovingAvgRxErrorCount:(unint64_t)a3;
- (void)setMMovingAvgSuccessfulRxCount:(unint64_t)a3;
- (void)setMMovingAvgSuccessfulTxCount:(unint64_t)a3;
- (void)setMNonMagnetUtilization:(double)a3;
- (void)setMNumberofSamples:(unint64_t)a3;
- (void)setMPrevActivePhy:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)updateAntennaRSSIOffset;
- (void)updateAwakeMode:(BOOL)a3;
- (void)updateBLEActiveScanPwrLmtAssertionInterval:(unint64_t)a3;
- (void)updateBTRCU2TimingArray:(id)a3;
- (void)updateCarplayBTScanParams:(BOOL)a3 reason:(int)a4;
- (void)updateCoexRxGainMode:(id)a3;
- (void)updateDefaultBTAntenna:(int)a3;
- (void)updateDiversityAFHMapForC0B0:(id)a3 C0B1:(id)a4 C1B0:(id)a5 C1B1:(id)a6;
- (void)updateHFBtAntennaRequestWithDuration:(unint64_t)a3 unii1Enabled:(BOOL)a4 unii3Enabled:(BOOL)a5 unii5aEnabled:(BOOL)a6 unii5bEnabled:(BOOL)a7 unii5cEnabled:(BOOL)a8 unii5dEnabled:(BOOL)a9;
- (void)updateHFBtAntennaRequestWithDuration:(unint64_t)a3 unii1Enabled:(BOOL)a4 unii3Enabled:(BOOL)a5 unii5aEnabled:(BOOL)a6 unii5bEnabled:(BOOL)a7 unii5cEnabled:(BOOL)a8 unii5dEnabled:(BOOL)a9 unii1ConditionId:(unint64_t)a10 unii3ConditionId:(unint64_t)a11 unii5aConditionId:(unint64_t)a12 unii5bConditionId:(unint64_t)a13 unii5cConditionId:(unint64_t)a14 unii5dConditionId:(unint64_t)a15;
- (void)updateHFBtTxIndication:(BOOL)a3;
- (void)updateHPCellularSessionStatus:(BOOL)a3;
- (void)updateMWSChannelParameters:(id)a3;
- (void)updateMWSFrameConfig:(id)a3;
- (void)updateMWSScanFrequencyTable:(id)a3;
- (void)updateMWSSignalingConfig;
- (void)updatePencilCoexAntennaSelectionPolicy:(BOOL)a3 param1:(int)a4 param2:(int)a5;
- (void)updatePreferredAFHMap:(id)a3;
- (void)updatePreferredAFHMapRCU2:(int)a3;
- (void)updatePreferredHFBTChannelMap:(id)a3;
- (void)updatePreferredRole:(int)a3;
- (void)updateWCI2Mode:(BOOL)a3;
- (void)updateWiFiCatsState:(unsigned __int8)a3 bitmap:(unint64_t)a4 band:(int)a5 desiredBtDc:(int)a6;
- (void)updateWiFiCriticalEnabled:(BOOL)a3;
@end

@implementation WCM_BTControllerIOS

- (int)getBTState
{
  int result = [(WCM_BTController *)self powerState];
  if (result)
  {
    if ([(NSMutableArray *)[(WCM_BTController *)self btConnections] count]) {
      return 2;
    }
    else {
      return 1;
    }
  }
  return result;
}

- (id)createChannelParameters:(id)a3
{
  *(_OWORD *)keys = *(_OWORD *)off_10020FCE0;
  long long v19 = *(_OWORD *)off_10020FCF0;
  long long v20 = *(_OWORD *)off_10020FD00;
  long long v16 = 0u;
  long long v17 = 0u;
  *(_OWORD *)values = 0u;
  if (a3)
  {
    if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"ClkAlgnTDDFix"))
    {
      if ([a3 btClkAlgnFlag])
      {
        values[0] = xpc_uint64_create(1uLL);
        CFStringRef v4 = @"clkAlgnTDDFreqCheck: channelParamValue[0] is set to 1, because cellular.btClkAlgnFlag is %d";
      }
      else
      {
        values[0] = xpc_uint64_create(0);
        CFStringRef v4 = @"clkAlgnTDDFreqCheck: channelParamValue[0] is set to 0, because cellular.btClkAlgnFlag is %d";
      }
    }
    else
    {
      values[0] = xpc_uint64_create(1uLL);
      CFStringRef v4 = @"clkAlgnTDDFreqCheck: channelParamValue[0] is set to 1 with cellular.btClkAlgnFlag being %d. This is to take care of legacy devices that is not covered by the feature flag Clk_Algn_TDD_Fix";
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, v4, [a3 btClkAlgnFlag]);
    [a3 dlCenterFreq];
    values[1] = xpc_uint64_create((unint64_t)v7);
    [a3 cachedULCenterFreq];
    *(void *)&long long v16 = xpc_uint64_create((unint64_t)v8);
    [a3 dlBandwidth];
    *((void *)&v16 + 1) = xpc_uint64_create((unint64_t)v9);
    [a3 cachedULBandwidth];
    *(void *)&long long v17 = xpc_uint64_create((unint64_t)v10);
    uint64_t v6 = [a3 tddBand] ^ 1;
  }
  else
  {
    +[WCM_Logging logLevel:4 message:@"ZeroFreqDebug: CellController is Null in createChannelParameters."];
    values[0] = xpc_uint64_create(0);
    values[1] = xpc_uint64_create(0);
    *(void *)&long long v16 = xpc_uint64_create(0);
    *((void *)&v16 + 1) = xpc_uint64_create(0);
    xpc_object_t v5 = xpc_uint64_create(0);
    uint64_t v6 = 0;
    *(void *)&long long v17 = v5;
  }
  *((void *)&v17 + 1) = xpc_uint64_create(v6);
  xpc_object_t v11 = xpc_dictionary_create((const char *const *)keys, values, 6uLL);
  +[WCM_Logging logLevel:3, @"Creating MWS_ChannelParameter: %llu", xpc_uint64_get_value(values[0]) message];
  for (uint64_t i = 0; i != 6; ++i)
    xpc_release(values[i]);
  id v13 = v11;
  return v11;
}

- (void)updateHFBtAntennaRequestWithDuration:(unint64_t)a3 unii1Enabled:(BOOL)a4 unii3Enabled:(BOOL)a5 unii5aEnabled:(BOOL)a6 unii5bEnabled:(BOOL)a7 unii5cEnabled:(BOOL)a8 unii5dEnabled:(BOOL)a9
{
  +[WCM_Logging logLevel:2, @"HFBTAntBlkDebug_ Setting antenna request configs: [duration = %llu, unii1Enable = %d, unii3Enabled = %d, unii5aEnabled = %d, unii5bEnabled = %d, unii5cEnabled = %d, unii5dEnabled = %d]", a3, a4, a5, a6, a7, a8, a9 message];
  +[WCM_Logging logLevel:2 message:@"HFBTAntBlkDebug_ Setting config: enable condition ID"];
  xpc_object_t v16 = xpc_BOOL_create(0);
  [(WCM_Controller *)self sendMessage:1435 withArgs:v16];
  xpc_release(v16);
  xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v17, "kWCMAntennaRequestInterval", a3);
  xpc_dictionary_set_BOOL(v17, "kWCMAntennaRequestUnii1Enabled", a4);
  xpc_dictionary_set_BOOL(v17, "kWCMAntennaRequestUnii3Enabled", a5);
  xpc_dictionary_set_BOOL(v17, "kWCMAntennaRequestUnii5aEnabled", a6);
  xpc_dictionary_set_BOOL(v17, "kWCMAntennaRequestUnii5bEnabled", a7);
  xpc_dictionary_set_BOOL(v17, "kWCMAntennaRequestUnii5cEnabled", a8);
  xpc_dictionary_set_BOOL(v17, "kWCMAntennaRequestUnii5dEnabled", a9);
  xpc_dictionary_set_BOOL(v17, "kWCMBTSetConditionIdEnable", 0);
  +[WCM_Logging logLevel:2, @"HFBTAntBlkDebug_ Setting config: full antenna request config %@", v17 message];
  [(WCM_Controller *)self sendMessage:1434 withArgs:v17];

  xpc_release(v17);
}

- (void)updateWiFiCatsState:(unsigned __int8)a3 bitmap:(unint64_t)a4 band:(int)a5 desiredBtDc:(int)a6
{
  unsigned int v9 = a3;
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v12 = xpc_uint64_create(v9);
  xpc_dictionary_set_value(v11, "kWCMBTWiFiState_Priority", v12);
  xpc_release(v12);
  xpc_object_t v13 = xpc_uint64_create(a4);
  xpc_dictionary_set_value(v11, "kWCMWiFiState_Bitmap", v13);
  xpc_release(v13);
  xpc_object_t v14 = xpc_uint64_create(a5);
  xpc_dictionary_set_value(v11, "kWCMWiFiState_Band", v14);
  xpc_release(v14);
  xpc_object_t v15 = xpc_uint64_create(a6);
  xpc_dictionary_set_value(v11, "kWCMWiFiState_DesiredBtDc", v15);
  xpc_release(v15);
  [(WCM_Controller *)self sendMessage:107 withArgs:v11];

  xpc_release(v11);
}

- (void)updateMWSChannelParameters:(id)a3
{
  if (a3)
  {
    xpc_object_t v5 = (BOOL *)&self->mRoleRequested + 1;
    int v6 = BYTE1(self->mRoleRequested);
    int v7 = 1;
LABEL_5:
    if (v7 == v6
      && ([a3 cachedULCenterFreq], v8 == *(double *)&self->mDefaultAntenna)
      && ([a3 cachedULBandwidth], v9 == *(double *)((char *)&self->mMWSDlCenterFreq + 4))
      && ([a3 dlCenterFreq], v10 == *(double *)((char *)&self->mMWSUlCenterFreq + 4))
      && ([a3 dlBandwidth], v11 == *(double *)((char *)&self->mMWSUlBandwidth + 4))
      && BYTE2(self->mRoleRequested) == [a3 tddBand])
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, @"Same MWS Enabled - NOT updating. cellular.tddBand=%d, mWSTDDBand=%d", [a3 tddBand], BYTE2(self->mRoleRequested));
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, @"MWS needs Enabling - Something Changed. cellular.tddBand=%d, mWSTDDBand=%d", [a3 tddBand], BYTE2(self->mRoleRequested));
      [a3 cachedULCenterFreq];
      *(void *)&self->mDefaultAntenna = v12;
      [a3 cachedULBandwidth];
      *(void *)((char *)&self->mMWSDlCenterFreq + 4) = v13;
      [a3 dlCenterFreq];
      *(void *)((char *)&self->mMWSUlCenterFreq + 4) = v14;
      [a3 dlBandwidth];
      *(void *)((char *)&self->mMWSUlBandwidth + 4) = v15;
      BYTE2(self->mRoleRequested) = [a3 tddBand];
      *xpc_object_t v5 = a3 != 0;
      id v16 = [(WCM_BTControllerIOS *)self createChannelParameters:a3];
      [(WCM_Controller *)self sendMessage:1410 withArgs:v16];
    }
    return;
  }
  +[WCM_Logging logLevel:4 message:@"ZeroFreqDebug: CellController is Null in updateMWSChannelParameters."];
  *(double *)((char *)&self->mMWSUlBandwidth + 4) = 0.0;
  *(double *)((char *)&self->mMWSDlCenterFreq + 4) = 0.0;
  *(double *)((char *)&self->mMWSUlCenterFreq + 4) = 0.0;
  *(void *)&self->mDefaultAntenna = 0;
  xpc_object_t v5 = (BOOL *)&self->mRoleRequested + 1;
  if (BYTE1(self->mRoleRequested))
  {
    int v7 = 0;
    int v6 = 1;
    goto LABEL_5;
  }

  +[WCM_Logging logLevel:4 message:@"MWS already disabled"];
}

- (void)updatePreferredAFHMap:(id)a3
{
  [a3 getBytes:&bytes length:10];
  BOOL v5 = bytes == *(void *)((char *)&self->mRoleRequested + 3)
    && v39 == (unint64_t)*(unsigned __int16 *)&self->mCurrentAFHMap[4];
  int v6 = WRM_MotionController;
  if (v5)
  {
    +[WCM_Logging logLevel:4, @"AFH already set to %@", a3 message];
  }
  else
  {
    [(WCM_BTControllerIOS *)self printAFHMap:(char *)&self->mRoleRequested + 3];
    +[WCM_Logging logLevel:2, @"AFH needs update to %@", a3 message];
    [(WCM_BTControllerIOS *)self printAFHMap:&bytes];
    *(void *)((char *)&self->mRoleRequested + 3) = bytes;
    *(_WORD *)&self->mCurrentAFHMap[4] = v39;
    xpc_object_t v7 = xpc_data_create(&bytes, 0xAuLL);
    [(WCM_Controller *)self sendMessage:1408 withArgs:v7];
    xpc_release(v7);
  }
  unsigned int v8 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") activeCoexFeatures] containsObject:@"BLEAFHMapConversion"];
  if (a3 && v8)
  {
    v33 = self;
    for (uint64_t i = 0; i != 10; ++i)
    {
      uint64_t v10 = 0;
      int v11 = 0;
      char v12 = 7;
      do
      {
        if ((*((unsigned __int8 *)&bytes + i) >> v10)) {
          v11 |= 1 << v12;
        }
        else {
          v11 &= ~(1 << v12);
        }
        ++v10;
        --v12;
      }
      while (v10 != 8);
      v37[i] = v11;
      +[WCM_Logging logLevel:4, @"DLDebugBLE_ coexBTAFHMap_BitAscend[%ld] = %d", i, v11 message];
    }
    CFBitVectorRef v13 = CFBitVectorCreate(kCFAllocatorDefault, v37, 80);
    Mutable = CFBitVectorCreateMutable(kCFAllocatorDefault, 40);
    CFBitVectorSetCount(Mutable, 40);
    CFIndex v15 = 1;
    CFBitVectorSetAllBits(Mutable, 1u);
    MutableCopy = CFBitVectorCreateMutableCopy(kCFAllocatorDefault, 40, Mutable);
    CFIndex v17 = 3;
    do
    {
      CFBit v18 = CFBitVectorGetBitAtIndex(v13, v17 - 2)
         && CFBitVectorGetBitAtIndex(v13, v17 - 1)
         && CFBitVectorGetBitAtIndex(v13, v17) != 0;
      CFBitVectorSetBitAtIndex(Mutable, v15++, v18);
      v17 += 2;
    }
    while (v15 != 40);
    for (CFIndex j = 0; j != 11; ++j)
    {
      CFBit BitAtIndex = CFBitVectorGetBitAtIndex(Mutable, j + 1);
      CFBitVectorSetBitAtIndex(MutableCopy, j, BitAtIndex);
    }
    for (CFIndex k = 13; k != 39; ++k)
    {
      CFBit v22 = CFBitVectorGetBitAtIndex(Mutable, k);
      CFBitVectorSetBitAtIndex(MutableCopy, k - 2, v22);
    }
    for (CFIndex m = 37; m != 40; ++m)
      CFBitVectorSetBitAtIndex(MutableCopy, m, 1u);
    v40.locatiouint64_t n = 0;
    v40.length = 40;
    CFBitVectorGetBits(MutableCopy, v40, v34);
    for (uint64_t n = 0; n != 5; ++n)
    {
      v25 = v6;
      unsigned int v26 = v34[n];
      v27 = v25;
      [&v25[50] logLevel:4 message:@"DLDebugBLE_ coexBTAFHMap[%ld] = %d", n, v34[n]];
      uint64_t v28 = 0;
      char v29 = 7;
      do
      {
        if ((v26 >> v28)) {
          v11 |= 1 << v29;
        }
        else {
          v11 &= ~(1 << v29);
        }
        ++v28;
        --v29;
      }
      while (v28 != 8);
      *((unsigned char *)&v35 + n) = v11;
      int v6 = v27;
      [&v27[50] logLevel:4 message:@"DLDebugBLE_ coexBTAFHMap_BitAscend[%ld] = %d", n, v11];
    }
    v30 = +[NSData dataWithBytes:&v35 length:5];
    if (v35 == *(_DWORD *)&v33->mCurrentAFHMap[6] && v36 == v33->mCurrentBLEAFHMap[0])
    {
      [&v27[50] logLevel:4, @"DLDebug_ BLE AFH already set to %@", v30 message];
    }
    else
    {
      [(WCM_BTControllerIOS *)v33 printBLEAFHMap:&v33->mCurrentAFHMap[6]];
      [&v27[50] logLevel:2, @"DLDebug_ BLE AFH newBLEMap_BitVector needs update to %@", v30 message];
      [(WCM_BTControllerIOS *)v33 printBLEAFHMap:&v35];
      *(_DWORD *)&v33->mCurrentAFHMap[6] = v35;
      v33->mCurrentBLEAFHMap[0] = v36;
      xpc_object_t v32 = xpc_data_create(&v35, 5uLL);
      [&v6[50] logLevel:2 message:@"DLDebug_ Sending XPC Message for coexBLEAFHMap"];
      [(WCM_Controller *)v33 sendMessage:1425 withArgs:v32];
      xpc_release(v32);
    }
    CFRelease(v13);
    CFRelease(Mutable);
    CFRelease(MutableCopy);
  }
}

- (void)updatePreferredHFBTChannelMap:(id)a3
{
  +[WCM_Logging logLevel:2, @"HFAFHDebug_ channel map update to %@", a3 message];
  BOOL v5 = [a3 bytes];
  if (!memcmp(v5, &self->mCurrentBLEAFHMap[1], 0x60uLL))
  {
    +[WCM_Logging logLevel:4 message:@"HFAFHDebug_ Channel map already set to the same"];
  }
  else
  {
    +[WCM_Logging logLevel:2 message:@"HFAFHDebug_ Channel map needs update"];
    +[WCM_Logging logLevel:2 message:@"HFAFHDebug_ New channel map"];
    [(WCM_BTControllerIOS *)self printHFBTChannelMap:v5];
    long long v6 = v5[1];
    *(_OWORD *)&self->mCurrentBLEAFHMap[1] = *v5;
    *(_OWORD *)&self->mCurrentHFBTChannelMap[12] = v6;
    long long v7 = v5[2];
    long long v8 = v5[3];
    long long v9 = v5[5];
    *(_OWORD *)&self->mCurrentHFBTChannelMap[60] = v5[4];
    *(_OWORD *)&self->mCurrentHFBTChannelMap[76] = v9;
    *(_OWORD *)&self->mCurrentHFBTChannelMap[28] = v7;
    *(_OWORD *)&self->mCurrentHFBTChannelMap[44] = v8;
    xpc_object_t v10 = xpc_data_create(v5, 0x60uLL);
    [(WCM_Controller *)self sendMessage:1432 withArgs:v10];
    xpc_release(v10);
  }
}

- (WCM_BTControllerIOS)init
{
  v7.receiver = self;
  v7.super_class = (Class)WCM_BTControllerIOS;
  v2 = [(WCM_BTController *)&v7 init];
  v3 = (WCM_BTControllerIOS *)v2;
  if (v2)
  {
    *((_DWORD *)v2 + 41) = 0;
    v2[168] = 0;
    *((_DWORD *)v2 + 43) = 4;
    *((_DWORD *)v2 + 44) = 4;
    *(void *)(v2 + 180) = 0;
    *(void *)(v2 + 188) = 0;
    *(void *)(v2 + 196) = 0;
    *(void *)(v2 + 204) = 0;
    v2[230] = 0;
    *(void *)(v2 + 212) = 0;
    *((_DWORD *)v2 + 55) = 3;
    *((_DWORD *)v2 + 56) = 255;
    v2[228] = 0;
    v2[229] = 0;
    v2[342] = 0;
    *(void *)(v2 + 231) = -1;
    *(_WORD *)(v2 + 239) = -1;
    *(_DWORD *)(v2 + 241) = -1;
    v2[245] = -1;
    *(void *)&long long v4 = -1;
    *((void *)&v4 + 1) = -1;
    *(_OWORD *)(v2 + 246) = v4;
    *(_OWORD *)(v2 + 262) = v4;
    *(_OWORD *)(v2 + 278) = v4;
    *(_OWORD *)(v2 + 294) = v4;
    *(_OWORD *)(v2 + 310) = v4;
    *(_OWORD *)(v2 + 326) = v4;
    *(void *)(v2 + 343) = -1;
    *(_WORD *)(v2 + 351) = -1;
    *(void *)(v2 + 353) = -1;
    *(_WORD *)(v2 + 361) = -1;
    *(void *)(v2 + 363) = -1;
    *(_WORD *)(v2 + 371) = -1;
    *(void *)(v2 + 373) = -1;
    *(_WORD *)(v2 + 381) = -1;
    *(void *)(v2 + 388) = 0;
    *(void *)(v2 + 396) = 0;
    *(void *)(v2 + 404) = 0;
    *(void *)(v2 + 412) = 0;
    *(void *)(v2 + 420) = -1;
    *(void *)(v2 + 428) = -1;
    [v2 setMClassicRssi:128];
    [(WCM_BTControllerIOS *)v3 setMMovingAvgRSSI:128.0];
    [(WCM_BTControllerIOS *)v3 setMLeRssi:128];
    [(WCM_BTControllerIOS *)v3 setMMovingAvgRSSI:128.0];
    [(WCM_BTControllerIOS *)v3 setMLeSuccessfulTxCount:0];
    [(WCM_BTControllerIOS *)v3 setMLeSuccessfulTxCount:0];
    [(WCM_BTControllerIOS *)v3 setMLeReTxCount:0];
    [(WCM_BTControllerIOS *)v3 setMLeSuccessfulRxCount:0];
    [(WCM_BTControllerIOS *)v3 setMLeRxErrorCount:0];
    [(WCM_BTControllerIOS *)v3 setMLeCoexDenialCount:0];
    [(WCM_BTControllerIOS *)v3 setMClassicSuccessfulTxCount:0];
    [(WCM_BTControllerIOS *)v3 setMClassicReTxCount:0];
    [(WCM_BTControllerIOS *)v3 setMClassicSuccessfulRxCount:0];
    [(WCM_BTControllerIOS *)v3 setMClassicRxErrorCount:0];
    [(WCM_BTControllerIOS *)v3 setMClassicCoexDenialCount:0];
    [(WCM_BTControllerIOS *)v3 setMPrevActivePhy:0];
    [(WCM_BTControllerIOS *)v3 setMActivePhy:0];
    [(WCM_BTControllerIOS *)v3 setMActivePhyValid:0];
    [(WCM_BTControllerIOS *)v3 setMNonMagnetUtilization:0.0];
    [(WCM_BTControllerIOS *)v3 setMMetricsReportReason:0];
    [(WCM_BTControllerIOS *)v3 setMFlushCount:0];
    [(WCM_BTControllerIOS *)v3 setMBtPhyRate:0];
    [(WCM_BTControllerIOS *)v3 setMMovingAvgReTxCount:0];
    [(WCM_BTControllerIOS *)v3 setMMovingAvgRxErrorCount:0];
    [(WCM_BTControllerIOS *)v3 setMMovingAvgSuccessfulRxCount:0];
    [(WCM_BTControllerIOS *)v3 setMMovingAvgSuccessfulTxCount:0];
    [(WCM_BTControllerIOS *)v3 setMNumberofSamples:0];
    [(WCM_BTControllerIOS *)v3 setMLQMLinkEvalCounter:0];
    BOOL v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    [(WCM_BTControllerIOS *)v3 setQueue:dispatch_queue_create("com.apple.WirelessRadioManager.BTController", v5)];
  }
  return v3;
}

- (void)dealloc
{
  v3 = *(void **)((char *)&self->mMWSDlBandwidth + 4);
  if (v3) {
    xpc_release(v3);
  }
  if ([(WCM_BTControllerIOS *)self queue]) {
    dispatch_release((dispatch_object_t)[(WCM_BTControllerIOS *)self queue]);
  }
  [(WCM_BTControllerIOS *)self setQueue:0];
  v4.receiver = self;
  v4.super_class = (Class)WCM_BTControllerIOS;
  [(WCM_BTController *)&v4 dealloc];
}

- (void)handlePowerState:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    [(WCM_Controller *)self sendMessage:1400 withArgs:0];
    [(WCM_Controller *)self sendMessage:1401 withArgs:0];
    [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") requestBTStatus];
  }
  else
  {
    HIDWORD(self->super._AoSDeviceID) = 0;
    LOBYTE(self->mKeepWake) = 0;
    *(_DWORD *)&self->mWCI2State = 4;
    self->mAntennaConfig = 4;
    *(void *)&self->mDefaultAntenna = 0;
    *(double *)((char *)&self->mMWSUlCenterFreq + 4) = 0.0;
    *(double *)((char *)&self->mMWSDlCenterFreq + 4) = 0.0;
    *(double *)((char *)&self->mMWSUlBandwidth + 4) = 0.0;
    BYTE2(self->mRoleRequested) = 0;
    BOOL v5 = *(void **)((char *)&self->mMWSDlBandwidth + 4);
    if (v5)
    {
      xpc_release(v5);
      *(double *)((char *)&self->mMWSDlBandwidth + 4) = 0.0;
    }
    HIDWORD(self->mMWSFrameConfig) = 3;
    self->mRoleCurrent = 255;
    LOBYTE(self->mRoleRequested) = 0;
    BYTE1(self->mRoleRequested) = 0;
    self->mCurrentHFBTChannelMap[92] = 0;
    *(void *)((char *)&self->mRoleRequested + 3) = -1;
    *(_WORD *)&self->mCurrentAFHMap[4] = -1;
    *(_DWORD *)&self->mCurrentAFHMap[6] = -1;
    self->mCurrentBLEAFHMap[0] = -1;
    *(void *)&long long v6 = -1;
    *((void *)&v6 + 1) = -1;
    *(_OWORD *)&self->mCurrentBLEAFHMap[1] = v6;
    *(_OWORD *)&self->mCurrentHFBTChannelMap[12] = v6;
    *(_OWORD *)&self->mCurrentHFBTChannelMap[28] = v6;
    *(_OWORD *)&self->mCurrentHFBTChannelMap[44] = v6;
    *(_OWORD *)&self->mCurrentHFBTChannelMap[60] = v6;
    *(_OWORD *)&self->mCurrentHFBTChannelMap[76] = v6;
    *(void *)&self->mCurrentHFBTChannelMap[93] = -1;
    *(_WORD *)&self->mDiversityAFHMapForC0B0[4] = -1;
    *(void *)&self->mDiversityAFHMapForC0B0[6] = -1;
    *(_WORD *)&self->mDiversityAFHMapForC0B1[4] = -1;
    *(void *)&self->mDiversityAFHMapForC0B1[6] = -1;
    *(_WORD *)&self->mDiversityAFHMapForC1B0[4] = -1;
    *(void *)&self->mDiversityAFHMapForC1B0[6] = -1;
    *(_WORD *)&self->mDiversityAFHMapForC1B1[4] = -1;
    *(void *)&self->mDiversityAFHMapForC1B1[11] = 0;
    *(unint64_t *)((char *)&self->mLeConnDutyCycle + 4) = 0;
    *(unint64_t *)((char *)&self->mLeConnReason + 4) = 0;
    *(unint64_t *)((char *)&self->mLeConnBand + 4) = 0;
    *(unint64_t *)((char *)&self->mLeConnDuration + 4) = -1;
    *(int64_t *)((char *)&self->mLeDiscoveryScanState + 4) = -1;
    [(WCM_BTControllerIOS *)self resetBtMetrics];
    [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") updateControllerState:1300];
    [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") initBTStatus];
    [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") sendBTStatusToWiFi];
    [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") updateBSPState];
  }
  [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") updateControllerState:1000];
  v7.receiver = self;
  v7.super_class = (Class)WCM_BTControllerIOS;
  [(WCM_BTController *)&v7 handlePowerState:v3];
}

- (void)handleDisconnection:(id)a3
{
  +[WCM_Logging logLevel:2 message:@"BTControllerIOS handleDisconnection"];

  [(WCM_BTControllerIOS *)self handlePowerState:0];
}

- (void)handleMessage:(id)a3
{
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  switch(uint64)
  {
    case 0x1F4uLL:
      [(WCM_BTController *)self handleConnectionConfig:a3];
      break;
    case 0x1F5uLL:
      [(WCM_BTController *)self handleAudioConfig:a3];
      break;
    case 0x1F6uLL:
      [(WCM_BTControllerIOS *)self handleScanStart:a3];
      break;
    case 0x1F7uLL:
      [(WCM_BTControllerIOS *)self handleScanStop:a3];
      break;
    case 0x1F8uLL:
      [(WCM_BTControllerIOS *)self handleLinkQaulity:a3];
      break;
    case 0x1F9uLL:
      [(WCM_BTControllerIOS *)self handleLTELinkQuality:a3];
      break;
    case 0x1FAuLL:
      [(WCM_BTController *)self handleLocalDeviceState:a3];
      break;
    case 0x1FBuLL:
      [(WCM_BTControllerIOS *)self handelAFHMap:a3];
      break;
    case 0x1FCuLL:
      [(WCM_BTControllerIOS *)self handleRawRSSI:a3];
      break;
    case 0x1FDuLL:
    case 0x202uLL:
    case 0x204uLL:
      goto LABEL_10;
    case 0x1FEuLL:
      [(WCM_BTControllerIOS *)self handleAntennaPreferenceBResponse:a3];
      break;
    case 0x1FFuLL:
      [(WCM_BTControllerIOS *)self handleAntennaSwitchNotification:a3];
      break;
    case 0x200uLL:
      [(WCM_BTControllerIOS *)self handleBTMetricsRpt:a3];
      break;
    case 0x201uLL:
      [(WCM_BTControllerIOS *)self handleBTPhyRpt:a3];
      break;
    case 0x203uLL:
      [(WCM_BTControllerIOS *)self handleBSPEvent:a3];
      break;
    case 0x205uLL:
      [(WCM_BTControllerIOS *)self handleHFBTChannelMap:a3];
      break;
    case 0x206uLL:
      [(WCM_BTControllerIOS *)self handleLeDiscoveryScanStateChange:a3];
      break;
    default:
      if (uint64 == 108)
      {
        [(WCM_BTControllerIOS *)self handleLeConn:a3];
      }
      else if (uint64 == 1406)
      {
        [(WCM_BTControllerIOS *)self handleBTBandwidthLoad:a3];
      }
      else
      {
LABEL_10:
        +[WCM_Logging logLevel:0, @"BT controller dropping message-id %lld", uint64 message];
      }
      break;
  }
}

- (int)getBTRole
{
  id v3 = [(NSMutableArray *)[(WCM_BTController *)self btConnections] count];
  if (v3)
  {
    if (v3 == (id)1)
    {
      LODWORD(v4) = [[-[NSMutableArray objectAtIndexedSubscript:](-[WCM_BTController btConnections](self, "btConnections") objectAtIndexedSubscript:0) getRole] != 0;
    }
    else
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      BOOL v5 = [(WCM_BTController *)self btConnections];
      id v4 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4)
      {
        id v6 = v4;
        uint64_t v7 = *(void *)v11;
        while (2)
        {
          for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v11 != v7) {
              objc_enumerationMutation(v5);
            }
            if ([*(id *)(*((void *)&v10 + 1) + 8 * i) getRole])
            {
              LODWORD(v4) = 2;
              return (int)v4;
            }
          }
          id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
          LODWORD(v4) = 0;
          if (v6) {
            continue;
          }
          break;
        }
      }
    }
  }
  else
  {
    LODWORD(v4) = 3;
  }
  return (int)v4;
}

- (void)updateWCI2Mode:(BOOL)a3
{
  if (LOBYTE(self->mKeepWake) != a3)
  {
    BOOL v3 = a3;
    LOBYTE(self->mKeepWake) = a3;
    id v5 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") platformManager];
    if (v3)
    {
      id v6 = v5;
      uint64_t v7 = (uint64_t)[v5 wcmBTWCI2ModeSendMsgBitmap];
      uint64_t v8 = (uint64_t)[v6 wcmBTWCI2ModeRecvMsgBitmap];
    }
    else
    {
      uint64_t v8 = 128;
      uint64_t v7 = 2;
    }
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    +[WCM_Logging logLevel:3, @"ConfigureWCI2 mode : RX=%lld, TX=%lld", v8, v7 message];
    if (v9)
    {
      xpc_dictionary_set_uint64(v9, "kWCMBTSetWCI2Mode_ReceiveMessage", v8);
      xpc_dictionary_set_uint64(v9, "kWCMBTSetWCI2Mode_SendMessage", v7);
      [(WCM_Controller *)self sendMessage:1413 withArgs:v9];
      xpc_release(v9);
    }
  }
}

- (void)updateMWSSignalingConfig
{
  long long v12 = *(_OWORD *)off_10020FCB8;
  long long v13 = *(_OWORD *)off_10020FCC8;
  *(_OWORD *)keys = *(_OWORD *)off_10020FC68;
  long long v8 = *(_OWORD *)off_10020FC78;
  long long v9 = *(_OWORD *)off_10020FC88;
  uint64_t v14 = "kWCMBTSetMWSSignaling_MWSPriorityAssertOffsetRequest";
  long long v10 = *(_OWORD *)off_10020FC98;
  long long v11 = *(_OWORD *)off_10020FCA8;
  id v3 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") platformManager];
  values[0] = xpc_int64_create((int64_t)[v3 wcmWCI2MWSRxAssertOffset]);
  values[1] = xpc_uint64_create((uint64_t)[v3 wcmWCI2MWSRxAssertJitter]);
  xpc_object_t values[2] = xpc_int64_create((int64_t)[v3 wcmWCI2MWSRxDeAssertOffset]);
  values[3] = xpc_uint64_create((uint64_t)[v3 wcmWCI2MWSRxDeAssertJitter]);
  values[4] = xpc_int64_create((int64_t)[v3 wcmWCI2MWSTxAssertOffset]);
  values[5] = xpc_uint64_create((uint64_t)[v3 wcmWCI2MWSTxAssertJitter]);
  values[6] = xpc_int64_create((int64_t)[v3 wcmWCI2MWSTxDeAssertOffset]);
  values[7] = xpc_uint64_create((uint64_t)[v3 wcmWCI2MWSTxDeAssertJitter]);
  values[8] = xpc_int64_create((int64_t)[v3 wcmWCI2MWSPatternAssertOffset]);
  values[9] = xpc_uint64_create((uint64_t)[v3 wcmWCI2MWSPatternAssertJitter]);
  values[10] = xpc_int64_create((int64_t)[v3 wcmWCI2MWSInactivityAssertOffset]);
  values[11] = xpc_uint64_create((uint64_t)[v3 wcmWCI2MWSInactivityAssertJitter]);
  values[12] = xpc_int64_create((int64_t)[v3 wcmWCI2MWSScanFrequencyAssertOffset]);
  values[13] = xpc_uint64_create((uint64_t)[v3 wcmWCI2MWSScanFrequencyAssertJitter]);
  values[14] = xpc_uint64_create((uint64_t)[v3 wcmWCI2MWSPriorityAssertOffsetRequest]);
  xpc_object_t v4 = xpc_dictionary_create((const char *const *)keys, values, 0xFuLL);
  for (uint64_t i = 0; i != 15; ++i)
    xpc_release(values[i]);
  [(WCM_Controller *)self sendMessage:1412 withArgs:v4];
  xpc_release(v4);
}

- (void)updateAwakeMode:(BOOL)a3
{
  int AoSDeviceID_high = HIDWORD(self->super._AoSDeviceID);
  if (a3)
  {
    if (AoSDeviceID_high > 0) {
      return;
    }
    +[WCM_Logging logLevel:2 message:@"Keeping BT awake"];
    int v5 = open("/dev/btwake", 0);
  }
  else
  {
    if (AoSDeviceID_high < 1) {
      return;
    }
    +[WCM_Logging logLevel:3 message:@"Letting BT go to sleep."];
    close(HIDWORD(self->super._AoSDeviceID));
    int v5 = 0;
  }
  HIDWORD(self->super._AoSDeviceID) = v5;
}

- (void)updateMWSFrameConfig:(id)a3
{
  if (!a3) {
    return;
  }
  id v4 = -[WCM_BTControllerIOS createBTHCIExternalFrameConfigParams:](self, "createBTHCIExternalFrameConfigParams:");
  int v5 = *(void **)((char *)&self->mMWSDlBandwidth + 4);
  if (v5)
  {
    if (xpc_equal(v5, v4))
    {
      +[WCM_Logging logLevel:4 message:@"Same FrameConfig - NOT Updtaing"];
      return;
    }
    id v6 = *(void **)((char *)&self->mMWSDlBandwidth + 4);
    if (v6) {
      xpc_release(v6);
    }
  }
  *(void *)((char *)&self->mMWSDlBandwidth + 4) = xpc_copy(v4);
  +[WCM_Logging logLevel:4 message:@"Updating FrameConfig"];
  uint64_t v7 = *(void *)((char *)&self->mMWSDlBandwidth + 4);

  [(WCM_Controller *)self sendMessage:1411 withArgs:v7];
}

- (void)updateBLEActiveScanPwrLmtAssertionInterval:(unint64_t)a3
{
  xpc_object_t v5 = xpc_uint64_create(a3);
  +[WCM_Logging logLevel:4, @"DLDebug_ Configuring BLE Active Scan Power Limiting (Type6 MSG) Assertion Interval as %llu", a3 message];
  [(WCM_Controller *)self sendMessage:1427 withArgs:v5];

  xpc_release(v5);
}

- (void)updateHPCellularSessionStatus:(BOOL)a3
{
  BOOL v3 = a3;
  xpc_object_t v5 = xpc_BOOL_create(a3);
  +[WCM_Logging logLevel:4, @"HPCellular_ Configuring HPCellular Session Status to BT as %d", v3 message];
  [(WCM_Controller *)self sendMessage:1430 withArgs:v5];

  xpc_release(v5);
}

- (void)updatePreferredAFHMapRCU2:(int)a3
{
  xpc_object_t v5 = WRM_MotionController;
  +[WCM_Logging logLevel:2, @"updatePreferredAFHMapRCU2...Entry channel no %d", *(void *)&a3 message];
  __int16 v35 = -1;
  uint64_t bytes = -1;
  if ((a3 - 1) <= 0x19)
  {
    id v6 = (char *)&unk_1001EA3F8 + 10 * a3 - 110;
    uint64_t bytes = *(void *)v6;
    __int16 v35 = *((_WORD *)v6 + 4);
  }
  [(WCM_BTControllerIOS *)self printAFHMap:(char *)&self->mRoleRequested + 3];
  [(WCM_BTControllerIOS *)self printAFHMap:&bytes];
  *(void *)((char *)&self->mRoleRequested + 3) = bytes;
  *(_WORD *)&self->mCurrentAFHMap[4] = v35;
  xpc_object_t v7 = xpc_data_create(&bytes, 0xAuLL);
  [(WCM_Controller *)self sendMessage:1408 withArgs:v7];
  xpc_release(v7);
  if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"BLEAFHMapConversion"))
  {
    v30 = self;
    for (uint64_t i = 0; i != 10; ++i)
    {
      uint64_t v9 = 0;
      int v10 = 0;
      char v11 = 7;
      do
      {
        if ((*((unsigned __int8 *)&bytes + i) >> v9)) {
          v10 |= 1 << v11;
        }
        else {
          v10 &= ~(1 << v11);
        }
        ++v9;
        --v11;
      }
      while (v9 != 8);
      v33[i] = v10;
      +[WCM_Logging logLevel:4, @"DLDebugBLE_ coexBTAFHMap_BitAscend[%ld] = %d", i, v10 message];
    }
    CFBitVectorRef v12 = CFBitVectorCreate(kCFAllocatorDefault, v33, 80);
    Mutable = CFBitVectorCreateMutable(kCFAllocatorDefault, 40);
    CFBitVectorSetCount(Mutable, 40);
    CFIndex v14 = 1;
    CFBitVectorSetAllBits(Mutable, 1u);
    MutableCopy = CFBitVectorCreateMutableCopy(kCFAllocatorDefault, 40, Mutable);
    CFIndex v16 = 3;
    do
    {
      CFBit v17 = CFBitVectorGetBitAtIndex(v12, v16 - 2)
         && CFBitVectorGetBitAtIndex(v12, v16 - 1)
         && CFBitVectorGetBitAtIndex(v12, v16) != 0;
      CFBitVectorSetBitAtIndex(Mutable, v14++, v17);
      v16 += 2;
    }
    while (v14 != 40);
    for (CFIndex j = 0; j != 11; ++j)
    {
      CFBit BitAtIndex = CFBitVectorGetBitAtIndex(Mutable, j + 1);
      CFBitVectorSetBitAtIndex(MutableCopy, j, BitAtIndex);
    }
    for (CFIndex k = 13; k != 39; ++k)
    {
      CFBit v21 = CFBitVectorGetBitAtIndex(Mutable, k);
      CFBitVectorSetBitAtIndex(MutableCopy, k - 2, v21);
    }
    for (CFIndex m = 37; m != 40; ++m)
      CFBitVectorSetBitAtIndex(MutableCopy, m, 1u);
    v36.locatiouint64_t n = 0;
    v36.length = 40;
    CFBitVectorGetBits(MutableCopy, v36, v31);
    for (uint64_t n = 0; n != 5; ++n)
    {
      v24 = v5;
      unsigned int v25 = v31[n];
      unsigned int v26 = v24;
      [&v24[50] logLevel:4 message:@"DLDebugBLE_ coexBTAFHMap[%ld] = %d", n, v31[n]];
      uint64_t v27 = 0;
      char v28 = 7;
      do
      {
        if ((v25 >> v27)) {
          v10 |= 1 << v28;
        }
        else {
          v10 &= ~(1 << v28);
        }
        ++v27;
        --v28;
      }
      while (v27 != 8);
      v32[n] = v10;
      xpc_object_t v5 = v26;
      [&v26[50] logLevel:4 message:@"DLDebugBLE_ coexBTAFHMap_BitAscend[%ld] = %d", n, v10];
    }
    [&v26[50] logLevel:2, @"DLDebug_ BLE AFH newBLEMap_BitVector needs update to %@", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v32, 5) message];
    [(WCM_BTControllerIOS *)v30 printBLEAFHMap:v32];
    xpc_object_t v29 = xpc_data_create(v32, 5uLL);
    [&v5[50] logLevel:2 message:@"DLDebug_ Sending XPC Message for coexBLEAFHMap"];
    [(WCM_Controller *)v30 sendMessage:1425 withArgs:v29];
    xpc_release(v29);
    CFRelease(v12);
    CFRelease(Mutable);
    CFRelease(MutableCopy);
  }
}

- (void)updateDiversityAFHMapForC0B0:(id)a3 C0B1:(id)a4 C1B0:(id)a5 C1B1:(id)a6
{
  [a3 getBytes:&bytes length:10];
  [a4 getBytes:&v24 length:10];
  [a5 getBytes:&v22 length:10];
  [a6 getBytes:&v20 length:10];
  BOOL v11 = bytes == *(void *)&self->mCurrentHFBTChannelMap[93]
     && v27 == (unint64_t)*(unsigned __int16 *)&self->mDiversityAFHMapForC0B0[4];
  if (v11
    && (v24 == *(void *)&self->mDiversityAFHMapForC0B0[6]
      ? (BOOL v12 = v25 == (unint64_t)*(unsigned __int16 *)&self->mDiversityAFHMapForC0B1[4])
      : (BOOL v12 = 0),
        v12
     && (v22 == *(void *)&self->mDiversityAFHMapForC0B1[6]
       ? (BOOL v13 = v23 == (unint64_t)*(unsigned __int16 *)&self->mDiversityAFHMapForC1B0[4])
       : (BOOL v13 = 0),
         v13
      && (v20 == *(void *)&self->mDiversityAFHMapForC1B0[6]
        ? (BOOL v14 = v21 == (unint64_t)*(unsigned __int16 *)&self->mDiversityAFHMapForC1B1[4])
        : (BOOL v14 = 0),
          v14))))
  {
    +[WCM_Logging logLevel:4, @"Diversity AFH already set to c0b0:%@ c0b1:%@ c1b0:%@ c1b1:%@", a3, a4, a5, a6 message];
  }
  else
  {
    +[WCM_Logging logLevel:2, @"Diversity AFH need to set to c0b0:%@ c0b1:%@ c1b0:%@ c1b1:%@", a3, a4, a5, a6 message];
    *(void *)&self->mCurrentHFBTChannelMap[93] = bytes;
    *(_WORD *)&self->mDiversityAFHMapForC0B0[4] = v27;
    *(void *)&self->mDiversityAFHMapForC0B0[6] = v24;
    *(_WORD *)&self->mDiversityAFHMapForC0B1[4] = v25;
    *(void *)&self->mDiversityAFHMapForC0B1[6] = v22;
    *(_WORD *)&self->mDiversityAFHMapForC1B0[4] = v23;
    *(void *)&self->mDiversityAFHMapForC1B0[6] = v20;
    *(_WORD *)&self->mDiversityAFHMapForC1B1[4] = v21;
    xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
    xpc_object_t v16 = xpc_data_create(&bytes, 0xAuLL);
    xpc_dictionary_set_value(v15, "kWCMBTDiversityChannelMap_C0B0", v16);
    xpc_release(v16);
    xpc_object_t v17 = xpc_data_create(&v24, 0xAuLL);
    xpc_dictionary_set_value(v15, "kWCMBTDiversityChannelMap_C0B1", v17);
    xpc_release(v17);
    xpc_object_t v18 = xpc_data_create(&v22, 0xAuLL);
    xpc_dictionary_set_value(v15, "kWCMBTDiversityChannelMap_C1B0", v18);
    xpc_release(v18);
    xpc_object_t v19 = xpc_data_create(&v20, 0xAuLL);
    xpc_dictionary_set_value(v15, "kWCMBTDiversityChannelMap_C1B1", v19);
    xpc_release(v19);
    [(WCM_Controller *)self sendMessage:1423 withArgs:v15];
    xpc_release(v15);
  }
}

- (void)updatePreferredRole:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(WCM_BTControllerIOS *)self getBTRole];
  HIDWORD(self->mMWSFrameConfig) = v5;
  uint64_t mRoleCurrent = self->mRoleCurrent;
  if (v5 > 1
    || v5 == v3
    || (BOOL v7 = mRoleCurrent == v3, mRoleCurrent = v3, v7))
  {
    +[WCM_Logging logLevel:2, @"Not request for BT role switch current(%d) prefered(%d) requested(%d)", v5, v3, mRoleCurrent message];
  }
  else if ([(NSMutableArray *)[(WCM_BTController *)self btConnections] count])
  {
    +[WCM_Logging logLevel:2, @"Request for BT role switch(%d -> %d)", HIDWORD(self->mMWSFrameConfig), v3 message];
    xpc_object_t v8 = xpc_uint64_create(v3);
    [(WCM_Controller *)self sendMessage:1407 withArgs:v8];
    self->uint64_t mRoleCurrent = v3;
    xpc_release(v8);
  }
  else
  {
    +[WCM_Logging logLevel:2, @"Not request for BT role switch (%d -> %d) becasue there is no connection", HIDWORD(self->mMWSFrameConfig), v3, v9 message];
  }
}

- (void)updatePencilCoexAntennaSelectionPolicy:(BOOL)a3 param1:(int)a4 param2:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  BOOL v7 = a3;
  if ([(WCM_BTController *)self powerState])
  {
    +[WCM_Logging logLevel:2, @"YYDebug_ Setting BT Antenna Policy for pencil coex BT blocking bitmap: %d Thread blocking bitmap: %d", v6, v5 message];
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v9, "kWCMBTAntennaAction", 0xAuLL);
    if (v7) {
      uint64_t v10 = 5;
    }
    else {
      uint64_t v10 = 0;
    }
    xpc_dictionary_set_uint64(v9, "kWCMBTAntennaConfiguration", v10);
    xpc_dictionary_set_uint64(v9, "kWCMBTAntennaParam1", (int)v6);
    xpc_dictionary_set_uint64(v9, "kWCMBTAntennaParam2", (int)v5);
    [(WCM_Controller *)self sendMessage:1421 withArgs:v9];
    xpc_release(v9);
  }
  else
  {
    +[WCM_Logging logLevel:0 message:@"YYDebug_ BT OFF not setting antenna selection policy for pencil coex"];
  }
}

- (void)updateDefaultBTAntenna:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(WCM_BTController *)self powerState])
  {
    if (self->mAntennaConfig != v3)
    {
      if (v3 < 2)
      {
        +[WCM_Logging logLevel:2, @"Setting Default BT Antenna :%d", v3 message];
        self->mAntennaConfig = v3;
        xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_uint64(v5, "kWCMBTAntennaAction", 2uLL);
        xpc_dictionary_set_uint64(v5, "kWCMBTAntennaConfiguration", v3);
        [(WCM_Controller *)self sendMessage:1421 withArgs:v5];
        xpc_release(v5);
      }
      else
      {
        +[WCM_Logging logLevel:0, @"Trying to set default BT antenna to invalid antennaConfig(%d)", v3 message];
      }
    }
  }
  else
  {
    +[WCM_Logging logLevel:0, @"BT OFF not setting default antenna antennaConfig(%d)", v3 message];
  }
}

- (void)updateAntennaRSSIOffset
{
  if ([(WCM_BTController *)self powerState] && !LOBYTE(self->mRoleRequested))
  {
    LOBYTE(self->mRoleRequested) = 1;
    +[WCM_Logging logLevel:2, @"Setting BT Antenna Offsets: %@, %@", &off_100254C18, &off_10023CB40 message];
    xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v3, "kWCMBTAntennaAction", 5uLL);
    xpc_dictionary_set_uint64(v3, "kWCMBTAntennaParam1", (int)[&off_100254C18 intValue]);
    xpc_dictionary_set_uint64(v3, "kWCMBTAntennaParam2", (int)[&off_10023CB40 intValue]);
    [(WCM_Controller *)self sendMessage:1421 withArgs:v3];
    xpc_release(v3);
  }
}

- (void)updateHFBtTxIndication:(BOOL)a3
{
  +[WCM_Logging logLevel:2, @"Setting 5G BT config to %d", a3 message];
  xpc_object_t v5 = xpc_BOOL_create(a3);
  +[WCM_Logging logLevel:2, @"WCMBTSetMWSTxInd5GEnable: %@", v5 message];
  [(WCM_Controller *)self sendMessage:1433 withArgs:v5];

  xpc_release(v5);
}

- (void)updateHFBtAntennaRequestWithDuration:(unint64_t)a3 unii1Enabled:(BOOL)a4 unii3Enabled:(BOOL)a5 unii5aEnabled:(BOOL)a6 unii5bEnabled:(BOOL)a7 unii5cEnabled:(BOOL)a8 unii5dEnabled:(BOOL)a9 unii1ConditionId:(unint64_t)a10 unii3ConditionId:(unint64_t)a11 unii5aConditionId:(unint64_t)a12 unii5bConditionId:(unint64_t)a13 unii5cConditionId:(unint64_t)a14 unii5dConditionId:(unint64_t)a15
{
  +[WCM_Logging logLevel:2, @"HFBTAntBlkDebug_ Setting antenna request configs: [duratiouint64_t n = %llu, unii1Enable = %d, unii3Enabled = %d, unii5aEnabled = %d, unii5bEnabled = %d, unii5cEnabled = %d, unii5dEnabled = %d, unii1conditionId = %llu, unii3conditionId = %llu, unii5aconditionId = %llu, unii5bconditionId = %llu, unii5cconditionId = %llu, unii5dconditionId = %llu]", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15 message];
  +[WCM_Logging logLevel:2 message:@"HFBTAntBlkDebug_ enable condition ID"];
  xpc_object_t v22 = xpc_BOOL_create(1);
  [(WCM_Controller *)self sendMessage:1435 withArgs:v22];
  xpc_release(v22);
  xpc_object_t v23 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v23, "kWCMAntennaRequestInterval", a3);
  xpc_dictionary_set_BOOL(v23, "kWCMAntennaRequestUnii1Enabled", a4);
  xpc_dictionary_set_BOOL(v23, "kWCMAntennaRequestUnii3Enabled", a5);
  xpc_dictionary_set_BOOL(v23, "kWCMAntennaRequestUnii5aEnabled", a6);
  xpc_dictionary_set_BOOL(v23, "kWCMAntennaRequestUnii5bEnabled", a7);
  xpc_dictionary_set_BOOL(v23, "kWCMAntennaRequestUnii5cEnabled", a8);
  xpc_dictionary_set_BOOL(v23, "kWCMAntennaRequestUnii5dEnabled", a9);
  xpc_dictionary_set_BOOL(v23, "kWCMBTSetConditionIdEnable", 1);
  xpc_dictionary_set_uint64(v23, "kWCMBTConditionIdUnii1", a10);
  xpc_dictionary_set_uint64(v23, "kWCMBTConditionIdUnii3", a11);
  xpc_dictionary_set_uint64(v23, "kWCMBTConditionIdUnii5a", a12);
  xpc_dictionary_set_uint64(v23, "kWCMBTConditionIdUnii5b", a13);
  xpc_dictionary_set_uint64(v23, "kWCMBTConditionIdUnii5c", a14);
  xpc_dictionary_set_uint64(v23, "kWCMBTConditionIdUnii5d", a15);
  +[WCM_Logging logLevel:2, @"HFBTAntBlkDebug_ Setting config: full antenna request config %@", v23 message];
  [(WCM_Controller *)self sendMessage:1434 withArgs:v23];

  xpc_release(v23);
}

- (void)updateMWSScanFrequencyTable:(id)a3
{
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v5, "kWCMBTNumScanFrequencies", (uint64_t)[a3 count]);
  xpc_object_t v6 = xpc_array_create(0, 0);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(a3);
        }
        BOOL v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        xpc_object_t v12 = xpc_uint64_create((uint64_t)[v11 objectAtIndex:0 integerValue]);
        xpc_object_t v13 = xpc_uint64_create((uint64_t)[v11 objectAtIndex:1 integerValue]);
        xpc_object_t v14 = xpc_array_create(0, 0);
        xpc_array_append_value(v14, v12);
        xpc_array_append_value(v14, v13);
        xpc_array_append_value(v6, v14);
        xpc_release(v12);
        xpc_release(v13);
        xpc_release(v14);
      }
      id v8 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  xpc_dictionary_set_value(v5, "kWCMBTScanFrequencies", v6);
  xpc_release(v6);
  +[WCM_Logging logLevel:2 message:@"Setting BT MWS Scan Freq Table"];
  [(WCM_Controller *)self sendMessage:1422 withArgs:v5];
  xpc_release(v5);
}

- (void)updateCoexRxGainMode:(id)a3
{
  int v5 = self->mCurrentHFBTChannelMap[92];
  if (v5 == [a3 BOOLValue])
  {
    +[WCM_Logging logLevel:2, @"BT Agc Rx Coex Gain Mode already set to %d", self->mCurrentHFBTChannelMap[92] message];
  }
  else
  {
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kWCMBTCoexRxGainModeEnable", (int)[a3 intValue]);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, @"Setting BT Agc Rx Coex Gain Mode %d", [a3 intValue]);
    self->mCurrentHFBTChannelMap[92] = [a3 BOOLValue];
    [(WCM_Controller *)self sendMessage:1424 withArgs:v6];
    xpc_release(v6);
  }
}

- (void)updateCarplayBTScanParams:(BOOL)a3 reason:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  +[WCM_Logging logLevel:2, @"Sending messgae to BT about CarPlay status updateCarplayBTScanParams state : %d, %d", v5, v4 message];
  if (v7)
  {
    if (v4 >= 4) {
      uint64_t v8 = 4;
    }
    else {
      uint64_t v8 = v4;
    }
    xpc_dictionary_set_uint64(v7, "kWCMBTCoexScanIntervalState", v5);
    xpc_dictionary_set_uint64(v7, "kWCMBTCoexScanIntervalReason", v8);
    [(WCM_Controller *)self sendMessage:1426 withArgs:v7];
    +[WCM_Logging logLevel:2, @"Sent messgae to BT about CarPlay status (state): %d, (reason): %d", v5, v4 message];
    xpc_release(v7);
  }
  else
  {
    +[WCM_Logging logLevel:2, @"Failed to send messgae to BT about CarPlay status XPC failed (state): %d, (reason): %d", v5, v4 message];
  }
}

- (void)updateBTRCU2TimingArray:(id)a3
{
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  if (v5)
  {
    xpc_object_t v6 = v5;
    xpc_dictionary_set_BOOL(v5, "kWCMBTRC2GrantEnable", [(BOOL)[objc_msgSend(objc_msgSend(a3, "objectAtIndex:", 0), "BOOLValue"]]);
    xpc_dictionary_set_uint64(v6, "kWCMBTRC2TimingT3", [objc_msgSend(objc_msgSend(a3, "objectAtIndex:", 1), "unsignedIntValue") unsignedIntValue]);
    xpc_dictionary_set_uint64(v6, "kWCMBTRC2TimingT4", [[a3 objectAtIndex:2] unsignedIntValue]);
    [(WCM_Controller *)self sendMessage:1428 withArgs:v6];
    +[WCM_Logging logLevel:message:](WCM_Logging, @"Sent message to BT: RC2 grant En:%d T3:%d T4:%d", objc_msgSend(objc_msgSend(a3, "objectAtIndex:", 0), "BOOLValue"), objc_msgSend(objc_msgSend(a3, "objectAtIndex:", 1), "unsignedIntValue"), objc_msgSend(objc_msgSend(a3, "objectAtIndex:", 2), "unsignedIntValue"));
    xpc_release(v6);
  }
  else
  {
    +[WCM_Logging logLevel:2 message:@"Failed to send message to BT RC2 grant request message XPC failed (state)"];
  }
}

- (void)updateWiFiCriticalEnabled:(BOOL)a3
{
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v5, "kWCMAirplayCritical", a3);
  [(WCM_Controller *)self sendMessage:106 withArgs:v5];

  xpc_release(v5);
}

- (void)bspUpdateWiFiStatus:(BOOL)a3
{
  BOOL v3 = a3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  if (v5)
  {
    xpc_object_t v6 = v5;
    xpc_object_t v7 = xpc_uint64_create(1uLL);
    xpc_dictionary_set_value(v6, "BSP_CommandType", v7);
    xpc_release(v7);
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    if (v8)
    {
      uint64_t v9 = v8;
      xpc_object_t v10 = xpc_uint64_create(v3);
      xpc_dictionary_set_value(v9, "BSP_PowerState", v10);
      xpc_release(v10);
      xpc_dictionary_set_value(v6, "BSP_CommandParams", v9);
      xpc_release(v9);
    }
    [(WCM_Controller *)self sendMessage:1431 withArgs:v6];
    xpc_release(v6);
  }
}

- (void)bspSetFrequencyBandToUse:(int)a3 allowedBands:(int)a4
{
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  if (v7)
  {
    xpc_object_t v8 = v7;
    xpc_object_t v9 = xpc_uint64_create(2uLL);
    xpc_dictionary_set_value(v8, "BSP_CommandType", v9);
    xpc_release(v9);
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    if (v10)
    {
      BOOL v11 = v10;
      xpc_object_t v12 = xpc_uint64_create(a3);
      xpc_dictionary_set_value(v11, "BSP_FrequencyBand", v12);
      xpc_release(v12);
      xpc_object_t v13 = xpc_uint64_create(a4);
      xpc_dictionary_set_value(v11, "BSP_AllowedBands", v13);
      xpc_release(v13);
      xpc_dictionary_set_value(v8, "BSP_CommandParams", v11);
      xpc_release(v11);
    }
    [(WCM_Controller *)self sendMessage:1431 withArgs:v8];
    xpc_release(v8);
  }
}

- (void)bspNotifyChannelQuality:(int)a3 quality:(unint64_t)a4
{
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  if (v7)
  {
    xpc_object_t v8 = v7;
    xpc_object_t v9 = xpc_uint64_create(3uLL);
    xpc_dictionary_set_value(v8, "BSP_CommandType", v9);
    xpc_release(v9);
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    if (v10)
    {
      BOOL v11 = v10;
      xpc_object_t v12 = xpc_uint64_create(a3);
      xpc_dictionary_set_value(v11, "BSP_FrequencyBand", v12);
      xpc_release(v12);
      xpc_object_t v13 = xpc_uint64_create(a4);
      xpc_dictionary_set_value(v11, "BSP_ChannelQuality", v13);
      xpc_release(v13);
      xpc_dictionary_set_value(v8, "BSP_CommandParams", v11);
      xpc_release(v11);
    }
    [(WCM_Controller *)self sendMessage:1431 withArgs:v8];
    xpc_release(v8);
  }
}

- (void)bspStatusRequest
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  if (v3)
  {
    uint64_t v4 = v3;
    xpc_object_t v5 = xpc_uint64_create(5uLL);
    xpc_dictionary_set_value(v4, "BSP_CommandType", v5);
    xpc_release(v5);
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    if (v6)
    {
      xpc_object_t v7 = v6;
      xpc_object_t v8 = xpc_uint64_create(0);
      xpc_dictionary_set_value(v7, "dummy", v8);
      xpc_release(v8);
      xpc_dictionary_set_value(v4, "BSP_CommandParams", v7);
      xpc_release(v7);
    }
    [(WCM_Controller *)self sendMessage:1431 withArgs:v4];
    xpc_release(v4);
  }
}

- (void)bspBandSwitchReject:(int)a3 targetBand:(int)a4
{
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  if (v7)
  {
    xpc_object_t v8 = v7;
    xpc_object_t v9 = xpc_uint64_create(6uLL);
    xpc_dictionary_set_value(v8, "BSP_CommandType", v9);
    xpc_release(v9);
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    if (v10)
    {
      BOOL v11 = v10;
      xpc_object_t v12 = xpc_uint64_create(a3);
      xpc_dictionary_set_value(v11, "BSP_ReasonCode", v12);
      xpc_release(v12);
      xpc_object_t v13 = xpc_uint64_create(a4);
      xpc_dictionary_set_value(v11, "BSP_TargetBand", v13);
      xpc_release(v13);
      xpc_dictionary_set_value(v8, "BSP_CommandParams", v11);
      xpc_release(v11);
    }
    [(WCM_Controller *)self sendMessage:1431 withArgs:v8];
    xpc_release(v8);
  }
}

- (void)bspRegulatoryInfoRequest:(id)a3 timeStamp:(int64_t)a4
{
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  if (v7)
  {
    xpc_object_t v8 = v7;
    xpc_object_t v9 = xpc_uint64_create(7uLL);
    xpc_dictionary_set_value(v8, "BSP_CommandType", v9);
    xpc_release(v9);
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    if (v10)
    {
      BOOL v11 = v10;
      xpc_dictionary_set_string(v10, "BSP_CountryCode", (const char *)[a3 UTF8String]);
      xpc_dictionary_set_int64(v11, "BSP_CountryCodeTimeStamp", a4);
      xpc_dictionary_set_value(v8, "BSP_CommandParams", v11);
      xpc_release(v11);
    }
    [(WCM_Controller *)self sendMessage:1431 withArgs:v8];
    xpc_release(v8);
  }
}

- (unint64_t)getLeConnDutyCycle
{
  return *(void *)&self->mDiversityAFHMapForC1B1[11];
}

- (unint64_t)getLeConnReason
{
  return *(unint64_t *)((char *)&self->mLeConnDutyCycle + 4);
}

- (unint64_t)getLeConnBand
{
  return *(unint64_t *)((char *)&self->mLeConnReason + 4);
}

- (unint64_t)getLeConnDuration
{
  return *(unint64_t *)((char *)&self->mLeConnBand + 4);
}

- (int64_t)getLeDiscoveryScanState
{
  return *(unint64_t *)((char *)&self->mLeConnDuration + 4);
}

- (int64_t)getLeDiscoveryScanUseCase
{
  return *(int64_t *)((char *)&self->mLeDiscoveryScanState + 4);
}

- (void)handleLeConn:(id)a3
{
  +[WCM_Logging logLevel:2, @"Received LeConn msg: %@", a3 message];
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value)
  {
    xpc_object_t v6 = value;
    *(void *)&self->mDiversityAFHMapForC1B1[11] = xpc_dictionary_get_uint64(value, "kWCMBTLeConnect_DC");
    *(unint64_t *)((char *)&self->mLeConnDutyCycle + 4) = xpc_dictionary_get_uint64(v6, "kWCMBTLeConnect_OverrideReason");
    *(unint64_t *)((char *)&self->mLeConnReason + 4) = xpc_dictionary_get_uint64(v6, "kWCMBTLeConnect_Band");
    *(unint64_t *)((char *)&self->mLeConnBand + 4) = xpc_dictionary_get_uint64(v6, "kWCMBTLeConnect_Duration");
    id v7 = +[WCM_PolicyManager singleton];
    [v7 updateControllerState:108];
  }
  else
  {
    +[WCM_Logging logLevel:0 message:@"Error Getting Args"];
  }
}

- (void)handleLeDiscoveryScanStateChange:(id)a3
{
  +[WCM_Logging logLevel:2 message:@"Received LeScanStateChange msg"];
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value)
  {
    xpc_object_t v6 = value;
    *(unint64_t *)((char *)&self->mLeConnDuration + 4) = xpc_dictionary_get_int64(value, "kWCMBTLeDiscoveryScan_State");
    *(int64_t *)((char *)&self->mLeDiscoveryScanState + 4) = xpc_dictionary_get_int64(v6, "kWCMBTLeDiscoveryScan_UseCase");
    if (qword_10027CBD0 != *(unint64_t *)((char *)&self->mLeConnDuration + 4))
    {
      [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") updateControllerState:518];
      qword_10027CBD0 = *(unint64_t *)((char *)&self->mLeConnDuration + 4);
    }
  }
  else
  {
    +[WCM_Logging logLevel:0 message:@"Error Getting Args"];
  }
}

- (void)handleBTBandwidthLoad:(id)a3
{
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  uint64_t uint64 = xpc_dictionary_get_uint64(value, "kWCMBTWirelessLoadValue");
  id v5 = [[[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") rcu2Controller] threadClient];

  [v5 setWirelessLoad:uint64];
}

- (void)handleScanStart:(id)a3
{
}

- (void)handleScanStop:(id)a3
{
}

- (void)handleLinkQaulity:(id)a3
{
}

- (void)handleLTELinkQuality:(id)a3
{
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  uint64_t uint64 = xpc_dictionary_get_uint64(value, "kWCMBTLTELinkQuality_Type");
  xpc_object_t v5 = xpc_dictionary_get_value(value, "kWCMBTLTELinkQuality_ChannelMap");
  if (v5)
  {
    +[WCM_Logging logLevel:5, @"Link Quality Type = %d, Channel Map Count = %zu", uint64, xpc_array_get_count(v5) message];
    switch((int)uint64)
    {
      case 1:
        CFStringRef v6 = @" Average RSSI - LTE TX ACTIVE";
        goto LABEL_16;
      case 2:
        CFStringRef v6 = @" Average RSSI - LTE TX NOT-ACTIVE";
        goto LABEL_16;
      case 3:
        CFStringRef v6 = @" Rx Error Count - LTE Tx ACTIVE";
        goto LABEL_16;
      case 4:
        CFStringRef v6 = @" Rx Total Count - LTE Tx ACTIVE";
        goto LABEL_16;
      case 5:
        CFStringRef v6 = @" Rx Error Count - LTE Tx NOT-ACTIVE";
        goto LABEL_16;
      case 6:
        CFStringRef v6 = @" Rx Total Count - LTE Tx NOT-ACTIVE";
        goto LABEL_16;
      case 7:
        CFStringRef v6 = @"Tx Rexmit Count - LTE Tx ACTIVE";
        goto LABEL_16;
      case 8:
        CFStringRef v6 = @"Tx Total Count - LTE Tx ACTIVE";
        goto LABEL_16;
      case 9:
        CFStringRef v6 = @"Tx Rexmit Count - LTE Tx NOT-ACTIVE";
        goto LABEL_16;
      case 10:
        CFStringRef v6 = @"Tx Total Count - LTE Tx NOT-ACTIVE";
        goto LABEL_16;
      case 11:
        CFStringRef v6 = @" Background RSSI - LTE TX NOT-ACTIVE";
LABEL_16:
        uint64_t v7 = 3;
        goto LABEL_17;
      default:
        +[WCM_Logging logLevel:3, @" Invalid Link Quality Type Message %d", uint64 message];
        return;
    }
  }
  CFStringRef v6 = @"Error getting Channel Map array";
  uint64_t v7 = 0;
LABEL_17:

  +[WCM_Logging logLevel:v7 message:v6];
}

- (void)resetBtMetrics
{
  [(WCM_BTControllerIOS *)self setMClassicRssi:128];
  [(WCM_BTControllerIOS *)self setMLeRssi:128];
  [(WCM_BTControllerIOS *)self setMMovingAvgRSSI:128.0];
  [(WCM_BTControllerIOS *)self setMLeSuccessfulTxCount:0];
  [(WCM_BTControllerIOS *)self setMLeSuccessfulTxCount:0];
  [(WCM_BTControllerIOS *)self setMLeReTxCount:0];
  [(WCM_BTControllerIOS *)self setMLeSuccessfulRxCount:0];
  [(WCM_BTControllerIOS *)self setMLeRxErrorCount:0];
  [(WCM_BTControllerIOS *)self setMLeCoexDenialCount:0];
  [(WCM_BTControllerIOS *)self setMClassicSuccessfulTxCount:0];
  [(WCM_BTControllerIOS *)self setMClassicReTxCount:0];
  [(WCM_BTControllerIOS *)self setMClassicSuccessfulRxCount:0];
  [(WCM_BTControllerIOS *)self setMClassicRxErrorCount:0];
  [(WCM_BTControllerIOS *)self setMClassicCoexDenialCount:0];
  [(WCM_BTControllerIOS *)self setMPrevActivePhy:0];
  [(WCM_BTControllerIOS *)self setMActivePhy:0];
  [(WCM_BTControllerIOS *)self setMActivePhyValid:0];
  [(WCM_BTControllerIOS *)self setMNonMagnetUtilization:0.0];
  [(WCM_BTControllerIOS *)self setMMetricsReportReason:0];
  [(WCM_BTControllerIOS *)self setMFlushCount:0];
  [(WCM_BTControllerIOS *)self setMBtPhyRate:0];
  [(WCM_BTControllerIOS *)self setMMovingAvgReTxCount:0];
  [(WCM_BTControllerIOS *)self setMMovingAvgRxErrorCount:0];
  [(WCM_BTControllerIOS *)self setMMovingAvgSuccessfulRxCount:0];
  [(WCM_BTControllerIOS *)self setMMovingAvgSuccessfulTxCount:0];

  [(WCM_BTControllerIOS *)self setMNumberofSamples:0];
}

- (void)handleBTMetricsRpt:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10009D464;
  v3[3] = &unk_10020DAB0;
  v3[4] = a3;
  v3[5] = self;
  dispatch_async((dispatch_queue_t)[(WCM_BTControllerIOS *)self queue], v3);
}

- (void)handleBTPhyRpt:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10009DCF4;
  v3[3] = &unk_10020DAB0;
  v3[4] = a3;
  v3[5] = self;
  dispatch_async((dispatch_queue_t)[(WCM_BTControllerIOS *)self queue], v3);
}

- (void)handelAFHMap:(id)a3
{
  +[WCM_Logging logLevel:3, @"Received AFH Map Message %@", a3 message];
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (!value)
  {
    CFStringRef v9 = @"Error Getting Args";
LABEL_9:
    +[WCM_Logging logLevel:0 message:v9];
    return;
  }
  CFStringRef v6 = value;
  +[WCM_Logging logLevel:2, @"Received AFH Mode %llu", xpc_dictionary_get_uint64(value, "kWCMBTAFHMode") message];
  xpc_object_t v7 = xpc_dictionary_get_value(v6, "kWCMBTAFHBDA");
  if (!v7)
  {
    CFStringRef v9 = @"Invalid BDA Obj";
    goto LABEL_9;
  }
  if (xpc_data_get_bytes(v7, buffer, 0, 6uLL))
  {
    xpc_object_t v8 = xpc_dictionary_get_value(v6, "kWCMBTAFHChannelMap");
    if (v8)
    {
      if (xpc_data_get_bytes(v8, v12, 0, 0xAuLL))
      {
        [(WCM_BTControllerIOS *)self printAFHMap:v12];
        return;
      }
      CFStringRef v10 = @"Error Getting afhMap";
    }
    else
    {
      CFStringRef v10 = @"Invalid Map Obj";
    }
  }
  else
  {
    CFStringRef v10 = @"Error Getting BDA";
  }
  +[WCM_Logging logLevel:0 message:v10];
}

- (void)handleHFBTChannelMap:(id)a3
{
  +[WCM_Logging logLevel:3, @"HFAFHDebug_ Received Channel Map Message %@", a3 message];
  size_t length = 0;
  data = xpc_dictionary_get_data(a3, "kMessageArgs", &length);
  if (data && length > 0x5F)
  {
    for (uint64_t i = 0; i != 96; ++i)
      v8[i] = data[i];
    [(WCM_BTControllerIOS *)self printHFBTChannelMap:v8];
  }
  else
  {
    +[WCM_Logging logLevel:0 message:@"HFAFHDebug_ Error Getting Channel Map"];
  }
}

- (void)handleRawRSSI:(id)a3
{
  +[WCM_Logging logLevel:3, @"Received RAW RSSI Message %@", a3 message];
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value)
  {
    xpc_object_t v5 = value;
    +[WCM_Logging logLevel:2, @"Received RSSI -%llu\n", 128 - (xpc_dictionary_get_uint64(value, "kWCMBTRAWRSSI") & 0x7F) message];
    xpc_object_t v6 = xpc_dictionary_get_value(v5, "kWCMBTRSSIBDA");
    if (v6)
    {
      if (xpc_data_get_bytes(v6, buffer, 0, 6uLL)) {
        +[WCM_Logging logLevel:2, @"RSSI BDA = %2x:%2x:%2x:%2x:%2x:%2x\n", buffer[0], buffer[1], buffer[2], buffer[3], buffer[4], buffer[5] message];
      }
      else {
        +[WCM_Logging logLevel:0, @"Error Getting BDA", v8, v9, v10, v11, v12, v13 message];
      }
      return;
    }
    CFStringRef v7 = @"Invalid BDA Obj";
  }
  else
  {
    CFStringRef v7 = @"Error Getting Args";
  }

  +[WCM_Logging logLevel:0 message:v7];
}

- (void)handleAntennaPreferenceBResponse:(id)a3
{
  +[WCM_Logging logLevel:4 message:@"YYDebug_ Received BT Antenna PreferenceB Response"];
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value)
  {
    xpc_object_t v5 = value;
    uint64_t uint64 = xpc_dictionary_get_uint64(value, "kWCMBTAntennaAction");
    uint64_t v7 = xpc_dictionary_get_uint64(v5, "kWCMBTStatus");
    uint64_t v8 = xpc_dictionary_get_uint64(v5, "kWCMBTCurrentAntenna");
    +[WCM_Logging logLevel:4, @"YYDebug_ antennaAction(%u) status(%llu) currentAnt(%llu) previousAnt(%llu)", uint64, v7, v8, xpc_dictionary_get_uint64(v5, "kWCMBTPreviousAntenna") message];
  }
}

- (void)handleAntennaSwitchNotification:(id)a3
{
  +[WCM_Logging logLevel:3 message:@"Received BT Antenna Switch Notification"];
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value)
  {
    xpc_object_t v5 = value;
    uint64_t uint64 = xpc_dictionary_get_uint64(value, "kWCMBTCurrentAntenna");
    +[WCM_Logging logLevel:2, @"connectionHandle(%llu) currentAntenna(%llu)", xpc_dictionary_get_uint64(v5, "kWCMBTConnectionHandle"), uint64 message];
  }
}

- (void)handleBSPEvent:(id)a3
{
  +[WCM_Logging logLevel:2, @"Received BSPEvent msg: %@", a3 message];
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value)
  {
    xpc_object_t v5 = value;
    uint64_t uint64 = xpc_dictionary_get_uint64(value, "BSP_EventType");
    switch(uint64)
    {
      case 3:
        xpc_object_t v12 = xpc_dictionary_get_value(v5, "BSP_EventParams");
        uint64_t v13 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v12, "BSP_CountryCode")];
        uint64_t v14 = xpc_dictionary_get_uint64(v12, "BSP_AllowedBands");
        id v15 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") bspMonitor];
        [v15 handleBTRegulatoryInfoEvent:v13 allowedBands:v14];
        break;
      case 2:
        xpc_object_t v16 = xpc_dictionary_get_value(v5, "BSP_EventParams");
        uint64_t v17 = xpc_dictionary_get_uint64(v16, "BSP_CurrentBand");
        uint64_t v18 = xpc_dictionary_get_uint64(v16, "BSP_TargetBand");
        id v19 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") bspMonitor];
        [v19 handleBTBandSwitchRequestEvent:v17 targetBand:v18];
        break;
      case 1:
        xpc_object_t v7 = xpc_dictionary_get_value(v5, "BSP_EventParams");
        BOOL v8 = xpc_dictionary_get_BOOL(v7, "BSP_PowerState");
        uint64_t v9 = xpc_dictionary_get_uint64(v7, "BSP_FrequencyBand");
        uint64_t v10 = xpc_dictionary_get_uint64(v7, "BSP_ULLAMode");
        id v11 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") bspMonitor];
        [v11 handleBTStatusUpdateEvent:v8 frequencyBand:v9 ullaMode:v10];
        break;
      default:
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 1, @"%s Unknown eventType %d", "-[WCM_BTControllerIOS handleBSPEvent:]", uint64);
        break;
    }
  }
  else
  {
    +[WCM_Logging logLevel:0 message:@"Error Getting Args"];
  }
}

- (void)printAFHMap:(char *)a3
{
  uint64_t v4 = 0;
  int v14 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  *(_OWORD *)BOOL v8 = 0u;
  long long v9 = 0u;
  do
  {
    uint64_t v5 = 0;
    xpc_object_t v6 = v8;
    do
    {
      if ((a3[v4] >> v5)) {
        uint64_t v7 = 88;
      }
      else {
        uint64_t v7 = 46;
      }
      sprintf(v6, "  %c  ", v7);
      ++v5;
      v6 += 5;
    }
    while (v5 != 8);
    +[WCM_Logging logLevel:4, @"AFH Map [%2d - %2d]: %s", (8 * v4), (8 * v4) | 7u, v8 message];
    ++v4;
  }
  while (v4 != 10);
}

- (void)printHFBTChannelMap:(char *)a3
{
  uint64_t v4 = 0;
  int v14 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  *(_OWORD *)BOOL v8 = 0u;
  long long v9 = 0u;
  do
  {
    uint64_t v5 = v8;
    uint64_t v6 = 8;
    do
    {
      if ((a3[v4] >> --v6)) {
        uint64_t v7 = 88;
      }
      else {
        uint64_t v7 = 46;
      }
      sprintf(v5, "  %c  ", v7);
      v5 += 5;
    }
    while (v6);
    +[WCM_Logging logLevel:4, @"HFAFHDebug_ Map [%2d - %2d]: %s", (8 * v4), (8 * v4) | 7u, v8 message];
    ++v4;
  }
  while (v4 != 96);
}

- (void)printBLEAFHMap:(char *)a3
{
  +[WCM_Logging logLevel:4 message:@"DLDebug_ Printing BLE AFH Map"];
  uint64_t v4 = 0;
  int v14 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  *(_OWORD *)BOOL v8 = 0u;
  long long v9 = 0u;
  do
  {
    uint64_t v5 = 0;
    uint64_t v6 = v8;
    do
    {
      if ((a3[v4] >> v5)) {
        uint64_t v7 = 89;
      }
      else {
        uint64_t v7 = 110;
      }
      sprintf(v6, "  %c  ", v7);
      ++v5;
      v6 += 5;
    }
    while (v5 != 8);
    +[WCM_Logging logLevel:4, @"BLE AFH Map [%2d - %2d]: %s", (8 * v4), (8 * v4) | 7u, v8 message];
    ++v4;
  }
  while (v4 != 5);
}

- (id)createBTHCIExternalFrameConfigParams:(id)a3
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v5 = xpc_array_create(0, 0);
  xpc_object_t v6 = xpc_array_create(0, 0);
  id v7 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") platformManager];
  xpc_object_t v8 = xpc_uint64_create(0x2710uLL);
  xpc_dictionary_set_value(v4, "kWCMBTSetMWSExternalConfig_ExtFrameDuration", v8);
  xpc_release(v8);
  xpc_object_t v9 = xpc_int64_create((int64_t)[v7 wcmWCI2FrameSyncAssertOffset]);
  xpc_dictionary_set_value(v4, "kWCMBTSetMWSExternalConfig_ExtFrameSyncAssertOffset", v9);
  xpc_release(v9);
  xpc_object_t v10 = xpc_uint64_create((uint64_t)[v7 wcmWCI2FrameSyncAssertJitter]);
  xpc_dictionary_set_value(v4, "kWCMBTSetMWSExternalConfig_ExtFrameSyncAssertJitter", v10);
  xpc_release(v10);
  if ([a3 tddBand]
    && ([v7 wcmBTSupportTDDFrameConfig] & 1) != 0)
  {
    unint64_t v11 = (unint64_t)[a3 tddULDLConfig];
    unint64_t v12 = (unint64_t)[a3 subframeFormat];
    id v13 = [a3 dlCPConfig];
    id v14 = [a3 ulCPConfig];
    if (v11 > 6 || v12 > 9)
    {
      +[WCM_Logging logLevel:0, @"ExtFrameConfig : Invalid Config ULDL = %llu, sff = %llu", v11, v12 message];
    }
    else
    {
      int v15 = 0;
      unsigned int v16 = 0;
      uint64_t v17 = 120;
      if (!v14) {
        uint64_t v17 = 80;
      }
      xpc_object_t xdict = v4;
      v46 = (float *)((char *)&unk_1001EA4E0 + 4 * v12 + v17);
      v47 = (float *)((char *)&unk_1001EA4E0 + 40 * (v13 != 0) + 4 * v12);
      v48 = &aDsuuudsuuudsuu_0[10 * v11 + 1];
      do
      {
        int v18 = aDsuuudsuuudsuu_0[10 * v11 + v15];
        xpc_object_t v19 = xpc_uint64_create(v18 != 68);
        xpc_array_append_value(v5, v19);
        xpc_release(v19);
        uint64_t v20 = 0;
        if (v15 <= 9) {
          uint64_t v21 = 9;
        }
        else {
          uint64_t v21 = v15;
        }
        int v22 = -v16;
        do
        {
          int v23 = v22;
          if (v21 - v15 == v20) {
            goto LABEL_23;
          }
          int v24 = v48[v15 + v20++];
          v22 -= 1000;
        }
        while (v24 == v18);
        if (v24 != 83)
        {
          LODWORD(v21) = v15 - 1 + v20;
LABEL_23:
          xpc_object_t v35 = xpc_uint64_create(1000 - v23);
          xpc_array_append_value(v6, v35);
          xpc_release(v35);
          unsigned int v16 = 0;
          goto LABEL_24;
        }
        unsigned __int16 v25 = v6;
        unsigned int v26 = llroundf(*v47);
        unint64_t v27 = v11;
        unsigned int v28 = llroundf(*v46);
        LODWORD(v21) = v15 + v20;
        if (v18 == 68) {
          unsigned int v29 = v26;
        }
        else {
          unsigned int v29 = v28;
        }
        if (v18 == 68) {
          unsigned int v16 = v28;
        }
        else {
          unsigned int v16 = v26;
        }
        xpc_object_t v30 = xpc_uint64_create((int)(v29 - v22));
        xpc_array_append_value(v25, v30);
        xpc_release(v30);
        xpc_object_t v31 = xpc_uint64_create(3uLL);
        xpc_array_append_value(v5, v31);
        unsigned int v32 = v26 + v28;
        unint64_t v11 = v27;
        xpc_release(v31);
        signed int v33 = 1000 - v32;
        xpc_object_t v6 = v25;
        xpc_object_t v34 = xpc_uint64_create(v33);
        xpc_array_append_value(v25, v34);
        xpc_release(v34);
LABEL_24:
        int v15 = v21 + 1;
      }
      while ((int)v21 < 9);
      +[WCM_Logging logLevel:3, @"Creating MWS_ExtFrameConfig: TDD with %zu Types", xpc_array_get_count(v5) message];
      xpc_object_t v4 = xdict;
    }
  }
  else
  {
    xpc_object_t v36 = xpc_uint64_create(1uLL);
    xpc_dictionary_set_value(v4, "kWCMBTSetMWSExternalConfig_ExtNumPeriods", v36);
    xpc_release(v36);
    xpc_object_t v37 = xpc_uint64_create(2uLL);
    xpc_array_append_value(v5, v37);
    xpc_release(v37);
    xpc_object_t v38 = xpc_uint64_create(0x2710uLL);
    xpc_array_append_value(v6, v38);
    xpc_release(v38);
    +[WCM_Logging logLevel:3, @"Creating MWS_ExtFrameConfig: FDD", v43, v44 message];
  }
  xpc_dictionary_set_value(v4, "kWCMBTSetMWSExternalConfig_ExtPeriodDuration", v6);
  xpc_dictionary_set_value(v4, "kWCMBTSetMWSExternalConfig_ExtPeriodType", v5);
  size_t count = xpc_array_get_count(v5);
  xpc_object_t v40 = xpc_uint64_create(count);
  xpc_dictionary_set_value(v4, "kWCMBTSetMWSExternalConfig_ExtNumPeriods", v40);
  xpc_release(v40);
  xpc_release(v6);
  xpc_release(v5);
  id v41 = v4;
  return v4;
}

- (unint64_t)getMovingAvgBTRssi
{
  [(WCM_BTControllerIOS *)self mMovingAvgRSSI];
  return (unint64_t)v2;
}

- (double)getBtTxPer
{
  double v3 = (double)[(WCM_BTControllerIOS *)self mMovingAvgReTxCount];
  unint64_t v4 = [(WCM_BTControllerIOS *)self mMovingAvgSuccessfulTxCount];
  return v3 / ((double)([(WCM_BTControllerIOS *)self mMovingAvgReTxCount] + v4) + 0.000001);
}

- (double)getBtRxPer
{
  double v3 = (double)[(WCM_BTControllerIOS *)self mMovingAvgRxErrorCount];
  unint64_t v4 = [(WCM_BTControllerIOS *)self mMovingAvgSuccessfulRxCount];
  return v3 / ((double)([(WCM_BTControllerIOS *)self mMovingAvgRxErrorCount] + v4) + 0.000001);
}

- (BOOL)isBTMetricsValid
{
  id v3 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getiRATConfigController];
  unint64_t v4 = [(WCM_BTControllerIOS *)self mNumberofSamples];
  return v4 >= (unint64_t)[v3 dataBtMovingAvgAlphaDenum];
}

- (unint64_t)mClassicRssi
{
  return *(void *)(&self->_mActivePhyValid + 4);
}

- (void)setMClassicRssi:(unint64_t)a3
{
  *(void *)(&self->_mActivePhyValid + 4) = a3;
}

- (unint64_t)mLeRssi
{
  return *(unint64_t *)((char *)&self->_mClassicRssi + 4);
}

- (void)setMLeRssi:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mClassicRssi + 4) = a3;
}

- (unint64_t)mLeSuccessfulTxCount
{
  return *(unint64_t *)((char *)&self->_mLeRssi + 4);
}

- (void)setMLeSuccessfulTxCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mLeRssi + 4) = a3;
}

- (unint64_t)mLeReTxCount
{
  return *(unint64_t *)((char *)&self->_mLeSuccessfulTxCount + 4);
}

- (void)setMLeReTxCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mLeSuccessfulTxCount + 4) = a3;
}

- (unint64_t)mLeSuccessfulRxCount
{
  return *(unint64_t *)((char *)&self->_mLeReTxCount + 4);
}

- (void)setMLeSuccessfulRxCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mLeReTxCount + 4) = a3;
}

- (unint64_t)mLeRxErrorCount
{
  return *(unint64_t *)((char *)&self->_mLeSuccessfulRxCount + 4);
}

- (void)setMLeRxErrorCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mLeSuccessfulRxCount + 4) = a3;
}

- (unint64_t)mLeCoexDenialCount
{
  return *(unint64_t *)((char *)&self->_mLeRxErrorCount + 4);
}

- (void)setMLeCoexDenialCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mLeRxErrorCount + 4) = a3;
}

- (unint64_t)mClassicSuccessfulTxCount
{
  return *(unint64_t *)((char *)&self->_mLeCoexDenialCount + 4);
}

- (void)setMClassicSuccessfulTxCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mLeCoexDenialCount + 4) = a3;
}

- (unint64_t)mClassicReTxCount
{
  return *(unint64_t *)((char *)&self->_mClassicSuccessfulTxCount + 4);
}

- (void)setMClassicReTxCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mClassicSuccessfulTxCount + 4) = a3;
}

- (unint64_t)mClassicSuccessfulRxCount
{
  return *(unint64_t *)((char *)&self->_mClassicReTxCount + 4);
}

- (void)setMClassicSuccessfulRxCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mClassicReTxCount + 4) = a3;
}

- (unint64_t)mClassicRxErrorCount
{
  return *(unint64_t *)((char *)&self->_mClassicSuccessfulRxCount + 4);
}

- (void)setMClassicRxErrorCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mClassicSuccessfulRxCount + 4) = a3;
}

- (unint64_t)mClassicCoexDenialCount
{
  return *(unint64_t *)((char *)&self->_mClassicRxErrorCount + 4);
}

- (void)setMClassicCoexDenialCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mClassicRxErrorCount + 4) = a3;
}

- (unint64_t)mActivePhy
{
  return *(unint64_t *)((char *)&self->_mClassicCoexDenialCount + 4);
}

- (void)setMActivePhy:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mClassicCoexDenialCount + 4) = a3;
}

- (BOOL)mActivePhyValid
{
  return BYTE4(self->mLeDiscoveryScanUseCase);
}

- (void)setMActivePhyValid:(BOOL)a3
{
  BYTE4(self->mLeDiscoveryScanUseCase) = a3;
}

- (double)mNonMagnetUtilization
{
  return *(double *)((char *)&self->_mActivePhy + 4);
}

- (void)setMNonMagnetUtilization:(double)a3
{
  *(double *)((char *)&self->_mActivePhy + 4) = a3;
}

- (unint64_t)mMetricsReportReason
{
  return *(void *)((char *)&self->_mNonMagnetUtilization + 4);
}

- (void)setMMetricsReportReason:(unint64_t)a3
{
  *(void *)((char *)&self->_mNonMagnetUtilization + 4) = a3;
}

- (unint64_t)mFlushCount
{
  return *(unint64_t *)((char *)&self->_mMetricsReportReason + 4);
}

- (void)setMFlushCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mMetricsReportReason + 4) = a3;
}

- (unint64_t)mBtPhyRate
{
  return *(unint64_t *)((char *)&self->_mFlushCount + 4);
}

- (void)setMBtPhyRate:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mFlushCount + 4) = a3;
}

- (double)mMovingAvgRSSI
{
  return *(double *)((char *)&self->_mBtPhyRate + 4);
}

- (void)setMMovingAvgRSSI:(double)a3
{
  *(double *)((char *)&self->_mBtPhyRate + 4) = a3;
}

- (unint64_t)mPrevActivePhy
{
  return *(void *)((char *)&self->_mMovingAvgRSSI + 4);
}

- (void)setMPrevActivePhy:(unint64_t)a3
{
  *(void *)((char *)&self->_mMovingAvgRSSI + 4) = a3;
}

- (unint64_t)mMovingAvgSuccessfulTxCount
{
  return *(unint64_t *)((char *)&self->_mPrevActivePhy + 4);
}

- (void)setMMovingAvgSuccessfulTxCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mPrevActivePhy + 4) = a3;
}

- (unint64_t)mMovingAvgSuccessfulRxCount
{
  return *(unint64_t *)((char *)&self->_mMovingAvgSuccessfulTxCount + 4);
}

- (void)setMMovingAvgSuccessfulRxCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mMovingAvgSuccessfulTxCount + 4) = a3;
}

- (unint64_t)mMovingAvgReTxCount
{
  return *(unint64_t *)((char *)&self->_mMovingAvgSuccessfulRxCount + 4);
}

- (void)setMMovingAvgReTxCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mMovingAvgSuccessfulRxCount + 4) = a3;
}

- (unint64_t)mMovingAvgRxErrorCount
{
  return *(unint64_t *)((char *)&self->_mMovingAvgReTxCount + 4);
}

- (void)setMMovingAvgRxErrorCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mMovingAvgReTxCount + 4) = a3;
}

- (unint64_t)mNumberofSamples
{
  return *(unint64_t *)((char *)&self->_mMovingAvgRxErrorCount + 4);
}

- (void)setMNumberofSamples:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mMovingAvgRxErrorCount + 4) = a3;
}

- (unint64_t)mLQMLinkEvalCounter
{
  return *(unint64_t *)((char *)&self->_mNumberofSamples + 4);
}

- (void)setMLQMLinkEvalCounter:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mNumberofSamples + 4) = a3;
}

- (OS_dispatch_queue)queue
{
  return *(OS_dispatch_queue **)((char *)&self->_mLQMLinkEvalCounter + 4);
}

- (void)setQueue:(id)a3
{
}

@end