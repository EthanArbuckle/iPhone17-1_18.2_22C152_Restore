@interface WCM_AriCoexCommandHandler
- (BOOL)ImdTypeEnumCheck:(unint64_t)a3;
- (BOOL)LQMEnumCheck:(unint64_t)a3;
- (BOOL)ariApiEnabledByOSFeatureFlag:(int)a3;
- (BOOL)cacheEvent:(id)a3;
- (BOOL)cacheTunerTransparentMessage:(id)a3;
- (BOOL)callTypeEnumCheck:(unint64_t)a3;
- (BOOL)cameraEnumCheck:(unint64_t)a3;
- (BOOL)checkError:(void *)a3 expectedGMID:(unsigned int)a4;
- (BOOL)checkErrorMsgGmid:(unsigned int)a3 expectedGMID:(unsigned int)a4 API_Str:(const char *)a5;
- (BOOL)coexTechEnumCheck:(unint64_t)a3;
- (BOOL)mitigationTypeEnumCheck:(unint64_t)a3;
- (BOOL)setCamAntBlockingPowerLimitingParam:(t_s_UtaIdcCamAntBlockPwrLmtPolicyConfigBundleV3 *)a3 XpcMessage:(id)a4 SubId:(unsigned int)a5;
- (WCM_AriCoexCommandHandler)init;
- (id).cxx_construct;
- (id)assembleCellularConfigXpcMsg:(t_s_UtaIdcCellConfig *)a3;
- (id)assembleDesenseCellularConfigXpcMsgwithDownlinkFreq:(IBIAccServingDLFreqBandwidthInfo *)a3 DownlinkFreqExt:(IBIAccServingDLFreqBandwidthInfo_ext *)a4 UlFreq:(IBIAccServingULFreqBandwidthInfo *)a5 UplinkFreqExt:(IBIAccServingULFreqBandwidthInfo_ext *)a6 SearchFreq:(IBIAccSearchFreqBandwidthInfo *)a7 HoppingFreq:(IBIAccHoppingFreqBandwidthInfo *)a8 NeighborFreq:(IBIAccNeighborFreqBandwidthInfo *)a9 RPLMNFreq:(IBIAccRPLMNFreqBandwidthInfo *)a10;
- (id)createMessageWithMsgId:(unint64_t)a3 withArgs:(id)a4 withSubId:(id)a5;
- (int)convertInternalCallType:(unint64_t)a3;
- (int)convertInternalCoexTech:(unint64_t)a3;
- (unint64_t)getSubIdFromInternalCoexTech:(unint64_t)a3;
- (void)UtaIdcCellConfigEventIndHandle:(char *)a3 size:(unsigned int)a4;
- (void)appendDesenseFreqToXpcArray:(id)a3 DesenseFreq:(IBIAccFreqBandwidthInfo *)a4 Size:(unsigned int)a5;
- (void)clientStarted;
- (void)clientStopped;
- (void)configureAccReportMode;
- (void)connectBaseband;
- (void)convertToAriType_BtState:(unint64_t)a3 userCase:(unint64_t)a4 AriState:(unint64_t *)a5 AriUseCase:(unint64_t *)a6;
- (void)convertToAriType_FigaroState:(unint64_t)a3 userCase:(unint64_t)a4 AriState:(unint64_t *)a5 AriUseCase:(unint64_t *)a6;
- (void)convertToAriType_GnssState:(unint64_t)a3 userCase:(unint64_t)a4 AriState:(unint64_t *)a5 AriUseCase:(unint64_t *)a6;
- (void)convertToAriType_UwbState:(unint64_t)a3 userCase:(unint64_t)a4 AriState:(unint64_t *)a5 AriUseCase:(unint64_t *)a6;
- (void)convertToAriType_WiFiState:(unint64_t)a3 userCase:(unint64_t)a4 AriState:(unint64_t *)a5 AriUseCase:(unint64_t *)a6;
- (void)desenseCellConfigEventIndHandle:(char *)a3 size:(unsigned int)a4;
- (void)fetchLegacyRatFrequency:(t_s_UtaIdcLegacyRatCarrierInfoSet *)a3 freqInfoXpc:(id)a4;
- (void)fetchLteNrFrequency:(t_s_UtaIdcLteNrCarrierInfoSet *)a3 freqInfoXpc:(id)a4 carrierIdXpc:(id)a5;
- (void)fetchLtePccFrequency:(t_s_UtaIdcLteNrCarrierInfoSet *)a3 pccUplinkFreq:(int64_t *)a4 pccUplinkBw:(double *)a5 pccDownlinkFreq:(int64_t *)a6 pccDownlinkBw:(double *)a7;
- (void)getCellularLaaMeasInfo:(id)a3 SubId:(unsigned int)a4;
- (void)getCellularNetworkConfig:(id)a3 SubId:(unsigned int)a4;
- (void)handleCoexManagerEvent:(id)a3;
- (void)handleEvent:(id)a3;
- (void)handleGnssImdAntBlockPowerLimitConfig:(id)a3;
- (void)handleRc1DynamicPolicy:(id)a3 SubId:(unsigned int)a4;
- (void)handleTransparentMessage:(id)a3 SubId:(unsigned int)a4;
- (void)handleTunerState:(unint64_t)a3 sensorData:(id)a4 SubId:(unsigned int)a5;
- (void)printGnssImdConfig:(t_s_UtaIdcCellImdGnssMitigationPolicyConfig *)a3;
- (void)replayCachedEvent;
- (void)sendMessage:(unint64_t)a3 withArgs:(id)a4 withSubId:(unint64_t)a5;
- (void)setAllCCConfig:(id)a3 SubId:(unsigned int)a4;
- (void)setAntennaBlockingPolicyForPlatformId:(unint64_t)a3 activeSubId:(unint64_t)a4;
- (void)setCC1Config:(id)a3 SubId:(unsigned int)a4;
- (void)setCC2Config:(id)a3 SubId:(unsigned int)a4;
- (void)setCamAntBlockingPowerLimitingConfig:(id)a3 SubId:(unsigned int)a4;
- (void)setCameraState:(id)a3 SubId:(unsigned int)a4;
- (void)setCellularAntBitmap:(id)a3 SubId:(unsigned int)a4;
- (void)setCellularController:(id)a3;
- (void)setCellularMiscConfig:(id)a3 SubId:(unsigned int)a4;
- (void)setCellularMiscConfigToSubId:(unsigned int)a3 uwbInactThre_ms:(unsigned int)a4 cellOnTimer_ms:(unsigned int)a5;
- (void)setCellularTxActivityConfig:(id)a3 SubId:(unsigned int)a4;
- (void)setCnvAntBlockingPowerLimitingConfig:(id)a3 SubId:(unsigned int)a4;
- (void)setCoexOSFeatureFlag;
- (void)setCoexPlatformFeatureFlag;
- (void)setDefaultEvent;
- (void)setE85AntBlockingPowerLimitingConfig:(id)a3 SubId:(unsigned int)a4;
- (void)setLAAConfig:(id)a3 SubId:(unsigned int)a4;
- (void)setRC1Config:(id)a3 SubId:(unsigned int)a4;
- (void)setScanFreq:(id)a3 SubId:(unsigned int)a4;
- (void)setSpmiFeature;
- (void)setStaticTimesharingConfig:(unsigned int)a3;
- (void)setTimesharingConfig:(id)a3 SubId:(unsigned int)a4;
- (void)setTxBlankingPowerLimitingConfig:(id)a3 SubId:(unsigned int)a4;
- (void)setUwbAntBlockingPowerLimitingConfig:(id)a3 SubId:(unsigned int)a4;
- (void)updateBasebandPowerState;
@end

@implementation WCM_AriCoexCommandHandler

- (void)connectBaseband
{
  +[WCM_Logging logLevel:3 message:@"ICE Client to be started"];
  ptr = (ice::Client **)self->mIceClient.__ptr_;

  sub_1000D54CC(ptr);
}

- (void)setCoexOSFeatureFlag
{
  self->coexOSFeatureGroupEnabled[0] = 1;
  coexOSFeatureGroupEnabled = self->coexOSFeatureGroupEnabled;
  *(void *)&self->coexOSFeatureGroupEnabled[1] = 0;
  v4 = &self->coexOSFeatureGroupEnabled[1];
  *(_DWORD *)&self->coexOSFeatureGroupEnabled[9] = 0;
  if (_os_feature_enabled_impl()) {
    BOOL *v4 = 1;
  }
  if (_os_feature_enabled_impl()) {
    self->coexOSFeatureGroupEnabled[2] = 1;
  }
  if (_os_feature_enabled_impl()) {
    self->coexOSFeatureGroupEnabled[3] = 1;
  }
  if (_os_feature_enabled_impl()) {
    self->coexOSFeatureGroupEnabled[4] = 1;
  }
  if (_os_feature_enabled_impl()) {
    self->coexOSFeatureGroupEnabled[5] = 1;
  }
  if (_os_feature_enabled_impl()) {
    self->coexOSFeatureGroupEnabled[6] = 1;
  }
  if (_os_feature_enabled_impl()) {
    self->coexOSFeatureGroupEnabled[7] = 1;
  }
  if (_os_feature_enabled_impl()) {
    self->coexOSFeatureGroupEnabled[9] = 1;
  }
  if (_os_feature_enabled_impl()) {
    self->coexOSFeatureGroupEnabled[8] = 1;
  }
  if (_os_feature_enabled_impl()) {
    self->coexOSFeatureGroupEnabled[10] = 1;
  }
  if (_os_feature_enabled_impl()) {
    self->coexOSFeatureGroupEnabled[11] = 1;
  }
  if (_os_feature_enabled_impl()) {
    self->coexOSFeatureGroupEnabled[12] = 1;
  }
  for (uint64_t i = 0; i != 13; ++i)
    +[WCM_Logging logLevel:3, @"Coex ARI Driver:  coexOSFeatureGroupEnabled[%u] = %d\n", i, coexOSFeatureGroupEnabled[i] message];
}

- (void)setCoexPlatformFeatureFlag
{
  v3 = +[WCM_PolicyManager singleton];
  *(void *)&self->coexPlatformFeatureGroupEnabled[1] = 0;
  self->coexPlatformFeatureGroupEnabled[0] = 1;
  *(_DWORD *)&self->coexPlatformFeatureGroupEnabled[9] = 0;
  id v29 = v3;
  v4 = [v3 activeCoexFeatures];
  unsigned int v5 = [v4 containsObject:@"CoexFeatureGroupTimeSharingSupport"];

  if (v5) {
    self->coexPlatformFeatureGroupEnabled[1] = 1;
  }
  v6 = [v29 activeCoexFeatures];
  unsigned int v7 = [v6 containsObject:@"CoexFeatureGroupRxActivityProtectSupport"];

  if (v7) {
    self->coexPlatformFeatureGroupEnabled[2] = 1;
  }
  v8 = [v29 activeCoexFeatures];
  unsigned int v9 = [v8 containsObject:@"CoexFeatureGroupCameraSupport"];

  if (v9) {
    self->coexPlatformFeatureGroupEnabled[3] = 1;
  }
  v10 = [v29 activeCoexFeatures];
  unsigned int v11 = [v10 containsObject:@"CoexFeatureGroupConditionalMitigationSupport"];

  if (v11) {
    self->coexPlatformFeatureGroupEnabled[4] = 1;
  }
  v12 = [v29 activeCoexFeatures];
  unsigned int v13 = [v12 containsObject:@"CoexFeatureGroupBtClockAlignmentSupport"];

  if (v13) {
    self->coexPlatformFeatureGroupEnabled[5] = 1;
  }
  v14 = [v29 activeCoexFeatures];
  unsigned int v15 = [v14 containsObject:@"CoexFeatureGroupHpCellularSupport"];

  if (v15) {
    self->coexPlatformFeatureGroupEnabled[6] = 1;
  }
  v16 = [v29 activeCoexFeatures];
  unsigned int v17 = [v16 containsObject:@"CoexFeatureGroupUwbSupport"];

  if (v17) {
    self->coexPlatformFeatureGroupEnabled[7] = 1;
  }
  v18 = [v29 activeCoexFeatures];
  unsigned int v19 = [v18 containsObject:@"CoexFeatureGroupNfcSupport"];

  if (v19) {
    self->coexPlatformFeatureGroupEnabled[9] = 1;
  }
  v20 = [v29 activeCoexFeatures];
  unsigned int v21 = [v20 containsObject:@"CoexFeatureGroupUsbCSupport"];

  if (v21) {
    self->coexPlatformFeatureGroupEnabled[8] = 1;
  }
  v22 = [v29 activeCoexFeatures];
  unsigned int v23 = [v22 containsObject:@"CoexFeatureGroupGnssImdSupport"];

  if (v23) {
    self->coexPlatformFeatureGroupEnabled[10] = 1;
  }
  v24 = [v29 activeCoexFeatures];
  unsigned int v25 = [v24 containsObject:@"CoexFeatureGroupAntTunerSupport"];

  if (v25) {
    self->coexPlatformFeatureGroupEnabled[11] = 1;
  }
  v26 = [v29 activeCoexFeatures];
  unsigned __int8 v27 = [v26 containsObject:@"CoexFeatureGroupStateIndSupport"];

  if (v27) {
    self->coexPlatformFeatureGroupEnabled[12] = 1;
  }
  for (uint64_t i = 0; i != 13; ++i)
    +[WCM_Logging logLevel:3, @"Coex ARI Driver:  coexPlatformFeatureGroupEnabled[%u] = %d\n", i, self->coexPlatformFeatureGroupEnabled[i] message];
}

- (BOOL)ariApiEnabledByOSFeatureFlag:(int)a3
{
  v3 = (void *)qword_10027CDD8;
  if (!qword_10027CDD8) {
    return 0;
  }
  uint64_t v4 = *(void *)&a3;
  v6 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
  unsigned int v7 = [v3 objectForKey:v6];

  if (!v7) {
    return 0;
  }
  v8 = (void *)qword_10027CDD8;
  unsigned int v9 = +[NSNumber numberWithUnsignedInt:v4];
  v10 = [v8 objectForKey:v9];
  unint64_t v11 = (unint64_t)[v10 integerValue];

  return v11 <= 0xC && self->coexOSFeatureGroupEnabled[v11];
}

- (WCM_AriCoexCommandHandler)init
{
  v24.receiver = self;
  v24.super_class = (Class)WCM_AriCoexCommandHandler;
  v2 = [(WCM_AriCoexCommandHandler *)&v24 init];
  +[WCM_Logging logLevel:3 message:@"Coex ARI driver: Init the WCM_AriCoexCommandHandler"];
  if (v2)
  {
    v3 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = 0;

    uint64_t v4 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = 0;

    unsigned int v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.WRM_IceClientDriver.CoexManager", v5);
    unsigned int v7 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v6;

    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.CoexManager.AriDriver", v8);
    v10 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v9;

    sub_100035610((id *)v2 + 4, (OS_dispatch_object *)"com.apple.WirelessRadioManagerd.CoexManager", &v23);
    long long v11 = v23;
    long long v23 = 0uLL;
    v12 = (std::__shared_weak_count *)*((void *)v2 + 2);
    *(_OWORD *)(v2 + 8) = v11;
    if (v12)
    {
      sub_1000357EC(v12);
      if (*((void *)&v23 + 1)) {
        sub_1000357EC(*((std::__shared_weak_count **)&v23 + 1));
      }
    }
    unsigned int v13 = objc_alloc_init(WCM_AriCoexCache);
    v14 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v13;

    v2[56] = 0;
    [v2 setCoexOSFeatureFlag];
    unsigned int v15 = (uint64_t *)*((void *)v2 + 1);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100028BCC;
    v21[3] = &unk_10020D7D0;
    v16 = v2;
    v22 = v16;
    sub_1000D54DC(v15, 0, (uint64_t)v21);
    unsigned int v17 = (uint64_t *)*((void *)v2 + 1);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100028BD4;
    v19[3] = &unk_10020D7D0;
    v20 = v16;
    sub_1000D54DC(v17, 1, (uint64_t)v19);
  }
  return (WCM_AriCoexCommandHandler *)v2;
}

- (void)setCellularController:(id)a3
{
}

- (void)clientStarted
{
  +[WCM_Logging logLevel:3 message:@"Coex ARI Driver:  ICE Client started\n"];
  self->basebandPowerOn = 1;
  [(WCM_AriCoexCommandHandler *)self setCoexPlatformFeatureFlag];
  +[WCM_Logging logLevel:3 message:@"Coex ARI Driver: unit test is NOT requested, ARI is enabled, update BB power state\n"];
  [(WCM_AriCoexCommandHandler *)self updateBasebandPowerState];
  [(WCM_AriCoexCommandHandler *)self setSpmiFeature];
  [(WCM_AriCoexCommandHandler *)self setDefaultEvent];
  ptr = (uint64_t *)self->mIceClient.__ptr_;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100028D68;
  v6[3] = &unk_10020D7F8;
  v6[4] = self;
  sub_1000D55B4(ptr, 1233321984, (uint64_t)v6);
  uint64_t v4 = (uint64_t *)self->mIceClient.__ptr_;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100028D78;
  v5[3] = &unk_10020D7F8;
  v5[4] = self;
  sub_1000D55B4(v4, 630194176, (uint64_t)v5);
  [(WCM_AriCoexCommandHandler *)self configureAccReportMode];
  [(WCM_AriCoexCommandHandler *)self setStaticTimesharingConfig:0];
  [(WCM_AriCoexCommandHandler *)self setStaticTimesharingConfig:1];
  [(WCM_AriCoexCommandHandler *)self setCellularMiscConfigToSubId:0 uwbInactThre_ms:100 cellOnTimer_ms:5000];
  [(WCM_AriCoexCommandHandler *)self setCellularMiscConfigToSubId:1 uwbInactThre_ms:100 cellOnTimer_ms:5000];
  [(WCM_AriCoexCommandHandler *)self replayCachedEvent];
}

- (void)clientStopped
{
  self->basebandPowerOn = 0;
  +[WCM_Logging logLevel:3 message:@"Coex ARI Driver:  ICE Client stopped\n"];
}

- (id)createMessageWithMsgId:(unint64_t)a3 withArgs:(id)a4 withSubId:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  *(_OWORD *)keys = *(_OWORD *)off_10020D840;
  v16 = "kSubId";
  values[0] = xpc_uint64_create(a3);
  id v9 = v7;
  values[1] = v9;
  id v10 = v8;
  values[2] = v10;
  xpc_object_t v11 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
  for (uint64_t i = 2; i != -1; --i)

  return v11;
}

