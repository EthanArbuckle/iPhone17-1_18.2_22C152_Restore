@interface CSDDaemon
- (CHManager)chManager;
- (CPApplicationPolicyManager)applicationPolicyManager;
- (CSDAssistantServicesObserver)assistantServicesObserver;
- (CSDAudioController)audioController;
- (CSDCallStateController)callStateController;
- (CSDCallStateMonitor)callStateMonitor;
- (CSDConversationProviderManager)conversationProviderManager;
- (CSDConversationProviderManagerXPCServer)conversationProviderManagerXPCServer;
- (CSDDaemon)init;
- (CSDDeviceLockStateObserver)deviceLockStateObserver;
- (CSDDualSIMRingtoneHelper)dualSIMRingtoneHelper;
- (CSDHandoffAudioController)handoffAudioController;
- (CSDOrientationMonitor)orientationMonitor;
- (CSDPowerAssertionManager)powerAssertionManager;
- (CSDProximityController)proximityController;
- (CSDProximitySensorObserver)proximitySensorObserver;
- (CSDRaiseToAnswerController)raiseToAnswerController;
- (CSDRelayClientController)relayClientController;
- (CSDRelayCommonController)relayCommonController;
- (CSDRelayConversationController)relayConversationController;
- (CSDRelayHostController)relayHostController;
- (CSDRelayMessagingController)relayMessagingController;
- (CSDStatusBarManager)statusBarManager;
- (CSDUserNotificationController)userNotificationController;
- (CSDVoIPApplicationController)voipApplicationController;
- (CSDVoiceOverObserver)voiceOverObserver;
- (NSMutableArray)signalHandlerDispatchSources;
- (NSString)debugDescription;
- (OS_dispatch_queue)queue;
- (TUFeatureFlags)featureFlags;
- (TUUserConfiguration)userConfiguration;
- (_TtC13callservicesd19CSDAnalyticsManager)analyticsManager;
- (id)_setUpTemporaryDirectory;
- (void)_observeSignal:(int)a3 usingHandler:(id)a4;
- (void)_setUpLanguageChangeListener;
- (void)_setUpSandbox;
- (void)dealloc;
- (void)propertiesDidChangeForConfiguration:(id)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setApplicationPolicyManager:(id)a3;
- (void)setAudioController:(id)a3;
- (void)setCallStateController:(id)a3;
- (void)setCallStateMonitor:(id)a3;
- (void)setChManager:(id)a3;
- (void)setDeviceLockStateObserver:(id)a3;
- (void)setDualSIMRingtoneHelper:(id)a3;
- (void)setFeatureFlags:(id)a3;
- (void)setHandoffAudioController:(id)a3;
- (void)setOrientationMonitor:(id)a3;
- (void)setPowerAssertionManager:(id)a3;
- (void)setProximityController:(id)a3;
- (void)setProximitySensorObserver:(id)a3;
- (void)setRaiseToAnswerController:(id)a3;
- (void)setRelayClientController:(id)a3;
- (void)setRelayCommonController:(id)a3;
- (void)setRelayConversationController:(id)a3;
- (void)setRelayHostController:(id)a3;
- (void)setRelayMessagingController:(id)a3;
- (void)setSignalHandlerDispatchSources:(id)a3;
- (void)setStatusBarManager:(id)a3;
- (void)setUserConfiguration:(id)a3;
- (void)setUserNotificationController:(id)a3;
- (void)setVoiceOverObserver:(id)a3;
- (void)setVoipApplicationController:(id)a3;
@end

@implementation CSDDaemon

- (CSDDaemon)init
{
  v19.receiver = self;
  v19.super_class = (Class)CSDDaemon;
  id v2 = [(CSDDaemon *)&v19 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    v15 = sub_10009B0A4;
    v16 = &unk_100505698;
    objc_copyWeak(&v17, &location);
    v3 = objc_retainBlock(&v13);
    v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.telephonyutilities.callservicesd.calls", v4);
    v6 = (void *)*((void *)v2 + 27);
    *((void *)v2 + 27) = v5;

    v7 = [CSDAssistantServicesObserver alloc];
    v8 = -[CSDAssistantServicesObserver initWithQueue:](v7, "initWithQueue:", *((void *)v2 + 27), v13, v14, v15, v16);
    v9 = (void *)*((void *)v2 + 17);
    *((void *)v2 + 17) = v8;

    uint64_t v10 = +[CSDAnalyticsManager sharedInstance];
    v11 = (void *)*((void *)v2 + 30);
    *((void *)v2 + 30) = v10;

    dispatch_sync(*((dispatch_queue_t *)v2 + 27), v3);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return (CSDDaemon *)v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v4 = [(CSDDaemon *)self signalHandlerDispatchSources];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        dispatch_source_cancel(*(dispatch_source_t *)(*((void *)&v10 + 1) + 8 * (void)v8));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)CSDDaemon;
  [(CSDDaemon *)&v9 dealloc];
}

