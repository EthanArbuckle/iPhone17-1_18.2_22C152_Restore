@interface TUCoreTelephonyClient
+ (Class)RTTSettingsClass;
+ (Class)RTTTelephonyUtilitiesClass;
+ (id)sharedRTTTelephonyUtilities;
- (BOOL)inEmergencyMode;
- (BOOL)isDialAssistSupportedForSubscriptionLabelIdentifier:(id)a3 error:(id *)a4;
- (BOOL)isEmergencyNumberForDigits:(id)a3 subscription:(id)a4 error:(id *)a5;
- (BOOL)isEmergencyNumberForDigits:(id)a3 subscriptionUUID:(id)a4 error:(id *)a5;
- (BOOL)isRTTSupportedForSubscription:(id)a3;
- (BOOL)isRTTSupportedForSubscriptionUUID:(id)a3;
- (BOOL)isTTYEnabledForSubscription:(id)a3;
- (BOOL)isTTYEnabledForSubscriptionUUID:(id)a3;
- (BOOL)isTTYHardwareAvailableForSubscription:(id)a3;
- (BOOL)isTTYHardwareAvailableForSubscriptionUUID:(id)a3;
- (BOOL)isTTYHardwareEnabledForSubscription:(id)a3;
- (BOOL)isTTYHardwareEnabledForSubscriptionUUID:(id)a3;
- (BOOL)isTTYHardwareSupportedForSubscription:(id)a3;
- (BOOL)isTTYHardwareSupportedForSubscriptionUUID:(id)a3;
- (BOOL)isTTYSoftwareAvailableForSubscription:(id)a3;
- (BOOL)isTTYSoftwareAvailableForSubscriptionUUID:(id)a3;
- (BOOL)isTTYSoftwareEnabledForSubscription:(id)a3;
- (BOOL)isTTYSoftwareEnabledForSubscriptionUUID:(id)a3;
- (BOOL)isTTYSoftwareSupportedForSubscription:(id)a3;
- (BOOL)isTTYSoftwareSupportedForSubscriptionUUID:(id)a3;
- (BOOL)isTTYSupportedForSubscription:(id)a3;
- (BOOL)isTTYSupportedForSubscriptionUUID:(id)a3;
- (BOOL)isWhitelistedEmergencyNumberForDigits:(id)a3 subscription:(id)a4 error:(id *)a5;
- (BOOL)isWhitelistedEmergencyNumberForDigits:(id)a3 subscriptionUUID:(id)a4 error:(id *)a5;
- (BOOL)shouldShowEmergencyCallbackModeAlertForSubscription:(id)a3 error:(id *)a4;
- (BOOL)shouldShowEmergencyCallbackModeAlertForSubscriptionUUID:(id)a3 error:(id *)a4;
- (CoreTelephonyClient)client;
- (OS_dispatch_queue)queue;
- (TUCoreTelephonyClient)init;
- (TUCoreTelephonyClient)initWithQueue:(id)a3;
- (id)objectForKey:(id)a3 subscriptionLabelIdentifier:(id)a4 error:(id *)a5;
- (id)subscriptionForLabelIdentifier:(id)a3;
- (id)subscriptionForUUID:(id)a3;
- (id)testEmergencyHandleForSubscriptionLabelIdentifier:(id)a3 error:(id *)a4;
- (unint64_t)preferredTransportMethodForSubscription:(id)a3;
@end

@implementation TUCoreTelephonyClient

+ (Class)RTTSettingsClass
{
  if (RTTSettingsClass_onceToken != -1) {
    dispatch_once(&RTTSettingsClass_onceToken, &__block_literal_global_25);
  }
  v2 = (void *)RTTSettingsClass_sRTTSettingsClass;

  return (Class)v2;
}

void __46__TUCoreTelephonyClient_TTY__RTTSettingsClass__block_invoke()
{
  RTTSettingsClass_sRTTSettingsClass = CUTWeakLinkClass();
  if (!RTTSettingsClass_sRTTSettingsClass)
  {
    v0 = TUDefaultLog();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_19C496000, v0, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find class RTTSettings; RTTUtilities.framework may have failed to link.",
        v1,
        2u);
    }
  }
}

+ (Class)RTTTelephonyUtilitiesClass
{
  if (RTTTelephonyUtilitiesClass_onceToken != -1) {
    dispatch_once(&RTTTelephonyUtilitiesClass_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)RTTTelephonyUtilitiesClass_sRTTTelephonyUtilitiesClass;

  return (Class)v2;
}

void __56__TUCoreTelephonyClient_TTY__RTTTelephonyUtilitiesClass__block_invoke()
{
  RTTTelephonyUtilitiesClass_sRTTTelephonyUtilitiesClass = CUTWeakLinkClass();
  if (!RTTTelephonyUtilitiesClass_sRTTTelephonyUtilitiesClass)
  {
    v0 = TUDefaultLog();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_19C496000, v0, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find class RTTTelephonyUtilities; RTTUtilities.framework may have failed to link.",
        v1,
        2u);
    }
  }
}

