@interface CLTrackingAvoidanceService
+ (BOOL)isSupported;
+ (id)convert:(id)a3 andObservationAction:(int64_t)a4;
+ (id)convertRTLocationOfInterest:(id)a3;
+ (id)convertSPTrackingAvoidanceErrorToString:(int64_t)a3;
+ (id)convertSPUnauthorizedTrackingObservationActionToString:(int64_t)a3;
+ (id)getSilo;
+ (unint64_t)convertSPDetectedDeviceTypeToTADeviceType:(unint64_t)a3;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)shouldThrottleNotification;
- (BOOL)suspiciousDeviceContainsKoreaLocations:(id)a3;
- (CLTrackingAvoidanceService)init;
- (id).cxx_construct;
- (id)clientIdentifier;
- (id)getTrackingAvoidanceSettingsWithOTASettings:(id)a3;
- (uint64_t)onSignalEnvironmentNotification:(int)a3 data:(int)a4;
- (void)beginService;
- (void)cancelAISFetchTimeoutForDevice:(id)a3;
- (void)didFetchAISAccessoryCapabilitiesFromDevice:(id)a3 accessoryCapabilities:(id)a4 error:(id)a5;
- (void)didFetchAISAccessoryCategoryFromDevice:(id)a3 accessoryCategory:(unsigned __int8)a4 error:(id)a5;
- (void)didFetchAISBatteryLevelFromDevice:(id)a3 batteryLevel:(unsigned __int8)a4 error:(id)a5;
- (void)didFetchAISBatteryTypeFromDevice:(id)a3 batteryType:(unsigned __int8)a4 error:(id)a5;
- (void)didFetchAISFirmwareVersionFromDevice:(id)a3 firmwareVersion:(id)a4 error:(id)a5;
- (void)didFetchAISManufacturerNameFromDevice:(id)a3 manufacturerName:(id)a4 error:(id)a5;
- (void)didFetchAISModelNameFromDevice:(id)a3 modelName:(id)a4 error:(id)a5;
- (void)didFetchAISNetworkIDFromDevice:(id)a3 networkID:(unsigned __int8)a4 error:(id)a5;
- (void)didFetchAISProductDataFromDevice:(id)a3 productData:(id)a4 error:(id)a5;
- (void)didFetchAISProtocolImplementationFromDevice:(id)a3 protocolImplementation:(unsigned int)a4 error:(id)a5;
- (void)didFetchAISSerialNumberFromDevice:(id)a3 serialNumber:(id)a4 error:(id)a5;
- (void)didFetchFirmwareVersion:(id)a3 fromTag:(id)a4 withError:(id)a5;
- (void)didFetchHawkeyeAISAccessoryCapabilitiesFromDevice:(id)a3 accessoryCapabilities:(id)a4 error:(id)a5;
- (void)didFetchHawkeyeAISAccessoryCategoryFromDevice:(id)a3 accessoryCategory:(id)a4 error:(id)a5;
- (void)didFetchHawkeyeAISManufacturerNameFromDevice:(id)a3 manufacturerName:(id)a4 error:(id)a5;
- (void)didFetchHawkeyeAISModelNameFromDevice:(id)a3 modelName:(id)a4 error:(id)a5;
- (void)didFetchHawkeyeAISProductDataFromDevice:(id)a3 productData:(id)a4 error:(id)a5;
- (void)didFetchSignficantLocationsStatus:(BOOL)a3 forClient:(id)a4;
- (void)didSuccessfullyPlayUnauthorizedSound:(id)a3 address:(id)a4;
- (void)didUnsuccessfullyPlayUnauthorizedSound:(id)a3 address:(id)a4;
- (void)endService;
- (void)fetchAISInfoForNonPoshTAUnknownBeacon:(id)a3 client:(id)a4;
- (void)fetchAISInfoForPoshTAUnknownBeacon:(id)a3 client:(id)a4;
- (void)fetchAISInfoForTAUnknownBeacon:(id)a3 client:(id)a4;
- (void)fetchStatusOfUTEnablementRequirementsForClient:(id)a3;
- (void)fetchTAUnknownBeacon:(id)a3 withCompletion:(id)a4;
- (void)forceSurfaceStagedDetections:(id)a3 deviceType:(unint64_t)a4 detailsBitmask:(unsigned int)a5 client:(id)a6;
- (void)handleNotificationMetrics:(id)a3;
- (void)incrementNotifications;
- (void)ingestTAEventIfTAServiceRunning:(id)a3;
- (void)navigationListener:(id)a3 didChangeNavigationState:(unint64_t)a4 transportType:(int)a5;
- (void)notifyCrucialStates;
- (void)notifyTAWithDeviceInformation:(id)a3 type:(unint64_t)a4 state:(unint64_t)a5 date:(id)a6;
- (void)onAdvertisementBufferEmptied;
- (void)onAggressiveScanEnded;
- (void)onAggressiveScanStarted;
- (void)onAvengerAdvertisement:(id)a3 reconciledInformation:(id)a4;
- (void)onBluetoothServiceNotification:(int)a3 data:(uint64_t)a4;
- (void)onClientManagerNotification:(int)a3 data:(uint64_t)a4;
- (void)onDaemonStatusNotification:(int)a3 data:(int *)a4;
- (void)onDataProtectionNotification:(int)a3 data:(unint64_t)a4;
- (void)onGeoCountryConfigurationChanged:(id)a3;
- (void)onGnssNotification:(int)a3 data:(uint64_t)a4;
- (void)onLocationNotification:(int)a3 data:(uint64_t)a4;
- (void)onLowConfidenceVisit:(id)a3;
- (void)onMotionStateNotification:(int)a3 data:(uint64_t)a4;
- (void)onNotOptedInBOMScanEnded;
- (void)onUpdatedSettings:(id)a3;
- (void)onVehicleStateNotification;
- (void)onVisit:(id)a3;
- (void)onWifiServiceNotification:(int)a3 data:(unsigned __int8 *)a4;
- (void)registerForAvengerScanner;
- (void)registerForBluetoothServiceNotification;
- (void)registerForClientManagerNotification;
- (void)registerForDaemonStatusNotification;
- (void)registerForDataProtectionNotification;
- (void)registerForDurianService;
- (void)registerForGeoCountryCodeConfigurationNotification;
- (void)registerForGeoNavListener;
- (void)registerForGnssNotification;
- (void)registerForLeechedEvents;
- (void)registerForLocationNotification;
- (void)registerForMotionNotification;
- (void)registerForOTASettingsNotification;
- (void)registerForRoutineMonitor;
- (void)registerForSignalEnvironmentNotification;
- (void)registerForVehicleStateNotification;
- (void)registerForWifiServiceNotification;
- (void)requestHawkeyeLowEnergyScan;
- (void)requestImportantLoisIfNeeded;
- (void)requestLoiRelatedTo:(id)a3;
- (void)requestScan;
- (void)resolveAndUpdateTADeviceRecordStatusFor:(id)a3 withCompletion:(id)a4;
- (void)scheduleAISFetchTimeoutForDevice:(id)a3;
- (void)showEngineeringUIForOwnerUT:(id)a3;
- (void)stageTADetection:(id)a3 deviceType:(unint64_t)a4 detailsBitmask:(unsigned int)a5 client:(id)a6;
- (void)submitUtObservationActionOfType:(int64_t)a3 forDevice:(id)a4;
- (void)trackingAvoidanceService:(id)a3 didFindSuspiciousDevices:(id)a4;
- (void)trackingAvoidanceService:(id)a3 didRequestAIS:(id)a4;
- (void)trackingAvoidanceService:(id)a3 didStageSuspiciousDevices:(id)a4;
- (void)trackingAvoidanceService:(id)a3 didUnstageSuspiciousDevices:(id)a4;
- (void)trackingAvoidanceService:(id)a3 didUpdateSuspiciousDevices:(id)a4;
- (void)trackingAvoidanceService:(id)a3 requestingAdditionalInformation:(id)a4;
- (void)unregisterForAvengerScanner;
- (void)unregisterForBluetoothServiceNotification;
- (void)unregisterForClientManagerNotification;
- (void)unregisterForDaemonStatusNotification;
- (void)unregisterForDataProtectionNotification;
- (void)unregisterForDurianService;
- (void)unregisterForGeoCountryCodeConfigurationNotification;
- (void)unregisterForGeoNavListener;
- (void)unregisterForGnssNotification;
- (void)unregisterForLeechedEvents;
- (void)unregisterForLocationNotification;
- (void)unregisterForMotionNotification;
- (void)unregisterForOTASettingsNotification;
- (void)unregisterForRoutineMonitor;
- (void)unregisterForSignalEnvironmentNotification;
- (void)unregisterForVehicleStateNotification;
- (void)unregisterForWifiServiceNotification;
- (void)updateZoneMonitorLocation:(id)a3;
@end

@implementation CLTrackingAvoidanceService

- (void)onLocationNotification:(int)a3 data:(uint64_t)a4
{
  if (a3 == 22)
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    v8 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = sub_1010FB9FC(*(int **)(a4 + 800));
      *(_DWORD *)buf = 134283521;
      *(void *)v38 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "#ut received %{private}zu WSB locations", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      uint64_t v28 = sub_1010FB9FC(*(int **)(a4 + 800));
      int v35 = 134283521;
      uint64_t v36 = v28;
      v29 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onLocationNotification:data:]", "%s\n", v29);
      if (v29 != (char *)buf) {
        free(v29);
      }
    }
    if (sub_1010FB9FC(*(int **)(a4 + 800)))
    {
      uint64_t v10 = 0;
      for (uint64_t i = 132; ; i += 156)
      {
        uint64_t v12 = sub_1002D4CD0(*(void *)(a4 + 800));
        if (*(_DWORD *)(v12 + i) == 2) {
          break;
        }
        id v13 = objc_msgSend(objc_alloc((Class)TALocationLite), "initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:deltaDistance:deltaDistanceAccuracy:groundAltitude:groundAltitudeUncertainty:pressure:pressureUncertainty:isSimulatedOrSpoofed:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", *(double *)(v12 + i - 56)), 0, *(double *)(v12 + i - 128), *(double *)(v12 + i - 120), *(double *)(v12 + i - 112), *(double *)(v12 + i - 104), *(double *)(v12 + i - 96), *(double *)(v12 + i - 88), *(double *)(v12 + i - 80), *(double *)(v12 + i - 72), *(void *)(v12 + i - 64), 0xBFF0000000000000,
                0xBFF0000000000000,
                0,
                0xBFF0000000000000,
                0,
                0xBFF0000000000000);
        [a1 ingestTAEventIfTAServiceRunning:v13];

        sub_100199168((uint64_t)a1 + 224, (long long *)a4, (char *)(a4 + 160));
        id v14 = objc_alloc((Class)CLLocation);
        long long v15 = *(_OWORD *)(a4 + 112);
        v31[6] = *(_OWORD *)(a4 + 96);
        v31[7] = v15;
        v32[0] = *(_OWORD *)(a4 + 128);
        *(_OWORD *)((char *)v32 + 12) = *(_OWORD *)(a4 + 140);
        long long v16 = *(_OWORD *)(a4 + 48);
        v31[2] = *(_OWORD *)(a4 + 32);
        v31[3] = v16;
        long long v17 = *(_OWORD *)(a4 + 80);
        v31[4] = *(_OWORD *)(a4 + 64);
        v31[5] = v17;
        long long v18 = *(_OWORD *)(a4 + 16);
        v31[0] = *(_OWORD *)a4;
        v31[1] = v18;
        [a1 updateZoneMonitorLocation:[v14 initWithClientLocation:v31]];
        if (++v10 >= (unint64_t)sub_1010FB9FC(*(int **)(a4 + 800))) {
          return;
        }
      }
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      v6 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68289026;
        *(_DWORD *)v38 = 0;
        *(_WORD *)&v38[4] = 2082;
        *(void *)&v38[6] = "";
        v7 = "{\"msg%{public}.0s\":\"#ut received china shifted wifi location\"}";
        goto LABEL_37;
      }
    }
  }
  else if (a3 == 5)
  {
    if (*(_DWORD *)(a4 + 132) == 2)
    {
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      v6 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68289026;
        *(_DWORD *)v38 = 0;
        *(_WORD *)&v38[4] = 2082;
        *(void *)&v38[6] = "";
        v7 = "{\"msg%{public}.0s\":\"#ut received china shifted location\"}";
LABEL_37:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, v7, buf, 0x12u);
      }
    }
    else
    {
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      v21 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "#ut received location", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419490 != -1) {
          dispatch_once(&qword_102419490, &stru_10232A4C8);
        }
        LOWORD(v35) = 0;
        v30 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onLocationNotification:data:]", "%s\n", v30);
        if (v30 != (char *)buf) {
          free(v30);
        }
      }
      id v22 = objc_msgSend(objc_alloc((Class)TALocationLite), "initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:deltaDistance:deltaDistanceAccuracy:groundAltitude:groundAltitudeUncertainty:pressure:pressureUncertainty:isSimulatedOrSpoofed:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", *(double *)(a4 + 76)), *(unsigned __int8 *)(a4 + 672), *(double *)(a4 + 4), *(double *)(a4 + 12), *(double *)(a4 + 20), *(double *)(a4 + 28), *(double *)(a4 + 36), *(double *)(a4 + 44), *(double *)(a4 + 52), *(double *)(a4 + 60), *(void *)(a4 + 68), *(void *)(a4 + 168),
              *(void *)(a4 + 176),
              *(void *)(a4 + 536),
              *(void *)(a4 + 544),
              *(void *)(a4 + 456),
              *(void *)(a4 + 464));
      [a1 ingestTAEventIfTAServiceRunning:v22];

      sub_100199168((uint64_t)a1 + 224, (long long *)a4, (char *)(a4 + 160));
      id v23 = objc_alloc((Class)CLLocation);
      long long v24 = *(_OWORD *)(a4 + 112);
      v33[6] = *(_OWORD *)(a4 + 96);
      v33[7] = v24;
      v34[0] = *(_OWORD *)(a4 + 128);
      *(_OWORD *)((char *)v34 + 12) = *(_OWORD *)(a4 + 140);
      long long v25 = *(_OWORD *)(a4 + 48);
      v33[2] = *(_OWORD *)(a4 + 32);
      v33[3] = v25;
      long long v26 = *(_OWORD *)(a4 + 80);
      v33[4] = *(_OWORD *)(a4 + 64);
      v33[5] = v26;
      long long v27 = *(_OWORD *)(a4 + 16);
      v33[0] = *(_OWORD *)a4;
      v33[1] = v27;
      [a1 updateZoneMonitorLocation:[v23 initWithClientLocation:v33]];
    }
  }
  else
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    v19 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "#ut, received unhandled location notification", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      LOWORD(v35) = 0;
      v20 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLTrackingAvoidanceService onLocationNotification:data:]", "%s\n", v20);
      if (v20 != (char *)buf) {
        free(v20);
      }
    }
  }
}

- (void)onAvengerAdvertisement:(id)a3 reconciledInformation:(id)a4
{
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_10232A4C8);
  }
  v6 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "#ut received advertisement", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    __int16 v24 = 0;
    v19 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onAvengerAdvertisement:reconciledInformation:]", "%s\n", v19);
    if (v19 != (char *)buf) {
      free(v19);
    }
  }
  unsigned int v7 = +[TASPAdvertisement instancesRespondToSelector:NSSelectorFromString(@"initWithAddress:advertisementData:status:reserved:rssi:scanDate:detailsBitmask:uuid:protocolID:")];
  id v8 = objc_alloc((Class)TASPAdvertisement);
  id v9 = [a3 address];
  id v10 = [a3 advertisementData];
  id v11 = [a3 status];
  id v12 = [a3 reserved];
  id v13 = [a3 rssi];
  id v14 = [a3 scanDate];
  if (v7)
  {
    LODWORD(v20) = [a3 detailsBitmask];
    id v15 = [v8 initWithAddress:v9 advertisementData:v10 status:v11 reserved:v12 rssi:v13 scanDate:v14 detailsBitmask:v20 uuid:[a4 uuid] protocolID:[a3 protocolID]];
  }
  else
  {
    id v15 = [v8 initWithAddress:v9 advertisementData:v10 status:v11 reserved:v12 rssi:v13 scanDate:v14 uuid:[a4 uuid]];
  }
  long long v16 = v15;
  if (_os_feature_enabled_impl())
  {
    if ([a3 isApple] && (objc_msgSend(a3, "isNearOwner") & 1) == 0)
    {
      int v17 = ([a3 status] >> 4) & 1;
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  if (([a3 status] & 0x10) == 0)
  {
LABEL_14:
    int v17 = 0;
    goto LABEL_16;
  }
  int v17 = [[objc_msgSend(a3, "advertisementData") length] != 0];
LABEL_16:
  sub_100134750(buf, (char *)[[[objc_msgSend(objc_msgSend(objc_msgSend(a3, "address"), "hexString")) UTF8String];
  if (SHIBYTE(v26) < 0)
  {
    sub_1000DC48C(__p, *(void **)buf, *(unint64_t *)&buf[8]);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)buf;
    uint64_t v23 = v26;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  sub_100198E98((uint64_t)&self->_metrics, v17, (uint64_t)__p, Current);
  if (SHIBYTE(v23) < 0) {
    operator delete(__p[0]);
  }
  [(CLTrackingAvoidanceService *)self ingestTAEventIfTAServiceRunning:v16];

  if (SHIBYTE(v26) < 0) {
    operator delete(*(void **)buf);
  }
}

- (void)updateZoneMonitorLocation:(id)a3
{
  if (-[CLTrackingAvoidanceZoneMonitor onLocationUpdate:](self->_zoneMonitor, "onLocationUpdate:"))
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    v5 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v6 = [(CLTrackingAvoidanceZoneMonitor *)self->_zoneMonitor isInZone];
      v8[0] = 68289282;
      v8[1] = 0;
      __int16 v9 = 2082;
      id v10 = "";
      __int16 v11 = 1026;
      unsigned int v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut zone classification changed\", \"isInZone\":%{public}hhd}", (uint8_t *)v8, 0x18u);
    }
    id v7 = [objc_alloc((Class)TASystemState) initWithSystemStateType:14 isOn:-[CLTrackingAvoidanceZoneMonitor isInZone](self->_zoneMonitor, "isInZone") date:[a3 timestamp]];
    [(CLTrackingAvoidanceService *)self ingestTAEventIfTAServiceRunning:v7];
  }
}

- (void)ingestTAEventIfTAServiceRunning:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10017B3CC;
  v3[3] = &unk_10229FEB0;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async([objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "silo") queue], v3);
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)[a3 count]) {
    [objc_msgSend(a3, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:a3 index:v5];
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_102488210 != -1) {
    dispatch_once(&qword_102488210, &stru_10232A360);
  }
  return (id)qword_102488208;
}

+ (BOOL)isSupported
{
  BOOL v6 = 0;
  sub_1000C7F88(&v4);
  int v2 = sub_1000D2988(v4, "TrackingAvoidanceOn", &v6);
  if (v5) {
    sub_1000DB0A0(v5);
  }
  if (v2) {
    return v6;
  }
  byte_102488218 = 1;
  if (qword_102488220 != -1) {
    dispatch_once(&qword_102488220, &stru_10232A380);
  }
  return byte_102488218;
}

+ (id)convert:(id)a3 andObservationAction:(int64_t)a4
{
  id v5 = [a3 latestAdvertisement];
  if (+[SPUnauthorizedTrackingAdvertisement instancesRespondToSelector:NSSelectorFromString(@"initWithAddress:advertisementData:status:reserved:rssi:scanDate:isPosh:networkID:")])
  {
    id v6 = [v5 performSelector:NSSelectorFromString(@"protocolID")];
    SEL v7 = NSSelectorFromString(@"isPosh");
    id v8 = +[NSInvocation invocationWithMethodSignature:](NSInvocation, "invocationWithMethodSignature:", [(id)objc_opt_class() instanceMethodSignatureForSelector:v7]);
    [(NSInvocation *)v8 setSelector:v7];
    [(NSInvocation *)v8 setTarget:v5];
    [(NSInvocation *)v8 invoke];
    unsigned __int8 v57 = 0;
    [(NSInvocation *)v8 getReturnValue:&v57];
    id v9 = objc_alloc((Class)SPUnauthorizedTrackingAdvertisement);
    id v10 = [v5 address];
    id v11 = [v5 advertisementData];
    id v12 = [v5 status];
    id v13 = [v5 reserved];
    id v14 = [v5 rssi];
    id v15 = [v5 scanDate];
    int v16 = v57;
    if (v6) {
      unsigned __int8 v17 = [v6 intValue];
    }
    else {
      unsigned __int8 v17 = 0;
    }
    BYTE1(v50) = v17;
    LOBYTE(v50) = v16 != 0;
    id v18 = [v9 initWithAddress:v10 advertisementData:v11 status:v12 reserved:v13 rssi:v14 scanDate:v15 isPosh:v50];
  }
  else
  {
    id v18 = [objc_alloc((Class)SPUnauthorizedTrackingAdvertisement) initWithAddress:[v5 address] advertisementData:[v5 advertisementData] status:[v5 status] reserved:[v5 reserved] rssi:[v5 rssi] scanDate:[v5 scanDate]];
  }
  v19 = v18;
  id v20 = objc_alloc_init((Class)NSMutableArray);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v51 = a3;
  id v21 = [a3 locationHistory];
  id v22 = [v21 countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v54;
    do
    {
      long long v25 = 0;
      do
      {
        if (*(void *)v54 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void **)(*((void *)&v53 + 1) + 8 * (void)v25);
        id v27 = objc_alloc((Class)SPObservationLocation);
        id v28 = [v26 timestamp];
        [v26 latitude];
        double v30 = v29;
        [v26 longitude];
        double v32 = v31;
        [v26 horizontalAccuracy];
        double v34 = v33;
        [v26 altitude];
        double v36 = v35;
        [v26 verticalAccuracy];
        double v38 = v37;
        [v26 speed];
        double v40 = v39;
        [v26 speedAccuracy];
        double v42 = v41;
        [v26 course];
        double v44 = v43;
        [v26 courseAccuracy];
        id v46 = [v27 initWithTimestamp:v28 latitude:0 longitude:v30 horizontalAccuracy:v32 altitude:v34 verticalAccuracy:v36 speed:v38 speedAccuracy:v40 course:v42 courseAccuracy:v44 floorLevel:v45];
        [v20 addObject:v46];

        long long v25 = (char *)v25 + 1;
      }
      while (v23 != v25);
      id v23 = [v21 countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v23);
  }
  id v47 = [objc_alloc((Class)SPUnauthorizedTrackingObservation) initWithAction:a4 type:objc_msgSend(v51, "forceSurfaceReason") == (id)2 trackingIdentifier:v19 observedLocations:v20];

  id v48 = v47;
  return v47;
}

+ (id)convertRTLocationOfInterest:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    id v4 = [a3 type];
    if (v4) {
      uint64_t v5 = 2 * (v4 == (id)1);
    }
    else {
      uint64_t v5 = 1;
    }
    id v6 = objc_alloc((Class)TALocationOfInterest);
    [objc_msgSend(v3, "location") latitude];
    double v8 = v7;
    [objc_msgSend(v3, "location") longitude];
    double v10 = v9;
    [objc_msgSend(v3, "location") horizontalUncertainty];
    id v3 = [v6 initWithType:v5 date:[NSDate date] latitude:v8 longitude:v10 horizontalAccuracy:v11];
    id v12 = v3;
  }
  return v3;
}

- (CLTrackingAvoidanceService)init
{
  v4.receiver = self;
  v4.super_class = (Class)CLTrackingAvoidanceService;
  int v2 = [(CLTrackingAvoidanceService *)&v4 initWithInboundProtocol:&OBJC_PROTOCOL___CLTrackingAvoidanceServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLTrackingAvoidanceClientProtocol];
  if (v2)
  {
    v2->_vehicleStateProxy = 0;
    [(CLTrackingAvoidanceService *)v2 universe];
    operator new();
  }
  return 0;
}

