@interface TUConfigurationProvider
- (BOOL)isAutomaticProminenceAvailable;
- (BOOL)isBlockedContactsAvailable;
- (BOOL)isBrandedCallingAvailable;
- (BOOL)isBrandedCallingEnabled:(BOOL)a3;
- (BOOL)isBusinessConnectCallingAvailable;
- (BOOL)isBusinessConnectCallingEnabled;
- (BOOL)isCallAnnouncementAvailableForPhone;
- (BOOL)isCallBlockingAndIdentificationAvailable;
- (BOOL)isCallForwardingAvailable;
- (BOOL)isCallIdentificationAppsAvailable;
- (BOOL)isCallRecordingAvailable;
- (BOOL)isCallReportingAvailable;
- (BOOL)isCallScreeningAvailable;
- (BOOL)isCallScreeningEnabled;
- (BOOL)isCallWaitingAvailable;
- (BOOL)isDialAssistAvailable;
- (BOOL)isFaceTimeEnabledInSettings;
- (BOOL)isILClassificationAvailable;
- (BOOL)isIncomingCallsAvailableForPhone;
- (BOOL)isLiveLookupAvailable;
- (BOOL)isLivePhotosAvailable;
- (BOOL)isMyNumberAvailable;
- (BOOL)isNetworkSelectionAvailable;
- (BOOL)isRelayPrimaryAvailable;
- (BOOL)isRelaySecondaryAvailable;
- (BOOL)isRespondwithTextAvailable;
- (BOOL)isSIMAvailable;
- (BOOL)isSIMPINAvailable;
- (BOOL)isShareNameAndPhotosAvailable;
- (BOOL)isShowMyCallerIDAvailable;
- (BOOL)isSilenceJunkCallingAvailable;
- (BOOL)isSilenceJunkCallingEnabled;
- (BOOL)isSilenceUnknownCallersEnabledForFaceTime;
- (BOOL)isSilenceUnknownCallersEnabledForPhone;
- (BOOL)isSystemCapabilityAvailableForName:(id)a3;
- (BOOL)isWiFiCallingAvailable;
- (BOOL)supportsBrandedCallingForSubscriptionContext:(id)a3;
- (BOOL)supportsBusinessConnectCallingForSubscriptionContext:(id)a3;
- (BOOL)supportsCallBlockingForSubscriptionContext:(id)a3;
- (BOOL)supportsDialAssistForSubscriptionContext:(id)a3;
- (BOOL)supportsSystemCapabilityWithName:(id)a3 subscriptionContext:(id)a4;
- (CoreTelephonyClient)coreTelephonyClient;
- (LiveLookupManagerProxy)liveLookupExtensionManager;
- (TUCarrierBundleControllerProtocol)carrierBundleController;
- (TUConfigurationProvider)init;
- (TUConfigurationProvider)initWithNotifier:(id)a3;
- (TUConfigurationProviderDelegate)delegate;
- (TUConfigurationProviderNotifier)configurationProviderNotifier;
- (TUUserConfiguration)userConfiguration;
- (id)objectForKeyHierarchy:(id)a3 subscriptionContext:(id)a4 error:(id *)a5;
- (id)stringForKeyHierarchy:(id)a3 subscriptionContext:(id)a4 error:(id *)a5;
- (id)systemCapabilitiesForSubscriptionContext:(id)a3;
- (int)token;
- (void)dealloc;
- (void)postConfigurationChangedNotification;
- (void)setBrandedCallingEnabled:(BOOL)a3 primary:(BOOL)a4;
- (void)setBusinessConnectCallingEnabled:(BOOL)a3;
- (void)setCallScreeningEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setSilenceJunkCallingEnabled:(BOOL)a3;
- (void)setSilenceUnknownCallersEnabledForFaceTime:(BOOL)a3;
- (void)setSilenceUnknownCallersEnabledForPhone:(BOOL)a3;
@end

@implementation TUConfigurationProvider

