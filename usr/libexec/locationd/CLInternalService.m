@interface CLInternalService
+ (BOOL)getEffectiveClientName:(id)a3 bundlePath:(id)a4 name:(void *)a5;
+ (id)getAsyncResponseSilo;
+ (id)getIntersiloDelegate;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- ($115C4C562B26FF47E01F9F4EA65B5887)currentToken;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CLInternalService)init;
- (NSXPCListener)listener;
- (double)groundAltitudeDistanceThreshold;
- (void)applyArchivedAuthorizationDecisions:(id)a3 withConfirmationToken:(id)a4 replyBlock:(id)a5;
- (void)beginService;
- (void)checkAndExerciseAuthorizationForBundleID:(id)a3 orBundlePath:(id)a4 services:(unint64_t)a5 replyBlock:(id)a6;
- (void)configure:(id)a3 replyBlock:(id)a4;
- (void)copyLastLogWithReplyBlock:(id)a3;
- (void)copyNearbyAssetSettings:(id)a3;
- (void)copyNearbyAssetSettingsOfAccessoryFile:(id)a3 withReply:(id)a4;
- (void)copyRoutineAssetSettings:(id)a3;
- (void)deleteCurrentEmergencyLocationAsset:(id)a3;
- (void)deleteInterestZoneWithId:(id)a3 registeredForBundleId:(id)a4 orBundlePath:(id)a5 replyBlock:(id)a6;
- (void)displayStatisticsWithReplyBlock:(id)a3;
- (void)dumpLogsWithDescription:(id)a3 replyBlock:(id)a4;
- (void)endService;
- (void)getAccessoryMotionSensorLogsWithReply:(id)a3;
- (void)getAccessoryPASCDTransmissionStateWithReplyBlock:(id)a3;
- (void)getAccessoryTypeBitSetWithReplyBlock:(id)a3;
- (void)getActiveClientsUsingLocationWithReplyBlock:(id)a3;
- (void)getActivitiesWithReplyBlock:(id)a3;
- (void)getAppsUsingLocationWithReplyBlock:(id)a3;
- (void)getArchivedAuthorizationDecisionsWithReplyBlock:(id)a3;
- (void)getAuthorizationPromptMapDisplayEnabledWithReplyBlock:(id)a3;
- (void)getAuthorizationStatusForAppWithAuditToken:(id *)a3 replyBlock:(id)a4;
- (void)getAuthorizationStatusForBundleID:(id)a3 orBundlePath:(id)a4 replyBlock:(id)a5;
- (void)getClientManagerInternalStateWithReplyBlock:(id)a3;
- (void)getControlPlaneStatusReportClear:(int)a3 replyBlock:(id)a4;
- (void)getEEDCloakingKeyWithReply:(id)a3;
- (void)getEEDEmergencyContactNamesWithReply:(id)a3;
- (void)getEmergencyLocationSettingsVersion:(id)a3;
- (void)getGestureServiceEnabledWithReplyBlock:(id)a3;
- (void)getGnssBandsInUseWithReplyBlock:(id)a3;
- (void)getGroundAltitudeForBundleID:(id)a3 orBundlePath:(id)a4 location:(id)a5 replyBlock:(id)a6;
- (void)getGyroCalibrationDatabaseBiasFitAtTemperature:(float)a3 withReply:(id)a4;
- (void)getGyroCalibrationDatabaseBiasFitAtTemplerature:(float)a3 replyBlock:(id)a4;
- (void)getIncidentalUseModeForBundleID:(id)a3 orBundlePath:(id)a4 replyBlock:(id)a5;
- (void)getLocationDefaultForKey:(id)a3 replyBlock:(id)a4;
- (void)getLocationForBundleID:(id)a3 orBundlePath:(id)a4 dynamicAccuracyReductionEnabled:(BOOL)a5 allowsAlteredAccessoryLocations:(BOOL)a6 replyBlock:(id)a7;
- (void)getLocationServicesEnabledWithReplyBlock:(id)a3;
- (void)getMicroLocationInternalVersionWithReplyBlock:(id)a3;
- (void)getMonitoredRegionsForBundleID:(id)a3 orBundlePath:(id)a4 replyBlock:(id)a5;
- (void)getMotionSensorLogsWithReply:(id)a3;
- (void)getOdometryBatchedLocationsWithReplyBlock:(id)a3;
- (void)getOscarTimeSyncWithReplyBlock:(id)a3;
- (void)getPipelinedCacheWithReply:(id)a3;
- (void)getPrecisionPermissionForBundleID:(id)a3 orBundlePath:(id)a4 replyBlock:(id)a5;
- (void)getPrivateMode:(id)a3;
- (void)getStatusBarIconEnabledForEntityClass:(unsigned int)a3 replyBlock:(id)a4;
- (void)getStatusBarIconState:(id)a3;
- (void)getTechnologiesInUseWithReplyBlock:(id)a3;
- (void)getTemporaryAuthorizationStatusForBundleId:(id)a3 orBundlePath:(id)a4 replyBlock:(id)a5;
- (void)getZaxisStatsWithReplyBlock:(id)a3;
- (void)gyroCalibrationDatabaseGetNumTemperaturesWithReplyBlock:(id)a3;
- (void)gyroCalibrationDatabaseSupportsMiniCalibrationWithReplyBlock:(id)a3;
- (void)gyroCalibrationDatabaseWipeWithReplyBlock:(id)a3;
- (void)insertGyroCalibrationDatabaseBiasEstimateIfValid:(id)a3 temperature:(float)a4 variance:(id)a5 timestamp:(double)a6 replyBlock:(id)a7;
- (void)modifyOrSetAuthorizationTime:(double)a3 forBundleID:(id)a4 orBundlePath:(id)a5 replyBlock:(id)a6;
- (void)notifyPassKitPayment:(id)a3 transaction:(id)a4 info:(id)a5;
- (void)notifyWeatherForecast:(id)a3 airQualityConditions:(id)a4 hourlyForecasts:(id)a5 dailyForecasts:(id)a6 latitude:(double)a7 longitude:(double)a8;
- (void)performMigrationWithReplyBlock:(id)a3;
- (void)pingDaemonWithReplyBlock:(id)a3;
- (void)registerCircularInterestZoneWithId:(id)a3 latitude:(double)a4 longitude:(double)a5 radius:(double)a6 serviceMaskOperator:(int)a7 provenanceType:(int)a8 forBundleId:(id)a9 orBundlePath:(id)a10 replyBlock:(id)a11;
- (void)registerPhenolicInterestZoneWithId:(id)a3 phenolicLocation:(int)a4 serviceMaskOperator:(int)a5 provenanceType:(int)a6 forBundleId:(id)a7 orBundlePath:(id)a8 replyBlock:(id)a9;
- (void)reportLocationUtilityEvent:(int)a3 atDate:(id)a4 withReplyBlock:(id)a5;
- (void)resetAllClientsWithReplyBlock:(id)a3;
- (void)resetClientForBundleId:(id)a3 orBundlePath:(id)a4 withReplyBlock:(id)a5;
- (void)setAuthorizationPromptMapDisplayEnabled:(BOOL)a3 replyBlock:(id)a4;
- (void)setAuthorizationStatus:(BOOL)a3 withCorrectiveCompensation:(int)a4 forBundleID:(id)a5 orBundlePath:(id)a6 replyBlock:(id)a7;
- (void)setAuthorizationStatusByType:(int)a3 withCorrectiveCompensation:(int)a4 andZoneIdentifier:(id)a5 andSubIdentityIdentifier:(id)a6 forBundleID:(id)a7 orBundlePath:(id)a8 replyBlock:(id)a9;
- (void)setBackgroundIndicatorEnabled:(BOOL)a3 forBundleID:(id)a4 orBundlePath:(id)a5 replyBlock:(id)a6;
- (void)setGestureServiceEnabled:(BOOL)a3 replyBlock:(id)a4;
- (void)setGroundAltitudeDistanceThreshold:(double)a3;
- (void)setIncidentalUseMode:(int)a3 forBundleID:(id)a4 orBundlePath:(id)a5 replyBlock:(id)a6;
- (void)setListener:(id)a3;
- (void)setLocationButtonUseMode:(int)a3 forBundleID:(id)a4 orBundlePath:(id)a5 replyBlock:(id)a6;
- (void)setLocationDefaultForKey:(id)a3 andValue:(id)a4 replyBlock:(id)a5;
- (void)setLocationServicesEnabled:(BOOL)a3 replyBlock:(id)a4;
- (void)setMapMatchingRouteHint:(id)a3 routingType:(int)a4 stepType:(int)a5 replyBlock:(id)a6;
- (void)setPrivateMode:(BOOL)a3 replyBlock:(id)a4;
- (void)setRelevance:(BOOL)a3 forInterestZoneWithId:(id)a4 registeredForBundleId:(id)a5 orBundlePath:(id)a6 replyBlock:(id)a7;
- (void)setStatusBarIconEnabledForEntityClass:(unsigned int)a3 enabled:(BOOL)a4 replyBlock:(id)a5;
- (void)setTemporaryAuthorizationGranted:(BOOL)a3 forBundleID:(id)a4 orBundlePath:(id)a5 orAuditToken:(id *)a6 byLocationButton:(BOOL)a7 voiceInteractionEnabled:(BOOL)a8 replyBlock:(id)a9;
- (void)setTemporaryAuthorizationStatusForBundleId:(id)a3 orBundlePath:(id)a4 statusData:(id)a5 replyBlock:(id)a6;
- (void)setTemporaryPreciseAuthorizationGranted:(BOOL)a3 forBundleID:(id)a4 orBundlePath:(id)a5 replyBlock:(id)a6;
- (void)setTrackRunHint:(id)a3 replyBlock:(id)a4;
- (void)shouldDisplayEEDUI:(id)a3;
- (void)shutdownDaemonWithReplyBlock:(id)a3;
- (void)startStopAdvertisingBeacon:(id)a3 atPower:(int)a4 replyBlock:(id)a5;
- (void)tearDownLocationAuthPromptForBundleID:(id)a3 orBundlePath:(id)a4 replyBlock:(id)a5;
- (void)timeZoneForLocation:(id *)a3 replyBlock:(id)a4;
- (void)triggerExpiredAuthorizationPurgeWithReplyBlock:(id)a3;
- (void)updatePillButtonChoiceForOutstandingPrompt:(int)a3 replyBlock:(id)a4;
- (void)updatePromptedLatitude:(double)a3 longitude:(double)a4 replyBlock:(id)a5;
@end

@implementation CLInternalService

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  if (qword_102489790 != -1) {
    dispatch_once(&qword_102489790, &stru_10234C860);
  }
  [a4 setExportedInterface:qword_102489788];
  [a4 setExportedObject:self];
  unsigned int v6 = [a4 processIdentifier];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1019F0F44;
  v11[3] = &unk_1023200C8;
  unsigned int v12 = v6;
  [a4 setInterruptionHandler:v11];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1019F1030;
  v9[3] = &unk_1023200C8;
  unsigned int v10 = v6;
  [a4 setInvalidationHandler:v9];
  [a4 _setQueue:[-[CLInternalService silo](self, "silo") queue]];
  [a4 resume];
  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  v7 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    int v14 = 0;
    __int16 v15 = 2082;
    v16 = "";
    __int16 v17 = 1026;
    unsigned int v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi, New connection resumed\", \"pid\":%{public}d}", buf, 0x18u);
  }
  return 1;
}

+ (BOOL)getEffectiveClientName:(id)a3 bundlePath:(id)a4 name:(void *)a5
{
  id v8 = objc_alloc_init((Class)NSAutoreleasePool);
  if (![a3 length] && !objc_msgSend(a4, "length")
    || (id v9 = -[NSXPCConnection valueForEntitlement:](+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), "valueForEntitlement:", @"com.apple.locationd.effective_bundle")) != 0&& (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)&& ([v9 BOOLValue] & 1) != 0)
  {
    if ([a3 length])
    {
      sub_100134750(__str, (char *)[a3 UTF8String]);
      sub_1000B7144((std::string *)__str, (uint64_t)buf);
      sub_1000B6DC8((uint64_t)a5, (long long *)buf);
      if (v42 < 0) {
        operator delete(__p);
      }
      if (v40 < 0) {
        operator delete(v39);
      }
      if (v38 < 0) {
        operator delete(v37);
      }
      if (v36 < 0) {
        operator delete(v35);
      }
      if (v34 < 0) {
        operator delete(v33);
      }
      if (v32 < 0) {
        operator delete(*(void **)&buf[24]);
      }
      if ((buf[23] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      if ((__str[23] & 0x80000000) != 0) {
        operator delete(*(void **)__str);
      }
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      unsigned int v10 = qword_102419528;
      if (!os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_66;
      }
      sub_1000A84C8((uint64_t)a5);
      v13 = (char *)*((void *)a5 + 13);
      unsigned int v12 = (char *)a5 + 104;
      v11 = v13;
      if (v12[23] >= 0) {
        v11 = v12;
      }
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = v11;
      int v14 = "{\"msg%{public}.0s\":\"#Spi, Called for bundle identifier\", \"bundleID\":%{public, location:escape_only}s}";
    }
    else
    {
      if (![a4 length])
      {
        v26 = +[NSXPCConnection currentConnection];
        if (v26) {
          [(NSXPCConnection *)v26 auditToken];
        }
        else {
          memset(__str, 0, sizeof(__str));
        }
        sub_10001BEC0(__str, (uint64_t)buf);
        sub_1000B6DC8((uint64_t)a5, (long long *)buf);
        if (v42 < 0) {
          operator delete(__p);
        }
        if (v40 < 0) {
          operator delete(v39);
        }
        if (v38 < 0) {
          operator delete(v37);
        }
        if (v36 < 0) {
          operator delete(v35);
        }
        if (v34 < 0) {
          operator delete(v33);
        }
        if (v32 < 0) {
          operator delete(*(void **)&buf[24]);
        }
        if ((buf[23] & 0x80000000) != 0) {
          operator delete(*(void **)buf);
        }
        goto LABEL_64;
      }
      sub_100134750(__str, (char *)[a4 UTF8String]);
      sub_1000B6F5C((std::string *)__str, (uint64_t)buf);
      sub_1000B6DC8((uint64_t)a5, (long long *)buf);
      if (v42 < 0) {
        operator delete(__p);
      }
      if (v40 < 0) {
        operator delete(v39);
      }
      if (v38 < 0) {
        operator delete(v37);
      }
      if (v36 < 0) {
        operator delete(v35);
      }
      if (v34 < 0) {
        operator delete(v33);
      }
      if (v32 < 0) {
        operator delete(*(void **)&buf[24]);
      }
      if ((buf[23] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      if ((__str[23] & 0x80000000) != 0) {
        operator delete(*(void **)__str);
      }
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      unsigned int v10 = qword_102419528;
      if (!os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_66;
      }
      v21 = (char *)*((void *)a5 + 6);
      v20 = (char *)a5 + 48;
      v19 = v21;
      if (v20[23] >= 0) {
        v19 = v20;
      }
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = v19;
      int v14 = "{\"msg%{public}.0s\":\"#Spi, Called for bundle path\", \"bundlePath\":%{public, location:escape_only}s}";
    }
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, v14, buf, 0x1Cu);
LABEL_64:
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
LABEL_66:
    v22 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v23 = &stru_10234F018;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = "";
      if (a3) {
        CFStringRef v24 = (const __CFString *)a3;
      }
      else {
        CFStringRef v24 = &stru_10234F018;
      }
      *(_DWORD *)buf = 68289538;
      *(_DWORD *)&uint8_t buf[4] = 0;
      if (a4) {
        CFStringRef v23 = (const __CFString *)a4;
      }
      *(_WORD *)&buf[18] = 2114;
      *(void *)&buf[20] = v24;
      *(_WORD *)&buf[28] = 2114;
      *(void *)&buf[30] = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"client getting effective client name\", \"bundleId\":%{public, location:escape_only}@, \"bundlePath\":%{public, location:escape_only}@}", buf, 0x26u);
    }
    BOOL v18 = 1;
    goto LABEL_74;
  }
  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  __int16 v15 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_ERROR))
  {
    CFStringRef v16 = &stru_10234F018;
    if (a3) {
      CFStringRef v17 = (const __CFString *)a3;
    }
    else {
      CFStringRef v17 = &stru_10234F018;
    }
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = @"com.apple.locationd.effective_bundle";
    *(_WORD *)&buf[12] = 2114;
    if (a4) {
      CFStringRef v16 = (const __CFString *)a4;
    }
    *(void *)&buf[14] = v17;
    *(_WORD *)&buf[22] = 2114;
    *(void *)&buf[24] = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "#Spi, requires entitlement '%{public}@' with bundle identifier '%{public}@' or bundle path '%{public}@'", buf, 0x20u);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    CFStringRef v27 = &stru_10234F018;
    if (a3) {
      CFStringRef v28 = (const __CFString *)a3;
    }
    else {
      CFStringRef v28 = &stru_10234F018;
    }
    *(_DWORD *)__str = 138543874;
    if (a4) {
      CFStringRef v27 = (const __CFString *)a4;
    }
    *(void *)&__str[4] = @"com.apple.locationd.effective_bundle";
    *(_WORD *)&__str[12] = 2114;
    *(void *)&__str[14] = v28;
    *(_WORD *)&__str[22] = 2114;
    *(void *)&__str[24] = v27;
    v29 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "+[CLInternalService getEffectiveClientName:bundlePath:name:]", "%s\n", v29);
    if (v29 != buf) {
      free(v29);
    }
  }
  BOOL v18 = 0;
LABEL_74:

  return v18;
}

- (void)getTechnologiesInUseWithReplyBlock:(id)a3
{
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  unsigned int v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetTechnologiesInUse (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  v7 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v26 = 0;
    __int16 v27 = 2082;
    CFStringRef v28 = "";
    __int16 v29 = 2082;
    v30 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetTechnologiesInUse\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v8 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.status"];
  if (v8
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    v22 = 0;
    uint64_t v23 = 0;
    v21 = (int *)&v22;
    if (objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLLocationController"), "syncgetActiveTechs:", &v21))
    {
      id v9 = objc_alloc((Class)NSMutableArray);
      id v10 = [v9 initWithCapacity:v23];
      v11 = v21;
      if (v21 != (int *)&v22)
      {
        do
        {
          if (v11[7] >= 1) {
            [v10 addObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:")]];
          }
          unsigned int v12 = (int *)*((void *)v11 + 1);
          if (v12)
          {
            do
            {
              v13 = v12;
              unsigned int v12 = *(int **)v12;
            }
            while (v12);
          }
          else
          {
            do
            {
              v13 = (int *)*((void *)v11 + 2);
              BOOL v14 = *(void *)v13 == (void)v11;
              v11 = v13;
            }
            while (!v14);
          }
          v11 = v13;
        }
        while (v13 != (int *)&v22);
      }
      (*((void (**)(id, void, id))a3 + 2))(a3, 0, v10);
    }
    else
    {
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      CFStringRef v17 = qword_102419528;
      if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#Spi, #warning Couldn't get active location technologies", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419520 != -1) {
          dispatch_once(&qword_102419520, &stru_10234CA70);
        }
        v20 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService getTechnologiesInUseWithReplyBlock:]", "%s\n", v20);
        if (v20 != (char *)buf) {
          free(v20);
        }
      }
      id v18 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
      (*((void (**)(id, id, void))a3 + 2))(a3, v18, 0);
    }
    sub_1000F5BB0((uint64_t)&v21, v22);
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    __int16 v15 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      LOWORD(v21) = 0;
      v19 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService getTechnologiesInUseWithReplyBlock:]", "%s\n", v19);
      if (v19 != (char *)buf) {
        free(v19);
      }
    }
    id v16 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id, void))a3 + 2))(a3, v16, 0);
  }
  os_activity_scope_leave(&state);
}

- (void)getAuthorizationStatusForBundleID:(id)a3 orBundlePath:(id)a4 replyBlock:(id)a5
{
  id v22 = objc_alloc_init((Class)NSAutoreleasePool);
  id v9 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetAuthorizationStatus (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v9, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v10 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v66 = 2082;
    v67 = "";
    __int16 v68 = 2082;
    *(void *)v69 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetAuthorizationStatus\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  *(_OWORD *)v44 = 0u;
  memset(v45, 0, 19);
  long long v42 = 0u;
  *(_OWORD *)v43 = 0u;
  *(_OWORD *)char v40 = 0u;
  *(_OWORD *)v41 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  memset(v49, 0, 27);
  if (+[CLInternalService getEffectiveClientName:a3 bundlePath:a4 name:v40])
  {
    if (self) {
      [(CLInternalService *)self currentToken];
    }
    else {
      memset(v39, 0, sizeof(v39));
    }
    CLConnection::getUserNameFromAuditToken((uint64_t *)buf, (CLConnection *)v39, v11);
    sub_1001A5B7C((std::string *)v40, (const std::string *)buf);
    if ((v69[3] & 0x80000000) != 0) {
      operator delete(*(void **)buf);
    }
    id v13 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLClientManager"];
    sub_100089AE0((char *)__dst, (long long *)v40);
    id v14 = [v13 syncgetClientEffectiveRegistrationResultWithTransientAwareness:sub_1000376D4((long long *)__dst)];
    if (v38 < 0) {
      operator delete(__p);
    }
    if (v36 < 0) {
      operator delete(v35);
    }
    if (v34 < 0) {
      operator delete(v33);
    }
    if (v32 < 0) {
      operator delete(v31);
    }
    if (v30 < 0) {
      operator delete(v29);
    }
    if (v28 < 0) {
      operator delete(v27);
    }
    if (v26 < 0) {
      operator delete(__dst[0]);
    }
    id v15 = [v13 syncgetRegistrationResultToAuthorizationStatus:v14];
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v16 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_INFO))
    {
      if (self) {
        [(CLInternalService *)self currentToken];
      }
      else {
        memset(v23, 0, sizeof(v23));
      }
      sub_10001BEC0(v23, (uint64_t)buf);
      sub_1000372B8((uint64_t)buf, &v24);
      if (v80 < 0) {
        operator delete(v79);
      }
      if (v78 < 0) {
        operator delete(v77);
      }
      if (v76 < 0) {
        operator delete(v75);
      }
      if (v74 < 0) {
        operator delete(v73);
      }
      if (v72 < 0) {
        operator delete(v71);
      }
      if (v70 < 0) {
        operator delete(*(void **)&v69[4]);
      }
      if ((v69[3] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        CFStringRef v17 = &v24;
      }
      else {
        CFStringRef v17 = (std::string *)v24.__r_.__value_.__r.__words[0];
      }
      sub_1000A7FBC((uint64_t)v40, (uint64_t)buf);
      int v18 = v69[3];
      v19 = *(uint8_t **)buf;
      v20 = sub_1001C28B0(v15);
      v21 = buf;
      *(_DWORD *)v51 = 68290306;
      if (v18 < 0) {
        v21 = v19;
      }
      int v52 = 0;
      __int16 v53 = 2082;
      v54 = "";
      __int16 v55 = 2082;
      v56 = v17;
      __int16 v57 = 2114;
      id v58 = a3;
      __int16 v59 = 2114;
      id v60 = a4;
      __int16 v61 = 2082;
      v62 = v21;
      __int16 v63 = 2082;
      v64 = v20;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Spi, Authorization status for BundleID or BundlePath\", \"bundle\":%{public, location:escape_only}s, \"SpecifiedBundleId\":%{public, location:escape_only}@, \"SpecifiedBundlePath\":%{public, location:escape_only}@, \"clientKey\":%{public, location:escape_only}s, \"status\":%{public, location:escape_only}s}", v51, 0x44u);
      if ((v69[3] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v24.__r_.__value_.__l.__data_);
      }
    }
    (*((void (**)(id, void, id))a5 + 2))(a5, 0, v15);
  }
  else
  {
    id v12 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
    (*((void (**)(id, id, void))a5 + 2))(a5, v12, 0);
  }
  if (SHIBYTE(v49[2]) < 0) {
    operator delete(v49[0]);
  }
  if (SHIBYTE(v48) < 0) {
    operator delete(*((void **)&v47 + 1));
  }
  if (SBYTE7(v47) < 0) {
    operator delete((void *)v46);
  }
  if ((v45[15] & 0x80000000) != 0) {
    operator delete(v44[1]);
  }
  if (SHIBYTE(v44[0]) < 0) {
    operator delete(v43[0]);
  }
  if (SHIBYTE(v42) < 0) {
    operator delete(v41[1]);
  }
  if (SHIBYTE(v41[0]) < 0) {
    operator delete(v40[0]);
  }
  os_activity_scope_leave(&state);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)currentToken
{
  result = +[NSXPCConnection currentConnection];
  if (result)
  {
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)[($115C4C562B26FF47E01F9F4EA65B5887 *)result auditToken];
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }
  return result;
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
  if (qword_102489780 != -1) {
    dispatch_once(&qword_102489780, &stru_10234C840);
  }
  return (id)qword_102489778;
}

- (CLInternalService)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLInternalService;
  return [(CLInternalService *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLInternalServiceSiloProtocol outboundProtocol:&OBJC_PROTOCOL___CLInternalServiceSiloClientProtocol];
}

- (void)beginService
{
  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  objc_super v3 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#Spi, beginService", (uint8_t *)buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    LOWORD(v11[0]) = 0;
    id v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService beginService]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  sub_1000C7F88(buf);
  v11[0] = 0.0;
  int v4 = sub_1000A699C(*(uint64_t *)&buf[0], "CLGetGroundAltitudeDistThres", v11);
  double v5 = v11[0];
  if (!v4) {
    double v5 = 80000.0;
  }
  self->_groundAltitudeDistanceThreshold = v5;
  if (*((void *)&buf[0] + 1)) {
    sub_1000DB0A0(*((std::__shared_weak_count **)&buf[0] + 1));
  }
  self->_listener = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.locationd.synchronous"];
  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  unsigned int v6 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    listener = self->_listener;
    LODWORD(buf[0]) = 138543362;
    *(void *)((char *)buf + 4) = listener;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "#Spi , Listener?, %{public}@", (uint8_t *)buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v9 = self->_listener;
    LODWORD(v11[0]) = 138543362;
    *(void *)((char *)v11 + 4) = v9;
    id v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService beginService]", "%s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  [-[CLInternalService listener](self, "listener") _setQueue:[-[CLInternalService silo](self, "silo") queue]];
  [(NSXPCListener *)[(CLInternalService *)self listener] setDelegate:self];
  [(NSXPCListener *)[(CLInternalService *)self listener] resume];
}

- (void)endService
{
  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  objc_super v3 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#Spi, endService", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    int v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService endService]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
}

+ (id)getIntersiloDelegate
{
  if (qword_1024897A0 != -1) {
    dispatch_once(&qword_1024897A0, &stru_10234C880);
  }
  return (id)qword_102489798;
}

+ (id)getAsyncResponseSilo
{
  if (qword_1024897B0 != -1) {
    dispatch_once(&qword_1024897B0, &stru_10234C8A0);
  }
  return (id)qword_1024897A8;
}

- (void)getAppsUsingLocationWithReplyBlock:(id)a3
{
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  unsigned int v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetAppsUsingLocation (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  v7 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v15 = 0;
    __int16 v16 = 2082;
    CFStringRef v17 = "";
    __int16 v18 = 2082;
    v19 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetAppsUsingLocation\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v8 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.status"];
  if (v8
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    id v9 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLClientManager"] syncgetCopyClients];
    if (v9)
    {
      (*((void (**)(id, void, id))a3 + 2))(a3, 0, v9);
    }
    else
    {
      id v9 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
      (*((void (**)(id, id, void))a3 + 2))(a3, v9, 0);
    }
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v10 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      id v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService getAppsUsingLocationWithReplyBlock:]", "%s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
    id v11 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id, void))a3 + 2))(a3, v11, 0);
  }
  os_activity_scope_leave(&state);
}

- (void)getActiveClientsUsingLocationWithReplyBlock:(id)a3
{
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  unsigned int v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetActiveClientsUsingLocation (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  v7 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v15 = 0;
    __int16 v16 = 2082;
    CFStringRef v17 = "";
    __int16 v18 = 2082;
    v19 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetActiveClientsUsingLocation\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v8 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.status"];
  if (v8
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    id v9 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLClientManager"] syncgetCopyClients];
    if (v9)
    {
      (*((void (**)(id, void, id))a3 + 2))(a3, 0, v9);
    }
    else
    {
      id v9 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
      (*((void (**)(id, id, void))a3 + 2))(a3, v9, 0);
    }
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v10 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      id v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService getActiveClientsUsingLocationWithReplyBlock:]", "%s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
    id v11 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id, void))a3 + 2))(a3, v11, 0);
  }
  os_activity_scope_leave(&state);
}

- (void)getClientManagerInternalStateWithReplyBlock:(id)a3
{
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  unsigned int v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetClientManagerInternalState (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  v7 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v16 = 0;
    __int16 v17 = 2082;
    __int16 v18 = "";
    __int16 v19 = 2082;
    v20 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetClientManagerInternalState\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v8 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.status"];
  if (v8
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1019F1D4C;
    v12[3] = &unk_10234C8C8;
    v12[4] = a3;
    [objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:forClient:", @"CLClientManager", @"CLInternalService") getClientManagerInternalStateWithReply:v12];
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v9 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      __int16 v13 = 0;
      id v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService getClientManagerInternalStateWithReplyBlock:]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
    id v10 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id, void))a3 + 2))(a3, v10, 0);
  }
  os_activity_scope_leave(&state);
}

- (void)getGnssBandsInUseWithReplyBlock:(id)a3
{
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  unsigned int v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetGnssBandsInUse (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  v7 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v24 = 0;
    __int16 v25 = 2082;
    char v26 = "";
    __int16 v27 = 2082;
    char v28 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetGnssBandsInUse\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v8 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.status"];
  if (v8
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    __p = 0;
    v20 = 0;
    uint64_t v21 = 0;
    if (objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLGnssProvider"), "syncgetActiveGnssBands:", &__p))
    {
      id v9 = objc_alloc((Class)NSMutableArray);
      id v10 = [v9 initWithCapacity:((char *)v20 - (unsigned char *)__p) >> 2];
      id v11 = (unsigned int *)__p;
      id v12 = v20;
      while (v11 != v12)
        [v10 addObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *v11++)]];
      (*((void (**)(id, void, id))a3 + 2))(a3, 0, v10);
    }
    else
    {
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      int v15 = qword_102419528;
      if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#Spi, #warning Couldn't get active GNSS bands", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419520 != -1) {
          dispatch_once(&qword_102419520, &stru_10234CA70);
        }
        __int16 v18 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService getGnssBandsInUseWithReplyBlock:]", "%s\n", v18);
        if (v18 != (char *)buf) {
          free(v18);
        }
      }
      id v16 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
      (*((void (**)(id, id, void))a3 + 2))(a3, v16, 0);
    }
    if (__p)
    {
      v20 = (unsigned int *)__p;
      operator delete(__p);
    }
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    __int16 v13 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      LOWORD(__p) = 0;
      __int16 v17 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService getGnssBandsInUseWithReplyBlock:]", "%s\n", v17);
      if (v17 != (char *)buf) {
        free(v17);
      }
    }
    id v14 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id, void))a3 + 2))(a3, v14, 0);
  }
  os_activity_scope_leave(&state);
}

- (void)setLocationDefaultForKey:(id)a3 andValue:(id)a4 replyBlock:(id)a5
{
  id v9 = objc_alloc_init((Class)NSAutoreleasePool);
  id v10 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonSetLocationDefault (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v10, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v11 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)char v30 = 2082;
    *(void *)&v30[2] = "";
    __int16 v31 = 2082;
    *(void *)char v32 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonSetLocationDefault\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v12 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.defaults_access"];
  if (v12
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v12 BOOLValue] & 1) != 0)
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    __int16 v13 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_INFO))
    {
      if (self) {
        [(CLInternalService *)self currentToken];
      }
      else {
        memset(v18, 0, sizeof(v18));
      }
      sub_10001BEC0(v18, (uint64_t)buf);
      sub_1000372B8((uint64_t)buf, &v19);
      if (v43 < 0) {
        operator delete(__p);
      }
      if (v41 < 0) {
        operator delete(v40);
      }
      if (v39 < 0) {
        operator delete(v38);
      }
      if (v37 < 0) {
        operator delete(v36);
      }
      if (v35 < 0) {
        operator delete(v34);
      }
      if (v33 < 0) {
        operator delete(*(void **)&v32[4]);
      }
      if ((v32[3] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      id v16 = &v19;
      if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        id v16 = (std::string *)v19.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)uint64_t v21 = 68289538;
      int v22 = 0;
      __int16 v23 = 2082;
      int v24 = "";
      __int16 v25 = 2114;
      id v26 = a3;
      __int16 v27 = 2082;
      char v28 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Spi, Setting default\", \"key\":%{public, location:escape_only}@, \"from\":%{public, location:escape_only}s}", v21, 0x26u);
      if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v19.__r_.__value_.__l.__data_);
      }
    }
    if (a4) {
      +[NSPropertyListSerialization propertyListWithData:a4 options:0 format:0 error:0];
    }
    sub_1000C7F88(buf);
    sub_1004D258C(*(uint64_t *)buf);
    if (*(void *)v30) {
      sub_1000DB0A0(*(std::__shared_weak_count **)v30);
    }
    (*((void (**)(id, void))a5 + 2))(a5, 0);
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v14 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      *(_WORD *)uint64_t v21 = 0;
      __int16 v17 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService setLocationDefaultForKey:andValue:replyBlock:]", "%s\n", v17);
      if (v17 != (char *)buf) {
        free(v17);
      }
    }
    id v15 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id))a5 + 2))(a5, v15);
  }
  os_activity_scope_leave(&state);
}

- (void)getLocationDefaultForKey:(id)a3 replyBlock:(id)a4
{
  id v7 = objc_alloc_init((Class)NSAutoreleasePool);
  id v8 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetLocationDefault (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v9 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)__int16 v27 = 2082;
    *(void *)&v27[2] = "";
    __int16 v28 = 2082;
    *(void *)__int16 v29 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetLocationDefault\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v10 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.defaults_access"];
  if (v10
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v10 BOOLValue] & 1) != 0)
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v11 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_INFO))
    {
      if (self) {
        [(CLInternalService *)self currentToken];
      }
      else {
        memset(v16, 0, sizeof(v16));
      }
      sub_10001BEC0(v16, (uint64_t)buf);
      sub_1000372B8((uint64_t)buf, &v17);
      if (v40 < 0) {
        operator delete(__p);
      }
      if (v38 < 0) {
        operator delete(v37);
      }
      if (v36 < 0) {
        operator delete(v35);
      }
      if (v34 < 0) {
        operator delete(v33);
      }
      if (v32 < 0) {
        operator delete(v31);
      }
      if (v30 < 0) {
        operator delete(*(void **)&v29[4]);
      }
      if ((v29[3] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      id v14 = &v17;
      if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        id v14 = (std::string *)v17.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)std::string v19 = 68289538;
      *(_DWORD *)&v19[4] = 0;
      __int16 v20 = 2082;
      uint64_t v21 = "";
      __int16 v22 = 2114;
      id v23 = a3;
      __int16 v24 = 2082;
      __int16 v25 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Spi, Getting default\", \"key\":%{public, location:escape_only}@, \"for\":%{public, location:escape_only}s}", v19, 0x26u);
      if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v17.__r_.__value_.__l.__data_);
      }
    }
    *(void *)std::string v19 = 0;
    sub_1000C7F88(buf);
    sub_1004D01D8(*(uint64_t *)buf, (uint64_t)a3, (CFTypeRef *)v19);
    if (*(void *)v27) {
      sub_1000DB0A0(*(std::__shared_weak_count **)v27);
    }
    if (*(void *)v19) {
      +[NSPropertyListSerialization dataWithPropertyList:*(void *)v19 format:200 options:0 error:0];
    }
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v12 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      *(_WORD *)std::string v19 = 0;
      id v15 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService getLocationDefaultForKey:replyBlock:]", "%s\n", v15);
      if (v15 != (char *)buf) {
        free(v15);
      }
    }
    id v13 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id, void))a4 + 2))(a4, v13, 0);
  }
  os_activity_scope_leave(&state);
}

- (void)timeZoneForLocation:(id *)a3 replyBlock:(id)a4
{
  id v6 = objc_alloc_init((Class)NSAutoreleasePool);
  id v7 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonTimeZoneAtLocation (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v7, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v8 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)&uint8_t buf[8] = 2082;
    *(void *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonTimeZoneAtLocation\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v9 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.time_zone"];
  if (v9
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v9 BOOLValue] & 1) != 0)
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v23 = 0;
    uint64_t v21 = 0;
    uint64_t v10 = sub_10065AD6C();
    long long v11 = *(_OWORD *)&a3->var11;
    long long v12 = *(_OWORD *)&a3->var14;
    $F24F406B2B787EFB06265DBA3D28CBD5 var13 = a3->var13;
    v32[0] = v12;
    *(_OWORD *)((char *)v32 + 12) = *(_OWORD *)&a3->var16;
    long long v13 = *(_OWORD *)&a3->var5;
    long long v26 = *(_OWORD *)&a3->var3;
    long long v27 = v13;
    long long v14 = *(_OWORD *)&a3->var9;
    long long v28 = *(_OWORD *)&a3->var7;
    long long v29 = v14;
    long long v30 = v11;
    long long v15 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)buf = *(_OWORD *)&a3->var0;
    *(_OWORD *)&buf[16] = v15;
    if (sub_10065B348(v10, (uint64_t)buf, (uint64_t)__p, (double *)&v21))
    {
      if (v23 >= 0) {
        id v16 = __p;
      }
      else {
        id v16 = (void **)__p[0];
      }
      (*((void (**)(id, void, NSString *))a4 + 2))(a4, 0, +[NSString stringWithUTF8String:v16]);
    }
    else
    {
      id v19 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
      (*((void (**)(id, id, void))a4 + 2))(a4, v19, 0);
    }
    if (SHIBYTE(v23) < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    std::string v17 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      LOWORD(__p[0]) = 0;
      __int16 v20 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService timeZoneForLocation:replyBlock:]", "%s\n", v20);
      if (v20 != buf) {
        free(v20);
      }
    }
    id v18 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id, void))a4 + 2))(a4, v18, 0);
  }
  os_activity_scope_leave(&state);
}

