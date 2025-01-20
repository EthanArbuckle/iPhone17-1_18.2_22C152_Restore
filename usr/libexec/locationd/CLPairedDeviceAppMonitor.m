@interface CLPairedDeviceAppMonitor
- (ACXDeviceConnection)deviceConnection;
- (BOOL)valid;
- (CLIntersiloUniverse)universe;
- (CLPairedDeviceAppMonitor)initWithAppMonitor:(void *)a3 inUniverse:(id)a4;
- (NRPairedDeviceRegistry)pairedDeviceRegistry;
- (NSMutableSet)pairedDeviceIds;
- (NSObject)pairNotificationRegistrationToken;
- (NSObject)unpairNotificationRegistrationToken;
- (id)getLocationUsageDescriptionKeys:(id)a3;
- (void)appMonitor;
- (void)applicationsInstalled:(id)a3 onDeviceWithPairingID:(id)a4;
- (void)applicationsUninstalled:(id)a3 onDeviceWithPairingID:(id)a4;
- (void)applicationsUpdated:(id)a3 onDeviceWithPairingID:(id)a4;
- (void)computeAllowableAuthorizationMaskForApplication:(id)a3 pairingID:(id)a4;
- (void)dealloc;
- (void)handlePairToDeviceWithPairingID:(id)a3;
- (void)handleUnpairFromDeviceWithPairingID:(id)a3;
- (void)invalidate;
- (void)isAppInstalled:(id)a3 completion:(id)a4;
- (void)setAppMonitor:(void *)a3;
- (void)setDeviceConnection:(id)a3;
- (void)setPairNotificationRegistrationToken:(id)a3;
- (void)setPairedDeviceIds:(id)a3;
- (void)setPairedDeviceRegistry:(id)a3;
- (void)setUniverse:(id)a3;
- (void)setUnpairNotificationRegistrationToken:(id)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation CLPairedDeviceAppMonitor

- (CLPairedDeviceAppMonitor)initWithAppMonitor:(void *)a3 inUniverse:(id)a4
{
  v30.receiver = self;
  v30.super_class = (Class)CLPairedDeviceAppMonitor;
  v6 = [(CLPairedDeviceAppMonitor *)&v30 init];
  if (!v6) {
    return v6;
  }
  sub_100103240();
  if (!sub_100106424())
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102318608);
    }
    v15 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      id buf = (id)68289026;
      __int16 v32 = 2082;
      v33 = "";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SuperRobin Not creating CLPairedDeviceAppMonitor because this device annot be a companion\"}", (uint8_t *)&buf, 0x12u);
    }
    goto LABEL_28;
  }
  if (!objc_opt_class() || !objc_opt_class())
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102318608);
    }
    v16 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      BOOL v17 = objc_opt_class() != 0;
      BOOL v18 = objc_opt_class() != 0;
      id buf = (id)68289538;
      __int16 v32 = 2082;
      v33 = "";
      __int16 v34 = 1026;
      *(_DWORD *)v35 = v17;
      *(_WORD *)&v35[4] = 1026;
      *(_DWORD *)&v35[6] = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#SuperRobin Not creating CLPairedDeviceAppMonitor because a required class is missing!?\", \"ACXDeviceConnection\":%{public}hhd, \"NRPairedDeviceRegistry\":%{public}hhd}", (uint8_t *)&buf, 0x1Eu);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_102318608);
      }
    }
    v19 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      BOOL v20 = objc_opt_class() != 0;
      BOOL v21 = objc_opt_class() != 0;
      id buf = (id)68289538;
      __int16 v32 = 2082;
      v33 = "";
      __int16 v34 = 1026;
      *(_DWORD *)v35 = v20;
      *(_WORD *)&v35[4] = 1026;
      *(_DWORD *)&v35[6] = v21;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#SuperRobin Not creating CLPairedDeviceAppMonitor because a required class is missing!?", "{\"msg%{public}.0s\":\"#SuperRobin Not creating CLPairedDeviceAppMonitor because a required class is missing!?\", \"ACXDeviceConnection\":%{public}hhd, \"NRPairedDeviceRegistry\":%{public}hhd}", (uint8_t *)&buf, 0x1Eu);
    }
    goto LABEL_28;
  }
  +[ACXDeviceConnection sharedDeviceConnection];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102318608);
    }
    v22 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      id buf = (id)68289026;
      __int16 v32 = 2082;
      v33 = "";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SuperRobin Not creating CLPairedDeviceAppMonitor because AppConduit lacks the features we need\"}", (uint8_t *)&buf, 0x12u);
    }
