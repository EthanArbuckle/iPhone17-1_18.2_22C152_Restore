@interface CLDurianTask
+ (id)checkCrashesTask;
+ (id)configureRangingHawkeyeTaskWithPayload:(char *)a3;
+ (id)configureRangingNonOwnerTaskWithPayload:(char *)a3;
+ (id)configureSeparatedStateHawkeyeTaskWithConfiguration:(id)a3 currentIndex:(unsigned int)a4;
+ (id)deinitRangingHawkeyeTask;
+ (id)deinitRangingNonOwnerTask;
+ (id)dumpNordicCrashesTask;
+ (id)dumpNordicLogsTask;
+ (id)dumpRoseCrashesTask;
+ (id)dumpRoseLogsTask;
+ (id)enablePersistentConnectionsHawkeyeTask:(BOOL)a3;
+ (id)fetchAccelerometerModeTask;
+ (id)fetchAccelerometerOrientationModeConfigurationTask;
+ (id)fetchAccelerometerSlopeModeConfigurationTask;
+ (id)fetchAccessoryCapabilitiesGATTTask;
+ (id)fetchAccessoryCategoryGATTTask;
+ (id)fetchBatteryLevelGATTTask;
+ (id)fetchBatteryStatusTask;
+ (id)fetchBatteryTypeGATTTask;
+ (id)fetchCurrentKeyIndexTask;
+ (id)fetchFindMyVersionGATTTask;
+ (id)fetchFirmwareVersionGATTTask;
+ (id)fetchFirmwareVersionTaskWithCrashLogs:(BOOL)a3;
+ (id)fetchHeleAccessoryCapabilitiesTask;
+ (id)fetchHeleBatteryLevelTask;
+ (id)fetchHeleFirmwareVersionTask;
+ (id)fetchManufacturerNameGATTTask;
+ (id)fetchModelColorCodeGATTTask;
+ (id)fetchModelNameGATTTask;
+ (id)fetchMultiStatusTask;
+ (id)fetchNonOwnerAccessoryCapabilitiesPoshTask;
+ (id)fetchNonOwnerAccessoryCapabilitiesTask;
+ (id)fetchNonOwnerAccessoryCategoryPoshTask;
+ (id)fetchNonOwnerAccessoryCategoryTask;
+ (id)fetchNonOwnerBatteryLevelPoshTask;
+ (id)fetchNonOwnerBatteryLevelTask;
+ (id)fetchNonOwnerBatteryTypePoshTask;
+ (id)fetchNonOwnerBatteryTypeTask;
+ (id)fetchNonOwnerFindMyVersionTask;
+ (id)fetchNonOwnerFirmwareVersionPoshTask;
+ (id)fetchNonOwnerFirmwareVersionTask;
+ (id)fetchNonOwnerManufacturerNamePoshTask;
+ (id)fetchNonOwnerManufacturerNameTask;
+ (id)fetchNonOwnerModelNamePoshTask;
+ (id)fetchNonOwnerModelNameTask;
+ (id)fetchNonOwnerNetworkIdPoshTask;
+ (id)fetchNonOwnerProductDataPoshTask;
+ (id)fetchNonOwnerProductDataTask;
+ (id)fetchNonOwnerProtocolImplementationPoshTask;
+ (id)fetchNonOwnerSerialNumberPoshTask;
+ (id)fetchNonOwnerTxPowerTask;
+ (id)fetchProductDataGATTTask;
+ (id)fetchTxPowerGATTTask;
+ (id)fetchTxPowerTask;
+ (id)fetchUserStatsTaskWithPersistence_v0:(BOOL)a3;
+ (id)fetchUserStatsTaskWithPersistence_v1:(BOOL)a3;
+ (id)fetchUserStatsTaskWithPersistence_v2:(BOOL)a3;
+ (id)fwdlAbortTask;
+ (id)getCurrentPrimaryKeyTask;
+ (id)getGroupStatusHawkeyeTask;
+ (id)getMultiStatusHawkeyeTask;
+ (id)getSerialNumberTask;
+ (id)getiCloudIdentifierTask;
+ (id)induceCrashTask;
+ (id)initRangingHawkeyeTask;
+ (id)initRoseNonOwnerTaskWithParameters:(id)a3;
+ (id)initRoseTaskWithParameters:(id)a3;
+ (id)latchSeparatedKeyHawkeyeTask;
+ (id)leashDisableTask;
+ (id)leashTask;
+ (id)placeholderHawkeyeTask;
+ (id)resetHawkeyeTask;
+ (id)retrieveLogsHawkeyeTask;
+ (id)rollWildKeyTask;
+ (id)sendUARPMessageTaskWithPayload:(id)a3;
+ (id)setAbsoluteWildModeConfigurationTaskWithConfiguration:(id)a3;
+ (id)setAccelerometerOrientationModeConfigurationTaskWithConfiguration:(id)a3;
+ (id)setAccelerometerSlopeModeConfigurationTaskWithConfiguration:(id)a3;
+ (id)setBatteryStatusTaskWithBatteryStatus:(unint64_t)a3;
+ (id)setCentralReferenceTimeTask;
+ (id)setHawkeyeUTMotionConfigWithSeparatedUTTimeoutSeconds:(unsigned int)a3 separatedUTBackoffTimeoutSeconds:(unsigned int)a4;
+ (id)setKeyRotationTimeoutHawkeyeTaskWithTimeout:(unsigned int)a3;
+ (id)setKeyRotationTimeoutTaskWithTimeout:(unsigned int)a3;
+ (id)setMaxConnectionsHawkeyeTaskWithCount:(unsigned __int8)a3;
+ (id)setMaxConnectionsTaskWithCount:(unsigned __int8)a3;
+ (id)setMutexAction:(unsigned __int8)a3;
+ (id)setMutexAction:(unsigned __int8)a3 withLatency:(int64_t)a4;
+ (id)setNearOwnerTimeoutTaskWithTimeout:(unsigned __int16)a3;
+ (id)setNearbyTimeoutHawkeyeTaskWithTimeout:(unsigned __int16)a3 asHele:(BOOL)a4;
+ (id)setObfuscatedIdentifierTaskWithIdentifier:(id)a3;
+ (id)setRoseRangingParametersTaskWithParameters:(id)a3;
+ (id)setTagTypeTaskWithType:(unsigned __int8)a3;
+ (id)setUnauthorizedPlaySoundRateLimitTask:(BOOL)a3;
+ (id)setUtcHawkeyeTask;
+ (id)setWildModeConfigurationTaskWithConfiguration:(id)a3;
+ (id)startAggressiveAdvertisingTaskWithTimeout:(unsigned int)a3;
+ (id)startNonOwnerAggressiveAdvertisingTask;
+ (id)startNonOwnerPoshAggressiveAdvertisingTask;
+ (id)startNonOwnerShortSoundHawkeyeTask;
+ (id)startNonOwnerShortSoundPoshTask;
+ (id)startNonOwnerSoundHawkeyeTask;
+ (id)startNonOwnerSoundPoshTask;
+ (id)startRangingHawkeyeTaskWithTargetEventCounter:(unsigned __int16)a3;
+ (id)startRangingNonOwnerTaskWithTargetEventCounter:(unsigned __int16)a3;
+ (id)startRoseRangingTaskWithParameters:(id)a3;
+ (id)startShortSoundHawkeyeTask;
+ (id)startSoundHawkeyeTask;
+ (id)startSoundSequenceTaskWithEncodedSequence:(id)a3;
+ (id)startUnauthorizedShortSoundTask;
+ (id)startUnauthorizedSoundTask;
+ (id)stopAggressiveAdvertisingTask;
+ (id)stopNonOwnerSoundHawkeyeTask;
+ (id)stopNonOwnerSoundPoshTask;
+ (id)stopRangingHawkeyeTask;
+ (id)stopRangingNonOwnerTask;
+ (id)stopRoseRangingTask;
+ (id)stopRoseTaskWithParameters:(id)a3;
+ (id)stopSoundHawkeyeTask;
+ (id)stopSoundTask;
+ (id)testModeTask:(unsigned __int8)a3;
+ (id)unpairHawkeyeTask;
+ (id)unpairTask;
- (BOOL)completeOnPreemption;
- (BOOL)expectsResponse;
- (BOOL)isCancelled;
- (BOOL)isMutexProtectedRangingTask;
- (BOOL)isMutexProtectedSoundTask;
- (BOOL)requiresMutex;
- (BOOL)shouldCompleteOnPreemptionByTask:(id)a3;
- (BOOL)shouldPreemptTask:(id)a3;
- (BOOL)userTask;
- (CLDurianCommand)command;
- (CLDurianTask)init;
- (CLDurianTask)initWithCommand:(id)a3 desiredLatency:(int64_t)a4 expectsResponse:(BOOL)a5 completeOnPreemption:(BOOL)a6 requiresMutex:(BOOL)a7;
- (NSUUID)uuid;
- (double)executionDuration;
- (double)queueDuration;
- (id)description;
- (id)opcodeDescription;
- (int64_t)desiredLatency;
- (int64_t)timeoutSeconds;
- (unint64_t)completionTime;
- (unint64_t)creationTime;
- (unint64_t)startTime;
- (unsigned)translatedOpcode;
- (void)cancel;
- (void)complete;
- (void)dealloc;
- (void)setCommand:(id)a3;
- (void)setExpectsResponse:(BOOL)a3;
- (void)setRequiresMutex:(BOOL)a3;
- (void)willStart;
@end

@implementation CLDurianTask

- (CLDurianTask)init
{
  return 0;
}

- (CLDurianTask)initWithCommand:(id)a3 desiredLatency:(int64_t)a4 expectsResponse:(BOOL)a5 completeOnPreemption:(BOOL)a6 requiresMutex:(BOOL)a7
{
  v14.receiver = self;
  v14.super_class = (Class)CLDurianTask;
  v12 = [(CLDurianTask *)&v14 init];
  if (v12)
  {
    v12->_uuid = (NSUUID *)objc_alloc_init((Class)NSUUID);
    v12->_command = (CLDurianCommand *)a3;
    v12->_desiredLatency = a4;
    v12->_expectsResponse = a5;
    v12->_completeOnPreemption = a6;
    v12->_requiresMutex = a7;
    v12->_creationTime = mach_continuous_time();
    v12->_completionTime = 0;
    v12->_userTask = 1;
  }
  return v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLDurianTask;
  [(CLDurianTask *)&v3 dealloc];
}

- (int64_t)timeoutSeconds
{
  int v2 = [(CLDurianTask *)self translatedOpcode];
  if (v2 <= 174)
  {
    if (v2 != 3)
    {
      if (v2 == 15) {
        return 20;
      }
      if (v2 == 40) {
        return 60;
      }
      return 5;
    }
    return 3600;
  }
  else
  {
    if (v2 <= 526)
    {
      if (v2 != 175)
      {
        if (v2 != 515) {
          return 5;
        }
        return 20;
      }
      return 60;
    }
    if (v2 != 527)
    {
      if (v2 == 768) {
        return 60;
      }
      return 5;
    }
    return 180;
  }
}

- (double)queueDuration
{
  if (self->_startTime < self->_creationTime) {
    return -1.0;
  }
  TMConvertTicksToSeconds();
  return result;
}

- (double)executionDuration
{
  if (self->_completionTime < self->_startTime) {
    return -1.0;
  }
  TMConvertTicksToSeconds();
  return result;
}

- (id)description
{
  return +[NSString stringWithFormat:@"DurianTask <%p>, Type:%@, id:%@", self, sub_1015FA474([(CLDurianCommand *)self->_command opcode]), [(CLDurianTask *)self uuid]];
}

- (id)opcodeDescription
{
  int v2 = [(CLDurianCommand *)self->_command opcode];

  return (id)sub_1015FA474(v2);
}

- (unsigned)translatedOpcode
{
  unsigned int v3 = [(CLDurianCommand *)[(CLDurianTask *)self command] opcode];
  if (v3 == 208)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      LOWORD(v3) = (unsigned __int16)[(CLDurianTask *)self hawkeyeOpcode];
    }
    else
    {
      LOWORD(v3) = 208;
    }
  }
  return v3;
}

- (BOOL)shouldPreemptTask:(id)a3
{
  int v5 = [(CLDurianTask *)self translatedOpcode];
  unsigned int v6 = [a3 translatedOpcode];
  if (v6 == 208)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned int v6 = [(CLDurianTask *)self hawkeyeOpcode];
    }
    else {
      unsigned int v6 = 208;
    }
  }
  if (v5 > 527)
  {
    if (v5 > 2051)
    {
      BOOL v9 = ((1 << (v5 - 4)) & 0x203) != 0 && v6 == 2051;
      BOOL v7 = (v5 - 2052) <= 9 && v9;
      goto LABEL_36;
    }
    if ((v5 - 1796) >= 2)
    {
      if (v5 == 528)
      {
        BOOL v8 = v6 == 527;
      }
      else
      {
        BOOL v7 = 0;
        if (v5 != 769) {
          goto LABEL_36;
        }
        BOOL v8 = v6 == 768;
      }
      goto LABEL_33;
    }
    goto LABEL_29;
  }
  if (v5 <= 31)
  {
    if (v5 != 6)
    {
      if (v5 == 8)
      {
        BOOL v8 = v6 == 40;
LABEL_33:
        BOOL v7 = v8;
        goto LABEL_36;
      }
      BOOL v7 = 0;
      if (v5 != 22) {
        goto LABEL_36;
      }
    }
LABEL_19:
    BOOL v8 = v6 == 3;
    goto LABEL_33;
  }
  if (v5 > 174)
  {
    if (v5 != 175)
    {
      BOOL v7 = 0;
      if (v5 != 220) {
        goto LABEL_36;
      }
      BOOL v8 = v6 == 175;
      goto LABEL_33;
    }
LABEL_29:
    BOOL v8 = v6 == 1795;
    goto LABEL_33;
  }
  if (v5 == 32)
  {
    BOOL v7 = 1;
    goto LABEL_36;
  }
  BOOL v7 = 0;
  if (v5 == 40) {
    goto LABEL_19;
  }
LABEL_36:
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  v10 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 68289794;
    v12[1] = 0;
    __int16 v13 = 2082;
    objc_super v14 = "";
    __int16 v15 = 1026;
    BOOL v16 = v7;
    __int16 v17 = 1026;
    int v18 = v5;
    __int16 v19 = 1026;
    unsigned int v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian shouldPreempt\", \"preempt\":%{public}d, \"this\":%{public}d, \"ongoing\":%{public}d}", (uint8_t *)v12, 0x24u);
  }
  return v7;
}

- (BOOL)isMutexProtectedSoundTask
{
  if (!self->_requiresMutex) {
    return 0;
  }
  unsigned int v2 = [(CLDurianCommand *)[(CLDurianTask *)self command] opcode];
  return v2 == 40 || (v2 & 0xFFFE) == 8;
}

- (BOOL)isMutexProtectedRangingTask
{
  if (self->_requiresMutex) {
    return vmaxv_u16((uint16x4_t)vceq_s16(vdup_n_s16([(CLDurianCommand *)[(CLDurianTask *)self command] opcode]), (int16x4_t)0x3001500010006)) & 1;
  }
  else {
    return 0;
  }
}

