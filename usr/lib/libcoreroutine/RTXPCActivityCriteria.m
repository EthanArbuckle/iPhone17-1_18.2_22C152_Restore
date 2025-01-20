@interface RTXPCActivityCriteria
+ (const)convertNetworkTransferDirection:(unint64_t)a3;
+ (const)convertPriority:(unint64_t)a3;
- (BOOL)allowBattery;
- (BOOL)cpuIntensive;
- (BOOL)isEqual:(id)a3;
- (BOOL)postInstall;
- (BOOL)powerNap;
- (BOOL)requireInexpensiveNetworkConnectivity;
- (BOOL)requireNetworkConnectivity;
- (BOOL)requiresBuddyComplete;
- (BOOL)userRequestedBackgroundTask;
- (NSMutableDictionary)additionalCriteria;
- (NSNumber)requireBatteryLevel;
- (RTXPCActivityCriteria)init;
- (RTXPCActivityCriteria)initWithInterval:(double)a3 gracePeriod:(double)a4 priority:(unint64_t)a5 requireNetworkConnectivity:(BOOL)a6 requireInexpensiveNetworkConnectivity:(BOOL)a7 networkTransferDirection:(unint64_t)a8 allowBattery:(BOOL)a9 powerNap:(BOOL)a10;
- (RTXPCActivityCriteria)initWithInterval:(double)a3 gracePeriod:(double)a4 priority:(unint64_t)a5 requireNetworkConnectivity:(BOOL)a6 requireInexpensiveNetworkConnectivity:(BOOL)a7 networkTransferDirection:(unint64_t)a8 allowBattery:(BOOL)a9 powerNap:(BOOL)a10 delay:(double)a11;
- (RTXPCActivityCriteria)initWithInterval:(double)a3 gracePeriod:(double)a4 priority:(unint64_t)a5 requireNetworkConnectivity:(BOOL)a6 requireInexpensiveNetworkConnectivity:(BOOL)a7 networkTransferUploadSize:(unint64_t)a8 networkTransferDownloadSize:(unint64_t)a9 allowBattery:(BOOL)a10 powerNap:(BOOL)a11 delay:(double)a12 requireBatteryLevel:(id)a13;
- (double)delay;
- (double)expectedDuration;
- (double)gracePeriod;
- (double)interval;
- (id)description;
- (unint64_t)networkTransferDirection;
- (unint64_t)networkTransferDownloadSize;
- (unint64_t)networkTransferUploadSize;
- (unint64_t)priority;
- (void)setAdditionalCriteria:(id)a3;
- (void)setCpuIntensive:(BOOL)a3;
- (void)setExpectedDuration:(double)a3;
- (void)setPostInstall:(BOOL)a3;
- (void)setRequiresBuddyComplete:(BOOL)a3;
- (void)setUserRequestedBackgroundTask:(BOOL)a3;
@end

@implementation RTXPCActivityCriteria

+ (const)convertPriority:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a3 == 2)
    {
      v4 = (const char **)MEMORY[0x1E4F142E0];
      return *v4;
    }
    if (a3 == 1)
    {
      v4 = (const char **)MEMORY[0x1E4F142D0];
      return *v4;
    }
    v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 134218498;
      unint64_t v8 = a3;
      __int16 v9 = 2080;
      v10 = "+[RTXPCActivityCriteria convertPriority:]";
      __int16 v11 = 1024;
      int v12 = 81;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "unsupported priority, %lu (in %s:%d)", (uint8_t *)&v7, 0x1Cu);
    }
  }
  return 0;
}

+ (const)convertNetworkTransferDirection:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  result = 0;
  switch(a3)
  {
    case 0uLL:
      return result;
    case 1uLL:
      v5 = (const char **)MEMORY[0x1E4F142A0];
      goto LABEL_8;
    case 2uLL:
      v5 = (const char **)MEMORY[0x1E4F14260];
      goto LABEL_8;
    case 3uLL:
      v5 = (const char **)MEMORY[0x1E4F14268];
LABEL_8:
      result = *v5;
      break;
    default:
      v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v7 = 134218498;
        unint64_t v8 = a3;
        __int16 v9 = 2080;
        v10 = "+[RTXPCActivityCriteria convertNetworkTransferDirection:]";
        __int16 v11 = 1024;
        int v12 = 101;
        _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "unsupported network transfer direction, %lu (in %s:%d)", (uint8_t *)&v7, 0x1Cu);
      }

      result = 0;
      break;
  }
  return result;
}

