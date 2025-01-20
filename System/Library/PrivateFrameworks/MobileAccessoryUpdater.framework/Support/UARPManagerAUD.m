@interface UARPManagerAUD
- (BOOL)dynamicAssetSolicitation:(id)a3 modelNumber:(id)a4 notifyService:(id)a5;
- (BOOL)dynamicAssetSolicitation:(id)a3 modelNumbers:(id)a4 notifyService:(id)a5;
- (BOOL)handleXPCStreamEvent:(id)a3;
- (BOOL)isBusy;
- (UARPManagerAUD)initWithQueue:(id)a3;
- (id)personalizationHelperQueryPendingTssRequests:(id)a3;
- (int64_t)addAccessory:(id)a3 assetID:(id)a4;
- (int64_t)disableTRMSystemAuthenticationForRegistryEntryID:(id)a3;
- (int64_t)enableTRMSystemAuthenticationForRegistryEntryID:(id)a3;
- (int64_t)removeAccessory:(id)a3;
- (int64_t)requestConsent:(id)a3;
- (int64_t)revokeConsentRequest:(id)a3;
- (void)assetAvailabilityUpdateForAccessory:(id)a3 assetID:(id)a4;
- (void)consentReceived:(id)a3;
- (void)consentReceivedPostLogoutMode:(id)a3;
- (void)dealloc;
- (void)dumpState;
- (void)firmwareUpdateProgressForAccessory:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6;
- (void)firmwareUpdateProgressForUARPConsent:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5;
- (void)handlePeriodicLaunch;
- (void)notifyAttestationCertificatesAvailable:(id)a3 forSubjectKeyIdentifer:(id)a4;
- (void)personalizationHelperTssResponse:(id)a3 updaterName:(id)a4;
- (void)postConsentUpdateCompleteNotification:(id)a3 success:(BOOL)a4;
- (void)progressForUARPConsent:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5;
- (void)progressForUARPConsentInPostLogout:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5;
- (void)stagingCompleteForAccessoryID:(id)a3 assetID:(id)a4 status:(unint64_t)a5;
- (void)start:(BOOL)a3;
- (void)supplementalAssetAvailabilityUpdateForAccessory:(id)a3 assetName:(id)a4;
- (void)supportedAccessories:(id)a3 forProductGroup:(id)a4 isComplete:(BOOL)a5;
@end

@implementation UARPManagerAUD

- (UARPManagerAUD)initWithQueue:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UARPManagerAUD;
  v4 = [(UARPManager *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_dispatchQueue = (OS_dispatch_queue *)a3;
    v4->_listener = [[UARPManagerListener alloc] initWithManager:v4 dispatchQueue:v4->_dispatchQueue];
    v5->_observerListener = 0;
    if (MGGetBoolAnswer()) {
      v5->_observerListener = [[UARPObserverListener alloc] initWithManager:v5 dispatchQueue:v5->_dispatchQueue];
    }
    v5->_updaterManager = [[UARPUpdaterServiceManager alloc] initWithQueue:v5->_dispatchQueue];
    v5->_personalizationManager = (UARPPersonalizationManager *)objc_msgSend(objc_alloc((Class)UARPPersonalizationManager), "initWithMachServiceName:entitlement:delegate:queue:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.uarppersonalization"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.uarppersonalization"), v5, v5->_dispatchQueue);
    v5->_standaloneCommandListener = [[UARPStandaloneCommandManagerListener alloc] initWithManager:v5 dispatchQueue:v5->_dispatchQueue];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)UARPManagerAUD;
  [(UARPManager *)&v3 dealloc];
}

- (void)assetAvailabilityUpdateForAccessory:(id)a3 assetID:(id)a4
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C4D0;
  block[3] = &unk_10007CF58;
  block[4] = a3;
  dispatch_sync(dispatchQueue, block);
}

