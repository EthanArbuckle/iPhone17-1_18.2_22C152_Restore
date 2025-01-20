@interface CLCompanionTransport
+ (id)computeMD5:(id)a3;
- (BOOL)isActive;
- (BOOL)isConnected;
- (BOOL)isNearby;
- (CLCompanionTransport)initWithSilo:(id)a3 iDSService:(id)a4;
- (IDSDevice)pairedDevice;
- (IDSService)idsService;
- (double)pairedDeviceLastNearbyTimestamp;
- (double)pairedDeviceLastSeenTimestamp;
- (id)connectionUpdateHandler;
- (id)deviceNearbyHandler;
- (id)receivedMessageHandler;
- (void)dealloc;
- (void)handleAbsoluteAltitudeSubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleAbsoluteAltitudeUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleCardioChangeUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleColdStorageDataUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleCompanionPingData:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleCompanionPingDataForAbsoluteAltitude:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleContextConfigurationUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleFilteredPressure:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleKappaCollect:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleKappaStop:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleMartyBicycleCollect:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleMartyBicycleStop:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleMartyCollect:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleMartyStop:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleMobilityUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleMotionCalsUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleMotionStateUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleOdometerCoarseElevationData:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleOdometerCoarseElevationSubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleOdometerCoarseElevationUnsubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleOdometerCyclingData:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleOdometerCyclingSubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleOdometerCyclingUnsubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleOdometerElevationData:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleOdometerElevationSubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleOdometerElevationUnsubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handlePredictedWalkDistanceBout:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleRemoteAppLaunch:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleSafetyCompanionHeartbeat:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleStrideCalDataSubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleStrideCalDataUnsubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleVO2MaxCloudKitDailyStats:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleWorkoutDistanceAnalytics:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)receivedMessage:(unsigned __int16)a3 data:(id)a4 identifierString:(id)a5;
- (void)sendMessage:(id)a3 type:(unsigned __int16)a4 priority:(int64_t)a5 fireAndForget:(BOOL)a6 encrypt:(BOOL)a7 bypassConnectionCheck:(BOOL)a8 timeout:(double)a9 nonWaking:(BOOL)a10 completionHandler:(id)a11;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setConnectionUpdateHandler:(id)a3;
- (void)setDeviceNearbyHandler:(id)a3;
- (void)setIdsService:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setIsNearby:(BOOL)a3;
- (void)setPairedDevice:(id)a3;
- (void)setPairedDeviceLastNearbyTimestamp:(double)a3;
- (void)setPairedDeviceLastSeenTimestamp:(double)a3;
- (void)setReceivedMessageHandler:(id)a3;
- (void)updateIDSStatus;
- (void)updateIDSStatusAndNotify;
@end

@implementation CLCompanionTransport