- (BOOL)shouldCompleteOnPreemptionByTask:(id)a3
{
  return [(CLDurianCommand *)[(CLDurianTask *)self command] opcode] == 3
      && objc_msgSend(objc_msgSend(a3, "command"), "opcode") == 6
      || [(CLDurianCommand *)[(CLDurianTask *)self command] opcode] == 2051
      && objc_msgSend(objc_msgSend(a3, "command"), "opcode") == 2053
      || self->_completeOnPreemption;
}

- (void)cancel
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  unsigned int v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289539;
    v4[1] = 0;
    __int16 v5 = 2082;
    unsigned int v6 = "";
    __int16 v7 = 1026;
    unsigned int v8 = [(CLDurianCommand *)[(CLDurianTask *)self command] opcode];
    __int16 v9 = 2113;
    id v10 = [(CLDurianTask *)self description];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian cancelling task\", \"opcode\":%{public}d, \"task\":%{private, location:escape_only}@}", (uint8_t *)v4, 0x22u);
  }
  self->_cancelled = 1;
}

- (void)willStart
{
  self->_startTime = mach_continuous_time();
}

- (void)complete
{
  self->_completionTime = mach_continuous_time();
}

- (unint64_t)creationTime
{
  return self->_creationTime;
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (unint64_t)completionTime
{
  return self->_completionTime;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (CLDurianCommand)command
{
  return (CLDurianCommand *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCommand:(id)a3
{
}

- (BOOL)expectsResponse
{
  return self->_expectsResponse;
}

- (void)setExpectsResponse:(BOOL)a3
{
  self->_expectsResponse = a3;
}

- (BOOL)requiresMutex
{
  return self->_requiresMutex;
}

- (void)setRequiresMutex:(BOOL)a3
{
  self->_requiresMutex = a3;
}

- (BOOL)completeOnPreemption
{
  return self->_completeOnPreemption;
}

- (BOOL)userTask
{
  return self->_userTask;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (int64_t)desiredLatency
{
  return self->_desiredLatency;
}

+ (id)fetchFirmwareVersionTaskWithCrashLogs:(BOOL)a3
{
  unsigned int v3 = [[CLDurianFetchFirmwareVersionTask alloc] initWithIncludeCrashLogs:a3];

  return v3;
}

+ (id)fetchCurrentKeyIndexTask
{
  unsigned int v2 = [[CLDurianGATTReadTask alloc] initWithCommand:+[CLDurianCommand fetchCurrentKeyIndexCommand](CLDurianCommand, "fetchCurrentKeyIndexCommand") serviceUUID:+[CBUUID _cl_DurianUnauthorizedConnectionServiceUUID](CBUUID, "_cl_DurianUnauthorizedConnectionServiceUUID") characteristicUUID:+[CBUUID _cl_DurianKeyIndexCharacteristicUUID]];

  return v2;
}

+ (id)fetchBatteryStatusTask
{
  id v2 = [objc_alloc((Class)a1) initWithCommand:+[CLDurianCommand fetchBatteryStatusCommand](CLDurianCommand, "fetchBatteryStatusCommand") desiredLatency:-6 expectsResponse:1 completeOnPreemption:0 requiresMutex:0];

  return v2;
}

+ (id)fetchUserStatsTaskWithPersistence_v0:(BOOL)a3
{
  id v3 = [objc_alloc((Class)a1) initWithCommand:+[CLDurianCommand fetchUserStatsCommandWithPersistence_v0:](CLDurianCommand, "fetchUserStatsCommandWithPersistence_v0:", a3) desiredLatency:0 expectsResponse:1 completeOnPreemption:0 requiresMutex:0];

  return v3;
}

+ (id)fetchUserStatsTaskWithPersistence_v1:(BOOL)a3
{
  id v3 = [objc_alloc((Class)a1) initWithCommand:+[CLDurianCommand fetchUserStatsCommandWithPersistence_v1:](CLDurianCommand, "fetchUserStatsCommandWithPersistence_v1:", a3) desiredLatency:0 expectsResponse:1 completeOnPreemption:0 requiresMutex:0];

  return v3;
}

+ (id)fetchUserStatsTaskWithPersistence_v2:(BOOL)a3
{
  id v3 = [[CLDurianGetUserstatsTask alloc] initWithPersistence:a3];

  return v3;
}

+ (id)unpairTask
{
  id v2 = [objc_alloc((Class)a1) initWithCommand:+[CLDurianCommand unpairCommand](CLDurianCommand, "unpairCommand") desiredLatency:0 expectsResponse:0 completeOnPreemption:0 requiresMutex:0];

  return v2;
}

+ (id)setUnauthorizedPlaySoundRateLimitTask:(BOOL)a3
{
  id v3 = [objc_alloc((Class)a1) initWithCommand:+[CLDurianCommand setUnauthorizedPlaySoundRateLimitCommand:](CLDurianCommand, "setUnauthorizedPlaySoundRateLimitCommand:", a3) desiredLatency:0 expectsResponse:0 completeOnPreemption:0 requiresMutex:0];

  return v3;
}

+ (id)setCentralReferenceTimeTask
{
  id v2 = [objc_alloc((Class)a1) initWithCommand:+[CLDurianCommand setCentralReferenceTimeCommand](CLDurianCommand, "setCentralReferenceTimeCommand") desiredLatency:0 expectsResponse:0 completeOnPreemption:0 requiresMutex:0];

  return v2;
}

+ (id)setWildModeConfigurationTaskWithConfiguration:(id)a3
{
  id v3 = [[CLDurianSetWildConfigurationTask alloc] initWithConfiguration:a3];

  return v3;
}

+ (id)rollWildKeyTask
{
  id v2 = [objc_alloc((Class)a1) initWithCommand:+[CLDurianCommand rollWildKeyCommand](CLDurianCommand, "rollWildKeyCommand") desiredLatency:-6 expectsResponse:1 completeOnPreemption:0 requiresMutex:0];

  return v2;
}

+ (id)setAbsoluteWildModeConfigurationTaskWithConfiguration:(id)a3
{
  id v3 = [[CLDurianSetAbsoluteWildConfigurationTask alloc] initWithConfiguration:a3];

  return v3;
}

+ (id)setTagTypeTaskWithType:(unsigned __int8)a3
{
  id v3 = [objc_alloc((Class)a1) initWithCommand:+[CLDurianCommand setTagTypeCommandWithType:](CLDurianCommand, "setTagTypeCommandWithType:", a3) desiredLatency:0 expectsResponse:0 completeOnPreemption:0 requiresMutex:0];

  return v3;
}

+ (id)startSoundSequenceTaskWithEncodedSequence:(id)a3
{
  id v3 = [objc_alloc((Class)a1) initWithCommand:+[CLDurianCommand startSoundSequenceCommandWithSequence:](CLDurianCommand, "startSoundSequenceCommandWithSequence:", a3) desiredLatency:0 expectsResponse:1 completeOnPreemption:0 requiresMutex:1];

  return v3;
}

+ (id)stopSoundTask
{
  id v2 = [objc_alloc((Class)a1) initWithCommand:+[CLDurianCommand stopSoundCommand](CLDurianCommand, "stopSoundCommand") desiredLatency:0 expectsResponse:0 completeOnPreemption:0 requiresMutex:0];

  return v2;
}

+ (id)startUnauthorizedShortSoundTask
{
  __int16 v7 = 3329;
  char v8 = 8;
  id v2 = +[NSData dataWithBytes:&v7 length:3];
  id v3 = [[CLDurianGATTWriteTask alloc] initWithCommand:+[CLDurianCommand startUnauthorizedShortSoundCommand](CLDurianCommand, "startUnauthorizedShortSoundCommand") serviceUUID:+[CBUUID _cl_DurianUnauthorizedConnectionServiceUUID](CBUUID, "_cl_DurianUnauthorizedConnectionServiceUUID") characteristicUUID:+[CBUUID _cl_DurianUnauthorizedPrecisionFindingCharacteristicUUID] payload:v2];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [(CLDurianCommand *)[(CLDurianTask *)v3 command] opcode];
    *(_DWORD *)buf = 68289538;
    int v10 = 0;
    __int16 v11 = 2082;
    v12 = "";
    __int16 v13 = 2114;
    objc_super v14 = v2;
    __int16 v15 = 1026;
    unsigned int v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #ut startUnauthorizedShortSoundTask\", \"payload\":%{public, location:escape_only}@, \"param\":%{public}d}", buf, 0x22u);
  }
  return v3;
}

+ (id)startUnauthorizedSoundTask
{
  char v3 = 1;
  return [[CLDurianGATTWriteTask alloc] initWithCommand:+[CLDurianCommand startUnauthorizedSoundCommand](CLDurianCommand, "startUnauthorizedSoundCommand") serviceUUID:+[CBUUID _cl_DurianUnauthorizedConnectionServiceUUID](CBUUID, "_cl_DurianUnauthorizedConnectionServiceUUID") characteristicUUID:+[CBUUID _cl_DurianUnauthorizedSoundCharacteristicUUID](CBUUID, "_cl_DurianUnauthorizedSoundCharacteristicUUID") payload:+[NSData dataWithBytes:&v3 length:1]];
}

+ (id)leashTask
{
  __int16 v3 = 257;
  return [objc_alloc((Class)a1) initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 10, +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v3, 2)) desiredLatency:0 expectsResponse:0 completeOnPreemption:0 requiresMutex:0];
}

+ (id)leashDisableTask
{
  __int16 v3 = 1;
  return [objc_alloc((Class)a1) initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 10, +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v3, 2)) desiredLatency:0 expectsResponse:0 completeOnPreemption:0 requiresMutex:0];
}

+ (id)setMaxConnectionsTaskWithCount:(unsigned __int8)a3
{
  int v3 = a3;
  unsigned __int8 v7 = a3;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  unsigned int v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    int v9 = 0;
    __int16 v10 = 2082;
    __int16 v11 = "";
    __int16 v12 = 1026;
    int v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian setMaxConnectionsTaskWithCount\", \"count\":%{public}d}", buf, 0x18u);
  }
  if (!v3) {
    unsigned __int8 v7 = 1;
  }
  return [objc_alloc((Class)a1) initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 11, +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v7, 1)) desiredLatency:0 expectsResponse:1 completeOnPreemption:0 requiresMutex:0];
}

+ (id)fetchMultiStatusTask
{
  id v2 = [objc_alloc((Class)a1) initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 12, 0) desiredLatency:0 expectsResponse:1 completeOnPreemption:0 requiresMutex:0];

  return v2;
}

+ (id)fwdlAbortTask
{
  id v2 = [objc_alloc((Class)a1) initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 32, 0) desiredLatency:0 expectsResponse:0 completeOnPreemption:0 requiresMutex:0];

  return v2;
}

+ (id)setObfuscatedIdentifierTaskWithIdentifier:(id)a3
{
  id v3 = [objc_alloc((Class)a1) initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 13, objc_msgSend(a3, "dataUsingEncoding:", 1)) desiredLatency:0 expectsResponse:0 completeOnPreemption:0 requiresMutex:0];

  return v3;
}

+ (id)setMutexAction:(unsigned __int8)a3
{
  unsigned __int8 v7 = a3;
  v4 = +[NSData dataWithBytes:&v7 length:1];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  unsigned int v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289539;
    int v9 = 0;
    __int16 v10 = 2082;
    __int16 v11 = "";
    __int16 v12 = 1026;
    int v13 = v7;
    __int16 v14 = 2113;
    __int16 v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #mutex task\", \"action\":%{public}d, \"payload\":%{private, location:escape_only}@}", buf, 0x22u);
  }
  return [objc_alloc((Class)a1) initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 14, v4) desiredLatency:0 expectsResponse:1 completeOnPreemption:0 requiresMutex:0];
}

+ (id)setMutexAction:(unsigned __int8)a3 withLatency:(int64_t)a4
{
  unsigned __int8 v9 = a3;
  unsigned int v6 = +[NSData dataWithBytes:&v9 length:1];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  unsigned __int8 v7 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289539;
    int v11 = 0;
    __int16 v12 = 2082;
    int v13 = "";
    __int16 v14 = 1026;
    int v15 = v9;
    __int16 v16 = 2113;
    __int16 v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #mutex task\", \"action\":%{public}d, \"payload\":%{private, location:escape_only}@}", buf, 0x22u);
  }
  return [objc_alloc((Class)a1) initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 14, v6) desiredLatency:a4 expectsResponse:1 completeOnPreemption:0 requiresMutex:0];
}

+ (id)setNearOwnerTimeoutTaskWithTimeout:(unsigned __int16)a3
{
  id v3 = [objc_alloc((Class)a1) initWithCommand:+[CLDurianCommand setNearOwnerTimeoutCommandWithTimeout:](CLDurianCommand, "setNearOwnerTimeoutCommandWithTimeout:", a3) desiredLatency:0 expectsResponse:0 completeOnPreemption:0 requiresMutex:0];

  return v3;
}

+ (id)checkCrashesTask
{
  id v2 = [objc_alloc((Class)a1) initWithCommand:+[CLDurianCommand checkCrashesCommand](CLDurianCommand, "checkCrashesCommand") desiredLatency:0 expectsResponse:1 completeOnPreemption:0 requiresMutex:0];

  return v2;
}

+ (id)induceCrashTask
{
  id v2 = [objc_alloc((Class)a1) initWithCommand:+[CLDurianCommand induceCrashCommand](CLDurianCommand, "induceCrashCommand") desiredLatency:0 expectsResponse:0 completeOnPreemption:0 requiresMutex:0];

  return v2;
}

+ (id)setBatteryStatusTaskWithBatteryStatus:(unint64_t)a3
{
  v4[0] = 1;
  v4[1] = a3;
  return [objc_alloc((Class)a1) initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 187, +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v4, 2)) desiredLatency:0 expectsResponse:0 completeOnPreemption:0 requiresMutex:0];
}

+ (id)setKeyRotationTimeoutTaskWithTimeout:(unsigned int)a3
{
  id v3 = [objc_alloc((Class)a1) initWithCommand:+[CLDurianCommand setKeyRotationTimeoutCommandWithTimeout:](CLDurianCommand, "setKeyRotationTimeoutCommandWithTimeout:", *(void *)&a3) desiredLatency:0 expectsResponse:0 completeOnPreemption:0 requiresMutex:0];

  return v3;
}

+ (id)dumpNordicLogsTask
{
  id v2 = [[CLDurianGATTRepeatedReadTask alloc] initWithCommand:+[CLDurianCommand dumpNordicLogsCommand](CLDurianCommand, "dumpNordicLogsCommand") serviceUUID:+[CBUUID _cl_DurianDebugServiceUUID](CBUUID, "_cl_DurianDebugServiceUUID") characteristicUUID:+[CBUUID _cl_DurianLoggingCharacteristicUUID]];

  return v2;
}