- (void)supplementalAssetAvailabilityUpdateForAccessory:(id)a3 assetName:(id)a4
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[UARPManagerAUD supplementalAssetAvailabilityUpdateForAccessory:assetName:]";
    __int16 v11 = 2112;
    id v12 = a4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RECEIVED %s Asset Name is %@", buf, 0x16u);
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C61C;
  block[3] = &unk_10007CF58;
  block[4] = a3;
  dispatch_sync(dispatchQueue, block);
}

- (void)supportedAccessories:(id)a3 forProductGroup:(id)a4 isComplete:(BOOL)a5
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C6C0;
  block[3] = &unk_10007CF58;
  block[4] = a4;
  dispatch_sync(dispatchQueue, block);
}

- (void)notifyAttestationCertificatesAvailable:(id)a3 forSubjectKeyIdentifer:(id)a4
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C7A8;
  block[3] = &unk_10007CF58;
  block[4] = a4;
  dispatch_sync(dispatchQueue, block);
}

- (void)start:(BOOL)a3
{
  if (a3)
  {
    objc_msgSend(+[UARPDatabase sharedDatabase](UARPDatabase, "sharedDatabase"), "removeAllActiveAccessories");
    sub_100006E78(0, 0);
    dispatchQueue = self->_dispatchQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10002C918;
    v7[3] = &unk_10007CF58;
    v7[4] = self;
    v5 = v7;
  }
  else
  {
    dispatchQueue = self->_dispatchQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10002C92C;
    v6[3] = &unk_10007CF58;
    v6[4] = self;
    v5 = v6;
  }
  dispatch_sync(dispatchQueue, v5);
}

- (BOOL)handleXPCStreamEvent:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[UARPManagerAUD handleXPCStreamEvent:]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: RECEIVED", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v10 = 0x2020000000;
  dispatchQueue = self->_dispatchQueue;
  char v11 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002CA7C;
  block[3] = &unk_10007D860;
  void block[5] = a3;
  block[6] = &buf;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
  char v6 = *(unsigned char *)(*((void *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  return v6;
}

- (void)handlePeriodicLaunch
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002CB68;
  block[3] = &unk_10007CF58;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)dumpState
{
  id v3 = objc_alloc_init((Class)NSDateFormatter);
  [v3 setDateFormat:@"yyyy.MM.dd_kk-mm-ssZ"];
  objc_msgSend(+[UARPDatabase sharedDatabase](UARPDatabase, "sharedDatabase"), "dumpToFile:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@/fud_uarp_db_state_%@.txt", sub_1000428C8(), objc_msgSend(v3, "stringFromDate:", +[NSDate date](NSDate, "date"))));
  v4.receiver = self;
  v4.super_class = (Class)UARPManagerAUD;
  [(UARPManager *)&v4 dumpState];
}

- (int64_t)requestConsent:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    objc_super v7 = "-[UARPManagerAUD requestConsent:]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: RECEIVED", (uint8_t *)&v6, 0xCu);
  }
  if (![(UARPUpdaterServiceManager *)self->_updaterManager consentDisabledForUARPConsent:a3 sendConsent:1])return (int64_t)[(UARPConsent *)self->_consentManager requestConsent:a3]; {
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  }
    sub_100051904(a3);
  notify_post("com.apple.uarp.disabledConsent.start");
  return 0;
}

- (void)postConsentUpdateCompleteNotification:(id)a3 success:(BOOL)a4
{
  BOOL v4 = a4;
  int out_token = 0;
  uint32_t v5 = notify_register_check("com.apple.uarp.disabledConsent.complete", &out_token);
  if (v5)
  {
    int v6 = v5;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100051990(v6);
    }
  }
  else
  {
    notify_set_state(out_token, v4);
    notify_post("com.apple.uarp.disabledConsent.complete");
  }
}