+ (id)sharedRTTTelephonyUtilities
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__TUCoreTelephonyClient_TTY__sharedRTTTelephonyUtilities__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedRTTTelephonyUtilities_onceToken != -1) {
    dispatch_once(&sharedRTTTelephonyUtilities_onceToken, block);
  }
  v2 = (void *)sharedRTTTelephonyUtilities_sRTTTelephonyUtilities;

  return v2;
}

uint64_t __57__TUCoreTelephonyClient_TTY__sharedRTTTelephonyUtilities__block_invoke(uint64_t a1)
{
  sharedRTTTelephonyUtilities_sRTTTelephonyUtilities = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "RTTTelephonyUtilitiesClass"), "sharedUtilityProvider");

  return MEMORY[0x1F41817F8]();
}

- (BOOL)isRTTSupportedForSubscription:(id)a3
{
  id v3 = a3;
  v4 = (void *)[(id)objc_opt_class() RTTTelephonyUtilitiesClass];
  if (v3) {
    char v5 = [v4 isRTTSupportedForContext:v3];
  }
  else {
    char v5 = [v4 isRTTSupported];
  }
  BOOL v6 = v5;

  return v6;
}

- (BOOL)isRTTSupportedForSubscriptionUUID:(id)a3
{
  id v3 = self;
  v4 = [(TUCoreTelephonyClient *)self subscriptionForUUID:a3];
  LOBYTE(v3) = [(TUCoreTelephonyClient *)v3 isRTTSupportedForSubscription:v4];

  return (char)v3;
}

- (BOOL)isTTYEnabledForSubscription:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUCoreTelephonyClient *)self isTTYSoftwareEnabledForSubscription:v4]
    || [(TUCoreTelephonyClient *)self isTTYHardwareEnabledForSubscription:v4];

  return v5;
}

- (BOOL)isTTYEnabledForSubscriptionUUID:(id)a3
{
  id v3 = self;
  id v4 = [(TUCoreTelephonyClient *)self subscriptionForUUID:a3];
  LOBYTE(v3) = [(TUCoreTelephonyClient *)v3 isTTYEnabledForSubscription:v4];

  return (char)v3;
}

- (BOOL)isTTYSupportedForSubscription:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[(id)objc_opt_class() RTTTelephonyUtilitiesClass];
  if (v3) {
    char v5 = [v4 isTTYSupportedForContext:v3];
  }
  else {
    char v5 = [v4 isTTYSupported];
  }
  BOOL v6 = v5;

  return v6;
}

- (BOOL)isTTYSupportedForSubscriptionUUID:(id)a3
{
  id v3 = self;
  id v4 = [(TUCoreTelephonyClient *)self subscriptionForUUID:a3];
  LOBYTE(v3) = [(TUCoreTelephonyClient *)v3 isTTYSupportedForSubscription:v4];

  return (char)v3;
}

- (BOOL)isTTYHardwareAvailableForSubscription:(id)a3
{
  return [(TUCoreTelephonyClient *)self preferredTransportMethodForSubscription:a3] == 1;
}

- (BOOL)isTTYHardwareAvailableForSubscriptionUUID:(id)a3
{
  id v3 = self;
  id v4 = [(TUCoreTelephonyClient *)self subscriptionForUUID:a3];
  LOBYTE(v3) = [(TUCoreTelephonyClient *)v3 isTTYHardwareAvailableForSubscription:v4];

  return (char)v3;
}

- (BOOL)isTTYHardwareEnabledForSubscription:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "RTTSettingsClass"), "sharedInstance");
  char v5 = v4;
  if (v3) {
    char v6 = [v4 TTYHardwareEnabledForContext:v3];
  }
  else {
    char v6 = [v4 TTYHardwareEnabled];
  }
  BOOL v7 = v6;

  return v7;
}

- (BOOL)isTTYHardwareEnabledForSubscriptionUUID:(id)a3
{
  id v3 = self;
  id v4 = [(TUCoreTelephonyClient *)self subscriptionForUUID:a3];
  LOBYTE(v3) = [(TUCoreTelephonyClient *)v3 isTTYHardwareEnabledForSubscription:v4];

  return (char)v3;
}

- (BOOL)isTTYHardwareSupportedForSubscription:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[(id)objc_opt_class() RTTTelephonyUtilitiesClass];
  if (v3) {
    char v5 = [v4 hardwareTTYIsSupportedForContext:v3];
  }
  else {
    char v5 = [v4 hardwareTTYIsSupported];
  }
  BOOL v6 = v5;

  return v6;
}