- (void)setAuthorizationStatus:(BOOL)a3 withCorrectiveCompensation:(int)a4 forBundleID:(id)a5 orBundlePath:(id)a6 replyBlock:(id)a7
{
  BOOL v10 = a3;
  id v12 = objc_alloc_init((Class)NSAutoreleasePool);
  long long v13 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonSetAuthorizationStatus (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v13, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  long long v14 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)&uint8_t buf[8] = 2082;
    *(void *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonSetAuthorizationStatus\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v15 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.authorizeapplications"];
  if (v15
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v15 BOOLValue] & 1) != 0)
  {
    if ([a5 length] || objc_msgSend(a6, "length"))
    {
      memset(v50, 0, 35);
      *(_OWORD *)v49 = 0u;
      *(_OWORD *)__p = 0u;
      memset(v48, 0, sizeof(v48));
      long long v51 = 0u;
      memset(v52, 0, 59);
      if ([a5 length])
      {
        sub_100134750(&__str, (char *)[a5 UTF8String]);
        sub_1000B7144(&__str, (uint64_t)buf);
      }
      else
      {
        if (![a6 length])
        {
LABEL_49:
          if (self) {
            [(CLInternalService *)self currentToken];
          }
          else {
            memset(v45, 0, sizeof(v45));
          }
          CLConnection::getUserNameFromAuditToken((uint64_t *)buf, (CLConnection *)v45, v16);
          sub_1001A5B7C((std::string *)__p, (const std::string *)buf);
          if ((buf[23] & 0x80000000) != 0) {
            operator delete(*(void **)buf);
          }
          if (v10) {
            uint64_t v20 = 3;
          }
          else {
            uint64_t v20 = 2;
          }
          id v21 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLClientManager"];
          sub_100089AE0((char *)__dst, (long long *)__p);
          id v22 = sub_1000376D4((long long *)__dst);
          if (self) {
            [(CLInternalService *)self currentToken];
          }
          else {
            memset(v30, 0, sizeof(v30));
          }
          sub_10001BEC0(v30, (uint64_t)buf);
          double v23 = sub_1000372B8((uint64_t)buf, &__str);
          if (SHIBYTE(v67) < 0) {
            operator delete((void *)v66);
          }
          if (SHIBYTE(v65) < 0) {
            operator delete((void *)v64);
          }
          if (SHIBYTE(v63) < 0) {
            operator delete((void *)v62);
          }
          if (SHIBYTE(v59) < 0) {
            operator delete((void *)v58);
          }
          if (SHIBYTE(v57) < 0) {
            operator delete((void *)v56);
          }
          if (SHIBYTE(v55) < 0) {
            operator delete(*(void **)&buf[24]);
          }
          if ((buf[23] & 0x80000000) != 0) {
            operator delete(*(void **)buf);
          }
          if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            p_str = &__str;
          }
          else {
            p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
          }
          [v21 setClientAuthorization:v22 zoneIdentifier:0 subIdentityIdentifier:0 status:v20 correctiveCompensation:a4 mayIncreaseAuth:[NSString stringWithUTF8String:p_str]];
          if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__str.__r_.__value_.__l.__data_);
          }
          if (v44 < 0) {
            operator delete(v43);
          }
          if (v42 < 0) {
            operator delete(v41);
          }
          if (v40 < 0) {
            operator delete(v39);
          }
          if (v38 < 0) {
            operator delete(v37);
          }
          if (v36 < 0) {
            operator delete(v35);
          }
          if (v34 < 0) {
            operator delete(v33);
          }
          if (v32 < 0) {
            operator delete(__dst[0]);
          }
          (*((void (**)(id, void))a7 + 2))(a7, 0);
          if (SBYTE7(v52[3]) < 0) {
            operator delete(*(void **)&v52[2]);
          }
          if (SHIBYTE(v52[1]) < 0) {
            operator delete(*((void **)&v52[0] + 1));
          }
          if (SBYTE7(v52[0]) < 0) {
            operator delete((void *)v51);
          }
          if (SHIBYTE(v50[3]) < 0) {
            operator delete(v50[1]);
          }
          if (SHIBYTE(v50[0]) < 0) {
            operator delete(v49[0]);
          }
          if (SHIBYTE(v48[3]) < 0) {
            operator delete(v48[1]);
          }
          if (SHIBYTE(v48[0]) < 0) {
            operator delete(__p[0]);
          }
          goto LABEL_18;
        }
        sub_100134750(&__str, (char *)[a6 UTF8String]);
        sub_1000B6F5C(&__str, (uint64_t)buf);
      }
      if (SHIBYTE(v48[0]) < 0) {
        operator delete(__p[0]);
      }
      *(_OWORD *)__p = *(_OWORD *)buf;
      v48[0] = *(void **)&buf[16];
      buf[23] = 0;
      buf[0] = 0;
      if (SHIBYTE(v48[3]) < 0) {
        operator delete(v48[1]);
      }
      *(_OWORD *)&v48[1] = *(_OWORD *)&buf[24];
      v48[3] = v55;
      HIBYTE(v55) = 0;
      buf[24] = 0;
      if (SHIBYTE(v50[0]) < 0) {
        operator delete(v49[0]);
      }
      *(_OWORD *)v49 = v56;
      v50[0] = v57;
      HIBYTE(v57) = 0;
      LOBYTE(v56) = 0;
      if (SHIBYTE(v50[3]) < 0) {
        operator delete(v50[1]);
      }
      *(_OWORD *)&v50[1] = v58;
      v50[3] = v59;
      HIBYTE(v59) = 0;
      LOBYTE(v58) = 0;
      LOWORD(v50[4]) = v60;
      BYTE2(v50[4]) = v61;
      if (SBYTE7(v52[0]) < 0) {
        operator delete((void *)v51);
      }
      long long v51 = v62;
      *(void *)&v52[0] = v63;
      HIBYTE(v63) = 0;
      LOBYTE(v62) = 0;
      if (SHIBYTE(v52[1]) < 0) {
        operator delete(*((void **)&v52[0] + 1));
      }
      char v19 = 0;
      *(_OWORD *)((char *)v52 + 8) = v64;
      *((void *)&v52[1] + 1) = v65;
      HIBYTE(v65) = 0;
      LOBYTE(v64) = 0;
      if (SBYTE7(v52[3]) < 0)
      {
        operator delete(*(void **)&v52[2]);
        char v19 = HIBYTE(v65);
      }
      v52[2] = v66;
      *(void *)&v52[3] = v67;
      HIBYTE(v67) = 0;
      LOBYTE(v66) = 0;
      WORD4(v52[3]) = v68;
      BYTE10(v52[3]) = v69;
      if (v19 < 0) {
        operator delete((void *)v64);
      }
      if (SHIBYTE(v63) < 0) {
        operator delete((void *)v62);
      }
      if (SHIBYTE(v59) < 0) {
        operator delete((void *)v58);
      }
      if (SHIBYTE(v57) < 0) {
        operator delete((void *)v56);
      }
      if (SHIBYTE(v55) < 0) {
        operator delete(*(void **)&buf[24]);
      }
      if ((buf[23] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__str.__r_.__value_.__l.__data_);
      }
      goto LABEL_49;
    }
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    __int16 v25 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_FAULT, "#Spi, Must provide a bundle identifier or bundle path for which to set location authorization status", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      LOWORD(__p[0]) = 0;
      long long v28 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLInternalService setAuthorizationStatus:withCorrectiveCompensation:forBundleID:orBundlePath:replyBlock:]", "%s\n", v28);
      if (v28 != buf) {
        free(v28);
      }
    }
    id v26 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
    (*((void (**)(id, id))a7 + 2))(a7, v26);
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    std::string v17 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      LOWORD(__p[0]) = 0;
      long long v27 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService setAuthorizationStatus:withCorrectiveCompensation:forBundleID:orBundlePath:replyBlock:]", "%s\n", v27);
      if (v27 != buf) {
        free(v27);
      }
    }
    id v18 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id))a7 + 2))(a7, v18);
  }
LABEL_18:
  os_activity_scope_leave(&state);
}

- (void)reportLocationUtilityEvent:(int)a3 atDate:(id)a4 withReplyBlock:(id)a5
{
  uint64_t v7 = *(void *)&a3;
  id v9 = objc_alloc_init((Class)NSAutoreleasePool);
  BOOL v10 = _os_activity_create((void *)&_mh_execute_header, "CL: -[CLInternalService reportLocationUtilityEvent:atDate:withReplyBlock:] (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v10, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  long long v11 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v19 = 0;
    __int16 v20 = 2082;
    id v21 = "";
    __int16 v22 = 2082;
    v23[0] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"-[CLInternalService reportLocationUtilityEvent:atDate:withReplyBlock:]\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v12 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.report_location_utility_event"];
  if (v12
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v12 BOOLValue] & 1) != 0)
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    long long v13 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289538;
      int v19 = 0;
      __int16 v20 = 2082;
      id v21 = "";
      __int16 v22 = 1026;
      LODWORD(v23[0]) = v7;
      WORD2(v23[0]) = 2114;
      *(void *)((char *)v23 + 6) = a4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi, #LocationUtilityEvent Reported\", \"utility\":%{public}d, \"date\":%{public, location:escape_only}@}", buf, 0x22u);
    }
    [objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLClientManager") reportLocationUtilityEvent:v7 atDate:a4];
    (*((void (**)(id, void))a5 + 2))(a5, 0);
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    long long v14 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      id v16 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService reportLocationUtilityEvent:atDate:withReplyBlock:]", "%s\n", v16);
      if (v16 != (char *)buf) {
        free(v16);
      }
    }
    id v15 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id))a5 + 2))(a5, v15);
  }
  os_activity_scope_leave(&state);
}

- (void)resetClientForBundleId:(id)a3 orBundlePath:(id)a4 withReplyBlock:(id)a5
{
  id v9 = objc_alloc_init((Class)NSAutoreleasePool);
  BOOL v10 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonResetClient (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v10, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  long long v11 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonResetClient\", \"event\":%{public, location:escape_only}s}", (uint8_t *)buf, 0x1Cu);
  }
  if (!((unint64_t)a3 | (unint64_t)a4))
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10234CA50);
    }
    id v18 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      buf[0].__r_.__value_.__r.__words[0] = 68289539;
      LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
      *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
      WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
      *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"assert";
      WORD2(buf[1].__r_.__value_.__r.__words[0]) = 2081;
      *(std::string::size_type *)((char *)buf[1].__r_.__value_.__r.__words + 6) = (std::string::size_type)"bundleId || bundlePath";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"bundleId or bundlePath must be provided to reset client authorization\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)buf, 0x26u);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_10234CA50);
      }
    }
    int v19 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      buf[0].__r_.__value_.__r.__words[0] = 68289539;
      LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
      *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
      WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
      *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"assert";
      WORD2(buf[1].__r_.__value_.__r.__words[0]) = 2081;
      *(std::string::size_type *)((char *)buf[1].__r_.__value_.__r.__words + 6) = (std::string::size_type)"bundleId || bundlePath";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "bundleId or bundlePath must be provided to reset client authorization", "{\"msg%{public}.0s\":\"bundleId or bundlePath must be provided to reset client authorization\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)buf, 0x26u);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_10234CA50);
      }
    }
    a5 = (id)qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
    {
      buf[0].__r_.__value_.__r.__words[0] = 68289539;
      LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
      *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
      WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
      *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"assert";
      WORD2(buf[1].__r_.__value_.__r.__words[0]) = 2081;
      *(std::string::size_type *)((char *)buf[1].__r_.__value_.__r.__words + 6) = (std::string::size_type)"bundleId || bundlePath";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)a5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"bundleId or bundlePath must be provided to reset client authorization\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)buf, 0x26u);
    }
    abort_report_np();
    __break(1u);
LABEL_80:
    dispatch_once(&qword_102419520, &stru_10234CA70);
    goto LABEL_42;
  }
  if ((sub_1019F4968(@"com.apple.locationd.clearauthorizations") & 1) != 0
    || (sub_1019F4968(@"com.apple.locationd.authorizeapplications") & 1) != 0)
  {
    memset(v41, 0, 35);
    *(_OWORD *)char v40 = 0u;
    memset(buf, 0, sizeof(buf));
    long long v42 = 0u;
    memset(v43, 0, 59);
    if ([a3 length])
    {
      sub_100134750(&__str, (char *)[a3 UTF8String]);
      sub_1000B7144(&__str, (uint64_t)&v22);
    }
    else
    {
      if (![a4 length]) {
        goto LABEL_39;
      }
      sub_100134750(&__str, (char *)[a4 UTF8String]);
      sub_1000B6F5C(&__str, (uint64_t)&v22);
    }
    if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf[0].__r_.__value_.__l.__data_);
    }
    buf[0] = v22;
    *((unsigned char *)&v22.__r_.__value_.__s + 23) = 0;
    v22.__r_.__value_.__s.__data_[0] = 0;
    if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf[1].__r_.__value_.__l.__data_);
    }
    buf[1] = v23;
    *((unsigned char *)&v23.__r_.__value_.__s + 23) = 0;
    v23.__r_.__value_.__s.__data_[0] = 0;
    if (SHIBYTE(v41[0]) < 0) {
      operator delete(v40[0]);
    }
    *(_OWORD *)char v40 = v24;
    v41[0] = v25;
    HIBYTE(v25) = 0;
    LOBYTE(v24) = 0;
    if (SHIBYTE(v41[3]) < 0) {
      operator delete(v41[1]);
    }
    *(_OWORD *)&v41[1] = v26;
    v41[3] = v27;
    HIBYTE(v27) = 0;
    LOBYTE(v26) = 0;
    LOWORD(v41[4]) = v28;
    BYTE2(v41[4]) = v29;
    if (SBYTE7(v43[0]) < 0) {
      operator delete((void *)v42);
    }
    long long v42 = v30;
    *(void *)&v43[0] = v31;
    HIBYTE(v31) = 0;
    LOBYTE(v30) = 0;
    if (SHIBYTE(v43[1]) < 0) {
      operator delete(*((void **)&v43[0] + 1));
    }
    char v13 = 0;
    *(_OWORD *)((char *)v43 + 8) = v32;
    *((void *)&v43[1] + 1) = v33;
    HIBYTE(v33) = 0;
    LOBYTE(v32) = 0;
    if (SBYTE7(v43[3]) < 0)
    {
      operator delete(*(void **)&v43[2]);
      char v13 = HIBYTE(v33);
    }
    v43[2] = v34;
    *(void *)&v43[3] = v35;
    HIBYTE(v35) = 0;
    LOBYTE(v34) = 0;
    WORD4(v43[3]) = v36;
    BYTE10(v43[3]) = v37;
    if (v13 < 0) {
      operator delete((void *)v32);
    }
    if (SHIBYTE(v31) < 0) {
      operator delete((void *)v30);
    }
    if (SHIBYTE(v27) < 0) {
      operator delete((void *)v26);
    }
    if (SHIBYTE(v25) < 0) {
      operator delete((void *)v24);
    }
    if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v23.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v22.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__str.__r_.__value_.__l.__data_);
      if (self) {
        goto LABEL_40;
      }
      goto LABEL_46;
    }
LABEL_39:
    if (self)
    {
LABEL_40:
      [(CLInternalService *)self currentToken];
LABEL_47:
      CLConnection::getUserNameFromAuditToken((uint64_t *)&v22, (CLConnection *)v20, v12);
      sub_1001A5B7C(buf, &v22);
      if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v22.__r_.__value_.__l.__data_);
      }
      id v16 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLClientManager"];
      sub_1000A7FBC((uint64_t)buf, (uint64_t)&v22);
      if ((v22.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string v17 = &v22;
      }
      else {
        std::string v17 = (std::string *)v22.__r_.__value_.__r.__words[0];
      }
      [v16 resetClient:[+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v17)]];
      if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v22.__r_.__value_.__l.__data_);
      }
      (*((void (**)(id, void))a5 + 2))(a5, 0);
      if (SBYTE7(v43[3]) < 0) {
        operator delete(*(void **)&v43[2]);
      }
      if (SHIBYTE(v43[1]) < 0) {
        operator delete(*((void **)&v43[0] + 1));
      }
      if (SBYTE7(v43[0]) < 0) {
        operator delete((void *)v42);
      }
      if (SHIBYTE(v41[3]) < 0) {
        operator delete(v41[1]);
      }
      if (SHIBYTE(v41[0]) < 0) {
        operator delete(v40[0]);
      }
      if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf[1].__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf[0].__r_.__value_.__l.__data_);
      }
      goto LABEL_68;
    }
LABEL_46:
    memset(v20, 0, sizeof(v20));
    goto LABEL_47;
  }
  if (qword_102419520 != -1) {
    goto LABEL_80;
  }
LABEL_42:
  long long v14 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289026;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi, connecting process isn't entitled, they shall not pass\"}", (uint8_t *)buf, 0x12u);
  }
  id v15 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
  (*((void (**)(id, id))a5 + 2))(a5, v15);

LABEL_68:
  os_activity_scope_leave(&state);
}

- (void)resetAllClientsWithReplyBlock:(id)a3
{
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  id v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonResetAllClients (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  uint64_t v7 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v19 = 2082;
    __int16 v20 = "";
    __int16 v21 = 2082;
    v22[0] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonResetAllClients\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v8 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.authorizeapplications"];
  if (v8
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    id v9 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLClientManager"];
    if (self) {
      [(CLInternalService *)self currentToken];
    }
    else {
      memset(v15, 0, sizeof(v15));
    }
    sub_10001BEC0(v15, (uint64_t)buf);
    double v12 = sub_1000372B8((uint64_t)buf, &v16);
    if (v33 < 0) {
      operator delete(__p);
    }
    if (v31 < 0) {
      operator delete(v30);
    }
    if (v29 < 0) {
      operator delete(v28);
    }
    if (v27 < 0) {
      operator delete(v26);
    }
    if (v25 < 0) {
      operator delete(v24);
    }
    if (v23 < 0) {
      operator delete(*(void **)((char *)v22 + 4));
    }
    if (SBYTE3(v22[0]) < 0) {
      operator delete(*(void **)buf);
    }
    if ((v16.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      char v13 = &v16;
    }
    else {
      char v13 = (std::string *)v16.__r_.__value_.__r.__words[0];
    }
    [v9 setLastLocationSettingsEventSource:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v13, v12)];
    if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v16.__r_.__value_.__l.__data_);
    }
    [v9 resetClients];
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    BOOL v10 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      LOWORD(v16.__r_.__value_.__l.__data_) = 0;
      long long v14 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService resetAllClientsWithReplyBlock:]", "%s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
    }
    id v11 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id))a3 + 2))(a3, v11);
  }
  os_activity_scope_leave(&state);
}

- (void)getArchivedAuthorizationDecisionsWithReplyBlock:(id)a3
{
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  id v6 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.archived_authorization_decisions"];
  if (v6
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v6 BOOLValue] & 1) != 0)
  {
    id v7 = [[objc_msgSend(-[CLInternalService vendor](self, "vendor")) proxyForService:@"CLClientManager"] syncgetArchivedAuthorizationDecisions];
    if (v7) {
      (*((void (**)(id, void, id))a3 + 2))(a3, 0, v7);
    }
    else {
      (*((void (**)(id, NSError *, void))a3 + 2))(a3, +[NSError errorWithDomain:kCLErrorDomainPrivate code:5 userInfo:0], 0);
    }
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v8 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      BOOL v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService getArchivedAuthorizationDecisionsWithReplyBlock:]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    id v9 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id, void))a3 + 2))(a3, v9, 0);
  }
}

- (void)applyArchivedAuthorizationDecisions:(id)a3 withConfirmationToken:(id)a4 replyBlock:(id)a5
{
  id v9 = objc_alloc_init((Class)NSAutoreleasePool);
  id v10 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.archived_authorization_decisions"];
  if (v10
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v10 BOOLValue] & 1) != 0)
  {
    (*((void (**)(id, id))a5 + 2))(a5, [objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLClientManager") syncgetApplyArchivedAuthorizationDecisionsAndDie:a3 unlessTokenMatches:a4]);
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v11 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      char v13 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService applyArchivedAuthorizationDecisions:withConfirmationToken:replyBlock:]", "%s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
    id v12 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id))a5 + 2))(a5, v12);
  }
}

- (void)setPrivateMode:(BOOL)a3 replyBlock:(id)a4
{
  BOOL v5 = a3;
  BOOL v24 = a3;
  id v7 = objc_alloc_init((Class)NSAutoreleasePool);
  id v8 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonSetPrivateMode (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v9 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v26 = 0;
    __int16 v27 = 2082;
    __int16 v28 = "";
    __int16 v29 = 2082;
    long long v30 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonSetPrivateMode\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v10 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.CoreLocation.PrivateMode"];
  if (v10
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v10 BOOLValue] & 1) != 0)
  {
    v22[0] = 0;
    uint64_t v11 = sub_1000A6958();
    char v12 = sub_1000D29FC(v11, @"PrivateMode", v22);
    if (v22[0] == v5) {
      char v13 = v12;
    }
    else {
      char v13 = 0;
    }
    if ((v13 & 1) == 0)
    {
      uint64_t v14 = sub_1000A6958();
      sub_1000EA52C(v14, @"PrivateMode", &v24);
      uint64_t v15 = sub_1000A6958();
      (*(void (**)(uint64_t))(*(void *)v15 + 944))(v15);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      std::string v16 = qword_102419528;
      if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 68289282;
        int v26 = 0;
        __int16 v27 = 2082;
        __int16 v28 = "";
        __int16 v29 = 1026;
        LODWORD(v30) = v24;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Spi, private mode changed\", \"privateModeEnabled\":%{public}hhd}", buf, 0x18u);
      }
      id v17 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLNetworkLocationProvider"];
      [v17 setPrivateMode:v24];
      id v18 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLHarvesterService"];
      [v18 setPrivateMode:v24];
    }
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    __int16 v19 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      *(_WORD *)std::string v22 = 0;
      __int16 v21 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService setPrivateMode:replyBlock:]", "%s\n", v21);
      if (v21 != (char *)buf) {
        free(v21);
      }
    }
    id v20 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id))a4 + 2))(a4, v20);
  }
  os_activity_scope_leave(&state);
}

- (void)getPrivateMode:(id)a3
{
  id v4 = objc_alloc_init((Class)NSAutoreleasePool);
  BOOL v5 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetPrivateMode (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v5, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v6 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v18 = 0;
    __int16 v19 = 2082;
    id v20 = "";
    __int16 v21 = 2082;
    std::string v22 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetPrivateMode\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v7 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.CoreLocation.PrivateMode"];
  if (v7
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v7 BOOLValue] & 1) != 0)
  {
    v15[0] = 0;
    uint64_t v8 = sub_1000A6958();
    unsigned int v9 = sub_1000D29FC(v8, @"PrivateMode", v15);
    if (v15[0]) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    uint64_t v11 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289282;
      int v18 = 0;
      __int16 v19 = 2082;
      id v20 = "";
      __int16 v21 = 1026;
      LODWORD(v22) = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"getPrivateMode called\", \"privateMode\":%{public}hhd}", buf, 0x18u);
    }
    (*((void (**)(id, void, uint64_t))a3 + 2))(a3, 0, v10);
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    char v12 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      *(_WORD *)uint64_t v15 = 0;
      uint64_t v14 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService getPrivateMode:]", "%s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
    }
    id v13 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id, void))a3 + 2))(a3, v13, 0);
  }
  os_activity_scope_leave(&state);
}

- (void)setLocationServicesEnabled:(BOOL)a3 replyBlock:(id)a4
{
  BOOL v5 = a3;
  id v7 = objc_alloc_init((Class)NSAutoreleasePool);
  uint64_t v8 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonSetLocationServicesEnabled (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  unsigned int v9 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v34 = 2082;
    uint64_t v35 = "";
    __int16 v36 = 2082;
    *(void *)char v37 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonSetLocationServicesEnabled\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v10 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.authorizeapplications"];
  if (v10
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v10 BOOLValue] & 1) != 0)
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    uint64_t v11 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      if (self) {
        [(CLInternalService *)self currentToken];
      }
      else {
        memset(v25, 0, sizeof(v25));
      }
      sub_10001BEC0(v25, (uint64_t)buf);
      sub_1000372B8((uint64_t)buf, v27);
      if (v48 < 0) {
        operator delete(__p);
      }
      if (v46 < 0) {
        operator delete(v45);
      }
      if (v44 < 0) {
        operator delete(v43);
      }
      if (v42 < 0) {
        operator delete(v41);
      }
      if (v40 < 0) {
        operator delete(v39);
      }
      if (v38 < 0) {
        operator delete(*(void **)&v37[4]);
      }
      if ((v37[3] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      uint64_t v14 = v27;
      if ((v27[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        uint64_t v14 = (std::string *)v27[0].__r_.__value_.__r.__words[0];
      }
      uint64_t v15 = "enabled";
      if (!v5) {
        uint64_t v15 = "disabled";
      }
      LODWORD(v28.__r_.__value_.__l.__data_) = 136446466;
      *(std::string::size_type *)((char *)v28.__r_.__value_.__r.__words + 4) = (std::string::size_type)v14;
      WORD2(v28.__r_.__value_.__r.__words[1]) = 2082;
      *(std::string::size_type *)((char *)&v28.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v15;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#Spi, %{public}s is setting location services to %{public}s", (uint8_t *)&v28, 0x16u);
      if (SHIBYTE(v27[0].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v27[0].__r_.__value_.__l.__data_);
      }
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      if (self) {
        [(CLInternalService *)self currentToken];
      }
      else {
        memset(v24, 0, sizeof(v24));
      }
      sub_10001BEC0(v24, (uint64_t)v27);
      sub_1000372B8((uint64_t)v27, &v28);
      sub_1000064D0((uint64_t)v27);
      id v20 = (std::string *)v28.__r_.__value_.__r.__words[0];
      __int16 v21 = "disabled";
      if ((v28.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        id v20 = &v28;
      }
      if (v5) {
        __int16 v21 = "enabled";
      }
      int v29 = 136446466;
      long long v30 = v20;
      __int16 v31 = 2082;
      long long v32 = v21;
      std::string v22 = (char *)_os_log_send_and_compose_impl();
      if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v28.__r_.__value_.__l.__data_);
      }
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService setLocationServicesEnabled:replyBlock:]", "%s\n", v22);
      if (v22 != (char *)buf) {
        free(v22);
      }
    }
    if (self) {
      [(CLInternalService *)self currentToken];
    }
    else {
      memset(v23, 0, sizeof(v23));
    }
    sub_10001BEC0(v23, (uint64_t)buf);
    double v16 = sub_1000372B8((uint64_t)buf, v27);
    if (v48 < 0) {
      operator delete(__p);
    }
    if (v46 < 0) {
      operator delete(v45);
    }
    if (v44 < 0) {
      operator delete(v43);
    }
    if (v42 < 0) {
      operator delete(v41);
    }
    if (v40 < 0) {
      operator delete(v39);
    }
    if (v38 < 0) {
      operator delete(*(void **)&v37[4]);
    }
    if ((v37[3] & 0x80000000) != 0) {
      operator delete(*(void **)buf);
    }
    if ((v27[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      id v17 = v27;
    }
    else {
      id v17 = (std::string *)v27[0].__r_.__value_.__r.__words[0];
    }
    int v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v17, v16);
    if (SHIBYTE(v27[0].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v27[0].__r_.__value_.__l.__data_);
    }
    [objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLClientManager") syncgetSetLocationServicesEnabledStatically:v5 withEventSource:v18];
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    char v12 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      LOWORD(v27[0].__r_.__value_.__l.__data_) = 0;
      __int16 v19 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService setLocationServicesEnabled:replyBlock:]", "%s\n", v19);
      if (v19 != (char *)buf) {
        free(v19);
      }
    }
    id v13 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id))a4 + 2))(a4, v13);
  }
  os_activity_scope_leave(&state);
}

- (void)getLocationServicesEnabledWithReplyBlock:(id)a3
{
  id v4 = objc_alloc_init((Class)NSAutoreleasePool);
  BOOL v5 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetLocationServicesEnabled (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v5, &v8);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v6 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v10 = 0;
    __int16 v11 = 2082;
    char v12 = "";
    __int16 v13 = 2082;
    uint64_t v14 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetLocationServicesEnabled\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  uint64_t v7 = sub_1001198CC();
  (*((void (**)(id, void, uint64_t))a3 + 2))(a3, 0, v7);
  os_activity_scope_leave(&v8);
}

- (void)setAuthorizationPromptMapDisplayEnabled:(BOOL)a3 replyBlock:(id)a4
{
  BOOL v5 = a3;
  BOOL v23 = a3;
  id v7 = objc_alloc_init((Class)NSAutoreleasePool);
  os_activity_scope_state_s v8 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonSetAuthorizationPromptMapDisplayEnabled (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  unsigned int v9 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)__int16 v31 = 2082;
    *(void *)&v31[2] = "";
    __int16 v32 = 2082;
    *(void *)char v33 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonSetAuthorizationPromptMapDisplayEnabled\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v10 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.authorizeapplications"];
  if (v10
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v10 BOOLValue] & 1) != 0)
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    __int16 v11 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      if (self) {
        [(CLInternalService *)self currentToken];
      }
      else {
        memset(v21, 0, sizeof(v21));
      }
      sub_10001BEC0(v21, (uint64_t)buf);
      sub_1000372B8((uint64_t)buf, v24);
      if (v44 < 0) {
        operator delete(__p);
      }
      if (v42 < 0) {
        operator delete(v41);
      }
      if (v40 < 0) {
        operator delete(v39);
      }
      if (v38 < 0) {
        operator delete(v37);
      }
      if (v36 < 0) {
        operator delete(v35);
      }
      if (v34 < 0) {
        operator delete(*(void **)&v33[4]);
      }
      if ((v33[3] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      uint64_t v14 = v24;
      if ((v24[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        uint64_t v14 = (std::string *)v24[0].__r_.__value_.__r.__words[0];
      }
      uint64_t v15 = "enabled";
      if (!v5) {
        uint64_t v15 = "disabled";
      }
      LODWORD(v25.__r_.__value_.__l.__data_) = 136446466;
      *(std::string::size_type *)((char *)v25.__r_.__value_.__r.__words + 4) = (std::string::size_type)v14;
      WORD2(v25.__r_.__value_.__r.__words[1]) = 2082;
      *(std::string::size_type *)((char *)&v25.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v15;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#Spi, %{public}s is setting authorization prompt map display to %{public}s", (uint8_t *)&v25, 0x16u);
      if (SHIBYTE(v24[0].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v24[0].__r_.__value_.__l.__data_);
      }
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      if (self) {
        [(CLInternalService *)self currentToken];
      }
      else {
        memset(v20, 0, sizeof(v20));
      }
      sub_10001BEC0(v20, (uint64_t)v24);
      sub_1000372B8((uint64_t)v24, &v25);
      sub_1000064D0((uint64_t)v24);
      id v17 = (std::string *)v25.__r_.__value_.__r.__words[0];
      int v18 = "disabled";
      if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        id v17 = &v25;
      }
      if (v5) {
        int v18 = "enabled";
      }
      int v26 = 136446466;
      __int16 v27 = v17;
      __int16 v28 = 2082;
      int v29 = v18;
      __int16 v19 = (char *)_os_log_send_and_compose_impl();
      if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v25.__r_.__value_.__l.__data_);
      }
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService setAuthorizationPromptMapDisplayEnabled:replyBlock:]", "%s\n", v19);
      if (v19 != (char *)buf) {
        free(v19);
      }
    }
    sub_1000C7F88(buf);
    sub_1000EA52C(*(uint64_t *)buf, @"AuthorizationPromptMapDisplayEnabled", &v23);
    if (*(void *)v31) {
      sub_1000DB0A0(*(std::__shared_weak_count **)v31);
    }
    sub_1000C7F88(buf);
    sub_10051F604(*(uint64_t *)buf);
    if (*(void *)v31) {
      sub_1000DB0A0(*(std::__shared_weak_count **)v31);
    }
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    char v12 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      LOWORD(v24[0].__r_.__value_.__l.__data_) = 0;
      double v16 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService setAuthorizationPromptMapDisplayEnabled:replyBlock:]", "%s\n", v16);
      if (v16 != (char *)buf) {
        free(v16);
      }
    }
    id v13 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id))a4 + 2))(a4, v13);
  }
  os_activity_scope_leave(&state);
}

- (void)getAuthorizationPromptMapDisplayEnabledWithReplyBlock:(id)a3
{
  id v4 = objc_alloc_init((Class)NSAutoreleasePool);
  BOOL v5 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetAuthorizationPromptMapDisplayEnabled (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v5, &v8);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v6 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v10 = 0;
    __int16 v11 = 2082;
    char v12 = "";
    __int16 v13 = 2082;
    uint64_t v14 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetAuthorizationPromptMapDisplayEnabled\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  BOOL v7 = sub_1004BDFF8();
  (*((void (**)(id, void, BOOL))a3 + 2))(a3, 0, v7);
  os_activity_scope_leave(&v8);
}

- (void)setGestureServiceEnabled:(BOOL)a3 replyBlock:(id)a4
{
  BOOL v34 = a3;
  id v6 = objc_alloc_init((Class)NSAutoreleasePool);
  BOOL v7 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonSetGestureServiceEnabled (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v7, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  os_activity_scope_state_s v8 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)&uint8_t buf[8] = 2082;
    *(void *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonSetGestureServiceEnabled\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v9 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.authorizeapplications"];
  if (v9
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v9 BOOLValue] & 1) != 0)
  {
    if (self) {
      [(CLInternalService *)self currentToken];
    }
    else {
      memset(buf, 0, 32);
    }
    sub_10001BEC0(buf, (uint64_t)&v19);
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    char v12 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      if (self) {
        [(CLInternalService *)self currentToken];
      }
      else {
        memset(v17, 0, sizeof(v17));
      }
      sub_10001BEC0(v17, (uint64_t)buf);
      sub_1000372B8((uint64_t)buf, &v18);
      if (v53 < 0) {
        operator delete(__p);
      }
      if (v51 < 0) {
        operator delete(v50);
      }
      if (v49 < 0) {
        operator delete(v48);
      }
      if (v47 < 0) {
        operator delete(v46);
      }
      if (v45 < 0) {
        operator delete(v44);
      }
      if ((char)buf[47] < 0) {
        operator delete(*(void **)&buf[24]);
      }
      if ((char)buf[23] < 0) {
        operator delete(*(void **)buf);
      }
      __int16 v13 = &v18;
      if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        __int16 v13 = (std::string *)v18.__r_.__value_.__r.__words[0];
      }
      uint64_t v14 = "enabled";
      *(_DWORD *)uint64_t v35 = 68289538;
      if (!v34) {
        uint64_t v14 = "disabled";
      }
      int v36 = 0;
      __int16 v37 = 2082;
      char v38 = "";
      __int16 v39 = 2082;
      char v40 = v13;
      __int16 v41 = 2082;
      char v42 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi, Setting ear gesture service\", \"bundle\":%{public, location:escape_only}s, \"setting\":%{public, location:escape_only}s}", v35, 0x26u);
      if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v18.__r_.__value_.__l.__data_);
      }
    }
    sub_1000C7F88(buf);
    sub_1000EA52C(*(uint64_t *)buf, @"GestureServiceEnabled", &v34);
    if (*(void *)&buf[8]) {
      sub_1000DB0A0(*(std::__shared_weak_count **)&buf[8]);
    }
    sub_1000C7F88(buf);
    sub_10051F604(*(uint64_t *)buf);
    if (*(void *)&buf[8]) {
      sub_1000DB0A0(*(std::__shared_weak_count **)&buf[8]);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.locationd/Prefs", 0, 0, 1u);
    (*((void (**)(id, void))a4 + 2))(a4, 0);
    if (v32 < 0) {
      operator delete(v31);
    }
    if (v30 < 0) {
      operator delete(v29);
    }
    if (v28 < 0) {
      operator delete(v27);
    }
    if (v26 < 0) {
      operator delete(v25);
    }
    if (v24 < 0) {
      operator delete(v23);
    }
    if (v22 < 0) {
      operator delete(v21);
    }
    if (v20 < 0) {
      operator delete(v19);
    }
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    int v10 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      LOWORD(v19) = 0;
      double v16 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService setGestureServiceEnabled:replyBlock:]", "%s\n", v16);
      if (v16 != (char *)buf) {
        free(v16);
      }
    }
    id v11 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id))a4 + 2))(a4, v11);
  }
  os_activity_scope_leave(&state);
}

- (void)setTemporaryAuthorizationStatusForBundleId:(id)a3 orBundlePath:(id)a4 statusData:(id)a5 replyBlock:(id)a6
{
  id v10 = objc_alloc_init((Class)NSAutoreleasePool);
  id v11 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLSetClientTransientAuthorizationInfo (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v11, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  char v12 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLSetClientTransientAuthorizationInfo\", \"event\":%{public, location:escape_only}s}", (uint8_t *)buf, 0x1Cu);
  }
  id v13 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.authorizeapplications"];
  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v13 BOOLValue])
    {
      memset(v57, 0, 35);
      long long v56 = 0u;
      memset(buf, 0, sizeof(buf));
      long long v58 = 0u;
      memset(v59, 0, 59);
      if ([a3 length])
      {
        sub_100134750(&__str, (char *)[a3 UTF8String]);
        sub_1000B7144(&__str, (uint64_t)v40);
      }
      else
      {
        if (![a4 length]) {
          goto LABEL_46;
        }
        sub_100134750(&__str, (char *)[a4 UTF8String]);
        sub_1000B6F5C(&__str, (uint64_t)v40);
      }
      if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf[0].__r_.__value_.__l.__data_);
      }
      buf[0] = *(std::string *)v40;
      v40[23] = 0;
      v40[0] = 0;
      if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf[1].__r_.__value_.__l.__data_);
      }
      buf[1] = *(std::string *)&v40[24];
      v40[47] = 0;
      v40[24] = 0;
      if (SHIBYTE(v57[0]) < 0) {
        operator delete((void *)v56);
      }
      long long v56 = v41;
      v57[0] = v42;
      HIBYTE(v42) = 0;
      LOBYTE(v41) = 0;
      if (SHIBYTE(v57[3]) < 0) {
        operator delete((void *)v57[1]);
      }
      *(_OWORD *)&v57[1] = v43;
      v57[3] = v44;
      HIBYTE(v44) = 0;
      LOBYTE(v43) = 0;
      LOWORD(v57[4]) = v45;
      BYTE2(v57[4]) = v46;
      if (SBYTE7(v59[0]) < 0) {
        operator delete((void *)v58);
      }
      long long v58 = v47;
      *(void *)&v59[0] = v48;
      HIBYTE(v48) = 0;
      LOBYTE(v47) = 0;
      if (SHIBYTE(v59[1]) < 0) {
        operator delete(*((void **)&v59[0] + 1));
      }
      char v17 = 0;
      *(_OWORD *)((char *)v59 + 8) = v49;
      *((void *)&v59[1] + 1) = v50;
      HIBYTE(v50) = 0;
      LOBYTE(v49) = 0;
      if (SBYTE7(v59[3]) < 0)
      {
        operator delete(*(void **)&v59[2]);
        char v17 = HIBYTE(v50);
      }
      v59[2] = v51;
      *(void *)&v59[3] = v52;
      HIBYTE(v52) = 0;
      LOBYTE(v51) = 0;
      WORD4(v59[3]) = v53;
      BYTE10(v59[3]) = v54;
      if (v17 < 0) {
        operator delete((void *)v49);
      }
      if (SHIBYTE(v48) < 0) {
        operator delete((void *)v47);
      }
      if (SHIBYTE(v44) < 0) {
        operator delete((void *)v43);
      }
      if (SHIBYTE(v42) < 0) {
        operator delete((void *)v41);
      }
      if ((v40[47] & 0x80000000) != 0) {
        operator delete(*(void **)&v40[24]);
      }
      if ((v40[23] & 0x80000000) != 0) {
        operator delete(*(void **)v40);
      }
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__str.__r_.__value_.__l.__data_);
        if (self) {
          goto LABEL_47;
        }
        goto LABEL_49;
      }
