@interface CLHawkeyeDevice
- (id)createConfigureRangingTaskWithMacAddress:(id)a3 countryCode:(unsigned __int8)a4 uwbChannel:(unsigned __int8)a5 acqPreamble:(unsigned __int8)a6 trackingPreamble:(unsigned __int8)a7 interval:(unsigned __int16)a8;
- (id)createDeinitRangingTask;
- (id)createDumpLogsTaskOfType:(unint64_t)a3;
- (id)createFetchAISAccessoryCapabilitiesTask;
- (id)createFetchAISAccessoryCategoryTask;
- (id)createFetchAISBatteryTypeTask;
- (id)createFetchAISFindMyVersionTask;
- (id)createFetchAISFirmwareVersionTask;
- (id)createFetchAISManufacturerNameTask;
- (id)createFetchAISModelColorCodeTask;
- (id)createFetchAISModelNameTask;
- (id)createFetchAISProductDataTask;
- (id)createFetchAISSerialNumberTask;
- (id)createFetchBatteryStatusTask;
- (id)createFetchCurrentPrimaryKeyTask;
- (id)createFetchFirmwareVersionTaskWithCrashLogs:(BOOL)a3;
- (id)createFetchTxPowerTaskAsOwner:(BOOL)a3;
- (id)createFetchiCloudIdentifierTask;
- (id)createGetGroupStatusTask;
- (id)createGetMultiStatusTask;
- (id)createInduceCrashTask;
- (id)createInitRangingTaskWithMacAddress:(id)a3;
- (id)createPlaySoundTaskWithSequence:(id)a3;
- (id)createPlayUnauthorizedSoundTaskWithSequence:(id)a3;
- (id)createRollWildKeyTask;
- (id)createSetHawkeyeUTMotionConfigTaskWithSeparatedUTTimeoutSeconds:(unsigned int)a3 separatedUTBackoffTimeoutSeconds:(unsigned int)a4;
- (id)createSetKeyRollTimeoutTaskWithInterval:(unsigned int)a3;
- (id)createSetMaxConnectionsTaskWithCount:(int)a3;
- (id)createSetNearOwnerTimeoutTaskInSeconds:(unsigned __int16)a3;
- (id)createSetPersistentConnectionTaskWithState:(BOOL)a3;
- (id)createSetTestModeTaskWithMode:(int)a3;
- (id)createStartAggressiveAdvertisingTaskWithTimeout:(unsigned int)a3;
- (id)createStartRangingTaskWithTargetEventCounter:(unsigned __int16)a3;
- (id)createStartUnauthorizedAggressiveAdvertisingTask;
- (id)createStopAggressiveAdvertisingTask;
- (id)createStopPlayingSoundTask;
- (id)createStopPlayingUnauthorizedSoundTask;
- (id)createStopRangingTask;
- (id)createUnpairDeviceTask;
- (id)unpair;
- (unint64_t)getMultiStatusFromData:(char *)a3;
- (unsigned)getRangeEndReasonForOpcode:(unsigned __int16)a3 data:(char *)a4;
- (unsigned)getRangingStatusForOpcode:(unsigned __int16)a3 data:(char *)a4;
@end

@implementation CLHawkeyeDevice