- (BOOL)cacheTunerTransparentMessage:(id)a3
{
  id v4 = a3;
  unsigned int v5 = xpc_dictionary_get_value(v4, "kMessageArgs");
  dispatch_queue_t v6 = xpc_dictionary_get_value(v5, "kWCMCellularTransparentMessageInformationSet");
  id v7 = v6;
  if (v6 && xpc_array_get_count(v6))
  {
    id v8 = xpc_array_get_value(v7, 0);
    id v9 = v8;
    if (v8 && (uint64_t uint64 = xpc_dictionary_get_uint64(v8, "kWCMCellularTransparentMessage_Type"), uint64 < 4))
    {
      [(WCM_AriCoexCache *)self->mCache update:off_10020D8F8[uint64] value_object:v4 subId:0];
      BOOL v11 = 1;
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)cacheEvent:(id)a3
{
  id v4 = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(v4, "kMessageId");
  if (uint64 == 1223)
  {
    BOOL v6 = [(WCM_AriCoexCommandHandler *)self cacheTunerTransparentMessage:v4];
  }
  else if (uint64 == 1233)
  {
    [(WCM_AriCoexCache *)self->mCache update:@"kCameraStateEvent" value_object:v4 subId:0];
    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)replayCachedEvent
{
  id v7 = [(WCM_AriCoexCache *)self->mCache get:@"kCameraStateEvent" subId:0];
  v3 = [(WCM_AriCoexCache *)self->mCache get:@"kTunerStateWiFi" subId:0];
  id v4 = [(WCM_AriCoexCache *)self->mCache get:@"kTunerStateBT" subId:0];
  unsigned int v5 = [(WCM_AriCoexCache *)self->mCache get:@"kTunerStateUWB" subId:0];
  BOOL v6 = [(WCM_AriCoexCache *)self->mCache get:@"kTunerStateGNSS" subId:0];
  if (v7)
  {
    [(WCM_AriCoexCommandHandler *)self handleEvent:v7];
    [(WCM_AriCoexCache *)self->mCache removeKey:@"kCameraStateEvent" subId:0];
  }
  if (v3)
  {
    [(WCM_AriCoexCommandHandler *)self handleEvent:v3];
    [(WCM_AriCoexCache *)self->mCache removeKey:@"kTunerStateWiFi" subId:0];
  }
  if (v4)
  {
    [(WCM_AriCoexCommandHandler *)self handleEvent:v4];
    [(WCM_AriCoexCache *)self->mCache removeKey:@"kTunerStateBT" subId:0];
  }
  if (v5)
  {
    [(WCM_AriCoexCommandHandler *)self handleEvent:v5];
    [(WCM_AriCoexCache *)self->mCache removeKey:@"kTunerStateUWB" subId:0];
  }
  if (v6)
  {
    [(WCM_AriCoexCommandHandler *)self handleEvent:v6];
    [(WCM_AriCoexCache *)self->mCache removeKey:@"kTunerStateGNSS" subId:0];
  }
}

- (void)handleEvent:(id)a3
{
  id v4 = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(v4, "kMessageId");
  if (self->basebandPowerOn)
  {
    xpc_object_t v6 = xpc_copy(v4);
    mQueue = self->mQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100029390;
    block[3] = &unk_10020D820;
    block[4] = self;
    id v12 = v6;
    id v8 = v6;
    dispatch_async(mQueue, block);
  }
  else
  {
    uint64_t v9 = uint64;
    if ([(WCM_AriCoexCommandHandler *)self cacheEvent:v4]) {
      CFStringRef v10 = @"Coex ARI Driver:  ICE client is not ready yet, XPC message(%llu) is cached";
    }
    else {
      CFStringRef v10 = @"Coex ARI Driver:  ICE client is not ready yet, XPC message(%llu) is discarded";
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, v10, v9);
  }
}

- (void)setAntennaBlockingPolicyForPlatformId:(unint64_t)a3 activeSubId:(unint64_t)a4
{
  +[WCM_Logging logLevel:2, @"Initialize WCM_AntBlockPowerLimitPolicy on PlatformId(%llu)...", a3 message];
  id v7 = [[WCM_AntBlockPowerLimitPolicy alloc] initWithPlatformId:a3];
  mAntBlockPolicy = self->mAntBlockPolicy;
  self->mAntBlockPolicy = v7;

  uint64_t v9 = self->mAntBlockPolicy;
  if (!v9) {
    return;
  }
  unsigned int v25 = [(WCM_AntBlockPowerLimitPolicy *)v9 getAntBlockConfigXpcMsgOnClient:0];
  objc_super v24 = [(WCM_AntBlockPowerLimitPolicy *)self->mAntBlockPolicy getAntBlockConfigXpcMsgOnClient:1];
  xpc_object_t value = [(WCM_AntBlockPowerLimitPolicy *)self->mAntBlockPolicy getAntBlockConfigXpcMsgOnClient:2];
  xpc_object_t v26 = [(WCM_AntBlockPowerLimitPolicy *)self->mAntBlockPolicy getAntBlockConfigXpcMsgOnClient:3];
  CFStringRef v10 = [(WCM_AntBlockPowerLimitPolicy *)self->mAntBlockPolicy getAntBlockConfigXpcMsgOnClient:8];
  BOOL v11 = [(WCM_AntBlockPowerLimitPolicy *)self->mAntBlockPolicy getAntBlockConfigXpcMsgOnClient:4];
  id v12 = [(WCM_AntBlockPowerLimitPolicy *)self->mAntBlockPolicy getAntBlockConfigXpcMsgOnClient:5];
  unsigned int v13 = [(WCM_AntBlockPowerLimitPolicy *)self->mAntBlockPolicy getAntBlockConfigXpcMsgOnClient:6];
  xpc_object_t v14 = xpc_uint64_create(a4);
  unsigned int v15 = [(WCM_AntBlockPowerLimitPolicy *)self->mAntBlockPolicy getAntBlockConfigGnssImdClient];
  if (v25)
  {
    v16 = [(WCM_AriCoexCommandHandler *)self createMessageWithMsgId:1225 withArgs:v25 withSubId:v14];
    [(WCM_AriCoexCommandHandler *)self handleEvent:v16];
  }
  if (v24)
  {
    unsigned int v17 = [(WCM_AriCoexCommandHandler *)self createMessageWithMsgId:1226 withArgs:v24 withSubId:v14];
    [(WCM_AriCoexCommandHandler *)self handleEvent:v17];
  }
  if (value || v26 || v10 || v12 || v11)
  {
    xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
    unsigned int v19 = v18;
    if (value) {
      xpc_dictionary_set_value(v18, "kWCMCellularSetAntBlocking_FrontCameraPolicy", value);
    }
    if (v26) {
      xpc_dictionary_set_value(v19, "kWCMCellularSetAntBlocking_FaceIdCameraPolicy", v26);
    }
    if (v11) {
      xpc_dictionary_set_value(v19, "kWCMCellularSetAntBlocking_RearUltraWideCameraPolicy", v11);
    }
    if (v10) {
      xpc_dictionary_set_value(v19, "kWCMCellularSetAntBlocking_RearWideCameraPolicy", v10);
    }
    if (v12) {
      xpc_dictionary_set_value(v19, "kWCMCellularSetAntBlocking_RearTeleCameraPolicy", v12);
    }
    if (v19)
    {
      v20 = [(WCM_AriCoexCommandHandler *)self createMessageWithMsgId:1227 withArgs:v19 withSubId:v14];
      [(WCM_AriCoexCommandHandler *)self handleEvent:v20];

      unsigned int v21 = v19;
      if (!v13) {
        goto LABEL_26;
      }
      goto LABEL_25;
    }
  }
  unsigned int v21 = 0;
  if (v13)
  {
LABEL_25:
    v22 = [(WCM_AriCoexCommandHandler *)self createMessageWithMsgId:1228 withArgs:v13 withSubId:v14];
    [(WCM_AriCoexCommandHandler *)self handleEvent:v22];
  }
LABEL_26:
  if (v15)
  {
    mQueue = self->mQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000297F4;
    block[3] = &unk_10020D820;
    block[4] = self;
    id v29 = v15;
    dispatch_async(mQueue, block);
  }
}

- (void)handleCoexManagerEvent:(id)a3
{
  xpc_object_t xdict = a3;
  +[WCM_Logging logLevel:3, @"Coex ARI Driver: Handling XPC Event : %@", xdict message];
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "kMessageId");
  if (uint64)
  {
    uint64_t v5 = xpc_dictionary_get_uint64(xdict, "kSubId");
    xpc_object_t v6 = xpc_dictionary_get_value(xdict, "kMessageArgs");
    switch(uint64)
    {
      case 0x4B0uLL:
        [(WCM_AriCoexCommandHandler *)self getCellularNetworkConfig:v6 SubId:v5];
        break;
      case 0x4B8uLL:
        [(WCM_AriCoexCommandHandler *)self setScanFreq:v6 SubId:v5];
        break;
      case 0x4BFuLL:
        [(WCM_AriCoexCommandHandler *)self setCellularAntBitmap:v6 SubId:0];
        [(WCM_AriCoexCommandHandler *)self setCellularAntBitmap:v6 SubId:1];
        break;
      case 0x4C1uLL:
        [(WCM_AriCoexCommandHandler *)self setCC1Config:v6 SubId:v5];
        break;
      case 0x4C2uLL:
        [(WCM_AriCoexCommandHandler *)self setCC2Config:v6 SubId:v5];
        break;
      case 0x4C7uLL:
        [(WCM_AriCoexCommandHandler *)self handleTransparentMessage:v6 SubId:0];
        [(WCM_AriCoexCommandHandler *)self handleTransparentMessage:v6 SubId:1];
        break;
      case 0x4C9uLL:
        [(WCM_AriCoexCommandHandler *)self setCnvAntBlockingPowerLimitingConfig:v6 SubId:0];
        [(WCM_AriCoexCommandHandler *)self setCnvAntBlockingPowerLimitingConfig:v6 SubId:1];
        break;
      case 0x4CAuLL:
        [(WCM_AriCoexCommandHandler *)self setUwbAntBlockingPowerLimitingConfig:v6 SubId:0];
        [(WCM_AriCoexCommandHandler *)self setUwbAntBlockingPowerLimitingConfig:v6 SubId:1];
        break;
      case 0x4CBuLL:
        [(WCM_AriCoexCommandHandler *)self setCamAntBlockingPowerLimitingConfig:v6 SubId:0];
        [(WCM_AriCoexCommandHandler *)self setCamAntBlockingPowerLimitingConfig:v6 SubId:1];
        break;
      case 0x4CCuLL:
        [(WCM_AriCoexCommandHandler *)self setE85AntBlockingPowerLimitingConfig:v6 SubId:v5];
        break;
      case 0x4CDuLL:
        break;
      case 0x4CEuLL:
        [(WCM_AriCoexCommandHandler *)self setCellularMiscConfig:v6 SubId:0];
        [(WCM_AriCoexCommandHandler *)self setCellularMiscConfig:v6 SubId:1];
        break;
      case 0x4CFuLL:
        [(WCM_AriCoexCommandHandler *)self setCellularTxActivityConfig:v6 SubId:v5];
        break;
      case 0x4D0uLL:
        [(WCM_AriCoexCommandHandler *)self getCellularLaaMeasInfo:v6 SubId:v5];
        break;
      case 0x4D1uLL:
        [(WCM_AriCoexCommandHandler *)self setCameraState:v6 SubId:0];
        [(WCM_AriCoexCommandHandler *)self setCameraState:v6 SubId:1];
        break;
      case 0x4D2uLL:
        [(WCM_AriCoexCommandHandler *)self setAllCCConfig:v6 SubId:v5];
        break;
      default:
        +[WCM_Logging logLevel:0, @"Coex ARI driver does not support message %llu", uint64 message];
        break;
    }
  }
  else
  {
    +[WCM_Logging logLevel:0 message:@"Coex ARI Driver:  XPC miss key of message id"];
  }
}

- (int)convertInternalCallType:(unint64_t)a3
{
  if (a3 == 1) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int)convertInternalCoexTech:(unint64_t)a3
{
  if (a3 > 0xB) {
    return 127;
  }
  else {
    return dword_1001E7C14[a3];
  }
}

- (unint64_t)getSubIdFromInternalCoexTech:(unint64_t)a3
{
  if (a3 - 6 > 5) {
    return 0;
  }
  else {
    return qword_1001E7C48[a3 - 6];
  }
}

- (void)sendMessage:(unint64_t)a3 withArgs:(id)a4 withSubId:(unint64_t)a5
{
  id v8 = a4;
  xpc_object_t v9 = xpc_uint64_create(a5);
  *(_OWORD *)keys = *(_OWORD *)off_10020D840;
  v16 = "kSubId";
  values[0] = xpc_uint64_create(a3);
  id v10 = v8;
  values[1] = v10;
  id v11 = v9;
  values[2] = v11;
  xpc_object_t v12 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
  if (self->mCellularController)
  {
    +[WCM_Logging logLevel:3, @"Coex ARI Driver: Sending messageId(%lld) to Coex Manager %@", a3, v12 message];
    [(WCM_CellularController *)self->mCellularController handleMessage:v12];
  }

  for (uint64_t i = 2; i != -1; --i)
}

- (BOOL)checkError:(void *)a3 expectedGMID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  unint64_t GMID = AriSdk::MsgBase::getGMID((AriSdk::MsgBase *)a3);
  int v6 = (GMID >> 17) & 0xFFFF8000 | (GMID << 26);
  if (v6 == 67600384)
  {
    CFStringRef v7 = @"Coex ARI Driver: response NACK";
  }
  else
  {
    if (v6 == v4) {
      return 1;
    }
    uint64_t v9 = v4;
    uint64_t v10 = (GMID >> 17) & 0xFFFF8000 | (GMID << 26);
    CFStringRef v7 = @"Coex ARI Driver: expected response GMID=%u, received response GMID=%u";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, v7, v9, v10);
  return 0;
}

- (BOOL)checkErrorMsgGmid:(unsigned int)a3 expectedGMID:(unsigned int)a4 API_Str:(const char *)a5
{
  if (a3 == 67600384)
  {
    +[WCM_Logging logLevel:3, @"Coex ARI Driver: %s received NACK response", a5, v6, v7 message];
  }
  else
  {
    if (a3 == a4) {
      return 1;
    }
    +[WCM_Logging logLevel:3, @"Coex ARI Driver: %s expected response GMID=%u, received response GMID=%u", a5, *(void *)&a4, *(void *)&a3 message];
  }
  return 0;
}

- (BOOL)coexTechEnumCheck:(unint64_t)a3
{
  int64x2_t v3 = vdupq_n_s64(a3);
  char v4 = vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_1001E7B80), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_1001E7B90)))) | (a3 == 32);
  BOOL v6 = a3 == 64 || a3 == 128;
  return v4 & 1 | (v6 || a3 - 1 < 2);
}

- (BOOL)mitigationTypeEnumCheck:(unint64_t)a3
{
  return a3 < 4;
}

- (BOOL)LQMEnumCheck:(unint64_t)a3
{
  int64x2_t v3 = vdupq_n_s64(a3);
  return vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_1001E7BA0), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_1001E7BB0)))) & 1 | (a3 == 100);
}

- (BOOL)cameraEnumCheck:(unint64_t)a3
{
  return a3 < 6;
}

- (BOOL)callTypeEnumCheck:(unint64_t)a3
{
  return a3 == 4 || a3 - 1 < 2 || a3 == 0xFFFFFFFF;
}

- (BOOL)ImdTypeEnumCheck:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) == 0 || a3 - 3 < 3;
}

- (void)setDefaultEvent
{
  uint64_t v4 = 0x100000001;
  AriSdk::ARI_UtaIdcConfigEventReq_SDK::ARI_UtaIdcConfigEventReq_SDK((AriSdk::ARI_UtaIdcConfigEventReq_SDK *)v3);
  int v2 = 0;
  sub_10002A14C();
}

- (void)convertToAriType_WiFiState:(unint64_t)a3 userCase:(unint64_t)a4 AriState:(unint64_t *)a5 AriUseCase:(unint64_t *)a6
{
  if (a5)
  {
    if (a3 - 1 >= 4) {
      unint64_t v6 = 0;
    }
    else {
      unint64_t v6 = a3;
    }
    *a5 = v6;
  }
  if (a6) {
    *a6 = 0;
  }
}

- (void)convertToAriType_BtState:(unint64_t)a3 userCase:(unint64_t)a4 AriState:(unint64_t *)a5 AriUseCase:(unint64_t *)a6
{
  switch(a4)
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
      goto LABEL_3;
    case 6uLL:
    case 7uLL:
      a4 = 4 * (a3 == 2);
LABEL_3:
      if (a5) {
        goto LABEL_4;
      }
      goto LABEL_5;
    default:
      a4 = 0;
      if (!a5) {
        goto LABEL_5;
      }
LABEL_4:
      *a5 = a3 == 2;
LABEL_5:
      if (a6) {
        *a6 = a4;
      }
      return;
  }
}

- (void)convertToAriType_FigaroState:(unint64_t)a3 userCase:(unint64_t)a4 AriState:(unint64_t *)a5 AriUseCase:(unint64_t *)a6
{
  BOOL v6 = (a4 & 0xFFFFFFFFFFFFFFFELL) == 6 && a3 == 3;
  unint64_t v7 = 3;
  if (!v6) {
    unint64_t v7 = 0;
  }
  if (a5) {
    *a5 = a3 == 3;
  }
  if (a6) {
    *a6 = v7;
  }
}

- (void)convertToAriType_GnssState:(unint64_t)a3 userCase:(unint64_t)a4 AriState:(unint64_t *)a5 AriUseCase:(unint64_t *)a6
{
  unint64_t v6 = a4 & 0xF;
  if (a3 - 1 >= 3) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = a3;
  }
  switch(a4 & 0xF)
  {
    case 1uLL:
    case 4uLL:
      break;
    case 2uLL:
      unint64_t v6 = 2;
      break;
    case 3uLL:
      unint64_t v6 = 3;
      break;
    case 5uLL:
      unint64_t v6 = 65541;
      break;
    default:
      unint64_t v6 = 4;
      break;
  }
  int v8 = a4 >> 4;
  uint64_t v9 = v6 | 0x10100;
  uint64_t v10 = v6 | 0x200;
  if (v8 == 1) {
    v6 |= 0x100uLL;
  }
  if (v8 == 2) {
    unint64_t v6 = v10;
  }
  if (v8 == 5) {
    unint64_t v6 = v9;
  }
  if (a5) {
    *a5 = v7;
  }
  if (a6) {
    *a6 = v6;
  }
}

- (void)convertToAriType_UwbState:(unint64_t)a3 userCase:(unint64_t)a4 AriState:(unint64_t *)a5 AriUseCase:(unint64_t *)a6
{
  if (a5)
  {
    unint64_t v6 = a3 == 5;
    if (a3 == 9) {
      unint64_t v6 = 2;
    }
    *a5 = v6;
  }
  if (a6) {
    *a6 = 0;
  }
}