- (CLCompanionTransport)initWithSilo:(id)a3 iDSService:(id)a4
{
  [(CLCompanionTransport *)self setIdsService:a4];
  if (objc_opt_class())
  {
    v13.receiver = self;
    v13.super_class = (Class)CLCompanionTransport;
    v6 = [(CLCompanionTransport *)&v13 init];
    if (v6)
    {
      if (qword_102418FD0 != -1) {
        dispatch_once(&qword_102418FD0, &stru_1022E8A68);
      }
      v7 = qword_102418FD8;
      if (os_log_type_enabled((os_log_t)qword_102418FD8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Creating CLCompanionTransport", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102418FD0 != -1) {
          dispatch_once(&qword_102418FD0, &stru_1022E8A68);
        }
        __int16 v14 = 0;
        v10 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCompanionTransport initWithSilo:iDSService:]", "%s\n", v10);
        if (v10 != (char *)buf) {
          free(v10);
        }
      }
      -[IDSService addDelegate:queue:](v6->_idsService, "addDelegate:queue:", v6, [a3 queue]);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100B7DCEC;
      v12[3] = &unk_10229FED8;
      v12[4] = v6;
      [a3 async:v12];
      [(IDSService *)v6->_idsService setProtobufAction:"handleOdometerCyclingSubscribe:service:account:fromID:context:" forIncomingRequestsOfType:0];
      [(IDSService *)v6->_idsService setProtobufAction:"handleOdometerCyclingUnsubscribe:service:account:fromID:context:" forIncomingRequestsOfType:1];
      [(IDSService *)v6->_idsService setProtobufAction:"handleOdometerCyclingData:service:account:fromID:context:" forIncomingRequestsOfType:2];
      [(IDSService *)v6->_idsService setProtobufAction:"handleOdometerElevationSubscribe:service:account:fromID:context:" forIncomingRequestsOfType:4];
      [(IDSService *)v6->_idsService setProtobufAction:"handleOdometerElevationUnsubscribe:service:account:fromID:context:" forIncomingRequestsOfType:5];
      [(IDSService *)v6->_idsService setProtobufAction:"handleOdometerElevationData:service:account:fromID:context:" forIncomingRequestsOfType:6];
      [(IDSService *)v6->_idsService setProtobufAction:"handleStrideCalDataSubscribe:service:account:fromID:context:" forIncomingRequestsOfType:7];
      [(IDSService *)v6->_idsService setProtobufAction:"handleStrideCalDataUnsubscribe:service:account:fromID:context:" forIncomingRequestsOfType:8];
      [(IDSService *)v6->_idsService setProtobufAction:"handleOdometerCoarseElevationSubscribe:service:account:fromID:context:" forIncomingRequestsOfType:11];
      [(IDSService *)v6->_idsService setProtobufAction:"handleOdometerCoarseElevationUnsubscribe:service:account:fromID:context:" forIncomingRequestsOfType:12];
      [(IDSService *)v6->_idsService setProtobufAction:"handleOdometerCoarseElevationData:service:account:fromID:context:" forIncomingRequestsOfType:13];
      [(IDSService *)v6->_idsService setProtobufAction:"handleMotionCalsUpdate:service:account:fromID:context:" forIncomingRequestsOfType:14];
      [(IDSService *)v6->_idsService setProtobufAction:"handleMotionStateUpdate:service:account:fromID:context:" forIncomingRequestsOfType:18];
      [(IDSService *)v6->_idsService setProtobufAction:"handleRemoteAppLaunch:service:account:fromID:context:" forIncomingRequestsOfType:19];
      [(IDSService *)v6->_idsService setProtobufAction:"handleCompanionPingData:service:account:fromID:context:" forIncomingRequestsOfType:15];
      [(IDSService *)v6->_idsService setProtobufAction:"handleAbsoluteAltitudeUpdate:service:account:fromID:context:" forIncomingRequestsOfType:20];
      [(IDSService *)v6->_idsService setProtobufAction:"handleAbsoluteAltitudeSubscribe:service:account:fromID:context:" forIncomingRequestsOfType:22];
      [(IDSService *)v6->_idsService setProtobufAction:"handleCompanionPingDataForAbsoluteAltitude:service:account:fromID:context:" forIncomingRequestsOfType:23];
      [(IDSService *)v6->_idsService setProtobufAction:"handleFilteredPressure:service:account:fromID:context:" forIncomingRequestsOfType:36];
      [(IDSService *)v6->_idsService setProtobufAction:"handlePredictedWalkDistanceBout:service:account:fromID:context:" forIncomingRequestsOfType:21];
      [(IDSService *)v6->_idsService setProtobufAction:"handleKappaCollect:service:account:fromID:context:" forIncomingRequestsOfType:24];
      [(IDSService *)v6->_idsService setProtobufAction:"handleKappaStop:service:account:fromID:context:" forIncomingRequestsOfType:25];
      [(IDSService *)v6->_idsService setProtobufAction:"handleMartyCollect:service:account:fromID:context:" forIncomingRequestsOfType:26];
      [(IDSService *)v6->_idsService setProtobufAction:"handleMartyStop:service:account:fromID:context:" forIncomingRequestsOfType:27];
      [(IDSService *)v6->_idsService setProtobufAction:"handleMartyBicycleCollect:service:account:fromID:context:" forIncomingRequestsOfType:28];
      [(IDSService *)v6->_idsService setProtobufAction:"handleMartyBicycleStop:service:account:fromID:context:" forIncomingRequestsOfType:29];
      [(IDSService *)v6->_idsService setProtobufAction:"handleSafetyCompanionHeartbeat:service:account:fromID:context:" forIncomingRequestsOfType:30];
      [(IDSService *)v6->_idsService setProtobufAction:"handleVO2MaxCloudKitDailyStats:service:account:fromID:context:" forIncomingRequestsOfType:31];
      [(IDSService *)v6->_idsService setProtobufAction:"handleContextConfigurationUpdate:service:account:fromID:context:" forIncomingRequestsOfType:32];
      [(IDSService *)v6->_idsService setProtobufAction:"handleCardioChangeUpdate:service:account:fromID:context:" forIncomingRequestsOfType:33];
      [(IDSService *)v6->_idsService setProtobufAction:"handleColdStorageDataUpdate:service:account:fromID:context:" forIncomingRequestsOfType:34];
      [(IDSService *)v6->_idsService setProtobufAction:"handleMobilityUpdate:service:account:fromID:context:" forIncomingRequestsOfType:35];
      [(IDSService *)v6->_idsService setProtobufAction:"handleWorkoutDistanceAnalytics:service:account:fromID:context:" forIncomingRequestsOfType:37];
    }
  }
  else
  {
    if (qword_102418FD0 != -1) {
      dispatch_once(&qword_102418FD0, &stru_1022E8A68);
    }
    v8 = qword_102418FD8;
    if (os_log_type_enabled((os_log_t)qword_102418FD8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "IDSService CLCompanionTransport is nil!", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102418FD0 != -1) {
        dispatch_once(&qword_102418FD0, &stru_1022E8A68);
      }
      __int16 v14 = 0;
      v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCompanionTransport initWithSilo:iDSService:]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
    return 0;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLCompanionTransport;
  [(CLCompanionTransport *)&v3 dealloc];
}