- (id)createPlaySoundTaskWithSequence:(id)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 68289026;
    int v23 = 0;
    __int16 v24 = 2082;
    v25 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating PlaySoundTask\"}", (uint8_t *)&v22, 0x12u);
  }
  id v6 = [a3 type];
  if (!v6) {
    return +[CLDurianTask startShortSoundHawkeyeTask];
  }
  if (v6 == (id)1) {
    return +[CLDurianTask startSoundHawkeyeTask];
  }
  if (v6 == (id)2)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332810);
    }
    v7 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      id v8 = [[-[NSUUID description](-[CLDurianDevice uuid](self, "uuid"), "description") substringToIndex:8];
      int v22 = 68289283;
      int v23 = 0;
      __int16 v24 = 2082;
      v25 = "";
      __int16 v26 = 2113;
      id v27 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian custom sound sequence type not supported for #hawkeye\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v22, 0x1Cu);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332810);
      }
    }
    uint64_t v9 = qword_102419398;
    if (!os_signpost_enabled((os_log_t)qword_102419398)) {
      return 0;
    }
    id v10 = [[-[NSUUID description](-[CLDurianDevice uuid](self, "uuid"), "description") substringToIndex:8];
    int v22 = 68289283;
    int v23 = 0;
    __int16 v24 = 2082;
    v25 = "";
    __int16 v26 = 2113;
    id v27 = v10;
    v11 = "#durian custom sound sequence type not supported for #hawkeye";
    v12 = "{\"msg%{public}.0s\":\"#durian custom sound sequence type not supported for #hawkeye\", \"item\":%{private, lo"
          "cation:escape_only}@}";
    v13 = v9;
    uint32_t v14 = 28;
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332810);
    }
    v16 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      id v17 = [[-[NSUUID description](-[CLDurianDevice uuid](self, "uuid"), "description") substringToIndex:8];
      unsigned int v18 = [a3 type];
      int v22 = 68289539;
      int v23 = 0;
      __int16 v24 = 2082;
      v25 = "";
      __int16 v26 = 2113;
      id v27 = v17;
      __int16 v28 = 1026;
      unsigned int v29 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian unrecognized sound sequence type\", \"item\":%{private, location:escape_only}@, \"soundSequenceType\":%{public}d}", (uint8_t *)&v22, 0x22u);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332810);
      }
    }
    uint64_t v19 = qword_102419398;
    if (!os_signpost_enabled((os_log_t)qword_102419398)) {
      return 0;
    }
    id v20 = [[-[NSUUID description](-[CLDurianDevice uuid](self, "uuid"), "description") substringToIndex:8];
    unsigned int v21 = [a3 type];
    int v22 = 68289539;
    int v23 = 0;
    __int16 v24 = 2082;
    v25 = "";
    __int16 v26 = 2113;
    id v27 = v20;
    __int16 v28 = 1026;
    unsigned int v29 = v21;
    v11 = "#durian unrecognized sound sequence type";
    v12 = "{\"msg%{public}.0s\":\"#durian unrecognized sound sequence type\", \"item\":%{private, location:escape_only}@,"
          " \"soundSequenceType\":%{public}d}";
    v13 = v19;
    uint32_t v14 = 34;
  }
  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v11, v12, (uint8_t *)&v22, v14);
  return 0;
}

- (id)createPlayUnauthorizedSoundTaskWithSequence:(id)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 68289026;
    int v23 = 0;
    __int16 v24 = 2082;
    v25 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating PlayUnauthorizedSoundTask\"}", (uint8_t *)&v22, 0x12u);
  }
  id v6 = [a3 type];
  if (!v6) {
    return +[CLDurianTask startNonOwnerShortSoundHawkeyeTask];
  }
  if (v6 == (id)1) {
    return +[CLDurianTask startNonOwnerSoundHawkeyeTask];
  }
  if (v6 == (id)2)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332810);
    }
    v7 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      id v8 = [[-[NSUUID description](-[CLDurianDevice uuid](self, "uuid"), "description") substringToIndex:8];
      int v22 = 68289283;
      int v23 = 0;
      __int16 v24 = 2082;
      v25 = "";
      __int16 v26 = 2113;
      id v27 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian custom sound sequence type not supported for #hawkeye\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v22, 0x1Cu);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332810);
      }
    }
    uint64_t v9 = qword_102419398;
    if (!os_signpost_enabled((os_log_t)qword_102419398)) {
      return 0;
    }
    id v10 = [[-[NSUUID description](-[CLDurianDevice uuid](self, "uuid"), "description") substringToIndex:8];
    int v22 = 68289283;
    int v23 = 0;
    __int16 v24 = 2082;
    v25 = "";
    __int16 v26 = 2113;
    id v27 = v10;
    v11 = "#durian custom sound sequence type not supported for #hawkeye";
    v12 = "{\"msg%{public}.0s\":\"#durian custom sound sequence type not supported for #hawkeye\", \"item\":%{private, lo"
          "cation:escape_only}@}";
    v13 = v9;
    uint32_t v14 = 28;
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332810);
    }
    v16 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      id v17 = [[-[NSUUID description](-[CLDurianDevice uuid](self, "uuid"), "description") substringToIndex:8];
      unsigned int v18 = [a3 type];
      int v22 = 68289539;
      int v23 = 0;
      __int16 v24 = 2082;
      v25 = "";
      __int16 v26 = 2113;
      id v27 = v17;
      __int16 v28 = 1026;
      unsigned int v29 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian unrecognized sound sequence type\", \"item\":%{private, location:escape_only}@, \"soundSequenceType\":%{public}d}", (uint8_t *)&v22, 0x22u);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332810);
      }
    }
    uint64_t v19 = qword_102419398;
    if (!os_signpost_enabled((os_log_t)qword_102419398)) {
      return 0;
    }
    id v20 = [[-[NSUUID description](-[CLDurianDevice uuid](self, "uuid"), "description") substringToIndex:8];
    unsigned int v21 = [a3 type];
    int v22 = 68289539;
    int v23 = 0;
    __int16 v24 = 2082;
    v25 = "";
    __int16 v26 = 2113;
    id v27 = v20;
    __int16 v28 = 1026;
    unsigned int v29 = v21;
    v11 = "#durian unrecognized sound sequence type";
    v12 = "{\"msg%{public}.0s\":\"#durian unrecognized sound sequence type\", \"item\":%{private, location:escape_only}@,"
          " \"soundSequenceType\":%{public}d}";
    v13 = v19;
    uint32_t v14 = 34;
  }
  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v11, v12, (uint8_t *)&v22, v14);
  return 0;
}

