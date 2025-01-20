@interface CSDCoreTelephonyClient
+ (BOOL)_isCTErrorFatal:(id)a3;
+ (BOOL)_isNSErrorFatal:(id)a3;
- (BOOL)isEmergencyCallbackModeEnabled;
- (BOOL)isInHomeCountryForSubscriptionUUID:(id)a3;
- (CSDCarrierBundleProviderController)carrierBundleProviderController;
- (CSDCoreTelephonyClient)initWithQueue:(id)a3 shouldRegisterForECBMNotification:(BOOL)a4;
- (CSDCoreTelephonyClientDelegate)delegate;
- (CTXPCContexts)activeContexts;
- (CoreTelephonyClient)client;
- (NSDictionary)thumperDeviceInfo;
- (NSMutableDictionary)mobileCodesToISOCountryCode;
- (NSSet)subscriptions;
- (NSSet)telephonySubscriptions;
- (NSUUID)preferredVoiceSubscriptionUUID;
- (OS_dispatch_queue)queue;
- (id)ISOCountryCodeForMobileCountryCode:(id)a3 mobileNetworkCode:(id)a4;
- (id)ISOCountryCodeForSubscriptionUUID:(id)a3;
- (id)_subscriptionWithUUID:(id)a3;
- (id)accountISOCountryCodeForSubscriptionUUID:(id)a3;
- (id)callCapabilitiesForSubscription:(id)a3;
- (id)capabilityInfoForSubscription:(id)a3 capability:(id)a4;
- (id)legacySystemCapabilities;
- (id)mobileCountryCodeForSubscription:(id)a3 error:(id *)a4;
- (id)mobileNetworkCodeForSubscription:(id)a3 error:(id *)a4;
- (id)spamIdentifiersForSubscriptionUUID:(id)a3;
- (id)systemCapabilitiesForSubscription:(id)a3;
- (void)activeSubscriptionsDidChange;
- (void)addSecondaryThumperDeviceWithIDSDeviceIdentifier:(id)a3 toSubscription:(id)a4;
- (void)callCapabilitiesChanged:(id)a3 capabilities:(id)a4;
- (void)context:(id)a3 capabilitiesChanged:(id)a4;
- (void)ctEmergencyCallbackModeStatusChangedWithUserInfo:(id)a3;
- (void)endEmergencyCallbackMode;
- (void)legacyAddSecondaryThumperDeviceWithIDSDeviceIdentifier:(id)a3;
- (void)legacyRecheckAccountStatusForCapability:(id)a3;
- (void)legacyRemoveSecondaryThumperDeviceWithIDSDeviceIdentifier:(id)a3;
- (void)phoneServicesCapabilitiesChanged:(id)a3;
- (void)recheckAccountStatusForSubscription:(id)a3 capability:(id)a4;
- (void)removeSecondaryThumperDeviceWithIDSDeviceIdentifier:(id)a3 fromSubscription:(id)a4;
- (void)setActiveContexts:(id)a3;
- (void)setCarrierBundleProviderController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLegacyCapability:(id)a3 enabled:(BOOL)a4 capabilityInformation:(id)a5;
- (void)setSubscription:(id)a3 capability:(id)a4 enabled:(BOOL)a5 info:(id)a6;
@end

@implementation CSDCoreTelephonyClient

- (CSDCoreTelephonyClient)initWithQueue:(id)a3 shouldRegisterForECBMNotification:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CSDCoreTelephonyClient;
  v8 = [(CSDCoreTelephonyClient *)&v20 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a3);
    v10 = (CoreTelephonyClient *)[objc_alloc((Class)CoreTelephonyClient) initWithQueue:v7];
    client = v9->_client;
    v9->_client = v10;

    [(CoreTelephonyClient *)v9->_client setDelegate:v9];
    v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    mobileCodesToISOCountryCode = v9->_mobileCodesToISOCountryCode;
    v9->_mobileCodesToISOCountryCode = v12;

    id v14 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithObjectsAndKeys:", @"01", @"gp", @"02", @"gp", @"03", @"gp", @"08", @"gp", @"09", @"gf", @"10", @"mq", @"12", @"gp", @"20", 0);
    [(NSMutableDictionary *)v9->_mobileCodesToISOCountryCode setObject:v14 forKeyedSubscript:@"340"];

    objc_initWeak(&location, v9);
    if (v4)
    {
      TUCTServerConnection();
      objc_copyWeak(&v18, &location);
      int v15 = (unint64_t)_CTServerConnectionRegisterBlockForNotification() >> 32;
      v16 = sub_100008DCC();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v22 = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Registered for kCTEmergencyCallBackModeStatusNotification with error: %d", buf, 8u);
      }

      objc_destroyWeak(&v18);
    }
    objc_destroyWeak(&location);
  }

  return v9;
}