- (int64_t)revokeConsentRequest:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    objc_super v7 = "-[UARPManagerAUD revokeConsentRequest:]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: RECEIVED", (uint8_t *)&v6, 0xCu);
  }
  if (![(UARPUpdaterServiceManager *)self->_updaterManager consentDisabledForUARPConsent:a3 sendConsent:0])return (int64_t)[(UARPConsent *)self->_consentManager revokeConsentRequest:a3]; {
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  }
    sub_100051A24(a3);
  [(UARPManagerAUD *)self postConsentUpdateCompleteNotification:a3 success:0];
  return 0;
}

- (int64_t)enableTRMSystemAuthenticationForRegistryEntryID:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    objc_super v7 = "-[UARPManagerAUD enableTRMSystemAuthenticationForRegistryEntryID:]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: RECEIVED", (uint8_t *)&v6, 0xCu);
  }
  return [(UARPUpdaterServiceManager *)self->_updaterManager enableTRMSystemAuthenticationForRegistryEntryID:a3] ^ 1;
}

- (int64_t)disableTRMSystemAuthenticationForRegistryEntryID:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    objc_super v7 = "-[UARPManagerAUD disableTRMSystemAuthenticationForRegistryEntryID:]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: RECEIVED", (uint8_t *)&v6, 0xCu);
  }
  return [(UARPUpdaterServiceManager *)self->_updaterManager disableTRMSystemAuthenticationForRegistryEntryID:a3] ^ 1;
}

- (void)consentReceived:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    v8 = "-[UARPManagerAUD consentReceived:]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: RECEIVED", buf, 0xCu);
  }
  dispatchQueue = self->_dispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002D180;
  v6[3] = &unk_10007D4B0;
  v6[4] = self;
  void v6[5] = a3;
  dispatch_sync(dispatchQueue, v6);
}

- (void)consentReceivedPostLogoutMode:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    v8 = "-[UARPManagerAUD consentReceivedPostLogoutMode:]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: RECEIVED", buf, 0xCu);
  }
  dispatchQueue = self->_dispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002D29C;
  v6[3] = &unk_10007D4B0;
  v6[4] = self;
  void v6[5] = a3;
  dispatch_sync(dispatchQueue, v6);
}

- (void)firmwareUpdateProgressForUARPConsent:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[UARPManagerAUD firmwareUpdateProgressForUARPConsent:bytesSent:bytesTotal:]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: RECEIVED", (uint8_t *)&v9, 0xCu);
  }
  [(UARPConsent *)self->_consentManager firmwareUpdateProgressForUARPConsent:a3 bytesSent:a4 bytesTotal:a5];
}

- (void)progressForUARPConsent:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    char v11 = "-[UARPManagerAUD progressForUARPConsent:bytesSent:bytesTotal:]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: RECEIVED", (uint8_t *)&v10, 0xCu);
  }
  id v9 = [(UARPConsent *)self->_consentManager updateCompleteForUARPConsent:a3 bytesSent:a4 bytesTotal:a5];
  if ([(UARPUpdaterServiceManager *)self->_updaterManager bypassProgressForUARPConsent:a3 sendConsent:v9])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100051AB0(a3);
      if (!v9) {
        return;
      }
    }
    else if (!v9)
    {
      return;
    }
    if ([a3 installerProgressError]) {
      [(UARPManagerAUD *)self postConsentUpdateCompleteNotification:a3 success:0];
    }
  }
  else
  {
    [(UARPConsent *)self->_consentManager progressForUARPConsent:a3 bytesSent:a4 bytesTotal:a5];
  }
}

- (void)progressForUARPConsentInPostLogout:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    int v10 = "-[UARPManagerAUD progressForUARPConsentInPostLogout:bytesSent:bytesTotal:]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: RECEIVED", (uint8_t *)&v9, 0xCu);
  }
  if ([(UARPUpdaterServiceManager *)self->_updaterManager consentDisabledForUARPConsent:a3 sendConsent:0])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100051B4C(a3);
    }
    if ([(UARPConsent *)self->_consentManager updateCompleteForUARPConsentInPostLogout:a3 bytesSent:a4 bytesTotal:a5])[(UARPManagerAUD *)self postConsentUpdateCompleteNotification:a3 success:1]; {
  }
    }
  else
  {
    [(UARPConsent *)self->_consentManager progressForUARPConsentInPostLogout:a3 bytesSent:a4 bytesTotal:a5];
  }
}

