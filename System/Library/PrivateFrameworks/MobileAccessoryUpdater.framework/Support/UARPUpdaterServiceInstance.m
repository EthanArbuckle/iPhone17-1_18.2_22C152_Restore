@interface UARPUpdaterServiceInstance
- (BOOL)consentDisabledForService;
- (BOOL)dynamicAssetSolicitation:(id)a3 modelNumber:(id)a4 notifyService:(id)a5;
- (BOOL)dynamicAssetSolicitation:(id)a3 modelNumbers:(id)a4 notifyService:(id)a5;
- (BOOL)isTrackingIONotificationPortForRegistryEntryID:(id)a3;
- (BOOL)queryIsServiceBusy;
- (BOOL)queryIsServiceBusyInternal;
- (NSArray)accessoriesNeedingConsent;
- (NSString)serviceName;
- (UARPUpdaterServiceInstance)initWithServiceBundle:(id)a3 delegate:(id)a4;
- (id)description;
- (id)findAndReleaseAllIONotificationPorts;
- (id)findAndReleaseIONotificationPortForRegistryEntryID:(id)a3;
- (id)queryPendingTssRequests;
- (void)bsdNotificationReceived:(id)a3;
- (void)checkinDASActivities;
- (void)consentReceived:(id)a3;
- (void)consentReceivedPostLogoutMode:(id)a3;
- (void)dasActivityReceived:(id)a3;
- (void)dealloc;
- (void)disabledProductIdentifiers:(id)a3;
- (void)eaRuleMatched:(id)a3;
- (void)initializeUpdaterServiceConnection;
- (void)ioKitRuleMatched:(id)a3;
- (void)queryBSDNotificationRules;
- (void)queryDASActivityRules;
- (void)queryLaunchRules;
- (void)queryMatchingRules;
- (void)releaseXPCConnection;
- (void)storeIONotificationPort:(id)a3 forRegistryEntryID:(id)a4;
- (void)tssResponse:(id)a3;
@end

@implementation UARPUpdaterServiceInstance

- (UARPUpdaterServiceInstance)initWithServiceBundle:(id)a3 delegate:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)UARPUpdaterServiceInstance;
  v6 = [(UARPUpdaterServiceInstance *)&v11 init];
  if (v6)
  {
    v6->_log = (OS_os_log *)os_log_create("com.apple.accessoryupdater.uarp", "updaterManager");
    v7 = (NSString *)objc_msgSend(objc_msgSend(a3, "bundleIdentifier"), "copy");
    v6->_serviceName = v7;
    v6->_delegate = (UARPUpdaterServiceInstanceDelegate *)a4;
    v6->_queue = (OS_dispatch_queue *)dispatch_queue_create([(NSString *)v7 UTF8String], 0);
    v6->_regEntryIDToIONotificationPorts = (NSMutableDictionary *)objc_opt_new();
    id v8 = [a3 infoDictionary];
    id v9 = [v8 objectForKeyedSubscript:@"AccessoriesNeedingConsent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6->_accessoriesNeedingConsent = (NSArray *)[v9 copy];
    }
    if (objc_msgSend(objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", @"XPCService"), "objectForKeyedSubscript:", @"ServiceType"), "isEqualToString:", @"Application"))v6->_serviceTypeApplication = 1; {
  }
    }
  return v6;
}

- (void)dealloc
{
  [(UARPUpdaterServiceInstance *)self releaseXPCConnection];
  v3.receiver = self;
  v3.super_class = (Class)UARPUpdaterServiceInstance;
  [(UARPUpdaterServiceInstance *)&v3 dealloc];
}