LABEL_46:
      if (self)
      {
LABEL_47:
        [(CLInternalService *)self currentToken];
LABEL_50:
        CLConnection::getUserNameFromAuditToken((uint64_t *)v40, (CLConnection *)v37, v14);
        sub_1001A5B7C(buf, (const std::string *)v40);
        if ((v40[23] & 0x80000000) != 0) {
          operator delete(*(void **)v40);
        }
        if (qword_102419520 != -1) {
          dispatch_once(&qword_102419520, &stru_10234CA70);
        }
        std::string v18 = qword_102419528;
        if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_INFO))
        {
          sub_1000372B8((uint64_t)buf, &__str);
          __int16 v19 = (__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
              ? &__str
              : (std::string *)__str.__r_.__value_.__r.__words[0];
          *(_DWORD *)char v40 = 68289282;
          *(_DWORD *)&v40[4] = 0;
          *(_WORD *)&v40[8] = 2082;
          *(void *)&v40[10] = "";
          *(_WORD *)&v40[18] = 2082;
          *(void *)&v40[20] = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"setting temporary authorization status info for client\", \"name\":%{public, location:escape_only}s}", v40, 0x1Cu);
          if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__str.__r_.__value_.__l.__data_);
          }
        }
        id v20 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLClientManager"];
        sub_100089AE0((char *)__dst, (long long *)buf);
        [v20 setTemporaryAuthorizationStatusInfoForClient:sub_1000376D4((long long *)__dst) data:a5];
        if (v36 < 0) {
          operator delete(v35);
        }
        if (v34 < 0) {
          operator delete(v33);
        }
        if (v32 < 0) {
          operator delete(v31);
        }
        if (v30 < 0) {
          operator delete(v29);
        }
        if (v28 < 0) {
          operator delete(v27);
        }
        if (v26 < 0) {
          operator delete(v25);
        }
        if (v24 < 0) {
          operator delete(__dst[0]);
        }
        (*((void (**)(id, void))a6 + 2))(a6, 0);
        if (SBYTE7(v59[3]) < 0) {
          operator delete(*(void **)&v59[2]);
        }
        if (SHIBYTE(v59[1]) < 0) {
          operator delete(*((void **)&v59[0] + 1));
        }
        if (SBYTE7(v59[0]) < 0) {
          operator delete((void *)v58);
        }
        if (SHIBYTE(v57[3]) < 0) {
          operator delete((void *)v57[1]);
        }
        if (SHIBYTE(v57[0]) < 0) {
          operator delete((void *)v56);
        }
        if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0) {
          operator delete(buf[1].__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
          operator delete(buf[0].__r_.__value_.__l.__data_);
        }
        goto LABEL_16;
      }
LABEL_49:
      memset(v37, 0, 32);
      goto LABEL_50;
    }
  }
  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  uint64_t v15 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", (uint8_t *)buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    *(_WORD *)char v40 = 0;
    __int16 v21 = (std::string *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService setTemporaryAuthorizationStatusForBundleId:orBundlePath:statusData:replyBlock:]", "%s\n", (const char *)v21);
    if (v21 != buf) {
      free(v21);
    }
  }
  id v16 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
  (*((void (**)(id, id))a6 + 2))(a6, v16);

LABEL_16:
  os_activity_scope_leave(&state);
}

- (void)getAuthorizationStatusForAppWithAuditToken:(id *)a3 replyBlock:(id)a4
{
  id v7 = objc_alloc_init((Class)NSAutoreleasePool);
  os_activity_scope_state_s v8 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetAuthorizationStatusForAppWithAuditToken (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v9 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v66 = 2082;
    uint64_t v67 = "";
    __int16 v68 = 2082;
    *(void *)char v69 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetAuthorizationStatusForAppWithAuditToken\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v10 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.effective_bundle"];
  if (v10
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v10 BOOLValue] & 1) != 0)
  {
    sub_10001BEC0(a3, (uint64_t)v40);
    id v11 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLClientManager"];
    sub_100089AE0((char *)__dst, (long long *)v40);
    id v12 = [v11 syncgetClientEffectiveRegistrationResultWithTransientAwareness:sub_1000376D4((long long *)__dst)];
    if (v39 < 0) {
      operator delete(__p);
    }
    if (v37 < 0) {
      operator delete(v36);
    }
    if (v35 < 0) {
      operator delete(v34);
    }
    if (v33 < 0) {
      operator delete(v32);
    }
    if (v31 < 0) {
      operator delete(v30);
    }
    if (v29 < 0) {
      operator delete(v28);
    }
    if (v27 < 0) {
      operator delete(__dst[0]);
    }
    id v13 = [v11 syncgetRegistrationResultToAuthorizationStatus:v12];
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    uint64_t v14 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_INFO))
    {
      long long v15 = *(_OWORD *)&a3->var0[4];
      v24[0] = *(_OWORD *)a3->var0;
      v24[1] = v15;
      sub_10001BEC0(v24, (uint64_t)buf);
      sub_1000372B8((uint64_t)buf, &v25);
      if (v80 < 0) {
        operator delete(v79);
      }
      if (v78 < 0) {
        operator delete(v77);
      }
      if (v76 < 0) {
        operator delete(v75);
      }
      if (v74 < 0) {
        operator delete(v73);
      }
      if (v72 < 0) {
        operator delete(v71);
      }
      if (v70 < 0) {
        operator delete(*(void **)&v69[4]);
      }
      if ((v69[3] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        id v16 = &v25;
      }
      else {
        id v16 = (std::string *)v25.__r_.__value_.__r.__words[0];
      }
      sub_1000A7FBC((uint64_t)v40, (uint64_t)buf);
      int v17 = v69[3];
      std::string v18 = *(uint8_t **)buf;
      __int16 v19 = sub_1001C28B0(v13);
      id v20 = buf;
      *(_DWORD *)__int16 v55 = 68289794;
      if (v17 < 0) {
        id v20 = v18;
      }
      int v56 = 0;
      __int16 v57 = 2082;
      long long v58 = "";
      __int16 v59 = 2082;
      __int16 v60 = v16;
      __int16 v61 = 2082;
      long long v62 = v20;
      __int16 v63 = 2082;
      long long v64 = v19;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Spi, Authorization status for App With Audit Token\", \"bundle\":%{public, location:escape_only}s, \"clientKey\":%{public, location:escape_only}s, \"status\":%{public, location:escape_only}s}", v55, 0x30u);
      if ((v69[3] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v25.__r_.__value_.__l.__data_);
      }
    }
    (*((void (**)(id, void, id))a4 + 2))(a4, 0, v13);
    if (v53 < 0) {
      operator delete(v52);
    }
    if (v51 < 0) {
      operator delete(v50);
    }
    if (v49 < 0) {
      operator delete(v48);
    }
    if (v47 < 0) {
      operator delete(v46);
    }
    if (v45 < 0) {
      operator delete(v44);
    }
    if (v43 < 0) {
      operator delete(v42);
    }
    if (v41 < 0) {
      operator delete(v40[0]);
    }
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    __int16 v21 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      LOWORD(v40[0]) = 0;
      BOOL v23 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService getAuthorizationStatusForAppWithAuditToken:replyBlock:]", "%s\n", v23);
      if (v23 != (char *)buf) {
        free(v23);
      }
    }
    id v22 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id, void))a4 + 2))(a4, v22, 0);
  }
  os_activity_scope_leave(&state);
}

- (void)getTemporaryAuthorizationStatusForBundleId:(id)a3 orBundlePath:(id)a4 replyBlock:(id)a5
{
  id v9 = objc_alloc_init((Class)NSAutoreleasePool);
  id v10 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLGetClientTransientAuthorizationInfo (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v10, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v11 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLGetClientTransientAuthorizationInfo\", \"event\":%{public, location:escape_only}s}", (uint8_t *)buf, 0x1Cu);
  }
  id v12 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.authorizeapplications"];
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v12 BOOLValue])
    {
      memset(v58, 0, 35);
      long long v57 = 0u;
      memset(buf, 0, sizeof(buf));
      long long v59 = 0u;
      memset(v60, 0, 59);
      if ([a3 length])
      {
        sub_100134750(&__str, (char *)[a3 UTF8String]);
        sub_1000B7144(&__str, (uint64_t)v41);
      }
      else
      {
        if (![a4 length]) {
          goto LABEL_46;
        }
        sub_100134750(&__str, (char *)[a4 UTF8String]);
        sub_1000B6F5C(&__str, (uint64_t)v41);
      }
      if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf[0].__r_.__value_.__l.__data_);
      }
      buf[0] = *(std::string *)v41;
      v41[23] = 0;
      v41[0] = 0;
      if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf[1].__r_.__value_.__l.__data_);
      }
      buf[1] = *(std::string *)&v41[24];
      v41[47] = 0;
      v41[24] = 0;
      if (SHIBYTE(v58[0]) < 0) {
        operator delete((void *)v57);
      }
      long long v57 = v42;
      v58[0] = v43;
      HIBYTE(v43) = 0;
      LOBYTE(v42) = 0;
      if (SHIBYTE(v58[3]) < 0) {
        operator delete((void *)v58[1]);
      }
      *(_OWORD *)&v58[1] = v44;
      v58[3] = v45;
      HIBYTE(v45) = 0;
      LOBYTE(v44) = 0;
      LOWORD(v58[4]) = v46;
      BYTE2(v58[4]) = v47;
      if (SBYTE7(v60[0]) < 0) {
        operator delete((void *)v59);
      }
      long long v59 = v48;
      *(void *)&v60[0] = v49;
      HIBYTE(v49) = 0;
      LOBYTE(v48) = 0;
      if (SHIBYTE(v60[1]) < 0) {
        operator delete(*((void **)&v60[0] + 1));
      }
      char v16 = 0;
      *(_OWORD *)((char *)v60 + 8) = v50;
      *((void *)&v60[1] + 1) = v51;
      HIBYTE(v51) = 0;
      LOBYTE(v50) = 0;
      if (SBYTE7(v60[3]) < 0)
      {
        operator delete(*(void **)&v60[2]);
        char v16 = HIBYTE(v51);
      }
      v60[2] = v52;
      *(void *)&v60[3] = v53;
      HIBYTE(v53) = 0;
      LOBYTE(v52) = 0;
      WORD4(v60[3]) = v54;
      BYTE10(v60[3]) = v55;
      if (v16 < 0) {
        operator delete((void *)v50);
      }
      if (SHIBYTE(v49) < 0) {
        operator delete((void *)v48);
      }
      if (SHIBYTE(v45) < 0) {
        operator delete((void *)v44);
      }
      if (SHIBYTE(v43) < 0) {
        operator delete((void *)v42);
      }
      if ((v41[47] & 0x80000000) != 0) {
        operator delete(*(void **)&v41[24]);
      }
      if ((v41[23] & 0x80000000) != 0) {
        operator delete(*(void **)v41);
      }
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__str.__r_.__value_.__l.__data_);
        if (self) {
          goto LABEL_47;
        }
        goto LABEL_49;
      }
LABEL_46:
      if (self)
      {
LABEL_47:
        [(CLInternalService *)self currentToken];
LABEL_50:
        CLConnection::getUserNameFromAuditToken((uint64_t *)v41, (CLConnection *)v38, v13);
        sub_1001A5B7C(buf, (const std::string *)v41);
        if ((v41[23] & 0x80000000) != 0) {
          operator delete(*(void **)v41);
        }
        if (qword_102419520 != -1) {
          dispatch_once(&qword_102419520, &stru_10234CA70);
        }
        int v17 = qword_102419528;
        if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_INFO))
        {
          sub_1000372B8((uint64_t)buf, &__str);
          std::string v18 = (__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
              ? &__str
              : (std::string *)__str.__r_.__value_.__r.__words[0];
          *(_DWORD *)char v41 = 68289282;
          *(_DWORD *)&v41[4] = 0;
          *(_WORD *)&v41[8] = 2082;
          *(void *)&v41[10] = "";
          *(_WORD *)&v41[18] = 2082;
          *(void *)&v41[20] = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"getting temporary authorization status info for client, if applicable\", \"name\":%{public, location:escape_only}s}", v41, 0x1Cu);
          if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__str.__r_.__value_.__l.__data_);
          }
        }
        id v19 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLClientManager"];
        sub_100089AE0((char *)__dst, (long long *)buf);
        id v20 = [v19 syncgetTemporaryAuthorizationStatusForClient:sub_1000376D4((long long *)__dst)];
        if (v37 < 0) {
          operator delete(v36);
        }
        if (v35 < 0) {
          operator delete(v34);
        }
        if (v33 < 0) {
          operator delete(v32);
        }
        if (v31 < 0) {
          operator delete(v30);
        }
        if (v29 < 0) {
          operator delete(v28);
        }
        if (v27 < 0) {
          operator delete(v26);
        }
        if (v25 < 0) {
          operator delete(__dst[0]);
        }
        if (qword_102419520 != -1) {
          dispatch_once(&qword_102419520, &stru_10234CA70);
        }
        __int16 v21 = qword_102419528;
        if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_INFO))
        {
          sub_1000372B8((uint64_t)buf, &__str);
          id v22 = (__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
              ? &__str
              : (std::string *)__str.__r_.__value_.__r.__words[0];
          *(_DWORD *)char v41 = 68289282;
          *(_DWORD *)&v41[4] = 0;
          *(_WORD *)&v41[8] = 2082;
          *(void *)&v41[10] = "";
          *(_WORD *)&v41[18] = 2082;
          *(void *)&v41[20] = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"temporary auth replying for client\", \"name\":%{public, location:escape_only}s}", v41, 0x1Cu);
          if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__str.__r_.__value_.__l.__data_);
          }
        }
        (*((void (**)(id, void, id))a5 + 2))(a5, 0, v20);
        if (SBYTE7(v60[3]) < 0) {
          operator delete(*(void **)&v60[2]);
        }
        if (SHIBYTE(v60[1]) < 0) {
          operator delete(*((void **)&v60[0] + 1));
        }
        if (SBYTE7(v60[0]) < 0) {
          operator delete((void *)v59);
        }
        if (SHIBYTE(v58[3]) < 0) {
          operator delete((void *)v58[1]);
        }
        if (SHIBYTE(v58[0]) < 0) {
          operator delete((void *)v57);
        }
        if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0) {
          operator delete(buf[1].__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
          operator delete(buf[0].__r_.__value_.__l.__data_);
        }
        goto LABEL_16;
      }
LABEL_49:
      memset(v38, 0, 32);
      goto LABEL_50;
    }
  }
  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  uint64_t v14 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", (uint8_t *)buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    *(_WORD *)char v41 = 0;
    BOOL v23 = (std::string *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService getTemporaryAuthorizationStatusForBundleId:orBundlePath:replyBlock:]", "%s\n", (const char *)v23);
    if (v23 != buf) {
      free(v23);
    }
  }
  id v15 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
  (*((void (**)(id, id, void))a5 + 2))(a5, v15, 0);

LABEL_16:
  os_activity_scope_leave(&state);
}

- (void)modifyOrSetAuthorizationTime:(double)a3 forBundleID:(id)a4 orBundlePath:(id)a5 replyBlock:(id)a6
{
  id v11 = objc_alloc_init((Class)NSAutoreleasePool);
  id v12 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLInternalChangeClientAuthorizationTime (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v12, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v13 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)&uint8_t buf[8] = 2082;
    *(void *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLInternalChangeClientAuthorizationTime\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v14 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.integritycheck"];
  if (v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v14 BOOLValue])
    {
      id v15 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLClientManager"];
      memset(v44, 0, 35);
      long long v43 = 0u;
      memset(__p, 0, sizeof(__p));
      long long v45 = 0u;
      memset(v46, 0, 59);
      if ([a4 length])
      {
        sub_100134750(&v50, (char *)[a4 UTF8String]);
        sub_1000B7144(&v50, (uint64_t)buf);
      }
      else
      {
        if (![a5 length]) {
          goto LABEL_46;
        }
        sub_100134750(&v50, (char *)[a5 UTF8String]);
        sub_1000B6F5C(&v50, (uint64_t)buf);
      }
      if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p[0].__r_.__value_.__l.__data_);
      }
      __p[0] = *(std::string *)buf;
      buf[23] = 0;
      buf[0] = 0;
      if (SHIBYTE(__p[1].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p[1].__r_.__value_.__l.__data_);
      }
      __p[1] = *(std::string *)&buf[24];
      buf[47] = 0;
      buf[24] = 0;
      if (SHIBYTE(v44[0]) < 0) {
        operator delete((void *)v43);
      }
      long long v43 = v52;
      v44[0] = v53;
      HIBYTE(v53) = 0;
      LOBYTE(v52) = 0;
      if (SHIBYTE(v44[3]) < 0) {
        operator delete((void *)v44[1]);
      }
      *(_OWORD *)&v44[1] = v54;
      v44[3] = v55;
      HIBYTE(v55) = 0;
      LOBYTE(v54) = 0;
      LOWORD(v44[4]) = v56;
      BYTE2(v44[4]) = v57;
      if (SBYTE7(v46[0]) < 0) {
        operator delete((void *)v45);
      }
      long long v45 = v58;
      *(void *)&v46[0] = v59;
      HIBYTE(v59) = 0;
      LOBYTE(v58) = 0;
      if (SHIBYTE(v46[1]) < 0) {
        operator delete(*((void **)&v46[0] + 1));
      }
      char v19 = 0;
      *(_OWORD *)((char *)v46 + 8) = v60;
      *((void *)&v46[1] + 1) = v61;
      HIBYTE(v61) = 0;
      LOBYTE(v60) = 0;
      if (SBYTE7(v46[3]) < 0)
      {
        operator delete(*(void **)&v46[2]);
        char v19 = HIBYTE(v61);
      }
      v46[2] = v62;
      *(void *)&v46[3] = v63;
      HIBYTE(v63) = 0;
      LOBYTE(v62) = 0;
      WORD4(v46[3]) = v64;
      BYTE10(v46[3]) = v65;
      if (v19 < 0) {
        operator delete((void *)v60);
      }
      if (SHIBYTE(v59) < 0) {
        operator delete((void *)v58);
      }
      if (SHIBYTE(v55) < 0) {
        operator delete((void *)v54);
      }
      if (SHIBYTE(v53) < 0) {
        operator delete((void *)v52);
      }
      if ((buf[47] & 0x80000000) != 0) {
        operator delete(*(void **)&buf[24]);
      }
      if ((buf[23] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v50.__r_.__value_.__l.__data_);
        if (self) {
          goto LABEL_47;
        }
        goto LABEL_49;
      }
LABEL_46:
      if (self)
      {
LABEL_47:
        [(CLInternalService *)self currentToken];
LABEL_50:
        CLConnection::getUserNameFromAuditToken((uint64_t *)buf, (CLConnection *)v41, v16);
        sub_1001A5B7C(__p, (const std::string *)buf);
        if ((buf[23] & 0x80000000) != 0) {
          operator delete(*(void **)buf);
        }
        if (qword_102419520 != -1) {
          dispatch_once(&qword_102419520, &stru_10234CA70);
        }
        id v20 = qword_102419528;
        if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_INFO))
        {
          sub_1000372B8((uint64_t)__p, (std::string *)buf);
          __int16 v21 = buf[23] >= 0 ? buf : *(unsigned char **)buf;
          LODWORD(v50.__r_.__value_.__l.__data_) = 136315138;
          *(std::string::size_type *)((char *)v50.__r_.__value_.__r.__words + 4) = (std::string::size_type)v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "#appclip updating for %s", (uint8_t *)&v50, 0xCu);
          if ((buf[23] & 0x80000000) != 0) {
            operator delete(*(void **)buf);
          }
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419520 != -1) {
            dispatch_once(&qword_102419520, &stru_10234CA70);
          }
          sub_1000372B8((uint64_t)__p, &v50);
          if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            char v25 = &v50;
          }
          else {
            char v25 = (std::string *)v50.__r_.__value_.__r.__words[0];
          }
          int v48 = 136315138;
          uint64_t v49 = v25;
          char v26 = (char *)_os_log_send_and_compose_impl();
          if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v50.__r_.__value_.__l.__data_);
          }
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService modifyOrSetAuthorizationTime:forBundleID:orBundlePath:replyBlock:]", "%s\n", v26);
          if (v26 != buf) {
            free(v26);
          }
        }
        sub_100089AE0((char *)__dst, (long long *)__p);
        [v15 syncgetAndSetOrChangeAppClipAuthorizationTime:sub_1000376D4((long long *)__dst) forClient:a3];
        double v23 = v22;
        if (v40 < 0) {
          operator delete(v39);
        }
        if (v38 < 0) {
          operator delete(v37);
        }
        if (v36 < 0) {
          operator delete(v35);
        }
        if (v34 < 0) {
          operator delete(v33);
        }
        if (v32 < 0) {
          operator delete(v31);
        }
        if (v30 < 0) {
          operator delete(v29);
        }
        if (v28 < 0) {
          operator delete(__dst[0]);
        }
        (*((void (**)(id, void, double))a6 + 2))(a6, 0, v23);
        if (SBYTE7(v46[3]) < 0) {
          operator delete(*(void **)&v46[2]);
        }
        if (SHIBYTE(v46[1]) < 0) {
          operator delete(*((void **)&v46[0] + 1));
        }
        if (SBYTE7(v46[0]) < 0) {
          operator delete((void *)v45);
        }
        if (SHIBYTE(v44[3]) < 0) {
          operator delete((void *)v44[1]);
        }
        if (SHIBYTE(v44[0]) < 0) {
          operator delete((void *)v43);
        }
        if (SHIBYTE(__p[1].__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p[1].__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p[0].__r_.__value_.__l.__data_);
        }
        goto LABEL_16;
      }
LABEL_49:
      memset(v41, 0, sizeof(v41));
      goto LABEL_50;
    }
  }
  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  int v17 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    LOWORD(__p[0].__r_.__value_.__l.__data_) = 0;
    char v24 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService modifyOrSetAuthorizationTime:forBundleID:orBundlePath:replyBlock:]", "%s\n", v24);
    if (v24 != buf) {
      free(v24);
    }
  }
  id v18 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
  (*((void (**)(id, id, double))a6 + 2))(a6, v18, -1.0);

LABEL_16:
  os_activity_scope_leave(&state);
}

- (void)triggerExpiredAuthorizationPurgeWithReplyBlock:(id)a3
{
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  id v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLInternalTriggerExpiredAuthorizationPurge (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v7 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v14 = 0;
    __int16 v15 = 2082;
    char v16 = "";
    __int16 v17 = 2082;
    id v18 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLInternalTriggerExpiredAuthorizationPurge\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v8 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.integritycheck"];
  if (v8
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    [objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLClientManager") triggerClearAppClipAuthorizationIfNecessary];
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v9 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      id v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService triggerExpiredAuthorizationPurgeWithReplyBlock:]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
    id v10 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id))a3 + 2))(a3, v10);
  }
  os_activity_scope_leave(&state);
}

- (void)getGestureServiceEnabledWithReplyBlock:(id)a3
{
  id v4 = objc_alloc_init((Class)NSAutoreleasePool);
  id v5 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetGestureServiceEnabled (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v5, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v6 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)id v12 = 2082;
    *(void *)&v12[2] = "";
    __int16 v13 = 2082;
    int v14 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetGestureServiceEnabled\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  BOOL v9 = 0;
  sub_1000C7F88(buf);
  int v7 = sub_1000D29FC(*(uint64_t *)buf, @"GestureServiceEnabled", &v9);
  if (*(void *)v12) {
    sub_1000DB0A0(*(std::__shared_weak_count **)v12);
  }
  if (v7)
  {
    BOOL v8 = v9;
  }
  else
  {
    BOOL v8 = 0;
    BOOL v9 = 0;
  }
  (*((void (**)(id, void, BOOL))a3 + 2))(a3, 0, v8);
  os_activity_scope_leave(&state);
}

- (void)pingDaemonWithReplyBlock:(id)a3
{
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  id v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonPingDaemon (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  int v7 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v20 = 2082;
    __int16 v21 = "";
    __int16 v22 = 2082;
    v23[0] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonPingDaemon\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
  }
  BOOL v8 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_INFO))
  {
    if (self) {
      [(CLInternalService *)self currentToken];
    }
    else {
      memset(v10, 0, sizeof(v10));
    }
    sub_10001BEC0(v10, (uint64_t)buf);
    sub_1000372B8((uint64_t)buf, &v11);
    if (v34 < 0) {
      operator delete(__p);
    }
    if (v32 < 0) {
      operator delete(v31);
    }
    if (v30 < 0) {
      operator delete(v29);
    }
    if (v28 < 0) {
      operator delete(v27);
    }
    if (v26 < 0) {
      operator delete(v25);
    }
    if (v24 < 0) {
      operator delete(*(void **)((char *)v23 + 4));
    }
    if (SBYTE3(v23[0]) < 0) {
      operator delete(*(void **)buf);
    }
    BOOL v9 = &v11;
    if ((v11.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      BOOL v9 = (std::string *)v11.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)__int16 v13 = 68289282;
    int v14 = 0;
    __int16 v15 = 2082;
    char v16 = "";
    __int16 v17 = 2082;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Spi, Pinged by external process\", \"process\":%{public, location:escape_only}s}", v13, 0x1Cu);
    if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v11.__r_.__value_.__l.__data_);
    }
  }
  (*((void (**)(id, void))a3 + 2))(a3, 0);
  os_activity_scope_leave(&state);
}

- (void)getPrecisionPermissionForBundleID:(id)a3 orBundlePath:(id)a4 replyBlock:(id)a5
{
  id v9 = objc_alloc_init((Class)NSAutoreleasePool);
  id v10 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetPrecisionPermission (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v10, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  std::string v11 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)&uint8_t buf[8] = 2082;
    *(void *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetPrecisionPermission\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  *(_OWORD *)char v26 = 0u;
  memset(v27, 0, 19);
  long long v24 = 0u;
  *(_OWORD *)char v25 = 0u;
  memset(buf, 0, sizeof(buf));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  memset(v31, 0, 27);
  if (+[CLInternalService getEffectiveClientName:a3 bundlePath:a4 name:buf])
  {
    if (self)
    {
      [(CLInternalService *)self currentToken];
    }
    else
    {
      long long v19 = 0u;
      long long v20 = 0u;
    }
    CLConnection::getUserNameFromAuditToken((uint64_t *)&__p, (CLConnection *)&v19, v12);
    sub_1001A5B7C((std::string *)buf, &__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    id v14 = [[-[CLInternalService vendor](self, "vendor", v19, v20) proxyForService:@"CLClientAuthorizationCache"];
    sub_1000A7FBC((uint64_t)buf, (uint64_t)&__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    id v16 = [v14 syncgetAuthorizationContextIfClientIsNonZonal:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", p_p)];
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    unsigned int v17 = [v16 isAuthorizedForServiceType:12];
    if ([v16 transientAwareRegistrationResult] == 4) {
      uint64_t v18 = 1;
    }
    else {
      uint64_t v18 = v17;
    }
    (*((void (**)(id, void, uint64_t))a5 + 2))(a5, 0, v18);
  }
  else
  {
    id v13 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
    (*((void (**)(id, id, void))a5 + 2))(a5, v13, 0);
  }
  if (SHIBYTE(v31[2]) < 0) {
    operator delete(v31[0]);
  }
  if (SHIBYTE(v30) < 0) {
    operator delete(*((void **)&v29 + 1));
  }
  if (SBYTE7(v29) < 0) {
    operator delete((void *)v28);
  }
  if ((v27[15] & 0x80000000) != 0) {
    operator delete(v26[1]);
  }
  if (SHIBYTE(v26[0]) < 0) {
    operator delete(v25[0]);
  }
  if (SHIBYTE(v24) < 0) {
    operator delete(*(void **)&buf[24]);
  }
  if ((buf[23] & 0x80000000) != 0) {
    operator delete(*(void **)buf);
  }
  os_activity_scope_leave(&state);
}

- (void)getIncidentalUseModeForBundleID:(id)a3 orBundlePath:(id)a4 replyBlock:(id)a5
{
  id v9 = objc_alloc_init((Class)NSAutoreleasePool);
  id v10 = _os_activity_create((void *)&_mh_execute_header, "CL: getIncidentalUseModeForBundleID:forBundleID:orBundlePath:replyBlock: (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v10, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  std::string v11 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(void *)buf = 68289282;
    *(_WORD *)&uint8_t buf[8] = 2082;
    *(void *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"getIncidentalUseModeForBundleID:forBundleID:orBundlePath:replyBlock:\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  long long v36 = 0u;
  memset(v37, 0, 19);
  long long v34 = 0u;
  long long v35 = 0u;
  memset(buf, 0, sizeof(buf));
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  memset(v41, 0, 27);
  if (+[CLInternalService getEffectiveClientName:a3 bundlePath:a4 name:buf])
  {
    if (self) {
      [(CLInternalService *)self currentToken];
    }
    else {
      memset(v30, 0, sizeof(v30));
    }
    CLConnection::getUserNameFromAuditToken((uint64_t *)&__p, (CLConnection *)v30, v12);
    sub_1001A5B7C((std::string *)buf, &__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    id v14 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLClientManager" forClient:@"CLInternalService"];
    sub_100089AE0((char *)__dst, (long long *)buf);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    _OWORD v15[2] = sub_1019FA5B8;
    v15[3] = &unk_102305F20;
    v15[4] = a5;
    [v14 getIncidentalUseModeForClient:sub_1000376D4((long long *)__dst) withReply:v15];
    if (v29 < 0) {
      operator delete(v28);
    }
    if (v27 < 0) {
      operator delete(v26);
    }
    if (v25 < 0) {
      operator delete(v24);
    }
    if (v23 < 0) {
      operator delete(v22);
    }
    if (v21 < 0) {
      operator delete(v20);
    }
    if (v19 < 0) {
      operator delete(v18);
    }
    if (v17 < 0) {
      operator delete(__dst[0]);
    }
  }
  else
  {
    id v13 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
    (*((void (**)(id, id, void))a5 + 2))(a5, v13, 0);
  }
  if (SHIBYTE(v41[2]) < 0) {
    operator delete(v41[0]);
  }
  if (SHIBYTE(v40) < 0) {
    operator delete(*((void **)&v39 + 1));
  }
  if (SBYTE7(v39) < 0) {
    operator delete((void *)v38);
  }
  if ((v37[15] & 0x80000000) != 0) {
    operator delete(*((void **)&v36 + 1));
  }
  if (SBYTE7(v36) < 0) {
    operator delete((void *)v35);
  }
  if (SHIBYTE(v34) < 0) {
    operator delete(*(void **)&buf[24]);
  }
  if ((buf[23] & 0x80000000) != 0) {
    operator delete(*(void **)buf);
  }
  os_activity_scope_leave(&state);
}

- (void)registerCircularInterestZoneWithId:(id)a3 latitude:(double)a4 longitude:(double)a5 radius:(double)a6 serviceMaskOperator:(int)a7 provenanceType:(int)a8 forBundleId:(id)a9 orBundlePath:(id)a10 replyBlock:(id)a11
{
  id v19 = objc_alloc_init((Class)NSAutoreleasePool);
  long long v20 = _os_activity_create((void *)&_mh_execute_header, "CL: registerCircularInterestZoneWithId: (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v20, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  char v21 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"registerCircularInterestZoneWithId:\", \"event\":%{public, location:escape_only}s}", (uint8_t *)buf, 0x1Cu);
  }
  id v22 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.authorizeapplications"];
  if (v22
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v22 BOOLValue] & 1) != 0)
  {
    if ([a9 length] || objc_msgSend(a10, "length"))
    {
      memset(v62, 0, 35);
      long long v61 = 0u;
      memset(buf, 0, sizeof(buf));
      long long v63 = 0u;
      memset(v64, 0, 59);
      if ([a9 length])
      {
        sub_100134750(&__str, (char *)[a9 UTF8String]);
        sub_1000B7144(&__str, (uint64_t)v45);
      }
      else
      {
        if (![a10 length])
        {
LABEL_49:
          if (self) {
            [(CLInternalService *)self currentToken];
          }
          else {
            memset(v42, 0, sizeof(v42));
          }
          CLConnection::getUserNameFromAuditToken((uint64_t *)v45, (CLConnection *)v42, v23);
          sub_1001A5B7C(buf, (const std::string *)v45);
          if ((v45[23] & 0x80000000) != 0) {
            operator delete(*(void **)v45);
          }
          if (qword_102419520 != -1) {
            dispatch_once(&qword_102419520, &stru_10234CA70);
          }
          char v27 = qword_102419528;
          if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
          {
            double v28 = sub_1000372B8((uint64_t)buf, &__str);
            int v29 = SHIBYTE(__str.__r_.__value_.__r.__words[2]);
            std::string::size_type v30 = __str.__r_.__value_.__r.__words[0];
            id v31 = [a3 UTF8String:v28];
            p_str = &__str;
            *(_DWORD *)long long v45 = 68289538;
            if (v29 < 0) {
              p_str = (std::string *)v30;
            }
            *(_DWORD *)&v45[4] = 0;
            *(_WORD *)&v45[8] = 2082;
            *(void *)&v45[10] = "";
            *(_WORD *)&v45[18] = 2082;
            *(void *)&v45[20] = p_str;
            *(_WORD *)&v45[28] = 2082;
            *(void *)&v45[30] = v31;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi, Register Circular InterestZone\", \"client\":%{public, location:escape_only}s, \"ZoneName\":%{public, location:escape_only}s}", v45, 0x26u);
            if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__str.__r_.__value_.__l.__data_);
            }
          }
          id v33 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLClientManager" forClient:@"CLInternalService"];
          sub_1000A7FBC((uint64_t)buf, (uint64_t)v45);
          if (v45[23] >= 0) {
            long long v34 = v45;
          }
          else {
            long long v34 = *(unsigned char **)v45;
          }
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_1019FB118;
          v41[3] = &unk_1022C7578;
          v41[4] = a11;
          [v33 registerCircularInterestZoneForClientKey:[NSString stringWithUTF8String:v34] withId:a3 latitude:a7 longitude:a8 serviceMaskOperator:v41 provenanceType:a4 radius:a5 withReply:a6];
          if ((v45[23] & 0x80000000) != 0) {
            operator delete(*(void **)v45);
          }
          if (SBYTE7(v64[3]) < 0) {
            operator delete(*(void **)&v64[2]);
          }
          if (SHIBYTE(v64[1]) < 0) {
            operator delete(*((void **)&v64[0] + 1));
          }
          if (SBYTE7(v64[0]) < 0) {
            operator delete((void *)v63);
          }
          if (SHIBYTE(v62[3]) < 0) {
            operator delete((void *)v62[1]);
          }
          if (SHIBYTE(v62[0]) < 0) {
            operator delete((void *)v61);
          }
          if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0) {
            operator delete(buf[1].__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
            operator delete(buf[0].__r_.__value_.__l.__data_);
          }
          goto LABEL_18;
        }
        sub_100134750(&__str, (char *)[a10 UTF8String]);
        sub_1000B6F5C(&__str, (uint64_t)v45);
      }
      if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf[0].__r_.__value_.__l.__data_);
      }
      buf[0] = *(std::string *)v45;
      v45[23] = 0;
      v45[0] = 0;
      if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf[1].__r_.__value_.__l.__data_);
      }
      buf[1] = *(std::string *)&v45[24];
      v45[47] = 0;
      unsigned char v45[24] = 0;
      if (SHIBYTE(v62[0]) < 0) {
        operator delete((void *)v61);
      }
      long long v61 = v46;
      v62[0] = v47;
      HIBYTE(v47) = 0;
      LOBYTE(v46) = 0;
      if (SHIBYTE(v62[3]) < 0) {
        operator delete((void *)v62[1]);
      }
      *(_OWORD *)&v62[1] = v48;
      v62[3] = v49;
      HIBYTE(v49) = 0;
      LOBYTE(v48) = 0;
      LOWORD(v62[4]) = v50;
      BYTE2(v62[4]) = v51;
      if (SBYTE7(v64[0]) < 0) {
        operator delete((void *)v63);
      }
      long long v63 = v52;
      *(void *)&v64[0] = v53;
      HIBYTE(v53) = 0;
      LOBYTE(v52) = 0;
      if (SHIBYTE(v64[1]) < 0) {
        operator delete(*((void **)&v64[0] + 1));
      }
      char v26 = 0;
      *(_OWORD *)((char *)v64 + 8) = v54;
      *((void *)&v64[1] + 1) = v55;
      HIBYTE(v55) = 0;
      LOBYTE(v54) = 0;
      if (SBYTE7(v64[3]) < 0)
      {
        operator delete(*(void **)&v64[2]);
        char v26 = HIBYTE(v55);
      }
      v64[2] = v56;
      *(void *)&v64[3] = v57;
      HIBYTE(v57) = 0;
      LOBYTE(v56) = 0;
      WORD4(v64[3]) = v58;
      BYTE10(v64[3]) = v59;
      if (v26 < 0) {
        operator delete((void *)v54);
      }
      if (SHIBYTE(v53) < 0) {
        operator delete((void *)v52);
      }
      if (SHIBYTE(v49) < 0) {
        operator delete((void *)v48);
      }
      if (SHIBYTE(v47) < 0) {
        operator delete((void *)v46);
      }
      if ((v45[47] & 0x80000000) != 0) {
        operator delete(*(void **)&v45[24]);
      }
      if ((v45[23] & 0x80000000) != 0) {
        operator delete(*(void **)v45);
      }
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__str.__r_.__value_.__l.__data_);
      }
      goto LABEL_49;
    }
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    long long v35 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_FAULT, "#Spi registerCircularInterestZone, Must provide a bundle identifier or bundle path", (uint8_t *)buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      *(_WORD *)long long v45 = 0;
      long long v38 = (std::string *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLInternalService registerCircularInterestZoneWithId:latitude:longitude:radius:serviceMaskOperator:provenanceType:forBundleId:orBundlePath:replyBlock:]", "%s\n", (const char *)v38);
      if (v38 != buf) {
        free(v38);
      }
    }
    id v36 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
    (*((void (**)(id, id))a11 + 2))(a11, v36);
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    long long v24 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", (uint8_t *)buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      *(_WORD *)long long v45 = 0;
      char v37 = (std::string *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService registerCircularInterestZoneWithId:latitude:longitude:radius:serviceMaskOperator:provenanceType:forBundleId:orBundlePath:replyBlock:]", "%s\n", (const char *)v37);
      if (v37 != buf) {
        free(v37);
      }
    }
    id v25 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id))a11 + 2))(a11, v25);
  }