- (void)beginService
{
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_10232A4C8);
  }
  id v3 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ut initiating service", (uint8_t *)buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    *(_WORD *)int v16 = 0;
    id v13 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService beginService]", "%s\n", v13);
    if (v13 != (char *)buf) {
      free(v13);
    }
  }
  sub_100103240();
  if (sub_10073E30C())
  {
    self->_allowDebugNotification = 1;
    sub_1000C7F88(buf);
    v16[0] = 0;
    char v4 = sub_1000D2988(*(uint64_t *)&buf[0], "TrackingAvoidanceAllowStagingNotification", v16);
    if (v16[0]) {
      BOOL v5 = v4;
    }
    else {
      BOOL v5 = 0;
    }
    self->_allowStagedDetectionNotification = v5;
    if (*((void *)&buf[0] + 1)) {
      sub_1000DB0A0(*((std::__shared_weak_count **)&buf[0] + 1));
    }
  }
  else
  {
    self->_allowDebugNotification = 0;
    self->_allowStagedDetectionNotification = 0;
  }
  self->_SPOwnerSession = (SPOwnerSession *)objc_alloc_init((Class)SPOwnerSession);
  sub_100B75828((uint64_t)&self->_metrics);
  self->_settingsVersion = 1;
  self->_metrics.lastLocationPrivate.batchedLocationFixType = 0;
  sub_1000C7F88(buf);
  v16[0] = 0;
  char v6 = sub_1000D2988(*(uint64_t *)&buf[0], "TrackingAvoidanceAllowSimulatedEvents", v16);
  if (v16[0]) {
    char v7 = v6;
  }
  else {
    char v7 = 0;
  }
  LOBYTE(self->_signalEnvironment) = v7;
  if (*((void *)&buf[0] + 1)) {
    sub_1000DB0A0(*((std::__shared_weak_count **)&buf[0] + 1));
  }
  sub_1000C7F88(buf);
  *(void *)int v16 = 0;
  int v8 = sub_1000A699C(*(uint64_t *)&buf[0], "TrackingAvoidanceOwnerUTSamplingProbability", v16);
  double v9 = *(double *)v16;
  if (!v8) {
    double v9 = 0.0;
  }
  *(double *)&self->_metrics.lastLocationPrivate.accessoryLocationType = v9;
  if (*((void *)&buf[0] + 1)) {
    sub_1000DB0A0(*((std::__shared_weak_count **)&buf[0] + 1));
  }
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_10232A4C8);
  }
  double v10 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(void *)&self->_metrics.lastLocationPrivate.accessoryLocationType;
    LODWORD(buf[0]) = 134217984;
    *(void *)((char *)buf + 4) = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "#ut owner UT sampling probability %lf", (uint8_t *)buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    uint64_t v14 = *(void *)&self->_metrics.lastLocationPrivate.accessoryLocationType;
    *(_DWORD *)int v16 = 134217984;
    *(void *)&v16[4] = v14;
    id v15 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService beginService]", "%s\n", v15);
    if (v15 != (char *)buf) {
      free(v15);
    }
  }
  self->_maxDailyAggressiveScans = 50;
  self->_notificationThrottleMax = -1;
  self->_notificationThrottlePeriodHours = 24;
  self->_zoneMonitor = [[CLTrackingAvoidanceZoneMonitor alloc] initWithTimeZone:@"Asia/Seoul", 32.4738662, 38.7975409, 123.760521, 132.275637 zoneBoundary];
  [(CLTrackingAvoidanceService *)self registerForOTASettingsNotification];
  [(CLTrackingAvoidanceService *)self registerForDurianService];
  id v12 = (TATrackingAvoidanceServiceManager *)[objc_alloc((Class)TATrackingAvoidanceServiceManager) initWithQueue:[objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "silo") queue] settings:[objc_alloc_init((Class)TASettings)]];
  self->_taServiceManager = v12;
  [(TATrackingAvoidanceServiceManager *)v12 addDataSource:self];
  [(TATrackingAvoidanceServiceManager *)self->_taServiceManager addObserver:self];
  self->_settingsSubscription.__ptr_.__value_ = (CLXOTASubscription *)objc_alloc_init((Class)NSMutableDictionary);
}

- (void)endService
{
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_10232A4C8);
  }
  id v3 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ut terminating service", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    char v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService endService]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  [(CLTrackingAvoidanceService *)self unregisterForOTASettingsNotification];
  [(CLTrackingAvoidanceService *)self unregisterForDurianService];
  zoneMonitor = self->_zoneMonitor;
  if (zoneMonitor)
  {

    self->_zoneMonitor = 0;
  }
  value = self->_settingsSubscription.__ptr_.__value_;
  if (value)
  {

    self->_settingsSubscription.__ptr_.__value_ = 0;
  }
  SPOwnerSession = self->_SPOwnerSession;
  if (SPOwnerSession)
  {

    self->_SPOwnerSession = 0;
  }
  [(TATrackingAvoidanceServiceManager *)self->_taServiceManager removeDataSource:self];
}

- (void)notifyCrucialStates
{
  id v3 = [objc_alloc((Class)TASystemState) initWithSystemStateType:10 isOn:LOBYTE(self->_signalEnvironment) date:[NSDate date]];
  [(CLTrackingAvoidanceService *)self ingestTAEventIfTAServiceRunning:v3];

  unsigned __int8 v17 = 0;
  if (objc_msgSend(objc_msgSend(objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "vendor"), "proxyForService:", @"CLDaemonStatus"), "syncgetAirplaneMode:", &v17))
  {
    id v4 = objc_alloc((Class)TASystemState);
    id v5 = [v4 initWithSystemStateType:3 isOn:v17 date:[NSDate date]];
    [(CLTrackingAvoidanceService *)self ingestTAEventIfTAServiceRunning:v5];
  }
  else
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    char v6 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "#ut failed to fetch airplane mode state.", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      int v16 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService notifyCrucialStates]", "%s\n", v16);
      if (v16 != (char *)buf) {
        free(v16);
      }
    }
  }
  id v7 = [objc_alloc((Class)TASystemState) initWithSystemStateType:7 isOn:(int)[objc_msgSend(objc_msgSend(objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "vendor"), "proxyForService:", @"CLDaemonStatus"), "syncgetThermalLevel") > 9] date:[+[NSDate date](NSDate, "date")]];
  [(CLTrackingAvoidanceService *)self ingestTAEventIfTAServiceRunning:v7];

  id v8 = [objc_alloc((Class)TASystemState) initWithSystemStateType:4 isOn:[objc_msgSend(objc_msgSend(objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "vendor"), "proxyForService:", @"CLDaemonStatus"), "syncgetBatterySaverMode")] date:[+[NSDate date](NSDate, "date")]];
  [(CLTrackingAvoidanceService *)self ingestTAEventIfTAServiceRunning:v8];

  id v9 = [objc_alloc((Class)TASystemState) initWithSystemStateType:8 isOn:sub_1001198CC() == 1 date:[NSDate date]];
  [(CLTrackingAvoidanceService *)self ingestTAEventIfTAServiceRunning:v9];

  id v10 = [objc_alloc((Class)TASystemState) initWithSystemStateType:9 isOn:[objc_msgSend(objc_msgSend(objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "vendor"), "proxyForService:", @"CLLocationController"), "syncgetIsSimulationEnabled")] date:+[NSDate date](NSDate, "date")];
  [(CLTrackingAvoidanceService *)self ingestTAEventIfTAServiceRunning:v10];

  id v11 = [objc_alloc((Class)TASystemState) initWithSystemStateType:11 isOn:[objc_msgSend(objc_msgSend(objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "vendor"), "proxyForService:", @"CLDataProtectionManager"), "syncgetDeviceUnlockedSinceFirstBoot")] date:[+[NSDate date](NSDate, "date")]];
  [(CLTrackingAvoidanceService *)self ingestTAEventIfTAServiceRunning:v11];

  id v12 = [[+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration") countryCode];
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_10232A4C8);
  }
  id v13 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
  {
    id v14 = [v12 UTF8String];
    *(_DWORD *)buf = 68289282;
    int v19 = 0;
    __int16 v20 = 2082;
    id v21 = "";
    __int16 v22 = 2082;
    id v23 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut got last country code\", \"lastCountryCode\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v15 = [objc_alloc((Class)TASystemState) initWithSystemStateType:13 isOn:[v12 isEqualToString:@"KR"] date:[+[NSDate date](NSDate, "date")]];
  [(CLTrackingAvoidanceService *)self ingestTAEventIfTAServiceRunning:v15];
}

- (void)registerForLeechedEvents
{
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_10232A4C8);
  }
  id v3 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    char v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut received leeched event registration\"}", (uint8_t *)v4, 0x12u);
  }
  [(CLTrackingAvoidanceService *)self notifyCrucialStates];
  [(CLTrackingAvoidanceService *)self registerForDaemonStatusNotification];
  [(CLTrackingAvoidanceService *)self registerForClientManagerNotification];
  [(CLTrackingAvoidanceService *)self registerForGnssNotification];
  [(CLTrackingAvoidanceService *)self registerForMotionNotification];
  [(CLTrackingAvoidanceService *)self registerForLocationNotification];
  [(CLTrackingAvoidanceService *)self registerForRoutineMonitor];
  [(CLTrackingAvoidanceService *)self registerForWifiServiceNotification];
  [(CLTrackingAvoidanceService *)self registerForBluetoothServiceNotification];
  [(CLTrackingAvoidanceService *)self registerForVehicleStateNotification];
  [(CLTrackingAvoidanceService *)self registerForSignalEnvironmentNotification];
  [(CLTrackingAvoidanceService *)self registerForGeoNavListener];
  [(CLTrackingAvoidanceService *)self registerForDataProtectionNotification];
  [(CLTrackingAvoidanceService *)self registerForGeoCountryCodeConfigurationNotification];
}

- (void)unregisterForLeechedEvents
{
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_10232A4C8);
  }
  id v3 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    char v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut received leeched event unregistration\"}", (uint8_t *)v4, 0x12u);
  }
  [(CLTrackingAvoidanceService *)self unregisterForDaemonStatusNotification];
  [(CLTrackingAvoidanceService *)self unregisterForClientManagerNotification];
  [(CLTrackingAvoidanceService *)self unregisterForGnssNotification];
  [(CLTrackingAvoidanceService *)self unregisterForMotionNotification];
  [(CLTrackingAvoidanceService *)self unregisterForLocationNotification];
  [(CLTrackingAvoidanceService *)self unregisterForRoutineMonitor];
  [(CLTrackingAvoidanceService *)self unregisterForWifiServiceNotification];
  [(CLTrackingAvoidanceService *)self unregisterForBluetoothServiceNotification];
  [(CLTrackingAvoidanceService *)self unregisterForVehicleStateNotification];
  [(CLTrackingAvoidanceService *)self unregisterForSignalEnvironmentNotification];
  [(CLTrackingAvoidanceService *)self unregisterForGeoNavListener];
  [(CLTrackingAvoidanceService *)self unregisterForDataProtectionNotification];
  [(CLTrackingAvoidanceService *)self unregisterForGeoCountryCodeConfigurationNotification];
}

- (void)registerForClientManagerNotification
{
  value = self->_clientManagerClient.__ptr_.__value_;
  if (!value)
  {
    [(CLTrackingAvoidanceService *)self universe];
    sub_1007E0344();
  }
  [*((id *)value + 2) register:*((void *)value + 1) forNotification:4 registrationInfo:0];
  memset(&v3, 0, sizeof(v3));
  std::string::operator=(&v3, &stru_1024881F0);
  sub_101A2EE44();
}

- (void)unregisterForClientManagerNotification
{
  value = self->_clientManagerClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:4];
    [*((id *)self->_clientManagerClient.__ptr_.__value_ + 2) unregister:*((void *)self->_clientManagerClient.__ptr_.__value_ + 1) forNotification:0];
  }
  BYTE2(self->_signalEnvironment) = 0;
}

- (void)registerForGnssNotification
{
  if (!self->_gnssClient.__ptr_.__value_)
  {
    if (+[CLGnssProviderAdapter isSupported])
    {
      [(CLTrackingAvoidanceService *)self universe];
      sub_100E92BC0();
    }
  }
}

- (void)unregisterForGnssNotification
{
  value = self->_gnssClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:13];
    id v4 = self->_gnssClient.__ptr_.__value_;
    self->_gnssClient.__ptr_.__value_ = 0;
    if (v4)
    {
      __int16 v5 = *(void (**)(void))(*(void *)v4 + 8);
      v5();
    }
  }
}

- (void)registerForLocationNotification
{
  value = self->_locationClient.__ptr_.__value_;
  if (!value)
  {
    [(CLTrackingAvoidanceService *)self universe];
    sub_100681630();
  }
  [*((id *)value + 2) register:*((void *)value + 1) forNotification:5 registrationInfo:0];
  [*((id *)self->_locationClient.__ptr_.__value_ + 2) register:*((void *)self->_locationClient.__ptr_.__value_ + 1) forNotification:22 registrationInfo:0];
}

- (void)unregisterForLocationNotification
{
  value = self->_locationClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:5];
    [*((id *)self->_locationClient.__ptr_.__value_ + 2) unregister:*((void *)self->_locationClient.__ptr_.__value_ + 1) forNotification:22];
    id v4 = self->_locationClient.__ptr_.__value_;
    self->_locationClient.__ptr_.__value_ = 0;
    if (v4)
    {
      __int16 v5 = *(void (**)(void))(*(void *)v4 + 8);
      v5();
    }
  }
}

- (void)registerForMotionNotification
{
  value = self->_motionStateClient.__ptr_.__value_;
  if (!value)
  {
    [(CLTrackingAvoidanceService *)self universe];
    sub_1005AEEAC();
  }
  [*((id *)value + 2) register:*((void *)value + 1) forNotification:3 registrationInfo:0];
}

- (void)unregisterForMotionNotification
{
  value = self->_motionStateClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:3];
    id v4 = self->_motionStateClient.__ptr_.__value_;
    self->_motionStateClient.__ptr_.__value_ = 0;
    if (v4)
    {
      __int16 v5 = *(void (**)(void))(*(void *)v4 + 8);
      v5();
    }
  }
}

- (void)registerForRoutineMonitor
{
  routineProxy = self->_routineProxy;
  if (!routineProxy)
  {
    routineProxy = (CLRoutineMonitorServiceProtocol *)[objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "vendor") proxyForService:@"CLRoutineMonitor"];
    self->_routineProxy = routineProxy;
  }
  [(CLRoutineMonitorServiceProtocol *)routineProxy registerDelegate:self inSilo:[(CLTrackingAvoidanceService *)self silo]];
  [(CLRoutineMonitorServiceProtocol *)self->_routineProxy startLeechingVisitsForClient:CLISP_ME_TOKEN];
  [(CLRoutineMonitorServiceProtocol *)self->_routineProxy startLeechingLowConfidenceVisitsForClient:CLISP_ME_TOKEN];

  [(CLTrackingAvoidanceService *)self requestImportantLoisIfNeeded];
}

- (void)registerForGeoCountryCodeConfigurationNotification
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1014D199C;
  handler[3] = &unk_1022B4250;
  handler[4] = self;
  notify_register_dispatch(GEOCountryConfigurationCountryCodeChangedDarwinNotification, &self->_countryCodeNotificationToken, (dispatch_queue_t)[-[CLTrackingAvoidanceService silo](self, "silo") queue], handler);
}

- (void)unregisterForGeoCountryCodeConfigurationNotification
{
  if (notify_is_valid_token(self->_countryCodeNotificationToken))
  {
    notify_cancel(self->_countryCodeNotificationToken);
    self->_countryCodeNotificationToken = -1;
  }
}

- (void)requestLoiRelatedTo:(id)a3
{
  if (self->_routineProxy)
  {
    if (a3)
    {
      if (objc_msgSend(objc_msgSend(a3, "_placeInference"), "_loiIdentifier"))
      {
        -[CLRoutineMonitorServiceProtocol fetchLocationOfInterestWithIdentifier:withReply:](self->_routineProxy, "fetchLocationOfInterestWithIdentifier:withReply:");
      }
      else
      {
        if (qword_102419490 != -1) {
          dispatch_once(&qword_102419490, &stru_10232A4C8);
        }
        id v8 = qword_102419498;
        if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68289283;
          int v10 = 0;
          __int16 v11 = 2082;
          id v12 = "";
          __int16 v13 = 2113;
          id v14 = a3;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut #loi no inferred place\", \"visit\":%{private, location:escape_only}@}", buf, 0x1Cu);
        }
      }
      return;
    }
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    id v7 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "#ut #loi cannot request LOI information for a nil visit", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      char v6 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLTrackingAvoidanceService requestLoiRelatedTo:]", "%s\n");
LABEL_21:
      if (v6 != buf) {
        free(v6);
      }
    }
  }
  else
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    __int16 v5 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#ut #loi skip requesting LOI information as routine monitor is no up", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      char v6 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService requestLoiRelatedTo:]", "%s\n");
      goto LABEL_21;
    }
  }
}

- (void)requestImportantLoisIfNeeded
{
  if (self->_routineProxy)
  {
    if (!self->_lastLoiLabelQueryTimestamp
      || (v3 = [objc_alloc((Class)NSDate) initWithTimeInterval:self->_lastLoiLabelQueryTimestamp sinceDate:86400.0], id v4 = objc_msgSend(v3, "compare:", +[NSDate date](NSDate, "date")), v3, v4 == (id)-1))
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1014D26E8;
      v12[3] = &unk_10229FF00;
      v12[4] = self;
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      id v8 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "#ut #loi requesting LOI information for periodic update ...", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419490 != -1) {
          dispatch_once(&qword_102419490, &stru_10232A4C8);
        }
        LOWORD(v13) = 0;
        int v10 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService requestImportantLoisIfNeeded]", "%s\n", v10);
        if (v10 != (char *)buf) {
          free(v10);
        }
      }
      [(CLRoutineMonitorServiceProtocol *)self->_routineProxy fetchLocationsOfInterestOfType:0 withReply:v12];
      [(CLRoutineMonitorServiceProtocol *)self->_routineProxy fetchLocationsOfInterestOfType:1 withReply:v12];
    }
    else
    {
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      __int16 v5 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
      {
        lastLoiLabelQueryTimestamp = self->_lastLoiLabelQueryTimestamp;
        *(_DWORD *)buf = 138477827;
        int v16 = lastLoiLabelQueryTimestamp;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#ut #loi skip requesting LOI information in batch because we had done so at %{private}@", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419490 != -1) {
          dispatch_once(&qword_102419490, &stru_10232A4C8);
        }
        id v7 = self->_lastLoiLabelQueryTimestamp;
        int v13 = 138477827;
        id v14 = v7;
LABEL_31:
        __int16 v11 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService requestImportantLoisIfNeeded]", "%s\n", v11);
        if (v11 != (char *)buf) {
          free(v11);
        }
      }
    }
  }
  else
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    id v9 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "#ut #loi skip requesting LOI information as routine monitor is no up", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      LOWORD(v13) = 0;
      goto LABEL_31;
    }
  }
}

- (void)unregisterForRoutineMonitor
{
  routineProxy = self->_routineProxy;
  if (routineProxy)
  {
    [(CLRoutineMonitorServiceProtocol *)routineProxy stopLeechingLowConfidenceVisitsForClient:CLISP_ME_TOKEN];
    [(CLRoutineMonitorServiceProtocol *)self->_routineProxy stopLeechingVisitsForClient:CLISP_ME_TOKEN];
  }
  self->_routineProxy = 0;
  lastLoiLabelQueryTimestamp = self->_lastLoiLabelQueryTimestamp;
  if (lastLoiLabelQueryTimestamp)
  {

    self->_lastLoiLabelQueryTimestamp = 0;
  }
}

- (void)registerForDaemonStatusNotification
{
  value = self->_daemonStatusClient.__ptr_.__value_;
  if (!value)
  {
    [(CLTrackingAvoidanceService *)self universe];
    sub_10060F068();
  }
  [*((id *)value + 2) register:*((void *)value + 1) forNotification:0 registrationInfo:0];
  [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) register:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:1 registrationInfo:0];
  [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) register:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:2 registrationInfo:0];
  [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) register:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:3 registrationInfo:0];
  [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) register:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:6 registrationInfo:0];
  [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) register:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:8 registrationInfo:0];
  [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) register:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:10 registrationInfo:0];
  [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) register:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:15 registrationInfo:0];
  [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) register:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:13 registrationInfo:0];
}

- (void)unregisterForDaemonStatusNotification
{
  value = self->_daemonStatusClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:0];
    [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) unregister:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:1];
    [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) unregister:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:2];
    [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) unregister:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:3];
    [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) unregister:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:6];
    [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) unregister:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:8];
    [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) unregister:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:10];
    [*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2) unregister:*((void *)self->_daemonStatusClient.__ptr_.__value_ + 1) forNotification:15];
    id v4 = self->_daemonStatusClient.__ptr_.__value_;
    uint64_t v6 = *((void *)v4 + 1);
    __int16 v5 = (void *)*((void *)v4 + 2);
    [v5 unregister:v6 forNotification:13];
  }
}

- (void)registerForWifiServiceNotification
{
  value = self->_wifiServiceClient.__ptr_.__value_;
  if (!value)
  {
    [(CLTrackingAvoidanceService *)self universe];
    sub_1001AE6FC();
  }
  [*((id *)value + 2) register:*((void *)value + 1) forNotification:1 registrationInfo:0];
}

- (void)unregisterForWifiServiceNotification
{
  value = self->_wifiServiceClient.__ptr_.__value_;
  if (value) {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:1];
  }
  HIBYTE(self->_signalEnvironment) = 0;
}

- (void)registerForBluetoothServiceNotification
{
  value = self->_bluetoothServiceClient.__ptr_.__value_;
  if (!value)
  {
    [(CLTrackingAvoidanceService *)self universe];
    sub_100C53368();
  }
  [*((id *)value + 2) register:*((void *)value + 1) forNotification:9 registrationInfo:0];
}

- (void)unregisterForBluetoothServiceNotification
{
  value = self->_bluetoothServiceClient.__ptr_.__value_;
  if (value) {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:9];
  }
  BYTE1(self->_signalEnvironment) = 0;
}

- (void)registerForVehicleStateNotification
{
  if (objc_msgSend(objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "vendor"), "isServiceEnabled:", @"CLVehicleStateNotifier")&& !self->_vehicleStateProxy)
  {
    id v3 = (CLVehicleStateNotifierProtocol *)[objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "vendor") proxyForService:@"CLVehicleStateNotifier"];
    self->_vehicleStateProxy = v3;
    [(CLVehicleStateNotifierProtocol *)v3 registerDelegate:self inSilo:[(CLTrackingAvoidanceService *)self silo]];
    [(CLVehicleStateNotifierProtocol *)self->_vehicleStateProxy setDelegateEntityName:"CLTrackingAvoidanceService"];
  }
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1014D350C;
  handler[3] = &unk_1022B4250;
  handler[4] = self;
  notify_register_dispatch((const char *)[kCMVehicularStateChangedNotification UTF8String], &self->_vehicularToken, (dispatch_queue_t)[-[CLTrackingAvoidanceService silo](self, "silo") queue], handler);
}

- (void)unregisterForVehicleStateNotification
{
  if (notify_is_valid_token(self->_vehicularToken))
  {
    notify_cancel(self->_vehicularToken);
    self->_vehicularToken = -1;
  }
  vehicleStateProxy = self->_vehicleStateProxy;
  if (vehicleStateProxy)
  {

    self->_vehicleStateProxy = 0;
  }
}