- (CTXPCContexts)activeContexts
{
  v3 = [(CSDCoreTelephonyClient *)self queue];
  dispatch_assert_queue_V2(v3);

  activeContexts = self->_activeContexts;
  if (!activeContexts)
  {
    v5 = [(CSDCoreTelephonyClient *)self client];
    id v11 = 0;
    v6 = [v5 getActiveContexts:&v11];
    id v7 = v11;
    v8 = self->_activeContexts;
    self->_activeContexts = v6;

    if (!self->_activeContexts && [(id)objc_opt_class() _isNSErrorFatal:v7])
    {
      v9 = sub_100008DCC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1003B0A78(self, (uint64_t)v7, v9);
      }
    }
    activeContexts = self->_activeContexts;
  }

  return activeContexts;
}

- (CSDCarrierBundleProviderController)carrierBundleProviderController
{
  carrierBundleProviderController = self->_carrierBundleProviderController;
  if (!carrierBundleProviderController)
  {
    BOOL v4 = objc_alloc_init(CSDCarrierBundleProviderController);
    v5 = self->_carrierBundleProviderController;
    self->_carrierBundleProviderController = v4;

    carrierBundleProviderController = self->_carrierBundleProviderController;
  }

  return carrierBundleProviderController;
}

- (NSUUID)preferredVoiceSubscriptionUUID
{
  v3 = [(CSDCoreTelephonyClient *)self queue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(CSDCoreTelephonyClient *)self activeContexts];
  v5 = [v4 voicePreferred];

  return (NSUUID *)v5;
}

- (NSSet)subscriptions
{
  v3 = [(CSDCoreTelephonyClient *)self queue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(CSDCoreTelephonyClient *)self activeContexts];
  v5 = [v4 subscriptions];

  if (v5)
  {
    v6 = +[NSSet setWithArray:v5];
  }
  else
  {
    v6 = 0;
  }

  return (NSSet *)v6;
}

- (NSSet)telephonySubscriptions
{
  v3 = [(CSDCoreTelephonyClient *)self queue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = +[NSMutableSet set];
  v5 = [(CSDCoreTelephonyClient *)self subscriptions];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "csd_isTelephony")) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  id v11 = [v4 copy];

  return (NSSet *)v11;
}

- (BOOL)isEmergencyCallbackModeEnabled
{
  TUCTServerConnection();
  uint64_t v2 = _CTServerConnectionGetEmergencyCallBackMode();
  if ([(id)objc_opt_class() _isCTErrorFatal:v2])
  {
    v3 = sub_100008DCC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1003B0B28();
    }
  }
  return 0;
}

- (NSDictionary)thumperDeviceInfo
{
  v3 = [(CSDCoreTelephonyClient *)self queue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(CSDCoreTelephonyClient *)self client];
  id v9 = 0;
  v5 = [v4 getPhoneServicesDeviceInfo:&v9];
  id v6 = v9;

  if (!v5 && [(id)objc_opt_class() _isNSErrorFatal:v6])
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1003B0B90();
    }
  }

  return (NSDictionary *)v5;
}

