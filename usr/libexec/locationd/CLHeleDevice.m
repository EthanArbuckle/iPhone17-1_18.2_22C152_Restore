@interface CLHeleDevice
- (id)createFetchAISAccessoryCapabilitiesTask;
- (id)createFetchAISAccessoryCategoryTask;
- (id)createFetchAISBatteryTypeTask;
- (id)createFetchAISFindMyVersionTask;
- (id)createFetchAISFirmwareVersionTask;
- (id)createFetchAISManufacturerNameTask;
- (id)createFetchAISModelNameTask;
- (id)createFetchAISProductDataTask;
- (id)createFetchTxPowerTaskAsOwner:(BOOL)a3;
- (id)createSetNearOwnerTimeoutTaskInSeconds:(unsigned __int16)a3;
@end

@implementation CLHeleDevice

- (id)createSetNearOwnerTimeoutTaskInSeconds:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332020);
  }
  v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hele creating SetNearOwnerTimeoutTask\"}", (uint8_t *)v6, 0x12u);
  }
  return +[CLDurianTask setNearbyTimeoutHawkeyeTaskWithTimeout:v3 asHele:1];
}

- (id)createFetchTxPowerTaskAsOwner:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332020);
  }
  v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hele creating FetchTxPowerTask\"}", (uint8_t *)v6, 0x12u);
  }
  if (v3) {
    return +[CLDurianTask fetchTxPowerTask];
  }
  else {
    return +[CLDurianTask fetchNonOwnerTxPowerTask];
  }
}

- (id)createFetchAISProductDataTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332020);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hele creating FetchAISProductDataTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerProductDataTask];
}

- (id)createFetchAISManufacturerNameTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332020);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hele creating FetchAISManufacturerNameTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerManufacturerNameTask];
}

- (id)createFetchAISModelNameTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332020);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hele creating FetchAISModelNameTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerModelNameTask];
}

- (id)createFetchAISAccessoryCategoryTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332020);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hele creating FetchAISAccessoryCategoryTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerAccessoryCategoryTask];
}

- (id)createFetchAISAccessoryCapabilitiesTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332020);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hele creating FetchAISAccessoryCapabilitiesTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerAccessoryCapabilitiesTask];
}

- (id)createFetchAISFirmwareVersionTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332020);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hele creating FetchAISFirmwareVersionTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerFirmwareVersionTask];
}

- (id)createFetchAISFindMyVersionTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332020);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hele creating FetchAISFindMyVersionTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerFindMyVersionTask];
}

- (id)createFetchAISBatteryTypeTask
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102332020);
  }
  v2 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hele creating FetchAISBatteryTypeTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchBatteryTypeGATTTask];
}

@end