LABEL_18:
  os_activity_scope_leave(&state);
}

- (void)registerPhenolicInterestZoneWithId:(id)a3 phenolicLocation:(int)a4 serviceMaskOperator:(int)a5 provenanceType:(int)a6 forBundleId:(id)a7 orBundlePath:(id)a8 replyBlock:(id)a9
{
  id v13 = objc_alloc_init((Class)NSAutoreleasePool);
  id v14 = _os_activity_create((void *)&_mh_execute_header, "CL: registerPhenolicInterestZoneWithId: (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v14, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  __int16 v15 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"registerPhenolicInterestZoneWithId:\", \"event\":%{public, location:escape_only}s}", (uint8_t *)buf, 0x1Cu);
  }
  id v16 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.authorizeapplications"];
  if (v16
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v16 BOOLValue] & 1) != 0)
  {
    if ([a7 length] || objc_msgSend(a8, "length"))
    {
      memset(v57, 0, 35);
      long long v56 = 0u;
      memset(buf, 0, sizeof(buf));
      long long v58 = 0u;
      memset(v59, 0, 59);
      if ([a7 length])
      {
        sub_100134750(&__str, (char *)[a7 UTF8String]);
        sub_1000B7144(&__str, (uint64_t)v40);
      }
      else
      {
        if (![a8 length])
        {
LABEL_49:
          if (self) {
            [(CLInternalService *)self currentToken];
          }
          else {
            memset(v37, 0, sizeof(v37));
          }
          CLConnection::getUserNameFromAuditToken((uint64_t *)v40, (CLConnection *)v37, v17);
          sub_1001A5B7C(buf, (const std::string *)v40);
          if ((v40[23] & 0x80000000) != 0) {
            operator delete(*(void **)v40);
          }
          if (qword_102419520 != -1) {
            dispatch_once(&qword_102419520, &stru_10234CA70);
          }
          char v21 = qword_102419528;
          if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
          {
            double v22 = sub_1000372B8((uint64_t)buf, &__str);
            int v23 = SHIBYTE(__str.__r_.__value_.__r.__words[2]);
            std::string::size_type v24 = __str.__r_.__value_.__r.__words[0];
            id v25 = [a3 UTF8String:v22];
            p_str = &__str;
            *(_DWORD *)long long v40 = 68289538;
            if (v23 < 0) {
              p_str = (std::string *)v24;
            }
            *(_DWORD *)&v40[4] = 0;
            *(_WORD *)&v40[8] = 2082;
            *(void *)&v40[10] = "";
            *(_WORD *)&v40[18] = 2082;
            *(void *)&v40[20] = p_str;
            *(_WORD *)&v40[28] = 2082;
            *(void *)&v40[30] = v25;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi, Register Phenolic InterestZone\", \"client\":%{public, location:escape_only}s, \"ZoneName\":%{public, location:escape_only}s}", v40, 0x26u);
            if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__str.__r_.__value_.__l.__data_);
            }
          }
          id v27 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLClientManager" forClient:@"CLInternalService"];
          sub_1000A7FBC((uint64_t)buf, (uint64_t)v40);
          if (v40[23] >= 0) {
            double v28 = v40;
          }
          else {
            double v28 = *(unsigned char **)v40;
          }
          v36[0] = _NSConcreteStackBlock;
          v36[1] = 3221225472;
          v36[2] = sub_1019FBB5C;
          v36[3] = &unk_1022C7578;
          v36[4] = a9;
          [v27 registerPhenolicInterestZoneForClientKey:[NSString stringWithUTF8String:v28] withId:a3 phenolicLocation:a4 serviceMaskOperator:a5 provenanceType:a6 withReply:v36];
          if ((v40[23] & 0x80000000) != 0) {
            operator delete(*(void **)v40);
          }
          if (SBYTE7(v59[3]) < 0) {
            operator delete(*(void **)&v59[2]);
          }
          if (SHIBYTE(v59[1]) < 0) {
            operator delete(*((void **)&v59[0] + 1));
          }
          if (SBYTE7(v59[0]) < 0) {
            operator delete((void *)v58);
          }
          if (SHIBYTE(v57[3]) < 0) {
            operator delete((void *)v57[1]);
          }
          if (SHIBYTE(v57[0]) < 0) {
            operator delete((void *)v56);
          }
          if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0) {
            operator delete(buf[1].__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
            operator delete(buf[0].__r_.__value_.__l.__data_);
          }
          goto LABEL_18;
        }
        sub_100134750(&__str, (char *)[a8 UTF8String]);
        sub_1000B6F5C(&__str, (uint64_t)v40);
      }
      if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf[0].__r_.__value_.__l.__data_);
      }
      buf[0] = *(std::string *)v40;
      v40[23] = 0;
      v40[0] = 0;
      if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf[1].__r_.__value_.__l.__data_);
      }
      buf[1] = *(std::string *)&v40[24];
      v40[47] = 0;
      v40[24] = 0;
      if (SHIBYTE(v57[0]) < 0) {
        operator delete((void *)v56);
      }
      long long v56 = v41;
      v57[0] = v42;
      HIBYTE(v42) = 0;
      LOBYTE(v41) = 0;
      if (SHIBYTE(v57[3]) < 0) {
        operator delete((void *)v57[1]);
      }
      *(_OWORD *)&v57[1] = v43;
      v57[3] = v44;
      HIBYTE(v44) = 0;
      LOBYTE(v43) = 0;
      LOWORD(v57[4]) = v45;
      BYTE2(v57[4]) = v46;
      if (SBYTE7(v59[0]) < 0) {
        operator delete((void *)v58);
      }
      long long v58 = v47;
      *(void *)&v59[0] = v48;
      HIBYTE(v48) = 0;
      LOBYTE(v47) = 0;
      if (SHIBYTE(v59[1]) < 0) {
        operator delete(*((void **)&v59[0] + 1));
      }
      char v20 = 0;
      *(_OWORD *)((char *)v59 + 8) = v49;
      *((void *)&v59[1] + 1) = v50;
      HIBYTE(v50) = 0;
      LOBYTE(v49) = 0;
      if (SBYTE7(v59[3]) < 0)
      {
        operator delete(*(void **)&v59[2]);
        char v20 = HIBYTE(v50);
      }
      v59[2] = v51;
      *(void *)&v59[3] = v52;
      HIBYTE(v52) = 0;
      LOBYTE(v51) = 0;
      WORD4(v59[3]) = v53;
      BYTE10(v59[3]) = v54;
      if (v20 < 0) {
        operator delete((void *)v49);
      }
      if (SHIBYTE(v48) < 0) {
        operator delete((void *)v47);
      }
      if (SHIBYTE(v44) < 0) {
        operator delete((void *)v43);
      }
      if (SHIBYTE(v42) < 0) {
        operator delete((void *)v41);
      }
      if ((v40[47] & 0x80000000) != 0) {
        operator delete(*(void **)&v40[24]);
      }
      if ((v40[23] & 0x80000000) != 0) {
        operator delete(*(void **)v40);
      }
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__str.__r_.__value_.__l.__data_);
      }
      goto LABEL_49;
    }
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    int v29 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_FAULT, "#Spi registerPhenolicInterestZone, Must provide a bundle identifier or bundle path", (uint8_t *)buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      *(_WORD *)long long v40 = 0;
      char v32 = (std::string *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLInternalService registerPhenolicInterestZoneWithId:phenolicLocation:serviceMaskOperator:provenanceType:forBundleId:orBundlePath:replyBlock:]", "%s\n", (const char *)v32);
      if (v32 != buf) {
        free(v32);
      }
    }
    id v30 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
    (*((void (**)(id, id))a9 + 2))(a9, v30);
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    uint64_t v18 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", (uint8_t *)buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      *(_WORD *)long long v40 = 0;
      id v31 = (std::string *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService registerPhenolicInterestZoneWithId:phenolicLocation:serviceMaskOperator:provenanceType:forBundleId:orBundlePath:replyBlock:]", "%s\n", (const char *)v31);
      if (v31 != buf) {
        free(v31);
      }
    }
    id v19 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id))a9 + 2))(a9, v19);
  }
LABEL_18:
  os_activity_scope_leave(&state);
}

- (void)setRelevance:(BOOL)a3 forInterestZoneWithId:(id)a4 registeredForBundleId:(id)a5 orBundlePath:(id)a6 replyBlock:(id)a7
{
  BOOL v32 = a3;
  id v12 = objc_alloc_init((Class)NSAutoreleasePool);
  id v13 = _os_activity_create((void *)&_mh_execute_header, "CL: setRelevance:forInterestZoneWithName: (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v13, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v14 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"setRelevance:forInterestZoneWithName:\", \"event\":%{public, location:escape_only}s}", (uint8_t *)buf, 0x1Cu);
  }
  id v15 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.authorizeapplications"];
  if (v15
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v15 BOOLValue] & 1) != 0)
  {
    if ([a5 length] || objc_msgSend(a6, "length"))
    {
      memset(v54, 0, 35);
      long long v53 = 0u;
      memset(buf, 0, sizeof(buf));
      long long v55 = 0u;
      memset(v56, 0, 59);
      if ([a5 length])
      {
        sub_100134750(&__str, (char *)[a5 UTF8String]);
        sub_1000B7144(&__str, (uint64_t)v37);
      }
      else
      {
        if (![a6 length])
        {
LABEL_49:
          if (self) {
            [(CLInternalService *)self currentToken];
          }
          else {
            memset(v34, 0, sizeof(v34));
          }
          CLConnection::getUserNameFromAuditToken((uint64_t *)v37, (CLConnection *)v34, v16);
          sub_1001A5B7C(buf, (const std::string *)v37);
          if ((v37[23] & 0x80000000) != 0) {
            operator delete(*(void **)v37);
          }
          if (qword_102419520 != -1) {
            dispatch_once(&qword_102419520, &stru_10234CA70);
          }
          char v20 = qword_102419528;
          if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
          {
            double v21 = sub_1000372B8((uint64_t)buf, &__str);
            int v22 = SHIBYTE(__str.__r_.__value_.__r.__words[2]);
            std::string::size_type v23 = __str.__r_.__value_.__r.__words[0];
            id v24 = [a4 UTF8String:v21];
            p_str = &__str;
            *(_DWORD *)char v37 = 68289538;
            if (v22 < 0) {
              p_str = (std::string *)v23;
            }
            *(_DWORD *)&v37[4] = 0;
            *(_WORD *)&v37[8] = 2082;
            *(void *)&v37[10] = "";
            *(_WORD *)&v37[18] = 2082;
            *(void *)&v37[20] = p_str;
            *(_WORD *)&v37[28] = 2082;
            *(void *)&v37[30] = v24;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi, SetRelevanceForInterestZone\", \"client\":%{public, location:escape_only}s, \"ZoneName\":%{public, location:escape_only}s}", v37, 0x26u);
            if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__str.__r_.__value_.__l.__data_);
            }
          }
          id v26 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLClientManager" forClient:@"CLInternalService"];
          sub_1000A7FBC((uint64_t)buf, (uint64_t)v37);
          if (v37[23] >= 0) {
            id v27 = v37;
          }
          else {
            id v27 = *(unsigned char **)v37;
          }
          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472;
          v33[2] = sub_1019FC598;
          v33[3] = &unk_1022C7578;
          v33[4] = a7;
          [v26 setRelevance:v32 forInterestZoneWithId:a4 registeredForClientKey:[NSString stringWithUTF8String:v27] withReply:v33];
          if ((v37[23] & 0x80000000) != 0) {
            operator delete(*(void **)v37);
          }
          if (SBYTE7(v56[3]) < 0) {
            operator delete(*(void **)&v56[2]);
          }
          if (SHIBYTE(v56[1]) < 0) {
            operator delete(*((void **)&v56[0] + 1));
          }
          if (SBYTE7(v56[0]) < 0) {
            operator delete((void *)v55);
          }
          if (SHIBYTE(v54[3]) < 0) {
            operator delete((void *)v54[1]);
          }
          if (SHIBYTE(v54[0]) < 0) {
            operator delete((void *)v53);
          }
          if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0) {
            operator delete(buf[1].__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
            operator delete(buf[0].__r_.__value_.__l.__data_);
          }
          goto LABEL_18;
        }
        sub_100134750(&__str, (char *)[a6 UTF8String]);
        sub_1000B6F5C(&__str, (uint64_t)v37);
      }
      if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf[0].__r_.__value_.__l.__data_);
      }
      buf[0] = *(std::string *)v37;
      v37[23] = 0;
      v37[0] = 0;
      if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf[1].__r_.__value_.__l.__data_);
      }
      buf[1] = *(std::string *)&v37[24];
      v37[47] = 0;
      unsigned char v37[24] = 0;
      if (SHIBYTE(v54[0]) < 0) {
        operator delete((void *)v53);
      }
      long long v53 = v38;
      v54[0] = v39;
      HIBYTE(v39) = 0;
      LOBYTE(v38) = 0;
      if (SHIBYTE(v54[3]) < 0) {
        operator delete((void *)v54[1]);
      }
      *(_OWORD *)&v54[1] = v40;
      v54[3] = v41;
      HIBYTE(v41) = 0;
      LOBYTE(v40) = 0;
      LOWORD(v54[4]) = v42;
      BYTE2(v54[4]) = v43;
      if (SBYTE7(v56[0]) < 0) {
        operator delete((void *)v55);
      }
      long long v55 = v44;
      *(void *)&v56[0] = v45;
      HIBYTE(v45) = 0;
      LOBYTE(v44) = 0;
      if (SHIBYTE(v56[1]) < 0) {
        operator delete(*((void **)&v56[0] + 1));
      }
      char v19 = 0;
      *(_OWORD *)((char *)v56 + 8) = v46;
      *((void *)&v56[1] + 1) = v47;
      HIBYTE(v47) = 0;
      LOBYTE(v46) = 0;
      if (SBYTE7(v56[3]) < 0)
      {
        operator delete(*(void **)&v56[2]);
        char v19 = HIBYTE(v47);
      }
      v56[2] = v48;
      *(void *)&v56[3] = v49;
      HIBYTE(v49) = 0;
      LOBYTE(v48) = 0;
      WORD4(v56[3]) = v50;
      BYTE10(v56[3]) = v51;
      if (v19 < 0) {
        operator delete((void *)v46);
      }
      if (SHIBYTE(v45) < 0) {
        operator delete((void *)v44);
      }
      if (SHIBYTE(v41) < 0) {
        operator delete((void *)v40);
      }
      if (SHIBYTE(v39) < 0) {
        operator delete((void *)v38);
      }
      if ((v37[47] & 0x80000000) != 0) {
        operator delete(*(void **)&v37[24]);
      }
      if ((v37[23] & 0x80000000) != 0) {
        operator delete(*(void **)v37);
      }
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__str.__r_.__value_.__l.__data_);
      }
      goto LABEL_49;
    }
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    double v28 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_FAULT, "#Spi setRelevanceForInterestZone, Must provide a bundle identifier or bundle path", (uint8_t *)buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      *(_WORD *)char v37 = 0;
      id v31 = (std::string *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLInternalService setRelevance:forInterestZoneWithId:registeredForBundleId:orBundlePath:replyBlock:]", "%s\n", (const char *)v31);
      if (v31 != buf) {
        free(v31);
      }
    }
    id v29 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
    (*((void (**)(id, id))a7 + 2))(a7, v29);
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    char v17 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", (uint8_t *)buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      *(_WORD *)char v37 = 0;
      id v30 = (std::string *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService setRelevance:forInterestZoneWithId:registeredForBundleId:orBundlePath:replyBlock:]", "%s\n", (const char *)v30);
      if (v30 != buf) {
        free(v30);
      }
    }
    id v18 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id))a7 + 2))(a7, v18);
  }
LABEL_18:
  os_activity_scope_leave(&state);
}

- (void)deleteInterestZoneWithId:(id)a3 registeredForBundleId:(id)a4 orBundlePath:(id)a5 replyBlock:(id)a6
{
  id v11 = objc_alloc_init((Class)NSAutoreleasePool);
  id v12 = _os_activity_create((void *)&_mh_execute_header, "CL: deleteInterestZoneWithId: (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v12, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v13 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"deleteInterestZoneWithId:\", \"event\":%{public, location:escape_only}s}", (uint8_t *)buf, 0x1Cu);
  }
  id v14 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.authorizeapplications"];
  if (v14
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v14 BOOLValue] & 1) != 0)
  {
    if ([a4 length] || objc_msgSend(a5, "length"))
    {
      memset(v52, 0, 35);
      long long v51 = 0u;
      memset(buf, 0, sizeof(buf));
      long long v53 = 0u;
      memset(v54, 0, 59);
      if ([a4 length])
      {
        sub_100134750(&__str, (char *)[a4 UTF8String]);
        sub_1000B7144(&__str, (uint64_t)v35);
      }
      else
      {
        if (![a5 length])
        {
LABEL_49:
          if (self) {
            [(CLInternalService *)self currentToken];
          }
          else {
            memset(v32, 0, sizeof(v32));
          }
          CLConnection::getUserNameFromAuditToken((uint64_t *)v35, (CLConnection *)v32, v15);
          sub_1001A5B7C(buf, (const std::string *)v35);
          if ((v35[23] & 0x80000000) != 0) {
            operator delete(*(void **)v35);
          }
          if (qword_102419520 != -1) {
            dispatch_once(&qword_102419520, &stru_10234CA70);
          }
          char v19 = qword_102419528;
          if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
          {
            double v20 = sub_1000372B8((uint64_t)buf, &__str);
            int v21 = SHIBYTE(__str.__r_.__value_.__r.__words[2]);
            std::string::size_type v22 = __str.__r_.__value_.__r.__words[0];
            id v23 = [a3 UTF8String:v20];
            p_str = &__str;
            *(_DWORD *)long long v35 = 68289538;
            if (v21 < 0) {
              p_str = (std::string *)v22;
            }
            *(_DWORD *)&uint8_t v35[4] = 0;
            *(_WORD *)&v35[8] = 2082;
            *(void *)&v35[10] = "";
            *(_WORD *)&v35[18] = 2082;
            *(void *)&v35[20] = p_str;
            *(_WORD *)&v35[28] = 2082;
            *(void *)&v35[30] = v23;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi, delete interest zone\", \"client\":%{public, location:escape_only}s, \"ZoneName\":%{public, location:escape_only}s}", v35, 0x26u);
            if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__str.__r_.__value_.__l.__data_);
            }
          }
          id v25 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLClientManager" forClient:@"CLInternalService"];
          sub_1000A7FBC((uint64_t)buf, (uint64_t)v35);
          if (v35[23] >= 0) {
            id v26 = v35;
          }
          else {
            id v26 = *(unsigned char **)v35;
          }
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472;
          v31[2] = sub_1019FCFCC;
          v31[3] = &unk_1022C7578;
          v31[4] = a6;
          [v25 deleteInterestZoneWithId:a3 registeredForClientKey:[NSString stringWithUTF8String:v26] withReply:v31];
          if ((v35[23] & 0x80000000) != 0) {
            operator delete(*(void **)v35);
          }
          if (SBYTE7(v54[3]) < 0) {
            operator delete(*(void **)&v54[2]);
          }
          if (SHIBYTE(v54[1]) < 0) {
            operator delete(*((void **)&v54[0] + 1));
          }
          if (SBYTE7(v54[0]) < 0) {
            operator delete((void *)v53);
          }
          if (SHIBYTE(v52[3]) < 0) {
            operator delete((void *)v52[1]);
          }
          if (SHIBYTE(v52[0]) < 0) {
            operator delete((void *)v51);
          }
          if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0) {
            operator delete(buf[1].__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
            operator delete(buf[0].__r_.__value_.__l.__data_);
          }
          goto LABEL_18;
        }
        sub_100134750(&__str, (char *)[a5 UTF8String]);
        sub_1000B6F5C(&__str, (uint64_t)v35);
      }
      if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf[0].__r_.__value_.__l.__data_);
      }
      buf[0] = *(std::string *)v35;
      v35[23] = 0;
      v35[0] = 0;
      if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf[1].__r_.__value_.__l.__data_);
      }
      buf[1] = *(std::string *)&v35[24];
      v35[47] = 0;
      v35[24] = 0;
      if (SHIBYTE(v52[0]) < 0) {
        operator delete((void *)v51);
      }
      long long v51 = v36;
      v52[0] = v37;
      HIBYTE(v37) = 0;
      LOBYTE(v36) = 0;
      if (SHIBYTE(v52[3]) < 0) {
        operator delete((void *)v52[1]);
      }
      *(_OWORD *)&v52[1] = v38;
      v52[3] = v39;
      HIBYTE(v39) = 0;
      LOBYTE(v38) = 0;
      LOWORD(v52[4]) = v40;
      BYTE2(v52[4]) = v41;
      if (SBYTE7(v54[0]) < 0) {
        operator delete((void *)v53);
      }
      long long v53 = v42;
      *(void *)&v54[0] = v43;
      HIBYTE(v43) = 0;
      LOBYTE(v42) = 0;
      if (SHIBYTE(v54[1]) < 0) {
        operator delete(*((void **)&v54[0] + 1));
      }
      char v18 = 0;
      *(_OWORD *)((char *)v54 + 8) = v44;
      *((void *)&v54[1] + 1) = v45;
      HIBYTE(v45) = 0;
      LOBYTE(v44) = 0;
      if (SBYTE7(v54[3]) < 0)
      {
        operator delete(*(void **)&v54[2]);
        char v18 = HIBYTE(v45);
      }
      v54[2] = v46;
      *(void *)&v54[3] = v47;
      HIBYTE(v47) = 0;
      LOBYTE(v46) = 0;
      WORD4(v54[3]) = v48;
      BYTE10(v54[3]) = v49;
      if (v18 < 0) {
        operator delete((void *)v44);
      }
      if (SHIBYTE(v43) < 0) {
        operator delete((void *)v42);
      }
      if (SHIBYTE(v39) < 0) {
        operator delete((void *)v38);
      }
      if (SHIBYTE(v37) < 0) {
        operator delete((void *)v36);
      }
      if ((v35[47] & 0x80000000) != 0) {
        operator delete(*(void **)&v35[24]);
      }
      if ((v35[23] & 0x80000000) != 0) {
        operator delete(*(void **)v35);
      }
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__str.__r_.__value_.__l.__data_);
      }
      goto LABEL_49;
    }
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v27 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "#Spi deleteInterestZoneWithId, Must provide a bundle identifier or bundle path", (uint8_t *)buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      *(_WORD *)long long v35 = 0;
      id v30 = (std::string *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLInternalService deleteInterestZoneWithId:registeredForBundleId:orBundlePath:replyBlock:]", "%s\n", (const char *)v30);
      if (v30 != buf) {
        free(v30);
      }
    }
    id v28 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
    (*((void (**)(id, id))a6 + 2))(a6, v28);
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v16 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", (uint8_t *)buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      *(_WORD *)long long v35 = 0;
      id v29 = (std::string *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService deleteInterestZoneWithId:registeredForBundleId:orBundlePath:replyBlock:]", "%s\n", (const char *)v29);
      if (v29 != buf) {
        free(v29);
      }
    }
    id v17 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id))a6 + 2))(a6, v17);
  }
LABEL_18:
  os_activity_scope_leave(&state);
}

- (void)performMigrationWithReplyBlock:(id)a3
{
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  id v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonPerformMigration (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  int v7 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)id v17 = 2082;
    *(void *)&_OWORD v17[2] = "";
    __int16 v18 = 2082;
    char v19 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonPerformMigration\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v8 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.integritycheck"];
  if (v8
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1019FD428;
    v13[3] = &unk_1022BDC10;
    uint8_t v13[4] = self;
    *(void *)buf = mach_absolute_time();
    *(void *)id v17 = v13;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1019FD648;
    v12[3] = &unk_1022F5FB0;
    v12[4] = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLClientManager" forClient:@"CLInternalService"];
    void v12[5] = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLDaemonStatus"];
    v12[6] = a3;
    [+[CLSilo main](CLSilo) async:v12];
    sub_1000E0900((uint64_t *)buf);
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v9 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      __int16 v14 = 0;
      id v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService performMigrationWithReplyBlock:]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
    id v10 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id))a3 + 2))(a3, v10);
  }
  os_activity_scope_leave(&state);
}

- (void)shutdownDaemonWithReplyBlock:(id)a3
{
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  id v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonShutdownDaemon (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  int v7 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v20 = 2082;
    int v21 = "";
    __int16 v22 = 2082;
    v23[0] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonShutdownDaemon\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
  }
  id v8 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      [(CLInternalService *)self currentToken];
    }
    else {
      memset(v10, 0, sizeof(v10));
    }
    sub_10001BEC0(v10, (uint64_t)buf);
    sub_1000372B8((uint64_t)buf, &v11);
    if (v34 < 0) {
      operator delete(__p);
    }
    if (v32 < 0) {
      operator delete(v31);
    }
    if (v30 < 0) {
      operator delete(v29);
    }
    if (v28 < 0) {
      operator delete(v27);
    }
    if (v26 < 0) {
      operator delete(v25);
    }
    if (v24 < 0) {
      operator delete(*(void **)((char *)v23 + 4));
    }
    if (SBYTE3(v23[0]) < 0) {
      operator delete(*(void **)buf);
    }
    id v9 = &v11;
    if ((v11.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      id v9 = (std::string *)v11.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)id v13 = 68289282;
    int v14 = 0;
    __int16 v15 = 2082;
    id v16 = "";
    __int16 v17 = 2082;
    __int16 v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi, Daemon shutdown requested\", \"requester\":%{public, location:escape_only}s}", v13, 0x1Cu);
    if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v11.__r_.__value_.__l.__data_);
    }
  }
  sub_1019DB5D0(qword_10248D888, 1);
  (*((void (**)(id, void))a3 + 2))(a3, 0);
  os_activity_scope_leave(&state);
}

- (void)displayStatisticsWithReplyBlock:(id)a3
{
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  id v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonDisplayStatistics (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  int v7 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v21 = 2082;
    __int16 v22 = "";
    __int16 v23 = 2082;
    v24[0] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonDisplayStatistics\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
  }
  id v8 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      [(CLInternalService *)self currentToken];
    }
    else {
      memset(v11, 0, sizeof(v11));
    }
    sub_10001BEC0(v11, (uint64_t)buf);
    sub_1000372B8((uint64_t)buf, &v12);
    if (v35 < 0) {
      operator delete(__p);
    }
    if (v33 < 0) {
      operator delete(v32);
    }
    if (v31 < 0) {
      operator delete(v30);
    }
    if (v29 < 0) {
      operator delete(v28);
    }
    if (v27 < 0) {
      operator delete(v26);
    }
    if (v25 < 0) {
      operator delete(*(void **)((char *)v24 + 4));
    }
    if (SBYTE3(v24[0]) < 0) {
      operator delete(*(void **)buf);
    }
    id v9 = &v12;
    if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      id v9 = (std::string *)v12.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)int v14 = 68289282;
    int v15 = 0;
    __int16 v16 = 2082;
    __int16 v17 = "";
    __int16 v18 = 2082;
    char v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi, Daemon stats requested\", \"requester\":%{public, location:escape_only}s}", v14, 0x1Cu);
    if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v12.__r_.__value_.__l.__data_);
    }
  }
  uint64_t v10 = sub_10071B604();
  sub_10071BEDC(v10);
  (*((void (**)(id, void))a3 + 2))(a3, 0);
  os_activity_scope_leave(&state);
}

- (void)dumpLogsWithDescription:(id)a3 replyBlock:(id)a4
{
  id v7 = objc_alloc_init((Class)NSAutoreleasePool);
  id v8 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonDumpLogs (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v9 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v27 = 2082;
    char v28 = "";
    __int16 v29 = 2082;
    *(void *)char v30 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonDumpLogs\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
  }
  uint64_t v10 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      [(CLInternalService *)self currentToken];
    }
    else {
      memset(v18, 0, sizeof(v18));
    }
    sub_10001BEC0(v18, (uint64_t)buf);
    sub_1000372B8((uint64_t)buf, v20);
    if (v41 < 0) {
      operator delete(__p);
    }
    if (v39 < 0) {
      operator delete(v38);
    }
    if (v37 < 0) {
      operator delete(v36);
    }
    if (v35 < 0) {
      operator delete(v34);
    }
    if (v33 < 0) {
      operator delete(v32);
    }
    if (v31 < 0) {
      operator delete(*(void **)&v30[4]);
    }
    if ((v30[3] & 0x80000000) != 0) {
      operator delete(*(void **)buf);
    }
    std::string v11 = v20;
    if ((v20[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string v11 = (std::string *)v20[0].__r_.__value_.__r.__words[0];
    }
    CFStringRef v12 = &stru_10234F018;
    if (a3) {
      CFStringRef v12 = (const __CFString *)a3;
    }
    LODWORD(v21.__r_.__value_.__l.__data_) = 136315394;
    *(std::string::size_type *)((char *)v21.__r_.__value_.__r.__words + 4) = (std::string::size_type)v11;
    WORD2(v21.__r_.__value_.__r.__words[1]) = 2112;
    *(std::string::size_type *)((char *)&v21.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#Spi, Log dump requested by %s: %@", (uint8_t *)&v21, 0x16u);
    if (SHIBYTE(v20[0].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v20[0].__r_.__value_.__l.__data_);
    }
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    if (self) {
      [(CLInternalService *)self currentToken];
    }
    else {
      memset(v17, 0, sizeof(v17));
    }
    sub_10001BEC0(v17, (uint64_t)v20);
    sub_1000372B8((uint64_t)v20, &v21);
    sub_1000064D0((uint64_t)v20);
    if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      int v14 = &v21;
    }
    else {
      int v14 = (std::string *)v21.__r_.__value_.__r.__words[0];
    }
    CFStringRef v15 = &stru_10234F018;
    if (a3) {
      CFStringRef v15 = (const __CFString *)a3;
    }
    int v22 = 136315394;
    __int16 v23 = v14;
    __int16 v24 = 2112;
    CFStringRef v25 = v15;
    __int16 v16 = (char *)_os_log_send_and_compose_impl();
    if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v21.__r_.__value_.__l.__data_);
    }
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService dumpLogsWithDescription:replyBlock:]", "%s\n", v16);
    if (v16 != (char *)buf) {
      free(v16);
    }
  }
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, @"com.apple.locationd.DumpDiagnostics", 0, 0, 1u);
  (*((void (**)(id, void))a4 + 2))(a4, 0);
  os_activity_scope_leave(&state);
}

- (void)copyLastLogWithReplyBlock:(id)a3
{
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  id v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonCopyLastLog (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v7 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v23 = 2082;
    __int16 v24 = "";
    __int16 v25 = 2082;
    v26[0] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonCopyLastLog\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
  }
  id v8 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      [(CLInternalService *)self currentToken];
    }
    else {
      memset(v13, 0, sizeof(v13));
    }
    sub_10001BEC0(v13, (uint64_t)buf);
    sub_1000372B8((uint64_t)buf, &v14);
    if (v37 < 0) {
      operator delete(__p);
    }
    if (v35 < 0) {
      operator delete(v34);
    }
    if (v33 < 0) {
      operator delete(v32);
    }
    if (v31 < 0) {
      operator delete(v30);
    }
    if (v29 < 0) {
      operator delete(v28);
    }
    if (v27 < 0) {
      operator delete(*(void **)((char *)v26 + 4));
    }
    if (SBYTE3(v26[0]) < 0) {
      operator delete(*(void **)buf);
    }
    id v9 = &v14;
    if ((v14.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      id v9 = (std::string *)v14.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)__int16 v16 = 68289282;
    int v17 = 0;
    __int16 v18 = 2082;
    char v19 = "";
    __int16 v20 = 2082;
    std::string v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi, requested to copy locationd's last logs to crash reporter\", \"requester\":%{public, location:escape_only}s}", v16, 0x1Cu);
    if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v14.__r_.__value_.__l.__data_);
    }
  }
  uint64_t v10 = sub_10013D1F4();
  if (sub_1012FB230(v10) && (uint64_t v11 = sub_101282D9C(), sub_1012FB230(v11)))
  {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
  else
  {
    id v12 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
    (*((void (**)(id, id))a3 + 2))(a3, v12);
  }
  os_activity_scope_leave(&state);
}