- (id)callCapabilitiesForSubscription:(id)a3
{
  id v4 = a3;
  if ((objc_msgSend(v4, "csd_isUnknown") & 1) != 0
    || ([(CSDCoreTelephonyClient *)self client],
        v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = objc_opt_respondsToSelector(),
        v5,
        (v6 & 1) == 0))
  {
    id v11 = 0;
  }
  else
  {
    id v7 = [(CSDCoreTelephonyClient *)self client];
    uint64_t v8 = [v4 context];
    id v14 = 0;
    id v9 = [v7 getCallCapabilities:v8 error:&v14];
    id v10 = v14;

    if (v9)
    {
      id v11 = +[CSDCTCallCapabilities callCapabilitiesForCTCallCapabilities:v9];
    }
    else
    {
      if ([(id)objc_opt_class() _isNSErrorFatal:v10])
      {
        v12 = sub_100008DCC();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_1003B0BF8();
        }
      }
      id v11 = 0;
    }
  }

  return v11;
}

- (id)capabilityInfoForSubscription:(id)a3 capability:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CSDCoreTelephonyClient *)self queue];
  dispatch_assert_queue_V2(v8);

  if (objc_msgSend(v6, "csd_isUnknown"))
  {
    id v9 = 0;
  }
  else
  {
    char v16 = 0;
    id v10 = [(CSDCoreTelephonyClient *)self client];
    id v11 = [v6 context];
    id v15 = 0;
    v12 = [v10 context:v11 getCapability:v7 status:&v16 with:&v15];
    id v9 = v15;

    if (!v9 && [(id)objc_opt_class() _isNSErrorFatal:v12])
    {
      long long v13 = sub_100008DCC();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1003B0C60();
      }
    }
  }

  return v9;
}

- (id)systemCapabilitiesForSubscription:(id)a3
{
  id v4 = a3;
  v5 = [(CSDCoreTelephonyClient *)self queue];
  dispatch_assert_queue_V2(v5);

  if (objc_msgSend(v4, "csd_isUnknown"))
  {
    id v6 = 0;
  }
  else
  {
    id v7 = [(CSDCoreTelephonyClient *)self client];
    uint64_t v8 = [v4 context];
    id v12 = 0;
    id v6 = [v7 context:v8 getSystemCapabilities:&v12];
    id v9 = v12;

    if (!v6 && [(id)objc_opt_class() _isNSErrorFatal:v9])
    {
      id v10 = sub_100008DCC();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1003B0CC8();
      }
    }
  }

  return v6;
}

- (void)setSubscription:(id)a3 capability:(id)a4 enabled:(BOOL)a5 info:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  long long v13 = [(CSDCoreTelephonyClient *)self queue];
  dispatch_assert_queue_V2(v13);

  if (objc_msgSend(v10, "csd_isUnknown"))
  {
    [(CSDCoreTelephonyClient *)self setLegacyCapability:v11 enabled:v7 capabilityInformation:v12];
  }
  else
  {
    id v14 = sub_100008DCC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412802;
      *(void *)objc_super v20 = v11;
      *(_WORD *)&v20[8] = 1024;
      *(_DWORD *)&v20[10] = v7;
      __int16 v21 = 2112;
      id v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Calling -[CoreTelephonyClient context:setCapability:enabled:with:completion:] with capability: %@ enabled: %d info: %@", (uint8_t *)&v19, 0x1Cu);
    }

    id v15 = [(CSDCoreTelephonyClient *)self client];
    char v16 = [v10 context];
    v17 = [v15 context:v16 setCapability:v11 enabled:v7 with:v12];

    if (v17)
    {
      id v18 = sub_100008DCC();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v19 = 67109890;
        *(_DWORD *)objc_super v20 = v7;
        *(_WORD *)&v20[4] = 2112;
        *(void *)&v20[6] = v11;
        __int16 v21 = 2112;
        id v22 = v12;
        __int16 v23 = 2112;
        v24 = v17;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to set enabled=%d for capability %@ with info %@: %@", (uint8_t *)&v19, 0x26u);
      }
    }
  }
}