- (void)handleTunerState:(unint64_t)a3 sensorData:(id)a4 SubId:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  unsigned int v24 = v5;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  size_t count = xpc_array_get_count(v8);
  if (count == 2)
  {
    uint64_t uint64 = xpc_array_get_uint64(v8, 0);
    uint64_t v11 = xpc_array_get_uint64(v8, 1uLL);
    switch(a3)
    {
      case 0uLL:
        [(WCM_AriCoexCommandHandler *)self convertToAriType_GnssState:uint64 userCase:v11 AriState:&v23 AriUseCase:&v22];
        +[WCM_Logging logLevel:3, @"Coex ARI Driver(SubId %u): GNSS Tuner state = %llu, L1 useCase = %llu, L5 useCase = %llu, low priority = %llu", v24, v23, BYTE1(v22), v22, v22 & 0x10000 message];
        int v12 = 0;
        goto LABEL_19;
      case 1uLL:
        [(WCM_AriCoexCommandHandler *)self convertToAriType_WiFiState:uint64 userCase:v11 AriState:&v23 AriUseCase:&v22];
        +[WCM_Logging logLevel:3, @"Coex ARI Driver(SubId %u): WiFi Tuner state = %llu, useCase = %llu", v24, v23, v22 message];
        int v12 = 1;
        goto LABEL_19;
      case 2uLL:
        [(WCM_AriCoexCommandHandler *)self convertToAriType_BtState:uint64 userCase:v11 AriState:&v23 AriUseCase:&v22];
        +[WCM_Logging logLevel:3, @"Coex ARI Driver(SubId %u): BT Tuner state = %llu, useCase = %llu", v24, v23, v22 message];
        BOOL v13 = v23 == qword_10027CF40 && v22 == qword_10027CF48;
        int v14 = !v13;
        if (!v13)
        {
          qword_10027CF40 = v23;
          qword_10027CF48 = v22;
        }
        [(WCM_AriCoexCommandHandler *)self convertToAriType_FigaroState:uint64 userCase:v11 AriState:&v21 AriUseCase:&v20];
        if (v21 != qword_10027CF50 || v20 != qword_10027CF58)
        {
          qword_10027CF50 = v21;
          qword_10027CF58 = v20;
          if ((v14 & 1) == 0)
          {
            +[WCM_Logging logLevel:3, @"Coex ARI Driver(SubId %u): HPBT Tuner state = %llu, useCase = %llu", v24, v21, v20 message];
            int v16 = 4;
            int v17 = v21;
            int v18 = 0;
            int v19 = v20;
            AriSdk::ARI_UtaIdcSetTunerVoterConfigReq_SDK::ARI_UtaIdcSetTunerVoterConfigReq_SDK((AriSdk::ARI_UtaIdcSetTunerVoterConfigReq_SDK *)v15);
            sub_10002A14C();
          }
          goto LABEL_23;
        }
        if (v14)
        {
LABEL_23:
          int v12 = 2;
LABEL_19:
          int v16 = v12;
          int v17 = v23;
          int v18 = 0;
          int v19 = v22;
          AriSdk::ARI_UtaIdcSetTunerVoterConfigReq_SDK::ARI_UtaIdcSetTunerVoterConfigReq_SDK((AriSdk::ARI_UtaIdcSetTunerVoterConfigReq_SDK *)v15);
          sub_10002A14C();
        }
        return;
      case 3uLL:
        [(WCM_AriCoexCommandHandler *)self convertToAriType_UwbState:uint64 userCase:v11 AriState:&v23 AriUseCase:&v22];
        int v12 = 3;
        +[WCM_Logging logLevel:3, @"Coex ARI Driver(SubId %u): UWB Tuner state = %llu, useCase = %llu", v24, v23, v22 message];
        goto LABEL_19;
      default:
        break;
    }
  }
  else
  {
    +[WCM_Logging logLevel:0, @"Coex ARI Driver(SubId %u): Sensor %llu has wrong data size (%llu). Expect size = 2", v5, a3, count message];
  }
}

- (void)handleTransparentMessage:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  xpc_dictionary_get_value(a3, "kWCMCellularTransparentMessageInformationSet");
  xpc_object_t xarray = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  if (xarray)
  {
    size_t count = xpc_array_get_count(xarray);
    if (count)
    {
      for (size_t i = 0; i != count; ++i)
      {
        id v8 = xpc_array_get_value(xarray, i);
        uint64_t v9 = v8;
        if (v8)
        {
          uint64_t uint64 = xpc_dictionary_get_uint64(v8, "kWCMCellularTransparentMessage_Type");
          uint64_t v11 = xpc_dictionary_get_value(v9, "kWCMCellularTransparentMessage_ByteList");
          if (uint64 < 4) {
            [(WCM_AriCoexCommandHandler *)self handleTunerState:uint64 sensorData:v11 SubId:v4];
          }
        }
      }
    }
  }
}

- (void)setCameraState:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  unsigned int v24 = a4;
  int v20 = 0;
  int v22 = 1;
  int v18 = 3;
  int v16 = 2;
  int v14 = 4;
  id v9 = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(v9, "kWCMCellularSetCameraState");
  __int16 v13 = 0;
  __int16 v12 = 0;
  unsigned __int8 v11 = 0;
  +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set camera State: Raw Camera State = 0x%x", v4, uint64 message];
  uint64_t v7 = uint64 & 1;
  unsigned int v8 = uint64 & 0x1000;
  int v23 = uint64 & 1;
  int v21 = (uint64 & 8) >> 3;
  int v19 = (uint64 & 0x40) >> 6;
  int v17 = (unsigned __int16)(uint64 & 0x200) >> 9;
  unsigned int v15 = v8 >> 12;
  [(WCM_AriCoexCache *)self->mCache get:@"kCameraStateFaceID" value_BOOL:(char *)&v13 + 1 subId:v24];
  [(WCM_AriCoexCache *)self->mCache get:@"kCameraStateFrontCam" value_BOOL:&v13 subId:v24];
  [(WCM_AriCoexCache *)self->mCache get:@"kCameraStateRearTeleCam" value_BOOL:(char *)&v12 + 1 subId:v24];
  [(WCM_AriCoexCache *)self->mCache get:@"kCameraStateRearUltraWideCam" value_BOOL:&v12 subId:v24];
  [(WCM_AriCoexCache *)self->mCache get:@"kCameraStateRearWideCam" value_BOOL:&v11 subId:v24];
  [(WCM_AriCoexCache *)self->mCache update:@"kCameraStateFaceID" value_BOOL:v7 subId:v24];
  [(WCM_AriCoexCache *)self->mCache update:@"kCameraStateFrontCam" value_BOOL:(uint64 & 8) != 0 subId:v24];
  [(WCM_AriCoexCache *)self->mCache update:@"kCameraStateRearTeleCam" value_BOOL:(uint64 & 0x40) != 0 subId:v24];
  [(WCM_AriCoexCache *)self->mCache update:@"kCameraStateRearUltraWideCam" value_BOOL:(uint64 & 0x200) != 0 subId:v24];
  [(WCM_AriCoexCache *)self->mCache update:@"kCameraStateRearWideCam" value_BOOL:v8 != 0 subId:v24];
  if (v7 != HIBYTE(v13))
  {
    +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set Face Id camera State: from %d to %d ", v24, HIBYTE(v13), v7 message];
    AriSdk::ARI_UtaIdcSetCameraStatusReqV2_SDK::ARI_UtaIdcSetCameraStatusReqV2_SDK((AriSdk::ARI_UtaIdcSetCameraStatusReqV2_SDK *)v10);
    sub_10002A14C();
  }
  if ((uint64 & 8) >> 3 != v13)
  {
    +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set Front camera State: from %d to %d ", v24, v13, (uint64 & 8) >> 3 message];
    AriSdk::ARI_UtaIdcSetCameraStatusReqV2_SDK::ARI_UtaIdcSetCameraStatusReqV2_SDK((AriSdk::ARI_UtaIdcSetCameraStatusReqV2_SDK *)v10);
    sub_10002A14C();
  }
  if ((uint64 & 0x40) >> 6 != HIBYTE(v12))
  {
    +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set Rear Telephoto camera State: from %d to %d ", v24, HIBYTE(v12), (uint64 & 0x40) >> 6 message];
    AriSdk::ARI_UtaIdcSetCameraStatusReqV2_SDK::ARI_UtaIdcSetCameraStatusReqV2_SDK((AriSdk::ARI_UtaIdcSetCameraStatusReqV2_SDK *)v10);
    sub_10002A14C();
  }
  if ((unsigned __int16)(uint64 & 0x200) >> 9 != v12)
  {
    +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set Rear ultra wide camera State: from %d to %d ", v24, v12, (unsigned __int16)(uint64 & 0x200) >> 9 message];
    AriSdk::ARI_UtaIdcSetCameraStatusReqV2_SDK::ARI_UtaIdcSetCameraStatusReqV2_SDK((AriSdk::ARI_UtaIdcSetCameraStatusReqV2_SDK *)v10);
    sub_10002A14C();
  }
  if (v8 >> 12 != v11)
  {
    +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set Rear wide camera State: from %d to %d ", v24, v11, v8 >> 12 message];
    AriSdk::ARI_UtaIdcSetCameraStatusReqV2_SDK::ARI_UtaIdcSetCameraStatusReqV2_SDK((AriSdk::ARI_UtaIdcSetCameraStatusReqV2_SDK *)v10);
    sub_10002A14C();
  }
}

- (void)updateBasebandPowerState
{
  id v3 = xpc_dictionary_create(0, 0, 0);
  -[WCM_AriCoexCommandHandler sendMessage:withArgs:withSubId:](self, "sendMessage:withArgs:withSubId:", 304);
}

- (void)getCellularLaaMeasInfo:(id)a3 SubId:(unsigned int)a4
{
  AriSdk::ARI_UtaIdcGetLaaMeasInfoReq_SDK::ARI_UtaIdcGetLaaMeasInfoReq_SDK((AriSdk::ARI_UtaIdcGetLaaMeasInfoReq_SDK *)v6);
  unsigned int v5 = a4;
  sub_10002A14C();
}

- (void)setCellularTxActivityConfig:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  int v15 = v4;
  int64_t int64 = xpc_dictionary_get_int64(v5, "kWCMCellularSetTxActivityConfig_TxEnvPowerThreshold");
  uint64_t uint64 = xpc_dictionary_get_uint64(v5, "kWCMCellularSetTxActivityConfig_TxEnvMinDuration");
  BOOL v8 = xpc_dictionary_get_BOOL(v5, "kWCMCellularSetTxActivityConfig_TxStatsEnable");
  uint64_t v9 = xpc_dictionary_get_uint64(v5, "kWCMCellularSetTxActivityConfig_TxStatsCadence");
  +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set TX Activity Config: txEnvPowerThre = %lld, txEnvMinDur = %llu, txStatsEnable = %d, txStatsCadence = %llu", v4, int64, uint64, v8, v9 message];
  __int16 v11 = int64;
  __int16 v12 = uint64;
  BOOL v13 = v8;
  __int16 v14 = v9;
  AriSdk::ARI_UtaIdcConfigTxActParamReq_SDK::ARI_UtaIdcConfigTxActParamReq_SDK((AriSdk::ARI_UtaIdcConfigTxActParamReq_SDK *)v10);
  sub_10002A14C();
}

- (void)setCellularMiscConfig:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  xpc_object_t xdict = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "kWCMCellularSetMiscConfig_UwbInactivityDurationThreshold");
  [(WCM_AriCoexCommandHandler *)self setCellularMiscConfigToSubId:v4 uwbInactThre_ms:uint64 cellOnTimer_ms:xpc_dictionary_get_uint64(xdict, "kWCMCellularSetMiscConfig_CellOnStickyTimer")];
}

- (void)setCellularMiscConfigToSubId:(unsigned int)a3 uwbInactThre_ms:(unsigned int)a4 cellOnTimer_ms:(unsigned int)a5
{
  unsigned int v10 = a3;
  +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set Misc Config: uwbInactThre_ms = %u, cellOnTimer_ms = %u", *(void *)&a3, *(void *)&a4, *(void *)&a5 message];
  unsigned int v8 = a4;
  unsigned int v9 = a5;
  AriSdk::ARI_UtaIdcConfigMiscParamReqV2_SDK::ARI_UtaIdcConfigMiscParamReqV2_SDK((AriSdk::ARI_UtaIdcConfigMiscParamReqV2_SDK *)v7);
  sub_10002A14C();
}

- (void)setCellularAntBitmap:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  unsigned int v15 = a4;
  id v13 = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(v13, "kWCMCellularSetWCI2TxAntMap_Enable");
  uint64_t v6 = xpc_dictionary_get_uint64(v13, "kWCMCellularSetWCI2TxAntMap_DefaultIdx");
  uint64_t v7 = xpc_dictionary_get_value(v13, "kWCMCellularSetWCI2TxAntMap_InformationSet");
  +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set Cellular Ant Bitmap: enable = %llu, defaultIdx = %llu", v4, uint64, v6 message];
  if (v7)
  {
    size_t count = xpc_array_get_count(v7);
    uint64_t v16 = 0x101010101010101 * v6;
    uint64_t v17 = v16;
    if (count)
    {
      for (size_t i = 0; i != count; ++i)
      {
        unsigned int v10 = xpc_array_get_value(v7, i);
        uint64_t v11 = xpc_dictionary_get_uint64(v10, "kWCMCellularSetWCI2TxAntMap_Infoet_AntIdx");
        uint64_t v12 = xpc_dictionary_get_uint64(v10, "kWCMCellularSetWCI2TxAntMap_InfoSet_WCI2Idx");
        +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set Cellular Ant Bitmap: antIdx = %llu, antMappedIdx = %llu", v4, v11, v12 message];
        if (v11 <= 0xF) {
          *((unsigned char *)&v16 + v11) = v12;
        }
      }
    }
  }
  else
  {
    uint64_t v16 = 0x101010101010101 * v6;
    uint64_t v17 = v16;
  }
  AriSdk::ARI_UtaIdcSetTxAntMappingTableReq_SDK::ARI_UtaIdcSetTxAntMappingTableReq_SDK((AriSdk::ARI_UtaIdcSetTxAntMappingTableReq_SDK *)v14);
  sub_10002A14C();
}

- (void)setSpmiFeature
{
  v22[0] = &off_10023B5E0;
  v22[1] = &off_10023B610;
  v23[0] = &off_10023B8B0;
  v23[1] = &off_10023B8C8;
  v22[2] = &off_10023B628;
  v22[3] = &off_10023B640;
  v23[2] = &off_10023B790;
  v23[3] = &off_10023B8E0;
  v22[4] = &off_10023B658;
  v22[5] = &off_10023B670;
  v23[4] = &off_10023B688;
  v23[5] = &off_10023B8F8;
  v22[6] = &off_10023B6E8;
  v22[7] = &off_10023B5C8;
  v23[6] = &off_10023B610;
  v23[7] = &off_10023B8B0;
  v22[8] = &off_10023B6A0;
  v22[9] = &off_10023B580;
  v23[8] = &off_10023B8B0;
  v23[9] = &off_10023B910;
  v22[10] = &off_10023B688;
  v22[11] = &off_10023B718;
  v23[10] = &off_10023B928;
  v23[11] = &off_10023B8B0;
  v22[12] = &off_10023B6B8;
  v22[13] = &off_10023B940;
  v23[12] = &off_10023B5F8;
  v23[13] = &off_10023B958;
  v22[14] = &off_10023B970;
  v22[15] = &off_10023B9A0;
  v23[14] = &off_10023B988;
  v23[15] = &off_10023B958;
  v22[16] = &off_10023B9B8;
  v22[17] = &off_10023B9E8;
  v23[16] = &off_10023B9D0;
  v23[17] = &off_10023B958;
  v22[18] = &off_10023BA00;
  v22[19] = &off_10023BA18;
  v23[18] = &off_10023B928;
  v23[19] = &off_10023B928;
  id v3 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:20];
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v5 = objc_alloc_init((Class)NSMutableArray);
  if (self->coexOSFeatureGroupEnabled[1]
    && self->coexPlatformFeatureGroupEnabled[1]
    && ([v4 containsObject:&off_10023B658] & 1) == 0)
  {
    [v4 addObject:&off_10023B658];
  }
  if (self->coexOSFeatureGroupEnabled[2] && self->coexPlatformFeatureGroupEnabled[2])
  {
    if (([v4 containsObject:&off_10023B670] & 1) == 0) {
      [v4 addObject:&off_10023B670];
    }
    if (([v4 containsObject:&off_10023B6E8] & 1) == 0) {
      [v4 addObject:&off_10023B6E8];
    }
  }
  if (self->coexOSFeatureGroupEnabled[4]
    && self->coexPlatformFeatureGroupEnabled[4]
    && ([v5 containsObject:&off_10023B9E8] & 1) == 0)
  {
    [v5 addObject:&off_10023B9E8];
  }
  if (self->coexOSFeatureGroupEnabled[5]
    && self->coexPlatformFeatureGroupEnabled[5]
    && ([v4 containsObject:&off_10023B5E0] & 1) == 0)
  {
    [v4 addObject:&off_10023B5E0];
  }
  if (self->coexOSFeatureGroupEnabled[6] && self->coexPlatformFeatureGroupEnabled[6])
  {
    if (([v4 containsObject:&off_10023B5C8] & 1) == 0) {
      [v4 addObject:&off_10023B5C8];
    }
    if (([v4 containsObject:&off_10023B6A0] & 1) == 0) {
      [v4 addObject:&off_10023B6A0];
    }
  }
  if (self->coexOSFeatureGroupEnabled[7]
    && self->coexPlatformFeatureGroupEnabled[7]
    && ([v5 containsObject:&off_10023BA00] & 1) == 0)
  {
    [v5 addObject:&off_10023BA00];
  }
  if (self->coexOSFeatureGroupEnabled[9]
    && self->coexPlatformFeatureGroupEnabled[9]
    && ([v4 containsObject:&off_10023B6B8] & 1) == 0)
  {
    [v4 addObject:&off_10023B6B8];
  }
  if (self->coexOSFeatureGroupEnabled[12]
    && self->coexPlatformFeatureGroupEnabled[12]
    && ([v4 containsObject:&off_10023B580] & 1) == 0)
  {
    [v4 addObject:&off_10023B580];
  }
  for (uint64_t i = 1; i != 65; i += 2)
  {
    v20[i] = 107;
    v18[i] = 107;
  }
  unint64_t v7 = 0;
  v20[0] = 0;
  v18[0] = 0;
  for (j = (unsigned int *)&v19; ; j += 2)
  {
    id v9 = [v4 count];
    if (v7 > 0x1F || (unint64_t)v9 <= v7) {
      break;
    }
    unsigned int v10 = [v4 objectAtIndex:v7];
    *(j - 1) = [v10 unsignedIntValue];
    uint64_t v11 = [v3 objectForKeyedSubscript:v10];
    unsigned int *j = [v11 unsignedIntValue];

    ++v18[0];
    +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId 0/1): Set TX SPMI feature [%d]: feature = %u, subsys = %u", v7, *(j - 1), *j message];

    ++v7;
  }
  unint64_t v12 = 0;
  for (k = (unsigned int *)&v21; ; k += 2)
  {
    id v14 = [v5 count];
    if (v12 > 0x1F || (unint64_t)v14 <= v12) {
      break;
    }
    unsigned int v15 = [v5 objectAtIndex:v12];
    *(k - 1) = [v15 unsignedIntValue];
    uint64_t v16 = [v3 objectForKeyedSubscript:v15];
    unsigned int *k = [v16 unsignedIntValue];

    ++v20[0];
    +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId 0/1): Set RX SPMI feature [%d]: feature = %u, subsys = %u", v12, *(k - 1), *k message];

    ++v12;
  }
  AriSdk::ARI_UtaIdcSetRTFeatureSpmiTxReqV3_SDK::ARI_UtaIdcSetRTFeatureSpmiTxReqV3_SDK((AriSdk::ARI_UtaIdcSetRTFeatureSpmiTxReqV3_SDK *)v17);
  sub_10002A14C();
}

