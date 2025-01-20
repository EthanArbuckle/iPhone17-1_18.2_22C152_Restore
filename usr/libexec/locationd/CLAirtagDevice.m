@interface CLAirtagDevice
- (id)createConfigureRangingTaskWithMacAddress:(id)a3 countryCode:(unsigned __int8)a4 uwbChannel:(unsigned __int8)a5 acqPreamble:(unsigned __int8)a6 trackingPreamble:(unsigned __int8)a7 interval:(unsigned __int16)a8;
- (id)createDeinitRangingTask;
- (id)createDumpLogsTaskOfType:(unint64_t)a3;
- (id)createFetchAccelerometerModeTask;
- (id)createFetchAccelerometerOrientationModeTaskWithConfiguration;
- (id)createFetchAccelerometerSlopeModeTaskWithConfiguration;
- (id)createFetchBatteryStatusTask;
- (id)createFetchFirmwareVersionTaskWithCrashLogs:(BOOL)a3;
- (id)createFetchUserStatsTaskWithPersistence:(BOOL)a3;
- (id)createGetMultiStatusTask;
- (id)createInduceCrashTask;
- (id)createInitRangingTaskWithMacAddress:(id)a3;
- (id)createPlaySoundTaskWithSequence:(id)a3;
- (id)createPlayUnauthorizedSoundTaskWithSequence:(id)a3;
- (id)createRollWildKeyTask;
- (id)createSetAccelerometerOrientationModeTaskWithConfiguration:(id)a3;
- (id)createSetAccelerometerSlopeModeTaskWithConfiguration:(id)a3;
- (id)createSetBatteryStatusTaskWithStatus:(unint64_t)a3;
- (id)createSetKeyRollTimeoutTaskWithInterval:(unsigned int)a3;
- (id)createSetMaxConnectionsTaskWithCount:(int)a3;
- (id)createSetNearOwnerTimeoutTaskInSeconds:(unsigned __int16)a3;
- (id)createSetObfuscatedIdentifierTaskWithIdentifier:(id)a3;
- (id)createSetPersistentConnectionTaskWithState:(BOOL)a3;
- (id)createSetTagTypeTaskWithType:(unsigned __int8)a3;
- (id)createSetUnauthorizedPlaySoundRateLimitTask:(BOOL)a3;
- (id)createSetWildModeTaskWithConfiguration:(id)a3;
- (id)createStartRangingTaskWithTargetEventCounter:(unsigned __int16)a3;
- (id)createStopPlayingSoundTask;
- (id)createStopRangingTask;
- (id)createUnpairDeviceTask;
- (unint64_t)getMultiStatusFromData:(char *)a3;
- (unsigned)getRangeEndReasonForOpcode:(unsigned __int16)a3 data:(char *)a4;
- (unsigned)getRangingStatusForOpcode:(unsigned __int16)a3 data:(char *)a4;
@end

@implementation CLAirtagDevice

- (id)createPlaySoundTaskWithSequence:(id)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BC8);
  }
  v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 68289026;
    int v14 = 0;
    __int16 v15 = 2082;
    v16 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #airtag creating playsound task\"}", (uint8_t *)&v13, 0x12u);
  }
  if ((unint64_t)[a3 type] <= 2) {
    return +[CLDurianTask startSoundSequenceTaskWithEncodedSequence:](CLDurianTask, "startSoundSequenceTaskWithEncodedSequence:", [a3 encodedSequence]);
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BC8);
  }
  v7 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
  {
    id v8 = [[-[NSUUID description](-[CLDurianDevice uuid](self, "uuid"), "description") substringToIndex:8];
    unsigned int v9 = [a3 type];
    int v13 = 68289539;
    int v14 = 0;
    __int16 v15 = 2082;
    v16 = "";
    __int16 v17 = 2113;
    id v18 = v8;
    __int16 v19 = 1026;
    unsigned int v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian unrecognized sound sequence type\", \"item\":%{private, location:escape_only}@, \"soundSequenceType\":%{public}d}", (uint8_t *)&v13, 0x22u);
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331BC8);
    }
  }
  v10 = qword_102419398;
  if (os_signpost_enabled((os_log_t)qword_102419398))
  {
    id v11 = [[-[NSUUID description](-[CLDurianDevice uuid](self, "uuid"), "description") substringToIndex:8];
    unsigned int v12 = [a3 type];
    int v13 = 68289539;
    int v14 = 0;
    __int16 v15 = 2082;
    v16 = "";
    __int16 v17 = 2113;
    id v18 = v11;
    __int16 v19 = 1026;
    unsigned int v20 = v12;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian unrecognized sound sequence type", "{\"msg%{public}.0s\":\"#durian unrecognized sound sequence type\", \"item\":%{private, location:escape_only}@, \"soundSequenceType\":%{public}d}", (uint8_t *)&v13, 0x22u);
  }
  return 0;
}