- (void)getMonitoredRegionsForBundleID:(id)a3 orBundlePath:(id)a4 replyBlock:(id)a5
{
  id v39 = objc_alloc_init((Class)NSAutoreleasePool);
  id v8 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetMonitoredRegions (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v9 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)&uint8_t buf[8] = 2082;
    *(void *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetMonitoredRegions\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  sub_1000E9354();
  *(_OWORD *)char v74 = 0u;
  memset(v75, 0, 19);
  long long v72 = 0u;
  *(_OWORD *)v73 = 0u;
  memset(buf, 0, sizeof(buf));
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  memset(v79, 0, 27);
  if (!+[CLInternalService getEffectiveClientName:a3 bundlePath:a4 name:buf])
  {
    id v11 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
    (*((void (**)(id, id, void))a5 + 2))(a5, v11, 0);

    goto LABEL_69;
  }
  if (self) {
    [(CLInternalService *)self currentToken];
  }
  else {
    memset(v49, 0, sizeof(v49));
  }
  CLConnection::getUserNameFromAuditToken((uint64_t *)&__p, (CLConnection *)v49, v10);
  sub_1001A5B7C((std::string *)buf, (const std::string *)&__p);
  if ((v59[15] & 0x80000000) != 0) {
    operator delete(__p);
  }
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  uint64_t v48 = 0;
  sub_1000A7FBC((uint64_t)buf, (uint64_t)v44);
  id v12 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLFenceManager"];
  if (v45 >= 0) {
    id v13 = v44;
  }
  else {
    id v13 = (void **)v44[0];
  }
  if ((objc_msgSend(v12, "syncgetFences:forKey:", &v46, +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v13)) & 1) == 0)
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    std::string v14 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v15 = v44;
      if (v45 < 0) {
        CFStringRef v15 = (void **)v44[0];
      }
      std::string __p = (void *)68289282;
      *(_WORD *)char v59 = 2082;
      *(void *)&v59[2] = "";
      *(_WORD *)&v59[10] = 2082;
      *(void *)&v59[12] = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi, #warning Couldn't get fences for client key\", \"clientKey\":%{public, location:escape_only}s}", (uint8_t *)&__p, 0x1Cu);
    }
  }
  if (v46 == v47)
  {
LABEL_56:
    std::string __p = &__p;
    *(void *)char v59 = &__p;
    *(void *)&v59[8] = 0;
    id v29 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLBTLEFenceManager"];
    if (v45 >= 0) {
      char v30 = v44;
    }
    else {
      char v30 = (void **)v44[0];
    }
    [v29 syncgetMonitoredRegions:&__p forClient:[NSString stringWithUTF8String:v30]];
    sub_1000E9354();
    for (uint64_t i = *(void *)v59; (void **)i != &__p; uint64_t i = *(void *)(i + 8))
    {
      sub_1000E9354();
      char v32 = (const char *)(i + 104);
      sub_1004D37A8((uint64_t)v43, "kCLConnectionMessageNameKey", (char *)(i + 104));
      sub_1004D37A8((uint64_t)v43, "kCLConnectionMessageOnBehalfOfKey", (char *)(i + 80));
      v42[0] = 0;
      sub_1000EA838((uint64_t)v43, "kCLConnectionMessageRegionTypeKey", v42);
      sub_1000EA838((uint64_t)v43, "kCLConnectionMessageRegionDefinitionKey", (const void *)(i + 52));
      char v33 = (char *)(i + 24);
      if (*(char *)(i + 47) < 0) {
        char v33 = *(char **)v33;
      }
      sub_1004D34AC((uint64_t)v43, "kCLConnectionMessageProximityUUIDKey", v33);
      sub_1004D25D0((uint64_t)v43, "kCLConnectionMessageMajorKey", (unsigned __int16 *)(i + 48));
      sub_1004D25D0((uint64_t)v43, "kCLConnectionMessageMinorKey", (unsigned __int16 *)(i + 50));
      v42[0] = *(_DWORD *)(i + 128) & 1;
      sub_1000EA838((uint64_t)v43, "kCLConnectionMessageNotifyOnEntryKey", v42);
      v42[0] = *(_DWORD *)(i + 128) & 2;
      sub_1000EA838((uint64_t)v43, "kCLConnectionMessageNotifyOnExitKey", v42);
      v42[0] = *(_DWORD *)(i + 128) & 4;
      sub_1000EA838((uint64_t)v43, "kCLConnectionMessageNotifyEntryStateOnDisplayKey", v42);
      v42[0] = *(_DWORD *)(i + 128) & 8;
      sub_1000EA838((uint64_t)v43, "kCLConnectionMessageConservativeEntry", v42);
      LOBYTE(v42[0]) = 0;
      sub_1000EA238((uint64_t)v43, "kCLConnectionMessageEmergencyKey", v42);
      if (*(char *)(i + 127) < 0) {
        char v32 = *(const char **)v32;
      }
      sub_1004D3878((uint64_t)v52, v32, (uint64_t)v43);
      sub_10013F3C4(v43);
    }
    sub_1004D3878((uint64_t)v50, "kCLConnectionMessageBeaconRegionKey", (uint64_t)v52);
    sub_10013F3C4(v52);
    sub_10013415C((uint64_t *)&__p);
    uint64_t v34 = sub_1000E9358((uint64_t)v50);
    (*((void (**)(id, void, uint64_t))a5 + 2))(a5, 0, v34);
    goto LABEL_66;
  }
  char v37 = self;
  sub_1000E9354();
  uint64_t v16 = v46;
  uint64_t v17 = v47;
  if (v46 == v47)
  {
LABEL_55:
    sub_1004D3878((uint64_t)v50, "kCLConnectionMessageCircularRegionKey", (uint64_t)v43);
    self = v37;
    sub_10013F3C4(v43);
    goto LABEL_56;
  }
  while (1)
  {
    sub_1000E9354();
    __int16 v18 = (const char *)(v16 + 24);
    sub_1004D37A8((uint64_t)v42, "kCLConnectionMessageNameKey", (char *)(v16 + 24));
    sub_10000FF54((std::string *)(v16 + 48), (uint64_t)&__p);
    sub_1000A84C8((uint64_t)&__p);
    unint64_t v19 = v66;
    if ((v66 & 0x80u) != 0) {
      unint64_t v19 = (unint64_t)v65[1];
    }
    __int16 v20 = (char *)&v61;
    if (v19)
    {
      sub_1000A84C8((uint64_t)&__p);
      __int16 v20 = (char *)v65;
    }
    sub_1004D37A8((uint64_t)v42, "kCLConnectionMessageOnBehalfOfKey", v20);
    *(_DWORD *)uint64_t v52 = *(_DWORD *)(v16 + 180);
    sub_1000EA838((uint64_t)v42, "kCLConnectionMessageReferenceFrameKey", v52);
    v52[0] = (*(unsigned char *)(v16 + 160) & 4) != 0;
    sub_1000EA238((uint64_t)v42, "kCLConnectionMessageConservativeEntry", v52);
    v52[0] = (*(unsigned char *)(v16 + 160) & 0x10) != 0;
    sub_1000EA238((uint64_t)v42, "kCLConnectionMessageEmergencyKey", v52);
    v52[0] = *(unsigned char *)(v16 + 160) & 1;
    sub_1000EA238((uint64_t)v42, "kCLConnectionMessageNotifyOnEntryKey", v52);
    v52[0] = (*(unsigned char *)(v16 + 160) & 2) != 0;
    sub_1000EA238((uint64_t)v42, "kCLConnectionMessageNotifyOnExitKey", v52);
    unint64_t v21 = *(void *)(v16 + 232) - *(void *)(v16 + 224);
    if (!v21)
    {
      if ((*(unsigned char *)(v16 + 160) & 0x80) != 0) {
        *(_DWORD *)uint64_t v52 = 3;
      }
      else {
        *(_DWORD *)uint64_t v52 = 1;
      }
      sub_1000EA838((uint64_t)v42, "kCLConnectionMessageRegionTypeKey", v52);
      sub_10016332C((uint64_t)v42, "kCLConnectionMessageLatitudeKey", (const void *)(v16 + 72));
      sub_10016332C((uint64_t)v42, "kCLConnectionMessageLongitudeKey", (const void *)(v16 + 80));
      sub_10016332C((uint64_t)v42, "kCLConnectionMessageRadiusKey", (const void *)(v16 + 88));
      v52[0] = (*(unsigned char *)(v16 + 160) & 8) != 0;
      sub_1000EA238((uint64_t)v42, "kCLConnectionMessageMonitoringNearby", v52);
      v52[0] = (*(unsigned char *)(v16 + 160) & 0x20) != 0;
      sub_1000EA238((uint64_t)v42, "kCLConnectionMessageLowPowerFenceKey", v52);
      goto LABEL_38;
    }
    int v41 = v21 >> 4;
    id v22 = objc_alloc((Class)NSMutableArray);
    id v23 = [v22 initWithCapacity:v41];
    if (v41 >= 1)
    {
      uint64_t v24 = 0;
      for (uint64_t j = 0; j < v41; ++j)
      {
        id v26 = [objc_alloc((Class)_CLVertex) initWithClientCoordinate:*(double *)(*(void *)(v16 + 224) + v24), *(double *)(*(void *)(v16 + 224) + v24 + 8)];
        [v23 addObject:v26];

        v24 += 16;
      }
    }
    uint64_t v40 = 0;
    char v27 = +[NSKeyedArchiver archivedDataWithRootObject:v23 requiringSecureCoding:1 error:&v40];
    if (v40) {
      break;
    }
    uint64_t v28 = (uint64_t)v27;
    *(_DWORD *)uint64_t v52 = 2;
    sub_1000EA838((uint64_t)v42, "kCLConnectionMessageRegionTypeKey", v52);
    sub_1000EA838((uint64_t)v42, "kCLConnectionMessagePolygonalVerticesCountKey", &v41);
    sub_1000EA8A4((uint64_t)v42, "kCLConnectionMessagePolygonalVerticesKey", v28);
    v52[0] = (*(unsigned char *)(v16 + 160) & 8) != 0;
    sub_1000EA238((uint64_t)v42, "kCLConnectionMessageMonitoringNearby", v52);

LABEL_38:
    if (*(char *)(v16 + 47) < 0) {
      __int16 v18 = *(const char **)v18;
    }
    sub_1004D3878((uint64_t)v43, v18, (uint64_t)v42);
    if (v70 < 0) {
      operator delete(v69);
    }
    if (v68 < 0) {
      operator delete(v67);
    }
    if ((char)v66 < 0) {
      operator delete(v65[0]);
    }
    if (v64 < 0) {
      operator delete(v63);
    }
    if (v62 < 0) {
      operator delete(v61);
    }
    if (v60 < 0) {
      operator delete(*(void **)&v59[16]);
    }
    if ((v59[15] & 0x80000000) != 0) {
      operator delete(__p);
    }
    sub_10013F3C4(v42);
    v16 += 248;
    if (v16 == v17) {
      goto LABEL_55;
    }
  }
  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  char v35 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)uint64_t v52 = 68289282;
    int v53 = 0;
    __int16 v54 = 2082;
    long long v55 = "";
    __int16 v56 = 2114;
    uint64_t v57 = v40;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#Spi, #error Unable to encode vertices\", \"error\":%{public, location:escape_only}@}", v52, 0x1Cu);
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
  }
  long long v36 = qword_102419528;
  if (os_signpost_enabled((os_log_t)qword_102419528))
  {
    *(_DWORD *)uint64_t v52 = 68289282;
    int v53 = 0;
    __int16 v54 = 2082;
    long long v55 = "";
    __int16 v56 = 2114;
    uint64_t v57 = v40;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v36, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#Spi, #error Unable to encode vertices", "{\"msg%{public}.0s\":\"#Spi, #error Unable to encode vertices\", \"error\":%{public, location:escape_only}@}", v52, 0x1Cu);
  }
  if (v70 < 0) {
    operator delete(v69);
  }
  if (v68 < 0) {
    operator delete(v67);
  }
  if ((char)v66 < 0) {
    operator delete(v65[0]);
  }
  if (v64 < 0) {
    operator delete(v63);
  }
  if (v62 < 0) {
    operator delete(v61);
  }
  if (v60 < 0) {
    operator delete(*(void **)&v59[16]);
  }
  if ((v59[15] & 0x80000000) != 0) {
    operator delete(__p);
  }
  sub_10013F3C4(v42);
  sub_10013F3C4(v43);
LABEL_66:
  if (v45 < 0) {
    operator delete(v44[0]);
  }
  std::string __p = &v46;
  sub_10008DF5C((void ***)&__p);
LABEL_69:
  if (SHIBYTE(v79[2]) < 0) {
    operator delete(v79[0]);
  }
  if (SHIBYTE(v78) < 0) {
    operator delete(*((void **)&v77 + 1));
  }
  if (SBYTE7(v77) < 0) {
    operator delete((void *)v76);
  }
  if ((v75[15] & 0x80000000) != 0) {
    operator delete(v74[1]);
  }
  if (SHIBYTE(v74[0]) < 0) {
    operator delete(v73[0]);
  }
  if (SHIBYTE(v72) < 0) {
    operator delete(*(void **)&buf[24]);
  }
  if ((buf[23] & 0x80000000) != 0) {
    operator delete(*(void **)buf);
  }
  sub_10013F3C4(v50);
  os_activity_scope_leave(&state);
}

- (void)checkAndExerciseAuthorizationForBundleID:(id)a3 orBundlePath:(id)a4 services:(unint64_t)a5 replyBlock:(id)a6
{
  id v27 = objc_alloc_init((Class)NSAutoreleasePool);
  id v11 = _os_activity_create((void *)&_mh_execute_header, "CL: checkAndExerciseAuthorizationForBundleID:orBundlePath:services:replyBlock:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v11, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v12 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)&uint8_t buf[8] = 2082;
    *(void *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"checkAndExerciseAuthorizationForBundleID:orBundlePath:services:replyBlock:\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  *(_OWORD *)long long v58 = 0u;
  memset(v59, 0, 19);
  long long v56 = 0u;
  *(_OWORD *)uint64_t v57 = 0u;
  memset(buf, 0, sizeof(buf));
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  memset(v63, 0, 27);
  if (!+[CLInternalService getEffectiveClientName:a3 bundlePath:a4 name:buf])
  {
    id v14 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
    (*((void (**)(id, id, void))a6 + 2))(a6, v14, 0);

    goto LABEL_59;
  }
  if (self) {
    [(CLInternalService *)self currentToken];
  }
  else {
    memset(v44, 0, sizeof(v44));
  }
  CLConnection::getUserNameFromAuditToken((uint64_t *)&__p, (CLConnection *)v44, v13);
  sub_1001A5B7C((std::string *)buf, (const std::string *)&__p);
  if (SBYTE3(v50) < 0) {
    operator delete(__p);
  }
  sub_1000A7FBC((uint64_t)buf, (uint64_t)&__p);
  if (SBYTE3(v50) >= 0) {
    p_p = &__p;
  }
  else {
    p_p = __p;
  }
  uint64_t v16 = +[NSString stringWithUTF8String:p_p];
  if (SBYTE3(v50) < 0) {
    operator delete(__p);
  }
  id v17 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLClientAuthorizationCache"];
  id v18 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLClientManager" forClient:@"CLInternalService"];
  id v19 = [v17 syncgetAuthorizationContextIfClientIsNonZonal:v16];
  id v20 = [v19 isNonProvisionallyAuthorizedForServiceTypeMask:a5];
  if (v20)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10234CA50);
    }
    unint64_t v21 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
    {
      sub_1000A7FBC((uint64_t)buf, (uint64_t)v42);
      id v22 = v43 >= 0 ? v42 : (void **)v42[0];
      std::string __p = (void *)68289282;
      __int16 v47 = 2082;
      uint64_t v48 = "";
      __int16 v49 = 2082;
      __int16 v50 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"markReceivingLocationInformation\", \"Client\":%{public, location:escape_only}s}", (uint8_t *)&__p, 0x1Cu);
      if (v43 < 0) {
        operator delete(v42[0]);
      }
    }
    sub_100089AE0((char *)__dst, (long long *)buf);
    [v18 markReceivingLocationInformation:sub_1000376D4((long long *)__dst)];
    if (v41 < 0) {
      operator delete(v40);
    }
    if (v39 < 0) {
      operator delete(v38);
    }
    if (v37 < 0) {
      operator delete(v36);
    }
    if (v35 < 0) {
      operator delete(v34);
    }
    if (v33 < 0) {
      operator delete(v32);
    }
    if (v31 < 0) {
      operator delete(v30);
    }
    if (v29 < 0) {
      operator delete(__dst[0]);
    }
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v23 = qword_102419528;
    if (!os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_58;
    }
    sub_1000A7FBC((uint64_t)buf, (uint64_t)v42);
    if (v43 >= 0) {
      uint64_t v24 = v42;
    }
    else {
      uint64_t v24 = (void **)v42[0];
    }
    std::string __p = (void *)68289794;
    __int16 v47 = 2082;
    uint64_t v48 = "";
    __int16 v49 = 2082;
    __int16 v50 = v24;
    __int16 v51 = 2050;
    unint64_t v52 = a5;
    __int16 v53 = 2114;
    id v54 = v19;
    __int16 v25 = "{\"msg%{public}.0s\":\"checkAndExerciseAuthorization response is YES\", \"client\":%{public, location:escape_o"
          "nly}s, \"requiredServices\":%{public}ld, \"authContext\":%{public, location:escape_only}@}";
  }
  else
  {
    if ([v19 isAuthorizedForServiceTypeMask:a5]) {
      [v18 handleProvisionalIntermediationForService:10 forClientKey:v16 at:0 withReply:&stru_10234C8E8];
    }
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v23 = qword_102419528;
    if (!os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_58;
    }
    sub_1000A7FBC((uint64_t)buf, (uint64_t)v42);
    if (v43 >= 0) {
      id v26 = v42;
    }
    else {
      id v26 = (void **)v42[0];
    }
    std::string __p = (void *)68289794;
    __int16 v47 = 2082;
    uint64_t v48 = "";
    __int16 v49 = 2082;
    __int16 v50 = v26;
    __int16 v51 = 2050;
    unint64_t v52 = a5;
    __int16 v53 = 2114;
    id v54 = v19;
    __int16 v25 = "{\"msg%{public}.0s\":\"checkAndExerciseAuthorization response is NO\", \"client\":%{public, location:escape_on"
          "ly}s, \"requiredServices\":%{public}ld, \"authContext\":%{public, location:escape_only}@}";
  }
  _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)&__p, 0x30u);
  if (v43 < 0) {
    operator delete(v42[0]);
  }
LABEL_58:
  (*((void (**)(id, void, id))a6 + 2))(a6, 0, v20);
LABEL_59:
  if (SHIBYTE(v63[2]) < 0) {
    operator delete(v63[0]);
  }
  if (SHIBYTE(v62) < 0) {
    operator delete(*((void **)&v61 + 1));
  }
  if (SBYTE7(v61) < 0) {
    operator delete((void *)v60);
  }
  if ((v59[15] & 0x80000000) != 0) {
    operator delete(v58[1]);
  }
  if (SHIBYTE(v58[0]) < 0) {
    operator delete(v57[0]);
  }
  if (SHIBYTE(v56) < 0) {
    operator delete(*(void **)&buf[24]);
  }
  if ((buf[23] & 0x80000000) != 0) {
    operator delete(*(void **)buf);
  }
  os_activity_scope_leave(&state);
}

- (void)getLocationForBundleID:(id)a3 orBundlePath:(id)a4 dynamicAccuracyReductionEnabled:(BOOL)a5 allowsAlteredAccessoryLocations:(BOOL)a6 replyBlock:(id)a7
{
  unint64_t v43 = __PAIR64__(a6, a5);
  id v46 = objc_alloc_init((Class)NSAutoreleasePool);
  id v11 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetLocation (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v11, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v12 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v126 = 2082;
    v127 = "";
    __int16 v128 = 2082;
    *(void *)v129 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetLocation\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  uint64_t v92 = 0;
  v93 = &v92;
  uint64_t v94 = 0xD012000000;
  v95 = sub_10017821C;
  v96 = nullsub_61;
  v97 = "";
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  memset(v106, 0, sizeof(v106));
  unsigned int v13 = [+[NSXPCConnection currentConnection] processIdentifier];
  *(_OWORD *)v86 = 0u;
  memset(v87, 0, 19);
  long long v84 = 0u;
  *(_OWORD *)v85 = 0u;
  *(_OWORD *)v82 = 0u;
  *(_OWORD *)v83 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  memset(v91, 0, 27);
  if (!+[CLInternalService getEffectiveClientName:a3 bundlePath:a4 name:v82])
  {
    id v15 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
    (*((void (**)(id, id, void))a7 + 2))(a7, v15, 0);

    goto LABEL_71;
  }
  if (self) {
    [(CLInternalService *)self currentToken];
  }
  else {
    memset(v81, 0, sizeof(v81));
  }
  CLConnection::getUserNameFromAuditToken((uint64_t *)buf, (CLConnection *)v81, v14);
  sub_1001A5B7C((std::string *)v82, (const std::string *)buf);
  if ((v129[3] & 0x80000000) != 0) {
    operator delete(*(void **)buf);
  }
  id v16 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLClientAuthorizationCache"];
  sub_1000A7FBC((uint64_t)v82, (uint64_t)buf);
  if (v129[3] >= 0) {
    id v17 = buf;
  }
  else {
    id v17 = *(uint8_t **)buf;
  }
  id v18 = [v16 syncgetAuthorizationContextIfClientIsNonZonal:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v17)];
  if ((v129[3] & 0x80000000) != 0) {
    operator delete(*(void **)buf);
  }
  id v19 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLClientManager"];
  [v19 registerDelegate:+[CLInternalService getIntersiloDelegate](CLInternalService, "getIntersiloDelegate") inSilo:+[CLInternalService getAsyncResponseSilo](CLInternalService, "getAsyncResponseSilo")];
  if (v18)
  {
    if ([v18 isNonProvisionallyAuthorizedForServiceType:4])
    {
      if ([v18 isNonProvisionallyAuthorizedForServiceType:12])
      {
        id v20 = [[-[CLInternalService vendor](self, "vendor", sub_1000DBC34(buf).n128_f64[0]) proxyForService:@"CLLocationController"];
        unsigned int v21 = [v20 syncgetLocation:v93 + 6];
        unsigned int v22 = [objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLLocationController") syncgetLocationPrivate:buf];
        if (qword_102419520 != -1) {
          dispatch_once(&qword_102419520, &stru_10234CA70);
        }
        id v23 = qword_102419528;
        if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v108 = 68291075;
          *(_DWORD *)&v108[4] = 0;
          __int16 v109 = 2082;
          v110 = "";
          __int16 v111 = 1040;
          *(_DWORD *)v112 = 156;
          *(_WORD *)&v112[4] = 2097;
          *(void *)&v112[6] = v93 + 6;
          __int16 v113 = 2049;
          uint64_t v114 = *(void *)&v129[4];
          __int16 v115 = 2049;
          uint64_t v116 = *(void *)&v129[12];
          __int16 v117 = 1025;
          unsigned int v118 = v21;
          __int16 v119 = 2049;
          uint64_t v120 = v130;
          __int16 v121 = 2049;
          uint64_t v122 = v131;
          __int16 v123 = 2049;
          uint64_t v124 = v132;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Spi, altered getLocation\", \"location\":%{private, location:CLClientLocation}.*P, \"timestampGps\":\"%{private}f\", \"machTime\":\"%{private}f\", \"gotLocation\":%{private}hhd, \"specialCoordinateLat\":\"%{private}f\", \"specialCoordinateLon\":\"%{private}f\", \"specialHorizontalAccuracy\":\"%{private}f\"}", v108, 0x5Au);
        }
        if ((v21 & 1) != 0
          && ((v45 & 1) != 0
           || !sub_101551590((uint64_t)(v93 + 6))
           || v22 && sub_1015515A8((uint64_t)(v93 + 6), (uint64_t)buf)))
        {
          if (v44)
          {
            uint64_t v24 = dispatch_group_create();
            dispatch_group_enter(v24);
            id v25 = objc_alloc((Class)CLLocation);
            long long v26 = *((_OWORD *)v93 + 5);
            long long v27 = *((_OWORD *)v93 + 8);
            long long v28 = *((_OWORD *)v93 + 9);
            *(_OWORD *)((char *)v65 + 12) = *(_OWORD *)((char *)v93 + 188);
            long long v29 = *((_OWORD *)v93 + 10);
            long long v30 = *((_OWORD *)v93 + 11);
            v64[6] = v28;
            v64[7] = v29;
            v65[0] = v30;
            long long v31 = *((_OWORD *)v93 + 6);
            long long v32 = *((_OWORD *)v93 + 7);
            v64[2] = v26;
            v64[3] = v31;
            v64[4] = v32;
            v64[5] = v27;
            long long v33 = *((_OWORD *)v93 + 4);
            v64[0] = *((_OWORD *)v93 + 3);
            v64[1] = v33;
            v63[0] = _NSConcreteStackBlock;
            v63[1] = 3221225472;
            v63[2] = sub_101A00888;
            v63[3] = &unk_1022E8BE8;
            v63[4] = v24;
            v63[5] = &v92;
            [v19 reduceAccuracy:objc_msgSend(v25, "initWithClientLocation:", v64) withReply:v63];
            dispatch_group_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
            dispatch_release(v24);
          }
          if (qword_102419530 != -1) {
            dispatch_once(&qword_102419530, &stru_10234CA50);
          }
          uint64_t v34 = qword_102419538;
          if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
          {
            sub_1000A7FBC((uint64_t)v82, (uint64_t)__p);
            char v35 = v62 >= 0 ? __p : (void **)__p[0];
            *(_DWORD *)v108 = 68289282;
            *(_DWORD *)&v108[4] = 0;
            __int16 v109 = 2082;
            v110 = "";
            __int16 v111 = 2082;
            *(void *)v112 = v35;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"markReceivingLocationInformation\", \"Client\":%{public, location:escape_only}s}", v108, 0x1Cu);
            if (v62 < 0) {
              operator delete(__p[0]);
            }
          }
          sub_100089AE0((char *)__dst, (long long *)v82);
          [v19 markReceivingLocationInformation:sub_1000376D4((long long *)__dst)];
          if (v60 < 0) {
            operator delete(v59);
          }
          if (v58 < 0) {
            operator delete(v57);
          }
          if (v56 < 0) {
            operator delete(v55);
          }
          if (v54 < 0) {
            operator delete(v53);
          }
          if (v52 < 0) {
            operator delete(v51);
          }
          if (v50 < 0) {
            operator delete(v49);
          }
          if (v48 < 0) {
            operator delete(__dst[0]);
          }
          (*((void (**)(id, void, NSData *))a7 + 2))(a7, 0, +[NSData dataWithBytes:v93 + 6 length:156]);
        }
        else
        {
          id v42 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
          (*((void (**)(id, id, void))a7 + 2))(a7, v42, 0);
        }
        if (v133) {
          sub_1000DB0A0(v133);
        }
      }
      else
      {
        id v41 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLCorrectiveCompensatedLocationProvider" forClient:@"CLInternalService"];
        v66[0] = _NSConcreteStackBlock;
        v66[1] = 3321888768;
        v66[2] = sub_101A00550;
        v66[3] = &unk_10234C910;
        sub_100089AE0((char *)&v67, (long long *)v82);
        v66[4] = v19;
        v66[5] = a7;
        [v41 fetchLocationWithReply:v66];
        if (v80 < 0) {
          operator delete(v79);
        }
        if (v78 < 0) {
          operator delete(v77);
        }
        if (v76 < 0) {
          operator delete(v75);
        }
        if (v74 < 0) {
          operator delete(v73);
        }
        if (v72 < 0) {
          operator delete(v71);
        }
        if (v70 < 0) {
          operator delete(v69);
        }
        if (v68 < 0) {
          operator delete(v67);
        }
      }
      goto LABEL_71;
    }
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    long long v36 = qword_102419528;
    if (!os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_64;
    }
    sub_1000372B8((uint64_t)v82, (std::string *)v108);
    if (v112[3] >= 0) {
      char v37 = v108;
    }
    else {
      char v37 = *(uint8_t **)v108;
    }
    *(_DWORD *)buf = 68289538;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v126 = 2082;
    v127 = "";
    __int16 v128 = 2082;
    *(void *)v129 = v37;
    *(_WORD *)&v129[8] = 1026;
    *(_DWORD *)&v129[10] = v13;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning #Spi, GetLocation rejected for entity: no way to establish effective authorization\", \"name\":%{public, location:escape_only}s, \"pid\":%{public}d}", buf, 0x22u);
    if ((v112[3] & 0x80000000) != 0) {
      operator delete(*(void **)v108);
    }
  }
  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
LABEL_64:
  long long v38 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000372B8((uint64_t)v82, (std::string *)v108);
    char v39 = v112[3] >= 0 ? v108 : *(uint8_t **)v108;
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v126 = 2082;
    v127 = "";
    __int16 v128 = 2082;
    *(void *)v129 = v39;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi, GetLocation rejected for entity: insufficient effective authorization\", \"name\":%{public, location:escape_only}s}", buf, 0x1Cu);
    if ((v112[3] & 0x80000000) != 0) {
      operator delete(*(void **)v108);
    }
  }
  id v40 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
  (*((void (**)(id, id, void))a7 + 2))(a7, v40, 0);

LABEL_71:
  if (SHIBYTE(v91[2]) < 0) {
    operator delete(v91[0]);
  }
  if (SHIBYTE(v90) < 0) {
    operator delete(*((void **)&v89 + 1));
  }
  if (SBYTE7(v89) < 0) {
    operator delete((void *)v88);
  }
  if ((v87[15] & 0x80000000) != 0) {
    operator delete(v86[1]);
  }
  if (SHIBYTE(v86[0]) < 0) {
    operator delete(v85[0]);
  }
  if (SHIBYTE(v84) < 0) {
    operator delete(v83[1]);
  }
  if (SHIBYTE(v83[0]) < 0) {
    operator delete(v82[0]);
  }
  _Block_object_dispose(&v92, 8);
  os_activity_scope_leave(&state);
}

- (void)getGroundAltitudeForBundleID:(id)a3 orBundlePath:(id)a4 location:(id)a5 replyBlock:(id)a6
{
  id v11 = objc_alloc_init((Class)NSAutoreleasePool);
  id v12 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetGroundAltitude (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v12, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  unsigned int v13 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)&uint8_t buf[8] = 2082;
    *(void *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetGroundAltitude\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  *(_OWORD *)long long v89 = 0u;
  memset(v90, 0, 19);
  long long v87 = 0u;
  *(_OWORD *)long long v88 = 0u;
  *(_OWORD *)v85 = 0u;
  *(_OWORD *)v86 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  memset(__p, 0, 27);
  if (+[CLInternalService getEffectiveClientName:a3 bundlePath:a4 name:v85])
  {
    if (self) {
      [(CLInternalService *)self currentToken];
    }
    else {
      memset(v81, 0, sizeof(v81));
    }
    CLConnection::getUserNameFromAuditToken((uint64_t *)buf, (CLConnection *)v81, v14);
    sub_1001A5B7C((std::string *)v85, (const std::string *)buf);
    if ((buf[23] & 0x80000000) != 0) {
      operator delete(*(void **)buf);
    }
    sub_1000A7FBC((uint64_t)v85, (uint64_t)buf);
    if (buf[23] >= 0) {
      id v16 = buf;
    }
    else {
      id v16 = *(unsigned char **)buf;
    }
    id v17 = +[NSString stringWithUTF8String:v16];
    if ((buf[23] & 0x80000000) != 0) {
      operator delete(*(void **)buf);
    }
    id v18 = [objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLClientAuthorizationCache") syncgetAuthorizationContextIfClientIsNonZonal:v17];
    if ([v18 isNonProvisionallyAuthorizedForServiceType:10])
    {
      uint64_t v72 = 0;
      v73 = &v72;
      uint64_t v74 = 0x3052000000;
      v75 = sub_101A011A0;
      char v76 = sub_101A011B0;
      uint64_t v77 = 0;
      uint64_t v57 = 0;
      char v58 = &v57;
      uint64_t v59 = 0xD012000000;
      char v60 = sub_10017821C;
      long long v61 = nullsub_61;
      char v62 = "";
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      memset(v71, 0, sizeof(v71));
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_101A011BC;
      v56[3] = &unk_10234C968;
      v56[4] = &v72;
      v56[5] = &v57;
      [(CLInternalService *)self getLocationForBundleID:a3 orBundlePath:a4 dynamicAccuracyReductionEnabled:0 allowsAlteredAccessoryLocations:0 replyBlock:v56];
      if (v73[5])
      {
        id v19 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
        long long v53 = xmmword_101D1C570;
        uint64_t v54 = 0;
        uint64_t v55 = 0xFFFFFFFFLL;
        (*((void (**)(id, id, long long *))a6 + 2))(a6, v19, &v53);
      }
      else
      {
        double v21 = *(double *)((char *)v58 + 52);
        double v22 = *(double *)((char *)v58 + 60);
        [a5 coordinate];
        double v24 = v23;
        [a5 coordinate];
        if (sub_1000A3D9C(v21, v22, v24, v25) <= self->_groundAltitudeDistanceThreshold)
        {
          *(void *)&buf[12] = 0;
          *(void *)&uint8_t buf[4] = 0;
          *(_OWORD *)&buf[20] = xmmword_101D1C320;
          __asm { FMOV            V0.2D, #-1.0 }
          *(_OWORD *)&buf[36] = _Q0;
          *(_OWORD *)&buf[52] = _Q0;
          *(_OWORD *)&buf[68] = _Q0;
          *(_DWORD *)buf = 0xFFFF;
          *(_DWORD *)&buf[84] = 0;
          *(void *)&buf[88] = 0xBFF0000000000000;
          long long v97 = 0uLL;
          *(void *)((char *)&v98 + 4) = 0xBFF0000000000000;
          LODWORD(v98) = 0;
          HIDWORD(v98) = 0x7FFFFFFF;
          memset(v99, 0, 25);
          *(void *)&double v32 = sub_1000DBC34(v100).n128_u64[0];
          if (a5)
          {
            [a5 clientLocation:v32];
          }
          else
          {
            long long v48 = 0u;
            memset(v49, 0, 28);
            long long v46 = 0u;
            long long v47 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            long long v42 = 0u;
            long long v43 = 0u;
            long long v41 = 0u;
          }
          long long v97 = v47;
          long long v98 = v48;
          *(_OWORD *)long long v99 = v49[0];
          *(_OWORD *)&v99[12] = *(_OWORD *)((char *)v49 + 12);
          *(_OWORD *)&unsigned char buf[32] = v43;
          *(_OWORD *)&unsigned char buf[48] = v44;
          *(_OWORD *)&buf[64] = v45;
          *(_OWORD *)&buf[80] = v46;
          *(_OWORD *)buf = v41;
          *(_OWORD *)&buf[16] = v42;
          int v40 = 0;
          *(void *)&long long v41 = 0;
          if (objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLDigitalElevationModel"), "syncgetAltitude:rel:undulation:", buf, &v40, &v41))
          {
            long long v37 = *(_OWORD *)&v100[376];
            uint64_t v38 = v41;
            uint64_t v39 = 2;
            (*((void (**)(id, void, long long *))a6 + 2))(a6, 0, &v37);
          }
          else
          {
            id v33 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
            long long v34 = xmmword_101D1C570;
            uint64_t v35 = 0;
            uint64_t v36 = 0xFFFFFFFFLL;
            (*((void (**)(id, id, long long *))a6 + 2))(a6, v33, &v34);
          }
          if (v101) {
            sub_1000DB0A0(v101);
          }
        }
        else
        {
          id v26 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
          long long v50 = xmmword_101D1C570;
          uint64_t v51 = 0;
          uint64_t v52 = 0xFFFFFFFFLL;
          (*((void (**)(id, id, long long *))a6 + 2))(a6, v26, &v50);
        }
      }
      _Block_object_dispose(&v57, 8);
      _Block_object_dispose(&v72, 8);
    }
    else
    {
      if ([v18 isAuthorizedForServiceType:10]) {
        [objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:forClient:", @"CLClientManager", @"CLInternalService") handleProvisionalIntermediationForService:10 forClientKey:v17 at:0 withReply:&stru_10234C940];
      }
      id v20 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:3 userInfo:0];
      long long v78 = xmmword_101D1C570;
      uint64_t v79 = 0;
      uint64_t v80 = 0xFFFFFFFFLL;
      (*((void (**)(id, id, long long *))a6 + 2))(a6, v20, &v78);
    }
  }
  else
  {
    id v15 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
    long long v82 = xmmword_101D1C570;
    uint64_t v83 = 0;
    uint64_t v84 = 0xFFFFFFFFLL;
    (*((void (**)(id, id, long long *))a6 + 2))(a6, v15, &v82);
  }
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v93) < 0) {
    operator delete(*((void **)&v92 + 1));
  }
  if (SBYTE7(v92) < 0) {
    operator delete((void *)v91);
  }
  if ((v90[15] & 0x80000000) != 0) {
    operator delete(v89[1]);
  }
  if (SHIBYTE(v89[0]) < 0) {
    operator delete(v88[0]);
  }
  if (SHIBYTE(v87) < 0) {
    operator delete(v86[1]);
  }
  if (SHIBYTE(v86[0]) < 0) {
    operator delete(v85[0]);
  }
  os_activity_scope_leave(&state);
}

- (void)getStatusBarIconState:(id)a3
{
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  id v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetStatusBarIconState (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v7 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v20 = 0;
    __int16 v21 = 2082;
    double v22 = "";
    __int16 v23 = 2082;
    double v24 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetStatusBarIconState\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v8 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.status"];
  if (v8
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    id v9 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLStatusBarIconManager"] syncgetIconState];
    if (v9 >= 3)
    {
      id v10 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      unsigned int v13 = qword_102419528;
      if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        int v20 = (int)v9;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Unexpected iconState: %d", buf, 8u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419520 != -1) {
          dispatch_once(&qword_102419520, &stru_10234CA70);
        }
        int v17 = 67109120;
        int v18 = (int)v9;
        id v15 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService getStatusBarIconState:]", "%s\n", v15);
        if (v15 != (char *)buf) {
          free(v15);
        }
      }
      id v9 = 0;
    }
    else
    {
      id v10 = 0;
    }
    (*((void (**)(id, id, id))a3 + 2))(a3, v10, v9);
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v11 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      LOWORD(v17) = 0;
      id v14 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService getStatusBarIconState:]", "%s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
    }
    id v12 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id, void))a3 + 2))(a3, v12, 0);
  }
  os_activity_scope_leave(&state);
}

- (void)setStatusBarIconEnabledForEntityClass:(unsigned int)a3 enabled:(BOOL)a4 replyBlock:(id)a5
{
  BOOL v6 = a4;
  uint64_t v7 = *(void *)&a3;
  id v9 = objc_alloc_init((Class)NSAutoreleasePool);
  id v10 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonSetStatusBarIconEnabledForEntityClass (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v10, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v11 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v32 = 2082;
    id v33 = "";
    __int16 v34 = 2082;
    *(void *)uint64_t v35 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonSetStatusBarIconEnabledForEntityClass\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v12 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.authorizeapplications"];
  if (v12
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v12 BOOLValue] & 1) != 0)
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    unsigned int v13 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      if (self) {
        [(CLInternalService *)self currentToken];
      }
      else {
        memset(v18, 0, sizeof(v18));
      }
      sub_10001BEC0(v18, (uint64_t)buf);
      sub_1000372B8((uint64_t)buf, &v19);
      if (v46 < 0) {
        operator delete(__p);
      }
      if (v44 < 0) {
        operator delete(v43);
      }
      if (v42 < 0) {
        operator delete(v41);
      }
      if (v40 < 0) {
        operator delete(v39);
      }
      if (v38 < 0) {
        operator delete(v37);
      }
      if (v36 < 0) {
        operator delete(*(void **)&v35[4]);
      }
      if ((v35[3] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      id v16 = &v19;
      if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        id v16 = (std::string *)v19.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)__int16 v21 = 68289794;
      int v22 = 0;
      __int16 v23 = 2082;
      double v24 = "";
      __int16 v25 = 2082;
      id v26 = v16;
      __int16 v27 = 1026;
      int v28 = v7;
      __int16 v29 = 1026;
      BOOL v30 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi, setting the status bar icon enabled state\", \"name\":%{public, location:escape_only}s, \"entityClass\":%{public}u, \"enabled\":%{public}hhd}", v21, 0x28u);
      if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v19.__r_.__value_.__l.__data_);
      }
    }
    [objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLStatusBarIconManager") setStatusBarIconForEntityClass:v7 visible:v6];
    (*((void (**)(id, void))a5 + 2))(a5, 0);
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v14 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      *(_WORD *)__int16 v21 = 0;
      int v17 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService setStatusBarIconEnabledForEntityClass:enabled:replyBlock:]", "%s\n", v17);
      if (v17 != (char *)buf) {
        free(v17);
      }
    }
    id v15 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id))a5 + 2))(a5, v15);
  }
  os_activity_scope_leave(&state);
}

- (void)getStatusBarIconEnabledForEntityClass:(unsigned int)a3 replyBlock:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init((Class)NSAutoreleasePool);
  id v8 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetStatusBarIconEnabledForEntityClass (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v9 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v28 = 2082;
    __int16 v29 = "";
    __int16 v30 = 2082;
    *(void *)long long v31 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetStatusBarIconEnabledForEntityClass\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v10 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.authorizeapplications"];
  if (v10
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v10 BOOLValue] & 1) != 0)
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v11 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_INFO))
    {
      if (self) {
        [(CLInternalService *)self currentToken];
      }
      else {
        memset(v16, 0, sizeof(v16));
      }
      sub_10001BEC0(v16, (uint64_t)buf);
      sub_1000372B8((uint64_t)buf, &v17);
      if (v42 < 0) {
        operator delete(__p);
      }
      if (v40 < 0) {
        operator delete(v39);
      }
      if (v38 < 0) {
        operator delete(v37);
      }
      if (v36 < 0) {
        operator delete(v35);
      }
      if (v34 < 0) {
        operator delete(v33);
      }
      if (v32 < 0) {
        operator delete(*(void **)&v31[4]);
      }
      if ((v31[3] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      id v14 = &v17;
      if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        id v14 = (std::string *)v17.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)std::string v19 = 68289538;
      int v20 = 0;
      __int16 v21 = 2082;
      int v22 = "";
      __int16 v23 = 2082;
      double v24 = v14;
      __int16 v25 = 1026;
      int v26 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Spi, Retrieved the status bar icon enabled state\", \"name\":%{public, location:escape_only}s, \"entityClass\":%{public}u}", v19, 0x22u);
      if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v17.__r_.__value_.__l.__data_);
      }
    }
    (*((void (**)(id, void, id))a4 + 2))(a4, 0, [objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLStatusBarIconManager") syncgetStatusBarIconForEntityClass:v5]);
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v12 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      *(_WORD *)std::string v19 = 0;
      id v15 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService getStatusBarIconEnabledForEntityClass:replyBlock:]", "%s\n", v15);
      if (v15 != (char *)buf) {
        free(v15);
      }
    }
    id v13 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id, void))a4 + 2))(a4, v13, 0);
  }
  os_activity_scope_leave(&state);
}