- (BOOL)isTTYHardwareSupportedForSubscriptionUUID:(id)a3
{
  id v3 = self;
  id v4 = [(TUCoreTelephonyClient *)self subscriptionForUUID:a3];
  LOBYTE(v3) = [(TUCoreTelephonyClient *)v3 isTTYHardwareSupportedForSubscription:v4];

  return (char)v3;
}

- (BOOL)isTTYSoftwareAvailableForSubscription:(id)a3
{
  return [(TUCoreTelephonyClient *)self preferredTransportMethodForSubscription:a3] == 2;
}

- (BOOL)isTTYSoftwareAvailableForSubscriptionUUID:(id)a3
{
  id v3 = self;
  id v4 = [(TUCoreTelephonyClient *)self subscriptionForUUID:a3];
  LOBYTE(v3) = [(TUCoreTelephonyClient *)v3 isTTYSoftwareAvailableForSubscription:v4];

  return (char)v3;
}

- (BOOL)isTTYSoftwareEnabledForSubscription:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "RTTSettingsClass"), "sharedInstance");
  char v5 = v4;
  if (v3) {
    char v6 = [v4 TTYSoftwareEnabledForContext:v3];
  }
  else {
    char v6 = [v4 TTYSoftwareEnabled];
  }
  BOOL v7 = v6;

  return v7;
}

- (BOOL)isTTYSoftwareEnabledForSubscriptionUUID:(id)a3
{
  id v3 = self;
  id v4 = [(TUCoreTelephonyClient *)self subscriptionForUUID:a3];
  LOBYTE(v3) = [(TUCoreTelephonyClient *)v3 isTTYSoftwareEnabledForSubscription:v4];

  return (char)v3;
}

- (BOOL)isTTYSoftwareSupportedForSubscription:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[(id)objc_opt_class() RTTTelephonyUtilitiesClass];
  if (v3) {
    char v5 = [v4 softwareTTYIsSupportedForContext:v3];
  }
  else {
    char v5 = [v4 softwareTTYIsSupported];
  }
  BOOL v6 = v5;

  return v6;
}

- (BOOL)isTTYSoftwareSupportedForSubscriptionUUID:(id)a3
{
  id v3 = self;
  id v4 = [(TUCoreTelephonyClient *)self subscriptionForUUID:a3];
  LOBYTE(v3) = [(TUCoreTelephonyClient *)v3 isTTYSoftwareSupportedForSubscription:v4];

  return (char)v3;
}

- (unint64_t)preferredTransportMethodForSubscription:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() sharedRTTTelephonyUtilities];
  char v5 = v4;
  if (v3) {
    uint64_t v6 = [v4 currentPreferredTransportMethodForContext:v3];
  }
  else {
    uint64_t v6 = [v4 currentPreferredTransportMethod];
  }
  unint64_t v7 = v6;

  return v7;
}

- (TUCoreTelephonyClient)init
{
  return 0;
}

- (TUCoreTelephonyClient)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUCoreTelephonyClient;
  uint64_t v6 = [(TUCoreTelephonyClient *)&v11 init];
  unint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F23A80]) initWithQueue:v5];
    client = v7->_client;
    v7->_client = (CoreTelephonyClient *)v8;
  }
  return v7;
}

- (id)subscriptionForLabelIdentifier:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TUCoreTelephonyClient *)self client];
  id v24 = 0;
  uint64_t v6 = [v5 getActiveContexts:&v24];
  id v7 = v24;
  uint64_t v8 = [v6 subscriptions];

  if (v8)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
LABEL_4:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v20 + 1) + 8 * v13);
        v15 = objc_msgSend(v14, "labelID", (void)v20);
        char v16 = [v15 isEqualToString:v4];

        if (v16) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
          if (v11) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      v17 = [v14 context];

      if (v17) {
        goto LABEL_19;
      }
    }
    else
    {
LABEL_10:
    }
    v18 = TUDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[TUCoreTelephonyClient subscriptionForLabelIdentifier:]((uint64_t)v4, v18);
    }
    goto LABEL_17;
  }
  if (v7)
  {
    v18 = TUDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[TUCoreTelephonyClient subscriptionForLabelIdentifier:](self);
    }
LABEL_17:
  }
  v17 = 0;
LABEL_19:

  return v17;
}

- (id)subscriptionForUUID:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TUCoreTelephonyClient *)self client];
  id v24 = 0;
  uint64_t v6 = [v5 getActiveContexts:&v24];
  id v7 = v24;
  uint64_t v8 = [v6 subscriptions];

  if (v8)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