- (void)addSecondaryThumperDeviceWithIDSDeviceIdentifier:(id)a3 toSubscription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CSDCoreTelephonyClient *)self queue];
  dispatch_assert_queue_V2(v8);

  if ((objc_msgSend(v7, "csd_isUnknown") & 1) == 0)
  {
    id v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Calling -[CoreTelephonyClient context:addPhoneServicesDevice:withCompletion:] with idsDeviceIdentifier: %@", buf, 0xCu);
    }

    id v10 = [(CSDCoreTelephonyClient *)self client];
    id v11 = [v7 context];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001B6CD8;
    v12[3] = &unk_100506100;
    id v13 = v6;
    [v10 context:v11 addPhoneServicesDevice:v13 withCompletion:v12];
  }
}

- (void)removeSecondaryThumperDeviceWithIDSDeviceIdentifier:(id)a3 fromSubscription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CSDCoreTelephonyClient *)self queue];
  dispatch_assert_queue_V2(v8);

  if ((objc_msgSend(v7, "csd_isUnknown") & 1) == 0)
  {
    id v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Calling -[CoreTelephonyClient context:removePhoneServicesDevice:withCompletion:] with idsDeviceIdentifier: %@", buf, 0xCu);
    }

    id v10 = [(CSDCoreTelephonyClient *)self client];
    id v11 = [v7 context];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001B6EBC;
    v12[3] = &unk_100506100;
    id v13 = v6;
    [v10 context:v11 removePhoneServicesDevice:v13 withCompletion:v12];
  }
}

- (void)recheckAccountStatusForSubscription:(id)a3 capability:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CSDCoreTelephonyClient *)self queue];
  dispatch_assert_queue_V2(v8);

  if ((objc_msgSend(v6, "csd_isUnknown") & 1) == 0)
  {
    id v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Calling -[CoreTelephonyClient context:recheckPhoneServicesAccountStatus:] with capability: %@", (uint8_t *)&v13, 0xCu);
    }

    id v10 = [(CSDCoreTelephonyClient *)self client];
    id v11 = [v6 context];
    id v12 = [v10 context:v11 recheckPhoneServicesAccountStatus:v7];
  }
}

- (void)endEmergencyCallbackMode
{
  uint64_t v2 = [(CSDCoreTelephonyClient *)self queue];
  dispatch_assert_queue_V2(v2);

  v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    CFStringRef v7 = @"NO";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Calling _CTServerConnectionEnableEmergencyCallBackMode() with %@", (uint8_t *)&v6, 0xCu);
  }

  TUCTServerConnection();
  uint64_t v4 = _CTServerConnectionEnableEmergencyCallBackMode();
  if ([(id)objc_opt_class() _isCTErrorFatal:v4])
  {
    v5 = sub_100008DCC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1003B0B28();
    }
  }
}

- (void)setLegacyCapability:(id)a3 enabled:(BOOL)a4 capabilityInformation:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  id v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412802;
    id v13 = v7;
    __int16 v14 = 1024;
    int v15 = v6;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Calling _CTServerConnectionSetCapabilityExtended() with capability: %@ value: %d capabilityInformation: %@", (uint8_t *)&v12, 0x1Cu);
  }

  TUCTServerConnection();
  uint64_t v10 = _CTServerConnectionSetCapabilityExtended();
  if ([(id)objc_opt_class() _isCTErrorFatal:v10])
  {
    id v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412802;
      id v13 = v7;
      __int16 v14 = 1024;
      int v15 = v10;
      __int16 v16 = 1024;
      LODWORD(v17) = HIDWORD(v10);
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Error setting capability for %@ calling (domain=%d, code=%d)", (uint8_t *)&v12, 0x18u);
    }
  }
}

- (id)legacySystemCapabilities
{
  TUCTServerConnection();
  uint64_t v2 = _CTServerConnectionCopySystemCapabilities();
  if ([(id)objc_opt_class() _isCTErrorFatal:v2])
  {
    v3 = sub_100008DCC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1003B0E08();
    }
  }

  return 0;
}