+ (id)dumpNordicCrashesTask
{
  id v2 = [[CLDurianGATTRepeatedReadTask alloc] initWithCommand:+[CLDurianCommand dumpNordicCrashesCommand](CLDurianCommand, "dumpNordicCrashesCommand") serviceUUID:+[CBUUID _cl_DurianDebugServiceUUID](CBUUID, "_cl_DurianDebugServiceUUID") characteristicUUID:+[CBUUID _cl_DurianLoggingCharacteristicUUID]];

  return v2;
}

+ (id)dumpRoseLogsTask
{
  id v2 = [[CLDurianGATTRepeatedReadTask alloc] initWithCommand:+[CLDurianCommand dumpRoseLogsCommand](CLDurianCommand, "dumpRoseLogsCommand") serviceUUID:+[CBUUID _cl_DurianDebugServiceUUID](CBUUID, "_cl_DurianDebugServiceUUID") characteristicUUID:+[CBUUID _cl_DurianLoggingCharacteristicUUID]];

  return v2;
}

+ (id)dumpRoseCrashesTask
{
  id v2 = [[CLDurianGATTRepeatedReadTask alloc] initWithCommand:+[CLDurianCommand dumpRoseCrashesCommand](CLDurianCommand, "dumpRoseCrashesCommand") serviceUUID:+[CBUUID _cl_DurianDebugServiceUUID](CBUUID, "_cl_DurianDebugServiceUUID") characteristicUUID:+[CBUUID _cl_DurianLoggingCharacteristicUUID]];

  return v2;
}

+ (id)initRoseTaskWithParameters:(id)a3
{
  id v3 = [objc_alloc((Class)a1) initWithCommand:+[CLDurianCommand initRoseCommandWithParameters:](CLDurianCommand, "initRoseCommandWithParameters:", a3) desiredLatency:0 expectsResponse:1 completeOnPreemption:0 requiresMutex:1];

  return v3;
}

+ (id)stopRoseTaskWithParameters:(id)a3
{
  id v3 = [objc_alloc((Class)a1) initWithCommand:+[CLDurianCommand stopRoseCommandWithParameters:](CLDurianCommand, "stopRoseCommandWithParameters:", a3) desiredLatency:0 expectsResponse:1 completeOnPreemption:0 requiresMutex:0];

  return v3;
}

+ (id)setRoseRangingParametersTaskWithParameters:(id)a3
{
  id v3 = [objc_alloc((Class)a1) initWithCommand:+[CLDurianCommand setRoseRangingParametersCommandWithParameters:](CLDurianCommand, "setRoseRangingParametersCommandWithParameters:", a3) desiredLatency:0 expectsResponse:1 completeOnPreemption:0 requiresMutex:0];

  return v3;
}

+ (id)startRoseRangingTaskWithParameters:(id)a3
{
  id v3 = [objc_alloc((Class)a1) initWithCommand:+[CLDurianCommand startRoseRangingCommandWithParameters:](CLDurianCommand, "startRoseRangingCommandWithParameters:", a3) desiredLatency:0 expectsResponse:1 completeOnPreemption:0 requiresMutex:0];

  return v3;
}

+ (id)stopRoseRangingTask
{
  id v2 = [objc_alloc((Class)a1) initWithCommand:+[CLDurianCommand stopRoseRangingCommand](CLDurianCommand, "stopRoseRangingCommand") desiredLatency:0 expectsResponse:0 completeOnPreemption:0 requiresMutex:0];

  return v2;
}

+ (id)setAccelerometerSlopeModeConfigurationTaskWithConfiguration:(id)a3
{
  v8[0] = [a3 sampleCount];
  [a3 threshold];
  v8[1] = sub_1015DA824(v5);
  [a3 threshold];
  v8[2] = sub_1015DAA10(v6);
  v8[3] = [a3 sampleRate];
  return [objc_alloc((Class)a1) initWithCommand:+[CLDurianCommand setAccelerometerSlopeModeConfigurationCommandWithConfiguration:](CLDurianCommand, "setAccelerometerSlopeModeConfigurationCommandWithConfiguration:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v8, 4)) desiredLatency:0 expectsResponse:0 completeOnPreemption:0 requiresMutex:0];
}

+ (id)setAccelerometerOrientationModeConfigurationTaskWithConfiguration:(id)a3
{
  unsigned int v6 = [a3 threshold];
  unsigned __int16 v7 = (unsigned __int16)[a3 sleepDuration_ms];
  return [objc_alloc((Class)a1) initWithCommand:+[CLDurianCommand setAccelerometerOrientationModeConfigurationCommandWithConfiguration:](CLDurianCommand, "setAccelerometerOrientationModeConfigurationCommandWithConfiguration:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 6)), 0, 0, 0, 0];
}

+ (id)fetchAccelerometerSlopeModeConfigurationTask
{
  id v2 = [objc_alloc((Class)a1) initWithCommand:+[CLDurianCommand fetchAccelerometerSlopeModeConfigurationCommand](CLDurianCommand, "fetchAccelerometerSlopeModeConfigurationCommand") desiredLatency:0 expectsResponse:1 completeOnPreemption:0 requiresMutex:0];

  return v2;
}

+ (id)fetchAccelerometerOrientationModeConfigurationTask
{
  id v2 = [objc_alloc((Class)a1) initWithCommand:+[CLDurianCommand fetchAccelerometerOrientationModeConfigurationCommand](CLDurianCommand, "fetchAccelerometerOrientationModeConfigurationCommand") desiredLatency:0 expectsResponse:1 completeOnPreemption:0 requiresMutex:0];

  return v2;
}

+ (id)fetchAccelerometerModeTask
{
  id v2 = [objc_alloc((Class)a1) initWithCommand:+[CLDurianCommand fetchAccelerometerModeCommand](CLDurianCommand, "fetchAccelerometerModeCommand") desiredLatency:0 expectsResponse:1 completeOnPreemption:0 requiresMutex:0];

  return v2;
}

+ (id)placeholderHawkeyeTask
{
  id v2 = [objc_alloc((Class)a1) initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 208, 0) desiredLatency:0 expectsResponse:0 completeOnPreemption:0 requiresMutex:0];

  return v2;
}

+ (id)startSoundHawkeyeTask
{
  id v2 = +[CLDurianTask startSoundSequenceTaskWithEncodedSequence:](CLHawkeyeTask, "startSoundSequenceTaskWithEncodedSequence:", +[NSData dataWithBytes:0 length:0]);
  if (v2)
  {
    [v2 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v2 setCharacteristicUUID:+[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID")];
    [v2 setRequiresMutex:0];
    [v2 setHawkeyeOpcode:512];
    v10[0] = 1;
    v10[1] = [v2 hawkeyeOpcode];
    v10[2] = (unsigned __int16)[v2 hawkeyeOpcode] >> 8;
    [v2 setHawkeyePayload:+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v10, 3)];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v3 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [v2 hawkeyePayload];
      *(_DWORD *)buf = 68289538;
      int v12 = 0;
      __int16 v13 = 2082;
      __int16 v14 = "";
      __int16 v15 = 1026;
      int v16 = 10;
      __int16 v17 = 2114;
      id v18 = v4;
      float v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye soundStart\", \"duration\":%{public}d, \"payload\":%{public, location:escape_only}@}";
      unsigned int v6 = v3;
      uint32_t v7 = 34;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v12 = 0;
      __int16 v13 = 2082;
      __int16 v14 = "";
      float v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, soundStart\"}";
      unsigned int v6 = v8;
      uint32_t v7 = 18;
      goto LABEL_10;
    }
  }
  return v2;
}

+ (id)startShortSoundHawkeyeTask
{
  id v2 = +[CLDurianTask startSoundSequenceTaskWithEncodedSequence:](CLHawkeyeTask, "startSoundSequenceTaskWithEncodedSequence:", +[NSData dataWithBytes:0 length:0]);
  if (v2)
  {
    [v2 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v2 setCharacteristicUUID:+[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID")];
    [v2 setRequiresMutex:0];
    [v2 setHawkeyeOpcode:531];
    v10[0] = 1;
    v10[1] = [v2 hawkeyeOpcode];
    v10[2] = (unsigned __int16)[v2 hawkeyeOpcode] >> 8;
    [v2 setHawkeyePayload:[NSData dataWithBytes:length:v10, 3]];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v3 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [v2 hawkeyePayload];
      *(_DWORD *)buf = 68289282;
      int v12 = 0;
      __int16 v13 = 2082;
      __int16 v14 = "";
      __int16 v15 = 2114;
      id v16 = v4;
      float v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye shortSoundStart\", \"payload\":%{public, location:escape_only}@}";
      unsigned int v6 = v3;
      uint32_t v7 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v12 = 0;
      __int16 v13 = 2082;
      __int16 v14 = "";
      float v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, soundStart\"}";
      unsigned int v6 = v8;
      uint32_t v7 = 18;
      goto LABEL_10;
    }
  }
  return v2;
}

+ (id)stopSoundHawkeyeTask
{
  id v2 = +[CLDurianTask stopSoundTask];
  if (v2)
  {
    [v2 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v2 setCharacteristicUUID:+[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID")];
    [v2 setExpectsResponse:1];
    [v2 setHawkeyeOpcode:513];
    v10[0] = 1;
    v10[1] = [v2 hawkeyeOpcode];
    v10[2] = (unsigned __int16)[v2 hawkeyeOpcode] >> 8;
    [v2 setHawkeyePayload:+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v10, 3)];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v3 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [v2 hawkeyePayload];
      *(_DWORD *)buf = 68289538;
      int v12 = 0;
      __int16 v13 = 2082;
      __int16 v14 = "";
      __int16 v15 = 1026;
      int v16 = 10;
      __int16 v17 = 2114;
      id v18 = v4;
      float v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye soundStart\", \"duration\":%{public}d, \"payload\":%{public, location:escape_only}@}";
      unsigned int v6 = v3;
      uint32_t v7 = 34;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v12 = 0;
      __int16 v13 = 2082;
      __int16 v14 = "";
      float v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, soundStop\"}";
      unsigned int v6 = v8;
      uint32_t v7 = 18;
      goto LABEL_10;
    }
  }
  return v2;
}

+ (id)enablePersistentConnectionsHawkeyeTask:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[CLDurianTask leashTask];
  if (v4)
  {
    [v4 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v4 setCharacteristicUUID:+[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID")];
    [v4 setHawkeyeOpcode:514];
    v12[0] = 1;
    v12[1] = [v4 hawkeyeOpcode];
    _DWORD v12[2] = (unsigned __int16)[v4 hawkeyeOpcode] >> 8;
    v12[3] = v3;
    [v4 setHawkeyePayload:[NSData dataWithBytes:length:v12, 4]];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v5 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 hawkeyePayload];
      *(_DWORD *)buf = 68289538;
      int v14 = 0;
      __int16 v15 = 2082;
      int v16 = "";
      __int16 v17 = 1026;
      BOOL v18 = v3;
      __int16 v19 = 2114;
      id v20 = v6;
      uint32_t v7 = "{\"msg%{public}.0s\":\"#durian #hawkeye configureLeash\", \"enable\":%{public}d, \"payload\":%{public, locati"
           "on:escape_only}@}";
      uint64_t v8 = v5;
      uint32_t v9 = 34;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v10 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v14 = 0;
      __int16 v15 = 2082;
      int v16 = "";
      uint32_t v7 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, configureLeash\"}";
      uint64_t v8 = v10;
      uint32_t v9 = 18;
      goto LABEL_10;
    }
  }
  return v4;
}

+ (id)setNearbyTimeoutHawkeyeTaskWithTimeout:(unsigned __int16)a3 asHele:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = a3;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  id v6 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    int v20 = 0;
    __int16 v21 = 2082;
    v22 = "";
    __int16 v23 = 1026;
    int v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian setNearbyTimeoutHawkeyeTaskWithTimeout \", \"hele\":%{public}hhd}", buf, 0x18u);
  }
  id v7 = +[CLDurianTask setNearOwnerTimeoutTaskWithTimeout:v5];
  if (v7)
  {
    if (v4) {
      unsigned int v8 = v5;
    }
    else {
      unsigned int v8 = 3600;
    }
    if (v5 <= 0xE0F) {
      unsigned int v8 = v5;
    }
    if (v4 && v8 >> 3 > 0x464) {
      int v9 = 9000;
    }
    else {
      int v9 = v8;
    }
    [v7 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v7 setCharacteristicUUID:[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID]];
    [v7 setHawkeyeOpcode:515];
    v17[0] = 1;
    v17[1] = [v7 hawkeyeOpcode];
    v17[2] = (unsigned __int16)[v7 hawkeyeOpcode] >> 8;
    __int16 v18 = v9;
    [v7 setHawkeyePayload:[NSData dataWithBytes:length:v17, 5]];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v10 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v7 hawkeyePayload];
      *(_DWORD *)buf = 68289538;
      int v20 = 0;
      __int16 v21 = 2082;
      v22 = "";
      __int16 v23 = 1026;
      int v24 = v9;
      __int16 v25 = 2114;
      id v26 = v11;
      int v12 = "{\"msg%{public}.0s\":\"#durian #hawkeye setNearbyTimeout\", \"timeout\":%{public}d, \"payload\":%{public, lo"
            "cation:escape_only}@}";
      __int16 v13 = v10;
      uint32_t v14 = 34;
LABEL_22:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v15 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v20 = 0;
      __int16 v21 = 2082;
      v22 = "";
      int v12 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, setNearbyTimeout\"}";
      __int16 v13 = v15;
      uint32_t v14 = 18;
      goto LABEL_22;
    }
  }
  return v7;
}

+ (id)unpairHawkeyeTask
{
  id v2 = +[CLDurianTask unpairTask];
  if (v2)
  {
    [v2 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v2 setCharacteristicUUID:+[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID")];
    [v2 setHawkeyeOpcode:516];
    v10[0] = 1;
    v10[1] = [v2 hawkeyeOpcode];
    v10[2] = (unsigned __int16)[v2 hawkeyeOpcode] >> 8;
    [v2 setHawkeyePayload:+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v10, 3)];
    [v2 setExpectsResponse:0];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v3 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [v2 hawkeyePayload];
      *(_DWORD *)buf = 68289282;
      int v12 = 0;
      __int16 v13 = 2082;
      uint32_t v14 = "";
      __int16 v15 = 2114;
      id v16 = v4;
      uint64_t v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye unpair\", \"payload\":%{public, location:escape_only}@}";
      id v6 = v3;
      uint32_t v7 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v12 = 0;
      __int16 v13 = 2082;
      uint32_t v14 = "";
      uint64_t v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, unpair\"}";
      id v6 = v8;
      uint32_t v7 = 18;
      goto LABEL_10;
    }
  }
  return v2;
}

+ (id)initRoseNonOwnerTaskWithParameters:(id)a3
{
  id v4 = [[CLDurianGATTWriteTask alloc] initWithCommand:+[CLDurianCommand initRoseNonOwnerCommandWithParameters:](CLDurianCommand, "initRoseNonOwnerCommandWithParameters:", a3) serviceUUID:+[CBUUID _cl_DurianUnauthorizedConnectionServiceUUID](CBUUID, "_cl_DurianUnauthorizedConnectionServiceUUID") characteristicUUID:+[CBUUID _cl_DurianUnauthorizedPrecisionFindingCharacteristicUUID] payload:a3];
  [(CLDurianTask *)v4 setRequiresMutex:0];
  [(CLDurianTask *)v4 setExpectsResponse:1];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  uint64_t v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289538;
    v7[1] = 0;
    __int16 v8 = 2082;
    int v9 = "";
    __int16 v10 = 2114;
    id v11 = a3;
    __int16 v12 = 1026;
    unsigned int v13 = [(CLDurianTask *)v4 expectsResponse];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #ut initRanging\", \"payload\":%{public, location:escape_only}@, \"task.expectsResponse\":%{public}hhd}", (uint8_t *)v7, 0x22u);
  }
  return v4;
}