- (void)registerForAvengerScanner
{
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_10232A4C8);
  }
  id v3 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    id v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut received avenger scanner registration\"}", (uint8_t *)v6, 0x12u);
  }
  if (_os_feature_enabled_impl())
  {
    if (!self->_scannerClient)
    {
      self->_scannerClient = -[CLAvengerScannerClient initWithDelegate:queue:]([CLAvengerScannerClient alloc], "initWithDelegate:queue:", self, [objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "silo") queue]);
      if (_os_feature_enabled_impl())
      {
        bomScanManager = self->_bomScanManager;
        if (bomScanManager) {
          [(CLTrackingAvoidanceBOMScanManager *)bomScanManager handleRegisterWithController:self->_scannerClient];
        }
        else {
          self->_bomScanManager = (CLTrackingAvoidanceBOMScanManager *)[[CLTrackingAvoidanceBOMScanManager alloc] initAndStartWithQueue:[self silo] andController:self->_scannerClient];
        }
      }
    }
  }
  else if (!self->_avengerScannerProxy)
  {
    __int16 v5 = (CLAvengerScannerScannerServiceProtocol *)[[-[CLTrackingAvoidanceService universe](self, "universe") vendor] proxyForService:@"CLAvengerScanner"];
    self->_avengerScannerProxy = v5;
    [(CLAvengerScannerServiceProtocol *)v5 registerDelegate:self inSilo:[(CLTrackingAvoidanceService *)self silo]];
    [(CLAvengerScannerServiceProtocol *)self->_avengerScannerProxy setDelegateEntityName:"CLTrackingAvoidanceService"];
    [(CLAvengerScannerServiceProtocol *)self->_avengerScannerProxy startMonitoringAvengerAdvertisementsForClient:CLISP_ME_TOKEN clientName:@"CLTrackingAvoidanceService"];
  }
}

- (void)unregisterForAvengerScanner
{
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_10232A4C8);
  }
  id v3 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    id v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut received avenger scanner unregistration\"}", (uint8_t *)v6, 0x12u);
  }
  if (_os_feature_enabled_impl())
  {
    if (_os_feature_enabled_impl())
    {
      bomScanManager = self->_bomScanManager;
      if (bomScanManager) {
        [(CLTrackingAvoidanceBOMScanManager *)bomScanManager handleUnRegisterController];
      }
    }
    p_scannerClient = (id *)&self->_scannerClient;
  }
  else
  {
    p_scannerClient = (id *)&self->_avengerScannerProxy;
    if (!*p_scannerClient) {
      return;
    }
    [*p_scannerClient stopMonitoringAvengerAdvertisementsForClient:CLISP_ME_TOKEN];
  }

  id *p_scannerClient = 0;
}

- (void)registerForSignalEnvironmentNotification
{
  value = self->_signalEnvironmentClient.__ptr_.__value_;
  if (!value)
  {
    [(CLTrackingAvoidanceService *)self universe];
    sub_100DEA43C();
  }
  [*((id *)value + 2) register:*((void *)value + 1) forNotification:0 registrationInfo:0];
}

- (void)unregisterForSignalEnvironmentNotification
{
  value = self->_signalEnvironmentClient.__ptr_.__value_;
  if (value) {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:0];
  }
}

- (void)registerForGeoNavListener
{
  if (!self->_geoNavListener)
  {
    id v3 = (GEONavigationListener *)[objc_alloc((Class)GEONavigationListener) initWithQueue:[objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "silo") queue]];
    self->_geoNavListener = v3;
    [(GEONavigationListener *)v3 setDelegate:self];
  }
}

- (void)unregisterForGeoNavListener
{
  geoNavListener = self->_geoNavListener;
  if (geoNavListener)
  {
    [(GEONavigationListener *)geoNavListener setDelegate:0];

    self->_geoNavListener = 0;
  }
}

- (void)registerForDataProtectionNotification
{
  value = self->_dataProtectionClient.__ptr_.__value_;
  if (!value)
  {
    [(CLTrackingAvoidanceService *)self universe];
    sub_100EB2E6C();
  }
  [*((id *)value + 2) register:*((void *)value + 1) forNotification:1 registrationInfo:0];
}

- (void)unregisterForDataProtectionNotification
{
  value = self->_dataProtectionClient.__ptr_.__value_;
  if (value) {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:1];
  }
}

- (void)navigationListener:(id)a3 didChangeNavigationState:(unint64_t)a4 transportType:(int)a5
{
  LODWORD(v5) = a5;
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_10232A4C8);
  }
  id v8 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134283777;
    unint64_t v16 = a4;
    __int16 v17 = 1025;
    int v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "#ut received navigation hints - navState %{private}lu; transportType %{private}d",
      buf,
      0x12u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    id v12 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService navigationListener:didChangeNavigationState:transportType:]", "%s\n", v12);
    if (v12 != (char *)buf) {
      free(v12);
    }
  }
  if (v5 >= 7)
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    id v9 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67174657;
      LODWORD(v16) = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "#ut unsupported GEOTransportType %{private}d", buf, 8u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      int v13 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLTrackingAvoidanceService navigationListener:didChangeNavigationState:transportType:]", "%s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
    uint64_t v5 = 4;
  }
  else
  {
    uint64_t v5 = v5;
  }
  if (a4 >= 3)
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    int v10 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134283521;
      unint64_t v16 = a4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "#ut unsupported GEONavigationListenerState %{private}lu", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      id v14 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLTrackingAvoidanceService navigationListener:didChangeNavigationState:transportType:]", "%s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
    }
    a4 = 0;
  }
  id v11 = [objc_alloc((Class)TAGeoNavigationNotification) initWithTransportType:v5 andNavigationState:a4 date:[NSDate date]];
  [(CLTrackingAvoidanceService *)self ingestTAEventIfTAServiceRunning:v11];
}

- (void)registerForOTASettingsNotification
{
}

- (void)unregisterForOTASettingsNotification
{
}

- (void)registerForDurianService
{
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_10232A4C8);
  }
  id v3 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    __int16 v6 = 2082;
    __int16 v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ta register for durian service\"}", (uint8_t *)v5, 0x12u);
  }
  if (!self->_durianServiceProxy)
  {
    id v4 = [(CLDurianServiceProtocol *)[objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "vendor") proxyForService:@"CLDurianService"];
    self->_durianServiceProxy = v4;
    [(CLDurianServiceProtocol *)v4 registerDelegate:self inSilo:[(CLTrackingAvoidanceService *)self silo]];
    [(CLDurianServiceProtocol *)self->_durianServiceProxy setDelegateEntityName:"CLTrackingAvoidanceService"];
  }
}

- (void)unregisterForDurianService
{
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_10232A4C8);
  }
  id v3 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    __int16 v6 = 2082;
    __int16 v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ta unregister for durian service\"}", (uint8_t *)v5, 0x12u);
  }
  durianServiceProxy = self->_durianServiceProxy;
  if (durianServiceProxy)
  {

    self->_durianServiceProxy = 0;
  }
}

- (void)onVisit:(id)a3
{
  if (a3)
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    uint64_t v5 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#ut received visit", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      int v13 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onVisit:]", "%s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
    id v6 = objc_alloc((Class)TACLVisit);
    [a3 coordinate];
    double v8 = v7;
    double v10 = v9;
    [a3 horizontalAccuracy];
    id v12 = [v6 initWithCoordinate:objc_msgSend(a3, "arrivalDate") horizontalAccuracy:objc_msgSend(a3, "departureDate") arrivalDate:objc_msgSend(a3, "detectionDate") confidence:2];
    [(CLTrackingAvoidanceService *)self ingestTAEventIfTAServiceRunning:v12];

    [(CLTrackingAvoidanceService *)self requestLoiRelatedTo:a3];
    [(CLTrackingAvoidanceService *)self requestImportantLoisIfNeeded];
  }
}

- (void)onLowConfidenceVisit:(id)a3
{
  if (a3)
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    uint64_t v5 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#ut received low confidence visit", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      int v13 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onLowConfidenceVisit:]", "%s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
    id v6 = objc_alloc((Class)TACLVisit);
    [a3 coordinate];
    double v8 = v7;
    double v10 = v9;
    [a3 horizontalAccuracy];
    id v12 = [v6 initWithCoordinate:objc_msgSend(a3, "arrivalDate") horizontalAccuracy:objc_msgSend(a3, "departureDate") arrivalDate:objc_msgSend(a3, "detectionDate") confidence:1];
    [(CLTrackingAvoidanceService *)self ingestTAEventIfTAServiceRunning:v12];

    [(CLTrackingAvoidanceService *)self requestLoiRelatedTo:a3];
    [(CLTrackingAvoidanceService *)self requestImportantLoisIfNeeded];
  }
}

- (void)onMotionStateNotification:(int)a3 data:(uint64_t)a4
{
  if (a3 != 3)
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    double v9 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "#ut, received unhandled motion notification", buf, 2u);
    }
    if (!sub_10013D1A0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    double v10 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLTrackingAvoidanceService onMotionStateNotification:data:]", "%s\n");
LABEL_41:
    if (v10 != buf) {
      free(v10);
    }
    return;
  }
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_10232A4C8);
  }
  id v6 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "#ut received motion state", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    id v12 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onMotionStateNotification:data:]", "%s\n", v12);
    if (v12 != (char *)buf) {
      free(v12);
    }
  }
  if ((CLMotionActivity::isInVehicle((CLMotionActivity *)a4) & 1) != 0
    || (CLMotionActivity::isDriving((CLMotionActivity *)a4) & 1) != 0)
  {
    uint64_t v7 = 3;
  }
  else if ((CLMotionActivity::isWalking((CLMotionActivity *)a4) & 1) != 0 {
         || (CLMotionActivity::isRunning((CLMotionActivity *)a4) & 1) != 0)
  }
  {
    uint64_t v7 = 2;
  }
  else if (CLMotionActivity::isStatic((CLMotionActivity *)a4))
  {
    uint64_t v7 = 1;
  }
  else if (CLMotionActivity::isCycling((CLMotionActivity *)a4))
  {
    uint64_t v7 = 4;
  }
  else
  {
    uint64_t v7 = 0;
  }
  if (*(double *)(a4 + 80) > 0.0)
  {
    id v8 = [objc_alloc((Class)TAUserActivity) initWithActivityType:v7 date:[NSDate dateWithTimeIntervalSinceReferenceDate:*(double *)(a4 + 80)]];
    [a1 ingestTAEventIfTAServiceRunning:v8];

    return;
  }
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_10232A4C8);
  }
  double v11 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "#ut received invalid motion timestamp", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    double v10 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onMotionStateNotification:data:]", "%s\n");
    goto LABEL_41;
  }
}

- (void)onClientManagerNotification:(int)a3 data:(uint64_t)a4
{
  if (a3)
  {
    if (a3 == 4)
    {
      a1[1162] = *(_DWORD *)(a4 + 188) != 0;
      id v6 = [objc_alloc((Class)TASystemState) initWithSystemStateType:8 isOn:[*(_DWORD *)(a4 + 188) == 1] date:[+[NSDate date](NSDate, "date")]];
      [a1 ingestTAEventIfTAServiceRunning:v6];

      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      uint64_t v7 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
      {
        int v8 = *(_DWORD *)(a4 + 188);
        *(_DWORD *)buf = 67174657;
        int v14 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "#ut received client status locationServiceEnabled: %{private}d", buf, 8u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419490 != -1) {
          dispatch_once(&qword_102419490, &stru_10232A4C8);
        }
        double v9 = (uint8_t *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onClientManagerNotification:data:]", "%s\n");
LABEL_24:
        if (v9 != buf) {
          free(v9);
        }
      }
    }
    else
    {
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      id v12 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "#ut, received unhandled location client manager notification", buf, 2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419490 != -1) {
          dispatch_once(&qword_102419490, &stru_10232A4C8);
        }
        double v9 = (uint8_t *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLTrackingAvoidanceService onClientManagerNotification:data:]", "%s\n");
        goto LABEL_24;
      }
    }
  }
  else
  {
    id v10 = [objc_alloc((Class)TASystemState) initWithSystemStateType:12 isOn:1 date:[NSDate date]];
    [a1 ingestTAEventIfTAServiceRunning:v10];

    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    double v11 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      int v14 = 0;
      __int16 v15 = 2082;
      unint64_t v16 = "";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received location and privacy reset notification\"}", buf, 0x12u);
    }
  }
}

- (void)onGnssNotification:(int)a3 data:(uint64_t)a4
{
  if (a3 == 13)
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    id v6 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(unsigned __int8 *)(a4 + 824);
      *(_DWORD *)buf = 68289282;
      int v12 = 0;
      __int16 v13 = 2082;
      int v14 = "";
      __int16 v15 = 2050;
      uint64_t v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut received location simulation event\", \"SimulationStatus\":%{public}ld}", buf, 0x1Cu);
    }
    id v8 = [objc_alloc((Class)TASystemState) initWithSystemStateType:9 isOn:*(unsigned __int8 *)(a4 + 824) date:[NSDate date]];
    [a1 ingestTAEventIfTAServiceRunning:v8];
  }
  else
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    double v9 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "#ut, received unhandled location notification", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      id v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLTrackingAvoidanceService onGnssNotification:data:]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
  }
}

- (void)onAggressiveScanStarted
{
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_10232A4C8);
  }
  id v3 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#ut received scan started", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    uint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onAggressiveScanStarted]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  id v4 = [objc_alloc((Class)TAAggressiveScanState) initWithState:2 date:[+[NSDate date](NSDate, "date")]];
  [(CLTrackingAvoidanceService *)self ingestTAEventIfTAServiceRunning:v4];
}

- (void)onAggressiveScanEnded
{
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_10232A4C8);
  }
  id v3 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#ut received scan ended", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    uint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onAggressiveScanEnded]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  id v4 = [objc_alloc((Class)TAAggressiveScanState) initWithState:1 date:[NSDate date]];
  [(CLTrackingAvoidanceService *)self ingestTAEventIfTAServiceRunning:v4];
}

- (void)onAdvertisementBufferEmptied
{
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_10232A4C8);
  }
  int v2 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "#ut received scan buffer emptied", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    id v3 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onAdvertisementBufferEmptied]", "%s\n", v3);
    if (v3 != (char *)buf) {
      free(v3);
    }
  }
}

- (id)clientIdentifier
{
  return @"CLTrackingAvoidanceService";
}

- (void)onNotOptedInBOMScanEnded
{
  if (_os_feature_enabled_impl())
  {
    bomScanManager = self->_bomScanManager;
    [(CLTrackingAvoidanceBOMScanManager *)bomScanManager scanCompleted];
  }
}

- (void)onDaemonStatusNotification:(int)a3 data:(int *)a4
{
  switch(a3)
  {
    case 0:
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      id v6 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "#ut received daemon status: initialize", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419490 != -1) {
          goto LABEL_97;
        }
        goto LABEL_43;
      }
      return;
    case 1:
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      uint64_t v7 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "#ut received daemon status: shutdown", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419490 != -1) {
          goto LABEL_97;
        }
        goto LABEL_43;
      }
      return;
    case 2:
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      id v8 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "#ut received daemon status: device sleep", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419490 != -1) {
          dispatch_once(&qword_102419490, &stru_10232A4C8);
        }
        uint64_t v26 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onDaemonStatusNotification:data:]", "%s\n", v26);
        if (v26 != (char *)buf) {
          free(v26);
        }
      }
      BOOL v9 = 0;
      goto LABEL_22;
    case 3:
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      double v11 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "#ut received daemon status: device awake", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419490 != -1) {
          dispatch_once(&qword_102419490, &stru_10232A4C8);
        }
        id v27 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onDaemonStatusNotification:data:]", "%s\n", v27);
        if (v27 != (char *)buf) {
          free(v27);
        }
        BOOL v9 = 1;
LABEL_22:
        uint64_t v10 = 1;
      }
      else
      {
        uint64_t v10 = 1;
        BOOL v9 = 1;
      }
      goto LABEL_70;
    case 6:
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      int v14 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
      {
        int v15 = *a4;
        int v16 = a4[1];
        *(_DWORD *)buf = 67174913;
        int v33 = v15;
        __int16 v34 = 1025;
        int v35 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "#ut received daemon status reachability change: %{private}d -> %{private}d", buf, 0xEu);
      }
      if (!sub_10013D1A0(115, 2)) {
        return;
      }
      bzero(buf, 0x65CuLL);
      if (qword_102419490 != -1) {
LABEL_97:
      }
        dispatch_once(&qword_102419490, &stru_10232A4C8);
LABEL_43:
      __int16 v13 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onDaemonStatusNotification:data:]", "%s\n");
      goto LABEL_44;
    case 8:
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      __int16 v17 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
      {
        int v18 = *(unsigned __int8 *)a4;
        *(_DWORD *)buf = 67174657;
        int v33 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "#ut received daemon status airplaneMode: %{private}d", buf, 8u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419490 != -1) {
          dispatch_once(&qword_102419490, &stru_10232A4C8);
        }
        id v28 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onDaemonStatusNotification:data:]", "%s\n", v28);
        if (v28 != (char *)buf) {
          free(v28);
        }
      }
      BOOL v9 = *(unsigned char *)a4 != 0;
      uint64_t v10 = 3;
      goto LABEL_70;
    case 10:
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      int v19 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
      {
        int v20 = *(unsigned __int8 *)a4;
        *(_DWORD *)buf = 67174657;
        int v33 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "#ut received daemon status displayOn: %{private}d", buf, 8u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419490 != -1) {
          dispatch_once(&qword_102419490, &stru_10232A4C8);
        }
        double v29 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onDaemonStatusNotification:data:]", "%s\n", v29);
        if (v29 != (char *)buf) {
          free(v29);
        }
      }
      BOOL v9 = *(unsigned char *)a4 != 0;
      uint64_t v10 = 2;
      goto LABEL_70;
    case 13:
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      id v21 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
      {
        int v22 = *a4;
        *(_DWORD *)buf = 67174657;
        int v33 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "#ut received daemon status thermalLevel: %{private}d", buf, 8u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419490 != -1) {
          dispatch_once(&qword_102419490, &stru_10232A4C8);
        }
        double v30 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onDaemonStatusNotification:data:]", "%s\n", v30);
        if (v30 != (char *)buf) {
          free(v30);
        }
      }
      BOOL v9 = *a4 > 9;
      uint64_t v10 = 7;
      goto LABEL_70;
    case 15:
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      id v23 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
      {
        int v24 = *(unsigned __int8 *)a4;
        *(_DWORD *)buf = 67174657;
        int v33 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "#ut received daemon status batterSaveMode: %{private}d", buf, 8u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419490 != -1) {
          dispatch_once(&qword_102419490, &stru_10232A4C8);
        }
        double v31 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onDaemonStatusNotification:data:]", "%s\n", v31);
        if (v31 != (char *)buf) {
          free(v31);
        }
      }
      BOOL v9 = *(unsigned char *)a4 != 0;
      uint64_t v10 = 4;
LABEL_70:
      id v25 = [objc_alloc((Class)TASystemState) initWithSystemStateType:v10 isOn:v9 date:[NSDate date]];
      [a1 ingestTAEventIfTAServiceRunning:v25];

      return;
    default:
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      int v12 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "#ut, received unhandled daemon status notification", buf, 2u);
      }
      if (!sub_10013D1A0(115, 0)) {
        return;
      }
      bzero(buf, 0x65CuLL);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      __int16 v13 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLTrackingAvoidanceService onDaemonStatusNotification:data:]", "%s\n");
LABEL_44:
      if (v13 != buf) {
        free(v13);
      }
      return;
  }
}

- (void)onWifiServiceNotification:(int)a3 data:(unsigned __int8 *)a4
{
  if (a3 == 1)
  {
    a1[1163] = *a4;
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    id v6 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
    {
      int v7 = *a4;
      *(_DWORD *)buf = 67174657;
      int v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "#ut received wifi service event - power state %{private}d", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      uint64_t v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onWifiServiceNotification:data:]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    id v8 = [objc_alloc((Class)TASystemState) initWithSystemStateType:6 isOn:*a4 date:[NSDate date]];
    [a1 ingestTAEventIfTAServiceRunning:v8];
  }
  else
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    BOOL v9 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "#ut, received unhandled wifi service notification", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      double v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLTrackingAvoidanceService onWifiServiceNotification:data:]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
  }
}

- (void)onBluetoothServiceNotification:(int)a3 data:(uint64_t)a4
{
  if (a3 == 9)
  {
    a1[1161] = *(unsigned char *)(a4 + 113);
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    id v6 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
    {
      int v7 = *(unsigned __int8 *)(a4 + 113);
      *(_DWORD *)buf = 67174657;
      int v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "#ut received bluetooth service event - power state %{private}d", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      uint64_t v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onBluetoothServiceNotification:data:]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    id v8 = [objc_alloc((Class)TASystemState) initWithSystemStateType:5 isOn:*(unsigned __int8 *)(a4 + 113) date:[NSDate date]];
    [a1 ingestTAEventIfTAServiceRunning:v8];
  }
  else
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    BOOL v9 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "#ut, received unhandled bluetooth service notification", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      double v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLTrackingAvoidanceService onBluetoothServiceNotification:data:]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
  }
}

- (uint64_t)onSignalEnvironmentNotification:(int)a3 data:(int)a4
{
  if (!a3)
  {
    uint64_t v5 = result;
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    id v6 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67174657;
      int v9 = a4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "#ut received signal environment event - value %{private}d", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      int v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onSignalEnvironmentNotification:data:]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
    *(_DWORD *)(v5 + 1136) = a4;
    return sub_100B7C26C(v5 + 224, a4);
  }
  return result;
}

- (void)onVehicleStateNotification
{
  [self universe].silo
  vehicleStateProxy = self->_vehicleStateProxy;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  _DWORD v4[2] = sub_1014D6EB0;
  v4[3] = &unk_1022D63D8;
  v4[4] = self;
  [(CLVehicleStateNotifierProtocol *)vehicleStateProxy fetchVehicularDndStateAndHintsAndOperatorStateWithReply:v4];
}

- (void)onDataProtectionNotification:(int)a3 data:(unint64_t)a4
{
  if (a3 == 1)
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    id v6 = qword_102419498;
    uint64_t v7 = HIDWORD(a4) & 1;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67174657;
      int v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "#ut received keybag unlock notification state:%{private}d", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      int v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onDataProtectionNotification:data:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
    id v8 = [objc_alloc((Class)TASystemState) initWithSystemStateType:11 isOn:v7 date:[NSDate date]];
    [a1 ingestTAEventIfTAServiceRunning:v8];
  }
}

- (void)onGeoCountryConfigurationChanged:(id)a3
{
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_10232A4C8);
  }
  uint64_t v5 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
  {
    v7[0] = 68289282;
    v7[1] = 0;
    __int16 v8 = 2082;
    int v9 = "";
    __int16 v10 = 2082;
    id v11 = [a3 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received country code\", \"CountryCode\":%{public, location:escape_only}s}", (uint8_t *)v7, 0x1Cu);
  }
  id v6 = [objc_alloc((Class)TASystemState) initWithSystemStateType:13 isOn:[a3 isEqualToString:@"KR"] date:[NSDate date]];
  [(CLTrackingAvoidanceService *)self ingestTAEventIfTAServiceRunning:v6];
}

- (void)handleNotificationMetrics:(id)a3
{
  p_metrics = &self->_metrics;
  id v10 = a3;
  uint64_t v5 = +[NSArray arrayWithObjects:&v10 count:1];
  double Current = CFAbsoluteTimeGetCurrent();
  sub_100B77BCC((uint64_t)p_metrics, v5, Current);
  id v7 = [a3 latestAdvertisement];
  id v8 = [a3 detectionMetrics];
  double v9 = CFAbsoluteTimeGetCurrent();
  sub_100B79FE8((uint64_t)p_metrics, v7, v8, v9);
}

- (void)notifyTAWithDeviceInformation:(id)a3 type:(unint64_t)a4 state:(unint64_t)a5 date:(id)a6
{
  id v7 = [objc_alloc((Class)TADeviceInformation) initWithTASPAdvertisement:a3 deviceType:a4 notificationState:a5 date:a6];
  [(CLTrackingAvoidanceService *)self ingestTAEventIfTAServiceRunning:v7];
}

- (BOOL)suspiciousDeviceContainsKoreaLocations:(id)a3
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [a3 locationHistory];
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    while (2)
    {
      id v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v8);
        zoneMonitor = self->_zoneMonitor;
        [v9 latitude];
        double v12 = v11;
        [v9 longitude];
        double v14 = v13;
        [v9 horizontalAccuracy];
        if ([(CLTrackingAvoidanceZoneMonitor *)zoneMonitor locationIsInZoneWithLatitude:v12 longitude:v14 horizontalAccuracy:v15])
        {
          LOBYTE(v5) = 1;
          return (char)v5;
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      id v6 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }
  return (char)v5;
}

