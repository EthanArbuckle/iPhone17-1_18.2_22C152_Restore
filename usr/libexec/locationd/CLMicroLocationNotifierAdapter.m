@interface CLMicroLocationNotifierAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetMicroLocationInternalVersion:(id *)a3;
- (CLMicroLocationNotifierAdapter)init;
- (void)_exportMiloData:(BOOL)a3 withUserIdentifier:(id)a4 WithReply:(id)a5;
- (void)adaptee;
- (void)beginService;
- (void)connectToServiceForClient:(id)a3 withServiceIdentifier:(id)a4 withConnectionToken:(id)a5 forUser:(id)a6;
- (void)createServiceForClient:(id)a3 withServiceType:(unint64_t)a4 locationTypes:(id)a5 connectionToken:(id)a6 forUser:(id)a7;
- (void)deleteServiceForClient:(id)a3 withServiceIdentifier:(id)a4 withConnectionToken:(id)a5 forUser:(id)a6;
- (void)disconnectToServiceForClient:(id)a3 withServiceIdentifier:(id)a4 withConnectionToken:(id)a5 forUser:(id)a6;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)donateTruthTagLabelForClient:(id)a3 truthLabelUUID:(id)a4 betweenDate:(id)a5 andDate:(id)a6 withReply:(id)a7;
- (void)donateTruthTagLabelForClient:(id)a3 truthLabelUUID:(id)a4 recordingTriggerUUID:(id)a5 withReply:(id)a6;
- (void)enableMiLoAtCurrentLocationWithServiceIdentifier:(id)a3 withRequestIdentifier:(id)a4 connectionToken:(id)a5;
- (void)endService;
- (void)exportMicroLocationDataForMigrationWithReply:(id)a3;
- (void)exportMicroLocationDataForMigrationWithUserIdentifier:(id)a3 withReply:(id)a4;
- (void)exportMicroLocationDatabaseTablesWithReply:(id)a3;
- (void)purgeAllMicroLocationData;
- (void)purgeMicroLocationSemiSupervisedDataForClient:(id)a3;
- (void)queryMiloConnectionStatus:(id)a3;
- (void)queryServicesForClient:(id)a3 withConnectionToken:(id)a4 forUser:(id)a5;
- (void)registerForMiloPredictionEventUpdates:(id)a3;
- (void)registerForMiloServiceEventUpdatesForClient:(id)a3 withToken:(id)a4;
- (void)requestAnchorValueStatisticsWithReply:(id)a3;
- (void)requestCurrentMicroLocationForClient:(id)a3 withAdditionalInformation:(id)a4;
- (void)requestCurrentMicroLocationForClient:(id)a3 withAdditionalInformation:(id)a4 withReply:(id)a5;
- (void)requestExportMiLoDatabaseTablesFromClient:(id)a3 withRequestIdentifier:(id)a4 connectionToken:(id)a5;
- (void)requestLabelObservationsForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5 withPlaceIdentifier:(id)a6 betweenStartDate:(id)a7 endDate:(id)a8 withConnectionToken:(id)a9;
- (void)requestLabelSingleObservationForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5 withPlaceIdentifier:(id)a6 withObservationRequestIdentifier:(id)a7 withConnectionToken:(id)a8;
- (void)requestMicroLocationLearningForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5;
- (void)requestMicroLocationLearningForClient_Legacy:(id)a3 withReply:(id)a4;
- (void)requestMicroLocationRecordingScanForClient:(id)a3 withAdditionalInformation:(id)a4 withReply:(id)a5;
- (void)requestObservationForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5 withPlaceIdentifier:(id)a6 withConnectionToken:(id)a7;
- (void)requestPurgeAllMiLoDataFromClient:(id)a3 withRequestIdentifier:(id)a4;
- (void)requestRemoveCustomLoiWithServiceIdentifier:(id)a3 withRequestIdentifier:(id)a4 withLoiIdentifier:(id)a5 withConnectionToken:(id)a6;
- (void)requestRemoveLabelsForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5 withLabels:(id)a6 withConnectionToken:(id)a7;
- (void)requestSingleShotMiLoPredictionForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5 withConnectionToken:(id)a6;
- (void)requestStartUpdatingMicroLocationForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5 withConfiguration:(id)a6 withConnectionToken:(id)a7;
- (void)requestStopUpdatingMicroLocationForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5 withConnectionToken:(id)a6;
- (void)unregisterForMiloPredictionEventUpdates:(id)a3;
- (void)unregisterForMiloServiceEventUpdatesForClient:(id)a3 withToken:(id)a4;
@end

