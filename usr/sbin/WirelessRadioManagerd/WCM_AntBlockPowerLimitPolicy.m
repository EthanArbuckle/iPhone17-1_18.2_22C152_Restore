@interface WCM_AntBlockPowerLimitPolicy
- (AntBlockPowerLimitPolicyClientGnssImd)mGnssImdPolicy;
- (AntBlockPowerLimitPolicyClientUwb)mUwbPolicy;
- (AntBlockPowerLimitPolicyClientWiFiCam)mE85Policy;
- (AntBlockPowerLimitPolicyClientWiFiCam)mFaceIdCamPolicy;
- (AntBlockPowerLimitPolicyClientWiFiCam)mFrontCamPolicy;
- (AntBlockPowerLimitPolicyClientWiFiCam)mRearTeleCamPolicy;
- (AntBlockPowerLimitPolicyClientWiFiCam)mRearUltraWideCamPolicy;
- (AntBlockPowerLimitPolicyClientWiFiCam)mRearWideCamPolicy;
- (AntBlockPowerLimitPolicyClientWiFiCam)mWiFiPolicy;
- (WCM_AntBlockPowerLimitPolicy)init;
- (WCM_AntBlockPowerLimitPolicy)initWithPlatformId:(unint64_t)a3;
- (id)getAntBlockConfigGnssImdClient;
- (id)getAntBlockConfigXpcMsgOnClient:(unsigned int)a3;
- (void)decodeUwbXpcMsg:(id)a3;
- (void)decodeWiFiCamXpcMsg:(id)a3 client:(unsigned int)a4;
- (void)readAntBlockPowerLimitPolicyPlist;
- (void)sendPolicy;
- (void)setME85Policy:(id)a3;
- (void)setMFaceIdCamPolicy:(id)a3;
- (void)setMFrontCamPolicy:(id)a3;
- (void)setMGnssImdPolicy:(id)a3;
- (void)setMRearTeleCamPolicy:(id)a3;
- (void)setMRearUltraWideCamPolicy:(id)a3;
- (void)setMRearWideCamPolicy:(id)a3;
- (void)setMUwbPolicy:(id)a3;
- (void)setMWiFiPolicy:(id)a3;
- (void)setPlatform:(unint64_t)a3;
@end

@implementation WCM_AntBlockPowerLimitPolicy

- (WCM_AntBlockPowerLimitPolicy)init
{
  v22.receiver = self;
  v22.super_class = (Class)WCM_AntBlockPowerLimitPolicy;
  v2 = [(WCM_AntBlockPowerLimitPolicy *)&v22 init];
  v3 = [[AntBlockPowerLimitPolicyClientWiFiCam alloc] initWithClient:0];
  mWiFiPolicy = v2->_mWiFiPolicy;
  v2->_mWiFiPolicy = v3;

  v5 = [[AntBlockPowerLimitPolicyClientWiFiCam alloc] initWithClient:2];
  mFrontCamPolicy = v2->_mFrontCamPolicy;
  v2->_mFrontCamPolicy = v5;

  v7 = [[AntBlockPowerLimitPolicyClientWiFiCam alloc] initWithClient:3];
  mFaceIdCamPolicy = v2->_mFaceIdCamPolicy;
  v2->_mFaceIdCamPolicy = v7;

  v9 = [[AntBlockPowerLimitPolicyClientWiFiCam alloc] initWithClient:5];
  mRearTeleCamPolicy = v2->_mRearTeleCamPolicy;
  v2->_mRearTeleCamPolicy = v9;

  v11 = [[AntBlockPowerLimitPolicyClientWiFiCam alloc] initWithClient:8];
  mRearWideCamPolicy = v2->_mRearWideCamPolicy;
  v2->_mRearWideCamPolicy = v11;

  v13 = [[AntBlockPowerLimitPolicyClientWiFiCam alloc] initWithClient:4];
  mRearUltraWideCamPolicy = v2->_mRearUltraWideCamPolicy;
  v2->_mRearUltraWideCamPolicy = v13;

  v15 = objc_alloc_init(AntBlockPowerLimitPolicyClientUwb);
  mUwbPolicy = v2->_mUwbPolicy;
  v2->_mUwbPolicy = v15;

  v17 = [[AntBlockPowerLimitPolicyClientWiFiCam alloc] initWithClient:6];
  mE85Policy = v2->_mE85Policy;
  v2->_mE85Policy = v17;

  v19 = objc_alloc_init(AntBlockPowerLimitPolicyClientGnssImd);
  mGnssImdPolicy = v2->_mGnssImdPolicy;
  v2->_mGnssImdPolicy = v19;

  v2->mPlatformId = 0;
  return v2;
}

