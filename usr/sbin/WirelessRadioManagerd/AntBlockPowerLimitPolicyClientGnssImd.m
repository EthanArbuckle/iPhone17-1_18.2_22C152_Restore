@interface AntBlockPowerLimitPolicyClientGnssImd
- (AntBlockPowerLimitPolicyClientGnssImd)init;
- (BOOL)mDenyVoiceProtect;
- (BOOL)mProtectGnssLowPriority;
- (NSMutableArray)mPolicy;
- (unsigned)mL5TunerLqmThreshold;
- (unsigned)mLqmThreshold;
- (unsigned)mMitigationTimer_ms;
- (void)addPolicy:(id)a3;
- (void)extractPolicy:(id)a3;
- (void)setMDenyVoiceProtect:(BOOL)a3;
- (void)setML5TunerLqmThreshold:(unsigned int)a3;
- (void)setMLqmThreshold:(unsigned int)a3;
- (void)setMMitigationTimer_ms:(unsigned int)a3;
- (void)setMPolicy:(id)a3;
- (void)setMProtectGnssLowPriority:(BOOL)a3;
- (void)setParameter:(BOOL)a3 lqmThreshold:(unsigned int)a4 MitigationTimer:(unsigned int)a5 ProtectGnssLowPriority:(BOOL)a6 L5TunerLqmThreshod:(unsigned int)a7;
@end

@implementation AntBlockPowerLimitPolicyClientGnssImd

- (AntBlockPowerLimitPolicyClientGnssImd)init
{
  v6.receiver = self;
  v6.super_class = (Class)AntBlockPowerLimitPolicyClientGnssImd;
  v2 = [(AntBlockPowerLimitPolicyClientGnssImd *)&v6 init];
  v2->_mDenyVoiceProtect = 0;
  v2->_mLqmThreshold = 0;
  v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mPolicy = v2->_mPolicy;
  v2->_mPolicy = v3;

  v2->_mMitigationTimer_ms = 0;
  v2->_mProtectGnssLowPriority = 0;
  return v2;
}

- (void)setParameter:(BOOL)a3 lqmThreshold:(unsigned int)a4 MitigationTimer:(unsigned int)a5 ProtectGnssLowPriority:(BOOL)a6 L5TunerLqmThreshod:(unsigned int)a7
{
  self->_mDenyVoiceProtect = a3;
  self->_mL5TunerLqmThreshold = a7;
  self->_mMitigationTimer_ms = a5;
  self->_mProtectGnssLowPriority = a6;
  self->_mLqmThreshold = a4;
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

- (void)extractPolicy:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_super v6 = [v4 objectForKey:@"Deny_Voice_Protect"];
    unsigned int v36 = [v6 BOOLValue];
    v7 = [v5 objectForKey:@"LQM_Threshold"];
    id v8 = [v7 integerValue];
    v9 = [v5 objectForKey:@"Mitigation_Timer_ms"];
    id v10 = [v9 integerValue];
    v11 = [v5 objectForKey:@"Protect_GNSS_Low_Priority"];
    id v12 = [v11 BOOLValue];
    v13 = [v5 objectForKey:@"L5_Tuner_LQM_Threshold"];
    v31 = self;
    -[AntBlockPowerLimitPolicyClientGnssImd setParameter:lqmThreshold:MitigationTimer:ProtectGnssLowPriority:L5TunerLqmThreshod:](self, "setParameter:lqmThreshold:MitigationTimer:ProtectGnssLowPriority:L5TunerLqmThreshod:", v36, v8, v10, v12, [v13 integerValue]);

    v28 = v5;
    id obj = [v5 objectForKey:@"Policy"];
    if (obj)
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v32 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v32)
      {
        uint64_t v30 = *(void *)v39;
        do
        {
          v14 = 0;
          do
          {
            if (*(void *)v39 != v30) {
              objc_enumerationMutation(obj);
            }
            v15 = *(void **)(*((void *)&v38 + 1) + 8 * (void)v14);
            v16 = objc_alloc_init(AntBlockPowerLimitGnssImdBasePolicy);
            v37 = [v15 objectForKey:@"Enable"];
            unsigned int v34 = [v37 BOOLValue];
            v35 = [v15 objectForKey:@"GNSS_IMD_Type"];
            id v33 = [v35 integerValue];
            v17 = [v15 objectForKey:@"GNSS_L5_Tuner_Allowed"];
            id v18 = [v17 BOOLValue];
            v19 = [v15 objectForKey:@"GNSS_IMD_Parallel_Mitigation_Allowed"];
            id v20 = [v19 BOOLValue];
            v21 = [v15 objectForKey:@"GNSS_Victim_Center_Frequency_KHz"];
            id v22 = [v21 integerValue];
            v23 = [v15 objectForKey:@"GNSS_Victim_Bandwidth_KHz"];
            -[AntBlockPowerLimitGnssImdBasePolicy setParameter:ImdType:GnssL5TunerAllowed:ParallelMitigationAllowed:GnssVictimFreq_KHz:GnssVictimBw_KHz:](v16, "setParameter:ImdType:GnssL5TunerAllowed:ParallelMitigationAllowed:GnssVictimFreq_KHz:GnssVictimBw_KHz:", v34, v33, v18, v20, v22, [v23 integerValue]);

            v24 = [v15 objectForKey:@"Cell_Band_1"];
            v25 = [v15 objectForKey:@"Cell_Band_2"];
            v26 = objc_alloc_init(AntBlockPowerLimitGnssImdAggressorPolicy);
            v27 = objc_alloc_init(AntBlockPowerLimitGnssImdAggressorPolicy);
            [(AntBlockPowerLimitGnssImdAggressorPolicy *)v26 extractPolicy:v24];
            [(AntBlockPowerLimitGnssImdAggressorPolicy *)v27 extractPolicy:v25];
            [(AntBlockPowerLimitGnssImdBasePolicy *)v16 setCellAggressor1:v26];
            [(AntBlockPowerLimitGnssImdBasePolicy *)v16 setCellAggressor2:v27];
            [(AntBlockPowerLimitPolicyClientGnssImd *)v31 addPolicy:v16];

            v14 = (char *)v14 + 1;
          }
          while (v32 != v14);
          id v32 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
        }
        while (v32);
      }
    }

    v5 = v28;
  }
}

- (BOOL)mDenyVoiceProtect
{
  return self->_mDenyVoiceProtect;
}

- (void)setMDenyVoiceProtect:(BOOL)a3
{
  self->_mDenyVoiceProtect = a3;
}

- (unsigned)mLqmThreshold
{
  return self->_mLqmThreshold;
}

- (void)setMLqmThreshold:(unsigned int)a3
{
  self->_mLqmThreshold = a3;
}

- (unsigned)mL5TunerLqmThreshold
{
  return self->_mL5TunerLqmThreshold;
}

- (void)setML5TunerLqmThreshold:(unsigned int)a3
{
  self->_mL5TunerLqmThreshold = a3;
}

- (unsigned)mMitigationTimer_ms
{
  return self->_mMitigationTimer_ms;
}

- (void)setMMitigationTimer_ms:(unsigned int)a3
{
  self->_mMitigationTimer_ms = a3;
}

- (BOOL)mProtectGnssLowPriority
{
  return self->_mProtectGnssLowPriority;
}

- (void)setMProtectGnssLowPriority:(BOOL)a3
{
  self->_mProtectGnssLowPriority = a3;
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