@implementation CLMicroLocationNotifierAdapter

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
  if (qword_102482810 != -1) {
    dispatch_once(&qword_102482810, &stru_102307DF0);
  }
  return (id)qword_102482808;
}

- (CLMicroLocationNotifierAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLMicroLocationNotifierAdapter;
  return [(CLMicroLocationNotifierAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLMicroLocationNotifierProtocol outboundProtocol:&OBJC_PROTOCOL___CLMicroLocationNotifierClientProtocol];
}

- (void)beginService
{
  [(CLNotifierServiceAdapter *)self setAdaptedNotifier:sub_100FAD4A4((uint64_t)[(CLMicroLocationNotifierAdapter *)self universe])];
  if (![(CLNotifierServiceAdapter *)self notifier])
  {
    uint64_t v3 = sub_101A9926C();
    sub_100FAD4A4(v3);
  }
}

- (void)endService
{
  v2 = *(void (**)(void))(*(void *)[(CLNotifierServiceAdapter *)self notifier] + 16);

  v2();
}

- (void)adaptee
{
  result = [(CLNotifierServiceAdapter *)self notifier];
  if (result)
  {
  }
  return result;
}

- (void)doAsync:(id)a3
{
  v4 = [(CLMicroLocationNotifierAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLMicroLocationNotifierAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)registerForMiloServiceEventUpdatesForClient:(id)a3 withToken:(id)a4
{
  v6 = [(CLMicroLocationNotifierAdapter *)self adaptee];

  sub_100FAD704((uint64_t)v6, (uint64_t)a3, a4);
}

- (void)unregisterForMiloServiceEventUpdatesForClient:(id)a3 withToken:(id)a4
{
  unint64_t v5 = [(CLMicroLocationNotifierAdapter *)self adaptee];

  sub_100FADAB0((uint64_t)v5, v6, a4);
}

- (void)registerForMiloPredictionEventUpdates:(id)a3
{
  v4 = [(CLMicroLocationNotifierAdapter *)self adaptee];

  sub_100FADD24((uint64_t)v4, (uint64_t)a3);
}

- (void)unregisterForMiloPredictionEventUpdates:(id)a3
{
  v4 = [(CLMicroLocationNotifierAdapter *)self adaptee];

  sub_100FADF84((uint64_t)v4, (uint64_t)a3);
}

- (void)createServiceForClient:(id)a3 withServiceType:(unint64_t)a4 locationTypes:(id)a5 connectionToken:(id)a6 forUser:(id)a7
{
  sub_100134750(&v13, (char *)[a3 UTF8String]);
  sub_100134750(__p, (char *)[a7 UTF8String]);
  sub_100FAE290((uint64_t)[(CLMicroLocationNotifierAdapter *)self adaptee], &v13, a4, a5, (uint64_t)a6, (uint64_t)__p);
}

- (void)deleteServiceForClient:(id)a3 withServiceIdentifier:(id)a4 withConnectionToken:(id)a5 forUser:(id)a6
{
  sub_100134750(&v12, (char *)[a3 UTF8String]);
  sub_100134750(__p, (char *)[a6 UTF8String]);
  sub_100FAE8AC((uint64_t)[(CLMicroLocationNotifierAdapter *)self adaptee], &v12, a4, (uint64_t)a5, (unsigned __int8 *)__p);
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
}

- (void)queryServicesForClient:(id)a3 withConnectionToken:(id)a4 forUser:(id)a5
{
  sub_100134750(v9, (char *)[a3 UTF8String]);
  sub_100134750(__p, (char *)[a5 UTF8String]);
  sub_100FAEDFC((uint64_t)[(CLMicroLocationNotifierAdapter *)self adaptee], (uint64_t)v9, (uint64_t)a4, (uint64_t)__p);
}

- (void)connectToServiceForClient:(id)a3 withServiceIdentifier:(id)a4 withConnectionToken:(id)a5 forUser:(id)a6
{
  sub_100134750(&v12, (char *)[a3 UTF8String]);
  sub_100134750(__p, (char *)[a6 UTF8String]);
  sub_100FAF158((uint64_t)[(CLMicroLocationNotifierAdapter *)self adaptee], &v12, a4, a5, (const void **)__p);
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
}

- (void)disconnectToServiceForClient:(id)a3 withServiceIdentifier:(id)a4 withConnectionToken:(id)a5 forUser:(id)a6
{
  sub_100134750(&v12, (char *)[a3 UTF8String]);
  sub_100134750(__p, (char *)[a6 UTF8String]);
  sub_100FAF5E8((uint64_t)[(CLMicroLocationNotifierAdapter *)self adaptee], &v12, a4, a5, (unsigned __int8 *)__p);
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
}

- (void)requestSingleShotMiLoPredictionForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5 withConnectionToken:(id)a6
{
  sub_100134750(&__p, (char *)[a3 UTF8String]);
  sub_100FAFA4C((uint64_t)[(CLMicroLocationNotifierAdapter *)self adaptee], &__p, a4, a5);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

- (void)requestObservationForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5 withPlaceIdentifier:(id)a6 withConnectionToken:(id)a7
{
  sub_100134750(&__p, (char *)[a3 UTF8String]);
  sub_100FAFF9C((uint64_t)[(CLMicroLocationNotifierAdapter *)self adaptee], &__p, a4, a5, a6);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

- (void)requestLabelSingleObservationForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5 withPlaceIdentifier:(id)a6 withObservationRequestIdentifier:(id)a7 withConnectionToken:(id)a8
{
  sub_100134750(&__p, (char *)[a3 UTF8String]);
  std::string v13 = [(CLMicroLocationNotifierAdapter *)self adaptee];
  sub_100FB0510((uint64_t)v13, v14, a4, a5, a6, a7);
  if (v16 < 0) {
    operator delete(__p);
  }
}

- (void)requestLabelObservationsForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5 withPlaceIdentifier:(id)a6 betweenStartDate:(id)a7 endDate:(id)a8 withConnectionToken:(id)a9
{
  sub_100134750(&__p, (char *)[a3 UTF8String]);
  v15 = [(CLMicroLocationNotifierAdapter *)self adaptee];
  sub_100FB06DC((uint64_t)v15, v16, a4, a5, a6, (uint64_t)a7, (uint64_t)a8);
}

- (void)requestRemoveLabelsForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5 withLabels:(id)a6 withConnectionToken:(id)a7
{
  sub_100134750(__p, (char *)[a3 UTF8String]);
  sub_100FB08A0((uint64_t)[(CLMicroLocationNotifierAdapter *)self adaptee], (uint64_t *)__p, (uint64_t)a4, a5, (uint64_t)a6);
}

- (void)requestRemoveCustomLoiWithServiceIdentifier:(id)a3 withRequestIdentifier:(id)a4 withLoiIdentifier:(id)a5 withConnectionToken:(id)a6
{
  v9 = [(CLMicroLocationNotifierAdapter *)self adaptee];

  sub_100FB0B74((uint64_t)v9, a3, a4, a5);
}

- (void)requestStartUpdatingMicroLocationForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5 withConfiguration:(id)a6 withConnectionToken:(id)a7
{
  sub_100134750(&__p, (char *)[a3 UTF8String]);
  sub_100FB0D4C((uint64_t)[(CLMicroLocationNotifierAdapter *)self adaptee], &__p, a4, a5, a6);
}

- (void)requestStopUpdatingMicroLocationForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5 withConnectionToken:(id)a6
{
  sub_100134750(&__p, (char *)[a3 UTF8String]);
  sub_100FB10E4((uint64_t)[(CLMicroLocationNotifierAdapter *)self adaptee], &__p, a4, a5);
}

- (void)requestMicroLocationLearningForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5
{
  if (qword_102419450 != -1) {
    dispatch_once(&qword_102419450, &stru_102308378);
  }
  v9 = qword_102419458;
  if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEFAULT))
  {
    std::string __p = (void *)68289026;
    __int16 v12 = 2082;
    std::string v13 = "";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"MicroLocation adapter requestMicroLocationLearningForClient\"}", (uint8_t *)&__p, 0x12u);
  }
  v10 = [(CLMicroLocationNotifierAdapter *)self adaptee];
  sub_100134750(&__p, (char *)[a3 UTF8String]);
  sub_100FB1628((uint64_t)v10, (uint64_t)&__p, a4, a5);
  if (v14 < 0) {
    operator delete(__p);
  }
}

- (void)requestPurgeAllMiLoDataFromClient:(id)a3 withRequestIdentifier:(id)a4
{
  if (qword_102419450 != -1) {
    dispatch_once(&qword_102419450, &stru_102308378);
  }
  v7 = qword_102419458;
  if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEFAULT))
  {
    std::string __p = (void *)68289026;
    __int16 v11 = 2082;
    __int16 v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"MicroLocation adapter requestPurgeAllMiLoData\"}", (uint8_t *)&__p, 0x12u);
  }
  v8 = [(CLMicroLocationNotifierAdapter *)self adaptee];
  sub_100134750(&__p, (char *)[a3 UTF8String]);
  sub_100FB1828((uint64_t)v8, v9, a4);
  if (v13 < 0) {
    operator delete(__p);
  }
}

