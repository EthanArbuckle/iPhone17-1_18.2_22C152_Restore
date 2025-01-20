@interface StartCallIntentHandlerDataSource
- (BOOL)callRinging;
- (BOOL)callsInProgress;
- (BOOL)canAttemptEmergencyCallsWithoutCellularConnection;
- (BOOL)canAttemptTelephonyCallsWithoutCellularConnection;
- (BOOL)expectFoundInAppsContacts;
- (BOOL)expectUpstreamContactRecommendation;
- (BOOL)hasCamera;
- (BOOL)isAirplaneModeEnabled;
- (BOOL)isDirectFaceTimeAudioCallingCurrentlyAvailable;
- (BOOL)isDirectFaceTimeVideoCallingCurrentlyAvailable;
- (BOOL)isFaceTimeAudioBlocked;
- (BOOL)isFaceTimeVideoBlocked;
- (BOOL)isMMIOrUSSDNumber:(id)a3;
- (BOOL)supportsDisplayingFaceTimeAudioCalls;
- (BOOL)supportsDisplayingFaceTimeVideoCalls;
- (BOOL)supportsFaceTimeAudioCalls;
- (BOOL)supportsFaceTimeVideoCalls;
- (BOOL)supportsPrimaryCalling;
- (BOOL)supportsTelephonyCalls;
- (BOOL)useLegacyContactResolution;
- (BOOL)useLegacyHandleResolution;
- (CallHistoryDataSource)callHistoryDataSource;
- (CoreTelephonyClient)coreTelephonyClient;
- (CoreTelephonyDataSource)coreTelephonyDataSource;
- (EmergencyServicesOverrideProvider)emergencyServicesOverrideProvider;
- (FavoritesDataSource)favoritesDataSource;
- (IntentHandlerFeatureFlags)featureFlags;
- (NSArray)siriEmergencyServices;
- (NSDate)now;
- (NSString)siriLanguageCode;
- (OS_dispatch_queue)dispatchQueue;
- (RadiosPreferences)radiosPreferences;
- (StartCallIntentHandlerDataSource)initWithDispatchQueue:(id)a3 featureFlags:(id)a4;
- (StartCallIntentHandlerDataSource)initWithDispatchQueue:(id)a3 featureFlags:(id)a4 emergencyProvider:(id)a5 emergencyServicesOverrideProvider:(id)a6;
- (TUCallCenter)callCenter;
- (TUCallProvider)emergencyProvider;
- (TUCallProviderManager)providerManager;
- (TUContactsDataSource)contactsDataSource;
- (TUSenderIdentityClient)senderIdentityClient;
- (id)fetchSPIHandlesForGroupID:(id)a3;
- (id)restrictedContacts:(id)a3 callProvider:(id)a4;
- (unint64_t)callFilterStatusForDialRequest:(id)a3;
- (void)logOutgoingCallToHandle:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFeatureFlags:(id)a3;
@end

@implementation StartCallIntentHandlerDataSource

- (StartCallIntentHandlerDataSource)initWithDispatchQueue:(id)a3 featureFlags:(id)a4
{
  return [(StartCallIntentHandlerDataSource *)self initWithDispatchQueue:a3 featureFlags:a4 emergencyProvider:self->_emergencyProvider emergencyServicesOverrideProvider:self->_emergencyServicesOverrideProvider];
}

- (StartCallIntentHandlerDataSource)initWithDispatchQueue:(id)a3 featureFlags:(id)a4 emergencyProvider:(id)a5 emergencyServicesOverrideProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)StartCallIntentHandlerDataSource;
  v15 = [(StartCallIntentHandlerDataSource *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_dispatchQueue, a3);
    uint64_t v17 = +[TUCallCenter callCenterWithQueue:v16->_dispatchQueue];
    callCenter = v16->_callCenter;
    v16->_callCenter = (TUCallCenter *)v17;

    objc_storeStrong((id *)&v16->_featureFlags, a4);
    objc_storeStrong((id *)&v16->_emergencyProvider, a5);
    objc_storeStrong((id *)&v16->_emergencyServicesOverrideProvider, a6);
  }

  return v16;
}