- (id)createStopPlayingSoundTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    id v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating StopPlayingSoundTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask stopSoundHawkeyeTask];
}

- (id)createStopPlayingUnauthorizedSoundTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    id v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating StopPlayingUnauthorizedSoundTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask stopNonOwnerSoundHawkeyeTask];
}

- (id)createInitRangingTaskWithMacAddress:(id)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    __int16 v6 = 2082;
    v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating InitRangingTask\"}", (uint8_t *)v5, 0x12u);
  }
  return +[CLDurianTask initRangingHawkeyeTask];
}

- (id)createDeinitRangingTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating DeinitRangingTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask deinitRangingHawkeyeTask];
}

- (id)createConfigureRangingTaskWithMacAddress:(id)a3 countryCode:(unsigned __int8)a4 uwbChannel:(unsigned __int8)a5 acqPreamble:(unsigned __int8)a6 trackingPreamble:(unsigned __int8)a7 interval:(unsigned __int16)a8
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  v15 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 68289026;
    int v30 = 0;
    __int16 v31 = 2082;
    v32 = "";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating ConfigureRangingTask\"}", (uint8_t *)&v29, 0x12u);
  }
  char v16 = a5 & 3 | (4 * (a6 & 3)) & 0xCF | (16 * (a7 & 3)) | 0x80;
  id v17 = (char *)[a3 bytes];
  v51[0] = a4;
  v51[1] = v16;
  unsigned __int16 v52 = a8;
  char v53 = *v17;
  unsigned __int8 v54 = v17[1];
  unsigned __int8 v55 = v17[2];
  unsigned __int8 v56 = v17[3];
  unsigned __int8 v57 = v17[4];
  unsigned __int8 v58 = v17[5];
  unsigned __int8 v59 = v17[6];
  unsigned __int8 v60 = v17[7];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  unsigned int v18 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = [[-[NSUUID description](-[CLDurianDevice uuid](self, "uuid")) substringToIndex:8];
    int v20 = *v17;
    int v21 = v17[1];
    int v22 = v17[2];
    int v23 = v17[3];
    int v24 = v17[4];
    int v25 = v17[5];
    int v26 = v17[6];
    int v27 = v17[7];
    int v29 = 68291331;
    int v30 = 0;
    __int16 v31 = 2082;
    v32 = "";
    __int16 v33 = 2113;
    id v34 = v19;
    __int16 v35 = 1026;
    int v36 = v20;
    __int16 v37 = 1026;
    int v38 = v21;
    __int16 v39 = 1026;
    int v40 = v22;
    __int16 v41 = 1026;
    int v42 = v23;
    __int16 v43 = 1026;
    int v44 = v24;
    __int16 v45 = 1026;
    int v46 = v25;
    __int16 v47 = 1026;
    int v48 = v26;
    __int16 v49 = 1026;
    int v50 = v27;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian macaddress fix2\", \"item\":%{private, location:escape_only}@, \"0\":%{public}d, \"1\":%{public}d, \"2\":%{public}d, \"3\":%{public}d, \"4\":%{public}d, \"5\":%{public}d, \"6\":%{public}d, \"7\":%{public}d}", (uint8_t *)&v29, 0x4Cu);
  }
  return +[CLDurianTask configureRangingHawkeyeTaskWithPayload:v51];
}

- (id)createStartRangingTaskWithTargetEventCounter:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    id v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating StartRangingTask\"}", (uint8_t *)v6, 0x12u);
  }
  return +[CLDurianTask startRangingHawkeyeTaskWithTargetEventCounter:v3];
}

