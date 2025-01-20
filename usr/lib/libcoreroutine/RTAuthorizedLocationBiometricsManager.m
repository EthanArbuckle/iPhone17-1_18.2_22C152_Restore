@interface RTAuthorizedLocationBiometricsManager
- (BOOL)_getTimeSinceLastSuccessfulBiometricAuthentication:(double *)a3;
- (BOOL)defaultOverrideTimeSinceLastSuccessfulBiometricAuthentication:(double *)a3;
- (NSDate)dateOfLastUpdate;
- (NSDate)dateOfMostRecentBiometricAuthentication;
- (RTAuthorizedLocationBiometricsManager)initWithTrustedTimeCache:(id)a3 defaultsManager:(id)a4;
- (RTDefaultsManager)defaultsManager;
- (RTPlatform)platform;
- (RTTrustedTimeCache)trustedTimeCache;
- (id)updateDateOfLastSuccessfulBiometricAuthentication;
- (void)setDateOfLastUpdate:(id)a3;
- (void)setDateOfMostRecentBiometricAuthentication:(id)a3;
@end

@implementation RTAuthorizedLocationBiometricsManager

- (RTAuthorizedLocationBiometricsManager)initWithTrustedTimeCache:(id)a3 defaultsManager:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[RTAuthorizedLocationBiometricsManager initWithTrustedTimeCache:defaultsManager:]";
    __int16 v22 = 1024;
    int v23 = 39;
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: trustedTimeCache (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[RTAuthorizedLocationBiometricsManager initWithTrustedTimeCache:defaultsManager:]";
      __int16 v22 = 1024;
      int v23 = 40;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  v19.receiver = self;
  v19.super_class = (Class)RTAuthorizedLocationBiometricsManager;
  v12 = [(RTAuthorizedLocationBiometricsManager *)&v19 init];
  if (v12)
  {
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] distantPast];
    dateOfLastUpdate = v12->_dateOfLastUpdate;
    v12->_dateOfLastUpdate = (NSDate *)v13;

    dateOfMostRecentBiometricAuthentication = v12->_dateOfMostRecentBiometricAuthentication;
    v12->_dateOfMostRecentBiometricAuthentication = 0;

    objc_storeStrong((id *)&v12->_trustedTimeCache, a3);
    objc_storeStrong((id *)&v12->_defaultsManager, a4);
    uint64_t v16 = objc_opt_new();
    platform = v12->_platform;
    v12->_platform = (RTPlatform *)v16;
  }
  return v12;
}

- (id)updateDateOfLastSuccessfulBiometricAuthentication
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v4 = [(RTTrustedTimeCache *)self->_trustedTimeCache getApproximateTrustedDateNowWithUnsecureFallback];
  v5 = v4;
  if (!v4)
  {
    v10 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    uint64_t v16 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v16);
    uint64_t v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v25 = v12;
    __int16 v26 = 2112;
    v27 = v13;
    v15 = "%@:%@ BKDevice, BKDeviceDescriptor, unable to fetch trustedNow, not updating dateOfMostRecentBiometricAuthentication.";
    goto LABEL_13;
  }
  [v4 timeIntervalSinceDate:self->_dateOfLastUpdate];
  double v7 = v6;
  if (v6 > 900.0)
  {
    double v23 = 0.0;
    if ([(RTAuthorizedLocationBiometricsManager *)self _getTimeSinceLastSuccessfulBiometricAuthentication:&v23])
    {
      id v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v5 sinceDate:-v23];
      dateOfMostRecentBiometricAuthentication = self->_dateOfMostRecentBiometricAuthentication;
      self->_dateOfMostRecentBiometricAuthentication = v8;

      objc_storeStrong((id *)&self->_dateOfLastUpdate, v5);
      v10 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        uint64_t v13 = NSStringFromSelector(a2);
        v14 = self->_dateOfMostRecentBiometricAuthentication;
        *(_DWORD *)buf = 138412802;
        v25 = v12;
        __int16 v26 = 2112;
        v27 = v13;
        __int16 v28 = 2112;
        v29 = v14;
        v15 = "%@:%@, updated dateOfMostRecentBiometricAuthentication to %@.";
LABEL_10:
        v18 = v10;
        uint32_t v19 = 32;
LABEL_14:
        _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_DEFAULT, v15, buf, v19);

        goto LABEL_15;
      }
      goto LABEL_15;
    }
    v10 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    v20 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v20);
    uint64_t v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v25 = v12;
    __int16 v26 = 2112;
    v27 = v13;
    v15 = "%@:%@, unable to get time since last successful biometric authentication (possibly none since last boot), not "
          "updating dateOfMostRecentBiometricAuthentication.";
