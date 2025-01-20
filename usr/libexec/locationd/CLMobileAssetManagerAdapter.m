@interface CLMobileAssetManagerAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLMobileAssetManagerAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)copyNearbyAssetSettingsOfAccessoryFile:(id)a3 withReply:(id)a4;
- (void)copyNearbyAssetSettingsWithReply:(id)a3;
- (void)copyRoutineAssetSettingsWithReply:(id)a3;
- (void)deleteCurrentAssetFor:(int)a3 withReply:(id)a4;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)getAssetVersionInfoFor:(int)a3 withReply:(id)a4;
@end

@implementation CLMobileAssetManagerAdapter

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
  if (qword_1024881E0 != -1) {
    dispatch_once(&qword_1024881E0, &stru_102329F90);
  }
  return (id)qword_1024881D8;
}

- (CLMobileAssetManagerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLMobileAssetManagerAdapter;
  return [(CLMobileAssetManagerAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLMobileAssetManagerProtocol outboundProtocol:&OBJC_PROTOCOL___CLMobileAssetManagerClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101AB87AC();
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
  v4 = [(CLMobileAssetManagerAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLMobileAssetManagerAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)getAssetVersionInfoFor:(int)a3 withReply:(id)a4
{
  unsigned int v9 = -1;
  unsigned int v10 = -1;
  int v6 = sub_100DD34F4((uint64_t)[(CLNotifierServiceAdapter *)self notifier] + 120, a3, &v10, &v9);
  if (v6) {
    id v7 = 0;
  }
  else {
    id v7 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.MobileAsset" code:1 userInfo:0];
  }
  if (qword_102419600 != -1) {
    dispatch_once(&qword_102419600, &stru_10232A138);
  }
  v8 = qword_102419608;
  if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68290050;
    int v12 = 0;
    __int16 v13 = 2082;
    v14 = "";
    __int16 v15 = 1026;
    int v16 = a3;
    __int16 v17 = 1026;
    int v18 = v6;
    __int16 v19 = 1026;
    unsigned int v20 = v10;
    __int16 v21 = 1026;
    unsigned int v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#CLMAM,getAssetVersionInfo\", \"asset descriptor\":%{public}d, \"successful\":%{public}hhd, \"compatibility version\":%{public}d, \"content version\":%{public}d}", buf, 0x2Au);
  }
  (*((void (**)(id, id, void, void))a4 + 2))(a4, v7, v10, v9);
}

- (void)deleteCurrentAssetFor:(int)a3 withReply:(id)a4
{
  int v5 = sub_100DD371C((uint64_t)[(CLNotifierServiceAdapter *)self notifier] + 120, a3);
  if (v5)
  {
    int v6 = v5;
    if (qword_102419600 != -1) {
      dispatch_once(&qword_102419600, &stru_10232A138);
    }
    id v7 = qword_102419608;
    if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67240192;
      int v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "#CLMAM,deleteCurrentAsset,failed with error,%{public}d", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419600 != -1) {
        dispatch_once(&qword_102419600, &stru_10232A138);
      }
      unsigned int v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobileAssetManagerAdapter deleteCurrentAssetFor:withReply:]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    id v8 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.MobileAsset" code:v6 userInfo:0];
  }
  else
  {
    if (qword_102419600 != -1) {
      dispatch_once(&qword_102419600, &stru_10232A138);
    }
    unsigned int v9 = qword_102419608;
    if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      int v12 = 0;
      __int16 v13 = 2082;
      v14 = "";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#CLMAM,deleteCurrentAsset,succeeded\"}", buf, 0x12u);
    }
    id v8 = 0;
  }
  (*((void (**)(id, id))a4 + 2))(a4, v8);
}

- (void)copyNearbyAssetSettingsWithReply:(id)a3
{
  id v4 = sub_100DD3920((uint64_t)[(CLNotifierServiceAdapter *)self notifier] + 120);
  if (qword_102419600 != -1) {
    dispatch_once(&qword_102419600, &stru_10232A138);
  }
  int v5 = qword_102419608;
  if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#CLMAM,copyNearbyAssetSettingsWithReply,returning dict,%{private}@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419600 != -1) {
      dispatch_once(&qword_102419600, &stru_10232A138);
    }
    int v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobileAssetManagerAdapter copyNearbyAssetSettingsWithReply:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  (*((void (**)(id, id))a3 + 2))(a3, v4);
}

- (void)copyNearbyAssetSettingsOfAccessoryFile:(id)a3 withReply:(id)a4
{
  id v5 = sub_100DD3BFC((uint64_t)[(CLNotifierServiceAdapter *)self notifier] + 120, a3);
  if (qword_102419600 != -1) {
    dispatch_once(&qword_102419600, &stru_10232A138);
  }
  int v6 = qword_102419608;
  if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#CLMAM,copyNearbyAssetSettingsOfAccessoryFileWithReplay,returning dict,%{private}@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419600 != -1) {
      dispatch_once(&qword_102419600, &stru_10232A138);
    }
    id v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobileAssetManagerAdapter copyNearbyAssetSettingsOfAccessoryFile:withReply:]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  (*((void (**)(id, id))a4 + 2))(a4, v5);
}

- (void)copyRoutineAssetSettingsWithReply:(id)a3
{
  unsigned int v7 = -1;
  v8[0] = -1;
  id v4 = sub_100DD3EE0((uint64_t)[(CLNotifierServiceAdapter *)self notifier] + 120, v8, &v7);
  if (qword_102419600 != -1) {
    dispatch_once(&qword_102419600, &stru_10232A138);
  }
  id v5 = qword_102419608;
  if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478339;
    id v15 = v4;
    __int16 v16 = 1026;
    int v17 = v8[0];
    __int16 v18 = 1026;
    unsigned int v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#CLMAM,copyRoutineAssetSettings,returning dict,%{private}@,compatibilityVersion,%{public}d,contentVersion,%{public}d", buf, 0x18u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419600 != -1) {
      dispatch_once(&qword_102419600, &stru_10232A138);
    }
    v8[1] = 138478339;
    id v9 = v4;
    __int16 v10 = 1026;
    int v11 = v8[0];
    __int16 v12 = 1026;
    unsigned int v13 = v7;
    int v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMobileAssetManagerAdapter copyRoutineAssetSettingsWithReply:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  (*((void (**)(id, id, void, void))a3 + 2))(a3, v4, v8[0], v7);
}

@end