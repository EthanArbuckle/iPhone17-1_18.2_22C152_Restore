@interface CLPoshDevice
- (id)createFetchAISAccessoryCapabilitiesTask;
- (id)createFetchAISAccessoryCategoryTask;
- (id)createFetchAISBatteryLevelTask;
- (id)createFetchAISBatteryTypeTask;
- (id)createFetchAISFirmwareVersionTask;
- (id)createFetchAISManufacturerNameTask;
- (id)createFetchAISModelNameTask;
- (id)createFetchAISNetworkIdTask;
- (id)createFetchAISProductDataTask;
- (id)createFetchAISProtocolImplementationTask;
- (id)createFetchAISSerialNumberTask;
- (id)createFetchTxPowerTaskAsOwner:(BOOL)a3;
- (id)createPlayUnauthorizedSoundTask;
- (id)createPlayUnauthorizedSoundTaskWithSequence:(id)a3;
- (id)createStartUnauthorizedAggressiveAdvertisingTask;
- (id)createStopPlayingUnauthorizedSoundTask;
@end

@implementation CLPoshDevice

- (id)createPlayUnauthorizedSoundTaskWithSequence:(id)a3
{
  unsigned int v5 = +[CLDurianSettings forcePoshAirPods];
  v6 = (char *)[a3 type];
  if ((unint64_t)(v6 - 1) < 2)
  {
    return [(CLPoshDevice *)self createPlayUnauthorizedSoundTask];
  }
  if (v6)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332830);
    }
    v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      int v15 = 68289539;
      int v16 = 0;
      __int16 v17 = 2082;
      v18 = "";
      __int16 v19 = 2113;
      id v20 = [[-[NSUUID description](-[CLDurianDevice uuid](self, "uuid"), "description") substringToIndex:8];
      __int16 v21 = 1026;
      unsigned int v22 = [a3 type];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian unrecognized sound sequence type\", \"item\":%{private, location:escape_only}@, \"soundSequenceType\":%{public}d}", (uint8_t *)&v15, 0x22u);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332830);
      }
    }
    v9 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      id v10 = [[-[NSUUID description](-[CLDurianDevice uuid](self, "uuid")) substringToIndex:8];
      unsigned int v11 = [a3 type];
      int v15 = 68289539;
      int v16 = 0;
      __int16 v17 = 2082;
      v18 = "";
      __int16 v19 = 2113;
      id v20 = v10;
      __int16 v21 = 1026;
      unsigned int v22 = v11;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian unrecognized sound sequence type", "{\"msg%{public}.0s\":\"#durian unrecognized sound sequence type\", \"item\":%{private, location:escape_only}@, \"soundSequenceType\":%{public}d}", (uint8_t *)&v15, 0x22u);
    }
    return 0;
  }
  if ((_os_feature_enabled_impl() & v5) != 1)
  {
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332830);
      }
      v12 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 68289026;
        int v16 = 0;
        __int16 v17 = 2082;
        v18 = "";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh not creating ut playsound task since SmilingWheel FF is not enabled\"}", (uint8_t *)&v15, 0x12u);
      }
    }
    if ((v5 & 1) == 0)
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332830);
      }
      v13 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 68289026;
        int v16 = 0;
        __int16 v17 = 2082;
        v18 = "";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh not creating ut playsound task since Posh AirPods defaults write is not enabled\"}", (uint8_t *)&v15, 0x12u);
      }
    }
    return 0;
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332830);
  }
  v7 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 68289026;
    int v16 = 0;
    __int16 v17 = 2082;
    v18 = "";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh creating #ut playsound task\"}", (uint8_t *)&v15, 0x12u);
  }
  return +[CLDurianTask startNonOwnerShortSoundPoshTask];
}

- (id)createPlayUnauthorizedSoundTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332830);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut playSound\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask startNonOwnerSoundPoshTask];
}