LABEL_13:
    v18 = v10;
    uint32_t v19 = 22;
    goto LABEL_14;
  }
  v10 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v17);
    uint64_t v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v25 = v12;
    __int16 v26 = 2112;
    v27 = v13;
    __int16 v28 = 2048;
    v29 = *(NSDate **)&v7;
    v15 = "%@:%@, updated dateOfMostRecentBiometricAuthentication %f seconds ago, not updating now.";
    goto LABEL_10;
  }
LABEL_15:

  v21 = self->_dateOfMostRecentBiometricAuthentication;
  return v21;
}

- (BOOL)defaultOverrideTimeSinceLastSuccessfulBiometricAuthentication:(double *)a3
{
  v4 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"RTDefaultsAuthorizedLocationSecondsSinceLastBiometricAuthentication"];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [v4 floatValue];
    *a3 = v5;
    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_getTimeSinceLastSuccessfulBiometricAuthentication:(double *)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  if ([(RTPlatform *)self->_platform internalInstall]
    && [(RTAuthorizedLocationBiometricsManager *)self defaultOverrideTimeSinceLastSuccessfulBiometricAuthentication:a3])
  {
    float v5 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v6 = (objc_class *)objc_opt_class();
      double v7 = NSStringFromClass(v6);
      id v8 = NSStringFromSelector(a2);
      uint64_t v9 = *(void *)a3;
      *(_DWORD *)buf = 138412802;
      v57 = v7;
      __int16 v58 = 2112;
      v59 = v8;
      __int16 v60 = 2048;
      *(void *)v61 = v9;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ Using defaults override for timeSinceLastSuccessfulBiometricAuthentication_s, %.3f", buf, 0x20u);
    }
    BOOL v10 = 1;
    goto LABEL_34;
  }
  v47 = a3;
  [MEMORY[0x1E4F50518] availableDevices];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  float v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v5 countByEnumeratingWithState:&v52 objects:v62 count:16];
  v48 = v5;
  if (!v11) {
    goto LABEL_17;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v53;
  while (2)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v53 != v13) {
        objc_enumerationMutation(v5);
      }
      v15 = *(void **)(*((void *)&v52 + 1) + 8 * i);
      uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (objc_class *)objc_opt_class();
        v18 = NSStringFromClass(v17);
        uint32_t v19 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        v57 = v18;
        __int16 v58 = 2112;
        v59 = v19;
        __int16 v60 = 2112;
        *(void *)v61 = v15;
        _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_DEFAULT, "%@:%@ BKDevice, BKDeviceDescriptor, %@, ", buf, 0x20u);

        float v5 = v48;
      }

      if ([v15 type] == 1 || objc_msgSend(v15, "type") == 2)
      {
        id v51 = 0;
        v21 = [MEMORY[0x1E4F50500] deviceWithDescriptor:v15 error:&v51];
        id v22 = v51;
        double v23 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = (objc_class *)objc_opt_class();
          v25 = NSStringFromClass(v24);
          __int16 v26 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412802;
          v57 = v25;
          __int16 v58 = 2112;
          v59 = v26;
          __int16 v60 = 2112;
          *(void *)v61 = v21;
          _os_log_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_DEFAULT, "%@:%@ BKDevice, %@, ", buf, 0x20u);

          float v5 = v48;
        }

        if (!v21)
        {
          id v20 = v22;
          goto LABEL_25;
        }
        id v50 = v22;
        v27 = [v21 lastMatchEventWithError:&v50];
        id v20 = v50;

        BOOL v10 = v27 != 0;
        if (v27)
        {
          -[RTTrustedTimeCache convertMachContinuousTicksToSeconds:](self->_trustedTimeCache, "convertMachContinuousTicksToSeconds:", [v27 timeStamp]);
          double v29 = v28;
          [(RTTrustedTimeCache *)self->_trustedTimeCache machContinuousTimeSeconds];
          double *v47 = v30 - v29;
          v31 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
          if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
LABEL_31:
            float v5 = v48;
            goto LABEL_32;
          }
          v32 = (objc_class *)objc_opt_class();
          v33 = NSStringFromClass(v32);
          v34 = NSStringFromSelector(a2);
          int v35 = [v27 result];
          double v36 = *v47;
          *(_DWORD *)buf = 138413314;
          v57 = v33;
          __int16 v58 = 2112;
          v59 = v34;
          __int16 v60 = 1026;
          *(_DWORD *)v61 = v35;
          *(_WORD *)&v61[4] = 2050;
          *(double *)&v61[6] = v29;
          *(_WORD *)&v61[14] = 2050;
          *(double *)&v61[16] = v36;
          v37 = "%@:%@ BKDevice, BKMatchEvent, result %{public}d, timestamp, %{public}.1f, timeSinceLastSuccessfulBiometr"
                "icAuthentication, %{public}.1f";
          v38 = v31;
          uint32_t v39 = 48;
        }
        else
        {
          v31 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
          if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
LABEL_32:

            goto LABEL_33;
          }
          v40 = (objc_class *)objc_opt_class();
          v33 = NSStringFromClass(v40);
          v34 = NSStringFromSelector(a2);
          double v41 = *v47;
          *(_DWORD *)buf = 138413058;
          v57 = v33;
          __int16 v58 = 2112;
          v59 = v34;
          __int16 v60 = 2112;
          *(void *)v61 = v20;
          *(_WORD *)&v61[8] = 2050;
          *(double *)&v61[10] = v41;
          v37 = "%@:%@ BKDevice, BKMatchEvent, nil, error, %@, returning timeSinceLastSuccessfulBiometricAuthentication, %{public}.1f";
          v38 = v31;
          uint32_t v39 = 42;
        }
        _os_log_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_DEFAULT, v37, buf, v39);

        goto LABEL_31;
      }
    }
    uint64_t v12 = [v5 countByEnumeratingWithState:&v52 objects:v62 count:16];
    if (v12) {
      continue;
    }
    break;
  }