LABEL_28:

    return 0;
  }
  v7 = _os_activity_create((void *)&_mh_execute_header, "CL: #SuperRobin Starting CLPairedDeviceAppMonitor", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);

  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_102318608);
  }
  v8 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    id buf = (id)68289282;
    __int16 v32 = 2082;
    v33 = "";
    __int16 v34 = 2082;
    *(void *)v35 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SuperRobin Starting CLPairedDeviceAppMonitor\", \"event\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
  }
  v6->_appMonitor = a3;
  v9 = (CLIntersiloUniverse *)a4;
  v6->_universe = v9;
  [[-[CLIntersiloUniverse silo](v9, "silo") assertInside];
  v6->_pairedDeviceIds = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  v6->_pairedDeviceRegistry = +[NRPairedDeviceRegistry sharedInstance];
  id v10 = objc_alloc_init((Class)NSOperationQueue);
  [v10 setName:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%p.CLPairedDeviceAppMonitor.queue", v6)];
  [v10 setUnderlyingQueue:[-[CLIntersiloUniverse silo](v6->_universe, "silo") queue]];
  objc_initWeak(&buf, v6);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_101204658;
  v27[3] = &unk_102318250;
  objc_copyWeak(&v28, &buf);
  v27[4] = v6;
  v11 = +[NSNotificationCenter defaultCenter];
  v6->_unpairNotificationRegistrationToken = [(NSNotificationCenter *)v11 addObserverForName:NRPairedDeviceRegistryDeviceDidUnpairNotification object:v6->_pairedDeviceRegistry queue:v10 usingBlock:v27];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_101204848;
  v25[3] = &unk_102318250;
  objc_copyWeak(&v26, &buf);
  v25[4] = v6;
  v12 = +[NSNotificationCenter defaultCenter];
  v6->_pairNotificationRegistrationToken = [(NSNotificationCenter *)v12 addObserverForName:NRPairedDeviceRegistryDeviceDidPairNotification object:v6->_pairedDeviceRegistry queue:v10 usingBlock:v25];
  id v13 = [(CLIntersiloUniverse *)v6->_universe silo];
  pairedDeviceRegistry = v6->_pairedDeviceRegistry;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_101204A38;
  v24[3] = &unk_102318278;
  v24[4] = v13;
  v24[5] = v6;
  [(NRPairedDeviceRegistry *)pairedDeviceRegistry getDevicesWithBlock:v24];
  v6->_valid = 1;
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&buf);
  os_activity_scope_leave(&state);
  return v6;
}

- (void)dealloc
{
  if (self->_valid)
  {
    v2 = (CLPairedDeviceAppMonitor *)sub_101AA72CC();
    [(CLPairedDeviceAppMonitor *)v2 invalidate];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)CLPairedDeviceAppMonitor;
    [(CLPairedDeviceAppMonitor *)&v4 dealloc];
  }
}

- (void)invalidate
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_102318608);
  }
  SEL v3 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SuperRobin Shutting down CLPairedDeviceAppMonitor\"}", (uint8_t *)v4, 0x12u);
  }
  self->_valid = 0;
  self->_appMonitor = 0;
  [self->_universe silo] assertInside;

  self->_universe = 0;
  self->_pairedDeviceIds = 0;
  [(ACXDeviceConnection *)self->_deviceConnection removeObserver:self];

  self->_deviceConnection = 0;
  self->_pairedDeviceRegistry = 0;
  [+[NSNotificationCenter defaultCenter] removeObserver:self->_unpairNotificationRegistrationToken];

  self->_unpairNotificationRegistrationToken = 0;
  [+[NSNotificationCenter defaultCenter] removeObserver:self->_pairNotificationRegistrationToken];

  self->_pairNotificationRegistrationToken = 0;
}