- (TUConfigurationProvider)init
{
  v3 = objc_alloc_init(ConfigurationProviderDarwinNotifier);
  v4 = [(TUConfigurationProvider *)self initWithNotifier:v3];

  return v4;
}

- (TUConfigurationProvider)initWithNotifier:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)TUConfigurationProvider;
  v6 = [(TUConfigurationProvider *)&v24 init];
  if (v6)
  {
    v7 = objc_alloc_init(TUUserConfiguration);
    userConfiguration = v6->_userConfiguration;
    v6->_userConfiguration = v7;

    objc_storeStrong((id *)&v6->_configurationProviderNotifier, a3);
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2050000000;
    v9 = (void *)getTPSCarrierBundleControllerClass_softClass;
    uint64_t v29 = getTPSCarrierBundleControllerClass_softClass;
    if (!getTPSCarrierBundleControllerClass_softClass)
    {
      location[0] = (id)MEMORY[0x1E4F143A8];
      location[1] = (id)3221225472;
      location[2] = __getTPSCarrierBundleControllerClass_block_invoke;
      location[3] = &unk_1E58E5F90;
      location[4] = &v26;
      __getTPSCarrierBundleControllerClass_block_invoke((uint64_t)location);
      v9 = (void *)v27[3];
    }
    v10 = v9;
    _Block_object_dispose(&v26, 8);
    v11 = (TUCarrierBundleControllerProtocol *)objc_alloc_init(v10);
    carrierBundleController = v6->_carrierBundleController;
    v6->_carrierBundleController = v11;

    v13 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v14 = dispatch_queue_create("TUConfigurationProviderQueue", v13);
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F23A80]) initWithQueue:v14];
    coreTelephonyClient = v6->_coreTelephonyClient;
    v6->_coreTelephonyClient = (CoreTelephonyClient *)v15;

    v17 = objc_alloc_init(LiveLookupManagerProxy);
    liveLookupExtensionManager = v6->_liveLookupExtensionManager;
    v6->_liveLookupExtensionManager = v17;

    objc_initWeak(location, v6);
    v19 = MEMORY[0x1E4F14428];
    id v20 = MEMORY[0x1E4F14428];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __44__TUConfigurationProvider_initWithNotifier___block_invoke;
    v22[3] = &unk_1E58E5F18;
    objc_copyWeak(&v23, location);
    notify_register_dispatch("com.apple.telephonyutilities.configurationChanged", &v6->_token, v19, v22);

    objc_destroyWeak(&v23);
    objc_destroyWeak(location);
  }
  return v6;
}

void __44__TUConfigurationProvider_initWithNotifier___block_invoke(uint64_t a1)
{
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Notification observed from TUConfigurationChangedNotification, notifying delegate", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained delegate];
    [v5 configurationChanged];
  }
}

- (void)dealloc
{
  notify_cancel(self->_token);
  v3.receiver = self;
  v3.super_class = (Class)TUConfigurationProvider;
  [(TUConfigurationProvider *)&v3 dealloc];
}