- (id)createPlayUnauthorizedSoundTaskWithSequence:(id)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BC8);
  }
  v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 68289026;
    int v15 = 0;
    __int16 v16 = 2082;
    __int16 v17 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #airtag creating #ut playsound task\"}", (uint8_t *)&v14, 0x12u);
  }
  v6 = (char *)[a3 type];
  if ((unint64_t)(v6 - 1) < 2) {
    return +[CLDurianTask startUnauthorizedSoundTask];
  }
  if (!v6) {
    return +[CLDurianTask startUnauthorizedShortSoundTask];
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BC8);
  }
  id v8 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
  {
    id v9 = [[-[NSUUID description](-[CLDurianDevice uuid](self, "uuid"), "description") substringToIndex:8];
    unsigned int v10 = [a3 type];
    int v14 = 68289539;
    int v15 = 0;
    __int16 v16 = 2082;
    __int16 v17 = "";
    __int16 v18 = 2113;
    id v19 = v9;
    __int16 v20 = 1026;
    unsigned int v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian unrecognized sound sequence type\", \"item\":%{private, location:escape_only}@, \"soundSequenceType\":%{public}d}", (uint8_t *)&v14, 0x22u);
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331BC8);
    }
  }
  id v11 = qword_102419398;
  if (os_signpost_enabled((os_log_t)qword_102419398))
  {
    id v12 = [[-[NSUUID description](-[CLDurianDevice uuid](self, "uuid"), "description") substringToIndex:8];
    unsigned int v13 = [a3 type];
    int v14 = 68289539;
    int v15 = 0;
    __int16 v16 = 2082;
    __int16 v17 = "";
    __int16 v18 = 2113;
    id v19 = v12;
    __int16 v20 = 1026;
    unsigned int v21 = v13;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian unrecognized sound sequence type", "{\"msg%{public}.0s\":\"#durian unrecognized sound sequence type\", \"item\":%{private, location:escape_only}@, \"soundSequenceType\":%{public}d}", (uint8_t *)&v14, 0x22u);
  }
  return 0;
}

- (id)createStopPlayingSoundTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BC8);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #airtag creating stopsound task\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask stopSoundTask];
}

- (id)createInitRangingTaskWithMacAddress:(id)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BC8);
  }
  __int16 v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 68289026;
    int v11 = 0;
    *(_WORD *)id v12 = 2082;
    *(void *)&v12[2] = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #airtag creating InitRangingTask\"}", (uint8_t *)&v10, 0x12u);
  }
  if ((id)[(CLDurianDevice *)self ownership] == (id)2)
  {
    BYTE2(v10) = 8;
    LOWORD(v10) = 257;
    return +[CLDurianTask initRoseNonOwnerTaskWithParameters:](CLDurianTask, "initRoseNonOwnerTaskWithParameters:", +[NSData dataWithBytes:&v10 length:3]);
  }
  else if ([a3 length])
  {
    v7 = (char *)[a3 bytes];
    LOBYTE(v10) = 10;
    *(_WORD *)((char *)&v10 + 1) = *(_WORD *)v7;
    HIBYTE(v10) = v7[2];
    int v11 = *(_DWORD *)(v7 + 3);
    v12[0] = v7[7];
    *(_WORD *)&v12[1] = 1;
    return +[CLDurianTask initRoseTaskWithParameters:](CLDurianTask, "initRoseTaskWithParameters:", +[NSData dataWithBytes:&v10 length:11]);
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331BC8);
    }
    id v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      int v10 = 68289026;
      int v11 = 0;
      *(_WORD *)id v12 = 2082;
      *(void *)&v12[2] = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #airtag creating InitRangingTask, macAddress is nil\"}", (uint8_t *)&v10, 0x12u);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331BC8);
      }
    }
    id v9 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      int v10 = 68289026;
      int v11 = 0;
      *(_WORD *)id v12 = 2082;
      *(void *)&v12[2] = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #airtag creating InitRangingTask, macAddress is nil", "{\"msg%{public}.0s\":\"#durian #airtag creating InitRangingTask, macAddress is nil\"}", (uint8_t *)&v10, 0x12u);
    }
    return 0;
  }
}