- (void)requestExportMiLoDatabaseTablesFromClient:(id)a3 withRequestIdentifier:(id)a4 connectionToken:(id)a5
{
  if (qword_102419450 != -1) {
    dispatch_once(&qword_102419450, &stru_102308378);
  }
  v8 = qword_102419458;
  if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEFAULT))
  {
    std::string __p = (void *)68289026;
    __int16 v12 = 2082;
    char v13 = "";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"MicroLocation adapter requestExportMiLoDatabaseTablesFromClient\"}", (uint8_t *)&__p, 0x12u);
  }
  uint64_t v9 = [(CLMicroLocationNotifierAdapter *)self adaptee];
  sub_100134750(&__p, (char *)[a3 UTF8String]);
  sub_100FB1A00((uint64_t)v9, v10, a4);
}

- (void)queryMiloConnectionStatus:(id)a3
{
  uint64_t v3 = [(CLMicroLocationNotifierAdapter *)self adaptee];
  BOOL v4 = sub_1002083F4((uint64_t)v3 + 248);

  sub_100FBBC88((uint64_t)v3, v4);
}

- (void)enableMiLoAtCurrentLocationWithServiceIdentifier:(id)a3 withRequestIdentifier:(id)a4 connectionToken:(id)a5
{
  v8 = [(CLMicroLocationNotifierAdapter *)self adaptee];

  sub_100FB1C9C((uint64_t)v8, a3, a4, a5);
}