- (void)handlePairToDeviceWithPairingID:(id)a3
{
  id v6 = [[-[CLIntersiloUniverse silo](self->_universe, "silo") assertInside];
  if (self->_valid)
  {
    v7 = _os_activity_create((void *)&_mh_execute_header, "CL: #SuperRobin Pair detected", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v7, &v11);

    SEL v3 = &qword_102419000;
    if (qword_102419530 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    sub_101AA7434(v6);
    __break(1u);
  }
  dispatch_once(&qword_102419530, &stru_102318608);
LABEL_3:
  v8 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 68289538;
    int v13 = 0;
    __int16 v14 = 2082;
    v15 = "";
    __int16 v16 = 2082;
    BOOL v17 = "activity";
    __int16 v18 = 2114;
    id v19 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SuperRobin Pair detected\", \"event\":%{public, location:escape_only}s, \"pairingID\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  if (!self->_deviceConnection)
  {
    if (v3[166] != -1) {
      dispatch_once(&qword_102419530, &stru_102318608);
    }
    v9 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 68289026;
      int v13 = 0;
      __int16 v14 = 2082;
      v15 = "";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SuperRobin Subscribing to ACXDeviceConnection\"}", buf, 0x12u);
    }
    id v10 = (ACXDeviceConnection *)+[ACXDeviceConnection sharedDeviceConnection];
    self->_deviceConnection = v10;
    [(ACXDeviceConnection *)v10 addObserver:self];
  }
  [(NSMutableSet *)self->_pairedDeviceIds addObject:a3];
  os_activity_scope_leave(&v11);
}

- (void)handleUnpairFromDeviceWithPairingID:(id)a3
{
  id v6 = [[-[CLIntersiloUniverse silo](self->_universe, "silo") assertInside];
  if (self->_valid)
  {
    v7 = _os_activity_create((void *)&_mh_execute_header, "CL: #SuperRobin Unpair detected", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v7, &v10);

    SEL v3 = &qword_102419000;
    if (qword_102419530 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    sub_101AA75A4(v6);
    __break(1u);
  }
  dispatch_once(&qword_102419530, &stru_102318608);
LABEL_3:
  v8 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 68289538;
    int v12 = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2082;
    __int16 v16 = "activity";
    __int16 v17 = 2114;
    id v18 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SuperRobin Unpair detected\", \"event\":%{public, location:escape_only}s, \"pairingID\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  [(NSMutableSet *)self->_pairedDeviceIds removeObject:a3];
  if (![(NSMutableSet *)self->_pairedDeviceIds count])
  {
    if (v3[166] != -1) {
      dispatch_once(&qword_102419530, &stru_102318608);
    }
    v9 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 68289026;
      int v12 = 0;
      __int16 v13 = 2082;
      __int16 v14 = "";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SuperRobin Unsubscribing from ACXDeviceConnection\"}", buf, 0x12u);
    }
    [(ACXDeviceConnection *)self->_deviceConnection removeObserver:self];

    self->_deviceConnection = 0;
  }
  os_activity_scope_leave(&v10);
}

- (void)isAppInstalled:(id)a3 completion:(id)a4
{
  id v11 = [[-[CLIntersiloUniverse silo](self->_universe, "silo") assertInside];
  if (!self->_valid)
  {
    sub_101AA7714(v11);
    __break(1u);
    goto LABEL_11;
  }
  deviceConnection = self->_deviceConnection;
  if (deviceConnection)
  {
    id v5 = [(CLIntersiloUniverse *)self->_universe silo];
    v17[0] = _NSConcreteStackBlock;
    uint64_t v7 = 3221225472;
    v17[1] = 3221225472;
    v17[2] = sub_10120556C;
    v17[3] = &unk_1023182A0;
    v17[4] = a3;
    v17[5] = v5;
    v17[6] = self;
    v17[7] = a4;
    id v6 = _os_activity_create((void *)&_mh_execute_header, "CL: #SuperRobin Checking if app is installed", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v6, &state);
    if (qword_102419530 == -1)
    {
LABEL_4:
      int v12 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [a3 UTF8String];
        uint64_t buf = 68289282;
        __int16 v19 = 2082;
        BOOL v20 = "";
        __int16 v21 = 2082;
        id v22 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SuperRobin Checking if app is installed\", \"clientKey\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
      }
      v15[0] = _NSConcreteStackBlock;
      v15[1] = v7;
      v15[2] = sub_1012059C8;
      v15[3] = &unk_102318340;
      v15[4] = v5;
      v15[5] = self;
      v15[9] = v17;
      v15[10] = a4;
      v15[6] = v6;
      v15[7] = deviceConnection;
      v15[8] = a3;
      [(ACXDeviceConnection *)deviceConnection applicationIsInstalledOnAnyPairedDeviceWithBundleID:a3 completion:v15];
      os_activity_scope_leave(&state);
      return;
    }
LABEL_11:
    dispatch_once(&qword_102419530, &stru_102318608);
    goto LABEL_4;
  }
  __int16 v14 = (void (*)(id, void))*((void *)a4 + 2);

  v14(a4, 0);
}