- (void)initializeUpdaterServiceConnection
{
  self->_xpcConnection = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithServiceName:self->_serviceName];
  objc_super v3 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___UARPUpdaterService];
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  [(NSXPCInterface *)v3 setClasses:+[NSSet setWithArray:](NSSet, "setWithArray:", +[NSArray arrayWithObjects:v5 count:2]) forSelector:"getMatchingServicesListWithReply:" argumentIndex:0 ofReply:1];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  [(NSXPCInterface *)v3 setClasses:+[NSSet setWithArray:](NSSet, "setWithArray:", +[NSArray arrayWithObjects:v4 count:2]) forSelector:"getDASActivityListWithReply:" argumentIndex:0 ofReply:1];
  [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:v3];
  [(NSXPCConnection *)self->_xpcConnection resume];
}

- (void)releaseXPCConnection
{
  self->_xpcConnection = 0;
}

- (BOOL)consentDisabledForService
{
  objc_super v3 = (void *)CFPreferencesCopyAppValue(@"disabledConsentUARPServices", @"com.apple.mobileaccessoryupdater");
  LOBYTE(self) = objc_msgSend(objc_msgSend(v3, "objectForKeyedSubscript:", -[UARPUpdaterServiceInstance serviceName](self, "serviceName")), "BOOLValue");

  return (char)self;
}

- (void)queryMatchingRules
{
  [(UARPUpdaterServiceInstance *)self initializeUpdaterServiceConnection];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3052000000;
  v18 = sub_100023734;
  v19 = sub_100023744;
  uint64_t v20 = 0;
  xpcConnection = self->_xpcConnection;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100023750;
  v14[3] = &unk_10007D810;
  v14[4] = &v15;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3052000000;
  objc_super v11 = sub_100023734;
  v12 = sub_100023744;
  uint64_t v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100023780;
  v7[3] = &unk_10007D268;
  v7[4] = &v8;
  objc_msgSend(-[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](xpcConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v14), "getMatchingServicesListWithReply:", v7);
  v4 = (void *)v16[5];
  if (v4)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      serviceName = self->_serviceName;
      *(_DWORD *)buf = 138412546;
      v22 = serviceName;
      __int16 v23 = 2112;
      v24 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to query services for %@ (%@)", buf, 0x16u);
      v4 = (void *)v16[5];
    }
  }
  else
  {
    [(UARPUpdaterServiceInstanceDelegate *)self->_delegate matchingRulesChangedForUpdaterServiceInstance:self matchingRules:v9[5]];
  }

  [(UARPUpdaterServiceInstance *)self releaseXPCConnection];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v15, 8);
}

- (void)queryBSDNotificationRules
{
  if ([(UARPUpdaterServiceInstance *)self consentDisabledForService])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      sub_100050F54((uint64_t)self, log);
    }
  }
  else
  {
    [(UARPUpdaterServiceInstance *)self initializeUpdaterServiceConnection];
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3052000000;
    v19 = sub_100023734;
    uint64_t v20 = sub_100023744;
    uint64_t v21 = 0;
    xpcConnection = self->_xpcConnection;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100023A48;
    v15[3] = &unk_10007D810;
    v15[4] = &v16;
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x3052000000;
    v12 = sub_100023734;
    uint64_t v13 = sub_100023744;
    uint64_t v14 = 0;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100023A78;
    v8[3] = &unk_10007D268;
    v8[4] = &v9;
    objc_msgSend(-[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](xpcConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v15), "getBSDNotificationsListWithReply:", v8);
    v5 = (void *)v17[5];
    if (v5)
    {
      v6 = self->_log;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        serviceName = self->_serviceName;
        *(_DWORD *)buf = 138412546;
        __int16 v23 = serviceName;
        __int16 v24 = 2112;
        v25 = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Unable to query BSD notifications for %@ (%@)", buf, 0x16u);
        v5 = (void *)v17[5];
      }
    }
    else
    {
      [(UARPUpdaterServiceInstanceDelegate *)self->_delegate bsdNotificationRulesChangedForUpdaterServiceInstance:self notificationNames:v10[5]];
    }

    [(UARPUpdaterServiceInstance *)self releaseXPCConnection];
    _Block_object_dispose(&v9, 8);
    _Block_object_dispose(&v16, 8);
  }
}