- (void)requestCurrentMicroLocationForClient:(id)a3 withAdditionalInformation:(id)a4
{
}

- (void)requestCurrentMicroLocationForClient:(id)a3 withAdditionalInformation:(id)a4 withReply:(id)a5
{
  sub_100134750(&__p, (char *)[a3 UTF8String]);
  sub_100FB1FE8([(CLMicroLocationNotifierAdapter *)self adaptee], &__p, a4, (void (**)(void, void))a5);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

- (void)requestMicroLocationRecordingScanForClient:(id)a3 withAdditionalInformation:(id)a4 withReply:(id)a5
{
  sub_100134750(__p, (char *)[a3 UTF8String]);
  sub_100FB23B4([(CLMicroLocationNotifierAdapter *)self adaptee], (char *)__p, a4, (void (**)(void, void))a5);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
}

- (BOOL)syncgetMicroLocationInternalVersion:(id *)a3
{
  [(CLMicroLocationNotifierAdapter *)self adaptee];
  sub_100FB557C(&__p);
  if (qword_102419450 != -1) {
    dispatch_once(&qword_102419450, &stru_102308378);
  }
  BOOL v4 = qword_102419458;
  if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEFAULT))
  {
    p_p = &__p;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)buf = 68289282;
    int v10 = 0;
    __int16 v11 = 2082;
    __int16 v12 = "";
    __int16 v13 = 2082;
    char v14 = p_p;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"MicroLocation Internal Version request\", \"version\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v6 = &__p;
  }
  else {
    uint64_t v6 = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  *a3 = +[NSString stringWithUTF8String:v6];
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return 1;
}