- (WCM_AntBlockPowerLimitPolicy)initWithPlatformId:(unint64_t)a3
{
  v25.receiver = self;
  v25.super_class = (Class)WCM_AntBlockPowerLimitPolicy;
  v4 = [(WCM_AntBlockPowerLimitPolicy *)&v25 init];
  v5 = [[AntBlockPowerLimitPolicyClientWiFiCam alloc] initWithClient:0];
  mWiFiPolicy = v4->_mWiFiPolicy;
  v4->_mWiFiPolicy = v5;

  v7 = [[AntBlockPowerLimitPolicyClientWiFiCam alloc] initWithClient:2];
  mFrontCamPolicy = v4->_mFrontCamPolicy;
  v4->_mFrontCamPolicy = v7;

  v9 = [[AntBlockPowerLimitPolicyClientWiFiCam alloc] initWithClient:3];
  mFaceIdCamPolicy = v4->_mFaceIdCamPolicy;
  v4->_mFaceIdCamPolicy = v9;

  v11 = [[AntBlockPowerLimitPolicyClientWiFiCam alloc] initWithClient:5];
  mRearTeleCamPolicy = v4->_mRearTeleCamPolicy;
  v4->_mRearTeleCamPolicy = v11;

  v13 = [[AntBlockPowerLimitPolicyClientWiFiCam alloc] initWithClient:8];
  mRearWideCamPolicy = v4->_mRearWideCamPolicy;
  v4->_mRearWideCamPolicy = v13;

  v15 = [[AntBlockPowerLimitPolicyClientWiFiCam alloc] initWithClient:4];
  mRearUltraWideCamPolicy = v4->_mRearUltraWideCamPolicy;
  v4->_mRearUltraWideCamPolicy = v15;

  v17 = objc_alloc_init(AntBlockPowerLimitPolicyClientUwb);
  mUwbPolicy = v4->_mUwbPolicy;
  v4->_mUwbPolicy = v17;

  v19 = [[AntBlockPowerLimitPolicyClientWiFiCam alloc] initWithClient:6];
  mE85Policy = v4->_mE85Policy;
  v4->_mE85Policy = v19;

  v21 = objc_alloc_init(AntBlockPowerLimitPolicyClientGnssImd);
  mGnssImdPolicy = v4->_mGnssImdPolicy;
  v4->_mGnssImdPolicy = v21;

  mPlistFileName = v4->mPlistFileName;
  v4->mPlatformId = a3;
  v4->mPlistFileName = 0;

  [(WCM_AntBlockPowerLimitPolicy *)v4 readAntBlockPowerLimitPolicyPlist];
  return v4;
}

- (void)setPlatform:(unint64_t)a3
{
  self->mPlatformId = a3;
}