- (void)queryDASActivityRules
{
  if ([(UARPUpdaterServiceInstance *)self consentDisabledForService])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      sub_100050FD0((uint64_t)self, log);
    }
  }
  else
  {
    objc_msgSend(+[UARPDatabase sharedDatabase](UARPDatabase, "sharedDatabase"), "removeDASActivitiesForServiceName:", self->_serviceName);
    [(UARPUpdaterServiceInstance *)self initializeUpdaterServiceConnection];
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3052000000;
    __int16 v23 = sub_100023734;
    __int16 v24 = sub_100023744;
    uint64_t v25 = 0;
    xpcConnection = self->_xpcConnection;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100023DE4;
    v19[3] = &unk_10007D810;
    v19[4] = &v20;
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3052000000;
    uint64_t v16 = sub_100023734;
    uint64_t v17 = sub_100023744;
    uint64_t v18 = 0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100023E14;
    v12[3] = &unk_10007D268;
    v12[4] = &v13;
    objc_msgSend(-[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](xpcConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v19), "getDASActivityListWithReply:", v12);
    v5 = self->_log;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      serviceName = self->_serviceName;
      v7 = (void *)v14[5];
      *(_DWORD *)buf = 138412546;
      v27 = serviceName;
      __int16 v28 = 2112;
      v29 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DAS activities from %@ (%@)", buf, 0x16u);
    }
    uint64_t v8 = (void *)v21[5];
    if (v8)
    {
      uint64_t v9 = self->_log;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = self->_serviceName;
        *(_DWORD *)buf = 138412546;
        v27 = v11;
        __int16 v28 = 2112;
        v29 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unable to query DAS notifications for %@ (%@)", buf, 0x16u);
        uint64_t v8 = (void *)v21[5];
      }
    }
    else
    {
      [(UARPUpdaterServiceInstanceDelegate *)self->_delegate dasActivityRulesChangedForUpdaterServiceInstance:self dasActivities:v14[5]];
      if ([(id)v14[5] count])
      {
        id v10 = +[UARPDatabase sharedDatabase];
        [v10 addDASActivities:v14[5] serviceName:self->_serviceName];
      }
    }

    [(UARPUpdaterServiceInstance *)self releaseXPCConnection];
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v20, 8);
  }
}

- (void)queryLaunchRules
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023EBC;
  block[3] = &unk_10007CF58;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)checkinDASActivities
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023F74;
  block[3] = &unk_10007CF58;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)ioKitRuleMatched:(id)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  void v4[2] = sub_100024100;
  v4[3] = &unk_10007D4B0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)bsdNotificationReceived:(id)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  void v4[2] = sub_100024294;
  v4[3] = &unk_10007D4B0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)dasActivityReceived:(id)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  void v4[2] = sub_1000243E8;
  v4[3] = &unk_10007D4B0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)consentReceived:(id)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  void v4[2] = sub_100024540;
  v4[3] = &unk_10007D4B0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)consentReceivedPostLogoutMode:(id)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  void v4[2] = sub_100024694;
  v4[3] = &unk_10007D4B0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)disabledProductIdentifiers:(id)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  void v4[2] = sub_1000247E8;
  v4[3] = &unk_10007D4B0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)eaRuleMatched:(id)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  void v4[2] = sub_10002493C;
  v4[3] = &unk_10007D4B0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (BOOL)queryIsServiceBusyInternal
{
  if (!self->_serviceTypeApplication) {
    return 0;
  }
  [(UARPUpdaterServiceInstance *)self initializeUpdaterServiceConnection];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3052000000;
  uint64_t v20 = sub_100023734;
  uint64_t v21 = sub_100023744;
  uint64_t v22 = 0;
  xpcConnection = self->_xpcConnection;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100024CC4;
  v16[3] = &unk_10007D810;
  v16[4] = &v17;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100024CF4;
  v11[3] = &unk_10007D838;
  v11[4] = &v12;
  objc_msgSend(-[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](xpcConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v16), "getIsBusyStatusWithReply:", v11);
  v4 = (void *)v18[5];
  log = self->_log;
  if (v4)
  {
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      serviceName = self->_serviceName;
      *(_DWORD *)buf = 138412546;
      __int16 v24 = serviceName;
      __int16 v25 = 2112;
      v26 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to query isServiceBusy for %@ (%@)", buf, 0x16u);
      v4 = (void *)v18[5];
    }
  }
  else if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v7 = self->_serviceName;
    int v8 = *((unsigned __int8 *)v13 + 24);
    *(_DWORD *)buf = 138412546;
    __int16 v24 = v7;
    __int16 v25 = 1024;
    LODWORD(v26) = v8;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%@ isServiceBusy (%d)", buf, 0x12u);
  }
  [(UARPUpdaterServiceInstance *)self releaseXPCConnection];
  BOOL v6 = *((unsigned char *)v13 + 24) != 0;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v17, 8);
  return v6;
}