- (void)setMapMatchingRouteHint:(id)a3 routingType:(int)a4 stepType:(int)a5 replyBlock:(id)a6
{
  id v11 = objc_alloc_init((Class)NSAutoreleasePool);
  id v12 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonSetMapMatchingRouteHint (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v12, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v13 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v62 = 2082;
    long long v63 = "";
    __int16 v64 = 2082;
    *(void *)long long v65 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonSetMapMatchingRouteHint\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v14 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.route_hint"];
  if (v14
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v14 BOOLValue] & 1) != 0)
  {
    id v48 = v11;
    id v15 = (char *)[a3 bytes];
    char v46 = (void (**)(id, void))a6;
    int v49 = a4;
    int v50 = a5;
    unint64_t v16 = (unint64_t)[a3 length];
    unint64_t v47 = v16 / 0x28;
    std::string __p = 0;
    uint64_t v55 = 0;
    char v56 = 0;
    if (v16 >= 0x28)
    {
      std::string v17 = 0;
      uint64_t v18 = 0;
      if (v47 <= 1) {
        unint64_t v19 = 1;
      }
      else {
        unint64_t v19 = v16 / 0x28;
      }
      do
      {
        int v20 = &v15[40 * v18];
        if (v17 >= (_OWORD *)v56)
        {
          __int16 v23 = __p;
          unint64_t v24 = 0xCCCCCCCCCCCCCCCDLL * (((char *)v17 - (unsigned char *)__p) >> 3);
          unint64_t v25 = v24 + 1;
          if (v24 + 1 > 0x666666666666666) {
            sub_1001D7FD4();
          }
          if (0x999999999999999ALL * ((v56 - (unsigned char *)__p) >> 3) > v25) {
            unint64_t v25 = 0x999999999999999ALL * ((v56 - (unsigned char *)__p) >> 3);
          }
          if (0xCCCCCCCCCCCCCCCDLL * ((v56 - (unsigned char *)__p) >> 3) >= 0x333333333333333) {
            unint64_t v26 = 0x666666666666666;
          }
          else {
            unint64_t v26 = v25;
          }
          if (v26)
          {
            __int16 v27 = (char *)sub_1002E5328((uint64_t)&v56, v26);
            __int16 v23 = __p;
            std::string v17 = v55;
          }
          else
          {
            __int16 v27 = 0;
          }
          __int16 v28 = &v27[40 * v24];
          long long v29 = *(_OWORD *)v20;
          long long v30 = *((_OWORD *)v20 + 1);
          *((void *)v28 + 4) = *((void *)v20 + 4);
          *(_OWORD *)__int16 v28 = v29;
          *((_OWORD *)v28 + 1) = v30;
          if (v17 == v23)
          {
            char v34 = &v27[40 * v24];
          }
          else
          {
            long long v31 = &v27[40 * v24];
            do
            {
              long long v32 = *(_OWORD *)((char *)v17 - 40);
              long long v33 = *(_OWORD *)((char *)v17 - 24);
              char v34 = v31 - 40;
              *((void *)v31 - 1) = *((void *)v17 - 1);
              *(_OWORD *)(v31 - 24) = v33;
              *(_OWORD *)(v31 - 40) = v32;
              std::string v17 = (_OWORD *)((char *)v17 - 40);
              v31 -= 40;
            }
            while (v17 != v23);
          }
          std::string v17 = v28 + 40;
          std::string __p = v34;
          uint64_t v55 = v28 + 40;
          char v56 = &v27[40 * v26];
          if (v23) {
            operator delete(v23);
          }
        }
        else
        {
          long long v21 = *(_OWORD *)v20;
          long long v22 = *((_OWORD *)v20 + 1);
          *((void *)v17 + 4) = *((void *)v20 + 4);
          *std::string v17 = v21;
          v17[1] = v22;
          std::string v17 = (_OWORD *)((char *)v17 + 40);
        }
        uint64_t v55 = v17;
        ++v18;
      }
      while (v18 != v19);
    }
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v11 = v48;
    uint64_t v35 = (void (**)(id, void))a6;
    unsigned int v37 = v49;
    unsigned int v36 = v50;
    char v38 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
    {
      if (self) {
        [(CLInternalService *)self currentToken];
      }
      else {
        memset(v53, 0, sizeof(v53));
      }
      sub_10001BEC0(v53, (uint64_t)buf);
      sub_1000372B8((uint64_t)buf, &v58);
      if (v76 < 0) {
        operator delete(v75);
      }
      if (v74 < 0) {
        operator delete(v73);
      }
      if (v72 < 0) {
        operator delete(v71);
      }
      if (v70 < 0) {
        operator delete(v69);
      }
      if (v68 < 0) {
        operator delete(v67);
      }
      if (v66 < 0) {
        operator delete(*(void **)&v65[4]);
      }
      if ((v65[3] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      long long v41 = &v58;
      if ((v58.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        long long v41 = (std::string *)v58.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)uint64_t v77 = 134349826;
      unint64_t v78 = v47;
      __int16 v79 = 1026;
      int v80 = v49;
      __int16 v81 = 1026;
      int v82 = v50;
      __int16 v83 = 2082;
      uint64_t v84 = v41;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "#Spi,RouteHints,setMapMatchingRouteHint,received,%{public}lu,routeType,%{public}d,stepType,%{public}d,source,%{public}s", v77, 0x22u);
      if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v58.__r_.__value_.__l.__data_);
      }
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      if (self) {
        [(CLInternalService *)self currentToken];
      }
      else {
        memset(v51, 0, sizeof(v51));
      }
      sub_10001BEC0(v51, (uint64_t)v77);
      sub_1000372B8((uint64_t)v77, &v52);
      sub_1000064D0((uint64_t)v77);
      if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        char v44 = &v52;
      }
      else {
        char v44 = (std::string *)v52.__r_.__value_.__r.__words[0];
      }
      LODWORD(v58.__r_.__value_.__l.__data_) = 134349826;
      *(std::string::size_type *)((char *)v58.__r_.__value_.__r.__words + 4) = v47;
      WORD2(v58.__r_.__value_.__r.__words[1]) = 1026;
      *(_DWORD *)((char *)&v58.__r_.__value_.__r.__words[1] + 6) = v49;
      WORD1(v58.__r_.__value_.__r.__words[2]) = 1026;
      HIDWORD(v58.__r_.__value_.__r.__words[2]) = v50;
      __int16 v59 = 2082;
      char v60 = v44;
      long long v45 = (char *)_os_log_send_and_compose_impl();
      if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v52.__r_.__value_.__l.__data_);
      }
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService setMapMatchingRouteHint:routingType:stepType:replyBlock:]", "%s\n", v45);
      if (v45 != (char *)buf) {
        free(v45);
      }
      id v11 = v48;
      uint64_t v35 = v46;
      unsigned int v37 = v49;
      unsigned int v36 = v50;
    }
    uint64_t v42 = sub_1008B6998();
    sub_1008B730C(v42, v37, v36, (uint64_t)&__p);
    v35[2](v35, 0);
    if (__p)
    {
      uint64_t v55 = __p;
      operator delete(__p);
    }
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    uint64_t v39 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      *(_WORD *)uint64_t v77 = 0;
      long long v43 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService setMapMatchingRouteHint:routingType:stepType:replyBlock:]", "%s\n", v43);
      if (v43 != (char *)buf) {
        free(v43);
      }
    }
    id v40 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id))a6 + 2))(a6, v40);
  }
  os_activity_scope_leave(&state);
}

- (void)setTrackRunHint:(id)a3 replyBlock:(id)a4
{
  id v7 = objc_alloc_init((Class)NSAutoreleasePool);
  id v8 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonSetTrackRunHint (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v9 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v26 = 2082;
    __int16 v27 = "";
    __int16 v28 = 2082;
    *(void *)long long v29 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonSetTrackRunHint\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v10 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.grassland"];
  if (v10
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v10 BOOLValue] & 1) != 0)
  {
    if (qword_102418FB0 != -1) {
      dispatch_once(&qword_102418FB0, &stru_10234CA90);
    }
    id v11 = qword_102418FB8;
    if (os_log_type_enabled((os_log_t)qword_102418FB8, OS_LOG_TYPE_DEFAULT))
    {
      if (self) {
        [(CLInternalService *)self currentToken];
      }
      else {
        memset(v19, 0, sizeof(v19));
      }
      sub_10001BEC0(v19, (uint64_t)buf);
      sub_1000372B8((uint64_t)buf, v21);
      if (v40 < 0) {
        operator delete(__p);
      }
      if (v38 < 0) {
        operator delete(v37);
      }
      if (v36 < 0) {
        operator delete(v35);
      }
      if (v34 < 0) {
        operator delete(v33);
      }
      if (v32 < 0) {
        operator delete(v31);
      }
      if (v30 < 0) {
        operator delete(*(void **)&v29[4]);
      }
      if ((v29[3] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      id v14 = v21;
      if ((v21[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        id v14 = (std::string *)v21[0].__r_.__value_.__r.__words[0];
      }
      LODWORD(v22.__r_.__value_.__l.__data_) = 136446210;
      *(std::string::size_type *)((char *)v22.__r_.__value_.__r.__words + 4) = (std::string::size_type)v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#Spi,CLTR,Daemon,setTrackRunHint,received,source,%{public}s", (uint8_t *)&v22, 0xCu);
      if (SHIBYTE(v21[0].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v21[0].__r_.__value_.__l.__data_);
      }
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102418FB0 != -1) {
        dispatch_once(&qword_102418FB0, &stru_10234CA90);
      }
      if (self) {
        [(CLInternalService *)self currentToken];
      }
      else {
        memset(v18, 0, sizeof(v18));
      }
      sub_10001BEC0(v18, (uint64_t)v21);
      sub_1000372B8((uint64_t)v21, &v22);
      sub_1000064D0((uint64_t)v21);
      if ((v22.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        unint64_t v16 = &v22;
      }
      else {
        unint64_t v16 = (std::string *)v22.__r_.__value_.__r.__words[0];
      }
      int v23 = 136446210;
      unint64_t v24 = v16;
      std::string v17 = (char *)_os_log_send_and_compose_impl();
      if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v22.__r_.__value_.__l.__data_);
      }
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService setTrackRunHint:replyBlock:]", "%s\n", v17);
      if (v17 != (char *)buf) {
        free(v17);
      }
    }
    [objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLLocationController") setTrackRunHint:a3];
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v12 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      LOWORD(v21[0].__r_.__value_.__l.__data_) = 0;
      id v15 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService setTrackRunHint:replyBlock:]", "%s\n", v15);
      if (v15 != (char *)buf) {
        free(v15);
      }
    }
    id v13 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id))a4 + 2))(a4, v13);
  }
  os_activity_scope_leave(&state);
}

- (void)getAccessoryTypeBitSetWithReplyBlock:(id)a3
{
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  BOOL v6 = _os_activity_create((void *)&_mh_execute_header, "CL: getAccessoryTypeBitSetWithReplyBlock (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v7 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v17 = 0;
    __int16 v18 = 2082;
    unint64_t v19 = "";
    __int16 v20 = 2082;
    long long v21 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"getAccessoryTypeBitSetWithReplyBlock\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v8 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.accessory_location"];
  if (v8
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    id v9 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLAccessoryLocationProvider"];
    [v9 registerDelegate:+[CLInternalService getIntersiloDelegate](CLInternalService, "getIntersiloDelegate") inSilo:+[CLInternalService getAsyncResponseSilo](CLInternalService, "getAsyncResponseSilo")];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    _OWORD v13[2] = sub_101A03334;
    v13[3] = &unk_102305F20;
    uint8_t v13[4] = a3;
    [v9 fetchAccessoryBitSetWithReply:v13];
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v10 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      __int16 v14 = 0;
      id v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService getAccessoryTypeBitSetWithReplyBlock:]", "%s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
    id v11 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id, uint64_t))a3 + 2))(a3, v11, 0xFFFFFFFFLL);
  }
  os_activity_scope_leave(&state);
}

- (void)getAccessoryPASCDTransmissionStateWithReplyBlock:(id)a3
{
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  BOOL v6 = _os_activity_create((void *)&_mh_execute_header, "CL: getAccessoryPASCDTransmissionStateWithReplyBlock (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v7 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v17 = 0;
    __int16 v18 = 2082;
    unint64_t v19 = "";
    __int16 v20 = 2082;
    long long v21 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"getAccessoryPASCDTransmissionStateWithReplyBlock\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v8 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.accessory_location"];
  if (v8
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    id v9 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLAccessoryLocationProvider"];
    [v9 registerDelegate:+[CLInternalService getIntersiloDelegate](CLInternalService, "getIntersiloDelegate") inSilo:+[CLInternalService getAsyncResponseSilo](CLInternalService, "getAsyncResponseSilo")];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    _OWORD v13[2] = sub_101A03728;
    v13[3] = &unk_102305F20;
    uint8_t v13[4] = a3;
    [v9 fetchAccessoryPASCDTransmissionStateWithReply:v13];
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v10 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      __int16 v14 = 0;
      id v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService getAccessoryPASCDTransmissionStateWithReplyBlock:]", "%s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
    id v11 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id, uint64_t))a3 + 2))(a3, v11, 4);
  }
  os_activity_scope_leave(&state);
}

- (void)getOdometryBatchedLocationsWithReplyBlock:(id)a3
{
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  BOOL v6 = _os_activity_create((void *)&_mh_execute_header, "CL: getOdometryBatchedLocationsWithReplyBlock (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v7 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v17 = 0;
    __int16 v18 = 2082;
    unint64_t v19 = "";
    __int16 v20 = 2082;
    long long v21 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"getOdometryBatchedLocationsWithReplyBlock\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v8 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.batched_location"];
  if (v8
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    id v9 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLGnssProvider"];
    [v9 registerDelegate:+[CLInternalService getIntersiloDelegate](CLInternalService, "getIntersiloDelegate") inSilo:+[CLInternalService getAsyncResponseSilo](CLInternalService, "getAsyncResponseSilo")];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    _OWORD v13[2] = sub_101A03B1C;
    v13[3] = &unk_10234C8C8;
    uint8_t v13[4] = a3;
    [v9 fetchOdometryBatchedLocationsWithReply:v13];
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v10 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      __int16 v14 = 0;
      id v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService getOdometryBatchedLocationsWithReplyBlock:]", "%s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
    id v11 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id, void))a3 + 2))(a3, v11, 0);
  }
  os_activity_scope_leave(&state);
}

- (void)getPipelinedCacheWithReply:(id)a3
{
  id v60 = objc_alloc_init((Class)NSAutoreleasePool);
  id v5 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemongetPipelinedCache (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v5, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  BOOL v6 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)__int16 v83 = 0;
    *(_WORD *)&v83[4] = 2082;
    *(void *)&v83[6] = "";
    *(_WORD *)&v83[14] = 2082;
    *(void *)&v83[16] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemongetPipelinedCache\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v7 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.pipelined_diagnostic"];
  if (!v7
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || ([v7 BOOLValue] & 1) == 0)
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    unint64_t v16 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      LOWORD(v78) = 0;
      unint64_t v47 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v47);
      if (v47 != (char *)buf) {
        free(v47);
      }
    }
    id v17 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id, NSArray *))a3 + 2))(a3, v17, +[NSArray array]);

    goto LABEL_44;
  }
  id v8 = [@"/var/mobile/Library/Logs/pipelined" stringByAppendingPathComponent:@"/tiles"];
  id v9 = +[NSFileManager defaultManager];
  if (qword_102489770)
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v10 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "getPipelinedCacheWithReply cancelling previous delete due to new request", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      LOWORD(v78) = 0;
      id v48 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v48);
      if (v48 != (char *)buf) {
        free(v48);
      }
    }
    dispatch_block_cancel((dispatch_block_t)qword_102489770);
    _Block_release((const void *)qword_102489770);
    qword_102489770 = 0;
  }
  id v11 = getgrnam("_analyticsusers");
  id v12 = getpwnam("root");
  if (!v11 || !v12)
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    __int16 v18 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "getPipelinedCacheWithReply FAILED to find root uid and _analyticsusers gid", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      LOWORD(v78) = 0;
      int v49 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v49);
      if (v49 != (char *)buf) {
        free(v49);
      }
    }
    id v19 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
    (*((void (**)(id, id, void *))a3 + 2))(a3, v19, &__NSArray0__struct);

    goto LABEL_44;
  }
  uid_t pw_uid = v12->pw_uid;
  gid_t gr_gid = v11->gr_gid;
  if ([(NSFileManager *)v9 fileExistsAtPath:v8 isDirectory:0])
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v13 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "getPipelinedCacheWithReply destination root path exists, deleting directory now...", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      LOWORD(v78) = 0;
      int v50 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v50);
      if (v50 != (char *)buf) {
        free(v50);
      }
    }
    uint64_t v73 = 0;
    if (![(NSFileManager *)v9 removeItemAtPath:v8 error:&v73])
    {
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      long long v21 = qword_102419528;
      if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)__int16 v83 = v8;
        *(_WORD *)&v83[8] = 2112;
        *(void *)&v83[10] = v73;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "getPipelinedCacheWithReply removal of %@ FAILED with error %@", buf, 0x16u);
      }
      if (!sub_10013D1A0(115, 0)) {
        goto LABEL_62;
      }
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      int v78 = 138412546;
      id v79 = v8;
      __int16 v80 = 2112;
      uint64_t v81 = v73;
      std::string v52 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v52);
      if (v52 == (char *)buf) {
        goto LABEL_62;
      }
LABEL_164:
      free(v52);
LABEL_62:
      id v22 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
      (*((void (**)(id, id, void *))a3 + 2))(a3, v22, &__NSArray0__struct);

      goto LABEL_44;
    }
  }
  uint64_t v73 = 0;
  if (![(NSFileManager *)v9 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v73])
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    __int16 v20 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)__int16 v83 = v8;
      *(_WORD *)&v83[8] = 2112;
      *(void *)&v83[10] = v73;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "getPipelinedCacheWithReply FAILED to create destination root path %@ with error %@", buf, 0x16u);
    }
    if (!sub_10013D1A0(115, 0)) {
      goto LABEL_62;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    int v78 = 138412546;
    id v79 = v8;
    __int16 v80 = 2112;
    uint64_t v81 = v73;
    std::string v52 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v52);
    if (v52 == (char *)buf) {
      goto LABEL_62;
    }
    goto LABEL_164;
  }
  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  __int16 v14 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)__int16 v83 = v8;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "getPipelinedCacheWithReply created destination root path %@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    int v78 = 138412290;
    id v79 = v8;
    uint64_t v51 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v51);
    if (v51 != (char *)buf) {
      free(v51);
    }
  }
  if (chown((const char *)[v8 UTF8String], pw_uid, gr_gid)
    || chmod((const char *)[v8 UTF8String], 0x1E8u))
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v15 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)__int16 v83 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "getPipelinedCacheWithReply FAILED to change owner of %@ to TTR accessible", buf, 0xCu);
    }
    if (!sub_10013D1A0(115, 0)) {
      goto LABEL_62;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    int v78 = 138412290;
    id v79 = v8;
    std::string v52 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v52);
    if (v52 == (char *)buf) {
      goto LABEL_62;
    }
    goto LABEL_164;
  }
  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  int v23 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)__int16 v83 = v8;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "getPipelinedCacheWithReply successfully changed owner of %@ to TTR accessible", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    int v78 = 138412290;
    id v79 = v8;
    long long v53 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v53);
    if (v53 != (char *)buf) {
      free(v53);
    }
  }
  uint64_t v55 = self;
  char v56 = (void (**)(id, void, NSArray *))a3;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v70 = 0u;
  long long v69 = 0u;
  id v24 = [&off_102398208 countByEnumeratingWithState:&v69 objects:v77 count:16];
  if (v24)
  {
    uint64_t v57 = *(void *)v70;
    do
    {
      uint64_t v25 = 0;
      id v58 = v24;
      do
      {
        if (*(void *)v70 != v57) {
          objc_enumerationMutation(&off_102398208);
        }
        uint64_t v59 = v25;
        __int16 v26 = *(void **)(*((void *)&v69 + 1) + 8 * v25);
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        __int16 v27 = [(NSFileManager *)v9 subpathsAtPath:v26];
        id v28 = [(NSArray *)v27 countByEnumeratingWithState:&v65 objects:v76 count:16];
        if (v28)
        {
          uint64_t v29 = *(void *)v66;
          do
          {
            char v30 = 0;
            do
            {
              if (*(void *)v66 != v29) {
                objc_enumerationMutation(v27);
              }
              long long v31 = *(void **)(*((void *)&v65 + 1) + 8 * (void)v30);
              id v32 = [v26 stringByAppendingPathComponent:v31];
              id v33 = [v8 stringByAppendingPathComponent:[v31 lastPathComponent]];
              char v64 = 0;
              unsigned int v34 = [(NSFileManager *)v9 fileExistsAtPath:v32 isDirectory:&v64];
              if (v64) {
                unsigned int v35 = 0;
              }
              else {
                unsigned int v35 = v34;
              }
              if (v35 == 1)
              {
                if (sub_1004BB3EC((const char *)[v32 UTF8String], (const char *)objc_msgSend(v33, "UTF8String")))
                {
                  if (qword_102419520 != -1) {
                    dispatch_once(&qword_102419520, &stru_10234CA70);
                  }
                  char v36 = qword_102419528;
                  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(void *)__int16 v83 = v32;
                    *(_WORD *)&v83[8] = 2112;
                    *(void *)&v83[10] = v33;
                    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "getPipelinedCacheWithReply successfully copied %@ to %@", buf, 0x16u);
                  }
                  if (sub_10013D1A0(115, 2))
                  {
                    bzero(buf, 0x65CuLL);
                    if (qword_102419520 != -1) {
                      dispatch_once(&qword_102419520, &stru_10234CA70);
                    }
                    int v78 = 138412546;
                    id v79 = v32;
                    __int16 v80 = 2112;
                    uint64_t v81 = (uint64_t)v33;
                    long long v41 = (char *)_os_log_send_and_compose_impl();
                    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v41);
                    if (v41 != (char *)buf) {
                      free(v41);
                    }
                  }
                  if (chown((const char *)[v33 UTF8String], pw_uid, gr_gid))
                  {
                    if (qword_102419520 != -1) {
                      dispatch_once(&qword_102419520, &stru_10234CA70);
                    }
                    unsigned int v37 = qword_102419528;
                    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(void *)__int16 v83 = v33;
                      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "getPipelinedCacheWithReply FAILED to change owner of %@ to TTR accessible", buf, 0xCu);
                    }
                    if (sub_10013D1A0(115, 0))
                    {
                      bzero(buf, 0x65CuLL);
                      if (qword_102419520 != -1) {
                        dispatch_once(&qword_102419520, &stru_10234CA70);
                      }
                      int v78 = 138412290;
                      id v79 = v33;
                      char v38 = (char *)_os_log_send_and_compose_impl();
                      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v38);
LABEL_119:
                      if (v38 != (char *)buf) {
                        free(v38);
                      }
                    }
                  }
                  else
                  {
                    if (qword_102419520 != -1) {
                      dispatch_once(&qword_102419520, &stru_10234CA70);
                    }
                    char v40 = qword_102419528;
                    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(void *)__int16 v83 = v33;
                      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "getPipelinedCacheWithReply successfully changed owner of %@ to TTR accessible", buf, 0xCu);
                    }
                    if (sub_10013D1A0(115, 2))
                    {
                      bzero(buf, 0x65CuLL);
                      if (qword_102419520 != -1) {
                        dispatch_once(&qword_102419520, &stru_10234CA70);
                      }
                      int v78 = 138412290;
                      id v79 = v33;
                      char v38 = (char *)_os_log_send_and_compose_impl();
                      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v38);
                      goto LABEL_119;
                    }
                  }
                }
                else
                {
                  if (qword_102419520 != -1) {
                    dispatch_once(&qword_102419520, &stru_10234CA70);
                  }
                  uint64_t v39 = qword_102419528;
                  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(void *)__int16 v83 = v32;
                    *(_WORD *)&v83[8] = 2112;
                    *(void *)&v83[10] = v33;
                    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "getPipelinedCacheWithReply FAILED to copy %@ to %@. Check PROTECTION CLASS of the file and device protection state.", buf, 0x16u);
                  }
                  if (sub_10013D1A0(115, 0))
                  {
                    bzero(buf, 0x65CuLL);
                    if (qword_102419520 != -1) {
                      dispatch_once(&qword_102419520, &stru_10234CA70);
                    }
                    int v78 = 138412546;
                    id v79 = v32;
                    __int16 v80 = 2112;
                    uint64_t v81 = (uint64_t)v33;
                    char v38 = (char *)_os_log_send_and_compose_impl();
                    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v38);
                    goto LABEL_119;
                  }
                }
              }
              char v30 = (char *)v30 + 1;
            }
            while (v28 != v30);
            id v42 = [(NSArray *)v27 countByEnumeratingWithState:&v65 objects:v76 count:16];
            id v28 = v42;
          }
          while (v42);
        }
        uint64_t v25 = v59 + 1;
      }
      while ((id)(v59 + 1) != v58);
      id v24 = [&off_102398208 countByEnumeratingWithState:&v69 objects:v77 count:16];
    }
    while (v24);
  }
  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  long long v43 = v56;
  char v44 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)__int16 v83 = v8;
    *(_WORD *)&v83[8] = 2048;
    *(void *)&v83[10] = 3600;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "getPipelinedCacheWithReply deleting %@ in %llu seconds", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    int v78 = 138412546;
    id v79 = v8;
    __int16 v80 = 2048;
    uint64_t v81 = 3600;
    uint64_t v54 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService getPipelinedCacheWithReply:]", "%s\n", v54);
    if (v54 != (char *)buf) {
      free(v54);
    }
    long long v43 = v56;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_101A05700;
  block[3] = &unk_10229FEB0;
  block[4] = v9;
  block[5] = v8;
  qword_102489770 = (uint64_t)dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_time_t v45 = dispatch_time(0, 3600000000000);
  char v46 = [[-[CLInternalService silo](v55, "silo") queue];
  dispatch_after(v45, v46, (dispatch_block_t)qword_102489770);
  id v75 = v8;
  v43[2](v43, 0, +[NSArray arrayWithObjects:&v75 count:1]);
LABEL_44:
  os_activity_scope_leave(&state);
}

- (void)setTemporaryAuthorizationGranted:(BOOL)a3 forBundleID:(id)a4 orBundlePath:(id)a5 orAuditToken:(id *)a6 byLocationButton:(BOOL)a7 voiceInteractionEnabled:(BOOL)a8 replyBlock:(id)a9
{
  BOOL v32 = a8;
  BOOL v33 = a7;
  BOOL v31 = a3;
  id v13 = objc_alloc_init((Class)NSAutoreleasePool);
  __int16 v14 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonSetAuthorizationStatusByType (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v14, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v15 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonSetAuthorizationStatusByType\", \"event\":%{public, location:escape_only}s}", (uint8_t *)buf, 0x1Cu);
  }
  id v16 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.authorizeapplications"];
  if (v16)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v16 BOOLValue])
    {
      if (![a4 length] && !objc_msgSend(a5, "length") && !v33)
      {
        if (qword_102419520 != -1) {
          dispatch_once(&qword_102419520, &stru_10234CA70);
        }
        long long v21 = qword_102419528;
        if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_FAULT))
        {
          LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "#Spi, Must provide a bundle identifier or bundle path if setting temporary authorization not by LocationButton", (uint8_t *)buf, 2u);
        }
        if (sub_10013D1A0(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419520 != -1) {
            dispatch_once(&qword_102419520, &stru_10234CA70);
          }
          LOWORD(v38.__r_.__value_.__l.__data_) = 0;
          char v30 = (std::string *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 0, "-[CLInternalService setTemporaryAuthorizationGranted:forBundleID:orBundlePath:orAuditToken:byLocationButton:voiceInteractionEnabled:replyBlock:]", "%s\n", (const char *)v30);
          if (v30 != buf) {
            free(v30);
          }
        }
        id v22 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
        (*((void (**)(id, id))a9 + 2))(a9, v22);

        goto LABEL_46;
      }
      memset(v57, 0, 35);
      *(_OWORD *)char v56 = 0u;
      memset(buf, 0, sizeof(buf));
      long long v58 = 0u;
      memset(v59, 0, 59);
      if ([a4 length])
      {
        sub_100134750(&__str, (char *)[a4 UTF8String]);
        sub_1000B7144(&__str, (uint64_t)&v38);
        if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
          operator delete(buf[0].__r_.__value_.__l.__data_);
        }
        buf[0] = v38;
        *((unsigned char *)&v38.__r_.__value_.__s + 23) = 0;
        v38.__r_.__value_.__s.__data_[0] = 0;
        if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0) {
          operator delete(buf[1].__r_.__value_.__l.__data_);
        }
        buf[1] = v39;
        *((unsigned char *)&v39.__r_.__value_.__s + 23) = 0;
        v39.__r_.__value_.__s.__data_[0] = 0;
        if (SHIBYTE(v57[0]) < 0) {
          operator delete(v56[0]);
        }
        *(_OWORD *)char v56 = v40;
        v57[0] = v41;
        HIBYTE(v41) = 0;
        LOBYTE(v40) = 0;
        if (SHIBYTE(v57[3]) < 0) {
          operator delete(v57[1]);
        }
        *(_OWORD *)&v57[1] = v42;
        v57[3] = v43;
        HIBYTE(v43) = 0;
        LOBYTE(v42) = 0;
        LOWORD(v57[4]) = v44;
        BYTE2(v57[4]) = v45;
        if (SBYTE7(v59[0]) < 0) {
          operator delete((void *)v58);
        }
        long long v58 = v46;
        *(void *)&v59[0] = v47;
        HIBYTE(v47) = 0;
        LOBYTE(v46) = 0;
        if (SHIBYTE(v59[1]) < 0) {
          operator delete(*((void **)&v59[0] + 1));
        }
        char v18 = 0;
        *(_OWORD *)((char *)v59 + 8) = v48;
        *((void *)&v59[1] + 1) = v49;
        HIBYTE(v49) = 0;
        LOBYTE(v48) = 0;
        if (SBYTE7(v59[3]) < 0)
        {
          operator delete(*(void **)&v59[2]);
          char v18 = HIBYTE(v49);
        }
        v59[2] = v50;
        *(void *)&v59[3] = v51;
        HIBYTE(v51) = 0;
        LOBYTE(v50) = 0;
        WORD4(v59[3]) = v52;
        BYTE10(v59[3]) = v53;
        if (v18 < 0) {
          operator delete((void *)v48);
        }
        if (SHIBYTE(v47) < 0) {
          operator delete((void *)v46);
        }
        if (SHIBYTE(v43) < 0) {
          operator delete((void *)v42);
        }
        if (SHIBYTE(v41) < 0) {
          operator delete((void *)v40);
        }
        if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v39.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v38.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__str.__r_.__value_.__l.__data_);
        }
        if (self) {
          [(CLInternalService *)self currentToken];
        }
        else {
          memset(v36, 0, sizeof(v36));
        }
        CLConnection::getUserNameFromAuditToken((uint64_t *)&v38, (CLConnection *)v36, v17);
        sub_1001A5B7C(buf, &v38);
      }
      else
      {
        if (![a5 length])
        {
          sub_10001BEC0(a6, (uint64_t)&v38);
          sub_1000B6DC8((uint64_t)buf, (long long *)&v38);
          sub_1000064D0((uint64_t)&v38);
LABEL_93:
          id v25 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLClientManager"];
          sub_1000A7FBC((uint64_t)buf, (uint64_t)&v38);
          if ((v38.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            __int16 v26 = &v38;
          }
          else {
            __int16 v26 = (std::string *)v38.__r_.__value_.__r.__words[0];
          }
          __int16 v27 = +[NSString stringWithUTF8String:v26];
          long long v28 = *(_OWORD *)&a6->var0[4];
          v34[0] = *(_OWORD *)a6->var0;
          v34[1] = v28;
          [v25 markClientTemporaryAuthorizationGranted:v31 forClientKey:v27 andAuditToken:v34 byLocationButton:v33 voiceInteractionEnabled:v32];
          if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v38.__r_.__value_.__l.__data_);
          }
          (*((void (**)(id, void))a9 + 2))(a9, 0);
          if (SBYTE7(v59[3]) < 0) {
            operator delete(*(void **)&v59[2]);
          }
          if (SHIBYTE(v59[1]) < 0) {
            operator delete(*((void **)&v59[0] + 1));
          }
          if (SBYTE7(v59[0]) < 0) {
            operator delete((void *)v58);
          }
          if (SHIBYTE(v57[3]) < 0) {
            operator delete(v57[1]);
          }
          if (SHIBYTE(v57[0]) < 0) {
            operator delete(v56[0]);
          }
          if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0) {
            operator delete(buf[1].__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
            operator delete(buf[0].__r_.__value_.__l.__data_);
          }
          goto LABEL_46;
        }
        sub_100134750(&__str, (char *)[a5 UTF8String]);
        sub_1000B6F5C(&__str, (uint64_t)&v38);
        if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
          operator delete(buf[0].__r_.__value_.__l.__data_);
        }
        buf[0] = v38;
        *((unsigned char *)&v38.__r_.__value_.__s + 23) = 0;
        v38.__r_.__value_.__s.__data_[0] = 0;
        if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0) {
          operator delete(buf[1].__r_.__value_.__l.__data_);
        }
        buf[1] = v39;
        *((unsigned char *)&v39.__r_.__value_.__s + 23) = 0;
        v39.__r_.__value_.__s.__data_[0] = 0;
        if (SHIBYTE(v57[0]) < 0) {
          operator delete(v56[0]);
        }
        *(_OWORD *)char v56 = v40;
        v57[0] = v41;
        HIBYTE(v41) = 0;
        LOBYTE(v40) = 0;
        if (SHIBYTE(v57[3]) < 0) {
          operator delete(v57[1]);
        }
        *(_OWORD *)&v57[1] = v42;
        v57[3] = v43;
        HIBYTE(v43) = 0;
        LOBYTE(v42) = 0;
        LOWORD(v57[4]) = v44;
        BYTE2(v57[4]) = v45;
        if (SBYTE7(v59[0]) < 0) {
          operator delete((void *)v58);
        }
        long long v58 = v46;
        *(void *)&v59[0] = v47;
        HIBYTE(v47) = 0;
        LOBYTE(v46) = 0;
        if (SHIBYTE(v59[1]) < 0) {
          operator delete(*((void **)&v59[0] + 1));
        }
        char v24 = 0;
        *(_OWORD *)((char *)v59 + 8) = v48;
        *((void *)&v59[1] + 1) = v49;
        HIBYTE(v49) = 0;
        LOBYTE(v48) = 0;
        if (SBYTE7(v59[3]) < 0)
        {
          operator delete(*(void **)&v59[2]);
          char v24 = HIBYTE(v49);
        }
        v59[2] = v50;
        *(void *)&v59[3] = v51;
        HIBYTE(v51) = 0;
        LOBYTE(v50) = 0;
        WORD4(v59[3]) = v52;
        BYTE10(v59[3]) = v53;
        if (v24 < 0) {
          operator delete((void *)v48);
        }
        if (SHIBYTE(v47) < 0) {
          operator delete((void *)v46);
        }
        if (SHIBYTE(v43) < 0) {
          operator delete((void *)v42);
        }
        if (SHIBYTE(v41) < 0) {
          operator delete((void *)v40);
        }
        if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v39.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v38.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__str.__r_.__value_.__l.__data_);
        }
        if (self) {
          [(CLInternalService *)self currentToken];
        }
        else {
          memset(v35, 0, sizeof(v35));
        }
        CLConnection::getUserNameFromAuditToken((uint64_t *)&v38, (CLConnection *)v35, v23);
        sub_1001A5B7C(buf, &v38);
      }
      if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v38.__r_.__value_.__l.__data_);
      }
      goto LABEL_93;
    }
  }
  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v19 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", (uint8_t *)buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    LOWORD(v38.__r_.__value_.__l.__data_) = 0;
    uint64_t v29 = (std::string *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService setTemporaryAuthorizationGranted:forBundleID:orBundlePath:orAuditToken:byLocationButton:voiceInteractionEnabled:replyBlock:]", "%s\n", (const char *)v29);
    if (v29 != buf) {
      free(v29);
    }
  }
  id v20 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
  (*((void (**)(id, id))a9 + 2))(a9, v20);

LABEL_46:
  os_activity_scope_leave(&state);
}