- (RTXPCActivityCriteria)init
{
  return [(RTXPCActivityCriteria *)self initWithInterval:1 gracePeriod:0 priority:0 requireNetworkConnectivity:0 requireInexpensiveNetworkConnectivity:0 networkTransferDirection:0 allowBattery:1.79769313e308 powerNap:1.79769313e308];
}

- (RTXPCActivityCriteria)initWithInterval:(double)a3 gracePeriod:(double)a4 priority:(unint64_t)a5 requireNetworkConnectivity:(BOOL)a6 requireInexpensiveNetworkConnectivity:(BOOL)a7 networkTransferDirection:(unint64_t)a8 allowBattery:(BOOL)a9 powerNap:(BOOL)a10 delay:(double)a11
{
  BOOL v13 = a9;
  BOOL v15 = a7;
  BOOL v16 = a6;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a8 >= 4)
  {
    v23 = _rt_log_facility_get_os_log(RTLogFacilityXPCActivity);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v27 = a8;
      _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "receive unexpected network transfer direction when initializing criteria, %d", buf, 8u);
    }

    uint64_t v21 = 0;
    uint64_t v22 = 0;
  }
  else
  {
    uint64_t v21 = qword_1DA0FF7C0[a8];
    uint64_t v22 = qword_1DA0FF7E0[a8];
  }
  LOBYTE(v25) = a10;
  return [(RTXPCActivityCriteria *)self initWithInterval:a5 gracePeriod:v16 priority:v15 requireNetworkConnectivity:v21 requireInexpensiveNetworkConnectivity:v22 networkTransferUploadSize:v13 networkTransferDownloadSize:a3 allowBattery:a4 powerNap:a11 delay:v25 requireBatteryLevel:0];
}

- (RTXPCActivityCriteria)initWithInterval:(double)a3 gracePeriod:(double)a4 priority:(unint64_t)a5 requireNetworkConnectivity:(BOOL)a6 requireInexpensiveNetworkConnectivity:(BOOL)a7 networkTransferDirection:(unint64_t)a8 allowBattery:(BOOL)a9 powerNap:(BOOL)a10
{
  return -[RTXPCActivityCriteria initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferDirection:allowBattery:powerNap:delay:](self, "initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferDirection:allowBattery:powerNap:delay:", a5, a6, a7, a8, a9, a10);
}

- (RTXPCActivityCriteria)initWithInterval:(double)a3 gracePeriod:(double)a4 priority:(unint64_t)a5 requireNetworkConnectivity:(BOOL)a6 requireInexpensiveNetworkConnectivity:(BOOL)a7 networkTransferUploadSize:(unint64_t)a8 networkTransferDownloadSize:(unint64_t)a9 allowBattery:(BOOL)a10 powerNap:(BOOL)a11 delay:(double)a12 requireBatteryLevel:(id)a13
{
  id v23 = a13;
  if (a3 < 0.0)
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v25 = "Invalid parameter not satisfying: interval >= 0";
LABEL_10:
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, v25, buf, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (a4 < 0.0)
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v25 = "Invalid parameter not satisfying: gracePeriod >= 0";
      goto LABEL_10;
    }
LABEL_11:

    v26 = 0;
    goto LABEL_12;
  }
  if (a12 < 0.0)
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v25 = "Invalid parameter not satisfying: delay >= 0";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v30.receiver = self;
  v30.super_class = (Class)RTXPCActivityCriteria;
  uint64_t v28 = [(RTXPCActivityCriteria *)&v30 init];
  v29 = v28;
  if (v28)
  {
    v28->_interval = a3;
    v28->_delay = a12;
    v28->_gracePeriod = a4;
    v28->_priority = a5;
    v28->_requireNetworkConnectivity = a6;
    v28->_requireInexpensiveNetworkConnectivity = a7;
    v28->_networkTransferUploadSize = a8;
    v28->_networkTransferDownloadSize = a9;
    v28->_allowBattery = a10;
    v28->_powerNap = a11;
    v28->_expectedDuration = NAN;
    *(_DWORD *)&v28->_cpuIntensive = 0;
    objc_storeStrong((id *)&v28->_requireBatteryLevel, a13);
  }
  self = v29;
  v26 = self;