- (void)updateIDSStatus
{
  [(CLCompanionTransport *)self setIsConnected:0];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v19 = self;
  id obj = [(IDSService *)[(CLCompanionTransport *)self idsService] devices];
  id v3 = [obj countByEnumeratingWithState:&v21 objects:v37 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v22;
    v6 = &qword_102419000;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v7);
        if (qword_102419210 != -1) {
          dispatch_once(&qword_102419210, &stru_1022E8A88);
        }
        v9 = v6[67];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          id v10 = [[[v8 name] UTF8String];
          v11 = v6;
          unsigned int v12 = [v8 isNearby];
          unsigned int v13 = [v8 isDefaultPairedDevice];
          unsigned int v14 = [v8 isConnected];
          *(_DWORD *)buf = 68290051;
          *(_DWORD *)v28 = 0;
          *(_WORD *)&v28[4] = 2082;
          *(void *)&v28[6] = "";
          __int16 v29 = 2081;
          id v30 = v10;
          __int16 v31 = 1026;
          unsigned int v32 = v12;
          v6 = v11;
          __int16 v33 = 1026;
          unsigned int v34 = v13;
          __int16 v35 = 1026;
          unsigned int v36 = v14;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"updateIDSStatus:\", \"name\":%{private, location:escape_only}s, \"isNearby\":%{public}hhd, \"isDefaultPairedDevice\":%{public}hhd, \"isConnected\":%{public}hhd}", buf, 0x2Eu);
        }
        if ([v8 isDefaultPairedDevice])
        {
          -[CLCompanionTransport setIsNearby:](v19, "setIsNearby:", [v8 isNearby]);
          -[CLCompanionTransport setIsActive:](v19, "setIsActive:", [v8 isActive]);
        }
        if ([v8 isDefaultPairedDevice] && objc_msgSend(v8, "isNearby"))
        {
          [(CLCompanionTransport *)v19 setIsConnected:1];
          [(CLCompanionTransport *)v19 setPairedDevice:v8];
          [(CLCompanionTransport *)v19 setPairedDeviceLastNearbyTimestamp:CFAbsoluteTimeGetCurrent()];
          if (qword_102419210 != -1) {
            dispatch_once(&qword_102419210, &stru_1022E8A88);
          }
          v15 = v6[67];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            id v16 = [[-[IDSDevice modelIdentifier](-[CLCompanionTransport pairedDevice](v19, "pairedDevice"), "modelIdentifier") UTF8String];
            *(_DWORD *)buf = 136315138;
            *(void *)v28 = v16;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Fitness: Companion model is %s", buf, 0xCu);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_102419210 != -1) {
              dispatch_once(&qword_102419210, &stru_1022E8A88);
            }
            id v17 = [[-[IDSDevice modelIdentifier](-[CLCompanionTransport pairedDevice](v19, "pairedDevice")) UTF8String];
            int v25 = 136315138;
            id v26 = v17;
            v18 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCompanionTransport updateIDSStatus]", "%s\n", v18);
            if (v18 != (char *)buf) {
              free(v18);
            }
          }
          return;
        }
        v7 = (char *)v7 + 1;
      }
      while (v4 != v7);
      id v4 = [obj countByEnumeratingWithState:&v21 objects:v37 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
}