+ (id)configureRangingNonOwnerTaskWithPayload:(char *)a3
{
  __int16 v12 = 513;
  char v13 = 8;
  uint64_t v14 = *(void *)a3;
  int v15 = *((_DWORD *)a3 + 2);
  uint64_t v3 = +[NSData dataWithBytes:&v12 length:15];
  id v4 = [[CLDurianGATTWriteTask alloc] initWithCommand:+[CLDurianCommand setRoseRangingParametersNonOwnerCommandWithParameters:](CLDurianCommand, "setRoseRangingParametersNonOwnerCommandWithParameters:", v3) serviceUUID:+[CBUUID _cl_DurianUnauthorizedConnectionServiceUUID](CBUUID, "_cl_DurianUnauthorizedConnectionServiceUUID") characteristicUUID:+[CBUUID _cl_DurianUnauthorizedPrecisionFindingCharacteristicUUID] payload:v3];
  [(CLDurianTask *)v4 setRequiresMutex:0];
  [(CLDurianTask *)v4 setExpectsResponse:1];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  uint64_t v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289282;
    v7[1] = 0;
    __int16 v8 = 2082;
    int v9 = "";
    __int16 v10 = 2114;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #ut configureRangingNonOwnerTaskWithPayload\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)v7, 0x1Cu);
  }
  return v4;
}

+ (id)startRangingNonOwnerTaskWithTargetEventCounter:(unsigned __int16)a3
{
  __int16 v8 = 769;
  char v9 = 8;
  unsigned __int16 v10 = a3;
  uint64_t v3 = +[NSData dataWithBytes:&v8 length:5];
  id v4 = [[CLDurianGATTWriteTask alloc] initWithCommand:+[CLDurianCommand startRoseRangingNonOwnerCommandWithParameters:](CLDurianCommand, "startRoseRangingNonOwnerCommandWithParameters:", v3) serviceUUID:+[CBUUID _cl_DurianUnauthorizedConnectionServiceUUID](CBUUID, "_cl_DurianUnauthorizedConnectionServiceUUID") characteristicUUID:+[CBUUID _cl_DurianUnauthorizedPrecisionFindingCharacteristicUUID] payload:v3];
  [(CLDurianTask *)v4 setRequiresMutex:0];
  [(CLDurianTask *)v4 setExpectsResponse:1];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  uint64_t v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [(CLDurianCommand *)[(CLDurianTask *)v4 command] opcode];
    *(_DWORD *)buf = 68289538;
    int v12 = 0;
    __int16 v13 = 2082;
    uint64_t v14 = "";
    __int16 v15 = 2114;
    id v16 = v3;
    __int16 v17 = 1026;
    unsigned int v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #ut startRangingNonOwnerTaskWithTargetEventCounter\", \"payload\":%{public, location:escape_only}@, \"param\":%{public}d}", buf, 0x22u);
  }
  return v4;
}

+ (id)stopRangingNonOwnerTask
{
  __int16 v6 = 1025;
  char v7 = 8;
  id v2 = +[NSData dataWithBytes:&v6 length:3];
  uint64_t v3 = [[CLDurianGATTWriteTask alloc] initWithCommand:+[CLDurianCommand stopRoseRangingNonOwnerCommandWithParameters:](CLDurianCommand, "stopRoseRangingNonOwnerCommandWithParameters:", v2) serviceUUID:+[CBUUID _cl_DurianUnauthorizedConnectionServiceUUID](CBUUID, "_cl_DurianUnauthorizedConnectionServiceUUID") characteristicUUID:+[CBUUID _cl_DurianUnauthorizedPrecisionFindingCharacteristicUUID] payload:v2];
  [(CLDurianTask *)v3 setRequiresMutex:0];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  id v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    int v9 = 0;
    __int16 v10 = 2082;
    id v11 = "";
    __int16 v12 = 2114;
    __int16 v13 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #ut stopRangingNonOwnerTask\", \"payload\":%{public, location:escape_only}@}", buf, 0x1Cu);
  }
  return v3;
}

+ (id)deinitRangingNonOwnerTask
{
  __int16 v6 = 1281;
  char v7 = 8;
  id v2 = +[NSData dataWithBytes:&v6 length:3];
  uint64_t v3 = [[CLDurianGATTWriteTask alloc] initWithCommand:+[CLDurianCommand stopRoseNonOwnerCommandWithParameters:](CLDurianCommand, "stopRoseNonOwnerCommandWithParameters:", v2) serviceUUID:+[CBUUID _cl_DurianUnauthorizedConnectionServiceUUID](CBUUID, "_cl_DurianUnauthorizedConnectionServiceUUID") characteristicUUID:+[CBUUID _cl_DurianUnauthorizedPrecisionFindingCharacteristicUUID] payload:v2];
  [(CLDurianTask *)v3 setRequiresMutex:0];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  id v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    int v9 = 0;
    __int16 v10 = 2082;
    id v11 = "";
    __int16 v12 = 2114;
    __int16 v13 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #ut deinitRangingNonOwnerTask\", \"payload\":%{public, location:escape_only}@}", buf, 0x1Cu);
  }
  return v3;
}

+ (id)configureSeparatedStateHawkeyeTaskWithConfiguration:(id)a3 currentIndex:(unsigned int)a4
{
  uint64_t v5 = [[CLHawkeyeConfigureSeparatedStateTask alloc] initWithConfiguration:a3 currentIndex:*(void *)&a4];
  if (v5)
  {
    [objc_msgSend(a3, "desiredKeyRollDate") timeIntervalSinceDate:[NSDate date]];
    double v7 = v6;
    unsigned int v8 = (v6 * 1000.0);
    unsigned int v9 = [a3 nextWildIndex];
    [(CLHawkeyeTask *)v5 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID]];
    [(CLHawkeyeTask *)v5 setCharacteristicUUID:+[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID]];
    [(CLHawkeyeTask *)v5 setHawkeyeOpcode:517];
    v24[0] = 1;
    v24[1] = [(CLHawkeyeTask *)v5 hawkeyeOpcode];
    v24[2] = [(CLHawkeyeTask *)v5 hawkeyeOpcode] >> 8;
    unsigned int v25 = v8;
    unsigned int v26 = v9;
    [(CLHawkeyeTask *)v5 setHawkeyePayload:+[NSData dataWithBytes:v24 length:11]];
    [(CLDurianTask *)v5 setExpectsResponse:0];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v10 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 68289538;
      int v17 = 0;
      __int16 v18 = 2082;
      __int16 v19 = "";
      __int16 v20 = 1026;
      int v21 = (int)v7;
      __int16 v22 = 1026;
      unsigned int v23 = v9;
      id v11 = "{\"msg%{public}.0s\":\"#durian #hawkeye configureSeparatedState\", \"sec\":%{public}d, \"nextWild\":%{public}d}";
      __int16 v12 = v10;
      uint32_t v13 = 30;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, v13);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v14 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 68289026;
      int v17 = 0;
      __int16 v18 = 2082;
      __int16 v19 = "";
      id v11 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, configureSeparatedState\"}";
      __int16 v12 = v14;
      uint32_t v13 = 18;
      goto LABEL_10;
    }
  }
  return v5;
}

+ (id)latchSeparatedKeyHawkeyeTask
{
  id v2 = +[CLDurianTask rollWildKeyTask];
  if (v2)
  {
    [v2 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v2 setCharacteristicUUID:+[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID")];
    [v2 setHawkeyeOpcode:518];
    v10[0] = 1;
    v10[1] = [v2 hawkeyeOpcode];
    v10[2] = (unsigned __int16)[v2 hawkeyeOpcode] >> 8;
    [v2 setHawkeyePayload:[NSData dataWithBytes:length:v10, 3]];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v3 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [v2 hawkeyePayload];
      *(_DWORD *)buf = 68289282;
      int v12 = 0;
      __int16 v13 = 2082;
      uint64_t v14 = "";
      __int16 v15 = 2114;
      id v16 = v4;
      uint64_t v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye latchSeperatedKey\", \"payload\":%{public, location:escape_only}@}";
      double v6 = v3;
      uint32_t v7 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v12 = 0;
      __int16 v13 = 2082;
      uint64_t v14 = "";
      uint64_t v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, latchSeperatedKey\"}";
      double v6 = v8;
      uint32_t v7 = 18;
      goto LABEL_10;
    }
  }
  return v2;
}

+ (id)setMaxConnectionsHawkeyeTaskWithCount:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  id v4 = +[CLDurianTask setMaxConnectionsTaskWithCount:](CLHawkeyeTask, "setMaxConnectionsTaskWithCount:");
  if (v4)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v5 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = 68289538;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      __int16 v11 = 1026;
      unsigned int v12 = v3;
      __int16 v13 = 2114;
      id v14 = [v4 hawkeyePayload];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye setMaxConnections\", \"count\":%{public}d, \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v8, 0x22u);
    }
    if (v3 <= 1) {
      LOBYTE(v3) = 1;
    }
    [v4 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v4 setCharacteristicUUID:+[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID")];
    [v4 setHawkeyeOpcode:519];
    LOBYTE(v8) = 1;
    BYTE1(v8) = [v4 hawkeyeOpcode:v8];
    BYTE2(v8) = (unsigned __int16)[v4 hawkeyeOpcode] >> 8;
    BYTE3(v8) = v3;
    [v4 setHawkeyePayload:[NSData dataWithBytes:&v8 length:4]];
    [v4 setExpectsResponse:0];
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    double v6 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = 68289026;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, setMaxConnections\"}", (uint8_t *)&v8, 0x12u);
    }
  }
  return v4;
}

+ (id)setUtcHawkeyeTask
{
  id v2 = +[CLDurianTask setCentralReferenceTimeTask];
  if (v2)
  {
    [v2 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v2 setCharacteristicUUID:+[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID")];
    [v2 setHawkeyeOpcode:520];
    +[NSDate timeIntervalSinceReferenceDate];
    unint64_t v4 = (unint64_t)(v3 * 1000.0);
    v17[0] = 1;
    v17[1] = [v2 hawkeyeOpcode];
    v17[2] = (unsigned __int16)[v2 hawkeyeOpcode] >> 8;
    unint64_t v18 = v4;
    [v2 setHawkeyePayload:+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v17, 11)];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v5 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 68289282;
      int v12 = 0;
      __int16 v13 = 2082;
      id v14 = "";
      __int16 v15 = 2114;
      id v16 = [v2 hawkeyePayload];
      double v6 = "{\"msg%{public}.0s\":\"#durian #hawkeye setUtc\", \"payload\":%{public, location:escape_only}@}";
      uint32_t v7 = v5;
      uint32_t v8 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, v8);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v9 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 68289026;
      int v12 = 0;
      __int16 v13 = 2082;
      id v14 = "";
      double v6 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, setUtc\"}";
      uint32_t v7 = v9;
      uint32_t v8 = 18;
      goto LABEL_10;
    }
  }
  return v2;
}

+ (id)getMultiStatusHawkeyeTask
{
  id v2 = +[CLDurianTask fetchMultiStatusTask];
  if (v2)
  {
    [v2 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v2 setCharacteristicUUID:+[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID")];
    [v2 setHawkeyeOpcode:521];
    v10[0] = 1;
    v10[1] = [v2 hawkeyeOpcode];
    v10[2] = (unsigned __int16)[v2 hawkeyeOpcode] >> 8;
    [v2 setHawkeyePayload:+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v10, 3)];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v3 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [v2 hawkeyePayload];
      *(_DWORD *)buf = 68289282;
      int v12 = 0;
      __int16 v13 = 2082;
      id v14 = "";
      __int16 v15 = 2114;
      id v16 = v4;
      uint64_t v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye getMulti\", \"payload\":%{public, location:escape_only}@}";
      double v6 = v3;
      uint32_t v7 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v12 = 0;
      __int16 v13 = 2082;
      id v14 = "";
      uint64_t v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, getMulti\"}";
      double v6 = v8;
      uint32_t v7 = 18;
      goto LABEL_10;
    }
  }
  return v2;
}

+ (id)initRangingHawkeyeTask
{
  id v2 = +[CLDurianTask initRoseTaskWithParameters:](CLHawkeyeTask, "initRoseTaskWithParameters:", +[NSData dataWithBytes:0 length:0]);
  if (v2)
  {
    [v2 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v2 setCharacteristicUUID:+[CBUUID _cl_HawkeyePreciseFindingCharacteristicUUID](CBUUID, "_cl_HawkeyePreciseFindingCharacteristicUUID")];
    [v2 setRequiresMutex:0];
    [v2 setHawkeyeOpcode:1793];
    v10[0] = 1;
    v10[1] = [v2 hawkeyeOpcode];
    v10[2] = (unsigned __int16)[v2 hawkeyeOpcode] >> 8;
    [v2 setHawkeyePayload:+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v10, 3)];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v3 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [v2 hawkeyePayload];
      *(_DWORD *)buf = 68289282;
      int v12 = 0;
      __int16 v13 = 2082;
      id v14 = "";
      __int16 v15 = 2114;
      id v16 = v4;
      uint64_t v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye initRanging\", \"payload\":%{public, location:escape_only}@}";
      double v6 = v3;
      uint32_t v7 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v12 = 0;
      __int16 v13 = 2082;
      id v14 = "";
      uint64_t v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, initRanging\"}";
      double v6 = v8;
      uint32_t v7 = 18;
      goto LABEL_10;
    }
  }
  return v2;
}

+ (id)configureRangingHawkeyeTaskWithPayload:(char *)a3
{
  id v4 = +[CLDurianTask setRoseRangingParametersTaskWithParameters:](CLHawkeyeTask, "setRoseRangingParametersTaskWithParameters:", +[NSData dataWithBytes:0 length:0]);
  if (v4)
  {
    [v4 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v4 setCharacteristicUUID:+[CBUUID _cl_HawkeyePreciseFindingCharacteristicUUID](CBUUID, "_cl_HawkeyePreciseFindingCharacteristicUUID")];
    [v4 setRequiresMutex:0];
    [v4 setHawkeyeOpcode:1794];
    v17[0] = 1;
    v17[1] = [v4 hawkeyeOpcode];
    v17[2] = (unsigned __int16)[v4 hawkeyeOpcode] >> 8;
    uint64_t v18 = *(void *)a3;
    int v19 = *((_DWORD *)a3 + 2);
    [v4 setHawkeyePayload:+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v17, 15)];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v5 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 68289282;
      int v12 = 0;
      __int16 v13 = 2082;
      id v14 = "";
      __int16 v15 = 2114;
      id v16 = [v4 hawkeyePayload];
      double v6 = "{\"msg%{public}.0s\":\"#durian #hawkeye configureRanging\", \"payload\":%{public, location:escape_only}@}";
      uint32_t v7 = v5;
      uint32_t v8 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, v8);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v9 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 68289026;
      int v12 = 0;
      __int16 v13 = 2082;
      id v14 = "";
      double v6 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, initRanging\"}";
      uint32_t v7 = v9;
      uint32_t v8 = 18;
      goto LABEL_10;
    }
  }
  return v4;
}