- (BOOL)queryIsServiceBusy
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  void v5[2] = sub_100024DB0;
  v5[3] = &unk_10007D1F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isTrackingIONotificationPortForRegistryEntryID:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024E94;
  block[3] = &unk_10007D860;
  void block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  dispatch_sync(queue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)storeIONotificationPort:(id)a3 forRegistryEntryID:(id)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024F4C;
  block[3] = &unk_10007D500;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_sync(queue, block);
}

- (id)findAndReleaseIONotificationPortForRegistryEntryID:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  char v10 = sub_100023734;
  uint64_t v11 = sub_100023744;
  uint64_t v12 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025034;
  block[3] = &unk_10007D550;
  block[4] = self;
  void block[5] = a3;
  block[6] = &v7;
  dispatch_sync(queue, block);
  char v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)findAndReleaseAllIONotificationPorts
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = sub_100023734;
  char v10 = sub_100023744;
  uint64_t v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  void v5[2] = sub_1000251BC;
  v5[3] = &unk_10007D888;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  objc_msgSend((id)v7[5], "removeObjectIdenticalTo:", +[NSNull null](NSNull, "null"));
  char v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)dynamicAssetSolicitation:(id)a3 modelNumber:(id)a4 notifyService:(id)a5
{
  [(UARPUpdaterServiceInstance *)self initializeUpdaterServiceConnection];
  uint64_t v23 = 0;
  __int16 v24 = &v23;
  uint64_t v25 = 0x3052000000;
  v26 = sub_100023734;
  v27 = sub_100023744;
  uint64_t v28 = 0;
  xpcConnection = self->_xpcConnection;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000254F8;
  v22[3] = &unk_10007D810;
  v22[4] = &v23;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100025528;
  v17[3] = &unk_10007D838;
  v17[4] = &v18;
  objc_msgSend(-[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](xpcConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v22), "standaloneDynamicAssetSolicitation:modelNumber:notifyService:reply:", a3, a4, a5, v17);
  char v10 = (void *)v24[5];
  log = self->_log;
  if (v10)
  {
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      serviceName = self->_serviceName;
      *(_DWORD *)buf = 136315650;
      v30 = "-[UARPUpdaterServiceInstance dynamicAssetSolicitation:modelNumber:notifyService:]";
      __int16 v31 = 2112;
      v32 = serviceName;
      __int16 v33 = 2112;
      v34 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s Unable to query isSolicitSuccess for %@ (%@)", buf, 0x20u);
      char v10 = (void *)v24[5];
    }
  }
  else if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = self->_serviceName;
    int v13 = *((unsigned __int8 *)v19 + 24);
    *(_DWORD *)buf = 136315650;
    v30 = "-[UARPUpdaterServiceInstance dynamicAssetSolicitation:modelNumber:notifyService:]";
    __int16 v31 = 2112;
    v32 = v12;
    __int16 v33 = 1024;
    LODWORD(v34) = v13;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%s %@ solicitSuccess (%d)", buf, 0x1Cu);
  }
  [(UARPUpdaterServiceInstance *)self releaseXPCConnection];
  char v14 = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v23, 8);
  return v14;
}