- (id)createDeinitRangingTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BC8);
  }
  v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    __int16 v6 = 2082;
    v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #airtag creating DeinitRangingTask\"}", (uint8_t *)v5, 0x12u);
  }
  if ((id)[(CLDurianDevice *)self ownership] == (id)2) {
    return +[CLDurianTask deinitRangingNonOwnerTask];
  }
  else {
    return +[CLDurianTask stopRoseTaskWithParameters:0];
  }
}

- (id)createConfigureRangingTaskWithMacAddress:(id)a3 countryCode:(unsigned __int8)a4 uwbChannel:(unsigned __int8)a5 acqPreamble:(unsigned __int8)a6 trackingPreamble:(unsigned __int8)a7 interval:(unsigned __int16)a8
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BC8);
  }
  int v15 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 68289026;
    *(_DWORD *)v22 = 0;
    *(_WORD *)&v22[4] = 2082;
    *(void *)&v22[6] = "";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #airtag creating ConfigureRangingTask\"}", (uint8_t *)&v21, 0x12u);
  }
  if ([a3 length])
  {
    char v16 = a5 & 3 | (4 * (a6 & 3)) & 0xCF | (16 * (a7 & 3)) | 0x80;
    if ((id)[(CLDurianDevice *)self ownership] == (id)2)
    {
      __int16 v17 = [a3 bytes];
      LOBYTE(v21) = a4;
      BYTE1(v21) = v16;
      HIWORD(v21) = a8;
      *(_DWORD *)v22 = *v17;
      *(_DWORD *)&v22[4] = v17[1];
      return +[CLDurianTask configureRangingNonOwnerTaskWithPayload:&v21];
    }
    else
    {
      LOWORD(v21) = 0;
      BYTE2(v21) = a4;
      HIBYTE(v21) = v16;
      strcpy(v22, "D");
      v22[2] = 0;
      *(_WORD *)&v22[3] = a8;
      *(void *)&v22[5] = 0;
      v22[13] = 0;
      return +[CLDurianTask setRoseRangingParametersTaskWithParameters:](CLDurianTask, "setRoseRangingParametersTaskWithParameters:", +[NSData dataWithBytes:&v21 length:18]);
    }
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331BC8);
    }
    id v19 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      int v21 = 68289026;
      *(_DWORD *)v22 = 0;
      *(_WORD *)&v22[4] = 2082;
      *(void *)&v22[6] = "";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #airtag creating ConfigureRangingTask, macAddress is nil\"}", (uint8_t *)&v21, 0x12u);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331BC8);
      }
    }
    __int16 v20 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      int v21 = 68289026;
      *(_DWORD *)v22 = 0;
      *(_WORD *)&v22[4] = 2082;
      *(void *)&v22[6] = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #airtag creating ConfigureRangingTask, macAddress is nil", "{\"msg%{public}.0s\":\"#durian #airtag creating ConfigureRangingTask, macAddress is nil\"}", (uint8_t *)&v21, 0x12u);
    }
    return 0;
  }
}