- (TUCallProviderManager)providerManager
{
  providerManager = self->_providerManager;
  if (!providerManager)
  {
    v4 = (TUCallProviderManager *)objc_alloc_init((Class)TUCallProviderManager);
    v5 = self->_providerManager;
    self->_providerManager = v4;

    providerManager = self->_providerManager;
  }

  return providerManager;
}

- (TUCallProvider)emergencyProvider
{
  emergencyProvider = self->_emergencyProvider;
  if (!emergencyProvider)
  {
    v4 = [(StartCallIntentHandlerDataSource *)self providerManager];
    v5 = [v4 emergencyProvider];
    v6 = self->_emergencyProvider;
    self->_emergencyProvider = v5;

    emergencyProvider = self->_emergencyProvider;
  }

  return emergencyProvider;
}

- (EmergencyServicesOverrideProvider)emergencyServicesOverrideProvider
{
  emergencyServicesOverrideProvider = self->_emergencyServicesOverrideProvider;
  if (!emergencyServicesOverrideProvider)
  {
    v4 = objc_alloc_init(EmergencyServicesOverrideProvider);
    v5 = self->_emergencyServicesOverrideProvider;
    self->_emergencyServicesOverrideProvider = v4;

    emergencyServicesOverrideProvider = self->_emergencyServicesOverrideProvider;
  }

  return emergencyServicesOverrideProvider;
}

- (TUSenderIdentityClient)senderIdentityClient
{
  senderIdentityClient = self->_senderIdentityClient;
  if (!senderIdentityClient)
  {
    v4 = (TUSenderIdentityClient *)objc_alloc_init((Class)TUSenderIdentityClient);
    v5 = self->_senderIdentityClient;
    self->_senderIdentityClient = v4;

    senderIdentityClient = self->_senderIdentityClient;
  }

  return senderIdentityClient;
}

- (FavoritesDataSource)favoritesDataSource
{
  favoritesDataSource = self->_favoritesDataSource;
  if (!favoritesDataSource)
  {
    v4 = [[StartCallDefaultFavoritesDataSource alloc] initWithCallCenter:self->_callCenter];
    v5 = self->_favoritesDataSource;
    self->_favoritesDataSource = (FavoritesDataSource *)v4;

    favoritesDataSource = self->_favoritesDataSource;
  }

  return favoritesDataSource;
}

- (CallHistoryDataSource)callHistoryDataSource
{
  callHistoryDataSource = self->_callHistoryDataSource;
  if (!callHistoryDataSource)
  {
    v4 = +[CHManager siriManagerForIntentType:objc_opt_class()];
    v5 = self->_callHistoryDataSource;
    self->_callHistoryDataSource = v4;

    callHistoryDataSource = self->_callHistoryDataSource;
  }

  return callHistoryDataSource;
}

- (RadiosPreferences)radiosPreferences
{
  radiosPreferences = self->_radiosPreferences;
  if (!radiosPreferences)
  {
    v4 = (RadiosPreferences *)objc_alloc_init((Class)RadiosPreferences);
    v5 = self->_radiosPreferences;
    self->_radiosPreferences = v4;

    radiosPreferences = self->_radiosPreferences;
  }

  return radiosPreferences;
}

- (BOOL)supportsFaceTimeAudioCalls
{
  return +[TUCallCapabilities supportsFaceTimeAudioCalls];
}

- (BOOL)supportsFaceTimeVideoCalls
{
  return +[TUCallCapabilities supportsFaceTimeVideoCalls];
}

- (BOOL)isAirplaneModeEnabled
{
  v2 = [(StartCallIntentHandlerDataSource *)self radiosPreferences];
  unsigned __int8 v3 = [v2 airplaneMode];

  return v3;
}