- (void)_observeSignal:(int)a3 usingHandler:(id)a4
{
  id v6 = a4;
  signal(a3, (void (__cdecl *)(int))1);
  uint64_t v7 = [(CSDDaemon *)self queue];
  source = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, a3, 0, v7);

  dispatch_source_set_event_handler(source, v6);
  v8 = [(CSDDaemon *)self signalHandlerDispatchSources];
  [v8 addObject:source];

  dispatch_resume(source);
}

- (NSString)debugDescription
{
  v3 = +[NSMutableString string];
  v4 = +[TUCallCenter sharedInstance];
  id v5 = [v4 debugDescription];
  [v3 appendFormat:@"%@\n", v5];

  id v6 = +[TUCallCapabilities debugDescription];
  [v3 appendFormat:@"%@\n", v6];

  uint64_t v7 = +[CSDCallCapabilities sharedInstance];
  v8 = [v7 debugDescription];
  [v3 appendFormat:@"%@\n", v8];

  objc_super v9 = +[CSDRelayIDSService sharedInstance];
  long long v10 = [v9 debugDescription];
  [v3 appendFormat:@"%@\n", v10];

  long long v11 = [(CSDDaemon *)self relayMessagingController];
  long long v12 = [v11 debugDescription];
  [v3 appendFormat:@"%@\n", v12];

  return (NSString *)v3;
}

- (void)_setUpLanguageChangeListener
{
  int out_token = 0;
  id v2 = dispatch_get_global_queue(2, 0);
  notify_register_dispatch("com.apple.language.changed", &out_token, v2, &stru_100506740);
}

- (id)_setUpTemporaryDirectory
{
  bzero(v6, 0x400uLL);
  [TUBundleIdentifierTelephonyUtilitiesFramework UTF8String];
  if (!_set_user_dir_suffix() || !confstr(65537, v6, 0x400uLL) || mkdir(v6, 0x1C0u) && *__error() != 17)
  {
    v4 = sub_100008DCC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1003A93E0();
    }
LABEL_13:

    exit(1);
  }
  bzero(v5, 0x400uLL);
  if (!realpath_DARWIN_EXTSN(v6, v5))
  {
    v4 = sub_100008DCC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1003A9468();
    }
    goto LABEL_13;
  }
  id v2 = +[NSString stringWithUTF8String:v5];

  return v2;
}

- (void)_setUpSandbox
{
  id v2 = [(CSDDaemon *)self _setUpTemporaryDirectory];
}

- (void)propertiesDidChangeForConfiguration:(id)a3
{
  v4 = sub_100008DCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "User configuration changed", v6, 2u);
  }

  id v5 = [(CSDDaemon *)self userConfiguration];
  [v5 synchronize];
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
}

- (CSDConversationProviderManagerXPCServer)conversationProviderManagerXPCServer
{
  return self->_conversationProviderManagerXPCServer;
}

- (CSDConversationProviderManager)conversationProviderManager
{
  return self->_conversationProviderManager;
}

- (CHManager)chManager
{
  return self->_chManager;
}

- (void)setChManager:(id)a3
{
}

- (CSDCallStateController)callStateController
{
  return self->_callStateController;
}

- (void)setCallStateController:(id)a3
{
}

- (CSDCallStateMonitor)callStateMonitor
{
  return self->_callStateMonitor;
}

- (void)setCallStateMonitor:(id)a3
{
}

- (CSDRelayConversationController)relayConversationController
{
  return self->_relayConversationController;
}

- (void)setRelayConversationController:(id)a3
{
}

- (CSDRelayMessagingController)relayMessagingController
{
  return self->_relayMessagingController;
}

- (void)setRelayMessagingController:(id)a3
{
}

- (CSDRelayClientController)relayClientController
{
  return self->_relayClientController;
}

- (void)setRelayClientController:(id)a3
{
}

- (CSDRelayHostController)relayHostController
{
  return self->_relayHostController;
}

- (void)setRelayHostController:(id)a3
{
}

- (CSDRelayCommonController)relayCommonController
{
  return self->_relayCommonController;
}

- (void)setRelayCommonController:(id)a3
{
}

- (CSDVoIPApplicationController)voipApplicationController
{
  return self->_voipApplicationController;
}

- (void)setVoipApplicationController:(id)a3
{
}

