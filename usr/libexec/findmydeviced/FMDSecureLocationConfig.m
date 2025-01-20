@interface FMDSecureLocationConfig
- (BOOL)shouldWakeDevice;
- (FMDSecureLocationConfig)init;
- (FMDSecureLocationConfig)initWithName:(id)a3 values:(id)a4;
- (NSString)desiredAccuracy;
- (NSString)policyName;
- (double)accuracyThreshold;
- (double)continuesPublishThreshold;
- (double)expirationInterval;
- (double)heartbeatPublish;
- (double)minDistanceBetweenPublish;
- (double)minTimeBetweenPublish;
- (double)minTimeBetweenVisitPublish;
- (double)onDemandPublishThreshold;
- (double)stalenessThreshold;
- (id)_readInternalPreference:(id)a3;
- (id)description;
- (int64_t)priority;
- (void)_initWithDefaults;
- (void)_readValuesFromDictionary:(id)a3;
- (void)setAccuracyThreshold:(double)a3;
- (void)setContinuesPublishThreshold:(double)a3;
- (void)setDesiredAccuracy:(id)a3;
- (void)setExpirationInterval:(double)a3;
- (void)setHeartbeatPublish:(double)a3;
- (void)setMinDistanceBetweenPublish:(double)a3;
- (void)setMinTimeBetweenPublish:(double)a3;
- (void)setMinTimeBetweenVisitPublish:(double)a3;
- (void)setOnDemandPublishThreshold:(double)a3;
- (void)setPolicyName:(id)a3;
- (void)setPriority:(int64_t)a3;
- (void)setShouldWakeDevice:(BOOL)a3;
- (void)setStalenessThreshold:(double)a3;
@end

@implementation FMDSecureLocationConfig

- (FMDSecureLocationConfig)init
{
  v5.receiver = self;
  v5.super_class = (Class)FMDSecureLocationConfig;
  v2 = [(FMDSecureLocationConfig *)&v5 init];
  v3 = v2;
  if (v2) {
    [(FMDSecureLocationConfig *)v2 _initWithDefaults];
  }
  return v3;
}

- (void)_initWithDefaults
{
  *(_OWORD *)&self->_minTimeBetweenPublish = xmmword_10026A550;
  *(_OWORD *)&self->_accuracyThreshold = xmmword_10026A540;
  self->_heartbeatPublish = 1080.0;
  *(_OWORD *)&self->_onDemandPublishThreshold = xmmword_10026A560;
  self->_priority = 2;
  self->_stalenessThreshold = 120.0;
  self->_shouldWakeDevice = 1;
}

- (FMDSecureLocationConfig)initWithName:(id)a3 values:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FMDSecureLocationConfig;
  v9 = [(FMDSecureLocationConfig *)&v12 init];
  v10 = v9;
  if (v9)
  {
    [(FMDSecureLocationConfig *)v9 _initWithDefaults];
    objc_storeStrong((id *)&v10->_policyName, a3);
    [(FMDSecureLocationConfig *)v10 _readValuesFromDictionary:v8];
  }

  return v10;
}