- (id)createStopRangingTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating StopRangingTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask stopRangingHawkeyeTask];
}

- (id)createGetMultiStatusTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating GetMultiStatusTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask getMultiStatusHawkeyeTask];
}

- (id)createGetGroupStatusTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating GetGroupStatusTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask getGroupStatusHawkeyeTask];
}

- (id)createDumpLogsTaskOfType:(unint64_t)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  __int16 v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 68289026;
    int v10 = 0;
    __int16 v11 = 2082;
    v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating DumpLogsTask\"}", (uint8_t *)&v9, 0x12u);
  }
  if (a3 != 4) {
    return 0;
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  __int16 v6 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [[-[NSUUID description](-[CLDurianDevice uuid](self, "uuid"), "description") substringToIndex:8];
    int v9 = 68289283;
    int v10 = 0;
    __int16 v11 = 2082;
    v12 = "";
    __int16 v13 = 2113;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye dumpLogs\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v9, 0x1Cu);
  }
  return +[CLDurianTask retrieveLogsHawkeyeTask];
}

- (id)createSetKeyRollTimeoutTaskWithInterval:(unsigned int)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    id v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating SetKeyRollTimeoutTask\"}", (uint8_t *)v6, 0x12u);
  }
  return +[CLDurianTask setKeyRotationTimeoutHawkeyeTaskWithTimeout:1000 * a3];
}

- (id)createInduceCrashTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating InduceCrashTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask resetHawkeyeTask];
}

- (id)createStartUnauthorizedAggressiveAdvertisingTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating StartUnauthorizedAggressiveAdvertisingTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask startNonOwnerAggressiveAdvertisingTask];
}

- (id)createSetTestModeTaskWithMode:(int)a3
{
  unsigned __int8 v3 = a3;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    id v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating SetTestModeTask\"}", (uint8_t *)v6, 0x12u);
  }
  return +[CLDurianTask testModeTask:v3];
}

- (id)createSetHawkeyeUTMotionConfigTaskWithSeparatedUTTimeoutSeconds:(unsigned int)a3 separatedUTBackoffTimeoutSeconds:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  __int16 v6 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289026;
    v8[1] = 0;
    __int16 v9 = 2082;
    int v10 = "";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating SetHawkeyeUTMotionConfigTask\"}", (uint8_t *)v8, 0x12u);
  }
  return +[CLDurianTask setHawkeyeUTMotionConfigWithSeparatedUTTimeoutSeconds:v5 separatedUTBackoffTimeoutSeconds:v4];
}

- (id)createFetchAISProductDataTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating FetchAISProductDataTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchProductDataGATTTask];
}

- (id)createUnpairDeviceTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating UnpairDeviceTask \"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask unpairHawkeyeTask];
}

- (id)createFetchAISManufacturerNameTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating FetchAISManufacturerNameTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchManufacturerNameGATTTask];
}

- (id)createFetchAISModelNameTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating FetchAISModelNameTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchModelNameGATTTask];
}

- (id)createFetchAISModelColorCodeTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating FetchAISModelColorCodeTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchModelColorCodeGATTTask];
}

- (id)createFetchAISAccessoryCategoryTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating FetchAISAccessoryCategoryTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchAccessoryCategoryGATTTask];
}

- (id)createFetchAISAccessoryCapabilitiesTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating FetchAISAccessoryCapabilitiesTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchAccessoryCapabilitiesGATTTask];
}

- (id)createFetchAISFirmwareVersionTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating FetchAISFirmwareVersionTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchFirmwareVersionGATTTask];
}

- (id)createFetchAISFindMyVersionTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating FetchAISFindMyVersionTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchFindMyVersionGATTTask];
}

- (id)createFetchAISSerialNumberTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating FetchSerialNumberTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask getSerialNumberTask];
}

- (id)createFetchCurrentPrimaryKeyTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating FetchCurrentPrimaryKeyTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask getCurrentPrimaryKeyTask];
}

- (id)createFetchiCloudIdentifierTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating FetchiCloudIdentifierTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask getiCloudIdentifierTask];
}

- (id)createFetchAISBatteryTypeTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating FetchAISBatteryTypeTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchBatteryTypeGATTTask];
}

- (id)createFetchFirmwareVersionTaskWithCrashLogs:(BOOL)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  unsigned __int8 v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    __int16 v6 = 2082;
    __int16 v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating FetchFirmwareVersionTask\"}", (uint8_t *)v5, 0x12u);
  }
  return +[CLDurianTask fetchFirmwareVersionGATTTask];
}

