@interface AntBlockPowerLimitPolicyClientWiFiCam
- (AntBlockPowerLimitPolicyClientWiFiCam)init;
- (AntBlockPowerLimitPolicyClientWiFiCam)initWithClient:(unsigned int)a3;
- (BOOL)mDenyVoiceProtect;
- (NSMutableArray)mPolicy;
- (id)constructXpcMessage;
- (unsigned)mClient;
- (unsigned)mDurationGranularity;
- (unsigned)mLqmThreshold;
- (unsigned)mMitigationTimer;
- (void)addPolicy:(id)a3;
- (void)extractPolicy:(id)a3;
- (void)setMClient:(unsigned int)a3;
- (void)setMDenyVoiceProtect:(BOOL)a3;
- (void)setMDurationGranularity:(unsigned int)a3;
- (void)setMLqmThreshold:(unsigned int)a3;
- (void)setMMitigationTimer:(unsigned int)a3;
- (void)setMPolicy:(id)a3;
- (void)setParameterDenyVoiceProtect:(BOOL)a3 MitigationTimer:(unsigned int)a4 DurationGranularity:(unsigned int)a5 LQMThreshold:(unsigned int)a6;
@end

@implementation AntBlockPowerLimitPolicyClientWiFiCam

- (AntBlockPowerLimitPolicyClientWiFiCam)init
{
  v6.receiver = self;
  v6.super_class = (Class)AntBlockPowerLimitPolicyClientWiFiCam;
  v2 = [(AntBlockPowerLimitPolicyClientWiFiCam *)&v6 init];
  v2->_mClient = 100;
  v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mPolicy = v2->_mPolicy;
  v2->_mPolicy = v3;

  return v2;
}

- (AntBlockPowerLimitPolicyClientWiFiCam)initWithClient:(unsigned int)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AntBlockPowerLimitPolicyClientWiFiCam;
  v4 = [(AntBlockPowerLimitPolicyClientWiFiCam *)&v8 init];
  v4->_mClient = a3;
  v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mPolicy = v4->_mPolicy;
  v4->_mPolicy = v5;

  return v4;
}

- (void)setParameterDenyVoiceProtect:(BOOL)a3 MitigationTimer:(unsigned int)a4 DurationGranularity:(unsigned int)a5 LQMThreshold:(unsigned int)a6
{
  self->_mDenyVoiceProtect = a3;
  self->_mDurationGranularity = a5;
  self->_mMitigationTimer = a4;
  self->_mLqmThreshold = a6;
}