- (void)setCnvAntBlockingPowerLimitingConfig:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v28 = *(void *)&a4;
  xpc_object_t xdict = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "kWCMCellularSetAntBlocking_LQMThreshold");
  uint64_t v5 = xpc_dictionary_get_uint64(xdict, "kWCMCellularSetAntBlocking_DurationGranularity");
  BOOL v6 = xpc_dictionary_get_BOOL(xdict, "kWCMCellularSetAntBlocking_DenyProtectVoice");
  uint64_t v7 = xpc_dictionary_get_uint64(xdict, "kWCMCellularSetAntBlocking_MitigationTimer");
  +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set CNV Antenna Blk Policy, lqmThreshold = %llu, durationGranularity = %llu", v28, uint64, v5 message];
  +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set CNV Antenna Blk Policy, denyVoiceProtect = %d, mitigationTimer = %llu", v28, v6, v7 message];
  if ([(WCM_AriCoexCommandHandler *)self LQMEnumCheck:uint64])
  {
    unsigned int v8 = xpc_dictionary_get_value(xdict, "kWCMCellularSetAntBlocking_PolicySet");
    xpc_object_t xarray = v8;
    if (v8)
    {
      size_t count = xpc_array_get_count(v8);
      uint64_t v10 = 32;
      if (count < 0x20) {
        uint64_t v10 = count;
      }
      uint64_t v26 = v10;
    }
    else
    {
      uint64_t v26 = 0;
    }
    for (uint64_t i = 0; i != 1152; i += 36)
    {
      unint64_t v12 = &v32[i + 80];
      *(_DWORD *)unint64_t v12 = 0;
      *((_DWORD *)v12 + 6) = 3;
      *((_DWORD *)v12 + 2) = 127;
      *((_WORD *)v12 + 16) = 0;
    }
    v33[284] = v6;
    v33[285] = uint64;
    __int16 v34 = v5;
    int v35 = v7;
    if (!v26)
    {
LABEL_15:
      AriSdk::ARI_UtaIdcSetCnvAntBlockPwrLmtConfigReq_SDK::ARI_UtaIdcSetCnvAntBlockPwrLmtConfigReq_SDK((AriSdk::ARI_UtaIdcSetCnvAntBlockPwrLmtConfigReq_SDK *)v32);
      sub_10002A14C();
    }
    size_t v13 = 0;
    id v14 = v33;
    while (1)
    {
      unsigned int v15 = xpc_array_get_value(xarray, v13);
      BOOL v31 = xpc_dictionary_get_BOOL(v15, "kWCMCellularSetAntBlocking_Policy_Enable");
      uint64_t v30 = xpc_dictionary_get_uint64(v15, "kWCMCellularSetAntBlocking_Policy_CellularAntBitmap");
      int64_t int64 = xpc_dictionary_get_int64(v15, "kWCMCellularSetAntBlocking_Policy_CellularPowerCap");
      uint64_t v17 = xpc_dictionary_get_uint64(v15, "kWCMCellularSetAntBlocking_Policy_MitigationType");
      uint64_t v18 = xpc_dictionary_get_uint64(v15, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_Band");
      uint64_t v19 = xpc_dictionary_get_uint64(v15, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_CoexTech");
      uint64_t v20 = xpc_dictionary_get_uint64(v15, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_CenterFreq");
      uint64_t v21 = xpc_dictionary_get_uint64(v15, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_Bandwidth");
      uint64_t v22 = xpc_dictionary_get_uint64(v15, "kWCMCellularSetAntBlocking_Policy_ConditionId");
      +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set CNV Antenna Blk Policy -- policy[%lu]: enable = %d, cellularAntBitmap = %llu, cellularTxPowerCap = %lld, mitigationType = %llu", v28, v13, v31, v30, int64, v17 message];
      +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set CNV Antenna Blk Policy -- policy[%lu]: cellularBand = %llu, cellularCoexTech = %llu, frequency = %lluKHz, BW = %lluKHz, Condition_id = %llu", v28, v13, v18, v19, v20, v21, v22 message];
      if (![(WCM_AriCoexCommandHandler *)self coexTechEnumCheck:v19])
      {
        uint64_t v23 = 3;
        CFStringRef v24 = @"Coex ARI driver(SubId %u): Set CNV Antenna Blk Policy -- Invalid cellularCoexTech = %llu";
        goto LABEL_18;
      }
      if (![(WCM_AriCoexCommandHandler *)self mitigationTypeEnumCheck:v17]) {
        break;
      }
      *(v14 - 4) = v31;
      *(v14 - 3) = v18;
      *(v14 - 2) = v19;
      *(v14 - 1) = v20;
      _DWORD *v14 = v21;
      v14[1] = v30;
      v14[2] = v17;
      v14[3] = int64;
      *((_WORD *)v14 + 8) = v22;

      ++v13;
      v14 += 9;
      if (v26 == v13) {
        goto LABEL_15;
      }
    }
    uint64_t v23 = 0;
    CFStringRef v24 = @"Coex ARI driver(SubId %u): Set CNV Antenna Blk Policy, invalid mitigationType=%llu, API UtaIdcSetCnvAntBlockPwrLmtConfigReq failed";
    uint64_t v19 = v17;
LABEL_18:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", v23, v24, v28, v19);
  }
  else
  {
    +[WCM_Logging logLevel:0, @"Coex ARI driver(SubId %u): Set CNV Antenna Blk Policy, invalid lqmThreshold=%llu, API UtaIdcSetCnvAntBlockPwrLmtConfigReq failed", v28, uint64 message];
  }
}

- (BOOL)setCamAntBlockingPowerLimitingParam:(t_s_UtaIdcCamAntBlockPwrLmtPolicyConfigBundleV3 *)a3 XpcMessage:(id)a4 SubId:(unsigned int)a5
{
  uint64_t v37 = *(void *)&a5;
  id v6 = a4;
  char v7 = 0;
  xpc_object_t xdict = v6;
  if (a3 && v6)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v6, "kWCMCellularSetAntBlocking_CameraId");
    BOOL v9 = xpc_dictionary_get_BOOL(xdict, "kWCMCellularSetAntBlocking_DenyProtectVoice");
    uint64_t v10 = xpc_dictionary_get_uint64(xdict, "kWCMCellularSetAntBlocking_MitigationTimer");
    uint64_t v11 = uint64 - 2;
    int v12 = 0;
    uint64_t v13 = 0;
    switch(v11)
    {
      case 0uLL:
        break;
      case 1uLL:
        int v12 = 0;
        uint64_t v13 = 1;
        break;
      case 2uLL:
        int v12 = 0;
        uint64_t v13 = 2;
        break;
      case 3uLL:
        int v12 = 0;
        uint64_t v13 = 3;
        break;
      case 6uLL:
        int v12 = 0;
        uint64_t v13 = 4;
        break;
      default:
        int v12 = 1;
        uint64_t v13 = 5;
        break;
    }
    if ((v12 | ![(WCM_AriCoexCommandHandler *)self cameraEnumCheck:v13]) == 1)
    {
      +[WCM_Logging logLevel:0, @"Coex ARI driver(SubId %u): Set Camera Antenna Blk Policy, invalid camera ID = %llu", v37, v13 message];
      char v7 = 0;
    }
    else
    {
      id v14 = &a3->var0[v13];
      v14->var1 = v9;
      v14->var2 = v10;
      +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set Camera Antenna Blk Policy, camera ID = %llu", v37, v13 message];
      +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set Camera Antenna Blk Policy, denyVoiceProtect = %d, mitigationTimer = %llu", v37, v9, v10 message];
      unsigned int v15 = xpc_dictionary_get_value(xdict, "kWCMCellularSetAntBlocking_PolicySet");
      if (v15)
      {
        xpc_object_t xarray = v15;
        size_t count = xpc_array_get_count(v15);
        if (count)
        {
          char v36 = 0;
          size_t v17 = 0;
          uint64_t v18 = count - 1;
          if (count - 1 >= 0xF) {
            uint64_t v18 = 15;
          }
          uint64_t v33 = v18;
          unint64_t v34 = count;
          p_var1 = &a3->var0[v13].var0[0].var1.var2.var1;
          unsigned int v15 = xarray;
          while (1)
          {
            uint64_t v20 = xpc_array_get_value(v15, v17);
            BOOL v39 = xpc_dictionary_get_BOOL(v20, "kWCMCellularSetAntBlocking_Policy_Enable");
            uint64_t v21 = xpc_dictionary_get_uint64(v20, "kWCMCellularSetAntBlocking_Policy_CellularAntBitmap");
            int64_t int64 = xpc_dictionary_get_int64(v20, "kWCMCellularSetAntBlocking_Policy_CellularPowerCap");
            uint64_t v23 = xpc_dictionary_get_uint64(v20, "kWCMCellularSetAntBlocking_Policy_MitigationType");
            uint64_t v24 = xpc_dictionary_get_uint64(v20, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_Band");
            uint64_t v25 = xpc_dictionary_get_uint64(v20, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_CoexTech");
            uint64_t v26 = xpc_dictionary_get_uint64(v20, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_CenterFreq");
            uint64_t v27 = xpc_dictionary_get_uint64(v20, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_Bandwidth");
            +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set Camera Antenna Blk Policy -- policy[%lu]: enable = %d, cellularAntBitmap = %llu, cellularTxPowerCap = %lld, mitigationType = %llu", v37, v17, v39, v21, int64, v23 message];
            +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set Camera Antenna Blk Policy -- policy[%lu]: cellularBand = %llu, cellularCoexTech = %llu, frequency = %lluKHz, BW = %lluKHz", v37, v17, v24, v25, v26, v27 message];
            if (![(WCM_AriCoexCommandHandler *)self coexTechEnumCheck:v25])
            {
              CFStringRef v31 = @"Coex ARI driver(SubId %u): Set Camera Antenna Blk Policy, invalid coexTech=%llu, API UtaIdcSetCamAntBlockPwrLmtConfigReq failed";
              goto LABEL_31;
            }
            if (![(WCM_AriCoexCommandHandler *)self mitigationTypeEnumCheck:v23]) {
              break;
            }
            p_var1[2] = v23;
            p_var1[3] = int64;
            *(p_var1 - 4) = v39;
            *(p_var1 - 3) = v24;
            *(p_var1 - 2) = v25;
            *(p_var1 - 1) = v26;
            unsigned int *p_var1 = v27;
            p_var1[1] = v21;
            p_var1 += 8;

            BOOL v29 = v17 + 1 >= v34 || v17 > 0xE;
            char v36 = v29;
            BOOL v30 = v17++ == v33;
            unsigned int v15 = xarray;
            if (v30) {
              goto LABEL_33;
            }
          }
          CFStringRef v31 = @"Coex ARI driver(SubId %u): SSet Camera Antenna Blk Policy, invalid mitigationType=%llu, API UtaIdcSetCamAntBlockPwrLmtConfigReq failed";
          uint64_t v25 = v23;
LABEL_31:
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, v31, v37, v25);
        }
        else
        {
          char v36 = 1;
        }
        unsigned int v15 = xarray;
      }
      else
      {
        char v36 = 1;
      }
LABEL_33:

      char v7 = v36;
    }
  }

  return v7 & 1;
}

- (void)setCamAntBlockingPowerLimitingConfig:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  char v7 = v6;
  uint64_t v8 = 0;
  BOOL v9 = v19;
  do
  {
    uint64_t v10 = 0;
    v19[65 * v8 + 64] = &_mh_execute_header;
    do
    {
      uint64_t v11 = &v9[v10];
      *uint64_t v11 = 0;
      v11[6] = 3;
      v11[2] = 127;
      v10 += 4;
    }
    while (v10 != 64);
    ++v8;
    v9 += 65;
  }
  while (v8 != 5);
  int v12 = xpc_dictionary_get_value(v6, "kWCMCellularSetAntBlocking_FrontCameraPolicy");
  uint64_t v13 = xpc_dictionary_get_value(v7, "kWCMCellularSetAntBlocking_FaceIdCameraPolicy");
  id v14 = xpc_dictionary_get_value(v7, "kWCMCellularSetAntBlocking_RearTeleCameraPolicy");
  unsigned int v15 = xpc_dictionary_get_value(v7, "kWCMCellularSetAntBlocking_RearWideCameraPolicy");
  uint64_t v16 = xpc_dictionary_get_value(v7, "kWCMCellularSetAntBlocking_RearUltraWideCameraPolicy");
  if ((v12 || v13 || v14 || v15)
    && (!v12
     || [(WCM_AriCoexCommandHandler *)self setCamAntBlockingPowerLimitingParam:v19 XpcMessage:v12 SubId:v4])&& (!v13|| [(WCM_AriCoexCommandHandler *)self setCamAntBlockingPowerLimitingParam:v19 XpcMessage:v13 SubId:v4])&& (!v14|| [(WCM_AriCoexCommandHandler *)self setCamAntBlockingPowerLimitingParam:v19 XpcMessage:v14 SubId:v4])
    && (!v16
     || [(WCM_AriCoexCommandHandler *)self setCamAntBlockingPowerLimitingParam:v19 XpcMessage:v16 SubId:v4])&& (!v15|| [(WCM_AriCoexCommandHandler *)self setCamAntBlockingPowerLimitingParam:v19 XpcMessage:v15 SubId:v4]))
  {
    AriSdk::ARI_UtaIdcSetCamAntBlockPwrLmtConfigReqV3_SDK::ARI_UtaIdcSetCamAntBlockPwrLmtConfigReqV3_SDK((AriSdk::ARI_UtaIdcSetCamAntBlockPwrLmtConfigReqV3_SDK *)v18);
    int v17 = v4;
    sub_10002A14C();
  }
}

- (void)setUwbAntBlockingPowerLimitingConfig:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v40 = *(void *)&a4;
  id v4 = a3;
  for (uint64_t i = 0; i != 1280; i += 40)
  {
    id v6 = &v46[i + 80];
    _DWORD *v6 = 0;
    v6[8] = 3;
    v6[4] = 127;
  }
  xpc_object_t xdict = v4;
  for (uint64_t j = 0; j != 160; j += 20)
  {
    uint64_t v8 = &v46[j + 80];
    *((_DWORD *)v8 + 320) = 0;
    *((void *)v8 + 161) = &_mh_execute_header;
  }
  uint64_t uint64 = xpc_dictionary_get_uint64(v4, "kWCMCellularSetAntBlocking_LQMThreshold");
  uint64_t v9 = xpc_dictionary_get_uint64(xdict, "kWCMCellularSetAntBlocking_DurationGranularity");
  if ([(WCM_AriCoexCommandHandler *)self LQMEnumCheck:uint64])
  {
    v48[36] = uint64;
    __int16 v49 = v9;
    +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set UWB Antenna Blk Policy, lqmThreshold = %llu, durationGranularity = %llu", v40, uint64, v9 message];
    xpc_dictionary_get_value(xdict, "kWCMCellularSetAntBlocking_PolicySet");
    xpc_object_t xarray = (xpc_object_t)objc_claimAutoreleasedReturnValue();
    if (!xarray) {
      goto LABEL_14;
    }
    size_t count = xpc_array_get_count(xarray);
    uint64_t v11 = 32;
    if (count < 0x20) {
      uint64_t v11 = count;
    }
    uint64_t v36 = v11;
    if (!v11)
    {
LABEL_14:
      uint64_t v22 = xpc_dictionary_get_value(xdict, "kWCMCellularSetAntBlocking_PriorityClassPolicy");
      uint64_t v23 = v22;
      if (v22)
      {
        size_t v24 = xpc_array_get_count(v22);
        uint64_t v25 = 8;
        if (v24 < 8) {
          uint64_t v25 = v24;
        }
        uint64_t v44 = v25;
        if (v25)
        {
          size_t v26 = 0;
          uint64_t v27 = v48;
          do
          {
            uint64_t v28 = v23;
            BOOL v29 = xpc_array_get_value(v23, v26);
            BOOL v30 = xpc_dictionary_get_BOOL(v29, "kWCMCellularSetAntBlocking_PriorityClassPolicy_Enable");
            BOOL v31 = xpc_dictionary_get_BOOL(v29, "kWCMCellularSetAntBlocking_PriorityClassPolicy_DenyProtectVoice");
            BOOL v32 = xpc_dictionary_get_BOOL(v29, "kWCMCellularSetAntBlocking_PriorityClassPolicy_NeedMitigation");
            uint64_t v33 = xpc_dictionary_get_uint64(v29, "kWCMCellularSetAntBlocking_PriorityClassPolicy_PriorityClass");
            uint64_t v34 = xpc_dictionary_get_uint64(v29, "kWCMCellularSetAntBlocking_PriorityClassPolicy_MitigationTimer");
            +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set UWB Antenna Blk Policy -- priorityPolicy[%lu]: enable = %d, priorityClass = %llu, mitigationTimer = %llu", v40, v26, v30, v33, v34 message];
            +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set UWB Antenna Blk Policy -- priorityPolicy[%lu]: denyVoiceProtect = %d, mitigationRequired = %d", v40, v26, v31, v32 message];
            *(v27 - 4) = v30;
            *(v27 - 2) = v32;
            *(v27 - 1) = v31;
            *((unsigned char *)v27 - 12) = v33;
            *uint64_t v27 = v34;
            v27 += 5;

            ++v26;
            uint64_t v23 = v28;
          }
          while (v44 != v26);
        }
      }
      [(WCM_AriCoexCache *)self->mCache update:@"UWB_LQM_Threshold" value_uint64:uint64 subId:v40];
      if (v48[1]) {
        [(WCM_AriCoexCache *)self->mCache update:@"UWB_PC1_Deny_Voice_Protection" value_BOOL:v48[4] != 0 subId:v40];
      }
      AriSdk::ARI_UtaIdcSetUwbAntBlockPwrLmtConfigReqV2_SDK::ARI_UtaIdcSetUwbAntBlockPwrLmtConfigReqV2_SDK((AriSdk::ARI_UtaIdcSetUwbAntBlockPwrLmtConfigReqV2_SDK *)v46);
      sub_10002A14C();
    }
    size_t v12 = 0;
    uint64_t v13 = &v47;
    while (1)
    {
      id v14 = xpc_array_get_value(xarray, v12);
      BOOL v43 = xpc_dictionary_get_BOOL(v14, "kWCMCellularSetAntBlocking_Policy_Enable");
      uint64_t v42 = xpc_dictionary_get_uint64(v14, "kWCMCellularSetAntBlocking_Policy_CellularAntBitmap");
      int64_t int64 = xpc_dictionary_get_int64(v14, "kWCMCellularSetAntBlocking_Policy_CellularPowerCap");
      uint64_t v15 = xpc_dictionary_get_uint64(v14, "kWCMCellularSetAntBlocking_Policy_MitigationType");
      uint64_t v16 = xpc_dictionary_get_uint64(v14, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_Band");
      uint64_t v17 = xpc_dictionary_get_uint64(v14, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_CoexTech");
      uint64_t v18 = xpc_dictionary_get_uint64(v14, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_CenterFreq");
      uint64_t v19 = xpc_dictionary_get_uint64(v14, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_Bandwidth");
      uint64_t v20 = xpc_dictionary_get_uint64(v14, "kWCMCellularSetAntBlocking_Policy_UwbChannel");
      uint64_t v21 = xpc_dictionary_get_uint64(v14, "kWCMCellularSetAntBlocking_Policy_UwbAntBitmap");
      +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set UWB Antenna Blk Policy -- policy[%lu]: enable = %d, cellularAntBitmap = %llu, cellularTxPowerCap = %lld, mitigationType = %llu", v40, v12, v43, v42, int64, v15 message];
      +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set UWB Antenna Blk Policy -- policy[%lu]: cellularBand = %llu, cellularCoexTech = %llu, frequency = %lluKHz, BW = %lluKHz", v40, v12, v16, v17, v18, v19 message];
      +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set UWB Antenna Blk Policy -- policy[%lu]: uwbChannel = %llu, uwbAntBitmap = %llu", v40, v12, v20, v21 message];
      if (![(WCM_AriCoexCommandHandler *)self coexTechEnumCheck:v17])
      {
        CFStringRef v35 = @"Coex ARI driver(SubId %u): Set UWB Antenna Blk Policy, invalid coexTech=%llu, API UtaIdcSetUwbAntBlockPwrLmtConfigReq failed";
        goto LABEL_26;
      }
      if (![(WCM_AriCoexCommandHandler *)self mitigationTypeEnumCheck:v15]) {
        break;
      }
      *(v13 - 5) = v43;
      v13[3] = v15;
      v13[4] = int64;
      *((_WORD *)v13 - 8) = v20;
      v13[1] = v19;
      v13[2] = v42;
      *(v13 - 3) = v21;
      *(v13 - 2) = v16;
      *(v13 - 1) = v17;
      *uint64_t v13 = v18;

      ++v12;
      v13 += 10;
      if (v36 == v12) {
        goto LABEL_14;
      }
    }
    CFStringRef v35 = @"Coex ARI driver(SubId %u): Set UWB Antenna Blk Policy, invalid mitigationType=%llu, API UtaIdcSetUwbAntBlockPwrLmtConfigReq failed";
    uint64_t v17 = v15;
LABEL_26:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, v35, v40, v17);
  }
  else
  {
    +[WCM_Logging logLevel:0, @"Coex ARI driver(SubId %u): Set UWB Antenna Blk Policy, invalid lqmThreshold=%llu, API UtaIdcSetUwbAntBlockPwrLmtConfigReq failed", v40, uint64 message];
  }
}

- (void)setE85AntBlockingPowerLimitingConfig:(id)a3 SubId:(unsigned int)a4
{
  id v4 = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(v4, "kWCMCellularSetAntBlocking_LQMThreshold");
  BOOL v6 = xpc_dictionary_get_BOOL(v4, "kWCMCellularSetAntBlocking_DenyProtectVoice");
  uint64_t v7 = xpc_dictionary_get_uint64(v4, "kWCMCellularSetAntBlocking_MitigationTimer");
  +[WCM_Logging logLevel:3, @"Coex ARI driver: Set USB-C Antenna Blk Policy, lqmThreshold = %llu", uint64 message];
  +[WCM_Logging logLevel:3, @"Coex ARI driver: Set USB-C Antenna Blk Policy, denyVoiceProtect = %d, mitigationTimer = %llu", v6, v7 message];
  if ([(WCM_AriCoexCommandHandler *)self LQMEnumCheck:uint64])
  {
    id v23 = v4;
    uint64_t v8 = xpc_dictionary_get_value(v4, "kWCMCellularSetAntBlocking_PolicySet");
    xpc_object_t xarray = v8;
    if (v8)
    {
      size_t count = xpc_array_get_count(v8);
      uint64_t v10 = 32;
      if (count < 0x20) {
        uint64_t v10 = count;
      }
      uint64_t v24 = v10;
    }
    else
    {
      uint64_t v24 = 0;
    }
    for (uint64_t i = 0; i != 1024; i += 32)
    {
      size_t v12 = &v28[i + 84];
      *(_DWORD *)size_t v12 = 0;
      *((_DWORD *)v12 + 5) = 3;
      *((_WORD *)v12 + 2) = 0;
      *((_DWORD *)v12 + 7) = 0;
    }
    v29[252] = v6;
    v29[253] = uint64;
    v29[254] = v7;
    if (!v24)
    {
LABEL_14:
      AriSdk::ARI_UtaIdcSetUsbEnhAntBlockPwrLmtPolicyConfigReq_SDK::ARI_UtaIdcSetUsbEnhAntBlockPwrLmtPolicyConfigReq_SDK((AriSdk::ARI_UtaIdcSetUsbEnhAntBlockPwrLmtPolicyConfigReq_SDK *)v28);
      sub_10002A14C();
    }
    size_t v13 = 0;
    id v14 = v29;
    while (1)
    {
      uint64_t v15 = xpc_array_get_value(xarray, v13);
      BOOL v27 = xpc_dictionary_get_BOOL(v15, "kWCMCellularSetAntBlocking_Policy_Enable");
      uint64_t v16 = xpc_dictionary_get_uint64(v15, "kWCMCellularSetAntBlocking_Policy_CellularAntBitmap");
      int64_t int64 = xpc_dictionary_get_int64(v15, "kWCMCellularSetAntBlocking_Policy_CellularPowerCap");
      uint64_t v18 = xpc_dictionary_get_uint64(v15, "kWCMCellularSetAntBlocking_Policy_MitigationType");
      uint64_t v19 = xpc_dictionary_get_uint64(v15, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_CoexTech");
      uint64_t v20 = xpc_dictionary_get_uint64(v15, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_CenterFreq");
      uint64_t v21 = xpc_dictionary_get_uint64(v15, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_Bandwidth");
      uint64_t v22 = xpc_dictionary_get_uint64(v15, "kWCMCellularSetAntBlocking_Policy_UsbRate");
      +[WCM_Logging logLevel:3, @"Coex ARI driver: Set USB-C Antenna Blk Policy -- policy[%lu]: enable = %d, cellularAntBitmap = %llu, cellularTxPowerCap = %llu, mitigationType = %llu", v13, v27, v16, int64, v18 message];
      +[WCM_Logging logLevel:3, @"Coex ARI driver: Set USB-C Antenna Blk Policy -- policy[%lu]: cellularCoexTech = %llu, frequency = %lluKHz, BW = %lluKHz, USB_rate_bitmap = %llu", v13, v19, v20, v21, v22 message];
      if (![(WCM_AriCoexCommandHandler *)self mitigationTypeEnumCheck:v18]) {
        break;
      }
      *(v14 - 4) = v27;
      *((_WORD *)v14 - 6) = v19;
      *(v14 - 2) = v20;
      *(v14 - 1) = v21;
      _DWORD *v14 = v16;
      v14[1] = v18;
      v14[2] = int64;
      v14[3] = v22;

      ++v13;
      v14 += 8;
      if (v24 == v13) {
        goto LABEL_14;
      }
    }
    +[WCM_Logging logLevel:0, @"Coex ARI driver: Set USB-C Antenna Blk Policy, invalid mitigationType=%llu, API UtaIdcSetCnvAntBlockPwrLmtConfigReq failed", v18 message];

    id v4 = v23;
  }
  else
  {
    +[WCM_Logging logLevel:0, @"Coex ARI driver: Set USB-C Antenna Blk Policy, invalid lqmThreshold=%llu, API UtaIdcSetCnvAntBlockPwrLmtConfigReq failed", uint64 message];
  }
}

- (void)setStaticTimesharingConfig:(unsigned int)a3
{
  uint64_t v4 = *(void *)&a3;
  +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set Timesharing Config, enable=%d, coexTech=%llu, callType=%u, longDrxCycle=%llu, shortDrxCycle=%llu, durationScale=%llu", *(void *)&a3, 1, 1, 1, 40, 0, 5 message];
  +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set Timesharing Config - BandInfo[0] , frequency=%lldKHz, BW=%lldKHz", v4, 2385000, 30000 message];
  uint64_t v9 = 0x2800000001;
  __int16 v10 = 5;
  long long v7 = xmmword_1001E7BC0;
  int v8 = 30000;
  AriSdk::ARI_UtaIdcSetTimeSharingConfigReq_SDK::ARI_UtaIdcSetTimeSharingConfigReq_SDK((AriSdk::ARI_UtaIdcSetTimeSharingConfigReq_SDK *)v6);
  unsigned int v5 = a3;
  sub_10002A14C();
}

- (void)setTimesharingConfig:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  xpc_object_t xdict = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "kWCMCellularSetTimeShareConfig_Enable");
  uint64_t v6 = xpc_dictionary_get_uint64(xdict, "kWCMCellularTimeShareConfig_CoexTech");
  uint64_t v7 = xpc_dictionary_get_uint64(xdict, "kWCMCellularTimeShareConfig_CallType");
  uint64_t v8 = xpc_dictionary_get_uint64(xdict, "kWCMCellularTimeShareConfig_LongDrxCycle");
  uint64_t v9 = xpc_dictionary_get_uint64(xdict, "kWCMCellularTimeShareConfig_ShortDrxCycle");
  uint64_t v10 = xpc_dictionary_get_uint64(xdict, "kWCMCellularTImeShareConfig_SleepWakeDurScale");
  unsigned int v11 = [(WCM_AriCoexCommandHandler *)self convertInternalCoexTech:v6];
  uint64_t v12 = [(WCM_AriCoexCommandHandler *)self convertInternalCallType:v7];
  uint64_t v13 = v11;
  +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set Timesharing Config, enable=%d, coexTech=%llu, callType=%u, longDrxCycle=%llu, shortDrxCycle=%llu, durationScale=%llu", v4, uint64 != 0, v11, v12, v8, v9, v10 message];
  if ([(WCM_AriCoexCommandHandler *)self coexTechEnumCheck:v11])
  {
    if ([(WCM_AriCoexCommandHandler *)self callTypeEnumCheck:v7])
    {
      BOOL v29 = uint64 != 0;
      unsigned int v30 = v11;
      v32[7] = v12;
      __int16 v33 = v8;
      __int16 v34 = v9;
      __int16 v35 = v10;
      id v14 = xpc_dictionary_get_value(xdict, "kWCMCellularTImeShareConfig_BandInformationSet");
      uint64_t v15 = v14;
      uint64_t v25 = v14;
      if (v14)
      {
        size_t count = xpc_array_get_count(v14);
        int v31 = count;
        if (count)
        {
          size_t v17 = 0;
          uint64_t v18 = v32;
          do
          {
            uint64_t v19 = xpc_array_get_value(v15, v17);
            int64_t int64 = xpc_dictionary_get_int64(v19, "kWCMCellularTImeShareConfig_BandSet_Frequency");
            int64_t v21 = xpc_dictionary_get_int64(v19, "kWCMCellularTImeShareConfig_BandSet_BW");
            int64 *= 1000;
            int v22 = 1000 * v21;
            +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set Timesharing Config - BandInfo[%lu] , frequency=%lldKHz, BW=%lldKHz", v4, v17, int64, 1000 * v21 message];
            *(v18 - 1) = int64;
            _DWORD *v18 = v22;

            ++v17;
            v18 += 2;
            uint64_t v15 = v25;
          }
          while (count != v17);
        }
      }
      else
      {
        int v31 = 0;
      }
      AriSdk::ARI_UtaIdcSetTimeSharingConfigReq_SDK::ARI_UtaIdcSetTimeSharingConfigReq_SDK((AriSdk::ARI_UtaIdcSetTimeSharingConfigReq_SDK *)v28);
      int v27 = v4;
      sub_10002A14C();
    }
    CFStringRef v23 = @"Coex ARI driver(SubId %u): Set Timesharing Config, invalid callType=%llu, failed to set UtaIdcSetTimeSharingConfigReq";
    uint64_t v13 = v7;
  }
  else
  {
    CFStringRef v23 = @"Coex ARI driver(SubId %u): Set Timesharing Config, invalid coexTech=%llu, UtaIdcSetTimeSharingConfigReq failed";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, v23, v4, v13);
}

- (void)setCC1Config:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  xpc_object_t xdict = a3;
  BOOL v6 = xpc_dictionary_get_BOOL(xdict, "kWCMCellularSetCC_Enable");
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "kWCMCellularSetCC_CoexTech");
  uint64_t v8 = xpc_dictionary_get_uint64(xdict, "kWCMCellularSetCC_CarrierId");
  double v9 = xpc_dictionary_get_double(xdict, "kWCMCellularSetCC_UplinkCenterFrequency");
  double v10 = xpc_dictionary_get_double(xdict, "kWCMCellularSetCC_UplinkBandwidth");
  double v11 = xpc_dictionary_get_double(xdict, "kWCMCellularSetCC_DownlinkCenterFrequency");
  double v12 = xpc_dictionary_get_double(xdict, "kWCMCellularSetCC_DownlinkBandwidth");
  uint64_t v13 = [(WCM_AriCoexCommandHandler *)self convertInternalCoexTech:uint64];
  if ([(WCM_AriCoexCommandHandler *)self coexTechEnumCheck:v13])
  {
    [(WCM_AriCoexCache *)self->mCache update:@"CC1_Enable" value_BOOL:v6 subId:v4];
    [(WCM_AriCoexCache *)self->mCache update:@"CC1_Tech" value_uint64:v13 subId:v4];
    [(WCM_AriCoexCache *)self->mCache update:@"CC1_CarrierId" value_uint64:v8 subId:v4];
    [(WCM_AriCoexCache *)self->mCache update:@"CC1_UplinkCenterFreq" value_double:v4 subId:v9];
    [(WCM_AriCoexCache *)self->mCache update:@"CC1_UplinkBandwidth" value_double:v4 subId:v10];
    [(WCM_AriCoexCache *)self->mCache update:@"CC1_DownlinkCenterFreq" value_double:v4 subId:v11];
    [(WCM_AriCoexCache *)self->mCache update:@"CC1_DownlinkBandwidth" value_double:v4 subId:v12];
    +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set Critical Carrier 1, enable=%d, coexTech=%llu, carrier_id=%llu", v4, v6, v13, v8 message];
    +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set Critical Carrier 1, UL_freq=%fMHz, UL_BW=%fMHz, DL_freq=%fMHz, DL_BW=%fMHz", v4, *(void *)&v9, *(void *)&v10, *(void *)&v11, *(void *)&v12 message];
  }
  else
  {
    +[WCM_Logging logLevel:0, @"Coex ARI driver(SubId %u): Set Critical Carrier 1, invalid coexTech=%llu, UtaIdcSetCriticalCarrierConfigReq failed", v4, v13 message];
  }
}

- (void)setCC2Config:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  xpc_object_t xdict = a3;
  BOOL v6 = xpc_dictionary_get_BOOL(xdict, "kWCMCellularSetCC_Enable");
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "kWCMCellularSetCC_CoexTech");
  uint64_t v8 = xpc_dictionary_get_uint64(xdict, "kWCMCellularSetCC_CarrierId");
  double v9 = xpc_dictionary_get_double(xdict, "kWCMCellularSetCC_UplinkCenterFrequency");
  double v10 = xpc_dictionary_get_double(xdict, "kWCMCellularSetCC_UplinkBandwidth");
  double v11 = xpc_dictionary_get_double(xdict, "kWCMCellularSetCC_DownlinkCenterFrequency");
  double v12 = xpc_dictionary_get_double(xdict, "kWCMCellularSetCC_DownlinkBandwidth");
  uint64_t v13 = [(WCM_AriCoexCommandHandler *)self convertInternalCoexTech:uint64];
  if ([(WCM_AriCoexCommandHandler *)self coexTechEnumCheck:v13])
  {
    [(WCM_AriCoexCache *)self->mCache update:@"CC2_Enable" value_BOOL:v6 subId:v4];
    [(WCM_AriCoexCache *)self->mCache update:@"CC2_Tech" value_uint64:v13 subId:v4];
    [(WCM_AriCoexCache *)self->mCache update:@"CC2_CarrierId" value_uint64:v8 subId:v4];
    [(WCM_AriCoexCache *)self->mCache update:@"CC2_UplinkCenterFreq" value_double:v4 subId:v9];
    [(WCM_AriCoexCache *)self->mCache update:@"CC2_UplinkBandwidth" value_double:v4 subId:v10];
    [(WCM_AriCoexCache *)self->mCache update:@"CC2_DownlinkCenterFreq" value_double:v4 subId:v11];
    [(WCM_AriCoexCache *)self->mCache update:@"CC2_DownlinkBandwidth" value_double:v4 subId:v12];
    +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set Critical Carrier 2, enable=%d, coexTech=%llu, carrier_id=%llu", v4, v6, v13, v8 message];
    +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set Critical Carrier 2, UL_freq=%fMHz, UL_BW=%fMHz, DL_freq=%fMHz, DL_BW=%fMHz", v4, *(void *)&v9, *(void *)&v10, *(void *)&v11, *(void *)&v12 message];
  }
  else
  {
    +[WCM_Logging logLevel:0, @"Coex ARI driver(SubId %u): Set Critical Carrier 2, invalid coexTech=%llu, UtaIdcSetCriticalCarrierConfigReq failed", v4, v13 message];
  }
}

- (void)setAllCCConfig:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  unsigned __int8 v46 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = 127;
  double v42 = 0.0;
  double v43 = 0.0;
  double v40 = 0.0;
  double v41 = 0.0;
  unsigned __int8 v39 = 0;
  uint64_t v37 = 0;
  uint64_t v38 = 127;
  double v35 = 0.0;
  double v36 = 0.0;
  double v33 = 0.0;
  double v34 = 0.0;
  if ([(WCM_AriCoexCache *)self->mCache get:@"CC1_Enable" value_BOOL:&v46 subId:*(void *)&a4])
  {
    [(WCM_AriCoexCache *)self->mCache get:@"CC1_Tech" value_uint64:&v45 subId:v4];
    [(WCM_AriCoexCache *)self->mCache get:@"CC1_CarrierId" value_uint64:&v44 subId:v4];
    [(WCM_AriCoexCache *)self->mCache get:@"CC1_UplinkCenterFreq" value_double:&v43 subId:v4];
    [(WCM_AriCoexCache *)self->mCache get:@"CC1_UplinkBandwidth" value_double:&v42 subId:v4];
    [(WCM_AriCoexCache *)self->mCache get:@"CC1_DownlinkCenterFreq" value_double:&v41 subId:v4];
    [(WCM_AriCoexCache *)self->mCache get:@"CC1_DownlinkBandwidth" value_double:&v40 subId:v4];
    +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set Critical Carrier 1, enable=%d, coexTech=%llu, carrier_id=%llu", v4, v46, v45, v44 message];
    +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set Critical Carrier 1, UL_freq=%fMHz, UL_BW=%fMHz, DL_freq=%fMHz, DL_BW=%fMHz", v4, *(void *)&v43, *(void *)&v42, *(void *)&v41, *(void *)&v40 message];
  }
  else
  {
    +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set Critical Carrier 1,  not configured yet", v4, v12, v13, v14, v15 message];
  }
  if ([(WCM_AriCoexCache *)self->mCache get:@"CC2_Enable" value_BOOL:&v39 subId:v4])
  {
    [(WCM_AriCoexCache *)self->mCache get:@"CC2_Tech" value_uint64:&v38 subId:v4];
    [(WCM_AriCoexCache *)self->mCache get:@"CC2_CarrierId" value_uint64:&v37 subId:v4];
    [(WCM_AriCoexCache *)self->mCache get:@"CC2_UplinkCenterFreq" value_double:&v36 subId:v4];
    [(WCM_AriCoexCache *)self->mCache get:@"CC2_UplinkBandwidth" value_double:&v35 subId:v4];
    [(WCM_AriCoexCache *)self->mCache get:@"CC2_DownlinkCenterFreq" value_double:&v34 subId:v4];
    [(WCM_AriCoexCache *)self->mCache get:@"CC2_DownlinkBandwidth" value_double:&v33 subId:v4];
    +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set Critical Carrier 2, enable=%d, coexTech=%llu, carrier_id=%llu", v4, v39, v38, v37 message];
    +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set Critical Carrier 2, UL_freq=%fMHz, UL_BW=%fMHz, DL_freq=%fMHz, DL_BW=%fMHz", v4, *(void *)&v36, *(void *)&v35, *(void *)&v34, *(void *)&v33 message];
    int v6 = v38;
    int v7 = v37;
    unsigned int v8 = (v36 * 1000.0);
    unsigned int v9 = (v35 * 1000.0);
    unsigned int v10 = (v34 * 1000.0);
    unsigned int v11 = (v33 * 1000.0);
  }
  else
  {
    +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set Critical Carrier 2,  not configured yet", v4 message];
    unsigned int v11 = 0;
    unsigned int v10 = 0;
    unsigned int v9 = 0;
    unsigned int v8 = 0;
    int v7 = 0;
    int v6 = 127;
  }
  int v17 = v46;
  int v18 = v45;
  int v19 = v44;
  unsigned int v20 = (v43 * 1000.0);
  unsigned int v21 = (v42 * 1000.0);
  unsigned int v22 = (v41 * 1000.0);
  unsigned int v23 = (v40 * 1000.0);
  int v24 = 0xFFFF;
  int v25 = v39;
  int v26 = v6;
  int v27 = v7;
  unsigned int v28 = v8;
  unsigned int v29 = v9;
  unsigned int v30 = v10;
  unsigned int v31 = v11;
  int v32 = 0xFFFF;
  AriSdk::ARI_UtaIdcSetCriticalCarrierConfigReqV2_SDK::ARI_UtaIdcSetCriticalCarrierConfigReqV2_SDK((AriSdk::ARI_UtaIdcSetCriticalCarrierConfigReqV2_SDK *)v16);
  sub_10002A14C();
}

- (void)setTxBlankingPowerLimitingConfig:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(v5, "kWCMCellularSetWCI2Mode_PowerThreshold");
  uint64_t v7 = xpc_dictionary_get_uint64(v5, "kWCMCellularSetWCI2Mode_RB_Threshold");
  uint64_t v23 = xpc_dictionary_get_uint64(v5, "kWCMCellularSetWCI2Mode_LTE_TxDenialThreshold");
  int64_t int64 = xpc_dictionary_get_int64(v5, "kWCMCellularSetWCI2Mode_MaxAllowedFrameDenials");
  int64_t v21 = xpc_dictionary_get_int64(v5, "kWCMCellularSetWCI2Mode_FrameDenialWindow");
  uint64_t v20 = xpc_dictionary_get_uint64(v5, "kWCMCellularSetWCI2Mode_LinkPathLossThreshold");
  uint64_t v19 = xpc_dictionary_get_uint64(v5, "kWCMCellularSetWCI2Mode_Harq_nack_ratio_Threshold");
  double v8 = xpc_dictionary_get_double(v5, "kWCMCellularSetWCI2Mode_RBFilterAlpha");
  uint64_t v18 = xpc_dictionary_get_uint64(v5, "kWCMCellularSetWCI2Mode_FilterRBThreshold");
  uint64_t v9 = xpc_dictionary_get_uint64(v5, "kWCMCellularSetWCI2Mode_WCI2PowerLimit");
  uint64_t v10 = xpc_dictionary_get_uint64(v5, "kWCMCellularSetWCI2Mode_WCI2PowerLimitTO");
  BOOL v11 = xpc_dictionary_get_BOOL(v5, "kWCMCellularSetWCI2Mode_Controller_PowerLimiting_Enable");
  uint64_t v12 = xpc_dictionary_get_uint64(v5, "kWCMCellularSetWCI2Mode_ControllerTxPowerLimit");
  uint64_t v13 = xpc_dictionary_get_uint64(v5, "kWCMCellularSetWCI2Mode_ControllerTxPowerLimitTO");
  double v14 = 0.0;
  if (v8 >= 0.0) {
    double v14 = v8;
  }
  if (v14 <= 1.0) {
    double v15 = v14 * 10000.0;
  }
  else {
    double v15 = 10000.0;
  }
  +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set TX blanking Config, PowerThreshold=%llu(1/16dBm), RBThreshold=%llu, PerEventBlankingThreshold=%llu, MaxBlankingInWindow=%lld, SlidingWindowSize=%lld", v4, 16 * uint64, v7, v23, int64, v21 message];
  +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set TX Power Limiting Config, PathLossThreshold=%llu, NackRatioThreshold=%llu, RBFilterAlpha=%d, FilterRBThreshold=%llu", v4, v20, v19, (int)v15, v18 message];
  uint64_t v16 = 16 * v9;
  uint64_t v17 = 16 * v12;
  +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set TX Power Limiting Config, SpmiPowerLimitThreshold=%llu(1/16dBm), SpmiPowerLimitTimeout=%llu, hostPowerLimitEnable=%d, hostPowerLimitThreshold=%llu(1/16dBm), hostPowerLimitTimeout=%llu", v4, v16, v10, v11, v17, v13 message];
  BOOL v31 = v11;
  __int16 v32 = v20;
  __int16 v33 = v17;
  __int16 v34 = v16;
  __int16 v35 = 1;
  int v36 = (int)v15;
  char v37 = v18;
  char v38 = v10;
  char v39 = v13;
  char v40 = v19;
  int v25 = v21;
  int v26 = int64;
  char v27 = v23;
  __int16 v28 = 16 * uint64;
  char v29 = v7;
  __int16 v30 = 1;
  AriSdk::ARI_UtaIdcSetTxPowerLimitingConfigReq_SDK::ARI_UtaIdcSetTxPowerLimitingConfigReq_SDK((AriSdk::ARI_UtaIdcSetTxPowerLimitingConfigReq_SDK *)v24);
  sub_10002A14C();
}