- (void)legacyAddSecondaryThumperDeviceWithIDSDeviceIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = kCTCapabilityPhoneServices;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    *(void *)id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Calling _CTServerConnectionPhoneServicesAddDevice() with capability: %@ idsDeviceIdentifier: %@", (uint8_t *)&v8, 0x16u);
  }

  TUCTServerConnection();
  uint64_t v6 = _CTServerConnectionPhoneServicesAddDevice();
  if ([(id)objc_opt_class() _isCTErrorFatal:v6])
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412802;
      uint64_t v9 = v4;
      __int16 v10 = 1024;
      *(_DWORD *)id v11 = v6;
      *(_WORD *)&v11[4] = 1024;
      *(_DWORD *)&v11[6] = HIDWORD(v6);
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error adding device for %@ calling (domain=%d, code=%d)", (uint8_t *)&v8, 0x18u);
    }
  }
}

- (void)legacyRemoveSecondaryThumperDeviceWithIDSDeviceIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = kCTCapabilityPhoneServices;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    *(void *)id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Calling _CTServerConnectionPhoneServicesRemoveDevice() with capability: %@ idsDeviceIdentifier: %@", (uint8_t *)&v8, 0x16u);
  }

  TUCTServerConnection();
  uint64_t v6 = _CTServerConnectionPhoneServicesRemoveDevice();
  if ([(id)objc_opt_class() _isCTErrorFatal:v6])
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412802;
      uint64_t v9 = v4;
      __int16 v10 = 1024;
      *(_DWORD *)id v11 = v6;
      *(_WORD *)&v11[4] = 1024;
      *(_DWORD *)&v11[6] = HIDWORD(v6);
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error removing device for %@ calling (domain=%d, code=%d)", (uint8_t *)&v8, 0x18u);
    }
  }
}

- (void)legacyRecheckAccountStatusForCapability:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sub_100008DCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Calling _CTServerConnectionPhoneServicesAccountStatusChanged() and _CTServerConnectionSendBarrier() with capability: %@", buf, 0xCu);
  }

  TUCTServerConnection();
  id v5 = v3;
  uint64_t v6 = &__kCFBooleanTrue;
  +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  _CTServerConnectionPhoneServicesAccountStatusChanged();
  TUCTServerConnection();
  _CTServerConnectionSendBarrier();
}

- (id)accountISOCountryCodeForSubscriptionUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCoreTelephonyClient *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(CSDCoreTelephonyClient *)self _subscriptionWithUUID:v4];
  if (v6)
  {
    id v7 = [(CSDCoreTelephonyClient *)self client];
    id v8 = [v6 context];
    id v17 = 0;
    id v9 = [v7 copyMobileSubscriberCountryCode:v8 error:&v17];
    __int16 v10 = v17;

    if (v9)
    {
      id v11 = [(CSDCoreTelephonyClient *)self client];
      __int16 v16 = v10;
      id v12 = [v11 copyMobileSubscriberIsoCountryCode:v9 error:&v16];
      id v13 = v16;

      if ([v12 length] || !objc_msgSend((id)objc_opt_class(), "_isNSErrorFatal:", v13)) {
        goto LABEL_15;
      }
      __int16 v14 = sub_100008DCC();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1003B0F40();
      }
    }
    else
    {
      if (![(id)objc_opt_class() _isNSErrorFatal:v10])
      {
        id v12 = 0;
        goto LABEL_16;
      }
      __int16 v14 = sub_100008DCC();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1003B0ED8();
      }
      id v12 = 0;
      id v13 = v10;
    }

LABEL_15:
    __int16 v10 = v13;
LABEL_16:

    goto LABEL_17;
  }
  __int16 v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_1003B0E70();
  }
  id v12 = 0;
LABEL_17:

  return v12;
}