- (void)readAntBlockPowerLimitPolicyPlist
{
  mPlistFileName = self->mPlistFileName;
  if (mPlistFileName)
  {
    uint64_t v18 = 0;
    v4 = sub_100095D24((uint64_t)mPlistFileName, @"plist");
    id v17 = 0;
    v5 = +[NSPropertyListSerialization propertyListWithData:v4 options:2 format:&v18 error:&v17];
    id v6 = v17;
    if (v5) {
      CFStringRef v7 = @"init: Antenna blocking policy Plist File Found";
    }
    else {
      CFStringRef v7 = @"init: No antenna blocking policy Plist File Found";
    }
    +[WCM_Logging logLevel:3 message:v7];
    v8 = [v5 objectForKey:@"Wifi_Client"];
    if (v8) {
      [(AntBlockPowerLimitPolicyClientWiFiCam *)self->_mWiFiPolicy extractPolicy:v8];
    }
    v9 = [v5 objectForKey:@"Front_Camera_Client"];

    if (v9) {
      [(AntBlockPowerLimitPolicyClientWiFiCam *)self->_mFrontCamPolicy extractPolicy:v9];
    }
    v10 = [v5 objectForKey:@"FaceId_Camera_Client"];

    if (v10) {
      [(AntBlockPowerLimitPolicyClientWiFiCam *)self->_mFaceIdCamPolicy extractPolicy:v10];
    }
    v11 = [v5 objectForKey:@"Rear_Ultra_Wide_Camera_Client"];

    if (v11) {
      [(AntBlockPowerLimitPolicyClientWiFiCam *)self->_mRearUltraWideCamPolicy extractPolicy:v11];
    }
    v12 = [v5 objectForKey:@"Rear_Wide_Camera_Client"];

    if (v12) {
      [(AntBlockPowerLimitPolicyClientWiFiCam *)self->_mRearWideCamPolicy extractPolicy:v12];
    }
    v13 = [v5 objectForKey:@"Rear_Tele_Camera_Client"];

    if (v13) {
      [(AntBlockPowerLimitPolicyClientWiFiCam *)self->_mRearTeleCamPolicy extractPolicy:v13];
    }
    v14 = [v5 objectForKey:@"Uwb_Client"];

    if (v14) {
      [(AntBlockPowerLimitPolicyClientUwb *)self->_mUwbPolicy extractPolicy:v14];
    }
    v15 = [v5 objectForKey:@"E85_Client"];

    if (v15) {
      [(AntBlockPowerLimitPolicyClientWiFiCam *)self->_mE85Policy extractPolicy:v15];
    }
    v16 = [v5 objectForKey:@"GNSS_IMD_Client"];

    if (v16) {
      [(AntBlockPowerLimitPolicyClientGnssImd *)self->_mGnssImdPolicy extractPolicy:v16];
    }
  }
  else
  {
    +[WCM_Logging logLevel:0 message:@"init: Error: Antenna blocking, power limiting policy plist name is nil!"];
  }
}

- (void)sendPolicy
{
  v3 = +[WCM_PolicyManager singleton];
  id v8 = [v3 cellularController];

  if (v8)
  {
    v4 = [(AntBlockPowerLimitPolicyClientWiFiCam *)self->_mWiFiPolicy constructXpcMessage];
    if (v4) {
      [v8 sendMessage:1225 withArgs:v4];
    }
    v5 = [(AntBlockPowerLimitPolicyClientWiFiCam *)self->_mFrontCamPolicy constructXpcMessage];
    if (v5) {
      [v8 sendMessage:1227 withArgs:v5];
    }
    id v6 = [(AntBlockPowerLimitPolicyClientWiFiCam *)self->_mFaceIdCamPolicy constructXpcMessage];
    if (v6) {
      [v8 sendMessage:1227 withArgs:v6];
    }
    CFStringRef v7 = [(AntBlockPowerLimitPolicyClientUwb *)self->_mUwbPolicy constructXpcMessage];
    if (v7) {
      [v8 sendMessage:1226 withArgs:v7];
    }
  }
}