- (void)setScanFreq:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  xpc_object_t xarray = a3;
  unsigned int count = xpc_array_get_count(xarray);
  if (count >= 0x10) {
    uint64_t v6 = 16;
  }
  else {
    uint64_t v6 = count;
  }
  int v14 = v6;
  if (v6)
  {
    size_t v7 = 0;
    double v8 = &v15;
    do
    {
      uint64_t v9 = xpc_array_get_value(xarray, v7);
      int64_t int64 = xpc_dictionary_get_int64(v9, "kWCMCellularScanFreqBandFilter_CenterFreq");
      int64_t v11 = xpc_dictionary_get_int64(v9, "kWCMCellularScanFreqBandFilter_Bandwidth");
      +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set Scan Frequency Config--freq[%d]: frequency=%lldMHz, BW=%lldMHz", v4, v7, int64, v11 message];
      *((_DWORD *)v8 - 2) = 1000 * int64;
      *((_DWORD *)v8 - 1) = 1000 * v11;
      *(_DWORD *)double v8 = 1;
      double v8 = (uint64_t *)((char *)v8 + 12);

      ++v7;
    }
    while (v6 != v7);
  }
  AriSdk::ARI_UtaIdcRTSetScanFreqReqV2_SDK::ARI_UtaIdcRTSetScanFreqReqV2_SDK((AriSdk::ARI_UtaIdcRTSetScanFreqReqV2_SDK *)v13);
  sub_10002A14C();
}