- (unint64_t)callFilterStatusForDialRequest:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v5 = [(StartCallIntentHandlerDataSource *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021464;
  block[3] = &unk_10004D088;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  unint64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)restrictedContacts:(id)a3 callProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  objc_super v20 = sub_100021640;
  v21 = sub_100021650;
  id v22 = 0;
  v8 = [(StartCallIntentHandlerDataSource *)self dispatchQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100021658;
  v13[3] = &unk_10004D0B0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v13);

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (BOOL)supportsPrimaryCalling
{
  return +[TUCallCapabilities supportsPrimaryCalling];
}

- (BOOL)callRinging
{
  unsigned __int8 v3 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Checking if there is any call ringing currently", buf, 2u);
  }

  *(void *)buf = 0;
  id v11 = buf;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  dispatchQueue = self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002188C;
  v9[3] = &unk_10004D0D8;
  v9[4] = self;
  v9[5] = buf;
  dispatch_sync(dispatchQueue, v9);
  v5 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v11[24]) {
      CFStringRef v6 = @"YES";
    }
    else {
      CFStringRef v6 = @"NO";
    }
    *(_DWORD *)id v14 = 138412290;
    CFStringRef v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "is there any call ringing currently? %@", v14, 0xCu);
  }

  uint8_t v7 = v11[24];
  _Block_object_dispose(buf, 8);
  return v7;
}

- (BOOL)callsInProgress
{
  unsigned __int8 v3 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Checking if there is any call in progress.", buf, 2u);
  }

  *(void *)buf = 0;
  id v11 = buf;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  dispatchQueue = self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100021AC8;
  v9[3] = &unk_10004D0D8;
  v9[4] = self;
  v9[5] = buf;
  dispatch_sync(dispatchQueue, v9);
  v5 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v11[24]) {
      CFStringRef v6 = @"YES";
    }
    else {
      CFStringRef v6 = @"NO";
    }
    *(_DWORD *)id v14 = 138412290;
    CFStringRef v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "is there any call in progress? %@", v14, 0xCu);
  }

  uint8_t v7 = v11[24];
  _Block_object_dispose(buf, 8);
  return v7;
}

- (BOOL)hasCamera
{
  uint64_t v6 = 0;
  uint8_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100021BAC;
  v5[3] = &unk_10004D100;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)supportsTelephonyCalls
{
  return +[TUCallCapabilities supportsTelephonyCalls];
}

- (BOOL)isDirectFaceTimeAudioCallingCurrentlyAvailable
{
  return +[TUCallCapabilities isDirectFaceTimeAudioCallingCurrentlyAvailable];
}

- (BOOL)isDirectFaceTimeVideoCallingCurrentlyAvailable
{
  return +[TUCallCapabilities isDirectFaceTimeVideoCallingCurrentlyAvailable];
}

- (BOOL)isFaceTimeAudioBlocked
{
  v2 = +[FTDeviceSupport sharedInstance];
  unsigned __int8 v3 = [v2 callingBlocked];

  return v3;
}

- (BOOL)isFaceTimeVideoBlocked
{
  v2 = +[FTDeviceSupport sharedInstance];
  unsigned __int8 v3 = [v2 faceTimeBlocked];

  return v3;
}

- (BOOL)supportsDisplayingFaceTimeAudioCalls
{
  return +[TUCallCapabilities supportsDisplayingFaceTimeAudioCalls];
}

- (BOOL)supportsDisplayingFaceTimeVideoCalls
{
  return +[TUCallCapabilities supportsDisplayingFaceTimeVideoCalls];
}

- (BOOL)canAttemptTelephonyCallsWithoutCellularConnection
{
  return +[TUCallCapabilities canAttemptTelephonyCallsWithoutCellularConnection];
}

- (BOOL)canAttemptEmergencyCallsWithoutCellularConnection
{
  return +[TUCallCapabilities canAttemptEmergencyCallsWithoutCellularConnection];
}

- (void)logOutgoingCallToHandle:(id)a3
{
}

- (NSString)siriLanguageCode
{
  return +[INPreferences siriLanguageCode];
}

- (TUContactsDataSource)contactsDataSource
{
  v2 = [(StartCallIntentHandlerDataSource *)self callCenter];
  unsigned __int8 v3 = [v2 contactStore];

  return (TUContactsDataSource *)v3;
}

- (CoreTelephonyDataSource)coreTelephonyDataSource
{
  return (CoreTelephonyDataSource *)+[DefaultCoreTelephonyDataSource sharedInstance];
}

- (NSDate)now
{
  return +[NSDate date];
}