- (id)getAntBlockConfigXpcMsgOnClient:(unsigned int)a3
{
  if (a3 <= 8 && ((0x17Fu >> a3) & 1) != 0)
  {
    v5 = [*(id *)((char *)&self->super.isa + qword_1001EAF98[a3]) constructXpcMessage:v3];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)getAntBlockConfigGnssImdClient
{
  return self->_mGnssImdPolicy;
}

- (void)decodeWiFiCamXpcMsg:(id)a3 client:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  xpc_object_t xdict = a3;
  BOOL v5 = xpc_dictionary_get_BOOL(xdict, "kWCMCellularSetAntBlocking_DenyProtectVoice");
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "kWCMCellularSetAntBlocking_MitigationTimer");
  if ((v4 & 0xFFFFFFFE) == 2)
  {
    +[WCM_Logging logLevel:3, @"Coex ARI driver: Set Client%d Antenna Blk Policy, cameraId = %llu", v4, xpc_dictionary_get_uint64(xdict, "kWCMCellularSetAntBlocking_CameraId"), v18 message];
  }
  else if (!v4)
  {
    uint64_t v7 = xpc_dictionary_get_uint64(xdict, "kWCMCellularSetAntBlocking_LQMThreshold");
    +[WCM_Logging logLevel:3, @"Coex ARI driver: Set Client%d Antenna Blk Policy, lqmThreshold = %llu, durationGranularity = %llu", 0, v7, xpc_dictionary_get_uint64(xdict, "kWCMCellularSetAntBlocking_DurationGranularity") message];
  }
  +[WCM_Logging logLevel:3, @"Coex ARI driver: Set Client%d Antenna Blk Policy, denyVoiceProtect = %d, mitigationTimer = %llu", v4, v5, uint64 message];
  id v8 = xpc_dictionary_get_value(xdict, "kWCMCellularSetAntBlocking_PolicySet");
  size_t count = xpc_array_get_count(v8);
  if (count)
  {
    size_t v10 = 0;
    size_t v20 = count;
    uint64_t v21 = v4;
    do
    {
      v11 = xpc_array_get_value(v8, v10);
      BOOL v23 = xpc_dictionary_get_BOOL(v11, "kWCMCellularSetAntBlocking_Policy_Enable");
      uint64_t v22 = xpc_dictionary_get_uint64(v11, "kWCMCellularSetAntBlocking_Policy_CellularAntBitmap");
      int64_t int64 = xpc_dictionary_get_int64(v11, "kWCMCellularSetAntBlocking_Policy_CellularPowerCap");
      uint64_t v13 = xpc_dictionary_get_uint64(v11, "kWCMCellularSetAntBlocking_Policy_MitigationType");
      uint64_t v14 = xpc_dictionary_get_uint64(v11, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_Band");
      uint64_t v15 = xpc_dictionary_get_uint64(v11, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_CoexTech");
      uint64_t v16 = xpc_dictionary_get_uint64(v11, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_CenterFreq");
      uint64_t v17 = xpc_dictionary_get_uint64(v11, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_Bandwidth");
      +[WCM_Logging logLevel:3, @"Coex ARI driver: Set Client%d Antenna Blk Policy -- policy[%lu]: enable = %d, cellularAntBitmap = %llu, cellularTxPowerCap = %llu, mitigationType = %llu", v21, v10, v23, v22, int64, v13 message];
      +[WCM_Logging logLevel:3, @"Coex ARI driver: Set Client%d Antenna Blk Policy -- policy[%lu]: cellularBand = %llu, cellularCoexTech = %llu, frequency = %lluKHz, BW = %lluKHz", v21, v10, v14, v15, v16, v17 message];

      ++v10;
    }
    while (v20 != v10);
  }
}

- (void)decodeUwbXpcMsg:(id)a3
{
  xpc_object_t xdict = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "kWCMCellularSetAntBlocking_LQMThreshold");
  +[WCM_Logging logLevel:3, @"Coex ARI driver: Set UWB Antenna Blk Policy, denyVoiceProtect = %llu, durationGranularity = %llu", uint64, xpc_dictionary_get_uint64(xdict, "kWCMCellularSetAntBlocking_DurationGranularity") message];
  uint64_t v4 = xpc_dictionary_get_value(xdict, "kWCMCellularSetAntBlocking_PolicySet");
  size_t count = xpc_array_get_count(v4);
  v27 = v4;
  if (count)
  {
    size_t v6 = 0;
    size_t v26 = count;
    do
    {
      uint64_t v7 = xpc_array_get_value(v4, v6);
      BOOL v8 = xpc_dictionary_get_BOOL(v7, "kWCMCellularSetAntBlocking_Policy_Enable");
      uint64_t v9 = xpc_dictionary_get_uint64(v7, "kWCMCellularSetAntBlocking_Policy_CellularAntBitmap");
      int64_t int64 = xpc_dictionary_get_int64(v7, "kWCMCellularSetAntBlocking_Policy_CellularPowerCap");
      uint64_t v11 = xpc_dictionary_get_uint64(v7, "kWCMCellularSetAntBlocking_Policy_MitigationType");
      uint64_t v12 = xpc_dictionary_get_uint64(v7, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_Band");
      uint64_t v13 = xpc_dictionary_get_uint64(v7, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_CoexTech");
      uint64_t v14 = xpc_dictionary_get_uint64(v7, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_CenterFreq");
      uint64_t v15 = xpc_dictionary_get_uint64(v7, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_Bandwidth");
      +[WCM_Logging logLevel:3, @"Coex ARI driver: Set UWB Antenna Blk Policy -- policy[%lu]: enable = %d, cellularAntBitmap = %llu, cellularTxPowerCap = %llu, mitigationType = %llu", v6, v8, v9, int64, v11 message];
      +[WCM_Logging logLevel:3, @"Coex ARI driver: Set UWB Antenna Blk Policy -- policy[%lu]: cellularBand = %llu, cellularCoexTech = %llu, frequency = %lluKHz, BW = %lluKHz", v6, v12, v13, v14, v15 message];

      uint64_t v4 = v27;
      ++v6;
    }
    while (v26 != v6);
  }
  uint64_t v16 = xpc_dictionary_get_value(xdict, "kWCMCellularSetAntBlocking_PriorityClassPolicy");
  size_t v17 = xpc_array_get_count(v16);
  if (v17)
  {
    size_t v18 = v17;
    for (size_t i = 0; i != v18; ++i)
    {
      size_t v20 = xpc_array_get_value(v16, i);
      BOOL v21 = xpc_dictionary_get_BOOL(v20, "kWCMCellularSetAntBlocking_PriorityClassPolicy_Enable");
      BOOL v22 = xpc_dictionary_get_BOOL(v20, "kWCMCellularSetAntBlocking_PriorityClassPolicy_DenyProtectVoice");
      BOOL v23 = xpc_dictionary_get_BOOL(v20, "kWCMCellularSetAntBlocking_PriorityClassPolicy_NeedMitigation");
      uint64_t v24 = xpc_dictionary_get_uint64(v20, "kWCMCellularSetAntBlocking_PriorityClassPolicy_PriorityClass");
      +[WCM_Logging logLevel:3, @"Coex ARI driver: Set UWB Antenna Blk Policy -- priorityPolicy[%lu]: enable = %d, priorityClass = %llu, mitigationTimer = %llu", i, v21, v24, xpc_dictionary_get_uint64(v20, "kWCMCellularSetAntBlocking_PriorityClassPolicy_MitigationTimer") message];
      +[WCM_Logging logLevel:3, @"Coex ARI driver: Set UWB Antenna Blk Policy -- priorityPolicy[%lu]: denyVoiceProtect = %d, mitigationRequired = %d", i, v22, v23 message];
    }
  }
}

- (AntBlockPowerLimitPolicyClientWiFiCam)mWiFiPolicy
{
  return self->_mWiFiPolicy;
}

- (void)setMWiFiPolicy:(id)a3
{
}

- (AntBlockPowerLimitPolicyClientWiFiCam)mFrontCamPolicy
{
  return self->_mFrontCamPolicy;
}

- (void)setMFrontCamPolicy:(id)a3
{
}

- (AntBlockPowerLimitPolicyClientWiFiCam)mFaceIdCamPolicy
{
  return self->_mFaceIdCamPolicy;
}

- (void)setMFaceIdCamPolicy:(id)a3
{
}

- (AntBlockPowerLimitPolicyClientWiFiCam)mRearWideCamPolicy
{
  return self->_mRearWideCamPolicy;
}

- (void)setMRearWideCamPolicy:(id)a3
{
}

- (AntBlockPowerLimitPolicyClientWiFiCam)mRearUltraWideCamPolicy
{
  return self->_mRearUltraWideCamPolicy;
}

- (void)setMRearUltraWideCamPolicy:(id)a3
{
}

- (AntBlockPowerLimitPolicyClientWiFiCam)mRearTeleCamPolicy
{
  return self->_mRearTeleCamPolicy;
}

- (void)setMRearTeleCamPolicy:(id)a3
{
}

- (AntBlockPowerLimitPolicyClientUwb)mUwbPolicy
{
  return self->_mUwbPolicy;
}

- (void)setMUwbPolicy:(id)a3
{
}

- (AntBlockPowerLimitPolicyClientWiFiCam)mE85Policy
{
  return self->_mE85Policy;
}

- (void)setME85Policy:(id)a3
{
}

- (AntBlockPowerLimitPolicyClientGnssImd)mGnssImdPolicy
{
  return self->_mGnssImdPolicy;
}

- (void)setMGnssImdPolicy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mGnssImdPolicy, 0);
  objc_storeStrong((id *)&self->_mE85Policy, 0);
  objc_storeStrong((id *)&self->_mUwbPolicy, 0);
  objc_storeStrong((id *)&self->_mRearTeleCamPolicy, 0);
  objc_storeStrong((id *)&self->_mRearUltraWideCamPolicy, 0);
  objc_storeStrong((id *)&self->_mRearWideCamPolicy, 0);
  objc_storeStrong((id *)&self->_mFaceIdCamPolicy, 0);
  objc_storeStrong((id *)&self->_mFrontCamPolicy, 0);
  objc_storeStrong((id *)&self->_mWiFiPolicy, 0);

  objc_storeStrong((id *)&self->mPlistFileName, 0);
}

@end