- (void)trackingAvoidanceService:(id)a3 didFindSuspiciousDevices:(id)a4
{
  unsigned int v6 = [(CLTrackingAvoidanceService *)self shouldThrottleNotification];
  if (v6)
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    uint64_t v7 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ut notifications throttled", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      __int16 v24 = 0;
      long long v18 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService trackingAvoidanceService:didFindSuspiciousDevices:]", "%s\n", v18);
      if (v18 != (char *)buf) {
        free(v18);
      }
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = [a4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      double v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(a4);
        }
        double v12 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v11);
        if (v6)
        {
          [(CLTrackingAvoidanceService *)self handleNotificationMetrics:*(void *)(*((void *)&v20 + 1) + 8 * (void)v11)];
        }
        else if ([(CLTrackingAvoidanceService *)self suspiciousDeviceContainsKoreaLocations:*(void *)(*((void *)&v20 + 1) + 8 * (void)v11)])
        {
          -[CLTrackingAvoidanceService notifyTAWithDeviceInformation:type:state:date:](self, "notifyTAWithDeviceInformation:type:state:date:", [v12 latestAdvertisement], 0, 2, +[NSDate now](NSDate, "now"));
          double Current = CFAbsoluteTimeGetCurrent();
          sub_100B7BCD4((uint64_t)&self->_metrics, @"ContainsKoreaLocationsInDetection", Current);
        }
        else
        {
          id v14 = objc_alloc_init((Class)NSMutableSet);
          [v14 addObject:[CLTrackingAvoidanceService convert:andObservationAction:](CLTrackingAvoidanceService, "convert:andObservationAction:", v12, 1)];
          if (qword_102419490 != -1) {
            dispatch_once(&qword_102419490, &stru_10232A4C8);
          }
          double v15 = qword_102419498;
          if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
          {
            id v16 = [[[objc_msgSend(objc_msgSend(v12, "address"), "hexString") UTF8String];
            *(_DWORD *)buf = 68289283;
            int v27 = 0;
            __int16 v28 = 2082;
            double v29 = "";
            __int16 v30 = 2081;
            id v31 = v16;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut notifying SPD for suspicious device\", \"address\":%{private, location:escape_only}s}", buf, 0x1Cu);
          }
          SPOwnerSession = self->_SPOwnerSession;
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472;
          v19[2] = sub_1014D7B08;
          v19[3] = &unk_10232A3A8;
          v19[4] = self;
          v19[5] = v12;
          [SPOwnerSession didObserveUnauthorizedTrackingWithCompletion:v14 completion:v19];
        }
        double v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [a4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v9);
  }
}

+ (unint64_t)convertSPDetectedDeviceTypeToTADeviceType:(unint64_t)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return qword_101E0D258[a3];
  }
}

+ (id)convertSPTrackingAvoidanceErrorToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xB) {
    return @"UncategorizedError";
  }
  else {
    return off_10232A528[a3 - 1];
  }
}

+ (id)convertSPUnauthorizedTrackingObservationActionToString:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return @"Unknown";
  }
  else {
    return off_10232A588[a3];
  }
}

- (void)resolveAndUpdateTADeviceRecordStatusFor:(id)a3 withCompletion:(id)a4
{
  if (a3)
  {
    if (+[SPUnauthorizedTrackingAdvertisement instancesRespondToSelector:NSSelectorFromString(@"initWithAddress:advertisementData:status:reserved:rssi:scanDate:isPosh:networkID:")])
    {
      id v23 = [a3 performSelector:NSSelectorFromString(@"protocolID")];
      SEL v7 = NSSelectorFromString(@"isPosh");
      id v8 = +[NSInvocation invocationWithMethodSignature:](NSInvocation, "invocationWithMethodSignature:", [(id)objc_opt_class() instanceMethodSignatureForSelector:v7]);
      [(NSInvocation *)v8 setSelector:v7];
      [(NSInvocation *)v8 setTarget:a3];
      [(NSInvocation *)v8 invoke];
      unsigned __int8 v25 = 0;
      [(NSInvocation *)v8 getReturnValue:&v25];
      id v22 = objc_alloc((Class)SPUnauthorizedTrackingAdvertisement);
      id v9 = [a3 address];
      id v10 = [a3 advertisementData];
      id v11 = [a3 status];
      id v12 = [a3 reserved];
      id v13 = [a3 rssi];
      id v14 = [a3 scanDate];
      unsigned __int8 v15 = v23;
      int v16 = v25;
      if (v23) {
        unsigned __int8 v15 = [v23 intValue];
      }
      BYTE1(v21) = v15;
      LOBYTE(v21) = v16 != 0;
      id v17 = [v22 initWithAddress:v9 advertisementData:v10 status:v11 reserved:v12 rssi:v13 scanDate:v14 isPosh:v21];
    }
    else
    {
      id v17 = [objc_alloc((Class)SPUnauthorizedTrackingAdvertisement) initWithAddress:[a3 address] advertisementData:[a3 advertisementData] status:[a3 status] reserved:[a3 reserved] rssi:[a3 rssi] scanDate:[a3 scanDate]];
    }
    long long v19 = v17;
    SPOwnerSession = self->_SPOwnerSession;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1014D8338;
    v24[3] = &unk_10232A3F8;
    v24[4] = self;
    v24[5] = a3;
    v24[6] = a4;
    [SPOwnerSession unauthorizedTrackingTypeWithCompletion:v19 completion:v24];
  }
  else
  {
    long long v18 = (void (*)(id, void))*((void *)a4 + 2);
    v18(a4, 0);
  }
}

- (void)trackingAvoidanceService:(id)a3 requestingAdditionalInformation:(id)a4
{
  id v4 = a4;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v32 = [a4 countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v32)
  {
    uint64_t v6 = *(void *)v46;
    uint64_t v33 = TAOutgoingRequestsAdditionalScanningKey;
    uint64_t v31 = TAOutgoingRequestsInterVisitMetricsDonationKey;
    uint64_t v30 = TAOutgoingRequestsVisitMetricsDonationKey;
    uint64_t v27 = TAOutgoingRequestsAdditionalHawkeyeLowEnergyScanningKey;
    uint64_t v28 = *(void *)v46;
    id v29 = v4;
    while (2)
    {
      SEL v7 = 0;
      do
      {
        if (*(void *)v46 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v45 + 1) + 8 * (void)v7);
        if (objc_msgSend(objc_msgSend(v8, "key"), "isEqualToString:", v33))
        {
          [(CLTrackingAvoidanceService *)self requestScan];
        }
        else if (objc_msgSend(objc_msgSend(v8, "key"), "isEqualToString:", v31))
        {
          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          id v9 = [v8 additionalInformation];
          id v10 = [v9 countByEnumeratingWithState:&v41 objects:v51 count:16];
          if (v10)
          {
            id v11 = v10;
            uint64_t v12 = *(void *)v42;
LABEL_13:
            uint64_t v13 = 0;
            while (1)
            {
              if (*(void *)v42 != v12) {
                objc_enumerationMutation(v9);
              }
              id v14 = [objc_msgSend(v8, "additionalInformation") objectForKeyedSubscript:v41];
              id v15 = [v14 latestAdvertisement];
              if (!v15) {
                break;
              }
              v39[0] = _NSConcreteStackBlock;
              v39[1] = 3221225472;
              v39[2] = sub_1014D8CB4;
              v39[3] = &unk_10232A420;
              v39[4] = self;
              v39[5] = v15;
              v39[6] = v14;
              [(CLTrackingAvoidanceService *)self resolveAndUpdateTADeviceRecordStatusFor:v15 withCompletion:v39];
              if (v11 == (id)++v13)
              {
                id v11 = [v9 countByEnumeratingWithState:&v41 objects:v51 count:16];
                uint64_t v6 = v28;
                id v4 = v29;
                if (v11) {
                  goto LABEL_13;
                }
                goto LABEL_8;
              }
            }
            if (qword_102419490 != -1) {
              dispatch_once(&qword_102419490, &stru_10232A4C8);
            }
            __int16 v24 = qword_102419498;
            if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "#trackingAvoidanceService:requestingAdditionalInformation null advertisement", buf, 2u);
            }
            if (sub_10013D1A0(115, 0))
            {
              bzero(buf, 0x65CuLL);
              if (qword_102419490 != -1) {
                dispatch_once(&qword_102419490, &stru_10232A4C8);
              }
              __int16 v40 = 0;
              goto LABEL_51;
            }
            return;
          }
        }
        else if (objc_msgSend(objc_msgSend(v8, "key"), "isEqualToString:", v30))
        {
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          id v16 = [v8 additionalInformation];
          id v17 = [v16 countByEnumeratingWithState:&v35 objects:v49 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = *(void *)v36;
            while (2)
            {
              for (uint64_t i = 0; i != v18; uint64_t i = (char *)i + 1)
              {
                if (*(void *)v36 != v19) {
                  objc_enumerationMutation(v16);
                }
                id v21 = [objc_msgSend(v8, "additionalInformation") objectForKeyedSubscript:v35];
                id v22 = [v21 latestAdvertisement];
                if (!v22)
                {
                  if (qword_102419490 != -1) {
                    dispatch_once(&qword_102419490, &stru_10232A4C8);
                  }
                  unsigned __int8 v25 = qword_102419498;
                  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_FAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_FAULT, "#trackingAvoidanceService:requestingAdditionalInformation null advertisement", buf, 2u);
                  }
                  if (sub_10013D1A0(115, 0))
                  {
                    bzero(buf, 0x65CuLL);
                    if (qword_102419490 != -1) {
                      dispatch_once(&qword_102419490, &stru_10232A4C8);
                    }
                    __int16 v40 = 0;
LABEL_51:
                    uint64_t v26 = (char *)_os_log_send_and_compose_impl();
                    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLTrackingAvoidanceService trackingAvoidanceService:requestingAdditionalInformation:]", "%s\n", v26);
                    if (v26 != (char *)buf) {
                      free(v26);
                    }
                  }
                  return;
                }
                v34[0] = _NSConcreteStackBlock;
                v34[1] = 3221225472;
                _OWORD v34[2] = sub_1014D8E54;
                v34[3] = &unk_10232A420;
                v34[4] = self;
                v34[5] = v22;
                v34[6] = v21;
                [(CLTrackingAvoidanceService *)self resolveAndUpdateTADeviceRecordStatusFor:v22 withCompletion:v34];
              }
              id v18 = [v16 countByEnumeratingWithState:&v35 objects:v49 count:16];
              uint64_t v6 = v28;
              id v4 = v29;
              if (v18) {
                continue;
              }
              break;
            }
          }
        }
        else if (objc_msgSend(objc_msgSend(v8, "key"), "isEqualToString:", v27))
        {
          [(CLTrackingAvoidanceService *)self requestHawkeyeLowEnergyScan];
        }
LABEL_8:
        SEL v7 = (char *)v7 + 1;
      }
      while (v7 != v32);
      id v23 = [v4 countByEnumeratingWithState:&v45 objects:v52 count:16];
      id v32 = v23;
      if (v23) {
        continue;
      }
      break;
    }
  }
}

- (void)trackingAvoidanceService:(id)a3 didUpdateSuspiciousDevices:(id)a4
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [a4 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v17;
    *(void *)&long long v7 = 68289283;
    long long v15 = v7;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(a4);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v10);
        if (-[CLTrackingAvoidanceService suspiciousDeviceContainsKoreaLocations:](self, "suspiciousDeviceContainsKoreaLocations:", v11, v15))
        {
          double Current = CFAbsoluteTimeGetCurrent();
          sub_100B7BCD4((uint64_t)&self->_metrics, @"ContainsKoreaLocationsInUpdate", Current);
        }
        else
        {
          if (qword_102419490 != -1) {
            dispatch_once(&qword_102419490, &stru_10232A4C8);
          }
          uint64_t v13 = qword_102419498;
          if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
          {
            id v14 = [[[v11 address] hexString] UTF8String];
            *(_DWORD *)buf = v15;
            int v21 = 0;
            __int16 v22 = 2082;
            id v23 = "";
            __int16 v24 = 2081;
            id v25 = v14;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut notifying SPD for updates on new observations\", \"address\":%{private, location:escape_only}s}", buf, 0x1Cu);
          }
          [(CLTrackingAvoidanceService *)self submitUtObservationActionOfType:2 forDevice:v11];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [a4 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v8);
  }
}

- (void)trackingAvoidanceService:(id)a3 didStageSuspiciousDevices:(id)a4
{
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_10232A4C8);
  }
  id v5 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [a4 count];
    BOOL allowStagedDetectionNotification = self->_allowStagedDetectionNotification;
    *(_DWORD *)buf = 68289539;
    int v46 = 0;
    __int16 v47 = 2082;
    long long v48 = "";
    __int16 v49 = 2049;
    id v50 = v6;
    __int16 v51 = 1025;
    BOOL v52 = allowStagedDetectionNotification;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut got staged devices\", \"count\":%{private}lu, \"allowNotification\":%{private}hhd}", buf, 0x22u);
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v8 = [a4 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v39;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(a4);
        }
        id v11 = *(void **)(*((void *)&v38 + 1) + 8 * (void)v10);
        if ([(CLTrackingAvoidanceService *)self suspiciousDeviceContainsKoreaLocations:v11])
        {
          double Current = CFAbsoluteTimeGetCurrent();
          sub_100B7BCD4((uint64_t)&self->_metrics, @"ContainsKoreaLocationsInStaging", Current);
        }
        else
        {
          if (qword_102419490 != -1) {
            dispatch_once(&qword_102419490, &stru_10232A4C8);
          }
          uint64_t v13 = qword_102419498;
          if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
          {
            id v14 = [[[v11 address] hexString] UTF8String];
            *(_DWORD *)buf = 68289283;
            int v46 = 0;
            __int16 v47 = 2082;
            long long v48 = "";
            __int16 v49 = 2081;
            id v50 = v14;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut notifying SPD for staged suspicious device\", \"address\":%{private, location:escape_only}s}", buf, 0x1Cu);
          }
          [(CLTrackingAvoidanceService *)self submitUtObservationActionOfType:0 forDevice:v11];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [a4 countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v8);
  }
  if (self->_allowStagedDetectionNotification)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v15 = [a4 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v15)
    {
      uint64_t v28 = *(void *)v35;
      do
      {
        long long v16 = 0;
        do
        {
          if (*(void *)v35 != v28) {
            objc_enumerationMutation(a4);
          }
          long long v17 = *(void **)(*((void *)&v34 + 1) + 8 * (void)v16);
          sub_100134750(v32, (char *)[[[v17 address] hexString] UTF8String]);
          sub_100134750(__p, (char *)[v17 detectionSummary].description.UTF8String);
          id v18 = objc_alloc_init((Class)NSMutableDictionary);
          if (v33 >= 0) {
            long long v19 = v32;
          }
          else {
            long long v19 = (void **)v32[0];
          }
          [v18 setObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Staging UT for %@", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v19)), kCFUserNotificationAlertHeaderKey forKeyedSubscript];
          [v18 setObject:@"Tap-to-Radar" forKeyedSubscript:kCFUserNotificationAlternateButtonTitleKey];
          [v18 setObject:@"Dismiss" forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];
          if (v31 >= 0) {
            long long v20 = __p;
          }
          else {
            long long v20 = (void **)__p[0];
          }
          [v18 setObject:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v20) forKeyedSubscript:kCFUserNotificationAlertMessageKey];
          CFUserNotificationRef v21 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, 0, (CFDictionaryRef)v18);

          if (v21)
          {
            CFRetain(v21);
            RunLoopSource = CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, v21, (CFUserNotificationCallBack)sub_1014E3324, 0);
            if (RunLoopSource)
            {
              id v23 = (__CFRunLoop *)sub_1001C2710();
              CFRunLoopAddSource(v23, RunLoopSource, kCFRunLoopCommonModes);
              CFRelease(RunLoopSource);
              CFRelease(v21);
              goto LABEL_46;
            }
            if (qword_102419490 != -1) {
              dispatch_once(&qword_102419490, &stru_10232A4C8);
            }
            id v25 = qword_102419498;
            if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_FAULT, "Could not create runloop source for UT staged user notification", buf, 2u);
            }
            if (sub_10013D1A0(115, 0))
            {
              bzero(buf, 0x65CuLL);
              if (qword_102419490 == -1) {
                goto LABEL_53;
              }
LABEL_55:
              dispatch_once(&qword_102419490, &stru_10232A4C8);
LABEL_53:
              __int16 v42 = 0;
              uint64_t v26 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 0, "void displayStagedUTUserNotification(const std::string &, const std::string &)", "%s\n", v26);
              if (v26 != (char *)buf) {
                free(v26);
              }
            }
          }
          else
          {
            if (qword_102419490 != -1) {
              dispatch_once(&qword_102419490, &stru_10232A4C8);
            }
            __int16 v24 = qword_102419498;
            if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "Could not create UT staged user notification", buf, 2u);
            }
            if (sub_10013D1A0(115, 0))
            {
              bzero(buf, 0x65CuLL);
              if (qword_102419490 != -1) {
                goto LABEL_55;
              }
              goto LABEL_53;
            }
          }
LABEL_46:
          if (v31 < 0) {
            operator delete(__p[0]);
          }
          if (v33 < 0) {
            operator delete(v32[0]);
          }
          long long v16 = (char *)v16 + 1;
        }
        while (v15 != v16);
        id v27 = [a4 countByEnumeratingWithState:&v34 objects:v43 count:16];
        id v15 = v27;
      }
      while (v27);
    }
  }
}

- (void)trackingAvoidanceService:(id)a3 didUnstageSuspiciousDevices:(id)a4
{
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_10232A4C8);
  }
  id v6 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
  {
    uint64_t buf = 68289283;
    __int16 v23 = 2082;
    __int16 v24 = "";
    __int16 v25 = 2049;
    id v26 = [a4 count];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut got unstaged devices\", \"count\":%{private}lu}", (uint8_t *)&buf, 0x1Cu);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = [a4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v18;
    *(void *)&long long v8 = 68289283;
    long long v16 = v8;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(a4);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v11);
        if (-[CLTrackingAvoidanceService suspiciousDeviceContainsKoreaLocations:](self, "suspiciousDeviceContainsKoreaLocations:", v12, v16))
        {
          double Current = CFAbsoluteTimeGetCurrent();
          sub_100B7BCD4((uint64_t)&self->_metrics, @"ContainsKoreaLocationsInUnstaging", Current);
        }
        else
        {
          if (qword_102419490 != -1) {
            dispatch_once(&qword_102419490, &stru_10232A4C8);
          }
          id v14 = qword_102419498;
          if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
          {
            id v15 = [[[v12 address] hexString] UTF8String];
            uint64_t buf = v16;
            __int16 v23 = 2082;
            __int16 v24 = "";
            __int16 v25 = 2081;
            id v26 = v15;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut notifying SPD for unstaged suspicious device\", \"address\":%{private, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
          }
          [(CLTrackingAvoidanceService *)self submitUtObservationActionOfType:3 forDevice:v12];
        }
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [a4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

- (void)submitUtObservationActionOfType:(int64_t)a3 forDevice:(id)a4
{
  id v7 = objc_alloc_init((Class)NSMutableSet);
  [v7 addObject:+[CLTrackingAvoidanceService convert:andObservationAction:](CLTrackingAvoidanceService, "convert:andObservationAction:", a4, a3)];
  SPOwnerSession = self->_SPOwnerSession;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1014D9CF8;
  v9[3] = &unk_10232A448;
  v9[5] = a4;
  v9[6] = a3;
  v9[4] = self;
  [SPOwnerSession didObserveUnauthorizedTrackingWithCompletion:v7 completion:v9];
}

- (void)trackingAvoidanceService:(id)a3 didRequestAIS:(id)a4
{
}

- (void)cancelAISFetchTimeoutForDevice:(id)a3
{
  if (-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:"))
  {
    id v5 = [[-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:", a3) timoutBlock];
    if (v5)
    {
      id v6 = v5;
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      id v7 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
      {
        v8[0] = 68289539;
        v8[1] = 0;
        __int16 v9 = 2082;
        uint64_t v10 = "";
        __int16 v11 = 2113;
        id v12 = a3;
        __int16 v13 = 1026;
        int v14 = 1;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut AIS fetch cancelling timeout\", \"uuid\":%{private, location:escape_only}@, \"scheduledBlock\":%{public}hhd}", (uint8_t *)v8, 0x22u);
      }
      dispatch_block_cancel(v6);
    }
  }
}

- (void)scheduleAISFetchTimeoutForDevice:(id)a3
{
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_10232A4C8);
  }
  id v5 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289283;
    int v10 = 0;
    __int16 v11 = 2082;
    id v12 = "";
    __int16 v13 = 2113;
    id v14 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut AIS fetch scheduling timeout\", \"uuid\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  [(CLTrackingAvoidanceService *)self cancelAISFetchTimeoutForDevice:a3];
  dispatch_time_t v6 = dispatch_time(0, 605000000000);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  _DWORD v8[2] = sub_1014DA514;
  v8[3] = &unk_10229FEB0;
  v8[4] = self;
  v8[5] = a3;
  dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, v8);
  [self->_settingsSubscription.__ptr_.__value_ objectForKey:a3].setTimoutBlock:v7;
  dispatch_after(v6, (dispatch_queue_t)[objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "silo") queue], v7);
  _Block_release(v7);
}