- (void)setRC1Config:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  unsigned __int8 v26 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v21 = 0;
  uint64_t uint64 = xpc_dictionary_get_uint64(v6, "WCMCellularSetLAAConfig_UwbRangingDuration");
  uint64_t v8 = xpc_dictionary_get_uint64(v6, "WCMCellularSetLAAConfig_UwbNarrowBandDuration");
  uint64_t v9 = xpc_dictionary_get_uint64(v6, "kWCMCellularSetLaaGpioThrottleReq_Enabled");
  uint64_t v10 = xpc_dictionary_get_uint64(v6, "kWCMCellularSetLaaGpioThrottleReq_Periodicity");
  +[WCM_Logging logLevel:3, @"Coex ARI driver: Set LAA(RC1) Config : RangingDuration=%llu, NarrowBandDuration=%llu", uint64, v8 message];
  +[WCM_Logging logLevel:3, @"Coex ARI driver: Set LAA(RC1) Config : throttleEnable=%llu, throttleDuration=%llu", v9, v10 message];
  [(WCM_AriCoexCache *)self->mCache update:@"kWCMCellularSetLaaGpioThrottleReq_Enabled" value_uint64:v9 subId:v4];
  [(WCM_AriCoexCache *)self->mCache update:@"kWCMCellularSetLaaGpioThrottleReq_Periodicity" value_uint64:v10 subId:v4];
  if (uint64) {
    [(WCM_AriCoexCache *)self->mCache update:@"WCMCellularSetLAAConfig_UwbRangingDuration" value_uint64:uint64 subId:v4];
  }
  if (v8) {
    [(WCM_AriCoexCache *)self->mCache update:@"WCMCellularSetLAAConfig_UwbNarrowBandDuration" value_uint64:uint64 subId:v4];
  }
  if ([(WCM_AriCoexCache *)self->mCache get:@"WCMCellularSetLAAConfig_CoexEnable" value_BOOL:&v26 subId:v4])
  {
    [(WCM_AriCoexCache *)self->mCache get:@"WCMCellularSetLAAConfig_ProtectCQIPeriod" value_uint64:&v25 subId:v4];
    [(WCM_AriCoexCache *)self->mCache get:@"WCMCellularSetLAAConfig_ThresholdIn" value_uint64:&v24 subId:v4];
    [(WCM_AriCoexCache *)self->mCache get:@"WCMCellularSetLAAConfig_ThresholdOut" value_uint64:&v23 subId:v4];
    [(WCM_AriCoexCache *)self->mCache get:@"WCMCellularSetLAAConfig_DeactTimer" value_uint64:&v22 subId:v4];
    [(WCM_AriCoexCache *)self->mCache get:@"WCMCellularSetLAAConfig_DeactStopTimer" value_uint64:&v21 subId:v4];
    +[WCM_Logging logLevel:3, @"Coex ARI driver: Set LAA Config, enable=%d, protectCQIPeriod=%llu, thresholdIn=%llu", v26, v25, v24 message];
    +[WCM_Logging logLevel:3, @"Coex ARI driver: Set LAA Config, threshold_out=%llu, deactTimer=%llu, deactStopTimer=%llu", v23, v22, v21 message];
    int v13 = v26;
    if (v9) {
      char v11 = v10;
    }
    else {
      char v11 = 1;
    }
    char v14 = v11;
    char v15 = v24;
    char v16 = v23;
    __int16 v17 = v22;
    __int16 v18 = v21;
    __int16 v19 = uint64;
    __int16 v20 = v8;
    AriSdk::ARI_UtaIdcSetLaaConfigReq_SDK::ARI_UtaIdcSetLaaConfigReq_SDK((AriSdk::ARI_UtaIdcSetLaaConfigReq_SDK *)v12);
    sub_10002A14C();
  }
  +[WCM_Logging logLevel:3 message:@"Coex ARI driver: Set LAA(RC1) Config : LAA not configured, no ARI call"];
}

- (void)setLAAConfig:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  BOOL v7 = xpc_dictionary_get_BOOL(v6, "WCMCellularSetLAAConfig_CoexEnable");
  uint64_t uint64 = xpc_dictionary_get_uint64(v6, "WCMCellularSetLAAConfig_ProtectCQIPeriod");
  uint64_t v9 = xpc_dictionary_get_uint64(v6, "WCMCellularSetLAAConfig_ThresholdIn");
  uint64_t v10 = xpc_dictionary_get_uint64(v6, "WCMCellularSetLAAConfig_ThresholdOut");
  uint64_t v11 = xpc_dictionary_get_uint64(v6, "WCMCellularSetLAAConfig_DeactTimer");
  uint64_t v12 = xpc_dictionary_get_uint64(v6, "WCMCellularSetLAAConfig_DeactStopTimer");
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  [(WCM_AriCoexCache *)self->mCache update:@"WCMCellularSetLAAConfig_CoexEnable" value_BOOL:v7 subId:v4];
  [(WCM_AriCoexCache *)self->mCache update:@"WCMCellularSetLAAConfig_ProtectCQIPeriod" value_uint64:uint64 subId:v4];
  [(WCM_AriCoexCache *)self->mCache update:@"WCMCellularSetLAAConfig_ThresholdIn" value_uint64:v9 subId:v4];
  [(WCM_AriCoexCache *)self->mCache update:@"WCMCellularSetLAAConfig_ThresholdOut" value_uint64:v10 subId:v4];
  [(WCM_AriCoexCache *)self->mCache update:@"WCMCellularSetLAAConfig_DeactTimer" value_uint64:v11 subId:v4];
  [(WCM_AriCoexCache *)self->mCache update:@"WCMCellularSetLAAConfig_DeactStopTimer" value_uint64:v12 subId:v4];
  +[WCM_Logging logLevel:3, @"Coex ARI driver: Set LAA Config, enable=%d, protectCQIPeriod=%llu, thresholdIn=%llu", v7, uint64, v9 message];
  +[WCM_Logging logLevel:3, @"Coex ARI driver: Set LAA Config, threshold_out=%llu, deactTimer=%llu, deactStopTimer=%llu", v10, v11, v12 message];
  if (![(WCM_AriCoexCache *)self->mCache get:@"WCMCellularSetLAAConfig_UwbRangingDuration" value_uint64:&v26 subId:v4])uint64_t v26 = 0; {
  if (![(WCM_AriCoexCache *)self->mCache get:@"WCMCellularSetLAAConfig_UwbNarrowBandDuration" value_uint64:&v25 subId:v4])uint64_t v25 = 0;
  }
  if (![(WCM_AriCoexCache *)self->mCache get:@"kWCMCellularSetLaaGpioThrottleReq_Enabled" value_uint64:&v24 subId:v4])uint64_t v24 = 0; {
  if (![(WCM_AriCoexCache *)self->mCache get:@"kWCMCellularSetLaaGpioThrottleReq_Periodicity" value_uint64:&v23 subId:v4])uint64_t v23 = 1;
  }
  +[WCM_Logging logLevel:3, @"Coex ARI driver: Set LAA(RC1) Config : RangingDuration=%llu, NarrowBandDuration=%llu", v26, v25 message];
  BOOL v15 = v7;
  if (v24) {
    char v13 = v23;
  }
  else {
    char v13 = 1;
  }
  char v16 = v13;
  char v17 = v9;
  char v18 = v10;
  __int16 v19 = v11;
  __int16 v20 = v12;
  __int16 v21 = v26;
  __int16 v22 = v25;
  AriSdk::ARI_UtaIdcSetLaaConfigReq_SDK::ARI_UtaIdcSetLaaConfigReq_SDK((AriSdk::ARI_UtaIdcSetLaaConfigReq_SDK *)v14);
  sub_10002A14C();
}

- (void)fetchLtePccFrequency:(t_s_UtaIdcLteNrCarrierInfoSet *)a3 pccUplinkFreq:(int64_t *)a4 pccUplinkBw:(double *)a5 pccDownlinkFreq:(int64_t *)a6 pccDownlinkBw:(double *)a7
{
  if (a3 && a4 && a6 && a7 && a3->var0)
  {
    int v7 = 0;
    int v8 = 0;
    uint64_t v9 = a3->var0 - 1;
    p_var3 = &a3->var1[0].var3;
    do
    {
      uint64_t v11 = v9;
      int v13 = *(p_var3 - 3);
      unsigned int v12 = *(p_var3 - 2);
      unsigned int v14 = *(p_var3 - 1);
      unsigned int v15 = *p_var3;
      if (v13) {
        BOOL v16 = 0;
      }
      else {
        BOOL v16 = (*p_var3 & 0xFFFFFFFE) == 2;
      }
      if (v16)
      {
        *a6 = v12 / 0x3E8uLL;
        *a7 = (double)v14 / 1000.0;
        int v7 = 1;
      }
      unsigned int v17 = v15 & 0xFFFFFFFD;
      if (v13) {
        BOOL v18 = 0;
      }
      else {
        BOOL v18 = v17 == 1;
      }
      if (v18)
      {
        *a4 = v12 / 0x3E8uLL;
        *a5 = (double)v14 / 1000.0;
        int v8 = 1;
      }
      if (v8 & v7) {
        break;
      }
      p_var3 += 4;
      uint64_t v9 = v11 - 1;
    }
    while (v11);
  }
}

- (void)fetchLteNrFrequency:(t_s_UtaIdcLteNrCarrierInfoSet *)a3 freqInfoXpc:(id)a4 carrierIdXpc:(id)a5
{
  xpc_object_t xarray = a4;
  id v7 = a5;
  if (a3 && xarray && v7 && a3->var0)
  {
    unint64_t v8 = 0;
    p_var3 = &a3->var1[0].var3;
    do
    {
      int64_t v10 = *(p_var3 - 3);
      int64_t v11 = *(p_var3 - 2);
      unsigned int v12 = *p_var3;
      unsigned int v13 = 1000 * *(p_var3 - 1);
      if ((*p_var3 & 0xFFFFFFFE) == 2)
      {
        xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_uint64(v14, "kWCMCellularNetworkConfiguration_BandInfoSet_DirectionMask", 2uLL);
        xpc_dictionary_set_int64(v14, "kWCMCellularNetworkConfiguration_BandInfoSet_CenterFreq", v11);
        xpc_dictionary_set_double(v14, "kWCMCellularNetworkConfiguration_BandInfoSet_Bandwidth", (double)v13);
        xpc_array_append_value(xarray, v14);

        xpc_object_t v15 = xpc_int64_create(v10);
        xpc_array_append_value(v7, v15);
      }
      if ((v12 & 0xFFFFFFFD) == 1)
      {
        xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_uint64(v16, "kWCMCellularNetworkConfiguration_BandInfoSet_DirectionMask", 1uLL);
        xpc_dictionary_set_int64(v16, "kWCMCellularNetworkConfiguration_BandInfoSet_CenterFreq", v11);
        xpc_dictionary_set_double(v16, "kWCMCellularNetworkConfiguration_BandInfoSet_Bandwidth", (double)v13);
        xpc_array_append_value(xarray, v16);

        xpc_object_t v17 = xpc_int64_create(v10);
        xpc_array_append_value(v7, v17);
      }
      p_var3 += 4;
      ++v8;
    }
    while (v8 < a3->var0);
  }
}