LABEL_17:

  id v20 = 0;
LABEL_25:
  v21 = _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v43 = (objc_class *)objc_opt_class();
    v44 = NSStringFromClass(v43);
    v45 = NSStringFromSelector(a2);
    double v46 = *v47;
    *(_DWORD *)buf = 138413058;
    v57 = v44;
    __int16 v58 = 2112;
    v59 = v45;
    __int16 v60 = 2112;
    *(void *)v61 = v20;
    *(_WORD *)&v61[8] = 2050;
    *(double *)&v61[10] = v46;
    _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "%@:%@ BKDevice, failed to get device, error, %@, returning timeSinceLastSuccessfulBiometricAuthentication, %{public}.1f", buf, 0x2Au);

    float v5 = v48;
  }
  BOOL v10 = 0;
LABEL_33:

LABEL_34:
  return v10;
}

- (NSDate)dateOfLastUpdate
{
  return self->_dateOfLastUpdate;
}

- (void)setDateOfLastUpdate:(id)a3
{
}

- (NSDate)dateOfMostRecentBiometricAuthentication
{
  return self->_dateOfMostRecentBiometricAuthentication;
}

- (void)setDateOfMostRecentBiometricAuthentication:(id)a3
{
}

- (RTTrustedTimeCache)trustedTimeCache
{
  return self->_trustedTimeCache;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_trustedTimeCache, 0);
  objc_storeStrong((id *)&self->_dateOfMostRecentBiometricAuthentication, 0);

  objc_storeStrong((id *)&self->_dateOfLastUpdate, 0);
}

@end