- (BOOL)isSIMAvailable
{
  v2 = [(TUConfigurationProvider *)self carrierBundleController];
  objc_super v3 = [v2 activeSubscriptions];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isCallReportingAvailable
{
  if (![(TUConfigurationProvider *)self isSIMAvailable]) {
    return 0;
  }
  v2 = [MEMORY[0x1E4F61740] sharedInstance];
  BOOL v3 = [v2 deviceType] == 2;

  return v3;
}

- (BOOL)isSIMPINAvailable
{
  if (![(TUConfigurationProvider *)self isSIMAvailable]) {
    return 0;
  }
  v2 = [MEMORY[0x1E4F61740] sharedInstance];
  BOOL v3 = [v2 deviceType] == 2;

  return v3;
}

- (BOOL)isMyNumberAvailable
{
  if (![(TUConfigurationProvider *)self isSIMAvailable]) {
    return 0;
  }
  v2 = [MEMORY[0x1E4F61740] sharedInstance];
  BOOL v3 = [v2 deviceType] == 2;

  return v3;
}

- (BOOL)isWiFiCallingAvailable
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v2 = [(TUConfigurationProvider *)self carrierBundleController];
  BOOL v3 = [v2 activeSubscriptions];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v29;
    v7 = &off_1E58E5000;
    uint64_t v22 = *(void *)v29;
    id v23 = v3;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v29 != v6) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isSimHidden", v22) & 1) == 0)
        {
          v10 = [v7[135] senderIdentityCapabilities];
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          id v11 = v10;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v25;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v25 != v14) {
                  objc_enumerationMutation(v11);
                }
                v16 = *(void **)(*((void *)&v24 + 1) + 8 * j);
                v17 = [v16 senderIdentityUUID];
                v18 = [v9 uuid];
                if ([v17 isEqual:v18])
                {
                  char v19 = [v16 supportsWiFiCalling];

                  if (v19)
                  {

                    BOOL v20 = 1;
                    BOOL v3 = v23;
                    goto LABEL_23;
                  }
                }
                else
                {
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v13);
          }

          uint64_t v6 = v22;
          BOOL v3 = v23;
          v7 = &off_1E58E5000;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v28 objects:v33 count:16];
      BOOL v20 = 0;
    }
    while (v5);
  }
  else
  {
    BOOL v20 = 0;
  }
LABEL_23:

  return v20;
}

- (BOOL)isNetworkSelectionAvailable
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  BOOL v3 = [(TUConfigurationProvider *)self carrierBundleController];
  uint64_t v4 = [v3 activeSubscriptions];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v23;
    *(void *)&long long v6 = 138412546;
    long long v20 = v6;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isSimHidden", v20) & 1) == 0)
        {
          id v11 = [(TUConfigurationProvider *)self carrierBundleController];
          uint64_t v12 = [v11 telephonyClient];
          id v21 = 0;
          uint64_t v13 = [v12 isNetworkSelectionMenuAvailable:v10 error:&v21];
          id v14 = v21;

          if (!v13)
          {
            uint64_t v15 = [v14 domain];

            if (v15)
            {
              v16 = TUDefaultLog();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v20;
                id v27 = v14;
                __int16 v28 = 2112;
                long long v29 = v10;
                _os_log_error_impl(&dword_19C496000, v16, OS_LOG_TYPE_ERROR, "Retrieving cellular network selection information failed with error %@ for %@.", buf, 0x16u);
              }
            }
          }
          char v17 = [v13 BOOLValue];

          if (v17)
          {
            BOOL v18 = 1;
            goto LABEL_17;
          }
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v18 = 0;
LABEL_17:

  return v18;
}

- (BOOL)isCallForwardingAvailable
{
  if (![(TUConfigurationProvider *)self isSystemCapabilityAvailableForName:*MEMORY[0x1E4F242B8]]|| ![(TUConfigurationProvider *)self isSIMAvailable])
  {
    return 0;
  }
  BOOL v3 = [MEMORY[0x1E4F61740] sharedInstance];
  BOOL v4 = [v3 deviceType] == 2;

  return v4;
}

- (BOOL)isRelayPrimaryAvailable
{
  if (!+[TUCallCapabilities supportsThumperCalling]
    && !+[TUCallCapabilities supportsRelayCalling]
    || !+[TUCallCapabilities supportsPrimaryCalling])
  {
    return 0;
  }

  return +[TUCallCapabilities supportsDisplayingFaceTimeVideoCalls];
}

- (BOOL)isRelaySecondaryAvailable
{
  BOOL v2 = [(TUConfigurationProvider *)self isFaceTimeEnabledInSettings];
  if (v2)
  {
    if (+[TUCallCapabilities supportsPrimaryCalling])
    {
      LOBYTE(v2) = 0;
    }
    else if (+[TUCallCapabilities supportsThumperCalling])
    {
      LOBYTE(v2) = 1;
    }
    else
    {
      LOBYTE(v2) = +[TUCallCapabilities supportsRelayCalling];
    }
  }
  return v2;
}