- (void)fetchLegacyRatFrequency:(t_s_UtaIdcLegacyRatCarrierInfoSet *)a3 freqInfoXpc:(id)a4
{
  xpc_object_t xarray = a4;
  if (a3 && xarray && a3->var0)
  {
    unint64_t v5 = 0;
    p_var3 = &a3->var1[0].var3;
    do
    {
      int64_t v7 = *(p_var3 - 2);
      unsigned int v8 = 1000 * *(p_var3 - 1);
      unsigned int v9 = *p_var3;
      if ((*p_var3 & 0xFFFFFFFE) == 2)
      {
        xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_uint64(v10, "kWCMCellularNetworkConfiguration_BandInfoSet_DirectionMask", 2uLL);
        xpc_dictionary_set_int64(v10, "kWCMCellularNetworkConfiguration_BandInfoSet_CenterFreq", v7);
        xpc_dictionary_set_double(v10, "kWCMCellularNetworkConfiguration_BandInfoSet_Bandwidth", (double)v8);
        xpc_array_append_value(xarray, v10);
      }
      if ((v9 & 0xFFFFFFFD) == 1)
      {
        xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_uint64(v11, "kWCMCellularNetworkConfiguration_BandInfoSet_DirectionMask", 1uLL);
        xpc_dictionary_set_int64(v11, "kWCMCellularNetworkConfiguration_BandInfoSet_CenterFreq", v7);
        xpc_dictionary_set_double(v11, "kWCMCellularNetworkConfiguration_BandInfoSet_Bandwidth", (double)v8);
        xpc_array_append_value(xarray, v11);
      }
      p_var3 += 4;
      ++v5;
    }
    while (v5 < a3->var0);
  }
}

- (id)assembleCellularConfigXpcMsg:(t_s_UtaIdcCellConfig *)a3
{
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v5, "kWCMCellularNetworkConfiguration_ULBandInfo_CenterFreq", 0);
  xpc_dictionary_set_double(v5, "kWCMCellularNetworkConfiguration_ULBandInfo_BandWidth", 0.0);
  xpc_dictionary_set_int64(v5, "kWCMCellularNetworkConfiguration_DLBandInfo_CenterFreq", 0);
  xpc_dictionary_set_double(v5, "kWCMCellularNetworkConfiguration_DLBandInfo_BandWidth", 0.0);
  int64_t var0 = a3->var3.var0;
  if (var0 != 240)
  {
    xpc_dictionary_set_int64(v5, "kWCMCellularNetworkConfiguration_TTDUL_DL", var0);
    xpc_dictionary_set_int64(v5, "kWCMCellularNetworkConfiguration_SubFrameFormat", a3->var3.var1);
    xpc_dictionary_set_int64(v5, "kWCMCellularNetworkConfiguration_FrameOffset", 0);
    xpc_dictionary_set_int64(v5, "kWCMCellularNetworkConfiguration_ULCPConfig", a3->var3.var2);
    xpc_dictionary_set_int64(v5, "kWCMCellularNetworkConfiguration_DLCPConfig", a3->var3.var3);
    +[WCM_Logging logLevel:3, @"Coex ARI driver: UtaIdcCellConfigEventIndCb DlUl_config=%u\n", a3->var3.var0 message];
    +[WCM_Logging logLevel:3, @"Coex ARI driver: UtaIdcCellConfigEventIndCb special_sub_frame=%u\n", a3->var3.var1 message];
    +[WCM_Logging logLevel:3, @"Coex ARI driver: UtaIdcCellConfigEventIndCb uplink_cyclic_prefix=%u\n", a3->var3.var2 message];
    +[WCM_Logging logLevel:3, @"Coex ARI driver: UtaIdcCellConfigEventIndCb downlink_cyclic_prefix=%u\n", a3->var3.var3 message];
  }
  if (a3->var2.var0)
  {
    int64_t v18 = 0;
    int64_t value = 0;
    double v16 = 0.0;
    double v17 = 0.0;
    [(WCM_AriCoexCommandHandler *)self fetchLtePccFrequency:&a3->var2 pccUplinkFreq:&value pccUplinkBw:&v17 pccDownlinkFreq:&v18 pccDownlinkBw:&v16];
    xpc_dictionary_set_int64(v5, "kWCMCellularNetworkConfiguration_ULBandInfo_CenterFreq", value);
    xpc_dictionary_set_double(v5, "kWCMCellularNetworkConfiguration_ULBandInfo_BandWidth", v17);
    xpc_dictionary_set_int64(v5, "kWCMCellularNetworkConfiguration_DLBandInfo_CenterFreq", v18);
    xpc_dictionary_set_double(v5, "kWCMCellularNetworkConfiguration_DLBandInfo_BandWidth", v16);
    xpc_object_t v7 = xpc_array_create(0, 0);
    xpc_object_t v8 = xpc_array_create(0, 0);
    [(WCM_AriCoexCommandHandler *)self fetchLteNrFrequency:&a3->var2 freqInfoXpc:v7 carrierIdXpc:v8];
    xpc_dictionary_set_value(v5, "kWCMCellularNetworkConfiguration_LTEBandInformationSet", v7);
    xpc_dictionary_set_value(v5, "kWCMCellularNetworkConfiguration_LTECarrierInformationSet", v8);
  }
  if (a3->var4.var0)
  {
    xpc_object_t v9 = xpc_array_create(0, 0);
    xpc_object_t v10 = xpc_array_create(0, 0);
    [(WCM_AriCoexCommandHandler *)self fetchLteNrFrequency:&a3->var4 freqInfoXpc:v9 carrierIdXpc:v10];
    xpc_dictionary_set_value(v5, "kWCMCellularNetworkConfiguration_NGCBandInformationSet", v9);
    xpc_dictionary_set_value(v5, "kWCMCellularNetworkConfiguration_NGCCarrierInformationSet", v10);
  }
  if (a3->var0.var0)
  {
    xpc_object_t v11 = xpc_array_create(0, 0);
    [(WCM_AriCoexCommandHandler *)self fetchLegacyRatFrequency:a3 freqInfoXpc:v11];
    xpc_dictionary_set_value(v5, "kWCMCellularNetworkConfiguration_GSMBandInformationSet", v11);
  }
  int v13 = a3->var1.var0;
  p_var1 = &a3->var1;
  if (v13)
  {
    xpc_object_t v14 = xpc_array_create(0, 0);
    [(WCM_AriCoexCommandHandler *)self fetchLegacyRatFrequency:p_var1 freqInfoXpc:v14];
    xpc_dictionary_set_value(v5, "kWCMCellularNetworkConfiguration_WCDMABandInformationSet", v14);
  }

  return v5;
}

- (void)getCellularNetworkConfig:(id)a3 SubId:(unsigned int)a4
{
  AriSdk::ARI_UtaIdcGetCellConfigReq_SDK::ARI_UtaIdcGetCellConfigReq_SDK((AriSdk::ARI_UtaIdcGetCellConfigReq_SDK *)v6);
  unsigned int v5 = a4;
  sub_10002A14C();
}

- (void)UtaIdcCellConfigEventIndHandle:(char *)a3 size:(unsigned int)a4
{
  AriSdk::ARI_UtaIdcCellConfigEventIndCb_SDK::ARI_UtaIdcCellConfigEventIndCb_SDK((AriSdk::ARI_UtaIdcCellConfigEventIndCb_SDK *)v10, (const unsigned __int8 *)a3, a4);
  if (ice::isARIResponseValid((ice *)v10, (const AriSdk::MsgBase *)0x49830000, v5))
  {
    +[WCM_Logging logLevel:3 message:@"Coex ARI driver: UtaIdcCellConfigEventIndCb received\n"];
    uint64_t v6 = AriSdk::ARI_UtaIdcCellConfigEventIndCb_SDK::unpack((AriSdk::ARI_UtaIdcCellConfigEventIndCb_SDK *)v10);
    if (v6)
    {
      +[WCM_Logging logLevel:3, @"Coex ARI driver: Failed to unpack UtaIdcCellConfigEventIndCb: %s (%u)", asString(), v6 message];
    }
    else
    {
      uint64_t v7 = v12;
      uint64_t v8 = *v11;
      +[WCM_Logging logLevel:3, @"Coex ARI driver: UtaIdcCellConfigEventIndCb SubId=%u\n", v8 message];
      xpc_object_t v9 = [(WCM_AriCoexCommandHandler *)self assembleCellularConfigXpcMsg:v7];
      [(WCM_AriCoexCommandHandler *)self sendMessage:300 withArgs:v9 withSubId:v8];
    }
  }
  else
  {
    +[WCM_Logging logLevel:0 message:@"Coex ARI driver ERROR: Invalid UtaIdcCellConfigEventIndCb received\n"];
  }
  AriSdk::ARI_UtaIdcCellConfigEventIndCb_SDK::~ARI_UtaIdcCellConfigEventIndCb_SDK((AriSdk::ARI_UtaIdcCellConfigEventIndCb_SDK *)v10);
}

- (void)configureAccReportMode
{
  int v4 = 1;
  AriSdk::ARI_IBIMsAccCurrentFreqInfoReq_SDK::ARI_IBIMsAccCurrentFreqInfoReq_SDK((AriSdk::ARI_IBIMsAccCurrentFreqInfoReq_SDK *)v3);
  int v2 = 0;
  sub_10002A14C();
}

- (void)appendDesenseFreqToXpcArray:(id)a3 DesenseFreq:(IBIAccFreqBandwidthInfo *)a4 Size:(unsigned int)a5
{
  xpc_object_t xarray = a3;
  if (xarray && a4 && a5)
  {
    uint64_t v7 = 0;
    p_var1 = &a4->var1;
    do
    {
      xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v9, "kWCMCellular_DesenseNetworkConfiguration_CenterFreq", *((void *)p_var1 - 1));
      xpc_dictionary_set_int64(v9, "kWCMCellular_DesenseNetworkConfiguration_Bandwidth", *p_var1);
      +[WCM_Logging logLevel:3, @"Coex ARI driver: IBIMsAccCurrentFreqInfoIndCb, freq[%u]=(freq:%llu, bw:%u)Hz \n", v7, *((void *)p_var1 - 1), *p_var1 message];
      xpc_array_append_value(xarray, v9);

      ++v7;
      p_var1 += 3;
    }
    while (a5 != v7);
  }
}

- (id)assembleDesenseCellularConfigXpcMsgwithDownlinkFreq:(IBIAccServingDLFreqBandwidthInfo *)a3 DownlinkFreqExt:(IBIAccServingDLFreqBandwidthInfo_ext *)a4 UlFreq:(IBIAccServingULFreqBandwidthInfo *)a5 UplinkFreqExt:(IBIAccServingULFreqBandwidthInfo_ext *)a6 SearchFreq:(IBIAccSearchFreqBandwidthInfo *)a7 HoppingFreq:(IBIAccHoppingFreqBandwidthInfo *)a8 NeighborFreq:(IBIAccNeighborFreqBandwidthInfo *)a9 RPLMNFreq:(IBIAccRPLMNFreqBandwidthInfo *)a10
{
  xpc_object_t v15 = a10;
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  if (a3->var0)
  {
    xpc_object_t v16 = xpc_array_create(0, 0);
    if (a3->var0 >= 4u) {
      uint64_t var0 = 4;
    }
    else {
      uint64_t var0 = a3->var0;
    }
    +[WCM_Logging logLevel:3, @"Coex ARI driver: IBIMsAccCurrentFreqInfoIndCb Downlink Freq num = %u\n", var0 message];
    [(WCM_AriCoexCommandHandler *)self appendDesenseFreqToXpcArray:v16 DesenseFreq:&a3->var0 + 4 Size:var0];
    if (a4->var0)
    {
      if (a4->var0 >= 0xAu) {
        uint64_t v18 = 10;
      }
      else {
        uint64_t v18 = a4->var0;
      }
      +[WCM_Logging logLevel:3, @"Coex ARI driver: IBIMsAccCurrentFreqInfoIndCb Downlink Freq Ext num = %u\n", v18 message];
      [(WCM_AriCoexCommandHandler *)self appendDesenseFreqToXpcArray:v16 DesenseFreq:&a4->var0 + 4 Size:v18];
    }
    xpc_dictionary_set_value(xdict, "kWCMCellular_DesenseFreqReport_DownlinkFrequency", v16);

    xpc_object_t v15 = a10;
  }
  if (a5->var0)
  {
    xpc_object_t v19 = xpc_array_create(0, 0);
    if (a5->var0 >= 2u) {
      uint64_t v20 = 2;
    }
    else {
      uint64_t v20 = a5->var0;
    }
    +[WCM_Logging logLevel:3, @"Coex ARI driver: IBIMsAccCurrentFreqInfoIndCb Uplink Freq num = %u\n", v20 message];
    [(WCM_AriCoexCommandHandler *)self appendDesenseFreqToXpcArray:v19 DesenseFreq:&a5->var0 + 4 Size:v20];
    if (a6->var0)
    {
      if (a6->var0 >= 0xAu) {
        uint64_t v21 = 10;
      }
      else {
        uint64_t v21 = a6->var0;
      }
      +[WCM_Logging logLevel:3, @"Coex ARI driver: IBIMsAccCurrentFreqInfoIndCb Uplink Freq Ext num = %u\n", v21 message];
      [(WCM_AriCoexCommandHandler *)self appendDesenseFreqToXpcArray:v19 DesenseFreq:&a6->var0 + 4 Size:v21];
    }
    xpc_dictionary_set_value(xdict, "kWCMCellular_DesenseFreqReport_UplinkFrequency", v19);
  }
  if (a7->var0)
  {
    xpc_object_t v22 = xpc_array_create(0, 0);
    if (a7->var0 >= 0x14u) {
      uint64_t v23 = 20;
    }
    else {
      uint64_t v23 = a7->var0;
    }
    +[WCM_Logging logLevel:3, @"Coex ARI driver: IBIMsAccCurrentFreqInfoIndCb Search Freq num = %u\n", v23 message];
    [(WCM_AriCoexCommandHandler *)self appendDesenseFreqToXpcArray:v22 DesenseFreq:&a7->var0 + 4 Size:v23];
    xpc_dictionary_set_value(xdict, "kWCMCellular_DesenseFreqReport_SearchFrequency", v22);
  }
  if (a9->var0)
  {
    xpc_object_t v24 = xpc_array_create(0, 0);
    if (a9->var0 >= 0x64u) {
      uint64_t v25 = 100;
    }
    else {
      uint64_t v25 = a9->var0;
    }
    +[WCM_Logging logLevel:3, @"Coex ARI driver: IBIMsAccCurrentFreqInfoIndCb Neighbor Freq num = %u\n", v25 message];
    [(WCM_AriCoexCommandHandler *)self appendDesenseFreqToXpcArray:v24 DesenseFreq:&a9->var0 + 4 Size:v25];
    xpc_dictionary_set_value(xdict, "kWCMCellular_DesenseFreqReport_NeighborFrequency", v24);
  }
  if (a8->var0)
  {
    xpc_object_t v26 = xpc_array_create(0, 0);
    if (a8->var0 >= 0x40u) {
      uint64_t v27 = 64;
    }
    else {
      uint64_t v27 = a8->var0;
    }
    +[WCM_Logging logLevel:3, @"Coex ARI driver: IBIMsAccCurrentFreqInfoIndCb GSM Hopping Freq num = %u\n", v27 message];
    [(WCM_AriCoexCommandHandler *)self appendDesenseFreqToXpcArray:v26 DesenseFreq:&a8->var0 + 4 Size:v27];
    xpc_dictionary_set_value(xdict, "kWCMCellular_DesenseFreqReport_HoppingFrequency", v26);
  }
  if (v15->var0)
  {
    xpc_object_t v28 = xpc_array_create(0, 0);
    if (v15->var0 >= 0x46u) {
      uint64_t v29 = 70;
    }
    else {
      uint64_t v29 = v15->var0;
    }
    +[WCM_Logging logLevel:3, @"Coex ARI driver: IBIMsAccCurrentFreqInfoIndCb RPLMN Freq num = %u\n", v29 message];
    [(WCM_AriCoexCommandHandler *)self appendDesenseFreqToXpcArray:v28 DesenseFreq:&v15->var0 + 4 Size:v29];
    xpc_dictionary_set_value(xdict, "kWCMCellular_DesenseFreqReport_RplmnFrequency", v28);
  }

  return xdict;
}

- (void)desenseCellConfigEventIndHandle:(char *)a3 size:(unsigned int)a4
{
  AriSdk::ARI_IBIMsAccCurrentFreqInfoIndCb_SDK::ARI_IBIMsAccCurrentFreqInfoIndCb_SDK((AriSdk::ARI_IBIMsAccCurrentFreqInfoIndCb_SDK *)v9, (const unsigned __int8 *)a3, a4);
  if (ice::isARIResponseValid((ice *)v9, (const AriSdk::MsgBase *)0x25900000, v5))
  {
    +[WCM_Logging logLevel:3 message:@"Coex ARI driver: IBIMsAccCurrentFreqInfoIndCb received\n"];
    uint64_t v6 = AriSdk::ARI_IBIMsAccCurrentFreqInfoIndCb_SDK::unpack((AriSdk::ARI_IBIMsAccCurrentFreqInfoIndCb_SDK *)v9);
    if (v6)
    {
      +[WCM_Logging logLevel:3, @"Coex ARI driver: Failed to unpack IBIMsAccCurrentFreqInfoIndCb: %s (%u)", asString(), v6 message];
    }
    else
    {
      uint64_t v7 = *v10;
      +[WCM_Logging logLevel:3, @"Coex ARI driver: IBIMsAccCurrentFreqInfoIndCb SubId=%u\n", v7 message];
      uint64_t v8 = [(WCM_AriCoexCommandHandler *)self assembleDesenseCellularConfigXpcMsgwithDownlinkFreq:v11 DownlinkFreqExt:v17 UlFreq:v12 UplinkFreqExt:v18 SearchFreq:v13 HoppingFreq:v14 NeighborFreq:v15 RPLMNFreq:v16];
      [(WCM_AriCoexCommandHandler *)self sendMessage:399 withArgs:v8 withSubId:v7];
    }
  }
  else
  {
    +[WCM_Logging logLevel:0 message:@"Coex ARI driver ERROR: Invalid IBIMsAccCurrentFreqInfoIndCb received\n"];
  }
  AriSdk::ARI_IBIMsAccCurrentFreqInfoIndCb_SDK::~ARI_IBIMsAccCurrentFreqInfoIndCb_SDK((AriSdk::ARI_IBIMsAccCurrentFreqInfoIndCb_SDK *)v9);
}