- (void)updateIDSStatusAndNotify
{
  unsigned int v3 = [(CLCompanionTransport *)self isConnected];
  [(CLCompanionTransport *)self updateIDSStatus];
  if (v3 != [(CLCompanionTransport *)self isConnected])
  {
    if (qword_102419210 != -1) {
      dispatch_once(&qword_102419210, &stru_1022E8A88);
    }
    id v4 = qword_102419218;
    if (os_log_type_enabled((os_log_t)qword_102419218, OS_LOG_TYPE_DEFAULT))
    {
      if (v3) {
        uint64_t v5 = "true";
      }
      else {
        uint64_t v5 = "false";
      }
      if ([(CLCompanionTransport *)self isConnected]) {
        v6 = "true";
      }
      else {
        v6 = "false";
      }
      *(_DWORD *)buf = 136315394;
      v11 = v5;
      __int16 v12 = 2080;
      unsigned int v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "prevConnectedState,%s,currConnectedState,%s", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419210 != -1) {
        dispatch_once(&qword_102419210, &stru_1022E8A88);
      }
      [(CLCompanionTransport *)self isConnected];
      v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCompanionTransport updateIDSStatusAndNotify]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
    if (![(CLCompanionTransport *)self isConnected]) {
      [(CLCompanionTransport *)self setPairedDeviceLastSeenTimestamp:CFAbsoluteTimeGetCurrent()];
    }
    if ([(CLCompanionTransport *)self connectionUpdateHandler])
    {
      v7 = [(CLCompanionTransport *)self connectionUpdateHandler];
      v7[2](v7, [(CLCompanionTransport *)self isConnected]);
    }
    if ([(CLCompanionTransport *)self deviceNearbyHandler])
    {
      v8 = [(CLCompanionTransport *)self deviceNearbyHandler];
      v8[2](v8, [(CLCompanionTransport *)self isNearby]);
    }
  }
}