LABEL_4:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v20 + 1) + 8 * v13);
        v15 = objc_msgSend(v14, "uuid", (void)v20);
        char v16 = [v15 isEqual:v4];

        if (v16) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
          if (v11) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      v17 = [v14 context];

      if (v17) {
        goto LABEL_19;
      }
    }
    else
    {
LABEL_10:
    }
    v18 = TUDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[TUCoreTelephonyClient subscriptionForUUID:]((uint64_t)v4, v18);
    }
    goto LABEL_17;
  }
  if (v7)
  {
    v18 = TUDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[TUCoreTelephonyClient subscriptionForLabelIdentifier:](self);
    }
LABEL_17:
  }
  v17 = 0;
LABEL_19:

  return v17;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)isDialAssistSupportedForSubscriptionLabelIdentifier:(id)a3 error:(id *)a4
{
  id v4 = [(TUCoreTelephonyClient *)self objectForKey:@"ShowDialAssist" subscriptionLabelIdentifier:a3 error:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    char v5 = [v4 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)testEmergencyHandleForSubscriptionLabelIdentifier:(id)a3 error:(id *)a4
{
  id v4 = [(TUCoreTelephonyClient *)self objectForKey:@"TestEmergencyNumber" subscriptionLabelIdentifier:a3 error:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v5 = +[TUHandle normalizedPhoneNumberHandleForValue:v4 isoCountryCode:0];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)objectForKey:(id)a3 subscriptionLabelIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(TUCoreTelephonyClient *)self subscriptionForLabelIdentifier:a4];
  if (v9)
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F23938]) initWithBundleType:1];
    uint64_t v11 = [(TUCoreTelephonyClient *)self client];
    uint64_t v12 = (void *)[v11 copyCarrierBundleValue:v9 key:v8 bundleType:v10 error:a5];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (BOOL)inEmergencyMode
{
  v2 = [(TUCoreTelephonyClient *)self client];
  id v3 = (void *)[v2 copyEmergencyModeWithError:0];

  if (v3)
  {
    id v4 = [v3 mode];

    if (v4)
    {
      char v5 = [v3 mode];
      LOBYTE(v4) = [v5 enabled];
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return (char)v4;
}

- (BOOL)isEmergencyNumberForDigits:(id)a3 subscriptionUUID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  if (a4)
  {
    a4 = [(TUCoreTelephonyClient *)self subscriptionForUUID:a4];
  }
  BOOL v9 = [(TUCoreTelephonyClient *)self isEmergencyNumberForDigits:v8 subscription:a4 error:a5];

  return v9;
}

- (BOOL)isEmergencyNumberForDigits:(id)a3 subscription:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(TUCoreTelephonyClient *)self client];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    uint64_t v12 = [(TUCoreTelephonyClient *)self client];
    char v13 = [v12 isEmergencyNumberWithWhitelistIncluded:v9 number:v8 error:a5];
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)isWhitelistedEmergencyNumberForDigits:(id)a3 subscriptionUUID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  if (a4)
  {
    a4 = [(TUCoreTelephonyClient *)self subscriptionForUUID:a4];
  }
  BOOL v9 = [(TUCoreTelephonyClient *)self isWhitelistedEmergencyNumberForDigits:v8 subscription:a4 error:a5];

  return v9;
}

- (BOOL)isWhitelistedEmergencyNumberForDigits:(id)a3 subscription:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(TUCoreTelephonyClient *)self client];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    uint64_t v12 = [(TUCoreTelephonyClient *)self client];
    char v13 = [v12 isEmergencyNumberWithWhitelistIncluded:v9 number:v8 error:a5];
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)shouldShowEmergencyCallbackModeAlertForSubscriptionUUID:(id)a3 error:(id *)a4
{
  if (a3)
  {
    uint64_t v6 = -[TUCoreTelephonyClient subscriptionForUUID:](self, "subscriptionForUUID:");
  }
  else
  {
    uint64_t v6 = 0;
  }
  BOOL v7 = [(TUCoreTelephonyClient *)self shouldShowEmergencyCallbackModeAlertForSubscription:v6 error:a4];

  return v7;
}

- (BOOL)shouldShowEmergencyCallbackModeAlertForSubscription:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(TUCoreTelephonyClient *)self client];
  LOBYTE(a4) = [v7 shouldShowUserWarningWhenDialingCallOnContext:v6 error:a4];

  return (char)a4;
}

- (void)subscriptionForLabelIdentifier:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 client];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_19C496000, v2, v3, "Retrieving active contexts from client %@ failed with error %@", v4, v5, v6, v7, v8);
}

- (void)subscriptionForLabelIdentifier:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C496000, a2, OS_LOG_TYPE_ERROR, "Could not find subscription context for the specified label identifier: %@", (uint8_t *)&v2, 0xCu);
}

- (void)subscriptionForUUID:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C496000, a2, OS_LOG_TYPE_ERROR, "Could not find subscription context for the specified UUID: %@", (uint8_t *)&v2, 0xCu);
}

@end