- (BOOL)isInHomeCountryForSubscriptionUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCoreTelephonyClient *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(CSDCoreTelephonyClient *)self _subscriptionWithUUID:v4];

  if (v6)
  {
    id v7 = +[CTXPCServiceSubscriptionContext contextWithSlot:](CTXPCServiceSubscriptionContext, "contextWithSlot:", [v6 slotID]);
    id v8 = [(CSDCoreTelephonyClient *)self client];
    id v15 = 0;
    id v9 = [v8 getRoamingStatus:v7 error:&v15];
    id v10 = v15;

    if (v10)
    {
      _IMWarn();
      unsigned int v11 = 0;
    }
    else
    {
      unsigned int v11 = [v9 isVoiceRoaming] ^ 1;
    }
    id v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v13 = @"NO";
      if (v11) {
        CFStringRef v13 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      CFStringRef v17 = v13;
      __int16 v18 = 2112;
      int v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "isInHomeCountryForSubscriptionUUID: %@ for subscription context - %@.", buf, 0x16u);
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (id)spamIdentifiersForSubscriptionUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCoreTelephonyClient *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(CSDCoreTelephonyClient *)self carrierBundleProviderController];
  id v7 = [v6 spamIdentifiersForSubscriptionUUID:v4];

  return v7;
}

- (id)ISOCountryCodeForSubscriptionUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCoreTelephonyClient *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(CSDCoreTelephonyClient *)self _subscriptionWithUUID:v4];
  if (v6)
  {
    id v17 = 0;
    id v7 = [(CSDCoreTelephonyClient *)self mobileCountryCodeForSubscription:v6 error:&v17];
    id v8 = v17;
    id v9 = v8;
    if (v7)
    {
      __int16 v16 = v8;
      id v10 = [(CSDCoreTelephonyClient *)self mobileNetworkCodeForSubscription:v6 error:&v16];
      unsigned int v11 = v16;

      if (v10)
      {
        id v12 = sub_100008DCC();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          int v19 = v7;
          __int16 v20 = 2112;
          __int16 v21 = v10;
          __int16 v22 = 2112;
          __int16 v23 = v6;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Retrieved mobile country code %@ and mobile network code %@ for subscription %@", buf, 0x20u);
        }

        CFStringRef v13 = [(CSDCoreTelephonyClient *)self ISOCountryCodeForMobileCountryCode:v7 mobileNetworkCode:v10];
      }
      else
      {
        if ([(id)objc_opt_class() _isNSErrorFatal:v11])
        {
          __int16 v14 = sub_100008DCC();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            sub_1003B0FA8();
          }
        }
        CFStringRef v13 = 0;
      }
    }
    else
    {
      if (![(id)objc_opt_class() _isNSErrorFatal:v8])
      {
        CFStringRef v13 = 0;
        goto LABEL_20;
      }
      id v10 = sub_100008DCC();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1003B0ED8();
      }
      CFStringRef v13 = 0;
      unsigned int v11 = v9;
    }

    id v9 = v11;
LABEL_20:

    goto LABEL_21;
  }
  id v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_1003B0E70();
  }
  CFStringRef v13 = 0;
LABEL_21:

  return v13;
}

- (id)ISOCountryCodeForMobileCountryCode:(id)a3 mobileNetworkCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDCoreTelephonyClient *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDCoreTelephonyClient *)self mobileCodesToISOCountryCode];
  id v10 = [v9 objectForKeyedSubscript:v6];
  unsigned int v11 = [v10 objectForKeyedSubscript:v7];

  if ([v11 length])
  {
    id v12 = v11;
  }
  else
  {
    *(void *)buf = 0;
    TUCTServerConnection();
    uint64_t v13 = _CTServerConnectionCopyISOForMCC();
    id v12 = v11;
    if ([(id)objc_opt_class() _isCTErrorFatal:v13])
    {
      __int16 v14 = sub_100008DCC();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1003B1010();
      }
    }
  }
  id v15 = sub_100008DCC();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v12;
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Retrieved ISO country code %@ for mobile country code %@ and mobile network code %@", buf, 0x20u);
  }

  return v12;
}

- (id)mobileCountryCodeForSubscription:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CSDCoreTelephonyClient *)self queue];
  dispatch_assert_queue_V2(v7);

  if (objc_msgSend(v6, "csd_isUnknown"))
  {
    id v8 = 0;
  }
  else
  {
    id v9 = [(CSDCoreTelephonyClient *)self client];
    id v10 = [v6 context];
    id v8 = [v9 copyMobileCountryCode:v10 error:a4];
  }

  return v8;
}