- (void)_exportMiloData:(BOOL)a3 withUserIdentifier:(id)a4 WithReply:(id)a5
{
  BOOL v6 = a3;
  sub_100134750(&__p, (char *)[a4 UTF8String]);
  sub_100FB2C10((uint64_t)[(CLMicroLocationNotifierAdapter *)self adaptee], v6, v15);
  if (v21)
  {
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_102308378);
    }
    v8 = qword_102419458;
    if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEFAULT))
    {
      char v9 = v15;
      if (v16 < 0) {
        char v9 = *(char **)v15;
      }
      uint64_t buf = 68289282;
      __int16 v29 = 2082;
      v30 = "";
      __int16 v31 = 2082;
      v32 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"MicroLocation DB Tables exported\", \"path\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
    }
    v26[0] = @"FileName";
    if (v18 >= 0) {
      int v10 = &v17;
    }
    else {
      int v10 = v17;
    }
    v27[0] = +[NSString stringWithUTF8String:v10];
    v26[1] = @"ExportDir";
    if (v16 >= 0) {
      __int16 v11 = v15;
    }
    else {
      __int16 v11 = *(char **)v15;
    }
    v27[1] = +[NSString stringWithUTF8String:v11];
    v26[2] = @"SandboxExt";
    if (v20 >= 0) {
      __int16 v12 = &v19;
    }
    else {
      __int16 v12 = v19;
    }
    v27[2] = +[NSString stringWithUTF8String:v12];
    (*((void (**)(id, void, NSDictionary *))a5 + 2))(a5, 0, +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3]);
  }
  else
  {
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_102308378);
    }
    __int16 v13 = qword_102419458;
    if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t buf = 68289026;
      __int16 v29 = 2082;
      v30 = "";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"MicroLocation DB Tables not exported\"}", (uint8_t *)&buf, 0x12u);
    }
    NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
    CFStringRef v25 = @"exportMicroLocationDatabaseTables failed internally.";
    char v14 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    (*((void (**)(id, NSError *, void))a5 + 2))(a5, +[NSError errorWithDomain:kCLErrorDomainPrivate code:5 userInfo:v14], 0);
  }
  sub_100FC0D88((uint64_t)v15);
  if (v23 < 0) {
    operator delete(__p);
  }
}

- (void)exportMicroLocationDatabaseTablesWithReply:(id)a3
{
}

- (void)exportMicroLocationDataForMigrationWithReply:(id)a3
{
}

- (void)exportMicroLocationDataForMigrationWithUserIdentifier:(id)a3 withReply:(id)a4
{
}

- (void)requestAnchorValueStatisticsWithReply:(id)a3
{
  sub_100FB3FC4((uint64_t)[(CLMicroLocationNotifierAdapter *)self adaptee], v23);
  if (v26)
  {
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_102308378);
    }
    BOOL v4 = qword_102419458;
    if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v31 = 2082;
      v32 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"anchor statistics map retrieved\"}", buf, 0x12u);
    }
    unint64_t v5 = +[NSMutableDictionary dictionaryWithCapacity:10 * v25];
    char v21 = (void (**)(id, void, NSMutableDictionary *))a3;
    BOOL v6 = v24;
    if (v24)
    {
      do
      {
        v22 = v6;
        v7 = (uint64_t *)v6[6];
        if (v7)
        {
          v8 = v6 + 2;
          do
          {
            char v9 = sub_100222004(v23, v8);
            if (!v9 || (v10 = v7 + 2, (__int16 v11 = sub_100122860(v9 + 4, (unsigned __int8 *)v7 + 16)) == 0)) {
              sub_10000EDDC("unordered_map::at: key not found");
            }
            double v12 = *((double *)v11 + 6);
            __int16 v13 = sub_100222004(v23, v8);
            if (!v13 || (char v14 = sub_100122860(v13 + 4, (unsigned __int8 *)v7 + 16)) == 0) {
              sub_10000EDDC("unordered_map::at: key not found");
            }
            double v15 = *((double *)v14 + 5);
            sub_1002E8808((uint64_t)v8, (uint64_t)buf);
            if (v33 >= 0) {
              char v16 = buf;
            }
            else {
              char v16 = *(uint8_t **)buf;
            }
            v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v16, v21);
            if (*((char *)v7 + 39) < 0) {
              int v10 = (void *)*v10;
            }
            char v18 = +[NSString stringWithUTF8String:v10];
            if (![(NSMutableDictionary *)v5 objectForKeyedSubscript:v18]) {
              [(NSMutableDictionary *)v5 setObject:+[NSMutableDictionary dictionaryWithCapacity:10] forKeyedSubscript:v18];
            }
            v29[0] = +[NSNumber numberWithDouble:v15];
            v29[1] = +[NSNumber numberWithDouble:v12];
            [(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v18)) setObject:+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 2) forKeyedSubscript:v17];
            if (v33 < 0) {
              operator delete(*(void **)buf);
            }
            v7 = (uint64_t *)*v7;
          }
          while (v7);
        }
        BOOL v6 = (void *)*v22;
      }
      while (*v22);
    }
    v21[2](v21, 0, v5);
  }
  else
  {
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_102308378);
    }
    v19 = qword_102419458;
    if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v31 = 2082;
      v32 = "";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"retrieving anchor statistics map failed\"}", buf, 0x12u);
    }
    NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
    CFStringRef v28 = @"retriving anchor statistics map failed internally.";
    char v20 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    (*((void (**)(id, NSError *, void))a3 + 2))(a3, +[NSError errorWithDomain:kCLErrorDomainPrivate code:5 userInfo:v20], 0);
  }
  if (v26) {
    sub_100289AB8((uint64_t)v23);
  }
}