- (void)extractPolicy:(id)a3
{
  id v4 = a3;
  +[WCM_Logging logLevel:3, @"Extract antenna blocking/Power limiting policy for client %u", self->_mClient message];
  id v5 = [v4 objectForKey:@"Deny_Voice_Protect"];

  if (v5)
  {
    objc_super v6 = [v4 objectForKey:@"Deny_Voice_Protect"];
    id v5 = [v6 BOOLValue];
  }
  v7 = [v4 objectForKey:@"Mitigation_Timer_ms"];

  if (v7)
  {
    objc_super v8 = [v4 objectForKey:@"Mitigation_Timer_ms"];
    id v9 = [v8 integerValue];
  }
  else
  {
    id v9 = 0;
  }
  id v10 = [v4 objectForKey:@"Duration_Granularity"];

  if (v10)
  {
    v11 = [v4 objectForKey:@"Duration_Granularity"];
    id v10 = [v11 integerValue];
  }
  id v12 = [v4 objectForKey:@"LQM_Threshold"];

  if (v12)
  {
    v13 = [v4 objectForKey:@"LQM_Threshold"];
    id v12 = [v13 integerValue];
  }
  [(AntBlockPowerLimitPolicyClientWiFiCam *)self setParameterDenyVoiceProtect:v5 MitigationTimer:v9 DurationGranularity:v10 LQMThreshold:v12];
  v14 = [v4 objectForKey:@"Policy"];
  v15 = v14;
  if (!v14)
  {
    +[WCM_Logging logLevel:3, @"No policies found for client %u", self->_mClient message];
    goto LABEL_25;
  }
  id v30 = v4;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, @"Extracted %lu policies for client %u", [v14 count], self->_mClient);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v29 = v15;
  id obj = v15;
  id v34 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (!v34) {
    goto LABEL_23;
  }
  uint64_t v32 = *(void *)v43;
  v33 = self;
  do
  {
    for (i = 0; i != v34; i = (char *)i + 1)
    {
      if (*(void *)v43 != v32) {
        objc_enumerationMutation(obj);
      }
      v17 = *(void **)(*((void *)&v42 + 1) + 8 * i);
      v41 = objc_alloc_init(AntBlockPowerLimitWiFiCamBasePolicy);
      unsigned int mClient = self->_mClient;
      if (mClient == 6)
      {
        v19 = [v17 objectForKey:@"USB_Rate"];
        -[AntBlockPowerLimitWiFiCamBasePolicy setParameterUsbRate:](v41, "setParameterUsbRate:", [v19 integerValue]);
      }
      else
      {
        if (mClient) {
          goto LABEL_21;
        }
        v19 = [v17 objectForKey:@"Condition_Id"];
        -[AntBlockPowerLimitWiFiCamBasePolicy setParameterConditionId:](v41, "setParameterConditionId:", [v19 integerValue]);
      }

LABEL_21:
      v40 = [v17 objectForKey:@"Enable"];
      unsigned int v37 = [v40 BOOLValue];
      v39 = [v17 objectForKey:@"Cellular_Ant_Bitmap"];
      id v36 = [v39 integerValue];
      v38 = [v17 objectForKey:@"Mitigation_Type"];
      id v35 = [v38 integerValue];
      v20 = [v17 objectForKey:@"Cellular_TX_Power_Cap"];
      [v20 doubleValue];
      LODWORD(self) = vcvtd_n_s64_f64(v21, 4uLL);
      v22 = [v17 objectForKey:@"Coex_Tech"];
      id v23 = [v22 integerValue];
      v24 = [v17 objectForKey:@"Cellular_Band"];
      id v25 = [v24 integerValue];
      v26 = [v17 objectForKey:@"Cellular_Center_Frequency_KHz"];
      unsigned int v27 = [v26 integerValue];
      v28 = [v17 objectForKey:@"Cellular_Bandwidth_KHz"];
      -[AntBlockPowerLimitWiFiCamBasePolicy setParameterEnable:CellularAntBitmap:MitigationType:CellularTxPowerCap:CoexTech:CellularBand:CellFreq:CellBW:](v41, "setParameterEnable:CellularAntBitmap:MitigationType:CellularTxPowerCap:CoexTech:CellularBand:CellFreq:CellBW:", v37, v36, v35, self, v23, v25, __PAIR64__([v28 integerValue], v27));

      self = v33;
      [(AntBlockPowerLimitPolicyClientWiFiCam *)v33 addPolicy:v41];
    }
    id v34 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  }
  while (v34);
LABEL_23:

  v15 = v29;
  id v4 = v30;
LABEL_25:
}

- (void)addPolicy:(id)a3
{
  if (a3)
  {
    mPolicy = self->_mPolicy;
    if (mPolicy) {
      -[NSMutableArray addObject:](mPolicy, "addObject:");
    }
  }
}