- (void)setTemporaryPreciseAuthorizationGranted:(BOOL)a3 forBundleID:(id)a4 orBundlePath:(id)a5 replyBlock:(id)a6
{
  BOOL v9 = a3;
  id v11 = objc_alloc_init((Class)NSAutoreleasePool);
  id v12 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonSetTemporaryPreciseAuthorization (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v12, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v13 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonSetTemporaryPreciseAuthorization\", \"event\":%{public, location:escape_only}s}", (uint8_t *)buf, 0x1Cu);
  }
  id v14 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.authorizeapplications"];
  if (v14
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v14 BOOLValue] & 1) != 0)
  {
    if ([a4 length] || objc_msgSend(a5, "length"))
    {
      memset(v46, 0, 35);
      *(_OWORD *)char v45 = 0u;
      memset(buf, 0, sizeof(buf));
      long long v47 = 0u;
      memset(v48, 0, 59);
      if ([a4 length])
      {
        sub_100134750(&__str, (char *)[a4 UTF8String]);
        sub_1000B7144(&__str, (uint64_t)&v27);
      }
      else
      {
        if (![a5 length])
        {
LABEL_49:
          if (self) {
            [(CLInternalService *)self currentToken];
          }
          else {
            memset(v25, 0, sizeof(v25));
          }
          CLConnection::getUserNameFromAuditToken((uint64_t *)&v27, (CLConnection *)v25, v15);
          sub_1001A5B7C(buf, &v27);
          if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v27.__r_.__value_.__l.__data_);
          }
          id v19 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLClientManager"];
          sub_1000A7FBC((uint64_t)buf, (uint64_t)&v27);
          if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            id v20 = &v27;
          }
          else {
            id v20 = (std::string *)v27.__r_.__value_.__r.__words[0];
          }
          [v19 markTemporaryPreciseAuthorizationGranted:v9 forClientKey:[NSString stringWithUTF8String:v20]];
          if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v27.__r_.__value_.__l.__data_);
          }
          (*((void (**)(id, void))a6 + 2))(a6, 0);
          if (SBYTE7(v48[3]) < 0) {
            operator delete(*(void **)&v48[2]);
          }
          if (SHIBYTE(v48[1]) < 0) {
            operator delete(*((void **)&v48[0] + 1));
          }
          if (SBYTE7(v48[0]) < 0) {
            operator delete((void *)v47);
          }
          if (SHIBYTE(v46[3]) < 0) {
            operator delete(v46[1]);
          }
          if (SHIBYTE(v46[0]) < 0) {
            operator delete(v45[0]);
          }
          if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0) {
            operator delete(buf[1].__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
            operator delete(buf[0].__r_.__value_.__l.__data_);
          }
          goto LABEL_18;
        }
        sub_100134750(&__str, (char *)[a5 UTF8String]);
        sub_1000B6F5C(&__str, (uint64_t)&v27);
      }
      if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf[0].__r_.__value_.__l.__data_);
      }
      buf[0] = v27;
      *((unsigned char *)&v27.__r_.__value_.__s + 23) = 0;
      v27.__r_.__value_.__s.__data_[0] = 0;
      if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf[1].__r_.__value_.__l.__data_);
      }
      buf[1] = v28;
      *((unsigned char *)&v28.__r_.__value_.__s + 23) = 0;
      v28.__r_.__value_.__s.__data_[0] = 0;
      if (SHIBYTE(v46[0]) < 0) {
        operator delete(v45[0]);
      }
      *(_OWORD *)char v45 = v29;
      v46[0] = v30;
      HIBYTE(v30) = 0;
      LOBYTE(v29) = 0;
      if (SHIBYTE(v46[3]) < 0) {
        operator delete(v46[1]);
      }
      *(_OWORD *)&v46[1] = v31;
      v46[3] = v32;
      HIBYTE(v32) = 0;
      LOBYTE(v31) = 0;
      LOWORD(v46[4]) = v33;
      BYTE2(v46[4]) = v34;
      if (SBYTE7(v48[0]) < 0) {
        operator delete((void *)v47);
      }
      long long v47 = v35;
      *(void *)&v48[0] = v36;
      HIBYTE(v36) = 0;
      LOBYTE(v35) = 0;
      if (SHIBYTE(v48[1]) < 0) {
        operator delete(*((void **)&v48[0] + 1));
      }
      char v18 = 0;
      *(_OWORD *)((char *)v48 + 8) = v37;
      *((void *)&v48[1] + 1) = v38;
      HIBYTE(v38) = 0;
      LOBYTE(v37) = 0;
      if (SBYTE7(v48[3]) < 0)
      {
        operator delete(*(void **)&v48[2]);
        char v18 = HIBYTE(v38);
      }
      v48[2] = v39;
      *(void *)&v48[3] = v40;
      HIBYTE(v40) = 0;
      LOBYTE(v39) = 0;
      WORD4(v48[3]) = v41;
      BYTE10(v48[3]) = v42;
      if (v18 < 0) {
        operator delete((void *)v37);
      }
      if (SHIBYTE(v36) < 0) {
        operator delete((void *)v35);
      }
      if (SHIBYTE(v32) < 0) {
        operator delete((void *)v31);
      }
      if (SHIBYTE(v30) < 0) {
        operator delete((void *)v29);
      }
      if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v28.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v27.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__str.__r_.__value_.__l.__data_);
      }
      goto LABEL_49;
    }
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    long long v21 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "#Spi, Must provide a bundle identifier or bundle path if setting temporary precise authorization", (uint8_t *)buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      LOWORD(v27.__r_.__value_.__l.__data_) = 0;
      char v24 = (std::string *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLInternalService setTemporaryPreciseAuthorizationGranted:forBundleID:orBundlePath:replyBlock:]", "%s\n", (const char *)v24);
      if (v24 != buf) {
        free(v24);
      }
    }
    id v22 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
    (*((void (**)(id, id))a6 + 2))(a6, v22);
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v16 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", (uint8_t *)buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      LOWORD(v27.__r_.__value_.__l.__data_) = 0;
      int v23 = (std::string *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService setTemporaryPreciseAuthorizationGranted:forBundleID:orBundlePath:replyBlock:]", "%s\n", (const char *)v23);
      if (v23 != buf) {
        free(v23);
      }
    }
    id v17 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id))a6 + 2))(a6, v17);
  }
LABEL_18:
  os_activity_scope_leave(&state);
}

- (void)tearDownLocationAuthPromptForBundleID:(id)a3 orBundlePath:(id)a4 replyBlock:(id)a5
{
  id v9 = objc_alloc_init((Class)NSAutoreleasePool);
  id v10 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonTearDownLocationAuthPrompt (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v10, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v11 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonTearDownLocationAuthPrompt\", \"event\":%{public, location:escape_only}s}", (uint8_t *)buf, 0x1Cu);
  }
  id v12 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.authorizeapplications"];
  if (v12
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v12 BOOLValue] & 1) != 0)
  {
    if ([a3 length] || objc_msgSend(a4, "length"))
    {
      memset(v44, 0, 35);
      *(_OWORD *)long long v43 = 0u;
      memset(buf, 0, sizeof(buf));
      long long v45 = 0u;
      memset(v46, 0, 59);
      if ([a3 length])
      {
        sub_100134750(&__str, (char *)[a3 UTF8String]);
        sub_1000B7144(&__str, (uint64_t)&v25);
      }
      else
      {
        if (![a4 length])
        {
LABEL_49:
          if (self) {
            [(CLInternalService *)self currentToken];
          }
          else {
            memset(v23, 0, sizeof(v23));
          }
          CLConnection::getUserNameFromAuditToken((uint64_t *)&v25, (CLConnection *)v23, v13);
          sub_1001A5B7C(buf, &v25);
          if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v25.__r_.__value_.__l.__data_);
          }
          id v17 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLClientManager"];
          sub_1000A7FBC((uint64_t)buf, (uint64_t)&v25);
          if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            char v18 = &v25;
          }
          else {
            char v18 = (std::string *)v25.__r_.__value_.__r.__words[0];
          }
          [v17 tearDownLocationAuthPrompt:[+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v18)]];
          if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v25.__r_.__value_.__l.__data_);
          }
          (*((void (**)(id, void))a5 + 2))(a5, 0);
          if (SBYTE7(v46[3]) < 0) {
            operator delete(*(void **)&v46[2]);
          }
          if (SHIBYTE(v46[1]) < 0) {
            operator delete(*((void **)&v46[0] + 1));
          }
          if (SBYTE7(v46[0]) < 0) {
            operator delete((void *)v45);
          }
          if (SHIBYTE(v44[3]) < 0) {
            operator delete(v44[1]);
          }
          if (SHIBYTE(v44[0]) < 0) {
            operator delete(v43[0]);
          }
          if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0) {
            operator delete(buf[1].__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
            operator delete(buf[0].__r_.__value_.__l.__data_);
          }
          goto LABEL_18;
        }
        sub_100134750(&__str, (char *)[a4 UTF8String]);
        sub_1000B6F5C(&__str, (uint64_t)&v25);
      }
      if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf[0].__r_.__value_.__l.__data_);
      }
      buf[0] = v25;
      *((unsigned char *)&v25.__r_.__value_.__s + 23) = 0;
      v25.__r_.__value_.__s.__data_[0] = 0;
      if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf[1].__r_.__value_.__l.__data_);
      }
      buf[1] = v26;
      *((unsigned char *)&v26.__r_.__value_.__s + 23) = 0;
      v26.__r_.__value_.__s.__data_[0] = 0;
      if (SHIBYTE(v44[0]) < 0) {
        operator delete(v43[0]);
      }
      *(_OWORD *)long long v43 = v27;
      v44[0] = v28;
      HIBYTE(v28) = 0;
      LOBYTE(v27) = 0;
      if (SHIBYTE(v44[3]) < 0) {
        operator delete(v44[1]);
      }
      *(_OWORD *)&v44[1] = v29;
      v44[3] = v30;
      HIBYTE(v30) = 0;
      LOBYTE(v29) = 0;
      LOWORD(v44[4]) = v31;
      BYTE2(v44[4]) = v32;
      if (SBYTE7(v46[0]) < 0) {
        operator delete((void *)v45);
      }
      long long v45 = v33;
      *(void *)&v46[0] = v34;
      HIBYTE(v34) = 0;
      LOBYTE(v33) = 0;
      if (SHIBYTE(v46[1]) < 0) {
        operator delete(*((void **)&v46[0] + 1));
      }
      char v16 = 0;
      *(_OWORD *)((char *)v46 + 8) = v35;
      *((void *)&v46[1] + 1) = v36;
      HIBYTE(v36) = 0;
      LOBYTE(v35) = 0;
      if (SBYTE7(v46[3]) < 0)
      {
        operator delete(*(void **)&v46[2]);
        char v16 = HIBYTE(v36);
      }
      v46[2] = v37;
      *(void *)&v46[3] = v38;
      HIBYTE(v38) = 0;
      LOBYTE(v37) = 0;
      WORD4(v46[3]) = v39;
      BYTE10(v46[3]) = v40;
      if (v16 < 0) {
        operator delete((void *)v35);
      }
      if (SHIBYTE(v34) < 0) {
        operator delete((void *)v33);
      }
      if (SHIBYTE(v30) < 0) {
        operator delete((void *)v29);
      }
      if (SHIBYTE(v28) < 0) {
        operator delete((void *)v27);
      }
      if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v26.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v25.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__str.__r_.__value_.__l.__data_);
      }
      goto LABEL_49;
    }
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v19 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "#Spi, Must provide a bundle identifier or bundle path if tearing down location auth prompt", (uint8_t *)buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      LOWORD(v25.__r_.__value_.__l.__data_) = 0;
      id v22 = (std::string *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLInternalService tearDownLocationAuthPromptForBundleID:orBundlePath:replyBlock:]", "%s\n", (const char *)v22);
      if (v22 != buf) {
        free(v22);
      }
    }
    id v20 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
    (*((void (**)(id, id))a5 + 2))(a5, v20);
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v14 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", (uint8_t *)buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      LOWORD(v25.__r_.__value_.__l.__data_) = 0;
      long long v21 = (std::string *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService tearDownLocationAuthPromptForBundleID:orBundlePath:replyBlock:]", "%s\n", (const char *)v21);
      if (v21 != buf) {
        free(v21);
      }
    }
    id v15 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id))a5 + 2))(a5, v15);
  }
LABEL_18:
  os_activity_scope_leave(&state);
}

- (void)getGyroCalibrationDatabaseBiasFitAtTemperature:(float)a3 withReply:(id)a4
{
  BOOL v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGyroCalibrationDatabaseGetBiasFitAtTemperature (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v7 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v11 = 0;
    __int16 v12 = 2082;
    id v13 = "";
    __int16 v14 = 2082;
    id v15 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGyroCalibrationDatabaseGetBiasFitAtTemperature\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_101A078D4;
  v8[3] = &unk_10234C990;
  v8[4] = a4;
  [objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:forClient:", @"CLGyroCalibrationDatabase", @"CLInternalService") getBiasFitWithReply:v8];
  os_activity_scope_leave(&state);
}

- (void)getActivitiesWithReplyBlock:(id)a3
{
  id v4 = objc_alloc_init((Class)NSAutoreleasePool);
  id v5 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetActivities (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v5, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  BOOL v6 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v18 = 0;
    __int16 v19 = 2082;
    id v20 = "";
    __int16 v21 = 2082;
    id v22 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetActivities\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v7 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.status"];
  if (v7
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v7 BOOLValue] & 1) != 0)
  {
    uint64_t v8 = sub_10137AE78();
    if (v8)
    {
      id v9 = sub_10137BB88(v8);
      (*((void (**)(id, void, id))a3 + 2))(a3, 0, v9);
    }
    else
    {
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      __int16 v12 = qword_102419528;
      if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#Spi, #warning _CLDaemonGetActivityAlarms called without support for activity alarms", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419520 != -1) {
          dispatch_once(&qword_102419520, &stru_10234CA70);
        }
        id v15 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService getActivitiesWithReplyBlock:]", "%s\n", v15);
        if (v15 != (char *)buf) {
          free(v15);
        }
      }
      id v13 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
      (*((void (**)(id, id, void))a3 + 2))(a3, v13, 0);
    }
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v10 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      __int16 v14 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService getActivitiesWithReplyBlock:]", "%s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
    }
    id v11 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id, void))a3 + 2))(a3, v11, 0);
  }
  os_activity_scope_leave(&state);
}

- (void)setAuthorizationStatusByType:(int)a3 withCorrectiveCompensation:(int)a4 andZoneIdentifier:(id)a5 andSubIdentityIdentifier:(id)a6 forBundleID:(id)a7 orBundlePath:(id)a8 replyBlock:(id)a9
{
  uint64_t v12 = *(void *)&a4;
  uint64_t v13 = *(void *)&a3;
  id v35 = objc_alloc_init((Class)NSAutoreleasePool);
  id v15 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonSetAuthorizationStatusByType (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v15, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  char v16 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonSetAuthorizationStatusByType\", \"event\":%{public, location:escape_only}s}", (uint8_t *)buf, 0x1Cu);
  }
  id v17 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.authorizeapplications"];
  if (v17)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v17 BOOLValue])
    {
      if ([a7 length] || objc_msgSend(a8, "length"))
      {
        if (v13 > 4 || v13 == 1)
        {
          if (qword_102419520 != -1) {
            dispatch_once(&qword_102419520, &stru_10234CA70);
          }
          std::string v25 = qword_102419528;
          if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_FAULT))
          {
            buf[0].__r_.__value_.__r.__words[0] = 68289282;
            LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
            *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
            WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2050;
            *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = 2;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#Spi, Invalid authorization\", \"auth\":%{public, location:CLClientAuthorizationStatus}lld}", (uint8_t *)buf, 0x1Cu);
            if (qword_102419520 != -1) {
              dispatch_once(&qword_102419520, &stru_10234CA70);
            }
          }
          std::string v26 = qword_102419528;
          if (os_signpost_enabled((os_log_t)qword_102419528))
          {
            buf[0].__r_.__value_.__r.__words[0] = 68289282;
            LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
            *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
            WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2050;
            *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = 2;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#Spi, Invalid authorization", "{\"msg%{public}.0s\":\"#Spi, Invalid authorization\", \"auth\":%{public, location:CLClientAuthorizationStatus}lld}", (uint8_t *)buf, 0x1Cu);
          }
        }
        else
        {
          if (v12 < 3)
          {
            memset(v72, 0, 35);
            *(_OWORD *)long long v71 = 0u;
            memset(buf, 0, sizeof(buf));
            long long v73 = 0u;
            memset(v74, 0, 59);
            if ([a7 length])
            {
              sub_100134750(__str, (char *)[a7 UTF8String]);
              sub_1000B7144((std::string *)__str, (uint64_t)&v53);
              if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
                operator delete(buf[0].__r_.__value_.__l.__data_);
              }
              buf[0] = v53;
              *((unsigned char *)&v53.__r_.__value_.__s + 23) = 0;
              v53.__r_.__value_.__s.__data_[0] = 0;
              if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0) {
                operator delete(buf[1].__r_.__value_.__l.__data_);
              }
              buf[1] = v54;
              *((unsigned char *)&v54.__r_.__value_.__s + 23) = 0;
              v54.__r_.__value_.__s.__data_[0] = 0;
              if (SHIBYTE(v72[0]) < 0) {
                operator delete(v71[0]);
              }
              *(_OWORD *)long long v71 = v55;
              v72[0] = v56;
              HIBYTE(v56) = 0;
              LOBYTE(v55) = 0;
              if (SHIBYTE(v72[3]) < 0) {
                operator delete(v72[1]);
              }
              *(_OWORD *)&v72[1] = v57;
              v72[3] = v58;
              HIBYTE(v58) = 0;
              LOBYTE(v57) = 0;
              LOWORD(v72[4]) = v59;
              BYTE2(v72[4]) = v60;
              if (SBYTE7(v74[0]) < 0) {
                operator delete((void *)v73);
              }
              long long v73 = v61;
              *(void *)&v74[0] = v62;
              HIBYTE(v62) = 0;
              LOBYTE(v61) = 0;
              if (SHIBYTE(v74[1]) < 0) {
                operator delete(*((void **)&v74[0] + 1));
              }
              char v19 = 0;
              *(_OWORD *)((char *)v74 + 8) = v63;
              *((void *)&v74[1] + 1) = v64;
              HIBYTE(v64) = 0;
              LOBYTE(v63) = 0;
              if (SBYTE7(v74[3]) < 0)
              {
                operator delete(*(void **)&v74[2]);
                char v19 = HIBYTE(v64);
              }
              v74[2] = v65;
              *(void *)&v74[3] = v66;
              HIBYTE(v66) = 0;
              LOBYTE(v65) = 0;
              WORD4(v74[3]) = v67;
              BYTE10(v74[3]) = v68;
              if (v19 < 0) {
                operator delete((void *)v63);
              }
              if (SHIBYTE(v62) < 0) {
                operator delete((void *)v61);
              }
              if (SHIBYTE(v58) < 0) {
                operator delete((void *)v57);
              }
              if (SHIBYTE(v56) < 0) {
                operator delete((void *)v55);
              }
              if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v54.__r_.__value_.__l.__data_);
              }
              if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v53.__r_.__value_.__l.__data_);
              }
            }
            else
            {
              if (![a8 length])
              {
LABEL_73:
                if (self) {
                  [(CLInternalService *)self currentToken];
                }
                else {
                  memset(v52, 0, sizeof(v52));
                }
                CLConnection::getUserNameFromAuditToken((uint64_t *)&v53, (CLConnection *)v52, v18);
                sub_1001A5B7C(buf, &v53);
                if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v53.__r_.__value_.__l.__data_);
                }
                id v28 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLClientManager"];
                sub_100089AE0((char *)__dst, (long long *)buf);
                id v29 = sub_1000376D4((long long *)__dst);
                if (self) {
                  [(CLInternalService *)self currentToken];
                }
                else {
                  memset(__str, 0, sizeof(__str));
                }
                sub_10001BEC0(__str, (uint64_t)&v53);
                double v30 = sub_1000372B8((uint64_t)&v53, &v37);
                if ((v37.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  __int16 v31 = &v37;
                }
                else {
                  __int16 v31 = (std::string *)v37.__r_.__value_.__r.__words[0];
                }
                [v28 setClientAuthorization:v29 zoneIdentifier:a5 subIdentityIdentifier:a6 status:v13 correctiveCompensation:v12 mayIncreaseAuth:1 entity:[NSString stringWithUTF8String:v31]];
                if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v37.__r_.__value_.__l.__data_);
                }
                if (SHIBYTE(v66) < 0) {
                  operator delete((void *)v65);
                }
                if (SHIBYTE(v64) < 0) {
                  operator delete((void *)v63);
                }
                if (SHIBYTE(v62) < 0) {
                  operator delete((void *)v61);
                }
                if (SHIBYTE(v58) < 0) {
                  operator delete((void *)v57);
                }
                if (SHIBYTE(v56) < 0) {
                  operator delete((void *)v55);
                }
                if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v54.__r_.__value_.__l.__data_);
                }
                if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v53.__r_.__value_.__l.__data_);
                }
                if (v51 < 0) {
                  operator delete(v50);
                }
                if (v49 < 0) {
                  operator delete(v48);
                }
                if (v47 < 0) {
                  operator delete(v46);
                }
                if (v45 < 0) {
                  operator delete(v44);
                }
                if (v43 < 0) {
                  operator delete(v42);
                }
                if (v41 < 0) {
                  operator delete(v40);
                }
                if (v39 < 0) {
                  operator delete(__dst[0]);
                }
                (*((void (**)(id, void))a9 + 2))(a9, 0);
                if (SBYTE7(v74[3]) < 0) {
                  operator delete(*(void **)&v74[2]);
                }
                if (SHIBYTE(v74[1]) < 0) {
                  operator delete(*((void **)&v74[0] + 1));
                }
                if (SBYTE7(v74[0]) < 0) {
                  operator delete((void *)v73);
                }
                if (SHIBYTE(v72[3]) < 0) {
                  operator delete(v72[1]);
                }
                if (SHIBYTE(v72[0]) < 0) {
                  operator delete(v71[0]);
                }
                if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(buf[1].__r_.__value_.__l.__data_);
                }
                if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(buf[0].__r_.__value_.__l.__data_);
                }
                goto LABEL_46;
              }
              sub_100134750(__str, (char *)[a8 UTF8String]);
              sub_1000B6F5C((std::string *)__str, (uint64_t)&v53);
              sub_1000B6DC8((uint64_t)buf, (long long *)&v53);
              sub_1000064D0((uint64_t)&v53);
            }
            if ((__str[23] & 0x80000000) != 0) {
              operator delete(*(void **)__str);
            }
            goto LABEL_73;
          }
          if (qword_102419520 != -1) {
            dispatch_once(&qword_102419520, &stru_10234CA70);
          }
          id v22 = qword_102419528;
          if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_FAULT))
          {
            buf[0].__r_.__value_.__r.__words[0] = 68289282;
            LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
            *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
            WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2050;
            *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = 0;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#Spi, Invalid corrective compensation state\", \"compensate\":%{public, location:CLClientCorrectiveCompensation}lld}", (uint8_t *)buf, 0x1Cu);
            if (qword_102419520 != -1) {
              dispatch_once(&qword_102419520, &stru_10234CA70);
            }
          }
          int v23 = qword_102419528;
          if (os_signpost_enabled((os_log_t)qword_102419528))
          {
            buf[0].__r_.__value_.__r.__words[0] = 68289282;
            LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
            *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
            WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2050;
            *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#Spi, Invalid corrective compensation state", "{\"msg%{public}.0s\":\"#Spi, Invalid corrective compensation state\", \"compensate\":%{public, location:CLClientCorrectiveCompensation}lld}", (uint8_t *)buf, 0x1Cu);
          }
        }
      }
      else
      {
        if (qword_102419520 != -1) {
          dispatch_once(&qword_102419520, &stru_10234CA70);
        }
        long long v27 = qword_102419528;
        if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_FAULT))
        {
          LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "#Spi, Must provide a bundle identifier or bundle path for which to set location authorization status", (uint8_t *)buf, 2u);
        }
        if (sub_10013D1A0(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419520 != -1) {
            dispatch_once(&qword_102419520, &stru_10234CA70);
          }
          LOWORD(v53.__r_.__value_.__l.__data_) = 0;
          long long v33 = (std::string *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 0, "-[CLInternalService setAuthorizationStatusByType:withCorrectiveCompensation:andZoneIdentifier:andSubIdentityIdentifier:forBundleID:orBundlePath:replyBlock:]", "%s\n", (const char *)v33);
          if (v33 != buf) {
            free(v33);
          }
        }
      }
      id v24 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
      (*((void (**)(id, id))a9 + 2))(a9, v24);

      goto LABEL_46;
    }
  }
  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v20 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", (uint8_t *)buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    LOWORD(v53.__r_.__value_.__l.__data_) = 0;
    char v32 = (std::string *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService setAuthorizationStatusByType:withCorrectiveCompensation:andZoneIdentifier:andSubIdentityIdentifier:forBundleID:orBundlePath:replyBlock:]", "%s\n", (const char *)v32);
    if (v32 != buf) {
      free(v32);
    }
  }
  id v21 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
  (*((void (**)(id, id))a9 + 2))(a9, v21);

LABEL_46:
  os_activity_scope_leave(&state);
}

- (void)updatePillButtonChoiceForOutstandingPrompt:(int)a3 replyBlock:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init((Class)NSAutoreleasePool);
  uint64_t v8 = _os_activity_create((void *)&_mh_execute_header, "CL: updatePillButtonChoiceForOutstandingPrompt:replyBlock: (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v9 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v19 = 0;
    __int16 v20 = 2082;
    id v21 = "";
    __int16 v22 = 2082;
    int v23 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"updatePillButtonChoiceForOutstandingPrompt:replyBlock:\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v10 = _os_activity_create((void *)&_mh_execute_header, "CL: updateCorrectiveCompensationChoiceForOutstandingPrompt:replyBlock: (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v10, &v16);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v11 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v19 = 0;
    __int16 v20 = 2082;
    id v21 = "";
    __int16 v22 = 2082;
    int v23 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"updateCorrectiveCompensationChoiceForOutstandingPrompt:replyBlock:\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v12 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.authorizeapplications"];
  if (v12
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v12 BOOLValue] & 1) != 0)
  {
    [objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLClientManager") updatePillButtonChoiceForOutstandingPrompt:v5];
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    uint64_t v13 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      id v15 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService updatePillButtonChoiceForOutstandingPrompt:replyBlock:]", "%s\n", v15);
      if (v15 != (char *)buf) {
        free(v15);
      }
    }
    id v14 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id))a4 + 2))(a4, v14);
  }
  os_activity_scope_leave(&v16);
  os_activity_scope_leave(&state);
}

- (void)updatePromptedLatitude:(double)a3 longitude:(double)a4 replyBlock:(id)a5
{
  id v9 = _os_activity_create((void *)&_mh_execute_header, "CL: updatePromptedLatitude:longitude:replyBlock: (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v9, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v10 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v17 = 0;
    __int16 v18 = 2082;
    int v19 = "";
    __int16 v20 = 2082;
    id v21 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"updatePromptedLatitude:longitude:replyBlock:\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v11 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.authorizeapplications"];
  if (v11
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v11 BOOLValue] & 1) != 0)
  {
    [objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLClientManager") updatePromptedLatitude:a3 longitude:a4];
    (*((void (**)(id, void))a5 + 2))(a5, 0);
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v12 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      id v14 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService updatePromptedLatitude:longitude:replyBlock:]", "%s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
    }
    id v13 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id))a5 + 2))(a5, v13);
  }
  os_activity_scope_leave(&state);
}

- (void)setIncidentalUseMode:(int)a3 forBundleID:(id)a4 orBundlePath:(id)a5 replyBlock:(id)a6
{
  uint64_t v9 = *(void *)&a3;
  id v11 = objc_alloc_init((Class)NSAutoreleasePool);
  id v12 = _os_activity_create((void *)&_mh_execute_header, "CL: setIncidentalUseMode:forBundleID:orBundlePath:replyBlock: (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v12, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v13 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"setIncidentalUseMode:forBundleID:orBundlePath:replyBlock:\", \"event\":%{public, location:escape_only}s}", (uint8_t *)buf, 0x1Cu);
  }
  id v14 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.authorizeapplications"];
  if (v14
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v14 BOOLValue] & 1) != 0)
  {
    if ([a4 length] || objc_msgSend(a5, "length"))
    {
      memset(v59, 0, 35);
      long long v58 = 0u;
      memset(buf, 0, sizeof(buf));
      long long v60 = 0u;
      memset(v61, 0, 59);
      if ([a4 length])
      {
        sub_100134750(&__str, (char *)[a4 UTF8String]);
        sub_1000B7144(&__str, (uint64_t)&v40);
      }
      else
      {
        if (![a5 length])
        {
LABEL_49:
          if (self) {
            [(CLInternalService *)self currentToken];
          }
          else {
            memset(v38, 0, 32);
          }
          CLConnection::getUserNameFromAuditToken((uint64_t *)&v40, (CLConnection *)v38, v15);
          sub_1001A5B7C(buf, &v40);
          if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v40.__r_.__value_.__l.__data_);
          }
          id v19 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLClientManager"];
          sub_100089AE0((char *)__dst, (long long *)buf);
          [v19 setIncidentalUseMode:v9 forClient:sub_1000376D4((long long *)__dst)];
          if (v37 < 0) {
            operator delete(v36);
          }
          if (v35 < 0) {
            operator delete(v34);
          }
          if (v33 < 0) {
            operator delete(v32);
          }
          if (v31 < 0) {
            operator delete(v30);
          }
          if (v29 < 0) {
            operator delete(v28);
          }
          if (v27 < 0) {
            operator delete(v26);
          }
          if (v25 < 0) {
            operator delete(__dst[0]);
          }
          (*((void (**)(id, void))a6 + 2))(a6, 0);
          if (SBYTE7(v61[3]) < 0) {
            operator delete(*(void **)&v61[2]);
          }
          if (SHIBYTE(v61[1]) < 0) {
            operator delete(*((void **)&v61[0] + 1));
          }
          if (SBYTE7(v61[0]) < 0) {
            operator delete((void *)v60);
          }
          if (SHIBYTE(v59[3]) < 0) {
            operator delete((void *)v59[1]);
          }
          if (SHIBYTE(v59[0]) < 0) {
            operator delete((void *)v58);
          }
          if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0) {
            operator delete(buf[1].__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
            operator delete(buf[0].__r_.__value_.__l.__data_);
          }
          goto LABEL_18;
        }
        sub_100134750(&__str, (char *)[a5 UTF8String]);
        sub_1000B6F5C(&__str, (uint64_t)&v40);
      }
      if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf[0].__r_.__value_.__l.__data_);
      }
      buf[0] = v40;
      *((unsigned char *)&v40.__r_.__value_.__s + 23) = 0;
      v40.__r_.__value_.__s.__data_[0] = 0;
      if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf[1].__r_.__value_.__l.__data_);
      }
      buf[1] = v41;
      *((unsigned char *)&v41.__r_.__value_.__s + 23) = 0;
      v41.__r_.__value_.__s.__data_[0] = 0;
      if (SHIBYTE(v59[0]) < 0) {
        operator delete((void *)v58);
      }
      long long v58 = v42;
      v59[0] = v43;
      HIBYTE(v43) = 0;
      LOBYTE(v42) = 0;
      if (SHIBYTE(v59[3]) < 0) {
        operator delete((void *)v59[1]);
      }
      *(_OWORD *)&v59[1] = v44;
      v59[3] = v45;
      HIBYTE(v45) = 0;
      LOBYTE(v44) = 0;
      LOWORD(v59[4]) = v46;
      BYTE2(v59[4]) = v47;
      if (SBYTE7(v61[0]) < 0) {
        operator delete((void *)v60);
      }
      long long v60 = v48;
      *(void *)&v61[0] = v49;
      HIBYTE(v49) = 0;
      LOBYTE(v48) = 0;
      if (SHIBYTE(v61[1]) < 0) {
        operator delete(*((void **)&v61[0] + 1));
      }
      char v18 = 0;
      *(_OWORD *)((char *)v61 + 8) = v50;
      *((void *)&v61[1] + 1) = v51;
      HIBYTE(v51) = 0;
      LOBYTE(v50) = 0;
      if (SBYTE7(v61[3]) < 0)
      {
        operator delete(*(void **)&v61[2]);
        char v18 = HIBYTE(v51);
      }
      v61[2] = v52;
      *(void *)&v61[3] = v53;
      HIBYTE(v53) = 0;
      LOBYTE(v52) = 0;
      WORD4(v61[3]) = v54;
      BYTE10(v61[3]) = v55;
      if (v18 < 0) {
        operator delete((void *)v50);
      }
      if (SHIBYTE(v49) < 0) {
        operator delete((void *)v48);
      }
      if (SHIBYTE(v45) < 0) {
        operator delete((void *)v44);
      }
      if (SHIBYTE(v43) < 0) {
        operator delete((void *)v42);
      }
      if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v41.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v40.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__str.__r_.__value_.__l.__data_);
      }
      goto LABEL_49;
    }
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    __int16 v20 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "#Spi, Must provide a bundle identifier or bundle path for which to set incidental use mode", (uint8_t *)buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      LOWORD(v40.__r_.__value_.__l.__data_) = 0;
      int v23 = (std::string *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLInternalService setIncidentalUseMode:forBundleID:orBundlePath:replyBlock:]", "%s\n", (const char *)v23);
      if (v23 != buf) {
        free(v23);
      }
    }
    id v21 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
    (*((void (**)(id, id))a6 + 2))(a6, v21);
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    os_activity_scope_state_s v16 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", (uint8_t *)buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      LOWORD(v40.__r_.__value_.__l.__data_) = 0;
      __int16 v22 = (std::string *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService setIncidentalUseMode:forBundleID:orBundlePath:replyBlock:]", "%s\n", (const char *)v22);
      if (v22 != buf) {
        free(v22);
      }
    }
    id v17 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id))a6 + 2))(a6, v17);
  }
LABEL_18:
  os_activity_scope_leave(&state);
}

- (void)setLocationButtonUseMode:(int)a3 forBundleID:(id)a4 orBundlePath:(id)a5 replyBlock:(id)a6
{
  uint64_t v9 = *(void *)&a3;
  id v11 = objc_alloc_init((Class)NSAutoreleasePool);
  id v12 = _os_activity_create((void *)&_mh_execute_header, "CL: setLocationButtonUseMode:forBundleID:orBundlePath:replyBlock: (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v12, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v13 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"setLocationButtonUseMode:forBundleID:orBundlePath:replyBlock:\", \"event\":%{public, location:escape_only}s}", (uint8_t *)buf, 0x1Cu);
  }
  id v14 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.authorizeapplications"];
  if (v14
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v14 BOOLValue] & 1) != 0)
  {
    if ([a4 length] || objc_msgSend(a5, "length"))
    {
      memset(v59, 0, 35);
      long long v58 = 0u;
      memset(buf, 0, sizeof(buf));
      long long v60 = 0u;
      memset(v61, 0, 59);
      if ([a4 length])
      {
        sub_100134750(&__str, (char *)[a4 UTF8String]);
        sub_1000B7144(&__str, (uint64_t)&v40);
      }
      else
      {
        if (![a5 length])
        {
LABEL_49:
          if (self) {
            [(CLInternalService *)self currentToken];
          }
          else {
            memset(v38, 0, 32);
          }
          CLConnection::getUserNameFromAuditToken((uint64_t *)&v40, (CLConnection *)v38, v15);
          sub_1001A5B7C(buf, &v40);
          if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v40.__r_.__value_.__l.__data_);
          }
          id v19 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLClientManager"];
          sub_100089AE0((char *)__dst, (long long *)buf);
          [v19 setLocationButtonUseMode:v9 forClient:sub_1000376D4((long long *)__dst)];
          if (v37 < 0) {
            operator delete(v36);
          }
          if (v35 < 0) {
            operator delete(v34);
          }
          if (v33 < 0) {
            operator delete(v32);
          }
          if (v31 < 0) {
            operator delete(v30);
          }
          if (v29 < 0) {
            operator delete(v28);
          }
          if (v27 < 0) {
            operator delete(v26);
          }
          if (v25 < 0) {
            operator delete(__dst[0]);
          }
          (*((void (**)(id, void))a6 + 2))(a6, 0);
          if (SBYTE7(v61[3]) < 0) {
            operator delete(*(void **)&v61[2]);
          }
          if (SHIBYTE(v61[1]) < 0) {
            operator delete(*((void **)&v61[0] + 1));
          }
          if (SBYTE7(v61[0]) < 0) {
            operator delete((void *)v60);
          }
          if (SHIBYTE(v59[3]) < 0) {
            operator delete((void *)v59[1]);
          }
          if (SHIBYTE(v59[0]) < 0) {
            operator delete((void *)v58);
          }
          if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0) {
            operator delete(buf[1].__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
            operator delete(buf[0].__r_.__value_.__l.__data_);
          }
          goto LABEL_18;
        }
        sub_100134750(&__str, (char *)[a5 UTF8String]);
        sub_1000B6F5C(&__str, (uint64_t)&v40);
      }
      if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf[0].__r_.__value_.__l.__data_);
      }
      buf[0] = v40;
      *((unsigned char *)&v40.__r_.__value_.__s + 23) = 0;
      v40.__r_.__value_.__s.__data_[0] = 0;
      if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf[1].__r_.__value_.__l.__data_);
      }
      buf[1] = v41;
      *((unsigned char *)&v41.__r_.__value_.__s + 23) = 0;
      v41.__r_.__value_.__s.__data_[0] = 0;
      if (SHIBYTE(v59[0]) < 0) {
        operator delete((void *)v58);
      }
      long long v58 = v42;
      v59[0] = v43;
      HIBYTE(v43) = 0;
      LOBYTE(v42) = 0;
      if (SHIBYTE(v59[3]) < 0) {
        operator delete((void *)v59[1]);
      }
      *(_OWORD *)&v59[1] = v44;
      v59[3] = v45;
      HIBYTE(v45) = 0;
      LOBYTE(v44) = 0;
      LOWORD(v59[4]) = v46;
      BYTE2(v59[4]) = v47;
      if (SBYTE7(v61[0]) < 0) {
        operator delete((void *)v60);
      }
      long long v60 = v48;
      *(void *)&v61[0] = v49;
      HIBYTE(v49) = 0;
      LOBYTE(v48) = 0;
      if (SHIBYTE(v61[1]) < 0) {
        operator delete(*((void **)&v61[0] + 1));
      }
      char v18 = 0;
      *(_OWORD *)((char *)v61 + 8) = v50;
      *((void *)&v61[1] + 1) = v51;
      HIBYTE(v51) = 0;
      LOBYTE(v50) = 0;
      if (SBYTE7(v61[3]) < 0)
      {
        operator delete(*(void **)&v61[2]);
        char v18 = HIBYTE(v51);
      }
      v61[2] = v52;
      *(void *)&v61[3] = v53;
      HIBYTE(v53) = 0;
      LOBYTE(v52) = 0;
      WORD4(v61[3]) = v54;
      BYTE10(v61[3]) = v55;
      if (v18 < 0) {
        operator delete((void *)v50);
      }
      if (SHIBYTE(v49) < 0) {
        operator delete((void *)v48);
      }
      if (SHIBYTE(v45) < 0) {
        operator delete((void *)v44);
      }
      if (SHIBYTE(v43) < 0) {
        operator delete((void *)v42);
      }
      if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v41.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v40.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__str.__r_.__value_.__l.__data_);
      }
      goto LABEL_49;
    }
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    __int16 v20 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "#Spi, Must provide a bundle identifier or bundle path for which to set location-button use mode", (uint8_t *)buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      LOWORD(v40.__r_.__value_.__l.__data_) = 0;
      int v23 = (std::string *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLInternalService setLocationButtonUseMode:forBundleID:orBundlePath:replyBlock:]", "%s\n", (const char *)v23);
      if (v23 != buf) {
        free(v23);
      }
    }
    id v21 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
    (*((void (**)(id, id))a6 + 2))(a6, v21);
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    os_activity_scope_state_s v16 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", (uint8_t *)buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      LOWORD(v40.__r_.__value_.__l.__data_) = 0;
      __int16 v22 = (std::string *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService setLocationButtonUseMode:forBundleID:orBundlePath:replyBlock:]", "%s\n", (const char *)v22);
      if (v22 != buf) {
        free(v22);
      }
    }
    id v17 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id))a6 + 2))(a6, v17);
  }