- (BOOL)dynamicAssetSolicitation:(id)a3 modelNumbers:(id)a4 notifyService:(id)a5
{
  [(UARPUpdaterServiceInstance *)self initializeUpdaterServiceConnection];
  uint64_t v23 = 0;
  __int16 v24 = &v23;
  uint64_t v25 = 0x3052000000;
  v26 = sub_100023734;
  v27 = sub_100023744;
  uint64_t v28 = 0;
  xpcConnection = self->_xpcConnection;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100025804;
  v22[3] = &unk_10007D810;
  v22[4] = &v23;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100025834;
  v17[3] = &unk_10007D838;
  v17[4] = &v18;
  objc_msgSend(-[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](xpcConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v22), "standaloneDynamicAssetSolicitation:modelNumbers:notifyService:reply:", a3, a4, a5, v17);
  char v10 = (void *)v24[5];
  log = self->_log;
  if (v10)
  {
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      serviceName = self->_serviceName;
      *(_DWORD *)buf = 136315650;
      v30 = "-[UARPUpdaterServiceInstance dynamicAssetSolicitation:modelNumbers:notifyService:]";
      __int16 v31 = 2112;
      v32 = serviceName;
      __int16 v33 = 2112;
      v34 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s Unable to query isSolicitSuccess for %@ (%@)", buf, 0x20u);
      char v10 = (void *)v24[5];
    }
  }
  else if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = self->_serviceName;
    int v13 = *((unsigned __int8 *)v19 + 24);
    *(_DWORD *)buf = 136315650;
    v30 = "-[UARPUpdaterServiceInstance dynamicAssetSolicitation:modelNumbers:notifyService:]";
    __int16 v31 = 2112;
    v32 = v12;
    __int16 v33 = 1024;
    LODWORD(v34) = v13;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%s %@ solicitSuccess (%d)", buf, 0x1Cu);
  }
  [(UARPUpdaterServiceInstance *)self releaseXPCConnection];
  char v14 = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v23, 8);
  return v14;
}

- (id)description
{
  char v3 = (objc_class *)objc_opt_class();
  return +[NSString stringWithFormat:@"<%@: %@>", NSStringFromClass(v3), self->_serviceName];
}

- (id)queryPendingTssRequests
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[UARPUpdaterServiceInstance queryPendingTssRequests]";
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%s: query pending tss requests", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v15 = 0x3052000000;
  uint64_t v16 = sub_100023734;
  uint64_t v17 = sub_100023744;
  uint64_t v18 = &__NSArray0__struct;
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100025A4C;
  v9[3] = &unk_10007D888;
  v9[4] = self;
  v9[5] = &buf;
  dispatch_sync(queue, v9);
  v5 = self->_log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*((void *)&buf + 1) + 40);
    *(_DWORD *)char v10 = 136315394;
    uint64_t v11 = "-[UARPUpdaterServiceInstance queryPendingTssRequests]";
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: pending tss requests %@", v10, 0x16u);
  }
  uint64_t v7 = *(void **)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);
  return v7;
}

- (void)tssResponse:(id)a3
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v9 = "-[UARPUpdaterServiceInstance tssResponse:]";
    __int16 v10 = 2112;
    id v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%s: tss reponse %@", buf, 0x16u);
  }
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100025DA8;
  v7[3] = &unk_10007D4B0;
  v7[4] = self;
  void v7[5] = a3;
  dispatch_async(queue, v7);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSArray)accessoriesNeedingConsent
{
  return self->_accessoriesNeedingConsent;
}

@end