- (void)computeAllowableAuthorizationMaskForApplication:(id)a3 pairingID:(id)a4
{
  id v7 = -[CLPairedDeviceAppMonitor getLocationUsageDescriptionKeys:](self, "getLocationUsageDescriptionKeys:");
  if ([v7 count])
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_101206060;
    v21[3] = &unk_1022CFE90;
    v21[4] = v7;
    uint64_t v8 = sub_100028BB4(2, (uint64_t)v21);
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102318608);
    }
    v9 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
    {
      id v10 = [a3 companionAppBundleID];
      if (!v10) {
        id v10 = [a3 bundleIdentifier];
      }
      *(_DWORD *)uint64_t buf = 68289794;
      int v23 = 0;
      __int16 v24 = 2082;
      v25 = "";
      __int16 v26 = 2050;
      id v27 = (id)v8;
      __int16 v28 = 2114;
      uint64_t v29 = (uint64_t)a4;
      __int16 v30 = 2114;
      id v31 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#SuperRobin Determined intermediate mask\", \"intermediateMask\":%{public}lu, \"pairingID\":%{public, location:escape_only}@, \"clientKey\":%{public, location:escape_only}@}", buf, 0x30u);
    }
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102318608);
    }
    id v11 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289538;
      int v23 = 0;
      __int16 v24 = 2082;
      v25 = "";
      __int16 v26 = 2082;
      id v27 = [[objc_msgSend(a3, "bundleIdentifier") UTF8String];
      __int16 v28 = 2114;
      uint64_t v29 = (uint64_t)a4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SuperRobin location usage description key-values are not found\", \"bundleId\":%{public, location:escape_only}s, \"pairingID\":%{public, location:escape_only}@}", buf, 0x26u);
    }
    uint64_t v8 = 1;
  }
  unint64_t v12 = (unint64_t)sub_10120234C([a3 companionAppBundleID]);
  if (!v13) {
    goto LABEL_20;
  }
  id v14 = (id)v12;
  v8 |= v12;
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_102318608);
  }
  __int16 v15 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
  {
    id v16 = [a3 companionAppBundleID];
    if (!v16) {
      id v16 = [a3 bundleIdentifier];
    }
    *(_DWORD *)uint64_t buf = 68289538;
    int v23 = 0;
    __int16 v24 = 2082;
    v25 = "";
    __int16 v26 = 2050;
    id v27 = v14;
    __int16 v28 = 2114;
    uint64_t v29 = (uint64_t)v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#SuperRobin Determined companion mask\", \"companionMask\":%{public}lu, \"clientKey\":%{public, location:escape_only}@}", buf, 0x26u);
LABEL_20:
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102318608);
    }
  }
  __int16 v17 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [a3 companionAppBundleID];
    if (!v18) {
      id v18 = [a3 bundleIdentifier];
    }
    *(_DWORD *)uint64_t buf = 68289538;
    int v23 = 0;
    __int16 v24 = 2082;
    v25 = "";
    __int16 v26 = 2114;
    id v27 = v18;
    __int16 v28 = 2050;
    uint64_t v29 = v8;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SuperRobin Determined allowable service mask for app\", \"clientKey\":%{public, location:escape_only}@, \"mask\":%{public}lu}", buf, 0x26u);
  }
  id v19 = [[-[CLIntersiloUniverse vendor](self->_universe, "vendor") proxyForService:@"CLClientManager"];
  id v20 = [a3 companionAppBundleID];
  if (!v20) {
    id v20 = [a3 bundleIdentifier];
  }
  [v19 setAllowableAuthorizationMask:v8 forClientKey:v20];
}