- (void)sendMessage:(id)a3 type:(unsigned __int16)a4 priority:(int64_t)a5 fireAndForget:(BOOL)a6 encrypt:(BOOL)a7 bypassConnectionCheck:(BOOL)a8 timeout:(double)a9 nonWaking:(BOOL)a10 completionHandler:(id)a11
{
  BOOL v12 = a8;
  BOOL v13 = a7;
  BOOL v14 = a6;
  uint64_t v16 = a4;
  [(CLCompanionTransport *)self updateIDSStatusAndNotify];
  if ([(CLCompanionTransport *)self isConnected] || v12)
  {
    BOOL v20 = a10;
    id v38 = 0;
    uint64_t v39 = 0;
    id v21 = [objc_alloc((Class)IDSProtobuf) initWithProtobufData:a3 type:v16 isResponse:0];
    v62[0] = IDSSendMessageOptionTimeoutKey;
    v63[0] = +[NSNumber numberWithDouble:a9];
    v63[1] = &__kCFBooleanTrue;
    v62[1] = IDSSendMessageOptionLocalDeliveryKey;
    v62[2] = IDSSendMessageOptionFireAndForgetKey;
    v63[2] = +[NSNumber numberWithBool:v14];
    v62[3] = IDSSendMessageOptionEncryptPayloadKey;
    v63[3] = +[NSNumber numberWithBool:v13];
    v62[4] = IDSSendMessageOptionNonWakingKey;
    v63[4] = +[NSNumber numberWithBool:a10];
    long long v22 = CKSyncEngine_ptr;
    long long v23 = +[NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:5];
    long long v24 = [(CLCompanionTransport *)self idsService];
    id v25 = [(IDSService *)v24 sendProtobuf:v21 toDestinations:+[NSSet setWithObject:IDSDefaultPairedDevice] priority:a5 options:v23 identifier:&v38 error:&v39];
    if (qword_102419210 != -1) {
      dispatch_once(&qword_102419210, &stru_1022E8A88);
    }
    id v26 = qword_102419218;
    if (os_log_type_enabled((os_log_t)qword_102419218, OS_LOG_TYPE_DEBUG))
    {
      id v27 = v25;
      id v28 = [v38 UTF8String];
      id v29 = [v21 data].length;
      id v30 = [[+[CLCompanionTransport computeMD5:](CLCompanionTransport, "computeMD5:", a3) UTF8String];
      *(_DWORD *)buf = 136316162;
      id v53 = v28;
      id v25 = v27;
      __int16 v54 = 2048;
      id v55 = v29;
      long long v22 = CKSyncEngine_ptr;
      __int16 v56 = 1024;
      int v57 = v16;
      __int16 v58 = 1024;
      int v59 = (int)v27;
      __int16 v60 = 2080;
      id v61 = v30;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Sending protobuf ID:%s size: %lu type: %d over IDSService - Status %d, md5 %s", buf, 0x2Cu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      id v33 = v25;
      if (qword_102419210 != -1) {
        dispatch_once(&qword_102419210, &stru_1022E8A88);
      }
      id v34 = [v38 UTF8String];
      id v35 = [objc_msgSend(v21, "data") length];
      id v36 = [[+[CLCompanionTransport computeMD5:](CLCompanionTransport, "computeMD5:", a3) UTF8String];
      int v42 = 136316162;
      id v43 = v34;
      __int16 v44 = 2048;
      id v45 = v35;
      __int16 v46 = 1024;
      int v47 = v16;
      __int16 v48 = 1024;
      id v25 = v33;
      int v49 = (int)v33;
      __int16 v50 = 2080;
      id v51 = v36;
      v37 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCompanionTransport sendMessage:type:priority:fireAndForget:encrypt:bypassConnectionCheck:timeout:nonWaking:completionHandler:]", "%s\n", v37);
      if (v37 != (char *)buf) {
        free(v37);
      }
      BOOL v20 = a10;
      long long v22 = CKSyncEngine_ptr;
    }
    if (v16 != 20)
    {
      v40[0] = @"type";
      v41[0] = +[NSNumber numberWithUnsignedShort:v16];
      v40[1] = @"nonWaking";
      __int16 v31 = +[NSNumber numberWithBool:v20];
      v40[2] = @"action";
      v41[1] = v31;
      v41[2] = &off_102393080;
      sub_1000FC494((uint64_t)[v22[312] dictionaryWithObjects:v41 forKeys:v40 count:3], (uint64_t)"MotionPacket");
    }

    if (a11) {
      (*((void (**)(id, id, uint64_t))a11 + 2))(a11, v25, v39);
    }
  }
  else
  {
    if (qword_102419210 != -1) {
      dispatch_once(&qword_102419210, &stru_1022E8A88);
    }
    v19 = qword_102419218;
    if (os_log_type_enabled((os_log_t)qword_102419218, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "No device locally connected - Ignore sending data", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419210 != -1) {
        dispatch_once(&qword_102419210, &stru_1022E8A88);
      }
      LOWORD(v42) = 0;
      unsigned int v32 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCompanionTransport sendMessage:type:priority:fireAndForget:encrypt:bypassConnectionCheck:timeout:nonWaking:completionHandler:]", "%s\n", v32);
      if (v32 != (char *)buf) {
        free(v32);
      }
    }
    if (a11) {
      (*((void (**)(id, void, void))a11 + 2))(a11, 0, 0);
    }
  }
}