- (id)constructXpcMessage
{
  if ([(NSMutableArray *)self->_mPolicy count])
  {
    xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
    id v4 = v3;
    if (v3)
    {
      unsigned int mClient = self->_mClient;
      objc_super v6 = "kWCMCellularSetAntBlocking_LQMThreshold";
      uint64_t v7 = 24;
      objc_super v8 = "kWCMCellularSetAntBlocking_CameraId";
      switch(mClient)
      {
        case 0u:
          xpc_dictionary_set_uint64(v3, "kWCMCellularSetAntBlocking_LQMThreshold", self->_mLqmThreshold);
          objc_super v6 = "kWCMCellularSetAntBlocking_DurationGranularity";
          uint64_t v7 = 16;
          goto LABEL_5;
        case 2u:
        case 3u:
        case 4u:
        case 5u:
        case 8u:
          goto LABEL_6;
        case 6u:
LABEL_5:
          unsigned int mClient = *(_DWORD *)((char *)&self->super.isa + v7);
          objc_super v8 = v6;
LABEL_6:
          xpc_dictionary_set_uint64(v4, v8, mClient);
          break;
        default:
          break;
      }
      xpc_dictionary_set_BOOL(v4, "kWCMCellularSetAntBlocking_DenyProtectVoice", self->_mDenyVoiceProtect);
      xpc_dictionary_set_uint64(v4, "kWCMCellularSetAntBlocking_MitigationTimer", self->_mMitigationTimer);
      xpc_object_t v9 = xpc_array_create(0, 0);
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id obj = self->_mPolicy;
      id v10 = [(NSMutableArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v22;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v22 != v12) {
              objc_enumerationMutation(obj);
            }
            v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
            xpc_dictionary_set_BOOL(v15, "kWCMCellularSetAntBlocking_Policy_Enable", (BOOL)[v14 mEnable]);
            xpc_dictionary_set_uint64(v15, "kWCMCellularSetAntBlocking_Policy_CellularAntBitmap", [v14 mCellularAntBitmap]);
            xpc_dictionary_set_int64(v15, "kWCMCellularSetAntBlocking_Policy_CellularPowerCap", (int)[v14 mCellularTxPowerCap]);
            xpc_dictionary_set_uint64(v15, "kWCMCellularSetAntBlocking_Policy_MitigationType", [v14 mMitigationType]);
            xpc_dictionary_set_uint64(v15, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_Band", [v14 mCellularBand]);
            xpc_dictionary_set_uint64(v15, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_CoexTech", [v14 mCellularCoexTech]);
            xpc_dictionary_set_uint64(v15, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_CenterFreq", [v14 mCellularFrequencyKHz]);
            xpc_dictionary_set_uint64(v15, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_Bandwidth", [v14 mCellularBandwidthKHz]);
            unsigned int v16 = self->_mClient;
            if (v16 == 6)
            {
              unsigned int v17 = [v14 mUsbRate];
              v18 = "kWCMCellularSetAntBlocking_Policy_UsbRate";
            }
            else
            {
              if (v16) {
                goto LABEL_17;
              }
              unsigned int v17 = [v14 mConditionId];
              v18 = "kWCMCellularSetAntBlocking_Policy_ConditionId";
            }
            xpc_dictionary_set_uint64(v15, v18, v17);
LABEL_17:
            xpc_array_append_value(v9, v15);
          }
          id v11 = [(NSMutableArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v11);
      }

      xpc_dictionary_set_value(v4, "kWCMCellularSetAntBlocking_PolicySet", v9);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (unsigned)mClient
{
  return self->_mClient;
}

- (void)setMClient:(unsigned int)a3
{
  self->_unsigned int mClient = a3;
}

- (BOOL)mDenyVoiceProtect
{
  return self->_mDenyVoiceProtect;
}

- (void)setMDenyVoiceProtect:(BOOL)a3
{
  self->_mDenyVoiceProtect = a3;
}

- (unsigned)mDurationGranularity
{
  return self->_mDurationGranularity;
}

- (void)setMDurationGranularity:(unsigned int)a3
{
  self->_mDurationGranularity = a3;
}

- (unsigned)mMitigationTimer
{
  return self->_mMitigationTimer;
}

- (void)setMMitigationTimer:(unsigned int)a3
{
  self->_mMitigationTimer = a3;
}

- (unsigned)mLqmThreshold
{
  return self->_mLqmThreshold;
}

- (void)setMLqmThreshold:(unsigned int)a3
{
  self->_mLqmThreshold = a3;
}

- (NSMutableArray)mPolicy
{
  return self->_mPolicy;
}

- (void)setMPolicy:(id)a3
{
}

- (void).cxx_destruct
{
}

@end