- (id)createStartRangingTaskWithTargetEventCounter:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BC8);
  }
  __int16 v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289026;
    v7[1] = 0;
    __int16 v8 = 2082;
    id v9 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #airtag creating StartRangingTask\"}", (uint8_t *)v7, 0x12u);
  }
  if ((id)[(CLDurianDevice *)self ownership] == (id)2) {
    return +[CLDurianTask startRangingNonOwnerTaskWithTargetEventCounter:v3];
  }
  LOWORD(v7[0]) = v3;
  return +[CLDurianTask startRoseRangingTaskWithParameters:](CLDurianTask, "startRoseRangingTaskWithParameters:", +[NSData dataWithBytes:v7 length:2]);
}

- (id)createStopRangingTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BC8);
  }
  uint64_t v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    __int16 v6 = 2082;
    v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #airtag creating StopRangingTask\"}", (uint8_t *)v5, 0x12u);
  }
  if ((id)[(CLDurianDevice *)self ownership] == (id)2) {
    return +[CLDurianTask stopRangingNonOwnerTask];
  }
  else {
    return +[CLDurianTask stopRoseRangingTask];
  }
}

- (id)createGetMultiStatusTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BC8);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #airtag creating GetMultiStatusTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchMultiStatusTask];
}

- (id)createDumpLogsTaskOfType:(unint64_t)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BC8);
  }
  v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    __int16 v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #airtag creating DumpLogsTask\"}", (uint8_t *)v6, 0x12u);
  }
  switch(a3)
  {
    case 0uLL:
      id result = +[CLDurianTask dumpNordicLogsTask];
      break;
    case 1uLL:
      id result = +[CLDurianTask dumpNordicCrashesTask];
      break;
    case 2uLL:
      id result = +[CLDurianTask dumpRoseLogsTask];
      break;
    case 3uLL:
      id result = +[CLDurianTask dumpRoseCrashesTask];
      break;
    default:
      id result = 0;
      break;
  }
  return result;
}

- (id)createSetKeyRollTimeoutTaskWithInterval:(unsigned int)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BC8);
  }
  v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    __int16 v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #airtag creating SetKeyRollTimeoutTask\"}", (uint8_t *)v6, 0x12u);
  }
  return +[CLDurianTask setKeyRotationTimeoutTaskWithTimeout:1000 * a3];
}

- (id)createInduceCrashTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BC8);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #airtag creating InduceCrashTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask induceCrashTask];
}

- (id)createSetUnauthorizedPlaySoundRateLimitTask:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BC8);
  }
  v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    __int16 v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #airtag creating SetUnauthorizedPlaySoundRateLimitTask\"}", (uint8_t *)v6, 0x12u);
  }
  return +[CLDurianTask setUnauthorizedPlaySoundRateLimitTask:v3];
}

- (id)createSetAccelerometerSlopeModeTaskWithConfiguration:(id)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BC8);
  }
  v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    __int16 v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #airtag creating SetAccelerometerSlopeModeTask\"}", (uint8_t *)v6, 0x12u);
  }
  return +[CLDurianTask setAccelerometerSlopeModeConfigurationTaskWithConfiguration:a3];
}

- (id)createSetAccelerometerOrientationModeTaskWithConfiguration:(id)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BC8);
  }
  v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    __int16 v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #airtag creating SetAccelerometerOrientationModeTask\"}", (uint8_t *)v6, 0x12u);
  }
  return +[CLDurianTask setAccelerometerOrientationModeConfigurationTaskWithConfiguration:a3];
}

- (id)createFetchAccelerometerSlopeModeTaskWithConfiguration
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BC8);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #airtag creating FetchAccelerometerSlopeModeTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchAccelerometerSlopeModeConfigurationTask];
}

- (id)createFetchAccelerometerOrientationModeTaskWithConfiguration
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BC8);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #airtag creating FetchAccelerometerOrientationModeTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchAccelerometerOrientationModeConfigurationTask];
}

- (id)createFetchAccelerometerModeTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BC8);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #airtag creating FetchAccelerometerModeTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchAccelerometerModeTask];
}