- (TUUserConfiguration)userConfiguration
{
  return self->_userConfiguration;
}

- (void)setUserConfiguration:(id)a3
{
}

- (CSDUserNotificationController)userNotificationController
{
  return self->_userNotificationController;
}

- (void)setUserNotificationController:(id)a3
{
}

- (CSDVoiceOverObserver)voiceOverObserver
{
  return self->_voiceOverObserver;
}

- (void)setVoiceOverObserver:(id)a3
{
}

- (NSMutableArray)signalHandlerDispatchSources
{
  return self->_signalHandlerDispatchSources;
}

- (void)setSignalHandlerDispatchSources:(id)a3
{
}

- (CSDAssistantServicesObserver)assistantServicesObserver
{
  return self->_assistantServicesObserver;
}

- (CSDDeviceLockStateObserver)deviceLockStateObserver
{
  return self->_deviceLockStateObserver;
}

- (void)setDeviceLockStateObserver:(id)a3
{
}

- (CSDOrientationMonitor)orientationMonitor
{
  return self->_orientationMonitor;
}

- (void)setOrientationMonitor:(id)a3
{
}

- (CSDProximityController)proximityController
{
  return self->_proximityController;
}

- (void)setProximityController:(id)a3
{
}

- (CSDProximitySensorObserver)proximitySensorObserver
{
  return self->_proximitySensorObserver;
}

- (void)setProximitySensorObserver:(id)a3
{
}

- (CSDRaiseToAnswerController)raiseToAnswerController
{
  return self->_raiseToAnswerController;
}

- (void)setRaiseToAnswerController:(id)a3
{
}

- (CSDPowerAssertionManager)powerAssertionManager
{
  return self->_powerAssertionManager;
}

- (void)setPowerAssertionManager:(id)a3
{
}

- (CSDAudioController)audioController
{
  return self->_audioController;
}

- (void)setAudioController:(id)a3
{
}

- (CSDHandoffAudioController)handoffAudioController
{
  return self->_handoffAudioController;
}

- (void)setHandoffAudioController:(id)a3
{
}

- (CSDStatusBarManager)statusBarManager
{
  return self->_statusBarManager;
}

- (void)setStatusBarManager:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CPApplicationPolicyManager)applicationPolicyManager
{
  return self->_applicationPolicyManager;
}

- (void)setApplicationPolicyManager:(id)a3
{
}

- (CSDDualSIMRingtoneHelper)dualSIMRingtoneHelper
{
  return self->_dualSIMRingtoneHelper;
}

- (void)setDualSIMRingtoneHelper:(id)a3
{
}

- (_TtC13callservicesd19CSDAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_dualSIMRingtoneHelper, 0);
  objc_storeStrong((id *)&self->_applicationPolicyManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_statusBarManager, 0);
  objc_storeStrong((id *)&self->_handoffAudioController, 0);
  objc_storeStrong((id *)&self->_audioController, 0);
  objc_storeStrong((id *)&self->_powerAssertionManager, 0);
  objc_storeStrong((id *)&self->_raiseToAnswerController, 0);
  objc_storeStrong((id *)&self->_proximitySensorObserver, 0);
  objc_storeStrong((id *)&self->_proximityController, 0);
  objc_storeStrong((id *)&self->_orientationMonitor, 0);
  objc_storeStrong((id *)&self->_deviceLockStateObserver, 0);
  objc_storeStrong((id *)&self->_assistantServicesObserver, 0);
  objc_storeStrong((id *)&self->_signalHandlerDispatchSources, 0);
  objc_storeStrong((id *)&self->_voiceOverObserver, 0);
  objc_storeStrong((id *)&self->_userNotificationController, 0);
  objc_storeStrong((id *)&self->_userConfiguration, 0);
  objc_storeStrong((id *)&self->_voipApplicationController, 0);
  objc_storeStrong((id *)&self->_relayCommonController, 0);
  objc_storeStrong((id *)&self->_relayHostController, 0);
  objc_storeStrong((id *)&self->_relayClientController, 0);
  objc_storeStrong((id *)&self->_relayMessagingController, 0);
  objc_storeStrong((id *)&self->_relayConversationController, 0);
  objc_storeStrong((id *)&self->_callStateMonitor, 0);
  objc_storeStrong((id *)&self->_callStateController, 0);
  objc_storeStrong((id *)&self->_chManager, 0);
  objc_storeStrong((id *)&self->_conversationProviderManager, 0);
  objc_storeStrong((id *)&self->_conversationProviderManagerXPCServer, 0);

  objc_storeStrong((id *)&self->_featureFlags, 0);
}

@end