+ (id)startRangingHawkeyeTaskWithTargetEventCounter:(unsigned __int16)a3
{
  id v4 = +[CLDurianTask startRoseRangingTaskWithParameters:](CLHawkeyeTask, "startRoseRangingTaskWithParameters:", +[NSData dataWithBytes:0 length:0]);
  if (v4)
  {
    [v4 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v4 setCharacteristicUUID:+[CBUUID _cl_HawkeyePreciseFindingCharacteristicUUID](CBUUID, "_cl_HawkeyePreciseFindingCharacteristicUUID")];
    [v4 setRequiresMutex:0];
    [v4 setHawkeyeOpcode:1795];
    v12[0] = 1;
    v12[1] = [v4 hawkeyeOpcode];
    _DWORD v12[2] = (unsigned __int16)[v4 hawkeyeOpcode] >> 8;
    unsigned __int16 v13 = a3;
    [v4 setHawkeyePayload:[NSData dataWithBytes:length:v12, 5]];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v5 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 hawkeyePayload];
      *(_DWORD *)buf = 68289282;
      int v15 = 0;
      __int16 v16 = 2082;
      int v17 = "";
      __int16 v18 = 2114;
      id v19 = v6;
      uint32_t v7 = "{\"msg%{public}.0s\":\"#durian #hawkeye startRanging\", \"payload\":%{public, location:escape_only}@}";
      uint32_t v8 = v5;
      uint32_t v9 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v10 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v15 = 0;
      __int16 v16 = 2082;
      int v17 = "";
      uint32_t v7 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, initRanging\"}";
      uint32_t v8 = v10;
      uint32_t v9 = 18;
      goto LABEL_10;
    }
  }
  return v4;
}

+ (id)stopRangingHawkeyeTask
{
  id v2 = +[CLDurianTask stopRoseRangingTask];
  if (v2)
  {
    [v2 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v2 setCharacteristicUUID:+[CBUUID _cl_HawkeyePreciseFindingCharacteristicUUID](CBUUID, "_cl_HawkeyePreciseFindingCharacteristicUUID")];
    [v2 setRequiresMutex:0];
    [v2 setHawkeyeOpcode:1796];
    v10[0] = 1;
    v10[1] = [v2 hawkeyeOpcode];
    v10[2] = (unsigned __int16)[v2 hawkeyeOpcode] >> 8;
    [v2 setHawkeyePayload:+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v10, 3)];
    [v2 setExpectsResponse:1];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v3 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [v2 hawkeyePayload];
      *(_DWORD *)buf = 68289282;
      int v12 = 0;
      __int16 v13 = 2082;
      id v14 = "";
      __int16 v15 = 2114;
      id v16 = v4;
      uint64_t v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye stopRanging\", \"payload\":%{public, location:escape_only}@}";
      id v6 = v3;
      uint32_t v7 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v12 = 0;
      __int16 v13 = 2082;
      id v14 = "";
      uint64_t v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, initRanging\"}";
      id v6 = v8;
      uint32_t v7 = 18;
      goto LABEL_10;
    }
  }
  return v2;
}

+ (id)deinitRangingHawkeyeTask
{
  id v2 = +[CLDurianTask stopRoseTaskWithParameters:](CLHawkeyeTask, "stopRoseTaskWithParameters:", +[NSData dataWithBytes:0 length:0]);
  if (v2)
  {
    [v2 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v2 setCharacteristicUUID:[+[CBUUID _cl_HawkeyePreciseFindingCharacteristicUUID](CBUUID, "_cl_HawkeyePreciseFindingCharacteristicUUID")];
    [v2 setRequiresMutex:0];
    [v2 setHawkeyeOpcode:1797];
    v10[0] = 1;
    v10[1] = [v2 hawkeyeOpcode];
    v10[2] = (unsigned __int16)[v2 hawkeyeOpcode] >> 8;
    [v2 setHawkeyePayload:+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v10, 3)];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v3 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [v2 hawkeyePayload];
      *(_DWORD *)buf = 68289282;
      int v12 = 0;
      __int16 v13 = 2082;
      id v14 = "";
      __int16 v15 = 2114;
      id v16 = v4;
      uint64_t v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye deinitRanging\", \"payload\":%{public, location:escape_only}@}";
      id v6 = v3;
      uint32_t v7 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v12 = 0;
      __int16 v13 = 2082;
      id v14 = "";
      uint64_t v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, initRanging\"}";
      id v6 = v8;
      uint32_t v7 = 18;
      goto LABEL_10;
    }
  }
  return v2;
}

+ (id)testModeTask:(unsigned __int8)a3
{
  int v3 = a3;
  switch(a3)
  {
    case 1u:
      id v5 = +[CLDurianTask fetchMultiStatusTask];
      if (!v5) {
        goto LABEL_11;
      }
      id v6 = v5;
      [v5 setHawkeyeOpcode:521];
      LOBYTE(v14) = 1;
      BYTE1(v14) = [v6 hawkeyeOpcode:v14];
      WORD1(v14) = ((unsigned __int16)[v6 hawkeyeOpcode] >> 8);
      uint64_t v7 = 4;
      goto LABEL_19;
    case 2u:
      id v4 = +[CLDurianTask setNearOwnerTimeoutTaskWithTimeout:3700];
      goto LABEL_6;
    case 3u:
    case 4u:
      id v4 = +[CLDurianTask stopSoundHawkeyeTask];
LABEL_6:
      id v6 = v4;
      if (!v4) {
        goto LABEL_11;
      }
      if (v3 == 4)
      {
        uint64_t v9 = 513;
LABEL_18:
        [v4 setHawkeyeOpcode:v9];
        LOBYTE(v14) = 1;
        BYTE1(v14) = [v6 hawkeyeOpcode:v14];
        BYTE2(v14) = (unsigned __int16)[v6 hawkeyeOpcode] >> 8;
        uint64_t v7 = 3;
        goto LABEL_19;
      }
      if (v3 == 3)
      {
        uint64_t v9 = 767;
        goto LABEL_18;
      }
      if (v3 != 2) {
        goto LABEL_20;
      }
      [v4 setHawkeyeOpcode:515];
      LOBYTE(v14) = 1;
      BYTE1(v14) = [v6 hawkeyeOpcode:v14];
      BYTE2(v14) = (unsigned __int16)[v6 hawkeyeOpcode] >> 8;
      *(_WORD *)((char *)&v14 + 3) = 116;
      uint64_t v7 = 5;
LABEL_19:
      [v6 setHawkeyePayload:+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v14, v7)];
LABEL_20:
      [v6 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
      [v6 setCharacteristicUUID:+[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID")];
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332158);
      }
      uint64_t v10 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v11 = [v6 hawkeyeOpcode];
        id v12 = [v6 hawkeyePayload];
        uint64_t v14 = 68289794;
        __int16 v15 = 2082;
        id v16 = "";
        __int16 v17 = 1026;
        int v18 = v3;
        __int16 v19 = 1026;
        unsigned int v20 = v11;
        __int16 v21 = 2114;
        id v22 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye testModeTask\", \"mode\":%{public}d, \"opcode\":%{public}d, \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v14, 0x28u);
      }
      return v6;
    default:
LABEL_11:
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332158);
      }
      uint64_t v8 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = 68289026;
        __int16 v15 = 2082;
        id v16 = "";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, testModeTask\"}", (uint8_t *)&v14, 0x12u);
      }
      return 0;
  }
}

+ (id)startAggressiveAdvertisingTaskWithTimeout:(unsigned int)a3
{
  id v4 = +[CLDurianTask placeholderHawkeyeTask];
  if (v4)
  {
    [v4 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v4 setCharacteristicUUID:+[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID")];
    [v4 setRequiresMutex:0];
    [v4 setExpectsResponse:1];
    [v4 setHawkeyeOpcode:527];
    v12[0] = 1;
    v12[1] = [v4 hawkeyeOpcode];
    _DWORD v12[2] = (unsigned __int16)[v4 hawkeyeOpcode] >> 8;
    unsigned int v13 = a3;
    [v4 setHawkeyePayload:+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v12, 7)];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v5 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 hawkeyePayload];
      *(_DWORD *)buf = 68289282;
      int v15 = 0;
      __int16 v16 = 2082;
      __int16 v17 = "";
      __int16 v18 = 2114;
      id v19 = v6;
      uint64_t v7 = "{\"msg%{public}.0s\":\"#durian #hawkeye start agggresive adv\", \"payload\":%{public, location:escape_only}@}";
      uint64_t v8 = v5;
      uint32_t v9 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v10 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v15 = 0;
      __int16 v16 = 2082;
      __int16 v17 = "";
      uint64_t v7 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, start agggresive adv\"}";
      uint64_t v8 = v10;
      uint32_t v9 = 18;
      goto LABEL_10;
    }
  }
  return v4;
}

+ (id)stopAggressiveAdvertisingTask
{
  id v2 = +[CLDurianTask placeholderHawkeyeTask];
  if (v2)
  {
    [v2 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v2 setCharacteristicUUID:+[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID")];
    [v2 setRequiresMutex:0];
    [v2 setExpectsResponse:1];
    [v2 setHawkeyeOpcode:528];
    v10[0] = 1;
    v10[1] = [v2 hawkeyeOpcode];
    v10[2] = (unsigned __int16)[v2 hawkeyeOpcode] >> 8;
    [v2 setHawkeyePayload:+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v10, 3)];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v3 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [v2 hawkeyePayload];
      *(_DWORD *)buf = 68289282;
      int v12 = 0;
      __int16 v13 = 2082;
      uint64_t v14 = "";
      __int16 v15 = 2114;
      id v16 = v4;
      uint64_t v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye stop agggresive adv\", \"payload\":%{public, location:escape_only}@}";
      id v6 = v3;
      uint32_t v7 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v12 = 0;
      __int16 v13 = 2082;
      uint64_t v14 = "";
      uint64_t v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, stop agggresive adv\"}";
      id v6 = v8;
      uint32_t v7 = 18;
      goto LABEL_10;
    }
  }
  return v2;
}

+ (id)fetchTxPowerTask
{
  id v2 = +[CLDurianTask placeholderHawkeyeTask];
  if (v2)
  {
    [v2 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v2 setCharacteristicUUID:+[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID")];
    [v2 setExpectsResponse:1];
    [v2 setRequiresMutex:0];
    [v2 setHawkeyeOpcode:529];
    LOBYTE(v6) = 1;
    BYTE1(v6) = [v2 hawkeyeOpcode:v6];
    BYTE2(v6) = (unsigned __int16)[v2 hawkeyeOpcode] >> 8;
    [v2 setHawkeyePayload:[NSData dataWithBytes:&v6 length:3]];
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  uint64_t v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v2 hawkeyePayload];
    uint64_t v6 = 68289282;
    __int16 v7 = 2082;
    uint64_t v8 = "";
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye tx power\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)fetchHeleAccessoryCapabilitiesTask
{
  id v2 = +[CLDurianTask placeholderHawkeyeTask];
  if (v2)
  {
    [v2 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v2 setCharacteristicUUID:+[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID")];
    [v2 setExpectsResponse:1];
    [v2 setRequiresMutex:0];
    [v2 setHawkeyeOpcode:537];
    LOBYTE(v6) = 1;
    BYTE1(v6) = [v2 hawkeyeOpcode:v6];
    BYTE2(v6) = (unsigned __int16)[v2 hawkeyeOpcode] >> 8;
    [v2 setHawkeyePayload:+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 3)];
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  uint64_t v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v2 hawkeyePayload];
    uint64_t v6 = 68289282;
    __int16 v7 = 2082;
    uint64_t v8 = "";
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye hele capabilities\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)fetchHeleFirmwareVersionTask
{
  id v2 = +[CLDurianTask placeholderHawkeyeTask];
  if (v2)
  {
    [v2 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v2 setCharacteristicUUID:[+[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID")];
    [v2 setExpectsResponse:1];
    [v2 setRequiresMutex:0];
    [v2 setHawkeyeOpcode:538];
    LOBYTE(v6) = 1;
    BYTE1(v6) = [v2 hawkeyeOpcode:v6];
    BYTE2(v6) = (unsigned __int16)[v2 hawkeyeOpcode] >> 8;
    [v2 setHawkeyePayload:+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 3)];
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  uint64_t v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v2 hawkeyePayload];
    uint64_t v6 = 68289282;
    __int16 v7 = 2082;
    uint64_t v8 = "";
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye hele fwversion\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)fetchHeleBatteryLevelTask
{
  id v2 = +[CLDurianTask placeholderHawkeyeTask];
  if (v2)
  {
    [v2 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v2 setCharacteristicUUID:+[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID")];
    [v2 setExpectsResponse:1];
    [v2 setRequiresMutex:0];
    [v2 setHawkeyeOpcode:541];
    LOBYTE(v6) = 1;
    BYTE1(v6) = [v2 hawkeyeOpcode:v6];
    BYTE2(v6) = (unsigned __int16)[v2 hawkeyeOpcode] >> 8;
    [v2 setHawkeyePayload:+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 3)];
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  uint64_t v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v2 hawkeyePayload];
    uint64_t v6 = 68289282;
    __int16 v7 = 2082;
    uint64_t v8 = "";
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye hele fwversion\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)getCurrentPrimaryKeyTask
{
  id v2 = +[CLDurianTask placeholderHawkeyeTask];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 setExpectsResponse:1];
    [v3 setServiceUUID:[+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")]];
    [v3 setCharacteristicUUID:[+[CBUUID _cl_HawkeyePairedOwnerInformationCharacteristicUUID](CBUUID, "_cl_HawkeyePairedOwnerInformationCharacteristicUUID")];
    [v3 setHawkeyeOpcode:1024];
    v11[0] = 1;
    v11[1] = [v3 hawkeyeOpcode];
    v11[2] = (unsigned __int16)[v3 hawkeyeOpcode] >> 8;
    [v3 setHawkeyePayload:+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v11, 3)];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v4 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v3 hawkeyePayload];
      *(_DWORD *)buf = 68289282;
      int v13 = 0;
      __int16 v14 = 2082;
      __int16 v15 = "";
      __int16 v16 = 2114;
      id v17 = v5;
      uint64_t v6 = "{\"msg%{public}.0s\":\"#durian #hawkeye getCurrentPrimaryKey\", \"payload\":%{public, location:escape_only}@}";
      __int16 v7 = v4;
      uint32_t v8 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v9 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v13 = 0;
      __int16 v14 = 2082;
      __int16 v15 = "";
      uint64_t v6 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, getCurrentPrimaryKey\"}";
      __int16 v7 = v9;
      uint32_t v8 = 18;
      goto LABEL_10;
    }
  }
  return v3;
}

+ (id)getiCloudIdentifierTask
{
  id v2 = +[CLDurianTask placeholderHawkeyeTask];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 setExpectsResponse:1];
    [v3 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v3 setCharacteristicUUID:+[CBUUID _cl_HawkeyePairedOwnerInformationCharacteristicUUID](CBUUID, "_cl_HawkeyePairedOwnerInformationCharacteristicUUID")];
    [v3 setHawkeyeOpcode:1025];
    v11[0] = 1;
    v11[1] = [v3 hawkeyeOpcode];
    v11[2] = (unsigned __int16)[v3 hawkeyeOpcode] >> 8;
    [v3 setHawkeyePayload:+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v11, 3)];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v4 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v3 hawkeyePayload];
      *(_DWORD *)buf = 68289282;
      int v13 = 0;
      __int16 v14 = 2082;
      __int16 v15 = "";
      __int16 v16 = 2114;
      id v17 = v5;
      uint64_t v6 = "{\"msg%{public}.0s\":\"#durian #hawkeye getiCloudIdentifier\", \"payload\":%{public, location:escape_only}@}";
      __int16 v7 = v4;
      uint32_t v8 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v9 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v13 = 0;
      __int16 v14 = 2082;
      __int16 v15 = "";
      uint64_t v6 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, getiCloudIdentifier\"}";
      __int16 v7 = v9;
      uint32_t v8 = 18;
      goto LABEL_10;
    }
  }
  return v3;
}