- (void)receivedMessage:(unsigned __int16)a3 data:(id)a4 identifierString:(id)a5
{
  uint64_t v7 = a3;
  if (qword_102419210 != -1) {
    dispatch_once(&qword_102419210, &stru_1022E8A88);
  }
  v9 = qword_102419218;
  if (os_log_type_enabled((os_log_t)qword_102419218, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    id v25 = [a5 UTF8String];
    __int16 v26 = 1024;
    int v27 = v7;
    __int16 v28 = 2048;
    id v29 = [a4 length];
    __int16 v30 = 2080;
    id v31 = [[+[CLCompanionTransport computeMD5:](CLCompanionTransport, "computeMD5:", a4) UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Received message ID:%s, type:%d, size %lu, md5 %s", buf, 0x26u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419210 != -1) {
      dispatch_once(&qword_102419210, &stru_1022E8A88);
    }
    int v16 = 136315906;
    id v17 = [a5 UTF8String];
    __int16 v18 = 1024;
    int v19 = v7;
    __int16 v20 = 2048;
    id v21 = [a4 length];
    __int16 v22 = 2080;
    id v23 = [[+[CLCompanionTransport computeMD5:](CLCompanionTransport, "computeMD5:", a4) UTF8String];
    BOOL v12 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCompanionTransport receivedMessage:data:identifierString:]", "%s\n", v12);
    if (v12 != (char *)buf) {
      free(v12);
    }
  }
  if (v7 != 20)
  {
    v14[0] = @"type";
    v14[1] = @"action";
    v15[0] = +[NSNumber numberWithUnsignedShort:v7];
    v15[1] = &off_102393098;
    sub_1000FC494((uint64_t)+[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2], (uint64_t)"MotionPacket");
  }
  if (![(CLCompanionTransport *)self isConnected])
  {
    if (qword_102419210 != -1) {
      dispatch_once(&qword_102419210, &stru_1022E8A88);
    }
    id v10 = qword_102419218;
    if (os_log_type_enabled((os_log_t)qword_102419218, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Unexpected message received while disconnected. Updating status.", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419210 != -1) {
        dispatch_once(&qword_102419210, &stru_1022E8A88);
      }
      LOWORD(v16) = 0;
      BOOL v13 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCompanionTransport receivedMessage:data:identifierString:]", "%s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
    [(CLCompanionTransport *)self updateIDSStatusAndNotify];
  }
  if ([(CLCompanionTransport *)self receivedMessageHandler])
  {
    v11 = [(CLCompanionTransport *)self receivedMessageHandler];
    v11[2](v11, v7, a4);
  }
}

- (void)handleKappaCollect:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = [a3 data];
  id v10 = [a7 outgoingResponseIdentifier];

  [(CLCompanionTransport *)self receivedMessage:24 data:v9 identifierString:v10];
}

- (void)handleKappaStop:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8 = [a7 outgoingResponseIdentifier:a3, a4, a5, a6];

  [(CLCompanionTransport *)self receivedMessage:25 data:0 identifierString:v8];
}

- (void)handleMartyCollect:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = [a3 data];
  id v10 = [a7 outgoingResponseIdentifier];

  [(CLCompanionTransport *)self receivedMessage:26 data:v9 identifierString:v10];
}

- (void)handleMartyStop:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8 = [a7 outgoingResponseIdentifier:a3, a4, a5, a6];

  [(CLCompanionTransport *)self receivedMessage:27 data:0 identifierString:v8];
}

- (void)handleMartyBicycleCollect:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = [a3 data];
  id v10 = [a7 outgoingResponseIdentifier];

  [(CLCompanionTransport *)self receivedMessage:28 data:v9 identifierString:v10];
}

- (void)handleMartyBicycleStop:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8 = [a7 outgoingResponseIdentifier:a3, a4, a5, a6];

  [(CLCompanionTransport *)self receivedMessage:29 data:0 identifierString:v8];
}

- (void)handleSafetyCompanionHeartbeat:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = [a3 data];
  id v10 = [a7 outgoingResponseIdentifier];

  [(CLCompanionTransport *)self receivedMessage:30 data:v9 identifierString:v10];
}

- (void)handleOdometerCyclingSubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8 = [a7 outgoingResponseIdentifier:a3, a4, a5, a6];

  [(CLCompanionTransport *)self receivedMessage:0 data:0 identifierString:v8];
}

- (void)handleOdometerCyclingUnsubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8 = [a7 outgoingResponseIdentifier:a3, a4, a5, a6];

  [(CLCompanionTransport *)self receivedMessage:1 data:0 identifierString:v8];
}

- (void)handleOdometerCyclingData:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = [a3 data];
  id v10 = [a7 outgoingResponseIdentifier];

  [(CLCompanionTransport *)self receivedMessage:2 data:v9 identifierString:v10];
}

- (void)handleOdometerElevationSubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8 = [a7 outgoingResponseIdentifier:a3, a4, a5, a6];

  [(CLCompanionTransport *)self receivedMessage:4 data:0 identifierString:v8];
}

- (void)handleOdometerElevationUnsubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8 = [a7 outgoingResponseIdentifier:a3, a4, a5, a6];

  [(CLCompanionTransport *)self receivedMessage:5 data:0 identifierString:v8];
}

- (void)handleOdometerElevationData:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = [a3 data];
  id v10 = [a7 outgoingResponseIdentifier];

  [(CLCompanionTransport *)self receivedMessage:6 data:v9 identifierString:v10];
}

- (void)handleStrideCalDataSubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = [a3 data];
  id v10 = [a7 outgoingResponseIdentifier];

  [(CLCompanionTransport *)self receivedMessage:7 data:v9 identifierString:v10];
}

- (void)handleStrideCalDataUnsubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8 = [a7 outgoingResponseIdentifier:a3 :a4 :a5 :a6];

  [(CLCompanionTransport *)self receivedMessage:8 data:0 identifierString:v8];
}

- (void)handleOdometerCoarseElevationSubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8 = [a7 outgoingResponseIdentifier:a3 :a4 :a5 :a6];

  [(CLCompanionTransport *)self receivedMessage:11 data:0 identifierString:v8];
}

- (void)handleOdometerCoarseElevationUnsubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8 = [a7 outgoingResponseIdentifier:a3, a4, a5, a6];

  [(CLCompanionTransport *)self receivedMessage:12 data:0 identifierString:v8];
}

- (void)handleOdometerCoarseElevationData:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = [a3 data];
  id v10 = [a7 outgoingResponseIdentifier];

  [(CLCompanionTransport *)self receivedMessage:13 data:v9 identifierString:v10];
}

- (void)handleMotionCalsUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = [a3 data];
  id v10 = [a7 outgoingResponseIdentifier];

  [(CLCompanionTransport *)self receivedMessage:14 data:v9 identifierString:v10];
}

- (void)handleCompanionPingData:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = [a3 data];
  id v10 = [a7 outgoingResponseIdentifier];

  [(CLCompanionTransport *)self receivedMessage:15 data:v9 identifierString:v10];
}

- (void)handleMotionStateUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = [a3 data];
  id v10 = [a7 outgoingResponseIdentifier];

  [(CLCompanionTransport *)self receivedMessage:18 data:v9 identifierString:v10];
}

- (void)handleRemoteAppLaunch:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = [a3 data];
  id v10 = [a7 outgoingResponseIdentifier];

  [(CLCompanionTransport *)self receivedMessage:19 data:v9 identifierString:v10];
}

- (void)handleAbsoluteAltitudeUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = [a3 data];
  id v10 = [a7 outgoingResponseIdentifier];

  [(CLCompanionTransport *)self receivedMessage:20 data:v9 identifierString:v10];
}

- (void)handleAbsoluteAltitudeSubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = [a3 data];
  id v10 = [a7 outgoingResponseIdentifier];

  [(CLCompanionTransport *)self receivedMessage:22 data:v9 identifierString:v10];
}

- (void)handleFilteredPressure:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = [a3 data];
  id v10 = [a7 outgoingResponseIdentifier];

  [(CLCompanionTransport *)self receivedMessage:36 data:v9 identifierString:v10];
}

- (void)handlePredictedWalkDistanceBout:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = [a3 data];
  id v10 = [a7 outgoingResponseIdentifier];

  [(CLCompanionTransport *)self receivedMessage:21 data:v9 identifierString:v10];
}

- (void)handleCompanionPingDataForAbsoluteAltitude:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = [a3 data];
  id v10 = [a7 outgoingResponseIdentifier];

  [(CLCompanionTransport *)self receivedMessage:23 data:v9 identifierString:v10];
}

- (void)handleVO2MaxCloudKitDailyStats:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = [a3 data];
  id v10 = [a7 outgoingResponseIdentifier];

  [(CLCompanionTransport *)self receivedMessage:31 data:v9 identifierString:v10];
}

- (void)handleContextConfigurationUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = [a3 data];
  id v10 = [a7 outgoingResponseIdentifier];

  [(CLCompanionTransport *)self receivedMessage:32 data:v9 identifierString:v10];
}