- (id)createStopPlayingUnauthorizedSoundTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332830);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut stopSound\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask stopNonOwnerSoundPoshTask];
}

- (id)createFetchAISSerialNumberTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332830);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getSerialNumber\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerSerialNumberPoshTask];
}

- (id)createFetchAISProductDataTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332830);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getProductData\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerProductDataPoshTask];
}

- (id)createFetchAISManufacturerNameTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332830);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getManufacturerName\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerManufacturerNamePoshTask];
}

- (id)createFetchAISModelNameTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332830);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getModelName\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerModelNamePoshTask];
}

- (id)createFetchAISAccessoryCategoryTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332830);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getAccessoryCategory\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerAccessoryCategoryPoshTask];
}

- (id)createFetchAISProtocolImplementationTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332830);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getProtocolImplementation\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerProtocolImplementationPoshTask];
}

- (id)createFetchAISAccessoryCapabilitiesTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332830);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getAccessoryCapabilities\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerAccessoryCapabilitiesPoshTask];
}

- (id)createFetchAISNetworkIdTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332830);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getNetworkId\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerNetworkIdPoshTask];
}

- (id)createFetchAISFirmwareVersionTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332830);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getFirmwareVersion\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerFirmwareVersionPoshTask];
}

- (id)createFetchAISBatteryTypeTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332830);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getBatteryType\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerBatteryTypePoshTask];
}

- (id)createFetchAISBatteryLevelTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332830);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getBatteryLevel\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerBatteryLevelPoshTask];
}

- (id)createStartUnauthorizedAggressiveAdvertisingTask
{
  unsigned int v2 = +[CLDurianSettings forcePoshAirPods];
  if (_os_feature_enabled_impl()) {
    BOOL v3 = v2 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332830);
      }
      v4 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 68289026;
        int v9 = 0;
        __int16 v10 = 2082;
        unsigned int v11 = "";
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh not creating StartUnauthorizedAggressiveAdvertisingTask since SmilingWheel FF is not enabled\"}", (uint8_t *)&v8, 0x12u);
      }
    }
    if ((v2 & 1) == 0)
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332830);
      }
      __int16 v5 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 68289026;
        int v9 = 0;
        __int16 v10 = 2082;
        unsigned int v11 = "";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh not creating StartUnauthorizedAggressiveAdvertisingTask since Posh AirPods defaults write is not enabled\"}", (uint8_t *)&v8, 0x12u);
      }
    }
    return 0;
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332830);
    }
    v7 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 68289026;
      int v9 = 0;
      __int16 v10 = 2082;
      unsigned int v11 = "";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh creating StartUnauthorizedAggressiveAdvertisingTask\"}", (uint8_t *)&v8, 0x12u);
    }
    return +[CLDurianTask startNonOwnerPoshAggressiveAdvertisingTask];
  }
}

- (id)createFetchTxPowerTaskAsOwner:(BOOL)a3
{
  unsigned int v3 = +[CLDurianSettings forcePoshAirPods];
  if (_os_feature_enabled_impl()) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332830);
      }
      __int16 v5 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 68289026;
        int v10 = 0;
        __int16 v11 = 2082;
        v12 = "";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh not creating FetchTxPowerTask since SmilingWheel FF is not enabled\"}", (uint8_t *)&v9, 0x12u);
      }
    }
    if ((v3 & 1) == 0)
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102332830);
      }
      v6 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 68289026;
        int v10 = 0;
        __int16 v11 = 2082;
        v12 = "";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh not creating FetchTxPowerTask since Posh AirPods defaults write is not enabled\"}", (uint8_t *)&v9, 0x12u);
      }
    }
    return 0;
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102332830);
    }
    int v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 68289026;
      int v10 = 0;
      __int16 v11 = 2082;
      v12 = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh creating FetchTxPowerTask\"}", (uint8_t *)&v9, 0x12u);
    }
    return +[CLDurianTask fetchTxPowerGATTTask];
  }
}

@end