+ (id)getSerialNumberTask
{
  id v2 = +[CLDurianTask placeholderHawkeyeTask];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 setExpectsResponse:1];
    [v3 setServiceUUID:[+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")]];
    [v3 setCharacteristicUUID:+[CBUUID _cl_HawkeyePairedOwnerInformationCharacteristicUUID](CBUUID, "_cl_HawkeyePairedOwnerInformationCharacteristicUUID")];
    [v3 setHawkeyeOpcode:1028];
    v11[0] = 1;
    v11[1] = [v3 hawkeyeOpcode];
    v11[2] = (unsigned __int16)[v3 hawkeyeOpcode] >> 8;
    [v3 setHawkeyePayload:+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v11, 3)];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v4 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v3 hawkeyePayload];
      *(_DWORD *)buf = 68289282;
      int v13 = 0;
      __int16 v14 = 2082;
      __int16 v15 = "";
      __int16 v16 = 2114;
      id v17 = v5;
      uint64_t v6 = "{\"msg%{public}.0s\":\"#durian #hawkeye getSerialNumber\", \"payload\":%{public, location:escape_only}@}";
      __int16 v7 = v4;
      uint32_t v8 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v9 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v13 = 0;
      __int16 v14 = 2082;
      __int16 v15 = "";
      uint64_t v6 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, getSerialNumber\"}";
      __int16 v7 = v9;
      uint32_t v8 = 18;
      goto LABEL_10;
    }
  }
  return v3;
}

+ (id)setKeyRotationTimeoutHawkeyeTaskWithTimeout:(unsigned int)a3
{
  id v4 = +[CLDurianTask setKeyRotationTimeoutTaskWithTimeout:"setKeyRotationTimeoutTaskWithTimeout:"];
  if (v4)
  {
    [v4 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v4 setCharacteristicUUID:+[CBUUID _cl_HawkeyeDebugCharacteristicUUID](CBUUID, "_cl_HawkeyeDebugCharacteristicUUID")];
    [v4 setHawkeyeOpcode:1280];
    v12[0] = 1;
    v12[1] = [v4 hawkeyeOpcode];
    _DWORD v12[2] = (unsigned __int16)[v4 hawkeyeOpcode] >> 8;
    unsigned int v13 = a3;
    [v4 setHawkeyePayload:[NSData dataWithBytes:length:v12, 7]];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v5 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 hawkeyePayload];
      *(_DWORD *)buf = 68289538;
      int v15 = 0;
      __int16 v16 = 2082;
      id v17 = "";
      __int16 v18 = 1026;
      unsigned int v19 = a3;
      __int16 v20 = 2114;
      id v21 = v6;
      __int16 v7 = "{\"msg%{public}.0s\":\"#durian #hawkeye keyRotation\", \"timeout\":%{public}d, \"payload\":%{public, location:escape_only}@}";
      uint32_t v8 = v5;
      uint32_t v9 = 34;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v10 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v15 = 0;
      __int16 v16 = 2082;
      id v17 = "";
      __int16 v7 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, keyRotation\"}";
      uint32_t v8 = v10;
      uint32_t v9 = 18;
      goto LABEL_10;
    }
  }
  return v4;
}

+ (id)retrieveLogsHawkeyeTask
{
  id v2 = +[CLDurianTask placeholderHawkeyeTask];
  if (v2)
  {
    [v2 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v2 setCharacteristicUUID:+[CBUUID _cl_HawkeyeDebugCharacteristicUUID](CBUUID, "_cl_HawkeyeDebugCharacteristicUUID")];
    [v2 setHawkeyeOpcode:1281];
    v10[0] = 1;
    v10[1] = [v2 hawkeyeOpcode];
    v10[2] = (unsigned __int16)[v2 hawkeyeOpcode] >> 8;
    [v2 setHawkeyePayload:[NSData dataWithBytes:length:v10, 3]];
    [v2 setExpectsResponse:1];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v3 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [v2 hawkeyePayload];
      *(_DWORD *)buf = 68289282;
      int v12 = 0;
      __int16 v13 = 2082;
      __int16 v14 = "";
      __int16 v15 = 2114;
      id v16 = v4;
      uint64_t v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye retrieveLogs\", \"payload\":%{public, location:escape_only}@}";
      id v6 = v3;
      uint32_t v7 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v12 = 0;
      __int16 v13 = 2082;
      __int16 v14 = "";
      uint64_t v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, retrieveLogs\"}";
      id v6 = v8;
      uint32_t v7 = 18;
      goto LABEL_10;
    }
  }
  return v2;
}

+ (id)resetHawkeyeTask
{
  id v2 = +[CLDurianTask placeholderHawkeyeTask];
  if (v2)
  {
    [v2 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v2 setCharacteristicUUID:+[CBUUID _cl_HawkeyeDebugCharacteristicUUID](CBUUID, "_cl_HawkeyeDebugCharacteristicUUID")];
    [v2 setHawkeyeOpcode:1284];
    v10[0] = 1;
    v10[1] = [v2 hawkeyeOpcode];
    v10[2] = (unsigned __int16)[v2 hawkeyeOpcode] >> 8;
    [v2 setHawkeyePayload:+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v10, 3)];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v3 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [v2 hawkeyePayload];
      *(_DWORD *)buf = 68289282;
      int v12 = 0;
      __int16 v13 = 2082;
      __int16 v14 = "";
      __int16 v15 = 2114;
      id v16 = v4;
      uint64_t v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye reset\", \"payload\":%{public, location:escape_only}@}";
      id v6 = v3;
      uint32_t v7 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v12 = 0;
      __int16 v13 = 2082;
      __int16 v14 = "";
      uint64_t v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, reset\"}";
      id v6 = v8;
      uint32_t v7 = 18;
      goto LABEL_10;
    }
  }
  return v2;
}

+ (id)setHawkeyeUTMotionConfigWithSeparatedUTTimeoutSeconds:(unsigned int)a3 separatedUTBackoffTimeoutSeconds:(unsigned int)a4
{
  id v6 = +[CLDurianTask placeholderHawkeyeTask];
  if (v6)
  {
    [v6 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v6 setCharacteristicUUID:+[CBUUID _cl_HawkeyeDebugCharacteristicUUID](CBUUID, "_cl_HawkeyeDebugCharacteristicUUID")];
    [v6 setHawkeyeOpcode:1285];
    v19[0] = 1;
    v19[1] = [v6 hawkeyeOpcode];
    v19[2] = (unsigned __int16)[v6 hawkeyeOpcode] >> 8;
    unsigned int v20 = a3;
    unsigned int v21 = a4;
    [v6 setHawkeyePayload:+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v19, 11)];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v7 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 68289282;
      int v14 = 0;
      __int16 v15 = 2082;
      id v16 = "";
      __int16 v17 = 2114;
      id v18 = [v6 hawkeyePayload];
      uint64_t v8 = "{\"msg%{public}.0s\":\"#durian #hawkeye motion config\", \"payload\":%{public, location:escape_only}@}";
      uint32_t v9 = v7;
      uint32_t v10 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332158);
    }
    uint64_t v11 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 68289026;
      int v14 = 0;
      __int16 v15 = 2082;
      id v16 = "";
      uint64_t v8 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, reset\"}";
      uint32_t v9 = v11;
      uint32_t v10 = 18;
      goto LABEL_10;
    }
  }
  return v6;
}

+ (id)fetchTxPowerGATTTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  id v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    id v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetchTxPower\"}", (uint8_t *)v4, 0x12u);
  }
  return [[CLDurianGATTReadTask alloc] initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 221, 0) serviceUUID:+[CBUUID _cl_BtTxPowerServiceUUID](CBUUID, "_cl_BtTxPowerServiceUUID") characteristicUUID:+[CBUUID _cl_BtTxPowerCharacteristicUUID]];
}

+ (id)fetchProductDataGATTTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  id v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    id v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetchProductData\"}", (uint8_t *)v4, 0x12u);
  }
  return [[CLDurianGATTReadTask alloc] initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 209, 0) serviceUUID:+[CBUUID _cl_HawkeyeAccessoryInformationServiceUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceUUID") characteristicUUID:+[CBUUID _cl_HawkeyeAccessoryInformationServiceProductDataCharacteristicUUID]];
}

+ (id)fetchManufacturerNameGATTTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  id v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    id v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetchManufacturerName\"}", (uint8_t *)v4, 0x12u);
  }
  return [[CLDurianGATTReadTask alloc] initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 210, 0) serviceUUID:+[CBUUID _cl_HawkeyeAccessoryInformationServiceUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceUUID") characteristicUUID:+[CBUUID _cl_HawkeyeAccessoryInformationServiceManufacturerNameCharacteristicUUID]];
}

+ (id)fetchModelNameGATTTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  id v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    id v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetchModelName\"}", (uint8_t *)v4, 0x12u);
  }
  return [[CLDurianGATTReadTask alloc] initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 211, 0) serviceUUID:+[CBUUID _cl_HawkeyeAccessoryInformationServiceUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceUUID") characteristicUUID:+[CBUUID _cl_HawkeyeAccessoryInformationServiceModelNameCharacteristicUUID]];
}

+ (id)fetchModelColorCodeGATTTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  id v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    id v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetchModelColorCode\"}", (uint8_t *)v4, 0x12u);
  }
  return [[CLDurianGATTReadTask alloc] initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 212, 0) serviceUUID:+[CBUUID _cl_HawkeyeAccessoryInformationServiceUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceUUID") characteristicUUID:+[CBUUID _cl_HawkeyeAccessoryInformationServiceModelColorCodeCharacteristicUUID]];
}

+ (id)fetchAccessoryCategoryGATTTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  id v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    id v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetchAccessoryCategory\"}", (uint8_t *)v4, 0x12u);
  }
  return [[CLDurianGATTReadTask alloc] initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 213, 0) serviceUUID:+[CBUUID _cl_HawkeyeAccessoryInformationServiceUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceUUID") characteristicUUID:+[CBUUID _cl_HawkeyeAccessoryInformationServiceAccessoryCategoryCharacteristicUUID]];
}

+ (id)fetchAccessoryCapabilitiesGATTTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  id v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    id v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetchAccessoryCapabilities\"}", (uint8_t *)v4, 0x12u);
  }
  return [[CLDurianGATTReadTask alloc] initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 214, 0) serviceUUID:+[CBUUID _cl_HawkeyeAccessoryInformationServiceUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceUUID") characteristicUUID:+[CBUUID _cl_HawkeyeAccessoryInformationServiceAccessoryCapabilitiesCharacteristicUUID]];
}

+ (id)fetchFirmwareVersionGATTTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  id v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    id v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetchFirmwareVersion\"}", (uint8_t *)v4, 0x12u);
  }
  return [[CLDurianGATTReadTask alloc] initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 215, 0) serviceUUID:+[CBUUID _cl_HawkeyeAccessoryInformationServiceUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceUUID") characteristicUUID:+[CBUUID _cl_HawkeyeAccessoryInformationServiceFirmwareVersionCharacteristicUUID]];
}

+ (id)fetchFindMyVersionGATTTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  id v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    id v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetchFindMyVersion\"}", (uint8_t *)v4, 0x12u);
  }
  return [[CLDurianGATTReadTask alloc] initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 216, 0) serviceUUID:+[CBUUID _cl_HawkeyeAccessoryInformationServiceUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceUUID") characteristicUUID:+[CBUUID _cl_HawkeyeAccessoryInformationServiceFindMyVersionCharacteristicUUID]];
}

+ (id)fetchBatteryTypeGATTTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  id v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    id v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetchBatteryType\"}", (uint8_t *)v4, 0x12u);
  }
  return [[CLDurianGATTReadTask alloc] initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 217, 0) serviceUUID:+[CBUUID _cl_HawkeyeAccessoryInformationServiceUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceUUID") characteristicUUID:+[CBUUID _cl_HawkeyeAccessoryInformationServiceBatteryTypeCharacteristicUUID]];
}

+ (id)fetchBatteryLevelGATTTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  id v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    id v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetchBatteryLevel\"}", (uint8_t *)v4, 0x12u);
  }
  return [[CLDurianGATTReadTask alloc] initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 218, 0) serviceUUID:+[CBUUID _cl_HawkeyeAccessoryInformationServiceUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceUUID") characteristicUUID:+[CBUUID _cl_HawkeyeAccessoryInformationServiceBatteryLevelCharacteristicUUID]];
}