- (void)applicationsUninstalled:(id)a3 onDeviceWithPairingID:(id)a4
{
  [self->_universe silo assertOutside];
  id v7 = [(CLIntersiloUniverse *)self->_universe silo];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_101206128;
  v8[3] = &unk_10229FF28;
  v8[4] = self;
  v8[5] = a4;
  v8[6] = a3;
  [v7 async:v8];
}

- (void)applicationsUpdated:(id)a3 onDeviceWithPairingID:(id)a4
{
  [self->_universe silo] assertOutside;
  id v7 = [(CLIntersiloUniverse *)self->_universe silo];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_101206358;
  v8[3] = &unk_10229FF28;
  v8[4] = self;
  v8[5] = a4;
  v8[6] = a3;
  [v7 async:v8];
}

- (void)applicationsInstalled:(id)a3 onDeviceWithPairingID:(id)a4
{
  [self->_universe silo] assertOutside;
  id v7 = [(CLIntersiloUniverse *)self->_universe silo];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_101206608;
  v8[3] = &unk_10229FF28;
  v8[4] = self;
  v8[5] = a4;
  v8[6] = a3;
  [v7 async:v8];
}

- (id)getLocationUsageDescriptionKeys:(id)a3
{
  id v20 = +[NSMutableDictionary dictionary];
  id v4 = [a3 localizedInfoPlistStrings];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  if (qword_102486428 != -1) {
    dispatch_once(&qword_102486428, &stru_102318560);
  }
  id v5 = (void *)qword_102486420;
  id v6 = [(id)qword_102486420 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v22;
    *(void *)&long long v7 = 68289538;
    long long v19 = v7;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v10);
        id v12 = [v4 objectForKey:v11, v19];
        if (v12)
        {
          id v13 = [v12 objectForKey:&stru_10234F018];
          if (v13)
          {
            id v14 = v13;
            [v20 setObject:v13 forKeyedSubscript:v11];
            if (qword_102419530 != -1) {
              dispatch_once(&qword_102419530, &stru_102318608);
            }
            __int16 v15 = qword_102419538;
            if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
            {
              id v16 = [v11 UTF8String];
              id v17 = [v14 UTF8String];
              *(_DWORD *)uint64_t buf = v19;
              int v26 = 0;
              __int16 v27 = 2082;
              __int16 v28 = "";
              __int16 v29 = 2082;
              id v30 = v16;
              __int16 v31 = 2082;
              id v32 = v17;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#SuperRobin Found Location usage description in Info.plist for Remote application\", \"key\":%{public, location:escape_only}s, \"value\":%{public, location:escape_only}s}", buf, 0x26u);
            }
          }
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v8);
  }
  return v20;
}

- (void)appMonitor
{
  return self->_appMonitor;
}

- (void)setAppMonitor:(void *)a3
{
  self->_appMonitor = a3;
}

- (CLIntersiloUniverse)universe
{
  return self->_universe;
}

- (void)setUniverse:(id)a3
{
}

- (ACXDeviceConnection)deviceConnection
{
  return self->_deviceConnection;
}

- (void)setDeviceConnection:(id)a3
{
}

- (NRPairedDeviceRegistry)pairedDeviceRegistry
{
  return self->_pairedDeviceRegistry;
}

- (void)setPairedDeviceRegistry:(id)a3
{
}

- (NSObject)unpairNotificationRegistrationToken
{
  return self->_unpairNotificationRegistrationToken;
}

- (void)setUnpairNotificationRegistrationToken:(id)a3
{
}

- (NSObject)pairNotificationRegistrationToken
{
  return self->_pairNotificationRegistrationToken;
}

- (void)setPairNotificationRegistrationToken:(id)a3
{
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (NSMutableSet)pairedDeviceIds
{
  return self->_pairedDeviceIds;
}

- (void)setPairedDeviceIds:(id)a3
{
}

@end