- (void)didFetchHawkeyeAISProductDataFromDevice:(id)a3 productData:(id)a4 error:(id)a5
{
  if (-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:"))
  {
    id v9 = [(CLXOTASubscription *)self->_settingsSubscription.__ptr_.__value_ objectForKey:a3];
    dispatch_group_leave((dispatch_group_t)[v9 fetchGroup]);
    if (a5)
    {
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      int v10 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
      {
        int v15 = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        long long v18 = "";
        __int16 v19 = 2113;
        id v20 = a3;
        __int16 v21 = 2113;
        id v22 = a5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ut fails to receive AIS productData\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
        if (qword_102419490 != -1) {
          dispatch_once(&qword_102419490, &stru_10232A4C8);
        }
      }
      __int16 v11 = qword_102419498;
      if (os_signpost_enabled((os_log_t)qword_102419498))
      {
        int v15 = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        long long v18 = "";
        __int16 v19 = 2113;
        id v20 = a3;
        __int16 v21 = 2113;
        id v22 = a5;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#ut fails to receive AIS productData", "{\"msg%{public}.0s\":\"#ut fails to receive AIS productData\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
      [v9 setAllSuccess:0];
    }
    else
    {
      [objc_msgSend(v9, "accessoryInfo") setProductData:a4];
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      id v14 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        long long v18 = "";
        __int16 v19 = 2113;
        id v20 = a3;
        __int16 v21 = 2113;
        id v22 = a4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received AIS productData\", \"uuid\":%{private, location:escape_only}@, \"productData\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
    }
  }
  else
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    id v12 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
    {
      int v15 = 68289283;
      int v16 = 0;
      __int16 v17 = 2082;
      long long v18 = "";
      __int16 v19 = 2113;
      id v20 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ut received AIS productData for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
    }
    __int16 v13 = qword_102419498;
    if (os_signpost_enabled((os_log_t)qword_102419498))
    {
      int v15 = 68289283;
      int v16 = 0;
      __int16 v17 = 2082;
      long long v18 = "";
      __int16 v19 = 2113;
      id v20 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#ut received AIS productData for unknown device", "{\"msg%{public}.0s\":\"#ut received AIS productData for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
    }
  }
}

- (void)didFetchHawkeyeAISManufacturerNameFromDevice:(id)a3 manufacturerName:(id)a4 error:(id)a5
{
  if (-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:"))
  {
    id v9 = [(CLXOTASubscription *)self->_settingsSubscription.__ptr_.__value_ objectForKey:a3];
    dispatch_group_leave((dispatch_group_t)[v9 fetchGroup]);
    if (a5)
    {
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      int v10 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
      {
        int v15 = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        long long v18 = "";
        __int16 v19 = 2113;
        id v20 = a3;
        __int16 v21 = 2113;
        id v22 = a5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ut fails to receive AIS manufacturer name\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
        if (qword_102419490 != -1) {
          dispatch_once(&qword_102419490, &stru_10232A4C8);
        }
      }
      __int16 v11 = qword_102419498;
      if (os_signpost_enabled((os_log_t)qword_102419498))
      {
        int v15 = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        long long v18 = "";
        __int16 v19 = 2113;
        id v20 = a3;
        __int16 v21 = 2113;
        id v22 = a5;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#ut fails to receive AIS manufacturer name", "{\"msg%{public}.0s\":\"#ut fails to receive AIS manufacturer name\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
      [v9 setAllSuccess:0];
    }
    else
    {
      [objc_msgSend(v9, "accessoryInfo") setManufacturerName:a4];
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      id v14 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        long long v18 = "";
        __int16 v19 = 2113;
        id v20 = a3;
        __int16 v21 = 2113;
        id v22 = a4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received AIS manufacturer name\", \"uuid\":%{private, location:escape_only}@, \"manufacturerName\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
    }
  }
  else
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    id v12 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
    {
      int v15 = 68289283;
      int v16 = 0;
      __int16 v17 = 2082;
      long long v18 = "";
      __int16 v19 = 2113;
      id v20 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ut received AIS manufacturer name for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
    }
    __int16 v13 = qword_102419498;
    if (os_signpost_enabled((os_log_t)qword_102419498))
    {
      int v15 = 68289283;
      int v16 = 0;
      __int16 v17 = 2082;
      long long v18 = "";
      __int16 v19 = 2113;
      id v20 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#ut received AIS manufacturer name for unknown device", "{\"msg%{public}.0s\":\"#ut received AIS manufacturer name for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
    }
  }
}

- (void)didFetchHawkeyeAISModelNameFromDevice:(id)a3 modelName:(id)a4 error:(id)a5
{
  if (-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:"))
  {
    id v9 = [(CLXOTASubscription *)self->_settingsSubscription.__ptr_.__value_ objectForKey:a3];
    dispatch_group_leave((dispatch_group_t)[v9 fetchGroup]);
    if (a5)
    {
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      int v10 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
      {
        int v15 = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        long long v18 = "";
        __int16 v19 = 2113;
        id v20 = a3;
        __int16 v21 = 2113;
        id v22 = a5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ut fails to receive AIS model name\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
        if (qword_102419490 != -1) {
          dispatch_once(&qword_102419490, &stru_10232A4C8);
        }
      }
      __int16 v11 = qword_102419498;
      if (os_signpost_enabled((os_log_t)qword_102419498))
      {
        int v15 = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        long long v18 = "";
        __int16 v19 = 2113;
        id v20 = a3;
        __int16 v21 = 2113;
        id v22 = a5;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#ut fails to receive AIS model name", "{\"msg%{public}.0s\":\"#ut fails to receive AIS model name\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
      [v9 setAllSuccess:0];
    }
    else
    {
      [objc_msgSend(v9, "accessoryInfo") setModelName:a4];
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      id v14 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        long long v18 = "";
        __int16 v19 = 2113;
        id v20 = a3;
        __int16 v21 = 2113;
        id v22 = a4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received AIS model name\", \"uuid\":%{private, location:escape_only}@, \"modelName\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
    }
  }
  else
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    id v12 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
    {
      int v15 = 68289283;
      int v16 = 0;
      __int16 v17 = 2082;
      long long v18 = "";
      __int16 v19 = 2113;
      id v20 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ut received AIS model name for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
    }
    __int16 v13 = qword_102419498;
    if (os_signpost_enabled((os_log_t)qword_102419498))
    {
      int v15 = 68289283;
      int v16 = 0;
      __int16 v17 = 2082;
      long long v18 = "";
      __int16 v19 = 2113;
      id v20 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#ut received AIS model name for unknown device", "{\"msg%{public}.0s\":\"#ut received AIS model name for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
    }
  }
}

- (void)didFetchFirmwareVersion:(id)a3 fromTag:(id)a4 withError:(id)a5
{
  if ([(CLXOTASubscription *)self->_settingsSubscription.__ptr_.__value_ objectForKey:a4])
  {
    id v9 = [(CLXOTASubscription *)self->_settingsSubscription.__ptr_.__value_ objectForKey:a4];
    dispatch_group_leave((dispatch_group_t)[v9 fetchGroup]);
    if (a5)
    {
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      int v10 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
      {
        int v15 = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        long long v18 = "";
        __int16 v19 = 2113;
        id v20 = a4;
        __int16 v21 = 2113;
        id v22 = a5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ut fails to receive AIS firmware version\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
        if (qword_102419490 != -1) {
          dispatch_once(&qword_102419490, &stru_10232A4C8);
        }
      }
      __int16 v11 = qword_102419498;
      if (os_signpost_enabled((os_log_t)qword_102419498))
      {
        int v15 = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        long long v18 = "";
        __int16 v19 = 2113;
        id v20 = a4;
        __int16 v21 = 2113;
        id v22 = a5;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#ut fails to receive AIS firmware version", "{\"msg%{public}.0s\":\"#ut fails to receive AIS firmware version\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
      [v9 setAllSuccess:0];
    }
    else
    {
      [objc_msgSend(v9, "accessoryInfo") setFirmwareVersion:a3];
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      id v14 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        long long v18 = "";
        __int16 v19 = 2113;
        id v20 = a4;
        __int16 v21 = 2113;
        id v22 = a3;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received AIS firmware version\", \"uuid\":%{private, location:escape_only}@, \"firmwareVersion\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
    }
  }
  else
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    id v12 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
    {
      int v15 = 68289283;
      int v16 = 0;
      __int16 v17 = 2082;
      long long v18 = "";
      __int16 v19 = 2113;
      id v20 = a4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ut received AIS firmware version for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
    }
    __int16 v13 = qword_102419498;
    if (os_signpost_enabled((os_log_t)qword_102419498))
    {
      int v15 = 68289283;
      int v16 = 0;
      __int16 v17 = 2082;
      long long v18 = "";
      __int16 v19 = 2113;
      id v20 = a4;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#ut received AIS firmware version for unknown device", "{\"msg%{public}.0s\":\"#ut received AIS firmware version for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
    }
  }
}

- (void)didFetchHawkeyeAISAccessoryCategoryFromDevice:(id)a3 accessoryCategory:(id)a4 error:(id)a5
{
  if (-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:"))
  {
    id v9 = [(CLXOTASubscription *)self->_settingsSubscription.__ptr_.__value_ objectForKey:a3];
    dispatch_group_leave((dispatch_group_t)[v9 fetchGroup]);
    if (a5)
    {
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      int v10 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
      {
        int v15 = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        long long v18 = "";
        __int16 v19 = 2113;
        id v20 = a3;
        __int16 v21 = 2113;
        id v22 = a5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ut fails to receive AIS accessory category\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
        if (qword_102419490 != -1) {
          dispatch_once(&qword_102419490, &stru_10232A4C8);
        }
      }
      __int16 v11 = qword_102419498;
      if (os_signpost_enabled((os_log_t)qword_102419498))
      {
        int v15 = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        long long v18 = "";
        __int16 v19 = 2113;
        id v20 = a3;
        __int16 v21 = 2113;
        id v22 = a5;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#ut fails to receive AIS accessory category", "{\"msg%{public}.0s\":\"#ut fails to receive AIS accessory category\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
      [v9 setAllSuccess:0];
    }
    else
    {
      [objc_msgSend(v9, "accessoryInfo") setAccessoryCategory:a4];
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      id v14 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        long long v18 = "";
        __int16 v19 = 2113;
        id v20 = a3;
        __int16 v21 = 2113;
        id v22 = a4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received AIS accessory category\", \"uuid\":%{private, location:escape_only}@, \"accessoryCategory\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
    }
  }
  else
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    id v12 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
    {
      int v15 = 68289283;
      int v16 = 0;
      __int16 v17 = 2082;
      long long v18 = "";
      __int16 v19 = 2113;
      id v20 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ut received AIS accessory category for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
    }
    __int16 v13 = qword_102419498;
    if (os_signpost_enabled((os_log_t)qword_102419498))
    {
      int v15 = 68289283;
      int v16 = 0;
      __int16 v17 = 2082;
      long long v18 = "";
      __int16 v19 = 2113;
      id v20 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#ut received AIS accessory category for unknown device", "{\"msg%{public}.0s\":\"#ut received AIS accessory category for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
    }
  }
}

- (void)didFetchHawkeyeAISAccessoryCapabilitiesFromDevice:(id)a3 accessoryCapabilities:(id)a4 error:(id)a5
{
  if (-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:"))
  {
    id v9 = [(CLXOTASubscription *)self->_settingsSubscription.__ptr_.__value_ objectForKey:a3];
    dispatch_group_leave((dispatch_group_t)[v9 fetchGroup]);
    if (a5)
    {
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      int v10 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
      {
        int v15 = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        long long v18 = "";
        __int16 v19 = 2113;
        id v20 = a3;
        __int16 v21 = 2113;
        id v22 = a5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ut fails to receive AIS accessory capabilities\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
        if (qword_102419490 != -1) {
          dispatch_once(&qword_102419490, &stru_10232A4C8);
        }
      }
      __int16 v11 = qword_102419498;
      if (os_signpost_enabled((os_log_t)qword_102419498))
      {
        int v15 = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        long long v18 = "";
        __int16 v19 = 2113;
        id v20 = a3;
        __int16 v21 = 2113;
        id v22 = a5;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#ut fails to receive AIS accessory capabilities", "{\"msg%{public}.0s\":\"#ut fails to receive AIS accessory capabilities\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
      [v9 setAllSuccess:0];
    }
    else
    {
      [objc_msgSend(v9, "accessoryInfo") setAccessoryCapabilities:a4];
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      id v14 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        long long v18 = "";
        __int16 v19 = 2113;
        id v20 = a3;
        __int16 v21 = 2113;
        id v22 = a4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received AIS accessory capabilities\", \"uuid\":%{private, location:escape_only}@, \"accessoryCapabilities\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
    }
  }
  else
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    id v12 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
    {
      int v15 = 68289283;
      int v16 = 0;
      __int16 v17 = 2082;
      long long v18 = "";
      __int16 v19 = 2113;
      id v20 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ut received AIS accessory capabilities for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
    }
    __int16 v13 = qword_102419498;
    if (os_signpost_enabled((os_log_t)qword_102419498))
    {
      int v15 = 68289283;
      int v16 = 0;
      __int16 v17 = 2082;
      long long v18 = "";
      __int16 v19 = 2113;
      id v20 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#ut received AIS accessory capabilities for unknown device", "{\"msg%{public}.0s\":\"#ut received AIS accessory capabilities for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
    }
  }
}

- (void)didFetchAISProductDataFromDevice:(id)a3 productData:(id)a4 error:(id)a5
{
  if (-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:"))
  {
    id v9 = [(CLXOTASubscription *)self->_settingsSubscription.__ptr_.__value_ objectForKey:a3];
    dispatch_group_leave((dispatch_group_t)[v9 fetchGroup]);
    if (a5)
    {
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      int v10 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
      {
        int v15 = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        long long v18 = "";
        __int16 v19 = 2113;
        id v20 = a3;
        __int16 v21 = 2113;
        id v22 = a5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS productData\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
        if (qword_102419490 != -1) {
          dispatch_once(&qword_102419490, &stru_10232A4C8);
        }
      }
      __int16 v11 = qword_102419498;
      if (os_signpost_enabled((os_log_t)qword_102419498))
      {
        int v15 = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        long long v18 = "";
        __int16 v19 = 2113;
        id v20 = a3;
        __int16 v21 = 2113;
        id v22 = a5;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#posh #ut fails to receive AIS productData", "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS productData\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
      [v9 setAllSuccess:0];
    }
    else
    {
      [objc_msgSend(v9, "accessoryInfo") setProductData:a4];
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      id v14 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        long long v18 = "";
        __int16 v19 = 2113;
        id v20 = a3;
        __int16 v21 = 2113;
        id v22 = a4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#posh #ut received AIS productData\", \"uuid\":%{private, location:escape_only}@, \"productData\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
    }
  }
  else
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    id v12 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
    {
      int v15 = 68289283;
      int v16 = 0;
      __int16 v17 = 2082;
      long long v18 = "";
      __int16 v19 = 2113;
      id v20 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut received AIS productData for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
    }
    __int16 v13 = qword_102419498;
    if (os_signpost_enabled((os_log_t)qword_102419498))
    {
      int v15 = 68289283;
      int v16 = 0;
      __int16 v17 = 2082;
      long long v18 = "";
      __int16 v19 = 2113;
      id v20 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#posh #ut received AIS productData for unknown device", "{\"msg%{public}.0s\":\"#posh #ut received AIS productData for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
    }
  }
}

- (void)didFetchAISManufacturerNameFromDevice:(id)a3 manufacturerName:(id)a4 error:(id)a5
{
  if (-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:"))
  {
    id v9 = [(CLXOTASubscription *)self->_settingsSubscription.__ptr_.__value_ objectForKey:a3];
    dispatch_group_leave((dispatch_group_t)[v9 fetchGroup]);
    if (a5)
    {
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      int v10 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
      {
        int v15 = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        long long v18 = "";
        __int16 v19 = 2113;
        id v20 = a3;
        __int16 v21 = 2113;
        id v22 = a5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS manufacturerName\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
        if (qword_102419490 != -1) {
          dispatch_once(&qword_102419490, &stru_10232A4C8);
        }
      }
      __int16 v11 = qword_102419498;
      if (os_signpost_enabled((os_log_t)qword_102419498))
      {
        int v15 = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        long long v18 = "";
        __int16 v19 = 2113;
        id v20 = a3;
        __int16 v21 = 2113;
        id v22 = a5;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#posh #ut fails to receive AIS manufacturerName", "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS manufacturerName\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
      [v9 setAllSuccess:0];
    }
    else
    {
      [objc_msgSend(v9, "accessoryInfo") setManufacturerName:a4];
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      id v14 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        long long v18 = "";
        __int16 v19 = 2113;
        id v20 = a3;
        __int16 v21 = 2113;
        id v22 = a4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#posh #ut received AIS manufacturerName\", \"uuid\":%{private, location:escape_only}@, \"manufacturerName\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
    }
  }
  else
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    id v12 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
    {
      int v15 = 68289283;
      int v16 = 0;
      __int16 v17 = 2082;
      long long v18 = "";
      __int16 v19 = 2113;
      id v20 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut received AIS manufacturerName for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
    }
    __int16 v13 = qword_102419498;
    if (os_signpost_enabled((os_log_t)qword_102419498))
    {
      int v15 = 68289283;
      int v16 = 0;
      __int16 v17 = 2082;
      long long v18 = "";
      __int16 v19 = 2113;
      id v20 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#posh #ut received AIS manufacturerName for unknown device", "{\"msg%{public}.0s\":\"#posh #ut received AIS manufacturerName for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
    }
  }
}

- (void)didFetchAISModelNameFromDevice:(id)a3 modelName:(id)a4 error:(id)a5
{
  if (-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:"))
  {
    id v9 = [(CLXOTASubscription *)self->_settingsSubscription.__ptr_.__value_ objectForKey:a3];
    dispatch_group_leave((dispatch_group_t)[v9 fetchGroup]);
    if (a5)
    {
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      int v10 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
      {
        int v15 = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        long long v18 = "";
        __int16 v19 = 2113;
        id v20 = a3;
        __int16 v21 = 2113;
        id v22 = a5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS modelName\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
        if (qword_102419490 != -1) {
          dispatch_once(&qword_102419490, &stru_10232A4C8);
        }
      }
      __int16 v11 = qword_102419498;
      if (os_signpost_enabled((os_log_t)qword_102419498))
      {
        int v15 = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        long long v18 = "";
        __int16 v19 = 2113;
        id v20 = a3;
        __int16 v21 = 2113;
        id v22 = a5;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#posh #ut fails to receive AIS modelName", "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS modelName\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
      [v9 setAllSuccess:0];
    }
    else
    {
      [objc_msgSend(v9, "accessoryInfo") setModelName:a4];
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      id v14 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        long long v18 = "";
        __int16 v19 = 2113;
        id v20 = a3;
        __int16 v21 = 2113;
        id v22 = a4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#posh #ut received AIS modelName\", \"uuid\":%{private, location:escape_only}@, \"modelName\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
    }
  }
  else
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    id v12 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
    {
      int v15 = 68289283;
      int v16 = 0;
      __int16 v17 = 2082;
      long long v18 = "";
      __int16 v19 = 2113;
      id v20 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut received AIS modelName for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
    }
    __int16 v13 = qword_102419498;
    if (os_signpost_enabled((os_log_t)qword_102419498))
    {
      int v15 = 68289283;
      int v16 = 0;
      __int16 v17 = 2082;
      long long v18 = "";
      __int16 v19 = 2113;
      id v20 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#posh #ut received AIS modelName for unknown device", "{\"msg%{public}.0s\":\"#posh #ut received AIS modelName for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
    }
  }
}

- (void)didFetchAISProtocolImplementationFromDevice:(id)a3 protocolImplementation:(unsigned int)a4 error:(id)a5
{
  if (-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:"))
  {
    id v9 = [(CLXOTASubscription *)self->_settingsSubscription.__ptr_.__value_ objectForKey:a3];
    dispatch_group_leave((dispatch_group_t)[v9 fetchGroup]);
    if (a5)
    {
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      int v10 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
      {
        int v16 = 68289539;
        int v17 = 0;
        __int16 v18 = 2082;
        __int16 v19 = "";
        __int16 v20 = 2113;
        id v21 = a3;
        __int16 v22 = 2113;
        id v23 = a5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS protocolImplementation\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v16, 0x26u);
        if (qword_102419490 != -1) {
          dispatch_once(&qword_102419490, &stru_10232A4C8);
        }
      }
      __int16 v11 = qword_102419498;
      if (os_signpost_enabled((os_log_t)qword_102419498))
      {
        int v16 = 68289539;
        int v17 = 0;
        __int16 v18 = 2082;
        __int16 v19 = "";
        __int16 v20 = 2113;
        id v21 = a3;
        __int16 v22 = 2113;
        id v23 = a5;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#posh #ut fails to receive AIS protocolImplementation", "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS protocolImplementation\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v16, 0x26u);
      }
      [v9 setAllSuccess:0];
      return;
    }
    NSSelectorFromString(@"protocolImplementation");
    [v9 accessoryInfo];
    if (objc_opt_respondsToSelector())
    {
      [objc_msgSend(v9, "accessoryInfo") setProtocolImplementation:a4];
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      id v14 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
      {
        int v16 = 68289539;
        int v17 = 0;
        __int16 v18 = 2082;
        __int16 v19 = "";
        __int16 v20 = 2113;
        id v21 = a3;
        __int16 v22 = 2049;
        id v23 = (id)a4;
        int v15 = "{\"msg%{public}.0s\":\"#posh #ut received AIS protocolImplementation\", \"uuid\":%{private, location:escap"
              "e_only}@, \"protocolImplementation\":%{private}ld}";
LABEL_27:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, v15, (uint8_t *)&v16, 0x26u);
      }
    }
    else
    {
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      id v14 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
      {
        int v16 = 68289539;
        int v17 = 0;
        __int16 v18 = 2082;
        __int16 v19 = "";
        __int16 v20 = 2113;
        id v21 = a3;
        __int16 v22 = 2049;
        id v23 = (id)a4;
        int v15 = "{\"msg%{public}.0s\":\"#posh #ut AIS protocolImplementation not sent to TA\", \"uuid\":%{private, location"
              ":escape_only}@, \"protocolImplementation\":%{private}ld}";
        goto LABEL_27;
      }
    }
  }
  else
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    id v12 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
    {
      int v16 = 68289283;
      int v17 = 0;
      __int16 v18 = 2082;
      __int16 v19 = "";
      __int16 v20 = 2113;
      id v21 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut received AIS protocolImplementation for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v16, 0x1Cu);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
    }
    __int16 v13 = qword_102419498;
    if (os_signpost_enabled((os_log_t)qword_102419498))
    {
      int v16 = 68289283;
      int v17 = 0;
      __int16 v18 = 2082;
      __int16 v19 = "";
      __int16 v20 = 2113;
      id v21 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#posh #ut received AIS protocolImplementation for unknown device", "{\"msg%{public}.0s\":\"#posh #ut received AIS protocolImplementation for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v16, 0x1Cu);
    }
  }
}

- (void)didFetchAISAccessoryCategoryFromDevice:(id)a3 accessoryCategory:(unsigned __int8)a4 error:(id)a5
{
  unsigned __int8 v15 = a4;
  if (-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:"))
  {
    id v8 = [(CLXOTASubscription *)self->_settingsSubscription.__ptr_.__value_ objectForKey:a3];
    dispatch_group_leave((dispatch_group_t)[v8 fetchGroup]);
    if (a5)
    {
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      id v9 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t buf = 68289539;
        int v17 = 0;
        __int16 v18 = 2082;
        __int16 v19 = "";
        __int16 v20 = 2113;
        id v21 = a3;
        __int16 v22 = 2113;
        id v23 = a5;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS accessory accessoryCategory\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", buf, 0x26u);
        if (qword_102419490 != -1) {
          dispatch_once(&qword_102419490, &stru_10232A4C8);
        }
      }
      int v10 = qword_102419498;
      if (os_signpost_enabled((os_log_t)qword_102419498))
      {
        *(_DWORD *)uint64_t buf = 68289539;
        int v17 = 0;
        __int16 v18 = 2082;
        __int16 v19 = "";
        __int16 v20 = 2113;
        id v21 = a3;
        __int16 v22 = 2113;
        id v23 = a5;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#posh #ut fails to receive AIS accessory accessoryCategory", "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS accessory accessoryCategory\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", buf, 0x26u);
      }
      [v8 setAllSuccess:0];
    }
    else
    {
      [objc_msgSend(v8, "accessoryInfo") setAccessoryCategory:[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v15, 1)];
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      __int16 v13 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
      {
        id v14 = [objc_msgSend(v8, "accessoryInfo") accessoryCategory];
        *(_DWORD *)uint64_t buf = 68289539;
        int v17 = 0;
        __int16 v18 = 2082;
        __int16 v19 = "";
        __int16 v20 = 2113;
        id v21 = a3;
        __int16 v22 = 2113;
        id v23 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#posh #ut received AIS accessory category\", \"uuid\":%{private, location:escape_only}@, \"accessoryCategory\":%{private, location:escape_only}@}", buf, 0x26u);
      }
    }
  }
  else
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    __int16 v11 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 68289283;
      int v17 = 0;
      __int16 v18 = 2082;
      __int16 v19 = "";
      __int16 v20 = 2113;
      id v21 = a3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut received AIS accessory capabilities for unknown device\", \"uuid\":%{private, location:escape_only}@}", buf, 0x1Cu);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
    }
    id v12 = qword_102419498;
    if (os_signpost_enabled((os_log_t)qword_102419498))
    {
      *(_DWORD *)uint64_t buf = 68289283;
      int v17 = 0;
      __int16 v18 = 2082;
      __int16 v19 = "";
      __int16 v20 = 2113;
      id v21 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#posh #ut received AIS accessory capabilities for unknown device", "{\"msg%{public}.0s\":\"#posh #ut received AIS accessory capabilities for unknown device\", \"uuid\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
  }
}

- (void)didFetchAISAccessoryCapabilitiesFromDevice:(id)a3 accessoryCapabilities:(id)a4 error:(id)a5
{
  if (-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:"))
  {
    id v9 = [(CLXOTASubscription *)self->_settingsSubscription.__ptr_.__value_ objectForKey:a3];
    dispatch_group_leave((dispatch_group_t)[v9 fetchGroup]);
    if (a5)
    {
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      int v10 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
      {
        int v15 = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        __int16 v18 = "";
        __int16 v19 = 2113;
        id v20 = a3;
        __int16 v21 = 2113;
        id v22 = a5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS accessory capabilities\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
        if (qword_102419490 != -1) {
          dispatch_once(&qword_102419490, &stru_10232A4C8);
        }
      }
      __int16 v11 = qword_102419498;
      if (os_signpost_enabled((os_log_t)qword_102419498))
      {
        int v15 = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        __int16 v18 = "";
        __int16 v19 = 2113;
        id v20 = a3;
        __int16 v21 = 2113;
        id v22 = a5;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#posh #ut fails to receive AIS accessory capabilities", "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS accessory capabilities\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
      [v9 setAllSuccess:0];
    }
    else
    {
      [objc_msgSend(v9, "accessoryInfo") setAccessoryCapabilities:a4];
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      id v14 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        __int16 v18 = "";
        __int16 v19 = 2113;
        id v20 = a3;
        __int16 v21 = 2113;
        id v22 = a4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#posh #ut received AIS accessory capabilities\", \"uuid\":%{private, location:escape_only}@, \"accessoryCapabilities\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
    }
  }
  else
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    id v12 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
    {
      int v15 = 68289283;
      int v16 = 0;
      __int16 v17 = 2082;
      __int16 v18 = "";
      __int16 v19 = 2113;
      id v20 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut received AIS accessory capabilities for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
    }
    __int16 v13 = qword_102419498;
    if (os_signpost_enabled((os_log_t)qword_102419498))
    {
      int v15 = 68289283;
      int v16 = 0;
      __int16 v17 = 2082;
      __int16 v18 = "";
      __int16 v19 = 2113;
      id v20 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#posh #ut received AIS accessory capabilities for unknown device", "{\"msg%{public}.0s\":\"#posh #ut received AIS accessory capabilities for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
    }
  }
}

- (void)didFetchAISNetworkIDFromDevice:(id)a3 networkID:(unsigned __int8)a4 error:(id)a5
{
  uint64_t v6 = a4;
  if (-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:"))
  {
    id v9 = [(CLXOTASubscription *)self->_settingsSubscription.__ptr_.__value_ objectForKey:a3];
    dispatch_group_leave((dispatch_group_t)[v9 fetchGroup]);
    if (a5)
    {
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      int v10 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
      {
        int v16 = 68289539;
        int v17 = 0;
        __int16 v18 = 2082;
        __int16 v19 = "";
        __int16 v20 = 2113;
        id v21 = a3;
        __int16 v22 = 2113;
        unint64_t v23 = (unint64_t)a5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS networkID\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v16, 0x26u);
        if (qword_102419490 != -1) {
          dispatch_once(&qword_102419490, &stru_10232A4C8);
        }
      }
      __int16 v11 = qword_102419498;
      if (os_signpost_enabled((os_log_t)qword_102419498))
      {
        int v16 = 68289539;
        int v17 = 0;
        __int16 v18 = 2082;
        __int16 v19 = "";
        __int16 v20 = 2113;
        id v21 = a3;
        __int16 v22 = 2113;
        unint64_t v23 = (unint64_t)a5;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#posh #ut fails to receive AIS networkID", "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS networkID\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v16, 0x26u);
      }
      [v9 setAllSuccess:0];
      return;
    }
    NSSelectorFromString(@"networkID");
    [v9 accessoryInfo];
    if (objc_opt_respondsToSelector())
    {
      [objc_msgSend(objc_msgSend(v9, "accessoryInfo"), "setValue:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6), @"networkID");
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      id v14 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
      {
        int v16 = 68289539;
        int v17 = 0;
        __int16 v18 = 2082;
        __int16 v19 = "";
        __int16 v20 = 2113;
        id v21 = a3;
        __int16 v22 = 2049;
        unint64_t v23 = v6;
        int v15 = "{\"msg%{public}.0s\":\"#posh #ut received AIS networkID\", \"uuid\":%{private, location:escape_only}@, \"n"
              "etworkID\":%{private}ld}";
LABEL_27:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, v15, (uint8_t *)&v16, 0x26u);
      }
    }
    else
    {
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      id v14 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
      {
        int v16 = 68289539;
        int v17 = 0;
        __int16 v18 = 2082;
        __int16 v19 = "";
        __int16 v20 = 2113;
        id v21 = a3;
        __int16 v22 = 2049;
        unint64_t v23 = v6;
        int v15 = "{\"msg%{public}.0s\":\"#posh #ut AIS networkID not sent to TA\", \"uuid\":%{private, location:escape_only}"
              "@, \"networkID\":%{private}ld}";
        goto LABEL_27;
      }
    }
  }
  else
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    id v12 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
    {
      int v16 = 68289283;
      int v17 = 0;
      __int16 v18 = 2082;
      __int16 v19 = "";
      __int16 v20 = 2113;
      id v21 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut received AIS networkID for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v16, 0x1Cu);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
    }
    __int16 v13 = qword_102419498;
    if (os_signpost_enabled((os_log_t)qword_102419498))
    {
      int v16 = 68289283;
      int v17 = 0;
      __int16 v18 = 2082;
      __int16 v19 = "";
      __int16 v20 = 2113;
      id v21 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#posh #ut received AIS networkID for unknown device", "{\"msg%{public}.0s\":\"#posh #ut received AIS networkID for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v16, 0x1Cu);
    }
  }
}

- (void)didFetchAISFirmwareVersionFromDevice:(id)a3 firmwareVersion:(id)a4 error:(id)a5
{
  if (-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:"))
  {
    id v9 = [(CLXOTASubscription *)self->_settingsSubscription.__ptr_.__value_ objectForKey:a3];
    dispatch_group_leave((dispatch_group_t)[v9 fetchGroup]);
    if (a5)
    {
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      int v10 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
      {
        int v15 = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        __int16 v18 = "";
        __int16 v19 = 2113;
        id v20 = a3;
        __int16 v21 = 2113;
        id v22 = a5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS firmwareVersion\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
        if (qword_102419490 != -1) {
          dispatch_once(&qword_102419490, &stru_10232A4C8);
        }
      }
      __int16 v11 = qword_102419498;
      if (os_signpost_enabled((os_log_t)qword_102419498))
      {
        int v15 = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        __int16 v18 = "";
        __int16 v19 = 2113;
        id v20 = a3;
        __int16 v21 = 2113;
        id v22 = a5;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#posh #ut fails to receive AIS firmwareVersion", "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS firmwareVersion\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
      [v9 setAllSuccess:0];
    }
    else
    {
      [objc_msgSend(v9, "accessoryInfo") setFirmwareVersion:a4];
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      id v14 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        __int16 v18 = "";
        __int16 v19 = 2113;
        id v20 = a3;
        __int16 v21 = 2113;
        id v22 = a4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#posh #ut received AIS firmwareVersion\", \"uuid\":%{private, location:escape_only}@, \"firmwareVersion\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
    }
  }
  else
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    id v12 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
    {
      int v15 = 68289283;
      int v16 = 0;
      __int16 v17 = 2082;
      __int16 v18 = "";
      __int16 v19 = 2113;
      id v20 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut received AIS firmwareVersion for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
    }
    __int16 v13 = qword_102419498;
    if (os_signpost_enabled((os_log_t)qword_102419498))
    {
      int v15 = 68289283;
      int v16 = 0;
      __int16 v17 = 2082;
      __int16 v18 = "";
      __int16 v19 = 2113;
      id v20 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#posh #ut received AIS firmwareVersion for unknown device", "{\"msg%{public}.0s\":\"#posh #ut received AIS firmwareVersion for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
    }
  }
}

- (void)didFetchAISBatteryTypeFromDevice:(id)a3 batteryType:(unsigned __int8)a4 error:(id)a5
{
  uint64_t v6 = a4;
  if (-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:"))
  {
    id v9 = [(CLXOTASubscription *)self->_settingsSubscription.__ptr_.__value_ objectForKey:a3];
    dispatch_group_leave((dispatch_group_t)[v9 fetchGroup]);
    if (!a5)
    {
      NSSelectorFromString(@"batteryType");
      [v9 accessoryInfo];
      if (objc_opt_respondsToSelector())
      {
        [objc_msgSend(objc_msgSend(v9, "accessoryInfo"), "setValue:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6), @"batteryType"]
        if (qword_102419490 != -1) {
          dispatch_once(&qword_102419490, &stru_10232A4C8);
        }
        __int16 v18 = qword_102419498;
        if (!os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG)) {
          return;
        }
        int v20 = 68289539;
        int v21 = 0;
        __int16 v22 = 2082;
        unint64_t v23 = "";
        __int16 v24 = 2113;
        id v25 = a3;
        __int16 v26 = 2049;
        unint64_t v27 = v6;
        __int16 v19 = "{\"msg%{public}.0s\":\"#posh #ut received AIS batteryType\", \"uuid\":%{private, location:escape_only}@, \""
              "batteryType\":%{private}ld}";
      }
      else
      {
        if (qword_102419490 != -1) {
          dispatch_once(&qword_102419490, &stru_10232A4C8);
        }
        __int16 v18 = qword_102419498;
        if (!os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG)) {
          return;
        }
        int v20 = 68289539;
        int v21 = 0;
        __int16 v22 = 2082;
        unint64_t v23 = "";
        __int16 v24 = 2113;
        id v25 = a3;
        __int16 v26 = 2049;
        unint64_t v27 = v6;
        __int16 v19 = "{\"msg%{public}.0s\":\"#posh #ut AIS batteryType not sent to TA\", \"uuid\":%{private, location:escape_onl"
              "y}@, \"batteryType\":%{private}ld}";
      }
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, v19, (uint8_t *)&v20, 0x26u);
      return;
    }
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    int v10 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
    {
      int v20 = 68289539;
      int v21 = 0;
      __int16 v22 = 2082;
      unint64_t v23 = "";
      __int16 v24 = 2113;
      id v25 = a3;
      __int16 v26 = 2113;
      unint64_t v27 = (unint64_t)a5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS batteryType\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v20, 0x26u);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
    }
    uint64_t v11 = qword_102419498;
    if (os_signpost_enabled((os_log_t)qword_102419498))
    {
      int v20 = 68289539;
      int v21 = 0;
      __int16 v22 = 2082;
      unint64_t v23 = "";
      __int16 v24 = 2113;
      id v25 = a3;
      __int16 v26 = 2113;
      unint64_t v27 = (unint64_t)a5;
      id v12 = "#posh #ut fails to receive AIS batteryType";
      __int16 v13 = "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS batteryType\", \"uuid\":%{private, location:escape_onl"
            "y}@, \"error\":%{private, location:escape_only}@}";
      id v14 = v11;
      uint32_t v15 = 38;
LABEL_17:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v12, v13, (uint8_t *)&v20, v15);
    }
  }
  else
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    int v16 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
    {
      int v20 = 68289283;
      int v21 = 0;
      __int16 v22 = 2082;
      unint64_t v23 = "";
      __int16 v24 = 2113;
      id v25 = a3;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut received AIS batteryType for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v20, 0x1Cu);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
    }
    uint64_t v17 = qword_102419498;
    if (os_signpost_enabled((os_log_t)qword_102419498))
    {
      int v20 = 68289283;
      int v21 = 0;
      __int16 v22 = 2082;
      unint64_t v23 = "";
      __int16 v24 = 2113;
      id v25 = a3;
      id v12 = "#posh #ut received AIS batteryType for unknown device";
      __int16 v13 = "{\"msg%{public}.0s\":\"#posh #ut received AIS batteryType for unknown device\", \"uuid\":%{private, location:escape_only}@}";
      id v14 = v17;
      uint32_t v15 = 28;
      goto LABEL_17;
    }
  }
}