- (void)handleCardioChangeUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = [a3 data];
  id v10 = [a7 outgoingResponseIdentifier];

  [(CLCompanionTransport *)self receivedMessage:33 data:v9 identifierString:v10];
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  if (qword_102419210 != -1) {
    dispatch_once(&qword_102419210, &stru_1022E8A88);
  }
  id v8 = qword_102419218;
  if (os_log_type_enabled((os_log_t)qword_102419218, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    id v11 = [a5 length];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Received data over IDSService size : %ld", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419210 != -1) {
      dispatch_once(&qword_102419210, &stru_1022E8A88);
    }
    [a5 length];
    id v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCompanionTransport service:account:incomingData:fromID:context:]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  if (qword_102419210 != -1) {
    dispatch_once(&qword_102419210, &stru_1022E8A88);
  }
  id v9 = qword_102419218;
  if (os_log_type_enabled((os_log_t)qword_102419218, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v12 = [[objc_msgSend(a7, "outgoingResponseIdentifier") UTF8String];
    __int16 v13 = 2048;
    id v14 = [objc_msgSend(a5, "data") length];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Received unhandled protobuf ID:%s, size:%lu", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419210 != -1) {
      dispatch_once(&qword_102419210, &stru_1022E8A88);
    }
    [objc_msgSend(a7, "outgoingResponseIdentifier") UTF8String];
    [objc_msgSend(a5, "data") length];
    id v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCompanionTransport service:account:incomingUnhandledProtobuf:fromID:context:]", "%s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  if (qword_102419210 != -1) {
    dispatch_once(&qword_102419210, &stru_1022E8A88);
  }
  id v10 = qword_102419218;
  if (os_log_type_enabled((os_log_t)qword_102419218, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    id v13 = [a5 UTF8String];
    __int16 v14 = 1024;
    BOOL v15 = v8;
    __int16 v16 = 2080;
    id v17 = [[objc_msgSend(a7, "localizedDescription") UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Service sent data with ID:%s with success %d error %s", buf, 0x1Cu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419210 != -1) {
      dispatch_once(&qword_102419210, &stru_1022E8A88);
    }
    [a5 UTF8String];
    [objc_msgSend(a7, "localizedDescription") UTF8String];
    id v11 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCompanionTransport service:account:identifier:didSendWithSuccess:error:]", "%s\n", v11);
    if (v11 != (char *)buf) {
      free(v11);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  if (qword_102419210 != -1) {
    dispatch_once(&qword_102419210, &stru_1022E8A88);
  }
  uint64_t v7 = qword_102419218;
  if (os_log_type_enabled((os_log_t)qword_102419218, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v10 = [a5 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Service data ack on otherside with ID:%s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419210 != -1) {
      dispatch_once(&qword_102419210, &stru_1022E8A88);
    }
    [a5 UTF8String];
    BOOL v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLCompanionTransport service:account:identifier:hasBeenDeliveredWithContext:]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
}

- (void)handleColdStorageDataUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = [a3 data];
  id v10 = [a7 outgoingResponseIdentifier];

  [(CLCompanionTransport *)self receivedMessage:34 data:v9 identifierString:v10];
}

- (void)handleMobilityUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = [a3 data];
  id v10 = [a7 outgoingResponseIdentifier];

  [(CLCompanionTransport *)self receivedMessage:35 data:v9 identifierString:v10];
}

- (void)handleWorkoutDistanceAnalytics:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = [a3 data];
  id v10 = [a7 outgoingResponseIdentifier];

  [(CLCompanionTransport *)self receivedMessage:37 data:v9 identifierString:v10];
}

+ (id)computeMD5:(id)a3
{
  CC_MD5([a3 bytes], (CC_LONG)[a3 length], md);
  unsigned int v3 = +[NSMutableString stringWithCapacity:32];
  for (uint64_t i = 0; i != 16; ++i)
    [(NSMutableString *)v3 appendFormat:@"%02x", md[i]];
  return v3;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (IDSDevice)pairedDevice
{
  return (IDSDevice *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPairedDevice:(id)a3
{
}

- (double)pairedDeviceLastSeenTimestamp
{
  return self->_pairedDeviceLastSeenTimestamp;
}

- (void)setPairedDeviceLastSeenTimestamp:(double)a3
{
  self->_pairedDeviceLastSeenTimestamp = a3;
}

- (id)receivedMessageHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setReceivedMessageHandler:(id)a3
{
}

- (id)connectionUpdateHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setConnectionUpdateHandler:(id)a3
{
}

- (id)deviceNearbyHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setDeviceNearbyHandler:(id)a3
{
}

- (BOOL)isNearby
{
  return self->_isNearby;
}

- (void)setIsNearby:(BOOL)a3
{
  self->_isNearby = a3;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (double)pairedDeviceLastNearbyTimestamp
{
  return self->_pairedDeviceLastNearbyTimestamp;
}

- (void)setPairedDeviceLastNearbyTimestamp:(double)a3
{
  self->_pairedDeviceLastNearbyTimestamp = a3;
}

- (IDSService)idsService
{
  return (IDSService *)objc_getProperty(self, a2, 64, 1);
}

- (void)setIdsService:(id)a3
{
}

@end