- (void)_readValuesFromDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"desiredAccuracy"];
  v6 = (void *)v5;
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  else {
    id v7 = @"slc";
  }
  objc_storeStrong((id *)&self->_desiredAccuracy, v7);

  uint64_t v8 = [v4 objectForKeyedSubscript:@"minTimeBetweenPublish"];
  if (v8)
  {
    v9 = +[NSString stringWithFormat:@"%@.%@", self->_policyName, @"minTimeBetweenPublish"];
    v10 = [(FMDSecureLocationConfig *)self _readInternalPreference:v9];
    if (v10)
    {
      v11 = sub_1000599A8();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        policyName = self->_policyName;
        *(_DWORD *)buf = 138412546;
        v62 = policyName;
        __int16 v63 = 2112;
        v64 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "SecureLocationConfig: Overriding minTimeBetweenPublish for %@ to %@", buf, 0x16u);
      }

      v13 = v10;
    }
    else
    {
      v13 = (void *)v8;
    }
    [v13 doubleValue];
    if (v14 < 0.5) {
      double v14 = 0.5;
    }
    self->_minTimeBetweenPublish = v14;
  }
  v60 = (void *)v8;
  v15 = [v4 objectForKeyedSubscript:@"minTimeBetweenVisitPublish"];
  v16 = v15;
  if (v15)
  {
    [v15 doubleValue];
    self->_minTimeBetweenVisitPublish = v17;
  }
  v18 = [v4 objectForKeyedSubscript:@"heartbeatPublish"];
  if (v18)
  {
    v19 = +[NSString stringWithFormat:@"%@.%@", self->_policyName, @"heartbeatInterval"];
    v20 = [(FMDSecureLocationConfig *)self _readInternalPreference:v19];
    v21 = v20;
    if (v20)
    {
      [v20 doubleValue];
      self->_heartbeatPublish = v22;
      v23 = sub_1000599A8();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = self->_policyName;
        *(_DWORD *)buf = 138412546;
        v62 = v24;
        __int16 v63 = 2112;
        v64 = v21;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "SecureLocationConfig: Overriding heartbeatPublishInterval for %@ to %@", buf, 0x16u);
      }
    }
    else
    {
      [v18 doubleValue];
      self->_heartbeatPublish = v25;
    }
  }
  v26 = [v4 objectForKeyedSubscript:@"minDistanceBetweenPublish"];
  if (v26)
  {
    v27 = +[NSString stringWithFormat:@"%@.%@", self->_policyName, @"minDistanceBetweenPublish"];
    v28 = [(FMDSecureLocationConfig *)self _readInternalPreference:v27];
    v29 = v28;
    if (v28)
    {
      [v28 doubleValue];
      self->_minDistanceBetweenPublish = v30;
      v31 = sub_1000599A8();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = self->_policyName;
        *(_DWORD *)buf = 138412546;
        v62 = v32;
        __int16 v63 = 2112;
        v64 = v29;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "SecureLocationConfig: Overriding minDistanceBetweenPublish for %@ to %@", buf, 0x16u);
      }
    }
    else
    {
      [v26 doubleValue];
      self->_minDistanceBetweenPublish = v33;
    }
  }
  v34 = [v4 objectForKeyedSubscript:@"accuracyThreshold"];
  v35 = v34;
  if (v34)
  {
    [v34 doubleValue];
    self->_accuracyThreshold = v36;
  }
  v59 = v18;
  v37 = [v4 objectForKeyedSubscript:@"onDemandThreshold"];
  v38 = v37;
  if (v37)
  {
    [v37 doubleValue];
    self->_onDemandPublishThreshold = v39;
  }
  v40 = [v4 objectForKeyedSubscript:@"expirationInterval"];
  if (v40)
  {
    v41 = +[NSString stringWithFormat:@"%@.%@", self->_policyName, @"expirationInterval"];
    v42 = [(FMDSecureLocationConfig *)self _readInternalPreference:v41];
    v43 = v42;
    if (v42)
    {
      [v42 doubleValue];
      self->_double expirationInterval = v44;
      v45 = sub_1000599A8();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        v46 = self->_policyName;
        *(_DWORD *)buf = 138412546;
        v62 = v46;
        __int16 v63 = 2112;
        v64 = v43;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "SecureLocationConfig: Overriding expirationInterval for %@ to %@", buf, 0x16u);
      }

      double expirationInterval = self->_expirationInterval;
    }
    else
    {
      [v40 doubleValue];
      self->_double expirationInterval = expirationInterval;
    }
    if (expirationInterval < 0.9) {
      self->_double expirationInterval = 0.9;
    }
  }
  v48 = [v4 objectForKeyedSubscript:@"priority"];
  v49 = v48;
  if (v48)
  {
    id v50 = [v48 integerValue];
    self->_priority = (int64_t)v50;
    if ((uint64_t)v50 <= 0)
    {
      if ([(NSString *)self->_policyName caseInsensitiveCompare:kFMDSecureLocationModeProactive])
      {
        if ([(NSString *)self->_policyName caseInsensitiveCompare:kFMDSecureLocationModeProactiveShallow])
        {
          NSComparisonResult v51 = [(NSString *)self->_policyName caseInsensitiveCompare:kFMDSecureLocationModeLive];
          int64_t v52 = 2;
          if (v51 == NSOrderedSame) {
            int64_t v52 = 4;
          }
        }
        else
        {
          int64_t v52 = 3;
        }
      }
      else
      {
        int64_t v52 = 2;
      }
      self->_priority = v52;
    }
  }
  v53 = [v4 objectForKeyedSubscript:@"stalenessThreshold"];
  v54 = v53;
  if (v53)
  {
    [v53 doubleValue];
    self->_stalenessThreshold = v55;
  }
  v56 = [v4 objectForKeyedSubscript:@"shouldWakeDevice"];
  v57 = v56;
  if (v56) {
    unsigned __int8 v58 = [v56 BOOLValue];
  }
  else {
    unsigned __int8 v58 = 1;
  }
  self->_shouldWakeDevice = v58;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<SecureLocationConfig name %@, desiredAccuracy %@, minTimeBetweenPublish %f, minTimeBetweenVisitPublish %f, heartbeatPublish %f, minDistanceBetweenPublish %f, accuracyThreshold %f, expirationInterval %f, priority %ld, stalenessThreshold %f>", self->_policyName, self->_desiredAccuracy, *(void *)&self->_minTimeBetweenPublish, *(void *)&self->_minTimeBetweenVisitPublish, *(void *)&self->_heartbeatPublish, *(void *)&self->_minDistanceBetweenPublish, *(void *)&self->_accuracyThreshold, *(void *)&self->_expirationInterval, self->_priority, *(void *)&self->_stalenessThreshold];
}