- (void)didFetchAISBatteryLevelFromDevice:(id)a3 batteryLevel:(unsigned __int8)a4 error:(id)a5
{
  uint64_t v6 = a4;
  if (-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:"))
  {
    id v9 = [(CLXOTASubscription *)self->_settingsSubscription.__ptr_.__value_ objectForKey:a3];
    dispatch_group_leave((dispatch_group_t)[v9 fetchGroup]);
    if (a5)
    {
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      int v10 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
      {
        int v20 = 68289539;
        int v21 = 0;
        __int16 v22 = 2082;
        unint64_t v23 = "";
        __int16 v24 = 2113;
        id v25 = a3;
        __int16 v26 = 2113;
        unint64_t v27 = (unint64_t)a5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS batteryLevel\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v20, 0x26u);
        if (qword_102419490 != -1) {
          dispatch_once(&qword_102419490, &stru_10232A4C8);
        }
      }
      uint64_t v11 = qword_102419498;
      if (os_signpost_enabled((os_log_t)qword_102419498))
      {
        int v20 = 68289539;
        int v21 = 0;
        __int16 v22 = 2082;
        unint64_t v23 = "";
        __int16 v24 = 2113;
        id v25 = a3;
        __int16 v26 = 2113;
        unint64_t v27 = (unint64_t)a5;
        id v12 = "#posh #ut fails to receive AIS batteryLevel";
        __int16 v13 = "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS batteryLevel\", \"uuid\":%{private, location:escape_"
              "only}@, \"error\":%{private, location:escape_only}@}";
        id v14 = v11;
        uint32_t v15 = 38;
LABEL_17:
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v12, v13, (uint8_t *)&v20, v15);
      }
    }
    else
    {
      NSSelectorFromString(@"batteryLevel");
      [v9 accessoryInfo];
      if (objc_opt_respondsToSelector())
      {
        if (qword_102419490 != -1) {
          dispatch_once(&qword_102419490, &stru_10232A4C8);
        }
        __int16 v18 = qword_102419498;
        if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
        {
          int v20 = 68289539;
          int v21 = 0;
          __int16 v22 = 2082;
          unint64_t v23 = "";
          __int16 v24 = 2113;
          id v25 = a3;
          __int16 v26 = 2049;
          unint64_t v27 = v6;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#posh #ut received AIS batteryLevel\", \"uuid\":%{private, location:escape_only}@, \"batteryLevel\":%{private}ld}", (uint8_t *)&v20, 0x26u);
        }
        [objc_msgSend(objc_msgSend(v9, "accessoryInfo"), "setValue:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6), @"batteryLevel");
      }
      else
      {
        if (qword_102419490 != -1) {
          dispatch_once(&qword_102419490, &stru_10232A4C8);
        }
        __int16 v19 = qword_102419498;
        if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
        {
          int v20 = 68289539;
          int v21 = 0;
          __int16 v22 = 2082;
          unint64_t v23 = "";
          __int16 v24 = 2113;
          id v25 = a3;
          __int16 v26 = 2049;
          unint64_t v27 = v6;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#posh #ut AIS batteryLevel not sent to TA\", \"uuid\":%{private, location:escape_only}@, \"batteryLevel\":%{private}ld}", (uint8_t *)&v20, 0x26u);
        }
      }
    }
  }
  else
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    int v16 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
    {
      int v20 = 68289283;
      int v21 = 0;
      __int16 v22 = 2082;
      unint64_t v23 = "";
      __int16 v24 = 2113;
      id v25 = a3;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut received AIS batteryLevel for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v20, 0x1Cu);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
    }
    uint64_t v17 = qword_102419498;
    if (os_signpost_enabled((os_log_t)qword_102419498))
    {
      int v20 = 68289283;
      int v21 = 0;
      __int16 v22 = 2082;
      unint64_t v23 = "";
      __int16 v24 = 2113;
      id v25 = a3;
      id v12 = "#posh #ut received AIS batteryLevel for unknown device";
      __int16 v13 = "{\"msg%{public}.0s\":\"#posh #ut received AIS batteryLevel for unknown device\", \"uuid\":%{private, locatio"
            "n:escape_only}@}";
      id v14 = v17;
      uint32_t v15 = 28;
      goto LABEL_17;
    }
  }
}

- (void)didFetchAISSerialNumberFromDevice:(id)a3 serialNumber:(id)a4 error:(id)a5
{
  if (-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:"))
  {
    id v9 = [(CLXOTASubscription *)self->_settingsSubscription.__ptr_.__value_ objectForKey:a3];
    dispatch_group_leave((dispatch_group_t)[v9 fetchGroup]);
    if (!a5)
    {
      NSSelectorFromString(@"serialNumber");
      [v9 accessoryInfo];
      if (objc_opt_respondsToSelector())
      {
        [objc_msgSend(v9, "accessoryInfo") setValue:a4 forKey:@"serialNumber"];
        if (qword_102419490 != -1) {
          dispatch_once(&qword_102419490, &stru_10232A4C8);
        }
        __int16 v18 = qword_102419498;
        if (!os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG)) {
          return;
        }
        int v20 = 68289539;
        int v21 = 0;
        __int16 v22 = 2082;
        unint64_t v23 = "";
        __int16 v24 = 2113;
        id v25 = a3;
        __int16 v26 = 2113;
        id v27 = a4;
        __int16 v19 = "{\"msg%{public}.0s\":\"#posh #ut received AIS serialNumber\", \"uuid\":%{private, location:escape_only}@, "
              "\"serialNumber\":%{private, location:escape_only}@}";
      }
      else
      {
        if (qword_102419490 != -1) {
          dispatch_once(&qword_102419490, &stru_10232A4C8);
        }
        __int16 v18 = qword_102419498;
        if (!os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG)) {
          return;
        }
        int v20 = 68289539;
        int v21 = 0;
        __int16 v22 = 2082;
        unint64_t v23 = "";
        __int16 v24 = 2113;
        id v25 = a3;
        __int16 v26 = 2113;
        id v27 = a4;
        __int16 v19 = "{\"msg%{public}.0s\":\"#posh #ut AIS serialNumber not sent to TA\", \"uuid\":%{private, location:escape_on"
              "ly}@, \"serialNumber\":%{private, location:escape_only}@}";
      }
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, v19, (uint8_t *)&v20, 0x26u);
      return;
    }
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    int v10 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
    {
      int v20 = 68289539;
      int v21 = 0;
      __int16 v22 = 2082;
      unint64_t v23 = "";
      __int16 v24 = 2113;
      id v25 = a3;
      __int16 v26 = 2113;
      id v27 = a5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS serialNumber\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v20, 0x26u);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
    }
    uint64_t v11 = qword_102419498;
    if (os_signpost_enabled((os_log_t)qword_102419498))
    {
      int v20 = 68289539;
      int v21 = 0;
      __int16 v22 = 2082;
      unint64_t v23 = "";
      __int16 v24 = 2113;
      id v25 = a3;
      __int16 v26 = 2113;
      id v27 = a5;
      id v12 = "#posh #ut fails to receive AIS serialNumber";
      __int16 v13 = "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS serialNumber\", \"uuid\":%{private, location:escape_on"
            "ly}@, \"error\":%{private, location:escape_only}@}";
      id v14 = v11;
      uint32_t v15 = 38;
LABEL_17:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v12, v13, (uint8_t *)&v20, v15);
    }
  }
  else
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    int v16 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
    {
      int v20 = 68289283;
      int v21 = 0;
      __int16 v22 = 2082;
      unint64_t v23 = "";
      __int16 v24 = 2113;
      id v25 = a3;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut received AIS serialNumber for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v20, 0x1Cu);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
    }
    uint64_t v17 = qword_102419498;
    if (os_signpost_enabled((os_log_t)qword_102419498))
    {
      int v20 = 68289283;
      int v21 = 0;
      __int16 v22 = 2082;
      unint64_t v23 = "";
      __int16 v24 = 2113;
      id v25 = a3;
      id v12 = "#posh #ut received AIS serialNumber for unknown device";
      __int16 v13 = "{\"msg%{public}.0s\":\"#posh #ut received AIS serialNumber for unknown device\", \"uuid\":%{private, locatio"
            "n:escape_only}@}";
      id v14 = v17;
      uint32_t v15 = 28;
      goto LABEL_17;
    }
  }
}

- (BOOL)shouldThrottleNotification
{
  if (!self->_notificationThrottleMax) {
    return 1;
  }
  if (!self->_notificationThrottlePeriodHours) {
    return 0;
  }
  double v21 = 0.0;
  id v3 = +[NSDate date];
  int v20 = 0;
  uint64_t v4 = sub_1000A6958();
  if (sub_1000A699C(v4, "TACountThrottlePeriodLastResetTimestamp", &v21)
    && (id v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v21], (id)[[(NSDate *)v5 dateByAddingTimeInterval:(double)(3600 * self->_notificationThrottlePeriodHours)] compare:v3] == (id)1))
  {
    uint64_t v6 = sub_1000A6958();
    sub_10006EF84(v6, "TACountNotificationsInThrottlePeriod", &v20);
    id v3 = v5;
  }
  else
  {
    uint64_t v8 = sub_1000A6958();
    [(NSDate *)v3 timeIntervalSinceReferenceDate];
    *(void *)uint64_t buf = v9;
    sub_10016332C(v8, "TACountThrottlePeriodLastResetTimestamp", buf);
    uint64_t v10 = sub_1000A6958();
    *(_DWORD *)uint64_t buf = 0;
    sub_1000EA838(v10, "TACountNotificationsInThrottlePeriod", buf);
    uint64_t v11 = *(void *)sub_1000A6958();
    (*(void (**)(void))(v11 + 944))();
  }
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_10232A4C8);
  }
  id v12 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
  {
    unint64_t notificationThrottleMax = self->_notificationThrottleMax;
    id v14 = "Do";
    unint64_t notificationThrottlePeriodHours = self->_notificationThrottlePeriodHours;
    if (v20 < (int)notificationThrottleMax) {
      id v14 = "Don't";
    }
    *(_DWORD *)uint64_t buf = 136316163;
    *(void *)&uint8_t buf[4] = v14;
    __int16 v33 = 1025;
    int v34 = v20;
    __int16 v35 = 2049;
    unint64_t v36 = notificationThrottleMax;
    __int16 v37 = 2049;
    unint64_t v38 = notificationThrottlePeriodHours;
    __int16 v39 = 2113;
    long long v40 = v3;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "#ut %s throttle notifications, %{private}d/%{private}lu in %{private}lu hours, last reset %{private}@", buf, 0x30u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    unint64_t v16 = self->_notificationThrottleMax;
    uint64_t v17 = "Do";
    if (v20 < (int)v16) {
      uint64_t v17 = "Don't";
    }
    unint64_t v18 = self->_notificationThrottlePeriodHours;
    int v22 = 136316163;
    unint64_t v23 = v17;
    __int16 v24 = 1025;
    int v25 = v20;
    __int16 v26 = 2049;
    unint64_t v27 = v16;
    __int16 v28 = 2049;
    unint64_t v29 = v18;
    __int16 v30 = 2113;
    char v31 = v3;
    __int16 v19 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService shouldThrottleNotification]", "%s\n", v19);
    if (v19 != buf) {
      free(v19);
    }
  }
  return self->_notificationThrottleMax <= v20;
}

- (void)incrementNotifications
{
  if (self->_notificationThrottleMax)
  {
    if (self->_notificationThrottlePeriodHours)
    {
      int v6 = 0;
      uint64_t v2 = sub_1000A6958();
      sub_10006EF84(v2, "TACountNotificationsInThrottlePeriod", &v6);
      uint64_t v3 = sub_1000A6958();
      int v5 = v6 + 1;
      sub_1000EA838(v3, "TACountNotificationsInThrottlePeriod", &v5);
      uint64_t v4 = *(void *)sub_1000A6958();
      (*(void (**)(void))(v4 + 944))();
    }
  }
}