LABEL_18:
  os_activity_scope_leave(&state);
}

- (void)gyroCalibrationDatabaseSupportsMiniCalibrationWithReplyBlock:(id)a3
{
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  BOOL v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGyroCalibrationDatabaseSupportsMiniCalibration (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v7 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v15 = 0;
    __int16 v16 = 2082;
    id v17 = "";
    __int16 v18 = 2082;
    id v19 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGyroCalibrationDatabaseSupportsMiniCalibration\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v8 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.rebuild_gytt"];
  if (v8
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    if (objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLGyroCalibrationDatabase"), "syncgetSupportsMiniCalibration"))
    {
      (*((void (**)(id, void, uint64_t))a3 + 2))(a3, 0, 1);
    }
    else
    {
      id v11 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
      (*((void (**)(id, id, void))a3 + 2))(a3, v11, 0);
    }
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    uint64_t v9 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      id v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService gyroCalibrationDatabaseSupportsMiniCalibrationWithReplyBlock:]", "%s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
    id v10 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id, void))a3 + 2))(a3, v10, 0);
  }
  os_activity_scope_leave(&state);
}

- (void)setBackgroundIndicatorEnabled:(BOOL)a3 forBundleID:(id)a4 orBundlePath:(id)a5 replyBlock:(id)a6
{
  BOOL v9 = a3;
  id v11 = objc_alloc_init((Class)NSAutoreleasePool);
  id v12 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonSetBackgroundIndicatorEnabled (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v12, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v13 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    buf[0].__r_.__value_.__r.__words[0] = 68289282;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)"";
    WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2082;
    *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)"activity";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonSetBackgroundIndicatorEnabled\", \"event\":%{public, location:escape_only}s}", (uint8_t *)buf, 0x1Cu);
  }
  id v14 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.authorizeapplications"];
  if (v14
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v14 BOOLValue] & 1) != 0)
  {
    if ([a4 length] || objc_msgSend(a5, "length"))
    {
      memset(v63, 0, 35);
      *(_OWORD *)uint64_t v62 = 0u;
      memset(buf, 0, sizeof(buf));
      long long v64 = 0u;
      memset(v65, 0, 59);
      if ([a4 length])
      {
        sub_100134750(__str, (char *)[a4 cStringUsingEncoding:4]);
        sub_1000B7144((std::string *)__str, (uint64_t)&v44);
      }
      else
      {
        if (![a5 length])
        {
LABEL_49:
          if (self) {
            [(CLInternalService *)self currentToken];
          }
          else {
            memset(v43, 0, sizeof(v43));
          }
          CLConnection::getUserNameFromAuditToken((uint64_t *)&v44, (CLConnection *)v43, v15);
          sub_1001A5B7C(buf, &v44);
          if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v44.__r_.__value_.__l.__data_);
          }
          id v19 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLClientManager"];
          sub_100089AE0((char *)__dst, (long long *)buf);
          id v20 = sub_1000376D4((long long *)__dst);
          if (self) {
            [(CLInternalService *)self currentToken];
          }
          else {
            memset(__str, 0, sizeof(__str));
          }
          sub_10001BEC0(__str, (uint64_t)&v44);
          double v21 = sub_1000372B8((uint64_t)&v44, &v28);
          if ((v28.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            __int16 v22 = &v28;
          }
          else {
            __int16 v22 = (std::string *)v28.__r_.__value_.__r.__words[0];
          }
          [v19 setClientBackgroundIndicator:v20 enabled:v9 entity:[NSString stringWithUTF8String:v22]];
          if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v28.__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(v57) < 0) {
            operator delete((void *)v56);
          }
          if (SHIBYTE(v55) < 0) {
            operator delete((void *)v54);
          }
          if (SHIBYTE(v53) < 0) {
            operator delete((void *)v52);
          }
          if (SHIBYTE(v49) < 0) {
            operator delete((void *)v48);
          }
          if (SHIBYTE(v47) < 0) {
            operator delete((void *)v46);
          }
          if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v45.__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v44.__r_.__value_.__l.__data_);
          }
          if (v42 < 0) {
            operator delete(v41);
          }
          if (v40 < 0) {
            operator delete(v39);
          }
          if (v38 < 0) {
            operator delete(v37);
          }
          if (v36 < 0) {
            operator delete(v35);
          }
          if (v34 < 0) {
            operator delete(v33);
          }
          if (v32 < 0) {
            operator delete(v31);
          }
          if (v30 < 0) {
            operator delete(__dst[0]);
          }
          (*((void (**)(id, void))a6 + 2))(a6, 0);
          if (SBYTE7(v65[3]) < 0) {
            operator delete(*(void **)&v65[2]);
          }
          if (SHIBYTE(v65[1]) < 0) {
            operator delete(*((void **)&v65[0] + 1));
          }
          if (SBYTE7(v65[0]) < 0) {
            operator delete((void *)v64);
          }
          if (SHIBYTE(v63[3]) < 0) {
            operator delete(v63[1]);
          }
          if (SHIBYTE(v63[0]) < 0) {
            operator delete(v62[0]);
          }
          if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0) {
            operator delete(buf[1].__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
            operator delete(buf[0].__r_.__value_.__l.__data_);
          }
          goto LABEL_18;
        }
        sub_100134750(__str, (char *)[a5 cStringUsingEncoding:4]);
        sub_1000B6F5C((std::string *)__str, (uint64_t)&v44);
      }
      if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf[0].__r_.__value_.__l.__data_);
      }
      buf[0] = v44;
      *((unsigned char *)&v44.__r_.__value_.__s + 23) = 0;
      v44.__r_.__value_.__s.__data_[0] = 0;
      if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf[1].__r_.__value_.__l.__data_);
      }
      buf[1] = v45;
      *((unsigned char *)&v45.__r_.__value_.__s + 23) = 0;
      v45.__r_.__value_.__s.__data_[0] = 0;
      if (SHIBYTE(v63[0]) < 0) {
        operator delete(v62[0]);
      }
      *(_OWORD *)uint64_t v62 = v46;
      v63[0] = v47;
      HIBYTE(v47) = 0;
      LOBYTE(v46) = 0;
      if (SHIBYTE(v63[3]) < 0) {
        operator delete(v63[1]);
      }
      *(_OWORD *)&v63[1] = v48;
      v63[3] = v49;
      HIBYTE(v49) = 0;
      LOBYTE(v48) = 0;
      LOWORD(v63[4]) = v50;
      BYTE2(v63[4]) = v51;
      if (SBYTE7(v65[0]) < 0) {
        operator delete((void *)v64);
      }
      long long v64 = v52;
      *(void *)&v65[0] = v53;
      HIBYTE(v53) = 0;
      LOBYTE(v52) = 0;
      if (SHIBYTE(v65[1]) < 0) {
        operator delete(*((void **)&v65[0] + 1));
      }
      char v18 = 0;
      *(_OWORD *)((char *)v65 + 8) = v54;
      *((void *)&v65[1] + 1) = v55;
      HIBYTE(v55) = 0;
      LOBYTE(v54) = 0;
      if (SBYTE7(v65[3]) < 0)
      {
        operator delete(*(void **)&v65[2]);
        char v18 = HIBYTE(v55);
      }
      _OWORD v65[2] = v56;
      *(void *)&v65[3] = v57;
      HIBYTE(v57) = 0;
      LOBYTE(v56) = 0;
      WORD4(v65[3]) = v58;
      BYTE10(v65[3]) = v59;
      if (v18 < 0) {
        operator delete((void *)v54);
      }
      if (SHIBYTE(v53) < 0) {
        operator delete((void *)v52);
      }
      if (SHIBYTE(v49) < 0) {
        operator delete((void *)v48);
      }
      if (SHIBYTE(v47) < 0) {
        operator delete((void *)v46);
      }
      if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v45.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v44.__r_.__value_.__l.__data_);
      }
      if ((__str[23] & 0x80000000) != 0) {
        operator delete(*(void **)__str);
      }
      goto LABEL_49;
    }
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    int v23 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "#Spi, both bundle-id and bundle-identifier are either zero-length or nil", (uint8_t *)buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      LOWORD(v44.__r_.__value_.__l.__data_) = 0;
      std::string v26 = (std::string *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLInternalService setBackgroundIndicatorEnabled:forBundleID:orBundlePath:replyBlock:]", "%s\n", (const char *)v26);
      if (v26 != buf) {
        free(v26);
      }
    }
    id v24 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
    (*((void (**)(id, id))a6 + 2))(a6, v24);
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    __int16 v16 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", (uint8_t *)buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      LOWORD(v44.__r_.__value_.__l.__data_) = 0;
      char v25 = (std::string *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService setBackgroundIndicatorEnabled:forBundleID:orBundlePath:replyBlock:]", "%s\n", (const char *)v25);
      if (v25 != buf) {
        free(v25);
      }
    }
    id v17 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id))a6 + 2))(a6, v17);
  }
LABEL_18:
  os_activity_scope_leave(&state);
}

- (void)getOscarTimeSyncWithReplyBlock:(id)a3
{
  id v4 = objc_alloc_init((Class)NSAutoreleasePool);
  id v5 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonOscarTimeSync (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v5, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  BOOL v6 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v15 = 0;
    __int16 v16 = 2082;
    id v17 = "";
    __int16 v18 = 2082;
    id v19 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonOscarTimeSync\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  uint64_t v7 = sub_1000D2E34(0);
  if (v7)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    _OWORD v11[2] = sub_101A0B74C;
    v11[3] = &unk_10234C9B8;
    void v11[4] = a3;
    v11[5] = _Block_copy(a3);
    (*(void (**)(uint64_t, void *))(*(void *)v7 + 144))(v7, v11);
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v8 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "TimeSyncWithReplyBlock, can't find motionCoprocessor", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      __int16 v12 = 0;
      id v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLInternalService getOscarTimeSyncWithReplyBlock:]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    id v9 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
    (*((void (**)(id, id, void, void))a3 + 2))(a3, v9, 0, 0);
  }
  os_activity_scope_leave(&state);
}

- (void)getControlPlaneStatusReportClear:(int)a3 replyBlock:(id)a4
{
  id v7 = objc_alloc_init((Class)NSAutoreleasePool);
  id v8 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetControlPlaneStatusReport (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &v24);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v9 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)&uint8_t buf[8] = 2082;
    *(void *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetControlPlaneStatusReport\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  if (objc_msgSend(-[CLInternalService vendor](self, "vendor"), "isServiceRunning:", @"CLGnssProvider"))
  {
    id v10 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLGnssProvider"];
    if (a3)
    {
      [v10 resetControlPlaneStatus];
    }
    else
    {
      __asm { FMOV            V0.2D, #-1.0 }
      *(_OWORD *)buf = _Q0;
      *(_OWORD *)&buf[16] = 0uLL;
      unint64_t v26 = 0;
      unint64_t v27 = 0xBFF0000000000000;
      uint64_t v28 = -1;
      unsigned int v29 = 0;
      if ([v10 syncgetControlPlaneStatusReport:buf])
      {
        v11.n128_u64[0] = *(void *)buf;
        v12.n128_u64[0] = *(void *)&buf[8];
        v14.n128_u64[0] = *(void *)&buf[24];
        v13.n128_u64[0] = *(void *)&buf[16];
        v15.n128_u64[0] = v26;
        v16.n128_u64[0] = v27;
        uint64_t v23 = v29;
LABEL_12:
        (*((void (**)(id, void, uint64_t, __n128, __n128, __n128, __n128, __n128, __n128))a4 + 2))(a4, 0, v23, v11, v12, v13, v14, v15, v16);
        goto LABEL_13;
      }
    }
    uint64_t v23 = 0;
    v13.n128_u64[0] = 0;
    v11.n128_u64[0] = -1.0;
    v12.n128_u64[0] = -1.0;
    v14.n128_u64[0] = 0;
    v15.n128_u64[0] = 0;
    v16.n128_u64[0] = -1.0;
    goto LABEL_12;
  }
  id v17 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:1 userInfo:0];
  (*((void (**)(id, id, void, double, double, double, double, double, double))a4 + 2))(a4, v17, 0, -1.0, -1.0, 0.0, 0.0, 0.0, -1.0);

LABEL_13:
  os_activity_scope_leave(&v24);
}

- (void)getEmergencyLocationSettingsVersion:(id)a3
{
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  BOOL v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetEmergencyLocationSettingsVersion (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &v8);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v7 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v10 = 0;
    __int16 v11 = 2082;
    __n128 v12 = "";
    __int16 v13 = 2082;
    __n128 v14 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetEmergencyLocationSettingsVersion\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  [objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:forClient:", @"CLMobileAssetManager", @"CLInternalService") getAssetVersionInfoFor:0 withReply:a3];
  os_activity_scope_leave(&v8);
}

- (void)deleteCurrentEmergencyLocationAsset:(id)a3
{
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  BOOL v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonDeleteCurrentEmergencyLocationAsset (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &v8);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v7 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v10 = 0;
    __int16 v11 = 2082;
    __n128 v12 = "";
    __int16 v13 = 2082;
    __n128 v14 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonDeleteCurrentEmergencyLocationAsset\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  [objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:forClient:", @"CLMobileAssetManager", @"CLInternalService") deleteCurrentAssetFor:0 withReply:a3];
  os_activity_scope_leave(&v8);
}

- (void)copyNearbyAssetSettings:(id)a3
{
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  BOOL v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonCopyNearbyAssetSettings (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v7 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v11 = 0;
    __int16 v12 = 2082;
    __int16 v13 = "";
    __int16 v14 = 2082;
    __n128 v15 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonCopyNearbyAssetSettings\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_101A0C260;
  v8[3] = &unk_10234C8C8;
  v8[4] = a3;
  [objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:forClient:", @"CLMobileAssetManager", @"CLInternalService") copyNearbyAssetSettingsWithReply:v8];
  os_activity_scope_leave(&state);
}

- (void)copyNearbyAssetSettingsOfAccessoryFile:(id)a3 withReply:(id)a4
{
  id v7 = objc_alloc_init((Class)NSAutoreleasePool);
  os_activity_scope_state_s v8 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonCopyNearbyAssetSettingsOfAccessoryFileWithReply (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v8, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v9 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v13 = 0;
    __int16 v14 = 2082;
    __n128 v15 = "";
    __int16 v16 = 2082;
    id v17 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonCopyNearbyAssetSettingsOfAccessoryFileWithReply\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  _OWORD v10[2] = sub_101A0C618;
  v10[3] = &unk_10234C8C8;
  v10[4] = a4;
  [objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:forClient:", @"CLMobileAssetManager", @"CLInternalService") copyNearbyAssetSettingsOfAccessoryFile:a3 withReply:v10];
  os_activity_scope_leave(&state);
}

- (void)copyRoutineAssetSettings:(id)a3
{
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  BOOL v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonCopyRoutineAssetSettings (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v7 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v11 = 0;
    __int16 v12 = 2082;
    int v13 = "";
    __int16 v14 = 2082;
    __n128 v15 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonCopyRoutineAssetSettings\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_101A0C9C0;
  v8[3] = &unk_10234C9E0;
  v8[4] = a3;
  [objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:forClient:", @"CLMobileAssetManager", @"CLInternalService") copyRoutineAssetSettingsWithReply:v8];
  os_activity_scope_leave(&state);
}

- (void)shouldDisplayEEDUI:(id)a3
{
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  BOOL v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonShouldDisplayEEDUI (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v7 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v11 = 0;
    __int16 v12 = 2082;
    int v13 = "";
    __int16 v14 = 2082;
    __n128 v15 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonShouldDisplayEEDUI\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_101A0CDA8;
  v8[3] = &unk_1022D8728;
  v8[4] = a3;
  [objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:forClient:", @"CLEmergencyController", @"CLInternalService") shouldDisplayEEDUIWithReply:v8];
  os_activity_scope_leave(&state);
}

- (void)getEEDCloakingKeyWithReply:(id)a3
{
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  BOOL v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetEEDCloakingKeyWithReply (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v7 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v16 = 0;
    __int16 v17 = 2082;
    __int16 v18 = "";
    __int16 v19 = 2082;
    id v20 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetEEDCloakingKeyWithReply\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v8 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.eed_cloaking_key"];
  if (v8
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_101A0D34C;
    v12[3] = &unk_10234CA08;
    v12[4] = a3;
    [objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:forClient:", @"CLEmergencyController", @"CLInternalService") getEEDCloakingKeyWithReply:v12];
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v9 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      __int16 v13 = 0;
      int v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService getEEDCloakingKeyWithReply:]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
    id v10 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id, void))a3 + 2))(a3, v10, 0);
  }
  os_activity_scope_leave(&state);
}

- (void)getEEDEmergencyContactNamesWithReply:(id)a3
{
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  BOOL v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetEEDEmergencyContactNamesWithReply (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v7 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v16 = 0;
    __int16 v17 = 2082;
    __int16 v18 = "";
    __int16 v19 = 2082;
    id v20 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetEEDEmergencyContactNamesWithReply\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v8 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.eed_emergency_contact_names"];
  if (v8
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_101A0D99C;
    v12[3] = &unk_10234CA30;
    v12[4] = a3;
    [objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:forClient:", @"CLEmergencyController", @"CLInternalService") getEEDEmergencyContactNamesWithReply:v12];
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v9 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      __int16 v13 = 0;
      int v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService getEEDEmergencyContactNamesWithReply:]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
    id v10 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id, void))a3 + 2))(a3, v10, 0);
  }
  os_activity_scope_leave(&state);
}

- (void)startStopAdvertisingBeacon:(id)a3 atPower:(int)a4 replyBlock:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v9 = objc_alloc_init((Class)NSAutoreleasePool);
  id v10 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonStartStopAdvertisingBeacon (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v10, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  int v11 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v20 = 0;
    __int16 v21 = 2082;
    __int16 v22 = "";
    __int16 v23 = 2082;
    os_activity_scope_state_s v24 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonStartStopAdvertisingBeacon\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v12 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.advertise-beacon"];
  if (v12
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v12 BOOLValue] & 1) != 0)
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    __int16 v13 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289283;
      int v20 = 0;
      __int16 v21 = 2082;
      __int16 v22 = "";
      __int16 v23 = 2113;
      os_activity_scope_state_s v24 = (const char *)a3;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi, startStopAdvertisingBeacon, \", \"Region\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
    if (objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLBTLEBeaconProvider"), "syncgetadvertiseSelfAsBeaconForRegion:power:", a3, v6))
    {
      (*((void (**)(id, void))a5 + 2))(a5, 0);
    }
    else
    {
      id v16 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
      (*((void (**)(id, id))a5 + 2))(a5, v16);
    }
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    __int16 v14 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      __int16 v17 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService startStopAdvertisingBeacon:atPower:replyBlock:]", "%s\n", v17);
      if (v17 != (char *)buf) {
        free(v17);
      }
    }
    id v15 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id))a5 + 2))(a5, v15);
  }
  os_activity_scope_leave(&state);
}

- (void)getGyroCalibrationDatabaseBiasFitAtTemplerature:(float)a3 replyBlock:(id)a4
{
  id v6 = objc_alloc_init((Class)NSAutoreleasePool);
  id v7 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGyroCalibrationDatabaseGetBiasFitAtTemperature (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v7, &v10);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v8 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v12 = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2082;
    id v16 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGyroCalibrationDatabaseGetBiasFitAtTemperature\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  if (objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLGyroCalibrationDatabase"), "syncgetBiasFit:", buf))
  {
    id v9 = [objc_alloc((Class)NSData) initWithBytes:buf length:320];
    (*((void (**)(id, void, id))a4 + 2))(a4, 0, v9);
  }
  else
  {
    id v9 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
    (*((void (**)(id, id, void))a4 + 2))(a4, v9, 0);
  }

  os_activity_scope_leave(&v10);
}

- (void)insertGyroCalibrationDatabaseBiasEstimateIfValid:(id)a3 temperature:(float)a4 variance:(id)a5 timestamp:(double)a6 replyBlock:(id)a7
{
  $E2C29196C7A5C696474C6955C5A9CE06 v19 = a3;
  $E2C29196C7A5C696474C6955C5A9CE06 v18 = a5;
  id v11 = objc_alloc_init((Class)NSAutoreleasePool);
  int v12 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGyroCalibrationDatabaseInsertBiasEstimateIfValid (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v12, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  __int16 v13 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v21 = 0;
    __int16 v22 = 2082;
    __int16 v23 = "";
    __int16 v24 = 2082;
    char v25 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGyroCalibrationDatabaseInsertBiasEstimateIfValid\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v14 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLGyroCalibrationDatabase"];
  *(float *)&double v15 = a4;
  if ([v14 syncgetInsertWithBias:&v19 variance:&v18 temperature:v15 timestamp:a6])
  {
    (*((void (**)(id, void))a7 + 2))(a7, 0);
  }
  else
  {
    id v16 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
    (*((void (**)(id, id))a7 + 2))(a7, v16);
  }
  os_activity_scope_leave(&state);
}

- (void)gyroCalibrationDatabaseWipeWithReplyBlock:(id)a3
{
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  id v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGyroCalibrationDatabaseWipe (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v7 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v15 = 0;
    __int16 v16 = 2082;
    __int16 v17 = "";
    __int16 v18 = 2082;
    $E2C29196C7A5C696474C6955C5A9CE06 v19 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGyroCalibrationDatabaseWipe\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v8 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.rebuild_gytt"];
  if (v8
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    if (objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLGyroCalibrationDatabase"), "syncgetWipeDatabase"))
    {
      (*((void (**)(id, void))a3 + 2))(a3, 0);
    }
    else
    {
      id v11 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
      (*((void (**)(id, id))a3 + 2))(a3, v11);
    }
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v9 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      int v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService gyroCalibrationDatabaseWipeWithReplyBlock:]", "%s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
    id v10 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id))a3 + 2))(a3, v10);
  }
  os_activity_scope_leave(&state);
}

- (void)gyroCalibrationDatabaseGetNumTemperaturesWithReplyBlock:(id)a3
{
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  id v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGyroCalibrationDatabaseGetNumTemperatures (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v7 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v16 = 0;
    __int16 v17 = 2082;
    __int16 v18 = "";
    __int16 v19 = 2082;
    int v20 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGyroCalibrationDatabaseGetNumTemperatures\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v8 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.rebuild_gytt"];
  if (v8
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    id v9 = [[-[CLInternalService vendor](self, "vendor") proxyForService:@"CLGyroCalibrationDatabase"];
    if (v9)
    {
      (*((void (**)(id, void, id))a3 + 2))(a3, 0, [v9 syncgetNumTemperatures]);
    }
    else
    {
      id v12 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
      (*((void (**)(id, id, uint64_t))a3 + 2))(a3, v12, 0xFFFFFFFFLL);
    }
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v10 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      __int16 v13 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService gyroCalibrationDatabaseGetNumTemperaturesWithReplyBlock:]", "%s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
    id v11 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id, uint64_t))a3 + 2))(a3, v11, 0xFFFFFFFFLL);
  }
  os_activity_scope_leave(&state);
}

- (void)configure:(id)a3 replyBlock:(id)a4
{
  uint64_t v5 = *(void *)&a3.var7;
  unint64_t v6 = *(void *)&a3.var0;
  id v8 = objc_alloc_init((Class)NSAutoreleasePool);
  id v9 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonConfigure (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v9, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v10 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    buf[0] = 68289282;
    buf[1] = 0;
    LOWORD(buf[2]) = 2082;
    *(void *)((char *)&buf[2] + 2) = "";
    HIWORD(buf[4]) = 2082;
    *(void *)&buf[5] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonConfigure\", \"event\":%{public, location:escape_only}s}", (uint8_t *)buf, 0x1Cu);
  }
  id v11 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.configure"];
  if (v11
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v11 BOOLValue] & 1) != 0)
  {
    if (sub_1000D2E34(0))
    {
      memset((char *)&buf[1] + 3, 0, 32);
      memset((char *)&buf[9] + 3, 0, 27);
      LOBYTE(buf[0]) = 6;
      BYTE1(buf[0]) = v6 & 1;
      uint64x2_t v12 = (uint64x2_t)vdupq_n_s64(v6);
      int16x8_t v13 = (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v12, (uint64x2_t)xmmword_101E54290), (int32x4_t)vshlq_u64(v12, (uint64x2_t)xmmword_101E54280));
      *(int8x8_t *)v13.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v13), (int8x8_t)0x1000100010001);
      *(_DWORD *)((char *)buf + 2) = vmovn_s16(v13).u32[0];
      BYTE2(buf[1]) = BYTE5(v6) & 1;
      BYTE1(buf[2]) = BYTE6(v6);
      BYTE2(buf[2]) = BYTE4(v5);
      *(_WORD *)((char *)&buf[2] + 3) = HIWORD(v5);
      *(_DWORD *)((char *)&buf[4] + 1) = v5;
      id v14 = _Block_copy(a4);
      uint64_t v15 = sub_1000D2E34(0);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_101A0F240;
      void v22[3] = &unk_1022D8728;
      v22[4] = v14;
      [CLInternalService silo:self queue:v22];
    }
    else
    {
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      __int16 v18 = qword_102419528;
      if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_FAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "#Spi, Oscar not available", (uint8_t *)buf, 2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419520 != -1) {
          dispatch_once(&qword_102419520, &stru_10234CA70);
        }
        __int16 v23 = 0;
        int v21 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLInternalService configure:replyBlock:]", "%s\n", v21);
        if (v21 != (char *)buf) {
          free(v21);
        }
      }
      id v19 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
      (*((void (**)(id, id))a4 + 2))(a4, v19);
    }
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    int v16 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", (uint8_t *)buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      __int16 v23 = 0;
      int v20 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService configure:replyBlock:]", "%s\n", v20);
      if (v20 != (char *)buf) {
        free(v20);
      }
    }
    id v17 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id))a4 + 2))(a4, v17);
  }
  os_activity_scope_leave(&state);
}

- (void)getMotionSensorLogsWithReply:(id)a3
{
  id v4 = objc_alloc_init((Class)NSAutoreleasePool);
  uint64_t v5 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemongetMotionSensorLogs (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v5, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  unint64_t v6 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v12 = 0;
    __int16 v13 = 2082;
    id v14 = "";
    __int16 v15 = 2082;
    int v16 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemongetMotionSensorLogs\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  if (qword_10248AF88 != -1) {
    dispatch_once(&qword_10248AF88, &stru_10234CAB0);
  }
  if (qword_10248AF90)
  {
    id v7 = (NSArray *)sub_100F54730(qword_10248AF90);
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v8 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Unable to access Motion Logger.  Maybe it is not enabled?", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      id v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLInternalService getMotionSensorLogsWithReply:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
    id v7 = +[NSArray array];
  }
  (*((void (**)(id, NSArray *, void))a3 + 2))(a3, v7, 0);
  os_activity_scope_leave(&state);
}

- (void)getAccessoryMotionSensorLogsWithReply:(id)a3
{
  id v4 = objc_alloc_init((Class)NSAutoreleasePool);
  uint64_t v5 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemongetAccessoryMotionSensorLogs (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v5, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  unint64_t v6 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v13 = 0;
    __int16 v14 = 2082;
    __int16 v15 = "";
    __int16 v16 = 2082;
    id v17 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemongetAccessoryMotionSensorLogs\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  uint64_t v7 = sub_100C22EEC();
  if (v7)
  {
    id v8 = (NSArray *)sub_100C2A990(v7);
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v9 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unable to access CLMotionLogger", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      id v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLInternalService getAccessoryMotionSensorLogsWithReply:]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    id v8 = +[NSArray array];
  }
  (*((void (**)(id, NSArray *, void))a3 + 2))(a3, v8, 0);
  os_activity_scope_leave(&state);
}

- (void)notifyPassKitPayment:(id)a3 transaction:(id)a4 info:(id)a5
{
  id v9 = objc_alloc_init((Class)NSAutoreleasePool);
  id v10 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLPassKitNotifyPayment (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v10, &v12);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v11 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v14 = 0;
    __int16 v15 = 2082;
    __int16 v16 = "";
    __int16 v17 = 2082;
    __int16 v18 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLPassKitNotifyPayment\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  [objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLHarvesterService") notifyPassKitPayment:transaction:info:a3, a4, a5];
  os_activity_scope_leave(&v12);
}

- (void)notifyWeatherForecast:(id)a3 airQualityConditions:(id)a4 hourlyForecasts:(id)a5 dailyForecasts:(id)a6 latitude:(double)a7 longitude:(double)a8
{
}

- (void)getMicroLocationInternalVersionWithReplyBlock:(id)a3
{
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  unint64_t v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetMicroLocationInternalVersion (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  uint64_t v7 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v17 = 0;
    __int16 v18 = 2082;
    id v19 = "";
    __int16 v20 = 2082;
    int v21 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetMicroLocationInternalVersion\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v8 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.status"];
  if (v8
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    v14[0] = 0;
    if (objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLMicroLocationNotifier"), "syncgetMicroLocationInternalVersion:", v14)&& objc_msgSend(v14[0], "length"))
    {
      (*((void (**)(id, void, id))a3 + 2))(a3, 0, v14[0]);
    }
    else
    {
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      id v11 = qword_102419528;
      if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        int v17 = 0;
        __int16 v18 = 2082;
        id v19 = "";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi,MicroLocationInternalVersion,#warning Couldn't get MicroLocation Internal Version\"}", buf, 0x12u);
      }
      id v12 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
      (*((void (**)(id, id, void))a3 + 2))(a3, v12, 0);
    }
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    id v9 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_10234CA70);
      }
      LOWORD(v14[0]) = 0;
      int v13 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService getMicroLocationInternalVersionWithReplyBlock:]", "%s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
    id v10 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
    (*((void (**)(id, id, void))a3 + 2))(a3, v10, 0);
  }
  os_activity_scope_leave(&state);
}

- (void)getZaxisStatsWithReplyBlock:(id)a3
{
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  unint64_t v6 = _os_activity_create((void *)&_mh_execute_header, "CL: _CLDaemonGetZaxisStats (Fallback)", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  uint64_t v7 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)unsigned int v29 = 2082;
    *(void *)&v29[2] = "";
    *(_WORD *)&v29[10] = 2082;
    *(void *)&unsigned char v29[12] = "activity";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"_CLDaemonGetZaxisStats\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v8 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.locationd.status"];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v8 BOOLValue])
    {
      *(void *)buf = 0;
      *(void *)unsigned int v29 = 0;
      *(void *)&v29[8] = 0;
      sub_10017C3FC((void **)buf, 0x18uLL);
      if (*(void *)&v29[8] - *(void *)buf > 0xBFuLL)
      {
        if (!objc_msgSend(objc_msgSend(-[CLInternalService vendor](self, "vendor"), "proxyForService:", @"CLLocationController"), "syncgetZaxisStats:", buf)|| *(void *)v29 == *(void *)buf)
        {
          if (qword_102419520 != -1) {
            dispatch_once(&qword_102419520, &stru_10234CA70);
          }
          __int16 v16 = qword_102419528;
          if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int16 v24 = 68289026;
            int v25 = 0;
            __int16 v26 = 2082;
            unint64_t v27 = "";
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi,ZaxisStats,#warning Couldn't get Zaxis Stats\"}", v24, 0x12u);
          }
        }
        else
        {
          id v12 = objc_alloc((Class)NSMutableDictionary);
          id v13 = [v12 initWithCapacity:(uint64_t)(*(void *)v29 - *(void *)buf) >> 3];
          if (v13)
          {
            uint64_t v14 = *(void *)buf;
            if (**(double **)buf == 1.0)
            {
              [v13 setObject:[NSNumber numberWithDouble:*(double *)(*(void *)buf + 8)] forKeyedSubscript:@"CurrentMCT"];
              unsigned int v15 = 2;
              uint64_t v14 = *(void *)buf;
            }
            else
            {
              unsigned int v15 = 1;
            }
            unsigned int v19 = v15 + 1;
            if (*(double *)(v14 + 8 * v15) == 1.0)
            {
              [v13 setObject:[NSNumber numberWithDouble:*((double *)(v14 + 8 * v19))] forKeyedSubscript:@"GNSSAvailabilityPredictionTime"];
              [v13 setObject:[NSNumber numberWithDouble:*((double *)(*(void *)buf + 8 * (v15 + 2)))] forKeyedSubscript:@"GNSSAvailabilityPredictionState"];
              [v13 setObject:[NSNumber numberWithDouble:*((double *)(*(void *)buf + 8 * (v15 + 3)))];
              [v13 setObject:[NSNumber numberWithDouble:*((double *)(*((void *)buf + 8 * (v15 | 4))))] forKeyedSubscript:@"ALSDecisionTreeOutputTime"];
              [v13 setObject:[NSNumber numberWithDouble:*((double *)(*((void *)buf + 8 * (v15 + 5))))] forKeyedSubscript:@"ALSDecisionTreeOutput"];
              unsigned int v19 = v15 + 6;
              uint64_t v14 = *(void *)buf;
            }
            unsigned int v20 = v19 + 1;
            if (*(double *)(v14 + 8 * v19) == 1.0)
            {
              [v13 setObject:[NSNumber numberWithDouble:*((double *)(v14 + 8 * v20))] forKeyedSubscript:@"LastAltitudeUpdateFromBaro"];
              unsigned int v20 = v19 + 2;
              uint64_t v14 = *(void *)buf;
            }
            unsigned int v21 = v20 + 1;
            if (*(double *)(v14 + 8 * v20) == 1.0)
            {
              [v13 setObject:[NSNumber numberWithDouble:*((double *)(v14 + 8 * v21))] forKeyedSubscript:@"CurrentBaroAltitude"];
              [v13 setObject:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(*(void *)buf + 8 * (v20 + 2))) forKeyedSubscript:@"CurrentBaroAltitudeUnc"];
              [v13 setObject:[NSNumber numberWithDouble:*((double *)(*(void *)buf + 8 * (v20 + 3)))];
              [v13 setObject:[NSNumber numberWithDouble:*((double *)(*((void *)buf + 8 * (v20 + 4))))] forKeyedSubscript:@"CalibratedAltitudeFromRefPressureAndDEM"];
              [v13 setObject:[NSNumber numberWithDouble:*((double *)(*(void *)buf + 8 * (v20 + 5)))] forKeyedSubscript:@"CalibratedAltitudeFromDEMOnly"];
              [v13 setObject:[NSNumber numberWithDouble:*(double *)(*(void *)buf + 8 * (v20 + 6))] forKeyedSubscript:@"CalibratedAltitudeUpdateTime"];
              [v13 setObject:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(*(void *)buf + 8 * (v20 + 7))) forKeyedSubscript:@"CLBaroBiasCfAbsTime_s"];
              [v13 setObject:[NSNumber numberWithDouble:*((double *)(*(void *)buf + 8 * (v20 + 8)))];
              [v13 setObject:[NSNumber numberWithDouble:*((double *)(*((void *)buf + 8 * (v20 + 9))))) forKeyedSubscript:@"CLBaroBiasUnc_m"];
              unsigned int v21 = v20 + 10;
              uint64_t v14 = *(void *)buf;
            }
            if (*(double *)(v14 + 8 * v21) == 1.0)
            {
              [v13 setObject:[NSNumber numberWithDouble:*((double *)(v14 + 8 * (v21 + 1)))] forKeyedSubscript:@"CurrentWiFiAltitudeTimestamp"];
              [v13 setObject:[NSNumber numberWithDouble:*((double *)(*(void *)buf + 8 * (v21 + 2)))];
              [v13 setObject:[NSNumber numberWithDouble:*((double *)(*(void *)buf + 8 * (v21 + 3)))] forKeyedSubscript:@"CurrentWiFiAltitudeUnc"];
            }
            (*((void (**)(id, void, id))a3 + 2))(a3, 0, v13);

            goto LABEL_46;
          }
          if (qword_102419520 != -1) {
            dispatch_once(&qword_102419520, &stru_10234CA70);
          }
          int v17 = qword_102419528;
          if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int16 v24 = 68289026;
            int v25 = 0;
            __int16 v26 = 2082;
            unint64_t v27 = "";
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi,ZaxisStats,#warning dictionary allocation failed\"}", v24, 0x12u);
          }
        }
      }
      else
      {
        if (qword_102419520 != -1) {
          dispatch_once(&qword_102419520, &stru_10234CA70);
        }
        id v9 = qword_102419528;
        if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int16 v24 = 68289026;
          int v25 = 0;
          __int16 v26 = 2082;
          unint64_t v27 = "";
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Spi,,ZaxisStats,#warning Couldn't get vector capacity to fetch data\"}", v24, 0x12u);
        }
      }
      id v18 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:0 userInfo:0];
      (*((void (**)(id, id, void))a3 + 2))(a3, v18, 0);

LABEL_46:
      if (*(void *)buf)
      {
        *(void *)unsigned int v29 = *(void *)buf;
        operator delete(*(void **)buf);
      }
      goto LABEL_20;
    }
  }
  if (qword_102419520 != -1) {
    dispatch_once(&qword_102419520, &stru_10234CA70);
  }
  id v10 = qword_102419528;
  if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#Spi, connecting process isn't entitled, they shall not pass", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_10234CA70);
    }
    *(_WORD *)__int16 v24 = 0;
    __int16 v22 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLInternalService getZaxisStatsWithReplyBlock:]", "%s\n", v22);
    if (v22 != (char *)buf) {
      free(v22);
    }
  }
  id v11 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.internalservice.errorDomain" code:2 userInfo:0];
  (*((void (**)(id, id, void))a3 + 2))(a3, v11, 0);

LABEL_20:
  os_activity_scope_leave(&state);
}

- (double)groundAltitudeDistanceThreshold
{
  return self->_groundAltitudeDistanceThreshold;
}

- (void)setGroundAltitudeDistanceThreshold:(double)a3
{
  self->_groundAltitudeDistanceThreshold = a3;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

@end