- (BOOL)isDialAssistAvailable
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v3 = [(TUConfigurationProvider *)self carrierBundleController];
  BOOL v4 = [v3 activeSubscriptions];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([(TUConfigurationProvider *)self supportsDialAssistForSubscriptionContext:*(void *)(*((void *)&v13 + 1) + 8 * i)])
        {
          v9 = [MEMORY[0x1E4F61740] sharedInstance];
          uint64_t v10 = [v9 deviceType];

          if (v10 == 2)
          {
            BOOL v11 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_12:

  return v11;
}

- (BOOL)isShowMyCallerIDAvailable
{
  if (![(TUConfigurationProvider *)self isSystemCapabilityAvailableForName:*MEMORY[0x1E4F242C8]]|| ![(TUConfigurationProvider *)self isSIMAvailable])
  {
    return 0;
  }
  BOOL v3 = [MEMORY[0x1E4F61740] sharedInstance];
  BOOL v4 = [v3 deviceType] == 2;

  return v4;
}

- (BOOL)isCallWaitingAvailable
{
  if (![(TUConfigurationProvider *)self isSystemCapabilityAvailableForName:*MEMORY[0x1E4F242C0]]|| ![(TUConfigurationProvider *)self isSIMAvailable])
  {
    return 0;
  }
  BOOL v3 = [MEMORY[0x1E4F61740] sharedInstance];
  BOOL v4 = [v3 deviceType] == 2;

  return v4;
}

- (BOOL)isILClassificationAvailable
{
  if (![(TUConfigurationProvider *)self isSIMAvailable]) {
    return 0;
  }
  BOOL v2 = [MEMORY[0x1E4F61740] sharedInstance];
  BOOL v3 = [v2 deviceType] == 2;

  return v3;
}

- (BOOL)isIncomingCallsAvailableForPhone
{
  if (![(TUConfigurationProvider *)self isSIMAvailable]) {
    return 0;
  }
  BOOL v2 = [MEMORY[0x1E4F61740] sharedInstance];
  BOOL v3 = [v2 deviceType] == 2;

  return v3;
}

- (BOOL)isCallAnnouncementAvailableForPhone
{
  if (![(TUConfigurationProvider *)self isSIMAvailable]) {
    return 0;
  }
  BOOL v2 = [MEMORY[0x1E4F61740] sharedInstance];
  BOOL v3 = [v2 deviceType] == 2;

  return v3;
}

- (BOOL)isShareNameAndPhotosAvailable
{
  if ([(TUConfigurationProvider *)self isSIMAvailable]) {
    return 1;
  }

  return [(TUConfigurationProvider *)self isFaceTimeEnabledInSettings];
}

- (BOOL)isRespondwithTextAvailable
{
  if (![(TUConfigurationProvider *)self isSIMAvailable]) {
    return 0;
  }
  BOOL v2 = [MEMORY[0x1E4F61740] sharedInstance];
  BOOL v3 = [v2 deviceType] == 2;

  return v3;
}

- (BOOL)isBlockedContactsAvailable
{
  if (![(TUConfigurationProvider *)self isSIMAvailable]) {
    return 0;
  }
  BOOL v2 = [MEMORY[0x1E4F61740] sharedInstance];
  BOOL v3 = [v2 deviceType] == 2;

  return v3;
}

- (BOOL)isAutomaticProminenceAvailable
{
  BOOL v2 = [(TUConfigurationProvider *)self isFaceTimeEnabledInSettings];
  if (v2)
  {
    BOOL v3 = [MEMORY[0x1E4F61740] sharedInstance];
    char v4 = [v3 multiwaySupported];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (BOOL)isLivePhotosAvailable
{
  BOOL v2 = [(TUConfigurationProvider *)self isFaceTimeEnabledInSettings];
  if (v2) {
    LOBYTE(v2) = !+[TUMomentsController isFaceTimePhotosRestricted];
  }
  return v2;
}

- (BOOL)isCallIdentificationAppsAvailable
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F19188]);
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__TUConfigurationProvider_isCallIdentificationAppsAvailable__block_invoke;
  v11[3] = &unk_1E58E8078;
  long long v13 = &v14;
  uint64_t v5 = v4;
  uint64_t v12 = v5;
  [v3 extensionsWithCompletionHandler:v11];
  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    uint64_t v7 = TUDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "isCallIdentificationAppsAvailable did not return before the semaphore timeout", v10, 2u);
    }
  }
  if ([(TUConfigurationProvider *)self isSIMAvailable]) {
    BOOL v8 = *((unsigned char *)v15 + 24) != 0;
  }
  else {
    BOOL v8 = 0;
  }

  _Block_object_dispose(&v14, 8);
  return v8;
}

