@interface AntBlockPowerLimitPolicyClientUwb
- (AntBlockPowerLimitPolicyClientUwb)init;
- (NSMutableArray)mPolicy;
- (NSMutableArray)mPriorityClassPolicy;
- (id)constructXpcMessage;
- (unsigned)mDurationGranularity;
- (unsigned)mLqmThreshold;
- (void)addPolicy:(id)a3;
- (void)addPriorityClassPolicy:(id)a3;
- (void)extractPolicy:(id)a3;
- (void)setMDurationGranularity:(unsigned int)a3;
- (void)setMLqmThreshold:(unsigned int)a3;
- (void)setMPolicy:(id)a3;
- (void)setMPriorityClassPolicy:(id)a3;
- (void)setParameterDurationGranularity:(unsigned int)a3 LQMThreshold:(unsigned int)a4;
@end

@implementation AntBlockPowerLimitPolicyClientUwb

- (AntBlockPowerLimitPolicyClientUwb)init
{
  v8.receiver = self;
  v8.super_class = (Class)AntBlockPowerLimitPolicyClientUwb;
  v2 = [(AntBlockPowerLimitPolicyClientUwb *)&v8 init];
  v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mPolicy = v2->_mPolicy;
  v2->_mPolicy = v3;

  v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mPriorityClassPolicy = v2->_mPriorityClassPolicy;
  v2->_mPriorityClassPolicy = v5;

  return v2;
}

- (void)setParameterDurationGranularity:(unsigned int)a3 LQMThreshold:(unsigned int)a4
{
  self->_mDurationGranularity = a3;
  self->_mLqmThreshold = a4;
}

- (void)extractPolicy:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"Duration_Granularity"];
  id v6 = [v5 integerValue];
  v7 = [v4 objectForKey:@"LQM_Threshold"];
  v50 = self;
  -[AntBlockPowerLimitPolicyClientUwb setParameterDurationGranularity:LQMThreshold:](self, "setParameterDurationGranularity:LQMThreshold:", v6, [v7 integerValue]);

  v31 = v4;
  id obj = [v4 objectForKey:@"Policy"];
  if (obj)
  {
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v34 = [obj countByEnumeratingWithState:&v55 objects:v60 count:16];
    if (v34)
    {
      uint64_t v33 = *(void *)v56;
      do
      {
        objc_super v8 = 0;
        do
        {
          if (*(void *)v56 != v33) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v55 + 1) + 8 * (void)v8);
          v42 = objc_alloc_init(AntBlockPowerLimitUwbBasePolicy);
          v48 = [v9 objectForKey:@"Enable"];
          unsigned int v40 = [v48 BOOLValue];
          v46 = [v9 objectForKey:@"Uwb_Channel"];
          unsigned __int16 v39 = (unsigned __int16)[v46 integerValue];
          v44 = [v9 objectForKey:@"Uwb_Ant_Bitmap"];
          id v38 = [v44 integerValue];
          v41 = [v9 objectForKey:@"Cellular_Ant_Bitmap"];
          id v37 = [v41 integerValue];
          v10 = [v9 objectForKey:@"Mitigation_Type"];
          id v36 = [v10 integerValue];
          v11 = [v9 objectForKey:@"Cellular_TX_Power_Cap"];
          [v11 doubleValue];
          unsigned int v35 = vcvtd_n_s64_f64(v12, 4uLL);
          v13 = [v9 objectForKey:@"Coex_Tech"];
          unsigned int v14 = [v13 integerValue];
          v15 = [v9 objectForKey:@"Cellular_Band"];
          unsigned int v16 = [v15 integerValue];
          v17 = [v9 objectForKey:@"Cellular_Center_Frequency_KHz"];
          unsigned int v18 = [v17 integerValue];
          v19 = [v9 objectForKey:@"Cellular_Bandwidth_KHz"];
          -[AntBlockPowerLimitUwbBasePolicy setParameterEnable:UwbChannel:UwbAntBitmap:CellularAntBitmap:MitigationType:CellularTxPowerCap:CoexTech:CellularBand:CellFreq:CellBW:](v42, "setParameterEnable:UwbChannel:UwbAntBitmap:CellularAntBitmap:MitigationType:CellularTxPowerCap:CoexTech:CellularBand:CellFreq:CellBW:", v40, v39, v38, v37, v36, v35, __PAIR64__(v16, v14), __PAIR64__([v19 integerValue], v18));

          [(AntBlockPowerLimitPolicyClientUwb *)v50 addPolicy:v42];
          objc_super v8 = (char *)v8 + 1;
        }
        while (v34 != v8);
        id v34 = [obj countByEnumeratingWithState:&v55 objects:v60 count:16];
      }
      while (v34);
    }
  }
  id v43 = [v31 objectForKey:@"Priority_Class_Policy"];
  if (v43)
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v47 = [v43 countByEnumeratingWithState:&v51 objects:v59 count:16];
    if (v47)
    {
      uint64_t v45 = *(void *)v52;
      do
      {
        v20 = 0;
        do
        {
          if (*(void *)v52 != v45) {
            objc_enumerationMutation(v43);
          }
          v21 = *(void **)(*((void *)&v51 + 1) + 8 * (void)v20);
          v22 = objc_alloc_init(AntBlockPowerLimitUwbPriorityClassPolicy);
          v23 = [v21 objectForKey:@"Enable"];
          unsigned int v49 = [v23 BOOLValue];
          v24 = [v21 objectForKey:@"Priority_Class"];
          unsigned __int8 v25 = [v24 integerValue];
          v26 = [v21 objectForKey:@"Mitigation_Required"];
          id v27 = [v26 BOOLValue];
          v28 = [v21 objectForKey:@"Deny_Voice_Protect"];
          id v29 = [v28 BOOLValue];
          v30 = [v21 objectForKey:@"Mitigation_Timer_ms"];
          -[AntBlockPowerLimitUwbPriorityClassPolicy setParameterEnable:PriorityClass:MitigationRequired:DenyVoiceProtect:MitigationTimer:](v22, "setParameterEnable:PriorityClass:MitigationRequired:DenyVoiceProtect:MitigationTimer:", v49, v25, v27, v29, [v30 integerValue]);

          [(AntBlockPowerLimitPolicyClientUwb *)v50 addPriorityClassPolicy:v22];
          v20 = (char *)v20 + 1;
        }
        while (v47 != v20);
        id v47 = [v43 countByEnumeratingWithState:&v51 objects:v59 count:16];
      }
      while (v47);
    }
  }
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