- (id)mobileNetworkCodeForSubscription:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CSDCoreTelephonyClient *)self queue];
  dispatch_assert_queue_V2(v7);

  if (objc_msgSend(v6, "csd_isUnknown"))
  {
    id v8 = 0;
  }
  else
  {
    id v9 = [(CSDCoreTelephonyClient *)self client];
    id v10 = [v6 context];
    id v8 = [v9 copyMobileNetworkCode:v10 error:a4];
  }

  return v8;
}

+ (BOOL)_isCTErrorFatal:(id)a3
{
  return a3 != 0x2300000001 && a3.var0 != 0;
}

+ (BOOL)_isNSErrorFatal:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3 != 0;
  id v5 = [v3 domain];
  if ([v5 isEqualToString:NSPOSIXErrorDomain])
  {
    id v6 = [v3 code];

    if (v3) {
      BOOL v7 = v6 == (id)35;
    }
    else {
      BOOL v7 = 1;
    }
    BOOL v4 = !v7;
  }
  else
  {
  }
  return v4;
}

- (id)_subscriptionWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCoreTelephonyClient *)self queue];
  dispatch_assert_queue_V2(v5);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(CSDCoreTelephonyClient *)self subscriptions];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        unsigned int v11 = [v10 uuid];
        unsigned int v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)activeSubscriptionsDidChange
{
  id v3 = [(CSDCoreTelephonyClient *)self queue];
  dispatch_assert_queue_V2(v3);

  [(CSDCoreTelephonyClient *)self setActiveContexts:0];
  id v4 = [(CSDCoreTelephonyClient *)self delegate];
  [v4 subscriptionsDidChangeForClient:self];
}

- (void)callCapabilitiesChanged:(id)a3 capabilities:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CSDCoreTelephonyClient *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [v7 uuid];

  id v10 = [(CSDCoreTelephonyClient *)self _subscriptionWithUUID:v9];

  if (v10)
  {
    unsigned int v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      long long v15 = v10;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received delegate callback callCapabilitiesChanged: with context: %@ info: %@", (uint8_t *)&v14, 0x16u);
    }

    unsigned int v12 = +[CSDCTCallCapabilities callCapabilitiesForCTCallCapabilities:v6];
    uint64_t v13 = [(CSDCoreTelephonyClient *)self delegate];
    [v13 client:self subscription:v10 callCapabilitiesDidChange:v12];
  }
}

- (void)context:(id)a3 capabilitiesChanged:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CSDCoreTelephonyClient *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [v7 uuid];

  id v10 = [(CSDCoreTelephonyClient *)self _subscriptionWithUUID:v9];

  if (v10)
  {
    unsigned int v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      int v14 = v10;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received context:capabilitiesChanged: with context: %@ info: %@", (uint8_t *)&v13, 0x16u);
    }

    unsigned int v12 = [(CSDCoreTelephonyClient *)self delegate];
    [v12 client:self subscription:v10 capabilitiesDidChange:v6];
  }
}

- (void)phoneServicesCapabilitiesChanged:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v12 = (id)objc_opt_class();
    __int16 v13 = 2112;
    id v14 = v4;
    id v6 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling phoneServicesCapabilitiesChanged: with userInfo %@", buf, 0x16u);
  }
  id v7 = [(CSDCoreTelephonyClient *)self queue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001B8818;
  v9[3] = &unk_100504F10;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

- (void)ctEmergencyCallbackModeStatusChangedWithUserInfo:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received kCTEmergencyCallBackModeStatusNotification with userInfo %@", buf, 0xCu);
  }

  id v6 = [(CSDCoreTelephonyClient *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B8988;
  block[3] = &unk_100504EC0;
  block[4] = self;
  dispatch_async(v6, block);
}

- (CSDCoreTelephonyClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSDCoreTelephonyClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setCarrierBundleProviderController:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void)setActiveContexts:(id)a3
{
}

- (NSMutableDictionary)mobileCodesToISOCountryCode
{
  return self->_mobileCodesToISOCountryCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileCodesToISOCountryCode, 0);
  objc_storeStrong((id *)&self->_activeContexts, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_carrierBundleProviderController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end