- (id)createFetchFirmwareVersionTaskWithCrashLogs:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BC8);
  }
  v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    __int16 v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #airtag creating FetchFirmwareVersionTask\"}", (uint8_t *)v6, 0x12u);
  }
  return +[CLDurianTask fetchFirmwareVersionTaskWithCrashLogs:v3];
}

- (id)createFetchBatteryStatusTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BC8);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #airtag creating FetchBatteryStatusTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchBatteryStatusTask];
}

- (id)createSetBatteryStatusTaskWithStatus:(unint64_t)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BC8);
  }
  v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    __int16 v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #airtag creating SetBatteryStatusTaskWithStatus\"}", (uint8_t *)v6, 0x12u);
  }
  return +[CLDurianTask setBatteryStatusTaskWithBatteryStatus:a3];
}

- (id)createFetchUserStatsTaskWithPersistence:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BC8);
  }
  __int16 v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 68289026;
    v9[1] = 0;
    __int16 v10 = 2082;
    int v11 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #airtag creating FetchUserStatsTask\"}", (uint8_t *)v9, 0x12u);
  }
  unint64_t v6 = [(CLDurianDevice *)self buildNumber];
  if (v6 <= +[CLDurianVersionNumberUtilities getNumberFromString:](CLDurianVersionNumberUtilities, "getNumberFromString:", @"2.0.36"))return +[CLDurianTask fetchUserStatsTaskWithPersistence_v0:v3]; {
  unint64_t v7 = [(CLDurianDevice *)self buildNumber];
  }
  if (v7 <= +[CLDurianVersionNumberUtilities getNumberFromString:](CLDurianVersionNumberUtilities, "getNumberFromString:", @"2.0.61"))return +[CLDurianTask fetchUserStatsTaskWithPersistence_v1:v3]; {
  else
  }
    return +[CLDurianTask fetchUserStatsTaskWithPersistence_v2:v3];
}

- (id)createSetMaxConnectionsTaskWithCount:(int)a3
{
  unsigned __int8 v3 = a3;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BC8);
  }
  v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    __int16 v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #airtag creating SetMaxConnectionsTask\"}", (uint8_t *)v6, 0x12u);
  }
  return +[CLDurianTask setMaxConnectionsTaskWithCount:v3];
}

- (id)createUnpairDeviceTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BC8);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    unint64_t v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #airtag creating UnpairDeviceTask \"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask unpairTask];
}

- (id)createSetObfuscatedIdentifierTaskWithIdentifier:(id)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BC8);
  }
  v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    __int16 v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #airtag creating SetObfuscatedIdentifierTask\"}", (uint8_t *)v6, 0x12u);
  }
  return +[CLDurianTask setObfuscatedIdentifierTaskWithIdentifier:a3];
}

- (id)createSetNearOwnerTimeoutTaskInSeconds:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BC8);
  }
  v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    __int16 v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #airtag creating SetNearOwnerTimeoutTask\"}", (uint8_t *)v6, 0x12u);
  }
  return +[CLDurianTask setNearOwnerTimeoutTaskWithTimeout:v3];
}

- (id)createSetTagTypeTaskWithType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BC8);
  }
  v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    __int16 v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #airtag creating SetTagTypeTask\"}", (uint8_t *)v6, 0x12u);
  }
  return +[CLDurianTask setTagTypeTaskWithType:v3];
}

- (id)createSetWildModeTaskWithConfiguration:(id)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BC8);
  }
  v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    __int16 v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #airtag creating SetWildModeTask\"}", (uint8_t *)v6, 0x12u);
  }
  return +[CLDurianTask setWildModeConfigurationTaskWithConfiguration:a3];
}

- (id)createRollWildKeyTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BC8);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    unint64_t v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #airtag creating RollWildKeyTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask rollWildKeyTask];
}

- (id)createSetPersistentConnectionTaskWithState:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BC8);
  }
  v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    __int16 v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #airtag creating SetPersistentConnectionTaskWithState \"}", (uint8_t *)v6, 0x12u);
  }
  if (v3) {
    return +[CLDurianTask leashTask];
  }
  else {
    return +[CLDurianTask leashDisableTask];
  }
}