- (id)getTrackingAvoidanceSettingsWithOTASettings:(id)a3
{
  sub_1000C7F88(&v72);
  id v4 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:10];
  int v5 = v4;
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3321888768;
  v66 = sub_1014DF74C;
  v67 = &unk_10232A470;
  uint64_t v70 = v72;
  v71 = v73;
  if (v73) {
    atomic_fetch_add_explicit(&v73->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v68 = v4;
  id v69 = a3;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v6 = +[TASettings getBooleanSettingsKeys];
  id v7 = [v6 countByEnumeratingWithState:&v61 objects:v79 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v62 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        LOBYTE(v56) = 0;
        if (sub_1000D2988(v72, (const char *)[v10 cStringUsingEncoding:1], (BOOL *)&v56))
        {
          uint64_t v11 = +[NSNumber numberWithBool:v56];
        }
        else
        {
          if (![a3 objectForKeyedSubscript:v10]) {
            continue;
          }
          uint64_t v11 = (NSNumber *)[a3 objectForKeyedSubscript:v10];
        }
        [v5 setObject:v11 forKeyedSubscript:v10];
      }
      id v7 = [v6 countByEnumeratingWithState:&v61 objects:v79 count:16];
    }
    while (v7);
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v12 = +[TASettings getDoubleSettingsKeys];
  id v13 = [v12 countByEnumeratingWithState:&v57 objects:v78 count:16];
  if (!v13) {
    goto LABEL_27;
  }
  uint64_t v14 = *(void *)v58;
  do
  {
    for (j = 0; j != v13; j = (char *)j + 1)
    {
      if (*(void *)v58 != v14) {
        objc_enumerationMutation(v12);
      }
      unint64_t v16 = *(void **)(*((void *)&v57 + 1) + 8 * (void)j);
      CFTypeRef v56 = 0;
      if (sub_1000A699C(v72, (const char *)[v16 cStringUsingEncoding:1], &v56))
      {
        uint64_t v17 = +[NSNumber numberWithDouble:*(double *)&v56];
      }
      else
      {
        if (![a3 objectForKeyedSubscript:v16]) {
          continue;
        }
        uint64_t v17 = (NSNumber *)[a3 objectForKeyedSubscript:v16];
      }
      [v5 setObject:v17 forKeyedSubscript:v16];
    }
    id v13 = [v12 countByEnumeratingWithState:&v57 objects:v78 count:16];
  }
  while (v13);
LABEL_27:
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v18 = +[TASettings getIntegerSettingsKeys];
  id v19 = [v18 countByEnumeratingWithState:&v52 objects:v77 count:16];
  if (!v19) {
    goto LABEL_39;
  }
  uint64_t v20 = *(void *)v53;
  while (2)
  {
    uint64_t v21 = 0;
    while (2)
    {
      if (*(void *)v53 != v20) {
        objc_enumerationMutation(v18);
      }
      int v22 = *(void **)(*((void *)&v52 + 1) + 8 * v21);
      LODWORD(v56) = 0;
      if (sub_10006EF84(v72, (const char *)[v22 cStringUsingEncoding:1], &v56))
      {
        unint64_t v23 = +[NSNumber numberWithInt:v56];
        goto LABEL_36;
      }
      if ([a3 objectForKeyedSubscript:v22])
      {
        unint64_t v23 = (NSNumber *)[a3 objectForKeyedSubscript:v22];
LABEL_36:
        [v5 setObject:v23 forKeyedSubscript:v22];
      }
      if (v19 != (id)++v21) {
        continue;
      }
      break;
    }
    id v19 = [v18 countByEnumeratingWithState:&v52 objects:v77 count:16];
    if (v19) {
      continue;
    }
    break;
  }
LABEL_39:
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v24 = +[TASettings getUnsignedIntegerSettingsKeys];
  id v25 = [v24 countByEnumeratingWithState:&v48 objects:v76 count:16];
  if (!v25) {
    goto LABEL_51;
  }
  uint64_t v26 = *(void *)v49;
  while (2)
  {
    uint64_t v27 = 0;
    while (2)
    {
      if (*(void *)v49 != v26) {
        objc_enumerationMutation(v24);
      }
      __int16 v28 = *(void **)(*((void *)&v48 + 1) + 8 * v27);
      LODWORD(v56) = 0;
      if (sub_1004D0870(v72, (const char *)[v28 cStringUsingEncoding:1], &v56))
      {
        unint64_t v29 = +[NSNumber numberWithUnsignedInt:v56];
        goto LABEL_48;
      }
      if ([a3 objectForKeyedSubscript:v28])
      {
        unint64_t v29 = (NSNumber *)[a3 objectForKeyedSubscript:v28];
LABEL_48:
        [v5 setObject:v29 forKeyedSubscript:v28];
      }
      if (v25 != (id)++v27) {
        continue;
      }
      break;
    }
    id v25 = [v24 countByEnumeratingWithState:&v48 objects:v76 count:16];
    if (v25) {
      continue;
    }
    break;
  }
LABEL_51:
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v30 = +[TASettings getStringSettingsKeys];
  id v31 = [v30 countByEnumeratingWithState:&v44 objects:v75 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v45;
    do
    {
      for (k = 0; k != v31; k = (char *)k + 1)
      {
        if (*(void *)v45 != v32) {
          objc_enumerationMutation(v30);
        }
        v66((uint64_t)v65, *(void **)(*((void *)&v44 + 1) + 8 * (void)k));
      }
      id v31 = [v30 countByEnumeratingWithState:&v44 objects:v75 count:16];
    }
    while (v31);
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v34 = +[TASettings getArraySettingsKeys];
  id v35 = [v34 countByEnumeratingWithState:&v40 objects:v74 count:16];
  if (v35)
  {
    uint64_t v36 = *(void *)v41;
    do
    {
      for (m = 0; m != v35; m = (char *)m + 1)
      {
        if (*(void *)v41 != v36) {
          objc_enumerationMutation(v34);
        }
        CFStringRef v38 = *(const __CFString **)(*((void *)&v40 + 1) + 8 * (void)m);
        CFTypeRef v56 = 0;
        if (sub_1004D1D1C(v72, v38, &v56))
        {
          [v5 setObject:+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v56) forKeyedSubscript:v38];
        }
        else if ([a3 objectForKeyedSubscript:v38])
        {
          [v5 setObject:objc_msgSend(a3, "objectForKeyedSubscript:", v38) forKeyedSubscript:v38];
        }
      }
      id v35 = [v34 countByEnumeratingWithState:&v40 objects:v74 count:16];
    }
    while (v35);
  }
  if (v71) {
    sub_1000DB0A0(v71);
  }
  if (v73) {
    sub_1000DB0A0(v73);
  }
  return v5;
}

- (void)onUpdatedSettings:(id)a3
{
  id v3 = -[CLTrackingAvoidanceService getTrackingAvoidanceSettingsWithOTASettings:](self, "getTrackingAvoidanceSettingsWithOTASettings:");
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v19;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v6);
        if (qword_102419490 != -1) {
          dispatch_once(&qword_102419490, &stru_10232A4C8);
        }
        uint64_t v8 = qword_102419498;
        if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = [v7 UTF8String];
          id v10 = [v3 objectForKeyedSubscript:v7];
          *(_DWORD *)uint64_t buf = 68289539;
          *(_DWORD *)&uint8_t buf[4] = 0;
          *(_WORD *)unint64_t v23 = 2082;
          *(void *)&v23[2] = "";
          __int16 v24 = 2081;
          id v25 = v9;
          __int16 v26 = 2113;
          id v27 = v10;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut onUpdatedSetting\", \"key\":%{private, location:escape_only}s, \"value\":%{private, location:escape_only}@}", buf, 0x26u);
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v3 countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v4);
  }
  id v11 = [objc_alloc((Class)TASettings) initWithSettings:v3];
  self->_maxDailyAggressiveScans = (unint64_t)[v11 maximumDailyScans];
  self->_unint64_t notificationThrottlePeriodHours = (unint64_t)[v11 notificationThrottleHours];
  self->_unint64_t notificationThrottleMax = (unint64_t)[v11 notificationThrottleMaxPerPeriod];
  [(TATrackingAvoidanceServiceManager *)self->_taServiceManager onUpdatedSettings:v11];
  self->_settingsVersion = (unint64_t)[v11 settingsVersion];

  id v12 = [a3 objectForKeyedSubscript:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "TrackingAvoidanceRemainingBOMScansStartingValue")];
  if (v12)
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    id v13 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289283;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)unint64_t v23 = 2082;
      *(void *)&v23[2] = "";
      __int16 v24 = 2113;
      id v25 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut got OTA BOM Scan Count\", \"count\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
    unsigned int v17 = [v12 unsignedIntegerValue];
    sub_1000C7F88(buf);
    sub_1004D2BC4(*(uint64_t *)buf, "TrackingAvoidanceRemainingBOMScansStartingValue", &v17);
    if (*(void *)v23) {
      sub_1000DB0A0(*(std::__shared_weak_count **)v23);
    }
    sub_1000C7F88(buf);
    sub_10051F604(*(uint64_t *)buf);
    if (*(void *)v23) {
      sub_1000DB0A0(*(std::__shared_weak_count **)v23);
    }
    bomScanManager = self->_bomScanManager;
    if (bomScanManager) {
      [(CLTrackingAvoidanceBOMScanManager *)bomScanManager setRemainingBOMScansTo:v17];
    }
  }
}

- (void)requestScan
{
  if (_os_feature_enabled_impl()) {
    uint64_t v3 = 48;
  }
  else {
    uint64_t v3 = 32;
  }
  if (!*(void *)&self->CLIntersiloService_opaque[v3]) {
    return;
  }
  double v19 = 0.0;
  int v18 = 0;
  uint64_t v4 = sub_1000A6958();
  if (sub_1000A699C(v4, "TACountAggressiveScansLastResetTimestamp", &v19))
  {
    id v5 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [v5 setTimeZone:+[NSTimeZone timeZoneWithAbbreviation:](NSTimeZone, "timeZoneWithAbbreviation:", @"UTC")];
    id v6 = [v5 startOfDayForDate:+[NSDate now](NSDate, "now")];

    NSComparisonResult v7 = [+[NSDate dateWithTimeIntervalSinceReferenceDate:v19] compare:v6];
    uint64_t v8 = sub_1000A6958();
    if (v7 != NSOrderedAscending)
    {
      sub_10006EF84(v8, "TACountAggressiveScans", &v18);
      goto LABEL_10;
    }
    *(_DWORD *)uint64_t buf = 0;
    sub_1000EA838(v8, "TACountAggressiveScans", buf);
  }
  uint64_t v9 = sub_1000A6958();
  *(void *)uint64_t buf = CFAbsoluteTimeGetCurrent();
  sub_10016332C(v9, "TACountAggressiveScansLastResetTimestamp", buf);
LABEL_10:
  if (self->_maxDailyAggressiveScans <= v18)
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    id v11 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
    {
      unint64_t maxDailyAggressiveScans = self->_maxDailyAggressiveScans;
      *(_DWORD *)uint64_t buf = 67174913;
      *(_DWORD *)&uint8_t buf[4] = v18;
      __int16 v25 = 2049;
      unint64_t v26 = maxDailyAggressiveScans;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "#ut Aggressive scan requested but daily limit already reached: %{private}d / %{private}lu", buf, 0x12u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      unint64_t v13 = self->_maxDailyAggressiveScans;
      int v20 = 67174913;
      int v21 = v18;
      __int16 v22 = 2049;
      unint64_t v23 = v13;
      uint64_t v14 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService requestScan]", "%s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
    }
  }
  else
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    id v10 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ut Performing aggressive scan", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      LOWORD(v20) = 0;
      unsigned int v17 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService requestScan]", "%s\n", v17);
      if (v17 != (char *)buf) {
        free(v17);
      }
    }
    if (_os_feature_enabled_impl()) {
      [(CLAvengerScannerClient *)self->_scannerClient performTemporaryAggressiveScan];
    }
    else {
      [(CLAvengerScannerServiceProtocol *)self->_avengerScannerProxy performTemporaryAggressiveScan:CLISP_ME_TOKEN];
    }
    uint64_t v15 = sub_1000A6958();
    *(_DWORD *)uint64_t buf = v18 + 1;
    sub_1000EA838(v15, "TACountAggressiveScans", buf);
    uint64_t v16 = *(void *)sub_1000A6958();
    (*(void (**)(void))(v16 + 944))();
  }
}

- (void)requestHawkeyeLowEnergyScan
{
  if (_os_feature_enabled_impl()) {
    uint64_t v3 = 48;
  }
  else {
    uint64_t v3 = 32;
  }
  if (!*(void *)&self->CLIntersiloService_opaque[v3]) {
    return;
  }
  double v17 = 0.0;
  unsigned int v16 = 0;
  uint64_t v4 = sub_1000A6958();
  if (sub_1000A699C(v4, "TACountHawkeyeLowEnergyScansLastResetTimestamp", &v17))
  {
    id v5 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [v5 setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    id v6 = [v5 startOfDayForDate:+[NSDate now](NSDate, "now")];

    NSComparisonResult v7 = [+[NSDate dateWithTimeIntervalSinceReferenceDate:v17] compare:v6];
    uint64_t v8 = sub_1000A6958();
    if (v7 != NSOrderedAscending)
    {
      sub_10006EF84(v8, "TACountHawkeyeLowEnergyScans", &v16);
      goto LABEL_10;
    }
    *(_DWORD *)uint64_t buf = 0;
    sub_1000EA838(v8, "TACountHawkeyeLowEnergyScans", buf);
  }
  uint64_t v9 = sub_1000A6958();
  *(void *)uint64_t buf = CFAbsoluteTimeGetCurrent();
  sub_10016332C(v9, "TACountHawkeyeLowEnergyScansLastResetTimestamp", buf);
LABEL_10:
  if (v16 < 0x18)
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    id v12 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#ut Performing hawkeye low energy scan", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      LOWORD(v18) = 0;
      uint64_t v15 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService requestHawkeyeLowEnergyScan]", "%s\n", v15);
      if (v15 != (char *)buf) {
        free(v15);
      }
    }
    if (_os_feature_enabled_impl()) {
      [(CLAvengerScannerClient *)self->_scannerClient performTemporaryHawkeyeLowEnergyScan];
    }
    else {
      [(CLAvengerScannerServiceProtocol *)self->_avengerScannerProxy performTemporaryHawkeyeLowEnergyScan:CLISP_ME_TOKEN];
    }
    uint64_t v13 = sub_1000A6958();
    *(_DWORD *)uint64_t buf = v16 + 1;
    sub_1000EA838(v13, "TACountHawkeyeLowEnergyScans", buf);
    uint64_t v14 = *(void *)sub_1000A6958();
    (*(void (**)(void))(v14 + 944))();
  }
  else
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    id v10 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)uint64_t buf = 67174913;
      *(_DWORD *)&uint8_t buf[4] = v16;
      __int16 v23 = 2049;
      uint64_t v24 = 24;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "#ut hawkeye low energy scan requested but daily limit already reached: %{private}d / %{private}lu", buf, 0x12u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      int v18 = 67174913;
      unsigned int v19 = v16;
      __int16 v20 = 2049;
      uint64_t v21 = 24;
      id v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService requestHawkeyeLowEnergyScan]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
  }
}

- (void)showEngineeringUIForOwnerUT:(id)a3
{
  if (!self->_allowDebugNotification) {
    return;
  }
  if ((double)arc4random() / 4294967300.0 > *(double *)&self->_metrics.lastLocationPrivate.accessoryLocationType)
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    id v5 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ut user will not be notified of owner device issues", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_10232A4C8);
      }
      LOWORD(__p[0]) = 0;
      id v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService showEngineeringUIForOwnerUT:]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
    return;
  }
  sub_100134750(__p, (char *)[[[objc_msgSend(objc_msgSend(objc_msgSend(a3, "address"), "hexString"), "UTF8String")];
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  [v7 setObject:@"Offline Device Issues Detected" forKeyedSubscript:kCFUserNotificationAlertHeaderKey];
  [v7 setObject:@"Tap-to-Radar" forKeyedSubscript:kCFUserNotificationAlternateButtonTitleKey];
  [v7 setObject:@"Dismiss" forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];
  [v7 setObject:@"Please file a radar" forKeyedSubscript:kCFUserNotificationAlertMessageKey];
  CFUserNotificationRef v8 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, 0, (CFDictionaryRef)v7);

  if (!v8)
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    id v11 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "Could not create UT detected user notification", buf, 2u);
    }
    if (!sub_10013D1A0(115, 0)) {
      goto LABEL_27;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419490 == -1) {
      goto LABEL_37;
    }
    goto LABEL_39;
  }
  CFRetain(v8);
  RunLoopSource = CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, v8, (CFUserNotificationCallBack)sub_1014E30C0, 0);
  if (!RunLoopSource)
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    id v12 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "Could not create runloop source for UT detected user notification", buf, 2u);
    }
    if (!sub_10013D1A0(115, 0)) {
      goto LABEL_27;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419490 == -1) {
      goto LABEL_37;
    }
LABEL_39:
    dispatch_once(&qword_102419490, &stru_10232A4C8);
LABEL_37:
    __int16 v18 = 0;
    uint64_t v15 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "void displayOwnerUTUserNotification(const std::string &)", "%s\n", v15);
    if (v15 != (char *)buf) {
      free(v15);
    }
    goto LABEL_27;
  }
  id v10 = (__CFRunLoop *)sub_1001C2710();
  CFRunLoopAddSource(v10, RunLoopSource, kCFRunLoopCommonModes);
  CFRelease(RunLoopSource);
  CFRelease(v8);
LABEL_27:
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_10232A4C8);
  }
  uint64_t v13 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = __p;
    if (v17 < 0) {
      uint64_t v14 = (void **)__p[0];
    }
    *(_DWORD *)uint64_t buf = 68289283;
    int v20 = 0;
    __int16 v21 = 2082;
    __int16 v22 = "";
    __int16 v23 = 2081;
    uint64_t v24 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut owner EngineeringUI submitted\", \"address\":%{private, location:escape_only}s}", buf, 0x1Cu);
  }
  [(CLTrackingAvoidanceService *)self incrementNotifications];
  if (v17 < 0) {
    operator delete(__p[0]);
  }
}

- (void)didFetchSignficantLocationsStatus:(BOOL)a3 forClient:(id)a4
{
  BOOL v5 = a3;
  BOOL v7 = BYTE1(self->_signalEnvironment) == 0;
  int v8 = BYTE2(self->_signalEnvironment);
  id v9 = [objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.FindMySafetyAlertsNotifications"];
  id v10 = [objc_msgSend(v9, "notificationSettings") authorizationStatus];

  id v11 = objc_alloc_init((Class)RadiosPreferences);
  id v12 = [v11 airplaneMode];

  unsigned int v13 = [[+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace") applicationIsInstalled:@"com.apple.findmy"];
  BOOL v14 = v8 == 0;
  BOOL v15 = v8 == 0;
  int v16 = v14 || v7;
  BOOL v17 = v10 == (id)1;
  uint64_t v18 = v13 ^ 1;
  if (v10 == (id)1) {
    int v16 = 1;
  }
  int v19 = v16 | v12 | v18;
  BOOL v20 = !v5;
  BOOL v21 = HIBYTE(self->_signalEnvironment) == 0;
  if (HIBYTE(self->_signalEnvironment)) {
    int v22 = v20;
  }
  else {
    int v22 = 1;
  }
  BOOL v14 = v22 == 0;
  uint64_t v23 = 3;
  if (v14) {
    uint64_t v23 = 1;
  }
  if (v19) {
    uint64_t v24 = 2;
  }
  else {
    uint64_t v24 = v23;
  }
  v32[0] = UTDisableReasonBTOffKey;
  v33[0] = +[NSNumber numberWithBool:v7];
  v32[1] = UTDisableReasonLocationServicesOffKey;
  v33[1] = +[NSNumber numberWithBool:v15];
  _OWORD v32[2] = UTDisableReasonTrackingNotificationsDisallowedKey;
  v33[2] = +[NSNumber numberWithBool:v17];
  v32[3] = UTDisableReasonAirplaneModeOnKey;
  v33[3] = +[NSNumber numberWithBool:v12];
  v32[4] = UTDisableReasonFindMyDeletedKey;
  v33[4] = +[NSNumber numberWithBool:v18];
  v32[5] = UTDegradationReasonSignificantLocationsOffKey;
  v33[5] = +[NSNumber numberWithBool:v20];
  v32[6] = UTDegradationReasonWifiOffKey;
  v33[6] = +[NSNumber numberWithBool:v21];
  v32[7] = UTEnablementStatusKey;
  v33[7] = +[NSNumber numberWithUnsignedInteger:v24];
  __int16 v25 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:8];
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_10232A4C8);
  }
  unint64_t v26 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
  {
    v27[0] = 68289283;
    v27[1] = 0;
    __int16 v28 = 2082;
    unint64_t v29 = "";
    __int16 v30 = 2113;
    id v31 = v25;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut didFetchStatusOfUTEnablementRequirementsWithStatus\", \"status\":%{private, location:escape_only}@}", (uint8_t *)v27, 0x1Cu);
  }
  [a4 didFetchStatusOfUTEnablementRequirementsWithStatus:v25];
}

- (void)fetchStatusOfUTEnablementRequirementsForClient:(id)a3
{
  id v5 = [[objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "vendor") proxyForService:@"CLClientAuthorizationCache"];
  [v5 registerDelegate:self inSilo:[-[CLTrackingAvoidanceService universe](self, "universe") silo]];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_1014E0FA8;
  v6[3] = &unk_10229FF28;
  v6[4] = self;
  v6[5] = v5;
  v6[6] = a3;
  [v5 notifyWhenCacheIsPopulatedWithReply:v6];
}

- (void)fetchAISInfoForPoshTAUnknownBeacon:(id)a3 client:(id)a4
{
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_10232A4C8);
  }
  id v6 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289283;
    int v10 = 0;
    __int16 v11 = 2082;
    id v12 = "";
    __int16 v13 = 2113;
    id v14 = [a3 identifier];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut #posh AIS fetch request\", \"uuid\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  BOOL v7 = [[CLTrackingAvoidanceAISFetchRecord alloc] initWithUUID:[a3 identifier] deviceType:[a3 deviceType]];
  -[CLXOTASubscription setObject:forKey:](self->_settingsSubscription.__ptr_.__value_, "setObject:forKey:", v7, [a3 identifier]);
  -[CLTrackingAvoidanceService scheduleAISFetchTimeoutForDevice:](self, "scheduleAISFetchTimeoutForDevice:", [a3 identifier]);
  dispatch_group_enter((dispatch_group_t)[(CLTrackingAvoidanceAISFetchRecord *)v7 fetchGroup]);
  [(CLDurianServiceProtocol *)self->_durianServiceProxy fetchAISProductDataForTAUnknownBeacon:a3 forClient:CLISP_ME_TOKEN];
  dispatch_group_enter((dispatch_group_t)[(CLTrackingAvoidanceAISFetchRecord *)v7 fetchGroup]);
  [(CLDurianServiceProtocol *)self->_durianServiceProxy fetchAISManufacturerNameForTAUnknownBeacon:a3 forClient:CLISP_ME_TOKEN];
  dispatch_group_enter((dispatch_group_t)[(CLTrackingAvoidanceAISFetchRecord *)v7 fetchGroup]);
  [(CLDurianServiceProtocol *)self->_durianServiceProxy fetchAISModelNameForTAUnknownBeacon:a3 forClient:CLISP_ME_TOKEN];
  dispatch_group_enter((dispatch_group_t)[(CLTrackingAvoidanceAISFetchRecord *)v7 fetchGroup]);
  [(CLDurianServiceProtocol *)self->_durianServiceProxy fetchAISProtocolImplementationForTAUnknownBeacon:a3 forClient:CLISP_ME_TOKEN];
  dispatch_group_enter((dispatch_group_t)[(CLTrackingAvoidanceAISFetchRecord *)v7 fetchGroup]);
  [(CLDurianServiceProtocol *)self->_durianServiceProxy fetchAISAccessoryCapabilitiesForTAUnknownBeacon:a3 forClient:CLISP_ME_TOKEN];
  dispatch_group_enter((dispatch_group_t)[(CLTrackingAvoidanceAISFetchRecord *)v7 fetchGroup]);
  [(CLDurianServiceProtocol *)self->_durianServiceProxy fetchAISAccessoryCategoryForTAUnknownBeacon:a3 forClient:CLISP_ME_TOKEN];
  dispatch_group_enter((dispatch_group_t)[(CLTrackingAvoidanceAISFetchRecord *)v7 fetchGroup]);
  [(CLDurianServiceProtocol *)self->_durianServiceProxy fetchAISNetworkIDForTAUnknownBeacon:a3 forClient:CLISP_ME_TOKEN];
  dispatch_group_enter((dispatch_group_t)[(CLTrackingAvoidanceAISFetchRecord *)v7 fetchGroup]);
  [(CLDurianServiceProtocol *)self->_durianServiceProxy fetchAISFirmwareVersionForTAUnknownBeacon:a3 forClient:CLISP_ME_TOKEN];
  dispatch_group_enter((dispatch_group_t)[(CLTrackingAvoidanceAISFetchRecord *)v7 fetchGroup]);
  [(CLDurianServiceProtocol *)self->_durianServiceProxy fetchAISSerialNumberForTAUnknownBeacon:a3 forClient:CLISP_ME_TOKEN];
  dispatch_group_enter((dispatch_group_t)[(CLTrackingAvoidanceAISFetchRecord *)v7 fetchGroup]);
  [(CLDurianServiceProtocol *)self->_durianServiceProxy fetchAISBatteryTypeForTAUnknownBeacon:a3 forClient:CLISP_ME_TOKEN];
  dispatch_group_enter((dispatch_group_t)[(CLTrackingAvoidanceAISFetchRecord *)v7 fetchGroup]);
  [(CLDurianServiceProtocol *)self->_durianServiceProxy fetchAISBatteryLevelForTAUnknownBeacon:a3 forClient:CLISP_ME_TOKEN];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1014E15BC;
  block[3] = &unk_10229FF28;
  block[4] = v7;
  block[5] = a3;
  block[6] = self;
  dispatch_group_notify((dispatch_group_t)[-[CLTrackingAvoidanceService universe](self, "universe") silo] fetchGroup, (dispatch_queue_t)[objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "silo") queue], block);
}