LABEL_12:

  return v26;
}

- (id)description
{
  uint64_t v28 = NSString;
  [(RTXPCActivityCriteria *)self interval];
  uint64_t v4 = v3;
  [(RTXPCActivityCriteria *)self delay];
  uint64_t v6 = v5;
  [(RTXPCActivityCriteria *)self gracePeriod];
  uint64_t v8 = v7;
  uint64_t v27 = [objc_opt_class() convertPriority:-[RTXPCActivityCriteria priority](self, "priority")];
  if ([(RTXPCActivityCriteria *)self requireNetworkConnectivity]) {
    __int16 v9 = @"YES";
  }
  else {
    __int16 v9 = @"NO";
  }
  v26 = v9;
  if ([(RTXPCActivityCriteria *)self requireInexpensiveNetworkConnectivity]) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  uint64_t v25 = v10;
  uint64_t v11 = [objc_opt_class() convertNetworkTransferDirection:-[RTXPCActivityCriteria networkTransferDirection](self, "networkTransferDirection")];
  if ([(RTXPCActivityCriteria *)self allowBattery]) {
    int v12 = @"YES";
  }
  else {
    int v12 = @"NO";
  }
  if ([(RTXPCActivityCriteria *)self powerNap]) {
    BOOL v13 = @"YES";
  }
  else {
    BOOL v13 = @"NO";
  }
  [(RTXPCActivityCriteria *)self expectedDuration];
  uint64_t v15 = v14;
  if ([(RTXPCActivityCriteria *)self cpuIntensive]) {
    BOOL v16 = @"YES";
  }
  else {
    BOOL v16 = @"NO";
  }
  if ([(RTXPCActivityCriteria *)self userRequestedBackgroundTask]) {
    v17 = @"YES";
  }
  else {
    v17 = @"NO";
  }
  if ([(RTXPCActivityCriteria *)self postInstall]) {
    v18 = @"YES";
  }
  else {
    v18 = @"NO";
  }
  if ([(RTXPCActivityCriteria *)self requiresBuddyComplete]) {
    v19 = @"YES";
  }
  else {
    v19 = @"NO";
  }
  unint64_t v20 = [(RTXPCActivityCriteria *)self networkTransferUploadSize];
  unint64_t v21 = [(RTXPCActivityCriteria *)self networkTransferDownloadSize];
  uint64_t v22 = [(RTXPCActivityCriteria *)self requireBatteryLevel];
  objc_msgSend(v28, "stringWithFormat:", @"interval, %.2f, delay, %.2f, gracePeriod, %.2f, priority, %s, requireNetworkConnectivity, %@, requireInexpensiveNetworkConnectivity, %@, networkTransferDirection, %s, allowBattery, %@, powerNap, %@, expectedDuration, %.2f, cpuIntensive, %@, userRequestedBackgroundTask, %@, postInstall, %@, requiresBuddyComplete, %@, uploadSize, %d, downloadSize, %d, requireBatteryLevel, %@", v4, v6, v8, v27, v26, v25, v11, v12, v13, v15, v16, v17, v18, v19, v20, v21,
  id v23 = v22);

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  [(RTXPCActivityCriteria *)self interval];
  double v6 = v5;
  [v4 interval];
  if (v6 != v7) {
    goto LABEL_18;
  }
  [(RTXPCActivityCriteria *)self delay];
  double v9 = v8;
  [v4 delay];
  if (v9 != v10) {
    goto LABEL_18;
  }
  [(RTXPCActivityCriteria *)self gracePeriod];
  double v12 = v11;
  [v4 gracePeriod];
  if (v12 != v13) {
    goto LABEL_18;
  }
  unint64_t v14 = [(RTXPCActivityCriteria *)self priority];
  if (v14 != [v4 priority]) {
    goto LABEL_18;
  }
  int v15 = [(RTXPCActivityCriteria *)self requireNetworkConnectivity];
  if (v15 != [v4 requireNetworkConnectivity]) {
    goto LABEL_18;
  }
  int v16 = [(RTXPCActivityCriteria *)self requireInexpensiveNetworkConnectivity];
  if (v16 != [v4 requireInexpensiveNetworkConnectivity]) {
    goto LABEL_18;
  }
  unint64_t v17 = [(RTXPCActivityCriteria *)self networkTransferDirection];
  if (v17 != [v4 networkTransferDirection]) {
    goto LABEL_18;
  }
  int v18 = [(RTXPCActivityCriteria *)self allowBattery];
  if (v18 != [v4 allowBattery]) {
    goto LABEL_18;
  }
  int v19 = [(RTXPCActivityCriteria *)self powerNap];
  if (v19 != [v4 powerNap]) {
    goto LABEL_18;
  }
  [(RTXPCActivityCriteria *)self expectedDuration];
  double v21 = v20;
  [v4 expectedDuration];
  if (v21 != v22) {
    goto LABEL_18;
  }
  int v23 = [(RTXPCActivityCriteria *)self cpuIntensive];
  if (v23 == [v4 cpuIntensive]
    && (int v24 = [(RTXPCActivityCriteria *)self userRequestedBackgroundTask],
        v24 == [v4 userRequestedBackgroundTask])
    && (int v25 = [(RTXPCActivityCriteria *)self postInstall],
        v25 == [v4 postInstall])
    && (int v26 = [(RTXPCActivityCriteria *)self requiresBuddyComplete],
        v26 == [v4 requiresBuddyComplete])
    && (unint64_t v27 = [(RTXPCActivityCriteria *)self networkTransferUploadSize],
        v27 == [v4 networkTransferUploadSize])
    && (unint64_t v28 = [(RTXPCActivityCriteria *)self networkTransferDownloadSize],
        v28 == [v4 networkTransferDownloadSize]))
  {
    v29 = [(RTXPCActivityCriteria *)self requireBatteryLevel];
    objc_super v30 = [v4 requireBatteryLevel];
    BOOL v31 = v29 == v30;
  }
  else
  {
LABEL_18:
    BOOL v31 = 0;
  }

  return v31;
}