- (void)printGnssImdConfig:(t_s_UtaIdcCellImdGnssMitigationPolicyConfig *)a3
{
  if (a3)
  {
    +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, protect_low_priority_background_gnss=%d, deny_voice_call_protection=%d", a3->var1, a3->var2 message];
    +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, mitigation_timer_ms=%u, lqm_threshold=%d", a3->var3, a3->var4 message];
    for (uint64_t i = 0; i != 32; ++i)
    {
      if (a3->var0[i].var0 == 1)
      {
        unsigned int v5 = &a3->var0[i];
        +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, policy[%d]: imd_type=%u, gnss_L5_preferred_tuner_allowed=%d, parallel_mitigation_allowed=%d", i, v5->var3, v5->var5, v5->var6 message];
        +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, policy[%d]: gnss_victim_center_freq_khz=%u, gnss_victim_bandwidth_khz=%u", i, v5->var4.var0, v5->var4.var1 message];
        +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, policy[%d]: aggressor1: tech_bitmap=%u, center_freq_khz=%u, bandwidth_khz=%u", i, v5->var1.var0.var0, v5->var1.var0.var1.var0, v5->var1.var0.var1.var1 message];
        uint64_t v6 = 0;
        char v7 = 1;
        do
        {
          char v8 = v7;
          if (a3->var0[i].var1.var1[v6].var0 == 1)
          {
            xpc_object_t v9 = (unsigned int *)((char *)&a3->var0[i] + 16 * v6);
            +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, policy[%d]: aggressor1_policy[%d]: cellular_aggressor_antenna_bitmap=%u", i, v6, v9[5] message];
            +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, policy[%d]: aggressor1_policy[%d]: cellular_tx_power_cap=%d, mitigation_type=%u", i, v6, v9[6], v9[7] message];
          }
          char v7 = 0;
          uint64_t v6 = 1;
        }
        while ((v8 & 1) != 0);
        +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, policy[%d]: aggressor2: tech_bitmap=%u, center_freq_khz=%u, bandwidth_khz=%u", i, a3->var0[i].var2.var0.var0, a3->var0[i].var2.var0.var1.var0, a3->var0[i].var2.var0.var1.var1 message];
        uint64_t v10 = 0;
        char v11 = 1;
        do
        {
          char v12 = v11;
          if (a3->var0[i].var2.var1[v10].var0 == 1)
          {
            uint64_t v13 = (unsigned int *)((char *)&a3->var0[i] + 16 * v10);
            +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, policy[%d]: aggressor2_policy[%d]: cellular_aggressor_antenna_bitmap=%u", i, v10, v13[16] message];
            +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, policy[%d]: aggressor2_policy[%d]: cellular_tx_power_cap=%d, mitigation_type=%u", i, v10, v13[17], v13[18] message];
          }
          char v11 = 0;
          uint64_t v10 = 1;
        }
        while ((v12 & 1) != 0);
      }
    }
  }
}

- (void)handleGnssImdAntBlockPowerLimitConfig:(id)a3
{
  v108 = (void *)__chkstk_darwin(self, a2, a3);
  id v4 = v3;
  unsigned int v5 = v4;
  if (v4)
  {
    uint64_t v6 = 0;
    int v110 = 0;
    unsigned int v114 = 0;
    do
    {
      char v7 = &v111[v6];
      *(_DWORD *)char v7 = 0;
      *((void *)v7 + 13) = 0;
      *((_DWORD *)v7 + 4) = 0;
      *((_DWORD *)v7 + 15) = 0;
      *(void *)(v7 + 28) = 3;
      *((_DWORD *)v7 + 11) = 3;
      *((void *)v7 + 9) = 3;
      v6 += 112;
      *((void *)v7 + 11) = 3;
    }
    while (v6 != 3584);
    v113[878] = [v4 mProtectGnssLowPriority:3];
    v113[879] = [v5 mDenyVoiceProtect];
    v113[880] = [v5 mMitigationTimer_ms];
    if (objc_msgSend(v108, "LQMEnumCheck:", objc_msgSend(v5, "mLqmThreshold")))
    {
      unsigned int v114 = [v5 mLqmThreshold];
      char v8 = [v5 mPolicy];
      unint64_t v9 = (unint64_t)[v8 count];

      if (v9 < 0x21)
      {
        if (!v9)
        {
LABEL_29:
          [v108 printGnssImdConfig:v111];
          AriSdk::ARI_UtaIdcSetCellImdGnssMitigationConfigReq_SDK::ARI_UtaIdcSetCellImdGnssMitigationConfigReq_SDK((AriSdk::ARI_UtaIdcSetCellImdGnssMitigationConfigReq_SDK *)v109);
          sub_10002A14C();
        }
      }
      else
      {
        +[WCM_Logging logLevel:0, @"Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, too many policies (%llu)", v9 message];
        unint64_t v9 = 32;
      }
      uint64_t v10 = 0;
      v105 = &v112;
      unint64_t v103 = v9;
      v104 = v113;
      while (1)
      {
        char v11 = [v5 mPolicy];
        char v12 = [v11 objectAtIndexedSubscript:v10];
        unsigned __int8 v13 = [v108 ImdTypeEnumCheck:[v12 mImdType]];

        if ((v13 & 1) == 0) {
          break;
        }
        *(_DWORD *)&v111[112 * v10] = 1;
        uint64_t v14 = [v5 mPolicy];
        uint64_t v15 = [v14 objectAtIndexedSubscript:v10];
        v113[28 * v10 + 5] = [v15 mImdType];

        uint64_t v16 = [v5 mPolicy];
        uint64_t v17 = [v16 objectAtIndexedSubscript:v10];
        v113[28 * v10 + 8] = [v17 mGnssL5TunerAllowed];

        uint64_t v18 = [v5 mPolicy];
        xpc_object_t v19 = [v18 objectAtIndexedSubscript:v10];
        v113[28 * v10 + 9] = [v19 mParallelMitigationAllowed];

        uint64_t v20 = [v5 mPolicy];
        uint64_t v21 = [v20 objectAtIndexedSubscript:v10];
        v113[28 * v10 + 6] = [v21 mGnssVictimFreq_KHz];

        xpc_object_t v22 = [v5 mPolicy];
        uint64_t v23 = [v22 objectAtIndexedSubscript:v10];
        v113[28 * v10 + 7] = [v23 mGnssVictimBw_KHz];

        xpc_object_t v24 = [v5 mPolicy];
        uint64_t v25 = [v24 objectAtIndexedSubscript:v10];
        xpc_object_t v26 = [v25 mCellAggressor1];
        uint64_t v27 = [v26 mBandPolicy];
        id v28 = [v27 count];

        uint64_t v29 = [v5 mPolicy];
        __int16 v30 = [v29 objectAtIndexedSubscript:v10];
        BOOL v31 = [v30 mCellAggressor2];
        __int16 v32 = [v31 mBandPolicy];
        id v33 = [v32 count];

        uint64_t v34 = 2;
        if ((unint64_t)v28 >= 2) {
          uint64_t v35 = 2;
        }
        else {
          uint64_t v35 = (uint64_t)v28;
        }
        if ((unint64_t)v33 < 2) {
          uint64_t v34 = (uint64_t)v33;
        }
        uint64_t v106 = v34;
        uint64_t v107 = v35;
        int v36 = [v5 mPolicy];
        char v37 = [v36 objectAtIndexedSubscript:v10];
        char v38 = [v37 mCellAggressor1];
        char v39 = &v111[112 * v10];
        *((_WORD *)v39 + 2) = (unsigned __int16)[v38 mCellularCoexTech];
        v39 += 4;

        char v40 = [v5 mPolicy];
        double v41 = [v40 objectAtIndexedSubscript:v10];
        double v42 = [v41 mCellAggressor1];
        *((_DWORD *)v39 + 1) = [v42 mCellularFrequencyKHz];

        double v43 = [v5 mPolicy];
        uint64_t v44 = [v43 objectAtIndexedSubscript:v10];
        uint64_t v45 = [v44 mCellAggressor1];
        *((_DWORD *)v39 + 2) = [v45 mCellularBandwidthKHz];

        unsigned __int8 v46 = [v5 mPolicy];
        int v47 = [v46 objectAtIndexedSubscript:v10];
        v48 = [v47 mCellAggressor2];
        __int16 v49 = &v111[112 * v10];
        *((_WORD *)v49 + 24) = (unsigned __int16)[v48 mCellularCoexTech];
        v49 += 48;

        v50 = [v5 mPolicy];
        v51 = [v50 objectAtIndexedSubscript:v10];
        v52 = [v51 mCellAggressor2];
        *((_DWORD *)v49 + 1) = [v52 mCellularFrequencyKHz];

        v53 = [v5 mPolicy];
        v54 = [v53 objectAtIndexedSubscript:v10];
        v55 = [v54 mCellAggressor2];
        *((_DWORD *)v49 + 2) = [v55 mCellularBandwidthKHz];

        if (v107)
        {
          uint64_t v56 = 0;
          v57 = v105;
          do
          {
            v58 = [v5 mPolicy];
            v59 = [v58 objectAtIndexedSubscript:v10];
            v60 = [v59 mCellAggressor1];
            v61 = [v60 mBandPolicy];
            v62 = [v61 objectAtIndexedSubscript:v56];
            id v63 = [v62 mMitigationType];

            if (([v108 mitigationTypeEnumCheck:v63] & 1) == 0) {
              goto LABEL_27;
            }
            *(v57 - 3) = 1;
            v64 = [v5 mPolicy];
            v65 = [v64 objectAtIndexedSubscript:v10];
            v66 = [v65 mCellAggressor1];
            v67 = [v66 mBandPolicy];
            v68 = [v67 objectAtIndexedSubscript:v56];
            *(v57 - 2) = [v68 mCellularAntBitmap];

            v69 = [v5 mPolicy];
            v70 = [v69 objectAtIndexedSubscript:v10];
            v71 = [v70 mCellAggressor1];
            v72 = [v71 mBandPolicy];
            v73 = [v72 objectAtIndexedSubscript:v56];
            *(v57 - 1) = [v73 mCellularTxPowerCap];

            v74 = [v5 mPolicy];
            v75 = [v74 objectAtIndexedSubscript:v10];
            v76 = [v75 mCellAggressor1];
            v77 = [v76 mBandPolicy];
            v78 = [v77 objectAtIndexedSubscript:v56];
            int *v57 = [v78 mMitigationType];
            v57 += 4;
          }
          while (v107 != ++v56);
        }
        if (v106)
        {
          uint64_t v79 = 0;
          v80 = v104;
          while (1)
          {
            v81 = [v5 mPolicy];
            v82 = [v81 objectAtIndexedSubscript:v10];
            v83 = [v82 mCellAggressor2];
            v84 = [v83 mBandPolicy];
            v85 = [v84 objectAtIndexedSubscript:v79];
            id v63 = [v85 mMitigationType];

            if (([v108 mitigationTypeEnumCheck:v63] & 1) == 0) {
              break;
            }
            *(v80 - 3) = 1;
            v86 = [v5 mPolicy];
            v87 = [v86 objectAtIndexedSubscript:v10];
            v88 = [v87 mCellAggressor2];
            v89 = [v88 mBandPolicy];
            v90 = [v89 objectAtIndexedSubscript:v79];
            *(v80 - 2) = [v90 mCellularAntBitmap];

            v91 = [v5 mPolicy];
            v92 = [v91 objectAtIndexedSubscript:v10];
            v93 = [v92 mCellAggressor2];
            v94 = [v93 mBandPolicy];
            v95 = [v94 objectAtIndexedSubscript:v79];
            *(v80 - 1) = [v95 mCellularTxPowerCap];

            v96 = [v5 mPolicy];
            v97 = [v96 objectAtIndexedSubscript:v10];
            v98 = [v97 mCellAggressor2];
            v99 = [v98 mBandPolicy];
            v100 = [v99 objectAtIndexedSubscript:v79];
            _DWORD *v80 = [v100 mMitigationType];
            v80 += 4;

            if (v106 == ++v79) {
              goto LABEL_25;
            }
          }
LABEL_27:
          +[WCM_Logging logLevel:0, @"Coex ARI driver: Set GNSS IMD Antenna Blk Policy, invalid mitigationType=%u, API UtaIdcSetCellImdGnssMitigationConfigReq failed", v63 message];
          goto LABEL_31;
        }
LABEL_25:
        ++v10;
        v104 += 28;
        v105 += 28;
        if (v10 == v103) {
          goto LABEL_29;
        }
      }
      v101 = [v5 mPolicy];
      v102 = [v101 objectAtIndexedSubscript:v10];
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, @"Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, invalid imdType=%u, API UtaIdcSetCellImdGnssMitigationConfigReq failed", [v102 mImdType]);
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, @"Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, invalid lqmThreshold=%u, API UtaIdcSetCellImdGnssMitigationConfigReq failed", [v5 mLqmThreshold]);
    }
  }
  else
  {
    +[WCM_Logging logLevel:0 message:@"Coex ARI driver ERROR: Invalid AntBlockPowerLimitPolicyClientGnssImd received\n"];
  }
LABEL_31:
}

- (void)handleRc1DynamicPolicy:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  char v7 = v6;
  uint64_t v23 = v4;
  int v35 = v4;
  if (v6)
  {
    id v22 = v6;
    if ([v6 count])
    {
      uint64_t v8 = 0;
      int v33 = 20;
      do
      {
        unint64_t v9 = (_DWORD *)((char *)&v32[1] + v8 + 4);
        *unint64_t v9 = 0;
        v9[9] = 3;
        v9[5] = 127;
        v8 += 44;
      }
      while (v8 != 704);
      v32[0] = 0;
      unsigned __int8 v31 = 0;
      if ([(WCM_AriCoexCache *)self->mCache get:@"UWB_LQM_Threshold" value_uint64:v32 subId:v4])
      {
        int v33 = v32[0];
        +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set UWB RT Policy, LQM_Threshold = %u", v4, v32[0] message];
      }
      if ([(WCM_AriCoexCache *)self->mCache get:@"UWB_PC1_Deny_Voice_Protection" value_BOOL:&v31 subId:v4])
      {
        int v34 = v31;
        +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set UWB RT Policy, Deny_Voice_Protection = %d", v4, v31 message];
      }
      unsigned int v10 = 0;
      for (uint64_t i = self; ; self = i)
      {
        uint64_t v11 = v10;
        if ((unint64_t)[v7 count] <= v10)
        {
          AriSdk::ARI_UtaIdcSetUwbRtActivityMitigationConfigReqV2_SDK::ARI_UtaIdcSetUwbRtActivityMitigationConfigReqV2_SDK((AriSdk::ARI_UtaIdcSetUwbRtActivityMitigationConfigReqV2_SDK *)v30);
          sub_10002A14C();
        }
        char v12 = [v7 objectAtIndex:v10];
        *((_DWORD *)&v32[1] + 11 * v10 + 1) = 1;
        id v13 = [v12 Rc1PriorityBitmap];
        *((_DWORD *)&v32[2] + 11 * v11) = v13;
        unsigned __int16 v29 = (unsigned __int16)[v12 nbChannelToAvoidStart];
        *((_WORD *)&v32[2] + 22 * v11 + 2) = v29;
        unsigned __int16 v28 = (unsigned __int16)[v12 nbChannelToAvoidEnd];
        *((_WORD *)&v32[2] + 22 * v11 + 3) = v28;
        id v27 = [v12 Rc1AntBitmap];
        *((_DWORD *)&v32[3] + 11 * v11) = v27;
        id v26 = [v12 cellBand];
        *((_DWORD *)&v32[3] + 11 * v11 + 1) = v26;
        if (!-[WCM_AriCoexCommandHandler coexTechEnumCheck:](self, "coexTechEnumCheck:", [v12 bandInfoType]))
        {
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, @"Coex ARI driver(SubId %u): Set UWB RT Policy, invalid coexTech=%u, API UtaIdcSetUwbRtActivityMitigationConfigReq failed", v23, [v12 bandInfoType]);
          goto LABEL_17;
        }
        id v24 = [v12 bandInfoType];
        *((_DWORD *)&v32[4] + 11 * v11) = v24;
        unsigned int v14 = [v12 uplinkHighFreq_Hz];
        unsigned int v15 = [v12 uplinkLowFreq_Hz];
        unint64_t v16 = (v14 - v15) / 0x3E8uLL;
        uint64_t v17 = (v14 - v15) / 0x7D0 + ((unint64_t)[v12 uplinkLowFreq_Hz] / 0x3E8);
        uint64_t v18 = (char *)&v32[1] + 44 * v11 + 4;
        *((_DWORD *)v18 + 6) = v17;
        *((_DWORD *)v18 + 7) = v16;
        id v19 = [v12 cellAgressorAntBitmap];
        *((_DWORD *)&v32[5] + 11 * v11 + 1) = v19;
        if (!-[WCM_AriCoexCommandHandler mitigationTypeEnumCheck:](i, "mitigationTypeEnumCheck:", [v12 mitigationType]))break; {
        id v20 = [v12 mitigationType];
        }
        *((_DWORD *)&v32[6] + 11 * v11) = v20;
        id v21 = [v12 cellTxPowerCap_16th_dBm];
        *((_DWORD *)&v32[6] + 11 * v11 + 1) = v21;
        +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set UWB RT Policy[%u], priority_bitmap = 0x%X, ", v23, v11, v13 message];
        +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set UWB RT Policy[%u], nb_channel_start = %u, nb_channel_end = %u", v23, v11, v29, v28 message];
        +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set UWB RT Policy[%u], uwb_antenna_bitmap = %u, cellular_band = %u", v23, v11, v27, v26 message];
        +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set UWB RT Policy[%u], coex_tech = %u, cellular_aggressor_antenna_bitmap = 0x%X", v23, v11, v24, v19 message];
        +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set UWB RT Policy[%u], center_freq_khz = %u, bandwidth_khz = %u", v23, v11, v17, v16 message];
        +[WCM_Logging logLevel:3, @"Coex ARI driver(SubId %u): Set UWB RT Policy[%u], mitigation_type = %u, cellular_tx_power_cap(1/16dBm) = %d", v23, v11, v20, v21 message];

        unsigned int v10 = v11 + 1;
        char v7 = v22;
      }
      char v7 = v22;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, @"Coex ARI driver(SubId %u): Set UWB RT Policy, invalid mitigationType=%u, API UtaIdcSetUwbRtActivityMitigationConfigReq failed", v23, [v12 mitigationType]);
LABEL_17:
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mAntBlockPolicy, 0);
  objc_storeStrong((id *)&self->mCellularController, 0);
  objc_storeStrong((id *)&self->mQueue, 0);
  fObuint64_t j = self->mIceClientQueue.fObj.fObj;
  self->mIceClientQueue.fObj.fObuint64_t j = 0;

  objc_storeStrong((id *)&self->mCache, 0);
  cntrl = self->mIceClient.__cntrl_;
  if (cntrl)
  {
    sub_1000357EC((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end