+ (id)getGroupStatusHawkeyeTask
{
  id v2 = +[CLDurianTask placeholderHawkeyeTask];
  if (v2)
  {
    [v2 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v2 setCharacteristicUUID:+[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID")];
    [v2 setExpectsResponse:1];
    [v2 setRequiresMutex:0];
    [v2 setHawkeyeOpcode:551];
    LOBYTE(v6) = 1;
    BYTE1(v6) = [v2 hawkeyeOpcode:v6];
    BYTE2(v6) = (unsigned __int16)[v2 hawkeyeOpcode] >> 8;
    [v2 setHawkeyePayload:+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 3)];
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  uint64_t v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v2 hawkeyePayload];
    uint64_t v6 = 68289282;
    __int16 v7 = 2082;
    uint64_t v8 = "";
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye get multipart status\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)startNonOwnerSoundHawkeyeTask
{
  id v2 = [(CLDurianTask *)[CLHawkeyeTask alloc] initWithCommand:+[CLDurianCommand startUnauthorizedSoundCommand] desiredLatency:0 expectsResponse:1 completeOnPreemption:1 requiresMutex:1];
  if (v2)
  {
    [(CLHawkeyeTask *)v2 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID]];
    [(CLHawkeyeTask *)v2 setCharacteristicUUID:+[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID]];
    [(CLDurianTask *)v2 setRequiresMutex:0];
    [(CLHawkeyeTask *)v2 setHawkeyeOpcode:768];
    LOBYTE(v6) = 1;
    BYTE1(v6) = [(CLHawkeyeTask *)v2 hawkeyeOpcode];
    BYTE2(v6) = [(CLHawkeyeTask *)v2 hawkeyeOpcode] >> 8;
    [(CLHawkeyeTask *)v2 setHawkeyePayload:+[NSData dataWithBytes:&v6 length:3]];
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  uint64_t v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(CLHawkeyeTask *)v2 hawkeyePayload];
    uint64_t v6 = 68289282;
    __int16 v7 = 2082;
    uint64_t v8 = "";
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye non-owner soundStart\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)stopNonOwnerSoundHawkeyeTask
{
  id v2 = [(CLDurianTask *)[CLHawkeyeTask alloc] initWithCommand:+[CLDurianCommand stopUnauthorizedSoundCommand] desiredLatency:0 expectsResponse:1 completeOnPreemption:0 requiresMutex:0];
  if (v2)
  {
    [(CLHawkeyeTask *)v2 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID]];
    [(CLHawkeyeTask *)v2 setCharacteristicUUID:+[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID]];
    [(CLDurianTask *)v2 setExpectsResponse:1];
    [(CLHawkeyeTask *)v2 setHawkeyeOpcode:769];
    LOBYTE(v6) = 1;
    BYTE1(v6) = [(CLHawkeyeTask *)v2 hawkeyeOpcode];
    BYTE2(v6) = [(CLHawkeyeTask *)v2 hawkeyeOpcode] >> 8;
    [(CLHawkeyeTask *)v2 setHawkeyePayload:+[NSData dataWithBytes:&v6 length:3]];
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  uint64_t v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(CLHawkeyeTask *)v2 hawkeyePayload];
    uint64_t v6 = 68289282;
    __int16 v7 = 2082;
    uint64_t v8 = "";
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye non-owner soundStop\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)startNonOwnerShortSoundHawkeyeTask
{
  id v2 = [(CLDurianTask *)[CLHawkeyeTask alloc] initWithCommand:+[CLDurianCommand startUnauthorizedSoundCommand] desiredLatency:0 expectsResponse:1 completeOnPreemption:0 requiresMutex:0];
  if (v2)
  {
    [(CLHawkeyeTask *)v2 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID]];
    [(CLHawkeyeTask *)v2 setCharacteristicUUID:+[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID]];
    [(CLDurianTask *)v2 setExpectsResponse:1];
    [(CLHawkeyeTask *)v2 setHawkeyeOpcode:794];
    LOBYTE(v6) = 1;
    BYTE1(v6) = [(CLHawkeyeTask *)v2 hawkeyeOpcode];
    BYTE2(v6) = [(CLHawkeyeTask *)v2 hawkeyeOpcode] >> 8;
    [(CLHawkeyeTask *)v2 setHawkeyePayload:+[NSData dataWithBytes:&v6 length:3]];
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  uint64_t v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(CLHawkeyeTask *)v2 hawkeyePayload];
    uint64_t v6 = 68289282;
    __int16 v7 = 2082;
    uint64_t v8 = "";
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye non-owner shortSoundStart\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)fetchNonOwnerTxPowerTask
{
  id v2 = +[CLDurianTask placeholderHawkeyeTask];
  if (v2)
  {
    [v2 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v2 setCharacteristicUUID:+[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID](CBUUID, "_cl_HawkeyeNonOwnerCharacteristicUUID")];
    [v2 setExpectsResponse:1];
    [v2 setRequiresMutex:0];
    [v2 setHawkeyeOpcode:773];
    LOBYTE(v6) = 1;
    BYTE1(v6) = [v2 hawkeyeOpcode:v6];
    BYTE2(v6) = (unsigned __int16)[v2 hawkeyeOpcode] >> 8;
    [v2 setHawkeyePayload:[NSData dataWithBytes:&v6 length:3]];
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  uint64_t v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v2 hawkeyePayload];
    uint64_t v6 = 68289282;
    __int16 v7 = 2082;
    uint64_t v8 = "";
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye nonowner tx power\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)startNonOwnerAggressiveAdvertisingTask
{
  id v2 = +[CLDurianTask placeholderHawkeyeTask];
  if (v2)
  {
    [v2 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v2 setCharacteristicUUID:+[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID](CBUUID, "_cl_HawkeyeNonOwnerCharacteristicUUID")];
    [v2 setRequiresMutex:0];
    [v2 setHawkeyeOpcode:772];
    LOBYTE(v6) = 1;
    BYTE1(v6) = [v2 hawkeyeOpcode:v6];
    BYTE2(v6) = (unsigned __int16)[v2 hawkeyeOpcode] >> 8;
    [v2 setHawkeyePayload:[NSData dataWithBytes:&v6 length:3]];
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  uint64_t v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v2 hawkeyePayload];
    uint64_t v6 = 68289282;
    __int16 v7 = 2082;
    uint64_t v8 = "";
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye non-owner start agggresive adv\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)fetchNonOwnerProductDataTask
{
  id v2 = +[CLDurianTask placeholderHawkeyeTask];
  if (v2)
  {
    [v2 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v2 setCharacteristicUUID:+[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID](CBUUID, "_cl_HawkeyeNonOwnerCharacteristicUUID")];
    [v2 setExpectsResponse:1];
    [v2 setRequiresMutex:0];
    [v2 setHawkeyeOpcode:774];
    LOBYTE(v6) = 1;
    BYTE1(v6) = [v2 hawkeyeOpcode:v6];
    BYTE2(v6) = (unsigned __int16)[v2 hawkeyeOpcode] >> 8;
    [v2 setHawkeyePayload:+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 3)];
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  uint64_t v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v2 hawkeyePayload];
    uint64_t v6 = 68289282;
    __int16 v7 = 2082;
    uint64_t v8 = "";
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye non-owner product data\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)fetchNonOwnerManufacturerNameTask
{
  id v2 = +[CLDurianTask placeholderHawkeyeTask];
  if (v2)
  {
    [v2 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v2 setCharacteristicUUID:+[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID](CBUUID, "_cl_HawkeyeNonOwnerCharacteristicUUID")];
    [v2 setExpectsResponse:1];
    [v2 setRequiresMutex:0];
    [v2 setHawkeyeOpcode:775];
    LOBYTE(v6) = 1;
    BYTE1(v6) = [v2 hawkeyeOpcode:v6];
    BYTE2(v6) = (unsigned __int16)[v2 hawkeyeOpcode] >> 8;
    [v2 setHawkeyePayload:+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 3)];
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  uint64_t v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v2 hawkeyePayload];
    uint64_t v6 = 68289282;
    __int16 v7 = 2082;
    uint64_t v8 = "";
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye non-owner manufacturer name\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)fetchNonOwnerModelNameTask
{
  id v2 = +[CLDurianTask placeholderHawkeyeTask];
  if (v2)
  {
    [v2 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v2 setCharacteristicUUID:[+[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID](CBUUID, "_cl_HawkeyeNonOwnerCharacteristicUUID")];
    [v2 setExpectsResponse:1];
    [v2 setRequiresMutex:0];
    [v2 setHawkeyeOpcode:776];
    LOBYTE(v6) = 1;
    BYTE1(v6) = [v2 hawkeyeOpcode:v6];
    BYTE2(v6) = (unsigned __int16)[v2 hawkeyeOpcode] >> 8;
    [v2 setHawkeyePayload:[NSData dataWithBytes:length:&v6, 3]];
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  uint64_t v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v2 hawkeyePayload];
    uint64_t v6 = 68289282;
    __int16 v7 = 2082;
    uint64_t v8 = "";
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye non-owner model name\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)fetchNonOwnerAccessoryCategoryTask
{
  id v2 = +[CLDurianTask placeholderHawkeyeTask];
  if (v2)
  {
    [v2 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v2 setCharacteristicUUID:+[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID](CBUUID, "_cl_HawkeyeNonOwnerCharacteristicUUID")];
    [v2 setExpectsResponse:1];
    [v2 setRequiresMutex:0];
    [v2 setHawkeyeOpcode:777];
    LOBYTE(v6) = 1;
    BYTE1(v6) = [v2 hawkeyeOpcode:v6];
    BYTE2(v6) = (unsigned __int16)[v2 hawkeyeOpcode] >> 8;
    [v2 setHawkeyePayload:[NSData dataWithBytes:length:&v6, 3]];
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  uint64_t v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v2 hawkeyePayload];
    uint64_t v6 = 68289282;
    __int16 v7 = 2082;
    uint64_t v8 = "";
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye non-owner accessory category\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)fetchNonOwnerAccessoryCapabilitiesTask
{
  id v2 = +[CLDurianTask placeholderHawkeyeTask];
  if (v2)
  {
    [v2 setServiceUUID:[+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v2 setCharacteristicUUID:[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID]];
    [v2 setExpectsResponse:1];
    [v2 setRequiresMutex:0];
    [v2 setHawkeyeOpcode:778];
    LOBYTE(v6) = 1;
    BYTE1(v6) = [v2 hawkeyeOpcode:v6];
    BYTE2(v6) = (unsigned __int16)[v2 hawkeyeOpcode] >> 8;
    [v2 setHawkeyePayload:+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 3)];
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  uint64_t v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v2 hawkeyePayload];
    uint64_t v6 = 68289282;
    __int16 v7 = 2082;
    uint64_t v8 = "";
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye non-owner accessory capabilities\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)fetchNonOwnerFirmwareVersionTask
{
  id v2 = +[CLDurianTask placeholderHawkeyeTask];
  if (v2)
  {
    [v2 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v2 setCharacteristicUUID:+[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID](CBUUID, "_cl_HawkeyeNonOwnerCharacteristicUUID")];
    [v2 setExpectsResponse:1];
    [v2 setRequiresMutex:0];
    [v2 setHawkeyeOpcode:779];
    LOBYTE(v6) = 1;
    BYTE1(v6) = [v2 hawkeyeOpcode:v6];
    BYTE2(v6) = (unsigned __int16)[v2 hawkeyeOpcode] >> 8;
    [v2 setHawkeyePayload:[NSData dataWithBytes:&v6 length:3]];
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  uint64_t v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v2 hawkeyePayload];
    uint64_t v6 = 68289282;
    __int16 v7 = 2082;
    uint64_t v8 = "";
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye non-owner firmware version\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)fetchNonOwnerFindMyVersionTask
{
  id v2 = +[CLDurianTask placeholderHawkeyeTask];
  if (v2)
  {
    [v2 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v2 setCharacteristicUUID:[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID]];
    [v2 setExpectsResponse:1];
    [v2 setRequiresMutex:0];
    [v2 setHawkeyeOpcode:780];
    LOBYTE(v6) = 1;
    BYTE1(v6) = [v2 hawkeyeOpcode:v6];
    BYTE2(v6) = (unsigned __int16)[v2 hawkeyeOpcode] >> 8;
    [v2 setHawkeyePayload:[NSData dataWithBytes:&v6 length:3]];
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  uint64_t v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v2 hawkeyePayload];
    uint64_t v6 = 68289282;
    __int16 v7 = 2082;
    uint64_t v8 = "";
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye non-owner findmy version\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)fetchNonOwnerBatteryTypeTask
{
  id v2 = +[CLDurianTask placeholderHawkeyeTask];
  if (v2)
  {
    [v2 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v2 setCharacteristicUUID:+[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID](CBUUID, "_cl_HawkeyeNonOwnerCharacteristicUUID")];
    [v2 setExpectsResponse:1];
    [v2 setRequiresMutex:0];
    [v2 setHawkeyeOpcode:781];
    LOBYTE(v6) = 1;
    BYTE1(v6) = [v2 hawkeyeOpcode:v6];
    BYTE2(v6) = (unsigned __int16)[v2 hawkeyeOpcode] >> 8;
    [v2 setHawkeyePayload:+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 3)];
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  uint64_t v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v2 hawkeyePayload];
    uint64_t v6 = 68289282;
    __int16 v7 = 2082;
    uint64_t v8 = "";
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye non-owner battery type\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)fetchNonOwnerBatteryLevelTask
{
  id v2 = +[CLDurianTask placeholderHawkeyeTask];
  if (v2)
  {
    [v2 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")];
    [v2 setCharacteristicUUID:+[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID](CBUUID, "_cl_HawkeyeNonOwnerCharacteristicUUID")];
    [v2 setExpectsResponse:1];
    [v2 setRequiresMutex:0];
    [v2 setHawkeyeOpcode:782];
    LOBYTE(v6) = 1;
    BYTE1(v6) = [v2 hawkeyeOpcode:v6];
    BYTE2(v6) = (unsigned __int16)[v2 hawkeyeOpcode] >> 8;
    [v2 setHawkeyePayload:+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 3)];
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  uint64_t v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v2 hawkeyePayload];
    uint64_t v6 = 68289282;
    __int16 v7 = 2082;
    uint64_t v8 = "";
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye non-owner battery level\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)sendUARPMessageTaskWithPayload:(id)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  id v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    uint64_t v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye UARP message task\"}", (uint8_t *)v6, 0x12u);
  }
  return [[CLDurianGATTWriteTask alloc] initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 219, 0) serviceUUID:+[CBUUID _cl_HawkeyeAccessoryFirmwareUpdateServiceUUID](CBUUID, "_cl_HawkeyeAccessoryFirmwareUpdateServiceUUID") characteristicUUID:+[CBUUID _cl_HawkeyeAccessoryFirmwareUpdateMsgCharacteristicUUID] payload:a3];
}

+ (id)startNonOwnerSoundPoshTask
{
  __int16 v7 = 768;
  id v2 = +[NSData dataWithBytes:&v7 length:2];
  uint64_t v3 = [[CLDurianGATTWriteTask alloc] initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 768, v2) serviceUUID:+[CBUUID _cl_PoshAccessoryNonOwnerServiceUUID](CBUUID, "_cl_PoshAccessoryNonOwnerServiceUUID") characteristicUUID:+[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID] payload:v2];
  [(CLDurianTask *)v3 setRequiresMutex:0];
  [(CLDurianTask *)v3 setExpectsResponse:1];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  id v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [(CLDurianCommand *)[(CLDurianTask *)v3 command] opcode];
    *(_DWORD *)buf = 68289538;
    int v9 = 0;
    __int16 v10 = 2082;
    uint64_t v11 = "";
    __int16 v12 = 2114;
    int v13 = v2;
    __int16 v14 = 1026;
    unsigned int v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut playSound task \", \"payload\":%{public, location:escape_only}@, \"opcode\":%{public}d}", buf, 0x22u);
  }
  return v3;
}