- (void)requestMicroLocationLearningForClient_Legacy:(id)a3 withReply:(id)a4
{
  sub_100134750(__p, (char *)[a3 UTF8String]);
  sub_100FB44FC((const void **)[(CLMicroLocationNotifierAdapter *)self adaptee], (uint64_t *)__p, a4);
  if (v7 < 0) {
    operator delete(__p[0]);
  }
}

- (void)donateTruthTagLabelForClient:(id)a3 truthLabelUUID:(id)a4 recordingTriggerUUID:(id)a5 withReply:(id)a6
{
  sub_100134750(__p, (char *)[a3 UTF8String]);
  char v10 = sub_100FB4A18((uint64_t)[(CLMicroLocationNotifierAdapter *)self adaptee], (uint64_t)__p, a4, a5);
  if (a6)
  {
    if (v10)
    {
      id v11 = 0;
    }
    else
    {
      id v12 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
      CFStringRef v17 = @"donateTruthTagLabelForClient failed internally";
      __int16 v13 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      id v11 = [v12 initWithDomain:kCLErrorDomainPrivate code:5 userInfo:v13];
    }
    (*((void (**)(id, id))a6 + 2))(a6, v11);
  }
  if (v15 < 0) {
    operator delete(__p[0]);
  }
}

- (void)donateTruthTagLabelForClient:(id)a3 truthLabelUUID:(id)a4 betweenDate:(id)a5 andDate:(id)a6 withReply:(id)a7
{
  sub_100134750(__p, (char *)[a3 UTF8String]);
  char v12 = sub_100FB4D20((uint64_t)[(CLMicroLocationNotifierAdapter *)self adaptee], (uint64_t *)__p, a4, (uint64_t)a5, (uint64_t)a6);
  if (a7)
  {
    if (v12)
    {
      id v13 = 0;
    }
    else
    {
      id v14 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
      CFStringRef v19 = @"donateTruthTagLabelForClient failed internally";
      char v15 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      id v13 = [v14 initWithDomain:kCLErrorDomainPrivate code:5 userInfo:v15];
    }
    (*((void (**)(id, id))a7 + 2))(a7, v13);
  }
  if (v17 < 0) {
    operator delete(__p[0]);
  }
}

- (void)purgeMicroLocationSemiSupervisedDataForClient:(id)a3
{
  sub_100134750(__p, (char *)[a3 UTF8String]);
  sub_100311340((uint64_t)[(CLMicroLocationNotifierAdapter *)self adaptee] + 584, (uint64_t)__p);
  if (v5 < 0) {
    operator delete(__p[0]);
  }
}

- (void)purgeAllMicroLocationData
{
  v2 = [(CLMicroLocationNotifierAdapter *)self adaptee];
  sub_100311188((uint64_t)v2 + 584);

  sub_100FBCBB8((uint64_t)v2);
}

@end