intptr_t __60__TUConfigurationProvider_isCallIdentificationAppsAvailable__block_invoke(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [a2 count] != 0;
  id v3 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v3);
}

- (BOOL)isLiveLookupAvailable
{
  id v3 = [(TUConfigurationProvider *)self liveLookupExtensionManager];
  uint64_t v4 = [v3 extensionCount];

  BOOL result = [(TUConfigurationProvider *)self isSIMAvailable];
  if (!v4) {
    return 0;
  }
  return result;
}

- (BOOL)isCallBlockingAndIdentificationAvailable
{
  if ([(TUConfigurationProvider *)self isBrandedCallingAvailable]
    || [(TUConfigurationProvider *)self isBusinessConnectCallingAvailable]
    || [(TUConfigurationProvider *)self isSilenceJunkCallingEnabled]
    || [(TUConfigurationProvider *)self isCallIdentificationAppsAvailable])
  {
    return 1;
  }

  return [(TUConfigurationProvider *)self isLiveLookupAvailable];
}

- (BOOL)isFaceTimeEnabledInSettings
{
  id v2 = objc_alloc(MEMORY[0x1E4F6ABA8]);
  id v3 = (void *)[v2 initWithQueue:MEMORY[0x1E4F14428]];
  char v4 = [v3 isFaceTimeEnabled];

  return v4;
}

- (BOOL)isCallRecordingAvailable
{
  int v2 = [(TUConfigurationProvider *)self isSIMAvailable];
  if (v2)
  {
    LOBYTE(v2) = TUCallRecordingActivatable(0);
  }
  return v2;
}

- (BOOL)isCallScreeningAvailable
{
  if (![(TUConfigurationProvider *)self isSIMAvailable]) {
    return 0;
  }
  int v2 = [MEMORY[0x1E4F61740] sharedInstance];
  BOOL v3 = [v2 deviceType] == 2 && TUCallScreeningActivatable(0, 0);

  return v3;
}

- (BOOL)isCallScreeningEnabled
{
  BOOL v3 = [(TUConfigurationProvider *)self isCallScreeningAvailable];
  if (v3)
  {
    char v4 = [(TUConfigurationProvider *)self userConfiguration];
    char v5 = [v4 isCallScreeningEnabled];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)setCallScreeningEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(TUConfigurationProvider *)self isCallScreeningAvailable])
  {
    char v5 = [(TUConfigurationProvider *)self userConfiguration];
    [v5 setCallScreeningEnabled:v3];

    [(TUConfigurationProvider *)self postConfigurationChangedNotification];
  }
}

- (BOOL)isSilenceUnknownCallersEnabledForFaceTime
{
  int v2 = [(TUConfigurationProvider *)self userConfiguration];
  char v3 = [v2 isSilenceUnknownCallersEnabledForFaceTime];

  return v3;
}

- (BOOL)isSilenceUnknownCallersEnabledForPhone
{
  int v2 = [(TUConfigurationProvider *)self userConfiguration];
  char v3 = [v2 isSilenceUnknownCallersEnabledForPhone];

  return v3;
}

- (void)setSilenceUnknownCallersEnabledForFaceTime:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(TUConfigurationProvider *)self userConfiguration];
  [v5 setSilenceUnknownCallersEnabledForFaceTime:v3];

  [(TUConfigurationProvider *)self postConfigurationChangedNotification];
}