- (double)interval
{
  return self->_interval;
}

- (double)delay
{
  return self->_delay;
}

- (double)gracePeriod
{
  return self->_gracePeriod;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (BOOL)requireNetworkConnectivity
{
  return self->_requireNetworkConnectivity;
}

- (BOOL)requireInexpensiveNetworkConnectivity
{
  return self->_requireInexpensiveNetworkConnectivity;
}

- (unint64_t)networkTransferDirection
{
  return self->_networkTransferDirection;
}

- (BOOL)allowBattery
{
  return self->_allowBattery;
}

- (BOOL)powerNap
{
  return self->_powerNap;
}

- (unint64_t)networkTransferUploadSize
{
  return self->_networkTransferUploadSize;
}

- (unint64_t)networkTransferDownloadSize
{
  return self->_networkTransferDownloadSize;
}

- (NSNumber)requireBatteryLevel
{
  return self->_requireBatteryLevel;
}

- (double)expectedDuration
{
  return self->_expectedDuration;
}

- (void)setExpectedDuration:(double)a3
{
  self->_expectedDuration = a3;
}

- (BOOL)cpuIntensive
{
  return self->_cpuIntensive;
}

- (void)setCpuIntensive:(BOOL)a3
{
  self->_cpuIntensive = a3;
}

- (BOOL)userRequestedBackgroundTask
{
  return self->_userRequestedBackgroundTask;
}

- (void)setUserRequestedBackgroundTask:(BOOL)a3
{
  self->_userRequestedBackgroundTask = a3;
}

- (BOOL)postInstall
{
  return self->_postInstall;
}

- (void)setPostInstall:(BOOL)a3
{
  self->_postInstall = a3;
}

- (BOOL)requiresBuddyComplete
{
  return self->_requiresBuddyComplete;
}

- (void)setRequiresBuddyComplete:(BOOL)a3
{
  self->_requiresBuddyComplete = a3;
}

- (NSMutableDictionary)additionalCriteria
{
  return self->_additionalCriteria;
}

- (void)setAdditionalCriteria:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalCriteria, 0);

  objc_storeStrong((id *)&self->_requireBatteryLevel, 0);
}

@end