- (id)createFetchBatteryStatusTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating FetchBatteryStatusTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchBatteryLevelGATTTask];
}

- (id)createSetMaxConnectionsTaskWithCount:(int)a3
{
  unsigned __int8 v3 = a3;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  uint64_t v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    id v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating SetMaxConnectionsTask\"}", (uint8_t *)v6, 0x12u);
  }
  return +[CLDurianTask setMaxConnectionsHawkeyeTaskWithCount:v3];
}

- (id)unpair
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating unpairTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask unpairHawkeyeTask];
}

- (id)createSetNearOwnerTimeoutTaskInSeconds:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  uint64_t v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    id v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating SetNearOwnerTimeoutTask\"}", (uint8_t *)v6, 0x12u);
  }
  return +[CLDurianTask setNearbyTimeoutHawkeyeTaskWithTimeout:v3 asHele:0];
}

- (id)createRollWildKeyTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating RollWildKeyTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask latchSeparatedKeyHawkeyeTask];
}

- (id)createFetchTxPowerTaskAsOwner:(BOOL)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  uint64_t v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    __int16 v6 = 2082;
    __int16 v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating FetchTxPowerTask\"}", (uint8_t *)v5, 0x12u);
  }
  return +[CLDurianTask fetchTxPowerGATTTask];
}

- (id)createStartAggressiveAdvertisingTaskWithTimeout:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  uint64_t v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    id v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating StartAggressiveAdvertisingTask\"}", (uint8_t *)v6, 0x12u);
  }
  return +[CLDurianTask startAggressiveAdvertisingTaskWithTimeout:v3];
}

- (id)createStopAggressiveAdvertisingTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating StopAggressiveAdvertisingTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask stopAggressiveAdvertisingTask];
}

- (id)createSetPersistentConnectionTaskWithState:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  uint64_t v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    id v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating SetPersistentConnectionTask\"}", (uint8_t *)v6, 0x12u);
  }
  return +[CLDurianTask enablePersistentConnectionsHawkeyeTask:v3];
}

- (unsigned)getRangingStatusForOpcode:(unsigned __int16)a3 data:(char *)a4
{
  int v5 = a3;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  __int16 v7 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 68289026;
    int v14 = 0;
    __int16 v15 = 2082;
    char v16 = "";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye parsing ranging-status\"}", (uint8_t *)&v13, 0x12u);
  }
  if (v5 <= 20)
  {
    if (v5 != 1 && v5 != 3 && v5 != 6) {
      goto LABEL_17;
    }
    return *(_DWORD *)(a4 + 2);
  }
  if (v5 > 1801)
  {
    if (v5 != 1802 && v5 != 2058) {
      goto LABEL_17;
    }
    return *(_DWORD *)(a4 + 2);
  }
  if (v5 == 21 || v5 == 34) {
    return *(_DWORD *)(a4 + 2);
  }
LABEL_17:
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  __int16 v9 = qword_102419398;
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
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian unknown opcode in ranging completion for hawkeye-device\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v13, 0x22u);
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332810);
    }
  }
  __int16 v11 = qword_102419398;
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
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian unknown opcode in ranging completion for hawkeye-device", "{\"msg%{public}.0s\":\"#durian unknown opcode in ranging completion for hawkeye-device\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v13, 0x22u);
  }
  return 0x7FFFFFFF;
}

- (unsigned)getRangeEndReasonForOpcode:(unsigned __int16)a3 data:(char *)a4
{
  int v5 = a3;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  __int16 v7 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 68289026;
    int v14 = 0;
    __int16 v15 = 2082;
    char v16 = "";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye parsing ranging-end-reason\"}", (uint8_t *)&v13, 0x12u);
  }
  if (v5 == 2051 || v5 == 3) {
    return a4[6];
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  __int16 v9 = qword_102419398;
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
      dispatch_once(&qword_102419390, &stru_102332810);
    }
  }
  __int16 v11 = qword_102419398;
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
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian unknown opcode in ranging start completion", "{\"msg%{public}.0s\":\"#durian unknown opcode in ranging start completion\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v13, 0x22u);
  }
  return 127;
}

- (unint64_t)getMultiStatusFromData:(char *)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332810);
  }
  uint64_t v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    id v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye parsing multi-status \"}", (uint8_t *)v6, 0x12u);
  }
  return *(int *)(a3 + 2);
}

@end