- (void)setSilenceUnknownCallersEnabledForPhone:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(TUConfigurationProvider *)self userConfiguration];
  [v5 setSilenceUnknownCallersEnabledForPhone:v3];

  [(TUConfigurationProvider *)self postConfigurationChangedNotification];
}

- (BOOL)isBrandedCallingAvailable
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v3 = [(TUConfigurationProvider *)self carrierBundleController];
  char v4 = [v3 activeSubscriptions];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([(TUConfigurationProvider *)self supportsBrandedCallingForSubscriptionContext:*(void *)(*((void *)&v13 + 1) + 8 * i)])
        {
          v9 = [MEMORY[0x1E4F61740] sharedInstance];
          uint64_t v10 = [v9 deviceType];

          if (v10 == 2)
          {
            BOOL v11 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_12:

  return v11;
}

- (BOOL)isBrandedCallingEnabled:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  if (a3) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2;
  }
  long long v17 = 0uLL;
  long long v18 = 0uLL;
  uint64_t v5 = [(TUConfigurationProvider *)self carrierBundleController];
  uint64_t v6 = [v5 activeSubscriptions];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (-[TUConfigurationProvider supportsBrandedCallingForSubscriptionContext:](self, "supportsBrandedCallingForSubscriptionContext:", v11)&& [v11 slotID] == v4)
        {
          long long v13 = [(TUConfigurationProvider *)self userConfiguration];
          char v12 = [v13 isBrandedCallingEnabled:v11];

          goto LABEL_15;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  char v12 = 0;
LABEL_15:

  return v12;
}

- (void)setBrandedCallingEnabled:(BOOL)a3 primary:(BOOL)a4
{
  BOOL v4 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  if (a4) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  long long v17 = 0uLL;
  long long v18 = 0uLL;
  uint64_t v7 = [(TUConfigurationProvider *)self carrierBundleController];
  uint64_t v8 = [v7 activeSubscriptions];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (-[TUConfigurationProvider supportsBrandedCallingForSubscriptionContext:](self, "supportsBrandedCallingForSubscriptionContext:", v13)&& [v13 slotID] == v6)
        {
          long long v14 = [(TUConfigurationProvider *)self userConfiguration];
          [v14 setBrandedCallingEnabled:v4 subscription:v13];

          [(TUConfigurationProvider *)self postConfigurationChangedNotification];
          goto LABEL_15;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_15:
}

- (BOOL)isBusinessConnectCallingAvailable
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v3 = [(TUConfigurationProvider *)self carrierBundleController];
  BOOL v4 = [v3 activeSubscriptions];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([(TUConfigurationProvider *)self supportsBusinessConnectCallingForSubscriptionContext:*(void *)(*((void *)&v13 + 1) + 8 * i)])
        {
          uint64_t v9 = [MEMORY[0x1E4F61740] sharedInstance];
          uint64_t v10 = [v9 deviceType];

          if (v10 == 2)
          {
            BOOL v11 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_12:

  return v11;
}

- (BOOL)isBusinessConnectCallingEnabled
{
  BOOL v3 = [(TUConfigurationProvider *)self isBusinessConnectCallingAvailable];
  if (v3)
  {
    BOOL v4 = [(TUConfigurationProvider *)self userConfiguration];
    char v5 = [v4 isBusinessConnectCallingEnabled];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)setBusinessConnectCallingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(TUConfigurationProvider *)self isBusinessConnectCallingAvailable])
  {
    char v5 = [(TUConfigurationProvider *)self userConfiguration];
    [v5 setBusinessConnectCallingEnabled:v3];

    [(TUConfigurationProvider *)self postConfigurationChangedNotification];
  }
}