- (id)_readInternalPreference:(id)a3
{
  v3 = +[FMPreferencesUtil objectForKey:a3 inDomain:kFMDNotBackedUpPrefDomain];
  id v4 = +[FMSystemInfo sharedInstance];
  unsigned int v5 = [v4 isInternalBuild];

  if (v5) {
    BOOL v6 = v3 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    id v7 = 0;
  }
  else {
    id v7 = v3;
  }

  return v7;
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
}

- (NSString)desiredAccuracy
{
  return self->_desiredAccuracy;
}

- (void)setDesiredAccuracy:(id)a3
{
}

- (double)minTimeBetweenPublish
{
  return self->_minTimeBetweenPublish;
}

- (void)setMinTimeBetweenPublish:(double)a3
{
  self->_minTimeBetweenPublish = a3;
}

- (double)minDistanceBetweenPublish
{
  return self->_minDistanceBetweenPublish;
}

- (void)setMinDistanceBetweenPublish:(double)a3
{
  self->_minDistanceBetweenPublish = a3;
}

- (double)accuracyThreshold
{
  return self->_accuracyThreshold;
}

- (void)setAccuracyThreshold:(double)a3
{
  self->_accuracyThreshold = a3;
}

- (double)minTimeBetweenVisitPublish
{
  return self->_minTimeBetweenVisitPublish;
}

- (void)setMinTimeBetweenVisitPublish:(double)a3
{
  self->_minTimeBetweenVisitPublish = a3;
}

- (double)heartbeatPublish
{
  return self->_heartbeatPublish;
}

- (void)setHeartbeatPublish:(double)a3
{
  self->_heartbeatPublish = a3;
}

- (double)continuesPublishThreshold
{
  return self->_continuesPublishThreshold;
}

- (void)setContinuesPublishThreshold:(double)a3
{
  self->_continuesPublishThreshold = a3;
}

- (double)onDemandPublishThreshold
{
  return self->_onDemandPublishThreshold;
}

- (void)setOnDemandPublishThreshold:(double)a3
{
  self->_onDemandPublishThreshold = a3;
}

- (double)expirationInterval
{
  return self->_expirationInterval;
}

- (void)setExpirationInterval:(double)a3
{
  self->_double expirationInterval = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (double)stalenessThreshold
{
  return self->_stalenessThreshold;
}

- (void)setStalenessThreshold:(double)a3
{
  self->_stalenessThreshold = a3;
}

- (BOOL)shouldWakeDevice
{
  return self->_shouldWakeDevice;
}

- (void)setShouldWakeDevice:(BOOL)a3
{
  self->_shouldWakeDevice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredAccuracy, 0);

  objc_storeStrong((id *)&self->_policyName, 0);
}

@end