- (BOOL)isBusy
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002D6F0;
  v5[3] = &unk_10007D1F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)dynamicAssetSolicitation:(id)a3 modelNumber:(id)a4 notifyService:(id)a5
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "[UARPManagerAUD dynamicAssetSolicitation:modelNumber:notifyService:]", v10, 2u);
  }
  return [(UARPUpdaterServiceManager *)self->_updaterManager dynamicAssetSolicitation:a3 modelNumber:a4 notifyService:a5];
}

- (BOOL)dynamicAssetSolicitation:(id)a3 modelNumbers:(id)a4 notifyService:(id)a5
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "[UARPManagerAUD dynamicAssetSolicitation:modelNumbers:notifyService:]", v10, 2u);
  }
  return [(UARPUpdaterServiceManager *)self->_updaterManager dynamicAssetSolicitation:a3 modelNumbers:a4 notifyService:a5];
}

- (id)personalizationHelperQueryPendingTssRequests:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[UARPManagerAUD personalizationHelperQueryPendingTssRequests:]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }
  id v5 = [(UARPUpdaterServiceManager *)self->_updaterManager queryPendingTssRequestsForUpdater:a3];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[UARPManagerAUD personalizationHelperQueryPendingTssRequests:]";
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: pending responses %@", (uint8_t *)&v7, 0x16u);
  }
  return v5;
}

- (void)personalizationHelperTssResponse:(id)a3 updaterName:(id)a4
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[UARPManagerAUD personalizationHelperTssResponse:updaterName:]";
    __int16 v9 = 2112;
    id v10 = a4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: tss response for updater %@", (uint8_t *)&v7, 0x16u);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[UARPManagerAUD personalizationHelperTssResponse:updaterName:]";
    __int16 v9 = 2112;
    id v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: tss response %@", (uint8_t *)&v7, 0x16u);
  }
  [(UARPUpdaterServiceManager *)self->_updaterManager tssResponse:a3 updaterName:a4];
}

- (int64_t)addAccessory:(id)a3 assetID:(id)a4
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v10 = "-[UARPManagerAUD addAccessory:assetID:]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: RECEIVED", buf, 0xCu);
  }
  [(UARPObserverListener *)self->_observerListener addAccessoryID:a3 assetID:a4];
  v8.receiver = self;
  v8.super_class = (Class)UARPManagerAUD;
  return [(UARPManager *)&v8 addAccessory:a3 assetID:a4];
}

- (int64_t)removeAccessory:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    objc_super v8 = "-[UARPManagerAUD removeAccessory:]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: RECEIVED", buf, 0xCu);
  }
  [(UARPObserverListener *)self->_observerListener removeAccessoryID:a3];
  v6.receiver = self;
  v6.super_class = (Class)UARPManagerAUD;
  return [(UARPManager *)&v6 removeAccessory:a3];
}

- (void)firmwareUpdateProgressForAccessory:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    id v12 = "-[UARPManagerAUD firmwareUpdateProgressForAccessory:assetID:bytesSent:bytesTotal:]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: RECEIVED", (uint8_t *)&v11, 0xCu);
  }
  [(UARPObserverListener *)self->_observerListener firmwareUpdateProgressForAccessoryID:a3 assetID:a4 bytesSent:a5 bytesTotal:a6];
}

- (void)stagingCompleteForAccessoryID:(id)a3 assetID:(id)a4 status:(unint64_t)a5
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[UARPManagerAUD stagingCompleteForAccessoryID:assetID:status:]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: RECEIVED", (uint8_t *)&v9, 0xCu);
  }
  [(UARPObserverListener *)self->_observerListener stagingCompleteForAccessoryID:a3 assetID:a4 status:a5];
}

@end