- (BOOL)useLegacyContactResolution
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"UseLegacyContactResolution"];

  return v3;
}

- (BOOL)useLegacyHandleResolution
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"UseLegacyHandleResolution"];

  return v3;
}

- (NSArray)siriEmergencyServices
{
  unsigned __int8 v3 = [(StartCallIntentHandlerDataSource *)self featureFlags];
  unsigned __int8 v4 = [v3 emergencyServicesOverrideEnabled];

  if ((v4 & 1) == 0)
  {
    uint64_t v8 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100032164();
    }
    goto LABEL_7;
  }
  v5 = [(StartCallIntentHandlerDataSource *)self emergencyProvider];
  uint64_t v6 = [v5 emergencyLabeledHandles];
  id v7 = [v6 count];

  uint64_t v8 = IntentHandlerDefaultLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v9) {
      sub_1000320FC();
    }
LABEL_7:

    id v10 = [(StartCallIntentHandlerDataSource *)self emergencyProvider];
    uint64_t v11 = [v10 emergencyLabeledHandles];
    goto LABEL_8;
  }
  if (v9) {
    sub_1000320C8();
  }

  id v10 = [(StartCallIntentHandlerDataSource *)self emergencyServicesOverrideProvider];
  uint64_t v11 = [v10 emergencyServicesOverrides];
LABEL_8:
  uint64_t v12 = (void *)v11;

  return (NSArray *)v12;
}

- (BOOL)expectUpstreamContactRecommendation
{
  v2 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = _os_feature_enabled_impl();
    CFStringRef v4 = @"OFF";
    if (v3) {
      CFStringRef v4 = @"ON";
    }
    int v6 = 138412290;
    CFStringRef v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "SiriInference/native_flow_contact_resolution: %@", (uint8_t *)&v6, 0xCu);
  }

  return _os_feature_enabled_impl();
}

- (BOOL)expectFoundInAppsContacts
{
  v2 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = _os_feature_enabled_impl();
    CFStringRef v4 = @"OFF";
    if (v3) {
      CFStringRef v4 = @"ON";
    }
    int v6 = 138412290;
    CFStringRef v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "SiriInference/found_in_app_contacts: %@", (uint8_t *)&v6, 0xCu);
  }

  return _os_feature_enabled_impl();
}

- (BOOL)isMMIOrUSSDNumber:(id)a3
{
  return _TUIsMMIOrUSSDNumber(a3, a2);
}

- (id)fetchSPIHandlesForGroupID:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = dispatch_queue_attr_make_with_qos_class((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, QOS_CLASS_UNSPECIFIED, 0);
  dispatch_queue_t v6 = dispatch_queue_create("com.apple.messages.imcore.spi.qos-unspecified", v5);

  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  objc_super v20 = sub_100021640;
  v21 = sub_100021650;
  id v22 = 0;
  if ([v3 length])
  {
    v16 = dispatch_semaphore_create(0);
    IMSPIQueryChatWithGuid();
    dispatch_time_t v7 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v16, v7);
  }
  uint64_t v8 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = [(id)v18[5] handles];
    *(_DWORD *)buf = 138412290;
    v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "spiChat person handles: %@", buf, 0xCu);
  }
  id v10 = (void *)v18[5];
  if (v10)
  {
    uint64_t v11 = [v10 handles];
    BOOL v12 = [v11 count] == 0;

    if (!v12)
    {
      char v13 = [(id)v18[5] handles];
      id v14 = [v13 copy];

      id v4 = v14;
    }
  }
  _Block_object_dispose(&v17, 8);

  return v4;
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (TUCallCenter)callCenter
{
  return self->_callCenter;
}

- (IntentHandlerFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_radiosPreferences, 0);
  objc_storeStrong((id *)&self->_emergencyServicesOverrideProvider, 0);
  objc_storeStrong((id *)&self->_callCenter, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_callHistoryDataSource, 0);
  objc_storeStrong((id *)&self->_favoritesDataSource, 0);
  objc_storeStrong((id *)&self->_senderIdentityClient, 0);
  objc_storeStrong((id *)&self->_emergencyProvider, 0);

  objc_storeStrong((id *)&self->_providerManager, 0);
}

@end