+ (id)stopNonOwnerSoundPoshTask
{
  __int16 v7 = 769;
  id v2 = +[NSData dataWithBytes:&v7 length:2];
  uint64_t v3 = [[CLDurianGATTWriteTask alloc] initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 769, v2) serviceUUID:+[CBUUID _cl_PoshAccessoryNonOwnerServiceUUID](CBUUID, "_cl_PoshAccessoryNonOwnerServiceUUID") characteristicUUID:+[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID] payload:v2];
  [(CLDurianTask *)v3 setRequiresMutex:0];
  [(CLDurianTask *)v3 setExpectsResponse:1];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  id v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [(CLDurianCommand *)[(CLDurianTask *)v3 command] opcode];
    *(_DWORD *)buf = 68289538;
    int v9 = 0;
    __int16 v10 = 2082;
    uint64_t v11 = "";
    __int16 v12 = 2114;
    int v13 = v2;
    __int16 v14 = 1026;
    unsigned int v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut stopSound task \", \"payload\":%{public, location:escape_only}@, \"opcode\":%{public}d}", buf, 0x22u);
  }
  return v3;
}

+ (id)fetchNonOwnerSerialNumberPoshTask
{
  __int16 v7 = 1028;
  id v2 = +[NSData dataWithBytes:&v7 length:2];
  uint64_t v3 = [[CLDurianGATTWriteTask alloc] initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 1028, v2) serviceUUID:+[CBUUID _cl_PoshAccessoryNonOwnerServiceUUID](CBUUID, "_cl_PoshAccessoryNonOwnerServiceUUID") characteristicUUID:+[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID] payload:v2];
  [(CLDurianTask *)v3 setRequiresMutex:0];
  [(CLDurianTask *)v3 setExpectsResponse:1];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  id v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [(CLDurianCommand *)[(CLDurianTask *)v3 command] opcode];
    *(_DWORD *)buf = 68289538;
    int v9 = 0;
    __int16 v10 = 2082;
    uint64_t v11 = "";
    __int16 v12 = 2114;
    int v13 = v2;
    __int16 v14 = 1026;
    unsigned int v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getSerialNumber task \", \"payload\":%{public, location:escape_only}@, \"opcode\":%{public}d}", buf, 0x22u);
  }
  return v3;
}

+ (id)fetchNonOwnerProductDataPoshTask
{
  __int16 v7 = 3;
  id v2 = +[NSData dataWithBytes:&v7 length:2];
  uint64_t v3 = [[CLDurianGATTWriteTask alloc] initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 3, 0) serviceUUID:+[CBUUID _cl_PoshAccessoryNonOwnerServiceUUID](CBUUID, "_cl_PoshAccessoryNonOwnerServiceUUID") characteristicUUID:+[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID] payload:v2];
  [(CLDurianTask *)v3 setRequiresMutex:0];
  [(CLDurianTask *)v3 setExpectsResponse:1];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  id v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [(CLDurianCommand *)[(CLDurianTask *)v3 command] opcode];
    *(_DWORD *)buf = 68289538;
    int v9 = 0;
    __int16 v10 = 2082;
    uint64_t v11 = "";
    __int16 v12 = 2114;
    int v13 = v2;
    __int16 v14 = 1026;
    unsigned int v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getProductData task \", \"payload\":%{public, location:escape_only}@, \"opcode\":%{public}d}", buf, 0x22u);
  }
  return v3;
}

+ (id)fetchNonOwnerManufacturerNamePoshTask
{
  __int16 v7 = 4;
  id v2 = +[NSData dataWithBytes:&v7 length:2];
  uint64_t v3 = [[CLDurianGATTWriteTask alloc] initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 4, v2) serviceUUID:+[CBUUID _cl_PoshAccessoryNonOwnerServiceUUID](CBUUID, "_cl_PoshAccessoryNonOwnerServiceUUID") characteristicUUID:+[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID] payload:v2];
  [(CLDurianTask *)v3 setRequiresMutex:0];
  [(CLDurianTask *)v3 setExpectsResponse:1];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  id v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [(CLDurianCommand *)[(CLDurianTask *)v3 command] opcode];
    *(_DWORD *)buf = 68289538;
    int v9 = 0;
    __int16 v10 = 2082;
    uint64_t v11 = "";
    __int16 v12 = 2114;
    int v13 = v2;
    __int16 v14 = 1026;
    unsigned int v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getManufacturerName task \", \"payload\":%{public, location:escape_only}@, \"opcode\":%{public}d}", buf, 0x22u);
  }
  return v3;
}

+ (id)fetchNonOwnerModelNamePoshTask
{
  __int16 v7 = 5;
  id v2 = +[NSData dataWithBytes:&v7 length:2];
  uint64_t v3 = [[CLDurianGATTWriteTask alloc] initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 5, v2) serviceUUID:+[CBUUID _cl_PoshAccessoryNonOwnerServiceUUID](CBUUID, "_cl_PoshAccessoryNonOwnerServiceUUID") characteristicUUID:+[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID] payload:v2];
  [(CLDurianTask *)v3 setRequiresMutex:0];
  [(CLDurianTask *)v3 setExpectsResponse:1];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  id v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [(CLDurianCommand *)[(CLDurianTask *)v3 command] opcode];
    *(_DWORD *)buf = 68289538;
    int v9 = 0;
    __int16 v10 = 2082;
    uint64_t v11 = "";
    __int16 v12 = 2114;
    int v13 = v2;
    __int16 v14 = 1026;
    unsigned int v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getModelName task \", \"payload\":%{public, location:escape_only}@, \"opcode\":%{public}d}", buf, 0x22u);
  }
  return v3;
}

+ (id)fetchNonOwnerAccessoryCategoryPoshTask
{
  __int16 v7 = 6;
  id v2 = +[NSData dataWithBytes:&v7 length:2];
  uint64_t v3 = [[CLDurianGATTWriteTask alloc] initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 6, 0) serviceUUID:+[CBUUID _cl_PoshAccessoryNonOwnerServiceUUID](CBUUID, "_cl_PoshAccessoryNonOwnerServiceUUID") characteristicUUID:+[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID] payload:v2];
  [(CLDurianTask *)v3 setRequiresMutex:0];
  [(CLDurianTask *)v3 setExpectsResponse:1];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  id v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [(CLDurianCommand *)[(CLDurianTask *)v3 command] opcode];
    *(_DWORD *)buf = 68289538;
    int v9 = 0;
    __int16 v10 = 2082;
    uint64_t v11 = "";
    __int16 v12 = 2114;
    int v13 = v2;
    __int16 v14 = 1026;
    unsigned int v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getAccessoryCategory task \", \"payload\":%{public, location:escape_only}@, \"opcode\":%{public}d}", buf, 0x22u);
  }
  return v3;
}

+ (id)fetchNonOwnerProtocolImplementationPoshTask
{
  __int16 v6 = 7;
  id v2 = +[NSData dataWithBytes:&v6 length:2];
  uint64_t v3 = [[CLDurianGATTWriteTask alloc] initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 7, v2) serviceUUID:+[CBUUID _cl_PoshAccessoryNonOwnerServiceUUID](CBUUID, "_cl_PoshAccessoryNonOwnerServiceUUID") characteristicUUID:+[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID] payload:v2];
  [(CLDurianTask *)v3 setRequiresMutex:0];
  [(CLDurianTask *)v3 setExpectsResponse:1];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  id v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289538;
    int v8 = 0;
    __int16 v9 = 2082;
    __int16 v10 = "";
    __int16 v11 = 2114;
    __int16 v12 = v2;
    __int16 v13 = 1026;
    int v14 = 7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getProtocolImplementation task \", \"payload\":%{public, location:escape_only}@, \"opcode\":%{public}d}", buf, 0x22u);
  }
  return v3;
}

+ (id)fetchNonOwnerAccessoryCapabilitiesPoshTask
{
  __int16 v7 = 8;
  id v2 = +[NSData dataWithBytes:&v7 length:2];
  uint64_t v3 = [[CLDurianGATTWriteTask alloc] initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 8, v2) serviceUUID:+[CBUUID _cl_PoshAccessoryNonOwnerServiceUUID](CBUUID, "_cl_PoshAccessoryNonOwnerServiceUUID") characteristicUUID:+[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID] payload:v2];
  [(CLDurianTask *)v3 setRequiresMutex:0];
  [(CLDurianTask *)v3 setExpectsResponse:1];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  id v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [(CLDurianCommand *)[(CLDurianTask *)v3 command] opcode];
    *(_DWORD *)buf = 68289538;
    int v9 = 0;
    __int16 v10 = 2082;
    __int16 v11 = "";
    __int16 v12 = 2114;
    __int16 v13 = v2;
    __int16 v14 = 1026;
    unsigned int v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getAccessoryCapabilities task \", \"payload\":%{public, location:escape_only}@, \"opcode\":%{public}d}", buf, 0x22u);
  }
  return v3;
}

+ (id)fetchNonOwnerNetworkIdPoshTask
{
  __int16 v7 = 9;
  id v2 = +[NSData dataWithBytes:&v7 length:2];
  uint64_t v3 = [[CLDurianGATTWriteTask alloc] initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 9, 0) serviceUUID:+[CBUUID _cl_PoshAccessoryNonOwnerServiceUUID](CBUUID, "_cl_PoshAccessoryNonOwnerServiceUUID") characteristicUUID:+[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID] payload:v2];
  [(CLDurianTask *)v3 setRequiresMutex:0];
  [(CLDurianTask *)v3 setExpectsResponse:1];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  id v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [(CLDurianCommand *)[(CLDurianTask *)v3 command] opcode];
    *(_DWORD *)buf = 68289538;
    int v9 = 0;
    __int16 v10 = 2082;
    __int16 v11 = "";
    __int16 v12 = 2114;
    __int16 v13 = v2;
    __int16 v14 = 1026;
    unsigned int v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getNetworkId task \", \"payload\":%{public, location:escape_only}@, \"opcode\":%{public}d}", buf, 0x22u);
  }
  return v3;
}

+ (id)fetchNonOwnerFirmwareVersionPoshTask
{
  __int16 v7 = 10;
  id v2 = +[NSData dataWithBytes:&v7 length:2];
  uint64_t v3 = [[CLDurianGATTWriteTask alloc] initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 10, 0) serviceUUID:+[CBUUID _cl_PoshAccessoryNonOwnerServiceUUID](CBUUID, "_cl_PoshAccessoryNonOwnerServiceUUID") characteristicUUID:+[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID] payload:v2];
  [(CLDurianTask *)v3 setRequiresMutex:0];
  [(CLDurianTask *)v3 setExpectsResponse:1];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  id v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [(CLDurianCommand *)[(CLDurianTask *)v3 command] opcode];
    *(_DWORD *)buf = 68289538;
    int v9 = 0;
    __int16 v10 = 2082;
    __int16 v11 = "";
    __int16 v12 = 2114;
    __int16 v13 = v2;
    __int16 v14 = 1026;
    unsigned int v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getFirmwareVersion task \", \"payload\":%{public, location:escape_only}@, \"opcode\":%{public}d}", buf, 0x22u);
  }
  return v3;
}

+ (id)fetchNonOwnerBatteryTypePoshTask
{
  __int16 v7 = 11;
  id v2 = +[NSData dataWithBytes:&v7 length:2];
  uint64_t v3 = [[CLDurianGATTWriteTask alloc] initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 11, 0) serviceUUID:+[CBUUID _cl_PoshAccessoryNonOwnerServiceUUID](CBUUID, "_cl_PoshAccessoryNonOwnerServiceUUID") characteristicUUID:+[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID] payload:v2];
  [(CLDurianTask *)v3 setRequiresMutex:0];
  [(CLDurianTask *)v3 setExpectsResponse:1];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  id v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [(CLDurianCommand *)[(CLDurianTask *)v3 command] opcode];
    *(_DWORD *)buf = 68289538;
    int v9 = 0;
    __int16 v10 = 2082;
    __int16 v11 = "";
    __int16 v12 = 2114;
    __int16 v13 = v2;
    __int16 v14 = 1026;
    unsigned int v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getBatteryType task \", \"payload\":%{public, location:escape_only}@, \"opcode\":%{public}d}", buf, 0x22u);
  }
  return v3;
}

+ (id)fetchNonOwnerBatteryLevelPoshTask
{
  __int16 v7 = 12;
  id v2 = +[NSData dataWithBytes:&v7 length:2];
  uint64_t v3 = [[CLDurianGATTWriteTask alloc] initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 12, 0) serviceUUID:+[CBUUID _cl_PoshAccessoryNonOwnerServiceUUID](CBUUID, "_cl_PoshAccessoryNonOwnerServiceUUID") characteristicUUID:+[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID] payload:v2];
  [(CLDurianTask *)v3 setRequiresMutex:0];
  [(CLDurianTask *)v3 setExpectsResponse:1];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  id v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [(CLDurianCommand *)[(CLDurianTask *)v3 command] opcode];
    *(_DWORD *)buf = 68289538;
    int v9 = 0;
    __int16 v10 = 2082;
    __int16 v11 = "";
    __int16 v12 = 2114;
    __int16 v13 = v2;
    __int16 v14 = 1026;
    unsigned int v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getBatteryLevel task \", \"payload\":%{public, location:escape_only}@, \"opcode\":%{public}d}", buf, 0x22u);
  }
  return v3;
}

+ (id)startNonOwnerPoshAggressiveAdvertisingTask
{
  __int16 v7 = 772;
  id v2 = +[NSData dataWithBytes:&v7 length:2];
  uint64_t v3 = [[CLDurianGATTWriteTask alloc] initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 772, 0) serviceUUID:+[CBUUID _cl_PoshAccessoryNonOwnerServiceUUID](CBUUID, "_cl_PoshAccessoryNonOwnerServiceUUID") characteristicUUID:+[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID] payload:v2];
  [(CLDurianTask *)v3 setRequiresMutex:0];
  [(CLDurianTask *)v3 setExpectsResponse:0];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  id v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [(CLDurianCommand *)[(CLDurianTask *)v3 command] opcode];
    *(_DWORD *)buf = 68289538;
    int v9 = 0;
    __int16 v10 = 2082;
    __int16 v11 = "";
    __int16 v12 = 2114;
    __int16 v13 = v2;
    __int16 v14 = 1026;
    unsigned int v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #start non aggressive advertising task for BT finding\", \"payload\":%{public, location:escape_only}@, \"opcode\":%{public}d}", buf, 0x22u);
  }
  return v3;
}

+ (id)startNonOwnerShortSoundPoshTask
{
  __int16 v7 = 794;
  id v2 = +[NSData dataWithBytes:&v7 length:2];
  uint64_t v3 = [[CLDurianGATTWriteTask alloc] initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 794, 0) serviceUUID:+[CBUUID _cl_PoshAccessoryNonOwnerServiceUUID](CBUUID, "_cl_PoshAccessoryNonOwnerServiceUUID") characteristicUUID:+[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID] payload:v2];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332158);
  }
  id v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [(CLDurianCommand *)[(CLDurianTask *)v3 command] opcode];
    *(_DWORD *)buf = 68289538;
    int v9 = 0;
    __int16 v10 = 2082;
    __int16 v11 = "";
    __int16 v12 = 2114;
    __int16 v13 = v2;
    __int16 v14 = 1026;
    unsigned int v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #start non owner play short sound\", \"payload\":%{public, location:escape_only}@, \"opcode\":%{public}d}", buf, 0x22u);
  }
  return v3;
}

@end