- (void)addPriorityClassPolicy:(id)a3
{
  if (a3)
  {
    mPriorityClassPolicy = self->_mPriorityClassPolicy;
    if (mPriorityClassPolicy) {
      -[NSMutableArray addObject:](mPriorityClassPolicy, "addObject:");
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
      xpc_dictionary_set_uint64(v3, "kWCMCellularSetAntBlocking_LQMThreshold", self->_mLqmThreshold);
      xpc_object_t xdict = v4;
      xpc_dictionary_set_uint64(v4, "kWCMCellularSetAntBlocking_DurationGranularity", self->_mDurationGranularity);
      xpc_object_t xarray = xpc_array_create(0, 0);
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      v19 = self;
      id obj = self->_mPolicy;
      id v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v29;
        do
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v29 != v7) {
              objc_enumerationMutation(obj);
            }
            v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
            xpc_dictionary_set_BOOL(v10, "kWCMCellularSetAntBlocking_Policy_Enable", (BOOL)[v9 mEnable:v19]);
            xpc_dictionary_set_uint64(v10, "kWCMCellularSetAntBlocking_Policy_UwbChannel", [v9 mUwbChannel]);
            xpc_dictionary_set_uint64(v10, "kWCMCellularSetAntBlocking_Policy_UwbAntBitmap", [v9 mUwbAntBitmap]);
            xpc_dictionary_set_uint64(v10, "kWCMCellularSetAntBlocking_Policy_CellularAntBitmap", [v9 mCellularAntBitmap]);
            xpc_dictionary_set_int64(v10, "kWCMCellularSetAntBlocking_Policy_CellularPowerCap", (int)[v9 mCellularTxPowerCap]);
            xpc_dictionary_set_uint64(v10, "kWCMCellularSetAntBlocking_Policy_MitigationType", [v9 mMitigationType]);
            xpc_dictionary_set_uint64(v10, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_Band", [v9 mCellularBand]);
            xpc_dictionary_set_uint64(v10, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_CoexTech", [v9 mCellularCoexTech]);
            xpc_dictionary_set_uint64(v10, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_CenterFreq", [v9 mCellularFrequencyKHz]);
            xpc_dictionary_set_uint64(v10, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_Bandwidth", [v9 mCellularBandwidthKHz]);
            xpc_array_append_value(xarray, v10);
          }
          id v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v6);
      }

      xpc_dictionary_set_value(v4, "kWCMCellularSetAntBlocking_PolicySet", xarray);
      xpc_object_t v11 = xpc_array_create(0, 0);
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      obja = v19->_mPriorityClassPolicy;
      id v12 = [(NSMutableArray *)obja countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v25;
        do
        {
          for (j = 0; j != v13; j = (char *)j + 1)
          {
            if (*(void *)v25 != v14) {
              objc_enumerationMutation(obja);
            }
            unsigned int v16 = *(void **)(*((void *)&v24 + 1) + 8 * (void)j);
            xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
            xpc_dictionary_set_BOOL(v17, "kWCMCellularSetAntBlocking_PriorityClassPolicy_Enable", (BOOL)[v16 mEnable]);
            xpc_dictionary_set_BOOL(v17, "kWCMCellularSetAntBlocking_PriorityClassPolicy_DenyProtectVoice", (BOOL)[v16 mDenyVoiceProtect]);
            xpc_dictionary_set_BOOL(v17, "kWCMCellularSetAntBlocking_PriorityClassPolicy_NeedMitigation", (BOOL)[v16 mMitigationRequired]);
            xpc_dictionary_set_uint64(v17, "kWCMCellularSetAntBlocking_PriorityClassPolicy_PriorityClass", [v16 mPriorityClass]);
            xpc_dictionary_set_uint64(v17, "kWCMCellularSetAntBlocking_PriorityClassPolicy_MitigationTimer", [v16 mMitigationTimer]);
            xpc_array_append_value(v11, v17);
          }
          id v13 = [(NSMutableArray *)obja countByEnumeratingWithState:&v24 objects:v32 count:16];
        }
        while (v13);
      }

      id v4 = xdict;
      xpc_dictionary_set_value(xdict, "kWCMCellularSetAntBlocking_PriorityClassPolicy", v11);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (unsigned)mDurationGranularity
{
  return self->_mDurationGranularity;
}

- (void)setMDurationGranularity:(unsigned int)a3
{
  self->_mDurationGranularity = a3;
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

- (NSMutableArray)mPriorityClassPolicy
{
  return self->_mPriorityClassPolicy;
}

- (void)setMPriorityClassPolicy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mPriorityClassPolicy, 0);

  objc_storeStrong((id *)&self->_mPolicy, 0);
}

@end