- (BOOL)isSilenceJunkCallingAvailable
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v3 = [(TUConfigurationProvider *)self carrierBundleController];
  BOOL v4 = [v3 activeSubscriptions];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([(TUConfigurationProvider *)self supportsCallBlockingForSubscriptionContext:*(void *)(*((void *)&v11 + 1) + 8 * i)])
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)isSilenceJunkCallingEnabled
{
  BOOL v3 = [(TUConfigurationProvider *)self isSilenceJunkCallingAvailable];
  if (v3)
  {
    BOOL v4 = [(TUConfigurationProvider *)self userConfiguration];
    char v5 = [v4 isSilenceJunkCallingEnabled];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)setSilenceJunkCallingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(TUConfigurationProvider *)self isSilenceJunkCallingAvailable])
  {
    char v5 = [(TUConfigurationProvider *)self userConfiguration];
    [v5 setSilenceJunkCallingEnabled:v3];

    [(TUConfigurationProvider *)self postConfigurationChangedNotification];
  }
}

- (BOOL)supportsBrandedCallingForSubscriptionContext:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v15 = 0;
  coreTelephonyClient = self->_coreTelephonyClient;
  uint64_t v6 = *MEMORY[0x1E4F23B70];
  id v14 = 0;
  uint64_t v7 = [(CoreTelephonyClient *)coreTelephonyClient context:v4 canSetCapability:v6 allowed:&v15 with:&v14];
  id v8 = v14;
  BOOL v9 = TUDefaultLog();
  uint64_t v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[TUConfigurationProvider supportsBrandedCallingForSubscriptionContext:]();
    }

    BOOL v11 = 0;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      long long v12 = @"Yes";
      if (!v15) {
        long long v12 = @"No";
      }
      *(_DWORD *)buf = 138412546;
      id v17 = v4;
      __int16 v18 = 2112;
      char v19 = v12;
      _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "kCTCapabilityBrandedCallingInfo fetched for context: %@, capability enabled: %@", buf, 0x16u);
    }

    BOOL v11 = v15 != 0;
  }

  return v11;
}

- (id)systemCapabilitiesForSubscriptionContext:(id)a3
{
  id v4 = a3;
  char v5 = [(TUConfigurationProvider *)self coreTelephonyClient];
  id v11 = 0;
  uint64_t v6 = [v5 context:v4 getSystemCapabilities:&v11];
  id v7 = v11;

  if (!v6)
  {
    id v8 = [v7 domain];

    if (v8)
    {
      BOOL v9 = TUDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[TUConfigurationProvider systemCapabilitiesForSubscriptionContext:]();
      }
    }
  }

  return v6;
}

- (BOOL)supportsBusinessConnectCallingForSubscriptionContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v12 = 0;
  char v5 = [(TUConfigurationProvider *)self stringForKeyHierarchy:&unk_1EED246A8 subscriptionContext:v4 error:&v12];
  id v6 = v12;
  id v7 = v6;
  if (v5)
  {
    id v8 = TUDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v5;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Retrieved verstat feature capability value '%@' for subscription %@", buf, 0x16u);
    }

    int v9 = [v5 isEqualToIgnoringCase:@"Disabled"] ^ 1;
  }
  else
  {
    if (v6)
    {
      uint64_t v10 = TUDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v14 = v4;
        __int16 v15 = 2112;
        id v16 = v7;
        _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "Retrieving verstat feature capability value for subscription %@ failed with error %@", buf, 0x16u);
      }
    }
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)supportsCallBlockingForSubscriptionContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v12 = 0;
  char v5 = [(TUConfigurationProvider *)self stringForKeyHierarchy:&unk_1EED246C0 subscriptionContext:v4 error:&v12];
  id v6 = v12;
  id v7 = v6;
  if (v5)
  {
    id v8 = TUDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v5;
      __int16 v15 = 2112;
      id v16 = v4;
      int v9 = "Retrieved call blocking value '%@' for subscription %@";
LABEL_7:
      _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0x16u);
    }
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    id v8 = TUDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v4;
      __int16 v15 = 2112;
      id v16 = v7;
      int v9 = "Retrieving call blocking value for subscription %@ failed with error %@";
      goto LABEL_7;
    }
  }