- (unsigned)getRangingStatusForOpcode:(unsigned __int16)a3 data:(char *)a4
{
  int v5 = a3;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BC8);
  }
  __int16 v7 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 68289026;
    int v14 = 0;
    __int16 v15 = 2082;
    char v16 = "";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #airtag parsing ranging-status\"}", (uint8_t *)&v13, 0x12u);
  }
  if (v5 > 20)
  {
    switch(v5)
    {
      case 2049:
      case 2050:
      case 2051:
      case 2053:
        unsigned int result = *(_DWORD *)(a4 + 2);
        break;
      case 2052:
      case 2054:
      case 2055:
      case 2056:
      case 2057:
        goto LABEL_16;
      case 2058:
        return *(_DWORD *)(a4 + 1);
      default:
        if (v5 == 21 || v5 == 34) {
          return *(_DWORD *)(a4 + 1);
        }
        goto LABEL_16;
    }
  }
  else if (v5 == 1 || v5 == 3 || v5 == 6)
  {
    return *(_DWORD *)(a4 + 1);
  }
  else
  {
LABEL_16:
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331BC8);
    }
    id v9 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_FAULT))
    {
      id v10 = [[-[NSUUID description](-[CLDurianDevice uuid](self, "uuid"), "description") substringToIndex:8];
      int v13 = 68289539;
      int v14 = 0;
      __int16 v15 = 2082;
      char v16 = "";
      __int16 v17 = 2113;
      id v18 = v10;
      __int16 v19 = 1026;
      int v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian unknown opcode in ranging completion for airtag-device\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v13, 0x22u);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331BC8);
      }
    }
    int v11 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      id v12 = [[-[NSUUID description](-[CLDurianDevice uuid](self, "uuid"), "description") substringToIndex:8];
      int v13 = 68289539;
      int v14 = 0;
      __int16 v15 = 2082;
      char v16 = "";
      __int16 v17 = 2113;
      id v18 = v12;
      __int16 v19 = 1026;
      int v20 = v5;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian unknown opcode in ranging completion for airtag-device", "{\"msg%{public}.0s\":\"#durian unknown opcode in ranging completion for airtag-device\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v13, 0x22u);
    }
    return 0x7FFFFFFF;
  }
  return result;
}

- (unsigned)getRangeEndReasonForOpcode:(unsigned __int16)a3 data:(char *)a4
{
  int v5 = a3;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BC8);
  }
  __int16 v7 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 68289026;
    int v14 = 0;
    __int16 v15 = 2082;
    char v16 = "";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #airtag parsing ranging-end-reason\"}", (uint8_t *)&v13, 0x12u);
  }
  if (v5 == 2051) {
    return a4[6];
  }
  if (v5 == 3) {
    return a4[5];
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331BC8);
  }
  id v9 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_FAULT))
  {
    id v10 = [[-[NSUUID description](-[CLDurianDevice uuid](self, "uuid"), "description") substringToIndex:8];
    int v13 = 68289539;
    int v14 = 0;
    __int16 v15 = 2082;
    char v16 = "";
    __int16 v17 = 2113;
    id v18 = v10;
    __int16 v19 = 1026;
    int v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian unknown opcode in ranging start completion\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v13, 0x22u);
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331BC8);
    }
  }
  int v11 = qword_102419398;
  if (os_signpost_enabled((os_log_t)qword_102419398))
  {
    id v12 = [[-[NSUUID description](-[CLDurianDevice uuid](self, "uuid")) substringToIndex:8];
    int v13 = 68289539;
    int v14 = 0;
    __int16 v15 = 2082;
    char v16 = "";
    __int16 v17 = 2113;
    id v18 = v12;
    __int16 v19 = 1026;
    int v20 = v5;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian unknown opcode in ranging start completion", "{\"msg%{public}.0s\":\"#durian unknown opcode in ranging start completion\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v13, 0x22u);
  }
  return 127;
}

- (unint64_t)getMultiStatusFromData:(char *)a3
{
  return *a3;
}

@end