- (void)fetchAISInfoForNonPoshTAUnknownBeacon:(id)a3 client:(id)a4
{
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_10232A4C8);
  }
  id v6 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289283;
    int v10 = 0;
    __int16 v11 = 2082;
    id v12 = "";
    __int16 v13 = 2113;
    id v14 = [a3 identifier];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut #non-posh AIS fetch request\", \"uuid\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  BOOL v7 = [[CLTrackingAvoidanceAISFetchRecord alloc] initWithUUID:[a3 identifier] deviceType:[a3 deviceType]];
  -[CLXOTASubscription setObject:forKey:](self->_settingsSubscription.__ptr_.__value_, "setObject:forKey:", v7, [a3 identifier]);
  -[CLTrackingAvoidanceService scheduleAISFetchTimeoutForDevice:](self, "scheduleAISFetchTimeoutForDevice:", [a3 identifier]);
  if ([a3 deviceType] == (id)2)
  {
    dispatch_group_enter((dispatch_group_t)[(CLTrackingAvoidanceAISFetchRecord *)v7 fetchGroup]);
    [(CLDurianServiceProtocol *)self->_durianServiceProxy fetchHawkeyeAISManufacturerNameForTAUnknownBeacon:a3 forClient:CLISP_ME_TOKEN];
    dispatch_group_enter((dispatch_group_t)[(CLTrackingAvoidanceAISFetchRecord *)v7 fetchGroup]);
    [(CLDurianServiceProtocol *)self->_durianServiceProxy fetchHawkeyeAISModelNameForTAUnknownBeacon:a3 forClient:CLISP_ME_TOKEN];
    dispatch_group_enter((dispatch_group_t)[(CLTrackingAvoidanceAISFetchRecord *)v7 fetchGroup]);
    [(CLDurianServiceProtocol *)self->_durianServiceProxy fetchHawkeyeAISAccessoryCapabilitiesForTAUnknownBeacon:a3 forClient:CLISP_ME_TOKEN];
    dispatch_group_enter((dispatch_group_t)[(CLTrackingAvoidanceAISFetchRecord *)v7 fetchGroup]);
    [(CLDurianServiceProtocol *)self->_durianServiceProxy fetchHawkeyeAISFirmwareVersionForTAUnknownBeacon:a3 forClient:CLISP_ME_TOKEN];
  }
  dispatch_group_enter((dispatch_group_t)[(CLTrackingAvoidanceAISFetchRecord *)v7 fetchGroup]);
  [(CLDurianServiceProtocol *)self->_durianServiceProxy fetchHawkeyeAISProductDataForTAUnknownBeacon:a3 forClient:CLISP_ME_TOKEN];
  dispatch_group_enter((dispatch_group_t)[(CLTrackingAvoidanceAISFetchRecord *)v7 fetchGroup]);
  [(CLDurianServiceProtocol *)self->_durianServiceProxy fetchHawkeyeAISAccessoryCategoryForTAUnknownBeacon:a3 forClient:CLISP_ME_TOKEN];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1014E1A68;
  block[3] = &unk_10229FF28;
  block[4] = v7;
  block[5] = a3;
  block[6] = self;
  dispatch_group_notify((dispatch_group_t)[-[CLTrackingAvoidanceService universe](self, "universe") silo] fetchGroup, (dispatch_queue_t)[objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "silo") queue], block);
}

- (void)fetchAISInfoForTAUnknownBeacon:(id)a3 client:(id)a4
{
  SEL v7 = NSSelectorFromString(@"isPoshAccessory");
  BOOL v8 = (objc_opt_respondsToSelector() & 1) != 0 && [a3 performSelector:v7] != 0;
  if ([a3 deviceType] != (id)1 || v8)
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    __int16 v11 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 68289283;
      int v27 = 0;
      __int16 v28 = 2082;
      unint64_t v29 = "";
      __int16 v30 = 2113;
      id v31 = [a3 identifier];
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut AIS fetch request\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v26, 0x1Cu);
    }
    if (!-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:", [a3 identifier]))
    {
      if ([a3 identifier])
      {
        if (self->_durianServiceProxy)
        {
          if (!v8)
          {
            [(CLTrackingAvoidanceService *)self fetchAISInfoForNonPoshTAUnknownBeacon:a3 client:a4];
            return;
          }
          if (_os_feature_enabled_impl())
          {
            [(CLTrackingAvoidanceService *)self fetchAISInfoForPoshTAUnknownBeacon:a3 client:a4];
            return;
          }
          if (qword_102419490 != -1) {
            dispatch_once(&qword_102419490, &stru_10232A4C8);
          }
          uint64_t v23 = qword_102419498;
          if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
          {
            id v24 = [a3 identifier];
            int v26 = 68289283;
            int v27 = 0;
            __int16 v28 = 2082;
            unint64_t v29 = "";
            __int16 v30 = 2113;
            id v31 = v24;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ut skipping AIS fetch for posh accessories\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v26, 0x1Cu);
            if (qword_102419490 != -1) {
              dispatch_once(&qword_102419490, &stru_10232A4C8);
            }
          }
          uint64_t v21 = qword_102419498;
          if (!os_signpost_enabled((os_log_t)qword_102419498)) {
            return;
          }
          id v25 = [a3 identifier];
          int v26 = 68289283;
          int v27 = 0;
          __int16 v28 = 2082;
          unint64_t v29 = "";
          __int16 v30 = 2113;
          id v31 = v25;
          BOOL v15 = "#ut skipping AIS fetch for posh accessories";
          int v16 = "{\"msg%{public}.0s\":\"#ut skipping AIS fetch for posh accessories\", \"uuid\":%{private, location:escape_only}@}";
        }
        else
        {
          if (qword_102419490 != -1) {
            dispatch_once(&qword_102419490, &stru_10232A4C8);
          }
          int v19 = qword_102419498;
          if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
          {
            id v20 = [a3 identifier];
            int v26 = 68289283;
            int v27 = 0;
            __int16 v28 = 2082;
            unint64_t v29 = "";
            __int16 v30 = 2113;
            id v31 = v20;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ut durian service not ready\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v26, 0x1Cu);
            if (qword_102419490 != -1) {
              dispatch_once(&qword_102419490, &stru_10232A4C8);
            }
          }
          uint64_t v21 = qword_102419498;
          if (!os_signpost_enabled((os_log_t)qword_102419498)) {
            return;
          }
          id v22 = [a3 identifier];
          int v26 = 68289283;
          int v27 = 0;
          __int16 v28 = 2082;
          unint64_t v29 = "";
          __int16 v30 = 2113;
          id v31 = v22;
          BOOL v15 = "#ut durian service not ready";
          int v16 = "{\"msg%{public}.0s\":\"#ut durian service not ready\", \"uuid\":%{private, location:escape_only}@}";
        }
        BOOL v17 = v21;
        uint32_t v18 = 28;
      }
      else
      {
        if (qword_102419490 != -1) {
          dispatch_once(&qword_102419490, &stru_10232A4C8);
        }
        __int16 v13 = qword_102419498;
        if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_ERROR))
        {
          int v26 = 68289026;
          int v27 = 0;
          __int16 v28 = 2082;
          unint64_t v29 = "";
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ut AIS fetch received nil uuid\"}", (uint8_t *)&v26, 0x12u);
          if (qword_102419490 != -1) {
            dispatch_once(&qword_102419490, &stru_10232A4C8);
          }
        }
        uint64_t v14 = qword_102419498;
        if (!os_signpost_enabled((os_log_t)qword_102419498)) {
          return;
        }
        int v26 = 68289026;
        int v27 = 0;
        __int16 v28 = 2082;
        unint64_t v29 = "";
        BOOL v15 = "#ut AIS fetch received nil uuid";
        int v16 = "{\"msg%{public}.0s\":\"#ut AIS fetch received nil uuid\"}";
        BOOL v17 = v14;
        uint32_t v18 = 18;
      }
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v15, v16, (uint8_t *)&v26, v18);
      return;
    }
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    id v9 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [a3 identifier];
      int v26 = 68289283;
      int v27 = 0;
      __int16 v28 = 2082;
      unint64_t v29 = "";
      __int16 v30 = 2113;
      id v31 = v12;
      int v10 = "{\"msg%{public}.0s\":\"#ut AIS fetch skipping\", \"uuid\":%{private, location:escape_only}@}";
      goto LABEL_19;
    }
  }
  else
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    id v9 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 68289283;
      int v27 = 0;
      __int16 v28 = 2082;
      unint64_t v29 = "";
      __int16 v30 = 2113;
      id v31 = [a3 identifier];
      int v10 = "{\"msg%{public}.0s\":\"#ut skip AIS fetch due to durian type\", \"uuid\":%{private, location:escape_only}@}";
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v26, 0x1Cu);
    }
  }
}

- (void)stageTADetection:(id)a3 deviceType:(unint64_t)a4 detailsBitmask:(unsigned int)a5 client:(id)a6
{
  unint64_t v21 = a4;
  id v22 = a3;
  unsigned int v20 = a5;
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_10232A4C8);
  }
  int v10 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289795;
    int v24 = 0;
    __int16 v25 = 2082;
    int v26 = "";
    __int16 v27 = 2113;
    id v28 = a6;
    __int16 v29 = 2049;
    uint64_t v30 = a5;
    __int16 v31 = 2113;
    id v32 = a3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut force pushing staged Detections\", \"client\":%{private, location:escape_only}@, \"detailsBitmask\":%{private}ld, \"address\":%{private, location:escape_only}@}", buf, 0x30u);
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
  }
  __int16 v11 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289539;
    int v24 = 0;
    __int16 v25 = 2082;
    int v26 = "";
    __int16 v27 = 2113;
    id v28 = a6;
    __int16 v29 = 2049;
    uint64_t v30 = a5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut force staging Detections\", \"client\":%{private, location:escape_only}@, \"detailsBitmask\":%{private}ld}", buf, 0x26u);
  }
  SEL v12 = NSSelectorFromString(@"debugStageTADetection:deviceType:detailsBitmask:");
  SEL v13 = NSSelectorFromString(@"debugStageTADetection:deviceType:");
  if (objc_opt_respondsToSelector())
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    uint64_t v14 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289795;
      int v24 = 0;
      __int16 v25 = 2082;
      int v26 = "";
      __int16 v27 = 2113;
      id v28 = a6;
      __int16 v29 = 2049;
      uint64_t v30 = a5;
      __int16 v31 = 2113;
      id v32 = v22;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut #posh force pushing staged Detections\", \"client\":%{private, location:escape_only}@, \"detailsBitmask\":%{private}ld, \"address\":%{private, location:escape_only}@}", buf, 0x30u);
    }
    BOOL v15 = +[NSInvocation invocationWithMethodSignature:](NSInvocation, "invocationWithMethodSignature:", +[TATrackingAvoidanceServiceManager instanceMethodSignatureForSelector:v12]);
    [(NSInvocation *)v15 setSelector:v12];
    [(NSInvocation *)v15 setTarget:self->_taServiceManager];
    [(NSInvocation *)v15 setArgument:&v22 atIndex:2];
    [(NSInvocation *)v15 setArgument:&v21 atIndex:3];
    int v16 = (unint64_t *)&v20;
    BOOL v17 = v15;
    uint64_t v18 = 4;
  }
  else
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    int v19 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289795;
      int v24 = 0;
      __int16 v25 = 2082;
      int v26 = "";
      __int16 v27 = 2113;
      id v28 = a6;
      __int16 v29 = 2049;
      uint64_t v30 = a5;
      __int16 v31 = 2113;
      id v32 = v22;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut non-posh force pushing staged Detections\", \"client\":%{private, location:escape_only}@, \"detailsBitmask\":%{private}ld, \"address\":%{private, location:escape_only}@}", buf, 0x30u);
    }
    BOOL v15 = +[NSInvocation invocationWithMethodSignature:](NSInvocation, "invocationWithMethodSignature:", +[TATrackingAvoidanceServiceManager instanceMethodSignatureForSelector:v13]);
    [(NSInvocation *)v15 setSelector:v13];
    [(NSInvocation *)v15 setTarget:self->_taServiceManager];
    [(NSInvocation *)v15 setArgument:&v22 atIndex:2];
    int v16 = &v21;
    BOOL v17 = v15;
    uint64_t v18 = 3;
  }
  [(NSInvocation *)v17 setArgument:v16 atIndex:v18];
  [(NSInvocation *)v15 invoke];
}

- (void)forceSurfaceStagedDetections:(id)a3 deviceType:(unint64_t)a4 detailsBitmask:(unsigned int)a5 client:(id)a6
{
  unint64_t v19 = a4;
  id v20 = a3;
  unsigned int v18 = a5;
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_10232A4C8);
  }
  id v9 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289539;
    int v22 = 0;
    __int16 v23 = 2082;
    int v24 = "";
    __int16 v25 = 2113;
    id v26 = a6;
    __int16 v27 = 2049;
    uint64_t v28 = a5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut force pushing staged Detections\", \"client\":%{private, location:escape_only}@, \"detailsBitmask\":%{private}ld}", buf, 0x26u);
  }
  SEL v10 = NSSelectorFromString(@"debugForceSurfaceStagedDetections:deviceType:detailsBitmask:");
  SEL v11 = NSSelectorFromString(@"debugForceSurfaceStagedDetections:deviceType:");
  if (objc_opt_respondsToSelector())
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    SEL v12 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289795;
      int v22 = 0;
      __int16 v23 = 2082;
      int v24 = "";
      __int16 v25 = 2113;
      id v26 = a6;
      __int16 v27 = 2049;
      uint64_t v28 = a5;
      __int16 v29 = 2113;
      id v30 = v20;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut #posh force pushing staged Detections\", \"client\":%{private, location:escape_only}@, \"detailsBitmask\":%{private}ld, \"address\":%{private, location:escape_only}@}", buf, 0x30u);
    }
    SEL v13 = +[NSInvocation invocationWithMethodSignature:](NSInvocation, "invocationWithMethodSignature:", +[TATrackingAvoidanceServiceManager instanceMethodSignatureForSelector:v10]);
    [(NSInvocation *)v13 setSelector:v10];
    [(NSInvocation *)v13 setTarget:self->_taServiceManager];
    [(NSInvocation *)v13 setArgument:&v20 atIndex:2];
    [(NSInvocation *)v13 setArgument:&v19 atIndex:3];
    uint64_t v14 = (unint64_t *)&v18;
    BOOL v15 = v13;
    uint64_t v16 = 4;
  }
  else
  {
    if (qword_102419490 != -1) {
      dispatch_once(&qword_102419490, &stru_10232A4C8);
    }
    BOOL v17 = qword_102419498;
    if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289795;
      int v22 = 0;
      __int16 v23 = 2082;
      int v24 = "";
      __int16 v25 = 2113;
      id v26 = a6;
      __int16 v27 = 2049;
      uint64_t v28 = a5;
      __int16 v29 = 2113;
      id v30 = v20;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut non-posh force pushing staged Detections\", \"client\":%{private, location:escape_only}@, \"detailsBitmask\":%{private}ld, \"address\":%{private, location:escape_only}@}", buf, 0x30u);
    }
    SEL v13 = +[NSInvocation invocationWithMethodSignature:](NSInvocation, "invocationWithMethodSignature:", +[TATrackingAvoidanceServiceManager instanceMethodSignatureForSelector:v11]);
    [(NSInvocation *)v13 setSelector:v11];
    [(NSInvocation *)v13 setTarget:self->_taServiceManager];
    [(NSInvocation *)v13 setArgument:&v20 atIndex:2];
    uint64_t v14 = &v19;
    BOOL v15 = v13;
    uint64_t v16 = 3;
  }
  [(NSInvocation *)v15 setArgument:v14 atIndex:v16];
  [(NSInvocation *)v13 invoke];
}

- (void)fetchTAUnknownBeacon:(id)a3 withCompletion:(id)a4
{
}

- (void)didSuccessfullyPlayUnauthorizedSound:(id)a3 address:(id)a4
{
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_10232A4C8);
  }
  SEL v7 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 68289539;
    v9[1] = 0;
    __int16 v10 = 2082;
    SEL v11 = "";
    __int16 v12 = 2113;
    id v13 = a4;
    __int16 v14 = 2113;
    id v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut playsound success\", \"address\":%{private, location:escape_only}@, \"UUID\":%{private, location:escape_only}@}", (uint8_t *)v9, 0x26u);
  }
  id v8 = [objc_alloc((Class)TAPlaySoundSuccess) initWithUUID:a3 address:a4 successType:1 date:[NSDate now]];
  [(CLTrackingAvoidanceService *)self ingestTAEventIfTAServiceRunning:v8];
}

- (void)didUnsuccessfullyPlayUnauthorizedSound:(id)a3 address:(id)a4
{
  if (qword_102419490 != -1) {
    dispatch_once(&qword_102419490, &stru_10232A4C8);
  }
  SEL v7 = qword_102419498;
  if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 68289539;
    v9[1] = 0;
    __int16 v10 = 2082;
    SEL v11 = "";
    __int16 v12 = 2113;
    id v13 = a4;
    __int16 v14 = 2113;
    id v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut playsound failure\", \"address\":%{private, location:escape_only}@, \"UUID\":%{private, location:escape_only}@}", (uint8_t *)v9, 0x26u);
  }
  id v8 = [objc_alloc((Class)TAPlaySoundSuccess) initWithUUID:a3 address:a4 successType:0 date:[NSDate now]];
  [(CLTrackingAvoidanceService *)self ingestTAEventIfTAServiceRunning:v8];
}

- (void).cxx_destruct
{
  sub_10047E758((uint64_t *)&self->_metrics.lastLocationPrivate.demFlatnessMetricData, 0);
  double smoothedGPSAltitudeUncertainty = self->_metrics.lastLocationPrivate.smoothedGPSAltitudeUncertainty;
  if (smoothedGPSAltitudeUncertainty != 0.0) {
    sub_1000DB0A0(*(std::__shared_weak_count **)&smoothedGPSAltitudeUncertainty);
  }
  sub_1000DB264((uint64_t)&self->_metrics.state.detectedIds, (char *)self->_metrics.state.detectedIds.__tree_.__pair1_.__value_.__left_);
  sub_1000DB264((uint64_t)&self->_metrics, (char *)self->_metrics.state.uniqueIds.__tree_.__pair1_.__value_.__left_);
  value = self->_dataProtectionClient.__ptr_.__value_;
  self->_dataProtectionClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8))(value);
  }
  id v5 = self->_gnssClient.__ptr_.__value_;
  self->_gnssClient.__ptr_.__value_ = 0;
  if (v5) {
    (*(void (**)(Client *))(*(void *)v5 + 8))(v5);
  }
  id v6 = self->_clientManagerClient.__ptr_.__value_;
  self->_clientManagerClient.__ptr_.__value_ = 0;
  if (v6) {
    (*(void (**)(Client *))(*(void *)v6 + 8))(v6);
  }
  SEL v7 = self->_signalEnvironmentClient.__ptr_.__value_;
  self->_signalEnvironmentClient.__ptr_.__value_ = 0;
  if (v7) {
    (*(void (**)(Client *))(*(void *)v7 + 8))(v7);
  }
  id v8 = self->_bluetoothServiceClient.__ptr_.__value_;
  self->_bluetoothServiceClient.__ptr_.__value_ = 0;
  if (v8) {
    (*(void (**)(Client *))(*(void *)v8 + 8))(v8);
  }
  id v9 = self->_wifiServiceClient.__ptr_.__value_;
  self->_wifiServiceClient.__ptr_.__value_ = 0;
  if (v9) {
    (*(void (**)(Client *))(*(void *)v9 + 8))(v9);
  }
  __int16 v10 = self->_daemonStatusClient.__ptr_.__value_;
  self->_daemonStatusClient.__ptr_.__value_ = 0;
  if (v10) {
    (*(void (**)(Client *))(*(void *)v10 + 8))(v10);
  }
  SEL v11 = self->_locationClient.__ptr_.__value_;
  self->_locationClient.__ptr_.__value_ = 0;
  if (v11) {
    (*(void (**)(Client *))(*(void *)v11 + 8))(v11);
  }
  __int16 v12 = self->_motionStateClient.__ptr_.__value_;
  self->_motionStateClient.__ptr_.__value_ = 0;
  if (v12)
  {
    id v13 = *(void (**)(void))(*(void *)v12 + 8);
    v13();
  }
}

- (id).cxx_construct
{
  self->_motionStateClient.__ptr_.__value_ = 0;
  self->_locationClient.__ptr_.__value_ = 0;
  self->_daemonStatusClient.__ptr_.__value_ = 0;
  self->_wifiServiceClient.__ptr_.__value_ = 0;
  self->_bluetoothServiceClient.__ptr_.__value_ = 0;
  self->_signalEnvironmentClient.__ptr_.__value_ = 0;
  self->_clientManagerClient.__ptr_.__value_ = 0;
  self->_gnssClient.__ptr_.__value_ = 0;
  self->_dataProtectionClient.__ptr_.__value_ = 0;
  self->_metrics.state.uniqueIds.__tree_.__pair1_.__value_.__left_ = 0;
  self->_metrics.state.uniqueIds.__tree_.__begin_node_ = &self->_metrics.state.uniqueIds.__tree_.__pair1_;
  self->_metrics.state.detectedIds.__tree_.__pair3_.__value_ = 0;
  *(void *)&self->_metrics.state.suspiciousVisits = 0;
  self->_metrics.state.detectedIds.__tree_.__pair1_.__value_.__left_ = 0;
  self->_metrics.state.uniqueIds.__tree_.__pair3_.__value_ = 0;
  self->_metrics.state.detectedIds.__tree_.__begin_node_ = &self->_metrics.state.detectedIds.__tree_.__pair1_;
  self->_metrics.state.suspiciousOther = 0;
  self->_metrics.state.timeNextSent = 0.0;
  self->_metrics.state.sendHour = 0;
  self->_metrics.state.unitTest = 0;
  self->_metrics.state.nextWeeklySubmissionTime = 0.0;
  self->_metrics.state.weeklyCountOfSuspiciousDevices = 0;
  self->_metrics.state.nextMonthlySubmissionTime = 0.0;
  self->_metrics.state.monthlyCountOfSuspiciousDevices = 0;
  *(void *)&self->_metrics.signalEnvironment = 0xFFFF00000000;
  *(void *)&self->_metrics.lastLocation.suitability = 0;
  self->_metrics.lastLocation.coordinate.latitude = 0.0;
  *(_OWORD *)&self->_metrics.lastLocation.coordinate.longitude = xmmword_101D1C320;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&self->_metrics.lastLocation.altitude = _Q0;
  *(_OWORD *)&self->_metrics.lastLocation.speed = _Q0;
  *(_OWORD *)&self->_metrics.lastLocation.course = _Q0;
  LODWORD(self->_metrics.lastLocation.timestamp) = 0;
  *(double *)((char *)&self->_metrics.lastLocation.timestamp + 4) = -1.0;
  *(double *)((char *)&self->_metrics.lastLocation.lifespan + 4) = 0.0;
  *(void *)(&self->_metrics.lastLocation.confidence + 1) = 0;
  *(&self->_metrics.lastLocation.type + 1) = 0;
  self->_metrics.lastLocation.rawCoordinate.latitude = -1.0;
  LODWORD(self->_metrics.lastLocation.rawCoordinate.longitude) = 0x7FFFFFFF;
  *(double *)((char *)&self->_metrics.lastLocation.rawCourse + 4) = 0.0;
  *(double *)((char *)&self->_metrics.lastLocation.rawCoordinate.longitude + 4) = 0.0;
  LOBYTE(self->_metrics.lastLocation.rawReferenceFrame) = 0;
  *(void *)&self->_metrics.lastLocation.integrity = 0;
  sub_1000DBC34(&self->_metrics.lastLocation.signalEnvironmentType);
  self->_metrics.lastLocationPrivate.demFlatnessMetricData = 0;
  return self;
}

@end