LABEL_9:
  if ([v5 isEqualToIgnoringCase:@"Enabled"]) {
    char v10 = 1;
  }
  else {
    char v10 = [v5 isEqualToIgnoringCase:@"Dynamic"];
  }

  return v10;
}

- (BOOL)supportsDialAssistForSubscriptionContext:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v12 = 0;
  id v4 = [(TUConfigurationProvider *)self objectForKeyHierarchy:&unk_1EED246D8 subscriptionContext:a3 error:&v12];
  id v5 = v12;
  if (v5)
  {
    id v6 = TUDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = objc_opt_class();
      id v10 = v9;
      id v11 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      id v14 = v9;
      __int16 v15 = 2112;
      id v16 = v11;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_error_impl(&dword_19C496000, v6, OS_LOG_TYPE_ERROR, "-[%@ %@] failed with error %@.", buf, 0x20u);
    }
  }
  else
  {
    if (!v4)
    {
      char v7 = 1;
      goto LABEL_6;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v7 = [v4 BOOLValue];
      goto LABEL_6;
    }
  }
  char v7 = 0;
LABEL_6:

  return v7;
}

- (id)objectForKeyHierarchy:(id)a3 subscriptionContext:(id)a4 error:(id *)a5
{
  id v8 = (objc_class *)MEMORY[0x1E4F23938];
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[[v8 alloc] initWithBundleType:1];
  id v12 = [(TUConfigurationProvider *)self carrierBundleController];
  long long v13 = [v12 telephonyClient];
  id v14 = (void *)[v13 copyCarrierBundleValue:v9 keyHierarchy:v10 bundleType:v11 error:a5];

  return v14;
}

- (id)stringForKeyHierarchy:(id)a3 subscriptionContext:(id)a4 error:(id *)a5
{
  id v5 = [(TUConfigurationProvider *)self objectForKeyHierarchy:a3 subscriptionContext:a4 error:a5];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)supportsSystemCapabilityWithName:(id)a3 subscriptionContext:(id)a4
{
  id v6 = a3;
  char v7 = [(TUConfigurationProvider *)self systemCapabilitiesForSubscriptionContext:a4];
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 objectForKeyedSubscript:v6];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v10 = [v9 BOOLValue];
    }
    else {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)isSystemCapabilityAvailableForName:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(TUConfigurationProvider *)self carrierBundleController];
  id v6 = [v5 activeSubscriptions];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (([v11 isSimHidden] & 1) == 0
          && [(TUConfigurationProvider *)self supportsSystemCapabilityWithName:v4 subscriptionContext:v11])
        {
          BOOL v12 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_12:

  return v12;
}

- (void)postConfigurationChangedNotification
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "%@ postConfigurationChangedNotification", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [(TUConfigurationProvider *)self configurationProviderNotifier];
  [v5 postConfigurationChanged];
}

- (TUConfigurationProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TUConfigurationProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TUUserConfiguration)userConfiguration
{
  return self->_userConfiguration;
}

- (TUConfigurationProviderNotifier)configurationProviderNotifier
{
  return self->_configurationProviderNotifier;
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (LiveLookupManagerProxy)liveLookupExtensionManager
{
  return self->_liveLookupExtensionManager;
}

- (int)token
{
  return self->_token;
}

- (TUCarrierBundleControllerProtocol)carrierBundleController
{
  return self->_carrierBundleController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierBundleController, 0);
  objc_storeStrong((id *)&self->_liveLookupExtensionManager, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_configurationProviderNotifier, 0);
  objc_storeStrong((id *)&self->_userConfiguration, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)supportsBrandedCallingForSubscriptionContext:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_19C496000, v0, v1, "Failed to fetch kCTCapabilityBrandedCallingInfo for context:%@ , error: %@");
}

- (void)systemCapabilitiesForSubscriptionContext:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_19C496000, v0, v1, "Retrieving system capability information failed with error %@ for %@.");
}

@end